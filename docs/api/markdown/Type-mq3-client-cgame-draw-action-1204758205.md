# `mq3.client.cgame_draw.Action`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-draw-ml-658265827.md)

<a id="struct-struct-mq3-client-cgame-draw-action-struct-action-src-mq3-client-cgame-draw-ml-772566479"></a>
## Action

```ml
struct Action
```

Stores client game draw queued engine action, including `kind`, `x`, `y`, `width`, `height`, `text` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L70)

## Members

<a id="field-field-mq3-client-cgame-draw-action-client-client-src-mq3-client-cgame-draw-ml-62808231"></a>
### client

```ml
client
```

Player slot associated with this score or client-side record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L92)

<a id="field-field-mq3-client-cgame-draw-action-color-color-src-mq3-client-cgame-draw-ml-577582617"></a>
### color

```ml
color
```

RGBA tint associated with this HUD text, image, or fill request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L87)

<a id="field-field-mq3-client-cgame-draw-action-dispatched-dispatched-src-mq3-client-cgame-draw-ml-1859355751"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while drawing status indicators, crosshairs, votes, and timed HUD feedback; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L95)

<a id="field-field-mq3-client-cgame-draw-action-height-height-src-mq3-client-cgame-draw-ml-1272183471"></a>
### height

```ml
height
```

Height of the image, bar, or rectangle requested by this HUD action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L81)

<a id="field-field-mq3-client-cgame-draw-action-kind-kind-src-mq3-client-cgame-draw-ml-1926018033"></a>
### kind

```ml
kind
```

Operation selector telling the host how to interpret a request emitted while drawing status indicators, crosshairs, votes, and timed HUD feedback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L73)

<a id="field-field-mq3-client-cgame-draw-action-shader-shader-src-mq3-client-cgame-draw-ml-1209821867"></a>
### shader

```ml
shader
```

Image material selected by a HUD picture or textured-rectangle action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L85)

<a id="field-field-mq3-client-cgame-draw-action-text-text-src-mq3-client-cgame-draw-ml-1755610895"></a>
### text

```ml
text
```

HUD string to draw, or serialized texture coordinates when the action describes a font glyph.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L83)

<a id="field-field-mq3-client-cgame-draw-action-value-value-src-mq3-client-cgame-draw-ml-484886281"></a>
### value

```ml
value
```

Value payload supplied to the selected host operation while drawing status indicators, crosshairs, votes, and timed HUD feedback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L90)

<a id="field-field-mq3-client-cgame-draw-action-width-width-src-mq3-client-cgame-draw-ml-1203235169"></a>
### width

```ml
width
```

Width of the image, bar, or rectangle requested by this HUD action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L79)

<a id="field-field-mq3-client-cgame-draw-action-x-x-src-mq3-client-cgame-draw-ml-828847477"></a>
### x

```ml
x
```

Horizontal coordinate of a base-game HUD drawing request in the virtual screen layout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L75)

<a id="field-field-mq3-client-cgame-draw-action-y-y-src-mq3-client-cgame-draw-ml-1119789881"></a>
### y

```ml
y
```

Vertical coordinate of a base-game HUD drawing request in the virtual screen layout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_draw.ml#L77)
