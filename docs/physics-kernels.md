# Physics Kernels (The Bumpers)

## Why pure functions matter

Pure functions have no side effects: given the same inputs they always produce the same outputs, and they don't modify anything outside themselves. This lets the compiler:
- Vectorize (SIMD)
- Reorder instructions
- Inline aggressively
- Reason about memory aliasing

## Fused vs separate norm+dot

`cosine_similarity` calls `dot_product_f` then `norm2_f` (which calls `dot_product_f` again) — three passes over the data. `fused_cosine` does one pass computing dot, a·a, b·b simultaneously. Better cache/register use, fewer memory round-trips.

## Data layout: (dim, n_docs) vs (n_docs, dim)

Fortran is column-major. Storing docs as `(dim, n_docs)` means each document is a contiguous column, so `docs(:, j)` is a contiguous slice — ideal for SIMD. The alternative `(n_docs, dim)` scatters each document across memory.

## DO CONCURRENT

`do concurrent` tells the compiler the iterations are independent, enabling parallel execution and vectorization without manual OpenMP.

## What compilers can vectorize

With `-O3 -march=native`, gfortran/ifx will auto-vectorize the fused loop into SIMD instructions (NEON on Apple Silicon, AVX on x86). The `do concurrent` + simple arithmetic makes this straightforward.
