#!/usr/bin/env bash

set -e

RESOLUTION="${1:-360p}"
STREAM_COUNT="${2:-16}"

case "$RESOLUTION" in
  2160p)
    INPUT_DIR="segments_2160p"
    OUTPUT_DIR="streams_2160p"
    BITRATE="12M"
    MAXRATE="15M"
    BUFSIZE="24M"
    PROFILE="high"
    ;;
  1080p)
    INPUT_DIR="segments_1080p"
    OUTPUT_DIR="streams_1080p"
    BITRATE="5M"
    MAXRATE="6M"
    BUFSIZE="10M"
    PROFILE="high"
    ;;
  480p)
    INPUT_DIR="segments_480p"
    OUTPUT_DIR="streams_480p"
    BITRATE="1500k"
    MAXRATE="1800k"
    BUFSIZE="3000k"
    PROFILE="main"
    ;;
  360p)
    INPUT_DIR="segments_360p"
    OUTPUT_DIR="streams_360p"
    BITRATE="800k"
    MAXRATE="1000k"
    BUFSIZE="1600k"
    PROFILE="main"
    ;;
  *)
    echo "Usage: $0 {2160p|1080p|480p|360p} [stream_count]"
    exit 1
    ;;
esac

mkdir -p "$OUTPUT_DIR"

files=("$INPUT_DIR"/*.mp4)
count=${#files[@]}

if [ "$count" -eq 0 ]; then
  echo "No MP4 files found in $INPUT_DIR"
  exit 1
fi

for i in $(seq 1 "$STREAM_COUNT")
do
  file=${files[$(( (i - 1) % count ))]}

  echo "Creating stream $i from $(basename "$file")"

  ffmpeg -y -i "$file" \
    -vf format=yuv420p \
    -an \
    -c:v libx264 \
    -preset slow \
    -profile:v "$PROFILE" \
    -pix_fmt yuv420p \
    -g 48 \
    -keyint_min 48 \
    -sc_threshold 0 \
    -b:v "$BITRATE" \
    -maxrate "$MAXRATE" \
    -bufsize "$BUFSIZE" \
    -hls_time 1 \
    -hls_list_size 0 \
    -f hls \
    "$OUTPUT_DIR/stream${i}_.m3u8"
done
