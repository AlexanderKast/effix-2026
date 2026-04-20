# Dashboard — Marketing Ops Grupo Effi

Aplicación React que muestra el estado y operación de las 10 marcas del Grupo Effi más un **módulo admin** para gestión de leads, campañas, usuarios y auditoría. Conecta con Supabase compartido con UGC Colombia.

## Stack

- React 18.3.1 + TypeScript 5.7 + Vite 6
- Tailwind CSS v4 + Radix UI (shadcn-style components)
- TanStack React Query v5 (caching + server state)
- React Router DOM v7 (instalado pero app usa navigation state interno)
- Supabase JS v2 (auth + DB)
- Recharts (gráficos) · Lucide Icons · date-fns · Zod · react-hook-form · sonner (toasts)

## Arquitectura de rutas

Hasta hoy el app usa un patrón de `NavigationState` (module + submodule) en lugar de URLs. Se mantiene para no romper lo existente. El módulo admin se integra como **`module: 'admin'`** con sus propios submodules.

```
NavigationState {
  module: 'dashboard' | 'admin' | brandSlug
  submodule:
    · si module='dashboard': 'resumen'
    · si module='admin': 'overview' | 'leads' | 'campaigns' | 'users' | 'brands' | 'audit' | 'settings'
    · si module=brandSlug: 'resumen'|'pauta'|'estrategia'|'analitica'|'seguimiento'|'financiero'|'creativos'|'operativo'
}
```

## Estructura de carpetas

```
dashboard/
├── src/
│   ├── App.tsx               # Root — auth gate + renderView
│   ├── main.tsx              # Mount React + AuthProvider + QueryClient
│   ├── index.css             # Tailwind base + tokens EffiCommerce
│   │
│   ├── lib/
│   │   ├── supabase.ts       # Cliente Supabase singleton
│   │   ├── auth.ts           # Helpers auth (signIn, signOut, getSession)
│   │   └── utils.ts          # cn() etc.
│   │
│   ├── hooks/
│   │   ├── useAuth.ts        # Hook sesión actual
│   │   ├── useAdminProfile.ts # Hook perfil admin (role, permisos)
│   │   ├── useMetrics.ts
│   │   ├── useCommercials.ts
│   │   └── useCurrencyConverter.ts
│   │
│   ├── components/
│   │   ├── AuthProvider.tsx  # Context sesión + perfil
│   │   ├── Layout.tsx        # Layout general (marcas)
│   │   ├── AdminLayout.tsx   # Layout admin con sidebar propio
│   │   ├── LoginView.tsx     # Email + password login
│   │   ├── ProtectedRoute.tsx # Guard por rol
│   │   ├── [feature]/...     # Components específicos feature
│   │   └── ui/...            # shadcn primitives
│   │
│   ├── views/
│   │   ├── GrupoView.tsx     # Vista dashboard grupo
│   │   ├── MarcaView.tsx     # Vista marca-país (existente)
│   │   └── admin/
│   │       ├── AdminDashboardView.tsx
│   │       ├── AdminLeadsView.tsx
│   │       ├── AdminCampaignsView.tsx
│   │       ├── AdminUsersView.tsx
│   │       ├── AdminBrandsView.tsx
│   │       ├── AdminAuditView.tsx
│   │       └── AdminSettingsView.tsx
│   │
│   ├── data/
│   │   ├── brand-modules.ts  # Definición 10 marcas
│   │   ├── admin-modules.ts  # Definición módulos admin
│   │   ├── mock-data.ts
│   │   ├── sales-data.ts
│   │   ├── analytics-helpers.ts
│   │   └── excel-raw.json
│   │
│   └── types/
│       ├── index.ts
│       └── admin.ts          # Types admin_effix_* (generados de Supabase)
│
├── .env.example              # Plantilla de variables
├── .env.local                # Vars reales (gitignore)
├── package.json
├── tsconfig.json
└── vite.config.ts
```

## Convenciones de código

- **Alias de imports**: `@/` → `src/`. Configurado en `tsconfig.json` y `vite.config.ts`.
- **Componentes**: PascalCase. Un componente por archivo cuando es página/vista.
- **Hooks**: prefijo `use*`, un hook por archivo.
- **Tipos**: `PascalCase` para interfaces/types. Tipos de Supabase en `types/admin.ts`.
- **Fechas**: siempre usar `date-fns` con `locale: es`. ISO strings en Supabase.
- **Moneda**: mostrar USD como referencia interna + moneda local de cada marca (CRC, COP, USD-EC).
- **Comentarios**: mínimos. Solo para WHY no obvio (constraint, invariante, bug específico).
- **Queries Supabase**: envueltas en `useQuery` o `useMutation` de TanStack. Cache key por tabla + filtros.
- **Error handling**: `sonner` toasts para errores user-facing. `console.error` para dev.

## Autenticación

- **Proveedor**: Supabase Auth (proyecto `domxgsrajwyuaffiqbtr`).
- **Login**: email + password. Sin OAuth por ahora (abrir Google/GitHub si se decide).
- **Usuarios**: compartidos con UGC Colombia y otros proyectos de Alexander Cast. Ya existen en `auth.users`. La migración seed los importa todos a `admin_effix_profiles` con role `admin` por defecto.
- **Roles**:
  - `super_admin` — todo + gestiona otros admins
  - `admin` — lee/edita leads, campañas, audit. No gestiona usuarios ni settings.
  - `viewer` — solo lectura.
- **RLS**: aplicada en Supabase. El front también valida role en el guard para UX.

## Base de datos

**Proyecto Supabase**: `domxgsrajwyuaffiqbtr` (compartido con UGC Colombia)

**Schema efffix admin** (aislado con prefijo `admin_effix_*`):

- `admin_effix_profiles` — extiende `auth.users` con role y metadata admin
- `admin_effix_leads` — leads de EffiCommerce CR + otros países/marcas
- `admin_effix_campaigns` — campañas Meta/Google por marca-país
- `admin_effix_audit_log` — log append-only de acciones
- `admin_effix_settings` — configuración clave-valor

Migraciones en `../sistema/supabase/migrations/`.

## Variables de entorno

```
VITE_SUPABASE_URL=https://domxgsrajwyuaffiqbtr.supabase.co
VITE_SUPABASE_ANON_KEY=<anon key del proyecto>
```

Nunca commitear `.env.local`. El `.env.example` sirve de plantilla.

El proyecto Supabase `domxgsrajwyuaffiqbtr` es compartido con UGC Colombia y otros proyectos del ecosistema Alexander Cast. Los mismos usuarios que tienen acceso allí pueden entrar al admin — el control granular se hace en la tabla `admin_effix_profiles`.

## Scripts

```bash
npm install          # Instalar deps
npm run dev          # Vite dev server (localhost:5173)
npm run build        # Typecheck + build producción
npm run preview      # Preview build
```

## Deploy

**Pendiente**. Opciones:
1. Proyecto Vercel propio `effi-dashboard` con `rootDirectory: dashboard/`.
2. Monorepo con `vercel.json` ruteando.
3. Netlify.

## Qué NO hacer

- No escribir en `admin_effix_*` sin pasar por RLS (usar el cliente autenticado siempre).
- No exponer `service_role` key en el front (solo anon key).
- No hardcodear URLs Supabase — usar variables de entorno.
- No romper `NavigationState` patrón existente al agregar admin. Es un módulo más.
- No hacer queries dentro de componentes sin `useQuery` (mata el caching).
