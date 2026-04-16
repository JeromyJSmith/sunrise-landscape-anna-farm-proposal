# Anna's Farm — HANDOFF log

Append-only. Most recent entry at top.

---

## 2026-04-11 — Session 3 — location correction + perimeter-view extraction

**Owner:** Claude Code (CLI)

**Owner message unblocked the location mystery.** Coordinates provided: Site 1 at 40.000458°N / -105.110036°W (3,500 ft², 230 ft perimeter), Site 2 at 40.001489°N / -105.109675°W (1,567 ft² current, 1,500 ft² target, 194 ft perimeter), ~5,350–5,360 ft elevation. **Anna's Farm is in Lafayette, Colorado** — not Phoenix AZ. My Session 1 research was wrong.

**Done this session:**
- **Extracted 14 perimeter views** from `projects.annas_farm_frames` via CLIP text-similarity against 6 aerial/polygon queries. Fixed a snag: the initial embedding index was image-only, so I rebuilt it with `string_embed` + `image_embed`.
- **Tool:** `tools/extract_perimeter_views.py` — generic, reusable for any ingested video in any PROJECTS project.
- **Content-confirmed site mapping** from the exported frames:
  - **Site 1** = `perimeter_04_t01m37.png` — 3D oblique, area "3,500 ft²", perimeter "230 ft", Primrose School of Lafayette in background — exact match.
  - **Site 2** = `perimeter_02_t17m22.png` — 3D oblique, area "1,577 ft²", perimeter "195 ft" — closest to current reducing-edit state.
  - Plus `perimeter_07_t15m20.png` top-down with **"Primrose School of Lafayette"** and **"Highgate Lane"** labels visible — landmark confirmation.
- **Organized frames** into `reference/from_video/{site1,site2}/` with 3 frames per site (hero + alt + context). Contact sheet at `reference/from_video/perimeter_views/contact_sheet.html`.
- **Rewrote `brief.json` location block** — Lafayette CO, Boulder County, centroid lat/lon per site, elevation, landmarks, Boulder County GIS sources. Added `polygon_edit_session` block linking to hero frames.
- **Fixed site shape data** — NOT 60×60 / 60×30 rectangles (my Session 1 assumption). They're irregular polygons. Site 1 area corrected to 3,500 ft² (quote was right). Site 2 billed against 1,500 ft² target.
- **Style direction pivoted** — Sonoran desert xeriscape → **Colorado Front Range high-plains xeriscape**. Material swap: Arizona sandstone → Lyons sandstone, mesquite/palo verde → cottonwoods/blue spruces/scrub oak, Flatirons backdrop added.
- **Bulk-rewrote all 8 Nano Banana prompts + 2 Veo 3 prompts** via `tools/relocate_prompts_to_colorado.py`. Two passes. Audit confirms only intentional `quality.avoid` keywords ("Sonoran desert", "saguaro cactus", "agave", "palm trees") remain.
- **Rewrote `research/location-gis.md`** — Boulder County GIS sources, Colorado Front Range climate/style implications, Session 1 correction.
- **Updated `OWNER_QUESTIONS.md`** — removed the address question, added billable-area Site 2 confirmation, swapped AZ tax for CO tax.

**Remaining open questions (see OWNER_QUESTIONS.md):**
- Street mailing address for proposal header
- Client identity block
- Contractor identity block
- Confirm Site 2 = 1,500 ft² billing
- CO tax rate
- Deposit / valid-until / deposit terms
- Upsells to add
- Pascal editor confirmation
- Claw3D viewer target
- Reasoning-engine critique-loop iterations

**Next (Desktop Claude):**
- Build the proposal PDF with the corrected brief.json.
- Optionally pull Boulder County GIS (`py3dep` DEM, OSM via osmnx, NAIP aerial) into `geo/`.
- Run the Nano Banana prompts to generate the 8 mockups.
- Run the Veo 3 prompts for the 2 walkthroughs.

---

## 2026-04-11 — Session 2 — video ingestion + desktop handoff

**Owner:** Claude Code (CLI) → handing off to Claude Desktop

**Done this session:**
- Ingested the 1.0 GB site walkthrough video from `~/Desktop/CleanShot 2026-04-11 at 16.09.22.mp4` into Pixeltable.
- Created `projects/` directory, `projects.annas_farm` table, `projects.annas_farm_frames` view (1 fps) and `projects.annas_farm_keyframes` view, with CLIP embedding index on `frame` for angle similarity search.
- Ingestion script at `tools/ingest_annas_farm_video.py`.
- Wrote `DESKTOP_HANDOFF.md` with all paths, current state, line-item summary, and next-action list for the desktop session.

**Status at handoff:**
- Ingestion **COMPLETE**. Stats:
  - `projects.annas_farm` — 1 row
  - `projects.annas_farm_frames` — 1,186 rows (1 fps, ~19.7 minutes of video)
  - `projects.annas_farm_keyframes` — 1,663 rows
  - CLIP `openai/clip-vit-base-patch32` embedding index built on `frame` column — angle similarity search is live.

**Next (Desktop Claude):**
- Build the proposal PDF. See `DESKTOP_HANDOFF.md` → "Next actions."

---

## 2026-04-11 — Session 1 — intake + system scaffold

**Owner:** Claude (this session)

**Done:**
- `PROJECTS/` added to `.gitignore`; `PROJECTS/README.md` written.
- `PROJECTS/annas-farm/brief.json` pre-filled from voice transcript: two sites, full line-item breakdown, style direction, open questions.
- `PROJECTS/annas-farm/README.md` quick-reference written.
- Four parallel research agents launched in background:
  1. Nano Banana (Gemini 2.5 Flash Image) JSON prompting best practices.
  2. Veo 3 JSON prompting + audio/camera vocabulary.
  3. Anna's Farm location lookup + Maricopa County GIS sources + geo-pull tooling.
  4. Open-source landscape proposal / mockup / Houdini / Pascal-editor repos.
- Subdirs created: `research/`, `geo/`, `reference/`, `prompts/{nano-banana,veo3}/`, `renders/`, `houdini/`, `proposal/`.
- New project-intake skill scaffolded at `.claude/skills/project-intake/SKILL.md`.
- JSON Schemas drafted at `schemas/nano-banana.schema.json` and `schemas/veo3.schema.json` (once research returns).

**Blocked on owner:**
- Exact address / cross streets for Anna's Farm (blocks GIS pull).
- Client + contractor identity blocks for the proposal header.
- Owner-provided site reference photos (the "screenshots of the components of the project" mentioned in the transcript) — drop into `reference/`.
- Tax rate + deposit terms + valid-until date.

**Next (Session 2, as soon as research agents report back):**
1. Finalize `nano-banana.schema.json` + `veo3.schema.json` from the research.
2. Write 8 Nano Banana JSON prompts (4 shots × 2 sites) into `prompts/nano-banana/`.
3. Write 2 Veo 3 JSON prompts (1 push-in per site) into `prompts/veo3/`.
4. Draft Typst/HTML proposal template at `proposal/template/` driven by `brief.json`.
5. Scaffold `houdini/site-1.hip` and `houdini/site-2.hip` with parametric rock scatter + boulder + flagstone + solar-light instances and GLB export.
6. When address lands, run `geo-recon` → drop aerial / DEM / OSM / street-view into `geo/`.
