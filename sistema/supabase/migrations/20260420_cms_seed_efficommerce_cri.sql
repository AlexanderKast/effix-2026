-- ============================================================================
-- Migration: 20260420 — Seed EffiCommerce Costa Rica (CRI) 2026-Q2
-- Descripción:
--   Carga datos iniciales para que el CMS tenga contenido real al abrirlo:
--   - 1 estrategia activa (nombre único = clave idempotente)
--   - 1 landing (efficommerce.com/cr)
--   - 6 requerimientos, 1 por área (estratega/design/audiovisual/trafficker/dev_web/finanzas)
--   - 5 budgets por plataforma · presupuesto total 3 meses $3,000 USD ($1,000 USD/mes)
--   - 10 spend entries de los últimos días (mezcla CRC y USD)
--   - 2 aprobaciones pendientes (AP-NNN)
--
-- Idempotente: re-ejecutable sin duplicar (usa DO blocks con variables).
-- Ejecutar DESPUÉS de las migraciones del 17 y 18 de abril.
-- ============================================================================


do $seed$
declare
  v_strategy_id  uuid;
  v_landing_id   uuid;
  v_owner_id     uuid;
  v_req_estr     uuid;
  v_req_design   uuid;
  v_req_av       uuid;
  v_req_traff    uuid;
  v_req_dev      uuid;
  v_req_fin      uuid;
  v_approver_id  uuid;
  v_strategy_name text := 'EffiCommerce CR 2026-Q2';
  v_brand_slug text := 'efficommerce';
begin
  -- Owner estratega = primer super_admin disponible
  select id into v_owner_id
  from public.admin_effix_profiles
  where role = 'super_admin' and is_active = true
  order by created_at asc limit 1;

  if v_owner_id is null then
    raise exception 'No hay ningún super_admin activo. Aplicá primero 20260417_admin_effix_seed_users.sql con la lista de emails correcta.';
  end if;

  -- Approver = mismo owner por defecto (ajustar si hay más admins)
  v_approver_id := v_owner_id;

  -- Confirmar que la marca existe
  if not exists (select 1 from public.admin_effix_brands where slug = v_brand_slug) then
    raise exception 'La marca % no existe. Aplicá primero 20260418_cms_fx_seed.sql.', v_brand_slug;
  end if;

  ---------------------------------------------------------------------------
  -- 1) ESTRATEGIA (upsert por nombre + marca)
  ---------------------------------------------------------------------------
  select id into v_strategy_id
  from public.admin_effix_strategies
  where brand_slug = v_brand_slug and nombre = v_strategy_name;

  if v_strategy_id is null then
    insert into public.admin_effix_strategies (
      brand_slug, pais, nombre, periodo_start, periodo_end,
      objetivo_md, estado, owner_estratega, budget_total_usd, kpi_targets,
      created_by
    ) values (
      v_brand_slug,
      'CRI',
      v_strategy_name,
      '2026-04-20',
      '2026-07-19',
      '## Objetivo

Lanzar EffiCommerce en Costa Rica con dual funnel (digitalizar negocios tradicionales + migrar tiendas Shopify) aprovechando la ventana regulatoria de Factura Electrónica 4.4 + SINPE Móvil.

## KPIs
- 300 leads cualificados
- 60 demos agendadas
- 9-15 clientes cerrados
- CPL promedio < $3.00 USD
- Cierre demo→cliente 15-25%

## Presupuesto
$1,000 USD/mes × 3 meses = **$3,000 USD total**
Split: 70% Funnel A (tradicionales) / 30% Funnel B (migración Shopify)',
      'active',
      v_owner_id,
      3000,
      '{"cpl_max": 3.0, "conversion_landing_a_min": 0.05, "conversion_landing_b_min": 0.03, "demos_target": 60, "cierre_demo_cliente": 0.15}'::jsonb,
      v_owner_id
    )
    returning id into v_strategy_id;
    raise notice 'Estrategia creada: %', v_strategy_id;
  else
    raise notice 'Estrategia ya existe, reusando: %', v_strategy_id;
  end if;

  ---------------------------------------------------------------------------
  -- 2) LANDING
  ---------------------------------------------------------------------------
  select id into v_landing_id
  from public.admin_effix_landings
  where strategy_id = v_strategy_id and slug = 'efficommerce-cr';

  if v_landing_id is null then
    insert into public.admin_effix_landings (
      strategy_id, slug, url_vercel, url_production, funnel, tipo, status,
      notes_md, created_by
    ) values (
      v_strategy_id,
      'efficommerce-cr',
      'https://landing-ecuador.vercel.app',  -- referencia visual (clon)
      null,
      'dual A+B',
      'lead_capture',
      'mockup',
      '## Landing EffiCommerce Costa Rica

- Base: clon de `landing-ecuador.vercel.app`
- Adaptación copy + brand propio EffiCommerce
- Dual funnel con selector de perfil en hero:
  - A: negocios tradicionales (pulperías, sodas, talleres, profesionales)
  - B: dueños Shopify/Jumpseller/Tiendanube
- URL final: `efficommerce.com/cr`

### Pendiente
- [ ] Dev: clonar repo landing-ecuador
- [ ] Design: aplicar paleta Effi Navy + Mint (no Feria Effix)
- [ ] Copy: adaptar de `copy-deck-cr.md` (16 secciones listas)
- [ ] Deploy Vercel + custom domain',
      v_owner_id
    )
    returning id into v_landing_id;
    raise notice 'Landing creada: %', v_landing_id;
  end if;

  ---------------------------------------------------------------------------
  -- 3) REQUERIMIENTOS (1 por área)
  ---------------------------------------------------------------------------

  -- Estratega
  select id into v_req_estr from public.admin_effix_requirements
  where strategy_id = v_strategy_id and area = 'estratega' and title = 'Definir plan maestro Q2 EffiCommerce CR';
  if v_req_estr is null then
    insert into public.admin_effix_requirements (
      strategy_id, area, title, brief_md, priority, status, assignee_id, deadline,
      template_used, created_by
    ) values (
      v_strategy_id, 'estratega',
      'Definir plan maestro Q2 EffiCommerce CR',
      '## Contexto
Lanzamiento EffiCommerce Costa Rica con ventana regulatoria Factura 4.4 + SINPE.

## Entregables
- Plan maestro 12 semanas con gates G1-G6
- Messaging framework (voz, pilares, anti-patrones)
- Brand guide mínimo v0.1 (paleta B2B SaaS propia)
- ICP + 6 buyer personas (4 A + 2 B)
- Assets base: `marcas/efficommerce/costa-rica/estrategia/`

## Dependencias
- Bloqueante para: todos los demás requerimientos del Q2',
      'high', 'approved', v_owner_id, '2026-04-25',
      '/templates/brief-creativo.md', v_owner_id
    ) returning id into v_req_estr;
  end if;

  -- Diseño
  select id into v_req_design from public.admin_effix_requirements
  where strategy_id = v_strategy_id and area = 'design' and title = 'Brand guide + 6 estáticos Meta Funnel A';
  if v_req_design is null then
    insert into public.admin_effix_requirements (
      strategy_id, area, title, brief_md, priority, status, deadline,
      template_used, created_by
    ) values (
      v_strategy_id, 'design',
      'Brand guide + 6 estáticos Meta Funnel A',
      '## Entregables
### Brand guide EffiCommerce (no heredar Feria Effix)
- Paleta: Effi Navy #0E2A47 + Mint #1BC49C + Sun #F5B700 + Cream #FAF7F0
- Tipografías: Inter Tight (display) + Inter (body)
- Logo SVG horizontal + iso

### 6 estáticos Meta Funnel A
1. E1 Carta Hacienda (1:1) — 2 variantes copy
2. E2 Don Carlos quote (1:1) — 2 variantes
3. E3 Antes/Después (4:5)
4. E4 Cómo funciona 1-2-3 (4:5)
5. E5 Story pregunta directa (9:16)
6. E6 Story Dra. Andrea (9:16)

Especificaciones completas: `creativos/briefs/brief-funnel-a.md`',
      'high', 'in_review', '2026-05-03',
      '/templates/brief-creativo.md', v_owner_id
    ) returning id into v_req_design;
  end if;

  -- Audiovisual
  select id into v_req_av from public.admin_effix_requirements
  where strategy_id = v_strategy_id and area = 'audiovisual' and title = '3 videos Meta Funnel A (9:16) + VSL 90s';
  if v_req_av is null then
    insert into public.admin_effix_requirements (
      strategy_id, area, title, brief_md, priority, status, deadline,
      template_used, created_by
    ) values (
      v_strategy_id, 'audiovisual',
      '3 videos Meta Funnel A (9:16) + VSL 90s',
      '## Entregables
- V1 "Don Carlos de la pulpería" · 30s testimonial UGC
- V2 "Pasa de Excel a EffiCommerce" · 26s explainer
- V3 "No necesitás aprender computación" · 28s contrarian
- VSL A1 · 90s para Meta + landing hero

## Producción
- Casting CR 55-65 años (Don Carlos)
- Locación pulpería real
- Música acústica warm LATAM (Artlist)
- Captions burned-in español
- Exports: 9:16, 1:1, 16:9

Guiones palabra por palabra: `creativos/guiones/guiones-videos-cortos.md` + `vsl-completo.md`',
      'high', 'draft', '2026-05-05',
      '/templates/brief-creativo.md', v_owner_id
    ) returning id into v_req_av;
  end if;

  -- Trafficker
  select id into v_req_traff from public.admin_effix_requirements
  where strategy_id = v_strategy_id and area = 'trafficker' and title = 'Setup Meta BM + Google Ads + tracking CAPI';
  if v_req_traff is null then
    insert into public.admin_effix_requirements (
      strategy_id, area, title, brief_md, priority, status, deadline,
      template_used, created_by
    ) values (
      v_strategy_id, 'trafficker',
      'Setup Meta BM + Google Ads + tracking CAPI',
      '## Pre-lanzamiento (bloqueante para spend)
- Meta Business Manager CR + Pixel + CAPI vía n8n webhook
- Google Ads CR + Enhanced Conversions + auto-tagging
- GTM container + GA4 property + Consent Mode v2
- WhatsApp Business API (Twilio o 360dialog) + 6 plantillas aprobadas por Meta
- QA con Tag Assistant + Events Manager antes de gastar $1

## Campañas a cargar (listas en los docs)
- Meta Funnel A: 3 videos × 3 variantes = 9 ads
- Meta Funnel B: 2 videos × 3 variantes + 4 estáticos × 2 variantes = 14 ads
- Google Funnel A: 4 Ad Groups con 60 headlines + 16 descriptions
- Google Funnel B: 3 Ad Groups con 45 headlines + 12 descriptions

Specs completos: `campanas/ads-meta-funnel-a.md` etc.',
      'urgent', 'in_production', '2026-04-30',
      '/templates/brief-creativo.md', v_owner_id
    ) returning id into v_req_traff;
  end if;

  -- Dev Web
  select id into v_req_dev from public.admin_effix_requirements
  where strategy_id = v_strategy_id and area = 'dev_web' and title = 'Landing /cr/ + diagnóstico Factura 4.4 + form auditoría';
  if v_req_dev is null then
    insert into public.admin_effix_requirements (
      strategy_id, area, title, brief_md, priority, status, deadline,
      template_used, created_by
    ) values (
      v_strategy_id, 'dev_web',
      'Landing /cr/ + diagnóstico Factura 4.4 + form auditoría',
      '## Stack
- Clon de `marcas/feria-effix/assets/landing-ecuador/` (Vite + HTML + Tailwind + vanilla JS)
- Deploy Vercel subdirectorio `efficommerce.com/cr`

## Páginas
- `/cr` landing principal con selector de perfil dual (Funnel A + B)
- `/cr/diagnostico-factura-44` form 6 preguntas + score + plan WhatsApp
- `/cr/auditoria-shopify` form URL + 5 preguntas → reporte 24h
- `/cr/gracias-a` y `/cr/gracias-b`

## Tracking
- GTM + GA4 + Meta Pixel + CAPI server-side via n8n
- Consent Mode v2 + checkbox Ley 8968 separado
- Eventos: PageView, ViewContent, Lead, Contact, Schedule

## Bot WhatsApp (n8n)
- Webhook form → Supabase `admin_effix_leads` → router por profile_type → entrega lead magnet
- Secuencia 7 días con 5 plantillas MARKETING
- Handoff a humano en primer inbound

Copy completo: `assets/landing-cr/copy-deck-cr.md` (16 secciones)
Propuesta landing: `/templates/propuesta-landing.md`',
      'urgent', 'in_production', '2026-05-02',
      '/templates/propuesta-landing.md', v_owner_id
    ) returning id into v_req_dev;
  end if;

  -- Finanzas
  select id into v_req_fin from public.admin_effix_requirements
  where strategy_id = v_strategy_id and area = 'finanzas' and title = 'Pacing semanal $1,000/mes + cierre mensual SINPE';
  if v_req_fin is null then
    insert into public.admin_effix_requirements (
      strategy_id, area, title, brief_md, priority, status, deadline,
      created_by
    ) values (
      v_strategy_id, 'finanzas',
      'Pacing semanal $1,000/mes + cierre mensual SINPE',
      '## Tareas
- Validar TRM CRC/USD semanalmente (refrescar `admin_effix_fx_rates`)
- Registrar spend diario cross-platform en libro diario
- Reporte semanal de pace vs presupuesto por plataforma
- Cierre mensual: RPC `admin_effix_reconcile_month` → bloquea entries del mes anterior
- Reconciliación con facturas Meta/Google en USD al final del mes

## Presupuesto $1,000 USD/mes × 3 meses
- Meta Funnel A: $400/mes · CRC ≈ ₡208,000
- Meta Funnel B: $200/mes · CRC ≈ ₡104,000
- Google Funnel A: $250/mes · CRC ≈ ₡130,000
- Google Funnel B: $100/mes · CRC ≈ ₡52,000
- WhatsApp Business API + setup: $50/mes · CRC ≈ ₡26,000',
      'normal', 'draft', '2026-04-28',
      v_owner_id
    ) returning id into v_req_fin;
  end if;

  ---------------------------------------------------------------------------
  -- 4) BUDGETS · $3,000 USD total (3 meses) con conversión CRC
  --    FX usada: 1 CRC = 0.001923 USD  →  1 USD ≈ 520 CRC
  ---------------------------------------------------------------------------

  -- Meta Funnel A
  insert into public.admin_effix_budgets (
    strategy_id, platform, period_start, period_end,
    amount_usd, amount_local, currency, notes_md, created_by
  )
  select v_strategy_id, 'meta_funnel_a', '2026-04-20', '2026-07-19',
         1200, 624000, 'CRC',
         'Funnel A (tradicionales) · video Meta Conv WhatsApp + ThruPlay. 70% del budget Meta.', v_owner_id
  where not exists (
    select 1 from public.admin_effix_budgets
    where strategy_id = v_strategy_id and platform = 'meta_funnel_a'
  );

  -- Meta Funnel B
  insert into public.admin_effix_budgets (
    strategy_id, platform, period_start, period_end,
    amount_usd, amount_local, currency, notes_md, created_by
  )
  select v_strategy_id, 'meta_funnel_b', '2026-04-20', '2026-07-19',
         600, 312000, 'CRC',
         'Funnel B (migrar Shopify) · traffic landing + retargeting. 30% del budget Meta.', v_owner_id
  where not exists (
    select 1 from public.admin_effix_budgets
    where strategy_id = v_strategy_id and platform = 'meta_funnel_b'
  );

  -- Google Funnel A
  insert into public.admin_effix_budgets (
    strategy_id, platform, period_start, period_end,
    amount_usd, amount_local, currency, notes_md, created_by
  )
  select v_strategy_id, 'google_funnel_a', '2026-04-20', '2026-07-19',
         750, 390000, 'CRC',
         'Google Search Brand + Categoría A (Factura 4.4, SINPE, POS pymes).', v_owner_id
  where not exists (
    select 1 from public.admin_effix_budgets
    where strategy_id = v_strategy_id and platform = 'google_funnel_a'
  );

  -- Google Funnel B
  insert into public.admin_effix_budgets (
    strategy_id, platform, period_start, period_end,
    amount_usd, amount_local, currency, notes_md, created_by
  )
  select v_strategy_id, 'google_funnel_b', '2026-04-20', '2026-07-19',
         300, 156000, 'CRC',
         'Google Search Categoría B (alternativa Shopify, plataforma ecommerce CR).', v_owner_id
  where not exists (
    select 1 from public.admin_effix_budgets
    where strategy_id = v_strategy_id and platform = 'google_funnel_b'
  );

  -- WhatsApp Business API
  insert into public.admin_effix_budgets (
    strategy_id, platform, period_start, period_end,
    amount_usd, amount_local, currency, notes_md, created_by
  )
  select v_strategy_id, 'whatsapp', '2026-04-20', '2026-07-19',
         150, 78000, 'CRC',
         'WhatsApp Business API (Twilio) · plantillas MARKETING + UTILITY + conversaciones.', v_owner_id
  where not exists (
    select 1 from public.admin_effix_budgets
    where strategy_id = v_strategy_id and platform = 'whatsapp'
  );

  ---------------------------------------------------------------------------
  -- 5) SPEND ENTRIES · últimos 7 días (ejemplo de libro diario mixto USD/CRC)
  ---------------------------------------------------------------------------

  -- Solo insertar si aún no hay ningún spend para esta estrategia
  if not exists (select 1 from public.admin_effix_spend_entries where strategy_id = v_strategy_id) then

    -- Meta Funnel A (USD) — dos días seguidos
    insert into public.admin_effix_spend_entries (
      fecha, strategy_id, platform, amount_local, currency,
      fx_rate, fx_date, amount_usd, source, notes, created_by
    ) values
      ('2026-04-18', v_strategy_id, 'meta', 15.00, 'USD', 1.0, '2026-04-18', 15.00,
       'manual', 'Video Conv WA — Funnel A (lanzamiento soft)', v_owner_id),
      ('2026-04-19', v_strategy_id, 'meta', 18.50, 'USD', 1.0, '2026-04-19', 18.50,
       'manual', 'Video Conv WA — Funnel A', v_owner_id),
      ('2026-04-20', v_strategy_id, 'meta', 22.00, 'USD', 1.0, '2026-04-20', 22.00,
       'manual', 'Video Conv WA — Funnel A (ajuste audiencia GAM)', v_owner_id);

    -- Google Funnel A (CRC) — conversión con TRM 0.001923
    insert into public.admin_effix_spend_entries (
      fecha, strategy_id, platform, amount_local, currency,
      fx_rate, fx_date, amount_usd, source, notes, created_by
    ) values
      ('2026-04-19', v_strategy_id, 'google', 4160.00, 'CRC', 0.001923, '2026-04-19',
       8.00, 'manual', 'Search Brand + Cat A Factura 4.4', v_owner_id),
      ('2026-04-20', v_strategy_id, 'google', 5200.00, 'CRC', 0.001923, '2026-04-20',
       10.00, 'manual', 'Search Cat A — keyword "sinpe movil ecommerce"', v_owner_id);

    -- Meta Funnel B
    insert into public.admin_effix_spend_entries (
      fecha, strategy_id, platform, amount_local, currency,
      fx_rate, fx_date, amount_usd, source, notes, created_by
    ) values
      ('2026-04-20', v_strategy_id, 'meta', 8.00, 'USD', 1.0, '2026-04-20', 8.00,
       'manual', 'Traffic Landing B — Funnel Shopify', v_owner_id);

    -- Google Funnel B
    insert into public.admin_effix_spend_entries (
      fecha, strategy_id, platform, amount_local, currency,
      fx_rate, fx_date, amount_usd, source, notes, created_by
    ) values
      ('2026-04-20', v_strategy_id, 'google', 3120.00, 'CRC', 0.001923, '2026-04-20',
       6.00, 'manual', 'Search Cat B — "alternativa shopify costa rica"', v_owner_id);

    -- WABA
    insert into public.admin_effix_spend_entries (
      fecha, strategy_id, platform, amount_local, currency,
      fx_rate, fx_date, amount_usd, source, notes, created_by
    ) values
      ('2026-04-18', v_strategy_id, 'whatsapp', 1.50, 'USD', 1.0, '2026-04-18', 1.50,
       'manual', 'Twilio WABA — plantillas welcome', v_owner_id),
      ('2026-04-19', v_strategy_id, 'whatsapp', 2.20, 'USD', 1.0, '2026-04-19', 2.20,
       'manual', 'Twilio WABA — nurturing D2', v_owner_id),
      ('2026-04-20', v_strategy_id, 'whatsapp', 2.80, 'USD', 1.0, '2026-04-20', 2.80,
       'manual', 'Twilio WABA', v_owner_id);

    raise notice 'Spend entries creados (10 filas de los últimos 3 días)';
  end if;

  ---------------------------------------------------------------------------
  -- 6) APPROVALS — 2 pendientes
  ---------------------------------------------------------------------------

  if v_req_design is not null and not exists (
    select 1 from public.admin_effix_approvals
    where entity_type = 'requirement' and entity_id = v_req_design
  ) then
    insert into public.admin_effix_approvals (
      entity_type, entity_id, requested_by, approver_id,
      status, request_md
    ) values (
      'requirement', v_req_design, v_owner_id, v_approver_id,
      'pending',
      'Solicito aprobación del brief de diseño + 6 estáticos Funnel A. Revisar paleta Effi (no Feria Effix) y specs 1:1 / 4:5 / 9:16.'
    );
  end if;

  if v_req_av is not null and not exists (
    select 1 from public.admin_effix_approvals
    where entity_type = 'requirement' and entity_id = v_req_av
  ) then
    insert into public.admin_effix_approvals (
      entity_type, entity_id, requested_by, approver_id,
      status, request_md
    ) values (
      'requirement', v_req_av, v_owner_id, v_approver_id,
      'pending',
      'Solicito aprobación de los 3 guiones videos cortos Funnel A + VSL 90s antes de contratar casting y locación.'
    );
  end if;

  raise notice '---------------------------------------------';
  raise notice 'Seed EffiCommerce CRI aplicado exitosamente';
  raise notice '  Estrategia: %', v_strategy_id;
  raise notice '  Owner:      %', v_owner_id;
  raise notice '  Landing:    %', v_landing_id;
  raise notice '---------------------------------------------';
end $seed$;


-- ============================================================================
-- Reporte final
-- ============================================================================
do $$
declare
  v_s integer; v_r integer; v_b integer; v_sp integer; v_a integer;
begin
  select count(*) into v_s from public.admin_effix_strategies where brand_slug = 'efficommerce' and pais = 'CRI';
  select count(*) into v_r from public.admin_effix_requirements r
    join public.admin_effix_strategies s on s.id = r.strategy_id
    where s.brand_slug = 'efficommerce' and s.pais = 'CRI';
  select count(*) into v_b from public.admin_effix_budgets b
    join public.admin_effix_strategies s on s.id = b.strategy_id
    where s.brand_slug = 'efficommerce' and s.pais = 'CRI';
  select count(*) into v_sp from public.admin_effix_spend_entries sp
    join public.admin_effix_strategies s on s.id = sp.strategy_id
    where s.brand_slug = 'efficommerce' and s.pais = 'CRI';
  select count(*) into v_a from public.admin_effix_approvals where status = 'pending';

  raise notice 'EffiCommerce CRI · seed aplicado';
  raise notice '  Estrategias:   %', v_s;
  raise notice '  Requerimientos: %', v_r;
  raise notice '  Budgets:       %', v_b;
  raise notice '  Spend entries: %', v_sp;
  raise notice '  Aprobaciones pendientes: %', v_a;
end $$;
