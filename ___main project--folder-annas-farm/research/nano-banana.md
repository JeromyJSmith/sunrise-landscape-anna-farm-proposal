# Research — Nano Banana (Gemini 2.5 Flash Image) prompting

**Model:** Gemini 2.5 Flash Image, codenamed "nano-banana", released 2025-08-26.
**Pricing:** ≈ $0.039/image (1,290 output tokens).
**Official docs:** https://ai.google.dev/gemini-api/docs/image-generation

## Core rule (quoted from Google)

> "Describe the scene, don't just list keywords. The model's core strength is its deep language understanding."

**Canonical photorealistic template:**
> A photorealistic [shot type] of [subject], [action or expression], set in [environment]. The scene is illuminated by [lighting description], creating a [mood] atmosphere. Captured with a [camera/lens details], emphasizing [key textures and details].

## API fields that matter

| Field | Values | Notes |
|-------|--------|-------|
| `image_config.aspect_ratio` | `1:1, 2:3, 3:2, 3:4, 4:3, 4:5, 5:4, 9:16, 16:9, 21:9, 1:4, 4:1, 1:8, 8:1` | Preferred: `3:2` or `16:9` for wide landscape hero shots. |
| `resolution` | `512, 1K, 2K, 4K` | Use `2K` for proposal hero shots, `1K` for iteration. |
| Reference images | Up to 14 | Use for subject/brand consistency and multi-photo fusion. |
| Transparency | Not supported — generates white. | Composite downstream if needed. |
| Negative prompt | **Not an official API field.** | Use natural-language exclusions ("no people, no signage") or a wrapper `quality.avoid` array flattened to prose before sending. |

## Strengths
- Character / subject / material consistency across edits (critical for before/after mockup pairs).
- Multi-image fusion (blend reference swatches, people, backgrounds).
- Natural-language editing: "replace the ground material with the attached sample."
- Low latency, high world knowledge.

## Failure modes
- **Style drift** in long multi-turn edit chains → reset the session and re-paste the winning prompt verbatim.
- Inconsistent text rendering.
- Sporadic 500 / 429 under sequential load.
- No transparent backgrounds.
- Weak counterfactual reasoning.

## Before/after pair pattern (critical for this project)

1. Use `task: "edit_image"` with the site photo as an `input`.
2. Keep a stable `consistency_id` across all shots for the same site.
3. **Keep the `camera` block identical** across before/after — lens, height, framing, aperture.
4. Vary only `scene.time`, `materials`, `lighting.color_temperature_k`, and `quality.include/avoid`.
5. Reset the chat session for each new site to avoid drift.

## Referenced schemas (three patterns, all credible)

| Pattern | Fields | Use when |
|--------|--------|----------|
| **Ewerlöf** (gist) | meta / subject / scene / technical / composition / text / advanced, explicit `negative_prompt` array, `film_stock`, `aperture`, `camera_model`, `time` (golden_hour/blue_hour), `weather` | Narrative photographic thinking |
| **Mindbees 2025** | `task, inputs, style, technical, environment, composition, quality.include/avoid, output_format` | Agent-friendly, wrapper-flattenable |
| **Reproducible-Photorealistic-NB-Pro** | `image_prompt: {subject, attire, environment, technical_specs}` + sibling `positive_prompt` / `negative_prompt` | Reproducibility-focused |

**Choice for Anna's Farm:** Hybrid of Mindbees + Ewerlöf — structured enough for programmatic generation, explicit enough for landscape materials.

## Open-source resources

- [google-gemini/nano-banana-hackathon-kit](https://github.com/google-gemini/nano-banana-hackathon-kit) — official Python/JS starter.
- [GitHub30/Reproducible-Photorealistic-Nano-Banana-Pro-JSON-Prompts](https://github.com/GitHub30/Reproducible-Photorealistic-Nano-Banana-Pro-JSON-Prompts) — reproducible JSON templates.
- [YouMind-OpenLab/awesome-nano-banana-pro-prompts](https://github.com/YouMind-OpenLab/awesome-nano-banana-pro-prompts) — 10,000+ prompts.
- [alexewerlof gist — structured JSON schema](https://gist.github.com/alexewerlof/1d13401a7647339469141dc2960e66a9).
- [kousen gist — Claude Code skill for NB prompts](https://gist.github.com/kousen/f7c66a70cefe90b12c8b5285688a0016).

## Primary sources

- [Nano Banana image generation — ai.google.dev](https://ai.google.dev/gemini-api/docs/image-generation)
- [Gemini 2.5 Flash Image model card](https://ai.google.dev/gemini-api/docs/models/gemini-2.5-flash-image)
- [Introducing Gemini 2.5 Flash Image — Google Developers Blog](https://developers.googleblog.com/en/introducing-gemini-2-5-flash-image/)
- [Ultimate prompting guide for Nano Banana — Google Cloud](https://cloud.google.com/blog/products/ai-machine-learning/ultimate-prompting-guide-for-nano-banana)
- [Mindbees — JSON Prompts for Nano Banana 2025](https://www.mindbees.com/blog/json-prompts-gemini-nano-banana-guide-2025/)
- [Nano Banana for Architects — MyArchitectAI](https://www.myarchitectai.com/blog/nano-banana-for-architects)
