# Anna's Farm 3D Editor — Feature Plan

Each feature gets its own branch (`feature/<slug>`) and is merged into `main` after review.

---

## F1: Flagstone Slab Shape Variations

**Branch:** `feature/slab-shapes`

**Current state:** `buildStone()` generates a simple tapered box with minor jitter. All slabs are rectangular (4-sided) with a flat top edge.

**What changes:**

### Top-edge slope
Each slab randomly receives a slight slope on its top edge — tilting left or right by 2-8 degrees. Achieved by offsetting the top-row vertices of the box geometry asymmetrically (left side higher, right side lower, or vice versa). The slope direction and degree are randomized per slab.

### 5-sided pointed slabs
A percentage of slabs (roughly 30-40%) spawn with a pointed apex, creating a pentagonal profile instead of rectangular. The point sits at the top center of the slab. Built by adding a center vertex row at the top of the box geometry and pushing the center top vertex upward, or by using a custom `BufferGeometry` with 5 profile points extruded to thickness.

### Dimension variation
Expand the randomization ranges for all three axes:
- **Height:** 1.0 ft to 4.5 ft (currently ~1.4-2.6 arbitrary units — nail down real-world scale)
- **Width:** 0.6 ft to 2.0 ft
- **Thickness:** 2 in to 5 in (these are flat slabs, not blocks)

The existing jitter pass stays but parameters scale with slab size so small slabs don't look over-distorted.

### UI additions
- Shape dropdown or segment control on the "Add object" panel: **Flat top / Sloped top / Pointed top / Random**
- Sliders for min/max height, width, thickness when spawning new slabs

**References:** `CleanShot 2026-04-14 at 17.29.48.jpg`, `CleanShot 2026-04-14 at 17.33.19.jpg`, `CleanShot 2026-04-14 at 17.33.37.jpg` — real Lyons red sandstone flagstone with natural irregular edges, varied profiles, some with pointed tops.

---

## F2: Rename "Post" to "Strip Stone" + New Shape

**Branch:** `feature/strip-stone`

**Current state:** `buildPost()` creates a cylinder (round dowel shape). Named "post" throughout the codebase.

**What changes:**

### Rename
Every reference to `post` becomes `strip stone` (or `stripStone` in camelCase):
- `BUILDERS.post` → `BUILDERS.stripStone`
- `TYPE_ALIASES` entries
- `familyOf()` matching
- UI button label: `+ Strip stone`
- Prompt parser aliases: `strip`, `stripstone`, `strip stone`, `strips`

### New geometry
Replace the cylinder with a thin upright slab shape matching the concept renders. The strip stones are the shorter, thinner vertical stone pieces arranged in groups (visible in the foreground of `iso2.webp`).

**Dimensions:**
- **Height:** 28 inches (~0.71 m) — fixed default, randomized +/- 3 inches
- **Width:** 8-14 inches — randomized per piece
- **Thickness:** 6 inches (~0.15 m) — fixed default, randomized +/- 1 inch

**Geometry:** Thin box with vertex jitter for a rough-cut stone look. Slight random lean (2-4 degrees off vertical). Top edge gets the same slope/point variation system from F1 at a smaller scale.

**Material:** Reuse the existing `post` material (warm brown sandstone PBR) but apply the `rocky` normal map instead of `wood` to match the stone texture.

---

## F3: Target Placement System

**Branch:** `feature/target-placement`

**Current state:** New objects spawn at random positions or near an anchor parsed from the prompt. No persistent placement target.

**What changes:**

### Target marker
A visible marker (crosshair/ring on the ground plane) that the user places with a click. The marker persists until removed or moved.

### Workflow
1. User clicks **Target** button in the toolbar (or presses **T**)
2. Next click on the ground places the target marker at that world position
3. The target marker renders as a glowing ring or crosshair at ground level
4. All subsequent object insertions (button clicks, prompt commands) spawn at the target position instead of random
5. Objects still get a small random offset (0.3-0.8m radius) from the target so they don't stack exactly
6. Clicking **Target** again enters re-aim mode; clicking the ground moves it
7. **Clear target** button (or pressing **T** again while target exists) removes it and returns to random placement

### UI
- Toolbar button: `Target (T)` — toggles target mode
- HUD indicator when target is active: `Target: (x, z)` coordinates
- Target marker: Three.js `RingGeometry` + dashed circle, colored with `--accent`, sits at y=0.01

---

## F4: Lighting System — Up Lights

**Branch:** `feature/up-lights`

**Current state:** Scene has a single directional sun, hemisphere light, and sky-derived environment map. No placeable point/spot lights.

**What changes:**

### Up light object
A small ground-recessed spotlight that casts light upward onto nearby slabs. Matches the warm glow visible in the concept renders (`iso1.webp`, `iso2.webp`) illuminating the flagstone slabs from below.

**Geometry:** Small disc or cylinder flush with the ground (2-3 inch diameter housing). Mostly invisible — the light effect is what matters.

**Light:** `THREE.SpotLight` pointing straight up (or slightly angled), with:
- Warm color temperature: ~2700K (`#ffb347` to `#ffd699`)
- Angle: 45-60 degrees cone
- Penumbra: 0.6-0.8 (soft falloff)
- Distance: 4-6 meters
- Intensity: adjustable via right panel, default 1.5
- Cast shadows: yes (for dramatic slab shadows)

### Builder
`buildUpLight()` creates a group containing the housing mesh + the SpotLight. Registered as family `uplight`.

### UI additions
- Left panel "Add object" button: `+ Up light`
- Right panel when selected: intensity slider, color picker, angle slider, distance slider
- Prompt parser aliases: `uplight`, `up light`, `uplights`, `light`, `spot`
- `TYPE_ALIASES` and `BUILDERS` entries

---

## F5: Lighting System — Pathway Bollard Lights

**Branch:** `feature/bollard-lights`

**Current state:** No tall standing light fixtures.

**What changes:**

### Bollard light object
A short standing light fixture, 18 inches to 2 feet tall (~0.45-0.6 m). Designed as a subtle landscape/pathway light.

**Geometry:**
- **Post:** Thin cylinder or square column, ~2 inch diameter, dark bronze/black material
- **Head:** Small cap or downward-facing shade at the top, 3-4 inch diameter
- **Light source:** `THREE.PointLight` positioned at the head, casting warm light downward and outward

**Light properties:**
- Warm color: ~3000K (`#ffc87c`)
- Distance: 3-4 meters
- Intensity: adjustable, default 0.8
- Cast shadows: optional (performance consideration with many bollards)

**Dimension randomization:**
- Height: 18 in to 24 in (0.45-0.6 m)

### Builder
`buildBollard()` creates the post mesh + head mesh + PointLight. Registered as family `bollard`.

### UI additions
- Left panel button: `+ Bollard light`
- Right panel when selected: intensity, color, height sliders
- Prompt aliases: `bollard`, `bollards`, `pathway light`, `path light`

---

## F6: Ground Paint System

**Branch:** `feature/ground-paint`

**Status: IMPLEMENTED** (current session)

Paint directly on the ground plane with configurable color, brush size, opacity, hardness, and 8 brush textures (solid, spray, grass, gravel, noise, scatter, stipple, chalk). Includes eraser, undo, clear, and PNG export.

---

## F7: Per-Object Material Editor

**Branch:** `feature/material-editor`

**Current state:** Materials are auto-assigned by family. No way to tweak an individual object's color, roughness, or texture.

**What changes:**

When an object is selected, the right panel shows a collapsible "Material" section:
- **Color** picker — overrides the base color
- **Roughness** slider (0-1)
- **Metalness** slider (0-1)
- **Normal map intensity** slider
- **Texture** dropdown — switch between the existing procedural textures (rocky, smooth, pebbles, wood, gravel)
- **Texture scale** X/Y sliders

Changes apply to all meshes within the selected group. Stored in `userData` so they persist through save/load.

---

## F8: Snapping & Alignment Tools

**Branch:** `feature/snap-align`

**Current state:** Objects free-float. No grid or object snapping.

**What changes:**
- **Grid snap toggle** (G key) — snaps translate moves to 0.25m increments
- **Rotation snap** — 15-degree increments when holding Shift
- **Align selected** buttons: align to ground (already exists as "Drop to ground"), align to neighbor, distribute evenly
- **Duplicate along line** — select an object, define a direction + count, spawn copies spaced evenly

---

## F9: Undo/Redo System (Scene Level)

**Branch:** `feature/undo-redo`

**Current state:** No undo for scene operations (add, delete, move, rotate, scale). Paint has its own undo stack.

**What changes:**
- Command stack recording all scene mutations
- **Ctrl+Z** undoes the last operation (object add/delete/transform change)
- **Ctrl+Shift+Z** redoes
- Stack depth: 50 operations
- Paint undo remains separate (it operates on a canvas, not the scene graph)

---

## F10: Camera Views, Bookmarks & Path Animation

**Branch:** `feature/camera-system`

**Current state:** One "Reset view" button. No way to save/recall camera angles or animate.

**What changes:**

### Camera bookmarks
- **Save view** button — stores current camera position + target + FOV as a named bookmark
- **Bookmark list** in the right panel — click to animate camera to that view
- **1-9 keys** — quick-recall for the first 9 bookmarks
- Bookmarks persist in the save/load JSON

### Camera path animation (presentation mode)
- **Draw path** — user draws a curve on the ground plane (similar to paint mode but creates a spline)
- The camera follows the path at a configurable speed, looking at a configurable target (scene center, or a second drawn "look-at" path)
- **Play / Pause / Scrub** transport controls
- Adjustable camera height offset above the path (e.g., eye-level at 5.5 ft for a walk-through, or 3 ft for a car drive-by)
- **Export video** — render frames to a sequence or use `MediaRecorder` to capture a webm/mp4 directly from the canvas
- Enables "what does this look like arriving from the street" drive-by visualization

---

## F11: Project Management (New / Save / Open)

**Branch:** `feature/project-management`

**Current state:** Save/Load exports a single JSON layout file via download/upload. No concept of named projects or persistence.

**What changes:**

### Hosting
The editor is hosted as a static web app (Vercel, Netlify, or similar). All project data lives in the browser's IndexedDB.

### New project
- **New project** button — prompts for a project name, clears the scene, starts fresh
- Confirmation dialog if unsaved changes exist

### Save project
- Auto-saves to IndexedDB on every meaningful change (debounced, ~2 seconds after last edit)
- Manual **Save** button writes current state with timestamp
- Project data includes: scene objects + transforms, paint layer, camera bookmarks, camera paths, lighting config, atmosphere settings, target position, custom assets

### Open project
- **Open project** dialog lists all saved projects from IndexedDB with name, last-modified date, thumbnail preview
- Click to load — fully restores scene state
- **Import JSON** still available as a fallback for files from other machines
- **Export project** bundles everything into a single downloadable `.anna` file (zip containing JSON + paint PNG + custom asset references)

### Pre-made project templates
- Two starter templates ship with the app, one for each site location
- Templates include the base scene objects positioned at their real-world locations
- Selecting a template on "New project" loads the corresponding GLB + layout

---

## F12: Asset Management — Custom Objects

**Branch:** `feature/asset-manager`

**Current state:** Only 6 hard-coded object types (stone, boulder, post, cobble, tree, sign) built procedurally. No way to import external models.

**What changes:**

### Asset library panel
A new section in the left panel: **Asset Library**. Contains two tabs:
- **Built-in** — the existing procedural objects (stone slab, strip stone, boulder, cobble, tree, sign, up light, bollard)
- **Custom** — user-uploaded assets

### Import custom objects
- **Upload** button accepts `.glb` / `.gltf` / `.obj` files
- On upload: preview thumbnail is generated, asset is stored in IndexedDB, added to the library
- User gives it a name and optional family/category tag
- Uploaded assets appear as draggable items in the Custom tab
- Click to spawn in scene (at target if set, otherwise random position)

### Asset metadata
Each custom asset stores:
- Name, category, thumbnail
- Default scale (user can set after first import)
- Default material override (optional — can apply PBR materials from the built-in library)
- Bounding box for ground placement

### Asset sharing
- **Export asset pack** — bundles selected custom assets into a downloadable file
- **Import asset pack** — loads assets from another user

---

## F13: Enhanced Ground Paint — Custom Brushes & Image Textures

**Branch:** `feature/paint-custom-brushes`

**Current state (F6):** 8 procedural brush textures, color picker, size/opacity/hardness sliders. Functional but all brushes are code-generated.

**What changes:**

### Image-based custom brushes
- **Upload brush** button — accepts a PNG/JPG image as a brush stamp
- The uploaded image is used as the brush alpha/shape (grayscale → opacity)
- Stored in IndexedDB alongside the project
- Appears in the brush texture grid alongside the built-in textures

### Texture stamp mode
- **Stamp texture** toggle — instead of painting a solid color, stamps a tiled texture pattern onto the ground
- User uploads a texture image (e.g., a photo of gravel, grass, pavers)
- Painting with a texture brush tiles/blends the texture image into the paint layer at the brush location
- Useful for charting out material zones (gravel here, cobble there, grass there)

### 2D architectural drawing mode
- **Line tool** — draw straight lines on the ground (click start → click end)
- **Measurement overlay** — shows distances in feet/meters along drawn lines
- **Path tool** — draw smooth curves (click waypoints, spline interpolation)
- **Export to DXF/SVG** — export the paint layer and drawn lines as a 2D plan view for CAD import

---

## F14: Collapsible & Resizable Sidebars

**Branch:** `feature/sidebar-layout`

**Current state:** Both sidebars are fixed at 320px. Cannot be hidden or resized.

**What changes:**

### Collapse
- Each sidebar gets a collapse toggle button (chevron arrow at the panel edge)
- Collapsed state hides the panel content, shows only a thin 24px strip with the expand button
- Keyboard shortcut: **Ctrl+[** collapses left, **Ctrl+]** collapses right
- Collapse state persists across sessions (localStorage)

### Resize
- A drag handle between each sidebar and the viewport
- Drag to resize from 200px to 500px
- Double-click the drag handle to reset to default 320px
- Viewport canvas re-renders at the new available size

### Panel organization
- **Left panel** = Scene building tools: add objects, asset library, ground paint, target, atmosphere
- **Right panel** = Selection & configuration: selected object properties, transforms, material editor, camera bookmarks, project save/load

---

## F15: Advanced Atmosphere & Weather

**Branch:** `feature/atmosphere-weather`

**Current state:** Sun time-of-day slider, sun strength, environment intensity, exposure. Basic fog. No weather.

**What changes:**

### Expanded fog controls
- **Fog density** slider (currently fixed near/far values)
- **Fog color** picker (currently auto-derived from sun position)
- **Fog type** toggle: linear fog vs. exponential fog
- **Ground fog** — a low-hanging fog plane that only affects the lower portion of the scene (volumetric-ish effect via a semi-transparent animated plane)

### Weather effects
- **Rain** — particle system with falling droplets, splashes on ground, wet material boost (lower roughness temporarily)
- **Snow** — particle system with slower, drifting flakes, optional ground accumulation (white paint layer blend)
- **Wind** — affects rain/snow particle direction, optionally sways tree canopy meshes
- **Cloud cover** slider — dims sun intensity, desaturates sky, increases ambient

### Time presets
- Quick-select buttons: Dawn, Morning, Noon, Golden Hour, Sunset, Dusk, Night
- **Night mode** — drops sun below horizon, switches to moonlight (cool blue directional), stars in sky, up-lights and bollards become the primary illumination

---

## F16: OpenStreetMap Integration — Real-World Grounding

**Branch:** `feature/osm-integration`

**Current state:** Scene exists in abstract 3D space with no geographic context.

**What changes:**

### Site location picker
- On project creation (or via settings), user specifies the GPS coordinates or searches an address
- The editor fetches OpenStreetMap tiles for the surrounding area
- Map tiles render as the ground plane texture, replacing or layering beneath the existing ground material

### Tile download & caching
- Uses OSM raster tile API (z/x/y) at zoom level 18-20 for detail
- Tiles cached in IndexedDB so the editor works offline after first load
- Coverage area: ~200m x 200m around the site center (enough for neighborhood context)

### Scene alignment
- The scene's (0,0,0) maps to the project's GPS center
- A scale indicator shows real-world distances
- North arrow overlay in the viewport
- Objects placed in the scene correspond to actual lat/lng positions

### Site context
- Roads, sidewalks, and neighboring parcels visible on the ground tiles
- Optional: fetch OSM building footprints and render as simple extruded block volumes for surrounding structures
- Shows what the installation looks like in context — approaching from the street, from the neighborhood

### Two project sites
- Two pre-configured site locations ship with the app for Anna's Farm
- Each has its own tile set, starting camera position, and base scene objects placed at surveyed real-world coordinates
- Switching between sites reloads the appropriate tile set and base scene

---

## F17: Per-Object Mesh Manipulation

**Branch:** `feature/mesh-manipulation`

**Current state:** Objects can be moved/rotated/scaled as a whole via the transform gizmo. No vertex-level editing. Individual dimension control (height/width/thickness) only happens at spawn time via random ranges.

**What changes:**

### Dimension sliders (non-destructive)
When a flagstone slab or strip stone is selected, the right panel shows:
- **Height** slider — stretches the object on its local Y axis
- **Width** slider — stretches on local X axis
- **Thickness** slider — stretches on local Z axis
- These are independent axis scales presented in real-world units (inches/feet) rather than raw scale factors
- Values stored in `userData` and restored on load

### Shape controls (flagstone-specific)
- **Top edge** dropdown: Flat / Sloped left / Sloped right / Pointed (regenerates the geometry)
- **Slope angle** slider (when sloped): 2-15 degrees
- **Point height** slider (when pointed): how far the apex extends above the base width
- **Irregularity** slider: controls the jitter/roughness amount on the slab edges
- Changing these regenerates the mesh geometry in-place, preserving position/rotation

### Texture per object
- Covered in F7 (material editor), but linked here: each object's material can be independently tweaked after placement

---

## Implementation Order (suggested)

### Phase 1 — Core Editor (ship a usable tool)
| Priority | Feature | Rationale |
|----------|---------|-----------|
| 1 | F14: Collapsible sidebars | Layout foundation — everything else builds on this |
| 2 | F2: Strip stone rename + shape | Quick win, fixes naming, small scope |
| 3 | F1: Slab shape variations | Core visual improvement to the hero objects |
| 4 | F17: Per-object mesh manipulation | Makes F1/F2 actually editable after placement |
| 5 | F3: Target placement | Workflow improvement for faster object placement |
| -- | F6: Ground paint | Already done |

### Phase 2 — Lighting & Atmosphere
| Priority | Feature | Rationale |
|----------|---------|-----------|
| 6 | F4: Up lights | Biggest visual impact — matches concept renders |
| 7 | F5: Bollard lights | Completes the lighting story |
| 8 | F15: Atmosphere & weather | Presentation polish, night mode makes lights shine |

### Phase 3 — Project Infrastructure
| Priority | Feature | Rationale |
|----------|---------|-----------|
| 9 | F11: Project management | Save/open/new — required before hosting |
| 10 | F9: Undo/redo | Safety net now that there's real data to lose |
| 11 | F12: Asset management | Extensibility — custom objects |

### Phase 4 — Presentation & Real-World Context
| Priority | Feature | Rationale |
|----------|---------|-----------|
| 12 | F10: Camera system + path animation | Drive-by visualization, client presentations |
| 13 | F16: OpenStreetMap integration | Ground truth — see the site in real geography |
| 14 | F13: Custom brushes + architectural drawing | 2D planning layer with CAD export |

### Phase 5 — Polish
| Priority | Feature | Rationale |
|----------|---------|-----------|
| 15 | F7: Material editor | Fine-tuning individual pieces |
| 16 | F8: Snapping & alignment | Precision layout tools |
