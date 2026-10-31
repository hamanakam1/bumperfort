# BumperFort

```text
██████╗ ██╗   ██╗███╗   ███╗██████╗ ███████╗██████╗ ███████╗ ██████╗ ██████╗ ████████╗
██╔══██╗██║   ██║████╗ ████║██╔══██╗██╔════╝██╔══██╗██╔════╝██╔═══██╗██╔══██╗╚══██╔══╝
██████╔╝██║   ██║██╔████╔██║██████╔╝█████╗  ██████╔╝█████╗  ██║   ██║██████╔╝   ██║   
██╔══██╗██║   ██║██║╚██╔╝██║██╔═══╝ ██╔══╝  ██╔══██╗██╔══╝  ██║   ██║██╔══██╗   ██║   
██████╔╝╚██████╔╝██║ ╚═╝ ██║██║     ███████╗██║  ██║██║     ╚██████╔╝██║  ██║   ██║   
╚═════╝  ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   

        High-Velocity Vector Physics & Trajectory Engine
        for the Local-First Industrial Software Factory
```

**High-Velocity Vector Physics & Trajectory Engine**  
for the Local-First Industrial Software Factory

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Fortran](https://img.shields.io/badge/Fortran-2018%2F2023-blue)](https://fortran-lang.org)
[![fpm](https://img.shields.io/badge/build-fpm-purple)](https://fpm.fortran-lang.org)

## What it is

A Modern Fortran physics coprocessor that treats agent embeddings and hardware telemetry as physical objects.  
Launch → Bump → Multi-ball → TILT → Score.

## Quick start

```bash
git clone https://github.com/hamanakam1/bumperfort.git
cd bumperfort
fpm build
fpm test
fpm run --example single_query
```

## Architecture

See `docs/architecture.md`

## Status

v0.1.0 – core physics + FFI surface working.  
Coarray TILT and blocked top-k in progress.

## License

MIT © 2026 Mike Hamanaka
