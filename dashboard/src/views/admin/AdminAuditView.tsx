import { useQuery } from '@tanstack/react-query'
import { supabase } from '@/lib/supabase'
import type { AdminAuditLog } from '@/types/admin'

export function AdminAuditView() {
  const { data: logs, isLoading } = useQuery({
    queryKey: ['admin-audit-log'],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('admin_effix_audit_log')
        .select('*')
        .order('created_at', { ascending: false })
        .limit(200)
      if (error) throw error
      return (data ?? []) as AdminAuditLog[]
    },
  })

  return (
    <div className="space-y-5">
      <header>
        <h1 className="text-2xl font-semibold text-[#0E2A47]">Auditoría</h1>
        <p className="text-sm text-slate-600 mt-0.5">
          Últimas 200 acciones del equipo. Append-only.
        </p>
      </header>

      <div className="rounded-xl border border-slate-200 bg-white overflow-x-auto">
        <table className="w-full text-sm">
          <thead className="bg-slate-50 text-xs uppercase tracking-wide text-slate-500">
            <tr>
              <th className="text-left px-4 py-2.5">Fecha</th>
              <th className="text-left px-4 py-2.5">Usuario</th>
              <th className="text-left px-4 py-2.5">Acción</th>
              <th className="text-left px-4 py-2.5">Entidad</th>
              <th className="text-left px-4 py-2.5">Detalles</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-slate-100">
            {isLoading && (
              <tr>
                <td colSpan={5} className="px-4 py-8 text-center text-slate-500">
                  Cargando...
                </td>
              </tr>
            )}
            {!isLoading && (logs?.length ?? 0) === 0 && (
              <tr>
                <td colSpan={5} className="px-4 py-8 text-center text-slate-500">
                  Aún no hay registros de auditoría.
                </td>
              </tr>
            )}
            {(logs ?? []).map(l => (
              <tr key={l.id} className="hover:bg-slate-50 transition-colors">
                <td className="px-4 py-3 text-slate-600 text-xs whitespace-nowrap">
                  {new Date(l.created_at).toLocaleString('es-CR', {
                    dateStyle: 'short',
                    timeStyle: 'medium',
                  })}
                </td>
                <td className="px-4 py-3 text-xs">{l.user_email ?? '—'}</td>
                <td className="px-4 py-3">
                  <span className="inline-block rounded bg-slate-100 px-2 py-0.5 text-xs font-mono">
                    {l.action}
                  </span>
                </td>
                <td className="px-4 py-3 text-xs text-slate-600">
                  {l.entity_type && (
                    <>
                      {l.entity_type}
                      {l.entity_id && (
                        <span className="text-slate-400"> · {l.entity_id.slice(0, 8)}</span>
                      )}
                    </>
                  )}
                </td>
                <td className="px-4 py-3 text-xs text-slate-500">
                  {l.changes ? (
                    <code className="bg-slate-100 rounded px-2 py-0.5 text-xs">
                      {JSON.stringify(l.changes).slice(0, 80)}
                    </code>
                  ) : (
                    '—'
                  )}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  )
}
