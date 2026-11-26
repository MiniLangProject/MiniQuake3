# `mq3.format.player_animation.LerpFrame`

[Home](README.md) · [Source file](File-src-mq3-format-player-animation-ml-408606289.md)

<a id="struct-struct-mq3-format-player-animation-lerpframe-struct-lerpframe-src-mq3-format-player-animation-ml-527246249"></a>
## LerpFrame

```ml
struct LerpFrame
```

LerpFrame record for format.player_animation, containing `oldFrame`, `oldFrameTime`, `frame`, `frameTime`, `backlerp`, `animationNumber`, and 2 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L102)

## Members

<a id="field-field-mq3-format-player-animation-lerpframe-animation-animation-src-mq3-format-player-animation-ml-1699420451"></a>
### animation

```ml
animation
```

Animation descriptor currently used by the interpolation state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L116)

<a id="field-field-mq3-format-player-animation-lerpframe-animationnumber-animationnumber-src-mq3-format-player-animation-ml-1980385315"></a>
### animationNumber

```ml
animationNumber
```

Identifier of the selected animation, including its restart toggle bit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L114)

<a id="field-field-mq3-format-player-animation-lerpframe-animationtime-animationtime-src-mq3-format-player-animation-ml-578963959"></a>
### animationTime

```ml
animationTime
```

Time at which the selected animation begins advancing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L118)

<a id="field-field-mq3-format-player-animation-lerpframe-backlerp-backlerp-src-mq3-format-player-animation-ml-1606479911"></a>
### backlerp

```ml
backlerp
```

Weight of the previous frame when interpolating toward the current frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L112)

<a id="field-field-mq3-format-player-animation-lerpframe-frame-frame-src-mq3-format-player-animation-ml-1422855359"></a>
### frame

```ml
frame
```

Current animation-frame index used for interpolation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L108)

<a id="field-field-mq3-format-player-animation-lerpframe-frametime-frametime-src-mq3-format-player-animation-ml-1213571307"></a>
### frameTime

```ml
frameTime
```

Time associated with the current interpolation frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L110)

<a id="field-field-mq3-format-player-animation-lerpframe-oldframe-oldframe-src-mq3-format-player-animation-ml-1723648555"></a>
### oldFrame

```ml
oldFrame
```

Previous animation-frame index used for interpolation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L104)

<a id="field-field-mq3-format-player-animation-lerpframe-oldframetime-oldframetime-src-mq3-format-player-animation-ml-1521301193"></a>
### oldFrameTime

```ml
oldFrameTime
```

Time associated with the previous interpolation frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L106)
