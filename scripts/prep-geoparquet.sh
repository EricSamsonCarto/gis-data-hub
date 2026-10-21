#!/usr/bin/env bash
# Rewrite any OGR-readable vector file as a remote-friendly GeoParquet:
# zstd compression, bbox covering column, rows sorted spatially so readers can skip row groups.
# Usage: scripts/prep-geoparquet.sh <input> [output]   (default output: data/geoparquet/<name>.parquet)
set -euo pipefail

in="${1:?usage: $0 <input> [output]}"
name="$(basename "${in%.*}")"
out="${2:-$(dirname "$0")/../data/geoparquet/$name.parquet}"
tmp="$out.tmp.parquet"

ogr2ogr -f Parquet "$tmp" "$in" \
  -lco COMPRESSION=ZSTD \
  -lco WRITE_COVERING_BBOX=YES \
  -lco SORT_BY_BBOX=YES
mv "$tmp" "$out"

size=$(wc -c < "$out")
echo "$out: $((size / 1024 / 1024)) MB"
if (( size > 100 * 1024 * 1024 )); then
  echo "ERROR: over GitHub's 100 MB file limit, push will be rejected" >&2
  exit 1
fi
