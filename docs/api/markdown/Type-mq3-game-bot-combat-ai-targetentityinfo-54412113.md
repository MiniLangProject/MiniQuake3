# `mq3.game.bot_combat_ai.TargetEntityInfo`

[Home](README.md) · [Source file](File-src-mq3-game-bot-combat-ai-ml-1348181617.md)

<a id="struct-struct-mq3-game-bot-combat-ai-targetentityinfo-struct-targetentityinfo-src-mq3-game-bot-combat-ai-ml-1574394195"></a>
## TargetEntityInfo

```ml
struct TargetEntityInfo
```

`TargetEntityInfo` record for bot combat ai, containing `number`, `powerups`, `flags`, `valid` and `origin` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L125)

## Members

<a id="field-field-mq3-game-bot-combat-ai-targetentityinfo-angles-angles-src-mq3-game-bot-combat-ai-ml-1246353483"></a>
### angles

```ml
angles
```

Orientation angles used by the entity or movement operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L137)

<a id="field-field-mq3-game-bot-combat-ai-targetentityinfo-flags-flags-src-mq3-game-bot-combat-ai-ml-364207731"></a>
### flags

```ml
flags
```

Entity-flag mask supplied by the tracked game or botlib entity state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L131)

<a id="field-field-mq3-game-bot-combat-ai-targetentityinfo-lastvisorigin-lastvisorigin-src-mq3-game-bot-combat-ai-ml-2068324511"></a>
### lastVisOrigin

```ml
lastVisOrigin
```

Most recent position at which the tracked entity was visible.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L139)

<a id="field-field-mq3-game-bot-combat-ai-targetentityinfo-number-number-src-mq3-game-bot-combat-ai-ml-1516014885"></a>
### number

```ml
number
```

Entity number identifying the tracked game object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L127)

<a id="field-field-mq3-game-bot-combat-ai-targetentityinfo-origin-origin-src-mq3-game-bot-combat-ai-ml-1144387687"></a>
### origin

```ml
origin
```

Reported world-space position of the potential combat target.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L135)

<a id="field-field-mq3-game-bot-combat-ai-targetentityinfo-powerups-powerups-src-mq3-game-bot-combat-ai-ml-2001386757"></a>
### powerups

```ml
powerups
```

Powerup state or expiration values indexed by PW_* identifiers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L129)

<a id="field-field-mq3-game-bot-combat-ai-targetentityinfo-updatetime-updatetime-src-mq3-game-bot-combat-ai-ml-304064235"></a>
### updateTime

```ml
updateTime
```

Timestamp at which the tracked information was last refreshed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L141)

<a id="field-field-mq3-game-bot-combat-ai-targetentityinfo-valid-valid-src-mq3-game-bot-combat-ai-ml-1126248923"></a>
### valid

```ml
valid
```

True when the combat-target lookup returned usable entity information.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L133)
