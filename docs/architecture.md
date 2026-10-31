# Architecture

## Big Picture

```
                    ┌──────────────────────────────┐
                    │  cortex-orchestrator / Python │
                    │  (or Rust sidecar)            │
                    └─────────────┬────────────────┘
                                  │ contiguous float32 buffer
                                  │ (pointer + length)
                                  ▼
┌─────────────────────────────────────────────────────────────┐
│                    BumperFort (Fortran)                      │
│  ┌─────────────┐   ┌──────────────┐   ┌─────────────────┐  │
│  │ ffi_mod     │ → │ physics_mod  │ → │ index_mod       │  │
│  │ Launch Chute│   │ Bumpers      │   │ top-k scoring   │  │
│  │ ISO_C_BIND  │   │ fused cosine │   │                 │  │
│  └─────────────┘   └──────────────┘   └─────────────────┘  │
│         │                                       │           │
│         ▼                                       ▼           │
│  ┌─────────────┐                       ┌─────────────────┐  │
│  │ coarray +   │                       │ returned scores │  │
│  │ telemetry   │                       │ + TILT flag     │  │
│  │ (TILT)      │                       └─────────────────┘  │
│  └─────────────┘                                            │
└─────────────────────────────────────────────────────────────┘
```

## Pinball Flow

```
  BALL (embedding)
       │
       ▼
  [LAUNCH CHUTE]  ─── ffi_mod (zero-copy pointer hand-off)
       │
       ▼
  [BUMPERS]       ─── physics_mod (dot / norm / fused cosine)
       │
       ▼
  [MULTI-BALL]    ─── coarray images (optional parallel)
       │
       ▼
  [TILT SENSOR]   ─── telemetry_mod / coarray_mod
       │
       ▼
  [SCORE]         ─── results back to caller
```

## Module Guide

### precision_mod — kinds + safety constants
- Role: defines `wp` (working precision) and `c_wp` (C-matching kind), plus `eps_norm`, `eps_zero`, default TILT thresholds.
- Fortran feature: `iso_fortran_env` kind parameters, `iso_c_binding`.
- Why: change one line to retarget the whole library between real32/real64.

### physics_mod — pure kernels (the bumpers)
- Role: dot, norm, cosine, fused (single-pass), batch, blocked batch.
- Fortran feature: `pure`, `do concurrent`, assumed-shape arrays.
- Why: side-effect-free kernels the compiler can vectorize.

### ffi_mod — BIND(C) zero-copy surface (launch chute)
- Role: C-ABI entry points that wrap pure kernels with pointer+length interop.
- Fortran feature: `bind(C)`, `c_ptr`, `c_f_pointer`, `c_associated`.
- Why: zero-copy from Python/Rust/C.

### index_mod — simple top-k
- Role: returns k highest cosine scores and 1-based indices.
- Fortran feature: allocatable work arrays, assumed-shape.
- Why: brute-force selection for v0.1.

### coarray_mod — TILT flag + thresholds
- Role: coarray `[*]` global flag, thresholds, raise/clear.
- Fortran feature: coarrays, `sync all`.
- Why: progressive parallelism; single-image works today.

### telemetry_mod — convenience wrappers
- Role: thin policy layer calling raise_tilt when thresholds exceeded.
- Why: keeps policy out of numerical kernels.

### bumperfort — public facade
- Role: umbrella module re-exporting the public API.
- Why: one `use bumperfort` for consumers.
