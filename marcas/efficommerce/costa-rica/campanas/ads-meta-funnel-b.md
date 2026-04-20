---
doc: Meta Ads Kit — Funnel B (Migrar ecommerce existentes)
marca: efficommerce
pais: Costa Rica
funnel: B
fecha: 2026-04-17
estado: LISTO PARA SUBIR — trafficker puede cargar directo
voz: es-CR neutro, tono directo a emprendedor sofisticado
---

# Meta Ads Kit — Funnel B · EffiCommerce Costa Rica

Captura dueños de tiendas Shopify/Jumpseller/Tiendanube que facturan $5k-50k USD/mes en CR. Copy final, audiencias exactas.

---

## 1. Setup

Mismo Business Manager, Pixel, Página y número WA que Funnel A (ver `ads-meta-funnel-a.md` sección 1).

**Diferencia clave**: eventos con parámetro `funnel_track="B"` para segmentar reportes y audiencias.

### Eventos específicos Funnel B

| Evento | Dispara en | Valor $ |
|---|---|---|
| `ViewContent` | /cr/auditoria-shopify o /cr/migrar-shopify | — |
| `Lead` | Form auditoría Shopify submit | $15 (ticket mayor) |
| `Contact` | Click WA auditoría | $3 |
| `Schedule` | Auditoría agendada | $75 |

---

## 2. Audiencias — parámetros exactos

### AUD_B1 — Shopify Owners CR

**Ubicación**: Costa Rica nacional
**Edad**: 25-45
**Idioma**: Español

**Intereses (OR)**:
- Shopify
- E-commerce
- Online store
- Dropshipping
- Digital marketing
- Small business marketing
- Entrepreneurship

**Comportamientos**: Engaged shoppers · Small business owners

**Exclusiones**:
- Custom: visitantes `/cr` Funnel A (que hicieron diagnóstico)
- Custom: leads cerrados

**Tamaño estimado**: 45k-80k (audiencia sofisticada más estrecha)

---

### AUD_B2 — Ecommerce + Tech CR

**Ubicación**: Costa Rica nacional
**Edad**: 28-45

**Intereses**:
- E-commerce · Online shopping · Retail · Marketing digital · Software as a service · Facebook Ads · Instagram Ads

**Comportamientos**: Administradores de página con tiendas activas (si Meta CR lo permite) · Engaged with business tools

**Tamaño estimado**: 80k-140k

---

### AUD_B3 — Custom Shopify Visitors (retargeting sofisticado)

**Activar semana 5+**:
- Visitantes `/cr/auditoria-shopify` últimos 14 días
- Viewers 50%+ video Funnel B último 7 días
- Engagers IG post-"Shopify" 30 días

**Exclusiones**: leads cerrados, demos agendadas

---

### AUD_B4 — Lookalike Clientes Grupo Effi (warm seed B2)

**Seed**: clientes EffiCommerce activos CO+EC+RD con ticket >$80k COP/$80 USD mes (proxy de dueño ecommerce sofisticado)
**Lookalike**: 1% CR
**Intereses mínimos**: Shopify + E-commerce

**Activar Fase 2 (semana 9+)**.

---

## 3. Campañas

### CAMP_B1 — F1 Traffic Landing B (Auditoría Shopify)

| Parámetro | Valor |
|---|---|
| Objetivo | **Traffic → Landing Page Views** |
| Destination | `https://efficommerce.com/cr/auditoria-shopify?utm_source=meta&utm_medium=traffic&utm_campaign=f1-auditoria-b` |
| Budget | $8/día · escalar a $15 sem 9+ |
| Ad Sets | AS_B1_Shopify ($5/día) · AS_B2_Ecomm ($3/día) |
| Optimization event | Landing Page Views (fase 1) → Lead (fase 2) |

### CAMP_B2 — F1 Conversions Lead B

**Activar semana 6+** (30+ Lead events en pixel):

| Parámetro | Valor |
|---|---|
| Objetivo | **Conversions → Lead** |
| Budget | $8/día |
| Ad Sets | AS_B1_Shopify · AS_B3_Retargeting |

### CAMP_B3 — Retargeting + Messaging WA (semana 5+)

| Parámetro | Valor |
|---|---|
| Objetivo | Messaging → WhatsApp |
| Budget | $5/día |
| Ad Set | AUD_B3 |

---

## 4. Videos (9:16) — COPY FINAL

### 📽️ VIDEO B1 · "Sofía migró en 7 días" (34s)

> Guión completo: `creativos/guiones/guiones-videos-cortos.md` — B1.

#### Variante 1 · "Ahorro tangible"

**Primary text**:
```
$125 USD al mes. Ese es el plan de Shopify Basic.

Pero no es todo. Sumale:
- App Factura 4.4 CR: $30
- App Correos CR: $15
- Comisión Stripe 2%: ~$40
- Colones que perdés en el cambio USD: ~$20

Total real: $180 al mes.

Sofía tenía una tienda de moda en Shopify. Migró a EffiCommerce en 7 días y ahorra $180/mes. Los clientes ni se enteraron.

¿Auditamos la tuya? Gratis, sin compromiso.
```
**Headline**: `$180 al mes. Así de fácil.`
**Description**: `Auditoría gratis de tu Shopify`
**CTA**: `Learn More`

#### Variante 2 · "Reto honesto"

**Primary text**:
```
No te voy a decir que Shopify es malo. No lo es.

Te voy a decir otra cosa: si vendés en Costa Rica y Shopify no te entiende con Hacienda, con Correos CR o con el colón, hay una alternativa LATAM que sí.

EffiCommerce. Migración guiada en 7 días. Cero caída. Compliance 4.4 nativo. Soporte en hora CR.

Auditamos tu Shopify gratis. Decidís vos.
```
**Headline**: `Shopify no es malo. Es gringo.`
**Description**: `Auditoría gratis — 24h`
**CTA**: `Learn More`

#### Variante 3 · "Case study puntual"

**Primary text**:
```
"Pensé que migrar era un parto. Fueron 7 días y mis clientes ni se enteraron."

— Sofía R., tienda de moda en San José

Hoy su Shopify ya no existe. Su EffiCommerce factura 4.4 nativa, integra Correos CR, acepta SINPE y le responde el soporte en WhatsApp.

Ahorro: $180/mes. Tiempo de setup: 7 días.

¿Vemos la tuya?
```
**Headline**: `Migré en 7 días. Sin drama.`
**Description**: `Auditoría gratis hoy`
**CTA**: `Learn More`

---

### 📽️ VIDEO B2 · "EffiCommerce vs Shopify en CR" (28s)

> Guión: `creativos/guiones/guiones-videos-cortos.md` — B2.

#### Variante 1 · "Comparativo factual"

**Primary text**:
```
EffiCommerce vs Shopify en Costa Rica. Comparación objetiva, sin odio.

✅ Pricing: $25 USD + 2% vs ₡19.900 sin comisión
✅ Factura 4.4: app externa vs nativa
✅ SINPE Móvil: manual vs automático
✅ Logística CR: manual vs integrada
✅ Soporte: inglés USA vs tico 8am-8pm

Mirá el video. Después decidís.
```
**Headline**: `Comparativo honesto`
**Description**: `Auditoría gratuita personalizada`
**CTA**: `Learn More`

#### Variante 2 · "Decisión simplificada"

**Primary text**:
```
¿Te quedás con Shopify? Perfecto, lo entiendo.

¿Querés explorar una alternativa LATAM que te entiende? También perfecto.

Lo único que te pido: hacé la auditoría gratuita de tu Shopify actual. Te decimos qué apps podés soltar, cuánto ahorrás y si la migración te conviene.

Sin compromiso. Te queda el análisis pase lo que pase.
```
**Headline**: `Decidís vos. Información, gratis.`
**Description**: `Reporte en 24h`
**CTA**: `Learn More`

#### Variante 3 · "Escala multi-país"

**Primary text**:
```
Si tu tienda vende en Costa Rica, Panamá y Nicaragua, Shopify te cobra extra por cada mercado y no integra couriers LATAM.

EffiCommerce opera en 4 países (CR, CO, EC, RD). Un solo panel. Un solo soporte. Un solo contrato.

Ideal para tiendas que quieren escalar en LATAM sin multiplicar apps ni proveedores.
```
**Headline**: `Pensás escalar LATAM?`
**Description**: `Un panel · multi-país`
**CTA**: `Send Message`

---

## 5. Estáticos — COPY FINAL

### 🖼️ ESTÁTICO B-E1 · "Costo real Shopify CR" (1:1)

**Visual**: tabla de 2 columnas limpia. Header Effi Navy, filas Effi Cream. Última fila "Total real: $130-$180/mes" destacada en Effi Sun.

**Tabla en imagen**:
```
COSTO OCULTO DE TU SHOPIFY EN COSTA RICA

Plan Basic                       $25 USD/mes
App Factura 4.4 CR               $30 USD/mes
App Correos CR / Aeropost        $15 USD/mes
Comisión 2% sin Shopify Payments ~$40 USD/mes
Cambio USD → CRC perdido         ~$20 USD/mes
─────────────────────────────────────────────
Total real                       ~$130 USD/mes
Escenario alto (temas, apps pro) ~$180 USD/mes
```

#### Variante 1

**Primary text**:
```
El precio "oficial" de Shopify Basic es $25.

El precio real en Costa Rica, con apps de Factura 4.4, couriers y comisión, arranca en $130/mes y sube rápido.

¿Cuánto pagás vos? Te hacemos la auditoría gratis — el reporte te lo enviamos en 24 horas.
```
**Headline**: `Shopify "barato" → no tanto`
**Description**: `Auditoría gratis personalizada`
**CTA**: `Learn More`

#### Variante 2

**Primary text**:
```
$130 a $180 USD al mes.

Ese es el costo real promedio de una tienda Shopify en Costa Rica — una vez sumás apps de Factura 4.4, courier CR, comisiones y cambio de moneda.

EffiCommerce arranca en ₡19.900 al mes (~$38 USD). Factura 4.4 nativa. SINPE automático. Sin comisiones. Con soporte tico.

¿Lo hacemos números y decidís?
```
**Headline**: `₡19.900 vs $180`
**Description**: `Auditoría: 24h · cero compromiso`
**CTA**: `Learn More`

---

### 🖼️ ESTÁTICO B-E2 · "Sofía case" (1:1)

**Visual**: foto estilo documental de actriz 30 años CR en oficina con laptop Shopify abierto y celular con EffiCommerce. Quote sobrepuesto.

**Quote en imagen**:
```
"Pensé que migrar era un parto.
Fueron 7 días y mis clientes
ni se enteraron."

— Sofía R., tienda de moda, San José
```

#### Variante 1

**Primary text**:
```
Sofía vendía en Shopify Basic hace 2 años.

Factura 4.4 con app. Couriers manuales. Pagaba en dólares. Apps que se multiplicaban.

En 7 días la mudamos a EffiCommerce. Redirects SEO listos. Productos migrados. Temas adaptados.

Hoy ahorra $180/mes y el soporte le responde por WhatsApp en minutos.

Si sentís que te estás ahogando en apps, hablemos.
```
**Headline**: `7 días. Sin caída. Sin drama.`
**Description**: `Migración guiada gratuita`
**CTA**: `Learn More`

#### Variante 2

**Primary text**:
```
Las 3 cosas que Sofía recuperó cuando migró de Shopify a EffiCommerce:

1. $180/mes que se iban en apps innecesarias
2. 4 horas por semana que perdía con Factura 4.4 y Correos CR
3. La paciencia para responderle a clientes sin pelear con el sistema

Si te reconocés en alguno, pedí tu auditoría.
```
**Headline**: `Qué recuperás cuando migrás`
**Description**: `Auditoría 24h — gratis`
**CTA**: `Learn More`

---

### 🖼️ ESTÁTICO B-E3 · "Comparativo 5 puntos" (4:5)

**Visual**: tabla clara Shopify vs EffiCommerce. 5 filas × 2 columnas. Shopify con ❌/△, EffiCommerce con ✅.

**Tabla en imagen**:
```
                    SHOPIFY       EFFICOMMERCE
Pricing base        $25 USD       ₡19.900
Factura 4.4         App $30       Nativa
SINPE Móvil         Manual        Automático
Logística CR        Manual        Integrada
Soporte             Inglés USA    Tico 8am-8pm
```

#### Variante 1

**Primary text**:
```
Shopify es una plataforma global excelente. EffiCommerce es una alternativa LATAM pensada para Costa Rica.

La diferencia no es "cuál es mejor" — es cuál te conviene a vos según cómo vendés y a quién.

Si tu tienda opera en CR y vendés mayormente a costarricenses, hacé la comparación punto por punto. Sin odio, con datos.
```
**Headline**: `Comparativo punto por punto`
**Description**: `Reporte personalizado gratuito`
**CTA**: `Learn More`

#### Variante 2

**Primary text**:
```
5 diferencias que importan si vendés en CR:

→ Pricing en colones vs dólares
→ Factura 4.4 nativa vs por app
→ SINPE automático vs manual
→ Correos CR integrado vs no
→ Soporte en hora CR vs zona USA

Cuáles te duelen hoy? Agendá la auditoría y lo miramos.
```
**Headline**: `5 diferencias que sí importan`
**Description**: `Auditoría gratis personalizada`
**CTA**: `Send Message`

---

### 🖼️ ESTÁTICO B-E4 · "Migración en 7 días" (4:5)

**Visual**: timeline horizontal con 5 pasos numerados, cada uno con ícono Phosphor. Paleta Effi Navy/Mint.

**Timeline en imagen**:
```
🗓️ MIGRACIÓN A EFFICOMMERCE EN 7 DÍAS

Día 1:   Auditoría + propuesta personalizada
Día 2-3: Migración productos + temas + SEO redirects
Día 4-5: Integración pagos + couriers + Factura 4.4
Día 6:   QA completo + capacitación del equipo
Día 7:   Go-live — cambio DNS sin caída
```

#### Variante 1

**Primary text**:
```
7 días. Ese es el tiempo que tardamos en migrar tu tienda Shopify a EffiCommerce — sin que tus clientes lo noten.

Migración guiada incluye: productos, temas, redirects SEO, integración pagos, couriers, capacitación.

Sin pausa operativa. Sin pérdida de SEO. Sin riesgo de datos.

Arrancá con una auditoría gratis. Si no convence, no pasa nada.
```
**Headline**: `Migración sin caída ni drama`
**Description**: `Proceso paso a paso · gratis`
**CTA**: `Learn More`

#### Variante 2

**Primary text**:
```
Lo más caro de Shopify no es el plan. Es el costo de oportunidad de quedarte sintiéndote atascado.

Migrar con EffiCommerce es un proceso probado de 7 días con cliente, no un "tutorial" que te toca ejecutar solo.

Agendá auditoría gratuita. Te decimos tiempo exacto y costo real de la migración antes de arrancar.
```
**Headline**: `Lo más caro de Shopify`
**Description**: `Auditoría + propuesta en 24h`
**CTA**: `Send Message`

---

## 6. Naming convention — ads a subir

### Campaña: `F1 Traffic Landing B`

| Ad Set | Ad name | Creative | Variante |
|---|---|---|---|
| AS_B1_Shopify | `V1-Sofia_AhorroTangible_v1` | Video B1 | Var 1 |
| AS_B1_Shopify | `V1-Sofia_RetoHonesto_v1` | Video B1 | Var 2 |
| AS_B1_Shopify | `V2-Comparativo_Factual_v1` | Video B2 | Var 1 |
| AS_B1_Shopify | `E1-CostoReal_Shopify_v1` | Estático B-E1 | Var 1 |
| AS_B1_Shopify | `E3-Comparativo5Puntos_v1` | Estático B-E3 | Var 1 |
| AS_B2_Ecomm | `V2-Comparativo_DecisionSimplificada_v1` | Video B2 | Var 2 |
| AS_B2_Ecomm | `E2-SofiaCase_v1` | Estático B-E2 | Var 1 |
| AS_B2_Ecomm | `E4-Migracion7dias_v1` | Estático B-E4 | Var 1 |

### Campaña: `F1 Retargeting Funnel B`

| Ad Set | Ad name | Creative |
|---|---|---|
| AS_B3_RT | `V1-Sofia_CaseStudy_v1` | Video B1 Var 3 |
| AS_B3_RT | `E4-Migracion_ObjecionCosto_v2` | Estático B-E4 Var 2 |
| AS_B3_RT | `E1-CostoReal_HazNumeros_v2` | Estático B-E1 Var 2 |

---

## 7. Calendario de activación

| Semana | Acción |
|---|---|
| **Sem 4 Lun** | Activar CAMP_B1 (Traffic). NO antes que Funnel A para no dispersar. |
| **Sem 5 Vie** | Gate G4: decisión de continuar o pausar B según CPL. |
| **Sem 6** | Activar CAMP_B3 (Retargeting) si AUD_B3 tiene >1,500 personas. |
| **Sem 7** | Activar CAMP_B2 (Conversions Lead) con 30+ conversions. |
| **Sem 9** | Activar AUD_B4 (Lookalike Grupo Effi) + batch 2 creativos. |

---

## 8. Reglas de rotación y pausa (benchmarks Funnel B)

| Métrica | Verde | Amarillo | Rojo |
|---|---|---|---|
| CPM | < $6 | $6-$10 | > $12 |
| CPC | < $0.80 | $0.80-$1.50 | > $1.80 |
| CTR unique | > 1.2% | 0.8-1.2% | < 0.6% |
| CPL auditoría | < $4 | $4-$6 | > $7 |
| Conv Rate landing B | > 3% | 2-3% | < 1.5% |
| Frecuencia | < 2.5 | 2.5-3.5 | > 4 |

---

## 9. Compliance específico B

- **No denigrar Shopify**: decir "no tiene Factura 4.4 nativa" ≠ "es un desastre". Políticas Meta rechazan lo segundo.
- **Uso de marca Shopify**: nominative fair use — usar logo solo en comparativos editoriales, no en contexto confuso.
- **Datos de ahorro específicos**: $180/mes usar solo con disclaimer "basado en caso real, varía según tu tienda".
- **Landing legal**: aviso privacidad accesible desde anuncio, URL estable durante campaña.
