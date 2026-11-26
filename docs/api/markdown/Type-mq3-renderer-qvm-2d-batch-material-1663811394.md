# `mq3.renderer.qvm_2d_batch.Material`

[Home](README.md) · [Source file](File-src-mq3-renderer-qvm-2d-batch-ml-1820350507.md)

<a id="struct-struct-mq3-renderer-qvm-2d-batch-material-struct-material-src-mq3-renderer-qvm-2d-batch-ml-138791"></a>
## Material

```ml
struct Material
```

Data record for `mq3.renderer.qvm_2d_batch.Material`; groups `shaderHandle`, `shaderName`, `stages`, `noMipMaps`, `timeOffset`, `clampTime`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L67)

## Members

<a id="field-field-mq3-renderer-qvm-2d-batch-material-clamptime-clamptime-src-mq3-renderer-qvm-2d-batch-ml-1803016672"></a>
### clampTime

```ml
clampTime
```

Upper limit applied to the shader's effect time; zero disables clamping.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L79)

<a id="field-field-mq3-renderer-qvm-2d-batch-material-nomipmaps-nomipmaps-src-mq3-renderer-qvm-2d-batch-ml-11811092"></a>
### noMipMaps

```ml
noMipMaps
```

Whether mipmap generation is disabled for this material's textures.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L75)

<a id="field-field-mq3-renderer-qvm-2d-batch-material-shaderhandle-shaderhandle-src-mq3-renderer-qvm-2d-batch-ml-1345983490"></a>
### shaderHandle

```ml
shaderHandle
```

Registered shader handle used to resolve the drawing material.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L69)

<a id="field-field-mq3-renderer-qvm-2d-batch-material-shadername-shadername-src-mq3-renderer-qvm-2d-batch-ml-1682713384"></a>
### shaderName

```ml
shaderName
```

Two-dimensional material name whose stages are cached for drawing rectangles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L71)

<a id="field-field-mq3-renderer-qvm-2d-batch-material-stages-stages-src-mq3-renderer-qvm-2d-batch-ml-1378547702"></a>
### stages

```ml
stages
```

Ordered material stages evaluated when the shader is drawn.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L73)

<a id="field-field-mq3-renderer-qvm-2d-batch-material-timeoffset-timeoffset-src-mq3-renderer-qvm-2d-batch-ml-621555808"></a>
### timeOffset

```ml
timeOffset
```

Offset in seconds applied to the material's shader time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L77)
