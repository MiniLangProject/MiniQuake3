# `mq3.game.bot_combat_ai.Trace`

[Home](README.md) · [Source file](File-src-mq3-game-bot-combat-ai-ml-1348181617.md)

<a id="struct-struct-mq3-game-bot-combat-ai-trace-struct-trace-src-mq3-game-bot-combat-ai-ml-1026536807"></a>
## Trace

```ml
struct Trace
```

`Trace` record for bot combat ai, containing `fraction`, `ent`, `endpos` and `startsolid`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L144)

## Members

<a id="field-field-mq3-game-bot-combat-ai-trace-endpos-endpos-src-mq3-game-bot-combat-ai-ml-1248637148"></a>
### endpos

```ml
endpos
```

Final position reached by the collision trace.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L150)

<a id="field-field-mq3-game-bot-combat-ai-trace-ent-ent-src-mq3-game-bot-combat-ai-ml-1382998086"></a>
### ent

```ml
ent
```

Entity number hit by or blocking the spatial query.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L148)

<a id="field-field-mq3-game-bot-combat-ai-trace-fraction-fraction-src-mq3-game-bot-combat-ai-ml-727941150"></a>
### fraction

```ml
fraction
```

Fraction of the requested trace completed before the first blocking collision.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L146)

<a id="field-field-mq3-game-bot-combat-ai-trace-startsolid-startsolid-src-mq3-game-bot-combat-ai-ml-974742392"></a>
### startsolid

```ml
startsolid
```

Nonzero when the requested trace begins inside solid space.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_combat_ai.ml#L152)
