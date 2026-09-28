#!/bin/sh
# Runs the VisualFX test suite with the Luau CLI (https://github.com/luau-lang/luau/releases).
# LUAU can point at the luau binary; defaults to `luau` on PATH.
set -e
cd "$(dirname "$0")/.."
mkdir -p build
python3 tools/bundle.py test.project.json build/test_bundle.luau
"${LUAU:-luau}" tools/run_tests.luau -a "$@"
