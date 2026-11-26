# `mq3.renderer.tr_light_runtime.LightResult`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-light-runtime-ml-1502188283.md)

<a id="struct-struct-mq3-renderer-tr-light-runtime-lightresult-struct-lightresult-src-mq3-renderer-tr-light-runtime-ml-1108594727"></a>
## LightResult

```ml
struct LightResult
```

Data record for `mq3.renderer.tr_light_runtime.LightResult`; groups `found`, `ambientLight`, `directedLight`, `lightDir`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_light_runtime.ml#L90)

## Members

<a id="field-field-mq3-renderer-tr-light-runtime-lightresult-ambientlight-ambientlight-src-mq3-renderer-tr-light-runtime-ml-42648126"></a>
### ambientLight

```ml
ambientLight
```

Ambient light contribution applied to the entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_light_runtime.ml#L94)

<a id="field-field-mq3-renderer-tr-light-runtime-lightresult-directedlight-directedlight-src-mq3-renderer-tr-light-runtime-ml-649511514"></a>
### directedLight

```ml
directedLight
```

Directional light contribution applied to the entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_light_runtime.ml#L96)

<a id="field-field-mq3-renderer-tr-light-runtime-lightresult-found-found-src-mq3-renderer-tr-light-runtime-ml-578669802"></a>
### found

```ml
found
```

Whether the requested object or result was found.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_light_runtime.ml#L92)

<a id="field-field-mq3-renderer-tr-light-runtime-lightresult-lightdir-lightdir-src-mq3-renderer-tr-light-runtime-ml-932089432"></a>
### lightDir

```ml
lightDir
```

Direction of the dominant light in the entity's coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_light_runtime.ml#L98)
