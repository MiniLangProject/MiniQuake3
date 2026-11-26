# `mq3.client.ui_local.LerpFrame`

[Home](README.md) · [Source file](File-src-mq3-client-ui-local-ml-681073931.md)

<a id="struct-struct-mq3-client-ui-local-lerpframe-struct-lerpframe-src-mq3-client-ui-local-ml-2008597085"></a>
## LerpFrame

```ml
struct LerpFrame
```

Stores UI local lerp frame record, including `oldFrame`, `oldFrameTime`, `frame`, `frameTime`, `backlerp`, `yawAngle` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L293)

## Members

<a id="field-field-mq3-client-ui-local-lerpframe-animation-animation-src-mq3-client-ui-local-ml-1575461427"></a>
### animation

```ml
animation
```

Animation description supplying frame ranges and playback timing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L317)

<a id="field-field-mq3-client-ui-local-lerpframe-animationnumber-animationnumber-src-mq3-client-ui-local-ml-1390480571"></a>
### animationNumber

```ml
animationNumber
```

Selected animation identifier, including the animation-toggle bit when present.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L315)

<a id="field-field-mq3-client-ui-local-lerpframe-animationtime-animationtime-src-mq3-client-ui-local-ml-573733975"></a>
### animationTime

```ml
animationTime
```

Client time in milliseconds at which the first frame of the animation becomes exact.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L319)

<a id="field-field-mq3-client-ui-local-lerpframe-backlerp-backlerp-src-mq3-client-ui-local-ml-1934842871"></a>
### backlerp

```ml
backlerp
```

Previous-frame weight used to interpolate the tracked animation presented by the original UI compatibility records.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L305)

<a id="field-field-mq3-client-ui-local-lerpframe-frame-frame-src-mq3-client-ui-local-ml-1022705695"></a>
### frame

```ml
frame
```

Current menu preview-model frame being approached by interpolation from oldFrame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L299)

<a id="field-field-mq3-client-ui-local-lerpframe-frametime-frametime-src-mq3-client-ui-local-ml-376492395"></a>
### frameTime

```ml
frameTime
```

UI realtime timestamp in milliseconds at which interpolation reaches the current menu preview-model frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L302)

<a id="field-field-mq3-client-ui-local-lerpframe-oldframe-oldframe-src-mq3-client-ui-local-ml-1585904091"></a>
### oldFrame

```ml
oldFrame
```

Previous animation frame used as the interpolation starting point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L295)

<a id="field-field-mq3-client-ui-local-lerpframe-oldframetime-oldframetime-src-mq3-client-ui-local-ml-1467033341"></a>
### oldFrameTime

```ml
oldFrameTime
```

Client time in milliseconds at which the previous animation frame was exact.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L297)

<a id="field-field-mq3-client-ui-local-lerpframe-pitchangle-pitchangle-src-mq3-client-ui-local-ml-889260133"></a>
### pitchAngle

```ml
pitchAngle
```

Smoothed pitch angle used to orient the animated body part.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L311)

<a id="field-field-mq3-client-ui-local-lerpframe-pitching-pitching-src-mq3-client-ui-local-ml-1848597683"></a>
### pitching

```ml
pitching
```

True while the body part is turning toward its target pitch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L313)

<a id="field-field-mq3-client-ui-local-lerpframe-yawangle-yawangle-src-mq3-client-ui-local-ml-1773124427"></a>
### yawAngle

```ml
yawAngle
```

Smoothed yaw angle used to orient the animated body part.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L307)

<a id="field-field-mq3-client-ui-local-lerpframe-yawing-yawing-src-mq3-client-ui-local-ml-415017033"></a>
### yawing

```ml
yawing
```

True while the body part is turning toward its target yaw.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_local.ml#L309)
