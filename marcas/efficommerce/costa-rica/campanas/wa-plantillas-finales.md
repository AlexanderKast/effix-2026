---
doc: Plantillas WhatsApp Business API — LISTAS para someter a Meta
marca: efficommerce
pais: Costa Rica
fecha: 2026-04-17
proveedor: Twilio o 360dialog
estado: LISTO — solo pegar en panel WABA y someter
idioma_primario: es_MX (Meta lo mapea a LATAM · más amplio que es_CR)
idiomas_fallback: es_LA, es
---

# WhatsApp Templates Ready-to-Submit

Plantillas finales en texto definitivo. Copiar y pegar al panel del provider WABA (Twilio o 360dialog) → someter a Meta (aprobación 1-3 días hábiles). **Respeta todos los lineamientos Meta 2026** (sin CTAs prohibidos, sin emojis al inicio de frase, variables marcadas, opt-out visible).

Las **variables** `{{n}}` se asignan en el panel al crear la plantilla. Meta exige ejemplos para aprobar — se incluyen abajo de cada template.

---

## Plantilla 1 · `efficommerce_cr_welcome_diagnostico_a`

| Campo | Valor |
|---|---|
| Nombre interno | `efficommerce_cr_welcome_diagnostico_a` |
| Categoría Meta | UTILITY |
| Idioma | es_MX |
| Uso | Entrega del resultado del diagnóstico Factura 4.4 + CTA demo |
| Header | Text: `¡Tu diagnóstico Factura 4.4 está listo!` |
| Body | (abajo) |
| Footer | `Escribí SALIR para darte de baja.` |
| Botones | Quick Reply: `Agendar demo` · Quick Reply: `Tengo una pregunta` · URL: `Ver mi plan` → {{5}} |

**Body**:
```
Hola {{1}}, gracias por hacer el diagnóstico en la web de EffiCommerce.

Tu resultado: {{2}} de 10 en preparación para Factura 4.4.

{{3}}

Te armé un mini-plan personalizado con los próximos pasos para tu negocio. Lo abrís acá:
{{5}}

Si querés que lo repasemos en una llamada de 15 minutos con un especialista tico, tocá *Agendar demo* aquí abajo.

Si tenés una duda puntual, podés escribirme y te respondo entre las 8am y 8pm hora de Costa Rica.

Pura vida,
{{4}} · Equipo EffiCommerce 🇨🇷
```

**Ejemplos para aprobación Meta**:
- {{1}} = Andrea
- {{2}} = 6
- {{3}} = Tu negocio tiene tres ajustes prioritarios para cumplir la 4.4.
- {{4}} = María
- {{5}} = https://efficommerce.com/cr/plan/abc123

---

## Plantilla 2 · `efficommerce_cr_welcome_auditoria_b`

| Campo | Valor |
|---|---|
| Nombre interno | `efficommerce_cr_welcome_auditoria_b` |
| Categoría | UTILITY |
| Idioma | es_MX |
| Uso | Confirmación de solicitud de auditoría Shopify |
| Header | Text: `Recibimos tu solicitud de auditoría` |
| Footer | `Escribí SALIR para darte de baja.` |
| Botones | Quick Reply: `Agendar revisión en vivo` · Quick Reply: `Hablar con una persona` |

**Body**:
```
Hola {{1}}, gracias por solicitar la auditoría gratuita de {{2}}.

Un especialista tico está revisando tu tienda ahora. Vas a recibir el reporte personalizado en menos de 24 horas — directo a este WhatsApp y a tu email.

El reporte incluye:
• Costo real mensual estimado (apps, comisiones, cambio USD/CRC)
• Apps que podrías soltar al migrar a EffiCommerce
• Tiempo estimado de migración para tu caso
• Compliance Factura 4.4 y SINPE actual

Mientras tanto, si querés verlo en vivo con el especialista, tocá *Agendar revisión en vivo* acá abajo.

{{3}} · Equipo EffiCommerce 🇨🇷
```

**Ejemplos**:
- {{1}} = Sofía
- {{2}} = https://mitiendademoda.cr
- {{3}} = Carlos

---

## Plantilla 3 · `efficommerce_cr_followup_day2_a`

| Campo | Valor |
|---|---|
| Nombre interno | `efficommerce_cr_followup_day2_a` |
| Categoría | MARKETING |
| Idioma | es_MX |
| Uso | Seguimiento 48h tras diagnóstico — aporta valor, no push |
| Header | — |
| Footer | `Escribí SALIR si preferís no recibir más mensajes.` |
| Botones | Quick Reply: `Agendar 15 min` · Quick Reply: `Ver caso completo` |

**Body**:
```
Hola {{1}}, {{2}} de EffiCommerce otra vez 👋

Ayer compartí tu mini-plan de Factura 4.4. ¿Pudiste revisarlo?

Te comparto un caso real que se parece al tuyo: {{3}} aplicó los mismos tres pasos que te marqué a vos y en {{4}} semanas tenía su negocio emitiendo 4.4 sin errores con Hacienda.

El caso completo tarda 3 minutos de lectura. Lo tocás aquí abajo si te interesa.

Si preferís saltarte al paso siguiente y vemos tu caso en vivo, tocá *Agendar 15 min*.

Si querés dejar de recibir mensajes, respondé SALIR. Sin resentimiento 🙌
```

**Ejemplos**:
- {{1}} = Andrea
- {{2}} = María
- {{3}} = Doña María, dueña de una soda en Alajuela
- {{4}} = dos

---

## Plantilla 4 · `efficommerce_cr_followup_day2_b`

| Campo | Valor |
|---|---|
| Categoría | MARKETING |
| Idioma | es_MX |
| Uso | Seguimiento Funnel B cuando reporte auditoría se envió pero no reservó demo |
| Footer | `Escribí SALIR para darte de baja.` |
| Botones | URL: `Ver mi reporte` → {{4}} · Quick Reply: `Agendar llamada 30 min` |

**Body**:
```
Hola {{1}}, {{2}} acá. Ayer te envié el reporte de auditoría de tu tienda.

Resumen rápido:
• Ahorro estimado migrando a EffiCommerce: USD {{3}} al mes
• Tiempo de migración estimado: 5 a 9 días
• Compliance Factura 4.4 + SINPE: automático tras migración

El reporte completo lo podés abrir aquí abajo.

Si querés que te lo explique en vivo con un especialista tico — y veamos juntos los números de tu caso — tocá *Agendar llamada 30 min*.

Sin presión — decidís vos.
```

**Ejemplos**:
- {{1}} = Mateo
- {{2}} = Carlos
- {{3}} = 165
- {{4}} = https://efficommerce.com/cr/reporte/xyz789

---

## Plantilla 5 · `efficommerce_cr_objection_day4`

| Campo | Valor |
|---|---|
| Categoría | MARKETING |
| Idioma | es_MX |
| Uso | Día 4 — anticipar objeción común y ofrecer prueba sin riesgo |
| Footer | `SALIR para pausar los mensajes.` |
| Botones | URL: `Ver video 90 seg` → {{3}} · Quick Reply: `Probar gratis 14 días` |

**Body**:
```
{{1}}, sé que invertir en un sistema nuevo puede sonar a compromiso grande.

Por eso EffiCommerce tiene prueba gratuita de 14 días — sin tarjeta, sin amarre. Si no te convence, ahí queda y no pasa nada.

Grabé un video de 90 segundos que te cuenta cómo funciona sin entrar en tecnicismos. Lo podés ver aquí abajo.

Si preferís arrancar tu prueba directamente, tocá *Probar gratis 14 días* y te habilito la cuenta hoy.

Es la última vez que te escribo por iniciativa mía. Después te dejo tranquila/o 🤝

— {{2}}
```

**Ejemplos**:
- {{1}} = Andrea
- {{2}} = María
- {{3}} = https://efficommerce.com/cr/video-90seg

---

## Plantilla 6 · `efficommerce_cr_social_proof_day6`

| Campo | Valor |
|---|---|
| Categoría | MARKETING |
| Idioma | es_MX |
| Uso | Día 6 — último social proof antes del closeout |
| Footer | `SALIR para darte de baja.` |
| Botones | Quick Reply: `Agendar demo` · URL: `Ver más casos` → {{4}} |

**Body**:
```
{{1}}, mirá lo que le pasó a alguien que estaba en tu misma situación hace dos meses:

{{2}}

Casos así los vemos cada semana en Costa Rica. No hay truco — es simplemente que el sistema fue pensado para tu país.

Si querés que hagamos el mismo análisis con tu negocio, tocá *Agendar demo*. Son 15 minutos, en tu agenda, gratis.

Si preferís ver más casos antes de decidir, tocá *Ver más casos*.

— {{3}}
```

**Ejemplos**:
- {{1}} = Andrea
- {{2}} = Don Carlos (pulpería en Desamparados) facturó ₡800.000 extra el primer mes con catálogo WhatsApp y cobro SINPE integrados.
- {{3}} = María
- {{4}} = https://efficommerce.com/cr/casos

---

## Plantilla 7 · `efficommerce_cr_closeout_day7`

| Campo | Valor |
|---|---|
| Categoría | MARKETING |
| Idioma | es_MX |
| Uso | Día 7 — cierre amistoso, abrir ventana para contacto futuro |
| Footer | — (ya no envía más por iniciativa) |
| Botones | — (solo texto con número para guardar) |

**Body**:
```
{{1}}, prometí no bombardearte 🤝

Si algún día decidís darle una mirada a EffiCommerce, estamos acá.

Guardá este número en tus contactos: es de EffiCommerce Costa Rica. Cuando quieras, me escribís y retomamos.

Pura vida,
{{2}}
```

**Ejemplos**:
- {{1}} = Andrea
- {{2}} = María

---

## Plantilla 8 · `efficommerce_cr_demo_reminder`

| Campo | Valor |
|---|---|
| Categoría | UTILITY |
| Idioma | es_MX |
| Uso | Recordatorio 1h antes de la demo agendada |
| Header | Text: `Tu demo con EffiCommerce empieza pronto` |
| Footer | — |
| Botones | URL: `Unirme ahora` → {{3}} · Quick Reply: `Necesito reagendar` |

**Body**:
```
Hola {{1}}, soy {{2}} de EffiCommerce 👋

Solo para recordarte que nuestra demo empieza en 1 hora, a las {{4}} (hora de Costa Rica).

Te enlazo al meeting directamente acá abajo — tocá *Unirme ahora* cuando estés listo/a.

Si algo se te cruzó y necesitás reagendar, tocá *Necesito reagendar* y lo movemos sin problema.

Llevo un mini-análisis de tu caso listo para la llamada.

¡Nos vemos!
```

**Ejemplos**:
- {{1}} = Andrea
- {{2}} = María
- {{3}} = https://meet.google.com/abc-defg-hij
- {{4}} = 3:00 p.m.

---

## Reglas de operación WABA

### Categoría de plantilla → costo Meta 2026 (referencia CR)

| Categoría | Costo aprox por mensaje | Uso |
|---|---|---|
| UTILITY | USD $0.005 - $0.010 | Welcome, confirmaciones, recordatorios |
| MARKETING | USD $0.055 - $0.075 | Nurturing, promociones |
| AUTHENTICATION | USD $0.015 - $0.025 | OTP (no aplica) |
| SERVICE (ventana 24h) | Gratis | Respuesta a chat iniciado por user |

### Ventana de servicio 24h

Si el usuario envía cualquier mensaje, se abre **ventana de 24 horas** en la que podés enviar mensajes libres sin plantilla y sin costo adicional por mensaje (solo el costo de conversación base). Usalo:

- SDR responde por WhatsApp dentro de la ventana con lenguaje más conversacional.
- Enviar multimedia (audios, videos explicativos) durante la ventana.
- Responder objeciones sin plantilla.

### Opt-out (obligatorio Meta + Ley 8968 CR)

- Todas las plantillas MARKETING deben incluir texto de opt-out.
- Palabras detectadas (n8n monitorea): `SALIR`, `STOP`, `NO MÁS`, `BAJA`, `PARA`, `UNSUBSCRIBE`, `CANCELAR`.
- Al detectar: cambiar status a `opt_out`, pausar todos los flows, confirmar al user:

```
Listo, no recibirás más mensajes de EffiCommerce por WhatsApp.

Si algún día cambiás de opinión, escribinos y nos volvés a habilitar.

Gracias por tu tiempo. Pura vida 🇨🇷
```

### Quality rating

Meta asigna un rating a tu número (Alto / Medio / Bajo):
- **Alto**: todo ok, sigue.
- **Medio**: usuarios están reportando. Pausar campañas MARKETING por 7 días, revisar segmentación.
- **Bajo**: restricción de envío. Stop inmediato, revisar contenido + segmentación. Si persiste, cambio de número.

### Frecuencia máxima

- **UTILITY**: sin límite práctico pero alinear con flow (no spam).
- **MARKETING**: máximo 5 por lead en 30 días. Idealmente 3.
- **Ventana service**: respuestas dentro de 24h sin plantilla.

---

## Setup paso a paso (trafficker / dev)

1. **Contratar WABA** (Twilio o 360dialog).
2. **Activar número** +506 XXXX-XXXX con Meta Business Manager. Verificar display name "EffiCommerce Costa Rica".
3. **En panel provider**: crear plantillas copiando texto de este documento. Someter a Meta. Esperar aprobación 1-3 días.
4. **Conectar n8n**: webhook provider → endpoint n8n → router por `profile_type` y `funnel_source`.
5. **Configurar plantillas a disparar** por día:
   - D0 inmediato: P1 (A) o P2 (B)
   - D2 10am: P3 (A) o P4 (B)
   - D4 2pm: P5
   - D6 11am: P6
   - D7 5pm: P7
   - 1h antes demo: P8
6. **QA con número de prueba**: enviar cada plantilla a 2-3 WA de prueba. Verificar variables bien interpoladas, botones funcionales, opt-out detectable.
7. **Activar en producción** solo después de QA completo.

---

## Texto de consent obligatorio en landing (bloqueante legal)

Bajo cada formulario que recolecte número WhatsApp, incluir checkbox separado de T&C:

```
☐ Autorizo a EffiCommerce Costa Rica a enviarme mensajes por WhatsApp
  relacionados con mi consulta y con productos de la marca. Puedo darme
  de baja escribiendo SALIR en cualquier momento. Más información en
  nuestro Aviso de Privacidad.
```

Sin este check: NO enviar plantillas MARKETING (solo UTILITY tras consent implícito de la solicitud).
