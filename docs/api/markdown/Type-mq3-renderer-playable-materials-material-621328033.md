# `mq3.renderer.playable_materials.Material`

[Home](README.md) · [Source file](File-src-mq3-renderer-playable-materials-ml-320329628.md)

<a id="struct-struct-mq3-renderer-playable-materials-material-struct-material-src-mq3-renderer-playable-materials-ml-297502745"></a>
## Material

```ml
struct Material
```

Data record for `mq3.renderer.playable_materials.Material`; groups `textureIndex`, `shaderName`, `imageName`, `image`, `slot`, `stages`, and 8 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L129)

## Members

<a id="field-field-mq3-renderer-playable-materials-material-clamptime-clamptime-src-mq3-renderer-playable-materials-ml-1945858194"></a>
### clampTime

```ml
clampTime
```

Upper limit applied to the shader's effect time; zero disables clamping.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L155)

<a id="field-field-mq3-renderer-playable-materials-material-deforms-deforms-src-mq3-renderer-playable-materials-ml-3742578"></a>
### deforms

```ml
deforms
```

Ordered vertex deformations applied by the shader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L143)

<a id="field-field-mq3-renderer-playable-materials-material-image-image-src-mq3-renderer-playable-materials-ml-743137362"></a>
### image

```ml
image
```

Primary world-material image retained alongside its additional runtime stages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L137)

<a id="field-field-mq3-renderer-playable-materials-material-imagename-imagename-src-mq3-renderer-playable-materials-ml-1447508146"></a>
### imageName

```ml
imageName
```

Virtual image path selected for this texture or material.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L135)

<a id="field-field-mq3-renderer-playable-materials-material-nomipmaps-nomipmaps-src-mq3-renderer-playable-materials-ml-665319198"></a>
### noMipMaps

```ml
noMipMaps
```

Whether mipmap generation is disabled for this material's textures.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L151)

<a id="field-field-mq3-renderer-playable-materials-material-nopicmip-nopicmip-src-mq3-renderer-playable-materials-ml-1776481596"></a>
### noPicMip

```ml
noPicMip
```

Whether the material bypasses the global texture downscaling setting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L157)

<a id="field-field-mq3-renderer-playable-materials-material-polygonoffset-polygonoffset-src-mq3-renderer-playable-materials-ml-91781898"></a>
### polygonOffset

```ml
polygonOffset
```

Whether polygon-offset depth bias is applied while drawing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L149)

<a id="field-field-mq3-renderer-playable-materials-material-shadername-shadername-src-mq3-renderer-playable-materials-ml-1924956802"></a>
### shaderName

```ml
shaderName
```

World material name used to locate the parsed shader definition and image stages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L133)

<a id="field-field-mq3-renderer-playable-materials-material-slot-slot-src-mq3-renderer-playable-materials-ml-381131450"></a>
### slot

```ml
slot
```

Texture slot reserved for this image in the native drawing backend.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L139)

<a id="field-field-mq3-renderer-playable-materials-material-sort-sort-src-mq3-renderer-playable-materials-ml-579795954"></a>
### sort

```ml
sort
```

Shader ordering category used to schedule this material relative to other surfaces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L147)

<a id="field-field-mq3-renderer-playable-materials-material-stages-stages-src-mq3-renderer-playable-materials-ml-1643870396"></a>
### stages

```ml
stages
```

Ordered material stages evaluated when the shader is drawn.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L141)

<a id="field-field-mq3-renderer-playable-materials-material-textureindex-textureindex-src-mq3-renderer-playable-materials-ml-822464188"></a>
### textureIndex

```ml
textureIndex
```

Index identifying the texture or BSP shader assigned to the surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L131)

<a id="field-field-mq3-renderer-playable-materials-material-timeoffset-timeoffset-src-mq3-renderer-playable-materials-ml-1945884142"></a>
### timeOffset

```ml
timeOffset
```

Offset in seconds applied to the material's shader time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L153)

<a id="field-field-mq3-renderer-playable-materials-material-twosided-twosided-src-mq3-renderer-playable-materials-ml-1204912772"></a>
### twoSided

```ml
twoSided
```

Whether the material draws both front and back faces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L145)
