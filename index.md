---
title: GIS Data Hub
---


{% assign pmtiles = site.static_files | where: "extname", ".pmtiles" %}
{% assign parquet = site.static_files | where: "extname", ".parquet" %}

## PMTiles

{% if pmtiles.size == 0 %}None yet.{% else %}
| File | URL |
|------|-----|
{% for f in pmtiles %}| [{{ f.name }}](https://pmtiles.io/#url={{ f.path | absolute_url }}) | `{{ f.path | absolute_url }}` |
{% endfor %}{% endif %}

## GeoParquet

{% if parquet.size == 0 %}None yet.{% else %}
| File | URL |
|------|-----|
{% for f in parquet %}| [{{ f.name }}](https://do-me.github.io/geoparquet-visualizer/?url={{ f.path | absolute_url }}) | `{{ f.path | absolute_url }}` |
{% endfor %}{% endif %}
