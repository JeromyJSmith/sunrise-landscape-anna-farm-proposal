# Owner questions — Anna's Farm

Answer whatever you can; leave the rest blank. I'll fill the rest from context when you confirm.

## Blocking (must answer before I can run steps 3 / 5 / 7)

### 1. Location — CONFIRMED as Lafayette CO ✓
Owner provided coordinates 2026-04-11. Confirmed by Primrose School of Lafayette + Highgate Lane labels visible in the ingested video frames.

- Site 1: 40.000458°N, -105.110036°W — 3,500 ft² / 230 ft perimeter / ~5,360 ft elevation
- Site 2: 40.001489°N, -105.109675°W — 1,567 ft² (reducing to 1,500) / 194 ft perimeter / ~5,350 ft elevation

Still needed: **street address** for the proposal header invoice block. Coordinates unblock GIS pulls; an address unblocks the header.

### 2. Client identity — blocks proposal header
- Client name
- Client email
- Client phone
- Billing address (if different from site)
- Is the invoice going to an HOA, property manager, builder, or individual?

### 3. Contractor identity — blocks proposal header
- Company name
- Contact name
- Email
- Phone
- License number
- Logo (drop into `reference/`)
- Brand colors (hex)
- Tagline, if any

## Numeric clarifications

### 4. Billable area
Site 1 is 3,500 ft² (confirmed — measured polygon matches quote). Site 2 is currently 1,567 ft² but you're still reducing it toward 1,500 ft². **I've quoted against 1,500 ft² for Site 2** — confirm or adjust.

### 5. Tax rate
Colorado state sales tax (~2.9%) + Lafayette city tax + Boulder County — or is this project tax-exempt / flat-rate contractor?

### 6. Deposit & payment terms
Example: 50% deposit on signature, 50% on completion. What's yours?

### 7. Valid-until date
30 / 60 / 90 days from today?

## Scope clarifications

### 8. Optional upsell line items
Do you want me to add any of these as separate optional line items in the proposal so the client can add them without getting a new estimate?
- Metal edging (separating rock zones)
- Drip irrigation
- Planting (agave, red yucca, ornamental grasses)
- Artificial turf patch
- Blackstone / flagstone patio (seating area)
- Upgraded path lighting (low-voltage instead of solar)

### 9. Reference photos
The transcript mentions you have phone photos of both entry areas ("shoot it over"). Drop them into `PROJECTS/annas-farm/reference/` using filenames like `site-1_wide-existing_20260411.jpg`. Once they're there I'll switch the "before" Nano Banana prompts from `generate_image` to `edit_image` and they'll be far more accurate.

## Tool confirmations

### 10. "Pascal editor" — what exactly is this?
There's no tool literally named "Pascal editor" in the Houdini ecosystem. My strongest guess is **[paulwinex/pw_Houdini_VEX_Editor](https://github.com/paulwinex/pw_Houdini_VEX_Editor)** (an advanced VEX / HScript / Python editor by Pavel "paulwinex" — "Pascal" might be a memory drift from "Pavel"). The Houdini scenes I built use editable VEX snippets in attribute wrangles so this editor can be layered on top without replacing anything — **house going on the property, never replacing the property**. Confirm this is what you mean, or point me at the real tool.

### 11. Claw3D viewer
Should I hand the GLB exports from `houdini/site1.cmd` + `houdini/site2.cmd` to the Claw3D 3D office browser viewer, the makermate/claw3d CLI path, or both?

### 12. Reasoning engine loop
Should I route the final prompt-to-render critique through the Pixeltable doc_query + Gemma4 visual critique loop (feed mockups back, score them, regenerate the bottom-ranked)? If yes, how many iterations per shot?
