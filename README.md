# gis-data-hub
Repository for holding geojson, GeoParquet, and PMTiles externally on GitHub pages

Site: https://ericsamsoncarto.github.io/gis-data-hub/

## Files

`https://ericsamsoncarto.github.io/gis-data-hub/data/<pmtiles|geoparquet>/<file>`

## Adding a file

- GeoParquet: `scripts/prep-geoparquet.sh <input>` (any OGR-readable file, needs GDAL 3.9+). Writes `data/geoparquet/<name>.parquet` with zstd, a bbox covering column and spatial sort, and fails if over 100 MB.
- PMTiles: drop into `data/pmtiles/`. Keep max zoom as low as you can.

Commit and push; the landing page lists it automatically.

Limits: 100 MB per file, ~1 GB site. No Git LFS (Pages serves the pointer, not the data). Old versions stay in git history, so squash it now and then:

```sh
git checkout --orphan fresh && git add -A && git commit -m "Squash history"
git branch -D main && git branch -m main && git push -f origin main
git gc --prune=now --aggressive
```
