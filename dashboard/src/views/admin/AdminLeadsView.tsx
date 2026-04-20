import { useMemo, useState } from 'react'
import { useQuery, useQueryClient } from '@tanstack/react-query'
import { Search, Download, ExternalLink } from 'lucide-react'
import { supabase } from '@/lib/supabase'
import { useAdminProfile } from '@/hooks/useAdminProfile'
import { brandModules } from '@/data/brand-modules'
import type { LeadStatus, AdminLead } from '@/types/admin'

const LEAD_STATUSES: LeadStatus[] = [
  'new',
  'contacted',
  'qualified',
  'demo_scheduled',
  'demo_done',
  'won',
  'lost',
  'opt_out',
  'duplicate',
]

export function AdminLeadsView() {
  const { canEdit } = useAdminProfile()
  const queryClient = useQueryClient()

  const [marcaFilter, setMarcaFilter] = useState<string>('')
  const [paisFilter, setPaisFilter] = useState<string>('')
  const [statusFilter, setStatusFilter] = useState<string>('')
  const [search, setSearch] = useState<string>('')

  const { data: leads, isLoading } = useQuery({
    queryKey: ['admin-leads', marcaFilter, paisFilter, statusFilter],
    queryFn: async () => {
      let q = supabase
        .from('admin_effix_leads')
        .select('*')
        .order('created_at', { ascending: false })
        .limit(200)

      if (marcaFilter) q = q.eq('marca_slug', marcaFilter)
      if (paisFilter) q = q.eq('pais', paisFilter)
      if (statusFilter) q = q.eq('status', statusFilter as LeadStatus)

      const { data, error } = await q
      if (error) throw error
      return (data ?? []) as AdminLead[]
    },
  })

  const filtered = useMemo(() => {
    if (!search || !leads) return leads ?? []
    const s = search.toLowerCase()
    return leads.filter(
      l =>
        l.nombre?.toLowerCase().includes(s) ||
        l.email?.toLowerCase().includes(s) ||
        l.telefono?.toLowerCase().includes(s) ||
        l.utm_campaign?.toLowerCase().includes(s)
    )
  }, [leads, search])

  async function updateStatus(id: string, status: LeadStatus) {
    const { error } = await supabase
      .from('admin_effix_leads')
      .update({ status })
      .eq('id', id)
    if (error) {
      alert('Error: ' + error.message)
      return
    }
    await queryClient.invalidateQueries({ queryKey: ['admin-leads'] })
    await queryClient.invalidateQueries({ queryKey: ['admin-overview-stats'] })
  }

  function exportCsv() {
    if (!filtered.length) return
    const header = [
      'created_at',
      'marca_slug',
      'pais',
      'funnel',
      'source',
      'nombre',
      'email',
      'telefono',
      'status',
      'utm_campaign',
    ].join(',')
    const rows = filtered.map(l =>
      [
        l.created_at,
        l.marca_slug,
        l.pais,
        l.funnel,
        l.source,
        l.nombre ?? '',
        l.email ?? '',
        l.telefono ?? '',
        l.status,
        l.utm_campaign ?? '',
      ]
        .map(v => `"${String(v).replace(/"/g, '""')}"`)
        .join(',')
    )
    const blob = new Blob([header + '\n' + rows.join('\n')], { type: 'text/csv' })
    const url = URL.createObjectURL(blob)
    const a = document.createElement('a')
    a.href = url
    a.download = `leads-${new Date().toISOString().slice(0, 10)}.csv`
    a.click()
    URL.revokeObjectURL(url)
  }

  return (
    <div className="space-y-5">
      <header className="flex flex-wrap items-center justify-between gap-3">
        <div>
          <h1 className="text-2xl font-semibold text-[#0E2A47]">Leads</h1>
          <p className="text-sm text-slate-600 mt-0.5">
            {filtered.length} de {leads?.length ?? 0} · mostrando últimos 200
          </p>
        </div>
        <button
          onClick={exportCsv}
          disabled={!filtered.length}
          className="inline-flex items-center gap-2 rounded-lg bg-white border border-slate-200 px-3 py-2 text-sm hover:bg-slate-50 disabled:opacity-50"
        >
          <Download size={14} /> Exportar CSV
        </button>
      </header>

      <div className="flex flex-wrap gap-2 items-center">
        <div className="relative flex-1 min-w-64 max-w-sm">
          <Search size={14} className="absolute left-3 top-1/2 -translate-y-1/2 text-slate-400" />
          <input
            value={search}
            onChange={e => setSearch(e.target.value)}
            placeholder="Buscar por nombre, email, UTM..."
            className="w-full rounded-lg border border-slate-200 pl-9 pr-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-[#1BC49C]"
          />
        </div>

        <select
          value={marcaFilter}
          onChange={e => setMarcaFilter(e.target.value)}
          className="rounded-lg border border-slate-200 px-3 py-2 text-sm"
        >
          <option value="">Todas las marcas</option>
          {brandModules.map(b => (
            <option key={b.slug} value={b.slug}>
              {b.name}
            </option>
          ))}
        </select>

        <select
          value={paisFilter}
          onChange={e => setPaisFilter(e.target.value)}
          className="rounded-lg border border-slate-200 px-3 py-2 text-sm"
        >
          <option value="">Todos los países</option>
          <option value="CR">Costa Rica</option>
          <option value="CO">Colombia</option>
          <option value="EC">Ecuador</option>
          <option value="RD">Rep. Dominicana</option>
          <option value="GT">Guatemala</option>
        </select>

        <select
          value={statusFilter}
          onChange={e => setStatusFilter(e.target.value)}
          className="rounded-lg border border-slate-200 px-3 py-2 text-sm"
        >
          <option value="">Todos los status</option>
          {LEAD_STATUSES.map(s => (
            <option key={s} value={s}>
              {s}
            </option>
          ))}
        </select>
      </div>

      <div className="rounded-xl border border-slate-200 bg-white overflow-x-auto">
        <table className="w-full text-sm">
          <thead className="bg-slate-50 text-xs uppercase tracking-wide text-slate-500">
            <tr>
              <th className="text-left px-4 py-2.5">Fecha</th>
              <th className="text-left px-4 py-2.5">Marca · País</th>
              <th className="text-left px-4 py-2.5">Funnel</th>
              <th className="text-left px-4 py-2.5">Source</th>
              <th className="text-left px-4 py-2.5">Nombre</th>
              <th className="text-left px-4 py-2.5">Contacto</th>
              <th className="text-left px-4 py-2.5">UTM campaign</th>
              <th className="text-left px-4 py-2.5">Status</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-slate-100">
            {isLoading && (
              <tr>
                <td colSpan={8} className="px-4 py-8 text-center text-slate-500">
                  Cargando...
                </td>
              </tr>
            )}
            {!isLoading && filtered.length === 0 && (
              <tr>
                <td colSpan={8} className="px-4 py-8 text-center text-slate-500">
                  No hay leads que coincidan con los filtros.
                </td>
              </tr>
            )}
            {filtered.map(l => (
              <tr key={l.id} className="hover:bg-slate-50 transition-colors">
                <td className="px-4 py-3 text-slate-600 whitespace-nowrap">
                  {new Date(l.created_at).toLocaleString('es-CR', {
                    dateStyle: 'short',
                    timeStyle: 'short',
                  })}
                </td>
                <td className="px-4 py-3 font-medium text-[#0E2A47] whitespace-nowrap">
                  {l.marca_slug}
                  <span className="text-slate-400"> · </span>
                  {l.pais}
                </td>
                <td className="px-4 py-3">
                  <span className="inline-block rounded-full bg-slate-100 px-2 py-0.5 text-xs">
                    {l.funnel}
                  </span>
                </td>
                <td className="px-4 py-3 text-slate-600 text-xs">{l.source}</td>
                <td className="px-4 py-3">{l.nombre ?? '—'}</td>
                <td className="px-4 py-3 text-xs">
                  {l.email && <div>{l.email}</div>}
                  {l.telefono && <div className="text-slate-500">{l.telefono}</div>}
                </td>
                <td className="px-4 py-3 text-xs text-slate-500">{l.utm_campaign ?? '—'}</td>
                <td className="px-4 py-3">
                  {canEdit('leads') ? (
                    <select
                      value={l.status}
                      onChange={e => void updateStatus(l.id, e.target.value as LeadStatus)}
                      className="rounded border border-slate-200 px-2 py-1 text-xs bg-white"
                    >
                      {LEAD_STATUSES.map(s => (
                        <option key={s} value={s}>
                          {s}
                        </option>
                      ))}
                    </select>
                  ) : (
                    <span className="text-xs">{l.status}</span>
                  )}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      <p className="text-xs text-slate-500 flex items-center gap-1">
        <ExternalLink size={12} />
        Las actualizaciones se guardan al instante. Solo `admin` y `super_admin` pueden cambiar status.
      </p>
    </div>
  )
}
