# `mq3.game.bg_public.Animation`

[Home](README.md) · [Source file](File-src-mq3-game-bg-public-ml-2091356861.md)

<a id="struct-struct-mq3-game-bg-public-animation-struct-animation-src-mq3-game-bg-public-ml-1574035565"></a>
## Animation

```ml
struct Animation
```

`Animation` record for bg public, containing `firstFrame`, `numFrames`, `loopFrames`, `frameLerp` and `initialLerp` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L206)

## Members

<a id="field-field-mq3-game-bg-public-animation-firstframe-firstframe-src-mq3-game-bg-public-ml-385672435"></a>
### firstFrame

```ml
firstFrame
```

First model frame of this animation sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L208)

<a id="field-field-mq3-game-bg-public-animation-flipflop-flipflop-src-mq3-game-bg-public-ml-1410093341"></a>
### flipflop

```ml
flipflop
```

Nonzero when the animation returns through its frames toward its starting pose.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L220)

<a id="field-field-mq3-game-bg-public-animation-framelerp-framelerp-src-mq3-game-bg-public-ml-1888171481"></a>
### frameLerp

```ml
frameLerp
```

Time in milliseconds between consecutive animation frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L214)

<a id="field-field-mq3-game-bg-public-animation-initiallerp-initiallerp-src-mq3-game-bg-public-ml-1446631573"></a>
### initialLerp

```ml
initialLerp
```

Time in milliseconds used to reach the first animation frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L216)

<a id="field-field-mq3-game-bg-public-animation-loopframes-loopframes-src-mq3-game-bg-public-ml-1178713717"></a>
### loopFrames

```ml
loopFrames
```

Number of trailing animation frames repeated during looping.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L212)

<a id="field-field-mq3-game-bg-public-animation-numframes-numframes-src-mq3-game-bg-public-ml-1796182413"></a>
### numFrames

```ml
numFrames
```

Number of model frames in the animation sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L210)

<a id="field-field-mq3-game-bg-public-animation-reversed-reversed-src-mq3-game-bg-public-ml-1555338297"></a>
### reversed

```ml
reversed
```

Nonzero when the animation plays in reverse order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_public.ml#L218)
