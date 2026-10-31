# Handoff

HANDOFF: BumperFort (hamanakam1/bumperfort)

You are continuing development of BumperFort – a Modern Fortran (2018/2023) high-velocity vector physics engine that acts as a local-first physics coprocessor for an AI software factory.

Core metaphor: arcade pinball
- Launch Chute = zero-copy FFI (ISO_C_BINDING)
- Bumpers = pure SIMD cosine / dot / norm kernels
- Multi-Ball = coarrays
- TILT = hardware telemetry safety monitor
- Score = results returned to orchestrator / pgvector

Current state:
- precision_mod, physics_mod (with fused + blocked kernels), ffi_mod, basic coarray_mod exist
- fpm.toml is set up
- Goal: complete a clean v0.1 that builds, tests, and exposes a stable C ABI

Immediate next tasks (pick one and execute):
1. Finish telemetry_mod + integrate TILT into a demo
2. Add index_mod with simple top-k selection
3. Write the C header (bindings/bumperfort.h) + Python ctypes wrapper
4. Create GitHub Actions CI (gfortran + ifx matrix)
5. Flesh out docs/architecture.md and docs/roadmap.md
6. Add a realistic benchmark (batch cosine on 1536-dim vectors)

Rules:
- Keep everything pure / side-effect free in numerical kernels
- Prefer assumed-shape + contiguous
- Zero external dependencies for v0.1
- Maintain the pinball metaphor in comments and docs
- Local-first only

Start by reading the existing src/ files and the handoff document in docs/handoff.md, then propose the next concrete commit.
