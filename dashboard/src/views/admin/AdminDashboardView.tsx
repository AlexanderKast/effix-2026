import { useQuery } from '@tanstack/react-query'
import { Inbox, Megaphone, Users, TrendingUp, type LucideIcon } from 'lucide-react'
import { supabase } from '@/lib/supabase'
import { useAuth } from '@/components/AuthProvider'

interface StatCardProps {
  label: string
  value: string | number
  hint?: string
  icon: LucideIcon
  accent?: 'navy' | 'mint' | 'sun'
}

function StatCard({ label, value, hint, icon: Icon, accent = 'navy' }: StatCardProps) {
  const colors: Record<string, string> = {
    navy: 'bg-[#0E2A47] text-white',
    mint: 'bg-[#1BC49C] text-[#0E2A47]',
    sun: 'bg-[#F5B700] text-[#0E2A47]',
  }
  return (
    <div className="rounded-xl border border-slate-200 bg-white p-5">
      <div className="flex items-start justify-between">
        <div>
          <p className="text-xs uppercase tracking-wide text-slate-500 mb-1">{label}</p>
          <p className="text-3xl font-semibold text-[#0E2A47]">{value}</p>
          {hint && <p className="text-xs text-slate-500 mt-1">{hint}</p>}
        </div>
        <div className={`w-10 h-10 rounded-lg flex items-center justify-center ${colors[accent]}`}>
          <Icon size={18} />
        </div>
      </div>
    </div>
  )
}

export function AdminDashboardView() {
  const { profile } = useAuth()

  const { data: stats, isLoading } = useQuery({
    queryKey: ['admin-overview-stats'],
    queryFn: async () => {
      const [leadsAll, leadsNew, campaignsLive, admins] = await Promise.all([
        supabase.from('admin_effix_leads').select('id', { count: 'exact', head: true }),
        supabase
          .from('admin_effix_leads')
          .select('id', { count: 'exact', head: true })
          .eq('status', 'new'),
        supabase
          .from('admin_effix_campaigns')
          .select('id', { count: 'exact', head: true })
          .eq('status', 'live'),
        supabase
          .from('admin_effix_profiles')
          .select('id', { count: 'exact', head: true })
          .eq('is_active', true),
      ])

      return {
        totalLeads: leadsAll.count ?? 0,
        newLeads: leadsNew.count ?? 0,
        liveCampaigns: campaignsLive.count ?? 0,
        activeAdmins: admins.count ?? 0,
      }
    },
  })

  const { data: recentLeads } = useQuery({
    queryKey: ['admin-overview-recent-leads'],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('admin_effix_leads')
        .select('*')
        .order('created_at', { ascending: false })
        .limit(10)
      if (error) throw error
      return data ?? []
    },
  })

  return (
    <div className="space-y-6">
      <header>
        <h1 className="text-2xl font-semibold text-[#0E2A47]">
          Hola, {profile?.full_name ?? profile?.email?.split('@')[0]} 👋
        </h1>
        <p className="text-sm text-slate-600 mt-1">
          Resumen general del panel admin — Grupo Effi
        </p>
      </header>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
        <StatCard
          label="Leads totales"
          value={isLoading ? '—' : stats?.totalLeads ?? 0}
          icon={Inbox}
          accent="navy"
        />
        <StatCard
          label="Leads nuevos"
          value={isLoading ? '—' : stats?.newLeads ?? 0}
          hint="Sin contactar"
          icon={TrendingUp}
          accent="mint"
        />
        <StatCard
          label="Campañas activas"
          value={isLoading ? '—' : stats?.liveCampaigns ?? 0}
          icon={Megaphone}
          accent="sun"
        />
        <StatCard
          label="Admins activos"
          value={isLoading ? '—' : stats?.activeAdmins ?? 0}
          icon={Users}
          accent="navy"
        />
      </div>

      <section className="rounded-xl border border-slate-200 bg-white">
        <header className="px-5 py-4 border-b border-slate-100 flex items-center justify-between">
          <h2 className="font-semibold text-[#0E2A47]">Leads recientes</h2>
          <span className="text-xs text-slate-500">Últimos 10</span>
        </header>
        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead className="bg-slate-50 text-xs uppercase tracking-wide text-slate-500">
              <tr>
                <th className="text-left px-5 py-2.5">Fecha</th>
                <th className="text-left px-5 py-2.5">Marca · País</th>
                <th className="text-left px-5 py-2.5">Funnel</th>
                <th className="text-left px-5 py-2.5">Contacto</th>
                <th className="text-left px-5 py-2.5">Status</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {(recentLeads ?? []).map(l => (
                <tr key={l.id} className="hover:bg-slate-50 transition-colors">
                  <td className="px-5 py-3 text-slate-600">
                    {new Date(l.created_at).toLocaleDateString('es-CR')}
                  </td>
                  <td className="px-5 py-3 text-[#0E2A47] font-medium">
                    {l.marca_slug} · {l.pais}
                  </td>
                  <td className="px-5 py-3">
                    <span className="inline-block rounded-full bg-slate-100 px-2 py-0.5 text-xs">
                      {l.funnel}
                    </span>
                  </td>
                  <td className="px-5 py-3">
                    {l.nombre ?? '—'}
                    {l.email && <span className="text-slate-500 block text-xs">{l.email}</span>}
                  </td>
                  <td className="px-5 py-3">
                    <StatusBadge status={l.status} />
                  </td>
                </tr>
              ))}
              {(!recentLeads || recentLeads.length === 0) && (
                <tr>
                  <td colSpan={5} className="px-5 py-8 text-center text-slate-500 text-sm">
                    Todavía no hay leads en el sistema.
                  </td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      </section>
    </div>
  )
}

function StatusBadge({ status }: { status: string }) {
  const colors: Record<string, string> = {
    new: 'bg-sky-100 text-sky-700',
    contacted: 'bg-amber-100 text-amber-800',
    qualified: 'bg-emerald-100 text-emerald-700',
    demo_scheduled: 'bg-violet-100 text-violet-700',
    demo_done: 'bg-indigo-100 text-indigo-700',
    won: 'bg-emerald-500 text-white',
    lost: 'bg-slate-200 text-slate-700',
    opt_out: 'bg-red-100 text-red-700',
    duplicate: 'bg-slate-100 text-slate-500',
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
