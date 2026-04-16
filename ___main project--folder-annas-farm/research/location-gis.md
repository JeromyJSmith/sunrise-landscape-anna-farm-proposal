# Research — Anna's Farm location + Boulder County GIS sources

## CONFIRMED: Anna's Farm is in Lafayette, Colorado

**Coordinates (owner-confirmed 2026-04-11):**

| Site | Lat (°N) | Lon (°W) | Area | Perimeter | Elevation |
|------|---------:|---------:|-----:|----------:|----------:|
| Site 1 | 40.000458 | -105.110036 | 3,500 ft² | 230 ft | ~5,360 ft (1,634 m) |
| Site 2 | 40.001489 | -105.109675 | 1,567 ft² *(target 1,500)* | 194 ft | ~5,350 ft (1,631 m) |

Both sites are ~400 ft apart (Site 2 is NNW of Site 1) in **Lafayette, Boulder County, Colorado**. Confirmed by landmark labels visible in the ingested video frames:

- **Primrose School of Lafayette** — visible in `reference/from_video/site1/site1_perimeter_hero_3500sqft_230ft_t01m37.png` (at 01:37) and `reference/from_video/site2/site2_topdown_highgate_primrose_t15m20.png` (at 15:20).
- **Highgate Lane** — readable in `site2_topdown_highgate_primrose_t15m20.png`.
- **Indian Peaks Dental** — visible in the broader-context frame `site1_context_neighborhood_t03m52.png` (at 03:52).

## Correction to Session 1 research

Session 1's location research incorrectly ruled out Colorado because the only hit for "Anna's Farm HOA" was an **HOA management company's mailing address** in Westminster CO — not the neighborhood itself. HOA management companies often serve communities from a central corporate address. The actual neighborhood is in **Lafayette**, ~14 miles north of Westminster.

**The Phoenix metro assumption was wrong.** "Baseline Rd" is the name of a major east-west road in Lafayette CO as well (part of the original 40th-parallel baseline survey line). The owner's verbal reference to "Baseline" matched multiple US metros — Lafayette CO was not on the top-3 candidate list and should have been.

## Climate + style implications

**The Sonoran desert xeriscape direction from Session 1 was wrong.** Colorado Front Range high-plains is a different biome:

- **USDA hardiness:** 5b / 6a (not 9b/10a).
- **Rainfall:** ~15–18 in/yr (Sonoran is ~7).
- **Winter:** sustained snow cover, freeze/thaw cycling. Hardscape must account for frost heave on flagstone groupings.
- **Summer:** hot-dry days with afternoon thunderstorms, not monsoon.
- **Native vegetation context (adjacent, not installed):** blue grama, buffalo grass, rabbitbrush, scrub oak, ponderosa pine edge, cottonwoods in riparian lines, blue spruce ornamentals.
- **Golden hour:** alpenglow on the Flatirons/Front Range to the west — a killer hero backdrop for the after shots.
- **Material swap:** Arizona sandstone → **Lyons sandstone (buff/rose)**, **Colorado moss rock**, **Estes red sandstone**, **rose quartzite**. All locally quarried in Colorado.

All 8 Nano Banana prompts and 2 Veo 3 prompts have been rewritten to reflect Colorado/Lafayette/Front Range — Sonoran/Arizona/Phoenix/Baseline references removed except where they're negative-keywords in `quality.avoid`.

## Boulder County GIS sources (verified)

| Source | URL | What it gives |
|--------|-----|---------------|
| **Boulder County GIS Open Data** | https://opendata-bouldercounty.hub.arcgis.com/ | Parcels, zoning, aerial, contours — ArcGIS Hub |
| **Boulder County Parcels (FeatureService)** | Search "Parcels" on the open-data portal | Shapefile / REST |
| **Boulder County Assessor** | https://www.bouldercounty.gov/property-and-land/assessor/ | APN / owner lookup |
| **USGS 3DEP 1m DEM** | https://apps.nationalmap.gov/downloader/ | Statewide 1m DEM for contours |
| **NAIP aerial** | https://nrcs.app.box.com/v/naip | High-res orthophoto |
| **OpenStreetMap Overpass** | via `osmnx` / `pyrosm` | Highgate Lane + nearby street network |
| **Mapillary** | https://www.mapillary.com/ | Crowdsourced ground-level reference (free SDK) |

## Free Python tools (uv-installable)

```bash
uv pip install py3dep            # 10/30/60m 3DEP DEM
uv pip install osmnx             # OSM Overpass, GeoDataFrames
uv pip install pyrosm            # faster OSM alt
uv pip install mapillary         # Mapillary SDK
uv pip install streetview        # Google Street View (API key)
```

## Action

Address still TBD (coordinates confirmed — just need the mailing address for the proposal header). Once provided, fetch:

1. Parcel polygons for both centroids from Boulder County GIS.
2. 1m DEM contours over the combined bounding box via `py3dep`.
3. OSM export (Highgate Lane, Primrose School footprint, road network) via `osmnx`.
4. Street View or Mapillary ground-level references.

All outputs will land in `PROJECTS/annas-farm/geo/`.
