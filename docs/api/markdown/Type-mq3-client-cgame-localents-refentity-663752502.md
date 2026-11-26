# `mq3.client.cgame_localents.RefEntity`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-localents-ml-2123896286.md)

<a id="struct-struct-mq3-client-cgame-localents-refentity-struct-refentity-src-mq3-client-cgame-localents-ml-1445334249"></a>
## RefEntity

```ml
struct RefEntity
```

Stores client game localents ref entity record, including `reType`, `origin`, `lightingOrigin`, `axis`, `shaderRGBA`, `radius` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L106)

## Members

<a id="field-field-mq3-client-cgame-localents-refentity-axis-axis-src-mq3-client-cgame-localents-ml-2059359569"></a>
### axis

```ml
axis
```

Three orientation basis vectors used to transform the rendered object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L115)

<a id="field-field-mq3-client-cgame-localents-refentity-customshader-customshader-src-mq3-client-cgame-localents-ml-2116312419"></a>
### customShader

```ml
customShader
```

Shader resource selected for custom rendering.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L124)

<a id="field-field-mq3-client-cgame-localents-refentity-hmodel-hmodel-src-mq3-client-cgame-localents-ml-4268877"></a>
### hModel

```ml
hModel
```

Model resource selected for the h presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L122)

<a id="field-field-mq3-client-cgame-localents-refentity-lightingorigin-lightingorigin-src-mq3-client-cgame-localents-ml-1717712483"></a>
### lightingOrigin

```ml
lightingOrigin
```

When constructing this record, `newRefEntity` supplies `[0.0,0.0,0.0]` for this member. Used by `addFragment` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L113)

<a id="field-field-mq3-client-cgame-localents-refentity-nonnormalizedaxes-nonnormalizedaxes-src-mq3-client-cgame-localents-ml-1732329611"></a>
### nonNormalizedAxes

```ml
nonNormalizedAxes
```

When constructing this record, `newRefEntity` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L131)

<a id="field-field-mq3-client-cgame-localents-refentity-origin-origin-src-mq3-client-cgame-localents-ml-1588674067"></a>
### origin

```ml
origin
```

Current renderer-facing position of a local fragment, sprite, or other temporary effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L110)

<a id="field-field-mq3-client-cgame-localents-refentity-radius-radius-src-mq3-client-cgame-localents-ml-1301113347"></a>
### radius

```ml
radius
```

Current world-space sprite radius submitted for a temporary local effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L120)

<a id="field-field-mq3-client-cgame-localents-refentity-renderfx-renderfx-src-mq3-client-cgame-localents-ml-426876779"></a>
### renderfx

```ml
renderfx
```

Renderer-entity flags controlling lighting, view restrictions, depth handling, and related effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L129)

<a id="field-field-mq3-client-cgame-localents-refentity-retype-retype-src-mq3-client-cgame-localents-ml-1849225413"></a>
### reType

```ml
reType
```

When constructing this record, `newRefEntity` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L108)

<a id="field-field-mq3-client-cgame-localents-refentity-shaderrgba-shaderrgba-src-mq3-client-cgame-localents-ml-962066137"></a>
### shaderRGBA

```ml
shaderRGBA
```

When constructing this record, `newRefEntity` supplies `[255,255,255,255]` for this member. Used by `addFragment` and `addFadeRGB` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L118)

<a id="field-field-mq3-client-cgame-localents-refentity-shadertime-shadertime-src-mq3-client-cgame-localents-ml-343229695"></a>
### shaderTime

```ml
shaderTime
```

When constructing this record, `newRefEntity` supplies `0.0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L126)
