# `mq3.renderer.tr_shade_runtime.DebugPlan`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-shade-runtime-ml-605145768.md)

<a id="struct-struct-mq3-renderer-tr-shade-runtime-debugplan-struct-debugplan-src-mq3-renderer-tr-shade-runtime-ml-1103145239"></a>
## DebugPlan

```ml
struct DebugPlan
```

Data record for `mq3.renderer.tr_shade_runtime.DebugPlan`; groups `mode`, `indexes`, `vertices`, `depthNear`, `depthFar`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L49)

## Members

<a id="field-field-mq3-renderer-tr-shade-runtime-debugplan-depthfar-depthfar-src-mq3-renderer-tr-shade-runtime-ml-704340521"></a>
### depthFar

```ml
depthFar
```

Far end of the depth range used by the debug pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L59)

<a id="field-field-mq3-renderer-tr-shade-runtime-debugplan-depthnear-depthnear-src-mq3-renderer-tr-shade-runtime-ml-163472569"></a>
### depthNear

```ml
depthNear
```

Near end of the depth range used by the debug pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L57)

<a id="field-field-mq3-renderer-tr-shade-runtime-debugplan-indexes-indexes-src-mq3-renderer-tr-shade-runtime-ml-680962377"></a>
### indexes

```ml
indexes
```

Index sequence used when drawing the surface's debug triangles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L53)

<a id="field-field-mq3-renderer-tr-shade-runtime-debugplan-mode-mode-src-mq3-renderer-tr-shade-runtime-ml-1262114347"></a>
### mode

```ml
mode
```

Primitive mode used to draw the debug geometry, such as triangles or lines.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L51)

<a id="field-field-mq3-renderer-tr-shade-runtime-debugplan-vertices-vertices-src-mq3-renderer-tr-shade-runtime-ml-686908503"></a>
### vertices

```ml
vertices
```

Explicit line vertices used to visualize normals or other surface debug geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L55)
