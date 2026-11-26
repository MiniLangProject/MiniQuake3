# `mq3.renderer.qvm_scene_materials.Material`

[Home](README.md) · [Source file](File-src-mq3-renderer-qvm-scene-materials-ml-310916497.md)

<a id="struct-struct-mq3-renderer-qvm-scene-materials-material-struct-material-src-mq3-renderer-qvm-scene-materials-ml-1327389003"></a>
## Material

```ml
struct Material
```

Field layout intentionally matches playable_materials.Material so the existing multi-pass native batch path can consume QVM materials directly.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L46)

## Members

<a id="field-field-mq3-renderer-qvm-scene-materials-material-clamptime-clamptime-src-mq3-renderer-qvm-scene-materials-ml-700728136"></a>
### clampTime

```ml
clampTime
```

Upper limit applied to the shader's effect time; zero disables clamping.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L72)

<a id="field-field-mq3-renderer-qvm-scene-materials-material-deforms-deforms-src-mq3-renderer-qvm-scene-materials-ml-1506042088"></a>
### deforms

```ml
deforms
```

Ordered vertex deformations applied by the shader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L60)

<a id="field-field-mq3-renderer-qvm-scene-materials-material-image-image-src-mq3-renderer-qvm-scene-materials-ml-171443080"></a>
### image

```ml
image
```

Primary decoded image retained with the resolved scene material.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L54)

<a id="field-field-mq3-renderer-qvm-scene-materials-material-imagename-imagename-src-mq3-renderer-qvm-scene-materials-ml-109596200"></a>
### imageName

```ml
imageName
```

Virtual image path selected for this texture or material.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L52)

<a id="field-field-mq3-renderer-qvm-scene-materials-material-nomipmaps-nomipmaps-src-mq3-renderer-qvm-scene-materials-ml-213673308"></a>
### noMipMaps

```ml
noMipMaps
```

Whether mipmap generation is disabled for this material's textures.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L68)

<a id="field-field-mq3-renderer-qvm-scene-materials-material-nopicmip-nopicmip-src-mq3-renderer-qvm-scene-materials-ml-241573618"></a>
### noPicMip

```ml
noPicMip
```

Whether the material bypasses the global texture downscaling setting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L74)

<a id="field-field-mq3-renderer-qvm-scene-materials-material-polygonoffset-polygonoffset-src-mq3-renderer-qvm-scene-materials-ml-1190716928"></a>
### polygonOffset

```ml
polygonOffset
```

Whether polygon-offset depth bias is applied while drawing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L66)

<a id="field-field-mq3-renderer-qvm-scene-materials-material-shadername-shadername-src-mq3-renderer-qvm-scene-materials-ml-22112"></a>
### shaderName

```ml
shaderName
```

Resolved scene material name used to select its runtime texture stages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L50)

<a id="field-field-mq3-renderer-qvm-scene-materials-material-slot-slot-src-mq3-renderer-qvm-scene-materials-ml-783239932"></a>
### slot

```ml
slot
```

Texture slot reserved for this image in the native drawing backend.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L56)

<a id="field-field-mq3-renderer-qvm-scene-materials-material-sort-sort-src-mq3-renderer-qvm-scene-materials-ml-824323168"></a>
### sort

```ml
sort
```

Shader ordering category used to schedule this material relative to other surfaces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L64)

<a id="field-field-mq3-renderer-qvm-scene-materials-material-stages-stages-src-mq3-renderer-qvm-scene-materials-ml-1647515546"></a>
### stages

```ml
stages
```

Ordered material stages evaluated when the shader is drawn.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L58)

<a id="field-field-mq3-renderer-qvm-scene-materials-material-textureindex-textureindex-src-mq3-renderer-qvm-scene-materials-ml-549120558"></a>
### textureIndex

```ml
textureIndex
```

Index identifying the texture or BSP shader assigned to the surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L48)

<a id="field-field-mq3-renderer-qvm-scene-materials-material-timeoffset-timeoffset-src-mq3-renderer-qvm-scene-materials-ml-1333311848"></a>
### timeOffset

```ml
timeOffset
```

Offset in seconds applied to the material's shader time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L70)

<a id="field-field-mq3-renderer-qvm-scene-materials-material-twosided-twosided-src-mq3-renderer-qvm-scene-materials-ml-1043115938"></a>
### twoSided

```ml
twoSided
```

Whether the material draws both front and back faces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_materials.ml#L62)
