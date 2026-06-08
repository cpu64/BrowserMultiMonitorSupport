mkdir -p segments_360p

for f in segments_2160p/*.mp4; do
  ffmpeg -y \
    -i "$f" \
    -vf "scale=-2:360,format=yuv420p" \
    -c:v libx264 \
    -preset slow \
    -crf 18 \
    -an \
    "segments_360p/$(basename "$f")"
done
