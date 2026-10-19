#!/usr/bin/env bash
# Render the unmodified 2006 David A. Madore E6 POV-Ray source with a
# modern POV-Ray executable; produce a verified 32-frame orbit movie.
# Original and public-domain status: http://www.madore.org/cubic-dvd/
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
UPSTREAM="$ROOT/vendor/david-madore/cubic-dvd/upstream/cubic-dvd/03s01a.pov"
OUT="${1:-$ROOT/renders/madore-e6}"
FRAMES="${E6_FRAMES:-32}"
FPS="${E6_FPS:-16}"
SIZE="${E6_SIZE:-320}"
case "$FRAMES" in *[!0-9]*|"") echo 'E6_FRAMES must be an integer' >&2; exit 2;; esac
case "$FPS" in *[!0-9]*|"") echo 'E6_FPS must be an integer' >&2; exit 2;; esac
case "$SIZE" in *[!0-9]*|"") echo 'E6_SIZE must be an integer' >&2; exit 2;; esac
(( FRAMES >= 8 && FRAMES <= 120 && FPS >= 1 && FPS <= 60 && SIZE >= 64 && SIZE <= 1024 )) || {
  echo 'Invalid E6 render dimensions, frame count or fps' >&2
  exit 2
}
test -s "$UPSTREAM" || { echo "Missing original: $UPSTREAM" >&2; exit 1; }
command -v povray >/dev/null || { echo 'POV-Ray required' >&2; exit 2; }
command -v ffmpeg >/dev/null || { echo 'ffmpeg required' >&2; exit 2; }
command -v ffprobe >/dev/null || { echo 'ffprobe required' >&2; exit 2; }
mkdir -p "$OUT/frames"
for (( index=0; index<FRAMES; index++ )); do
    printf -v number '%03d' "$index"
    clock="$(awk -v i="$index" -v n="$FRAMES" 'BEGIN {printf "%.12f", i/n}')"
    # +K is POV-Ray's clock value. We do NOT edit the original scene.
    # The original scene rotates by 360*clock around the y axis.
    povray +I"$UPSTREAM" +O"$OUT/frames/$number.png" \
      +W"$SIZE" +H"$SIZE" +K"$clock" +FN +Q9 +A0.2 +R2 \
      -D -P -V
done

python3 "$ROOT/scripts/verify-e6-render.py" frames "$OUT" "$FRAMES" "$SIZE" "$FPS" "povray"
ffmpeg -hide_banner -loglevel error -y -framerate "$FPS" \
  -start_number 0 -i "$OUT/frames/%03d.png" \
  -c:v libx264 -crf 18 -pix_fmt yuv420p -movflags +faststart \
  "$OUT/madore-e6-povray.mp4"
ffmpeg -hide_banner -loglevel error -y -i "$OUT/madore-e6-povray.mp4" \
  -filter_complex "[0:v]fps=$FPS,scale=$SIZE:-1:flags=lanczos,split[a][b];[a]palettegen=max_colors=128:stats_mode=diff[p];[b][p]paletteuse=dither=bayer:bayer_scale=4" \
  -loop 0 "$OUT/madore-e6-povray.gif"
cp "$OUT/frames/008.png" "$OUT/madore-e6-povray.png"
python3 "$ROOT/scripts/verify-e6-render.py" movie "$OUT" "$FRAMES" "$SIZE" "$FPS" "povray"
printf 'POV-Ray E6 rendered and verified: %s\n' "$OUT"
