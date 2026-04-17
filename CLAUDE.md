# Anna's Farm 3D Landscape Editor

## What this is
A browser-based 3D scene editor for designing landscape installations at Anna's Farm HOA in Lafayette, Colorado. Built with Three.js r160, single-file HTML architecture, PBR materials, procedural geometry.

**Client:** Anna's Farm HOA
**Contractor:** Sunrise Landscape Co. (William Held)

## Key files
- `scene_3d/editor-pbr.html` — the entire editor (HTML + CSS + JS in one file)
- `scene_3d/anna_scene.glb` — base 3D scene exported from Blender
- `scene_3d/FEATURES.md` — 17 features across 5 phases
- `plans/IMPLEMENTATION_PLAN.md` — agent team assignments and task breakdown

## Tech stack
- Three.js 0.160.0 (ES modules from unpkg CDN)
- No build system, no npm, no node_modules
- Vanilla HTML/CSS/JS
- IndexedDB for project persistence (planned)
- Static file server for development (`python3 -m http.server`)

## Agent team
| Agent | Responsibility |
|---|---|
| `feature-orchestrator` | Branch management, delegation, merge coordination |
| `threejs-geometry-engineer` | Procedural geometry, materials, BufferGeometry |
| `editor-ui-engineer` | HTML/CSS panels, DOM events, paint, persistence |
| `lighting-engineer` | Lights, sky, fog, weather, atmosphere |
| `osm-integration-engineer` | OpenStreetMap tiles, GPS grounding |
| `scene-qa` | Visual QA checklist, convention enforcement |
| `compliance-gate` | Rule enforcement across diffs |

## Rules (non-negotiable)
- Colorado-sourced materials ONLY (no Arizona sandstone, no imported stone)
- Non-deterministic language in all descriptions ("groupings" not "exactly 5")
- Flagstone slabs face northwest (more west than north)
- Three.js r160 locked — do not upgrade without approval
- Feature branches: `feature/<slug>` off `main`
- All objects use `MeshStandardMaterial` (PBR)
- Real-world scale: 1 Three.js unit = 1 meter

## Running the editor
```bash
cd scene_3d && python3 -m http.server 8080
# Open http://localhost:8080/editor-pbr.html
```
