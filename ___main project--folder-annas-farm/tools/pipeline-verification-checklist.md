# NixOS Pixel Vision Pipeline — Verification Checklist

**Source:** Internal Tech Spec v1.4 §16.6–16.7
**Last updated:** 2026-04-15

---

## Prerequisites

- [ ] iMac is running NixOS
- [ ] MacBook is on the same network / has SSH access
- [ ] Vision model checkpoint is downloaded and accessible
- [ ] Pixeltable database is running

## Step 1: Runtime Initialization

```bash
# On iMac (NixOS):
# 1. Initialize the vision runtime
# 2. Verify checkpoint path
# 3. Confirm pixeltable connection

# Expected: runtime starts without error, checkpoint loads, DB responds to ping
```

- [ ] Vision runtime initializes without error
- [ ] Checkpoint path is valid: `____________` (fill in actual path)
- [ ] Pixeltable DB connection confirmed
- [ ] GPU is detected and available (if applicable)

## Step 2: Smoke Test

```bash
# Run smoke test with a known-good input image
# Input: any reference photo from reference/from_video/site1/
# Expected: segmentation mask output, bounding boxes detected
```

- [ ] Smoke test image selected: `____________`
- [ ] Segmentation output matches expected format (PNG mask + JSON metadata)
- [ ] Bounding box detection produces valid coordinates
- [ ] No CUDA/GPU memory errors

## Step 3: UDF Invocation Test

```bash
# From MacBook, trigger the UDF on iMac
# This tests the remote vision bridge
```

- [ ] MacBook → iMac bridge connection established
- [ ] UDF trigger sent from MacBook
- [ ] Response received within 5-minute timeout
- [ ] Status file generated (success/failure + details)

## Step 4: End-to-End Pipeline Test

```bash
# Full pipeline:
# Input: annotated reference photo + JSON prompt file
# Process: segmentation → rock type ID → directional parsing → generation
# Output: modified image + metadata JSON
```

- [ ] Input: `prompts/nano-banana/site1_02_after_day.json` + reference photo
- [ ] Segmentation completes
- [ ] Rock types correctly identified (boulders vs river cobbles vs river rock)
- [ ] Directional intent parsed (northwest orientation, more west than north)
- [ ] Generated image written to output directory
- [ ] Metadata JSON created with: source ref, prompt version, timestamp, pipeline version
- [ ] Output visually matches prompt intent
- [ ] Rock types preserved in output
- [ ] Orientation correct in output

## UDF Contract Summary

| Parameter | Value |
|-----------|-------|
| `source_image_path` | Path to annotated source image |
| `prompt_file_path` | Path to JSON prompt file |
| `output_directory` | Where to write generated outputs |
| `checkpoint_path` | Vision model checkpoint location |
| Timeout | 5 minutes per generation |
| Retry | 1 automatic retry on transient failure |
| Failure | Log and notify, do not block other work |

## Pass/Fail

- **PASS:** All four steps complete without error, output matches intent
- **FAIL:** Any step errors, output mismatches intent, or pipeline hangs

## Notes

_Record any issues, workarounds, or configuration changes below:_

---
