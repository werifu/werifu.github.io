#!/usr/bin/env sh
# Build the academic homepage.
#
#   ./build.sh              compile once -> index.html
#   ./build.sh watch        live preview with auto-reload (http://localhost:3000)
#   ./build.sh sync-version pin .typst-version to your local Typst (CI reads it)
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

if [ "$1" = "sync-version" ]; then
  printf '%s\n' "$(typst --version | awk '{print $2}')" > .typst-version
  echo "Pinned .typst-version to $(cat .typst-version)"
  exit 0
fi

typst compile --features html index.typ index.html
echo "Built index.html  (open it in a browser, or run './build.sh watch' for live preview)"
