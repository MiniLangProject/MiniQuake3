# `mq3.botlib.ai_move_runtime.FuncBobState`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-move-runtime-ml-1991141291.md)

<a id="struct-struct-mq3-botlib-ai-move-runtime-funcbobstate-struct-funcbobstate-src-mq3-botlib-ai-move-runtime-ml-616706119"></a>
## FuncBobState

```ml
struct FuncBobState
```

`FuncBobState` record for ai move runtime, containing `onMover`, `start`, `finish`, `origin` and `bottomCenter` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L220)

## Members

<a id="field-field-mq3-botlib-ai-move-runtime-funcbobstate-bottomcenter-bottomcenter-src-mq3-botlib-ai-move-runtime-ml-628284707"></a>
### bottomCenter

```ml
bottomCenter
```

Center of the mover's lower support surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L230)

<a id="field-field-mq3-botlib-ai-move-runtime-funcbobstate-finish-finish-src-mq3-botlib-ai-move-runtime-ml-1057066417"></a>
### finish

```ml
finish
```

Destination endpoint of the bobbing platform trajectory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L226)

<a id="field-field-mq3-botlib-ai-move-runtime-funcbobstate-maxbarrier-maxbarrier-src-mq3-botlib-ai-move-runtime-ml-643399865"></a>
### maxBarrier

```ml
maxBarrier
```

Maximum obstacle height accepted by a barrier-jump prediction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L232)

<a id="field-field-mq3-botlib-ai-move-runtime-funcbobstate-onmover-onmover-src-mq3-botlib-ai-move-runtime-ml-1650427423"></a>
### onMover

```ml
onMover
```

True when the bot is standing on the queried moving platform.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L222)

<a id="field-field-mq3-botlib-ai-move-runtime-funcbobstate-origin-origin-src-mq3-botlib-ai-move-runtime-ml-1947849643"></a>
### origin

```ml
origin
```

Current world-space center of the bobbing platform used to decide boarding and departure.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L228)

<a id="field-field-mq3-botlib-ai-move-runtime-funcbobstate-start-start-src-mq3-botlib-ai-move-runtime-ml-796161271"></a>
### start

```ml
start
```

Boarding endpoint of the bobbing platform trajectory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L224)
