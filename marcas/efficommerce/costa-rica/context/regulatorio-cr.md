---
doc: Marco regulatorio Costa Rica — impacto en EffiCommerce
marca: efficommerce
pais: Costa Rica
fecha: 2026-04-17
relevancia: crítico — base del ángulo de venta Funnel A
---

# Marco regulatorio Costa Rica 2026 — impacto en la estrategia

Este documento resume las normativas costarricenses relevantes para un negocio ecommerce que use EffiCommerce. Es **la base del ángulo de venta del Funnel A** (compliance-as-a-feature). También define obligaciones del propio lanzamiento de EffiCommerce en CR (Ley 8968).

## 1. Factura Electrónica 4.4

**Vigente desde:** septiembre 2025
**Organismo:** Ministerio de Hacienda de Costa Rica
**Alcance:** todo contribuyente obligado a facturar — >450,000 afectados

### Cambios clave v4.4 (vs 4.3)

- **146 ajustes XML** en estructura de comprobantes.
- Nuevos códigos de medio de pago obligatorios en el XML:
  - `01` Efectivo
  - `02` Tarjeta
  - `03` Cheque
  - `04` Transferencia bancaria
  - `05` Recaudado por terceros
  - **`06` SINPE Móvil** — ahora obligatorio registrarlo explícitamente
  - `07` Plataformas digitales
  - `99` Otros
- Recibo Electrónico de Pago (REP) nuevo para transacciones a crédito — permite trasladar IVA cuando se recibe el pago (hasta 90 días).
- Nuevos campos de geolocalización del emisor.
- Validación más estricta de datos del receptor (identificación obligatoria).

### Implicaciones para EffiCommerce

- **Ángulo Funnel A**: "EffiCommerce emite XML 4.4 válido por defecto — olvídate de rechazos de Hacienda". Este es el USP nº 1 de la marca en CR.
- Confirmado con el equipo (2026-04-17): EffiCommerce soporta XML 4.4 + código 06 SINPE Móvil nativos.
- Riesgo: prometer 4.4 y fallar un campo → rechazo Hacienda → reputación destruida. QA obligatorio por cliente antes del onboarding.

## 2. SINPE Móvil

**Definición:** Sistema Interbancario Nacional de Pagos (SINPE) — rama móvil. Funciona con número de teléfono como identificador. Administrado por BCCR (Banco Central de Costa Rica).

| Dato | Valor |
|---|---|
| Código medio pago en Factura 4.4 | **06** |
| Monto movido en 2024 | **+10 billones de colones** |
| Radar de Hacienda | Auditoría a usuarios con **>100 transferencias mensuales** |

### Implicaciones para EffiCommerce

- **Must-have**: checkout EffiCommerce debe soportar SINPE Móvil como medio de pago, **registrarlo con código 06 en el XML 4.4 automáticamente**, y preservar el número de transacción para auditoría.
- **Ángulo en creativos**: "Vende con SINPE Móvil sin dolores de cabeza con Hacienda. Cada venta se registra automáticamente con el código 06."
- Oportunidad de upsell: módulo de conciliación SINPE para negocios con >100 transferencias mensuales (el grupo auditado por Hacienda).

## 3. IVA 13%

**Base imponible:** todos los bienes y servicios, salvo excepciones específicas (canasta básica, salud, educación).

### Implicaciones

- Checkout de EffiCommerce debe calcular 13% IVA automáticamente.
- Factura 4.4 debe mostrar IVA desglosado por línea.
- Régimen simplificado (algunos comercios pequeños) no paga IVA — EffiCommerce debe diferenciar en el setup del cliente.
- Régimen de Tributación Simplificada no emite facturas electrónicas pero sí tiquetes. EffiCommerce puede cubrir ambos.

## 4. Ley 8968 — Protección de la Persona frente al Tratamiento de sus Datos Personales

**Vigente desde:** 2011
**Organismo regulador:** PRODHAB (Agencia de Protección de Datos de los Habitantes)

### Obligaciones que aplican al lanzamiento EffiCommerce CR

| Obligación | Cumple EffiCommerce | Acción requerida |
|---|---|---|
| Consent explícito separado de T&C | Pendiente | Implementar en landing: 2 checkboxes separados (T&C + marketing). |
| Política de retención de datos | Pendiente | Escribir política: retención 24 meses leads no convertidos, 5 años clientes. |
| Derecho acceso/rectificación/supresión (ARCO) | Pendiente | Email `privacidad.cr@efficommerce.com` + flow de respuesta ≤ 10 días hábiles. |
| Registro BD ante PRODHAB | Aplica si > 10k registros de datos personales | Evaluar al mes 4. Costo de registro: ~$50 USD, aprobación ~30 días. |
| Transferencia internacional de datos | Supabase en USA/EU | Cláusula de consentimiento internacional obligatoria en política. |
| Encargado del tratamiento | Grupo Effi | Designar DPO (interno o externo). |

### Impacto operativo en landing

- **Consent Mode v2 de Google NO es suficiente** para Ley 8968. Se requiere consent adicional explícito específico de datos personales en el form.
- Micro-copy obligatorio bajo el form:
  > "Al enviar este formulario acepto el [Aviso de Privacidad](/cr/privacidad) de EffiCommerce y autorizo el tratamiento de mis datos personales bajo Ley 8968 para fines de contacto comercial. Puedo revocar este consentimiento en cualquier momento escribiendo a privacidad.cr@efficommerce.com."

## 5. Régimen migratorio / residencia fiscal

No aplica directamente al lanzamiento de captación, pero relevante si EffiCommerce va a contratar equipo CR local:
- Retención ISR por servicios profesionales a no residentes: 25%.
- Si se contrata empleado CR: aportes CCSS ~26% adicional al salario.

## 6. Ley del Consumidor (7472)

Relevante para claims publicitarios:
- No usar "garantizado", "único", "#1", "mejor" sin prueba verificable.
- Ofertas con precio: mostrar precio antes/después claramente.
- Periodo de retracto de 8 días hábiles en compras a distancia (ecommerce B2C).
- EffiCommerce B2B: la mayoría de esta ley no aplica al producto SaaS (el cliente es empresa), pero sí al marketing.

## 7. Publicidad digital — Ley 8968 aplicada a cookies y pixels

- Consent Mode v2 cubre cookies y SDK tracking (OK).
- CAPI (Conversion API Meta) sin consent → prohibido. Implementar CAPI con consent flag respetado.
- Listas de remarketing solo de usuarios con consent activo.

## 8. Checklist compliance para el lanzamiento

- [ ] Términos y Condiciones CR publicados en `/cr/terminos`
- [ ] Aviso de Privacidad CR publicado en `/cr/privacidad`
- [ ] Consent explícito en formulario (checkbox separado)
- [ ] Email privacidad activo y flow de respuesta ≤ 10 días
- [ ] Consent Mode v2 implementado
- [ ] CAPI con respeto de consent flag
- [ ] DPO designado
- [ ] Plantilla WhatsApp Business API con opt-out visible
- [ ] Política retención leads 24 meses / clientes 5 años
- [ ] Registro PRODHAB pendiente (evaluar mes 4)

## 9. Referencias

- [Factura Electrónica 4.4 - Ministerio de Hacienda CR](https://www.hacienda.go.cr)
- [Nueva declaración IVA CR - Facturele](https://www.facturele.com/2025/07/04/nueva-declaracion-del-iva-costa-rica/)
- [SINPE Móvil, Factura 4.4 y Hacienda Digital - Delfino.cr](https://delfino.cr/2025/08/sinpe-movil-factura-4-4-y-hacienda-digital-lo-que-deben-saber-los-contribuyentes)
- [Ley 8968 - PRODHAB](https://www.prodhab.go.cr)
- [Ley 7472 Consumidor CR](https://www.meic.go.cr)
