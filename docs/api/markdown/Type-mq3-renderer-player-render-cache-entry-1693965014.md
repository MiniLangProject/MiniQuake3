# `mq3.renderer.player_render_cache.Entry`

[Home](README.md) · [Source file](File-src-mq3-renderer-player-render-cache-ml-273188728.md)

<a id="struct-struct-mq3-renderer-player-render-cache-entry-struct-entry-src-mq3-renderer-player-render-cache-ml-225729901"></a>
## Entry

```ml
struct Entry
```

Data record for `mq3.renderer.player_render_cache.Entry`; groups `key`, `triangles`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L39)

## Members

<a id="field-field-mq3-renderer-player-render-cache-entry-key-key-src-mq3-renderer-player-render-cache-ml-922458717"></a>
### key

```ml
key
```

Animation-frame and interpolation-phase values used to identify a cache entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L41)

<a id="field-field-mq3-renderer-player-render-cache-entry-triangles-triangles-src-mq3-renderer-player-render-cache-ml-993374057"></a>
### triangles

```ml
triangles
```

Triangle records or index triplets represented by this geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L43)
