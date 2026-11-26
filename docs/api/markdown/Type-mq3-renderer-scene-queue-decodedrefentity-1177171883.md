# `mq3.renderer.scene_queue.DecodedRefEntity`

[Home](README.md) · [Source file](File-src-mq3-renderer-scene-queue-ml-703423413.md)

<a id="struct-struct-mq3-renderer-scene-queue-decodedrefentity-struct-decodedrefentity-src-mq3-renderer-scene-queue-ml-253139187"></a>
## DecodedRefEntity

```ml
struct DecodedRefEntity
```

Data record for `mq3.renderer.scene_queue.DecodedRefEntity`; groups `reType`, `renderfx`, `hModel`, `lightingOrigin`, `shadowPlane`, `axis`, and 14 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/scene_queue.ml#L51)

## Members

<a id="field-field-mq3-renderer-scene-queue-decodedrefentity-axis-axis-src-mq3-renderer-scene-queue-ml-1649128959"></a>
### axis

```ml
axis
```

Entity basis decoded from the VM record, including scaling when non-normalized axes are permitted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/scene_queue.ml#L63)

<a id="field-field-mq3-renderer-scene-queue-decodedrefentity-backlerp-backlerp-src-mq3-renderer-scene-queue-ml-1621990685"></a>
### backlerp

```ml
backlerp
```

Interpolation weight of the previous frame: zero selects current, one selects previous.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/scene_queue.ml#L75)

<a id="field-field-mq3-renderer-scene-queue-decodedrefentity-customshader-customshader-src-mq3-renderer-scene-queue-ml-1121296425"></a>
### customShader

```ml
customShader
```

Shader handle overriding the entity's normal surface shaders.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/scene_queue.ml#L81)

<a id="field-field-mq3-renderer-scene-queue-decodedrefentity-customskin-customskin-src-mq3-renderer-scene-queue-ml-1259095565"></a>
### customSkin

```ml
customSkin
```

Explicit skin handle overriding the model's default skin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/scene_queue.ml#L79)

<a id="field-field-mq3-renderer-scene-queue-decodedrefentity-frame-frame-src-mq3-renderer-scene-queue-ml-1535142885"></a>
### frame

```ml
frame
```

Current model animation-frame index.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/scene_queue.ml#L69)

<a id="field-field-mq3-renderer-scene-queue-decodedrefentity-hmodel-hmodel-src-mq3-renderer-scene-queue-ml-1768433507"></a>
### hModel

```ml
hModel
```

Registered model handle used to obtain the entity's geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/scene_queue.ml#L57)

<a id="field-field-mq3-renderer-scene-queue-decodedrefentity-lightingorigin-lightingorigin-src-mq3-renderer-scene-queue-ml-165697009"></a>
### lightingOrigin

```ml
lightingOrigin
```

Alternate position used to give multipart models consistent lighting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/scene_queue.ml#L59)

<a id="field-field-mq3-renderer-scene-queue-decodedrefentity-nonnormalizedaxes-nonnormalizedaxes-src-mq3-renderer-scene-queue-ml-1460728697"></a>
### nonNormalizedAxes

```ml
nonNormalizedAxes
```

Whether the orientation basis also contains scaling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/scene_queue.ml#L65)

<a id="field-field-mq3-renderer-scene-queue-decodedrefentity-oldframe-oldframe-src-mq3-renderer-scene-queue-ml-217465577"></a>
### oldframe

```ml
oldframe
```

Previous animation frame used for interpolation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/scene_queue.ml#L73)

<a id="field-field-mq3-renderer-scene-queue-decodedrefentity-oldorigin-oldorigin-src-mq3-renderer-scene-queue-ml-1530673465"></a>
### oldorigin

```ml
oldorigin
```

Previous entity position used by interpolation or beam geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/scene_queue.ml#L71)

<a id="field-field-mq3-renderer-scene-queue-decodedrefentity-origin-origin-src-mq3-renderer-scene-queue-ml-500117941"></a>
### origin

```ml
origin
```

World-space placement read from the submitted entity's VM renderer record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/scene_queue.ml#L67)

<a id="field-field-mq3-renderer-scene-queue-decodedrefentity-radius-radius-src-mq3-renderer-scene-queue-ml-370052205"></a>
### radius

```ml
radius
```

Radius used for the light, sprite, beam, or bounded object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/scene_queue.ml#L89)

<a id="field-field-mq3-renderer-scene-queue-decodedrefentity-renderfx-renderfx-src-mq3-renderer-scene-queue-ml-1792536421"></a>
### renderfx

```ml
renderfx
```

Bit mask of entity rendering options, such as depth hack or shadow suppression.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/scene_queue.ml#L55)

<a id="field-field-mq3-renderer-scene-queue-decodedrefentity-retype-retype-src-mq3-renderer-scene-queue-ml-1870549219"></a>
### reType

```ml
reType
```

Renderer entity type selecting the model, sprite, beam, or portal path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/scene_queue.ml#L53)

<a id="field-field-mq3-renderer-scene-queue-decodedrefentity-rotation-rotation-src-mq3-renderer-scene-queue-ml-2026448469"></a>
### rotation

```ml
rotation
```

Sprite rotation angle in degrees.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/scene_queue.ml#L91)

<a id="field-field-mq3-renderer-scene-queue-decodedrefentity-shaderrgba-shaderrgba-src-mq3-renderer-scene-queue-ml-1458872655"></a>
### shaderRGBA

```ml
shaderRGBA
```

Entity RGBA color bytes used by entity-driven shader generators.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/scene_queue.ml#L83)

<a id="field-field-mq3-renderer-scene-queue-decodedrefentity-shadertexcoord-shadertexcoord-src-mq3-renderer-scene-queue-ml-1440794695"></a>
### shaderTexCoord

```ml
shaderTexCoord
```

Entity texture-coordinate offset used by entity-driven texture modifiers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/scene_queue.ml#L85)

<a id="field-field-mq3-renderer-scene-queue-decodedrefentity-shadertime-shadertime-src-mq3-renderer-scene-queue-ml-2102626441"></a>
### shaderTime

```ml
shaderTime
```

Time offset in seconds subtracted from the view time for entity shader effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/scene_queue.ml#L87)

<a id="field-field-mq3-renderer-scene-queue-decodedrefentity-shadowplane-shadowplane-src-mq3-renderer-scene-queue-ml-285222201"></a>
### shadowPlane

```ml
shadowPlane
```

Plane height onto which projection shadows are placed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/scene_queue.ml#L61)

<a id="field-field-mq3-renderer-scene-queue-decodedrefentity-skinnum-skinnum-src-mq3-renderer-scene-queue-ml-1292668357"></a>
### skinNum

```ml
skinNum
```

Model skin index selected for this entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/scene_queue.ml#L77)
