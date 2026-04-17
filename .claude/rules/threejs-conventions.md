---
name: threejs-conventions
description: Three.js coding conventions for the Anna's Farm 3D scene editor. Loads for all scene_3d/ work.
paths:
  - "scene_3d/**"
---

# Three.js Editor Conventions — non-negotiable

## Architecture
- **Single-file HTML** — `editor-pbr.html` is the editor. All JS lives inside `<script type="module">`.
- **No build system** — vanilla ES module imports from unpkg CDN (Three.js r160).
- **No npm/node_modules** — everything runs from a static file server.

## Three.js version lock
| Library | Version | CDN |
|---|---|---|
| three | 0.160.0 | unpkg.com/three@0.160.0 |

Do NOT upgrade Three.js without explicit approval. Addons come from `three/addons/`.

## Material system
- All materials are `MeshStandardMaterial` (PBR)
- Procedural normal maps + roughness maps generated from `makeNoiseDataTexture()` / `makeNormalFromHeight()`
- Material library keyed in `MATS{}` object — add new materials there
- `repeatMap()` helper sets wrap + repeat on all map channels

## Object system
- Every placeable object type has a `build<Type>()` function returning a `THREE.Group`
- Registered in `BUILDERS{}` and `TYPE_ALIASES{}`
- Each object gets `userData.family`, `userData.id`, `userData.home`, `userData.isBase`
- `selectables[]` is the master list of scene objects

## Feature branch workflow
- Each feature from `FEATURES.md` gets branch `feature/<slug>`
- Branch from `main`, merge back to `main` after testing
- Test by opening `editor-pbr.html` in a browser — no test suite (visual verification)

## Units
- Internal: meters (Three.js world units = meters)
- Display: feet and inches (conversion at UI boundary)
- Flagstone slabs: real-world scale (2-5 ft tall, 2-5 in thick)

## Performance budget
- Target: 60fps at 1080p
- Shadow map: 2048x2048 (single directional light)
- SSAO + FXAA post-processing enabled by default
- Max scene objects before concern: ~200
