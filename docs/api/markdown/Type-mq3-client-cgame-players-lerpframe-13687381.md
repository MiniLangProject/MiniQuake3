# `mq3.client.cgame_players.LerpFrame`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-players-ml-1793263463.md)

<a id="struct-struct-mq3-client-cgame-players-lerpframe-struct-lerpframe-src-mq3-client-cgame-players-ml-981868077"></a>
## LerpFrame

```ml
struct LerpFrame
```

Stores client game players lerp frame record, including `oldFrame`, `frame`, `oldFrameTime`, `frameTime`, `backlerp`, `animationNumber` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L144)

## Members

<a id="field-field-mq3-client-cgame-players-lerpframe-animation-animation-src-mq3-client-cgame-players-ml-514255181"></a>
### animation

```ml
animation
```

Animation description supplying frame ranges and playback timing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L162)

<a id="field-field-mq3-client-cgame-players-lerpframe-animationnumber-animationnumber-src-mq3-client-cgame-players-ml-1952636317"></a>
### animationNumber

```ml
animationNumber
```

Selected animation identifier, including the animation-toggle bit when present.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L158)

<a id="field-field-mq3-client-cgame-players-lerpframe-animationtime-animationtime-src-mq3-client-cgame-players-ml-1598058905"></a>
### animationTime

```ml
animationTime
```

Client time in milliseconds at which the first frame of the animation becomes exact.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L160)

<a id="field-field-mq3-client-cgame-players-lerpframe-backlerp-backlerp-src-mq3-client-cgame-players-ml-1460790153"></a>
### backlerp

```ml
backlerp
```

Previous-frame weight used to interpolate the tracked animation presented by in-game player model presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L156)

<a id="field-field-mq3-client-cgame-players-lerpframe-frame-frame-src-mq3-client-cgame-players-ml-208873665"></a>
### frame

```ml
frame
```

Current player-model animation frame being approached by interpolation from oldFrame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L148)

<a id="field-field-mq3-client-cgame-players-lerpframe-frametime-frametime-src-mq3-client-cgame-players-ml-522684805"></a>
### frameTime

```ml
frameTime
```

Client presentation timestamp in milliseconds at which interpolation reaches the current model frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L153)

<a id="field-field-mq3-client-cgame-players-lerpframe-oldframe-oldframe-src-mq3-client-cgame-players-ml-794397781"></a>
### oldFrame

```ml
oldFrame
```

Previous animation frame used as the interpolation starting point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L146)

<a id="field-field-mq3-client-cgame-players-lerpframe-oldframetime-oldframetime-src-mq3-client-cgame-players-ml-807186147"></a>
### oldFrameTime

```ml
oldFrameTime
```

Client time in milliseconds at which the previous animation frame was exact.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L150)

<a id="field-field-mq3-client-cgame-players-lerpframe-pitchangle-pitchangle-src-mq3-client-cgame-players-ml-1892012763"></a>
### pitchAngle

```ml
pitchAngle
```

Smoothed pitch angle used to orient the animated body part.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L168)

<a id="field-field-mq3-client-cgame-players-lerpframe-pitching-pitching-src-mq3-client-cgame-players-ml-1669285469"></a>
### pitching

```ml
pitching
```

True while the body part is turning toward its target pitch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L170)

<a id="field-field-mq3-client-cgame-players-lerpframe-yawangle-yawangle-src-mq3-client-cgame-players-ml-557257269"></a>
### yawAngle

```ml
yawAngle
```

Smoothed yaw angle used to orient the animated body part.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L164)

<a id="field-field-mq3-client-cgame-players-lerpframe-yawing-yawing-src-mq3-client-cgame-players-ml-1204447983"></a>
### yawing

```ml
yawing
```

True while the body part is turning toward its target yaw.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_players.ml#L166)
