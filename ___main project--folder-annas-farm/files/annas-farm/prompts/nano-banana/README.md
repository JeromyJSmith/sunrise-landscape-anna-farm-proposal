# Nano Banana prompts — Anna's Farm

Conforms to `schemas/nano-banana.schema.json`. Paired before/after shots share a `consistency_id` and an **identical `camera` block** — only `scene.time`, `materials`, `lighting`, and `quality` change.

## Shot list (8 total, 4 per site)

| ID | Site | Shot | Purpose |
|----|------|------|---------|
| `site1_01_before_day` | 1 | Wide daytime — existing conditions | Baseline "before" |
| `site1_02_after_day` | 1 | Wide daytime — completed install (same framing) | Direct comparison to before |
| `site1_03_hero_golden` | 1 | 3/4 angle hero — golden hour | Proposal cover / hero |
| `site1_04_dusk_lights` | 1 | Dusk / blue hour — solar lights glowing | Emotional close |
| `site2_01_before_day` | 2 | Wide daytime — existing conditions | Baseline "before" |
| `site2_02_after_day` | 2 | Wide daytime — completed install | Direct comparison |
| `site2_03_hero_golden` | 2 | 3/4 angle hero — golden hour | Proposal cover B |
| `site2_04_dusk_lights` | 2 | Dusk / blue hour — solar lights glowing | Emotional close |

## Variations (vary seed / re-run)

Each prompt can be re-run with varied phrasing of `scene.description` to get different compositions. For the final proposal, pick the best of 3–5 takes per shot.

## Note — `before_day` variants

The "before" shots depend on owner-provided reference photos in `reference/`. Until those land, the `before_day` prompts use `task: "generate_image"` with a generic "neglected desert entry" description. Once photos land, switch to `task: "edit_image"` with the photo as input.
