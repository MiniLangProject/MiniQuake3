# `mq3.renderer.tr_model_runtime.Md4Model`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-model-runtime-ml-2083580560.md)

<a id="struct-struct-mq3-renderer-tr-model-runtime-md4model-struct-md4model-src-mq3-renderer-tr-model-runtime-ml-1895154977"></a>
## Md4Model

```ml
struct Md4Model
```

Data record for `mq3.renderer.tr_model_runtime.Md4Model`; groups `name`, `numFrames`, `numBones`, `frames`, `lods`, `bounds`, and 1 further field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_model_runtime.ml#L45)

## Members

<a id="field-field-mq3-renderer-tr-model-runtime-md4model-bounds-bounds-src-mq3-renderer-tr-model-runtime-ml-484096395"></a>
### bounds

```ml
bounds
```

Minimum and maximum corners enclosing the object or surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_model_runtime.ml#L57)

<a id="field-field-mq3-renderer-tr-model-runtime-md4model-datasize-datasize-src-mq3-renderer-tr-model-runtime-ml-1214075215"></a>
### dataSize

```ml
dataSize
```

Size in bytes of the loaded model or world data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_model_runtime.ml#L59)

<a id="field-field-mq3-renderer-tr-model-runtime-md4model-frames-frames-src-mq3-renderer-tr-model-runtime-ml-140923201"></a>
### frames

```ml
frames
```

Per-frame animation data retained for model interpolation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_model_runtime.ml#L53)

<a id="field-field-mq3-renderer-tr-model-runtime-md4model-lods-lods-src-mq3-renderer-tr-model-runtime-ml-1301235173"></a>
### lods

```ml
lods
```

Model surfaces grouped by level-of-detail tier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_model_runtime.ml#L55)

<a id="field-field-mq3-renderer-tr-model-runtime-md4model-name-name-src-mq3-renderer-tr-model-runtime-ml-1117944599"></a>
### name

```ml
name
```

Asset name assigned to the loaded MD4 skeletal model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_model_runtime.ml#L47)

<a id="field-field-mq3-renderer-tr-model-runtime-md4model-numbones-numbones-src-mq3-renderer-tr-model-runtime-ml-1849048491"></a>
### numBones

```ml
numBones
```

Number of bones stored in the skeletal model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_model_runtime.ml#L51)

<a id="field-field-mq3-renderer-tr-model-runtime-md4model-numframes-numframes-src-mq3-renderer-tr-model-runtime-ml-1901362241"></a>
### numFrames

```ml
numFrames
```

Number of animation frames stored in the model surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_model_runtime.ml#L49)
