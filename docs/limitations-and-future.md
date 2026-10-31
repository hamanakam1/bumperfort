# Limitations and Future Work

## Current limitations

- Top-k is simple selection, not a high-performance partial sort.
- Coarray usage is basic (single-node mental model).
- No memory-mapping of large embedding matrices yet.
- No OpenMP inside the kernels yet.
- No quantized or approximate search.
- No mixed-precision paths yet.
- Python binding is minimal (cosine only).

## Next logical engineering steps

1. Implement a better top-k (heap/partial sort).
2. Add OpenMP regions isolated from coarray images.
3. Add memory-mapped docs matrix support.
4. Extend Python binding to batch + top-k.
5. Add benchmarks (1536-d, 10k docs).
6. Implement TILT recovery protocols.
7. Add real64 build variant.
8. Add more distance metrics (L2, IP).
