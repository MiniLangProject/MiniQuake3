# `mq3.renderer.tr_model_runtime.Model`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-model-runtime-ml-2083580560.md)

<a id="struct-struct-mq3-renderer-tr-model-runtime-model-struct-model-src-mq3-renderer-tr-model-runtime-ml-430291173"></a>
## Model

```ml
struct Model
```

Data record for `mq3.renderer.tr_model_runtime.Model`; groups `name`, `type`, `index`, `dataSize`, `brushBounds`, `md3`, and 2 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L62)

## Members

<a id="field-field-mq3-renderer-tr-model-runtime-model-brushbounds-brushbounds-src-mq3-renderer-tr-model-runtime-ml-1749964098"></a>
### brushBounds

```ml
brushBounds
```

Axis-aligned bounds of the inline brush model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L72)

<a id="field-field-mq3-renderer-tr-model-runtime-model-datasize-datasize-src-mq3-renderer-tr-model-runtime-ml-1671825824"></a>
### dataSize

```ml
dataSize
```

Size in bytes of the loaded model or world data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L70)

<a id="field-field-mq3-renderer-tr-model-runtime-model-index-index-src-mq3-renderer-tr-model-runtime-ml-1174234342"></a>
### index

```ml
index
```

Position of this record in its owning table or list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L68)

<a id="field-field-mq3-renderer-tr-model-runtime-model-md3-md3-src-mq3-renderer-tr-model-runtime-ml-1794454866"></a>
### md3

```ml
md3
```

Loaded MD3 model data used for mesh animation and bounds queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L74)

<a id="field-field-mq3-renderer-tr-model-runtime-model-md4-md4-src-mq3-renderer-tr-model-runtime-ml-981641134"></a>
### md4

```ml
md4
```

Loaded MD4 skeletal model data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L76)

<a id="field-field-mq3-renderer-tr-model-runtime-model-name-name-src-mq3-renderer-tr-model-runtime-ml-1884550476"></a>
### name

```ml
name
```

Model registration key shared by BSP, MD3, and MD4 resource lookup.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L64)

<a id="field-field-mq3-renderer-tr-model-runtime-model-numlods-numlods-src-mq3-renderer-tr-model-runtime-ml-1059013726"></a>
### numLods

```ml
numLods
```

Number of level-of-detail variants stored in the model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L78)

<a id="field-field-mq3-renderer-tr-model-runtime-model-type-type-src-mq3-renderer-tr-model-runtime-ml-1180376978"></a>
### type

```ml
type
```

Model representation tag selecting invalid, BSP brush, MD3, or MD4 data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_model_runtime.ml#L66)
