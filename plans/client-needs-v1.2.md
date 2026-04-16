# Client Needs Document v1.4

**Project:** Anna Farm Landscape Visualization and Proposal Support  
**Local Project Directory:** `/Users/ojeromyo/Desktop/3d anna`  
**Document Status:** Consolidated from transcript extraction  
**Prepared:** April 15, 2026  
**Updated:** April 15, 2026  
**Target Review Milestone:** Friday by 12:00 PM (noon)—not last minute  
**Fallback Delivery:** Crayon sketch package if final renders are incomplete  
**Traceability:** See [client-needs-traceability-v1.0.md](./client-needs-traceability-v1.0.md) for source mapping

## Repository Initialization Requirement

Before beginning any design development, prompt engineering, website implementation, narrative drafting, or deliverable generation, create a **brand new GitHub repository** dedicated exclusively to this project. This repository will serve as the project's website hosting environment, version control system, review surface, and canonical source of truth for all files and revisions.[web:3][web:9]

The repository must be initialized in the following local project directory:

`/Users/ojeromyo/Desktop/3d anna`

If this folder already exists locally, initialize it as a Git repository from that directory and connect it to a newly created GitHub remote. GitHub supports creating a new repository for this purpose, and an existing local folder can be initialized with Git and connected to GitHub as the remote system of record.[web:3][web:8]

This repository must remain separate from the user's main project folder so that this client project can be independently versioned, reviewed, rolled back, published, and maintained over time.[web:4]

## Version History

| Version | Date | Summary |
|---|---|---|
| v1.0 | April 15, 2026 | Initial extraction of client needs from transcript. |
| v1.1 | April 15, 2026 | Expanded into a more descriptive project needs document with spatial, material, and technical requirements. |
| v1.2 | April 15, 2026 | Added repository initialization requirement, formal specification structure, repository strategy, GitHub Pages guidance, deliverables, timeline, and change-management workflow. |
| v1.3 | April 15, 2026 | Created internal technical specification with execution-focused structure. |
| v1.4 | April 15, 2026 | Full consolidation from transcript re-parse: added site-specific dimensions, lighting requirements, orientation standard (north=sidewalk, prefer west bias), material corrections (Colorado Red, NOT Arizona), non-deterministic language rules, rock type switch semantics, fallback delivery pathway, and traceability matrix. |

## Project Purpose

This project supports the design, visualization, and proposal development of a landscape installation at Anna Farm that uses flat iron-inspired vertical stone forms, differentiated rock fields, and AI-assisted image transformation to communicate a refined site concept.

The immediate goal is to produce design-aligned imagery, narrative, and proposal materials that are strong enough for client review on a short timeline, while also preserving a backup pathway such as sketch-based communication if the full image-generation workflow is not finalized in time.

The longer-term goal is to establish a repeatable workflow in which annotated site photos, structured prompts, semantic segmentation, and version-controlled deliverables can be used to iteratively improve the design and present it clearly to the client and broader decision-making group.

## Site Specifications

### Site 1 (Large Site)
- **Coverage area:** 3,500 square feet weed fabric mat
- **Location:** Anna's Farm HOA common space, Colorado
- **Existing conditions:** Metal edging, drip lines present
- **Proposed change:** Extend bed to sidewalk edge (adds square footage)
- **Identification:** Use GPS coordinates of site center point

### Site 2 (Smaller Site)
- **Coverage area:** 1,500 square feet weed fabric mat
- **Location:** Anna's Farm HOA common space, Colorado
- **Existing conditions:** Metal edging present
- **Identification:** Use GPS coordinates of site center point

### Site Constraints
- **Prairie dog activity:** Multiple burrow holes present; mulch use is discouraged due to disturbance risk
- **Location correction:** Colorado (NOT Arizona/Phoenix—remove all Arizona references from all materials)

## Timeline and Review Constraints

The current working deadline is **Friday by 12:00 PM (noon)**—not last minute. This is the practical milestone for having the design direction sufficiently resolved for review and presentation.

### Primary Delivery Path
If the design imagery is ready by the noon target, deliver the full HTML proposal with 3D viewport, photos, line items, pricing, and both daytime and nighttime visualization renders.

### Fallback Delivery Path
If the design imagery is not ready by that noon target, deliver a crayon sketch package that communicates the general idea. The client must be able to absorb the core concept even without final renders.

### Schedule Buffer
The full decision-making group does not meet until the following week, which provides some buffer. However, the workflow should not rely on that extra time. The project should proceed as if the noon Friday milestone is the operative deadline.

## Design Intent

The design is intended to evoke a Front Range / Flatirons-like landscape condition through the arrangement of upright stone slabs, supporting rock fields, and river-like stone movement across the site.

The visual language should communicate a composed, naturalistic installation rather than a literal or overly rigid replica. The site should read as a stylized landscape gesture with orientation, layering, and material differentiation that support the narrative.

The proposal narrative and generated imagery should remain aligned so that what is described in text is visually supported by the concept images.

## Spatial Design Requirements

### Flat Iron Groupings

The design should use **groupings of flat iron slabs**, rather than a single stone formation. Acceptable grouping logic includes clusters of **two, three, or four** slabs, depending on the available stone sizes, thicknesses, and composition in view.

The client specifically wants the design language to avoid commitment to one exact quantity or one exact arrangement. The layout must remain open enough to adapt to site realities and available material while still preserving the intended mountain-like reading.

### Orientation

The flat iron slabs should be positioned so their visual emphasis points in a **northwesterly direction**, with a preference for **more west than north**.

**Orientation Standard:**
- **North axis:** Defined by the sidewalk—the sidewalk runs due north
- **West axis:** Perpendicular to sidewalk, toward the mountains
- **Target direction:** Northwest, but with stronger west component than north component
- **Visual intent:** Slabs should appear to face toward the mountain context

**Annotation Requirements:**
- Compass overlays showing north and west axes
- Target vector showing the desired northwest direction
- Yellow or highlighted "suggestion direction" markers
- All prompts, annotations, and review imagery must preserve this directional intent consistently

### Backdrop and Depth

The design should maintain a sense of layered composition:

- **Cliff walls:** Positioned on the back side of the creep bends
- **Strip stone:** Should resemble cliff walls carved through a canyon by a river
- **Flat irons:** Should resemble a mountain range (artistic vision, not literal)
- **River cobble/smaller rock:** Expression in foreground or middle ground
- **Vertical stone presence:** Stronger toward the back side of the installation

The design should read clearly from the sidewalk and other primary viewing angles, with the flat iron elements acting as the visual anchor.

## Material Requirements

### Distinct Rock Types

Rock types must remain semantically distinct in both the design documentation and the AI workflow. The client explicitly does not want the system to flatten everything into a generic idea of “rock.”

**Approved Materials (Colorado-sourced):**
- **Colorado red flagstone** — NOT Arizona sandstone (remove all Arizona references)
- **Colorado red strip stone** — for vertical flat iron formations
- **Native granite** — for transition zones and river lines
- **River boulders** — accent features
- **River cobbles** — foreground and flow paths
- **River rock** — bed material and texture
- **Decorative rock** — representing creek/riverbed flowing through flagstone accents and boulders

**Material Corrections Required:**
- Remove all references to "Arizona sandstone"
- Remove all references to "Phoenix"
- Replace with "Colorado red flagstone" and "Colorado red strip stone"

**Color Indication in Annotations:**
- Blue coloring in marked-up images indicates blue rock placement

### Rock Type Switches

The design includes zones where one rock type transitions into another. These transitions are important compositionally and should be documented as explicit “rock type switch” regions in the annotated source imagery.

These switch areas should not be treated as noise or incidental background texture. They are compositional boundaries that help define flow, contrast, and hierarchy in the design.

### River Lines

Some stone fields are intended to read as **river lines** or flow paths rather than static infill. These lines should preserve a directional, shaped quality and must remain distinguishable from adjacent rock beds.

## Lighting Requirements

### Solar Accent Lighting
- **Quantity:** Approximately 10 solar lights in each site (Site A and Site B)
- **Total:** ~20 solar lights across both sites

### Spotlight Placement
Spotlights should accentuate:
- Strip stone cliff walls
- Flat iron formations
- Boulder formations

### Visualization Requirements
- Generate both **daytime** and **nighttime** visualization renders
- Lighting should be visible in the image prompts to show intended effect

## Color and Narrative Flexibility

The client indicated that colors and overall tonal treatment may still be adjusted, including possible refinement of the “crayon sunrise” type of look or color direction. This means the visual package should preserve flexibility in color grading and surface tone while keeping the core composition stable.

Narrative, proposal language, and imagery must stay coordinated. If the narrative or proposal wording changes, the visuals should continue to support the same conceptual direction.

## Proposal Writing Requirements

### Non-Deterministic Language

The proposal and website copy must avoid deterministic statements that over-promise exact quantities or exact final forms. For example, language such as “a single flat iron formation” should be replaced with wording that allows grouped, adaptable, and site-responsive implementation.

Preferred language patterns include phrases such as:
- “a series of flat iron-inspired groupings”
- “clustered vertical slab elements”
- “groupings of upright stone forms evoking the Flatirons”
- “a mountain-inspired arrangement of vertical red stone slabs”
- "a few groupings"
- "a series of..."

**This is a system-wide rule:** Apply non-deterministic language to all projects, not just this one. Avoid "pigeonholing" into exact specifications when the final configuration depends on field conditions.

**Language to avoid:**
- "single flat iron formation"
- "exactly X number of..."
- "this specific arrangement..."
- Any language that commits to a specific count or exact configuration

### Narrative Alignment

The narrative should clearly explain:
- What the landscape concept is
- How the stone groupings and river lines shape the space
- How the materials support the intended experience
- Why the configuration may adapt slightly based on field conditions and stone selection

## Reference Photography and Annotation Requirements

The image-generation workflow depends on high-quality source photography and clear annotation. Additional reference photography remains highly valuable.

### Critical Reference Photos Needed
- **Strip stone examples** — these make "all the difference" for AI understanding
- **Flat iron slab examples** — showing vertical orientation, not just horizontal flagstone
- **Close, medium, and wide views** of similar installations
- **Rock type transition photos** — showing where one material meets another
- **Angular orientation photos** — showing grouping patterns and directional alignment

### Photo Interpretation Rules
- Reference images are for **understanding, not literal exactness**
- Flagstone is not always horizontal—show it stacked up vertically
- Photos with colored markings indicate intended placement (blue = blue rock)
- Any similar reference photos are helpful, even if not exactly strip stone

### Annotation Requirements
Annotated images should include:
- **Bounding boxes** for flat iron groupings ("Bambi boxes")
- **Bounding boxes** for rock type switch regions
- **Labels** for river cobble zones, granite zones, and other material classes
- **Compass overlays** indicating north (sidewalk direction) and west (toward mountains)
- **Target vector** showing the desired northwest orientation
- **Yellow/highlighted markers** for suggested direction changes

### Annotation Purpose
These annotations are not only for human review; they are part of the prompt-building and segmentation workflow. The AI uses them to:
- Segment the image correctly
- Apply material-specific changes
- Maintain directional intent
- Preserve rock type distinctions

## AI Vision and 3D Asset Workflow Requirements

The project relies on a process in which photos are segmented, interpreted, and converted into prompts for 3D or image-generation tasks.

### Core Pipeline Capabilities
- **Pixel-level classification and segmentation** — down to the pixel
- **Pixel-perfect sand masks** coupled with formal resource classification
- **Region-aware editing** using labels and bounding boxes
- **Conversion** of segmented site understanding into strong prompts for 3D spatial generation
- **Verification** that the vision pipeline correctly identifies stone types, placement zones, and directional intent

### Remote Execution Architecture
- **Vision pipeline** runs through pixel table
- **UDF (user-defined function)** to initialize pipeline, triggerable from MacBook
- **Remote vision bridge** between MacBook orchestration layer and iMac NixOS compute layer
- **Checkpoint path validation** required before production use

### Prompt Engineering Requirements
- **JSON-style image prompts** for generation ("nana banana" format)
- Prompts must include all relevant context—**assume nothing is known**
- Include: spatial awareness, material types, size references, placement zones
- Encode: directional intent, rock type distinctions, artistic vision (flat irons = mountain range, strip stone = carved cliff walls)

### Verification Requirements
- Initialize vision runtime
- Ensure checkpoint path is valid
- Smoke test before production use
- Define end result and success criteria for each deliverable

The workflow should be robust enough that generated outputs can be revised without losing traceability between image source, prompt, version, and final deliverable.

## Repository Structure

The repository should be organized as a project record, not merely as a website folder. A recommended top-level structure is:

```text
3d-anna/
├── README.md
├── docs/
│   ├── client-needs/
│   ├── proposal/
│   ├── meeting-notes/
│   ├── narrative/
│   └── change-log/
├── site/
│   ├── index.html
│   ├── assets/
│   ├── css/
│   ├── js/
│   └── review/
├── references/
│   ├── source-photos/
│   ├── annotated-photos/
│   ├── precedent-images/
│   └── material-reference/
├── prompts/
│   ├── image-generation/
│   ├── segmentation/
│   ├── 3d-layout/
│   └── archived/
├── outputs/
│   ├── renders/
│   ├── review-sets/
│   ├── proposal-graphics/
│   └── exports/
├── models/
│   ├── 3d/
│   ├── textures/
│   └── metadata/
└── .github/
    └── workflows/
```

This structure helps separate source materials, prompts, generated outputs, review artifacts, and public-facing website files, which is a strong repository practice for design projects that mix narrative, imagery, and technical generation.

## Best Practices for a Landscape Design Repository

The repository should be structured so that landscape thinking, visual assets, and technical generation are all preserved in a way that supports review and rollback.

Recommended practices:
- Keep narrative and proposal docs separate from the public review website.
- Keep raw source photos separate from annotated versions.
- Store prompts as first-class project artifacts rather than burying them in notes.
- Archive superseded prompts rather than overwriting them silently.
- Separate approved outputs from experimental outputs.
- Keep a changelog or revision notes folder documenting major design shifts.
- Use consistent naming conventions that include date, site area, view, and revision number.

## Deliverables

### Required by Friday Noon
- Client needs documents (versioned)
- Internal technical specification (versioned)
- Proposal narrative or narrative-ready material
- Annotated imagery set with bounding boxes and compass overlays
- Review-ready concept imagery (daytime renders)
- Review-ready concept imagery (nighttime renders)
- Review website with client-consumable content
- Backup sketch/crayon package if final imagery incomplete

### Repository Storage Deliverables
- Proposal narrative and website copy
- Annotated reference imagery
- Generated concept imagery
- 3D assets and associated metadata
- JSON prompt files for image generation
- Revision notes and change logs

The design package should prioritize having a coherent review set available by the Friday noon milestone.

## GitHub Pages for Client Review

GitHub Pages can be configured from a **new or existing repository**, and GitHub allows the publishing source to come from a specific branch or from a `/docs` folder within a branch.[web:9][web:26]

For this project, GitHub Pages should be used as a lightweight review environment where the client can inspect narrative, imagery, and proposal-ready visuals without requiring access to the working directory.

Recommended setup:
1. Keep the production review site in either `/docs` or a dedicated `site/` build path that is published through a Pages-compatible workflow.[web:26]
2. Use GitHub repository settings to connect the publishing source when the review site is ready.[web:18][web:26]
3. Treat GitHub Pages as a client review surface, not as the only storage location for project assets.
4. Ensure that images and content shown to the client are drawn from approved outputs, not unstable experiments.

## Workflow for Documenting Design Changes in Git

Design changes should be committed in **small, logical units** rather than batched into large mixed commits. Small commits are easier to review and easier to revert when needed.[web:21][web:27]

Recommended commit workflow:
- One commit for a narrative update
- One commit for a new prompt set
- One commit for a new annotated photo batch
- One commit for a website review update
- One commit for a new approved render set

Commit messages should be consistent and descriptive. Good message patterns include:
- `docs: revise client needs v1.2 timeline and repository requirements`
- `design: adjust flat iron grouping language for site B`
- `assets: add annotated reference photos for northwest slab orientation`
- `site: publish client review page with updated proposal imagery`
- `prompts: archive old composition prompt and add new river-line variation`

Commit message bodies should explain **why** a change was made when the reason is not obvious from the diff alone. Keeping commits atomic and descriptive is a recognized best practice for maintaining understandable history.[web:21][web:24]

## Version Control for 3D Assets and Generated Files

Generated 3D assets, renders, large annotated imagery sets, and other binary outputs should be handled carefully because large binary files do not diff the same way text files do. Git LFS is specifically designed to manage large binary files by storing lightweight pointers in Git while keeping the file contents in a separate large-file storage system.[web:22][web:25]

Recommended policy:
- Use normal Git for text-based assets such as prompts, markdown, JSON metadata, HTML, CSS, and scripts.
- Use Git LFS for large binary assets such as high-resolution renders, 3D model files, texture sets, layered exports, and heavy annotated image batches when repository growth becomes an issue.[web:25]
- Pair every major generated asset with a metadata or note file describing source prompt, source image, date, status, and approval state.
- Do not overwrite approved outputs without preserving earlier versions.
- Use dated folders or revision tags for major review packages.

## Change Management

This project should maintain explicit change management so that design evolution is understandable over time.

At minimum, the workflow should include:
- A versioned client needs document
- A running changelog of major design decisions
- Commit-level documentation of narrative, design, and asset changes
- Archived prompts and prior review sets
- Clear labels for draft, internal review, client review, and approved outputs

Major design changes should be documented in both the commit history and a human-readable change note when they affect client-facing interpretation.

## Definition of Success

The project will be considered successful at this stage if the following conditions are met:
- A dedicated standalone GitHub repository exists at the specified location.
- The repository contains a clean structure supporting docs, prompts, references, outputs, and site review files.
- The client needs, narrative, and proposal language are aligned.
- The design direction is represented clearly enough for client review by the Friday noon milestone.
- A fallback sketch or simplified communication path exists if final imagery is delayed.
- Generated imagery and 3D-related outputs are version-controlled in a way that preserves rollback and review history.
- GitHub Pages or an equivalent review surface is ready or nearly ready for client-facing review.

## Working Notes

This document is intended to remain living and revision-friendly. It should continue to be updated as conversations refine spatial intent, material distinctions, color direction, prompt quality, proposal narrative, and delivery strategy.

The project is not treated as “final” at this stage; rather, it should be managed as a controlled iterative process with strong version history and the ability to roll back, compare, and improve.
