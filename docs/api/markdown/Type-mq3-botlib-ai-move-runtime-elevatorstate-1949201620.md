# `mq3.botlib.ai_move_runtime.ElevatorState`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-move-runtime-ml-1991141291.md)

<a id="struct-struct-mq3-botlib-ai-move-runtime-elevatorstate-struct-elevatorstate-src-mq3-botlib-ai-move-runtime-ml-1517896887"></a>
## ElevatorState

```ml
struct ElevatorState
```

`ElevatorState` record for ai move runtime, containing `onMover`, `down`, `bottomCenter` and `maxBarrier`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L209)

## Members

<a id="field-field-mq3-botlib-ai-move-runtime-elevatorstate-bottomcenter-bottomcenter-src-mq3-botlib-ai-move-runtime-ml-1290650256"></a>
### bottomCenter

```ml
bottomCenter
```

Center of the mover's lower support surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L215)

<a id="field-field-mq3-botlib-ai-move-runtime-elevatorstate-down-down-src-mq3-botlib-ai-move-runtime-ml-601289080"></a>
### down

```ml
down
```

True when the elevator is at or moving toward its lower position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L213)

<a id="field-field-mq3-botlib-ai-move-runtime-elevatorstate-maxbarrier-maxbarrier-src-mq3-botlib-ai-move-runtime-ml-443047090"></a>
### maxBarrier

```ml
maxBarrier
```

Maximum obstacle height accepted by a barrier-jump prediction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L217)

<a id="field-field-mq3-botlib-ai-move-runtime-elevatorstate-onmover-onmover-src-mq3-botlib-ai-move-runtime-ml-926520704"></a>
### onMover

```ml
onMover
```

True when the bot is standing on the queried moving platform.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L211)
