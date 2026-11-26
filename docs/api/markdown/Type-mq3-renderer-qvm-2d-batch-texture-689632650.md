# `mq3.renderer.qvm_2d_batch.Texture`

[Home](README.md) · [Source file](File-src-mq3-renderer-qvm-2d-batch-ml-1820350507.md)

<a id="struct-struct-mq3-renderer-qvm-2d-batch-texture-struct-texture-src-mq3-renderer-qvm-2d-batch-ml-1306954883"></a>
## Texture

```ml
struct Texture
```

Data record for `mq3.renderer.qvm_2d_batch.Texture`; groups `imageName`, `image`, `slot`, `noMipMaps`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L56)

## Members

<a id="field-field-mq3-renderer-qvm-2d-batch-texture-image-image-src-mq3-renderer-qvm-2d-batch-ml-1051761828"></a>
### image

```ml
image
```

Decoded image cached for two-dimensional shader drawing and native texture upload.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L60)

<a id="field-field-mq3-renderer-qvm-2d-batch-texture-imagename-imagename-src-mq3-renderer-qvm-2d-batch-ml-2007271812"></a>
### imageName

```ml
imageName
```

Virtual image path selected for this texture or material.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L58)

<a id="field-field-mq3-renderer-qvm-2d-batch-texture-nomipmaps-nomipmaps-src-mq3-renderer-qvm-2d-batch-ml-1994446776"></a>
### noMipMaps

```ml
noMipMaps
```

Whether mipmap generation is disabled for this material's textures.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L64)

<a id="field-field-mq3-renderer-qvm-2d-batch-texture-slot-slot-src-mq3-renderer-qvm-2d-batch-ml-873359992"></a>
### slot

```ml
slot
```

Texture slot reserved for this image in the native drawing backend.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L62)
