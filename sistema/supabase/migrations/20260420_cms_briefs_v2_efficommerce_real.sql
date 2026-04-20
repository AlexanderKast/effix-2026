-- ============================================================================
-- Migration: 20260420 — Briefs v2 con contexto real EffiCommerce + formato operativo
-- Descripción:
--   Reescribe los briefs con el ICP y value prop reales de EffiCommerce
--   (investigación grupoeffi.com/efficommerce, efficommerce.com, Instagram,
--   LinkedIn, artículo Semana).
--
--   EffiCommerce NO es alternativa a Shopify — es socio logístico-ERP que
--   se INTEGRA con Shopify/WooCommerce/MercadoLibre y automatiza fulfillment,
--   dropshipping, pago contraentrega, bodegas, ERP, integraciones courier.
--
--   Voceros disponibles del grupo para videos:
--   - Sara Montoya · CEO Effi · marca personal IG activa
--   - Juan David Carmona · Líder Effi · marca personal IG activa
--   - Stevenson Rivera · Fundador
--   - Oswaldo Alarcón · Líder
--   - Empleados customer success (para demos UI)
--
--   Briefs de diseño y video se hacen OPERATIVOS: piezas específicas, slides
--   con copy literal y ángulo de venta por slide, videos con guion creador +
--   guion visual + guion edición por separado.
--
-- Idempotente. Aplicar después de 20260420_cms_briefs_detallados_sin_ugc.sql.
-- ============================================================================


do $mig$
declare
  v_strategy_id uuid;
begin
  select id into v_strategy_id
  from public.admin_effix_strategies
  where brand_slug = 'efficommerce' and nombre = 'EffiCommerce CR 2026-Q2';

  if v_strategy_id is null then
    raise exception 'No existe la estrategia EffiCommerce CR 2026-Q2.';
  end if;

  -- Actualizar también el objetivo_md de la estrategia con contexto real
  update public.admin_effix_strategies
  set objetivo_md = $obj$## Objetivo

Lanzar **EffiCommerce en Costa Rica** captando emprendedores ecommerce y dueños de tiendas Shopify/WooCommerce/MercadoLibre que necesitan automatizar su **fulfillment, pago contraentrega y logística multi-courier** con bodega local CR.

**EffiCommerce NO compite con Shopify** — se INTEGRA con él y suma la capa logística-ERP que Shopify no resuelve en LATAM.

## Value prop central

> "Automatizá tu ecommerce en CR: integración con tu tienda actual (Shopify/Woo/ML) + bodega local + pago contraentrega + logística multi-courier + ERP completo. Todo desde una plataforma."

## ICP primario (Funnel A · 70%)

**Emprendedores dropshipping / ecommerce LATAM** que ya venden o quieren empezar:
- Tienen o quieren tienda en Shopify, WooCommerce o MercadoLibre
- Necesitan bodega física en Costa Rica para productos importados (China → CR)
- Quieren ofrecer **pago contraentrega** (80% de pedidos LATAM prefieren contraentrega vs tarjeta)
- Buscan integraciones courier nacionales CR (Correos CR, Aeropost, transportistas privados)
- Escalan a 200-2000 pedidos/mes y no pueden despachar a mano

## ICP secundario (Funnel B · 30%)

**Tiendas ecommerce establecidas en CR** con Shopify/Woo/ML que necesitan:
- ERP para consolidar: inventario, tesorería, nómina, CRM, informes
- Unificar operación multi-país si venden a Guatemala, Panamá, Nicaragua
- Dejar de manejar pedidos en Excel + WhatsApp

## KPIs 90 días

- 300+ leads cualificados
- 60+ demos
- 9-15 clientes cerrados (cierre demo→venta 15-25%)
- CPL <$3 USD
- Conversión landing ≥5% (A) / ≥3% (B)

## Presupuesto

$1,000 USD/mes × 3 meses = $3,000 USD total
Split: 70% Funnel A (dropshippers ecommerce) / 30% Funnel B (ERP)
$obj$,
      updated_at = now()
  where id = v_strategy_id;

  ---------------------------------------------------------------------------
  -- 1) ESTRATEGA
  ---------------------------------------------------------------------------
  update public.admin_effix_requirements
  set brief_md = $brief$# Plan Estratégico EffiCommerce Costa Rica · Q2-Q3 2026

## 1. ¿Qué es EffiCommerce?

Plataforma integral **logístico-ERP** para ecommerce en LATAM del Grupo Effi. Opera hoy en **Colombia, Ecuador, República Dominicana, Guatemala y Costa Rica**. 20,000+ empresas activas. $100M+ facturación. 35% crecimiento último año.

**NO es** alternativa a Shopify. **SÍ es** el motor logístico + ERP que se integra a Shopify, WooCommerce, MercadoLibre para:
- Fulfillment (recepción, almacenamiento, picking, packing, despacho)
- Dropshipping con pago contraentrega (core LATAM)
- Bodegas propias en 5 países
- Integración con transportadoras nacionales de cada país
- ERP: compras, inventario, ventas, tesorería, CRM, nómina, informes

Fuentes: grupoeffi.com/efficommerce · efficommerce.com · Instagram @efficommerce · LinkedIn · artículo Semana.

## 2. Por qué Costa Rica ahora

- Mercado ecommerce CR: $1.8B (2025) → $2.535B (2029). CAGR 8.91%.
- 80%+ población en WhatsApp, 71% mensajea a negocios.
- 2,192 tiendas Shopify activas en CR (targets Funnel B).
- Pago contraentrega sigue siendo el preferido para 60-70% de compras LATAM.
- EffiCommerce YA opera en CR con bodega e integraciones → ventaja sobre dropshippers que usan bodegas COL/EC y shippean caro a CR.

## 3. ICP refinado

### Funnel A · Dropshipper / emprendedor ecommerce (70%)

| Atributo | Valor |
|---|---|
| Perfil | 25-45 años · emprendedor digital · vende importado de China |
| Plataforma actual | Shopify / WooCommerce / MercadoLibre / tienda propia |
| Volumen | 50-2,000 pedidos/mes |
| Pain #1 | "Estoy despachando a mano desde mi casa y no escala" |
| Pain #2 | "Los clientes quieren contraentrega y es un dolor manejarlo" |
| Pain #3 | "Importo de China pero la bodega me sale carísima" |
| Pain #4 | "Cada courier me cobra diferente y cobro fallido queda en la pérdida" |
| Deseo | Automatizar todo con una plataforma que reciba de China, guarde en bodega CR, despache con contraentrega, cobre y le deposite |
| Cuánto paga EffiCommerce | Free tier disponible · planes pagos por volumen de pedidos |

### Funnel B · Tienda ecommerce establecida (30%)

| Atributo | Valor |
|---|---|
| Perfil | 30-50 años · dueño o gerente de ecommerce establecido |
| Facturación | $10k-100k USD/mes |
| Plataforma | Shopify/Woo ya implementado, pero gestión caótica |
| Pain #1 | "Llevo inventario, ventas y contabilidad en 3 sistemas desconectados" |
| Pain #2 | "Mi ERP actual no entiende ecommerce LATAM" |
| Pain #3 | "Vendo a CR, Panamá, Nicaragua y cada país es un mundo aparte" |
| Deseo | Un solo sistema consolidado multi-país |

## 4. Mensajes centrales por funnel

### Funnel A
1. "Tu ecommerce automatizado: integrás Shopify → bodega CR → contraentrega → cobro"
2. "Dejá de despachar desde tu casa. Bodega CR + transportadoras integradas"
3. "Importás de China, nosotros lo recibimos, guardamos y despachamos"
4. "Contraentrega automatizada: el courier cobra, EffiCommerce te deposita"

### Funnel B
1. "Un solo sistema: ventas, inventario, tesorería, nómina, CRM — todo conectado"
2. "ERP pensado para ecommerce LATAM, no genérico"
3. "Multi-país en una plataforma: CR, CO, EC, RD, GT"

## 5. Competencia real

| Competidor | Tipo | Diferencia EffiCommerce |
|---|---|---|
| Dropi (MX) | Plataforma dropshipping contraentrega | EffiCommerce tiene ERP + multi-país |
| Shopify | Plataforma tienda | EffiCommerce SE INTEGRA a Shopify (no compite) |
| Odoo / Siigo | ERP genérico | EffiCommerce especializado ecommerce + logística integrada |
| Correos CR + Aeropost | Courier individual | EffiCommerce agrupa y automatiza N couriers |

## 6. KPIs target (90 días)

Ver campo `kpi_targets` de la estrategia. Dashboard en HomeView.

## 7. Cronograma fases (ya documentado)

Ver tab "Estrategias" para detalle del periodo.

## 8. Dependencias semana 1

1. Asignación equipo CR (trafficker, AV, diseño, dev, SDR)
2. Confirmar que bodega CR EffiCommerce está operativa y escalable (o clarificar timeline)
3. Validar integraciones courier CR ya activas (Correos CR, Aeropost, otros)
4. Confirmar pricing plans CR (¿mismo que CO/EC o ajustado?)
5. Frontera con Effi System CR (ERP vs ecommerce+logística — aclarar que Effi Systems = EffiCommerce SAS = mismo producto según bitácora)
$brief$,
      title = 'Plan estratégico EffiCommerce CR · dropshipping + fulfillment + contraentrega',
      updated_at = now()
  where strategy_id = v_strategy_id
    and area = 'estratega';

  ---------------------------------------------------------------------------
  -- 2) DISEÑO · piezas operativas concretas (sin brand guide — ya lo conocen)
  ---------------------------------------------------------------------------
  update public.admin_effix_requirements
  set title = 'Diseño Funnel A · 3 carruseles + 3 posts feed + 3 stories',
      brief_md = $brief$# Brief Diseño · Funnel A Meta (dropshippers ecommerce)

> El equipo ya conoce branding, paleta y tipografía EffiCommerce. Este brief va al grano: **piezas específicas con slides + copy + ángulo de venta por slide**.

## Entregables

| # | Pieza | Formato | Slides |
|---|---|---|---|
| C1 | Carrusel "5 dolores de despachar desde tu casa" | 1080×1350 (4:5) | 6 slides |
| C2 | Carrusel "Cómo funciona EffiCommerce en CR" | 1080×1350 (4:5) | 6 slides |
| C3 | Carrusel "Antes / Después con EffiCommerce" | 1080×1350 (4:5) | 5 slides |
| P1 | Post feed "Testimonial Sara Montoya" | 1080×1080 (1:1) | 1 |
| P2 | Post feed "Nosotros vs Hacerlo Solo" | 1080×1080 (1:1) | 1 |
| P3 | Post feed "Pago contraentrega automatizado" | 1080×1080 (1:1) | 1 |
| S1 | Story "¿Despachás desde tu casa?" | 1080×1920 (9:16) | 1 |
| S2 | Story "Números EffiCommerce" | 1080×1920 (9:16) | 1 |
| S3 | Story "Bodega CR" | 1080×1920 (9:16) | 1 |

**Total**: 3 carruseles + 3 posts + 3 stories = **9 conceptos × 2 variantes copy = 18 piezas finales**.

---

## Carrusel C1 · "5 dolores de despachar desde tu casa" (6 slides)

**Ángulo general**: pain-led. Identificación con dropshipper que sufre operando solo.

### Slide 1 (portada · hook)
- **Texto principal**: `5 dolores de despachar desde tu casa`
- **Subtexto**: `Si vendés más de 50 pedidos/mes, esto te suena`
- **Ángulo**: curiosidad + identificación
- **Visual**: foto estilizada de caja cartón, cinta adhesiva, desorden controlado
- CTA visual: "Deslizá →"

### Slide 2 (dolor 1)
- **Título**: `#1 · Tu sala se volvió bodega`
- **Cuerpo**: `Productos apilados, cinta por todos lados, tu pareja ya no aguanta`
- **Ángulo**: dolor doméstico · empatía
- **Visual**: sala real con cajas invadiendo — foto casual

### Slide 3 (dolor 2)
- **Título**: `#2 · Los pedidos contraentrega son un rompecabezas`
- **Cuerpo**: `Coordinás con el courier, el cliente no paga, pagás flete fallido, pierdes margen`
- **Ángulo**: dolor operativo + financiero
- **Visual**: captura WhatsApp típica con courier pidiendo pago

### Slide 4 (dolor 3)
- **Título**: `#3 · No sabés cuánto estás ganando`
- **Cuerpo**: `Ventas en Shopify, gastos en Excel, inventario en la cabeza. ¿Ganancia real? Misterio.`
- **Ángulo**: dolor financiero
- **Visual**: Excel caótico split con Shopify dashboard

### Slide 5 (dolor 4 + 5 combinado)
- **Título**: `#4 y #5 · Escalar = romper`
- **Cuerpo**: `Arriba de 200 pedidos/mes el modelo casero explota. Empleás a alguien, metés errores, perdés clientes.`
- **Ángulo**: dolor de techo de crecimiento
- **Visual**: gráfico ascendente cortado con X roja

### Slide 6 (CTA)
- **Título grande**: `Esto se soluciona`
- **Cuerpo**: `EffiCommerce · bodega CR + contraentrega automatizada + ERP. Integrás tu Shopify en 10 min.`
- **CTA**: `Agendá demo gratis →`
- **Botón visual**: `efficommerce.com/cr`
- **Visual**: pantalla UI EffiCommerce limpia

---

## Carrusel C2 · "Cómo funciona EffiCommerce en CR" (6 slides)

**Ángulo general**: educativo / desmitificador. Flujo paso a paso.

### Slide 1 (portada)
- **Texto**: `Cómo funciona EffiCommerce en Costa Rica`
- **Subtexto**: `De tu tienda a la puerta del cliente, en 5 pasos`
- **Visual**: mapa CR con pin bodega + avión China→CR

### Slide 2 (paso 1)
- **Título**: `1 · Importás de China`
- **Cuerpo**: `Contactás proveedor, pagás, y lo mandás directo a nuestra bodega en CR. Nosotros lo recibimos.`
- **Ángulo**: "no te preocupás por la recepción"
- **Visual**: contenedor llegando a bodega

### Slide 3 (paso 2)
- **Título**: `2 · Conectás tu tienda`
- **Cuerpo**: `Shopify, WooCommerce o MercadoLibre. 10 minutos con nuestro equipo de integraciones.`
- **Ángulo**: "ya usás lo que usás"
- **Visual**: logos Shopify + Woo + ML → flecha → logo EffiCommerce

### Slide 4 (paso 3)
- **Título**: `3 · Entra un pedido`
- **Cuerpo**: `Tu cliente compra en tu tienda. EffiCommerce lo detecta, elige el mejor courier, imprime guía, hace picking & packing.`
- **Ángulo**: automatización total
- **Visual**: flowchart simple tienda → sistema → bodega

### Slide 5 (paso 4)
- **Título**: `4 · Despacho con contraentrega`
- **Cuerpo**: `Courier entrega, cobra al cliente, nos deposita. Restamos comisión y te consignamos a vos.`
- **Ángulo**: pago contraentrega sin riesgo
- **Visual**: courier en moto + billete cambiando de manos

### Slide 6 (CTA)
- **Título**: `Todo en una plataforma`
- **Cuerpo**: `EffiCommerce · 20,000+ emprendedores LATAM confiando en nosotros`
- **CTA**: `Pedí tu demo gratis →`
- **Visual**: mockup dashboard EffiCommerce con números reales disfrazados

---

## Carrusel C3 · "Antes / Después" (5 slides)

**Ángulo general**: transformación · aspiracional.

### Slide 1 (portada)
- `De caos a automatización`
- `Lo que cambia cuando usás EffiCommerce`

### Slide 2 — Antes operación
- **Izq (ANTES)**: `Cajas en tu sala, Excel caótico, WhatsApp con couriers, pedidos perdidos`
- **Der (DESPUÉS)**: `Bodega CR, dashboard único, couriers integrados, 0 pedidos perdidos`

### Slide 3 — Antes tiempo
- **Antes**: `8 horas al día empacando y coordinando`
- **Después**: `2 horas revisando dashboard + planear producto`

### Slide 4 — Antes plata
- **Antes**: `Pagás flete fallido, retail, alquiler de bodega casera`
- **Después**: `Pagás por pedido despachado. Sin fijos.`

### Slide 5 (CTA)
- `Pasá del caos a escalar`
- `Agendá demo · efficommerce.com/cr`

---

## Posts feed (1:1 · 1080×1080)

### P1 · Testimonial Sara Montoya (CEO Effi)
- **Foto**: Sara Montoya de frente, vestimenta profesional casual
- **Quote**: `"En 6 años pasamos de 50 emprendedores a 20,000 en LATAM. El secreto: el dropshipper no puede despachar desde su casa, necesita un socio."`
- **Attribution**: `— Sara Montoya · CEO Grupo Effi`
- **Ángulo**: autoridad + empatía fundadora
- **Logo pequeño**

### P2 · "Nosotros vs Hacerlo Solo"
- **Tabla 2 columnas**:
  - Hacerlo solo: bodega casa · couriers a mano · Excel contabilidad · 0 multi-país
  - EffiCommerce: bodega CR · 5 couriers integrados · ERP completo · multi-país LATAM
- **CTA**: `Pedí tu demo gratis →`
- **Ángulo**: comparación directa

### P3 · Pago contraentrega automatizado
- **Visual**: moto courier + $ + checkmark verde
- **Texto grande**: `El cliente paga cuando recibe. Vos cobrás sin riesgo.`
- **Subtexto**: `Contraentrega automatizada en 100% del territorio CR`
- **Ángulo**: feature-benefit principal LATAM

---

## Stories (9:16 · 1080×1920)

### S1 · Pregunta directa
- **Fondo Navy** · **Texto blanco grande**:
  ```
  ¿Todavía
  despachás desde
  tu casa?
  ```
- **Subtexto**: `Hay una forma mejor`
- **Sticker CTA visual**: `Mirá cómo →`
- **Ángulo**: hook identificación

### S2 · Números
- **Fondo Cream** · stats grandes:
  - `20,000+` emprendedores
  - `5 países` activos
  - `+100M USD` facturación
  - `35%` crecimiento anual
- **CTA**: `EffiCommerce · agendá demo`

### S3 · Bodega CR
- **Foto**: interior bodega EffiCommerce CR (si existe) o stock de bodega profesional
- **Texto over**:
  ```
  Tu producto aquí.
  No en tu sala.
  ```
- **CTA**: `Bodega CR activa →`

---

## Variantes copy (cada pieza 2 variantes)

Variante A = copy neutro profesional
Variante B = copy más directo con modismos tico suaves (mae, pura vida, "a la fija")

El equipo define variantes B a criterio del copy writer; usar español CR neutro como default.

---

## Specs técnicos entrega

- PNG sRGB
- Nombre: `EffiCommerceCR_[C1|C2|P1|S1]_[slide]_[variant]_v[XX].png`
- Peso máx: 2 MB por archivo
- Carpeta entrega: Google Drive compartido + upload al CMS (assets del requerimiento)

## Timeline

- Borrador carruseles + posts: **abr 26**
- Aprobación: **abr 28**
- Entrega final + stories: **abr 30**
$brief$,
      priority = 'high',
      updated_at = now()
  where strategy_id = v_strategy_id
    and area = 'design';

  ---------------------------------------------------------------------------
  -- 3) AUDIOVISUAL · videos con Sara / Juan / empleado + guiones separados
  ---------------------------------------------------------------------------
  update public.admin_effix_requirements
  set title = 'Video Funnel A · 3 piezas con Sara, Juan y empleado · guiones separados',
      brief_md = $brief$# Brief Audiovisual · 3 videos Funnel A (voceros del grupo + empleado)

> Formato operativo con 3 guiones por video: **creador** (lo que dice quien sale) · **visual** (tomas y cámara) · **edición** (cortes, texto en pantalla, música, timing).

## Voceros disponibles del grupo

| Nombre | Rol | Uso sugerido |
|---|---|---|
| **Sara Montoya** | CEO Effi · marca personal IG activa | Video autoridad / testimonial fundadora |
| **Juan David Carmona** | Líder Effi · marca personal IG activa | Video explainer / educacional |
| **Empleado Customer Success** (a definir) | Rostro del producto | Demo UI / tutorial |

Usar SIEMPRE voceros del grupo o empleados reales. NO UGC ni creators externos. Todo desde la empresa.

---

## Entregables

| # | Video | Duración | Ratio | Vocero |
|---|---|---|---|---|
| V1 | "Por qué creamos EffiCommerce" | 60s | 9:16 | Sara Montoya |
| V2 | "Cómo funciona el contraentrega automatizado" | 45s | 9:16 | Juan Carmona |
| V3 | "Tour del dashboard en 30 segundos" | 30s | 9:16 | Empleado CS |

**Exports adicionales**: cada video también en 1:1 (1080×1080) y 16:9 (1920×1080).

---

## V1 · Sara Montoya · "Por qué creamos EffiCommerce" · 60s

### Guion creador (lo que dice Sara frente a cámara)

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

### Guion visual (cámara y producción)

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
**Vestuario Sara**: corporate smart-casual, camisa sólida beige/blanco/navy. Accesorios mínimos.

### Guion edición (post-producción)

| Segmento | Edit | On-screen text | Música |
|---|---|---|---|
| 0-5s | Hook: zoom in sutil + tipografía aparece | "Hace 6 años..." (fade in bottom) | Intro suave piano |
| 5-15s | Cortes 1s con b-roll · split screen 3s | "Caja en tu sala ≠ escalar" | Build up sutil |
| 15-25s | Cortes cada 3s · gráfico aparece (bodega + software + equipo) | Keywords: "Bodega · Software · Logística" | Sostiene |
| 25-35s | Mapa LATAM animado pines encendiéndose en orden (CO, EC, RD, GT, CRI) | "20,000 · 5 países · $100M+" (números animados) | Crescendo |
| 35-50s | Plano íntimo sostenido, captions claros | Caption: "Si vendés online..." | Piano sostenido |
| 50-60s | Logo lockup final + CTA + URL | "EffiCommerce · agendá demo gratis" + URL | Resolución |

**Captions**: burned-in español CR, font Inter Bold, contraste alto.
**Color grading**: warm-neutral, tonos Effi Navy en transiciones.
**Duración tolerancia**: 58-62s.

---

## V2 · Juan Carmona · "Cómo funciona el contraentrega" · 45s

### Guion creador (Juan frente a cámara)

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

### Guion visual

| Tiempo | Plano | Locación | Props |
|---|---|---|---|
| 0-4s | Juan plano medio apuntando a cámara con energía | Bodega EffiCommerce CR (si posible) o oficina con cajas | Camisa polo EffiCommerce |
| 4-12s | Juan plano medio serio · insert 3s B-roll: WhatsApp caótico con courier | Oficina · B-roll celular | — |
| 12-25s | Juan explicando · screencast celular grande al lado mostrando flujo UI | Oficina + mockup en post | Celular con UI |
| 25-35s | Juan + gráfico animado post: moto → $$ → cuenta bancaria | Motion post | Mockup comprobante depósito |
| 35-45s | Juan close-up CTA | Oficina | Celular con landing |

**Vestuario Juan**: polo navy con logo EffiCommerce sutil o camisa lisa. Corporate-accesible.
**Energía**: más directa y rápida que Sara. Ritmo ágil.

### Guion edición

| Tiempo | Edit | On-screen text | Música |
|---|---|---|---|
| 0-4s | Hook · zoom in · aparece "70%" grande | "70% de compras LATAM = contraentrega" | Beat moderno |
| 4-12s | Cortes cada 1.5s con ícono whatsapp caótico | Tags flotando: "courier · fallido · margen" | Sostiene |
| 12-25s | Screencast demo flujo paso a paso · overlay icons Shopify/Woo/ML | Lista animada: "Shopify · WooCommerce · MercadoLibre" | Build |
| 25-35s | Motion graphics simple · flecha animada | Diagrama: Cliente → Courier → EffiCommerce → Vos | Climax |
| 35-45s | Logo + CTA grande · URL subtitle | "Demo gratis · efficommerce.com/cr" | Resolución |

---

## V3 · Empleado Customer Success · "Tour dashboard 30s" · 30s

### Casting
Empleado real del equipo CS o producto (seleccionar persona con buena cámara). Si no hay disponibilidad, actor empleado corporativo con polo EffiCommerce.

### Guion creador

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

### Guion visual

| Tiempo | Plano | Contenido |
|---|---|---|
| 0-3s | Empleado plano medio señalando pantalla | Intro ultra corto |
| 3-10s | Screencast pantalla EffiCommerce · módulo pedidos | Demo live UI |
| 10-17s | Screencast módulo inventario | Stocks en tiempo real |
| 17-24s | Screencast tesorería · balance | Números (disfrazados si son reales) |
| 24-30s | Empleado CTA · logo | Cierre |

**Estilo**: screencast 80% · talking head 20% · ritmo rápido de tutorial.

### Guion edición

| Tiempo | Edit | On-screen text |
|---|---|---|
| 0-3s | Zoom in UI · título grande | "Tour dashboard · 30s" |
| 3-10s | Cursor animado resalta pedidos · logos plataformas | "Pedidos unificados" |
| 10-17s | Highlights verdes en stocks | "Inventario CR en tiempo real" |
| 17-24s | Números animados count-up | "Cobros · Depósitos · Comisiones" |
| 24-30s | Logo + CTA + URL | "Agendá demo · efficommerce.com/cr" |

**Música**: electrónica tutorial moderna, tempo 110 bpm.

---

## Specs técnicos entrega (todas las piezas)

- Cámara: DSLR/mirrorless 4K · grabación en 25/30 fps
- Audio: lavalier o shotgun · post normalizado a -14 LUFS (loudness Meta/YouTube)
- Resolución final: 1080×1920 (9:16) + 1080×1080 (1:1) + 1920×1080 (16:9)
- Formato: MP4 H.264 · máx 30 MB por archivo corto
- Captions: burned-in español CR + SRT separado
- Entrega: Google Drive compartido + upload CMS (assets del requerimiento)

## Disclaimer legal

En V1 y V2 los voceros son reales del grupo, no requiere disclaimer.
En V3 si el empleado es actor, agregar "Dramatización con colaborador del equipo".

## Timeline

| Fase | Fecha |
|---|---|
| Confirmación agenda Sara + Juan | abr 22 |
| Confirmación casting empleado V3 | abr 23 |
| Scripts aprobados por estratega | abr 25 |
| Rodaje V1 + V2 (1 día) | abr 28 |
| Rodaje V3 (medio día) | abr 29 |
| Post producción | abr 30-may 2 |
| Revisión estratega + voceros | may 3 |
| Entrega final | may 4 |

## Criterios de aprobación

- [ ] Scripts aprobados por estratega + voceros
- [ ] Vestuario y locación validados
- [ ] Captions burned-in correctos
- [ ] Audio normalizado
- [ ] Logo y CTA consistentes con brand guide
- [ ] 3 videos × 3 formatos = 9 archivos finales
- [ ] Disclaimer en V3 si aplica
$brief$,
      priority = 'high',
      updated_at = now()
  where strategy_id = v_strategy_id
    and area = 'audiovisual';

  raise notice 'Briefs v2 aplicados — contexto real EffiCommerce + formato operativo.';
end $mig$;
