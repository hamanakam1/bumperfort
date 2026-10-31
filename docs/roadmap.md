# Roadmap

## Horizon 0 — Foundation (v0.1 – v0.3) · Now → Q1 2027
- Stable C ABI (`bumper_cosine`, `bumper_batch_cosine`, version, basic top-k).
- Pure Fortran kernels with fused and blocked variants.
- Single-image TILT monitor with configurable thresholds.
- fpm-native build, tests, minimal Python ctypes binding.
- CI matrix: gfortran + ifx (Linux), gfortran (macOS).
- Documentation that makes the pinball metaphor and zero-copy rules unambiguous.

Success metric: a Python orchestrator can call BumperFort on 1536-dim vectors with zero copies and measurable speedup over pure NumPy on the same machine.

## Horizon 1 — Production Local Kernel (v0.4 – v1.0) · 2027
- Full coarray TILT with teams and events.
- `index_mod`: exact top-k, blocked/brute-force with early exit, coarse quantizer.
- Memory-mapped document matrix support.
- Thread-safe shared-library mode (OpenMP isolated from coarray images).
- Formal performance model and reproducible benchmarks.
- First integration points with EdgeRecord / the-tower / cortex-orchestrator.
- Optional `real64` build variant and mixed-precision paths.

## Horizon 2 — Edge & Multi-Node Physics (v1.x – v2.0) · 2027–2028
- Coarray images mapped onto physical edge nodes.
- Distributed TILT: any node can raise a global factory TILT.
- Lightweight sharding of embedding collections across images.
- Streaming telemetry windows (ring buffers).
- Power-aware scheduling.
- First "mobile AI supercomputer" deployment.

## Horizon 3 — Ecosystem Substrate (v2.x+) · 2028–2030
- Stable long-term ABI and semantic versioning.
- Optional higher-level physics language / config layer.
- Pluggable metric kernels.
- Integration patterns for other local-first projects.
- Research-quality papers / technical reports.
- Community of practice.
