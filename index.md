---
title: GIS Data Hub
---

{% assign pmtiles = site.static_files | where: "extname", ".pmtiles" %}
{% assign parquet = site.static_files | where: "extname", ".parquet" %}

<h2>PMTiles</h2>
<p>Vector tiles in a single file. Click a name to open it in the PMTiles viewer.</p>
{% if pmtiles.size == 0 %}<p class="empty">None yet.</p>{% else %}
<ul class="files">
{% for f in pmtiles %}{% assign url = f.path | absolute_url %}  <li><a class="name" href="https://pmtiles.io/#url={{ url }}">{{ f.name }}</a><code>{{ url }}</code><button type="button" data-url="{{ url }}">Copy URL</button></li>
{% endfor %}</ul>{% endif %}

<h2>GeoParquet</h2>
<p>Columnar vector data for DuckDB, GDAL and QGIS. Click a name to preview it on a map.</p>
{% if parquet.size == 0 %}<p class="empty">None yet.</p>{% else %}
<ul class="files">
{% for f in parquet %}{% assign url = f.path | absolute_url %}  <li><a class="name" href="https://do-me.github.io/geoparquet-visualizer/?url={{ url }}">{{ f.name }}</a><code>{{ url }}</code><button type="button" data-url="{{ url }}">Copy URL</button></li>
{% endfor %}</ul>{% endif %}
