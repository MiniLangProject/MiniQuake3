# `mq3.renderer.md4_animation.DrawSurface`

[Home](README.md) · [Source file](File-src-mq3-renderer-md4-animation-ml-17219499.md)

<a id="struct-struct-mq3-renderer-md4-animation-drawsurface-struct-drawsurface-src-mq3-renderer-md4-animation-ml-1680592747"></a>
## DrawSurface

```ml
struct DrawSurface
```

Data record for `mq3.renderer.md4_animation.DrawSurface`; groups `surfaceIndex`, `shaderIndex`, `fogNum`, `dlightMap`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/md4_animation.ml#L47)

## Members

<a id="field-field-mq3-renderer-md4-animation-drawsurface-dlightmap-dlightmap-src-mq3-renderer-md4-animation-ml-1348041766"></a>
### dlightMap

```ml
dlightMap
```

Dynamic-light state encoded into the draw-surface sort key.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/md4_animation.ml#L55)

<a id="field-field-mq3-renderer-md4-animation-drawsurface-fognum-fognum-src-mq3-renderer-md4-animation-ml-56737738"></a>
### fogNum

```ml
fogNum
```

Fog volume number encoded or used by the draw surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/md4_animation.ml#L53)

<a id="field-field-mq3-renderer-md4-animation-drawsurface-shaderindex-shaderindex-src-mq3-renderer-md4-animation-ml-222340610"></a>
### shaderIndex

```ml
shaderIndex
```

Index of the resolved shader in the renderer's shader table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/md4_animation.ml#L51)

<a id="field-field-mq3-renderer-md4-animation-drawsurface-surfaceindex-surfaceindex-src-mq3-renderer-md4-animation-ml-951028708"></a>
### surfaceIndex

```ml
surfaceIndex
```

Index of the source surface within the model or world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/md4_animation.ml#L49)
