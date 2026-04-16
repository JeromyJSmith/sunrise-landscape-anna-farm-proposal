# Research — "Anna's Farm" location + Maricopa GIS sources

## Bottom line

**"Anna's Farm" could not be confirmed as an AZ place.** Do not proceed with GIS pulls until the owner provides a street address, cross streets, or a Google Maps pin.

The only "Anna's Farm HOA" found online is in Westminster, **Colorado** — not Arizona. ([annasfarmhoa.com](https://www.annasfarmhoa.com/view/contact-us.aspx))

## Top AZ candidates (ranked, none confirmed)

| # | Candidate | Location | Ruled out? | Reasoning |
|---|-----------|----------|------------|-----------|
| 1 | **Historic Japanese flower farms on Baseline Rd** | Baseline Rd between 32nd St and 48th St, South Phoenix, at the foot of South Mountain | Not confirmed — **this is "the farm on Baseline Rd"** in Phoenix cultural memory. Kishiyama and Nakagawa farms; Baseline Flowers (Nakagawa shop) still operates. | Matches "Baseline" reference. No specific "Anna's" found in published histories. |
| 2 | **Agritopia** (Gilbert) | 3000 E Ray Rd, Gilbert AZ 85296 | **Ruled out as "Baseline"** — Agritopia is on Ray Rd, not Baseline. | Named agrihood with a farm, ~166 acres. Possible if client misremembered "Baseline." Low confidence. |
| 3 | **Steadfast Farm / Eastmark agrihood** (Mesa) | Eastmark, Mesa | Not on Baseline, not "Anna's." | Agrihood with farm component. |

**Sources:**
- [Arizona Historical Society — Japanese flower gardens of Phoenix](https://arizonahistoricalsociety.org/2021/05/10/the-japanese-flower-gardens-of-phoenix/)
- [Cronkite News — Phoenix flower fields, urban agriculture, 2024](https://cronkitenews.azpbs.org/2024/03/27/phoenix-flower-fields-urban-agriculture/)
- [Agritopia Farm](https://www.agritopiafarm.com/)
- [Wikipedia — Agritopia](https://en.wikipedia.org/wiki/Agritopia)

## What we need from the owner

- Street address, OR
- Cross streets (e.g. "Baseline & 40th St"), OR
- A Google Maps pin screenshot dropped into `PROJECTS/annas-farm/reference/`.

With any of those I can pull the parcel polygon, zoning, and a 1m DEM in one pass.

## Maricopa County GIS sources (verified)

| Source | URL | What it gives |
|--------|-----|---------------|
| **Maricopa County GIS Open Data portal** | https://data-maricopa.opendata.arcgis.com/ | Parcels, zoning, aerial imagery, boundaries |
| **Parcels dataset (direct)** | https://data-maricopa.opendata.arcgis.com/datasets/c937f17330f64e64abd41976fc8bb17f | Shapefiles / ArcGIS FeatureService |
| **Maricopa Assessor Parcel Viewer** | https://maps.mcassessor.maricopa.gov/ | Historical aerials back decades; owner/APN lookup |
| **USGS 3DEP (1m DEM)** | https://data.usgs.gov/datacatalog/data/USGS:77ae0551-c61e-4979-aedd-d797abdcde0e | Statewide 1m DEM for contours |
| **OpenStreetMap Overpass** | via `osmnx` / `pyrosm` | Street network, features around the bounding box |
| **NAIP aerial** | USGS / Earth Explorer | High-resolution aerial photography |

## Free Python tools (all uv-installable)

```bash
# DEM + contours
uv pip install py3dep                  # 10/30/60m 3DEP
uv pip install seamless-3dep           # seamless DEM

# OSM bounding box
uv pip install osmnx                   # Overpass-backed, GeoDataFrames
uv pip install pyrosm                  # faster alternative

# Ground-level reference
uv pip install mapillary               # Mapillary Python SDK (free)
uv pip install streetview              # Google Street View (API key)
```

- [py3dep](https://pypi.org/project/py3dep/)
- [osmnx](https://osmnx.readthedocs.io/)
- [pyrosm](https://pyrosm.readthedocs.io/)
- [mapillary-python-sdk](https://github.com/mapillary/mapillary-python-sdk)
- [robolyst/streetview](https://github.com/robolyst/streetview)

## GIS → landscape proposal scaffolding (rare but existing)

- [TensorWorks/LandscapeGen](https://github.com/TensorWorks/LandscapeGen) — GIS → Unreal landscape.
- [tangible-landscape/grass-tangible-landscape](https://github.com/tangible-landscape/grass-tangible-landscape) — GRASS GIS + physical/digital coupling.
- [baharmon — GIS for Designers](https://baharmon.github.io/gis-for-designers) — teaching resource for landscape architects.

**No turnkey "parcel → landscape proposal PDF" generator exists — we assemble from these pieces.**

## Action item

**BLOCKED on owner.** I will not fabricate an address. Please provide one of: street address, cross streets, or Google Maps pin.
