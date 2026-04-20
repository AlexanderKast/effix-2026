---
doc: Budget Plan v1 — EffiCommerce Costa Rica
marca: efficommerce
pais: Costa Rica
fecha: 2026-04-17
version: "1.0"
periodo: "2026-04-20 / 2026-07-13"
presupuesto_total_usd: 4000
split_funnel: "A: 70% · B: 30% (sobre gasto de ads puro)"
estado: aprobado — ejecutable
---

# Budget Plan v1 — EffiCommerce Costa Rica

Distribución detallada de USD $4,000 en 12 semanas para el lanzamiento de captación en Costa Rica.

## 1. Tabla maestra por semana y canal (USD)

| Semana | Fecha inicio | Meta A | Google A | Meta B | Google B | WABA | Otros | Total |
|---|---|---|---|---|---|---|---|---|
| 1 | 2026-04-20 | — | — | — | — | — | $200 setup | **$200** |
| 2 | 2026-04-27 | — | — | — | — | $150 | $50 | **$200** |
| 3 | 2026-05-04 | $105 | $56 | — | — | $30 | — | **$191** |
| 4 | 2026-05-11 | $105 | $56 | $56 | $42 | $30 | — | **$289** |
| 5 | 2026-05-18 | $140 | $70 | $56 | $42 | $30 | — | **$338** |
| 6 | 2026-05-25 | $140 | $70 | $56 | $42 | $30 | — | **$338** |
| 7 | 2026-06-01 | $140 | $70 | $56 | $42 | $30 | — | **$338** |
| 8 | 2026-06-08 | $140 | $70 | $56 | $42 | $30 | — | **$338** |
| 9 | 2026-06-15 | $175 | $100 | $70 | $56 | $40 | — | **$441** |
| 10 | 2026-06-22 | $175 | $100 | $70 | $56 | $40 | — | **$441** |
| 11 | 2026-06-29 | $175 | $100 | $70 | $56 | $40 | — | **$441** |
| 12 | 2026-07-06 | $175 | $100 | $70 | $56 | $40 | — | **$441** |
| **Total** | | **$1,470** | **$792** | **$560** | **$434** | **$490** | **$250** | **$3,996** |

**Buffer operacional**: $4 (redondeo). Usar `creativos/produccion/` si se necesita contratar UGC.

## 2. Distribución final

| Línea | USD | % |
|---|---|---|
| Meta Ads Funnel A | $1,470 | 36.8% |
| Meta Ads Funnel B | $560 | 14.0% |
| Google Ads Funnel A | $792 | 19.8% |
| Google Ads Funnel B | $434 | 10.9% |
| WhatsApp Business API (WABA) | $490 | 12.3% |
| Setup inicial (dominio, hosting, tooling) | $250 | 6.2% |
| **Total** | **$3,996** | **100%** |

### Split por funnel (ads puro, sin WABA/setup)

- **Funnel A**: $1,470 + $792 = **$2,262 (69.5%)** ✅ cercano al 70%
- **Funnel B**: $560 + $434 = **$994 (30.5%)** ✅ cercano al 30%

## 3. Reglas de reasignación

### Gate G4 — Fin de Semana 5 (2026-05-24)

Evaluar con mínimo 14 días de data:

| Si... | Entonces... |
|---|---|
| CPL Funnel A < $2.00 y tasa respuesta WA > 50% | Mover +$200 de B → A (escalar A antes). |
| CPL Funnel B > $5.00 o 0-1 leads/semana | Pausar B, reasignar 100% a A. Revalidar B Fase 2. |
| CPL A entre $2-3.50 y CPL B entre $3-5 | Mantener split actual. |
| CPL A > $4 | Pausar C2 (conversión), mantener C1 (awareness), revisar creativo antes de reactivar. |

### Gate G6 — Fin de Semana 10 (2026-06-28)

Decisión de escala Q3:

| Criterio | Acción |
|---|---|
| CAC final (ads + WABA) < $100 y cierre demo→cliente ≥ 15% | Solicitar budget adicional Q3 (proyección $15-25k). |
| CAC entre $100-200 | Iterar creativos y optimizar landing antes de escalar. |
| CAC > $200 | Pausa de 2 semanas, review completo de producto-mercado fit CR. |

## 4. Overhead fuera del budget de ads

No incluidos en los $4,000 (esperados como costos operacionales internos del Grupo Effi):

| Concepto | Costo aprox USD | Owner |
|---|---|---|
| Salario estratega CR (3 meses part-time) | $3,000-4,500 | Grupo Effi |
| Salario trafficker CR (3 meses part-time) | $2,000-3,000 | Grupo Effi |
| Creativo / editor video (3 meses part-time) | $1,500-2,500 | Grupo Effi |
| SDR(s) WhatsApp (3 meses) | $1,500-3,000 | Grupo Effi |
| Dev setup landing + n8n (20h x $30/h) | $600 | Grupo Effi |
| UGC creators CR (3 videos x $100) | $300 | Opcional |
| Logo + brand identity | $300-800 | Opcional |
| **Total overhead estimado** | **$9,200 - $14,700** | **No en ads budget** |

## 5. Costos WABA detallados ($490 en 12 semanas)

Modelo Meta (2026, CR: Central America rate):

| Categoría | Costo aprox por msg | Uso estimado |
|---|---|---|
| Plantilla UTILITY | $0.005-0.010 | 2,500 msgs (welcome + transaccionales) |
| Plantilla MARKETING | $0.055-0.075 | 3,500 msgs (nurturing) |
| Conversación entrante (user-initiated) | $0.00 | Ilimitado |
| Conversación service (24h window) | $0.00 (desde 2025) | Ilimitado |

Estimación: $20-30/semana en Fase 1, $35-45/semana en Fase 2.

**Nota**: Meta actualizó precios 2025. Verificar en `https://developers.facebook.com/docs/whatsapp/pricing` antes de firmar WABA provider.

## 6. Proveedor WABA: comparación preliminar

| Feature | Twilio | 360dialog |
|---|---|---|
| Setup fee | $0 | ~€19 |
| Monthly fee | $0 (pay as you go) | €49/mes |
| Pricing por conversación | Markup ~15-20% sobre Meta | Markup ~5-10% sobre Meta |
| n8n integration | Nativa | Via API REST |
| Panel admin | Completo | Light |
| Soporte en español | Parcial | Parcial |
| Recomendación | Fase 0 si volumen bajo | Fase 2 si escala |

**Decisión inicial (re-evaluar semana 1)**: arrancar con **Twilio** por setup rápido y pay-as-you-go que encaja con presupuesto lean. Migrar a 360dialog si escala supera $80/mes de markup Twilio.

## 7. Setup costs breakdown ($250)

| Item | Costo USD | Momento |
|---|---|---|
| Dominio `efficommerce.com` (si no está activo) o extensión subdirectorio | $0-15 | Semana 1 |
| Vercel Pro (si se necesita) | $0 (free tier suficiente) | — |
| Cookiebot free tier (consent mode) | $0 | Semana 2 |
| Twilio WABA setup | $0 | Semana 2 |
| Supabase Free tier | $0 | Semana 1 |
| n8n (ya existe en dev.kreoon.com) | $0 | — |
| Calendly (estratega tiene cuenta) | $0 | — |
| PRODHAB registro (solo si aplica Fase 2) | $50 | Mes 4 |
| Herramientas de diseño (Canva Pro, Figma) | $30 | Semana 1 |
| Licencia Phosphor Icons Pro (opcional) | $30 | Semana 2 |
| **Buffer setup / herramientas sorpresa** | $125 | — |

## 8. Proyección de leads con benchmarks verificados

Basado en benchmarks `recursos/benchmarks.md` + CR-específicos de market-research.md:

### Funnel A
- Meta Ads: $2,030 × 0.72 (Meta share) = $1,470 · CPL target $2.50 → **588 leads**
- Google Ads: $792 · CPL target $5 (Search) → **158 leads**
- Total leads A ~**746** (target conservador: 300+ cualificados = 40% qualification rate)

### Funnel B
- Meta Ads: $560 · CPL target $4 → **140 leads**
- Google Ads: $434 · CPL target $8 → **54 leads**
- Total leads B ~**194** (target conservador: 60+ cualificados)

### Cualificación y pipeline

| Funnel | Leads brutos | % Cualificados | Cualificados | % Demo agendada | Demos | % Cierre | Clientes |
|---|---|---|---|---|---|---|---|
| A | 746 | 40% | 298 | 20% | 60 | 20% | **12** |
| B | 194 | 40% | 78 | 30% | 23 | 25% | **6** |
| **Total** | | | **376** | | **83** | | **18** |

> **Target oficial**: 300+ leads cualificados · 60+ demos · 9-15 clientes. La proyección arriba es consistente con ese target siendo conservadora en cualificación (40%) y cierre (20-25%).

**MRR estimado**: 18 clientes × $49 ARPU = **$882/mes** (si arranca con plan básico) o $99 ARPU = $1,782/mes (plan medio).

## 9. Tracking de spend

- **Archivo de registro**: `spend-log.csv` en esta misma carpeta.
- **Frecuencia de update**: diaria durante Fase 1 (sem 3-4), luego semanal.
- **Owner**: trafficker CR.
- **Template columnas**: `fecha, semana_iso, canal, campana, spend_usd, spend_crc, leads, cpl, notas`.

## 10. Emergencias

Si gasto diario se dispara >30% sobre presupuesto planeado en 2 días consecutivos:

- Trafficker pausa campañas.
- Notifica a estratega + owner Grupo Effi.
- Emergencia documentada en `bitacoras/bitacora-cr-v1.md` con fecha y razón.
- Reinicio solo tras revisión completa.
