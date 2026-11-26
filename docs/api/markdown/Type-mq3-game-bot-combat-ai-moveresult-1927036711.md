# `mq3.game.bot_combat_ai.MoveResult`

[Home](README.md) · [Source file](File-src-mq3-game-bot-combat-ai-ml-1348181617.md)

<a id="struct-struct-mq3-game-bot-combat-ai-moveresult-struct-moveresult-src-mq3-game-bot-combat-ai-ml-1158226159"></a>
## MoveResult

```ml
struct MoveResult
```

`MoveResult` record for bot combat ai, containing `failure`, `flags`, `weapon`, `movedir` and `idealViewangles`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L189)

## Members

<a id="field-field-mq3-game-bot-combat-ai-moveresult-failure-failure-src-mq3-game-bot-combat-ai-ml-1397607333"></a>
### failure

```ml
failure
```

Nonzero when the bot movement operation could not be completed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L191)

<a id="field-field-mq3-game-bot-combat-ai-moveresult-flags-flags-src-mq3-game-bot-combat-ai-ml-21953981"></a>
### flags

```ml
flags
```

MOVERESULT_* flags describing the result of the bot movement attempt.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L193)

<a id="field-field-mq3-game-bot-combat-ai-moveresult-idealviewangles-idealviewangles-src-mq3-game-bot-combat-ai-ml-290602961"></a>
### idealViewangles

```ml
idealViewangles
```

Target viewing angles toward which the bot should turn.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L199)

<a id="field-field-mq3-game-bot-combat-ai-moveresult-movedir-movedir-src-mq3-game-bot-combat-ai-ml-2072049049"></a>
### movedir

```ml
movedir
```

Normalized direction along which the entity moves or fires.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L197)

<a id="field-field-mq3-game-bot-combat-ai-moveresult-weapon-weapon-src-mq3-game-bot-combat-ai-ml-596007197"></a>
### weapon

```ml
weapon
```

Selected or reported weapon identifier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L195)
