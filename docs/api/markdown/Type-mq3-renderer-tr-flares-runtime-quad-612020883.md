# `mq3.renderer.tr_flares_runtime.Quad`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-flares-runtime-ml-1405723862.md)

<a id="struct-struct-mq3-renderer-tr-flares-runtime-quad-struct-quad-src-mq3-renderer-tr-flares-runtime-ml-37039411"></a>
## Quad

```ml
struct Quad
```

Data record for `mq3.renderer.tr_flares_runtime.Quad`; groups `fogNum`, `positions`, `texCoords`, `color`, `indexes`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L55)

## Members

<a id="field-field-mq3-renderer-tr-flares-runtime-quad-color-color-src-mq3-renderer-tr-flares-runtime-ml-620152034"></a>
### color

```ml
color
```

Final flare-quad modulation after intensity and fog adjustments.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L63)

<a id="field-field-mq3-renderer-tr-flares-runtime-quad-fognum-fognum-src-mq3-renderer-tr-flares-runtime-ml-373230990"></a>
### fogNum

```ml
fogNum
```

Fog volume number encoded or used by the draw surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L57)

<a id="field-field-mq3-renderer-tr-flares-runtime-quad-indexes-indexes-src-mq3-renderer-tr-flares-runtime-ml-1373150358"></a>
### indexes

```ml
indexes
```

Indices splitting the four flare vertices into drawable triangles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L65)

<a id="field-field-mq3-renderer-tr-flares-runtime-quad-positions-positions-src-mq3-renderer-tr-flares-runtime-ml-453397794"></a>
### positions

```ml
positions
```

Screen-facing corners constructed around the projected flare center.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L59)

<a id="field-field-mq3-renderer-tr-flares-runtime-quad-texcoords-texcoords-src-mq3-renderer-tr-flares-runtime-ml-1836347378"></a>
### texCoords

```ml
texCoords
```

Texture corners used to map the flare image onto its screen-facing quad.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_flares_runtime.ml#L61)
