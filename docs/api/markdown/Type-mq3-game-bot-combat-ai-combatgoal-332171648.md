# `mq3.game.bot_combat_ai.CombatGoal`

[Home](README.md) · [Source file](File-src-mq3-game-bot-combat-ai-ml-1348181617.md)

<a id="struct-struct-mq3-game-bot-combat-ai-combatgoal-struct-combatgoal-src-mq3-game-bot-combat-ai-ml-1461131855"></a>
## CombatGoal

```ml
struct CombatGoal
```

`CombatGoal` record for bot combat ai, containing `entitynum`, `areanum`, `origin`, `mins` and `maxs`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L176)

## Members

<a id="field-field-mq3-game-bot-combat-ai-combatgoal-areanum-areanum-src-mq3-game-bot-combat-ai-ml-1562123938"></a>
### areanum

```ml
areanum
```

AAS area containing the bot or spatial goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L180)

<a id="field-field-mq3-game-bot-combat-ai-combatgoal-entitynum-entitynum-src-mq3-game-bot-combat-ai-ml-1720315870"></a>
### entitynum

```ml
entitynum
```

Entity number associated with the goal used by bot combat movement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L178)

<a id="field-field-mq3-game-bot-combat-ai-combatgoal-maxs-maxs-src-mq3-game-bot-combat-ai-ml-1592052600"></a>
### maxs

```ml
maxs
```

Upper local bounding-box corner of the goal used by bot combat movement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L186)

<a id="field-field-mq3-game-bot-combat-ai-combatgoal-mins-mins-src-mq3-game-bot-combat-ai-ml-440353056"></a>
### mins

```ml
mins
```

Lower local bounding-box corner of the goal used by bot combat movement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L184)

<a id="field-field-mq3-game-bot-combat-ai-combatgoal-origin-origin-src-mq3-game-bot-combat-ai-ml-1433872714"></a>
### origin

```ml
origin
```

World-space target position of the goal used by bot combat movement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_combat_ai.ml#L182)
