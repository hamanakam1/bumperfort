# Performance Notes

- Use `-O3 -march=native` (or fpm release profile) for best SIMD.
- Keep arrays contiguous (Fortran column-major).
- Prefer fused kernels over separate dot+norm.
- Batch over many docs to amortize overhead.
- Layout: docs(dim, n_docs) — each doc a contiguous column.
- Avoid allocations on the hot path.
- Coarray/multi-image is opt-in; single-image is the baseline.
