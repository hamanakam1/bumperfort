# Architecture

BumperFort is a Modern Fortran physics coprocessor. See README for the pinball metaphor.
- Launch Chute = zero-copy FFI
- Bumpers = SIMD vector kernels
- Multi-Ball = coarrays
- TILT = hardware telemetry safety monitor
- Score = similarity scores + top-k indices
