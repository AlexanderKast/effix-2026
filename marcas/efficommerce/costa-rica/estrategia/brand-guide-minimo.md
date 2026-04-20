---
doc: Brand guide mínimo — EffiCommerce (lanzamiento CR)
marca: efficommerce
alcance: uso global — nace con lanzamiento CR pero aplica a toda la marca
fecha: 2026-04-17
version: "0.1 — propuesta para aprobación"
estado: propuesta — pendiente validación con CEO y Design Lead
---

# Brand guide mínimo — EffiCommerce

Este es el brand guide mínimo viable para arrancar el lanzamiento CR. **No reemplaza** un brand guide completo que debería desarrollarse Q3 2026. Propone paleta, tipografía y reglas suficientes para producir landing + anuncios consistentes en las próximas 10 semanas.

> ⚠️ **Pendiente de aprobación** del CEO y Design Lead antes de producir landing final. Usar como placeholder operativo mientras tanto.

## 1. Esencia de marca

EffiCommerce es **software B2B SaaS serio para pymes latinoamericanas**. No es un evento. No es lifestyle. No es un infoproducto. Es una herramienta de trabajo que les hace el día más fácil a dueños de negocios.

### Arquetipos aplicables (Mark & Pearson)

- **Primario: El Gobernante** (poner orden, cumplir) — resuena con el dolor de Factura 4.4, SINPE, Hacienda.
- **Secundario: El Tipo Común** (accesible, hablado como yo) — evita distancia con pulperos/soderos/talleres.

### Palabras-clave de brand

- **Competente** — sabemos qué hacemos.
- **Cálido** — no somos un robot corporativo.
- **Cumplido** — entregamos lo que prometemos.
- **Costarricense-LATAM** — pertenecemos a la región.

### Palabras que NO somos

- Disruptivo / revolucionario
- Lujoso / premium (aunque tenemos planes caros)
- Millennial / cool
- Gurú / transformador

## 2. Paleta de colores (propuesta v0.1)

| Color | Hex | Uso |
|---|---|---|
| **Effi Navy** | `#0E2A47` | Principal. Headlines, CTAs primarios, backgrounds oscuros. Transmite competencia y seriedad B2B. |
| **Effi Mint** | `#1BC49C` | Secundario. Acento positivo (checks, tags "incluido", badges "nuevo"). No usar en bloques grandes. |
| **Effi Sun** | `#F5B700` | Terciario / llamada a acción secundaria. Notificaciones de urgencia, highlights. Uso moderado. |
| **Effi Cream** | `#FAF7F0` | Background claro. Suave para landing principal, no blanco puro. |
| **Effi Ink** | `#1A1A1A` | Texto principal. No usar `#000` puro. |
| **Effi Muted** | `#6B7280` | Texto secundario, placeholders, meta información. |

### Reglas de uso

- **Regla 60/30/10**: Effi Cream 60% · Effi Navy 30% · Effi Mint/Sun 10%.
- Effi Navy + Effi Mint es la combinación primaria (botones, highlights).
- Effi Sun se usa máximo 1-2 veces por pantalla (CTAs secundarios, badges).
- NO usar la paleta de Feria Effix (negro + oro + rojo) — es una marca distinta.

### Referencia visual

- Inspiración directiva: Stripe, Rippling, Hubspot (seriedad SaaS B2B LATAM-friendly).
- NO referencias: Shopify (demasiado verde), Klaviyo (demasiado púrpura), marcas de influencer.

## 3. Tipografía

| Uso | Fuente | Fallback |
|---|---|---|
| **Display / Headlines** | **Inter Tight** (700-800) | `system-ui, sans-serif` |
| **Body** | **Inter** (400-500) | `system-ui, sans-serif` |
| **Monospace (código, números)** | **JetBrains Mono** (400) | `monospace` |

### Justificación

Inter e Inter Tight son gratuitas (Google Fonts), robustas, con excelente legibilidad en español (tildes correctas), y transmiten serio + moderno. No usamos Bebas Neue (es de Feria Effix, evento) ni DM Sans (algo más infantil).

### Escala tipográfica (landing mobile-first)

```
Display XL (hero)  — 56px / 64px line-height  | Inter Tight 800
Display L          — 44px / 52px              | Inter Tight 700
H1                 — 36px / 44px              | Inter Tight 700
H2                 — 28px / 36px              | Inter Tight 700
H3                 — 22px / 30px              | Inter 600
Body L             — 18px / 28px              | Inter 400
Body M             — 16px / 26px              | Inter 400
Body S             — 14px / 22px              | Inter 400
Caption            — 12px / 18px              | Inter 500
```

## 4. Logo y aplicación

### Estado actual

No existe un logo oficial de EffiCommerce. **Entregable semana 1**: logo SVG en 2 versiones (color + monocromo) creado por Design Lead.

### Requisitos mínimos del logo

- Legible a 24px de alto (tamaño mínimo footer).
- Versión horizontal + versión iso (para favicon y app).
- SVG + PNG 3x.
- Color principal: Effi Navy. Alternativa blanca para fondos oscuros.

### Placeholder temporal

Mientras se produce el logo definitivo: wordmark texto plano `EffiCommerce` en Inter Tight 800, Effi Navy, letra-espaciado -2%.

## 5. Fotografía e iconografía

### Fotografía

- **Estilo**: real, no glossy. Personas costarricenses/latinoamericanas trabajando.
- **Contexto**: pulperías, sodas, talleres, oficinas profesionales, tiendas físicas, escritorios con computadora.
- **Prohibido**: stock gringos, modelos lifestyle, manos con smartphones elegantes sobre mesas blancas.
- **Recomendado**: fotos CR reales (contratar fotógrafo) o Unsplash con filtrado fuerte LATAM.

### Iconografía

- Sistema: **Phosphor Icons** (outline 1.5px o regular).
- Estilo: geométrico, no doodles.
- Color: Effi Navy default, Effi Mint para positivos, Effi Sun para alertas.

## 6. Componentes UI (referencia para landing)

### Botón primario
```
Background: Effi Navy (#0E2A47)
Text: #FFFFFF
Border-radius: 8px
Padding: 14px 28px
Font: Inter 600, 16px
Hover: Navy darken 10%
```

### Botón secundario
```
Background: transparent
Border: 2px solid Effi Navy
Text: Effi Navy
Hover: Navy fill, white text
```

### Botón CTA especial (WhatsApp)
```
Background: #25D366 (WhatsApp green — solo para CTAs WA)
Text: #FFFFFF
Icon: WhatsApp icon left
```

### Card
```
Background: #FFFFFF sobre Effi Cream
Border: 1px solid #E5E7EB
Border-radius: 12px
Padding: 24px
Shadow: 0 1px 2px rgba(0,0,0,0.05)
```

## 7. Tono en UI copy

- Botones: verbo+acción. "Hablemos por WhatsApp" > "Enviar mensaje".
- Errors: cálidos. "Upss, revisá el correo" > "Error: email inválido".
- Success: breves. "Listo, te vamos a escribir" > "Operación completada exitosamente".

## 8. Aplicación en la landing CR

- Hero dark: Effi Navy fondo, texto blanco, CTA Effi Mint.
- Secciones alternan: Effi Cream (bloque 1) → blanco (bloque 2) → Effi Cream (bloque 3), etc.
- Social proof: background Effi Navy con testimonios en blanco.
- Footer: Effi Navy con links Effi Mint.

## 9. Qué NO heredar de otras marcas del Grupo Effi

- **No paleta Feria Effix** (negro + oro + rojo) — es una marca de evento.
- **No tipografía Bebas Neue** — es de eventos/lifestyle.
- **No imaginería de evento** (luces, escenarios, asistentes).
- **No promesas tipo "el evento más grande"** — EffiCommerce es software, no espectáculo.

## 10. Referencias de validación

### Inspiración visual aprobada (benchmarks)

- [Stripe](https://stripe.com) — claridad, seriedad, calor LATAM en algunas páginas.
- [Rippling](https://rippling.com) — B2B SaaS que se siente humano.
- [Notion](https://notion.so) — claridad y buen uso de color acento.

### Anti-referencias (NO hacer así)

- Shopify homepage — demasiado colorida y cuasi-lifestyle.
- Klaviyo — púrpura saturado no encaja con LATAM.
- Marcas de influencer coaching — lifestyle + promesas grandiosas.

## 11. Próximos pasos (bloqueantes semana 1)

- [ ] CEO aprueba esencia de marca y paleta
- [ ] Design Lead entrega logo v1 (horizontal + iso)
- [ ] Desarrollador crea package de tokens (CSS variables) desde esta paleta
- [ ] Template component base en landing-cr (hero, card, botón) usando tokens
- [ ] Post-semana 12: abrir brief para brand guide completo Q3 2026

## Changelog

- **v0.1 — 2026-04-17**: propuesta inicial generada para lanzamiento CR. Pendiente aprobación.
