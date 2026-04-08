---
tipo: briefing-landing
marca: feria-effix
pais: Ecuador
objetivo: captacion-lead
estado: produccion-ready-v2
version: "2.0"
fecha_creacion: 2026-04-08
fecha_ultima_actualizacion: 2026-04-08
autor: frontend-dev (Claude Code)
---

# Landing Page — El Círculo Effix Ecuador
## Kit Círculo Effix 2026 · Comunidad para emprendedores que ya venden

---

## 1. Resumen del proyecto

Landing page de captación de leads para construir la comunidad de emprendedores ecommerce en Ecuador. El lead magnet es el **Kit Círculo Effix Ecuador 2026** — tres activos entregados por WhatsApp vía bot n8n:

1. **Playbook Feria Effix 2026** (PDF 20-25 páginas)
2. **Directorio 30 Partners EC Verificados** (directorio curado)
3. **Acceso a los Miércoles del Círculo** (sesiones grupales en vivo, semanales)

El objetivo es captar emails + números de WhatsApp de emprendedores que **ya venden** online, para nutrir la comunidad con contenido de valor antes de la Feria Effix 2026 (oct).

---

## 2. KPIs objetivo

| Métrica | Objetivo |
|---------|----------|
| Tasa de conversión landing | ≥ 15% |
| Cost per Lead (CPL) | < $1.50 USD |
| Leads totales pre-evento | 5.000 leads EC |
| Tiempo entrega Kit (bot WA) | < 2 min |
| Bounce rate | < 65% |
| Scroll depth 50%+ | > 40% visitantes |

---

## 3. Stack y dependencias

| Tecnología | Versión/URL | Propósito |
|-----------|-------------|-----------|
| HTML5 | — | Estructura |
| Tailwind CSS CDN | `cdn.tailwindcss.com` | Estilos utility-first |
| Bebas Neue | Google Fonts | Headlines display |
| DM Sans | Google Fonts | Body / UI |
| DM Serif Display | Google Fonts | Quotes / testimonios |
| GTM | GTM-TLRMK246 | Tag management |
| GA4 | G-CRXZ50VX7D | Analytics |
| Meta Pixel | PIXEL_ID (pendiente) | Paid social tracking |
| n8n webhook | `dev.kreoon.com/webhook/effix-ec-lead` | Recepción de leads |

**Sin dependencias JS externas** — todo vanilla.

---

## 4. Archivos del folder

```
landing-ecuador/
├── index.html          ← Landing principal v2 (El Círculo Effix)
├── thank-you.html      ← Post-submit confirmation v2
├── README.md           ← Este archivo
└── assets/
    ├── .gitkeep
    ├── favicon.ico              (pendiente)
    ├── og-image.jpg             (pendiente — 1200x630 OG image)
    ├── kit-mockup-3d.png        (pendiente — mockup 3D de los 3 documentos del Kit)
    ├── playbook-cover.png       (pendiente — portada del Playbook)
    ├── directorio-cover.png     (pendiente — portada del Directorio)
    └── miercoles-del-circulo.png (pendiente — imagen ilustrativa sesión en vivo)
```

---

## 5. Secciones del index.html (v2)

| # | Sección | Descripción |
|---|---------|-------------|
| S1 | Sticky Nav | Logo FERIA EFFIX + badge "El Círculo · Ecuador" + CTA |
| S2 | Hero | Headline + subhead + mockup 3D Kit + CTA + social proof |
| S3 | Barra de confianza | 6 logos partners EC en grayscale con hover a color |
| S4 | ¿Qué es el Círculo? | Párrafo identitario honesto + "no para todos" |
| S5 | El Kit — bento grid | 5 cards (Playbook / Directorio / Miércoles featured / Cupón / Subgrupos) |
| S6 | Miércoles del Círculo | Sección dedicada + tabla 4 próximas sesiones + CTA inline |
| S7 | Preview Playbook + Directorio | 2 cards grandes con bullets de contenido |
| S8 | Para quién es / no es | 2 columnas verde/rojo |
| S9 | Sobre Feria Effix | 3 stats + párrafo de autoridad |
| S10 | Testimonios placeholder | 3 cards — reemplazar antes de lanzar |
| S11 | FAQ | 10 preguntas + acordeones + JSON-LD FAQPage schema |
| S12 | CTA Final | Urgencia ética (fecha real) + countdown al 22 abr |
| S13 | Footer | Legal LOPDP EC + Ley 1581 CO + links + copyright |

**Modal (formulario v2):**
- 4 campos: Nombre, WhatsApp (+593 prefijo), Email, ¿Cuál es tu situación actual? (segmentación)
- Checkbox consent con links LOPDP EC y Ley 1581 CO
- Focus trap + ESC para cerrar
- Evento `circle_interest_tier` con el valor del select

---

## 6. Cómo probar localmente

```bash
# Opción A — Python (sin instalar nada)
cd marcas/feria-effix/assets/landing-ecuador
python -m http.server 3000
# Abrir: http://localhost:3000

# Opción B — Node
npx serve . -p 3000

# Opción C — VS Code Live Server
# Clic derecho en index.html → "Open with Live Server"
```

**Notas de prueba local:**
- El form POST fallará sin el webhook n8n activo — mockear en el catch o comentar el fetch temporalmente.
- El countdown corre hacia `2026-04-22T19:00:00-05:00` (próximo miércoles).
- Las imágenes en `assets/` muestran fallbacks visuales hasta que se agreguen los archivos reales.
- La thank-you lee el query param `?name=Juan&event_id=uuid` — probar con URL manual.

---

## 7. Integración n8n (pendiente: n8n-builder)

El webhook `POST https://dev.kreoon.com/webhook/effix-ec-lead` debe:

1. **Recibir** el payload JSON v2:
   ```json
   {
     "nombre": "string",
     "whatsapp": "+593XXXXXXXXXX",
     "email": "string",
     "situacion": "aprendiendo | vendiendo | escalando | no_especificado",
     "event_id": "uuid-v4",
     "source": "landing-ecuador-v2",
     "utm_source": "string",
     "utm_medium": "string",
     "utm_campaign": "string",
     "utm_content": "string"
   }
   ```
2. **Guardar** en Supabase tabla `leads_ecuador` (agregar columna `situacion` TEXT).
3. **Enviar Kit** por WhatsApp Business API (Playbook + Directorio + acceso al grupo ciudad).
4. **Segmentar** el welcome message según `situacion` (aprendiendo / vendiendo / escalando).
5. **Responder** `{ "success": true }` para que el form haga redirect a `thank-you.html`.

---

## 8. Tracking implementado

### Consent Mode v2 (implementado desde día 1 — misma lógica v1)
- Default: todo denegado (`analytics_storage`, `ad_storage`, `ad_user_data`, `ad_personalization`).
- Banner propio con botones Aceptar / Rechazar.
- Al aceptar: `gtag('consent', 'update', ...)` actualiza GTM.
- Preferencia guardada en `localStorage` clave `effix_ec_consent`.
- **No depende de CMP de terceros** — lección LaTiquetera (0 hits confirmados Tag Assistant 2026-03-31).

### Eventos GA4 / GTM

| Evento | Trigger | Parámetros clave |
|--------|---------|-----------------|
| `page_view` | Carga inicial | `page: landing_ecuador_circulo_v2` |
| `consent_update` | Clic Aceptar/Rechazar | `consent_action` |
| `modal_open` | Clic CTA | `modal_source` |
| `generate_lead` | Submit exitoso | `event_id` (UUID), `lead_source` |
| `circle_interest_tier` | Submit (nuevo v2) | `tier` (aprendiendo/vendiendo/escalando), `event_id` |
| `lead_confirmed` | Carga thank-you | `lead_type`, `page`, `event_id` |
| `calendar_add` | Clic "Agregar al calendario" | `session` |
| `faq_open` | Clic acordeón | `question` |
| `cta_click` | Botones CTA | `cta_location` |
| `scroll_depth` | 25/50/75/100% | `depth` |
| `form_error` | Error POST | `error` |
| `whatsapp_click` | Clic WA (float o thank-you) | `source` |

### Meta Pixel
- `PageView` en index y thank-you (si consent aceptado).
- `Lead` en submit exitoso con `eventID` para deduplicación CAPI.
- `Lead` en thank-you con `eventID`.

### Deduplicación CAPI
- UUID v4 generado en submit (`event_id`).
- Viaja en el evento `generate_lead` de GTM y en `fbq('track', 'Lead', {}, { eventID })`.
- El mismo `event_id` viaja al webhook n8n para deduplicar del lado del servidor.

---

## 9. Pendientes de otros agentes

| Item | Agente responsable | Estado |
|------|--------------------|--------|
| Número WhatsApp Business real del Círculo | ops / n8n-builder | Pendiente — reemplazar `593000000000` |
| Meta Pixel ID Ecuador | paid-media | Pendiente — reemplazar `PIXEL_ID` |
| Webhook n8n configurado (v2 con campo `situacion`) | n8n-builder | Pendiente |
| Tabla Supabase `leads_ecuador` + columna `situacion` | backend-dev | Pendiente |
| PDF Playbook Feria Effix 2026 (archivo real) | content-team | Pendiente |
| PDF Directorio 30 Partners EC (archivo real) | content-team | Pendiente |
| Mockup 3D Kit (kit-mockup-3d.png) | design-team | Pendiente |
| Cover Playbook (playbook-cover.png) | design-team | Pendiente |
| Cover Directorio (directorio-cover.png) | design-team | Pendiente |
| Imagen Miércoles del Círculo (miercoles-del-circulo.png) | design-team | Pendiente |
| OG image (og-image.jpg · 1200x630) | design-team | Pendiente |
| Logos SVG/PNG partners EC (Kushki, PayPhone, etc.) | design-team | Pendiente |
| Favicon | design-team | Pendiente |
| Testimonios reales con permiso escrito | copy-writer + ops | Pendiente — no publicar sin esto |
| Speaker confirmado sesión 22 abr (Sara Montoya) | ops / eventos | Pendiente — confirmar disponibilidad |
| Actualizar fechas sesiones si cambian speakers | ops | Pendiente |

---

## 10. Checklist QA pre-launch

### Funcionalidad
- [ ] Formulario valida todos los campos (nombre min 2, WA mín 8 dígitos, email regex, consent obligatorio)
- [ ] Select "situación" funciona sin bloquear el submit si está vacío
- [ ] Submit exitoso redirige a `thank-you.html?name=...&event_id=...`
- [ ] Submit con error POST muestra mensaje inline (no alert)
- [ ] Modal abre con cualquier CTA, cierra con X / overlay / ESC
- [ ] Focus trap funciona dentro del modal
- [ ] Focus retorna al botón que abrió el modal al cerrar
- [ ] Countdown corre hacia `2026-04-22T19:00:00-05:00`
- [ ] FAQ acordeones abren/cierran, solo uno abierto a la vez
- [ ] Scroll reveal en secciones `.reveal`
- [ ] Botón "Agregar al calendario" genera y descarga el .ics
- [ ] Thank-you muestra nombre si `?name=...` está en la URL
- [ ] Thank-you muestra nombre sin coma si no hay parámetro

### Tracking
- [ ] GTM tag GTM-TLRMK246 carga (verificar en Tag Assistant)
- [ ] GA4 recibe `page_view` en index y thank-you
- [ ] Evento `generate_lead` se dispara en submit exitoso
- [ ] Evento `circle_interest_tier` incluye el valor del select
- [ ] Evento `lead_confirmed` en thank-you
- [ ] Consent banner aparece en primera visita (sin cookie previa)
- [ ] Con consent denegado: GA4 y Pixel NO se activan
- [ ] Con consent aceptado: ambos se activan
- [ ] Preferencia en `localStorage.effix_ec_consent` persiste entre recargas

### Performance
- [ ] Lighthouse Performance ≥ 85 en mobile
- [ ] LCP < 2.5s (hero carga rápido — sin bloqueo de fuentes)
- [ ] CLS < 0.1
- [ ] Imágenes below-fold tienen `loading="lazy"`
- [ ] Preconnect a Google Fonts activo

### Accesibilidad (WCAG AA)
- [ ] Contraste AA verificado con axe DevTools
- [ ] aria-labels en todos los botones sin texto visible
- [ ] Modal tiene `role="dialog"` y `aria-modal="true"`
- [ ] Campos del form tienen labels asociados y mensajes de error descriptivos
- [ ] Tab navega todos los elementos interactivos en orden lógico
- [ ] `prefers-reduced-motion`: animaciones deshabilitadas
- [ ] Imágenes con alt text descriptivo
- [ ] Tablas con caption implícita via `aria-label`

### Responsive
- [ ] 375px (iPhone SE) — sin scroll horizontal
- [ ] 768px (iPad) — bento grid 2 cols funciona
- [ ] 1024px — layout hero 2 columnas
- [ ] 1280px — max-width centrado

### Legal (obligatorio antes de lanzar)
- [ ] Checkbox consent con links LOPDP EC y Ley 1581 CO apuntando a URLs reales
- [ ] Footer menciona LOPDP Ecuador + Ley Estatutaria 1581 CO
- [ ] Email privacidad@feriaeffix.com activo y recibe correos
- [ ] `noindex, nofollow` en thank-you.html
- [ ] Testimonios reales con permiso escrito obtenido (o sección omitida)

### Pre-lanzamiento final
- [ ] Reemplazar todos los comentarios `TODO:` en ambos HTML
- [ ] Reemplazar `PIXEL_ID` con ID real del Meta Pixel Ecuador
- [ ] Reemplazar `593000000000` con número real del WhatsApp Business
- [ ] Webhook n8n configurado y probado con curl (campo `situacion` nuevo)
- [ ] Test end-to-end: submit → WhatsApp recibe Kit en < 2 min
- [ ] Speaker sesión 22 abr confirmado con Sara Montoya
- [ ] Verificar en Tag Assistant que GTM carga sin bloqueo de CMP

---

## 11. UTMs recomendados (v2)

```
?utm_source=meta&utm_medium=paid_social&utm_campaign=ec-circulo-v2&utm_content=video_v1
?utm_source=google&utm_medium=cpc&utm_campaign=ec-circulo-ecuador&utm_content=search_gen
?utm_source=instagram&utm_medium=organic&utm_campaign=ec-circulo-organico
?utm_source=whatsapp&utm_medium=referral&utm_campaign=ec-circulo-comunidades
```

---

## 12. Changelog

| Fecha | Versión | Cambio | Autor |
|-------|---------|--------|-------|
| 2026-04-08 | 1.0.0 | Scaffold inicial — ángulo SRI 2026 + comunidad WhatsApp | frontend-dev |
| 2026-04-08 | 2.0.0 | Reescritura completa — cambio de ángulo: SRI → Kit Círculo Effix. Nueva arquitectura: bento grid 5 cards, sección dedicada Miércoles del Círculo, tabla próximas sesiones, preview Playbook+Directorio, para quién es/no es, countdown al próximo miércoles (no oct 2026). Formulario v2 con campo segmentación `circle_interest_tier`. Thank-you v2 con card Próximo Miércoles + ICS download. Consent Mode v2 conservado. | frontend-dev |

---

## 13. TODO — próximas iteraciones

- [ ] Agregar video teaser de los Miércoles del Círculo cuando esté disponible
- [ ] Activar sección testimonios cuando se tengan 3 testimonios reales verificados con permiso
- [ ] Agregar badge de contador de miembros activos cuando el Círculo supere 500 miembros EC verificados
- [ ] Actualizar tabla de sesiones con speakers confirmados para mayo-junio
- [ ] Split test A/B: headline hero "El lugar donde se juntan los que sí hacen ecommerce" vs "Donde los que sí venden escalan juntos"
- [ ] Agregar exit-intent popup cuando esté validada la landing principal

---

*Prioridad de revisión: testimonios reales + número WA business + Meta Pixel ID + confirmación speaker 22 abr.*
