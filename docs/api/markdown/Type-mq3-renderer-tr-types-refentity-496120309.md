# `mq3.renderer.tr_types.RefEntity`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-types-ml-1757535937.md)

<a id="struct-struct-mq3-renderer-tr-types-refentity-struct-refentity-src-mq3-renderer-tr-types-ml-111644529"></a>
## RefEntity

```ml
struct RefEntity
```

Data record for `mq3.renderer.tr_types.RefEntity`; groups `reType`, `renderfx`, `hModel`, `lightingOrigin`, `shadowPlane`, `axis`, and 14 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L104)

## Members

<a id="field-field-mq3-renderer-tr-types-refentity-axis-axis-src-mq3-renderer-tr-types-ml-424289717"></a>
### axis

```ml
axis
```

Public entity orientation basis; nonNormalizedAxes indicates whether it also carries scale.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L116)

<a id="field-field-mq3-renderer-tr-types-refentity-backlerp-backlerp-src-mq3-renderer-tr-types-ml-507392907"></a>
### backlerp

```ml
backlerp
```

Interpolation weight of the previous frame: zero selects current, one selects previous.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L129)

<a id="field-field-mq3-renderer-tr-types-refentity-customshader-customshader-src-mq3-renderer-tr-types-ml-465766695"></a>
### customShader

```ml
customShader
```

Shader handle overriding the entity's normal surface shaders.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L135)

<a id="field-field-mq3-renderer-tr-types-refentity-customskin-customskin-src-mq3-renderer-tr-types-ml-871595859"></a>
### customSkin

```ml
customSkin
```

Explicit skin handle overriding the model's default skin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L133)

<a id="field-field-mq3-renderer-tr-types-refentity-frame-frame-src-mq3-renderer-tr-types-ml-465575491"></a>
### frame

```ml
frame
```

Current model animation-frame index.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L123)

<a id="field-field-mq3-renderer-tr-types-refentity-hmodel-hmodel-src-mq3-renderer-tr-types-ml-1550644465"></a>
### hModel

```ml
hModel
```

Registered model handle used to obtain the entity's geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L110)

<a id="field-field-mq3-renderer-tr-types-refentity-lightingorigin-lightingorigin-src-mq3-renderer-tr-types-ml-1258277871"></a>
### lightingOrigin

```ml
lightingOrigin
```

Alternate position used to give multipart models consistent lighting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L112)

<a id="field-field-mq3-renderer-tr-types-refentity-nonnormalizedaxes-nonnormalizedaxes-src-mq3-renderer-tr-types-ml-110800343"></a>
### nonNormalizedAxes

```ml
nonNormalizedAxes
```

Whether the orientation basis also contains scaling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L118)

<a id="field-field-mq3-renderer-tr-types-refentity-oldframe-oldframe-src-mq3-renderer-tr-types-ml-19150647"></a>
### oldframe

```ml
oldframe
```

Previous animation frame used for interpolation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L127)

<a id="field-field-mq3-renderer-tr-types-refentity-oldorigin-oldorigin-src-mq3-renderer-tr-types-ml-1331133959"></a>
### oldorigin

```ml
oldorigin
```

Previous entity position used by interpolation or beam geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L125)

<a id="field-field-mq3-renderer-tr-types-refentity-origin-origin-src-mq3-renderer-tr-types-ml-1225423323"></a>
### origin

```ml
origin
```

World-space placement of the public render entity, also serving as the first endpoint for beam-like effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L121)

<a id="field-field-mq3-renderer-tr-types-refentity-radius-radius-src-mq3-renderer-tr-types-ml-1100228203"></a>
### radius

```ml
radius
```

Radius used for the light, sprite, beam, or bounded object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L143)

<a id="field-field-mq3-renderer-tr-types-refentity-renderfx-renderfx-src-mq3-renderer-tr-types-ml-1772603355"></a>
### renderfx

```ml
renderfx
```

Bit mask of entity rendering options, such as depth hack or shadow suppression.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L108)

<a id="field-field-mq3-renderer-tr-types-refentity-retype-retype-src-mq3-renderer-tr-types-ml-56171513"></a>
### reType

```ml
reType
```

Renderer entity type selecting the model, sprite, beam, or portal path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L106)

<a id="field-field-mq3-renderer-tr-types-refentity-rotation-rotation-src-mq3-renderer-tr-types-ml-1577661947"></a>
### rotation

```ml
rotation
```

Sprite rotation angle in degrees.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L145)

<a id="field-field-mq3-renderer-tr-types-refentity-shaderrgba-shaderrgba-src-mq3-renderer-tr-types-ml-2106346037"></a>
### shaderRGBA

```ml
shaderRGBA
```

Entity RGBA color bytes used by entity-driven shader generators.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L137)

<a id="field-field-mq3-renderer-tr-types-refentity-shadertexcoord-shadertexcoord-src-mq3-renderer-tr-types-ml-602862173"></a>
### shaderTexCoord

```ml
shaderTexCoord
```

Entity texture-coordinate offset used by entity-driven texture modifiers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L139)

<a id="field-field-mq3-renderer-tr-types-refentity-shadertime-shadertime-src-mq3-renderer-tr-types-ml-578342375"></a>
### shaderTime

```ml
shaderTime
```

Time offset in seconds subtracted from the view time for entity shader effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L141)

<a id="field-field-mq3-renderer-tr-types-refentity-shadowplane-shadowplane-src-mq3-renderer-tr-types-ml-560404687"></a>
### shadowPlane

```ml
shadowPlane
```

Plane height onto which projection shadows are placed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L114)

<a id="field-field-mq3-renderer-tr-types-refentity-skinnum-skinnum-src-mq3-renderer-tr-types-ml-1724871091"></a>
### skinNum

```ml
skinNum
```

Model skin index selected for this entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_types.ml#L131)
