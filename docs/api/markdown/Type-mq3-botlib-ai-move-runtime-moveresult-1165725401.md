# `mq3.botlib.ai_move_runtime.MoveResult`

[Home](README.md) · [Source file](File-src-mq3-botlib-ai-move-runtime-ml-1991141291.md)

<a id="struct-struct-mq3-botlib-ai-move-runtime-moveresult-struct-moveresult-src-mq3-botlib-ai-move-runtime-ml-1662731463"></a>
## MoveResult

```ml
struct MoveResult
```

`MoveResult` record for ai move runtime, containing `failure`, `type`, `blocked`, `blockEntity` and `travelType` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L253)

## Members

<a id="field-field-mq3-botlib-ai-move-runtime-moveresult-blocked-blocked-src-mq3-botlib-ai-move-runtime-ml-1488568981"></a>
### blocked

```ml
blocked
```

True when an obstacle prevents the requested movement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L259)

<a id="field-field-mq3-botlib-ai-move-runtime-moveresult-blockentity-blockentity-src-mq3-botlib-ai-move-runtime-ml-2105361781"></a>
### blockEntity

```ml
blockEntity
```

Entity blocking the bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L261)

<a id="field-field-mq3-botlib-ai-move-runtime-moveresult-failure-failure-src-mq3-botlib-ai-move-runtime-ml-1755120445"></a>
### failure

```ml
failure
```

Failure indicator returned by the movement or navigation operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L255)

<a id="field-field-mq3-botlib-ai-move-runtime-moveresult-flags-flags-src-mq3-botlib-ai-move-runtime-ml-769898661"></a>
### flags

```ml
flags
```

Movement-result flags requesting view, weapon, or waiting behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L265)

<a id="field-field-mq3-botlib-ai-move-runtime-moveresult-idealviewangles-idealviewangles-src-mq3-botlib-ai-move-runtime-ml-1691172785"></a>
### idealViewAngles

```ml
idealViewAngles
```

Ideal viewangles for the movement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L271)

<a id="field-field-mq3-botlib-ai-move-runtime-moveresult-movedir-movedir-src-mq3-botlib-ai-move-runtime-ml-1899835185"></a>
### moveDir

```ml
moveDir
```

Direction requested by the bot movement result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L269)

<a id="field-field-mq3-botlib-ai-move-runtime-moveresult-traveltype-traveltype-src-mq3-botlib-ai-move-runtime-ml-2049909821"></a>
### travelType

```ml
travelType
```

Encoded AAS movement type required to traverse this link.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L263)

<a id="field-field-mq3-botlib-ai-move-runtime-moveresult-type-type-src-mq3-botlib-ai-move-runtime-ml-548540029"></a>
### type

```ml
type
```

Failure or blocked type.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L257)

<a id="field-field-mq3-botlib-ai-move-runtime-moveresult-weapon-weapon-src-mq3-botlib-ai-move-runtime-ml-1377583485"></a>
### weapon

```ml
weapon
```

Weapon identifier selected by the bot or user command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L267)
