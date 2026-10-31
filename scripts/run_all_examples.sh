#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
for ex in single_query batch_demo tilt_demo; do
  echo "=== running $ex ==="
  fpm run --example "$ex"
done
