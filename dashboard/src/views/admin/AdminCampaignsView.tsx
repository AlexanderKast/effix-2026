import { useQuery } from '@tanstack/react-query'
import { supabase } from '@/lib/supabase'
import type { AdminCampaign } from '@/types/admin'

export function AdminCampaignsView() {
  const { data: campaigns, isLoading } = useQuery({
    queryKey: ['admin-campaigns'],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('admin_effix_campaigns')
        .select('*')
        .order('updated_at', { ascending: false })
        .limit(200)
      if (error) throw error
      return (data ?? []) as AdminCampaign[]
    },
  })

  return (
    <div className="space-y-5">
      <header>
        <h1 className="text-2xl font-semibold text-[#0E2A47]">Campañas</h1>
        <p className="text-sm text-slate-600 mt-0.5">
          Estado de campañas activas y planeadas · {campaigns?.length ?? 0} registros
        </p>
      </header>

      <div className="rounded-xl border border-slate-200 bg-white overflow-x-auto">
        <table className="w-full text-sm">
          <thead className="bg-slate-50 text-xs uppercase tracking-wide text-slate-500">
            <tr>
              <th className="text-left px-4 py-2.5">Marca · País</th>
              <th className="text-left px-4 py-2.5">Plataforma</th>
              <th className="text-left px-4 py-2.5">Nombre</th>
              <th className="text-left px-4 py-2.5">Funnel</th>
              <th className="text-left px-4 py-2.5">Status</th>
              <th className="text-right px-4 py-2.5">Budget USD/día</th>
              <th className="text-right px-4 py-2.5">Actualizado</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-slate-100">
            {isLoading && (
              <tr>
                <td colSpan={7} className="px-4 py-8 text-center text-slate-500">
                  Cargando campañas...
                </td>
              </tr>
            )}
            {!isLoading && (campaigns?.length ?? 0) === 0 && (
              <tr>
                <td colSpan={7} className="px-4 py-8 text-center text-slate-500">
                  Aún no hay campañas creadas en el admin. Ingresá la primera desde tu plataforma.
                </td>
              </tr>
            )}
            {(campaigns ?? []).map(c => (
              <tr key={c.id} className="hover:bg-slate-50 transition-colors">
                <td className="px-4 py-3 font-medium text-[#0E2A47] whitespace-nowrap">
                  {c.marca_slug} · {c.pais}
                </td>
                <td className="px-4 py-3">
                  <span className="inline-block rounded bg-slate-100 px-2 py-0.5 text-xs">
                    {c.platform}
                  </span>
                </td>
                <td className="px-4 py-3">{c.name}</td>
                <td className="px-4 py-3 text-xs">{c.funnel ?? '—'}</td>
                <td className="px-4 py-3">
                  <StatusPill status={c.status} />
                </td>
                <td className="px-4 py-3 text-right tabular-nums">
                  {c.budget_daily_usd ? `$${Number(c.budget_daily_usd).toFixed(2)}` : '—'}
                </td>
                <td className="px-4 py-3 text-right text-xs text-slate-500">
                  {new Date(c.updated_at).toLocaleDateString('es-CR')}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  )
}

function StatusPill({ status }: { status: string }) {
  const colors: Record<string, string> = {
    draft: 'bg-slate-100 text-slate-600',
    review: 'bg-amber-100 text-amber-800',
    approved: 'bg-sky-100 text-sky-700',
    live: 'bg-emerald-500 text-white',
    paused: 'bg-orange-100 text-orange-700',
    ended: 'bg-slate-200 text-slate-700',
    archived: 'bg-slate-100 text-slate-400',
  }
  return (
    <span
      className={`inline-block rounded-full px-2 py-0.5 text-xs ${
        colors[status] ?? 'bg-slate-100 text-slate-600'
      }`}
    >
      {status}
    </span>
  )
}
