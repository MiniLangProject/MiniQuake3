# `mq3.renderer.surface_grid.GridVertex`

[Home](README.md) · [Source file](File-src-mq3-renderer-surface-grid-ml-668182529.md)

<a id="struct-struct-mq3-renderer-surface-grid-gridvertex-struct-gridvertex-src-mq3-renderer-surface-grid-ml-1988565979"></a>
## GridVertex

```ml
struct GridVertex
```

Data record for `mq3.renderer.surface_grid.GridVertex`; groups `xyz`, `normal`, `st`, `lightmap`, `color`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_grid.ml#L9)

## Members

<a id="field-field-mq3-renderer-surface-grid-gridvertex-color-color-src-mq3-renderer-surface-grid-ml-288415337"></a>
### color

```ml
color
```

Vertex color interpolated across the curved-patch control grid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_grid.ml#L19)

<a id="field-field-mq3-renderer-surface-grid-gridvertex-lightmap-lightmap-src-mq3-renderer-surface-grid-ml-2022651725"></a>
### lightmap

```ml
lightmap
```

Baked-lighting texture coordinates or resource associated with this vertex or patch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_grid.ml#L17)

<a id="field-field-mq3-renderer-surface-grid-gridvertex-normal-normal-src-mq3-renderer-surface-grid-ml-1908610479"></a>
### normal

```ml
normal
```

Interpolated normal of a tessellated curved-patch vertex.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_grid.ml#L13)

<a id="field-field-mq3-renderer-surface-grid-gridvertex-st-st-src-mq3-renderer-surface-grid-ml-9540763"></a>
### st

```ml
st
```

Two-dimensional texture coordinates associated with the vertex.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_grid.ml#L15)

<a id="field-field-mq3-renderer-surface-grid-gridvertex-xyz-xyz-src-mq3-renderer-surface-grid-ml-1433743713"></a>
### xyz

```ml
xyz
```

Three-dimensional position of this vertex.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_grid.ml#L11)
