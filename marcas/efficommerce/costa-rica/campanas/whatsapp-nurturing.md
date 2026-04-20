---
doc: Secuencia de nurturing WhatsApp — EffiCommerce Costa Rica
marca: efficommerce
pais: Costa Rica
fecha: 2026-04-17
canal: WhatsApp Business API (WABA)
proveedor_sugerido: Twilio o 360dialog
---

# Secuencia WhatsApp Nurturing — EffiCommerce CR

Secuencia de 7 días con 5 toques tras la primera conversación, diseñada para maximizar el agendamiento de demo. Toda interacción debe respetar Ley 8968 (consent previo en landing) y políticas WABA de Meta (sin spam, con opt-out).

## 1. Arquitectura del flow

```
Landing form / Click-to-WA
   │
   ▼
n8n webhook → Supabase `leads_efficommerce_cr`
   │
   ▼
Router por `profile_type`
   │
   ├─ A (negocio tradicional) → Sub-flow Funnel A
   │
   └─ B (ecommerce existente) → Sub-flow Funnel B
   │
   ▼
Secuencia 7 días (5 mensajes)
   │
   ├─ Si responde → SDR humano toma el chat
   │
   └─ Si no responde al D7 → pausa (no insistir)
```

## 2. Plantillas WABA a aprobar con Meta

Meta requiere aprobar cada plantilla antes de enviarla. Categorías permitidas: `MARKETING`, `UTILITY`, `AUTHENTICATION`. Usar `UTILITY` siempre que sea posible (tasa de envío mayor, costo menor).

### Plantilla 1 — `efficommerce_cr_welcome_a` (UTILITY)

**Lenguaje**: Spanish (MX/LA/CR)
**Categoría**: UTILITY (entrega del recurso que pidió)

```
¡Hola {{1}}! Soy María de EffiCommerce Costa Rica 🇨🇷

Gracias por hacer el diagnóstico de Factura 4.4. Tu resultado fue {{2}}/10.

Acá tenés tu mini-plan personalizado:
{{3}}

Si querés, te lo explico en 15 min y vemos cómo EffiCommerce te ayuda con tu negocio.

Agendá acá 👉 {{4}}

Para dejar de recibir mensajes respondé *SALIR*.
```

Variables:
- {{1}} nombre
- {{2}} score 0-10
- {{3}} URL PDF personalizado
- {{4}} URL Calendly

### Plantilla 2 — `efficommerce_cr_welcome_b` (UTILITY)

**Lenguaje**: Spanish (MX/LA/CR)
**Categoría**: UTILITY

```
¡Hola {{1}}! Soy Carlos de EffiCommerce Costa Rica 🇨🇷

Recibimos tu solicitud de auditoría de {{2}} (tu tienda Shopify).

Tu reporte personalizado estará listo en menos de 24h. Te aviso por acá cuando esté 📩

Mientras tanto, si querés verlo en vivo con un especialista, agendá acá 👉 {{3}}

Para dejar de recibir mensajes respondé *SALIR*.
```

Variables:
- {{1}} nombre
- {{2}} URL de la tienda
- {{3}} URL Calendly

### Plantilla 3 — `efficommerce_cr_followup_day2` (MARKETING)

**Categoría**: MARKETING

```
Hola {{1}}, María acá otra vez 👋

Ayer te compartí el mini-plan de Factura 4.4. ¿Te sirvió?

Te cuento algo que le sirve a mucha gente en tu situación: {{2}} (caso real, sin nombres).

Si querés ver cómo aplicaría en tu negocio, agendemos 15 min 👉 {{3}}

Si preferís que te deje de escribir, respondé SALIR. Todo bien 🙌
```

Variables:
- {{1}} nombre
- {{2}} snippet caso de éxito corto
- {{3}} URL Calendly

### Plantilla 4 — `efficommerce_cr_objection_day4` (MARKETING)

**Categoría**: MARKETING

```
{{1}}, sé que esto puede sonar como un compromiso grande.

La verdad: podés probar EffiCommerce gratis 14 días, sin tarjeta. Si no te convence, no pasa nada.

Mirá este video de 90 segundos que te puede cambiar la foto: {{2}}

Si ahora sí hacemos la demo, agendá acá 👉 {{3}}

Última vez que te escribo de motu propio — después te dejo tranquila. SALIR para pausa.
```

Variables:
- {{1}} nombre
- {{2}} URL video VSL
- {{3}} URL Calendly

### Plantilla 5 — `efficommerce_cr_social_proof_day6` (MARKETING)

```
{{1}}, te muestro qué le pasó a alguien parecido a vos 👇

{{2}}

Casos como este los vemos todas las semanas en Costa Rica. No tiene misterio.

Si querés intentarlo en tu negocio, te agendo 15 min 👉 {{3}}
```

### Plantilla 6 — `efficommerce_cr_closeout_day7` (MARKETING)

```
{{1}}, te prometí que no te iba a bombardear 🤝

Si algún día decidís darle un vistazo a EffiCommerce, estoy acá.

Guardá mi número: +506 XXXX-XXXX. Cuando querés me escribís.

Pura vida 🇨🇷
```

## 3. Timing de la secuencia

| Día | Hora (CR) | Plantilla | Condición |
|---|---|---|---|
| D0 (inmediato) | <2 min | `welcome_a` o `welcome_b` | Siempre dispara |
| D2 | 10am | `followup_day2` | Si no hubo respuesta al welcome |
| D4 | 2pm | `objection_day4` | Si no hubo respuesta aún |
| D6 | 11am | `social_proof_day6` | Si no hubo respuesta aún |
| D7 | 5pm | `closeout_day7` | Si no hubo respuesta aún; después PAUSAR |

Horarios definidos según heurística LATAM (mañana y tarde tienen mejor tasa de lectura, evitar de noche).

## 4. Lógica de exits

La secuencia **se detiene inmediatamente** cuando:
- El lead responde CUALQUIER mensaje (entra SDR humano).
- El lead escribe `SALIR`, `STOP`, `PARA`, `BAJA` (opt-out — Ley 8968 requiere respetar).
- El lead agenda demo (verificado por webhook de Calendly → tabla Supabase).
- Cierre de compra (lead se convierte a cliente).

## 5. Scripts SDR humano (cuando el lead responde)

### Apertura general
```
¡Hola {{nombre}}! Qué bueno leerte. Soy {{SDR}} de EffiCommerce.

¿Qué tal si charlamos 15 min? Te muestro en vivo cómo quedaría tu negocio con EffiCommerce.

Tengo estos horarios disponibles:
- {{horario_1}}
- {{horario_2}}
- {{horario_3}}

¿Cuál te funciona mejor?

(Si preferís otro horario, mandámelo nomás)
```

### Objeción "¿cuánto cuesta?"
```
Buena pregunta. Depende un poco de cuánto vendés y qué features necesitás.

Los planes arrancan en ₡15.000/mes (USD $29) con Factura 4.4, SINPE y WhatsApp incluidos.

Pero lo honesto es que sin saber tu caso, un número así no te sirve. ¿Te parece si nos agendamos 15 min y te armo una propuesta concreta?
```

### Objeción "ya tengo Shopify / [competidor]"
```
¡Excelente! Eso significa que ya superaste lo más difícil: vender online.

EffiCommerce no compite con tiradas de promesas. Lo que te ofrezco es una auditoría gratuita de tu tienda actual: te digo qué estás pagando de más, qué apps podrías soltar y cuánto podrías ahorrar.

Si después de la auditoría decidís que Shopify te sirve mejor, todo bien. Te queda el análisis.

¿Te mando link para agendarla?
```

### Objeción "no es buen momento"
```
Te entiendo, no quiero empujar.

¿Te parece si te escribo en 2 semanas? Guardame el contexto. Si cambiás de opinión antes, mi número es este.

Pura vida 🤝
```

Luego marcar como `follow_up_in_14d` en Supabase → dispara plantilla nueva.

## 6. Integración técnica

### Stack

- **WABA**: Twilio (opción A) o 360dialog (opción B, más barato LATAM).
- **Orquestación**: n8n flow `efficommerce-cr-leads`.
- **Storage**: Supabase tabla `leads_efficommerce_cr` con columnas:
  ```sql
  id uuid primary key default gen_random_uuid()
  created_at timestamptz default now()
  nombre text
  telefono text
  email text
  profile_type text check (profile_type in ('A','B'))
  funnel_source text
  utm_source text, utm_medium text, utm_campaign text, utm_content text
  consent_ts timestamptz not null
  consent_version text
  diagnostico_score int
  shopify_url text
  wa_template_last text
  wa_last_sent_at timestamptz
  wa_responded bool default false
  demo_scheduled bool default false
  sdr_owner text
  status text default 'nurturing'
  ```

### Webhooks requeridos

1. **Landing → n8n**: POST `/webhook/cr-leads` con payload `{nombre, tel, email, profile_type, consent, utm_*, ...}`.
2. **Calendly → n8n**: POST `/webhook/cr-demo-scheduled` para actualizar `demo_scheduled=true`.
3. **WABA → n8n**: inbound messages. Si contiene SALIR/STOP/PARA, marcar `status='opt_out'` y NO enviar más plantillas.

### Reglas anti-spam WABA

- **Conversation window**: una vez el lead responde, se abre ventana de 24h para enviar mensajes de conversación sin plantilla.
- **Pacing**: máximo 5 plantillas MARKETING por lead en 30 días.
- **Opt-out**: respetar inmediatamente (Meta sanciona escalada).
- **Calidad número WABA**: mantener rating "Alto" de Meta. Si baja a "Medio", pausar plantillas marketing por 7 días.

## 7. Métricas a reportar

| Métrica | Target | Verde | Rojo |
|---|---|---|---|
| Tasa entrega plantilla D0 | ≥ 95% | ≥ 98% | < 90% |
| Tasa lectura plantilla D0 | ≥ 70% | ≥ 80% | < 50% |
| Tasa respuesta primer contacto | ≥ 40% | ≥ 50% | < 25% |
| Tasa opt-out | < 5% | < 3% | > 10% |
| Demo agendada / lead WA | ≥ 15% | ≥ 20% | < 8% |
| Tiempo respuesta SDR inbound | < 1h | < 15 min | > 4h |

## 8. Riesgos y mitigaciones

| Riesgo | Mitigación |
|---|---|
| Bloqueo masivo de plantilla por Meta | Diversificar 2-3 plantillas UTILITY/MARKETING similares. Monitoreo quality rating diario. |
| Número marcado como spam | Opt-out automático, pacing estricto, evitar mensajes genéricos. |
| Lead responde de madrugada, SDR no responde | Auto-respuesta fuera de horario: "Recibimos tu mensaje. Te respondemos entre 8am-8pm CR. Pura vida." |
| Cost por conversación WABA alto | Usar plantillas UTILITY cuando sea posible (más baratas). Monitorear costo por demo agendada. |
| Lead contesta en inglés | SDR responde en español pero suave "¿Preferís en español o inglés?" |

## 9. Fase 2 expansión (Semana 9+)

- Agregar flow de reactivación para leads `status=follow_up_in_14d`.
- Activar mensajes de producto con video corto para quienes abrieron pero no respondieron.
- A/B test de timing (D2 vs D1, D4 vs D3).
- Personalización más fuerte con nombre del negocio (no solo nombre persona).

## 10. Pendientes de arranque (semana 1-2)

- [ ] Contratar WABA provider (Twilio vs 360dialog — decidir por costo + features)
- [ ] Registrar número +506 XXXX-XXXX
- [ ] Verificar display name "EffiCommerce Costa Rica" con Meta
- [ ] Someter 6 plantillas a aprobación (48-72h típico)
- [ ] Crear tabla Supabase `leads_efficommerce_cr` con RLS
- [ ] Construir n8n flow `efficommerce-cr-leads.json`
- [ ] Definir SDR(s) de arranque y horarios
- [ ] Configurar Calendly eventos "Demo EffiCommerce CR — 15 min" y "Auditoría Shopify — 30 min"
