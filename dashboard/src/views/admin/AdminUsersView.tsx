import { useQuery, useQueryClient } from '@tanstack/react-query'
import { supabase } from '@/lib/supabase'
import { useAdminProfile } from '@/hooks/useAdminProfile'
import type { AdminProfile, AdminRole } from '@/types/admin'

const ROLES: AdminRole[] = ['super_admin', 'admin', 'viewer']

export function AdminUsersView() {
  const { isSuperAdmin } = useAdminProfile()
  const queryClient = useQueryClient()

  const { data: users, isLoading } = useQuery({
    queryKey: ['admin-users'],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('admin_effix_profiles')
        .select('*')
        .order('created_at', { ascending: false })
      if (error) throw error
      return (data ?? []) as AdminProfile[]
    },
  })

  async function changeRole(targetId: string, newRole: AdminRole) {
    const { error } = await supabase.rpc('admin_effix_promote_profile', {
      target_id: targetId,
      new_role: newRole,
    })
    if (error) {
      alert('Error: ' + error.message)
      return
    }
    await queryClient.invalidateQueries({ queryKey: ['admin-users'] })
  }

  async function toggleActive(target: AdminProfile) {
    const { error } = await supabase
      .from('admin_effix_profiles')
      .update({ is_active: !target.is_active })
      .eq('id', target.id)
    if (error) {
      alert('Error: ' + error.message)
      return
    }
    await queryClient.invalidateQueries({ queryKey: ['admin-users'] })
  }

  return (
    <div className="space-y-5">
      <header>
        <h1 className="text-2xl font-semibold text-[#0E2A47]">Usuarios</h1>
        <p className="text-sm text-slate-600 mt-0.5">
          {users?.length ?? 0} cuentas admin · {users?.filter(u => u.is_active).length ?? 0} activas
        </p>
      </header>

      {!isSuperAdmin && (
        <div className="rounded-xl border border-amber-200 bg-amber-50 p-4 text-sm text-amber-900">
          Solo super admins pueden cambiar roles o desactivar cuentas.
        </div>
      )}

      <div className="rounded-xl border border-slate-200 bg-white overflow-x-auto">
        <table className="w-full text-sm">
          <thead className="bg-slate-50 text-xs uppercase tracking-wide text-slate-500">
            <tr>
              <th className="text-left px-4 py-2.5">Email</th>
              <th className="text-left px-4 py-2.5">Nombre</th>
              <th className="text-left px-4 py-2.5">Rol</th>
              <th className="text-left px-4 py-2.5">Scope</th>
              <th className="text-left px-4 py-2.5">Último login</th>
              <th className="text-left px-4 py-2.5">Estado</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-slate-100">
            {isLoading && (
              <tr>
                <td colSpan={6} className="px-4 py-8 text-center text-slate-500">
                  Cargando...
                </td>
              </tr>
            )}
            {(users ?? []).map(u => (
              <tr key={u.id} className="hover:bg-slate-50 transition-colors">
                <td className="px-4 py-3 font-mono text-xs text-[#0E2A47]">{u.email}</td>
                <td className="px-4 py-3">{u.full_name ?? '—'}</td>
                <td className="px-4 py-3">
                  {isSuperAdmin ? (
                    <select
                      value={u.role}
                      onChange={e => void changeRole(u.id, e.target.value as AdminRole)}
                      className="rounded border border-slate-200 px-2 py-1 text-xs bg-white"
                    >
                      {ROLES.map(r => (
                        <option key={r} value={r}>
                          {r}
                        </option>
                      ))}
                    </select>
                  ) : (
                    <RolePill role={u.role} />
                  )}
                </td>
                <td className="px-4 py-3 text-xs">
                  {(() => {
                    const marcas = u.marca_scope ?? []
                    const paises = u.pais_scope ?? []
                    if (marcas.length === 0 && paises.length === 0) {
                      return <span className="text-slate-400">Todo</span>
                    }
                    return (
                      <div className="space-y-0.5">
                        {marcas.length > 0 && (
                          <div>
                            <span className="text-slate-400">marcas:</span> {marcas.join(', ')}
                          </div>
                        )}
                        {paises.length > 0 && (
                          <div>
                            <span className="text-slate-400">países:</span> {paises.join(', ')}
                          </div>
                        )}
                      </div>
                    )
                  })()}
                </td>
                <td className="px-4 py-3 text-xs text-slate-500">
                  {u.last_sign_in
                    ? new Date(u.last_sign_in).toLocaleString('es-CR', {
                        dateStyle: 'short',
                        timeStyle: 'short',
                      })
                    : 'Nunca'}
                </td>
                <td className="px-4 py-3">
                  {isSuperAdmin ? (
                    <button
                      onClick={() => void toggleActive(u)}
                      className={`rounded px-2 py-0.5 text-xs ${
                        u.is_active
                          ? 'bg-emerald-100 text-emerald-700 hover:bg-emerald-200'
                          : 'bg-red-100 text-red-700 hover:bg-red-200'
                      }`}
                    >
                      {u.is_active ? 'Activo' : 'Inactivo'}
                    </button>
                  ) : (
                    <span
                      className={`rounded-full px-2 py-0.5 text-xs ${
                        u.is_active ? 'bg-emerald-100 text-emerald-700' : 'bg-red-100 text-red-700'
                      }`}
                    >
                      {u.is_active ? 'Activo' : 'Inactivo'}
                    </span>
                  )}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      <div className="rounded-xl border border-slate-200 bg-slate-50 p-4 text-xs text-slate-600 space-y-1">
        <p>
          <strong>Para agregar un admin nuevo:</strong> el usuario debe tener cuenta previa en
          UGC Colombia (o registrarse en Supabase Auth). Luego un super admin ejecuta en SQL:
        </p>
        <pre className="bg-white border border-slate-200 rounded p-2 mt-2 font-mono text-[11px] overflow-x-auto">
{`insert into public.admin_effix_profiles (id, email, full_name, role, is_active)
select id, email, 'Nombre Apellido', 'admin', true
from auth.users where email = 'nuevo@email.com';`}
        </pre>
      </div>
    </div>
  )
}

function RolePill({ role }: { role: AdminRole }) {
  const colors: Record<AdminRole, string> = {
    super_admin: 'bg-violet-100 text-violet-800',
    admin: 'bg-sky-100 text-sky-800',
    viewer: 'bg-slate-100 text-slate-700',
  }
  return (
    <span className={`inline-block rounded-full px-2 py-0.5 text-xs ${colors[role]}`}>{role}</span>
  )
}
