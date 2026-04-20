---
doc: Plan maestro — EffiCommerce Costa Rica 90 días
marca: efficommerce
pais: Costa Rica
fecha: 2026-04-17
version: "1.0"
periodo: "2026-04-20 / 2026-07-20"
presupuesto_total_usd: 4000
plan_fuente: "C:/Users/SICOMMER SAS/.claude/plans/valiant-sniffing-grove.md"
estado: aprobado — pendiente ejecución
---

# Plan maestro — EffiCommerce Costa Rica

Documento ejecutable del plan aprobado. Versión condensada orientada a ejecución semanal. Para contexto estratégico completo ver plan fuente.

## Hipótesis central

El mercado PYME CR vive un dolor regulatorio urgente (Factura 4.4 + SINPE Móvil obligatorios desde sept 2025) que ningún SaaS ecommerce internacional resuelve nativamente. EffiCommerce lo resuelve. La captación debe ser **compliance-first**, no feature-first.

## Objetivos 90 días

| Resultado | Target |
|---|---|
| Leads cualificados (WA + form) | **300+** |
| Demos agendadas | **60+** |
| Clientes cerrados (demo → paid) | **9-15** (15-25% cierre) |
| CPL promedio ponderado | **< $3.00 USD** |
| MRR generado (estimado pricing $49-99/mes) | **$441 - $1,485 USD/mes** |
| Payback CAC | **< 6 meses** con LTV $600+ |

## Arquitectura de funnels

### Funnel A — Digitalizar negocios tradicionales (70% · $2,660 USD)
- **ICP**: pulperías, sodas, talleres, profesionales. 4 personas documentadas.
- **Ángulo**: "Tu negocio en internet cumpliendo Factura 4.4 + SINPE — sin pelear con Hacienda".
- **Lead magnet**: diagnóstico interactivo "¿Está tu negocio listo para Factura 4.4?" (2 min, 6 preguntas, score personalizado + plan de acción + demo CTA).
- **Canal ads**: Meta Ads heavy (video WhatsApp conversions) + Google Search Categoría A.
- **CTA primario**: WhatsApp "Hablemos de tu negocio" → bot n8n entrega diagnóstico + agenda demo.

### Funnel B — Migrar ecommerce existentes (30% · $1,140 USD)
- **ICP**: dueños de tiendas Shopify/Jumpseller $5k-50k/mes.
- **Ángulo**: "Migra de Shopify a EffiCommerce: compliance CR + logística integrada + ahorro en apps".
- **Lead magnet**: "Auditoría gratuita de tu tienda Shopify" (form URL + 5 preguntas, reporte personalizado 24h con ahorros estimados).
- **Canal ads**: Google Search Categoría B + Meta Ads tráfico a landing + remarketing 7 días.
- **CTA primario**: "Auditar mi tienda" → form → humano responde con reporte en 24h.

## Presupuesto por semana (USD)

| Semana | Meta A | Google A | Meta B | Google B | WABA | Total |
|---|---|---|---|---|---|---|
| 1 (build) | — | — | — | — | — | $0 |
| 2 (build) | — | — | — | — | $150 setup | $150 |
| 3 | $105 ($15/d) | $56 ($8/d) | — | — | $30 | $191 |
| 4 | $105 | $56 | $56 ($8/d) | $42 ($6/d) | $30 | $289 |
| 5 | $140 | $70 | $56 | $42 | $30 | $338 |
| 6 | $140 | $70 | $56 | $42 | $30 | $338 |
| 7 | $140 | $70 | $56 | $42 | $30 | $338 |
| 8 | $140 | $70 | $56 | $42 | $30 | $338 |
| 9 (escala) | $175 | $100 (PMax) | $70 | $56 | $40 | $441 |
| 10 | $175 | $100 | $70 | $56 | $40 | $441 |
| 11 | $175 | $100 | $70 | $56 | $40 | $441 |
| 12 | $175 | $100 | $70 | $56 | $40 | $441 |
| **Total** | **$1,470** | **$792** | **$560** | **$434** | **$490** | **$3,746** |
| Buffer | | | | | | $254 |
| **GRAND TOTAL** | | | | | | **$4,000** |

Split final: **Funnel A $2,262 (60%)** · **Funnel B $994 (26%)** · **WABA $490 (13%)** · **Buffer $254 (6%)**.

> Nota: la distribución 70/30 del plan es la referencia A-vs-B sobre gasto de ads puro. Incluyendo WABA, el peso operativo de A sube porque WA nurturing es core de A.

## Rituales operativos

| Ritual | Frecuencia | Owner | Output |
|---|---|---|---|
| Stand-up diario | 15 min L-V, semanas 3-4 | Estratega | Slack summary |
| Reporte semanal | Viernes 5pm | Trafficker | `reportes/semanal-WW.md` |
| Comparador Plan vs Realidad | Domingo | Estratega | `comparador/semana-WW.md` |
| Review creativos | Martes semanas 2-4 | Creativo + Estratega | Aprobaciones Notion |
| Review optimización | Viernes semanas 5-12 | Estratega + Trafficker | Decisiones en bitácora |
| Revisión budget | Quincenal | Estratega | Ajuste `budget-plan-v1.md` |

## Gates de decisión

| Gate | Cuándo | Criterio | Acción si falla |
|---|---|---|---|
| G1 — Tracking OK | Fin semana 2 | EMQ Meta >6 · Tag Assistant verde · CAPI 95% match | NO lanzar ads hasta resolver |
| G2 — Primera conversión | Fin semana 3 | ≥ 3 leads Funnel A generados | Pausar, revisar landing y hook |
| G3 — CPL estable | Fin semana 5 | CPL A < $3.50 · CPL B < $5 | Si A falla, revisar creativo. Si B falla, considerar pausar B |
| G4 — Reasignación 70/30 | Fin semana 5 | Si CPL A < $2, escalar A +50% desde B | Ejecutar reasignación |
| G5 — 30 conversiones | Fin semana 8 | ≥30 conversiones en Google | Activar Smart Bidding + PMax |
| G6 — Decisión escala vs lean | Fin semana 10 | CAC < $100 · Pipeline valor > $5,000 | Solicitar budget adicional |

## Equipo (a asignar semana 1)

| Rol | Responsabilidades | Dedicación estimada |
|---|---|---|
| Estratega CR | Estrategia, ICP, copy, reportes, gates | 15 h/sem |
| Trafficker CR | Setup y optimización Meta + Google | 10 h/sem |
| Creativo CR | Guiones, edición video, estáticos, motion | 8 h/sem en cycles |
| Dev | Landing, tracking, n8n, integraciones | 20 h semanas 1-2 · 4 h/sem después |
| Ventas / SDR | Responder WhatsApp, agendar demos, scripts | 8 h/sem |

## Riesgos top 3 y mitigaciones activas

1. **Tracking Meta Pixel falla como en VSL previo** → CAPI server-side obligatorio desde día 1. QA con Events Manager ANTES de gastar $1.
2. **Canibalización Effi System CR** → semana 1: reunión con owner Effi System, definir frontera ERP vs ecommerce+logística, crear lista negativa cruzada de keywords.
3. **Dispersión en 2 funnels con $4k** → regla dura: si CPL A < $2 y CPL B > $4 en semana 5, pausar B y reasignar.

## Outputs finales (entregables documentados)

- ✅ README país
- ✅ 4 documentos context (market, regulatorio, competencia, ICP)
- ⏳ 3 documentos estrategia (plan-maestro, messaging, brand-guide)
- ⏳ 3 documentos campañas (meta, google, whatsapp)
- ⏳ Budget plan + spend log
- ⏳ 2 briefs creativos + 2 guiones VSL
- ⏳ Landing CR (clon adaptado, pendiente Fase 0 semana 2)
- ⏳ Tabla Supabase + flow n8n (pendiente semana 2)
- ⏳ Reporte semanal + comparador semanales desde semana 3

## Link al plan fuente

`C:\Users\SICOMMER SAS\.claude\plans\valiant-sniffing-grove.md`
