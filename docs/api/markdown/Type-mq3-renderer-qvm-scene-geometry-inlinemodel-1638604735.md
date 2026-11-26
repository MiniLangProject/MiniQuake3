# `mq3.renderer.qvm_scene_geometry.InlineModel`

[Home](README.md) · [Source file](File-src-mq3-renderer-qvm-scene-geometry-ml-51177627.md)

<a id="struct-struct-mq3-renderer-qvm-scene-geometry-inlinemodel-struct-inlinemodel-src-mq3-renderer-qvm-scene-geometry-ml-1670468945"></a>
## InlineModel

```ml
struct InlineModel
```

Data record for `mq3.renderer.qvm_scene_geometry.InlineModel`; groups `index`, `renderData`, `shaderNames`, `bounds`, `dynamicLightFlags`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_geometry.ml#L142)

## Members

<a id="field-field-mq3-renderer-qvm-scene-geometry-inlinemodel-bounds-bounds-src-mq3-renderer-qvm-scene-geometry-ml-361963573"></a>
### bounds

```ml
bounds
```

Minimum and maximum corners enclosing the object or surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_geometry.ml#L150)

<a id="field-field-mq3-renderer-qvm-scene-geometry-inlinemodel-dynamiclightflags-dynamiclightflags-src-mq3-renderer-qvm-scene-geometry-ml-681619359"></a>
### dynamicLightFlags

```ml
dynamicLightFlags
```

Dynamic-light eligibility flags associated with the inline model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_geometry.ml#L152)

<a id="field-field-mq3-renderer-qvm-scene-geometry-inlinemodel-index-index-src-mq3-renderer-qvm-scene-geometry-ml-1491193659"></a>
### index

```ml
index
```

Position of this record in its owning table or list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_geometry.ml#L144)

<a id="field-field-mq3-renderer-qvm-scene-geometry-inlinemodel-renderdata-renderdata-src-mq3-renderer-qvm-scene-geometry-ml-509596319"></a>
### renderData

```ml
renderData
```

Prepared triangle and vertex data used to render the world or model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_geometry.ml#L146)

<a id="field-field-mq3-renderer-qvm-scene-geometry-inlinemodel-shadernames-shadernames-src-mq3-renderer-qvm-scene-geometry-ml-461229567"></a>
### shaderNames

```ml
shaderNames
```

Shader names associated with the model's surfaces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_geometry.ml#L148)
