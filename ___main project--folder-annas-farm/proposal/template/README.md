# Proposal template — Anna's Farm

Typst source at `proposal.typ`. Reads `../../brief.json` directly — no intermediate build step.

## Render

```bash
cd PROJECTS/annas-farm/proposal/template
typst compile proposal.typ ../proposal.pdf
```

If Typst isn't installed:

```bash
brew install typst      # macOS
# or
uv tool install typst   # cross-platform via uv
```

## What's in the template

- Contractor header block (logo + contact)
- Client block
- Project summary (from `brief.project.deliverable_summary`)
- Mockup grid (commented out until renders land in `../../renders/nano-banana/`)
- Per-site line-item tables with subtotals
- Grand total with optional tax line
- Terms block (deposit, valid-until)

## Inspiration source

Adapted from [casoon/typst-business-templates](https://github.com/casoon/typst-business-templates) offer/proposal template — the closest open-source match to the itemized landscape-contractor layout.

## To uncomment once renders land

Near line ~70 of `proposal.typ`, uncomment the `#figure(...)` block that embeds `site1_01_before_day.png` and `site1_02_after_day.png`. Add analogous blocks for Site Two and the hero/dusk shots.
