# Houdini — Anna's Farm parametric scene

Two HScript `.cmd` files, one per site. Each builds a parametric ground plane, boulder scatter, flagstone layout, and solar-light instance field from parameters that mirror `brief.json`. Runs headless via `tools/houdini-hbatch-runner.sh` from the repo root.

## Files

| File | Role |
|------|------|
| `site1.cmd` | Builds Site One (60×60) parametric scene |
| `site2.cmd` | Builds Site Two (60×30) parametric scene |
| `common.cmd` | Shared procedures sourced by both (optional — inline for now) |

## References used

- [CorvaeOboro/zenv](https://github.com/CorvaeOboro/zenv) — voronoi rock / boulder clustering pattern.
- [Doudini/mLibTerrain](https://github.com/Doudini/mLibTerrain) — terrain HDA library.
- SideFX Labs **Biome Tools** (bundled) — rule-based scatter.
- [NingSun-pixel/GPT-Houdini-UE-Terrain-Pipeline](https://github.com/NingSun-pixel/GPT-Houdini-UE-Terrain-Pipeline) — "JSON brief drives HDAs" pattern.

## "Pascal editor" note

The owner's memory references a "Pascal Editor" that "stays whole — house going on the property." In the Houdini ecosystem no tool is literally named that; the closest match is **[paulwinex/pw_Houdini_VEX_Editor](https://github.com/paulwinex/pw_Houdini_VEX_Editor)** (advanced VEX / HScript / Python editor). The `site*.cmd` files are written so that the VEX attribute-scatter rules in the Attribute SOPs are editable through pw_Houdini_VEX_Editor without breaking the rest of the scene — layer on top, never replace. **Owner confirmation of what "Pascal editor" actually points at is outstanding.**

## Run (once Houdini is on)

```bash
# From repo root
HIP_FILE=PROJECTS/annas-farm/houdini/site1.hip \
CMD_FILE=PROJECTS/annas-farm/houdini/site1.cmd \
  tools/houdini-hbatch-runner.sh
```
