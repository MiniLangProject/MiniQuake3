# `mq3.renderer.tr_shade_runtime.MultiPlan`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-shade-runtime-ml-605145768.md)

<a id="struct-struct-mq3-renderer-tr-shade-runtime-multiplan-struct-multiplan-src-mq3-renderer-tr-shade-runtime-ml-1060487663"></a>
## MultiPlan

```ml
struct MultiPlan
```

Data record for `mq3.renderer.tr_shade_runtime.MultiPlan`; groups `texture0`, `texture1`, `environment`, `portalFill`, `indexCount`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_runtime.ml#L104)

## Members

<a id="field-field-mq3-renderer-tr-shade-runtime-multiplan-environment-environment-src-mq3-renderer-tr-shade-runtime-ml-1915663559"></a>
### environment

```ml
environment
```

Texture-environment combine mode selected for the merged pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_runtime.ml#L110)

<a id="field-field-mq3-renderer-tr-shade-runtime-multiplan-indexcount-indexcount-src-mq3-renderer-tr-shade-runtime-ml-1422902177"></a>
### indexCount

```ml
indexCount
```

Number of vertex indices submitted by the drawing plan.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_runtime.ml#L114)

<a id="field-field-mq3-renderer-tr-shade-runtime-multiplan-portalfill-portalfill-src-mq3-renderer-tr-shade-runtime-ml-381496341"></a>
### portalFill

```ml
portalFill
```

Whether the multitexture pass also fills the portal surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_runtime.ml#L112)

<a id="field-field-mq3-renderer-tr-shade-runtime-multiplan-texture0-texture0-src-mq3-renderer-tr-shade-runtime-ml-344917449"></a>
### texture0

```ml
texture0
```

Texture data, coordinates, or binding used by the first texture unit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_runtime.ml#L106)

<a id="field-field-mq3-renderer-tr-shade-runtime-multiplan-texture1-texture1-src-mq3-renderer-tr-shade-runtime-ml-1201265011"></a>
### texture1

```ml
texture1
```

Texture data, coordinates, or binding used by the second texture unit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_shade_runtime.ml#L108)
