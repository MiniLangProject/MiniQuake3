# `mq3.renderer.qvm_scene_materials.Binding`

[Home](README.md) · [Source file](File-src-mq3-renderer-qvm-scene-materials-ml-310916497.md)

<a id="struct-struct-mq3-renderer-qvm-scene-materials-binding-struct-binding-src-mq3-renderer-qvm-scene-materials-ml-1627153387"></a>
## Binding

```ml
struct Binding
```

Data record for `mq3.renderer.qvm_scene_materials.Binding`; groups `shaderHandle`, `customSkin`, `shaderName`, `surfaceName`, `materialIndex`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L23)

## Members

<a id="field-field-mq3-renderer-qvm-scene-materials-binding-customskin-customskin-src-mq3-renderer-qvm-scene-materials-ml-2126404638"></a>
### customSkin

```ml
customSkin
```

Explicit skin handle overriding the model's default skin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L27)

<a id="field-field-mq3-renderer-qvm-scene-materials-binding-materialindex-materialindex-src-mq3-renderer-qvm-scene-materials-ml-1019237630"></a>
### materialIndex

```ml
materialIndex
```

Index of the resolved material in the material catalog.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L33)

<a id="field-field-mq3-renderer-qvm-scene-materials-binding-shaderhandle-shaderhandle-src-mq3-renderer-qvm-scene-materials-ml-932709460"></a>
### shaderHandle

```ml
shaderHandle
```

Registered shader handle used to resolve the drawing material.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L25)

<a id="field-field-mq3-renderer-qvm-scene-materials-binding-shadername-shadername-src-mq3-renderer-qvm-scene-materials-ml-2067393854"></a>
### shaderName

```ml
shaderName
```

Skin-selected shader name associated with a model surface during scene material resolution.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L29)

<a id="field-field-mq3-renderer-qvm-scene-materials-binding-surfacename-surfacename-src-mq3-renderer-qvm-scene-materials-ml-634150394"></a>
### surfaceName

```ml
surfaceName
```

Model-surface name used to select a skin or material mapping.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_materials.ml#L31)
