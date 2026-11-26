# `mq3.renderer.tr_backend_runtime.Entity`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-backend-runtime-ml-370216411.md)

<a id="struct-struct-mq3-renderer-tr-backend-runtime-entity-struct-entity-src-mq3-renderer-tr-backend-runtime-ml-1347216083"></a>
## Entity

```ml
struct Entity
```

Data record for `mq3.renderer.tr_backend_runtime.Entity`; groups `shaderTime`, `renderfx`, `needDlights`, `modelMatrix`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L115)

## Members

<a id="field-field-mq3-renderer-tr-backend-runtime-entity-modelmatrix-modelmatrix-src-mq3-renderer-tr-backend-runtime-ml-1209207326"></a>
### modelMatrix

```ml
modelMatrix
```

Matrix placing the model in the current view or world coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L123)

<a id="field-field-mq3-renderer-tr-backend-runtime-entity-needdlights-needdlights-src-mq3-renderer-tr-backend-runtime-ml-119714654"></a>
### needDlights

```ml
needDlights
```

Whether the entity must receive dynamic-light processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L121)

<a id="field-field-mq3-renderer-tr-backend-runtime-entity-renderfx-renderfx-src-mq3-renderer-tr-backend-runtime-ml-751819606"></a>
### renderfx

```ml
renderfx
```

Bit mask of entity rendering options, such as depth hack or shadow suppression.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L119)

<a id="field-field-mq3-renderer-tr-backend-runtime-entity-shadertime-shadertime-src-mq3-renderer-tr-backend-runtime-ml-258617234"></a>
### shaderTime

```ml
shaderTime
```

Time offset in seconds subtracted from the view time for entity shader effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_backend_runtime.ml#L117)
