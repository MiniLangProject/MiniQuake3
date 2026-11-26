# `mq3.renderer.tr_backend_runtime.Shader`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-backend-runtime-ml-370216411.md)

<a id="struct-struct-mq3-renderer-tr-backend-runtime-shader-struct-shader-src-mq3-renderer-tr-backend-runtime-ml-1056062931"></a>
## Shader

```ml
struct Shader
```

Data record for `mq3.renderer.tr_backend_runtime.Shader`; groups `name`, `entityMergable`, `timeOffset`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L139)

## Members

<a id="field-field-mq3-renderer-tr-backend-runtime-shader-entitymergable-entitymergable-src-mq3-renderer-tr-backend-runtime-ml-1498093040"></a>
### entityMergable

```ml
entityMergable
```

Whether surfaces from separate entities may share one shader batch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L143)

<a id="field-field-mq3-renderer-tr-backend-runtime-shader-name-name-src-mq3-renderer-tr-backend-runtime-ml-1505288274"></a>
### name

```ml
name
```

Material name attached to the backend shader batch for identification and diagnostics.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L141)

<a id="field-field-mq3-renderer-tr-backend-runtime-shader-timeoffset-timeoffset-src-mq3-renderer-tr-backend-runtime-ml-1333396432"></a>
### timeOffset

```ml
timeOffset
```

Offset in seconds applied to the material's shader time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L145)
