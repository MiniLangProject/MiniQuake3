# `mq3.renderer.tr_main_runtime.EntitySurface`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-main-runtime-ml-668641946.md)

<a id="struct-struct-mq3-renderer-tr-main-runtime-entitysurface-struct-entitysurface-src-mq3-renderer-tr-main-runtime-ml-1066121405"></a>
## EntitySurface

```ml
struct EntitySurface
```

Data record for `mq3.renderer.tr_main_runtime.EntitySurface`; groups `entityIndex`, `reType`, `fogNum`, `payload`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L60)

## Members

<a id="field-field-mq3-renderer-tr-main-runtime-entitysurface-entityindex-entityindex-src-mq3-renderer-tr-main-runtime-ml-1600099815"></a>
### entityIndex

```ml
entityIndex
```

Index of the scene entity that produced this geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L62)

<a id="field-field-mq3-renderer-tr-main-runtime-entitysurface-fognum-fognum-src-mq3-renderer-tr-main-runtime-ml-842840067"></a>
### fogNum

```ml
fogNum
```

Fog volume number encoded or used by the draw surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L66)

<a id="field-field-mq3-renderer-tr-main-runtime-entitysurface-payload-payload-src-mq3-renderer-tr-main-runtime-ml-1239776711"></a>
### payload

```ml
payload
```

Operation-specific data interpreted according to the record's command or event type.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L68)

<a id="field-field-mq3-renderer-tr-main-runtime-entitysurface-retype-retype-src-mq3-renderer-tr-main-runtime-ml-59100701"></a>
### reType

```ml
reType
```

Renderer entity type selecting the model, sprite, beam, or portal path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L64)
