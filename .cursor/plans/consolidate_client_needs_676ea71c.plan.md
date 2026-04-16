---
name: Consolidate Client Needs
overview: Unify all transcript-derived client requirements into the existing v1.2 and v1.3 documents, add missing technical/design constraints, and produce a cleaner implementation-ready v1.4 planning pass with explicit verification and deliverable tracking.
todos:
  - id: extract-requirements
    content: Extract all transcript-derived client needs into a normalized requirement list.
    status: completed
  - id: parse-transcript-file
    content: Parse /Users/ojeromyo/Desktop/3d anna/plans/Transcript.md and map each actionable need into the requirement inventory.
    status: completed
isProject: false
---

# Anna Farm Full-Needs Consolidation Plan

## Goal
Create a complete, non-lossy update pass that captures every client need from the transcript and integrates it into both existing docs:
- [/Users/ojeromyo/Desktop/3d anna/plans/client-needs-v1.2.md](/Users/ojeromyo/Desktop/3d anna/plans/client-needs-v1.2.md)
- [/Users/ojeromyo/Desktop/3d anna/plans/client-needs-v1.3-internal-technical-spec.md](/Users/ojeromyo/Desktop/3d anna/plans/client-needs-v1.3-internal-technical-spec.md)

## Transcript Source of Truth
- Primary transcript to parse and include: [/Users/ojeromyo/Desktop/3d anna/plans/Transcript.md](/Users/ojeromyo/Desktop/3d anna/plans/Transcript.md)
- Requirement extraction must treat this transcript as mandatory input, not optional context.
- Every extracted need should retain traceability back to this transcript (quote, paraphrase, or section reference).

## What Must Be Added (Missing or Under-Specified)
- Site-B specificity: replace “single flat iron” language with flexible grouped formations (2/3/4) and explicitly mark this as a non-deterministic rule for all proposal copy.
- Directionality detail: encode “north from sidewalk axis, target northwest with stronger west bias” as a repeatable annotation + prompt standard.
- Material switch logic: add explicit “rock type switch” behavior (river cobble vs granite/river-line zones) and enforce semantic separation so output never collapses to generic “rock.”
- Composition notes from conversation: include cliff-wall/backdrop treatment and viewing-readability constraints as implementation cues.
- Technical runtime needs: add a concrete verification sequence for remote vision bridge, checkpoint validation, smoke tests, and UDF-trigger flow from MacBook to iMac (NixOS compute).
- Delivery urgency: preserve Friday-noon primary milestone with backup sketch path as a hard operational constraint.
- Commercial signal: record suggested +10% pricing consideration as business context (internal note, not mandatory client-facing commitment).

## Document Update Strategy
- Promote current docs to a new revision pass (v1.4 docs/spec pair) while retaining v1.2/v1.3 as frozen references.
- Keep `client-needs` client-facing language concise and narrative-friendly.
- Keep `internal-technical-spec` execution-heavy with strict acceptance criteria and verification checklist.
- Add a “Traceability Matrix” section mapping each transcript need to where it appears in docs, prompts, and outputs.

## Proposed File-Level Changes
- Update [/Users/ojeromyo/Desktop/3d anna/plans/client-needs-v1.2.md](/Users/ojeromyo/Desktop/3d anna/plans/client-needs-v1.2.md) with:
  - expanded Site-B design requirements,
  - non-deterministic wording rules/examples,
  - orientation annotation standard,
  - explicit fallback delivery pathway and timeline handling.
- Update [/Users/ojeromyo/Desktop/3d anna/plans/client-needs-v1.3-internal-technical-spec.md](/Users/ojeromyo/Desktop/3d anna/plans/client-needs-v1.3-internal-technical-spec.md) with:
  - end-to-end remote pipeline verification flow,
  - UDF invocation contract and expected outputs,
  - acceptance criteria per deliverable state,
  - transcript-to-requirement traceability section.
- Add optional companion markdown (if approved) under `plans/`:
  - `client-needs-traceability-v1.0.md` (source quote -> requirement -> artifact mapping).

## Acceptance Criteria for This Pass
- Every actionable client need in the transcript appears in at least one explicit requirement statement.
- No deterministic quantity promises remain for flat-iron formations.
- Orientation and material-switch rules are operationalized for both human review and model prompting.
- Vision pipeline has testable verification steps and pass/fail outputs.
- Friday-noon package readiness is measurable (primary + fallback).
- Revision history remains clear (what changed, why, and where).

## Execution Order
1. Parse [/Users/ojeromyo/Desktop/3d anna/plans/Transcript.md](/Users/ojeromyo/Desktop/3d anna/plans/Transcript.md) and extract all actionable client requirements.
2. Normalize transcript requirements into a canonical inventory grouped by design, materials, narrative/proposal language, technical pipeline, timeline, and delivery.
3. Patch client-needs doc for client-facing clarity and flexibility language.
4. Patch internal spec for technical execution, testing, and traceability.
5. Run consistency pass to ensure milestones, terminology, and deliverables match across both docs.
6. Produce final changelog entry summarizing the v1.4 consolidation.

## Risks to Manage
- Overly verbose docs that hide priorities; mitigate by separating client-facing vs internal-operational detail.
- Contradictory wording across documents; mitigate with a shared terminology block.
- Pipeline claims without test evidence; mitigate by explicit verification artifacts and pass/fail gates.