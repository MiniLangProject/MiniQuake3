# `mq3.client.cg_local.LerpFrame`

[Home](README.md) · [Source file](File-src-mq3-client-cg-local-ml-909335699.md)

<a id="struct-struct-mq3-client-cg-local-lerpframe-struct-lerpframe-src-mq3-client-cg-local-ml-789537213"></a>
## LerpFrame

```ml
struct LerpFrame
```

Stores client game local lerp frame record, including `oldFrame`, `oldFrameTime`, `frame`, `frameTime`, `backlerp`, `yawAngle` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L184)

## Members

<a id="field-field-mq3-client-cg-local-lerpframe-animation-animation-src-mq3-client-cg-local-ml-846649711"></a>
### animation

```ml
animation
```

Animation description supplying frame ranges and playback timing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L208)

<a id="field-field-mq3-client-cg-local-lerpframe-animationnumber-animationnumber-src-mq3-client-cg-local-ml-1180103911"></a>
### animationNumber

```ml
animationNumber
```

Selected animation identifier, including the animation-toggle bit when present.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L206)

<a id="field-field-mq3-client-cg-local-lerpframe-animationtime-animationtime-src-mq3-client-cg-local-ml-126838275"></a>
### animationTime

```ml
animationTime
```

Client time in milliseconds at which the first frame of the animation becomes exact.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L210)

<a id="field-field-mq3-client-cg-local-lerpframe-backlerp-backlerp-src-mq3-client-cg-local-ml-364171155"></a>
### backlerp

```ml
backlerp
```

Previous-frame weight used to interpolate the tracked animation presented by the original CGame compatibility records.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L196)

<a id="field-field-mq3-client-cg-local-lerpframe-frame-frame-src-mq3-client-cg-local-ml-515078987"></a>
### frame

```ml
frame
```

Current player-model animation frame being approached by interpolation from oldFrame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L190)

<a id="field-field-mq3-client-cg-local-lerpframe-frametime-frametime-src-mq3-client-cg-local-ml-1604586807"></a>
### frameTime

```ml
frameTime
```

Client presentation timestamp in milliseconds at which interpolation reaches the current model frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L193)

<a id="field-field-mq3-client-cg-local-lerpframe-oldframe-oldframe-src-mq3-client-cg-local-ml-1245954967"></a>
### oldFrame

```ml
oldFrame
```

Previous animation frame used as the interpolation starting point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L186)

<a id="field-field-mq3-client-cg-local-lerpframe-oldframetime-oldframetime-src-mq3-client-cg-local-ml-939924457"></a>
### oldFrameTime

```ml
oldFrameTime
```

Client time in milliseconds at which the previous animation frame was exact.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L188)

<a id="field-field-mq3-client-cg-local-lerpframe-pitchangle-pitchangle-src-mq3-client-cg-local-ml-1424733521"></a>
### pitchAngle

```ml
pitchAngle
```

Smoothed pitch angle used to orient the animated body part.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L202)

<a id="field-field-mq3-client-cg-local-lerpframe-pitching-pitching-src-mq3-client-cg-local-ml-8800127"></a>
### pitching

```ml
pitching
```

True while the body part is turning toward its target pitch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L204)

<a id="field-field-mq3-client-cg-local-lerpframe-yawangle-yawangle-src-mq3-client-cg-local-ml-1354158391"></a>
### yawAngle

```ml
yawAngle
```

Smoothed yaw angle used to orient the animated body part.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L198)

<a id="field-field-mq3-client-cg-local-lerpframe-yawing-yawing-src-mq3-client-cg-local-ml-1251450581"></a>
### yawing

```ml
yawing
```

True while the body part is turning toward its target yaw.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L200)
