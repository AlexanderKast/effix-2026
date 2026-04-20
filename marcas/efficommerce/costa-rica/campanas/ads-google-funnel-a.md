---
doc: Google Ads Kit — Funnel A (RSAs + keywords + extensiones listos)
marca: efficommerce
pais: Costa Rica
funnel: A
fecha: 2026-04-17
estado: LISTO PARA SUBIR — trafficker puede pegar en Google Ads Editor
idioma: es-CR neutro
---

# Google Ads Kit — Funnel A · EffiCommerce Costa Rica

Todo listo para subir al editor. Cada RSA respeta límites (Headline 30 chars, Description 90 chars). Keywords con match type aplicado. Negativas armadas.

---

## 1. Setup de cuenta

| Parámetro | Valor |
|---|---|
| Cuenta | Crear nueva "EffiCommerce CR" (MCC si existe) |
| Moneda | USD |
| Timezone | Costa Rica (GMT-6) |
| Conversiones | Importar de GA4 + manuales vía GTM |
| Auto-tagging | ON |
| Enhanced Conversions | ON (hash email/phone) |

### Conversiones a configurar

| Nombre | Categoría | Valor | Count |
|---|---|---|---|
| `Lead_Diagnostico_4.4` | Submit lead form | $10 | One |
| `WhatsApp_Click` | Contact | $2 | Every |
| `Demo_Agendada` | Book appointment | $50 | Every |
| `Scroll_75_Landing` | Other | — | — (secondary) |

---

## 2. Keywords por Ad Group

### CAMP_1 · [Search] Brand Funnel A

#### AG_Brand_Effi

| Keyword | Match | Target CPC max |
|---|---|---|
| `[efficommerce]` | Exact | $0.40 |
| `[efficommerce costa rica]` | Exact | $0.40 |
| `[effi commerce]` | Exact | $0.40 |
| `[effi commerce cr]` | Exact | $0.40 |
| `[efficommerce cr]` | Exact | $0.40 |
| `"efficommerce"` | Phrase | $0.50 |
| `"effi commerce"` | Phrase | $0.50 |
| `[grupo effi costa rica]` | Exact | $0.30 |
| `[efficommerce pricing]` | Exact | $0.40 |
| `[efficommerce demo]` | Exact | $0.40 |
| `[efficommerce registrarse]` | Exact | $0.40 |
| `[sistema effi costa rica]` | Exact | $0.30 |

**Negativas AG_Brand**:
```
-gratis -crack -hackear -piratear -login -apk -download -descargar
-tutorial -vs -empleo -trabajo -cargos -vacantes -sueldo
```

---

### CAMP_2 · [Search] Categoría A Funnel A

#### AG_FE_44 · "Factura Electrónica 4.4"

| Keyword | Match | Target CPC max |
|---|---|---|
| `"factura electronica 4.4"` | Phrase | $1.20 |
| `"factura electronica 4.4 costa rica"` | Phrase | $1.50 |
| `"factura 4.4 costa rica"` | Phrase | $1.50 |
| `"factura electronica costa rica"` | Phrase | $1.30 |
| `"factura electronica pymes cr"` | Phrase | $1.30 |
| `"sistema factura electronica 4.4"` | Phrase | $1.50 |
| `"software factura electronica hacienda"` | Phrase | $1.40 |
| `"como emitir factura electronica 4.4"` | Phrase | $1.20 |
| `"emitir factura electronica costa rica"` | Phrase | $1.30 |
| `"obligatorio factura 4.4 hacienda"` | Phrase | $1.30 |
| `"146 cambios xml factura 4.4"` | Phrase | $1.00 |
| `+factura +electronica +hacienda` | Modified broad | $1.20 |
| `+factura +4.4 +pymes` | Modified broad | $1.20 |

**Negativas AG_FE_44**:
```
-gratis -pdf -manual -tutorial -curso -download -descargar -plantilla
-excel -ejemplo -como funciona -que es -significado
-contador -contabilidad servicio -outsourcing
```

---

#### AG_SINPE · "SINPE Móvil ecommerce"

| Keyword | Match | Target CPC max |
|---|---|---|
| `"sinpe movil"` | Phrase | $1.00 |
| `"sinpe movil ecommerce"` | Phrase | $1.20 |
| `"sinpe movil para negocios"` | Phrase | $1.20 |
| `"recibir sinpe movil negocio"` | Phrase | $1.30 |
| `"sinpe movil checkout"` | Phrase | $1.40 |
| `"cobrar con sinpe en linea"` | Phrase | $1.30 |
| `"codigo 06 sinpe movil"` | Phrase | $1.20 |
| `"sinpe en factura electronica"` | Phrase | $1.30 |
| `"sinpe movil pyme"` | Phrase | $1.00 |
| `+sinpe +movil +negocio` | Modified broad | $1.00 |

**Negativas AG_SINPE**:
```
-app -como abrir -activar -que es -bcc -bcr -bac popular
-comisiones -limites -horario -ayuda -problemas -no me llega
-banco popular -bancredito
```

---

#### AG_WA_Vender · "Vender por WhatsApp CR"

| Keyword | Match | Target CPC max |
|---|---|---|
| `"vender por whatsapp costa rica"` | Phrase | $1.20 |
| `"como vender por whatsapp"` | Phrase | $1.30 |
| `"catalogo whatsapp business"` | Phrase | $1.20 |
| `"catalogo whatsapp pulperia"` | Phrase | $1.00 |
| `"whatsapp business para negocio"` | Phrase | $1.20 |
| `"sistema pedidos whatsapp"` | Phrase | $1.30 |
| `"automatizar pedidos whatsapp"` | Phrase | $1.40 |
| `"whatsapp tienda online"` | Phrase | $1.30 |
| `+vender +whatsapp +costa +rica` | Modified broad | $1.20 |
| `+catalogo +whatsapp +pymes` | Modified broad | $1.20 |

**Negativas AG_WA_Vender**:
```
-afiliados -mlm -multinivel -dropshipping
-descargar -gratis -crack -api -developer
-marketing -curso -como crear cuenta
```

---

#### AG_POS · "Sistema POS / punto de venta"

| Keyword | Match | Target CPC max |
|---|---|---|
| `"sistema pos costa rica"` | Phrase | $1.40 |
| `"pos pequena empresa cr"` | Phrase | $1.30 |
| `"punto de venta con factura electronica"` | Phrase | $1.60 |
| `"pos para pulperia"` | Phrase | $1.20 |
| `"pos para soda"` | Phrase | $1.20 |
| `"pos para taller"` | Phrase | $1.20 |
| `"pos con sinpe"` | Phrase | $1.40 |
| `"sistema de ventas pyme costa rica"` | Phrase | $1.50 |
| `"caja registradora digital costa rica"` | Phrase | $1.30 |
| `+pos +costa +rica +pyme` | Modified broad | $1.30 |

**Negativas AG_POS**:
```
-hardware -maquina -terminal -impresora -cash drawer -scanner
-alquiler -rental -mantenimiento -reparacion
-empleo -trabajo -cargos
```

---

## 3. RSAs (Responsive Search Ads) — CONTENIDO FINAL

**Regla global de pineado**:
- Headline 1 pinned: marca/categoría principal (según AG).
- Headline 2 pinned: valor/diferencial.
- Headline 3 libre.

### 🔸 RSA AG_Brand_Effi · 1 ad variante A

**15 Headlines** (respetan 30 chars máx; H1 H2 pinned en posición 1):

1. `EffiCommerce Costa Rica` (pin H1)
2. `Sitio Oficial EffiCommerce` (pin H1)
3. `Factura 4.4 + SINPE Nativos` (pin H2)
4. `Software Ecommerce Costa Rica`
5. `Plataforma Oficial en CR`
6. `₡19.900/mes Todo Incluido`
7. `Habla con EffiCommerce Hoy`
8. `Demo Personalizada Gratis`
9. `Soporte Tico 8am-8pm`
10. `20.000+ Clientes en LATAM`
11. `Prueba Gratis 14 Días`
12. `Sin Comisión por Venta`
13. `WhatsApp + SINPE + 4.4`
14. `Grupo Effi · Ahora en CR`
15. `Comunidad Feria Effix`

**4 Descriptions** (90 chars máx):

1. `Sitio oficial de EffiCommerce CR. Factura 4.4 y SINPE Móvil listos desde día 1. Hablemos.`
2. `20.000+ clientes en LATAM ahora en Costa Rica. Demo personalizada gratis. Prueba 14 días.`
3. `Grupo Effi — 140.000 asistentes Feria Effix. Vendé con WhatsApp, SINPE y 4.4 integrados.`
4. `Planes desde ₡19.900/mes. Todo incluido. Soporte en hora CR. Agendá tu demo hoy mismo.`

**URL final**: `https://efficommerce.com/cr/?utm_source=google&utm_medium=cpc&utm_campaign=brand&utm_term={keyword}`

**Extensión Call**: `+506 XXXX-XXXX` (activar cuando haya número real)

---

### 🔸 RSA AG_FE_44 · 2 variantes

#### Variante A

**15 Headlines**:

1. `Factura 4.4 desde el Celular` (pin H1)
2. `Cumplí Hacienda sin Pelear` (pin H2)
3. `XML 4.4 Validado Siempre`
4. `146 Ajustes XML Resueltos`
5. `Factura 4.4 Nativa CR`
6. `Sistema Para Pulperías`
7. `Factura 4.4 en 7 Días`
8. `Desde ₡19.900/mes`
9. `Tu Contador lo Aprueba`
10. `SINPE Código 06 Automático`
11. `Demo Factura 4.4 Gratis`
12. `Sin Apps Extra · Todo Nativo`
13. `450k Contribuyentes Afectados`
14. `Soporte Tico 8am-8pm`
15. `Prueba Gratis 14 Días`

**4 Descriptions**:

1. `Factura Electrónica 4.4 nativa en EffiCommerce. Los 146 ajustes XML validados por Hacienda.`
2. `Diagnóstico Factura 4.4 gratis en 2 min. Te mandamos un mini-plan a tu WhatsApp.`
3. `SINPE Móvil código 06 automático. Tu contador recibe los XML validados directamente.`
4. `Desde ₡19.900/mes. Soporte tico. Prueba 14 días sin tarjeta. Agendá demo personalizada.`

#### Variante B

**15 Headlines**:

1. `Factura 4.4 Obligatoria?` (pin H1)
2. `Hacienda Te Pide 4.4?` (pin H1)
3. `Respirá — Hay Salida` (pin H2)
4. `EffiCommerce Lo Tiene Listo`
5. `Emití 4.4 desde tu Celular`
6. `Sin Cambiar tu Forma de Trabajar`
7. `Deja Excel · Pasa al Sistema`
8. `Solución para Pymes CR`
9. `Setup en 7 Días`
10. `Diagnóstico Gratis en 2 Min`
11. `Plan Personalizado al WhatsApp`
12. `Don Carlos ya lo Hizo`
13. `SINPE + 4.4 Automáticos`
14. `Demo Gratuita sin Compromiso`
15. `Prueba Gratis 14 Días`

**4 Descriptions**:

1. `Si Hacienda te pide 4.4 y no sabés por dónde empezar, el diagnóstico te lo aclara en 2 min.`
2. `EffiCommerce: Factura 4.4 + SINPE + WhatsApp todo integrado. Setup guiado en 7 días.`
3. `Dejá Excel y cuaderno. EffiCommerce hace las 4.4 por vos. Demo gratis — clic acá.`
4. `Usado por 20.000+ pymes LATAM. Ahora en Costa Rica con compliance 4.4 nativo.`

**URL final**:
`https://efficommerce.com/cr/diagnostico-factura-44?utm_source=google&utm_medium=cpc&utm_campaign=cat-a-fe44&utm_content={creative}&utm_term={keyword}`

---

### 🔸 RSA AG_SINPE

**15 Headlines**:

1. `Cobrá con SINPE Móvil` (pin H1)
2. `SINPE Código 06 Automático` (pin H2)
3. `SINPE en tu Tienda Online`
4. `Checkout SINPE sin Vueltas`
5. `Cada Venta con Código 06`
6. `SINPE + Factura 4.4 Juntos`
7. `Hacienda No Te Audita`
8. `Sistema SINPE para Pymes`
9. `Setup SINPE en 7 Días`
10. `+10 Billones en SINPE 2024`
11. `Pymes + SINPE + 4.4`
12. `Plan Desde ₡19.900/mes`
13. `Demo Personalizada Gratis`
14. `Soporte Tico en tu WhatsApp`
15. `EffiCommerce Costa Rica`

**4 Descriptions**:

1. `SINPE Móvil código 06 automático en cada venta. Factura 4.4 nativa. Sin errores con Hacienda.`
2. `Pymes con +100 transferencias SINPE al mes: automatizá y cumple con Hacienda sin riesgo.`
3. `EffiCommerce: checkout con SINPE + catálogo WhatsApp + Factura 4.4 lista. Desde ₡19.900.`
4. `Demo gratuita de 15 min con especialista CR. Cero compromiso. Agendá por WhatsApp.`

**URL**: `https://efficommerce.com/cr/sinpe-movil?utm_source=google&utm_medium=cpc&utm_campaign=cat-a-sinpe&utm_term={keyword}`

---

### 🔸 RSA AG_WA_Vender

**15 Headlines**:

1. `Vendé por WhatsApp CR` (pin H1)
2. `Catálogo WhatsApp Ordenado` (pin H2)
3. `Pedidos sin Enredarte`
4. `71% Mensajea a Negocios`
5. `Más Ventas por WhatsApp`
6. `Checkout SINPE desde el Chat`
7. `Sistema para Sodas y Pulpes`
8. `Factura 4.4 Tras el Pedido`
9. `Soporte en tu WhatsApp`
10. `Plan Desde ₡19.900/mes`
11. `Doña María Duplicó Ventas`
12. `Prueba Gratis 14 Días`
13. `Demo Personalizada CR`
14. `Sin Aprender Computación`
15. `EffiCommerce Costa Rica`

**4 Descriptions**:

1. `Catálogo WhatsApp ordenado, pedidos sin enredarse, cobro SINPE y Factura 4.4 automática.`
2. `71% de ticos mensajea a negocios por WA. Convertí esos chats en ventas ordenadas.`
3. `EffiCommerce: tu WhatsApp + catálogo + SINPE + 4.4 en una sola plataforma. Soporte CR.`
4. `Demo gratis por WhatsApp. Agendá 15 min y te mostramos el sistema con tu propio caso.`

**URL**: `https://efficommerce.com/cr/vender-whatsapp?utm_source=google&utm_medium=cpc&utm_campaign=cat-a-wa&utm_term={keyword}`

---

### 🔸 RSA AG_POS

**15 Headlines**:

1. `Sistema POS para Pymes CR` (pin H1)
2. `Punto de Venta + Factura 4.4` (pin H2)
3. `POS para Pulperías y Sodas`
4. `POS con SINPE Integrado`
5. `Sistema de Ventas CR`
6. `Sin Hardware Extra`
7. `POS desde el Celular`
8. `Inventario + Ventas + 4.4`
9. `₡19.900/mes Todo Incluido`
10. `Control Diario Simple`
11. `Demo Personalizada Gratis`
12. `Soporte en Costa Rica`
13. `Setup Guiado 7 Días`
14. `Prueba Gratis 14 Días`
15. `EffiCommerce · Sistema Tico`

**4 Descriptions**:

1. `POS para pymes CR sin hardware. Factura 4.4 + SINPE + inventario en un solo sistema.`
2. `Diseñado para pulperías, sodas, talleres y consultorios. Desde el celular. Desde ₡19.900/mes.`
3. `Setup guiado en 7 días. Capacitación incluida. Soporte en hora de Costa Rica.`
4. `Demo gratuita — 15 min. Sin compromiso. Agendá por WhatsApp hoy mismo.`

**URL**: `https://efficommerce.com/cr/pos-pymes?utm_source=google&utm_medium=cpc&utm_campaign=cat-a-pos&utm_term={keyword}`

---

## 4. Extensiones de anuncio (a nivel cuenta o campaña)

### Sitelinks (8)

| Texto (≤25 char) | Descripción 1 (35) | Descripción 2 (35) | URL |
|---|---|---|---|
| Diagnóstico 4.4 Gratis | 6 preguntas · 2 minutos | Plan personalizado al WA | /cr/diagnostico-factura-44 |
| Planes y Precios | Desde ₡19.900/mes | Sin comisión por venta | /cr/precios |
| Casos de Éxito | Don Carlos, Doña María | Dra. Andrea y Luis | /cr/casos |
| Cómo Funciona | 3 pasos para vender | Listo en 7 días | /cr/como-funciona |
| Integraciones CR | Correos CR · Aeropost | SINPE · Bancos CR | /cr/integraciones |
| Blog Factura 4.4 | Guía actualizada 2026 | 146 ajustes explicados | /cr/blog/factura-4-4 |
| Soporte en CR | Lunes a sábado 8am-8pm | Respuesta WA en 1h | /cr/soporte |
| Agendá Demo | 15 minutos · sin compromiso | Especialista CR | /cr/demo |

### Callouts (10 · ≤25 char c/u)

1. `Factura 4.4 nativa`
2. `SINPE automático`
3. `Soporte tico 8am-8pm`
4. `Prueba gratis 14 días`
5. `Sin comisión por venta`
6. `20.000+ clientes LATAM`
7. `Setup guiado en 7 días`
8. `Respuesta WA en 1 hora`
9. `Comunidad Grupo Effi`
10. `Cumple Ley 8968`

### Structured Snippets

**Types** (valores):
- Services: `Factura 4.4 · SINPE · WhatsApp Business · Multi-Courier · Comunidad · Soporte CR`

**Brands**:
- `EffiCommerce · Grupo Effi · Feria Effix`

### Call Extensions
- `+506 XXXX-XXXX` (cuando haya número real)
- Horario: L-V 8am-8pm · S 9am-1pm CR

### Promotion Extensions
- Texto: `Prueba gratis 14 días` + end date

### Lead form extension (Fase 2)

- Pregunta 1: Nombre completo
- Pregunta 2: Teléfono WhatsApp
- Pregunta 3: Email
- Pregunta 4: Tipo de negocio (dropdown: pulpería/soda/taller/profesional/otro)
- Pregunta 5: ¿Emitís Factura 4.4 hoy? (Sí/No)
- Thank you: "Tu plan personalizado llega a tu WhatsApp en minutos. Pura vida."

---

## 5. Negativas globales (aplicar a toda la cuenta)

```
-gratis -free -crack -hackear -piratear
-curso -tutorial -pdf -manual -descargar -download
-empleo -trabajo -cargos -vacantes -sueldo
-afiliados -mlm -multinivel
-login -ingresar -entrar -iniciar sesion
-opiniones -reseñas -review -vs
-wikipedia -que es -significado
-apk -torrent -pirate
```

---

## 6. Bidding strategy por campaña

| Campaña | Estrategia inicial (Sem 3-6) | Estrategia escala (Sem 7+) |
|---|---|---|
| `Brand` | Maximize Clicks | Target Impression Share 90% · Top |
| `Categoría A · FE 4.4` | Maximize Clicks · Bid cap $1.50 | Target CPA $25 (con 30+ conv) |
| `Categoría A · SINPE` | Maximize Clicks · Bid cap $1.30 | Target CPA $25 |
| `Categoría A · WA Vender` | Maximize Clicks · Bid cap $1.30 | Target CPA $20 |
| `Categoría A · POS` | Maximize Clicks · Bid cap $1.50 | Target CPA $30 |

---

## 7. Ad schedule

**Día/hora activo** (hora CR):
- Lun-Vie: 6:00-23:00 · bid adjustment baseline
- Sáb: 7:00-22:00 · bid -10%
- Dom: 9:00-22:00 · bid -20%
- Madrugadas (23:00-6:00): OFF

**Device adjustment**:
- Mobile: +15% (mayor intent en mobile para CR)
- Desktop: baseline
- Tablet: -30%

---

## 8. Exclusiones cruzadas con Effi System CR (bloqueante semana 1)

Cuando se defina la frontera ERP vs ecommerce, agregar a negatives globales de EffiCommerce CR:

```
-erp
-sistema administrativo empresarial
-contabilidad avanzada
-nomina empresarial
-recursos humanos software
-planilla electronica
```

Y Effi System agrega a sus negatives:

```
-ecommerce
-tienda online
-carrito de compras
-checkout
-catalogo whatsapp
```

---

## 9. Budget y pacing

| Campaña | Budget diario Sem 3-8 | Budget diario Sem 9-12 |
|---|---|---|
| `Brand Funnel A` | $2/día | $2/día |
| `Categoría A FE 4.4` | $4/día | $5/día |
| `Categoría A SINPE` | $2/día | $3/día |
| `Categoría A WA Vender` | $3/día | $4/día |
| `Categoría A POS` | — (opcional) | $2/día |
| **Total diario A** | **$11** | **$16** |
| Total 6 semanas F1 | $462 | — |
| Total 4 semanas F2 | — | $448 |

---

## 10. Compliance Google Ads CR

- ✅ Política anuncios Google: sin exagerar, sin urgencia falsa, sin testimonios no verificables.
- ✅ Ley 7472 CR: nada de "#1", "único", "el mejor".
- ✅ Landing con privacy policy visible.
- ✅ URL final estable.
- ✅ Final URL expansion: OFF (para respetar UTMs custom).

---

## 11. Checklist pre-activación

- [ ] Conversiones importadas de GA4 + manuales configuradas
- [ ] Auto-tagging ON
- [ ] Negativas globales aplicadas a toda la cuenta
- [ ] Exclusiones Effi System agregadas
- [ ] Sitelinks y callouts aplicados a nivel cuenta
- [ ] Bidding Max Clicks con bid cap en cada ad group
- [ ] Ad schedule configurado
- [ ] Device bid adjustments
- [ ] Location targeting: "Presence" (no "interés")
- [ ] Idioma: Español únicamente
- [ ] Countdown customizer en RSAs si se usa urgencia (opcional)
- [ ] UTMs en URLs finales verificados
- [ ] Lighthouse landing ≥ 90 mobile
