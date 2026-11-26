# `mq3.client.ui_players.LerpFrame`

[Home](README.md) · [Source file](File-src-mq3-client-ui-players-ml-675454436.md)

<a id="struct-struct-mq3-client-ui-players-lerpframe-struct-lerpframe-src-mq3-client-ui-players-ml-709464071"></a>
## LerpFrame

```ml
struct LerpFrame
```

Stores UI players lerp frame record, including `oldFrame`, `oldFrameTime`, `frame`, `frameTime`, `backlerp`, `yawAngle` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L124)

## Members

<a id="field-field-mq3-client-ui-players-lerpframe-animation-animation-src-mq3-client-ui-players-ml-1755764539"></a>
### animation

```ml
animation
```

Animation description supplying frame ranges and playback timing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L148)

<a id="field-field-mq3-client-ui-players-lerpframe-animationnumber-animationnumber-src-mq3-client-ui-players-ml-1710317955"></a>
### animationNumber

```ml
animationNumber
```

Selected animation identifier, including the animation-toggle bit when present.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L146)

<a id="field-field-mq3-client-ui-players-lerpframe-animationtime-animationtime-src-mq3-client-ui-players-ml-2060562711"></a>
### animationTime

```ml
animationTime
```

Client time in milliseconds at which the first frame of the animation becomes exact.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L150)

<a id="field-field-mq3-client-ui-players-lerpframe-backlerp-backlerp-src-mq3-client-ui-players-ml-1279540971"></a>
### backlerp

```ml
backlerp
```

Previous-frame weight used to interpolate the tracked animation presented by the base-game menu player preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L136)

<a id="field-field-mq3-client-ui-players-lerpframe-frame-frame-src-mq3-client-ui-players-ml-1343030255"></a>
### frame

```ml
frame
```

Current Baseq3 menu preview-model frame being approached by interpolation from oldFrame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L130)

<a id="field-field-mq3-client-ui-players-lerpframe-frametime-frametime-src-mq3-client-ui-players-ml-58367755"></a>
### frameTime

```ml
frameTime
```

UI realtime timestamp in milliseconds at which interpolation reaches the current Baseq3 menu preview-model frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L133)

<a id="field-field-mq3-client-ui-players-lerpframe-oldframe-oldframe-src-mq3-client-ui-players-ml-4836603"></a>
### oldFrame

```ml
oldFrame
```

Previous animation frame used as the interpolation starting point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L126)

<a id="field-field-mq3-client-ui-players-lerpframe-oldframetime-oldframetime-src-mq3-client-ui-players-ml-1629836097"></a>
### oldFrameTime

```ml
oldFrameTime
```

Client time in milliseconds at which the previous animation frame was exact.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L128)

<a id="field-field-mq3-client-ui-players-lerpframe-pitchangle-pitchangle-src-mq3-client-ui-players-ml-1617649873"></a>
### pitchAngle

```ml
pitchAngle
```

Smoothed pitch angle used to orient the animated body part.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L142)

<a id="field-field-mq3-client-ui-players-lerpframe-pitching-pitching-src-mq3-client-ui-players-ml-83650467"></a>
### pitching

```ml
pitching
```

True while the body part is turning toward its target pitch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L144)

<a id="field-field-mq3-client-ui-players-lerpframe-yawangle-yawangle-src-mq3-client-ui-players-ml-621093507"></a>
### yawAngle

```ml
yawAngle
```

Smoothed yaw angle used to orient the animated body part.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L138)

<a id="field-field-mq3-client-ui-players-lerpframe-yawing-yawing-src-mq3-client-ui-players-ml-260323029"></a>
### yawing

```ml
yawing
```

True while the body part is turning toward its target yaw.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/ui_players.ml#L140)
