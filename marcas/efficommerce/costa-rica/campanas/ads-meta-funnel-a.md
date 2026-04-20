---
doc: Meta Ads Kit — Funnel A (Digitalizar tradicionales)
marca: efficommerce
pais: Costa Rica
funnel: A
fecha: 2026-04-17
estado: LISTO PARA SUBIR — trafficker puede cargar directo a Ads Manager
voz: es-CR neutro (vos + usted alternados; modismos solo en FAQ/body largo)
---

# Meta Ads Kit — Funnel A · EffiCommerce Costa Rica

Todo lo que necesitás para subir los ads a Meta Ads Manager. Copy final, audiencias exactas, presupuesto diario, naming convention aplicado. **No requiere iteración creativa adicional**.

---

## 1. Setup de cuenta

| Item | Valor |
|---|---|
| Business Manager | Crear nuevo "EffiCommerce CR" |
| Ad Account | "EffiCommerce CR — Ad Account" · Moneda USD · Timezone CR (GMT-6) |
| Pixel | "EffiCommerce_CR_Pixel" (nuevo, no compartir con Feria Effix) |
| CAPI | Server-side via n8n webhook → `https://graph.facebook.com/v20.0/{pixel_id}/events` |
| Página Meta | Nueva "EffiCommerce Costa Rica" (no reusar Feria Effix) |
| Número WA Business | +506 XXXX-XXXX (verificado con Meta) |

### Eventos estándar a configurar (pixel + CAPI)

| Evento | Dispara en | Valor $ |
|---|---|---|
| `PageView` | Todas las páginas /cr/* | — |
| `ViewContent` | /cr/diagnostico-factura-44 | — |
| `InitiateCheckout` | Click "Comenzar diagnóstico" | — |
| `Lead` | Form diagnóstico submit | $10 |
| `Contact` | Click botón WhatsApp | $2 |
| `CompleteRegistration` | Confirmación primer mensaje WA recibido | $3 |
| `Schedule` | Demo agendada (webhook Calendly) | $50 |

---

## 2. Audiencias (Ad Sets) — parámetros exactos

### AUD_A1 — Broad GAM Intereses Factura

**Ubicación**:
- Costa Rica
- San José, Alajuela, Heredia, Cartago + radio 25 km
- Excluir: Limón, Guanacaste, Puntarenas (testear Fase 2)

**Edad**: 35-60
**Género**: Todos
**Idioma**: Español
**Expansión detailed targeting**: Activada

**Intereses (OR dentro, AND entre grupos)**:
- Grupo 1 (negocio): Small business · Entrepreneurship · Business consulting · Retail · Sole proprietorship
- Grupo 2 (dolor): Accounting · Tax · Invoice · WhatsApp Business

**Comportamientos**: Facebook Page Admins · Small business owners

**Exclusiones**:
- Engagers página EffiCommerce (ya en funnel)
- Custom: `leads_efficommerce_cr` (upload diario)
- Lookalike negocios ecommerce sofisticados (no queremos B en este set)

**Tamaño estimado**: 180k-320k
**Placements**: Automáticos (priorizar Feed + Reels + Stories)

---

### AUD_A2 — Interest Small Business CR

**Ubicación**: Costa Rica nacional
**Edad**: 30-55
**Idioma**: Español

**Intereses**:
- Small business · Entrepreneurship · Online advertising · Facebook for Business · Business management

**Comportamientos**: Small business owners · Engaged shoppers

**Exclusiones**: Custom leads + Engagers recent

**Tamaño estimado**: 350k-450k

---

### AUD_A3 — Lookalike Clientes Grupo Effi (warm seed)

**Seed**: Customer Match uploadar clientes activos EffiCommerce Colombia + Ecuador + RD (hashed email+phone)
**Lookalike**: 1% · 3% · 5% Costa Rica
**Edad**: 30-55
**Intereses**: Ninguno (dejar al algoritmo)

**Cuándo activar**: Semana 2 cuando lista seed esté uploaded y procesada por Meta (48-72h)

---

### AUD_A4 — Retargeting visitantes landing A (14 días)

**Custom Audience**:
- Visitantes de `/cr/` últimos 14 días
- Visitantes de `/cr/diagnostico-factura-44` últimos 14 días
- Engagers IG EffiCommerce CR 14 días
- Viewers 50% video Meta Ads Funnel A 7 días

**Exclusiones**:
- Leads ya convertidos (`leads_efficommerce_cr`)
- Demos agendadas

**Tamaño estimado**: arranca 0, objetivo 8k-20k en mes 2

---

### AUD_A5 — Broad CR + Lookalike mínimos (performance test)

**Ubicación**: Costa Rica nacional
**Edad**: 28-60
**Idioma**: Español
**Detailed targeting**: NINGUNO (broad puro)

**Uso**: validar si Meta algorithm entrega mejor sin targeting específico (táctica 2025+ con Advantage+ audiences).

---

## 3. Campañas — configuración exacta

### CAMP_1 — F1 Conversations WA | Funnel A

| Parámetro | Valor |
|---|---|
| Objetivo | **Engagement → Messaging** |
| Campaign budget optimization | OFF (budget por ad set) |
| Destination | WhatsApp (número +506 XXXX-XXXX) |
| Buying type | Auction |
| Attribution | 7-day click, 1-day view |
| Optimization event | Conversations Started (with you) |
| Status semana 3 | ACTIVE |

**Ad Sets dentro:**
- AS_A1_Broad · budget $10/día · AUD_A1
- AS_A2_Interest · budget $5/día · AUD_A2
- AS_A3_Lookalike (activar sem 4) · budget $5/día · AUD_A3

**Total campaña:** $15-20/día semana 3 · escalar $25/día semana 9+.

---

### CAMP_2 — F1 Video Views ThruPlay | Funnel A (pixel warming)

| Parámetro | Valor |
|---|---|
| Objetivo | **Awareness → Video Views** |
| Optimization event | ThruPlay (15s) |
| Budget | $5/día por ad set × 2 = $10/día |
| Placements | Stories + Reels + Feed · NO Audience Network |
| Ad Sets | AS_A1 + AS_A5_BroadTest |

**Propósito**: generar audiencia calentada para retargeting + datos de pixel. NO es campaña de conversión.

---

### CAMP_3 — F1 Traffic Landing A (Diagnóstico)

| Parámetro | Valor |
|---|---|
| Objetivo | **Traffic → Landing Page View** |
| Budget | $5/día · ad set único AUD_A1 |
| Optimization event | Landing Page Views |
| Destination URL | `https://efficommerce.com/cr/diagnostico-factura-44?utm_source=meta&utm_medium=traffic&utm_campaign=f1-diag-a` |

---

### CAMP_4 — F1 Conversions Landing A (cuando haya 30+ Lead events)

**Activar semana 6-7** tras acumular 30+ conversiones Lead en pixel.

| Parámetro | Valor |
|---|---|
| Objetivo | **Conversions → Lead** |
| Optimization event | Lead (form submit diagnóstico) |
| Budget | $10/día |

---

### CAMP_5 — F1 Retargeting Funnel A

| Parámetro | Valor |
|---|---|
| Objetivo | **Conversions → Lead** (o Messaging si conv data es baja) |
| Budget | $5/día |
| Ad Set único | AUD_A4 |

---

## 4. Videos (9:16) — COPY FINAL por variante

### 📽️ VIDEO A1 · "Don Carlos de la pulpería" (30s)

> **Guión completo**: ver `creativos/guiones/guiones-videos-cortos.md` — sección A1.

#### Variante 1 · "Dolor Hacienda"

**Primary text**:
```
Si este año recibiste carta de Hacienda por Factura 4.4, respirá.

Don Carlos también la recibió. Tiene su pulpería en Desamparados hace 15 años. Pensó: "yo no sé nada de computadoras".

Dos semanas después estaba vendiendo por WhatsApp, cobrando por SINPE y emitiendo Factura 4.4 desde el celular.

¿Querés ver cómo? 👇
```

**Headline**: `La 4.4 no tiene que volverte loco`
**Description**: `Diagnóstico gratis en 2 min`
**CTA**: `Send Message`

#### Variante 2 · "Aspiracional directo"

**Primary text**:
```
₡800.000 extra el primer mes.

Ese fue el resultado de Don Carlos después de poner su pulpería en línea con EffiCommerce.

No cambió de local. No aprendió computación. Solo empezó a recibir pedidos por WhatsApp y a cobrar con SINPE.

Si tu negocio es pequeño pero real, esto es para vos.
```

**Headline**: `Tu pulpería en línea esta semana`
**Description**: `WhatsApp + SINPE + Factura 4.4`
**CTA**: `Send Message`

#### Variante 3 · "Curiosidad"

**Primary text**:
```
Don Carlos tiene 58 años y nunca había usado Facebook para vender.

Hoy factura 4.4, recibe pedidos por WhatsApp y cobra con SINPE — todo desde el celular que ya tenía.

Te cuento exactamente cómo lo hizo 👇
```

**Headline**: `Ni computadora necesitás`
**Description**: `Solo tu celular. 7 días.`
**CTA**: `Learn More` (lleva a landing)

---

### 📽️ VIDEO A2 · "Pasa de Excel a EffiCommerce" (26s)

> **Guión**: `creativos/guiones/guiones-videos-cortos.md` — A2.

#### Variante 1 · "Acusatorio suave"

**Primary text**:
```
Si tu negocio corre con Excel, cuaderno o la memoria del contador, esto es para vos.

Factura 4.4 obligatoria desde septiembre. 450.000 contribuyentes en Costa Rica la tienen que emitir. Y el Excel ya no sirve.

EffiCommerce hace las 4.4 por vos. Con SINPE automático. Desde el celular.

Prueba gratis 14 días. Sin tarjeta.
```

**Headline**: `Del Excel al sistema en 7 días`
**Description**: `Factura 4.4 sin apps extra`
**CTA**: `Send Message`

#### Variante 2 · "Cifra dura"

**Primary text**:
```
450.000 contribuyentes en CR tienen que emitir Factura 4.4. Y no es negociable.

Si todavía andás con cuaderno y calculadora, Hacienda viene por vos.

EffiCommerce: Factura 4.4 + SINPE + WhatsApp listos desde el primer día. Soporte en hora de Costa Rica.

Mirá el video.
```

**Headline**: `Hacienda no negocia. Nosotros sí.`
**Description**: `Demo gratis — 15 min`
**CTA**: `Send Message`

#### Variante 3 · "Promesa simple"

**Primary text**:
```
7 días. Ese es el tiempo que necesitás para tener tu negocio en línea con EffiCommerce.

- Catálogo ordenado por WhatsApp
- Cobro por SINPE automático
- Factura 4.4 validada por Hacienda
- Todo desde el celular

Sin comisión por venta. Sin apps extra. Soporte en Costa Rica.

₡19.900 al mes. Prueba gratis 14 días.
```

**Headline**: `7 días para estar en línea`
**Description**: `Desde ₡19.900 al mes`
**CTA**: `Send Message`

---

### 📽️ VIDEO A3 · "No necesitás aprender computación" (28s)

> **Guión**: `creativos/guiones/guiones-videos-cortos.md` — A3.

#### Variante 1 · "Contrarian"

**Primary text**:
```
"No vendo en línea porque no sé de computadoras."

Esa frase se la oímos a muchos dueños de negocios. Y es exactamente por qué EffiCommerce existe.

Todo pasa desde tu celular. Tomás una foto. El sistema arma el catálogo. Los clientes piden por WhatsApp. Cobrás con SINPE. Facturás con 4.4.

Hacés lo mismo que ya hacés — pero ahora con Hacienda en paz y pedidos ordenados.
```

**Headline**: `Solo con el celular`
**Description**: `Sin aprender nada nuevo`
**CTA**: `Send Message`

#### Variante 2 · "Pregunta-gancho"

**Primary text**:
```
¿Pensás que vender en línea es para gente joven y tecnológica?

Don Carlos tiene 58. Doña María cocina todos los días a las 5am. Luis huele a grasa de taller. Los tres venden con EffiCommerce.

No hay truco. No hay que aprender computación. Solo hay que querer que Hacienda te deje en paz y que los pedidos no se pierdan.
```

**Headline**: `Si ellos pueden, vos también`
**Description**: `Prueba gratis 14 días`
**CTA**: `Send Message`

#### Variante 3 · "FOMO regulatorio"

**Primary text**:
```
Factura 4.4 no es opcional en Costa Rica. Es obligatoria desde septiembre 2025.

Si todavía facturás a mano o en Excel, tu negocio está en riesgo. Hacienda audita todo.

EffiCommerce te deja listo en 7 días. Sin aprender nada. Sin apps extra. Con soporte tico.

Desde ₡19.900 al mes. Primer mes gratis.
```

**Headline**: `Hacienda no avisa dos veces`
**Description**: `Factura 4.4 lista hoy`
**CTA**: `Send Message`

---

## 5. Estáticos — COPY FINAL por variante

### 🖼️ ESTÁTICO E1 · "Carta Hacienda" (1:1 · 1080×1080)

**Visual**: close-up de sobre oficial tipo Hacienda CR con sello tachado en verde y badge "RESUELTO CON EFFICOMMERCE". Fondo Effi Cream. Logo esquina superior izquierda.

#### Variante 1

**Primary text**:
```
Hacienda te pide Factura 4.4. Vos querés seguir trabajando.

EffiCommerce hace las dos cosas. Factura 4.4 nativa con los 146 ajustes XML validados. SINPE Móvil automático. Soporte en Costa Rica.

₡19.900 al mes. Prueba gratis 14 días.

Hablemos 👇
```
**Headline**: `Respirá. Hay salida.`
**Description**: `Factura 4.4 sin apps extra`
**CTA**: `Send Message`

#### Variante 2

**Primary text**:
```
146 ajustes XML. Código 06 SINPE obligatorio. Recibo Electrónico de Pago nuevo. Georreferenciación del emisor.

Si leíste la actualización 4.4, sabés por qué tu negocio necesita un sistema real.

EffiCommerce lo tiene listo.
```
**Headline**: `146 ajustes, cero dolores de cabeza`
**Description**: `Demo gratis hoy`
**CTA**: `Send Message`

---

### 🖼️ ESTÁTICO E2 · "Don Carlos quote" (1:1)

**Visual**: Foto UGC de señor CR ~58 años en pulpería, celular en mano, sonrisa natural. Quote sobrepuesto en tipografía Inter Tight.

#### Variante 1

**Primary text**:
```
"Yo pensé que esto no era para mí. Que las computadoras eran para gente joven. Mi hijo me puso EffiCommerce y en dos semanas estaba vendiendo por WhatsApp."

— Don Carlos, dueño de pulpería en Desamparados

Si lo hizo él, vos también podés.
```
**Headline**: `"No era para mí". Error.`
**Description**: `EffiCommerce — desde el celular`
**CTA**: `Send Message`

#### Variante 2

**Primary text**:
```
El primer mes: ₡800.000 extra en ventas.
El segundo mes: Hacienda lo dejó en paz por primera vez en 3 años.
El tercer mes: el contador le agradeció las facturas organizadas.

Don Carlos lleva 15 años con su pulpería. Nunca había vendido en línea.

Hoy lo hace — sin aprender computación.
```
**Headline**: `3 meses. 3 victorias.`
**Description**: `Empezá tu prueba gratis`
**CTA**: `Send Message`

---

### 🖼️ ESTÁTICO E3 · "Antes / Después" (4:5 · 1080×1350)

**Visual**: Split vertical. Arriba "ANTES": cuaderno manchado + calculadora rota. Abajo "DESPUÉS": celular con UI EffiCommerce limpia + badge SINPE + Factura 4.4. Paleta Effi Navy/Mint.

#### Variante 1

**Primary text**:
```
ANTES: cuaderno, calculadora, panadería en la cabeza.
DESPUÉS: celular, EffiCommerce, pedidos ordenados por WhatsApp.

La misma persona. El mismo negocio. Otro país fiscal.

Tu cambio en 7 días. Desde ₡19.900 al mes.
```
**Headline**: `Del cuaderno al sistema real`
**Description**: `Listo en 7 días — hablá`
**CTA**: `Send Message`

#### Variante 2

**Primary text**:
```
El mismo negocio. El mismo dueño. La misma inversión en tiempo.

Lo único distinto: que ahora Hacienda te deja en paz, los clientes piden por WhatsApp y el dinero entra ordenado.

EffiCommerce. Software ecommerce para Costa Rica.
```
**Headline**: `Cambiá lo que tenés que cambiar`
**Description**: `Diagnóstico Factura 4.4 gratis`
**CTA**: `Learn More`

---

### 🖼️ ESTÁTICO E4 · "Cómo funciona 1-2-3" (4:5)

**Visual**: 3 iconos Phosphor en fila vertical sobre fondo Effi Cream. (1) cámara + producto (2) globo chat WhatsApp (3) billete + SINPE logo + Factura.

#### Variante 1

**Primary text**:
```
Cómo funciona EffiCommerce en 3 pasos:

1. Tomás una foto al producto → el sistema arma el catálogo.
2. Los clientes te piden por WhatsApp → pedido estructurado, no más "mándame 2 casados con plátano".
3. Cobrás con SINPE → Factura 4.4 sale sola. El contador la recibe directo.

Sin apps extra. Sin comisiones por venta. Desde ₡19.900 al mes.
```
**Headline**: `3 pasos. 7 días. Listo.`
**Description**: `Probá 14 días gratis`
**CTA**: `Send Message`

#### Variante 2

**Primary text**:
```
Si vender en línea te sonaba complicado, mirá esto 👇

Tomar foto → recibir pedido → cobrar SINPE → facturar 4.4.

Eso es todo. EffiCommerce hace la parte fea; vos hacés lo que ya sabés hacer.
```
**Headline**: `Más simple, imposible`
**Description**: `Sin aprender computación`
**CTA**: `Send Message`

---

### 🖼️ ESTÁTICO E5 · "Story — Pregunta directa" (9:16 · 1080×1920)

**Visual**: Fondo Effi Navy. Texto grande centrado en Effi Cream. Sticker WhatsApp en esquina inferior.

**Texto en imagen** (burned-in):
```
¿Tu negocio
ya factura 4.4?

_

Hacé el diagnóstico
en 2 minutos.

 → Tocá el botón
```

#### Variante 1

**Primary text**:
```
Hacienda ya pide Factura 4.4 obligatoria. 450.000 negocios tienen que cumplir.

Sabé en 2 minutos si el tuyo está listo. Diagnóstico gratis — sin compromiso.
```
**Headline**: `Diagnóstico Factura 4.4`
**CTA**: `Learn More`

#### Variante 2

**Primary text**:
```
¿Sabés exactamente qué te pide Hacienda con la 4.4?
¿Qué es el código 06?
¿Y el Recibo Electrónico de Pago?

Si dudaste en alguna, hacé el diagnóstico. Te mandamos un mini-plan personalizado a tu WhatsApp.
```
**Headline**: `6 preguntas · 2 min · gratis`
**CTA**: `Learn More`

---

### 🖼️ ESTÁTICO E6 · "Story — Dra. Andrea" (9:16)

**Visual**: Foto estilo documental de profesional CR 35-40 años en consultorio. Quote sobrepuesto.

**Texto en imagen**:
```
"Mi consultorio cobra
con SINPE. Mis facturas
salen solas desde el celular.
Dejé de perseguir pagos."

— Dra. Andrea, odontóloga en Heredia
```

#### Variante 1

**Primary text**:
```
Médicos. Dentistas. Abogados. Arquitectos. Contadores.

Si trabajás por cuenta propia y cobrás a pacientes o clientes, EffiCommerce te pone el cobro y la factura en piloto automático.

Agendá una demo de 15 minutos — cero compromiso.
```
**Headline**: `Para profesionales independientes`
**Description**: `SINPE + 4.4 + agenda online`
**CTA**: `Send Message`

#### Variante 2

**Primary text**:
```
Dejar de perseguir pagos.
Dejar de armar facturas a mano.
Dejar de coordinar citas en papel.

Tres cosas que a ningún profesional le enseñan a soltar — pero todos necesitan.

EffiCommerce las suelta por vos.
```
**Headline**: `Soltá lo que no te suma`
**Description**: `Demo personalizada gratis`
**CTA**: `Send Message`

---

## 6. Naming convention aplicado — lista de ads a subir

### Campaña: `F1 Conversations WA | Funnel A`

| Ad Set | Ad name | Creative | Variante copy |
|---|---|---|---|
| AS_A1_Broad | `V1-DonCarlos_DolorHacienda_v1` | Video A1 | Variante 1 |
| AS_A1_Broad | `V1-DonCarlos_Aspiracional_v1` | Video A1 | Variante 2 |
| AS_A1_Broad | `V1-DonCarlos_Curiosidad_v1` | Video A1 | Variante 3 |
| AS_A1_Broad | `V2-Excel_Acusatorio_v1` | Video A2 | Variante 1 |
| AS_A1_Broad | `V2-Excel_CifraDura_v1` | Video A2 | Variante 2 |
| AS_A1_Broad | `V3-NoComputacion_Contrarian_v1` | Video A3 | Variante 1 |
| AS_A2_Interest | `V1-DonCarlos_DolorHacienda_v1` | Video A1 | Variante 1 (duplicado) |
| AS_A2_Interest | `V3-NoComputacion_FOMO_v1` | Video A3 | Variante 3 |

### Campaña: `F1 Video Views ThruPlay | Funnel A`

Reutilizar los 3 videos como ThruPlay (sin CTA messaging — solo view).
| Ad Set | Ad name |
|---|---|
| AS_A1_Broad | `TP-V1_DonCarlos` |
| AS_A1_Broad | `TP-V2_Excel` |
| AS_A1_Broad | `TP-V3_NoComputacion` |
| AS_A5_BroadTest | Mismos 3 |

### Campaña: `F1 Traffic Landing A`

| Ad Set | Ad name | Creative |
|---|---|---|
| AS_A1_Broad | `E5-StoryPregunta_v1` | Estático E5 |
| AS_A1_Broad | `E1-CartaHacienda_v1` | Estático E1 |
| AS_A1_Broad | `E3-AntesDepues_v1` | Estático E3 |

### Campaña: `F1 Retargeting Funnel A`

| Ad Set | Ad name | Creative |
|---|---|---|
| AS_A4_RT | `V2-Excel_PromesaSimple_v1` | Video A2 var 3 |
| AS_A4_RT | `E4-ComoFunciona_v1` | Estático E4 |
| AS_A4_RT | `E6-DraAndrea_SoltarPain_v2` | Estático E6 var 2 |

---

## 7. Calendario de activación

| Semana | Acción |
|---|---|
| **Sem 2** | Upload creativos a Meta. Test Events con Events Manager. NO activar. |
| **Sem 3 Lun** | Activar CAMP_1 (Conversations) + CAMP_2 (ThruPlay). 72h learning phase. |
| **Sem 3 Jue** | Revisar Hook Rate videos; pausar los <20%. |
| **Sem 4** | Activar CAMP_3 (Traffic Landing). Primera rotación creativos si CPL > $4. |
| **Sem 5** | Gate G4: decisión reasignación 70/30 → A. |
| **Sem 6-7** | Activar CAMP_5 (Retargeting) una vez custom aud pase 1.000 personas. |
| **Sem 6-7** | Activar CAMP_4 (Conversions Lead) una vez haya 30+ Lead events. |
| **Sem 8** | Batch 2 creativos — producir 2 videos + 3 estáticos nuevos con aprendizajes. |
| **Sem 9** | Activar AUD_A3 (Lookalike Grupo Effi). |

---

## 8. Reglas de rotación y pausa

| Métrica | Verde | Amarillo | Rojo (pausar) |
|---|---|---|---|
| CPM | < $5 | $5-$8 | > $10 (audiencia muy amplia o creativo malo) |
| CPC | < $0.50 | $0.50-$1.00 | > $1.20 |
| CTR (unique) | > 1.5% | 1.0-1.5% | < 0.8% |
| Hook Rate (videos) | > 30% | 20-30% | < 18% |
| CPL WA | < $2.50 | $2.50-$4.00 | > $5.00 |
| Frecuencia | < 2.5 | 2.5-3.5 | > 4.0 (quema audiencia) |

**Regla de rotación creativos**:
- Si Hook Rate baja 20% en 72h → pausar creativo, rotar siguiente.
- Refresh creativo cada 14-21 días como mínimo.
- Producir 2 creativos nuevos / semana desde semana 5.

---

## 9. Compliance checklist antes de publicar

- [ ] Ningún claim prohibido ("garantizado", "#1", "único", "mejor")
- [ ] Testimonios con actor = disclaim "Dramatización" visible
- [ ] Números específicos verificables o con disclaimer
- [ ] Logo EffiCommerce presente
- [ ] Captions español en todos los videos
- [ ] URL final con UTMs correctos
- [ ] Pixel + CAPI verde en Events Manager
- [ ] Landing con aviso privacidad accesible
- [ ] Plantilla WA activa y aprobada por Meta (si CTA = Send Message)

---

## 10. Nota al trafficker

Todos los textos ya cumplen límites de Meta (primary text <2200, pero truncado visual en ~125; headline <40 recomendado; description <30 óptimo). Verificar responsive preview en cada ad antes de publicar.

Cualquier edición mayor → consultar con estratega para preservar el messaging framework.

**No crear ads nuevos sin que pasen por `estrategia/messaging-framework.md` primero.**
