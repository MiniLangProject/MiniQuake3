# `mq3.format.player_animation.Animation`

[Home](README.md) · [Source file](File-src-mq3-format-player-animation-ml-408606289.md)

<a id="struct-struct-mq3-format-player-animation-animation-struct-animation-src-mq3-format-player-animation-ml-1444946285"></a>
## Animation

```ml
struct Animation
```

Animation record for format.player_animation, containing `firstFrame`, `numFrames`, `loopFrames`, `frameLerp`, `initialLerp`, `reversed`, and 1 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L52)

## Members

<a id="field-field-mq3-format-player-animation-animation-firstframe-firstframe-src-mq3-format-player-animation-ml-1528108157"></a>
### firstFrame

```ml
firstFrame
```

First frame index in this animation sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L54)

<a id="field-field-mq3-format-player-animation-animation-flipflop-flipflop-src-mq3-format-player-animation-ml-1832550267"></a>
### flipflop

```ml
flipflop
```

True if animation should flipflop back to base.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L66)

<a id="field-field-mq3-format-player-animation-animation-framelerp-framelerp-src-mq3-format-player-animation-ml-1738485199"></a>
### frameLerp

```ml
frameLerp
```

Interpolation interval between animation frames, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L60)

<a id="field-field-mq3-format-player-animation-animation-initiallerp-initiallerp-src-mq3-format-player-animation-ml-35223555"></a>
### initialLerp

```ml
initialLerp
```

Delay before reaching the first animation frame, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L62)

<a id="field-field-mq3-format-player-animation-animation-loopframes-loopframes-src-mq3-format-player-animation-ml-1375967347"></a>
### loopFrames

```ml
loopFrames
```

Number of trailing frames repeated during looping, or zero for a non-looping animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L58)

<a id="field-field-mq3-format-player-animation-animation-numframes-numframes-src-mq3-format-player-animation-ml-896615907"></a>
### numFrames

```ml
numFrames
```

Number of animation frames represented by this model, surface, or animation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L56)

<a id="field-field-mq3-format-player-animation-animation-reversed-reversed-src-mq3-format-player-animation-ml-1766811863"></a>
### reversed

```ml
reversed
```

True if animation is reversed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/player_animation.ml#L64)
