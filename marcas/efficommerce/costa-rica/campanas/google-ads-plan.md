---
doc: Plan de campañas Google Ads — EffiCommerce Costa Rica
marca: efficommerce
pais: Costa Rica
fecha: 2026-04-17
presupuesto_google_12s_usd: 1226
plataformas: [Search, Display (Fase 2), YouTube (Fase 2), PMax (Fase 2)]
---

# Plan Google Ads — EffiCommerce Costa Rica

Estructura de cuenta, campañas, keywords, RSAs y presupuesto para Google Ads. Presupuesto total: **$1,226 USD** en 12 semanas.

## 1. Estructura de cuenta

```
Google Ads "EffiCommerce CR" (MCC o standalone, por decidir)
├── Conversiones
│   ├── Lead form (primary) — valor $50
│   ├── WhatsApp click (primary) — valor $10
│   ├── Demo schedule — valor $100
│   └── Scroll ≥75% landing (secondary)
├── Audiences (compartidas con Meta via Customer Match)
│   ├── Customer Match: clientes activos Grupo Effi (COL, EC, RD)
│   ├── Customer Match: leads no convertidos CR
│   └── Remarketing: todos visitantes /cr (30/90/180d)
└── Campaigns
    ├── [Search] Brand | Exact
    ├── [Search] Categoría A | Phrase+Broad modifier
    ├── [Search] Categoría B | Phrase
    ├── [PMax] Web (Fase 2, Sem 9+, una vez con 30+ conv)
    └── [Display] Remarketing (Fase 2)
```

## 2. Convención de nombres

```
Campaign:   [Tipo] [Target] | [Match] | [Funnel]
Ad Group:   [Tema] | [Intent]
Keyword:    formato limpio, sin símbolos excepto los de match
Ad:         [Variant] | [CTA] | vXX
```

## 3. Campañas

### Campaña 1 — [Search] Brand · Exact

| Atributo | Valor |
|---|---|
| Objetivo | Proteger marca y capturar search de marca |
| Presupuesto | $2/día × 12 sem = $168 |
| Bid strategy | Maximize Clicks → migrar a Target CPA $5 en Fase 2 |
| Geo | Costa Rica |
| Idioma | Español |
| Match | Exact + Phrase |
| Keywords | `[efficommerce]`, `[effi commerce]`, `[efficommerce costa rica]`, `[effi commerce cr]`, `[sistema effi]`, `[grupo effi costa rica]` |
| Negatives | `gratis`, `hackear`, `crack`, `no pagar`, `vs [competidor]` |
| Ad Groups | 1 — "Brand" |
| Ads por AG | 3 RSAs con variantes |
| Meta | CPC < $0.30 · CTR > 20% (brand search típico) · Position 1.0-1.2 |

### Campaña 2 — [Search] Categoría A | Phrase+Broad | Funnel A (core)

| Atributo | Valor |
|---|---|
| Objetivo | Captar búsquedas de negocios tradicionales con dolor Factura 4.4 y ecommerce |
| Presupuesto | $8/día × 6 sem = $336 |
| Bid strategy | Maximize Clicks (hasta 30 conv) → Target CPA $25 |
| Geo | Costa Rica |
| Idioma | Español |
| Match | Phrase + modified broad |
| Ad Groups | 4 |
| Meta | CPC < $1.20 · Conv Rate ≥ 3% · QS ≥ 7 |

**Ad Groups Categoría A:**

1. **AG "Factura 4.4"**
   - `"factura electronica 4.4 costa rica"` (phrase)
   - `"sistema factura 4.4 pymes"` (phrase)
   - `"como emitir factura 4.4"` (phrase)
   - `"software hacienda 4.4 cr"` (phrase)
   - Negatives: `gratis`, `manual`, `tutorial`, `descargar`

2. **AG "SINPE Móvil ecommerce"**
   - `"sinpe movil checkout"` (phrase)
   - `"recibir sinpe movil negocio"` (phrase)
   - `"sinpe movil para pymes"` (phrase)
   - `"codigo 06 sinpe"` (phrase)

3. **AG "Vender por WhatsApp CR"**
   - `"como vender por whatsapp costa rica"` (phrase)
   - `"catalogo whatsapp negocio"` (phrase)
   - `"whatsapp business pulperia"` (broad+mod: +whatsapp +catalogo +costa +rica)

4. **AG "Sistema POS / punto de venta"**
   - `"sistema pos pequeña empresa cr"` (phrase)
   - `"punto de venta con factura electronica"` (phrase)
   - `"pos pulperia costa rica"` (phrase)

### Campaña 3 — [Search] Categoría B | Phrase | Funnel B

| Atributo | Valor |
|---|---|
| Objetivo | Captar dueños de Shopify/ecommerce existente en CR |
| Presupuesto | $6/día × 6 sem = $252 |
| Bid strategy | Maximize Clicks → Target CPA $35 |
| Geo | Costa Rica |
| Match | Phrase |
| Ad Groups | 3 |
| Meta | CPC < $1.80 · Conv Rate ≥ 2% |

**Ad Groups Categoría B:**

1. **AG "Alternativa Shopify"**
   - `"alternativa shopify"` (phrase)
   - `"mejor que shopify"` (phrase)
   - `"shopify vs"` (broad)
   - `"migrar de shopify"` (phrase)

2. **AG "Plataforma ecommerce LATAM CR"**
   - `"plataforma ecommerce costa rica"` (phrase)
   - `"software tienda online latam"` (phrase)
   - `"crear tienda online costa rica"` (phrase)

3. **AG "Ecommerce + logística"**
   - `"ecommerce con logistica integrada"` (phrase)
   - `"tienda online con envios cr"` (phrase)
   - `"software ecommerce multi courier"` (phrase)

### Campaña 4 — [PMax] Web (Fase 2 · Semana 9+)

| Atributo | Valor |
|---|---|
| Trigger de activación | ≥30 conversiones en los últimos 30 días |
| Objetivo | Conversion value / lead quality |
| Presupuesto | $10/día × 4 sem = $280 |
| Bid strategy | Maximize Conversion Value |
| Asset Groups | 2 (uno por funnel, si data suficiente) |
| Audience signals | Customer Match Grupo Effi + visitantes /cr + intereses afines |
| Meta | CPA < $30 |

### Campaña 5 — [Display] Remarketing (Fase 2 opcional)

| Atributo | Valor |
|---|---|
| Objetivo | Re-capturar visitantes landing que no convirtieron |
| Presupuesto | $5/día × 4 sem = $140 |
| Bid strategy | Maximize Conversions |
| Audiencia | Remarketing 30-180 días |
| Formatos | Responsive Display (auto) + native placements |

**Total presupuesto Google: $168 + $336 + $252 + $280 + $140 = $1,176**. Ajustable según real performance.

## 4. RSAs — Responsive Search Ads

### Reglas generales

- 15 Headlines + 4 Descriptions por ad group (máximo Google).
- Mínimo 3 pinneadas en posición 1 para mensajes core (evita que Google ponga algo débil en H1).
- Character limits: H = 30, D = 90. Respetar siempre.

### Campaña 1 — Brand · RSA template

**Headlines (15 requeridas, 30 char max)**
1. EffiCommerce Costa Rica (pin H1)
2. Sistema Oficial EffiCommerce
3. Tienda Online + Factura 4.4
4. EffiCommerce — Sitio Oficial (pin H2)
5. Vendé con EffiCommerce CR
6. Software Ecommerce Costa Rica
7. WhatsApp + SINPE + 4.4 | CR
8. Plataforma Oficial CR
9. Planes Desde ₡15.000/mes
10. Habla con EffiCommerce
11. Soporte en Costa Rica
12. Factura 4.4 Garantizada
13. Prueba Gratis 14 Días
14. Comunidad Grupo Effi
15. Demo Personalizada CR

**Descriptions (4 requeridas, 90 char max)**
1. Software oficial EffiCommerce para Costa Rica. Factura 4.4 + SINPE + WhatsApp listos.
2. Pedí tu demo personalizada. Soporte en hora de Costa Rica. Prueba gratuita 14 días.
3. Grupo Effi — plataforma usada por 20,000+ clientes en LATAM. Ahora en Costa Rica.
4. Vendé por WhatsApp. Emití Factura 4.4. Cobrá con SINPE. Todo en un sistema.

### Campaña 2 — Categoría A · RSA template (por Ad Group)

**AG "Factura 4.4" — Headlines**
1. Factura 4.4 desde el Celular (pin H1)
2. Cumplí Hacienda sin Pelear
3. Sistema para Pulperías y Sodas
4. Factura Electrónica 4.4 CR
5. ₡15.000/mes con 4.4 Incluida
6. XML 4.4 Validado Siempre
7. Sin Aprender Computación
8. Vendé por WhatsApp + 4.4
9. 146 Ajustes XML Resueltos
10. Demo Gratis — Factura 4.4
11. Hacienda OK con EffiCommerce
12. Código 06 SINPE Automático
13. Tu Contador lo Aprueba
14. Setup en 7 Días
15. Soporte Tico 8am-8pm

**Descriptions**
1. Factura Electrónica 4.4 y SINPE Móvil listos desde día uno. Sin apps extra. Soporte CR.
2. EffiCommerce emite XML 4.4 con los 146 ajustes validados. Tu contador lo recibe directo.
3. Vendé por WhatsApp con catálogo ordenado. Cobrá con SINPE. Facturá con 4.4. Desde ₡15.000.
4. Demo personalizada y diagnóstico Factura 4.4 gratis. Clic para hablar por WhatsApp.

### Campaña 3 — Categoría B · RSA template

**AG "Alternativa Shopify" — Headlines**
1. Alternativa a Shopify en CR (pin H1)
2. Migrá tu Tienda en 7 Días
3. EffiCommerce vs Shopify
4. Compliance CR Incluido
5. Ahorrá $180/mes en Apps
6. Logística Multi-Courier CR
7. Sin Comisión por Venta
8. Auditoría Gratis Shopify
9. Pagás en Colones no Dólares
10. Factura 4.4 Sin Apps Extra
11. SINPE Móvil Nativo
12. Soporte Tico — Shopify no
13. Migración Guiada Gratis
14. Recuperá Apps Caras
15. Demo para Dueños Shopify

**Descriptions**
1. Alternativa LATAM a Shopify — compliance Costa Rica incluido, logística CR integrada.
2. Migración guiada de Shopify en 7 días sin perder SEO. Te dejamos todo listo.
3. Auditoría gratuita de tu tienda Shopify: qué estás pagando de más y cuánto ahorrás.
4. EffiCommerce — usado por 20k clientes LATAM. Ahora con compliance CR nativo.

## 5. Keywords negativas (aplicar a todas las campañas)

Lista base:
```
gratis
descargar
crack
hackear
pirata
tutorial
curso
manual
pdf
job
empleo
trabajo de
cargos en
vacantes
```

Exclusiones cruzadas con Effi System (bloqueante semana 1):
```
erp
sistema administrativo
contabilidad avanzada
nomina
recursos humanos
```

## 6. Extensiones de anuncio

**Sitelinks** (8 min):
1. Precios → `/cr/precios`
2. Demo — Factura 4.4 → `/cr/diagnostico-factura-44`
3. Migrar de Shopify → `/cr/migrar-shopify`
4. Casos de éxito → `/cr/casos`
5. Integraciones → `/cr/integraciones`
6. Blog Hacienda 4.4 → `/cr/blog/factura-4-4`
7. Soporte → `/cr/soporte`
8. Sobre EffiCommerce → `/cr/empresa`

**Callouts** (10):
- Soporte en Costa Rica 8am-8pm
- Factura 4.4 nativa
- SINPE Móvil automático
- Prueba gratis 14 días
- Sin comisión por venta
- 20k+ clientes en LATAM
- Migración guiada de Shopify
- Respuesta WhatsApp en 1 hora
- Comunidad Grupo Effi
- Compliance Ley 8968

**Structured snippets**:
- Types: WhatsApp Business, SINPE Móvil, Factura 4.4, Multi-Courier, Comunidad
- Brands: EffiCommerce, Grupo Effi, Feria Effix

**Lead form extension (Fase 2)**: form con preguntas básicas (nombre, teléfono, tipo de negocio) y entrega del diagnóstico.

## 7. Configuración técnica

- **Conversion tracking**: GA4 import + manual conversions via GTM.
- **Enhanced Conversions**: activado (hash email/phone post-consent).
- **Auto-tagging**: ON (gclid).
- **Campaign-level URL template**: `{lpurl}?utm_source=google&utm_medium=cpc&utm_campaign={campaignid}&utm_content={creative}&utm_term={keyword}`
- **Audience observation** (NO restricción) en Campaña 2 y 3: Customer Match clientes Grupo Effi + In-market Ecommerce Software.
- **Location targeting**: "Presence: People in or regularly in your targeted locations" (más estricto que "interés").
- **Ad schedule**: 6am-11pm CR (bajar presupuesto 50% en madrugada).
- **Device bid adjust**: Mobile +10%, Desktop baseline, Tablet -20%.

## 8. Smart Bidding: cuándo activar

- Activar **Target CPA** o **Maximize Conversions** solo cuando el ad group tenga **≥30 conversiones en 30 días**.
- Antes de eso: Maximize Clicks para generar data.
- No tocar bidding strategy dentro del learning phase (7 días).

## 9. Compliance y políticas Google

- Ley 7472 CR: no usar "#1", "mejor", "único" sin fuente.
- Políticas Google: no exageración, no urgencia falsa ("Solo hoy!"), no testimonios sin fuente.
- Aterrizar en landing con privacy policy visible en footer.
- Final URL estable durante campañas (no cambiar slug).

## 10. Reportes

Campos obligatorios en reporte semanal Google:
- Spend, Impresiones, Clics, CTR, CPC, Conversions, CPA, Conv Rate
- Quality Score por AG (top 5 keywords)
- Search Terms Report (top 20 + new negatives propuestas)
- Auction Insights (quién más puja)
