# Research — Proposal toolchain + Houdini parametric landscape + "Pascal editor"

## Recommended path

**Typst** via [casoon/typst-business-templates](https://github.com/casoon/typst-business-templates) (offer/proposal template, reads `invoice.json` + `company.json`) → rendered to PDF by a Pixeltable computed column. Site photos and mockup renders embedded as figures. Post-processed through `anthropics/skills/pdf` if cover / merge / form fields are needed.

**Why Typst over LaTeX:** rapid JSON-to-PDF, one binary, no template compilation pain, modern typography by default.

## Typst templates (JSON → PDF, all open source)

| Repo | Role |
|------|------|
| [casoon/typst-business-templates](https://github.com/casoon/typst-business-templates) | **Offer/Proposal** template with itemized pricing — best match for contractor/client block + line items + totals |
| [ad-si/invoice-maker](https://github.com/ad-si/invoice-maker) | YAML/Typst records → styled PDF; Typst Universe package |
| [ntjess/typst-invoice-template](https://github.com/ntjess/typst-invoice-template) | Swappable reader, JSON-ready |
| [mcanouil/quarto-invoice](https://github.com/mcanouil/quarto-invoice) | Quarto wrapper; mixes YAML + markdown + image embeds |
| [WilstonOreo/invoist](https://github.com/WilstonOreo/invoist) | Simpler fallback |
| [erictapen/typst-invoice](https://github.com/erictapen/typst-invoice) | Simpler fallback |
| [ddorn/typst-invoice-template](https://github.com/ddorn/typst-invoice-template) | Simpler fallback |

## Python / JS proposal + invoice generators

- [ecmonline/invoice-generator](https://github.com/ecmonline/invoice-generator) — Python + WeasyPrint + YAML → PDF.
- [Invoice-Generator/invoice-generator-api](https://github.com/Invoice-Generator/invoice-generator-api) — free HTTP API, JSON body → PDF.
- [by-cx/InvoiceGenerator](https://github.com/by-cx/InvoiceGenerator) — ReportLab-based.
- [maaslalani/invoice](https://github.com/maaslalani/invoice) — Go CLI, JSON → PDF, single binary.

## Claude Code / Anthropic agent-skills for PDF + decks

- [anthropics/skills](https://github.com/anthropics/skills) — **official**; `skills/pdf/` (extract, fill, create) and `skills/pptx/` (deck generation). Directly usable.
- [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) — Vercel collection with PDF skill.
- [VoltAgent/awesome-agent-skills](https://github.com/VoltAgent/awesome-agent-skills) — 1000+ index; includes `MiniMax-AI/minimax-pdf` with 15 cover styles.
- [travisvn/awesome-claude-skills](https://github.com/travisvn/awesome-claude-skills).
- [karanb192/awesome-claude-skills](https://github.com/karanb192/awesome-claude-skills).

## Before/after landscape mockups (no turnkey repo)

Pattern = depth/canny ControlNet + img2img for prior-gen stacks. **For this project we use Nano Banana's `edit_image` mode with `consistency_id`** — simpler and newer.

- [lllyasviel/ControlNet](https://github.com/lllyasviel/ControlNet) — depth/canny/seg conditioning.
- [huggingface/diffusers](https://github.com/huggingface/diffusers) — `StableDiffusionControlNetImg2ImgPipeline`.

## Houdini parametric landscape (JSON-drivable)

| Repo | Role |
|------|------|
| [CorvaeOboro/zenv](https://github.com/CorvaeOboro/zenv) | Procedural environments, **rock / cliff voronoi clustering** — directly relevant for boulder + flagstone scatter |
| [Doudini/mLibTerrain](https://github.com/Doudini/mLibTerrain) | Artist-friendly terrain HDA library |
| [yidaogucheng/OpenWorldTerrainToolset](https://github.com/yidaogucheng/OpenWorldTerrainToolset) | Open-world terrain toolset |
| [Baldrax/Houdini_TaleSpire_Terrain_Generation_Toolset](https://github.com/Baldrax/Houdini_TaleSpire_Terrain_Generation_Toolset) | Heightfield HDA set |
| [NingSun-pixel/GPT-Houdini-UE-Terrain-Pipeline](https://github.com/NingSun-pixel/GPT-Houdini-UE-Terrain-Pipeline) | **GPT → Houdini → UE terrain** — the "JSON brief drives HDAs" pattern |
| [wyhinton/AwesomeHoudini](https://github.com/wyhinton/AwesomeHoudini) | Umbrella index |

SideFX **Labs Biome Tools** handle rule-based scatter natively (bundled with Houdini, not GitHub).

## "Pascal editor" disambiguation

**No tool literally named "Pascal editor" exists in the Houdini ecosystem.** The closest match — and the one the owner memory note "Pascal Editor stays whole — house going on the property" is almost certainly pointing at — is:

**[paulwinex/pw_Houdini_VEX_Editor](https://github.com/paulwinex/pw_Houdini_VEX_Editor)** — advanced VEX / HScript / Python editor with autocompletion, by **Pavel "paulwinex"**. "Pascal" → "Pavel" or a renaming of the tool in the owner's workflow.

Other less-likely candidates:
- [CG Toolbox Houdini Expression Editor](http://cgtoolbox.com/houdini-expression-editor/) — external expression editor.
- [Fuadex/Houdini-VEX-HScript-Python](https://github.com/Fuadex/Houdini-VEX-HScript-Python) — snippet repo.

**Owner confirmation required** before wiring anything to it.

## Integration plan for Anna's Farm

1. `PROJECTS/annas-farm/brief.json` drives everything.
2. Typst template (casoon offer) reads `brief.json` → renders `proposal.pdf`.
3. Nano Banana generates 8 mockups from `prompts/nano-banana/*.json` into `renders/nano-banana/`.
4. Veo 3 generates 2 walkthroughs from `prompts/veo3/*.json` into `renders/veo3/`.
5. Houdini HScript .cmd files build per-site parametric scenes; GLB exports feed Claw3D.
6. pw_Houdini_VEX_Editor / "Pascal editor" used by the contractor to iterate VEX on the parametric scatter (owner-driven, we just provide the scene).
7. Final proposal embeds: site photos + mockup renders + Houdini wireframe/hero render + line items + totals.
