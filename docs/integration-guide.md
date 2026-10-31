# Integration Guide

## Recommended calling pattern from a Python orchestrator

1. Generate embeddings (NumPy float32, contiguous).
2. Build docs matrix as (dim, n_docs) column-major.
3. Call `bumper_batch_cosine` once per query.
4. Receive scores array; optionally call top-k.
5. React to TILT flag from telemetry.

## Lifetime rules for pointers

- Caller owns the memory. Fortran borrows it for the call duration.
- Do not free or reuse buffers while a call is in flight.
- Pointers passed must remain valid until the call returns.

## How TILT events could be consumed by an agent swarm

- Poll or check `check_tilt_status()` periodically.
- On TILT, reduce load, throttle, or shed work.
- Clear TILT only after conditions recover.

## Where BumperFort sits relative to a vector store

BumperFort is a fast scoring kernel, not a durable store. The store (pgvector etc.) holds data; BumperFort computes scores. Use BumperFort for hot paths; store for persistence.

## Suggested error-handling and fallback strategy

- On null/invalid input, return 0 scores (current behavior).
- On TILT, fall back to reduced precision or fewer docs.
- Keep a pure-Python/NumPy path as fallback when the library is unavailable.
- Log failures but never crash the orchestrator.
