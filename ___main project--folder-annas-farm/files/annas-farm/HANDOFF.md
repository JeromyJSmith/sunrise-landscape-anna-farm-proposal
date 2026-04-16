# Anna's Farm — HANDOFF log

Append-only. Most recent entry at top.

---

## 2026-04-11 — Session 2 — video ingestion + desktop handoff

**Owner:** Claude Code (CLI) → handing off to Claude Desktop

**Done this session:**
- Ingested the 1.0 GB site walkthrough video from `~/Desktop/CleanShot 2026-04-11 at 16.09.22.mp4` into Pixeltable.
- Created `projects/` directory, `projects.annas_farm` table, `projects.annas_farm_frames` view (1 fps) and `projects.annas_farm_keyframes` view, with CLIP embedding index on `frame` for angle similarity search.
- Ingestion script at `tools/ingest_annas_farm_video.py`.
- Wrote `DESKTOP_HANDOFF.md` with all paths, current state, line-item summary, and next-action list for the desktop session.

**Status at handoff:**
- Ingestion process (PID 50729) was actively running when the handoff was written. The desktop session should verify completion with `pxt.get_table('projects.annas_farm').count()`.

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
