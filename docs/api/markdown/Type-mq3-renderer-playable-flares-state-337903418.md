# `mq3.renderer.playable_flares.State`

[Home](README.md) · [Source file](File-src-mq3-renderer-playable-flares-ml-2125885383.md)

<a id="struct-struct-mq3-renderer-playable-flares-state-struct-state-src-mq3-renderer-playable-flares-ml-1093807407"></a>
## State

```ml
struct State
```

Data record for `mq3.renderer.playable_flares.State`; groups `visible`, `fadeTime`, `drawIntensity`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L42)

## Members

<a id="field-field-mq3-renderer-playable-flares-state-drawintensity-drawintensity-src-mq3-renderer-playable-flares-ml-953052950"></a>
### drawIntensity

```ml
drawIntensity
```

Current flare intensity after visibility fading.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L48)

<a id="field-field-mq3-renderer-playable-flares-state-fadetime-fadetime-src-mq3-renderer-playable-flares-ml-12719232"></a>
### fadeTime

```ml
fadeTime
```

Timestamp of the last visibility transition used to fade a flare.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L46)

<a id="field-field-mq3-renderer-playable-flares-state-visible-visible-src-mq3-renderer-playable-flares-ml-192325770"></a>
### visible

```ml
visible
```

Whether the flare passed its most recent visibility test.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_flares.ml#L44)
