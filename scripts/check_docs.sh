#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
missing=0
for f in docs/architecture.md docs/ffi-explained.md docs/physics-kernels.md docs/coarrays-and-tilt.md docs/learning-path.md docs/api-reference.md docs/performance-notes.md docs/glossary.md; do
  if [ ! -s "$f" ]; then echo "MISSING/EMPTY: $f"; missing=1; fi
done
[ "$missing" -eq 0 ] && echo "All docs present and non-empty."
exit $missing
