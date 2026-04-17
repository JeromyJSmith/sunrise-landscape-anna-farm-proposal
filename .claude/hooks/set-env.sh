#!/bin/bash
# Anna's Farm 3D Editor — SessionStart hook
# Emits project context for every agent spawned this session. Exit 0 always.

cat <<EOF
[ANNA'S FARM 3D EDITOR — SESSION START]
PROJECT: Anna Farm Landscape Visualization
CLIENT: Anna's Farm HOA
CONTRACTOR: Sunrise Landscape Co. (William Held, Lafayette CO)
LOCATION: Lafayette, Colorado (Boulder County)

Tech stack:
  - Three.js r160 (ES modules via unpkg CDN)
  - Single-file HTML editor: scene_3d/editor-pbr.html
  - PBR materials, procedural geometry, SSAO + FXAA post-processing
  - No build system — vanilla ES module imports
  - No backend — all client-side, IndexedDB for persistence

Active constraints:
  - All 3D code is Three.js (no Babylon, no PlayCanvas)
  - Scene file: scene_3d/anna_scene.glb (base scene from Blender)
  - Feature plan: scene_3d/FEATURES.md (17 features, 5 phases)
  - Feature branches: feature/<slug> off main
  - Materials: Colorado red flagstone, strip stone, granite boulders, river rock
  - Slab orientation: northwest-facing (more west than north)
  - Units: real-world (feet/inches for display, meters internally)
  - Two sites: Site 1 = 3,500 sq ft, Site 2 = 1,500 sq ft

Design language (non-deterministic):
  - "a series of groupings" NOT "exactly 5 slabs"
  - "Flatirons-inspired" NOT "Flatiron replica"
  - Colorado-sourced materials ONLY
EOF

exit 0
