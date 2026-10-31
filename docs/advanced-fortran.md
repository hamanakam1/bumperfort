# Advanced Fortran

## Why pure and do concurrent matter for optimization

`pure` promises no side effects, enabling the compiler to reorder, inline, and vectorize. `do concurrent` asserts iteration independence, unlocking SIMD and multi-thread execution without OpenMP pragmas.

## Assumed-shape vs explicit-shape vs allocatable

- Assumed-shape (`a(:)`): shape taken from caller. Flexible, no copy. Used in kernels.
- Explicit-shape (`a(4)`): fixed size. Less flexible.
- Allocatable: runtime-sized, owns memory. Used in index_mod work arrays.

## How compilers vectorize the fused kernels

With `-O3 -march=native`, the single-pass fused loop becomes SIMD instructions. The simple arithmetic and `do concurrent` make auto-vectorization reliable.

## Trade-offs of real32 vs real64 for embedding workloads

- real32: half the memory/bandwidth, faster SIMD, sufficient precision for cosine similarity on normalized embeddings.
- real64: more precision, double the memory/bandwidth, slower. Use for accumulation or when precision matters.

## Contiguous attribute and why it matters

Contiguous arrays have no gaps, enabling SIMD loads and zero-copy FFI. Non-contiguous slices force copies or scatter/gather. Always pass contiguous buffers across the ABI.
