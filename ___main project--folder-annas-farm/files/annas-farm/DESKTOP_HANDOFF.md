# Anna's Farm — Desktop Claude Handoff

**Date:** 2026-04-11
**Previous session:** Claude Code (CLI) in `/Users/ojeromyo/Desktop/CLAW3D-Houdini-work-order`
**Next session:** Claude Desktop — **build the proposal with line items**

---

## Repo + project paths (copy-paste ready)

| What | Path |
|------|------|
| **Repo root** | `/Users/ojeromyo/Desktop/CLAW3D-Houdini-work-order` |
| **PROJECTS root** (gitignored) | `/Users/ojeromyo/Desktop/CLAW3D-Houdini-work-order/PROJECTS` |
| **Anna's Farm project folder** | `/Users/ojeromyo/Desktop/CLAW3D-Houdini-work-order/PROJECTS/annas-farm` |
| **Brief (source of truth)** | `PROJECTS/annas-farm/brief.json` |
| **Project README** | `PROJECTS/annas-farm/README.md` |
| **Session log (append-only)** | `PROJECTS/annas-farm/HANDOFF.md` |
| **Open questions for owner** | `PROJECTS/annas-farm/OWNER_QUESTIONS.md` |
| **This handoff** | `PROJECTS/annas-farm/DESKTOP_HANDOFF.md` |

### Subfolders inside `PROJECTS/annas-farm/`

| Folder | Contents |
|--------|----------|
| `research/` | 4 research digests: `nano-banana.md`, `veo3.md`, `location-gis.md`, `proposal-toolchain.md` — all cited with URLs |
| `geo/` | Empty — blocked on address confirmation |
| `reference/` | Empty — drop site photos here (`reference/README.md` for naming convention) |
| `prompts/nano-banana/` | **8 JSON mockup prompts** (4 shots × 2 sites) + `README.md` shot list |
| `prompts/veo3/` | **2 JSON walkthrough prompts** (1 per site, 8s first→last-frame cinematic reveal) |
| `renders/` | Empty — will receive Nano Banana PNGs, Veo 3 MP4s, Houdini GLB exports |
| `houdini/` | `site1.cmd`, `site2.cmd`, `README.md` — parametric HScript scenes, Pascal-editor friendly VEX snippets |
| `proposal/template/` | **`proposal.typ`** (Typst template — reads `brief.json` directly) + `README.md` |
| `proposal/` | Output PDF will land here |

### Schemas (at repo root)

| File | Purpose |
|------|---------|
| `schemas/nano-banana.schema.json` | JSON Schema for Nano Banana prompts |
| `schemas/veo3.schema.json` | JSON Schema for Veo 3 prompts |
| `schemas/project-brief.schema.json` | JSON Schema for any `brief.json` in `PROJECTS/` |

### Skills (at repo root)

| Skill | Path |
|-------|------|
| `project-intake` | `.claude/skills/project-intake/SKILL.md` |

### Tools

| Tool | Path |
|------|------|
| Video ingestion script | `tools/ingest_annas_farm_video.py` |
| Source video | `/Users/ojeromyo/Desktop/CleanShot 2026-04-11 at 16.09.22.mp4` (1.0 GB) |

---

## Current state (2026-04-11, 16:40)

### Done
1. **System scaffolded** — `PROJECTS/` gitignored, per-project layout defined, `project-intake` skill written.
2. **Schemas authored** — Nano Banana, Veo 3, and project-brief JSON Schemas, all based on live research from official Google docs and practitioner repos.
3. **4 research digests** with citations — see `research/*.md`.
4. **`brief.json` pre-filled** from the transcript — 2 sites, full line items, $36,850 grand total, style direction, open questions.
5. **8 Nano Banana JSON prompts** — before/after/hero/dusk × site1/site2. Before/after pairs share `consistency_id` and identical `camera` blocks.
6. **2 Veo 3 JSON prompts** — 8-second cinematic before→after walkthroughs with native dual-stream audio (ambient + foley + music, no dialogue).
7. **Typst proposal template** — `proposal/template/proposal.typ` reads `brief.json` directly and renders line items, subtotals, grand total.
8. **Houdini parametric scenes** — `houdini/site1.cmd` and `site2.cmd` build ground, boulder scatter, flagstone groupings, riverbed accent, solar-light instances, GLB export. VEX snippets in attribute wrangles are editable by **pw_Houdini_VEX_Editor** (likely the "Pascal editor") without breaking the scene.
9. **OWNER_QUESTIONS.md** — 12 questions grouped into blocking / clarifying / tool confirmation.

### In progress
- **Video ingestion into Pixeltable** — `tools/ingest_annas_farm_video.py` running at PID 50729. Creates `projects.annas_farm` table, 1 fps frame view, keyframes-only view, CLIP embedding index for angle similarity search. **Will be ready when you open desktop Claude.**
  - Target tables: `projects.annas_farm`, `projects.annas_farm_frames`, `projects.annas_farm_keyframes`.
  - To check status from desktop Claude: `uv run python -c "import pixeltable as pxt; print(pxt.get_table('projects.annas_farm').count(), pxt.get_table('projects.annas_farm_frames').count())"`

### Blocked on owner
- **Exact Anna's Farm address** — could not be confirmed. No Phoenix match for "Anna's Farm" as a named place. Closest real "farm on Baseline" candidates in South Phoenix are the historic Japanese flower farms (Kishiyama / Nakagawa) between 32nd and 48th St. Agritopia is on Ray Rd, not Baseline. Need address, cross streets, or Maps pin.
- **Client identity block** — name, email, phone, billing.
- **Contractor identity block** — company, contact, logo, license.
- **Billable area decision** — quote says 3,500 / 1,500 sqft; measured 60×60 / 60×30 = 3,600 / 1,800.
- **Tax rate, deposit terms, valid-until date.**
- **Reference photos** — drop into `PROJECTS/annas-farm/reference/`. Once they land, the `before_day` Nano Banana prompts flip from `generate_image` to `edit_image` for accuracy.
- **"Pascal editor" confirmation** — likely `paulwinex/pw_Houdini_VEX_Editor`; confirm or correct.

---

## Line item summary (from `brief.json`)

### Site One — 60' × 60' (3,600 sqft measured / 3,500 sqft quoted)

| Item | Qty | Unit | Price |
|------|-----|------|-------|
| Remove, grade, debris haul | 1 | lot | $2,200 |
| Weed fabric w/ staples | 3,600 | sqft | $1,925 |
| Decorative rock 3/4"–1 1/2" | — | ton | $6,600 |
| Decorative rock 2"–6" | — | ton | $2,200 |
| Decorative boulders | 6 | ton | $5,280 |
| Flagstone accents | 4 | ton | $4,400 |
| Solar path lights | 10 | each | $550 |
| **Subtotal** | | | **$23,155** |

### Site Two — 60' × 30' (1,800 sqft measured / 1,500 sqft quoted)

| Item | Qty | Unit | Price |
|------|-----|------|-------|
| Remove, grade, debris haul | 1 | lot | $1,100 |
| Weed fabric w/ staples | 1,800 | sqft | $825 |
| Decorative rock 3/4"–1 1/2" | — | ton | $3,300 |
| Decorative rock 2"–6" | — | ton | $1,100 |
| Decorative boulders | 4 | ton | $3,520 |
| Flagstone accents | 3 | ton | $3,300 |
| Solar path lights | 10 | each | $550 |
| **Subtotal** | | | **$13,695** |

### **Grand total (no tax): $36,850**

---

## How to render the proposal PDF (desktop Claude)

```bash
cd /Users/ojeromyo/Desktop/CLAW3D-Houdini-work-order/PROJECTS/annas-farm/proposal/template

# Install Typst if not present
brew install typst       # or: uv tool install typst

# Compile
typst compile proposal.typ ../proposal.pdf
open ../proposal.pdf
```

The template reads `../../brief.json` directly. Edit `brief.json` (client block, contractor block, totals.tax_rate_pct, totals.valid_until, totals.deposit_terms) and re-run `typst compile` — the PDF updates.

**Mockup grid is commented out in `proposal.typ`** near line 70. Uncomment the `#figure(...)` block once `renders/nano-banana/*.png` land.

---

## Next actions for desktop Claude session

**Primary task: build the proposal with line items.**

1. Verify video ingestion finished — `pxt.get_table('projects.annas_farm').count()` should be ≥ 1; `projects.annas_farm_frames` should have hundreds of rows; CLIP embed index should be built.
2. Fill the **blocking unknowns** in `brief.json`:
   - `client.*`
   - `contractor.*`
   - `location.address` + `location.lat/lon` once address is confirmed
   - `totals.tax_rate_pct`, `totals.valid_until`, `totals.deposit_terms`
3. If the owner provides reference photos, drop them in `reference/` and flip the `before_day` Nano Banana prompts from `generate_image` to `edit_image` with `inputs[]` pointing at the photos.
4. Compile the Typst proposal: `typst compile proposal.typ ../proposal.pdf`.
5. If mockup renders are ready, uncomment the `#figure` block in `proposal.typ` to embed them and re-compile.
6. Append a session entry to `HANDOFF.md` at the end.

---

## Key research callouts to remember

- **Nano Banana has no formal negative-prompt field.** Exclusions go in natural language; the wrapper flattens `quality.avoid` → prose.
- **Veo 3 audio is dual-stream and must be explicitly prompted** (ambient / foley / dialogue / music).
- **Pixeltable is the data plane** — `projects.annas_farm` lives there, not in flat files. The video frames + CLIP embeddings let you run similarity search for "wide shot of bare dirt common-space entry" from the ingested video to grab the best angles for mockup references.
- **Typst > LaTeX** for JSON-to-PDF proposals (rapid, one binary, modern typography).
- **"Anna's Farm" address is still unverified.** Do not fabricate.

---

## File count check

- 14 JSON files validated (brief, 8 NB prompts, 2 Veo 3 prompts, 3 schemas).
- 4 research digests in `research/`.
- 2 HScript `.cmd` files in `houdini/`.
- 1 Typst template.
- 1 OWNER_QUESTIONS.md with 12 questions.

Everything lives inside `/Users/ojeromyo/Desktop/CLAW3D-Houdini-work-order/PROJECTS/annas-farm/` and `/Users/ojeromyo/Desktop/CLAW3D-Houdini-work-order/schemas/`. Nothing outside the repo.
