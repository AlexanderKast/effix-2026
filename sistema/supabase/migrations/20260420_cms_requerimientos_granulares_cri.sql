-- ============================================================================
-- Migration: 20260420 — Requerimientos granulares EffiCommerce CR 2026-Q2
--
-- Descripción:
--   Reemplaza los 6 requerimientos agrupados (1 por rol) por 33 granulares
--   (1 por cada pieza: cada carrusel, cada post, cada story, cada video,
--   cada campaña, cada página de la landing, cada setup técnico).
--
--   Distribución por rol:
--     · Estratega      5
--     · Diseño         9 (3 carruseles + 3 posts + 3 stories)
--     · Audiovisual    3 videos (Sara · Juan · Empleado CS)
--     · Trafficker     8 (4 setups + 4 campañas)
--     · Dev Web        5 (4 páginas + bot WhatsApp)
--     · Finanzas       3
--     ──────────────
--     Total           33
--
--   Briefs largos con copy literal slide-por-slide y guiones palabra-por-palabra
--   importados de los briefs v2 (20260420_cms_briefs_v2_efficommerce_real.sql)
--   y detallados sin UGC (20260420_cms_briefs_detallados_sin_ugc.sql).
--
-- Idempotente:
--   · INSERT con WHERE NOT EXISTS por (strategy_id, area, title) única.
--   · DELETE de los 6 viejos + aprobaciones asociadas solo si existen.
--
-- Aplicar DESPUÉS de 20260420_cms_briefs_v2_efficommerce_real.sql.
-- ============================================================================


do $mig$
declare
  v_strategy_id uuid;
  v_owner_id    uuid;
  v_old_ids     uuid[];
  v_inserted    integer;
begin
  ---------------------------------------------------------------------------
  -- 0) Resolver strategy + owner
  ---------------------------------------------------------------------------
  select id into v_strategy_id
  from public.admin_effix_strategies
  where brand_slug = 'efficommerce' and nombre = 'EffiCommerce CR 2026-Q2';

  if v_strategy_id is null then
    raise exception 'No existe la estrategia EffiCommerce CR 2026-Q2. Aplicá primero 20260420_cms_seed_efficommerce_cri.sql.';
  end if;

  select id into v_owner_id
  from public.admin_effix_profiles
  where role = 'super_admin' and is_active = true
  order by created_at asc limit 1;

  if v_owner_id is null then
    raise exception 'No hay super_admin activo.';
  end if;

  ---------------------------------------------------------------------------
  -- 1) Borrar los 6 requerimientos agrupados previos + sus approvals
  --    (safe re-ejecución: solo borra lo que exista con esos títulos exactos)
  ---------------------------------------------------------------------------
  select array_agg(id) into v_old_ids
  from public.admin_effix_requirements
  where strategy_id = v_strategy_id
    and title in (
      'Definir plan maestro Q2 EffiCommerce CR',
      'Plan estratégico EffiCommerce CR · dropshipping + fulfillment + contraentrega',
      'Brand guide + 6 estáticos Meta Funnel A',
      'Diseño Funnel A · 3 carruseles + 3 posts feed + 3 stories',
      '3 videos Meta Funnel A (9:16) + VSL 90s',
      'Video Funnel A · 3 piezas con Sara, Juan y empleado · guiones separados',
      'Setup Meta BM + Google Ads + tracking CAPI',
      'Landing /cr/ + diagnóstico Factura 4.4 + form auditoría',
      'Pacing semanal $1,000/mes + cierre mensual SINPE'
    );

  if v_old_ids is not null and array_length(v_old_ids, 1) > 0 then
    delete from public.admin_effix_approvals
    where entity_type = 'requirement' and entity_id = any(v_old_ids);

    delete from public.admin_effix_requirements
    where id = any(v_old_ids);

    raise notice 'Borrados % requerimientos agrupados previos + sus aprobaciones.', array_length(v_old_ids, 1);
  end if;

  ---------------------------------------------------------------------------
  -- 2) Insertar los 33 requerimientos granulares
  --    Idempotencia: WHERE NOT EXISTS en (strategy_id, area, title)
  ---------------------------------------------------------------------------
  with nuevos (area, title, brief_md, priority, status, assign, deadline, template) as (
    values
    -- ==========================================================
    -- ESTRATEGA (5)
    -- ==========================================================
    (
      'estratega',
      'R-E01 · Plan maestro Q2 EffiCommerce CR · 12 semanas',
      $b$# Plan maestro EffiCommerce CR · Q2-Q3 2026

## Contexto
Lanzamiento en Costa Rica aprovechando ventana ecommerce LATAM. Mercado CR: $1.8B (2025) → $2.535B (2029), CAGR 8.91%. Ya operamos con bodega CR + integraciones courier locales. Funnel A (dropshippers ecommerce · 70%) y Funnel B (tiendas establecidas · 30%).

## Entregable
Documento `marcas/efficommerce/costa-rica/estrategia/plan-maestro-cr.md` con:

### Gates G1-G6 (cada gate = checkpoint para pasar a siguiente fase)
- G1 (sem 1-2): Setup tracking + brand guide + messaging aprobados
- G2 (sem 3-4): Primeros ads live Funnel A · baseline CPL
- G3 (sem 5-6): 50 leads · primeras 10 demos · ajuste creativos
- G4 (sem 7-8): Escalar top 20% ads · abrir Funnel B
- G5 (sem 9-10): 150 leads acumulados · optimizar hacia demos
- G6 (sem 11-12): Cierre Q2 · reporte final · plan Q3

### Dependencias críticas
- Bodega CR EffiCommerce operativa (confirmar timeline)
- Integraciones courier CR ya activas
- Pricing plans CR (¿mismo que CO/EC o ajustado?)
- Aclarar frontera Effi System CR vs EffiCommerce CR

### KPIs 90 días
300+ leads cualificados · 60+ demos · 9-15 clientes cerrados · CPL <$3 USD · Conv landing ≥5% (A) / ≥3% (B)

### Presupuesto
$1,000 USD/mes × 3 = $3,000 USD. Split 70/30 Funnel A/B.

## Criterios de aceptación
- [ ] Plan con 12 semanas mapeadas y responsables
- [ ] Gates con criterio medible de pasar/no pasar
- [ ] Dependencias confirmadas con operaciones
- [ ] Aprobación CEO (Sara) antes de G1
$b$,
      'high', 'approved', true, '2026-04-25', '/templates/brief-creativo.md'
    ),
    (
      'estratega',
      'R-E02 · Messaging framework · voz + pilares + anti-patrones',
      $b$# Messaging framework EffiCommerce CR

## Entregable
`marcas/efficommerce/costa-rica/estrategia/messaging-framework.md`

## Value prop central
> "Automatizá tu ecommerce en CR: integración con tu tienda actual (Shopify/Woo/ML) + bodega local + pago contraentrega + logística multi-courier + ERP completo. Todo desde una plataforma."

## Pilares de mensaje
1. **EffiCommerce se integra, no compite con Shopify**
2. **Bodega CR + contraentrega automatizada** (core LATAM)
3. **20,000+ emprendedores en 5 países · autoridad real**
4. **ERP pensado para ecommerce LATAM** (no genérico)

## Mensajes por Funnel

### Funnel A · Dropshippers (70%)
- "Tu ecommerce automatizado: integrás Shopify → bodega CR → contraentrega → cobro"
- "Dejá de despachar desde tu casa. Bodega CR + transportadoras integradas"
- "Importás de China, nosotros lo recibimos, guardamos y despachamos"
- "Contraentrega automatizada: el courier cobra, EffiCommerce te deposita"

### Funnel B · Tiendas establecidas (30%)
- "Un solo sistema: ventas, inventario, tesorería, nómina, CRM — todo conectado"
- "ERP pensado para ecommerce LATAM, no genérico"
- "Multi-país en una plataforma: CR, CO, EC, RD, GT"

## Voz
- Directa, operativa, sin tecnicismos innecesarios
- Español CR neutro default · variantes con modismos (mae, pura vida, a la fija) solo Story/Reels
- Tono: socio confiable, no vendedor agresivo

## Anti-patrones (NO usar)
- No decir "alternativa a Shopify" · es socio, no competencia
- No prometer "escaneá facturas y ya" · el valor es fulfillment + contraentrega
- No posicionar como "software barato" · somos servicio integral
- No usar urgencia falsa ("últimas plazas") en Funnel B · público B2B desconfía
- No mencionar tarjetas de crédito como método principal · LATAM prefiere contraentrega

## Disclaimer obligatorio en ads
Ninguno regulatorio. Evitar claims no respaldables ("10x tus ventas").
$b$,
      'high', 'in_review', true, '2026-04-24', '/templates/brief-creativo.md'
    ),
    (
      'estratega',
      'R-E03 · Brand guide mínimo v0.1 · paleta + tipos + lockup',
      $b$# Brand guide mínimo EffiCommerce CR v0.1

## Entregable
`marcas/efficommerce/costa-rica/estrategia/brand-guide-minimo.md` + assets en `/assets/brand/`

## Importante
- El brand guide aplica a lanzamiento CR · **NO heredar branding Feria Effix**
- Branding EffiCommerce es propio, alineado al grupo pero independiente de Feria Effix

## Paleta
- **Effi Navy** `#0E2A47` — primario
- **Mint** `#1BC49C` — acción / CTAs
- **Sun** `#F5B700` — alerta / destacados
- **Cream** `#FAF7F0` — fondos
- **Slate 900** `#0F172A` — texto
- **Slate 500** `#64748B` — texto secundario
- **White** `#FFFFFF`

## Tipografía
- **Display**: Inter Tight (700/900) — hero, titulares
- **Body**: Inter (400/500/600) — bajadas, UI, párrafos
- **Mono** (opcional): JetBrains Mono para código/UI demo

## Logo
- Lockup horizontal (preferido) · iso (para stories y avatar)
- Variantes: sobre Navy (logo blanco), sobre Cream (logo Navy), sobre Mint (logo Navy)
- Área de protección mínima = altura del iso
- Tamaño mínimo digital: 80px ancho
- NO deformar, NO aplicar sombras, NO poner sobre fondos de color ruidosos

## Iconografía
- Lucide icons set · stroke 1.5 · corners rounded

## Fotografía
- Real · bodega CR si disponible · pulperías auténticas
- NO stock obvio · evitar fotos con water-marks o sonrisas forzadas

## Exports para equipo
- Logo SVG + PNG (1x, 2x, 3x)
- Paleta .ase (Adobe) + .json (tokens web)
- Templates Canva para el equipo social

## Criterios aprobación
- [ ] Paleta no choca con Feria Effix (distinguir visualmente)
- [ ] Aplicado a 1 carrusel de muestra para validación
- [ ] Exports listos antes de entrega piezas diseño
$b$,
      'high', 'in_review', true, '2026-04-24', '/templates/brief-creativo.md'
    ),
    (
      'estratega',
      'R-E04 · ICP refinado + 6 buyer personas (4A + 2B)',
      $b$# ICP + Buyer personas EffiCommerce CR

## Entregable
`marcas/efficommerce/costa-rica/context/icp-buyer-personas.md`

## ICP primario · Funnel A (70% budget)
Dropshipper / emprendedor ecommerce LATAM que:
- Tiene o quiere tienda en Shopify / WooCommerce / MercadoLibre
- Necesita bodega física CR (productos China → CR)
- Quiere ofrecer contraentrega (80% de pedidos LATAM)
- Busca integraciones courier nacionales CR
- Escala a 200-2000 pedidos/mes · no puede despachar a mano

## ICP secundario · Funnel B (30% budget)
Tienda ecommerce establecida CR con Shopify/Woo/ML que necesita ERP consolidado + multi-país.

## 6 Buyer personas

### A1 · Melissa · 29 · Dropshipper principiante
- Vende ropa y gadgets importados de China por IG + Shopify básico
- 60 pedidos/mes · despacha de su apto en Escazú
- Pain: courier no le paga, clientes cancelan, sala es depósito
- Trigger: llegó a los 100 pedidos y no puede sola
- Canal: IG Reels + WhatsApp

### A2 · Diego · 34 · Dropshipper intermedio
- 400 pedidos/mes · 3 productos estrella · Shopify + ML
- Bodega alquilada 30m² · 1 asistente part-time
- Pain: ERP en Excel · sin claridad de ganancia · multi-courier caótico
- Trigger: quiere liberarse de operar para enfocarse en marketing
- Canal: YouTube · podcasts ecommerce · Google

### A3 · Valeria · 27 · TikTok seller emergente
- Vende por TikTok Shop + LIVEs · ticket bajo alto volumen (1000+/mes)
- Productos hair / skin · todo China
- Pain: TikTok ventas sí · operación no · se está quemando
- Trigger: broadcast viral la rompió operativamente
- Canal: TikTok · comunidades seller

### A4 · Andrés · 42 · Dropshipper experimentado
- 2 tiendas · 1200 pedidos/mes agregado · intenta sistematizar
- Pain: quiere escalar a Panamá/Nicaragua pero CR ya lo satura
- Trigger: ventana multi-país
- Canal: LinkedIn · Google search intent

### B1 · Dra. Andrea · 38 · Tienda cosmética establecida
- Shopify hace 3 años · 800 pedidos/mes · $40k USD/mes
- Usa Shopify + Odoo + Excel · 3 sistemas desconectados
- Pain: inventario inexacto · tesorería mensual es tortura
- Trigger: auditoría fiscal pendiente
- Canal: LinkedIn · Google "ERP ecommerce"

### B2 · Don Rodrigo · 51 · Dueño cadena retail local
- 2 locales físicos + Shopify · quiere escalar online
- $80k USD/mes · gestión con equipo de 4
- Pain: quiere unificar POS + online + inventario
- Trigger: pérdida por inventario descuadrado
- Canal: Google · LinkedIn · referidos
$b$,
      'normal', 'in_review', true, '2026-04-26', '/templates/brief-creativo.md'
    ),
    (
      'estratega',
      'R-E05 · Dashboard KPIs + pacing semanal',
      $b$# Dashboard KPIs EffiCommerce CR

## Entregable
Vista en CMS (HomeView) + reporte semanal md `marcas/efficommerce/costa-rica/reportes/semanal-NNNN.md`

## KPIs principales (90 días)
- Leads cualificados: target 300 (≥100/mes)
- Demos agendadas: target 60
- Clientes cerrados: target 9-15
- CPL promedio: <$3.00 USD
- Conversión landing A: ≥5%
- Conversión landing B: ≥3%
- Cierre demo→cliente: 15-25%

## KPIs secundarios
- CTR Meta ads: ≥1.5% (Funnel A) / ≥1% (Funnel B)
- CTR Google search: ≥4%
- Spend pacing: variación ≤10% vs plan semanal
- Costo por demo: <$50 USD

## Pacing semanal
- Lunes 9am: reporte semana anterior (spend + leads + demos)
- Viernes 4pm: forecast semana siguiente + ajustes
- Responsables: Estratega (Home) · Trafficker (spend) · SDR (demos)

## Checkpoints
- G2 (sem 4): CPL <$5 aceptable · <$3 target
- G4 (sem 8): 40+ demos acumuladas
- G6 (sem 12): cierre 9+ clientes

## Alertas automáticas
- Spend >110% pace semanal → notificar estratega
- CPL >$5 por 3 días consecutivos → pausa + revisión creativos
- 0 demos en 7 días → escalar creativos + revisar canal SDR
$b$,
      'normal', 'draft', true, '2026-04-27', '/templates/reporte-semanal.md'
    ),

    -- ==========================================================
    -- DISEÑO (9)
    -- ==========================================================
    (
      'design',
      'R-D01 · Carrusel C1 · 5 dolores de despachar desde tu casa · 6 slides',
      $b$# Carrusel C1 · Funnel A Meta · 1080×1350 (4:5) · 6 slides

**Ángulo general**: pain-led. Identificación con dropshipper que sufre operando solo.

## Slide 1 (portada · hook)
- **Texto principal**: `5 dolores de despachar desde tu casa`
- **Subtexto**: `Si vendés más de 50 pedidos/mes, esto te suena`
- **Ángulo**: curiosidad + identificación
- **Visual**: foto estilizada de caja cartón, cinta adhesiva, desorden controlado
- CTA visual: "Deslizá →"

## Slide 2 (dolor 1)
- **Título**: `#1 · Tu sala se volvió bodega`
- **Cuerpo**: `Productos apilados, cinta por todos lados, tu pareja ya no aguanta`
- **Ángulo**: dolor doméstico · empatía
- **Visual**: sala real con cajas invadiendo — foto casual

## Slide 3 (dolor 2)
- **Título**: `#2 · Los pedidos contraentrega son un rompecabezas`
- **Cuerpo**: `Coordinás con el courier, el cliente no paga, pagás flete fallido, pierdes margen`
- **Ángulo**: dolor operativo + financiero
- **Visual**: captura WhatsApp típica con courier pidiendo pago

## Slide 4 (dolor 3)
- **Título**: `#3 · No sabés cuánto estás ganando`
- **Cuerpo**: `Ventas en Shopify, gastos en Excel, inventario en la cabeza. ¿Ganancia real? Misterio.`
- **Ángulo**: dolor financiero
- **Visual**: Excel caótico split con Shopify dashboard

## Slide 5 (dolor 4 + 5 combinado)
- **Título**: `#4 y #5 · Escalar = romper`
- **Cuerpo**: `Arriba de 200 pedidos/mes el modelo casero explota. Empleás a alguien, metés errores, perdés clientes.`
- **Ángulo**: dolor de techo de crecimiento
- **Visual**: gráfico ascendente cortado con X roja

## Slide 6 (CTA)
- **Título grande**: `Esto se soluciona`
- **Cuerpo**: `EffiCommerce · bodega CR + contraentrega automatizada + ERP. Integrás tu Shopify en 10 min.`
- **CTA**: `Agendá demo gratis →`
- **Botón visual**: `efficommerce.com/cr`
- **Visual**: pantalla UI EffiCommerce limpia

## Variantes
- A: copy neutro profesional (default)
- B: modismos tico suaves (mae, pura vida, "a la fija")

## Specs técnicos
- PNG sRGB · nombre `EffiCommerceCR_C1_s[01-06]_[A|B]_v01.png` · peso ≤2MB
- Entrega: Google Drive + upload CMS como asset del requerimiento

## Timeline
Borrador: abr 26 · Aprobación: abr 28 · Entrega: abr 30
$b$,
      'high', 'draft', false, '2026-04-30', '/templates/brief-creativo.md'
    ),
    (
      'design',
      'R-D02 · Carrusel C2 · Cómo funciona EffiCommerce en CR · 6 slides',
      $b$# Carrusel C2 · Funnel A Meta · 1080×1350 (4:5) · 6 slides

**Ángulo general**: educativo / desmitificador. Flujo paso a paso.

## Slide 1 (portada)
- **Texto**: `Cómo funciona EffiCommerce en Costa Rica`
- **Subtexto**: `De tu tienda a la puerta del cliente, en 5 pasos`
- **Visual**: mapa CR con pin bodega + avión China→CR

## Slide 2 (paso 1)
- **Título**: `1 · Importás de China`
- **Cuerpo**: `Contactás proveedor, pagás, y lo mandás directo a nuestra bodega en CR. Nosotros lo recibimos.`
- **Ángulo**: "no te preocupás por la recepción"
- **Visual**: contenedor llegando a bodega

## Slide 3 (paso 2)
- **Título**: `2 · Conectás tu tienda`
- **Cuerpo**: `Shopify, WooCommerce o MercadoLibre. 10 minutos con nuestro equipo de integraciones.`
- **Ángulo**: "ya usás lo que usás"
- **Visual**: logos Shopify + Woo + ML → flecha → logo EffiCommerce

## Slide 4 (paso 3)
- **Título**: `3 · Entra un pedido`
- **Cuerpo**: `Tu cliente compra en tu tienda. EffiCommerce lo detecta, elige el mejor courier, imprime guía, hace picking & packing.`
- **Ángulo**: automatización total
- **Visual**: flowchart simple tienda → sistema → bodega

## Slide 5 (paso 4)
- **Título**: `4 · Despacho con contraentrega`
- **Cuerpo**: `Courier entrega, cobra al cliente, nos deposita. Restamos comisión y te consignamos a vos.`
- **Ángulo**: pago contraentrega sin riesgo
- **Visual**: courier en moto + billete cambiando de manos

## Slide 6 (CTA)
- **Título**: `Todo en una plataforma`
- **Cuerpo**: `EffiCommerce · 20,000+ emprendedores LATAM confiando en nosotros`
- **CTA**: `Pedí tu demo gratis →`
- **Visual**: mockup dashboard EffiCommerce con números reales disfrazados

## Variantes
A neutro / B tico suave.

## Specs
`EffiCommerceCR_C2_s[01-06]_[A|B]_v01.png` · PNG sRGB ≤2MB · Drive + CMS

## Timeline
Borrador: abr 26 · Aprobación: abr 28 · Entrega: abr 30
$b$,
      'high', 'draft', false, '2026-04-30', '/templates/brief-creativo.md'
    ),
    (
      'design',
      'R-D03 · Carrusel C3 · Antes / Después con EffiCommerce · 5 slides',
      $b$# Carrusel C3 · Funnel A Meta · 1080×1350 (4:5) · 5 slides

**Ángulo general**: transformación · aspiracional.

## Slide 1 (portada)
- `De caos a automatización`
- `Lo que cambia cuando usás EffiCommerce`
- Visual: split visual izq-der

## Slide 2 · Antes operación
- **Izq (ANTES)**: `Cajas en tu sala, Excel caótico, WhatsApp con couriers, pedidos perdidos`
- **Der (DESPUÉS)**: `Bodega CR, dashboard único, couriers integrados, 0 pedidos perdidos`

## Slide 3 · Antes tiempo
- **Antes**: `8 horas al día empacando y coordinando`
- **Después**: `2 horas revisando dashboard + planear producto`

## Slide 4 · Antes plata
- **Antes**: `Pagás flete fallido, retail, alquiler de bodega casera`
- **Después**: `Pagás por pedido despachado. Sin fijos.`

## Slide 5 (CTA)
- `Pasá del caos a escalar`
- `Agendá demo · efficommerce.com/cr`
- Visual: dashboard EffiCommerce limpio

## Variantes
A neutro / B tico.

## Specs
`EffiCommerceCR_C3_s[01-05]_[A|B]_v01.png` · PNG sRGB ≤2MB

## Timeline
Borrador: abr 26 · Aprobación: abr 28 · Entrega: abr 30
$b$,
      'high', 'draft', false, '2026-04-30', '/templates/brief-creativo.md'
    ),
    (
      'design',
      'R-D04 · Post feed P1 · Testimonial Sara Montoya · 1:1',
      $b$# Post feed P1 · 1080×1080 (1:1) · Funnel A

## Concepto
Testimonial de autoridad + empatía fundadora.

## Elementos
- **Foto**: Sara Montoya de frente, vestimenta profesional casual · iluminación natural
- **Quote** (tipografía display grande):
  > "En 6 años pasamos de 50 emprendedores a 20,000 en LATAM. El secreto: el dropshipper no puede despachar desde su casa, necesita un socio."
- **Attribution** (abajo): `— Sara Montoya · CEO Grupo Effi`
- **Logo pequeño**: EffiCommerce esquina inferior
- **Fondo**: Navy o Cream según contraste con foto

## Ángulo
Autoridad fundadora + empatía operativa.

## Variantes
- A: foto Sara real (si existe) · quote completo
- B: quote sobre fondo Navy sin foto · más minimalista

## Specs
`EffiCommerceCR_P1_[A|B]_v01.png` · 1080×1080 · PNG sRGB ≤2MB

## Timeline
Borrador: abr 26 · Aprobación: abr 28 · Entrega: abr 30
$b$,
      'high', 'draft', false, '2026-04-30', '/templates/brief-creativo.md'
    ),
    (
      'design',
      'R-D05 · Post feed P2 · Nosotros vs Hacerlo Solo · 1:1',
      $b$# Post feed P2 · 1080×1080 (1:1) · Funnel A

## Concepto
Comparación directa · tabla 2 columnas.

## Columna izquierda · "Hacerlo solo"
- Bodega en tu casa
- Couriers a mano (WhatsApp caótico)
- Excel contabilidad
- 0 multi-país
- Flete fallido = tu plata perdida
- Techo: 200 pedidos/mes

## Columna derecha · "Con EffiCommerce"
- Bodega CR
- 5 couriers integrados
- ERP completo
- Multi-país LATAM
- Contraentrega automatizada
- Sin techo operativo

## CTA
`Pedí tu demo gratis →` · `efficommerce.com/cr`

## Ángulo
Comparación directa · Funnel A dropshipper.

## Variantes
- A: checklist con íconos rojos vs verdes
- B: minimalista sin íconos, solo typo

## Specs
`EffiCommerceCR_P2_[A|B]_v01.png` · 1080×1080 · PNG sRGB ≤2MB

## Timeline
Borrador: abr 26 · Aprobación: abr 28 · Entrega: abr 30
$b$,
      'high', 'draft', false, '2026-04-30', '/templates/brief-creativo.md'
    ),
    (
      'design',
      'R-D06 · Post feed P3 · Pago contraentrega automatizado · 1:1',
      $b$# Post feed P3 · 1080×1080 (1:1) · Funnel A

## Concepto
Feature-benefit principal LATAM: contraentrega automatizada.

## Elementos
- **Visual**: moto courier + $ + checkmark verde · ilustración vectorial estilo plano
- **Texto grande** (hero): `El cliente paga cuando recibe.`
- **Subtexto**: `Vos cobrás sin riesgo.`
- **Explicación pequeña**: `Contraentrega automatizada en 100% del territorio CR`
- **CTA**: `Agendá demo · efficommerce.com/cr`

## Ángulo
Trust + feature diferenciador LATAM.

## Variantes
- A: ilustración vectorial
- B: foto real moto courier

## Specs
`EffiCommerceCR_P3_[A|B]_v01.png` · 1080×1080 · PNG sRGB ≤2MB

## Timeline
Borrador: abr 26 · Aprobación: abr 28 · Entrega: abr 30
$b$,
      'high', 'draft', false, '2026-04-30', '/templates/brief-creativo.md'
    ),
    (
      'design',
      'R-D07 · Story S1 · ¿Despachás desde tu casa? · 9:16',
      $b$# Story S1 · 1080×1920 (9:16) · Funnel A

## Concepto
Hook identificación · pregunta directa.

## Elementos
- **Fondo**: Navy sólido
- **Texto blanco grande** (centrado vertical):
  ```
  ¿Todavía
  despachás desde
  tu casa?
  ```
- **Subtexto** (abajo del hero): `Hay una forma mejor`
- **Sticker CTA visual**: `Mirá cómo →` con flecha animada (si se usa como Reel)
- **Logo**: EffiCommerce esquina inferior derecha

## Ángulo
Identificación dolor + invitación a seguir.

## Variantes
- A: typo grande blanca sobre Navy
- B: misma pregunta pero sobre foto de sala con cajas (más realista)

## Specs
`EffiCommerceCR_S1_[A|B]_v01.png` · 1080×1920 · PNG sRGB ≤2MB
Si se convierte a Reel: export MP4 3-5s, loop.

## Timeline
Borrador: abr 28 · Aprobación: abr 29 · Entrega: abr 30
$b$,
      'high', 'draft', false, '2026-04-30', '/templates/brief-creativo.md'
    ),
    (
      'design',
      'R-D08 · Story S2 · Números EffiCommerce · 9:16',
      $b$# Story S2 · 1080×1920 (9:16) · Funnel A + B

## Concepto
Autoridad con números · stats grandes.

## Elementos
- **Fondo**: Cream con detalles Navy
- **Stats grandes** (uno por sección vertical):
  - `20,000+` · emprendedores
  - `5 países` · activos en LATAM
  - `+100M USD` · facturación
  - `35%` · crecimiento anual
- **CTA abajo**: `EffiCommerce · agendá demo`
- **Logo**: esquina inferior

## Ángulo
Trust + autoridad numérica.

## Variantes
- A: estática con números grandes
- B: animada con counts-up (Reel/Story animado)

## Specs
`EffiCommerceCR_S2_[A|B]_v01.png` · 1080×1920 · PNG sRGB ≤2MB
Versión animada MP4 6-8s si se convierte a Reel.

## Timeline
Borrador: abr 28 · Aprobación: abr 29 · Entrega: abr 30
$b$,
      'high', 'draft', false, '2026-04-30', '/templates/brief-creativo.md'
    ),
    (
      'design',
      'R-D09 · Story S3 · Bodega CR · 9:16',
      $b$# Story S3 · 1080×1920 (9:16) · Funnel A

## Concepto
Ownership operativo · bodega real como diferenciador.

## Elementos
- **Foto**: interior bodega EffiCommerce CR (si existe) · o stock profesional de bodega ordenada
- **Texto over** (superpuesto sobre foto · contraste alto):
  ```
  Tu producto aquí.
  No en tu sala.
  ```
- **CTA**: `Bodega CR activa →`
- **Logo**: esquina

## Ángulo
Diferenciador físico · reduce fricción "¿dónde guardan mi producto?".

## Variantes
- A: foto real bodega CR
- B: ilustración isométrica bodega si no hay foto disponible

## Specs
`EffiCommerceCR_S3_[A|B]_v01.png` · 1080×1920 · PNG sRGB ≤2MB

## Timeline
Borrador: abr 28 · Aprobación: abr 29 · Entrega: abr 30

## Nota
Coordinar con operaciones CR si hay bodega accesible para shooting de 2h. Si no, usar stock premium.
$b$,
      'high', 'draft', false, '2026-04-30', '/templates/brief-creativo.md'
    ),

    -- ==========================================================
    -- AUDIOVISUAL (3)
    -- ==========================================================
    (
      'audiovisual',
      'R-A01 · Video V1 · Sara Montoya · Por qué creamos EffiCommerce · 60s',
      $b$# Video V1 · Sara Montoya · 60s · 9:16 + 1:1 + 16:9

## Guion creador (lo que dice Sara frente a cámara)

```
[0-5s]
Hace 6 años, Juan y yo empezamos con un problema muy simple.

[5-15s]
Los emprendedores latinos querían vender por internet, pero despachaban
desde su casa. Se ahogaban antes de llegar a los 100 pedidos al mes.

[15-25s]
Entonces construimos EffiCommerce: una bodega, un software y un equipo
de logística que le quitaba al emprendedor la parte operativa.

[25-35s]
Hoy somos 20 mil emprendedores en 5 países. Colombia, Ecuador,
República Dominicana, Guatemala y ahora con todo en Costa Rica.

[35-50s]
Si vendés online y sentís que la operación te come más de lo que
facturás, agendate una demo. En 30 minutos te mostramos cómo lo hacemos.

[50-60s]
Hacemos lo que vos no tenés por qué hacer. Vos vendés. Nosotros
despachamos.
```

## Guion visual (cámara y producción)

| Tiempo | Plano | Locación | Props / talento |
|---|---|---|---|
| 0-5s | Close-up Sara, plano a la altura de ojos, background desenfocado | Oficina Effi con ventana natural | Sara con camisa blanca/beige corporativa |
| 5-15s | Sara sentada en oficina, plano medio. Insert 1s: caja casera + Excel caótico (b-roll) | Oficina + B-roll bodega casera | Caja marrón, Excel en laptop |
| 15-25s | Sara de pie, plano medio, movimiento cámara mano derecha señalando | Oficina Effi | — |
| 25-35s | Sara plano abierto, cambio a tomas de mapa LATAM animado con pines (5 países) | Motion graphics post | Mapa CR resaltado |
| 35-50s | Sara close-up íntimo · mirada directa | Oficina Effi | — |
| 50-60s | Sara smile + cartel EffiCommerce al fondo aparece en post | Oficina Effi | Sara con celular mostrando UI |

**Cámara**: 1 DSLR + lente 50mm o 85mm, tripod fijo. Micrófono lavalier.
**Iluminación**: soft box frontal + rebote lateral. Evitar sombras fuertes.
**Vestuario Sara**: corporate smart-casual, camisa sólida beige/blanco/navy.

## Guion edición (post-producción)

| Segmento | Edit | On-screen text | Música |
|---|---|---|---|
| 0-5s | Hook: zoom in sutil + tipografía aparece | "Hace 6 años..." (fade in bottom) | Intro suave piano |
| 5-15s | Cortes 1s con b-roll · split screen 3s | "Caja en tu sala ≠ escalar" | Build up sutil |
| 15-25s | Cortes cada 3s · gráfico aparece (bodega + software + equipo) | Keywords: "Bodega · Software · Logística" | Sostiene |
| 25-35s | Mapa LATAM animado pines encendiéndose en orden (CO, EC, RD, GT, CRI) | "20,000 · 5 países · $100M+" | Crescendo |
| 35-50s | Plano íntimo sostenido, captions claros | Caption: "Si vendés online..." | Piano sostenido |
| 50-60s | Logo lockup final + CTA + URL | "EffiCommerce · agendá demo gratis" + URL | Resolución |

**Captions**: burned-in español CR, font Inter Bold, contraste alto.
**Color grading**: warm-neutral, tonos Effi Navy en transiciones.
**Duración tolerancia**: 58-62s.

## Specs técnicos entrega
- Cámara 4K · 25/30 fps · Audio -14 LUFS
- Exports: 1080×1920 (9:16) + 1080×1080 (1:1) + 1920×1080 (16:9)
- MP4 H.264 · ≤30 MB por archivo
- Captions burned-in + SRT separado

## Timeline
Agenda Sara: abr 22 · Script aprobado: abr 25 · Rodaje: abr 28 · Post: abr 30-may 2 · Entrega: may 4

## Criterios aprobación
- [ ] Script aprobado por estratega + Sara
- [ ] Vestuario y locación validados
- [ ] 3 exports finales (9:16, 1:1, 16:9)
- [ ] Captions correctos
- [ ] Audio normalizado
$b$,
      'high', 'draft', true, '2026-05-04', '/templates/brief-creativo.md'
    ),
    (
      'audiovisual',
      'R-A02 · Video V2 · Juan Carmona · Cómo funciona el contraentrega · 45s',
      $b$# Video V2 · Juan Carmona · 45s · 9:16 + 1:1 + 16:9

## Guion creador (Juan frente a cámara)

```
[0-4s]
¿Sabés por qué el 70% de las compras online en LATAM son
contraentrega? Porque la gente no confía en pagar sin ver el producto.

[4-12s]
El problema es que manejar contraentrega a mano es un infierno: coordinás
con el courier, el cliente no paga, pagás flete fallido, y perdés margen.

[12-25s]
En EffiCommerce lo automatizamos. Entra un pedido a tu tienda Shopify,
MercadoLibre o WooCommerce. Elegimos el mejor courier de Costa Rica,
imprimimos guía, y despachamos.

[25-35s]
El courier entrega, cobra al cliente, y nos deposita. Restamos comisión
y te consignamos la plata a tu cuenta. Todo automático.

[35-45s]
Integración en 10 minutos. Demo gratis. Link en la bio.
```

## Guion visual

| Tiempo | Plano | Locación | Props |
|---|---|---|---|
| 0-4s | Juan plano medio apuntando a cámara con energía | Bodega EffiCommerce CR (si posible) o oficina con cajas | Camisa polo EffiCommerce |
| 4-12s | Juan plano medio serio · insert 3s B-roll: WhatsApp caótico con courier | Oficina · B-roll celular | — |
| 12-25s | Juan explicando · screencast celular grande al lado mostrando flujo UI | Oficina + mockup en post | Celular con UI |
| 25-35s | Juan + gráfico animado post: moto → $$ → cuenta bancaria | Motion post | Mockup comprobante depósito |
| 35-45s | Juan close-up CTA | Oficina | Celular con landing |

**Vestuario Juan**: polo navy con logo EffiCommerce sutil o camisa lisa. Corporate-accesible.
**Energía**: más directa y rápida que Sara. Ritmo ágil.

## Guion edición

| Tiempo | Edit | On-screen text | Música |
|---|---|---|---|
| 0-4s | Hook · zoom in · aparece "70%" grande | "70% de compras LATAM = contraentrega" | Beat moderno |
| 4-12s | Cortes cada 1.5s con ícono whatsapp caótico | Tags flotando: "courier · fallido · margen" | Sostiene |
| 12-25s | Screencast demo flujo paso a paso · overlay icons Shopify/Woo/ML | Lista animada: "Shopify · WooCommerce · MercadoLibre" | Build |
| 25-35s | Motion graphics simple · flecha animada | Diagrama: Cliente → Courier → EffiCommerce → Vos | Climax |
| 35-45s | Logo + CTA grande · URL subtitle | "Demo gratis · efficommerce.com/cr" | Resolución |

## Specs técnicos
- Cámara 4K · 25/30 fps · Audio -14 LUFS
- Exports: 9:16 + 1:1 + 16:9
- MP4 H.264 · ≤30 MB
- Captions burned-in + SRT

## Timeline
Agenda Juan: abr 22 · Script aprobado: abr 25 · Rodaje: abr 28 (mismo día que V1) · Post: abr 30-may 2 · Entrega: may 4

## Criterios aprobación
- [ ] Script aprobado por estratega + Juan
- [ ] Screencast UI disfrazando datos reales
- [ ] 3 exports finales
- [ ] Audio y captions OK
$b$,
      'high', 'draft', true, '2026-05-04', '/templates/brief-creativo.md'
    ),
    (
      'audiovisual',
      'R-A03 · Video V3 · Empleado CS · Tour dashboard · 30s',
      $b$# Video V3 · Empleado Customer Success · 30s · 9:16 + 1:1 + 16:9

## Casting
Empleado real del equipo CS o producto (persona con buena cámara). Si no hay disponibilidad, actor empleado corporativo con polo EffiCommerce.

## Guion creador

```
[0-3s]
Te muestro el dashboard de EffiCommerce en 30 segundos.

[3-10s]
Acá ves todos tus pedidos en tiempo real. De Shopify, Woo, MercadoLibre.
Todos juntos.

[10-17s]
Este es tu inventario vivo. Sabés qué hay en bodega CR, qué sale hoy,
qué queda.

[17-24s]
Y acá tu tesorería: cobros contraentrega pendientes, depósitos a tu
cuenta, comisiones. Claro y ordenado.

[24-30s]
Eso es EffiCommerce. Agendá demo, te lo mostramos con tu caso.
```

## Guion visual

| Tiempo | Plano | Contenido |
|---|---|---|
| 0-3s | Empleado plano medio señalando pantalla | Intro ultra corto |
| 3-10s | Screencast pantalla EffiCommerce · módulo pedidos | Demo live UI |
| 10-17s | Screencast módulo inventario | Stocks en tiempo real |
| 17-24s | Screencast tesorería · balance | Números (disfrazados si son reales) |
| 24-30s | Empleado CTA · logo | Cierre |

**Estilo**: screencast 80% · talking head 20% · ritmo rápido de tutorial.

## Guion edición

| Tiempo | Edit | On-screen text |
|---|---|---|
| 0-3s | Zoom in UI · título grande | "Tour dashboard · 30s" |
| 3-10s | Cursor animado resalta pedidos · logos plataformas | "Pedidos unificados" |
| 10-17s | Highlights verdes en stocks | "Inventario CR en tiempo real" |
| 17-24s | Números animados count-up | "Cobros · Depósitos · Comisiones" |
| 24-30s | Logo + CTA + URL | "Agendá demo · efficommerce.com/cr" |

**Música**: electrónica tutorial moderna, tempo 110 bpm.

## Specs técnicos
- Screencast 1080p nativo · talking head 4K
- Exports: 9:16 + 1:1 + 16:9
- MP4 H.264 · ≤20 MB

## Disclaimer legal
Si el empleado es actor/colaborador externo: agregar "Dramatización con colaborador del equipo" en micro-copy.

## Timeline
Casting: abr 23 · Script aprobado: abr 25 · Rodaje: abr 29 (media jornada) · Post: abr 30-may 2 · Entrega: may 4

## Criterios aprobación
- [ ] Casting empleado confirmado
- [ ] Script aprobado
- [ ] Screencast con datos disfrazados si son reales
- [ ] 3 exports finales
- [ ] Disclaimer si aplica
$b$,
      'high', 'draft', true, '2026-05-04', '/templates/brief-creativo.md'
    ),

    -- ==========================================================
    -- TRAFFICKER (8)
    -- ==========================================================
    (
      'trafficker',
      'R-T01 · Setup Meta Business Manager CR + Pixel + CAPI vía n8n',
      $b$# Setup Meta Business Manager Costa Rica

## Entregables
- BM Meta CR creado o importado (ID compartido con estratega)
- Pixel EffiCommerce CR instalado en landing
- CAPI (Conversions API) vía n8n webhook · server-side events
- Dataset quality ≥7.5 en Events Manager
- QA con Tag Assistant confirmando dedupe

## Pasos
1. Crear/confirmar Business Manager Meta para CR
2. Crear Pixel "EffiCommerce CR" · instalar GTM tag base
3. Configurar eventos estándar: PageView, ViewContent, Lead, Schedule, Contact
4. Configurar CAPI:
   - Server-side via n8n webhook
   - Token CAPI guardado en n8n Vars
   - Hashing SHA256 de email + phone antes de enviar
   - Event_id compartido con Pixel para deduplicación
5. Consent Mode v2 integrado (ver R-T03)
6. QA end-to-end con Tag Assistant + Events Manager antes de gastar $1

## Criterios aprobación
- [ ] Pixel instalado y verificado
- [ ] CAPI recibiendo eventos con dedupe <20%
- [ ] Event match quality ≥7.5
- [ ] Consent Mode v2 respetado (no envía eventos sin consent analytics)
- [ ] Domain verification OK para efficommerce.com

## Bloqueante para
R-T05, R-T06 (campañas Meta)

## Timeline
abr 22 - abr 26 (bloqueante setup)

## Documentación
- Docs Meta CAPI: https://developers.facebook.com/docs/marketing-api/conversions-api
- n8n flow template: `sistema/n8n-flows/meta-capi-webhook.json` (crear si no existe)
$b$,
      'urgent', 'in_production', true, '2026-04-26', '/templates/checklist-meta-ads.md'
    ),
    (
      'trafficker',
      'R-T02 · Setup Google Ads CR + Enhanced Conversions',
      $b$# Setup Google Ads Costa Rica

## Entregables
- Cuenta Google Ads CR vinculada a MCC
- Enhanced Conversions activado (email/phone hashed)
- Auto-tagging activado
- Conversion actions configuradas
- Link a GA4 property CR
- Consent Mode v2 compatible

## Pasos
1. Crear/vincular cuenta Google Ads CR al MCC Grupo Effi
2. Configurar billing en USD
3. Crear conversion actions:
   - `Lead_Landing_A` (form Funnel A)
   - `Lead_Landing_B` (form Funnel B)
   - `Demo_Scheduled` (calendario agendado)
   - `WhatsApp_Click` (micro-conversión)
4. Activar Enhanced Conversions · importar desde website (gtag)
5. Activar auto-tagging
6. Linkear a GA4 property `efficommerce-cr`
7. Audiencias primera fiesta:
   - Visitors 7d, 30d, 90d
   - Lead completers 90d (LAL seeds)
8. QA con Tag Assistant

## Criterios aprobación
- [ ] Cuenta activa con billing
- [ ] 4+ conversion actions configuradas y disparando
- [ ] Enhanced Conversions con match rate ≥65%
- [ ] GA4 link OK
- [ ] Audiencias primera fiesta creciendo

## Bloqueante para
R-T07, R-T08 (campañas Google)

## Timeline
abr 22 - abr 26
$b$,
      'urgent', 'in_production', true, '2026-04-26', '/templates/checklist-google-ads.md'
    ),
    (
      'trafficker',
      'R-T03 · Setup GTM + GA4 + Consent Mode v2',
      $b$# Setup GTM + GA4 + Consent Mode v2

## Entregables
- GTM container para efficommerce.com/cr
- GA4 property `EffiCommerce CR 2026`
- Consent Mode v2 implementado (CMP Cookiebot o Iubenda)
- Checkbox Ley 8968 (CR) separado del consent analytics
- Eventos custom: scroll_depth, video_watch, cta_click

## Pasos
1. Crear GTM container · instalar en landing (R-W01)
2. Crear GA4 property con Data Stream efficommerce.com/cr
3. Integrar CMP (Cookiebot recomendado):
   - Categorías: Necesarias (on), Analytics, Marketing
   - Default: denied all non-necessary (Consent Mode v2)
   - Banner en español CR con texto Ley 8968
4. Tags GTM:
   - GA4 config (respeta consent)
   - Meta Pixel (marketing consent)
   - Google Ads tag (marketing consent)
   - LinkedIn Insight (si aplica)
5. Triggers custom: scroll 50%, video 25%, CTA click
6. DataLayer standard + e-commerce events (para Funnel B)
7. QA con Tag Assistant + Preview mode

## Criterios aprobación
- [ ] GA4 property activa recibiendo eventos
- [ ] CMP funciona: default denied → tags no disparan
- [ ] Al dar consent: tags disparan correctamente
- [ ] Ley 8968 checkbox separado visible
- [ ] Eventos custom disparando

## Bloqueante para
R-W01 (landing necesita GTM instalado antes de lanzar)

## Timeline
abr 22 - abr 26
$b$,
      'urgent', 'in_production', true, '2026-04-26', '/templates/brief-creativo.md'
    ),
    (
      'trafficker',
      'R-T04 · Setup WhatsApp Business API + 6 plantillas MARKETING',
      $b$# Setup WhatsApp Business API · EffiCommerce CR

## Entregables
- WABA (WhatsApp Business API) vía Twilio o 360dialog
- Número CR dedicado o verified business
- 6 plantillas MARKETING aprobadas por Meta
- Webhook n8n conectado a Supabase `admin_effix_leads`
- Handoff a humano en primer inbound cliente

## Proveedor
Twilio (preferido · ya hay cuenta Grupo Effi) o 360dialog si precio mejor.

## 6 plantillas a crear

### T1 · welcome_lead_funnel_a
```
Hola {{1}}! Gracias por dejarnos tus datos en EffiCommerce CR.
En 24h te contactamos con tu diagnóstico personalizado.
Mientras tanto, te paso 3 recursos gratuitos:
→ Calculadora de CPL
→ Guía de pricing contraentrega CR
→ Caso de Melissa (pasó de 60 a 400 pedidos/mes)
¿Querés recibirlos? Respondé SI.
```

### T2 · welcome_lead_funnel_b
```
Hola {{1}}, gracias por tu interés en EffiCommerce para tu tienda establecida.
Somos especialistas en ERP ecommerce multi-país.
¿Preferís: (a) una demo de 30 min con nuestro líder, o (b) un reporte escrito de diagnóstico?
Respondé A o B.
```

### T3 · reminder_demo_d1
```
Hola {{1}}, te recuerdo que mañana {{2}} tenemos tu demo EffiCommerce a las {{3}}.
Link: {{4}}
¿Confirmás? Respondé SI o cambiar.
```

### T4 · nurturing_d2_testimonial
```
{{1}}, te comparto el testimonial de Diego (dropshipper de 400 pedidos/mes):
{{2}} (video)
En 6 semanas bajó sus horas operativas de 8h/día a 2h/día.
¿Querés ver tu diagnóstico personalizado? Agendá aquí: {{3}}
```

### T5 · nurturing_d5_case
```
{{1}}, caso real: Melissa (Escazú) · pasó de 60 a 400 pedidos/mes en 4 meses
sin contratar empleados. EffiCommerce se encarga de todo.
Agendemos 30 min para analizar tu caso: {{2}}
```

### T6 · final_no_response_d7
```
{{1}}, último mensaje de nuestra parte.
Si EffiCommerce no es para vos ahora, no hay problema.
Si querés revisar en el futuro, guardá este contacto o escribinos.
¡Éxitos con tu ecommerce! 🚀
```

## Configuración técnica
- Webhook inbound → n8n flow `wa-inbound-router.json`
- Router decide: welcome, follow-up, handoff humano
- Handoff humano = primer mensaje no plantilla del cliente · notifica SDR en Slack
- Sesión 24h window aprovechada para free-form

## Criterios aprobación
- [ ] WABA aprobada por Meta
- [ ] 6 plantillas aprobadas (category: MARKETING)
- [ ] Webhook n8n probado end-to-end
- [ ] Handoff humano probado (SDR recibe notif en Slack)
- [ ] Inserción en `admin_effix_leads` OK

## Bloqueante para
R-W05 (bot WhatsApp n8n depende de WABA live)

## Timeline
abr 22 (submit plantillas) · abr 25 (aprobación esperada Meta 48-72h) · abr 26 (integración n8n lista)
$b$,
      'urgent', 'in_production', true, '2026-04-26', '/templates/brief-creativo.md'
    ),
    (
      'trafficker',
      'R-T05 · Campaña Meta Funnel A · 9 ads (3 videos × 3 var)',
      $b$# Campaña Meta Funnel A · 9 ads

## Objetivo
Leads · Funnel A · dropshippers ecommerce · Costa Rica

## Estructura
- **1 Campaign**: `[Leads] EffiCommerceCR | Funnel A | Fase 1`
- **3 Ad Sets** (geo-interest combos):
  - AS1: CR urbana 25-45 · interest dropshipping + shopify
  - AS2: CR urbana 25-45 · interest mercadolibre + ecommerce
  - AS3: CR urbana 25-45 · lookalike lead completers seed 1%
- **9 Ads** por Ad Set (mismo pool):
  - Ad1-3: Video V1 (Sara) + 3 copys distintos
  - Ad4-6: Video V2 (Juan) + 3 copys
  - Ad7-9: Video V3 (Empleado) + 3 copys

## Presupuesto
$400 USD/mes · pacing diario $13.33
- AS1: 40%
- AS2: 30%
- AS3: 30% (LAL es clave para escalar después)

## Copy per ad (templates)
### Ad 1 (V1 Sara + copy A)
**Primary text**:
"En 6 años pasamos de 50 a 20,000 emprendedores. El secreto fue dejar de despachar desde casa. Mirá cómo lo hacemos →"
**Headline**: EffiCommerce CR · bodega + contraentrega automatizada
**Description**: Demo gratis · integrás en 10 min
**CTA button**: Agendar

### Ad 2 (V1 Sara + copy B — tico)
**Primary**: "Mae, si despachás desde tu casa y ya no das abasto, leé esto. EffiCommerce CR te libera la operación. Demo gratis."
**Headline**: Pasá del caos a escalar
**Description**: 20,000 emprendedores LATAM ya lo hicieron

(patrón similar para Ad3-9)

## Tracking
- Pixel + CAPI event: `Lead` (valor: 50 USD promedio)
- UTMs: `utm_source=meta&utm_medium=paid&utm_campaign=funnel-a-q2&utm_content=ad-{NN}`

## Criterios aprobación
- [ ] Creativos aprobados (R-A01, R-A02, R-A03 entregados)
- [ ] Pixel + CAPI funcionando
- [ ] UTMs validados hacia landing
- [ ] 9 ads con estado Active

## Bloqueantes
R-T01 (Meta setup) · R-A01/02/03 (videos) · R-W01 (landing)

## Timeline
Build: may 5 · Launch: may 8 · Primer check: may 15
$b$,
      'high', 'draft', true, '2026-05-08', '/templates/checklist-meta-ads.md'
    ),
    (
      'trafficker',
      'R-T06 · Campaña Meta Funnel B · 14 ads (videos + estáticos)',
      $b$# Campaña Meta Funnel B · 14 ads

## Objetivo
Leads B2B · tiendas ecommerce establecidas · ticket alto · Costa Rica

## Estructura
- **1 Campaign**: `[Leads] EffiCommerceCR | Funnel B | Fase 1`
- **2 Ad Sets**:
  - AS1: CR urbana 30-55 · interest Shopify + Odoo + SAP
  - AS2: CR urbana 30-55 · LinkedIn audiences (import · dueños ecommerce LATAM)
- **14 Ads** pool:
  - Ad1-6: 2 videos explainer × 3 variantes copy
  - Ad7-14: 4 estáticos × 2 variantes (posts P1-P3 + carrusel C2)

## Presupuesto
$200 USD/mes · pacing diario $6.67
- AS1: 60%
- AS2: 40%

## Copy (Funnel B: tono más ejecutivo)
### Ad 1 (Video Sara)
**Primary**: "Si tenés tienda Shopify con más de 500 pedidos/mes, tu ERP actual te queda chico. EffiCommerce consolida inventario, tesorería, CRM y multi-país en una sola plataforma."
**Headline**: ERP ecommerce LATAM · no genérico
**Description**: Demo 30 min · caso real
**CTA**: Agendar demo

### Ad 7 (P2 tabla Nosotros vs Solo)
**Primary**: "Comparación real · Shopify solo vs Shopify + EffiCommerce. ¿Dónde estás?"
(imagen P2 tabla)

## Tracking
- Pixel + CAPI event: `Lead` (valor: 300 USD — ticket Funnel B mayor)
- UTMs: `utm_source=meta&utm_medium=paid&utm_campaign=funnel-b-q2&utm_content=ad-{NN}`

## Criterios aprobación
- [ ] Creativos listos (R-D04, R-D05, R-D06, R-D02)
- [ ] Pixel + CAPI event Lead valor diferenciado
- [ ] UTMs OK
- [ ] 14 ads activas

## Bloqueantes
R-T01 · creativos D2, D4, D5, D6, A01

## Timeline
Build: may 10 · Launch: may 15 · Primer check: may 22
$b$,
      'high', 'draft', true, '2026-05-15', '/templates/checklist-meta-ads.md'
    ),
    (
      'trafficker',
      'R-T07 · Campaña Google Funnel A · 4 Ad Groups · 60H + 16D',
      $b$# Campaña Google Ads Funnel A · 4 Ad Groups

## Objetivo
Leads · Funnel A · dropshippers ecommerce · Costa Rica · Search + Performance Max

## Estructura
**Campaign 1** (Search): `[SEA] EffiCommerceCR | Funnel A`
**Ad Groups**:
- AG1: "bodega para ecommerce costa rica"
- AG2: "contraentrega automatizada cr"
- AG3: "shopify + logística cr"
- AG4: "dropshipping costa rica"

**Campaign 2** (Performance Max — activar en G3 cuando haya ≥30 conversiones)

## Headlines (60 total · 15 por AG)
### AG1 Headlines
1. Bodega para ecommerce CR
2. Dejá de despachar desde casa
3. EffiCommerce bodega CR
4. Logística ecommerce Costa Rica
5. Almacenamiento e-commerce CR
6. Tu bodega en 5 países
7. Bodega + contraentrega CR
8. 20,000 emprendedores confían
9. Integración Shopify CR
10. Demo gratis EffiCommerce
11. Automatizá tu fulfillment
12. Del caos a escalar
13. Dropshipper CR bodega
14. Multi-courier integrado CR
15. Agendá 30 min · demo

(AG2-AG4 patrón similar alineado al keyword cluster)

## Descriptions (16 total · 4 por AG)
### AG1 Descriptions
1. Bodega en CR, contraentrega automatizada, integración Shopify. 20k emprendedores. Demo gratis.
2. Recibimos, guardamos y despachamos desde bodega CR con multi-courier integrado.
3. ERP + logística + bodega en una sola plataforma. 5 países LATAM.
4. Agendá 30 min de demo gratis. Integrás tu tienda en 10 minutos.

## Presupuesto
$250 USD/mes (60% del Google budget)
- AG1: 30% · AG2: 25% · AG3: 25% · AG4: 20%

## Bidding
- Inicial: Maximize Clicks con CPC max $0.80
- Después de 30+ conversiones: Target CPA $30

## Extensiones
- Sitelinks: Demo, Precios, Casos, Bodega CR
- Callouts: 20k emprendedores · 5 países · 10 min integración · Contraentrega auto
- Structured: Services = Bodega, ERP, Dropshipping, Multi-país
- Call extension: número CR

## Tracking
- Enhanced Conversions activo (R-T02)
- Conversion action: `Lead_Landing_A`

## Criterios aprobación
- [ ] 60 headlines cargadas con diversidad
- [ ] 16 descriptions
- [ ] Extensiones completas
- [ ] Quality Score ≥6 en semana 2
- [ ] CPL ≤$5 en semana 2 · ≤$3 target

## Bloqueantes
R-T02 (Google Ads setup) · R-W01 (landing) · R-W02 (diagnóstico form)

## Timeline
Build: may 5 · Launch: may 8 · QS check: may 22
$b$,
      'high', 'draft', true, '2026-05-08', '/templates/checklist-google-ads.md'
    ),
    (
      'trafficker',
      'R-T08 · Campaña Google Funnel B · 3 Ad Groups · 45H + 12D',
      $b$# Campaña Google Ads Funnel B · 3 Ad Groups

## Objetivo
Leads B2B · ERP ecommerce establecidas · Costa Rica · Search

## Estructura
**Campaign**: `[SEA] EffiCommerceCR | Funnel B`
**Ad Groups**:
- AG1: "erp ecommerce costa rica"
- AG2: "shopify consolidado multi país"
- AG3: "software contabilidad tienda online cr"

## Headlines (45 total · 15 por AG)
### AG1 Headlines
1. ERP ecommerce CR especializado
2. No es Odoo · es ecommerce
3. ERP + logística + multi-país
4. Consolidá inventario + tesorería
5. ERP pensado para ecommerce
6. Multi-país LATAM en 1 sistema
7. EffiCommerce ERP + logística
8. Dejá Excel, usá ERP real
9. Shopify + ERP sin código
10. 5 países en 1 plataforma
11. Demo ejecutiva 30 min
12. Caso real: 800 pedidos/mes
13. ERP ecommerce sin friction
14. Agendá demo personalizada
15. Multi-POS online+físico

(AG2-AG3 patrón similar)

## Descriptions (12 · 4 por AG)
### AG1
1. ERP ecommerce LATAM. Consolidá inventario, tesorería, CRM, multi-país. Demo gratis.
2. No es Odoo ni SAP. Es EffiCommerce · ecommerce + logística integrada.
3. 5 países, 1 plataforma. 20k emprendedores LATAM. Demo 30 min.
4. Dejá los 3 sistemas desconectados. Unificá todo en EffiCommerce.

## Presupuesto
$100 USD/mes (resto del Google budget)
- AG1: 40% · AG2: 35% · AG3: 25%

## Bidding
- Inicial: Maximize Clicks CPC max $1.20 (ticket B2B mayor)
- Target CPA después: $80 (ticket mayor justifica CPL mayor)

## Extensiones
- Sitelinks: Demo ejecutiva, Caso B2B, Multi-país, Pricing enterprise
- Callouts: Multi-país · ERP especializado · Onboarding dedicado

## Tracking
- Conversion action: `Lead_Landing_B`
- Valor diferenciado: $300 USD promedio

## Criterios aprobación
- [ ] 45 headlines cargadas
- [ ] 12 descriptions
- [ ] Quality Score ≥6
- [ ] CPL ≤$15 (B2B tolera mayor CPL)

## Bloqueantes
R-T02 · R-W01 · R-W03 (auditoría Shopify form)

## Timeline
Build: may 12 · Launch: may 15
$b$,
      'high', 'draft', true, '2026-05-15', '/templates/checklist-google-ads.md'
    ),

    -- ==========================================================
    -- DEV WEB (5)
    -- ==========================================================
    (
      'dev_web',
      'R-W01 · Landing principal /cr · dual funnel A+B',
      $b$# Landing principal efficommerce.com/cr

## Stack
- Vite + HTML + Tailwind CSS + vanilla JS (stack probado)
- **No heredar branding Feria Effix** · usar paleta EffiCommerce propia (R-E03)
- Hosting: Vercel · custom domain efficommerce.com/cr (subdirectorio)

## Estructura (secciones)
1. **Hero**: "Automatizá tu ecommerce en CR" · dual CTA (Soy dropshipper / Tengo tienda establecida)
2. **Social proof band**: 20,000+ emprendedores · 5 países · $100M+ facturación
3. **Problem section** (dinámico por funnel seleccionado)
4. **How it works** · 5 pasos (mismos del C2)
5. **Features grid**: bodega CR · contraentrega · ERP · multi-courier · integraciones
6. **Video embed** (V1 Sara como hero video)
7. **Casos reales**: Melissa + Diego + Dra Andrea (3 casos 1 por persona)
8. **Pricing o "Cómo empezar"**
9. **Form de captura** (Funnel A simple · Funnel B con más campos)
10. **FAQ** · 8 preguntas frecuentes CR
11. **Footer** con legales Ley 8968, privacidad, contacto

## Copy source
`marcas/efficommerce/costa-rica/assets/landing-cr/copy-deck-cr.md` (16 secciones escritas)

## Selector dual Funnel
Toggle A/B en hero que modifica:
- Pain section
- Features destacados
- Form fields
- CTA copy

## Responsive
Mobile-first · breakpoints 640/768/1024/1280

## Performance
- LCP <2.5s
- CLS <0.1
- Fuentes: Inter Tight + Inter via Google Fonts preload
- Imágenes: WebP + AVIF · lazy load debajo del fold

## Tracking
- GTM container instalado (R-T03)
- DataLayer events: `page_view`, `cta_click`, `form_start`, `form_submit`
- Pixel + CAPI para Meta · Google tag

## Criterios aprobación
- [ ] Copy deck completo aplicado
- [ ] Dual funnel toggle funciona
- [ ] GTM + GA4 + Pixel disparando eventos
- [ ] Consent Mode v2 respetado
- [ ] Lighthouse ≥90 performance · 100 accessibility
- [ ] Legales Ley 8968 presentes

## Bloqueantes
R-T03 (GTM) · R-E03 (brand guide) · R-D01-D09 (algunos assets reutilizados)

## Timeline
Build: abr 28 - may 2 · QA: may 3 · Deploy: may 4 · Public launch: may 8
$b$,
      'urgent', 'in_production', true, '2026-05-04', '/templates/propuesta-landing.md'
    ),
    (
      'dev_web',
      'R-W02 · Página /cr/diagnostico-factura-44 · form 6Q + score',
      $b$# Página /cr/diagnostico-factura-44

## Propósito
Lead magnet · diagnóstico rápido para prospect Funnel A. Entrega score personalizado + plan por WhatsApp.

## Flujo usuario
1. Landing pill "Haz tu diagnóstico gratis" → /cr/diagnostico-factura-44
2. Form 6 preguntas (radio/select · NO abiertas)
3. Submit → cálculo score client-side → página resultado con score
4. Resultado incluye CTA: "Recibí tu plan personalizado por WhatsApp"
5. Click WA → abre wa.me con prefill → WABA T1 (R-T04) se dispara

## Las 6 preguntas
1. **Volumen mensual de pedidos**
   - <50 (5pts) · 50-200 (10pts) · 200-500 (15pts) · 500-2000 (20pts) · 2000+ (10pts · fuera de ICP)
2. **¿Dónde guardás producto?**
   - Mi casa (20pts) · Bodega alquilada <30m² (15pts) · Bodega >30m² (10pts) · Ya tengo 3PL (5pts)
3. **¿Usás contraentrega?**
   - 100% CE (20pts) · >50% CE (15pts) · <50% (10pts) · 0% solo tarjeta (5pts)
4. **¿Cuántos couriers manejás?**
   - 1 (20pts) · 2 (15pts) · 3 (10pts) · 4+ (5pts)
5. **¿Cómo llevás inventario y contabilidad?**
   - Excel (20pts) · Shopify solo (15pts) · 2 sistemas (10pts) · ERP real (5pts)
6. **¿Tu volumen está creciendo?**
   - +50% últimos 3m (20pts) · +20% (15pts) · Plano (10pts) · Bajando (5pts)

## Cálculo score
Score total 6-120. Segmentación:
- 90-120: **"Caso crítico · necesitás EffiCommerce ahora"** · prioridad alta SDR
- 60-89: **"Tenés fricción operativa · EffiCommerce te ahorra horas"**
- 30-59: **"Vas bien · podemos acelerar tu crecimiento"**
- <30: **"Tu operación es limpia · vemos si encajamos"**

## Tracking
- DataLayer: `diagnostico_start`, `diagnostico_complete`, `diagnostico_wa_click`
- Pixel event: `ViewContent` (start), `CompleteRegistration` (submit)
- GA4 custom event con parámetro `score_bucket`

## Criterios aprobación
- [ ] Form responsivo, 6 preguntas, sin campos de texto libre
- [ ] Score calcula en <100ms
- [ ] Página resultado con segmentación correcta
- [ ] CTA WhatsApp abre con prefill funcional
- [ ] Eventos disparando en GA4 + Pixel

## Bloqueantes
R-W01 (landing base) · R-T04 (WABA)

## Timeline
Build: may 3-5 · QA: may 6 · Launch: may 8
$b$,
      'high', 'in_production', true, '2026-05-08', '/templates/propuesta-landing.md'
    ),
    (
      'dev_web',
      'R-W03 · Página /cr/auditoria-shopify · form URL + 5Q · reporte 24h',
      $b$# Página /cr/auditoria-shopify

## Propósito
Lead magnet Funnel B · auditoría Shopify para tiendas establecidas. Entrega reporte escrito en 24h.

## Flujo usuario
1. Landing pill "Auditá tu Shopify gratis" → /cr/auditoria-shopify
2. Form:
   - URL de tu tienda (validación regex)
   - Email corporativo
   - Teléfono CR
   - 5 preguntas específicas
3. Submit → página "Reporte en 24h"
4. Webhook n8n dispara:
   - Inserta en `admin_effix_leads` con profile_type=B
   - Genera análisis automático (scraping público + Shopify API si disponible)
   - Asigna a SDR B2B
   - Envía WABA T2

## 5 preguntas
1. **Facturación mensual aproximada** (rango): <$10k · $10-50k · $50-100k · $100k+
2. **Mercados vendés hoy**: Solo CR · CR+centroamérica · multi-LATAM · global
3. **Mayor pain operativo** (selección): Inventario · Tesorería · Multi-país · Reporting · Integraciones
4. **Sistemas actuales** (multi): Shopify · Woo · ML · Odoo · SAP · Excel · Otro
5. **Nivel de urgencia**: "Lo necesito ya" · "Próximos 3 meses" · "Explorando"

## Reporte 24h
- PDF personalizado con:
  - Auditoría técnica pública del site (velocidad, SEO básico, trust signals)
  - Recomendaciones consolidación ERP
  - Propuesta EffiCommerce específica según pain #3
  - CTA demo ejecutiva

## Tracking
- DataLayer: `auditoria_start`, `auditoria_complete`
- Pixel `Lead` con valor 300 USD
- GA4 event `auditoria_b2b_submit`

## Criterios aprobación
- [ ] Form con validación URL + email + phone
- [ ] Submit dispara webhook n8n → Supabase OK
- [ ] Página confirmación "Reporte en 24h"
- [ ] SDR B2B notificado en Slack
- [ ] Template PDF diseñado y listo
- [ ] Reporte generado y enviado en <24h

## Bloqueantes
R-W01 · R-T04 · template reporte PDF (Design)

## Timeline
Build: may 5-7 · Template PDF: may 5-7 paralelo · QA: may 8 · Launch: may 10
$b$,
      'high', 'in_production', true, '2026-05-10', '/templates/propuesta-landing.md'
    ),
    (
      'dev_web',
      'R-W04 · Thank you pages /cr/gracias-a + /cr/gracias-b',
      $b$# Thank you pages · /cr/gracias-a + /cr/gracias-b

## Propósito
Confirmación post-submit + activación secuencia + tracking conversion fuerte.

## /cr/gracias-a (Funnel A · dropshippers)
- **Hero**: "¡Gracias {{nombre}}! Recibimos tu diagnóstico."
- **Mensaje**: "En los próximos 15 minutos te escribimos por WhatsApp con tu plan personalizado."
- **Mientras tanto** (lista):
  - Mirá el caso de Melissa (embed video 2 min)
  - Descargá la calculadora de CPL contraentrega CR (CTA)
  - Seguinos en IG @efficommerce_cr
- **Footer**: FAQ cortas · contacto directo

## /cr/gracias-b (Funnel B · establecidas)
- **Hero**: "Gracias {{nombre}}, estamos auditando tu tienda"
- **Mensaje**: "En 24h te llega el reporte a {{email}}."
- **Mientras tanto**:
  - Agendá demo ejecutiva directamente (link Calendly)
  - Descargá el PDF "10 señales que tu ERP no da más"
  - Caso Dra Andrea (embed)

## Tracking fuerte
- **Conversion pixel fire inmediato** (sin depender de CAPI)
- GA4 event `conversion_complete_a` / `conversion_complete_b` con parámetro valor
- Google Ads conversion action fire
- LinkedIn Insight conversion si aplica

## Criterios aprobación
- [ ] Ambas páginas personalizadas con {{nombre}} y {{email}}
- [ ] Conversion events disparando inmediato
- [ ] Embeds videos cargan lazy
- [ ] CTAs secundarios funcionan
- [ ] Mobile-first

## Bloqueantes
R-W01 · R-T03

## Timeline
Build: may 3-4 · QA: may 5 · Launch: may 8 (con landing)
$b$,
      'high', 'in_production', true, '2026-05-08', '/templates/propuesta-landing.md'
    ),
    (
      'dev_web',
      'R-W05 · Bot WhatsApp n8n · router + secuencia 7 días + handoff',
      $b$# Bot WhatsApp n8n · EffiCommerce CR

## Propósito
Automatizar conversación post-lead: welcome inmediato + nurturing 7 días + handoff humano SDR.

## Arquitectura n8n
`sistema/n8n-flows/efficommerce-cr-wa-bot.json`

### Webhook inbound
1. **Trigger**: Webhook de WABA (R-T04)
2. **Parse**: extraer phone, mensaje, timestamp
3. **Lookup**: buscar en `admin_effix_leads` por phone
4. **Router** (switch node):
   - Si es lead nuevo (de form landing) → welcome plantilla T1 o T2
   - Si está en secuencia activa → check day → plantilla nurturing correspondiente
   - Si es inbound free-form (mensaje humano) → handoff SDR (Slack notif)

### Secuencia 7 días
- Día 0 (inmediato): T1 o T2 (welcome) según funnel
- Día 1 (+24h): T3 (reminder demo si agendó)
- Día 2 (+48h): T4 (testimonial)
- Día 5 (+120h): T5 (case study)
- Día 7 (+168h): T6 (final no response) — si no hubo respuesta

### Handoff humano
- Cualquier mensaje inbound no-plantilla del cliente:
  1. Pausa la secuencia automática
  2. Notifica al SDR asignado vía Slack (`#efficommerce-cr-inbound`)
  3. SDR responde desde panel WABA en <10 min (horario 8am-8pm CR)
- Si fuera de horario: auto-respuesta "Te contestamos mañana 8am"

### Asignación SDR
- Funnel A: round-robin entre 2 SDRs
- Funnel B: 1 SDR senior B2B

## Inserción en Supabase
Cada evento se registra en `admin_effix_leads`:
- `wa_status` · 'welcomed' · 'nurturing_d2' · 'handoff_human' · 'closed'
- `last_wa_interaction_at`
- `assigned_sdr_id`

## Criterios aprobación
- [ ] Webhook funciona end-to-end
- [ ] Router 3 branches funcional
- [ ] Secuencia 7 días envía en horarios correctos
- [ ] Handoff humano notifica SDR
- [ ] Asignación round-robin funciona
- [ ] Registro en Supabase OK
- [ ] 6 plantillas (R-T04) aprobadas y cargadas

## Bloqueantes
R-T04 (WABA + plantillas) · R-W02 + R-W03 (forms que disparan)

## Timeline
Build: may 5-7 · QA end-to-end: may 8 · Launch: may 10
$b$,
      'high', 'in_production', true, '2026-05-10', '/templates/brief-creativo.md'
    ),

    -- ==========================================================
    -- FINANZAS (3)
    -- ==========================================================
    (
      'finanzas',
      'R-F01 · Pacing semanal $1,000/mes cross-platform',
      $b$# Pacing semanal · $1,000 USD/mes · cross-platform

## Responsabilidad
Monitoreo diario de spend vs presupuesto por plataforma · reporte semanal pace · alerta automática si variación >10%.

## Presupuesto $1,000 USD/mes · split por plataforma
| Plataforma | USD/mes | USD/día | CRC/día aprox (500) |
|---|---|---|---|
| Meta Funnel A | $400 | $13.33 | ₡6,665 |
| Meta Funnel B | $200 | $6.67 | ₡3,335 |
| Google Funnel A | $250 | $8.33 | ₡4,165 |
| Google Funnel B | $100 | $3.33 | ₡1,665 |
| WhatsApp Business | $50 | $1.67 | ₡835 |
| **Total** | **$1,000** | **$33.33** | **₡16,665** |

## Reporte semanal (lunes 9am)
Formato `marcas/efficommerce/costa-rica/reportes/semanal-YYYY-WNN.md`:
- Spend real cross-platform vs plan
- Variación % por plataforma
- CPL por plataforma
- Leads cualificados totales
- Demos agendadas
- Ajustes propuestos para la siguiente semana

## Alertas
- Spend >110% pace diario → notificar Trafficker + Estratega en Slack `#efficommerce-cr-ads`
- Spend <70% pace → revisar delivery (bid muy bajo · creativos rechazados · budget cap)
- CPL >$5 por 3 días consecutivos (Funnel A) → pausa + revisión creativos

## Herramientas
- Vista CMS: BrandSpendTab (ver spend registrado)
- Meta Ads Manager: export CSV diario
- Google Ads: reporte automático
- Libro diario en `spend-log.csv` (ya existe · 10 entries seed)

## Criterios aprobación
- [ ] Primera semana con reporte generado
- [ ] Alertas disparando
- [ ] Pacing ≤10% variación
- [ ] Dashboard (R-E05) muestra pacing en tiempo real

## Timeline
Empieza: may 11 (primera semana completa post-launch) · weekly recurrente hasta jul 19
$b$,
      'normal', 'draft', true, '2026-05-11', '/templates/reporte-semanal.md'
    ),
    (
      'finanzas',
      'R-F02 · Refresh TRM CRC/USD semanal + admin_effix_fx_rates',
      $b$# Refresh TRM CRC/USD · semanal

## Responsabilidad
Mantener `public.admin_effix_fx_rates` al día con la tasa CRC/USD del Banco Central de CR. Necesario para reporting fiel y reconciliación mensual.

## Fuente oficial
Banco Central de Costa Rica · tipo de cambio venta
https://www.bccr.fi.cr (o API pública si disponible)

## Cadencia
- **Lunes 8am CR**: refresh manual o automático via n8n flow
- Inserta/actualiza en `admin_effix_fx_rates` con columna `pais='CRI'`, `moneda='CRC'`

## Flujo n8n (opcional)
`sistema/n8n-flows/fx-refresh-cri.json`:
1. Cron lunes 8am
2. HTTP request a BCCR API
3. Parse tasa
4. Upsert en Supabase

## Validación manual
- Si variación semanal >2% → flaggear a Finanzas para review (TC inestable)
- Si variación >5% → revisar presupuestos CRC (pueden quedar sub o sobre-planeados)

## Uso en el CMS
- Vista FxRatesView muestra las tasas activas
- BrandBudgetTab y BrandSpendTab usan la tasa activa para conversion CRC ↔ USD
- Reporte semanal usa la tasa del lunes para conversión fija de la semana

## Criterios aprobación
- [ ] Tasa actualizada en la DB cada lunes
- [ ] FxRatesView muestra la semana actual
- [ ] BrandBudgetTab convierte correctamente
- [ ] Si n8n flow: healthcheck verde
- [ ] Alert en Slack si falla refresh

## Timeline
Setup: abr 28 · primera refresh: may 4 · weekly hasta jul 19
$b$,
      'normal', 'draft', true, '2026-04-28', '/templates/reporte-semanal.md'
    ),
    (
      'finanzas',
      'R-F03 · Cierre mensual + reconciliación facturas Meta/Google',
      $b$# Cierre mensual · reconciliación facturas Meta/Google

## Responsabilidad
Ejecutar RPC de cierre mensual · reconciliar spend registrado vs facturas oficiales de plataformas · bloquear entries del mes cerrado.

## Proceso mensual (último día hábil del mes)
1. **Descargar facturas oficiales**:
   - Meta Ads Manager → Billing → Invoices (USD)
   - Google Ads → Tools → Billing → Invoices (USD)
   - WhatsApp/Twilio → Billing CSV
2. **Comparar con `admin_effix_spend_entries`** del mes:
   - Diferencias ≤1%: aceptable (timing diario vs factura final)
   - Diferencias >1%: investigar discrepancia + corregir
3. **Ajuste de entries**:
   - Si hay descuento plataforma no registrado: crear entry correctora tipo `adjustment`
   - Si hay spend no registrado: crear entry `reconciliation_adjustment`
4. **Ejecutar RPC**:
   ```sql
   select admin_effix_reconcile_month(
     p_strategy_id := '{{strategy_id}}',
     p_year := 2026, p_month := 5
   );
   ```
5. **Confirmar**: RPC bloquea entries del mes (no editables) y genera snapshot inmutable

## Reporte mensual
`marcas/efficommerce/costa-rica/reportes/mensual-YYYY-MM.md`:
- Spend real vs plan por plataforma
- Conversión CRC ↔ USD usando promedio mensual
- Leads + demos + clientes cerrados
- CPL / CAC / ROAS (una vez haya ventas)
- Insights para próximo mes

## Criterios aprobación
- [ ] Primer cierre: may 31 con mayo completo
- [ ] Diferencias spend vs facturas <1% sin ajustes
- [ ] RPC reconcile ejecutado y entries bloqueadas
- [ ] Reporte mensual publicado
- [ ] Snapshot inmutable en Supabase

## Cadencia
Monthly · may 31 · jun 30 · jul 19 (cierre Q2 ampliado)

## Bloqueante para
Apertura presupuesto del mes siguiente (mantiene disciplina de cierre)
$b$,
      'normal', 'draft', true, '2026-05-31', '/templates/reporte-mensual.md'
    )
  )
  insert into public.admin_effix_requirements (
    strategy_id, area, title, brief_md, priority, status,
    assignee_id, deadline, template_used, created_by
  )
  select
    v_strategy_id,
    n.area::admin_effix_area,
    n.title,
    n.brief_md,
    n.priority::admin_effix_priority,
    n.status::admin_effix_requirement_status,
    case when n.assign then v_owner_id else null end,
    n.deadline::date,
    n.template,
    v_owner_id
  from nuevos n
  where not exists (
    select 1 from public.admin_effix_requirements r
    where r.strategy_id = v_strategy_id
      and r.area = n.area::admin_effix_area
      and r.title = n.title
  );

  get diagnostics v_inserted = row_count;
  raise notice '% requerimientos granulares insertados (de 33 esperados).', v_inserted;

  ---------------------------------------------------------------------------
  -- 3) Aprobaciones pendientes sobre los nuevos (reemplazan las viejas)
  --    Solicita aprobación de brand guide + primer video clave.
  ---------------------------------------------------------------------------
  declare
    v_req_brand uuid;
    v_req_video_sara uuid;
  begin
    select id into v_req_brand
    from public.admin_effix_requirements
    where strategy_id = v_strategy_id
      and area = 'estratega'
      and title = 'R-E03 · Brand guide mínimo v0.1 · paleta + tipos + lockup';

    select id into v_req_video_sara
    from public.admin_effix_requirements
    where strategy_id = v_strategy_id
      and area = 'audiovisual'
      and title = 'R-A01 · Video V1 · Sara Montoya · Por qué creamos EffiCommerce · 60s';

    if v_req_brand is not null and not exists (
      select 1 from public.admin_effix_approvals
      where entity_type = 'requirement' and entity_id = v_req_brand
    ) then
      insert into public.admin_effix_approvals (
        entity_type, entity_id, requested_by, approver_id, status, request_md
      ) values (
        'requirement', v_req_brand, v_owner_id, v_owner_id, 'pending',
        'Aprobación brand guide mínimo EffiCommerce CR v0.1 · paleta Effi Navy + Mint (NO Feria Effix). Requerido antes de empezar diseño de piezas.'
      );
    end if;

    if v_req_video_sara is not null and not exists (
      select 1 from public.admin_effix_approvals
      where entity_type = 'requirement' and entity_id = v_req_video_sara
    ) then
      insert into public.admin_effix_approvals (
        entity_type, entity_id, requested_by, approver_id, status, request_md
      ) values (
        'requirement', v_req_video_sara, v_owner_id, v_owner_id, 'pending',
        'Aprobación guion V1 Sara Montoya 60s antes de confirmar agenda y rodaje. Revisar copy + vestuario + disclaimer.'
      );
    end if;
  end;

  raise notice '---------------------------------------------';
  raise notice 'Migración granular aplicada';
  raise notice '  Strategy: %', v_strategy_id;
  raise notice '  Owner:    %', v_owner_id;
  raise notice '---------------------------------------------';
end $mig$;


-- ============================================================================
-- Reporte final
-- ============================================================================
do $$
declare
  v_strategy_id uuid;
  v_total integer;
  v_by_area text;
begin
  select id into v_strategy_id
  from public.admin_effix_strategies
  where brand_slug = 'efficommerce' and nombre = 'EffiCommerce CR 2026-Q2';

  select count(*) into v_total
  from public.admin_effix_requirements
  where strategy_id = v_strategy_id;

  select string_agg(area || '=' || c, ' · ')
    into v_by_area
  from (
    select area, count(*) c
    from public.admin_effix_requirements
    where strategy_id = v_strategy_id
    group by area
    order by area
  ) t;

  raise notice 'EffiCommerce CR · requerimientos granulares';
  raise notice '  Total: % (esperado: 33)', v_total;
  raise notice '  Por área: %', v_by_area;
end $$;
