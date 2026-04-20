import { brandModules } from '@/data/brand-modules'

const countryLabels: Record<string, string> = {
  COL: 'Colombia',
  ECU: 'Ecuador',
  RD: 'Rep. Dominicana',
  GUA: 'Guatemala',
  CRI: 'Costa Rica',
}

export function AdminBrandsView() {
  return (
    <div className="space-y-5">
      <header>
        <h1 className="text-2xl font-semibold text-[#0E2A47]">Marcas</h1>
        <p className="text-sm text-slate-600 mt-0.5">
          10 marcas del Grupo Effi · configuradas en `src/data/brand-modules.ts`
        </p>
      </header>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        {brandModules.map(b => (
          <div
            key={b.slug}
            className="rounded-xl border border-slate-200 bg-white p-5"
          >
            <h3 className="font-semibold text-[#0E2A47]">{b.name}</h3>
            <p className="text-xs text-slate-500 mt-0.5 font-mono">{b.slug}</p>

            <div className="mt-3">
              <p className="text-xs uppercase tracking-wide text-slate-500 mb-1">Países</p>
              <div className="flex flex-wrap gap-1">
                {b.countries.map(c => (
                  <span
                    key={c}
                    className="inline-block rounded-full bg-[#1BC49C]/10 text-[#0E2A47] px-2 py-0.5 text-xs"
                  >
                    {countryLabels[c] ?? c}
                  </span>
                ))}
              </div>
            </div>

            <div className="mt-3">
              <p className="text-xs uppercase tracking-wide text-slate-500 mb-1">
                Módulos activos ({b.submodules.length})
              </p>
              <div className="flex flex-wrap gap-1">
                {b.submodules.map(s => (
                  <span
                    key={s}
                    className="inline-block rounded bg-slate-100 text-slate-700 px-2 py-0.5 text-xs"
                  >
                    {s}
                  </span>
                ))}
              </div>
            </div>
          </div>
        ))}
      </div>

      <p className="text-xs text-slate-500">
        Para agregar marcas o países, editá `dashboard/src/data/brand-modules.ts`.
        Próximamente: edición desde UI con persistencia en `admin_effix_settings`.
      </p>
    </div>
  )
}
