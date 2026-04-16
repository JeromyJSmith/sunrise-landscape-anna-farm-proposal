# Research — Veo 3 / Veo 3.1 prompting

**Model:** Google DeepMind Veo 3 (and Veo 3.1 on Vertex AI).
**Official docs:** https://deepmind.google/models/veo/prompt-guide/ + https://docs.cloud.google.com/vertex-ai/generative-ai/docs/video/video-gen-prompt-guide

## Official prompt fields

**subject, context, action, style, camera, composition, ambiance, lighting, audio.**

Start the prompt by declaring video type (`realistic`, `animated`, `stop-motion`). Cinematic vocabulary ("eye level," "dolly shot," "shallow depth of field," "cool blue tones") measurably improves adherence.

## Native audio — dual-stream

- Video and audio render simultaneously and auto-align (lip-sync + scene-matched foley).
- **Audio is NOT inferred** — you must explicitly prompt for it.
- Convention: quoted strings for dialogue, explicit SFX phrases, separate `ambient` line.
- Dialogue ≤ 8s, one speaker at a time.
- Example phrasing: `"soft desert wind, distant mourning dove"` / `"A warm cinematic swell, minimal strings."`

## Output parameters (Vertex AI)

| Field | Values |
|-------|--------|
| Duration | 4, 6, or 8 seconds (default 8). **8s is the practitioner sweet spot.** |
| Aspect ratio | `16:9` or `9:16` only |
| Resolution | `720p`, `1080p`, `4k` (Veo 3 only) |
| API params | `aspectRatio, negativePrompt, personGeneration, resolution, sampleCount, seed` |

## Camera motion vocabulary Veo 3 recognizes

`dolly in/out`, `slow dolly`, `tracking shot`, `follow shot`, `crane shot`, `aerial view`, `drone shot`, `bird's-eye view`, `worm's-eye view`, `orbit shot`, `fly-through`, `push-in`, `pan`, `slow pan`, `tilt`, `POV`, `handheld`, `gimbal`.

**Default when unspecified: static or subtle handheld.** For architectural walkthroughs, always explicitly state the motion.

## First-frame / last-frame conditioning (key for before/after)

Veo 3.1 on Vertex AI accepts a **Start** image (first frame) and an optional **End** image (last frame). Veo generates in-between motion + matching audio. Also supports **subject reference images** (up to 3). **This is the mechanism for the before→after transformation video.**

- [First/last frame docs](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/video/generate-videos-from-first-and-last-frames)
- [Reference image docs](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/video/use-reference-images-to-guide-video-generation)

## Strengths for exteriors
- Cinematic atmosphere + synchronized ambient foley.
- Smooth first→last-frame transitions.
- Strong prompt adherence in Veo 3.1.
- Explicitly recommended for architectural / spatial storytelling.

## Failure modes
- Piling too many objects + actions + style refs → model confusion.
- No motion specified → static/handheld default.
- **Character / material consistency across clips is brittle** → use reference images or first/last-frame anchors.
- **8-second cap** → multi-clip stitching for anything longer.

## Open-source JSON templates

- [snubroot/Veo-JSON](https://github.com/snubroot/Veo-JSON) — universal meta-prompt generator, nested schema.
- [snubroot/Veo-3-Prompting-Guide](https://github.com/snubroot/Veo-3-Prompting-Guide).
- [shijincai/veo3-prompt-generator](https://github.com/shijincai/veo3-prompt-generator) — style presets, JSON/Markdown export.
- [aliswl20/Veo-3-Json-Prompt-](https://github.com/aliswl20/Veo-3-Json-Prompt-) — cinematic JSON collection.

## Primary sources

- [DeepMind Veo 3 prompt guide](https://deepmind.google/models/veo/prompt-guide/)
- [Google Cloud — Ultimate Veo 3.1 prompting guide](https://cloud.google.com/blog/products/ai-machine-learning/ultimate-prompting-guide-for-veo-3-1)
- [Vertex AI video-gen prompt guide](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/video/video-gen-prompt-guide)
- [Gemini API Veo 3.1 docs](https://ai.google.dev/gemini-api/docs/video)
- [illustrarch — Veo 3 for architecture](https://illustrarch.com/artificial-intelligence/65697-veo-3-for-architecture-free-prompts-how-to-master-visual-design-videos.html)
