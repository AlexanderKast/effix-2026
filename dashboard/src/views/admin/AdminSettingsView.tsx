import { useState } from 'react'
import { useQuery, useQueryClient } from '@tanstack/react-query'
import { supabase } from '@/lib/supabase'
import { useAdminProfile } from '@/hooks/useAdminProfile'
import type { AdminSetting } from '@/types/admin'

export function AdminSettingsView() {
  const { isSuperAdmin } = useAdminProfile()
  const queryClient = useQueryClient()
  const [editingKey, setEditingKey] = useState<string | null>(null)
  const [editValue, setEditValue] = useState<string>('')

  const { data: settings, isLoading } = useQuery({
    queryKey: ['admin-settings'],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('admin_effix_settings')
        .select('*')
        .order('category', { ascending: true })
        .order('key', { ascending: true })
      if (error) throw error
      return (data ?? []) as AdminSetting[]
    },
  })

  async function save(key: string) {
    let parsed: unknown
    try {
      parsed = JSON.parse(editValue)
    } catch {
      alert('El valor debe ser JSON válido. Ej: "texto", 42, true, [...], {...}')
      return
    }
    const { error } = await supabase
      .from('admin_effix_settings')
      .update({ value: parsed })
      .eq('key', key)
    if (error) {
      alert('Error: ' + error.message)
      return
    }
    setEditingKey(null)
    setEditValue('')
    await queryClient.invalidateQueries({ queryKey: ['admin-settings'] })
  }

  const grouped = (settings ?? []).reduce<Record<string, AdminSetting[]>>((acc, s) => {
    const cat = s.category ?? 'otros'
    if (!acc[cat]) acc[cat] = []
    acc[cat].push(s)
    return acc
  }, {})

  return (
    <div className="space-y-5">
      <header>
        <h1 className="text-2xl font-semibold text-[#0E2A47]">Configuración</h1>
        <p className="text-sm text-slate-600 mt-0.5">
          Ajustes globales de la app · clave-valor JSONB
        </p>
      </header>

      {!isSuperAdmin && (
        <div className="rounded-xl border border-amber-200 bg-amber-50 p-4 text-sm text-amber-900">
          Solo super admins pueden editar configuración.
        </div>
      )}

      {isLoading && <p className="text-sm text-slate-500">Cargando...</p>}

      {Object.entries(grouped).map(([category, items]) => (
        <section
          key={category}
          className="rounded-xl border border-slate-200 bg-white overflow-hidden"
        >
          <header className="bg-slate-50 px-5 py-3 border-b border-slate-100">
            <h2 className="font-semibold text-[#0E2A47] capitalize">{category}</h2>
          </header>
          <table className="w-full text-sm">
            <tbody className="divide-y divide-slate-100">
              {items.map(s => (
                <tr key={s.key} className="hover:bg-slate-50 transition-colors">
                  <td className="px-5 py-3 w-64 align-top">
                    <div className="font-mono text-xs text-[#0E2A47]">{s.key}</div>
                    {s.description && (
                      <div className="text-xs text-slate-500 mt-0.5">{s.description}</div>
                    )}
                  </td>
                  <td className="px-5 py-3">
                    {editingKey === s.key ? (
                      <div className="space-y-2">
                        <textarea
                          value={editValue}
                          onChange={e => setEditValue(e.target.value)}
                          className="w-full rounded border border-slate-300 p-2 text-xs font-mono"
                          rows={3}
                        />
                        <div className="flex gap-2">
                          <button
                            onClick={() => void save(s.key)}
                            className="rounded bg-[#0E2A47] text-white px-3 py-1 text-xs"
                          >
                            Guardar
                          </button>
                          <button
                            onClick={() => {
                              setEditingKey(null)
                              setEditValue('')
                            }}
                            className="rounded bg-slate-100 text-slate-700 px-3 py-1 text-xs"
                          >
                            Cancelar
                          </button>
                        </div>
                      </div>
                    ) : (
                      <div className="flex items-start justify-between gap-3">
                        <code className="block flex-1 font-mono text-xs bg-slate-50 rounded p-2 break-all">
                          {JSON.stringify(s.value)}
                        </code>
                        {isSuperAdmin && (
                          <button
                            onClick={() => {
                              setEditingKey(s.key)
                              setEditValue(JSON.stringify(s.value, null, 2))
                            }}
                            className="text-xs text-slate-600 hover:text-[#0E2A47] underline underline-offset-2 whitespace-nowrap"
                          >
                            Editar
                          </button>
                        )}
                      </div>
                    )}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </section>
      ))}
    </div>
  )
}
