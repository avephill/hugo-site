#!/usr/bin/env bash
# Regenerate static PNG from Excalidraw SVG (headless Chrome) + light ImageMagick post-process.
#
# 1) Tall, top-aligned screenshot so nothing is clipped.
# 2) Wait for fonts (virtual-time-budget).
# 3) -trim to the art, then -splice extra bottom margin so light labels / descenders are not
#    at the last pixel row (avoids the "9. Needs…" looking chopped when scaled in the browser).
# 4) -extent to 1705px wide, centered, #f0ebe0, so the figure lines up with your layout.
#
# Requires: Google Chrome (default macOS path) + ImageMagick (magick).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SVG="$ROOT/static/media/community-science-lifecycle.svg"
OUT="$ROOT/static/media/community-science-lifecycle.png"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
W_OUT=1705
CAP_H=5000
PAD_BOTTOM=80
HTML="$(mktemp /tmp/render-lifecycle-XXXXXX.html)"
RAW="$(mktemp /tmp/render-lifecycle-raw-XXXXXX.png)"
TRIM="$(mktemp /tmp/render-lifecycle-trim-XXXXXX.png)"
cleanup() { rm -f "$HTML" "$RAW" "$TRIM"; }
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
  html, body { margin: 0; padding: 0; width: ${W_OUT}px; min-height: ${CAP_H}px; background: #f0ebe0; }
  img { display: block; width: ${W_OUT}px; height: auto; }
</style></head>
<body>
  <img src="file://${SVG}" width="${W_OUT}" alt="" />
</body></html>
EOF

"$CHROME" --headless=new --disable-gpu --force-device-scale-factor=1 --hide-scrollbars \
  --virtual-time-budget=10000 \
  --window-size="${W_OUT},${CAP_H}" --screenshot="$RAW" "file://${HTML}"

# Tight crop to art, then add breathing room at the bottom (do not over-fuzz: light grey labels stay).
magick "$RAW" -fuzz 1% -trim +repage "$TRIM"
magick "$TRIM" -gravity South -background "#f0ebe0" -splice 0x${PAD_BOTTOM} "$TRIM"
H2="$(magick identify -format %h "$TRIM")"
magick "$TRIM" -gravity center -background "#f0ebe0" -extent ${W_OUT}x${H2} "$OUT"

DIM="${W_OUT}x${H2}"
echo "Wrote $OUT (${DIM}, $(wc -c <"$OUT" | tr -d ' ') bytes)"
echo "Set content/_index.md <img> width=\"${W_OUT}\" height=\"${H2}\""
