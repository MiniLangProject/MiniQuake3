# `mq3.renderer.player_render_cache.LodPolicy`

[Home](README.md) · [Source file](File-src-mq3-renderer-player-render-cache-ml-273188728.md)

<a id="struct-struct-mq3-renderer-player-render-cache-lodpolicy-struct-lodpolicy-src-mq3-renderer-player-render-cache-ml-195091267"></a>
## LodPolicy

```ml
struct LodPolicy
```

Data record for `mq3.renderer.player_render_cache.LodPolicy`; groups `fullDistance`, `mediumDistance`, `farDistance`, `mediumStride`, `farStride`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L46)

## Members

<a id="field-field-mq3-renderer-player-render-cache-lodpolicy-fardistance-fardistance-src-mq3-renderer-player-render-cache-ml-1837506052"></a>
### farDistance

```ml
farDistance
```

Distance threshold for the most distant model-detail tier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L52)

<a id="field-field-mq3-renderer-player-render-cache-lodpolicy-farstride-farstride-src-mq3-renderer-player-render-cache-ml-2105492460"></a>
### farStride

```ml
farStride
```

Triangle sampling stride used by the distant detail tier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L56)

<a id="field-field-mq3-renderer-player-render-cache-lodpolicy-fulldistance-fulldistance-src-mq3-renderer-player-render-cache-ml-326468520"></a>
### fullDistance

```ml
fullDistance
```

Maximum distance at which full model detail is retained.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L48)

<a id="field-field-mq3-renderer-player-render-cache-lodpolicy-mediumdistance-mediumdistance-src-mq3-renderer-player-render-cache-ml-225486980"></a>
### mediumDistance

```ml
mediumDistance
```

Distance threshold for the medium model-detail tier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L50)

<a id="field-field-mq3-renderer-player-render-cache-lodpolicy-mediumstride-mediumstride-src-mq3-renderer-player-render-cache-ml-1178556056"></a>
### mediumStride

```ml
mediumStride
```

Triangle sampling stride used by the medium detail tier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L54)
