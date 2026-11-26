# `mq3.game.bot_navigation.MoveResult`

[Home](README.md) · [Source file](File-src-mq3-game-bot-navigation-ml-746290412.md)

<a id="struct-struct-mq3-game-bot-navigation-moveresult-struct-moveresult-src-mq3-game-bot-navigation-ml-412598013"></a>
## MoveResult

```ml
struct MoveResult
```

`MoveResult` record for bot navigation, containing `failure`, `blocked`, `type`, `flags` and `blockentity` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L134)

## Members

<a id="field-field-mq3-game-bot-navigation-moveresult-blocked-blocked-src-mq3-game-bot-navigation-ml-1990334685"></a>
### blocked

```ml
blocked
```

Mover callback invoked when another object obstructs movement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L138)

<a id="field-field-mq3-game-bot-navigation-moveresult-blockentity-blockentity-src-mq3-game-bot-navigation-ml-932179981"></a>
### blockentity

```ml
blockentity
```

Entity number of the object blocking the bot movement attempt.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L144)

<a id="field-field-mq3-game-bot-navigation-moveresult-failure-failure-src-mq3-game-bot-navigation-ml-63353797"></a>
### failure

```ml
failure
```

Nonzero when the bot movement operation could not be completed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L136)

<a id="field-field-mq3-game-bot-navigation-moveresult-flags-flags-src-mq3-game-bot-navigation-ml-1432296909"></a>
### flags

```ml
flags
```

MOVERESULT_* flags describing the result of the bot movement attempt.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L142)

<a id="field-field-mq3-game-bot-navigation-moveresult-movedir-movedir-src-mq3-game-bot-navigation-ml-1276396313"></a>
### movedir

```ml
movedir
```

Normalized direction along which the entity moves or fires.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L146)

<a id="field-field-mq3-game-bot-navigation-moveresult-type-type-src-mq3-game-bot-navigation-ml-989180001"></a>
### type

```ml
type
```

Movement-result type reported by the bot navigation operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_navigation.ml#L140)
