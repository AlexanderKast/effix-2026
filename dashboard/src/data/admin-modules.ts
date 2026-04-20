import type { AdminSubmoduleKey } from './brand-modules'
import type { AdminRole } from '@/types/admin'

export interface AdminModule {
  key: AdminSubmoduleKey
  name: string
  description: string
  icon: string // lucide icon name
  /** Roles que pueden ver este módulo. Si undefined → todos los admins autenticados. */
  requiresRole?: AdminRole[]
}

export const adminModules: AdminModule[] = [
  {
    key: 'overview',
    name: 'Dashboard',
    description: 'Resumen global de leads, campañas y operación',
    icon: 'LayoutDashboard',
  },
  {
    key: 'leads',
    name: 'Leads',
    description: 'Gestión de leads multi-marca multi-país',
    icon: 'Inbox',
  },
  {
    key: 'campaigns',
    name: 'Campañas',
    description: 'Campañas activas Meta, Google, TikTok',
    icon: 'Megaphone',
  },
  {
    key: 'brands',
    name: 'Marcas',
    description: 'Configuración de marcas y países del Grupo Effi',
    icon: 'Briefcase',
    requiresRole: ['super_admin', 'admin'],
  },
  {
    key: 'users',
    name: 'Usuarios',
    description: 'Administradores, roles y permisos',
    icon: 'Users',
    requiresRole: ['super_admin'],
  },
  {
    key: 'audit',
    name: 'Auditoría',
    description: 'Log de acciones del equipo',
    icon: 'ScrollText',
    requiresRole: ['super_admin', 'admin'],
  },
  {
    key: 'settings',
    name: 'Configuración',
    description: 'Ajustes globales, integraciones, webhooks',
    icon: 'Settings',
    requiresRole: ['super_admin'],
  },
]

export const adminSubmoduleLabels: Record<AdminSubmoduleKey, string> = Object.fromEntries(
  adminModules.map(m => [m.key, m.name])
) as Record<AdminSubmoduleKey, string>
