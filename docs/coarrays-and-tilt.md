# Coarrays and TILT

## The [*] syntax

`logical :: tilt_flag[*]` declares a coarray: one copy per image, addressable across images as `tilt_flag[image_index]`. The `[*]` codimension means "one dimension of images."

## Images

An "image" is a parallel execution unit (like an MPI rank or a thread, but built into the language). Single-image programs work fine; multi-image is opt-in via the runtime (`-fcoarray=lib` etc.).

## sync all

`sync all` is a barrier: all images wait until every image reaches it. Used in `raise_tilt`/`clear_tilt` so the global flag is consistent before anyone reads it.

## Progressive parallelism philosophy

Single-image must always work. Coarrays and multi-node are opt-in enhancements. This means:
- The library is useful on a laptop with no special setup.
- Multi-image features degrade gracefully.
- Tests pass in single-image mode.
- No user is forced to understand coarrays to get value.
