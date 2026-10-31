# Handoff: Generate High-Fidelity Educational GIFs

## Goal
Replace the low-quality educational GIFs with crisp, high-resolution animations (MP4/WebM or VHS/SVG) that explain Bumperfort's core concepts: zero-copy FFI, pure physics kernels, coarray parallelism, TILT safety.

## Required Deliverables
1. 5 animations, one per concept:
   - `01_launch_chute` — FFI / zero-copy entry (Fortran ↔ C/Rust)
   - `02_bumpers_physics` — pure kernels (cosine similarity, batch)
   - `03_multiball_coarrays` — coarray parallel distribution
   - `04_tilt_monitor` — hardware safety / TILT
   - `05_full_flow` — full data-flow overview
2. Each animation must use high-contrast terminal theme, large font (≥14pt), 80x24 or 120x30 terminal, 3–5s pauses on key outputs.
3. Package all into `bumperfort-educational-gifs.zip` on the desktop.

## Gemini Prompt (paste into Gemini)

Generate 5 high-resolution terminal animations for the Bumperfort Fortran engine. Use VHS (Charmbracelet) tape scripts or MP4/WebM. Show real CLI output with 3-5s pauses. Terminal: 120x30, Dracula theme, 16pt font. Output files named 01_launch_chute.gif ... 05_full_flow.gif. Package into a zip named bumperfort-educational-gifs.zip and place on ~/Desktop.

## Integration (after download)
```bash
cd /path/to/bumperfort
mkdir -p docs/images/gifs
unzip ~/Downloads/bumperfort-educational-gifs.zip -d docs/images/gifs/
git add docs/images/gifs/
git commit -m "docs: high-fidelity educational GIFs"
git push
```
