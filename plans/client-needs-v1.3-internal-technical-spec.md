# Anna Farm Internal Technical Spec v1.4

**Project:** Anna Farm Landscape Visualization, Proposal Support, and Review Delivery  
**Spec Type:** Internal technical specification  
**Local Repository Root:** `/Users/ojeromyo/Desktop/3d anna`  
**Status:** Active working spec — consolidated from transcript  
**Prepared:** April 15, 2026  
**Updated:** April 15, 2026  
**Primary Delivery Milestone:** Friday by 12:00 PM (noon)—not last minute  
**Fallback Delivery Mode:** Crayon sketch package if final imagery is not ready by milestone  
**Traceability:** See [client-needs-traceability-v1.0.md](./client-needs-traceability-v1.0.md) for requirement-to-source mapping

## 1. Purpose

This document defines the internal technical specification for building, organizing, versioning, and operating the Anna Farm landscape visualization project. It translates client design intent into an executable internal workflow covering repository setup, documentation structure, prompt management, annotated image processing, website review delivery, and asset version control.

The purpose of this spec is to ensure that the project can move from informal conversation and iterative design exploration into a controlled, reproducible, reviewable production workflow. The system must support rapid iteration without sacrificing rollback safety, traceability, or review readiness.

## 2. Objectives

### 2.1 Primary objectives

- Establish a standalone repository dedicated to the Anna Farm project.
- Support design iteration for landscape composition, narrative, and proposal imagery.
- Preserve full revision history for documents, prompts, annotations, website assets, and generated outputs.
- Prepare a client-reviewable web surface that can be published through GitHub Pages.
- Maintain a backup review pathway if final rendered imagery is not complete by the target deadline.

### 2.2 Operational objectives

- Convert discussion-derived design intent into explicit technical artifacts.
- Keep source photography, annotations, prompts, outputs, and public review assets separate but linked.
- Ensure every major output can be traced back to source images, prompt versions, and review stage.
- Minimize coupling between this client project and the user's broader main project environment.

## 3. Scope

### 3.1 In scope

- Repository initialization and structure
- Versioned documentation
- Prompt and annotation workflow
- Design narrative and proposal coordination
- Review website setup and publishing path
- Asset management for generated imagery and 3D-related files
- Commit conventions and change management
- Timeline management for Friday milestone delivery

### 3.2 Out of scope

- Final construction documentation
- Procurement or exact stone sourcing decisions
- Full production-grade 3D engine implementation details beyond what is required for review deliverables
- Long-term hosting architecture beyond GitHub Pages review use

## 4. Repository Initialization

A brand new GitHub repository must be created specifically for this project. This repository is the authoritative project container for version control, website hosting, prompt management, deliverables, and historical rollback.[web:3][web:9]

The repository must be rooted locally at:

`/Users/ojeromyo/Desktop/3d anna`

If the folder already exists, it must be initialized locally with Git and connected to a newly created GitHub remote. Git supports initializing an existing folder, and GitHub supports using a newly created repository as the canonical remote for that folder.[web:3][web:8]

This repository must remain separate from the main project repository to avoid cross-project coupling, accidental asset contamination, and unclear version boundaries.

## 5. Repository Architecture

### 5.1 Required structure

```text
3d-anna/
├── README.md
├── docs/
│   ├── client-needs/
│   ├── proposal/
│   ├── narrative/
│   ├── meeting-notes/
│   ├── technical-spec/
│   └── change-log/
├── references/
│   ├── source-photos/
│   ├── annotated-photos/
│   ├── precedent-images/
│   └── materials/
├── prompts/
│   ├── image-generation/
│   ├── segmentation/
│   ├── 3d-layout/
│   ├── review-prompts/
│   └── archived/
├── outputs/
│   ├── renders/
│   ├── proposal-graphics/
│   ├── review-sets/
│   ├── sketches/
│   └── exports/
├── models/
│   ├── 3d/
│   ├── textures/
│   ├── scene-config/
│   └── metadata/
├── site/
│   ├── index.html
│   ├── assets/
│   ├── css/
│   ├── js/
│   └── review/
└── .github/
    └── workflows/
```

### 5.2 Structural rules

- `docs/` stores written project records and must not be mixed with generated site assets.
- `references/` stores source and annotated imagery used to derive design outputs.
- `prompts/` stores prompts as versioned artifacts, not disposable chat residue.
- `outputs/` stores generated and review-ready artifacts.
- `models/` stores 3D-related assets and metadata.
- `site/` stores the client-facing review surface.
- `.github/workflows/` stores optional deployment or validation automations.

## 6. Documentation System

### 6.1 Versioned documentation

The project must maintain versioned internal documentation. At minimum, the following documents are required:

- Client needs document
- Internal technical specification
- Proposal narrative draft
- Review milestone notes
- Change log

Each versioned document should include:
- Version identifier
- Date
- Status
- Change summary
- Intended audience, if applicable

### 6.2 Documentation principles

A technical specification should define the problem, scope, solution, risks, and test plan so that implementation can be executed consistently.[web:33][web:36]

Therefore, all internal docs should be written to support execution, not only description. Where possible, each section should answer one of the following:
- What is being built?
- Why is it being built?
- What inputs does it depend on?
- What outputs must it produce?
- How will it be tested?
- How will failure be handled?

## 7. Design Requirements Translation

### 7.1 Flat iron configuration

The design system must support grouped flat iron slab configurations rather than a single fixed stone element. Acceptable grouping logic currently includes sets of 2, 3, or 4 slabs, with composition adapted to material size, visual balance, and site fit.

**Related requirements:** DES-001, DES-002, DES-003, DES-004

### 7.2 Directionality

The composition must preserve a northwest directional bias, with practical interpretation leaning slightly more west than north relative to the site sidewalk axis.

**Orientation Standard (from transcript):**
- North axis = sidewalk direction
- West axis = perpendicular to sidewalk, toward mountains
- Target = northwest, but with stronger west component
- Visual intent: slabs appear to face toward mountain context

**Annotation requirements:**
- Compass overlays showing N and W
- Target vector showing desired NW direction
- Yellow/highlighted markers for direction suggestions

All prompts, annotations, overlays, and review imagery must preserve this directional intent consistently.

**Related requirements:** DES-005, DES-006, DES-007, DES-008

### 7.3 Material semantics

The workflow must preserve distinctions among flat iron slabs, boulders, river cobbles, river rock, and transition materials such as granite. No pipeline stage should collapse these into a generic rock class if that removes meaningful design intent.

**Approved materials (Colorado-sourced only):**
- Colorado red flagstone (NOT Arizona sandstone)
- Colorado red strip stone
- Native granite
- River boulders
- River cobbles
- River rock
- Decorative rock (creek/riverbed representation)

**Explicit correction:** Remove all references to Arizona sandstone, Phoenix, or any non-Colorado materials.

**Related requirements:** MAT-001 through MAT-012

### 7.4 Proposal flexibility

Narrative and proposal materials must avoid overcommitting to exact quantities or exact stone arrangements. Internal documentation should preserve the intended openness so the project can adapt to field conditions without appearing inconsistent.

**This is a system-wide rule** — apply to all projects, not just this one.

**Related requirements:** NARR-001 through NARR-005

### 7.5 Site Specifications

**Site 1 (Large Site):**
- 3,500 sq ft weed fabric mat
- Extend bed to sidewalk edge

**Site 2 (Smaller Site):**
- 1,500 sq ft weed fabric mat

**Both sites:**
- Location: Anna's Farm HOA, Colorado
- Identify by GPS coordinates (not street address)
- Prairie dog activity is a constraint (avoid mulch if possible)

**Related requirements:** SITE-001 through SITE-008

### 7.6 Lighting

- ~10 solar lights per site (20 total)
- Spotlights on: strip stone cliff walls, flat iron formations, boulder formations
- Generate both daytime and nighttime renders

**Related requirements:** LIGHT-001 through LIGHT-005

## 8. Image Annotation and Prompt Pipeline

### 8.1 Source inputs

The pipeline depends on:
- Existing site photos
- Additional reference photography
- Annotated images with semantic labels
- Prompt files describing composition and intended changes

### 8.2 Annotation requirements

Annotated images should identify:
- Flat iron grouping regions
- Rock type switch zones
- River-line material paths
- Directional overlays for north, west, and target northwest angle
- Any regions to be preserved or modified

### 8.3 Prompt requirements

Prompt files must be stored as text artifacts inside the repository. Prompts should not exist only in transient chat logs.

Each prompt file should include:
- Prompt name or ID
- Date
- Source image reference
- Intended output type
- Revision notes
- Approval state if applicable

### 8.4 Prompt archival

When a prompt is superseded, it must be archived rather than overwritten silently. The project must preserve prior prompt versions for rollback and comparison.

## 9. Website Review Surface

### 9.1 Purpose

The website is not the master repository of the project; it is the review-facing presentation layer. Its purpose is to let the client inspect the latest narrative, imagery, and proposal-support materials in a controlled, lightweight format.

### 9.2 Publishing model

GitHub Pages can publish from a specific branch and either the repository root or a `/docs` folder on that branch, or it can be published through a GitHub Actions workflow.[web:26]

This project should use one of the following approaches:
- `site/` built into a publishable branch root for simple deployment
- `/docs` as publish source if documentation-style site structure is preferred
- GitHub Actions deployment if a build step becomes necessary

### 9.3 Review constraints

Only approved or review-ready content should appear on the client-facing site. Experimental assets, unstable prompts, and internal-only diagnostic material should remain outside the published review surface.

## 10. Deliverables

### 10.1 Required deliverables

By the Friday review milestone, the project should aim to produce:
- Updated client needs document
- Internal technical specification
- Proposal narrative or narrative-ready material
- Annotated imagery set
- Review-ready concept imagery
- Review website with client-consumable content
- Backup sketch-based review package if final imagery is incomplete

### 10.2 Optional deliverables

- 3D scene previews
- Expanded proposal graphics
- Material comparison boards
- Alternate composition variations

## 11. Change Management Workflow

### 11.1 Commit granularity

Commits must be small, logical, and scoped to one change category whenever practical. Small commits are easier to review and easier to revert than large mixed commits.[web:21][web:24]

Preferred commit categories include:
- `docs:` for documentation changes
- `design:` for composition or narrative changes
- `prompts:` for prompt additions or revisions
- `assets:` for reference imagery or annotated files
- `site:` for review website changes
- `output:` for approved rendered deliverables
- `infra:` for repo, workflow, or automation changes

### 11.2 Commit message format

Recommended format:

```text
<type>: <short summary>

Optional body:
- Why the change was made
- What dependency or review need triggered it
- Any follow-up required
```

Examples:
- `docs: create internal technical spec v1.4`
- `design: revise site B flat iron grouping language`
- `prompts: add northwest orientation prompt set`
- `assets: add rock type switch annotations for review batch`
- `site: publish Friday review imagery set`

### 11.3 Human-readable change log

In addition to Git history, maintain a human-readable change log in `docs/change-log/` for major client-facing design shifts. This is required when a change materially affects narrative interpretation, review content, or milestone readiness.

## 12. Asset Version Control Policy

### 12.1 Text assets

Use standard Git tracking for:
- Markdown files
- HTML/CSS/JS
- JSON/YAML metadata
- Prompt files
- Notes and structured config

### 12.2 Large binary assets

Large renders, annotated image batches, textures, 3D model files, and other heavy binary assets should use Git LFS when repository growth or clone size becomes problematic. Git LFS works by storing a pointer in Git while the file content is stored in large-file storage.[web:25][web:40]

### 12.3 Binary asset policy

- Do not repeatedly overwrite the same binary asset filename without version semantics.
- Use versioned naming, dated folders, or review-batch folders.
- Pair major outputs with metadata files describing source prompt, source image, date, and approval state.
- Separate approved outputs from experimental generations.

## 13. Naming Conventions

### 13.1 File naming

Use descriptive, machine-sortable names. Recommended pattern:

```text
YYYY-MM-DD_<site-or-area>_<view-or-purpose>_vNN.ext
```

Examples:
- `2026-04-15_site-b_northwest-flatirons_v01.png`
- `2026-04-15_site-b_annotation-rock-switch_v02.jpg`
- `2026-04-15_proposal-narrative_v03.md`

### 13.2 Prompt naming

Prompt files should encode:
- Date
- Intent
- Region or site area
- Revision number

Example:
- `2026-04-15_site-b_nw-grouping_prompt_v02.md`

## 14. Workflow States

Each major asset should be assigned one of the following workflow states:
- Draft
- Internal review
- Client review
- Approved
- Archived

This state may be represented in the filename, metadata file, or containing folder.

### 14.1 Acceptance Criteria Per State

**Draft**
- Asset exists in repository
- Basic structure/format is correct
- May contain placeholders or incomplete sections
- NOT ready for any review

**Internal Review**
- All content complete (no placeholders)
- Follows naming conventions
- Passes automated validation (if applicable)
- Technical accuracy verified
- Ready for team review before client exposure

**Client Review**
- Passed internal review
- Narrative and imagery aligned
- Non-deterministic language verified (no exact quantity promises)
- Orientation and material specifications correct
- Visual quality acceptable for client presentation
- Published to review surface (GitHub Pages or equivalent)

**Approved**
- Client feedback incorporated (if any)
- Final verification complete
- Locked from further modification without new version
- Archived copy made before any future changes

**Archived**
- Superseded by newer version
- Retained for rollback capability
- Clearly labeled with archive date and reason
- Not displayed on client review surface

### 14.2 State Transition Requirements

| From | To | Required Action |
|------|-----|-----------------|
| Draft | Internal Review | Complete all content, pass format validation |
| Internal Review | Client Review | Team sign-off, publish to review surface |
| Client Review | Approved | Client acceptance (explicit or implicit) |
| Any | Archived | New version created, old version preserved |
| Archived | Any | Not allowed—create new version instead |

## 15. Risks and Constraints

### 15.1 Schedule risk

The major schedule constraint is the Friday noon target. If imagery is not sufficiently developed by then, the fallback sketch-based package must be prepared.

### 15.2 Design drift risk

Because the workflow is iterative and uses AI-assisted generation, there is risk that image outputs diverge from intended narrative or site logic. This must be controlled through annotation discipline, prompt versioning, and internal review before publication.

### 15.3 Repository bloat risk

High-resolution images and generated 3D files can rapidly enlarge the repository. This risk should be mitigated with Git LFS, structured archival, and approval-based promotion of assets.[web:22][web:25]

### 15.4 Publishing risk

If internal-only material is mixed into the published branch or docs source, the client review site may expose unfinished work. Publishing boundaries must therefore be explicit.[web:26]

## 16. Test and Verification Plan

A technical specification should include a test plan so the team can verify that requirements are met and failures are detectable.[web:33]

### 16.1 Repository verification

Verify:
- Repository exists on GitHub
- Local root matches `/Users/ojeromyo/Desktop/3d anna`
- Remote is configured correctly
- Base folder structure exists

### 16.2 Documentation verification

Verify:
- Client needs and technical spec are versioned and present
- Change log exists
- Proposal narrative exists or has an active placeholder

### 16.3 Prompt and asset verification

Verify:
- Prompt files are stored in repo
- Annotated images are organized and labeled
- Outputs are separated into review-ready vs experimental
- Large binary asset policy is being followed

### 16.4 Review site verification

Verify:
- Review site renders locally
- Published source path is configured correctly if using Pages
- Only approved content appears in published output
- Links and images resolve correctly

### 16.5 Milestone verification

By Friday noon, verify:
- A coherent review package exists
- Narrative and imagery are aligned
- Backup sketch path exists if final renders are incomplete

### 16.6 Remote Vision Pipeline Verification

The vision pipeline must pass the following verification sequence before production use:

**Step 1: Runtime Initialization**
- Initialize vision runtime on iMac (NixOS)
- Verify checkpoint path is valid and accessible
- Confirm pixel table database connection

**Step 2: Smoke Test**
- Run smoke test with known-good input image
- Verify segmentation output matches expected format
- Confirm bounding box detection works

**Step 3: UDF Invocation Test**
- Trigger UDF from MacBook to iMac
- Verify remote bridge connection established
- Confirm response received within expected timeout

**Step 4: End-to-End Pipeline Test**
- Input: Annotated reference photo + JSON prompt
- Process: Segmentation, rock type identification, directional intent parsing
- Output: Generated image with modifications applied
- Verify: Output matches prompt intent, rock types preserved, orientation correct

**Pass/Fail Criteria:**
- PASS: All four steps complete without error, output matches intent
- FAIL: Any step errors, output mismatches intent, or pipeline hangs

### 16.7 UDF Invocation Contract

The User-Defined Function (UDF) for remote pipeline invocation must implement:

**Input Parameters:**
- `source_image_path`: Path to annotated source image
- `prompt_file_path`: Path to JSON prompt file
- `output_directory`: Where to write generated outputs
- `checkpoint_path`: Vision model checkpoint location

**Expected Outputs:**
- Generated image file(s) in specified output directory
- Metadata JSON with: source reference, prompt version, timestamp, pipeline version
- Status file indicating success/failure with any error details

**Invocation Method:**
- Trigger from MacBook (orchestration layer)
- Execute on iMac NixOS (compute layer)
- Communication via remote vision bridge

**Timeout/Retry:**
- Default timeout: 5 minutes per generation
- Retry policy: 1 automatic retry on transient failure
- Failure escalation: Log and notify, do not block other work

## 17. Immediate Action Plan

1. Create the standalone GitHub repository and connect the local folder.[web:3][web:8]
2. Create the base repository structure.
3. Move the current client needs file into `docs/client-needs/`.
4. Save this v1.4 internal technical spec into `docs/technical-spec/`.
5. Create or update proposal narrative docs in `docs/proposal/` or `docs/narrative/`.
6. Organize reference and annotated imagery into `references/`.
7. Save all active prompts into `prompts/` with clear versioning.
8. Build the client review surface in `site/`.
9. Define which assets are approved for Friday review.
10. Prepare fallback sketch package in parallel so delivery does not depend entirely on final rendered output.

## 18. Definition of Success

This v1.4 internal technical specification is successful if it enables the project to operate as a structured system rather than an ad hoc collection of files and conversations.

Operational success at this phase means:
- The Anna Farm project is isolated in its own repository.
- Documents, prompts, references, outputs, and site assets are organized predictably.
- The Friday milestone can be met with either rendered review materials or a fallback sketch package.
- All major files can be versioned, compared, and rolled back.
- The client review site can be published cleanly without exposing unstable internal material.
- Remote vision pipeline passes verification and UDF is invocable from MacBook.
- All transcript-derived requirements are traceable to explicit artifacts.

## 19. Traceability

### 19.1 Requirement Traceability

All requirements in this specification must be traceable to their source. The primary sources are:

1. **Transcript** — [Transcript.md](./Transcript.md)
2. **Traceability Matrix** — [client-needs-traceability-v1.0.md](./client-needs-traceability-v1.0.md)
3. **Client Needs Document** — [client-needs-v1.2.md](./client-needs-v1.2.md) (updated to v1.4 in place)

### 19.2 Traceability Matrix Reference

The traceability matrix maps each requirement to:
- **Source quote/paraphrase** from transcript
- **Requirement ID** (e.g., DES-001, MAT-005, TECH-008)
- **Status** (Active, Deferred, Completed)
- **Implementing artifact** (document, prompt, output, or code)

### 19.3 Key Requirement Categories

| Category | ID Prefix | Count | Source Section |
|----------|-----------|-------|----------------|
| Design Configuration | DES-xxx | 11 | Traceability §1 |
| Materials | MAT-xxx | 12 | Traceability §2 |
| Site Specifications | SITE-xxx | 8 | Traceability §3 |
| Lighting | LIGHT-xxx | 5 | Traceability §4 |
| Reference Photography | REF-xxx | 5 | Traceability §5 |
| Technical Pipeline | TECH-xxx | 14 | Traceability §6 |
| Narrative/Proposal | NARR-xxx | 5 | Traceability §7 |
| Timeline/Delivery | TIME-xxx | 4 | Traceability §8 |
| Business/Commercial | BIZ-xxx | 12 | Traceability §9 |

### 19.4 Verification of Traceability

Before marking any deliverable as complete, verify:
- All relevant requirement IDs are addressed
- No requirement is orphaned (exists in matrix but not implemented)
- No implementation is orphaned (exists but not linked to requirement)

