# `mq3.renderer.draw_surfs.SortFields`

[Home](README.md) · [Source file](File-src-mq3-renderer-draw-surfs-ml-75092385.md)

<a id="struct-struct-mq3-renderer-draw-surfs-sortfields-struct-sortfields-src-mq3-renderer-draw-surfs-ml-654801315"></a>
## SortFields

```ml
struct SortFields
```

Data record for `mq3.renderer.draw_surfs.SortFields`; groups `shaderIndex`, `entityNum`, `fogNum`, `dlightMap`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/draw_surfs.ml#L21)

## Members

<a id="field-field-mq3-renderer-draw-surfs-sortfields-dlightmap-dlightmap-src-mq3-renderer-draw-surfs-ml-1550508180"></a>
### dlightMap

```ml
dlightMap
```

Dynamic-light state encoded into the draw-surface sort key.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/draw_surfs.ml#L29)

<a id="field-field-mq3-renderer-draw-surfs-sortfields-entitynum-entitynum-src-mq3-renderer-draw-surfs-ml-761064944"></a>
### entityNum

```ml
entityNum
```

Entity number encoded into the packed draw-surface sort key.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/draw_surfs.ml#L25)

<a id="field-field-mq3-renderer-draw-surfs-sortfields-fognum-fognum-src-mq3-renderer-draw-surfs-ml-530077848"></a>
### fogNum

```ml
fogNum
```

Fog volume number encoded or used by the draw surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/draw_surfs.ml#L27)

<a id="field-field-mq3-renderer-draw-surfs-sortfields-shaderindex-shaderindex-src-mq3-renderer-draw-surfs-ml-1657156192"></a>
### shaderIndex

```ml
shaderIndex
```

Index of the resolved shader in the renderer's shader table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/draw_surfs.ml#L23)
