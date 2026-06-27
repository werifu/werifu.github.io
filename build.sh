#!/usr/bin/env sh
# Build the academic homepage.
#
#   ./build.sh          compile once -> index.html
#   ./build.sh watch    live preview with auto-reload (http://localhost:3000)
#
# Requires Typst >= 0.15 (HTML export is behind the --features html flag).
set -e
cd "$(dirname "$0")"

if ! command -v typst >/dev/null 2>&1; then
  echo "error: 'typst' not found. Install it: https://github.com/typst/typst#installation" >&2
  exit 1
fi

if [ "$1" = "watch" ]; then
  exec typst watch --features html index.typ index.html
fi

typst compile --features html index.typ index.html
echo "Built index.html  (open it in a browser, or run './build.sh watch' for live preview)"
