# `mq3.format.player_animation.FrameSample`

[Home](README.md) · [Source file](File-src-mq3-format-player-animation-ml-408606289.md)

<a id="struct-struct-mq3-format-player-animation-framesample-struct-framesample-src-mq3-format-player-animation-ml-480251215"></a>
## FrameSample

```ml
struct FrameSample
```

FrameSample record for format.player_animation, containing `oldFrame`, `frame`, `backlerp`, `finished`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L84)

## Members

<a id="field-field-mq3-format-player-animation-framesample-backlerp-backlerp-src-mq3-format-player-animation-ml-1224739456"></a>
### backlerp

```ml
backlerp
```

Weight of the previous frame when interpolating toward the current frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L90)

<a id="field-field-mq3-format-player-animation-framesample-finished-finished-src-mq3-format-player-animation-ml-1552259120"></a>
### finished

```ml
finished
```

True after a non-looping animation has reached its final frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L92)

<a id="field-field-mq3-format-player-animation-framesample-frame-frame-src-mq3-format-player-animation-ml-725545532"></a>
### frame

```ml
frame
```

Current animation-frame index used for interpolation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L88)

<a id="field-field-mq3-format-player-animation-framesample-oldframe-oldframe-src-mq3-format-player-animation-ml-277971552"></a>
### oldFrame

```ml
oldFrame
```

Previous animation-frame index used for interpolation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L86)
