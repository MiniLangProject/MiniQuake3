# `mq3.renderer.draw_surfs.DrawSurf`

[Home](README.md) · [Source file](File-src-mq3-renderer-draw-surfs-ml-75092385.md)

<a id="struct-struct-mq3-renderer-draw-surfs-drawsurf-struct-drawsurf-src-mq3-renderer-draw-surfs-ml-2030890547"></a>
## DrawSurf

```ml
struct DrawSurf
```

Data record for `mq3.renderer.draw_surfs.DrawSurf`; groups `sort`, `surface`, `ordinal`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/draw_surfs.ml#L32)

## Members

<a id="field-field-mq3-renderer-draw-surfs-drawsurf-ordinal-ordinal-src-mq3-renderer-draw-surfs-ml-1676980405"></a>
### ordinal

```ml
ordinal
```

Original insertion order used to keep equal sort keys stable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/draw_surfs.ml#L38)

<a id="field-field-mq3-renderer-draw-surfs-drawsurf-sort-sort-src-mq3-renderer-draw-surfs-ml-21191365"></a>
### sort

```ml
sort
```

Packed draw-order key containing the shader, entity, fog, and dynamic-light selectors.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/draw_surfs.ml#L34)

<a id="field-field-mq3-renderer-draw-surfs-drawsurf-surface-surface-src-mq3-renderer-draw-surfs-ml-1280017385"></a>
### surface

```ml
surface
```

Surface record, handle, or identifier associated with the drawing operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/draw_surfs.ml#L36)
