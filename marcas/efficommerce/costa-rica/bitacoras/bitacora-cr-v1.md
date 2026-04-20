---
tags:
  - efficommerce
  - costa-rica
  - bitacora
  - launch
created: "2026-04-17"
---

# Bitácora — EffiCommerce Costa Rica

Log cronológico de decisiones y aprendizajes. Se actualiza cada semana.

---

## v1 — 2026-04-17 | Aprobación del plan y fundación documental

### Contexto
Sesión de planeación con Claude Code. Se aprobó plan de captación de leads EffiCommerce Costa Rica (12 semanas, $4,000 USD). Plan fuente: `C:\Users\SICOMMER SAS\.claude\plans\valiant-sniffing-grove.md`.

### Decisiones tomadas

1. **Ángulo: dos funnels en paralelo con split 70/30**
   - Funnel A: digitalizar negocios tradicionales (pulperías, sodas, talleres, profesionales). 70% presupuesto.
   - Funnel B: migrar tiendas Shopify/Jumpseller existentes. 30% presupuesto.
   - Regla dura: si CPL A < $2 y CPL B > $4 en semana 5 → pausar B, reasignar a A.
   - **Tensión documentada**: Plan agent recomendó solo Funnel A inicialmente; decisión final fue ambos según input del usuario. Mitigación: split asimétrico 70/30 y regla de reasignación en gate G4.

2. **Dominio: subdirectorio `efficommerce.com/cr`** (no `.cr`)
   - Hereda autoridad SEO del dominio principal.
   - Evita requisito de cédula jurídica CR del NIC-CR.
   - Escala a `/mx`, `/pe` futuro.

3. **Brand: propio B2B SaaS, no heredar Feria Effix**
   - Paleta: Effi Navy (#0E2A47) + Effi Mint (#1BC49C) + Effi Sun (#F5B700) + Effi Cream (#FAF7F0).
   - Tipografía: Inter Tight (display) + Inter (body).
   - Brand guide v0.1 entregado como propuesta. **Pendiente aprobación CEO + Design Lead semana 1.**

4. **Producto Factura 4.4 + SINPE confirmado**
   - Usuario confirmó que EffiCommerce ya emite XML 4.4 válido y maneja SINPE Móvil nativamente.
   - Decisión: mensajería agresiva de compliance como USP nº 1.
   - Riesgo: QA obligatorio con primeros clientes antes de onboardings masivos.

5. **Landing tech: clon de `marcas/feria-effix/assets/landing-ecuador/`**
   - Vite + HTML + Tailwind + vanilla JS (80% reutilizable).
   - No React. Build rápido. Deploy Vercel.

6. **Lead magnets**
   - Funnel A: diagnóstico interactivo Factura 4.4 (2 min, score + mini-plan personalizado por WhatsApp).
   - Funnel B: auditoría gratuita tienda Shopify (form + reporte personalizado en 24h).
   - Ambos superan el PDF descargable típico.

7. **WhatsApp Business API (WABA) desde día 1**
   - Proveedor arranque: Twilio (pay-as-you-go, setup rápido).
   - Migrar a 360dialog si escala supera $80/mes de markup.
   - App personal descartada: no escala a 300 leads/mes.

8. **Tracking: GTM + GA4 + Meta Pixel + CAPI + Consent Mode v2**
   - CAPI obligatorio desde día 1 (aprendizaje de issue en VSL Meta Ads previo).
   - QA con Events Manager + Tag Assistant antes de gastar $1.

### Archivos creados en esta sesión

**Context (base de verdad)**
- `README.md` — overview país
- `context/market-research.md` — mercado CR verificado
- `context/regulatorio-cr.md` — Factura 4.4, SINPE, IVA, Ley 8968
- `context/competencia.md` — Shopify, Jumpseller, Tiendanube
- `context/icp-buyer-personas.md` — 4 personas A + 2 personas B
- `context/credenciales.md` — IDs y convenciones

**Estrategia**
- `estrategia/plan-maestro-cr.md` — plan ejecutable 12 semanas
- `estrategia/messaging-framework.md` — voz, pilares, hooks, anti-patrones
- `estrategia/brand-guide-minimo.md` — v0.1 pendiente aprobación

**Campañas**
- `campanas/meta-ads-plan.md` — 4-5 campañas Meta con audiencias, creativos
- `campanas/google-ads-plan.md` — 3 campañas Search + PMax Fase 2
- `campanas/whatsapp-nurturing.md` — 6 plantillas + secuencia 7 días

**Presupuesto**
- `presupuesto/budget-plan-v1.md` — distribución detallada $4k/12sem
- `presupuesto/spend-log.csv` — template registro diario

**Creativos**
- `creativos/briefs/brief-funnel-a.md` — 3 videos + 6 estáticos A
- `creativos/briefs/brief-funnel-b.md` — 2 videos + 4 estáticos + infografía B
- `creativos/guiones/vsl-funnel-a.md` — VSL 90s / 3min / 5min
- `creativos/guiones/vsl-funnel-b.md` — VSL 90s / 2min

**Actualizaciones**
- `marcas/efficommerce/README.md` — añadido Costa Rica a países activos

### Próximos pasos (prioridad semana 1 — bloqueantes)

1. **URGENTE — asignar equipo CR**: estratega, trafficker, creativo, SDR (sin esto no arranca producción creativos).
2. **URGENTE — aprobar brand guide** con CEO + Design Lead.
3. **URGENTE — reunión con equipo Effi System CR** para definir frontera ERP vs ecommerce+logística y lista negativa cruzada de keywords.
4. Crear cuentas: Google Ads, Meta BM + Pixel, GA4, GTM, Supabase, Vercel.
5. Contratar WABA provider (Twilio inicial).
6. Registrar dominio / configurar subdirectorio `efficommerce.com/cr`.
7. Implementar compliance Ley 8968: aviso privacidad, consent separado, DPO.
8. Validar partners logística real CR: Correos CR, Aeropost, DHL.
9. Setup Calendly + sales scripts para SDR.

### Próximos pasos (semana 2)

1. Clonar `landing-ecuador/` → `landing-cr/` con brand propio.
2. Implementar diagnóstico Factura 4.4 interactivo + auditoría Shopify.
3. Crear tabla Supabase `leads_efficommerce_cr` con RLS.
4. Construir n8n flow `efficommerce-cr-leads`.
5. Producir 3 videos A + 2 videos B + 10 estáticos (creativos).
6. Someter 6 plantillas WABA a aprobación Meta (48-72h).
7. QA tracking end-to-end con Tag Assistant + Events Manager.

### Riesgos identificados

- **Canibalización Effi System CR**: alto impacto si no se alinea.
- **Meta Pixel falla como en VSL previo**: mitigado con CAPI server-side desde día 1 + QA.
- **Presupuesto lean + dos funnels**: riesgo de aprendizaje lento. Mitigado con split 70/30 y regla de reasignación.
- **Brand sin definir**: bloqueante semana 1 antes de landing final.
- **Burn pitch logística multi-courier** si no hay partners CR firmados: validar antes de mensajear.
- **Shopify Starter $5 imbatible en precio**: no competir en precio, posicionar en compliance+ecosistema.

### Learnings de plan

- El usuario maneja múltiples marcas del Grupo Effi. Cada lanzamiento país debe heredar plantillas pero con brand específico por marca. Feria Effix ≠ EffiCommerce ≠ Effi System.
- La decisión de usuario (ambos funnels en paralelo) va contra recomendación agente de Plan (solo A). Resolución: ambos pero asimétrico 70/30 con regla dura de reasignación. Ejemplo de balance recomendación técnica vs. input de negocio.
- Costa Rica tiene una ventana regulatoria única (Factura 4.4 obligatoria sept 2025) que ningún SaaS internacional cubre. Moat real de messaging.

---

*Próxima entrada: v2 — al final de semana 1 (2026-04-27) con avance de bloqueantes.*
