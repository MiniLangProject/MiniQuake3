# `mq3.client.cgame_view.RenderEntity`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-view-ml-1544499938.md)

<a id="struct-struct-mq3-client-cgame-view-renderentity-struct-renderentity-src-mq3-client-cgame-view-ml-40050405"></a>
## RenderEntity

```ml
struct RenderEntity
```

Stores client game view render entity record, including `reType`, `origin`, `axis`, `frame`, `oldframe`, `backlerp` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_view.ml#L82)

## Members

<a id="field-field-mq3-client-cgame-view-renderentity-axis-axis-src-mq3-client-cgame-view-ml-559697702"></a>
### axis

```ml
axis
```

Three orientation basis vectors used to transform the rendered object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_view.ml#L88)

<a id="field-field-mq3-client-cgame-view-renderentity-backlerp-backlerp-src-mq3-client-cgame-view-ml-98206364"></a>
### backlerp

```ml
backlerp
```

Previous-frame weight used to interpolate the submitted model entity presented by first-person view construction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_view.ml#L95)

<a id="field-field-mq3-client-cgame-view-renderentity-dispatched-dispatched-src-mq3-client-cgame-view-ml-118540874"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while building the camera view and submitting scene-related work; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_view.ml#L111)

<a id="field-field-mq3-client-cgame-view-renderentity-frame-frame-src-mq3-client-cgame-view-ml-741667140"></a>
### frame

```ml
frame
```

Model animation frame selected for the view or test-model render entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_view.ml#L90)

<a id="field-field-mq3-client-cgame-view-renderentity-model-model-src-mq3-client-cgame-view-ml-2037233232"></a>
### model

```ml
model
```

Model resource selected for rendering the object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_view.ml#L97)

<a id="field-field-mq3-client-cgame-view-renderentity-oldframe-oldframe-src-mq3-client-cgame-view-ml-1600064920"></a>
### oldframe

```ml
oldframe
```

Previous model frame used as the interpolation starting point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_view.ml#L92)

<a id="field-field-mq3-client-cgame-view-renderentity-origin-origin-src-mq3-client-cgame-view-ml-1622918508"></a>
### origin

```ml
origin
```

World-space placement of a view-submitted entity, such as a test model or damage sprite.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_view.ml#L86)

<a id="field-field-mq3-client-cgame-view-renderentity-radius-radius-src-mq3-client-cgame-view-ml-14933756"></a>
### radius

```ml
radius
```

World-space sprite radius represented in the view-rendering entity record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_view.ml#L104)

<a id="field-field-mq3-client-cgame-view-renderentity-renderfx-renderfx-src-mq3-client-cgame-view-ml-64807276"></a>
### renderfx

```ml
renderfx
```

Renderer-entity flags controlling lighting, view restrictions, depth handling, and related effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_view.ml#L102)

<a id="field-field-mq3-client-cgame-view-renderentity-retype-retype-src-mq3-client-cgame-view-ml-1699390970"></a>
### reType

```ml
reType
```

When constructing this record, `renderEntity` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_view.ml#L84)

<a id="field-field-mq3-client-cgame-view-renderentity-rgba-rgba-src-mq3-client-cgame-view-ml-1407445408"></a>
### rgba

```ml
rgba
```

Red, green, blue, and alpha components used for color modulation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_view.ml#L108)

<a id="field-field-mq3-client-cgame-view-renderentity-shader-shader-src-mq3-client-cgame-view-ml-959942134"></a>
### shader

```ml
shader
```

Material reference assigned to the view-space damage-blend sprite.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_view.ml#L106)

<a id="field-field-mq3-client-cgame-view-renderentity-skinnum-skinnum-src-mq3-client-cgame-view-ml-1289622388"></a>
### skinNum

```ml
skinNum
```

When constructing this record, `renderEntity` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_view.ml#L99)
