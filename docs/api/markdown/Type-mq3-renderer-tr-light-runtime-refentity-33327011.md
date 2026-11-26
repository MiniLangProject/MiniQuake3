# `mq3.renderer.tr_light_runtime.RefEntity`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-light-runtime-ml-1502188283.md)

<a id="struct-struct-mq3-renderer-tr-light-runtime-refentity-struct-refentity-src-mq3-renderer-tr-light-runtime-ml-487070929"></a>
## RefEntity

```ml
struct RefEntity
```

Data record for `mq3.renderer.tr_light_runtime.RefEntity`; groups `origin`, `lightingOrigin`, `axis`, `renderfx`, `lightingCalculated`, `ambientLight`, and 4 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L60)

## Members

<a id="field-field-mq3-renderer-tr-light-runtime-refentity-ambientlight-ambientlight-src-mq3-renderer-tr-light-runtime-ml-439522647"></a>
### ambientLight

```ml
ambientLight
```

Ambient light contribution applied to the entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L72)

<a id="field-field-mq3-renderer-tr-light-runtime-refentity-ambientlightint-ambientlightint-src-mq3-renderer-tr-light-runtime-ml-1209209907"></a>
### ambientLightInt

```ml
ambientLightInt
```

Packed integer representation of the entity's ambient color.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L78)

<a id="field-field-mq3-renderer-tr-light-runtime-refentity-axis-axis-src-mq3-renderer-tr-light-runtime-ml-938632201"></a>
### axis

```ml
axis
```

Rendered entity's orientation used to express its sampled lighting direction in local coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L66)

<a id="field-field-mq3-renderer-tr-light-runtime-refentity-directedlight-directedlight-src-mq3-renderer-tr-light-runtime-ml-7380179"></a>
### directedLight

```ml
directedLight
```

Directional light contribution applied to the entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L74)

<a id="field-field-mq3-renderer-tr-light-runtime-refentity-lightdir-lightdir-src-mq3-renderer-tr-light-runtime-ml-445805569"></a>
### lightDir

```ml
lightDir
```

Direction of the dominant light in the entity's coordinate system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L76)

<a id="field-field-mq3-renderer-tr-light-runtime-refentity-lightingcalculated-lightingcalculated-src-mq3-renderer-tr-light-runtime-ml-1061556103"></a>
### lightingCalculated

```ml
lightingCalculated
```

Whether entity lighting has already been computed for this frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L70)

<a id="field-field-mq3-renderer-tr-light-runtime-refentity-lightingorigin-lightingorigin-src-mq3-renderer-tr-light-runtime-ml-1181018151"></a>
### lightingOrigin

```ml
lightingOrigin
```

Alternate position used to give multipart models consistent lighting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L64)

<a id="field-field-mq3-renderer-tr-light-runtime-refentity-needdlights-needdlights-src-mq3-renderer-tr-light-runtime-ml-1153829223"></a>
### needDlights

```ml
needDlights
```

Whether the entity must receive dynamic-light processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L80)

<a id="field-field-mq3-renderer-tr-light-runtime-refentity-origin-origin-src-mq3-renderer-tr-light-runtime-ml-614617771"></a>
### origin

```ml
origin
```

Entity placement used as the default point for baked-light-grid sampling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L62)

<a id="field-field-mq3-renderer-tr-light-runtime-refentity-renderfx-renderfx-src-mq3-renderer-tr-light-runtime-ml-887542683"></a>
### renderfx

```ml
renderfx
```

Bit mask of entity rendering options, such as depth hack or shadow suppression.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_light_runtime.ml#L68)
