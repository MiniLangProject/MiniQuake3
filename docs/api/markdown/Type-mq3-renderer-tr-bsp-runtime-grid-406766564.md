# `mq3.renderer.tr_bsp_runtime.Grid`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-bsp-runtime-ml-595364148.md)

<a id="struct-struct-mq3-renderer-tr-bsp-runtime-grid-struct-grid-src-mq3-renderer-tr-bsp-runtime-ml-723785969"></a>
## Grid

```ml
struct Grid
```

Data record for `mq3.renderer.tr_bsp_runtime.Grid`; groups `control`, `width`, `height`, `widthLodError`, `heightLodError`, `lodOrigin`, and 3 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L130)

## Members

<a id="field-field-mq3-renderer-tr-bsp-runtime-grid-control-control-src-mq3-renderer-tr-bsp-runtime-ml-1077121289"></a>
### control

```ml
control
```

Original BSP patch control points used to construct the tessellated grid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L132)

<a id="field-field-mq3-renderer-tr-bsp-runtime-grid-height-height-src-mq3-renderer-tr-bsp-runtime-ml-881755771"></a>
### height

```ml
height
```

Number of rows in the patch vertex grid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L136)

<a id="field-field-mq3-renderer-tr-bsp-runtime-grid-heightloderror-heightloderror-src-mq3-renderer-tr-bsp-runtime-ml-1092144537"></a>
### heightLodError

```ml
heightLodError
```

Per-row geometric error used when selecting patch detail.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L140)

<a id="field-field-mq3-renderer-tr-bsp-runtime-grid-lodfixed-lodfixed-src-mq3-renderer-tr-bsp-runtime-ml-1078328759"></a>
### lodFixed

```ml
lodFixed
```

Whether patch edge detail has been reconciled with neighboring patches.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L146)

<a id="field-field-mq3-renderer-tr-bsp-runtime-grid-lodorigin-lodorigin-src-mq3-renderer-tr-bsp-runtime-ml-985642897"></a>
### lodOrigin

```ml
lodOrigin
```

Reference origin used when evaluating patch level of detail.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L142)

<a id="field-field-mq3-renderer-tr-bsp-runtime-grid-lodradius-lodradius-src-mq3-renderer-tr-bsp-runtime-ml-743487249"></a>
### lodRadius

```ml
lodRadius
```

Reference radius used when evaluating patch level of detail.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L144)

<a id="field-field-mq3-renderer-tr-bsp-runtime-grid-lodstitched-lodstitched-src-mq3-renderer-tr-bsp-runtime-ml-2063725637"></a>
### lodStitched

```ml
lodStitched
```

Whether the patch grid has been stitched to adjacent geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L148)

<a id="field-field-mq3-renderer-tr-bsp-runtime-grid-width-width-src-mq3-renderer-tr-bsp-runtime-ml-1671694641"></a>
### width

```ml
width
```

Number of columns in the patch vertex grid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L134)

<a id="field-field-mq3-renderer-tr-bsp-runtime-grid-widthloderror-widthloderror-src-mq3-renderer-tr-bsp-runtime-ml-584355833"></a>
### widthLodError

```ml
widthLodError
```

Per-column geometric error used when selecting patch detail.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L138)
