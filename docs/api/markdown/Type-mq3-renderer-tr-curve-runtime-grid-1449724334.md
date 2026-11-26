# `mq3.renderer.tr_curve_runtime.Grid`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-curve-runtime-ml-98906374.md)

<a id="struct-struct-mq3-renderer-tr-curve-runtime-grid-struct-grid-src-mq3-renderer-tr-curve-runtime-ml-107242409"></a>
## Grid

```ml
struct Grid
```

Data record for `mq3.renderer.tr_curve_runtime.Grid`; groups `surfaceType`, `width`, `height`, `verts`, `widthLodError`, `heightLodError`, and 6 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_curve_runtime.ml#L15)

## Members

<a id="field-field-mq3-renderer-tr-curve-runtime-grid-freed-freed-src-mq3-renderer-tr-curve-runtime-ml-1617390125"></a>
### freed

```ml
freed
```

Whether the grid has been released and must no longer be used.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_curve_runtime.ml#L39)

<a id="field-field-mq3-renderer-tr-curve-runtime-grid-height-height-src-mq3-renderer-tr-curve-runtime-ml-1177540295"></a>
### height

```ml
height
```

Number of rows in the patch vertex grid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_curve_runtime.ml#L21)

<a id="field-field-mq3-renderer-tr-curve-runtime-grid-heightloderror-heightloderror-src-mq3-renderer-tr-curve-runtime-ml-1075988049"></a>
### heightLodError

```ml
heightLodError
```

Per-row geometric error used when selecting patch detail.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_curve_runtime.ml#L27)

<a id="field-field-mq3-renderer-tr-curve-runtime-grid-localorigin-localorigin-src-mq3-renderer-tr-curve-runtime-ml-1346140933"></a>
### localOrigin

```ml
localOrigin
```

Center of the mesh's local-space bounding sphere.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_curve_runtime.ml#L31)

<a id="field-field-mq3-renderer-tr-curve-runtime-grid-lodorigin-lodorigin-src-mq3-renderer-tr-curve-runtime-ml-1600448681"></a>
### lodOrigin

```ml
lodOrigin
```

Reference origin used when evaluating patch level of detail.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_curve_runtime.ml#L35)

<a id="field-field-mq3-renderer-tr-curve-runtime-grid-lodradius-lodradius-src-mq3-renderer-tr-curve-runtime-ml-284459665"></a>
### lodRadius

```ml
lodRadius
```

Reference radius used when evaluating patch level of detail.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_curve_runtime.ml#L37)

<a id="field-field-mq3-renderer-tr-curve-runtime-grid-meshbounds-meshbounds-src-mq3-renderer-tr-curve-runtime-ml-645819549"></a>
### meshBounds

```ml
meshBounds
```

Axis-aligned bounds enclosing the tessellated patch mesh.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_curve_runtime.ml#L29)

<a id="field-field-mq3-renderer-tr-curve-runtime-grid-meshradius-meshradius-src-mq3-renderer-tr-curve-runtime-ml-1447796503"></a>
### meshRadius

```ml
meshRadius
```

Radius of the mesh's local-space bounding sphere.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_curve_runtime.ml#L33)

<a id="field-field-mq3-renderer-tr-curve-runtime-grid-surfacetype-surfacetype-src-mq3-renderer-tr-curve-runtime-ml-814305401"></a>
### surfaceType

```ml
surfaceType
```

Surface-dispatch tag identifying the concrete geometry representation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_curve_runtime.ml#L17)

<a id="field-field-mq3-renderer-tr-curve-runtime-grid-verts-verts-src-mq3-renderer-tr-curve-runtime-ml-1528666497"></a>
### verts

```ml
verts
```

Tessellated patch vertices retained with the grid's bounds and detail-error arrays.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_curve_runtime.ml#L23)

<a id="field-field-mq3-renderer-tr-curve-runtime-grid-width-width-src-mq3-renderer-tr-curve-runtime-ml-259840777"></a>
### width

```ml
width
```

Number of columns in the patch vertex grid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_curve_runtime.ml#L19)

<a id="field-field-mq3-renderer-tr-curve-runtime-grid-widthloderror-widthloderror-src-mq3-renderer-tr-curve-runtime-ml-2038839473"></a>
### widthLodError

```ml
widthLodError
```

Per-column geometric error used when selecting patch detail.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_curve_runtime.ml#L25)
