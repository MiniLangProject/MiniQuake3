# `mq3.renderer.tr_shade_runtime.FogPlan`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-shade-runtime-ml-605145768.md)

<a id="struct-struct-mq3-renderer-tr-shade-runtime-fogplan-struct-fogplan-src-mq3-renderer-tr-shade-runtime-ml-589363805"></a>
## FogPlan

```ml
struct FogPlan
```

Data record for `mq3.renderer.tr_shade_runtime.FogPlan`; groups `uvs`, `colors`, `indexes`, `depthEqual`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L130)

## Members

<a id="field-field-mq3-renderer-tr-shade-runtime-fogplan-colors-colors-src-mq3-renderer-tr-shade-runtime-ml-1361662816"></a>
### colors

```ml
colors
```

Per-vertex fog colors prepared for the surface's fog-overlay pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L134)

<a id="field-field-mq3-renderer-tr-shade-runtime-fogplan-depthequal-depthequal-src-mq3-renderer-tr-shade-runtime-ml-874054470"></a>
### depthEqual

```ml
depthEqual
```

Whether depth testing accepts only fragments at the existing surface depth.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L138)

<a id="field-field-mq3-renderer-tr-shade-runtime-fogplan-indexes-indexes-src-mq3-renderer-tr-shade-runtime-ml-151843664"></a>
### indexes

```ml
indexes
```

Surface triangle indices submitted by the fog-overlay pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L136)

<a id="field-field-mq3-renderer-tr-shade-runtime-fogplan-uvs-uvs-src-mq3-renderer-tr-shade-runtime-ml-567119792"></a>
### uvs

```ml
uvs
```

Texture coordinates generated for the pass or its vertices.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L132)
