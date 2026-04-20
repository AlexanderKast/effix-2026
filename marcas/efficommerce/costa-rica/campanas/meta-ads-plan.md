---
doc: Plan de campañas Meta Ads — EffiCommerce Costa Rica
marca: efficommerce
pais: Costa Rica
fecha: 2026-04-17
presupuesto_meta_12s_usd: 2030
plataformas: [Facebook, Instagram, Messenger, WhatsApp]
---

# Plan Meta Ads — EffiCommerce Costa Rica

Estructura de cuenta, campañas, audiencias y creativos para los 12 semanas de pauta en Meta. Presupuesto total Meta: **$2,030 USD**.

## 1. Estructura de cuenta

```
Meta Business Manager CR (nuevo)
└── Meta Ads Account "EffiCommerce CR"
    ├── Pixel "EffiCommerce_CR_Pixel" (nuevo, dedicado)
    ├── CAPI Dataset (server-side via n8n)
    ├── Catálogo Productos (Fase 2 si aplica)
    └── Audiencias
        ├── Custom: visitantes /cr (7, 14, 30, 90 días)
        ├── Custom: engagers IG (90 días)
        ├── Custom: visitantes Landing A (subfunnel)
        ├── Custom: visitantes Landing B (subfunnel)
        ├── Custom: leads Supabase (hash email+phone, sync via n8n)
        └── Lookalike 1%, 3%, 5% (Fase 2, seed = demos agendadas)
```

## 2. Convención de nombres

```
Campaign:   [Fase] [Objetivo] | [Funnel]
Ad Set:     [Audiencia] | [Placement] | [Budget/día]
Ad:         [Creative-slug] | [Copy-variant] | [vXX]
```

Ejemplo:
```
Campaign:   F1 Conversations WA | Funnel A
Ad Set:     Int-SMB-30-55-GAM | AutoPlacement | $15
Ad:         Pulperia-Don-Carlos | Copy-PainHacienda | v1
```

## 3. Campañas

### Campaña 1 — Funnel A · Awareness ThruPlay Video

| Atributo | Valor |
|---|---|
| Objetivo | Video Views (ThruPlay 15s) |
| Presupuesto | $5/día × 8 semanas = $280 |
| Placements | Automático (priorizar Stories + Reels + Feed) |
| Audiencia | Geo: GAM + 20km. Edad 30-55. Intereses: small business + WhatsApp Business + factura electrónica |
| Creativos | 2 videos verticales (9:16) adaptados de guiones Funnel A |
| Meta | CPM < $3.50 · Hook rate >25% · ThruPlay cost < $0.015 |
| Propósito | Pixel warming + calentar audiencias sin quemar presupuesto conversion |

### Campaña 2 — Funnel A · Conversations WhatsApp (core del funnel)

| Atributo | Valor |
|---|---|
| Objetivo | Messaging → WhatsApp |
| Presupuesto | Inicio $15/día · Semana 9+ escala a $25/día |
| Placements | Feed + Stories + Reels (NO Audience Network) |
| Audiencia | Misma base que C1 + Custom de engagers video C1 |
| Creativos | 3 videos verticales (9:16) + 3 estáticos (1:1 + 4:5) |
| CTA | "Send Message" → WhatsApp Business CR con template aprobado |
| Meta | CPL WA < $2.50 · Respuesta WA ≥ 40% |

### Campaña 3 — Funnel B · Traffic Landing B (Auditoría Shopify)

| Atributo | Valor |
|---|---|
| Objetivo | Traffic → Landing Page (sub-objetivo Conversions cuando haya pixel data) |
| Presupuesto | $8/día × 6 semanas = $336 |
| Placements | Feed + Stories + Reels |
| Audiencia | Geo: Costa Rica nacional. Edad 25-45. Intereses: Shopify + Ecommerce + Online store + Entrepreneurship |
| Creativos | 2 videos (testimonial estilo) + 4 estáticos comparativos "antes/después" |
| Meta | CPC < $0.60 · Conv Rate landing ≥ 3% |

### Campaña 4 — Remarketing Cross-Funnel

| Atributo | Valor |
|---|---|
| Objetivo | Conversions (Lead Form o Landing Conversion según disponibilidad) |
| Presupuesto | $5/día × 8 semanas = $280 |
| Placements | Automático |
| Audiencia | Custom 7, 14, 30 días visitantes `/cr/*` — excluir quienes ya son leads |
| Creativos | Carruseles de objeción ("Ya visitaste: ¿te quedaste con dudas? Mirá esto") |
| Meta | CPA conversión < $5 |

### Campaña 5 (activar Fase 2 · Semana 9) — Lookalike

| Atributo | Valor |
|---|---|
| Objetivo | Messaging → WhatsApp (mismo que C2) |
| Presupuesto | $10/día × 4 semanas = $280 |
| Audiencia | Lookalike 1% CR (seed = demos agendadas, min 100 personas) |
| Creativos | Los ganadores de C2 |
| Meta | CPL WA < $3.00 (esperado algo superior a C2 por audiencia más amplia) |

## 4. Audiencias detalladas

### Funnel A

**Broad_GAM**
- Geo: San José, Alajuela, Heredia, Cartago + 20km radius
- Edad: 30-55
- Idioma: Español
- Expansión detailed targeting: activa

**Interest_SMB_CR**
- Intereses (AND): Small business · Entrepreneurship · Business consulting
- Comportamiento: Administradores de página en Facebook
- Custom Audience: exclude leads Supabase

**Interest_FacturaElectronica_CR**
- Intereses: Electronic invoice (si disponible) · Accounting · Tax
- Comportamiento: Usuarios de WhatsApp Business
- Edad: 35-60

### Funnel B

**Interest_Shopify_CR**
- Geo: Costa Rica nacional
- Intereses: Shopify · Ecommerce · Dropshipping · Online store
- Edad: 25-45
- Exclude: leads Supabase, visitantes /cr con tag "funnel_a"

**Behavior_EcommerceOwner_CR**
- Comportamiento: Facebook Page Admin + páginas con Shopify detectado (si disponible)
- Edad: 25-45

**Custom_Shopify_CR_visitors** (Fase 2)
- Visitantes de /cr/migrar-shopify últimos 14 días

## 5. Creative specs

### Videos verticales (9:16, mobile-first)

- Duración: 15-30 segundos (para ThruPlay 15s target).
- Primer 2-3 seg: hook impactante (ver messaging-framework.md).
- Captions siempre activos (85% mira sin sonido).
- Logo EffiCommerce en esquina superior izquierda (suave, no invasivo).
- CTA card final: "Hablemos por WhatsApp" + número visible.
- Specs técnicos: MP4 H.264, 1080x1920, ≤30MB, audio AAC.

### Estáticos

- Formatos requeridos: 1:1 (1080x1080), 4:5 (1080x1350), 9:16 (1080x1920 para Stories).
- Headline ≤6 palabras en la imagen.
- Logo pequeño en esquina.
- NO watermark grande.
- Fondo Effi Cream o Effi Navy según tono.

### Carruseles (solo remarketing)

- 3-5 cards.
- Card 1: problema / objeción.
- Cards 2-4: respuesta / prueba.
- Card 5: CTA fuerte.

## 6. Copy de anuncios (entregable copywriter)

Ver `creativos/briefs/brief-funnel-a.md` y `brief-funnel-b.md`.

Plantillas base:

**Funnel A — video conversión**
```
Primary text (125 chars visible):
¿Hacienda te pide Factura 4.4 y no sabés cómo? EffiCommerce lo hace por vos.
Mirá el video. 👇

Headline (27 chars):
Factura 4.4 desde el celular

Description (30 chars):
WhatsApp + SINPE + 4.4 listo
```

**Funnel B — estático tráfico**
```
Primary text:
Tenés una tienda en Shopify desde Costa Rica.
Pagás en dólares, luchás con Factura 4.4 y pagás apps que te cuestan más que el plan.

Hicimos una auditoría gratuita con un cliente: le mostramos cómo ahorra $180/mes.

¿Hago la tuya?

Headline:
Auditoría Gratis Shopify CR

Description:
Reporte personalizado en 24h
```

## 7. Tracking y eventos

### Eventos pixel (estándar Meta)

| Evento | Dispara cuando | Valor |
|---|---|---|
| `PageView` | Carga de `/cr` | — |
| `ViewContent` | Visita a `/cr/diagnostico-factura-44` o `/cr/auditoria-shopify` | — |
| `Lead` | Envío de form diagnóstico (A) o auditoría (B) | $10 (placeholder CPL objetivo) |
| `Contact` | Clic en botón WhatsApp | $2 |
| `Schedule` | Demo agendada (via Calendly callback) | $50 |
| `CompleteRegistration` | Confirmación WABA primer mensaje recibido | $3 |

### CAPI (obligatorio)

- Implementación server-side vía n8n webhook → Meta CAPI endpoint.
- Hash de email + phone + FBP + FBC.
- Deduplication key = `event_id` único generado en landing.
- Meta: match rate CAPI ≥ 95% con pixel.
- EMQ target: ≥ 7/10.

### Parámetros personalizados

- `funnel_track` = "A" | "B"
- `lead_source` = "meta_video" | "meta_static" | "google_search" | ...
- `utm_*` estándar (ver credenciales.md)

## 8. Control de frecuencia y fatigue

- **Frequency cap**: 2.5/semana (Meta auto cuando usamos optimización por evento).
- Regla rotación creativos: si Hook Rate cae >20% en 72h → pausar creativo y rotar al siguiente.
- Nunca corremos más de 5 creativos activos por ad set (Meta prioriza mejor).
- Refresh de creativos cada 2-3 semanas (producción continua semanal).

## 9. Calendario de lanzamiento

| Semana | Acción |
|---|---|
| 1 | Crear BM + Pixel + CAPI setup. NO anuncios. |
| 2 | QA pixel + CAPI en Events Manager (Test Events). Producir creativos. |
| 3 | Lanza C1 (ThruPlay A) + C2 (WA Conv A). Presupuesto mínimo. |
| 4 | Lanza C3 (Traffic B). Primera reallocation opcional. |
| 5 | Gate G3: evaluar CPL. Rotar creativos si CPL > target. |
| 6 | Lanza C4 (Remarketing). |
| 7-8 | Escalar ganadores. Producir batch 2 de creativos. |
| 9 | Fase 2: lanza C5 (Lookalike). Escalar C2. |
| 10-11 | A/B tests copy/CTA. |
| 12 | Consolidar. Decisión escala Q3. |

## 10. Reglas de optimización

- Si una campaña no gasta >70% del budget en 48h → audiencia muy estrecha, ampliar.
- Si CPL es 2x target durante 3 días → pausar campaña, revisar creativo + audiencia + landing.
- Si CPL es 0.5x target → escalar 30% budget (no más, para no romper learning).
- **Nunca** editar ad set en learning phase (48h desde cambio mayor).
- Exclusiones cruzadas: C2 excluye visitantes Landing B. C3 excluye visitantes Landing A. Evita canibalización.

## 11. Integración con Effi System CR (bloqueante semana 1)

- Antes de lanzar: acordar frontera con equipo Effi System (ERP vs ecommerce+logística).
- Lista negativa compartida: EffiCommerce NO puja en intereses "ERP", "contabilidad avanzada", "sistemas administrativos completos". Effi System NO puja en "tienda online", "carrito de compras", "checkout".
- Compartir lookalikes de clientes en Fase 2 (mismo Grupo) para enriquecer audiencias.

## 12. Compliance Meta Ads CR

- No claims médicos o financieros específicos (Ley 7472 + políticas Meta).
- Lenguaje inclusivo (no segmentar por género si no hay razón clara — políticas Meta).
- Landing con política de privacidad accesible desde pie de ad (verificación Meta).
- Disclaimer en videos: no decir "garantizado".

## 13. Reporteo específico Meta

Campos mínimos en reporte semanal:
- Spend, Impresiones, Reach, Frecuencia
- CTR (Unique), CPM, CPC
- Lead count, CPL
- Hook Rate (video), Retention 15s (video)
- Conversation Rate (para C2)
- ROAS estimado (lead value $50 placeholder until real data)
