#!/usr/bin/env bash
set -euo pipefail
fpm build --profile release
echo "Build complete. Look under build/ for the library."
