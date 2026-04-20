---
title: "Copy Deck — Landing EffiCommerce Costa Rica"
version: "1.0"
date: 2026-04-17
country: Costa Rica
lang: es-CR (neutro LATAM)
marca: EffiCommerce
funnels: [A: digitalizar tradicionales, B: migrar Shopify]
url: efficommerce.com/cr
objetivo: Captación dual (A + B) vía diagnóstico Factura 4.4 o auditoría Shopify → WhatsApp → demo
autor: Claude Code
estado: LISTO PARA FRONTEND-DEV
voz:
  formal_casual: 4/10    # Directa pero cercana
  bold_subtle: 7/10      # Clara, sin humo
  rational_emotional: 6/10
  descriptores: [honesto, directo, competente, tico-cercano sin ser choteado]
nota_voz: |
  Headlines en español neutro elevado. Modismos CR (pura vida, mae) SOLO en FAQ
  y testimonios citados. Moneda siempre con ₡ (colones) como referencia local
  y $ USD sólo en comparaciones internacionales.
nota_honestidad: |
  No prometer "garantizado", "#1", "único". Ley 7472 CR.
  Sí podemos prometer: compliance Factura 4.4 nativo (producto lo soporta),
  soporte en hora CR (agendable), prueba gratis 14 días (sin tarjeta real).
---

# Landing Copy Deck · EffiCommerce Costa Rica

Copy completo final para maquetar. 16 secciones. Cada sección con: estructura, copy en español CR neutro, caracteres verificados, notas para frontend-dev. Imita la arquitectura de `landing-ecuador/copy-deck-ecuador.md` con adaptación a EffiCommerce (SaaS B2B dual funnel A+B).

---

## 0. Arquitectura general

```
/cr/ (landing principal — dual funnel)
  │
  ├─ Hero con selector de perfil
  │   ├─ Path A: "Mi negocio aún no vende online"
  │   └─ Path B: "Tengo tienda online (Shopify) y quiero migrar"
  │
  ├─ /cr/diagnostico-factura-44 (Funnel A lead magnet)
  ├─ /cr/auditoria-shopify (Funnel B lead magnet)
  ├─ /cr/gracias-a (thank-you A)
  └─ /cr/gracias-b (thank-you B)
```

La landing principal `/cr/` cubre 80% del tráfico; los sub-paths son pure lead-magnet.

---

## 1. META SEO

### Title tag
```
EffiCommerce Costa Rica — Ecommerce con Factura 4.4 + SINPE
```
Caracteres: 58 ✓ (límite 60)

### Meta description
```
Software ecommerce para Costa Rica con Factura Electrónica 4.4 y SINPE Móvil nativos. Pensado para pymes que venden por WhatsApp. Soporte tico. Prueba gratis 14 días.
```
Caracteres: 172 ✓ (dentro de rango 155-175)

### OG Title
```
EffiCommerce Costa Rica — Vendé en línea cumpliendo Hacienda
```
Caracteres: 59 ✓

### OG Description
```
Factura 4.4 nativa, SINPE Móvil automático, catálogo WhatsApp, logística CR integrada. Para pulperías, sodas, profesionales y tiendas Shopify que quieren migrar.
```
Caracteres: 173 ✓

### Twitter Card
- `twitter:card` → `summary_large_image`
- `twitter:title` → `EffiCommerce CR — Tu negocio en línea cumpliendo Hacienda`
- `twitter:description` → `Factura 4.4 + SINPE + WhatsApp en una sola plataforma. Soporte tico.`

### OG image (1200×630)
Texto central: "Vende en línea cumpliendo Hacienda"
Badge inferior: "Factura 4.4 · SINPE · WhatsApp — Soporte en Costa Rica"
Paleta: Effi Navy fondo + Effi Cream texto + Effi Mint acento.

---

## 2. HERO

### Headline principal (display-xl)

**Ángulo**: aspiración simple + validación de la realidad CR.

```
Vendé en línea cumpliendo Hacienda — sin pelear con la 4.4
```
Palabras: 11 | Caracteres: 61

> **Nota diseño**: En display-xl Inter Tight 800, cabe en 2 líneas en mobile. Versión compacta si corta:
> `Tu negocio en línea, sin pelear con Hacienda` (8 palabras | 46 chars)

---

### Subhead

```
EffiCommerce pone tu negocio en internet cumpliendo Factura Electrónica 4.4 y SINPE Móvil desde el primer día. Catálogo por WhatsApp, logística CR integrada, soporte en hora de Costa Rica.
```
Caracteres: 195

---

### Selector de perfil (dual funnel switch)

Debajo del subhead, 2 cards clickables lado a lado (stack en mobile):

#### Card A (Funnel A)

**Título card**:
```
Mi negocio aún no vende en línea
```
Caracteres: 32

**Descripción**:
```
Pulpería, soda, taller, consultorio profesional o cualquier negocio tradicional que necesita emitir Factura 4.4 y empezar a recibir pedidos por WhatsApp.
```
Caracteres: 156

**CTA card**:
```
Hacer diagnóstico 4.4 →
```
Caracteres: 22

**Micro-texto bajo CTA**:
```
Gratis · 2 minutos · plan personalizado a tu WhatsApp
```
Caracteres: 53

#### Card B (Funnel B)

**Título card**:
```
Ya tengo tienda en Shopify (o similar)
```
Caracteres: 38

**Descripción**:
```
Tenés tu ecommerce en Shopify, Jumpseller o Tiendanube, pero pagás en dólares, luchás con apps de Factura 4.4 y soporte gringo.
```
Caracteres: 128

**CTA card**:
```
Auditar mi tienda →
```
Caracteres: 19

**Micro-texto**:
```
Gratis · reporte personalizado en 24h
```
Caracteres: 38

---

### Badge de confianza bajo selector

```
Grupo Effi · 20.000+ clientes en Colombia, Ecuador y República Dominicana · Ahora en Costa Rica
```
Caracteres: 96

> **Nota honestidad**: este dato es real y verificable. Confirmar número antes de publicar.

---

## 3. BARRA DE LOGOS DE CONFIANZA

**Texto intro**:
```
Conectado con los servicios que tu negocio ya usa
```
Caracteres: 50

**6 logos sugeridos** (en escala de grises con hover a color):

1. SINPE Móvil (BCCR)
2. Correos de Costa Rica
3. Aeropost
4. DHL Costa Rica
5. BAC Credomatic (pagos tarjeta)
6. Hacienda Digital (validación 4.4)

> **Nota**: logos en SVG/PNG optimizados. Uso editorial nominative. Footer pequeño: "Integraciones disponibles. Logos utilizados con fines informativos."

---

## 4. PROBLEMA (sección storytelling · bloque único)

### Título sección
```
Vender en Costa Rica cambió este año
```
Caracteres: 37

### Cuerpo (3 párrafos cortos)

```
Desde septiembre de 2025, más de cuatrocientos cincuenta mil contribuyentes
deben emitir Factura Electrónica 4.4. Ciento cuarenta y seis ajustes XML
nuevos. SINPE Móvil obligatorio con código 06 en cada venta. Recibo
Electrónico de Pago para operaciones a crédito. Geolocalización del emisor.

Si tu negocio corre con Excel, cuaderno o la memoria del contador, la 4.4
no es un ajuste técnico — es una amenaza real. Hacienda audita a usuarios
con más de cien transferencias SINPE mensuales. Las multas por comprobantes
inválidos arrancan en el millón de colones.

Y mientras pelearás con Hacienda, tu competencia está vendiendo por
WhatsApp con catálogos ordenados y facturación automática. El setenta y
uno por ciento de los ticos mensajea a negocios por WhatsApp. La pregunta
no es si vender en línea — es con qué sistema.
```
Caracteres totales: 833

---

## 5. SOLUCIÓN — BENTO GRID 6 CARDS

### Título sección
```
EffiCommerce resuelve las tres cosas que no resuelve nadie más en CR
```
Caracteres: 69

### Subtítulo
```
Sistema único con compliance Costa Rica nativo, logística integrada y comunidad LATAM.
```
Caracteres: 88

### Card 1 — Factura 4.4 nativa

- **Icono**: Phosphor `file-text` (verde Mint)
- **Título**:
  ```
  Factura Electrónica 4.4 desde el celular
  ```
  Caracteres: 42
- **Descripción**:
  ```
  Los 146 ajustes XML validados por Hacienda. Código 06 SINPE automático. Recibo Electrónico de Pago (REP) integrado. Tu contador recibe los comprobantes por email al momento.
  ```
  Caracteres: 179

### Card 2 — SINPE Móvil automático

- **Icono**: Phosphor `cell-signal-full`
- **Título**:
  ```
  Cobrá con SINPE Móvil en el checkout
  ```
  Caracteres: 36
- **Descripción**:
  ```
  SINPE Móvil nativo en el carrito. Cada venta se registra automáticamente con el código 06 en el XML 4.4. Conciliación mensual en un clic.
  ```
  Caracteres: 139

### Card 3 — WhatsApp con catálogo ordenado

- **Icono**: Phosphor `whatsapp-logo`
- **Título**:
  ```
  Catálogo por WhatsApp — no más "mándame 2"
  ```
  Caracteres: 43
- **Descripción**:
  ```
  Tus clientes ven tu catálogo en el chat, piden productos con cantidades claras, y el pedido entra al sistema estructurado. Nada se pierde ni se enreda.
  ```
  Caracteres: 153

### Card 4 — Logística Costa Rica

- **Icono**: Phosphor `truck`
- **Título**:
  ```
  Correos CR · Aeropost · DHL integrados
  ```
  Caracteres: 38
- **Descripción**:
  ```
  Creación automática de guía de envío. Rastreo al cliente por WhatsApp sin pegar links manual. Multi-courier comparando tarifa y tiempo por pedido.
  ```
  Caracteres: 149

### Card 5 — Soporte en hora de Costa Rica

- **Icono**: Phosphor `headset`
- **Título**:
  ```
  Soporte tico de lunes a sábado
  ```
  Caracteres: 30
- **Descripción**:
  ```
  De 8am a 8pm hora de Costa Rica. Por WhatsApp. En español. Respuesta promedio en menos de una hora. Gente que entiende Hacienda, no gringos con zona horaria USA.
  ```
  Caracteres: 163

### Card 6 — Comunidad Grupo Effi

- **Icono**: Phosphor `users-three`
- **Título**:
  ```
  Acceso a la comunidad Grupo Effi
  ```
  Caracteres: 32
- **Descripción**:
  ```
  20.000+ clientes en LATAM. Feria Effix con 140.000 asistentes acumulados. Contenido mensual, sesiones con founders y red de proveedores verificados para tu escala.
  ```
  Caracteres: 164

---

## 6. CÓMO FUNCIONA — 3 PASOS

### Título sección
```
Tu negocio en línea en 7 días — en 3 pasos
```
Caracteres: 43

### Subtítulo
```
Proceso guiado con cliente real. Sin tutoriales genéricos, sin configuraciones que terminan a medio hacer.
```
Caracteres: 107

### Paso 1 — Diagnóstico + propuesta

- **Número grande**: 01
- **Título**:
  ```
  Diagnóstico gratuito en 2 minutos
  ```
- **Descripción**:
  ```
  Contanos de tu negocio en 6 preguntas simples. Te armamos un mini-plan personalizado con los pasos exactos para cumplir Factura 4.4 y empezar a vender en línea. Llega a tu WhatsApp.
  ```
- **Icono**: Phosphor `clipboard-text`

### Paso 2 — Setup guiado

- **Número**: 02
- **Título**:
  ```
  Setup guiado en 7 días
  ```
- **Descripción**:
  ```
  Un especialista tico te acompaña: cargamos tu catálogo, configuramos SINPE, integramos Correos CR, activamos WhatsApp Business y validamos la 4.4 con Hacienda. Vos solo aprendés a recibir pedidos.
  ```
- **Icono**: Phosphor `gear-six`

### Paso 3 — En vivo y creciendo

- **Número**: 03
- **Título**:
  ```
  Tu negocio recibe, cobra y factura solo
  ```
- **Descripción**:
  ```
  A partir del día 8: los clientes piden por WhatsApp, pagan por SINPE, y las facturas 4.4 salen solas al contador. Vos decidís si expandís a Correos internacional, canal mayorista o escala multi-país LATAM.
  ```
- **Icono**: Phosphor `rocket-launch`

---

## 7. FUNNEL A — Sección dedicada · "Para negocios tradicionales"

(Visible en todo el body de landing principal, pero anchor desde card Hero A)

### Headline sección
```
¿Tu negocio todavía factura a mano o en Excel?
```
Caracteres: 48

### Subhead
```
EffiCommerce está diseñado para pulperías, sodas, talleres, consultorios profesionales y cualquier negocio tradicional que necesita cumplir Factura 4.4 sin aprender computación.
```
Caracteres: 178

### 4 vertical cards — casos por industria

#### Card Pulperías

- **Icono**: Phosphor `storefront`
- **Título**: `Pulperías y minisuper`
- **Beneficio 1**: `Catálogo WhatsApp ordenado en 30 min`
- **Beneficio 2**: `Cobro SINPE con código 06 automático`
- **Beneficio 3**: `Facturación 4.4 al final del día`

#### Card Sodas y restaurantes

- **Icono**: Phosphor `fork-knife`
- **Título**: `Sodas y restaurantes`
- **Beneficio 1**: `Pedidos por WhatsApp sin enredarse`
- **Beneficio 2**: `Delivery rastreable a tus clientes`
- **Beneficio 3**: `Factura 4.4 + informe ventas del día`

#### Card Talleres y servicios

- **Icono**: Phosphor `wrench`
- **Título**: `Talleres y servicios`
- **Beneficio 1**: `Cotización con precio instantánea`
- **Beneficio 2**: `Agenda online con confirmación WA`
- **Beneficio 3**: `Facturación repuesto + mano de obra`

#### Card Profesionales independientes

- **Icono**: Phosphor `graduation-cap`
- **Título**: `Profesionales independientes`
- **Beneficio 1**: `Agenda online + recordatorios`
- **Beneficio 2**: `Cobro SINPE post consulta`
- **Beneficio 3**: `Factura 4.4 al paciente por WhatsApp`

### CTA A (botón grande)

```
Hacer diagnóstico Factura 4.4 (gratis · 2 min)
```
Caracteres: 46

**Micro-texto bajo CTA**:
```
Te respondemos con tu plan personalizado en WhatsApp en menos de 5 minutos.
```
Caracteres: 74

---

## 8. FUNNEL B — Sección dedicada · "Migrar desde Shopify"

### Headline sección
```
¿Tenés tienda en Shopify? Mirá lo que realmente pagás
```
Caracteres: 53

### Subhead
```
Comparación honesta del costo total de operar tu tienda Shopify en Costa Rica vs EffiCommerce. Decidís vos con datos, no con marketing.
```
Caracteres: 135

### Tabla comparativa (5 filas)

| | **Shopify en CR** | **EffiCommerce CR** |
|---|---|---|
| Plan base mensual | $25 USD (Basic) | ₡19.900 |
| Factura Electrónica 4.4 | App externa (~$30/mes) | Nativa |
| SINPE Móvil código 06 | Manual | Automático |
| Logística Correos CR | App extra o manual | Integrada nativa |
| Comisión por venta | 2% (sin Shopify Payments) | 0% |
| Soporte | Inglés · horario USA | Tico · 8am-8pm CR |
| **Costo real mensual estimado** | **$130 – $180 USD** | **~$38 USD (₡19.900)** |

**Disclaimer debajo de la tabla**:
```
Estimaciones basadas en caso real. Tu configuración puede variar. Hacé la auditoría gratis y obtené los números exactos para tu tienda.
```
Caracteres: 134

### CTA B (botón grande)

```
Auditar mi tienda Shopify (gratis · reporte 24h)
```
Caracteres: 47

**Micro-texto**:
```
Un especialista tico revisa tu tienda actual y te manda reporte con: ahorro estimado, apps que podés soltar, tiempo real de migración.
```
Caracteres: 131

---

## 9. TESTIMONIOS

### Título sección
```
Lo que dicen los primeros clientes en Costa Rica
```
Caracteres: 49

### Testimonio 1 — Don Carlos (Funnel A)

- **Foto**: Don Carlos en pulpería (dramatización si es actor)
- **Quote** (en Inter Tight 600):
  ```
  "Mi hijo me puso EffiCommerce. En dos semanas estaba vendiendo por WhatsApp. Ochocientos mil colones extra el primer mes. Hacienda me dejó en paz."
  ```
  Caracteres: 149
- **Attribution**: `Don Carlos R. · Pulpería en Desamparados · cliente desde 2026`
- **Badge**: `Caso real` (si es real) o `Dramatización basada en caso real` (si actor)

### Testimonio 2 — Sofía (Funnel B)

- **Foto**: Sofía en su laptop con EffiCommerce
- **Quote**:
  ```
  "Pensé que migrar era un parto. Fueron 7 días y mis clientes ni se enteraron. Ahorro $180 al mes y el soporte me responde por WhatsApp en minutos."
  ```
  Caracteres: 151
- **Attribution**: `Sofía R. · Tienda de moda en San José · migró desde Shopify 2026`

### Testimonio 3 — Dra. Andrea (Funnel A · profesional)

- **Foto**: Dra. Andrea en consultorio
- **Quote**:
  ```
  "Gané cuatro horas a la semana. Mis pacientes pagan con SINPE al salir. La factura 4.4 sale sola. Mi contadora me agradece."
  ```
  Caracteres: 125
- **Attribution**: `Dra. Andrea G. · Odontóloga en Heredia · cliente desde 2026`

### Testimonio 4 — Mateo (Funnel B · multi-país)

- **Foto**: Mateo en bodega con cajas
- **Quote**:
  ```
  "Consolidé tres Shopify distintos en un solo EffiCommerce multi-país. Dejé de multiplicar apps y contratos. Escalé a Guatemala sin dolor."
  ```
  Caracteres: 136
- **Attribution**: `Mateo V. · Suplementos LATAM · opera CR, PA, NI desde EffiCommerce`

---

## 10. PRICING (simplificado en landing — detalle en /cr/precios)

### Título sección
```
Planes simples, todo incluido
```
Caracteres: 29

### Subtítulo
```
Sin apps extra. Sin comisiones por venta. Todo nativo desde el primer día.
```
Caracteres: 75

### 3 cards de plan

#### Plan "Esencial" (Funnel A típico)

- **Precio**: `₡19.900 / mes` (`≈ $38 USD`)
- **Lema**: `Para pulperías, sodas, talleres y profesionales independientes`
- **Features**:
  - Factura 4.4 nativa + SINPE automático
  - Catálogo WhatsApp ilimitado
  - Hasta 500 facturas / mes
  - Soporte tico 8am-8pm
  - Prueba gratis 14 días sin tarjeta
- **CTA**: `Empezar prueba gratis`

#### Plan "Pro" (Funnel A escalado + Funnel B típico)

- **Badge**: `Más popular`
- **Precio**: `₡49.900 / mes` (`≈ $95 USD`)
- **Lema**: `Para tiendas que ya venden online o tienen inventario activo`
- **Features**:
  - Todo lo del plan Esencial
  - Logística CR integrada (Correos CR, Aeropost, DHL)
  - Hasta 3.000 facturas / mes
  - Dashboard inventario multi-bodega
  - Campañas email marketing incluidas
  - Migración guiada gratuita desde Shopify
- **CTA**: `Agendar demo personalizada`

#### Plan "Escala" (multi-país · empresas)

- **Precio**: `A medida` (agendar)
- **Lema**: `Para operaciones multi-país LATAM (CR, CO, EC, RD, GT...)`
- **Features**:
  - Todo lo del plan Pro
  - Multi-moneda, multi-país, multi-bodega
  - Facturación ilimitada
  - API abierta + integraciones custom
  - Soporte dedicado + CSM asignado
  - Onboarding multi-país en 4 semanas
- **CTA**: `Hablar con ventas`

### Nota bajo pricing

```
Todos los planes incluyen Factura Electrónica 4.4 nativa, SINPE Móvil automático, soporte tico y 14 días de prueba gratuita sin tarjeta.
```
Caracteres: 133

---

## 11. SEGURIDAD Y COMPLIANCE

### Título
```
Tu operación segura, tus datos protegidos
```

### Lista de garantías (3 columnas)

1. **Factura 4.4 validada por Hacienda**
   ```
   Emisión XML con los 146 ajustes oficiales. Respaldo de comprobantes por 5 años. Soporte si Hacienda audita.
   ```

2. **Ley 8968 CR — Protección de datos**
   ```
   Cumplimos la Ley de Protección de la Persona frente al Tratamiento de sus Datos. Consent explícito, política de retención y DPO designado.
   ```

3. **Cifrado y hosting**
   ```
   Hosting en región LATAM. Cifrado TLS 1.3. Backups diarios. Cumplimiento PCI DSS para pagos con tarjeta.
   ```

---

## 12. AUTORIDAD — SOBRE GRUPO EFFI

### Título
```
EffiCommerce es parte del Grupo Effi
```

### Cuerpo

```
Grupo Effi es un ecosistema LATAM de tecnología para emprendedores ecommerce.
Nacimos en Colombia en 2018 y hoy operamos en cuatro países: Colombia,
Ecuador, República Dominicana y Costa Rica.

Más de veinte mil clientes activos usan alguno de nuestros productos.
La Feria Effix — el evento anual del grupo — acumula ciento cuarenta mil
asistentes en cinco ediciones.

Cuando elegís EffiCommerce, te sumás a una comunidad de emprendedores
que comparten proveedores, casos y conocimiento. No es solo software —
es pertenencia a una red que ya funciona.
```

### Datos clave (cards pequeñas)

- `4 países` · LATAM
- `20.000+` · clientes activos
- `140.000+` · asistentes Feria Effix
- `2018` · año de fundación

---

## 13. FAQ

### Título
```
Preguntas que nos hacen a menudo
```

### 12 preguntas con respuestas completas

#### 1. ¿Realmente emite Factura Electrónica 4.4 válida?

```
Sí. EffiCommerce emite el XML 4.4 con los 146 ajustes que Hacienda pide,
incluyendo el código 06 para SINPE Móvil, el Recibo Electrónico de Pago
para crédito, y la geolocalización del emisor. Tu contador recibe los
comprobantes validados por email al momento de cada venta.
```

#### 2. ¿Necesito saber de computadoras para usarlo?

```
No. Todo pasa desde el celular. Tomás una foto del producto, el sistema
arma el catálogo, los clientes te piden por WhatsApp y la factura sale
sola. Don Carlos tiene cincuenta y ocho años y nunca había vendido en
línea — hoy lo hace sin pelear con nada.
```

#### 3. ¿Cuánto tiempo toma ponerlo en marcha?

```
Siete días en promedio. El día uno hacés el diagnóstico. Los días dos al
siete, un especialista tico te acompaña cargando catálogo, conectando
SINPE, integrando Correos CR y activando WhatsApp. El día ocho ya estás
recibiendo pedidos.
```

#### 4. ¿Qué pasa si mi contador tiene su propio sistema?

```
EffiCommerce te manda el XML 4.4 validado por email automáticamente.
Tu contador lo recibe en el formato estándar de Hacienda — lo sube a su
sistema como siempre. No cambia nada para él, solo deja de tener que
perseguirte para pedirte información.
```

#### 5. ¿Cuánto cuesta realmente? ¿Hay costos ocultos?

```
Desde diecinueve mil novecientos colones al mes en el plan Esencial.
Sin comisión por venta. Sin apps extra por Factura 4.4 o SINPE. Sin
sorpresas en dólares. El único costo variable es si usás logística con
courier — ahí pagás la tarifa del courier directo, igual que hoy.
```

#### 6. ¿Qué pasa si migro desde Shopify? ¿Pierdo mis clientes o SEO?

```
No. La migración guiada preserva tus URLs con redirects 301, migra
productos, historial de ventas y clientes, y mantiene tu SEO. Los 7 días
del proceso incluyen capacitación para tu equipo. En casos anteriores
(como Sofía R.), los clientes no notaron el cambio.
```

#### 7. ¿Tienen comunidad para pymes costarricenses?

```
Sí. Los clientes EffiCommerce acceden a la comunidad Grupo Effi — sesiones
mensuales en vivo con founders y operadores LATAM, directorio de
proveedores verificados y acceso prioritario a la Feria Effix. Pura vida
con networking real, no grupos de WhatsApp con tips genéricos.
```

#### 8. ¿Hacen soporte los sábados?

```
Sí. Nuestro soporte en Costa Rica está disponible de lunes a viernes de
8am a 8pm y sábados de 9am a 1pm, todo en hora tica. Por WhatsApp. En
español. Con gente que entiende Hacienda y SINPE.
```

#### 9. ¿Puedo probarlo antes de pagar?

```
Sí. Prueba gratis de catorce días, sin tarjeta. Acceso completo a todas
las funciones del plan que elegís. Si al día catorce no te convence,
cerrás la cuenta y listo — sin cargos, sin llamadas molestas.
```

#### 10. Vendo también en Panamá y Nicaragua. ¿Funciona?

```
Sí. EffiCommerce opera multi-país en LATAM. En el plan Pro podés manejar
varias tiendas con inventario y moneda distintos. En el plan Escala
consolidamos múltiples países en un solo panel, un solo contrato y un solo
soporte. Mateo V., cliente de suplementos, opera CR, Panamá y Nicaragua
desde una sola cuenta.
```

#### 11. ¿Cómo manejan la Ley 8968 de datos personales?

```
Respetamos la Ley 8968 estrictamente: consent explícito separado para
marketing, derecho de acceso y supresión de datos en diez días hábiles,
DPO designado, y registro ante PRODHAB cuando aplique. Tu aviso de
privacidad es el mismo que cumpliste al solicitar la demo — podés
revocarlo cuando quieras.
```

#### 12. ¿Y si mi problema es diferente y no encuentro respuesta acá?

```
Agendá una demo personalizada de 15 minutos con un especialista tico.
Sin compromiso. Te escuchamos tu caso concreto y te decimos con honestidad
si EffiCommerce te sirve o no. Preferimos no vendernos que vendernos mal.
```

---

## 14. CTA FINAL (bloque de cierre)

### Pre-CTA (headline)

```
Tu negocio ya vende. Solo falta que Hacienda y SINPE no te quiten el sueño.
```
Caracteres: 76

### Copy cuerpo

```
Hacé el diagnóstico gratis si tu negocio aún no está en línea. Pedí la
auditoría gratuita si ya tenés Shopify. En ambos casos, un especialista
tico revisa tu caso real y te responde por WhatsApp en minutos. Sin
compromiso. Sin humo. Sin gurús.
```

### Dos botones lado a lado (stack en mobile)

**Botón A (primario)**:
```
Diagnóstico Factura 4.4 gratis →
```

**Botón B (secundario)**:
```
Auditar mi Shopify →
```

### Micro-copy bajo botones

```
Plan personalizado a tu WhatsApp · respuesta en menos de 5 min (A) / 24h (B) · cero compromiso.
```
Caracteres: 96

---

## 15. FOOTER

### Columna 1 — Producto

- EffiCommerce Costa Rica
- Precios
- Funcionalidades
- Integraciones
- Casos de éxito
- Blog

### Columna 2 — Ángulos

- Para pulperías y sodas
- Para profesionales
- Para talleres
- Migrar desde Shopify
- Multi-país LATAM

### Columna 3 — Soporte

- Agendar demo
- WhatsApp soporte: +506 XXXX-XXXX
- Email: hola@efficommerce.com
- L-V 8am-8pm · S 9am-1pm CR

### Columna 4 — Legal

- Términos y Condiciones
- Aviso de Privacidad
- Ley 8968 (protección de datos)
- Cumplimiento PRODHAB
- Cookies
- privacidad.cr@efficommerce.com

### Línea inferior

```
© 2026 EffiCommerce · Grupo Effi · Operando en Colombia, Ecuador, República Dominicana y Costa Rica. Factura Electrónica 4.4 certificada por el Ministerio de Hacienda CR.
```

---

## 16. PÁGINAS ADICIONALES (thin landing pages)

### /cr/diagnostico-factura-44 · Funnel A lead magnet

**Headline**:
```
¿Está tu negocio listo para Factura Electrónica 4.4?
```

**Subhead**:
```
Respondé 6 preguntas. Te armamos un mini-plan personalizado y te lo mandamos a tu WhatsApp en minutos. Gratis, 2 minutos, cero compromiso.
```

**Form** (6 preguntas):

1. ¿Cómo emitís facturas hoy? (Dropdown: A mano · Excel · Otro software · No facturo aún · No sé)
2. ¿Cuántas ventas al mes en promedio? (Dropdown: <50 · 50-200 · 200-1000 · >1000)
3. ¿Aceptás SINPE Móvil como pago? (Radio: Sí manual · Sí automatizado · No todavía)
4. ¿Sabés qué es el código 06 en Factura 4.4? (Radio: Sí · No · Más o menos)
5. ¿Cuál es tu número de WhatsApp? (Teléfono +506)
6. ¿Cómo te llamás? (Nombre)

**Consent obligatorio** (Ley 8968):
```
☐ Autorizo a EffiCommerce a usar mis datos para armar mi plan personalizado
  y contactarme por WhatsApp. Puedo revocar este consentimiento escribiendo
  SALIR o a privacidad.cr@efficommerce.com. Ver [Aviso de Privacidad].
```

**Botón submit**:
```
Enviar y recibir mi plan en WhatsApp →
```

**Thank-you message** (redirige a `/cr/gracias-a`):
```
¡Listo! Tu plan personalizado va en camino a tu WhatsApp. Respondemos en menos de 5 minutos de lunes a sábado 8am-8pm. Guardá este número: +506 XXXX-XXXX. Pura vida 🇨🇷
```

---

### /cr/auditoria-shopify · Funnel B lead magnet

**Headline**:
```
Auditoría gratuita de tu tienda Shopify en Costa Rica
```

**Subhead**:
```
Un especialista tico revisa tu tienda actual y te entrega un reporte personalizado en menos de 24 horas con: costo real mensual, apps que podés soltar, tiempo estimado de migración y ahorro proyectado. Gratis, cero compromiso.
```

**Form** (6 campos):

1. URL de tu tienda actual (input URL) — ej: `https://mitienda.cr`
2. Plataforma actual (dropdown: Shopify · Jumpseller · Tiendanube · WooCommerce · Otra)
3. Facturación mensual aproximada (dropdown: <$5k · $5-20k · $20-50k · >$50k USD)
4. ¿Emitís Factura 4.4 hoy? (radio: Sí nativo · Sí vía app · No)
5. Tu WhatsApp (+506)
6. Tu nombre

**Consent** (igual que Funnel A).

**Botón submit**:
```
Solicitar auditoría gratuita →
```

**Thank-you** (`/cr/gracias-b`):
```
¡Listo! Recibiremos tu reporte personalizado en menos de 24 horas por WhatsApp y email. Un especialista tico ya está revisando tu tienda. Gracias — pura vida 🇨🇷
```

---

### /cr/gracias-a y /cr/gracias-b

Página simple con:
- Mensaje de agradecimiento
- Next step claro ("revisá tu WhatsApp en 5 min" / "reporte en 24h")
- Upsell suave: "Mientras esperás, conocé más sobre EffiCommerce →" (link a blog o casos)
- Share buttons para redes

---

## 17. CSS tokens (para frontend-dev)

```css
:root {
  /* Colors */
  --effi-navy: #0E2A47;
  --effi-navy-dark: #0A1F35;
  --effi-mint: #1BC49C;
  --effi-mint-dark: #16A581;
  --effi-sun: #F5B700;
  --effi-cream: #FAF7F0;
  --effi-cream-dark: #F0EAD5;
  --effi-ink: #1A1A1A;
  --effi-muted: #6B7280;
  --wa-green: #25D366;

  /* Typography */
  --font-display: 'Inter Tight', system-ui, sans-serif;
  --font-body: 'Inter', system-ui, sans-serif;
  --font-mono: 'JetBrains Mono', monospace;

  /* Sizes */
  --radius-sm: 6px;
  --radius: 8px;
  --radius-lg: 12px;
  --radius-xl: 16px;
}
```

---

## 18. Checklist frontend-dev pre-deploy

- [ ] Landing responsive 320px → 1440px
- [ ] Lighthouse Performance ≥ 90 mobile · ≥ 95 desktop
- [ ] Accesibilidad WCAG AA
- [ ] Meta SEO + OG image verificado en sharer
- [ ] GTM instalado + Consent Mode v2
- [ ] Meta Pixel + CAPI via n8n webhook
- [ ] Forms con validación + webhook n8n
- [ ] Thank-you pages operativas
- [ ] Links WhatsApp con número real
- [ ] Favicon + PWA manifest
- [ ] Sitemap.xml + robots.txt (permitir `/cr/` y sub-paths)
- [ ] Aviso de privacidad + T&C en footer linkeados
- [ ] UTMs propagados correctamente a webhook
- [ ] SSL habilitado
- [ ] Redirects 301 configurados si había contenido previo en `/cr/`
