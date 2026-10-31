# Contributing to BumperFort

BumperFort is a local-first Modern Fortran physics coprocessor built on an arcade pinball metaphor. We welcome contributions of code, docs, tests, examples, and ideas.

## Project vision

BumperFort treats agent embeddings and hardware telemetry as physical objects in a pinball machine: Launch Chute (FFI) → Bumpers (pure vector kernels) → Multi-Ball (coarrays) → TILT (hardware safety) → Score (results). It is a learning resource as much as a library.

## Ways to contribute

- Code: new kernels, FFI wrappers, top-k improvements, coarray features
- Docs: explanations, diagrams, tutorials, glossary entries
- Tests: edge cases, correctness, interop verification
- Examples: tutorial programs, integration demos
- Issues: bug reports, feature requests, questions
- Discussions: design ideas, learning questions

## Development setup

```bash
git clone https://github.com/hamanakam1/bumperfort.git
cd bumperfort
fpm build
fpm test
fpm run --example single_query
```

Requires: gfortran (or ifx) + fpm.

## Coding standards

- Prefer pure functions for numerical kernels
- Use `wp` (working precision) everywhere, never hard-coded kinds
- Keep kernels side-effect free
- Add educational comments (Learning Objectives header per module)
- Zero-copy on the hot path
- Single-image must always work; coarrays are progressive

## How to add a new kernel end-to-end

1. Add pure function to physics_mod.f90
2. Add BIND(C) wrapper in ffi_mod.f90
3. Update bindings/bumperfort.h
4. Add Python wrapper in bindings/python/bumperfort.py
5. Add test in test/
6. Add example if useful
7. Update docs/api-reference.md

## Pull request process

1. Fork and create a feature branch
2. Make changes with tests
3. Run fpm build && fpm test
4. Submit PR with clear description
5. Reference any related issues

## Code of conduct

See CODE_OF_CONDUCT.md. Be respectful and constructive.
