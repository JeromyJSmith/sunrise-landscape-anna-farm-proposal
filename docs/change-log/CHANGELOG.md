# Anna Farm Project Changelog

All notable changes to the Anna Farm Landscape Visualization project are documented here.

---

## [v1.5] - April 15, 2026

### Summary
Session 4 — Applied 10% pricing, language corrections, and prompt updates across the entire project tree. All HTML proposals, JSON prompts, brief.json, and documentation updated.

### Added
- Session 4 entry in `HANDOFF.md` with full change summary
- Contractor info in `brief.json`: Sunrise Landscape Co., William Held, 303-931-3760, willheld@aol.com
- Payment terms in `brief.json`: 10% deposit, 40% startup, 40% at 90%, 10% punch list
- Tax rate confirmed as 0 (no tax)

### Changed
- **10% price increase** applied to all line items in all 8 HTML proposals + `brief.json` + `proposal/index.html`:
  - Site 1 subtotal: $21,050 → $23,155
  - Site 2 subtotal: $12,450 → $13,695
  - Grand total: $33,500 → $36,850
- **Language corrections** in all HTML proposals:
  - "tilted sandstone slabs" → "tilted red flagstone slabs"
  - "A single Flatirons formation" → "A series of Flatirons-inspired groupings"
  - "a single focal cluster" → "a series of Flatirons-inspired groupings"
- **Nano-banana prompt fixes**:
  - `site1_04_dusk_lights.json`: "weathered sandstone" → "weathered Colorado moss-rock"
  - `site1_02_after_day.json`: removed deterministic "Six sandstone boulders" → "A series of Colorado moss-rock boulders"
  - `site2_02_after_day.json`: "sandstone boulders" → "Colorado moss-rock boulders", "single accent boulder" → "accent boulders"
- `README.md`: pricing table updated, contractor line added, status updated
- `OWNER_QUESTIONS.md`: contractor, tax, payment terms marked as resolved
- `DESKTOP_HANDOFF.md`: pricing references updated in both root and nested copies
- `site/` folder: all 4 proposal copies synced with latest SUNRISE-LANSCARPEW versions
- `files/annas-farm/` nested copies synced with root (HANDOFF.md, OWNER_QUESTIONS.md, README.md)

### Fixed
- Remaining "single focal cluster" in `SUNRISE-LANSCARPEW/annas-farm-proposal.html` line 724
- Stale pricing ($33,500) in `proposal/index.html`, `proposal/proposal.html`, and `files/` copies
- Stale nested documentation in `files/annas-farm/` (was 2 sessions behind)

---

## [v1.4] - April 15, 2026

### Summary
Full consolidation pass from transcript re-parse. All client needs extracted from the original conversation have been mapped to explicit requirements with traceability.

### Added

**New Documents**
- `client-needs-traceability-v1.0.md` — Complete requirement-to-source mapping with 76 individual requirements across 9 categories

**Client Needs Document (v1.4)**
- Site Specifications section with Site 1 (3,500 sq ft) and Site 2 (1,500 sq ft) details
- Lighting Requirements section (~10 solar lights per site, spotlight placement)
- Expanded orientation standard (north = sidewalk, prefer more west than north)
- Material corrections (Colorado Red flagstone, NOT Arizona sandstone)
- Non-deterministic language rules as system-wide policy
- Fallback delivery pathway (crayon sketch if renders incomplete)
- Reference to traceability matrix

**Internal Technical Spec (v1.4)**
- Section 16.6: Remote Vision Pipeline Verification (4-step verification sequence)
- Section 16.7: UDF Invocation Contract (input/output/timeout spec)
- Section 14.1: Acceptance Criteria Per Workflow State
- Section 14.2: State Transition Requirements table
- Section 19: Traceability (requirement source mapping)
- Section 7.5: Site Specifications
- Section 7.6: Lighting requirements
- Requirement ID cross-references throughout

### Changed

**Client Needs Document**
- Updated version from v1.2 to v1.4
- Timeline clarified to "Friday by 12:00 PM (noon)—not last minute"
- Deliverables section split into "Required by Friday Noon" and "Repository Storage"
- Reference photography section expanded with interpretation rules
- AI Vision section expanded with remote execution architecture details

**Internal Technical Spec**
- Updated version from v1.3 to v1.4
- All version references updated to v1.4
- Design Requirements Translation section expanded with explicit requirement IDs
- Material semantics section includes approved Colorado materials list
- Explicit Arizona/Phoenix removal instruction

### Fixed
- Removed ambiguous "single flat iron" language
- Clarified orientation as northwest with stronger west bias
- Consistent Friday noon deadline across all documents
- Consistent deliverables list across documents

### Traceability

All requirements are now mapped in `client-needs-traceability-v1.0.md`:

| Category | ID Range | Count |
|----------|----------|-------|
| Design Configuration | DES-001 to DES-011 | 11 |
| Materials | MAT-001 to MAT-012 | 12 |
| Site Specifications | SITE-001 to SITE-008 | 8 |
| Lighting | LIGHT-001 to LIGHT-005 | 5 |
| Reference Photography | REF-001 to REF-005 | 5 |
| Technical Pipeline | TECH-001 to TECH-014 | 14 |
| Narrative/Proposal | NARR-001 to NARR-005 | 5 |
| Timeline/Delivery | TIME-001 to TIME-004 | 4 |
| Business/Commercial | BIZ-001 to BIZ-012 | 12 |

---

## [v1.3] - April 15, 2026

### Added
- Internal technical specification document created
- Repository structure definition
- Commit conventions and change management workflow
- Test and verification plan
- Immediate action plan with 15 steps

---

## [v1.2] - April 15, 2026

### Added
- Repository initialization requirement
- Formal specification structure
- GitHub Pages guidance for client review
- Best practices for landscape design repository
- Version control for 3D assets guidance

---

## [v1.1] - April 15, 2026

### Added
- Expanded project needs document
- Spatial design requirements
- Material requirements
- Reference photography requirements
- AI Vision workflow requirements

---

## [v1.0] - April 15, 2026

### Added
- Initial extraction of client needs from transcript
- Basic project purpose and design intent
