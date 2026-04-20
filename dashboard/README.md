# Dashboard + Admin — Grupo Effi

App React (Vite + TypeScript) con dos secciones:

- **Dashboard de marcas** — vista operativa de las 10 marcas del Grupo Effi.
- **Panel Admin** — gestión de leads, campañas, usuarios, auditoría y configuración, conectado al Supabase compartido con UGC Colombia y otros proyectos del ecosistema Alexander Cast.

## Setup rápido

### 1. Instalar dependencias

```bash
cd dashboard
npm install
```

### 2. Configurar variables de entorno

```bash
cp .env.example .env.local
# Editar .env.local y pegar VITE_SUPABASE_ANON_KEY real
```

El Supabase project es `domxgsrajwyuaffiqbtr` (compartido). El anon key se saca del panel Supabase → Project Settings → API.

### 3. Aplicar migraciones SQL

Desde el SQL Editor del panel Supabase, pegar y ejecutar **en orden**:

1. **Schema** → `../sistema/supabase/migrations/20260417_admin_effix_schema.sql`
   Crea tablas `admin_effix_*`, enums, RLS, triggers y seeds iniciales. No toca las tablas de otros proyectos (UGC Colombia, Alexander Cast) porque usa prefijo dedicado.

2. **Seed usuarios** → `../sistema/supabase/migrations/20260417_admin_effix_seed_users.sql`
   Importa automáticamente todos los usuarios de `auth.users` como `admin` y designa los emails del equipo core como `super_admin`.

> Antes de ejecutar el seed, abrí el archivo y confirmá que la lista de emails a promover a `super_admin` es correcta. Por defecto incluye `founder@kreoon.com`, `jacsolucionesgraficas@gmail.com`, `alexander7818@gmail.com`, `dev@kreoon.com`. Agregá / quitá según necesidad y re-ejecutá — es idempotente.

### 4. Correr el dev server

```bash
npm run dev
# http://localhost:5173
```

Entrás con los mismos credenciales (email + password) que ya usás en UGC Colombia o cualquier otro proyecto que comparta este Supabase.

## Cómo funciona el acceso al admin

1. User visita la app → si no tiene sesión, ve `LoginView`.
2. Login con email/password Supabase. Mismos credenciales que los otros proyectos.
3. Después del login, el front consulta `admin_effix_profiles` por `user.id`.
4. Si **no existe** registro → pantalla `NoAccessView` (sesión abierta, sin panel).
5. Si existe y está activo → el sidebar principal muestra link **"Admin"**.
6. Clic en Admin → `AdminLayout` con sidebar propio y 7 secciones.

## Roles y permisos

| Rol | Dashboard / Leads / Campañas / Marcas / Auditoría | Usuarios | Settings |
|---|---|---|---|
| `super_admin` | ✅ edita | ✅ edita | ✅ edita |
| `admin` | ✅ edita | 👁️ solo lectura | ❌ |
| `viewer` | 👁️ solo lectura | ❌ | ❌ |

Enforcement en **dos capas**:
- **RLS de Supabase** (fuente de verdad — nadie puede brincarse el cliente).
- **UI del front** (para UX — oculta botones y rutas).

## Gestión de usuarios

### Agregar un nuevo usuario al admin

Como los usuarios ya existen en `auth.users`, no hay que "crearlos" — solo agregarlos a `admin_effix_profiles`:

- **Desde la UI** → entrar como super_admin → módulo Usuarios → cambiar rol de un user existente. (Requiere que el user tenga cuenta en el Supabase del ecosistema).
- **Desde SQL** → ejecutar:
  ```sql
  insert into public.admin_effix_profiles (id, email, full_name, role, is_active)
  select id, email, coalesce(raw_user_meta_data->>'full_name', email), 'admin', true
  from auth.users
  where email = 'nuevo@email.com'
  on conflict (id) do update set role = 'admin', is_active = true;
  ```

### Revocar acceso

- **Opción suave** → desactivar en UI (super_admin → Usuarios → toggle Activo).
- **Opción dura** → borrar el registro en `admin_effix_profiles` (no toca `auth.users`, el user mantiene acceso a otros proyectos).

## Estructura de carpetas

```
dashboard/
├── src/
│   ├── App.tsx                    # Auth gate + router mental
│   ├── main.tsx                   # Mount + AuthProvider
│   ├── lib/
│   │   ├── supabase.ts            # Cliente Supabase singleton
│   │   └── auth.ts                # signIn / signOut / reset
│   ├── hooks/
│   │   ├── useAuth.ts             # Re-export de AuthProvider
│   │   └── useAdminProfile.ts     # Permisos derivados
│   ├── components/
│   │   ├── AuthProvider.tsx       # Context sesión + perfil
│   │   ├── LoginView.tsx
│   │   ├── NoAccessView.tsx
│   │   ├── AdminLayout.tsx        # Shell con sidebar admin
│   │   ├── ProtectedRoute.tsx     # Guard por rol
│   │   ├── Layout.tsx             # Shell de marcas (existente)
│   │   └── Sidebar.tsx            # Sidebar principal (modificado: link Admin)
│   ├── views/admin/               # 7 vistas del admin
│   │   ├── AdminDashboardView.tsx
│   │   ├── AdminLeadsView.tsx
│   │   ├── AdminCampaignsView.tsx
│   │   ├── AdminBrandsView.tsx
│   │   ├── AdminUsersView.tsx
│   │   ├── AdminAuditView.tsx
│   │   └── AdminSettingsView.tsx
│   ├── data/
│   │   ├── brand-modules.ts       # Definición 10 marcas + NavigationState
│   │   └── admin-modules.ts       # Definición 7 módulos admin
│   └── types/
│       └── admin.ts               # Tipos Supabase + Database shape
├── .env.example
├── package.json
└── README.md
```

## Tablas Supabase (namespace `admin_effix_*`)

- `admin_effix_profiles` — extiende `auth.users` con rol + scope + metadata
- `admin_effix_leads` — leads de todas las landings y ads (multi-marca, multi-país)
- `admin_effix_campaigns` — campañas Meta/Google/TikTok por marca-país
- `admin_effix_audit_log` — log append-only de acciones
- `admin_effix_settings` — configuración clave-valor

No colisionan con las tablas de UGC Colombia u otros proyectos del ecosistema porque el prefijo es dedicado.

## Scripts

```bash
npm run dev       # Vite dev server
npm run build     # tsc -b && vite build
npm run preview   # Preview build
```

## Deploy a Vercel

1. Crear proyecto en Vercel apuntando al repo + `rootDirectory: dashboard/`.
2. Configurar variables de entorno `VITE_SUPABASE_URL` y `VITE_SUPABASE_ANON_KEY` en el panel Vercel.
3. Build command: `npm run build`. Output directory: `dist`.
4. Framework preset: `Vite`.
5. Deploy.

## Cómo insertar un lead programáticamente (desde una landing, backend, etc.)

Usando el cliente Supabase con `anon key` + consent del user (RLS valida):

```ts
await supabase.from('admin_effix_leads').insert({
  marca_slug: 'efficommerce',
  pais: 'CR',
  funnel: 'A',
  source: 'meta',
  nombre: 'Andrea García',
  telefono: '+50688889999',
  email: 'andrea@ejemplo.com',
  profile_type: 'professional',
  consent_ts: new Date().toISOString(),
  consent_version: 'v1',
  utm_source: 'meta',
  utm_campaign: 'f1-wa-funnel-a',
})
```

Desde backend privado → usar `service_role` key (nunca expuesto en frontend).

## Troubleshooting

- **"Variables Supabase faltantes"** → revisar que `.env.local` existe y `npm run dev` se reinició.
- **Login OK pero aparece NoAccessView** → tu user existe en `auth.users` pero no en `admin_effix_profiles`. Re-ejecutar la migración seed o insertar manualmente (ver sección "Gestión de usuarios").
- **"row violates row-level security policy"** → el rol actual no tiene permiso para esa acción. Revisar tabla `admin_effix_profiles` y confirmar role.
- **"permission denied for function admin_effix_*"** → la migración schema no se aplicó completa. Re-ejecutar.
- **Ningún super_admin después del seed** → editar la lista de emails en `20260417_admin_effix_seed_users.sql` con emails reales del equipo y re-ejecutar.

## Próximos pasos sugeridos

- [ ] Conectar las landings del grupo para que inserten leads directamente en `admin_effix_leads`.
- [ ] Importar campañas Meta/Google reales a `admin_effix_campaigns`.
- [ ] Agregar OAuth Google para login (además de email/password).
- [ ] Reemplazar edición Settings JSON crudo por forms tipados.
- [ ] Filtros guardados por user en `admin_effix_profiles.metadata`.
- [ ] Export a Excel además de CSV.
- [ ] Deploy a Vercel + custom domain `admin.grupoeffi.com`.
