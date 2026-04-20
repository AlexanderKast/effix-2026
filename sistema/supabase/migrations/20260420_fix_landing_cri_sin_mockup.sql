-- ============================================================================
-- Patch: 20260420 — Corrección landing EffiCommerce CRI
-- Descripción:
--   La URL landing-ecuador.vercel.app pertenece a Feria Effix Ecuador,
--   no a EffiCommerce Costa Rica. CR aún no tiene mockup de landing.
--   Este patch limpia las URLs y actualiza las notas del registro.
--
-- Aplicar una sola vez (idempotente: el UPDATE es seguro de re-ejecutar).
-- ============================================================================

update public.admin_effix_landings
set
  url_vercel = null,
  url_production = null,
  screenshot_url = null,
  status = 'mockup',
  notes_md = '## Landing EffiCommerce Costa Rica — pendiente mockup

Costa Rica aún **no tiene mockup** de landing. Este registro sirve como contenedor inicial para planear el desarrollo.

## Base técnica propuesta
Clonar el stack de `marcas/feria-effix/assets/landing-ecuador/` como referencia técnica (Vite + HTML + Tailwind + vanilla JS), pero **no el branding** (Feria Effix ≠ EffiCommerce) y **no la URL** (dominios distintos).

## URL final esperada
`efficommerce.com/cr` (subdirectorio)

## Pendiente
- [ ] Diseño: mockup visual con paleta EffiCommerce propia (Effi Navy + Mint, no la de Feria Effix)
- [ ] Dev: setup repo/proyecto Vercel con base técnica
- [ ] Copy: aplicar `marcas/efficommerce/costa-rica/assets/landing-cr/copy-deck-cr.md` (16 secciones ya escritas)
- [ ] QA tracking (GTM + GA4 + Meta Pixel + CAPI)
- [ ] Deploy con custom domain',
  updated_at = now()
where slug = 'efficommerce-cr';


-- Reporte
do $$
declare
  v_count integer;
begin
  select count(*) into v_count from public.admin_effix_landings where slug = 'efficommerce-cr';
  raise notice 'Landing efficommerce-cr actualizada: % fila(s) sin URLs (status=mockup).', v_count;
end $$;
