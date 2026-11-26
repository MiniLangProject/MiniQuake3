# `mq3.renderer.player_render_cache.Cache`

[Home](README.md) · [Source file](File-src-mq3-renderer-player-render-cache-ml-273188728.md)

<a id="struct-struct-mq3-renderer-player-render-cache-cache-struct-cache-src-mq3-renderer-player-render-cache-ml-1298488609"></a>
## Cache

```ml
struct Cache
```

Data record for `mq3.renderer.player_render_cache.Cache`; groups `models`, `phaseCount`, `maxEntries`, `maxTrianglesPerTarget`, `maxTargetsPerFrame`, `entries`, and 15 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L92)

## Members

<a id="field-field-mq3-renderer-player-render-cache-cache-builds-builds-src-mq3-renderer-player-render-cache-ml-543424113"></a>
### builds

```ml
builds
```

Number of cache entries or batches rebuilt from source data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L110)

<a id="field-field-mq3-renderer-player-render-cache-cache-detailed-detailed-src-mq3-renderer-player-render-cache-ml-2102857679"></a>
### detailed

```ml
detailed
```

Whether the cache retains the more detailed geometry variant.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L118)

<a id="field-field-mq3-renderer-player-render-cache-cache-entries-entries-src-mq3-renderer-player-render-cache-ml-923501111"></a>
### entries

```ml
entries
```

Records currently stored in this index, registry, or cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L104)

<a id="field-field-mq3-renderer-player-render-cache-cache-evictions-evictions-src-mq3-renderer-player-render-cache-ml-1480230395"></a>
### evictions

```ml
evictions
```

Number of cache entries discarded to make room for newer data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L112)

<a id="field-field-mq3-renderer-player-render-cache-cache-frameculled-frameculled-src-mq3-renderer-player-render-cache-ml-1510093295"></a>
### frameCulled

```ml
frameCulled
```

Number of player-model targets rejected this frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L126)

<a id="field-field-mq3-renderer-player-render-cache-cache-framefar-framefar-src-mq3-renderer-player-render-cache-ml-604301979"></a>
### frameFar

```ml
frameFar
```

Number of player-model targets drawn at distant detail this frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L132)

<a id="field-field-mq3-renderer-player-render-cache-cache-framefull-framefull-src-mq3-renderer-player-render-cache-ml-483961823"></a>
### frameFull

```ml
frameFull
```

Number of player-model targets drawn at full detail this frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L128)

<a id="field-field-mq3-renderer-player-render-cache-cache-framemedium-framemedium-src-mq3-renderer-player-render-cache-ml-420839811"></a>
### frameMedium

```ml
frameMedium
```

Number of player-model targets drawn at medium detail this frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L130)

<a id="field-field-mq3-renderer-player-render-cache-cache-frametargets-frametargets-src-mq3-renderer-player-render-cache-ml-1893643285"></a>
### frameTargets

```ml
frameTargets
```

Number of model draw targets prepared during the current frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L114)

<a id="field-field-mq3-renderer-player-render-cache-cache-frametriangles-frametriangles-src-mq3-renderer-player-render-cache-ml-169757547"></a>
### frameTriangles

```ml
frameTriangles
```

Number of triangles submitted for cached model targets this frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L116)

<a id="field-field-mq3-renderer-player-render-cache-cache-hits-hits-src-mq3-renderer-player-render-cache-ml-735902907"></a>
### hits

```ml
hits
```

Number of lookups satisfied by an existing cache entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L106)

<a id="field-field-mq3-renderer-player-render-cache-cache-lighting-lighting-src-mq3-renderer-player-render-cache-ml-53922579"></a>
### lighting

```ml
lighting
```

Lighting values applied to the assembled player model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L124)

<a id="field-field-mq3-renderer-player-render-cache-cache-lodpolicy-lodpolicy-src-mq3-renderer-player-render-cache-ml-1550620087"></a>
### lodPolicy

```ml
lodPolicy
```

Distance and stride thresholds controlling player-model detail.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L122)

<a id="field-field-mq3-renderer-player-render-cache-cache-maxentries-maxentries-src-mq3-renderer-player-render-cache-ml-342646963"></a>
### maxEntries

```ml
maxEntries
```

Maximum number of entries retained by the cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L98)

<a id="field-field-mq3-renderer-player-render-cache-cache-maxtargetsperframe-maxtargetsperframe-src-mq3-renderer-player-render-cache-ml-1678130215"></a>
### maxTargetsPerFrame

```ml
maxTargetsPerFrame
```

Maximum number of draw targets prepared during one frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L102)

<a id="field-field-mq3-renderer-player-render-cache-cache-maxtrianglespertarget-maxtrianglespertarget-src-mq3-renderer-player-render-cache-ml-474653771"></a>
### maxTrianglesPerTarget

```ml
maxTrianglesPerTarget
```

Maximum triangle detail retained for one cached draw target.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L100)

<a id="field-field-mq3-renderer-player-render-cache-cache-misses-misses-src-mq3-renderer-player-render-cache-ml-23093403"></a>
### misses

```ml
misses
```

Number of lookups that required loading or rebuilding data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L108)

<a id="field-field-mq3-renderer-player-render-cache-cache-models-models-src-mq3-renderer-player-render-cache-ml-1660036875"></a>
### models

```ml
models
```

Registered models or model parts available to the subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L94)

<a id="field-field-mq3-renderer-player-render-cache-cache-phasecount-phasecount-src-mq3-renderer-player-render-cache-ml-2034332275"></a>
### phaseCount

```ml
phaseCount
```

Number of interpolation phases represented by the animation cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L96)

<a id="field-field-mq3-renderer-player-render-cache-cache-skinset-skinset-src-mq3-renderer-player-render-cache-ml-1906185191"></a>
### skinSet

```ml
skinSet
```

Resolved skin bindings for the player model's three body parts.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L120)

<a id="field-field-mq3-renderer-player-render-cache-cache-sourcetriangles-sourcetriangles-src-mq3-renderer-player-render-cache-ml-1499230091"></a>
### sourceTriangles

```ml
sourceTriangles
```

Number of source triangles considered when preparing the batch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L134)
