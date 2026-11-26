# `mq3.client.cgame_ents.RenderEntity`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-ents-ml-1890303843.md)

<a id="struct-struct-mq3-client-cgame-ents-renderentity-struct-renderentity-src-mq3-client-cgame-ents-ml-710285143"></a>
## RenderEntity

```ml
struct RenderEntity
```

Stores client game ents render entity record, including `reType`, `origin`, `oldorigin`, `lightingOrigin`, `axis`, `frame` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L59)

## Members

<a id="field-field-mq3-client-cgame-ents-renderentity-axis-axis-src-mq3-client-cgame-ents-ml-1935825360"></a>
### axis

```ml
axis
```

Three orientation basis vectors used to transform the rendered object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L69)

<a id="field-field-mq3-client-cgame-ents-renderentity-backlerp-backlerp-src-mq3-client-cgame-ents-ml-345353150"></a>
### backlerp

```ml
backlerp
```

Previous-frame weight used to interpolate the submitted model entity presented by snapshot-entity presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L76)

<a id="field-field-mq3-client-cgame-ents-renderentity-frame-frame-src-mq3-client-cgame-ents-ml-705266866"></a>
### frame

```ml
frame
```

Current model frame submitted when presenting the client-game entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L71)

<a id="field-field-mq3-client-cgame-ents-renderentity-lightingorigin-lightingorigin-src-mq3-client-cgame-ents-ml-668458830"></a>
### lightingOrigin

```ml
lightingOrigin
```

When constructing this record, `renderEntity` supplies `[0.0,0.0,0.0]` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L67)

<a id="field-field-mq3-client-cgame-ents-renderentity-model-model-src-mq3-client-cgame-ents-ml-1068646254"></a>
### model

```ml
model
```

Model resource selected for rendering the object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L78)

<a id="field-field-mq3-client-cgame-ents-renderentity-model2-model2-src-mq3-client-cgame-ents-ml-737293384"></a>
### model2

```ml
model2
```

When constructing this record, `renderEntity` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L80)

<a id="field-field-mq3-client-cgame-ents-renderentity-nonnormalized-nonnormalized-src-mq3-client-cgame-ents-ml-1421760942"></a>
### nonNormalized

```ml
nonNormalized
```

When constructing this record, `renderEntity` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L94)

<a id="field-field-mq3-client-cgame-ents-renderentity-oldframe-oldframe-src-mq3-client-cgame-ents-ml-286732734"></a>
### oldframe

```ml
oldframe
```

Previous model frame used as the interpolation starting point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L73)

<a id="field-field-mq3-client-cgame-ents-renderentity-oldorigin-oldorigin-src-mq3-client-cgame-ents-ml-1310354358"></a>
### oldorigin

```ml
oldorigin
```

Previous position used for interpolation, trails, or rendering a line segment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L65)

<a id="field-field-mq3-client-cgame-ents-renderentity-origin-origin-src-mq3-client-cgame-ents-ml-1693019534"></a>
### origin

```ml
origin
```

Interpolated world-space origin of the entity submitted to the renderer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L63)

<a id="field-field-mq3-client-cgame-ents-renderentity-radius-radius-src-mq3-client-cgame-ents-ml-823579790"></a>
### radius

```ml
radius
```

World-space sprite radius carried by this client entity render submission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L87)

<a id="field-field-mq3-client-cgame-ents-renderentity-renderfx-renderfx-src-mq3-client-cgame-ents-ml-1200715814"></a>
### renderfx

```ml
renderfx
```

Renderer-entity flags controlling lighting, view restrictions, depth handling, and related effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L92)

<a id="field-field-mq3-client-cgame-ents-renderentity-retype-retype-src-mq3-client-cgame-ents-ml-1535234996"></a>
### reType

```ml
reType
```

When constructing this record, `renderEntity` supplies `RT_MODEL` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L61)

<a id="field-field-mq3-client-cgame-ents-renderentity-rotation-rotation-src-mq3-client-cgame-ents-ml-1668380422"></a>
### rotation

```ml
rotation
```

When constructing this record, `renderEntity` supplies `0.0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L89)

<a id="field-field-mq3-client-cgame-ents-renderentity-shader-shader-src-mq3-client-cgame-ents-ml-1519150764"></a>
### shader

```ml
shader
```

Scene-kind-dependent payload holding an item or weapon selector, or packed RGB for a constant-light request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L83)

<a id="field-field-mq3-client-cgame-ents-renderentity-skin-skin-src-mq3-client-cgame-ents-ml-904172908"></a>
### skin

```ml
skin
```

Skin resource selected for rendering the model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L85)
