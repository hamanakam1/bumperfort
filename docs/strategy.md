# BumperFort — Long-Term Strategy

Strategic continuation of the BumperFort handoff. Treats the project as a multi-year local-first physics substrate rather than a one-off library.

## 1. Strategic Positioning (2026–2030)

BumperFort is not competing with FAISS, ScaNN, pgvector, or commercial vector databases. It occupies a different niche:

- **Local-first, zero-network, zero-cloud dependency** numerical kernel that sits *beside* those systems.
- A **physics coprocessor** for agent embeddings + continuous hardware telemetry inside a sovereign software factory.
- A demonstration that Modern Fortran (2018/2023) remains one of the highest-leverage tools for dense numerical work on commodity and edge hardware (Apple Silicon, future ARM edge nodes, solar-powered trailer HPC).

Long-term identity:

> "The pinball machine that keeps the local AI factory stable and fast."

It should feel inevitable inside any serious local-first agent swarm: when embeddings or telemetry arrive, they are launched into BumperFort first.

## 2. Multi-Horizon Roadmap

### Horizon 0 — Foundation (v0.1 – v0.3) · Now → Q1 2027
- Stable C ABI (`bumper_cosine`, `bumper_batch_cosine`, version, basic top-k).
- Pure Fortran kernels with fused and blocked variants.
- Single-image TILT monitor with configurable thresholds.
- fpm-native build, tests, minimal Python ctypes binding.
- CI matrix: gfortran + ifx (Linux), gfortran (macOS).
- Documentation that makes the pinball metaphor and zero-copy rules unambiguous.

Success metric: a Python orchestrator can call BumperFort on 1536-dim vectors with zero copies and measurable speedup over pure NumPy on the same machine.

### Horizon 1 — Production Local Kernel (v0.4 – v1.0) · 2027
- Full coarray TILT with teams and events (Fortran 2018/2023 features).
- `index_mod`: exact top-k, optional blocked/brute-force with early exit, simple inverted-file style coarse quantizer (still pure Fortran).
- Memory-mapped document matrix support so large embedding collections stay outside the process heap.
- Thread-safe shared-library mode (OpenMP regions carefully isolated from coarray images).
- Formal performance model and reproducible benchmarks (GFLOPS, vectors/sec, latency percentiles).
- First integration points with EdgeRecord / the-tower / cortex-orchestrator.
- Optional `real64` build variant and mixed-precision paths.

Success metric: BumperFort becomes the default scoring + safety layer for at least one production local agent swarm running 24/7 on Apple Silicon or equivalent.

### Horizon 2 — Edge & Multi-Node Physics (v1.x – v2.0) · 2027–2028
- Coarray images mapped onto physical edge nodes (trailer HPC, multiple Mac Studios, ARM SBCs).
- Distributed TILT: any node can raise a global factory TILT; recovery protocols defined.
- Lightweight sharding of embedding collections across images with locality-aware query routing.
- Support for streaming telemetry windows (ring buffers owned by images).
- Power-aware scheduling: kernels that can throttle or change precision under thermal/power constraints.
- First "mobile AI supercomputer" deployment story (cargo-trailer NODE-1 style).

Success metric: a multi-node local factory can keep scoring embeddings and monitoring hardware while surviving partial node failure or thermal events without human intervention.

### Horizon 3 — Ecosystem Substrate (v2.x+) · 2028–2030
- Stable long-term ABI and semantic versioning guarantees.
- Optional higher-level "physics language" or configuration layer (still compiled to Fortran kernels).
- Pluggable metric kernels (cosine, L2, IP, custom) while keeping the pinball control plane.
- Integration patterns for other local-first projects (vector stores, agent runtimes, observability).
- Research-quality papers or technical reports on "Modern Fortran as local AI physics layer".
- Community of practice around local-first numerical kernels rather than cloud vector DBs.

Success metric: other independent local-first projects treat BumperFort (or its design patterns) as infrastructure, not as a one-off library.

## 3. Architectural Evolution Principles

1. **Progressive disclosure of parallelism** — Single-image must always work. Coarrays and multi-node are opt-in enhancements, never required for basic usefulness.
2. **ABI and semantic stability over feature velocity** — Once v1.0 ships, the C ABI is treated as a contract. New functionality appears as new entry points or versioned extensions, not breaking changes.
3. **Physics remains pure** — Numerical kernels stay free of I/O, allocation (where possible), and side effects. All orchestration, logging, and policy live outside the kernels.
4. **Hardware is first-class data** — Telemetry is not an afterthought. TILT is a core physics event, not a monitoring bolt-on. Future kernels should be able to take thermal/power state as input and adapt.
5. **Local-first by construction** — No network calls, no telemetry to external services, no mandatory cloud components. Any future distributed mode is still under the operator's physical control.
6. **Metaphor as governance** — When a design decision is ambiguous, ask: "What would the pinball machine do?" Launch, bounce, multi-ball, tilt, score. This keeps the mental model coherent for both humans and future agents working on the code.

## 4. Integration Map with the Broader Factory

Long-term BumperFort is intended to sit at the center of several existing and planned systems:

- **cortex-orchestrator / the-tower** → primary caller of the FFI surface; owns embedding generation and query dispatch.
- **EdgeRecord** → can use BumperFort both for similarity search over sovereign records and as a source of high-integrity timing/telemetry evidence.
- **AI Agent Army / autonomous cofounder** → agents receive TILT events and similarity scores as first-class signals; some agents may specialize in "physics governance".
- **Mobile / trailer HPC (NODE-1 style)** → coarray images become physical compute nodes; TILT becomes a real operational control plane for power, thermal, and load shedding.
- **Local vector stores (pgvector or pure local alternatives)** → BumperFort provides the fast exact or coarse scoring layer; the store remains the durable index.

The long-term goal is that "run the physics step" becomes as routine as "run the embedding model".

## 5. Performance & Scaling Targets (Aspirational but Measurable)

| Horizon | Target | Notes |
|---------|--------|-------|
| v0.3    | 5–15× pure NumPy cosine on 1536-d, batch 10k on M-series | Zero-copy + fused kernels |
| v1.0    | Sustained >100k 1536-d cosines/sec single socket | Blocked + OpenMP |
| v1.x    | Linear scaling of scoring across 4–8 coarray images | Local multi-socket or multi-Mac |
| v2.0    | Useful scoring + TILT on heterogeneous edge set (laptop + trailer nodes) | Latency and power become first-class metrics |
| Long    | Ability to trade precision, power, and latency under explicit policy | Adaptive physics |

All targets must be backed by reproducible benchmarks checked into the repository.

## 6. Risk Register & Mitigations

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Fortran talent scarcity | Medium | High | Keep pure numerical core small; excellent docs + examples; C ABI so most users never write Fortran |
| Compiler quality variance | Medium | Medium | CI matrix; prefer standard-conforming code; document known good flag sets |
| Coarray runtime maturity on consumer OS | Medium | Medium | Progressive enhancement; single-image always works; treat multi-image as advanced |
| Scope creep into full vector DB | High | High | Explicit non-goals; refuse features that belong to the store layer |
| Metaphor becomes limiting | Low | Medium | Treat metaphor as communication tool, not rigid architecture; allow evolution |
| Energy / thermal constraints on edge | High (future) | High | Make power/thermal first-class inputs to kernels and TILT policy early |
| ABI breakage pressure | Medium | Very High | Semantic versioning discipline + explicit deprecation windows after v1.0 |

## 7. Governance, Longevity & Community

- **License**: MIT (or compatible) to maximize reuse inside other local-first projects.
- **Governance**: Benevolent dictatorship by the original author in early years; transition path to a small technical steering group if a real community forms.
- **Contribution model**: Prefer small, reviewable numerical and ABI changes. Large architectural proposals require a written design note that respects the progressive-parallelism and purity rules.
- **Documentation as product**: The pinball metaphor, zero-copy rules, and TILT semantics must be taught clearly; otherwise the project becomes just another fast cosine library.
- **Longevity mechanism**: Keep the core dependency-free and standard-conforming so it remains buildable decades later with future Fortran compilers.

## 8. Research & Intellectual Trajectory

Possible future papers / technical reports (internal or public):

- "Modern Fortran as a Local-First Physics Layer for Agent Systems"
- "Coarray TILT: Hardware Safety as a Parallel Physics Event"
- "Zero-Copy Embedding Trajectories on Consumer Silicon"
- "Power-Aware Vector Kernels for Edge AI Factories"

Even if never published, writing them forces clarity of design.

## 9. Explicit Non-Goals (to protect the long-term shape)

- Becoming a general-purpose vector database.
- Cloud or multi-tenant service offering.
- Replacing BLAS/LAPACK; BumperFort may call them later but does not re-implement them.
- Supporting every possible distance metric on day one.
- Requiring users to understand coarrays to get value.
- Any form of remote telemetry or phone-home.

## 10. Decision Framework for Future Work

When a new idea appears, score it against:

1. Does it strengthen the physics metaphor or dilute it?
2. Does it preserve zero-copy and purity of kernels?
3. Does it work in single-image mode?
4. Does it increase or decrease long-term ABI stability?
5. Does it serve the local-first, sovereign factory thesis?
6. Can it be implemented incrementally with clear tests?

If it fails more than two of these, it is deferred or rejected.

## 11. Closing Strategic Statement

BumperFort's ultimate success is not measured in GitHub stars or peak GFLOPS. It is measured by whether a local AI software factory can run for months with high-dimensional agent traffic and continuous hardware telemetry, and the operators feel that the "physics layer" is one of the most reliable, boring, and trustworthy parts of the system — exactly like a well-built pinball machine that just keeps scoring.

The short-term work (v0.1–v1.0) exists to make that long-term outcome possible.
