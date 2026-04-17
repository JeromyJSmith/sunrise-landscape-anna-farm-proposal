# Anna's Farm 3D Editor — Implementation Plan

This plan maps every feature from `scene_3d/FEATURES.md` to the agent team, skills, and workflow that will implement it.

## Agent Team Roster

| Agent | Role | Model |
|---|---|---|
| `feature-orchestrator` | Project lead — branches, delegation, merge coordination | opus |
| `threejs-geometry-engineer` | Procedural geometry, materials, BufferGeometry, camera paths | opus |
| `editor-ui-engineer` | HTML/CSS panels, DOM events, paint system, IndexedDB, undo/redo | opus |
| `lighting-engineer` | Lights, sky, fog, weather, time-of-day, shadows | opus |
| `osm-integration-engineer` | OSM tiles, GPS alignment, building footprints | opus |
| `scene-qa` | Visual QA checklist, convention enforcement | opus |
| `compliance-gate` | Rule enforcement (no-optional, security, design-language, threejs) | sonnet |

## Skills Used by Feature

| Skill | Used by | Purpose |
|---|---|---|
| `threejs-webgl` | geometry-engineer, lighting-engineer | Three.js API ref, materials, optimization |
| `threejs-fundamentals` | geometry-engineer, lighting-engineer | Scene setup, Object3D, coordinates |
| `improve-codebase-architecture` | editor-ui-engineer | Refactoring when editor-pbr.html grows large |
| `grill-me` | feature-orchestrator | Stress-test feature specs before implementation |
| `tdd` | scene-qa | Test-driven approach for testable features |
| `debug-agent` | any specialist | Runtime debugging with NDJSON logs |
| `git-guardrails-claude-code` | all agents | Block dangerous git operations |
| `prd-to-plan` | feature-orchestrator | Break complex features into phases |
| `triage-issue` | scene-qa | File bugs found during QA |
| `qa` | scene-qa | Interactive QA sessions |
| `write-a-prd` | feature-orchestrator | Detailed PRDs for complex features (F16, F11) |

---

## Phase 1: Core Editor

### F14: Collapsible & Resizable Sidebars
```
Branch: feature/sidebar-layout
Lead agent: editor-ui-engineer
Skills: threejs-webgl (resize handling)
```
**Tasks:**
1. Add collapse chevron buttons to each sidebar edge
2. CSS transitions for collapse animation (320px → 24px)
3. Drag handle between sidebar and viewport (mousedown + mousemove)
4. Clamp resize range: 200px-500px, double-click resets to 320px
5. `renderer.setSize()` and `composer.setSize()` on resize
6. Persist collapse/width state in `localStorage`
7. Keyboard: Ctrl+[ = collapse left, Ctrl+] = collapse right
8. Reorganize: left panel = scene tools, right panel = config

**QA gate:** scene-qa → compliance-gate → merge

---

### F2: Strip Stone Rename + New Shape
```
Branch: feature/strip-stone
Lead agent: threejs-geometry-engineer
Support: editor-ui-engineer (button label)
Skills: threejs-webgl (BufferGeometry)
```
**Tasks:**
1. Rename all `post` references → `stripStone` / `strip stone`
   - `BUILDERS.post` → `BUILDERS.stripStone`
   - `TYPE_ALIASES`: add strip, stripstone, strips, strip stone
   - `familyOf()`: match `stripstone` and `strip`
   - `familyToMatKey()`: return rocky normal map instead of wood
   - UI button: `+ Strip stone`
2. Replace cylinder geometry with thin box (0.71m tall, 0.15m thick, 0.2-0.35m wide)
3. Add vertex jitter for rough-cut look
4. Random lean: 2-4 degrees off vertical
5. Material: warm brown (#7a5232), rocky normal map, roughness 0.88
6. Update save/load JSON compatibility (recognize old "post" family on load)

**QA gate:** scene-qa → compliance-gate → merge

---

### F1: Flagstone Slab Shape Variations
```
Branch: feature/slab-shapes
Lead agent: threejs-geometry-engineer
Support: editor-ui-engineer (shape controls in panel)
Skills: threejs-webgl (BufferGeometry, vertex manipulation)
```
**Tasks:**
1. **Sloped tops**: After box generation, offset top-row vertices asymmetrically (2-8 degree tilt left or right, randomized)
2. **Pointed tops (5-sided)**: For ~35% of slabs, push center top vertex upward to create pentagonal profile. Custom BufferGeometry with 5 profile points extruded to thickness.
3. **Dimension ranges**: Height 0.3-1.4m, Width 0.18-0.6m, Thickness 0.05-0.13m (real-world scale)
4. **UI**: Shape segment control (Flat/Sloped/Pointed/Random) in Add Object section
5. **UI**: Min/max dimension sliders for spawn parameters
6. Scale jitter proportional to slab size (small slabs get less distortion)

**QA gate:** scene-qa → compliance-gate → merge

---

### F17: Per-Object Mesh Manipulation
```
Branch: feature/mesh-manipulation
Lead agent: threejs-geometry-engineer
Support: editor-ui-engineer (right panel sliders)
Skills: threejs-webgl (BufferGeometry regeneration)
```
**Tasks:**
1. Right panel: Height/Width/Thickness sliders (real units) when slab or strip stone is selected
2. Shape dropdown: Flat/Sloped left/Sloped right/Pointed (regenerates geometry in-place)
3. Slope angle slider (2-15 degrees)
4. Point height slider
5. Irregularity slider (jitter amount)
6. Store shape params in `userData`, restore on save/load
7. Geometry regeneration preserves position/rotation/scale

**QA gate:** scene-qa → compliance-gate → merge

---

### F3: Target Placement System
```
Branch: feature/target-placement
Lead agent: editor-ui-engineer
Support: threejs-geometry-engineer (target marker mesh)
Skills: threejs-webgl (raycasting)
```
**Tasks:**
1. Toolbar button: `Target (T)` — toggles target mode
2. Ground click places a RingGeometry marker at y=0.01, accent color, dashed
3. HUD shows `Target: (x, z)` when active
4. All `spawnAt()` calls check for active target, offset 0.3-0.8m random from target
5. Re-click ground in target mode moves the marker
6. T again (or Escape) clears target, returns to random placement
7. Target position saved/loaded with project JSON

**QA gate:** scene-qa → compliance-gate → merge

---

## Phase 2: Lighting & Atmosphere

### F4: Up Lights
```
Branch: feature/up-lights
Lead agent: lighting-engineer
Support: editor-ui-engineer (right panel controls), threejs-geometry-engineer (housing mesh)
Skills: threejs-webgl (SpotLight, shadows), threejs-fundamentals (light types)
```
**Tasks:**
1. `buildUpLight()`: small disc housing (3" diameter) + SpotLight pointing up
2. Light: warm 2700K, 45-60deg cone, penumbra 0.7, distance 5m, intensity 1.5
3. Shadow: enabled, 512x512 map (smaller than sun for performance)
4. Register in `BUILDERS.uplight`, `TYPE_ALIASES`, `familyOf()`
5. Right panel when selected: intensity, color picker, angle, distance sliders
6. Button: `+ Up light` in left panel
7. Prompt aliases: uplight, light, spot
8. Performance: warn if >8 shadow-casting up lights

**QA gate:** scene-qa → compliance-gate → merge

---

### F5: Bollard Lights
```
Branch: feature/bollard-lights
Lead agent: lighting-engineer
Support: editor-ui-engineer (controls), threejs-geometry-engineer (post + head mesh)
Skills: threejs-webgl (PointLight)
```
**Tasks:**
1. `buildBollard()`: thin cylinder post (2" dia) + cap head (3-4" dia) + PointLight
2. Height: 0.45-0.6m randomized
3. Light: 3000K, distance 3.5m, intensity 0.8, no shadows by default
4. Dark bronze material for post/head
5. Register in BUILDERS, TYPE_ALIASES, familyOf
6. Right panel: intensity, color, height sliders
7. Prompt aliases: bollard, pathway light, path light

**QA gate:** scene-qa → compliance-gate → merge

---

### F15: Advanced Atmosphere & Weather
```
Branch: feature/atmosphere-weather
Lead agent: lighting-engineer
Support: editor-ui-engineer (controls panel)
Skills: threejs-webgl (particle systems, shaders)
```
**Tasks:**
1. **Fog controls**: density slider, color picker, type toggle (linear/exponential)
2. **Ground fog**: semi-transparent animated plane at y=0.3, opacity pulsing
3. **Rain**: instanced particle system (max 3000), splash on ground
4. **Snow**: slower particles, drift, optional accumulation
5. **Wind**: direction + speed affects particle trajectories
6. **Cloud cover** slider: dims sun, desaturates sky, increases ambient
7. **Time presets**: Dawn/Morning/Noon/Golden Hour/Sunset/Dusk/Night buttons
8. **Night mode**: sun below horizon, cool moonlight, stars (sphere with point material), lights become primary

**QA gate:** scene-qa → compliance-gate → merge

---

## Phase 3: Project Infrastructure

### F11: Project Management
```
Branch: feature/project-management
Lead agent: editor-ui-engineer
Support: threejs-geometry-engineer (serialization)
Skills: write-a-prd (detailed spec), prd-to-plan (phased breakdown)
```
**Tasks:**
1. IndexedDB wrapper: `openProject()`, `saveProject()`, `listProjects()`, `deleteProject()`
2. Project data model: scene objects, paint layer, camera bookmarks, lighting config, atmosphere, target, custom assets
3. **New project**: dialog with name input, template selector (blank / Site 1 / Site 2), confirmation if unsaved
4. **Save**: auto-save debounced 2s + manual button, stores with timestamp + thumbnail
5. **Open**: dialog listing projects with name, date, thumbnail preview
6. **Export**: bundle as `.anna` zip (JSON + paint PNG)
7. **Import**: load `.anna` or legacy JSON
8. Two site templates ship with base objects at real-world positions

**QA gate:** scene-qa → compliance-gate → merge

---

### F9: Undo/Redo
```
Branch: feature/undo-redo
Lead agent: editor-ui-engineer
Skills: improve-codebase-architecture (command pattern design)
```
**Tasks:**
1. Command interface: `{ execute(), undo(), description }`
2. Command types: AddObject, DeleteObject, TransformChange, MaterialChange
3. Command stack: 50 deep, Ctrl+Z undo, Ctrl+Shift+Z redo
4. Paint undo remains separate (canvas-based)
5. HUD indicator: "Undo: <last action description>"

**QA gate:** scene-qa → compliance-gate → merge

---

### F12: Asset Management
```
Branch: feature/asset-manager
Lead agent: editor-ui-engineer
Support: threejs-geometry-engineer (GLTFLoader for custom models)
Skills: threejs-webgl (model loading)
```
**Tasks:**
1. Asset library panel in left sidebar: Built-in tab + Custom tab
2. Upload button: accepts .glb/.gltf/.obj
3. On upload: generate thumbnail, store in IndexedDB, add to library
4. User names + categorizes each asset
5. Click to spawn (at target if set)
6. Asset metadata: name, category, thumbnail, default scale, bounding box
7. Export/import asset packs

**QA gate:** scene-qa → compliance-gate → merge

---

## Phase 4: Presentation & Real-World Context

### F10: Camera System + Path Animation
```
Branch: feature/camera-system
Lead agent: threejs-geometry-engineer
Support: editor-ui-engineer (transport controls, bookmark list)
Skills: threejs-webgl (CatmullRomCurve3, animation), threejs-fundamentals (cameras)
```
**Tasks:**
1. **Bookmarks**: Save/recall camera position+target+FOV, persist in JSON
2. **Bookmark list**: right panel, click to animate, 1-9 hotkeys
3. **Path drawing**: paint-mode-like interaction that creates a CatmullRomCurve3
4. **Path follow**: camera rides the spline, configurable speed + height offset
5. **Look-at target**: scene center or second drawn path
6. **Transport**: Play/Pause/Scrub controls in toolbar
7. **Export video**: MediaRecorder → webm from canvas

**QA gate:** scene-qa → compliance-gate → merge

---

### F16: OpenStreetMap Integration
```
Branch: feature/osm-integration
Lead agent: osm-integration-engineer
Support: editor-ui-engineer (site picker), threejs-geometry-engineer (tile plane)
Skills: threejs-webgl (texture loading), write-a-prd (detailed spec for GPS alignment)
```
**Tasks:**
1. Site location picker: GPS input or address search
2. Fetch OSM raster tiles (z18-19) for ~200m x 200m area
3. Cache tiles in IndexedDB
4. Render as ground plane texture below scene
5. GPS ↔ scene coordinate conversion
6. North arrow + scale indicator overlay
7. OSM attribution
8. Two pre-configured Lafayette, CO site locations
9. Stretch: fetch OSM building footprints, extrude as block volumes

**QA gate:** scene-qa → compliance-gate → merge

---

### F13: Custom Brushes + Architectural Drawing
```
Branch: feature/paint-custom-brushes
Lead agent: editor-ui-engineer
Skills: threejs-webgl (CanvasTexture updates)
```
**Tasks:**
1. **Upload brush**: PNG/JPG → brush stamp (grayscale → alpha)
2. **Texture stamp mode**: tile an uploaded texture image at brush location
3. **Line tool**: click-click straight lines on ground
4. **Measurement overlay**: distances in feet/meters along lines
5. **Path tool**: click waypoints, spline interpolation
6. **Export**: DXF/SVG of paint layer + drawn lines (2D plan view)

**QA gate:** scene-qa → compliance-gate → merge

---

## Phase 5: Polish

### F7: Per-Object Material Editor
```
Branch: feature/material-editor
Lead agent: threejs-geometry-engineer
Support: editor-ui-engineer (right panel controls)
Skills: threejs-webgl (materials guide)
```
**Tasks:**
1. Collapsible "Material" section in right panel when object selected
2. Color picker, roughness slider, metalness slider
3. Normal map intensity slider
4. Texture dropdown (rocky/smooth/pebbles/wood/gravel)
5. Texture scale X/Y sliders
6. Store overrides in `userData`, persist through save/load

**QA gate:** scene-qa → compliance-gate → merge

---

### F8: Snapping & Alignment
```
Branch: feature/snap-align
Lead agent: editor-ui-engineer
Support: threejs-geometry-engineer (transform snapping)
Skills: threejs-webgl (TransformControls snapping)
```
**Tasks:**
1. Grid snap toggle (G): translationSnap = 0.25
2. Rotation snap (hold Shift): rotationSnap = 15 degrees
3. Align buttons: align to ground, align to neighbor, distribute evenly
4. Duplicate along line: select object → define direction + count → spawn copies

**QA gate:** scene-qa → compliance-gate → merge

---

## Workflow Per Feature

```
1. feature-orchestrator reads FEATURES.md spec
2. feature-orchestrator creates branch: git checkout -b feature/<slug>
3. feature-orchestrator delegates to lead agent (+ support agents if needed)
4. Lead agent implements, using attached skills for reference
5. feature-orchestrator hands off to scene-qa
6. scene-qa runs full checklist, reports PASS or BLOCK
7. If BLOCK: fix requests go back to lead agent, repeat from step 4
8. If PASS: compliance-gate runs final rule scan
9. If compliance PASS: feature-orchestrator reports ready for merge
10. Jero reviews and approves merge to main
```

## Parallel Execution Opportunities

Features within the same phase can run in parallel on separate branches when they don't touch the same code sections:

- **Phase 1**: F14 (sidebars/CSS) can run parallel with F2 (strip stone/JS geometry)
- **Phase 2**: F4 (up lights) + F5 (bollards) can run parallel (different builders, same pattern)
- **Phase 3**: F9 (undo/redo) can run parallel with F12 (asset manager)
- **Phase 4**: F16 (OSM) can run parallel with F13 (custom brushes)
