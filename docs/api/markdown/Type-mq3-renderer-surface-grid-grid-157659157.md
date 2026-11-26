# `mq3.renderer.surface_grid.Grid`

[Home](README.md) · [Source file](File-src-mq3-renderer-surface-grid-ml-668182529.md)

<a id="struct-struct-mq3-renderer-surface-grid-grid-struct-grid-src-mq3-renderer-surface-grid-ml-2071020995"></a>
## Grid

```ml
struct Grid
```

Data record for `mq3.renderer.surface_grid.Grid`; groups `width`, `height`, `widthLodError`, `heightLodError`, `verts`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_grid.ml#L22)

## Members

<a id="field-field-mq3-renderer-surface-grid-grid-height-height-src-mq3-renderer-surface-grid-ml-363597289"></a>
### height

```ml
height
```

Number of rows in the patch vertex grid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_grid.ml#L26)

<a id="field-field-mq3-renderer-surface-grid-grid-heightloderror-heightloderror-src-mq3-renderer-surface-grid-ml-990024887"></a>
### heightLodError

```ml
heightLodError
```

Per-row geometric error used when selecting patch detail.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_grid.ml#L30)

<a id="field-field-mq3-renderer-surface-grid-grid-verts-verts-src-mq3-renderer-surface-grid-ml-1317394011"></a>
### verts

```ml
verts
```

Row-major vertex grid used for curved-patch detail selection and tessellation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_grid.ml#L32)

<a id="field-field-mq3-renderer-surface-grid-grid-width-width-src-mq3-renderer-surface-grid-ml-1220928379"></a>
### width

```ml
width
```

Number of columns in the patch vertex grid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_grid.ml#L24)

<a id="field-field-mq3-renderer-surface-grid-grid-widthloderror-widthloderror-src-mq3-renderer-surface-grid-ml-1726704139"></a>
### widthLodError

```ml
widthLodError
```

Per-column geometric error used when selecting patch detail.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_grid.ml#L28)
