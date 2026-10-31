# API Reference

## precision_mod
- `wp` (kind), `c_wp`, `eps_norm`, `eps_zero`, `default_tilt_cpu/mem/temp`

## physics_mod
- `dot_product_f(a,b)`, `norm2_f(a)`, `cosine_similarity(a,b)`, `fused_cosine(a,b)`
- `batch_cosine(query, docs, scores)`, `batch_cosine_blocked(query, docs, scores, block_size)`

## ffi_mod (C ABI)
- `bumper_cosine(a_ptr, b_ptr, n)` → float
- `bumper_batch_cosine(query_ptr, docs_ptr, dim, n_docs, scores_ptr)`
- `bumper_version(major, minor, patch)`

## index_mod
- `top_k_cosine(query, docs, k, scores_out, indices_out)`

## telemetry_mod / coarray_mod
- `update_telemetry(cpu, mem, temp)`, `check_tilt_status()`, `raise_tilt`, `clear_tilt`, `is_tilt`
