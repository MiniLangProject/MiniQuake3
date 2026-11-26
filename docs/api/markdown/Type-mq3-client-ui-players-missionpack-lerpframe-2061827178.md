# `mq3.client.ui_players_missionpack.LerpFrame`

[Home](README.md) · [Source file](File-src-mq3-client-ui-players-missionpack-ml-1990652480.md)

<a id="struct-struct-mq3-client-ui-players-missionpack-lerpframe-struct-lerpframe-src-mq3-client-ui-players-missionpack-ml-914619963"></a>
## LerpFrame

```ml
struct LerpFrame
```

Stores UI players missionpack lerp frame record, including `oldFrame`, `oldFrameTime`, `frame`, `frameTime`, `backlerp`, `yawAngle` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L125)

## Members

<a id="field-field-mq3-client-ui-players-missionpack-lerpframe-animation-animation-src-mq3-client-ui-players-missionpack-ml-617863179"></a>
### animation

```ml
animation
```

Animation description supplying frame ranges and playback timing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L149)

<a id="field-field-mq3-client-ui-players-missionpack-lerpframe-animationnumber-animationnumber-src-mq3-client-ui-players-missionpack-ml-1755049219"></a>
### animationNumber

```ml
animationNumber
```

Selected animation identifier, including the animation-toggle bit when present.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L147)

<a id="field-field-mq3-client-ui-players-missionpack-lerpframe-animationtime-animationtime-src-mq3-client-ui-players-missionpack-ml-712013063"></a>
### animationTime

```ml
animationTime
```

Client time in milliseconds at which the first frame of the animation becomes exact.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L151)

<a id="field-field-mq3-client-ui-players-missionpack-lerpframe-backlerp-backlerp-src-mq3-client-ui-players-missionpack-ml-996774955"></a>
### backlerp

```ml
backlerp
```

Previous-frame weight used to interpolate the tracked animation presented by the Missionpack menu player preview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L137)

<a id="field-field-mq3-client-ui-players-missionpack-lerpframe-frame-frame-src-mq3-client-ui-players-missionpack-ml-1240041087"></a>
### frame

```ml
frame
```

Current Missionpack menu preview-model frame being approached by interpolation from oldFrame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L131)

<a id="field-field-mq3-client-ui-players-missionpack-lerpframe-frametime-frametime-src-mq3-client-ui-players-missionpack-ml-666393595"></a>
### frameTime

```ml
frameTime
```

UI realtime timestamp in milliseconds at which interpolation reaches the current Missionpack menu preview-model frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L134)

<a id="field-field-mq3-client-ui-players-missionpack-lerpframe-oldframe-oldframe-src-mq3-client-ui-players-missionpack-ml-1437386283"></a>
### oldFrame

```ml
oldFrame
```

Previous animation frame used as the interpolation starting point.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L127)

<a id="field-field-mq3-client-ui-players-missionpack-lerpframe-oldframetime-oldframetime-src-mq3-client-ui-players-missionpack-ml-1729569125"></a>
### oldFrameTime

```ml
oldFrameTime
```

Client time in milliseconds at which the previous animation frame was exact.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L129)

<a id="field-field-mq3-client-ui-players-missionpack-lerpframe-pitchangle-pitchangle-src-mq3-client-ui-players-missionpack-ml-2114689877"></a>
### pitchAngle

```ml
pitchAngle
```

Smoothed pitch angle used to orient the animated body part.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L143)

<a id="field-field-mq3-client-ui-players-missionpack-lerpframe-pitching-pitching-src-mq3-client-ui-players-missionpack-ml-1334242371"></a>
### pitching

```ml
pitching
```

True while the body part is turning toward its target pitch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L145)

<a id="field-field-mq3-client-ui-players-missionpack-lerpframe-yawangle-yawangle-src-mq3-client-ui-players-missionpack-ml-736491251"></a>
### yawAngle

```ml
yawAngle
```

Smoothed yaw angle used to orient the animated body part.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L139)

<a id="field-field-mq3-client-ui-players-missionpack-lerpframe-yawing-yawing-src-mq3-client-ui-players-missionpack-ml-907965737"></a>
### yawing

```ml
yawing
```

True while the body part is turning toward its target yaw.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_players_missionpack.ml#L141)
