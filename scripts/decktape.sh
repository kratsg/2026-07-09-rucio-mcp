#!/usr/bin/env bash
# Run decktape against the puppeteer-cached Chrome when one exists.
# (decktape's own bundled-browser download can fail macOS signature
# validation — see the gotcha in CLAUDE.md.)
set -euo pipefail
CHROME=$(ls -d "$HOME"/.cache/puppeteer/chrome/*/chrome-*/*.app/Contents/MacOS/* 2>/dev/null | head -1 || true)
ARGS=(reveal)
if [ -n "$CHROME" ]; then
  ARGS+=(--chrome-path "$CHROME")
fi
exec npx decktape "${ARGS[@]}" "$@"
