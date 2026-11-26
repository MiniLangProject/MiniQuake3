# `mq3.client.cgame_newdraw.Action`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-newdraw-ml-909882749.md)

<a id="struct-struct-mq3-client-cgame-newdraw-action-struct-action-src-mq3-client-cgame-newdraw-ml-1966549495"></a>
## Action

```ml
struct Action
```

Stores client game newdraw queued engine action, including `boundary`, `kind`, `rect`, `text`, `shader`, `model` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L318)

## Members

<a id="field-field-mq3-client-cgame-newdraw-action-boundary-boundary-src-mq3-client-cgame-newdraw-ml-1748088263"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while drawing Missionpack owner-draw widgets and their associated media.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L321)

<a id="field-field-mq3-client-cgame-newdraw-action-client-client-src-mq3-client-cgame-newdraw-ml-1820174865"></a>
### client

```ml
client
```

Player slot associated with this score or client-side record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L339)

<a id="field-field-mq3-client-cgame-newdraw-action-color-color-src-mq3-client-cgame-newdraw-ml-1122911511"></a>
### color

```ml
color
```

RGBA modulation copied into an owner-drawn client-game HUD request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L334)

<a id="field-field-mq3-client-cgame-newdraw-action-dispatched-dispatched-src-mq3-client-cgame-newdraw-ml-588826641"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while drawing Missionpack owner-draw widgets and their associated media; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L342)

<a id="field-field-mq3-client-cgame-newdraw-action-kind-kind-src-mq3-client-cgame-newdraw-ml-991735055"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while drawing Missionpack owner-draw widgets and their associated media.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L324)

<a id="field-field-mq3-client-cgame-newdraw-action-model-model-src-mq3-client-cgame-newdraw-ml-137435155"></a>
### model

```ml
model
```

Model resource selected for rendering the object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L332)

<a id="field-field-mq3-client-cgame-newdraw-action-rect-rect-src-mq3-client-cgame-newdraw-ml-1123769047"></a>
### rect

```ml
rect
```

Primary rectangle used to position and size the UI element.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L326)

<a id="field-field-mq3-client-cgame-newdraw-action-shader-shader-src-mq3-client-cgame-newdraw-ml-2107784981"></a>
### shader

```ml
shader
```

Image material supplied to an owner-drawn HUD icon, flag, medal, or picture request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L330)

<a id="field-field-mq3-client-cgame-newdraw-action-text-text-src-mq3-client-cgame-newdraw-ml-1803029817"></a>
### text

```ml
text
```

Missionpack HUD text or flag-team selector interpreted by the owner-draw action kind.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L328)

<a id="field-field-mq3-client-cgame-newdraw-action-value-value-src-mq3-client-cgame-newdraw-ml-1510593223"></a>
### value

```ml
value
```

Value payload supplied to the selected host operation while drawing Missionpack owner-draw widgets and their associated media.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_newdraw.ml#L337)
