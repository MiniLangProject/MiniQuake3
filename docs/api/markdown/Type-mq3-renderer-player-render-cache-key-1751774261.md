# `mq3.renderer.player_render_cache.Key`

[Home](README.md) · [Source file](File-src-mq3-renderer-player-render-cache-ml-273188728.md)

<a id="struct-struct-mq3-renderer-player-render-cache-key-struct-key-src-mq3-renderer-player-render-cache-ml-640307911"></a>
## Key

```ml
struct Key
```

Data record for `mq3.renderer.player_render_cache.Key`; groups `lowerOldFrame`, `lowerFrame`, `lowerPhase`, `upperOldFrame`, `upperFrame`, `upperPhase`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L24)

## Members

<a id="field-field-mq3-renderer-player-render-cache-key-lowerframe-lowerframe-src-mq3-renderer-player-render-cache-ml-757756566"></a>
### lowerFrame

```ml
lowerFrame
```

Current animation frame of the lower-body model used in the animation cache key.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L28)

<a id="field-field-mq3-renderer-player-render-cache-key-loweroldframe-loweroldframe-src-mq3-renderer-player-render-cache-ml-1459182158"></a>
### lowerOldFrame

```ml
lowerOldFrame
```

Previous animation frame of the lower-body model used in the animation cache key.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L26)

<a id="field-field-mq3-renderer-player-render-cache-key-lowerphase-lowerphase-src-mq3-renderer-player-render-cache-ml-801951278"></a>
### lowerPhase

```ml
lowerPhase
```

Quantized frame-interpolation phase of the lower-body model used in the animation cache key.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L30)

<a id="field-field-mq3-renderer-player-render-cache-key-upperframe-upperframe-src-mq3-renderer-player-render-cache-ml-1937828884"></a>
### upperFrame

```ml
upperFrame
```

Current animation frame of the upper-body model used in the animation cache key.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L34)

<a id="field-field-mq3-renderer-player-render-cache-key-upperoldframe-upperoldframe-src-mq3-renderer-player-render-cache-ml-1481680670"></a>
### upperOldFrame

```ml
upperOldFrame
```

Previous animation frame of the upper-body model used in the animation cache key.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L32)

<a id="field-field-mq3-renderer-player-render-cache-key-upperphase-upperphase-src-mq3-renderer-player-render-cache-ml-1079622424"></a>
### upperPhase

```ml
upperPhase
```

Quantized frame-interpolation phase of the upper-body model used in the animation cache key.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L36)
