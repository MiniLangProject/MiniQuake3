# `mq3.renderer.player_render_cache.Stats`

[Home](README.md) · [Source file](File-src-mq3-renderer-player-render-cache-ml-273188728.md)

<a id="struct-struct-mq3-renderer-player-render-cache-stats-struct-stats-src-mq3-renderer-player-render-cache-ml-1443354223"></a>
## Stats

```ml
struct Stats
```

Data record for `mq3.renderer.player_render_cache.Stats`; groups `entries`, `hits`, `misses`, `builds`, `evictions`, `frameTargets`, and 6 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L137)

## Members

<a id="field-field-mq3-renderer-player-render-cache-stats-builds-builds-src-mq3-renderer-player-render-cache-ml-1776691288"></a>
### builds

```ml
builds
```

Number of cache entries or batches rebuilt from source data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L145)

<a id="field-field-mq3-renderer-player-render-cache-stats-entries-entries-src-mq3-renderer-player-render-cache-ml-1822309190"></a>
### entries

```ml
entries
```

Number of player-render cache entries currently retained.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L139)

<a id="field-field-mq3-renderer-player-render-cache-stats-evictions-evictions-src-mq3-renderer-player-render-cache-ml-185969714"></a>
### evictions

```ml
evictions
```

Number of cache entries discarded to make room for newer data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L147)

<a id="field-field-mq3-renderer-player-render-cache-stats-frameculled-frameculled-src-mq3-renderer-player-render-cache-ml-1373364598"></a>
### frameCulled

```ml
frameCulled
```

Number of player-model targets rejected this frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L153)

<a id="field-field-mq3-renderer-player-render-cache-stats-framefar-framefar-src-mq3-renderer-player-render-cache-ml-61202118"></a>
### frameFar

```ml
frameFar
```

Number of player-model targets drawn at distant detail this frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L159)

<a id="field-field-mq3-renderer-player-render-cache-stats-framefull-framefull-src-mq3-renderer-player-render-cache-ml-2070513246"></a>
### frameFull

```ml
frameFull
```

Number of player-model targets drawn at full detail this frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L155)

<a id="field-field-mq3-renderer-player-render-cache-stats-framemedium-framemedium-src-mq3-renderer-player-render-cache-ml-1683261978"></a>
### frameMedium

```ml
frameMedium
```

Number of player-model targets drawn at medium detail this frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L157)

<a id="field-field-mq3-renderer-player-render-cache-stats-frametargets-frametargets-src-mq3-renderer-player-render-cache-ml-822626688"></a>
### frameTargets

```ml
frameTargets
```

Number of model draw targets prepared during the current frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L149)

<a id="field-field-mq3-renderer-player-render-cache-stats-frametriangles-frametriangles-src-mq3-renderer-player-render-cache-ml-957959598"></a>
### frameTriangles

```ml
frameTriangles
```

Number of triangles submitted for cached model targets this frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L151)

<a id="field-field-mq3-renderer-player-render-cache-stats-hits-hits-src-mq3-renderer-player-render-cache-ml-1528578634"></a>
### hits

```ml
hits
```

Number of lookups satisfied by an existing cache entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L141)

<a id="field-field-mq3-renderer-player-render-cache-stats-misses-misses-src-mq3-renderer-player-render-cache-ml-1364646002"></a>
### misses

```ml
misses
```

Number of lookups that required loading or rebuilding data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L143)

<a id="field-field-mq3-renderer-player-render-cache-stats-sourcetriangles-sourcetriangles-src-mq3-renderer-player-render-cache-ml-1978147978"></a>
### sourceTriangles

```ml
sourceTriangles
```

Number of source triangles considered when preparing the batch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L161)
