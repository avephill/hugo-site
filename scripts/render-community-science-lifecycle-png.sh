#!/usr/bin/env bash
# Regenerate static PNG from Excalidraw SVG using headless Chrome (preserves embedded fonts).
#
# We use a *tall* window and top-align the image (no vertical centering, no overflow clip),
# then ImageMagick -trim to crop to the art. That fixes bottom clipping and stray top margin
# from flex centering + rounding when stroke/text extends to the viewBox edge.
#
# Requires: Google Chrome (macOS default path) + ImageMagick (magick).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SVG="$ROOT/static/media/community-science-lifecycle.svg"
OUT="$ROOT/static/media/community-science-lifecycle.png"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
W=1705
# Headless capture height must exceed scaled SVG + any label overflow; trim removes the rest
CAP_H=5000
HTML="$(mktemp /tmp/render-lifecycle-XXXXXX.html)"
RAW="$(mktemp /tmp/render-lifecycle-raw-XXXXXX.png)"
cleanup() { rm -f "$HTML" "$RAW"; }
trap cleanup EXIT

if [[ ! -f "$CHROME" ]]; then
  echo "Chrome not found at $CHROME" >&2
  exit 1
fi
if ! command -v magick &>/dev/null; then
  echo "ImageMagick (magick) is required" >&2
  exit 1
fi
if [[ ! -f "$SVG" ]]; then
  echo "Missing $SVG" >&2
  exit 1
fi

cat >"$HTML" <<EOF
<!DOCTYPE html>
<html lang="en"><head><meta charset="utf-8" />
<style>
  html, body {
    margin: 0;
    padding: 0;
    width: ${W}px;
    min-height: ${CAP_H}px;
    background: #f0ebe0;
  }
  /* Top-aligned, natural height — do NOT stretch height or center flex (causes clip). */
  img {
    display: block;
    width: ${W}px;
    height: auto;
  }
</style></head>
<body>
  <img src="file://${SVG}" alt="" />
</body>
</html>
EOF

"$CHROME" --headless=new --disable-gpu --force-device-scale-factor=1 --hide-scrollbars \
  --window-size="${W},${CAP_H}" --screenshot="$RAW" "file://${HTML}"

# Tight crop to non-background pixels (same cream as the page; fuzz tolerates antialiasing)
magick "$RAW" -fuzz 4% -trim +repage "$OUT"

DIM="$({ magick identify -format "%wx%h" "$OUT" 2>/dev/null || identify -format "%wx%h" "$OUT"; })"
echo "Wrote $OUT (${DIM}px after trim, $(wc -c <"$OUT" | tr -d ' ') bytes)"
echo "Update content/_index.md <img> to width=\"${DIM%x*}\" height=\"${DIM#*x}\""
