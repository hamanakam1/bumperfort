# BumperFort

![hero](docs/images/hero-pinball-machine.svg)

```text
██████╗ ██╗   ██╗███╗   ███╗██████╗ ███████╗██████╗ ███████╗ ██████╗ ██████╗ ████████╗
██╔══██╗██║   ██║████╗ ████║██╔══██╗██╔════╝██╔══██╗██╔════╝██╔═══██╗██╔══██╗╚══██╔══╝
██████╔╝██║   ██║██╔████╔██║██████╔╝█████╗  ██████╔╝█████╗  ██║   ██║██████╔╝   ██║   
██╔══██╗██║   ██║██║╚██╔╝██║██╔═══╝ ██╔══╝  ██╔══██╗██╔══╝  ██║   ██║██╔══██╗   ██║   
██████╔╝╚██████╔╝██║ ╚═╝ ██║██║     ███████╗██║  ██║██║     ╚██████╔╝██║  ██║   ██║   
╚═════╝  ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   
```

**High-Velocity Vector Physics & Trajectory Engine** for the Local-First Industrial Software Factory

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)


## Bounce Kernel

High-dimensional vector bounce calculations using real64 precision, with deterministic trajectories.

## Visual Flow

![Launch Chute](docs/images/gifs/01_launch_chute.gif)
![Bumpers](docs/images/gifs/02_bumpers_physics.gif)
![Multi-Ball](docs/images/gifs/03_multiball_coarrays.gif)
![TILT Monitor](docs/images/gifs/04_tilt_monitor.gif)
![Full Flow](docs/images/gifs/05_full_flow.gif)

## Vision

BumperFort is a Modern Fortran physics coprocessor that treats agent embeddings and hardware telemetry as physical objects. Launch → Bump → Multi-ball → TILT → Score.

## Quick start

```bash
git clone https://github.com/hamanakam1/bumperfort.git
cd bumperfort
fpm build
fpm test
fpm run --example single_query
```

## Learning path

See `docs/learning-path.md` for the staged study guide. Start with `docs/architecture.md` and `docs/ffi-explained.md`.

## Status

v0.1.0 — educational + usable core. See `docs/limitations-and-future.md`.

## Links

- Architecture: `docs/architecture.md`
- FFI deep dive: `docs/ffi-explained.md`
- Physics kernels: `docs/physics-kernels.md`
- Coarrays & TILT: `docs/coarrays-and-tilt.md`
- Strategy: `docs/strategy.md`
- Roadmap: `docs/roadmap.md`

## License

MIT © 2026 Mike Hamanaka

## Contributing

Contributions welcome! See [CONTRIBUTING.md](CONTRIBUTING.md) and [docs/contributing-ideas.md](docs/contributing-ideas.md). Good first issues are labeled. Educational contributions are especially valued.


## Arcade Cabinet Specs (Benchmarks)

Run `make test-leaks` to verify zero heap allocations after initialization.
