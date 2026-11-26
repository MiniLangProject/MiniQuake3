# `mq3.game.bot_combat_ai.EntityInfo`

[Home](README.md) · [Source file](File-src-mq3-game-bot-combat-ai-ml-1348181617.md)

<a id="struct-struct-mq3-game-bot-combat-ai-entityinfo-struct-entityinfo-src-mq3-game-bot-combat-ai-ml-1153095699"></a>
## EntityInfo

```ml
struct EntityInfo
```

`EntityInfo` record for bot combat ai, containing `number`, `powerups` and `flags`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L116)

## Members

<a id="field-field-mq3-game-bot-combat-ai-entityinfo-flags-flags-src-mq3-game-bot-combat-ai-ml-2004300986"></a>
### flags

```ml
flags
```

Entity-flag mask supplied by the tracked game or botlib entity state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L122)

<a id="field-field-mq3-game-bot-combat-ai-entityinfo-number-number-src-mq3-game-bot-combat-ai-ml-714897256"></a>
### number

```ml
number
```

Entity number identifying the tracked game object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L118)

<a id="field-field-mq3-game-bot-combat-ai-entityinfo-powerups-powerups-src-mq3-game-bot-combat-ai-ml-1981535644"></a>
### powerups

```ml
powerups
```

Powerup state or expiration values indexed by PW_* identifiers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L120)
