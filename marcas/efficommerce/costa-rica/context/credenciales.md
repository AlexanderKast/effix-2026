---
doc: Credenciales e IDs — EffiCommerce Costa Rica
marca: efficommerce
pais: Costa Rica
fecha: 2026-04-17
confidencial: parcial
nota: "Este archivo NO contiene passwords ni API keys. Solo IDs de cuentas y convenciones. Las credenciales completas viven en 1Password / vault."
---

# Credenciales e IDs — EffiCommerce Costa Rica

Registro maestro de IDs de cuentas, tags, pixels y recursos. Actualizar conforme se crean.

## Cuentas publicitarias

| Plataforma | ID | Owner | Status | Fecha creación |
|---|---|---|---|---|
| Google Ads CR | — | — | Por crear | — |
| Meta Ads Manager CR | — | — | Por crear | — |
| Meta Business Manager | — | — | Por crear | — |
| Meta Pixel CR | — | — | Por crear | — |
| Meta CAPI Dataset | — | — | Por crear | — |
| TikTok Ads (opcional Fase 2) | — | — | No aplica aún | — |

## Analítica

| Recurso | ID | Status |
|---|---|---|
| GA4 Property CR | — | Por crear |
| GA4 Stream Web CR | — | Por crear |
| GTM Container CR | — | Por crear |
| GA4 Measurement ID | — | Por crear |

## Hosting y dominio

| Recurso | Valor | Status |
|---|---|---|
| Dominio principal | `efficommerce.com` | Activo (verificar owner) |
| Subdirectorio CR | `efficommerce.com/cr` | Por configurar |
| Hosting | Vercel | Por conectar |
| Proyecto Vercel | `efficommerce-cr` (sugerido) | Por crear |
| Repositorio Git | Por definir (mismo repo o separado) | Por definir |

## WhatsApp Business API

| Recurso | Valor | Status |
|---|---|---|
| Proveedor WABA | Twilio o 360dialog (por decidir) | Por contratar |
| Número WA Business CR | +506 XXXX-XXXX | Por solicitar |
| Display name | EffiCommerce Costa Rica | Por verificar con Meta |
| Plantillas aprobadas | 0 | Por someter a aprobación |

## Backend y datos

| Recurso | Valor | Status |
|---|---|---|
| Supabase project | efficommerce-cr (sugerido) | Por crear |
| Tabla leads | `leads_efficommerce_cr` | Por crear (migración SQL) |
| n8n workflow | `efficommerce-cr-leads` | Por importar |
| Endpoint webhook | `https://n8n.efficommerce.com/webhook/cr-leads` | Por crear |

## Consent y compliance

| Recurso | Valor | Status |
|---|---|---|
| Consent Mode v2 (Google) | Tag "Consent" GTM | Por implementar |
| Cookiebot / Iubenda | Cookiebot free tier o equivalente | Por contratar |
| DPO Grupo Effi | Por designar | Por asignar |
| Email privacidad CR | `privacidad.cr@efficommerce.com` | Por crear |
| Registro PRODHAB | No registrado (evaluar mes 4 si >10k leads) | Diferido |

## Convenciones de nombres

### Campañas Meta
Formato: `[Fase] [Objetivo] | [Funnel] | [Creativo] | [Geo]`
Ejemplos:
- `F1 Conversations WA | Funnel A | Video_Pulperia_v1 | CR-GAM`
- `F1 Traffic Landing | Funnel B | Static_ShopifyMigration_v1 | CR-Nacional`

### Campañas Google
Formato: `[Tipo] [Target] | [Match] | [Funnel]`
Ejemplos:
- `Search Brand | Exact | Funnel AB`
- `Search Cat A | Phrase | Funnel A`
- `Search Cat B | Phrase | Funnel B`
- `PMax Web | Auto | Funnel A` (Fase 2 solamente)

### UTMs estándar

```
utm_source={meta|google|wa|referral}
utm_medium={cpc|video|story|search|pmax|chat}
utm_campaign={slug-campaña}
utm_content={creativo-variante}
utm_term={keyword-o-audiencia}
```

Ejemplo completo:
```
?utm_source=meta&utm_medium=video&utm_campaign=f1-wa-funnel-a&utm_content=pulperia-v1&utm_term=int-smb-30-55
```

## Seguridad y acceso

**Quién tiene qué (completar al asignar equipo)**:

| Persona | Role Google Ads | Role Meta BM | Role Vercel | Role GA4 | Role Supabase |
|---|---|---|---|---|---|
| Estratega CR | Read+Edit | Admin | Viewer | Editor | Viewer |
| Trafficker CR | Edit | Advertiser | — | Viewer | — |
| Creativo CR | — | Media Planner | — | — | — |
| Dev | — | Pixel Admin | Admin | Admin | Admin |

## Log de cambios

- **2026-04-17**: archivo creado con estructura. Todas las cuentas pendientes de aprovisionar en semana 1.
