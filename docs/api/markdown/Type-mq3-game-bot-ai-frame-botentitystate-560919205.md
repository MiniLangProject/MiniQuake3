# `mq3.game.bot_ai_frame.BotEntityState`

[Home](README.md) · [Source file](File-src-mq3-game-bot-ai-frame-ml-144686062.md)

<a id="struct-struct-mq3-game-bot-ai-frame-botentitystate-struct-botentitystate-src-mq3-game-bot-ai-frame-ml-1328222725"></a>
## BotEntityState

```ml
struct BotEntityState
```

`BotEntityState` record for bot ai frame, containing `origin`, `angles`, `oldOrigin`, `mins` and `maxs` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L53)

## Members

<a id="field-field-mq3-game-bot-ai-frame-botentitystate-angles-angles-src-mq3-game-bot-ai-frame-ml-2090298364"></a>
### angles

```ml
angles
```

Orientation angles used by the entity or movement operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L57)

<a id="field-field-mq3-game-bot-ai-frame-botentitystate-event-event-src-mq3-game-bot-ai-frame-ml-549252380"></a>
### event

```ml
event
```

Transient event identifier associated with the entity or snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L79)

<a id="field-field-mq3-game-bot-ai-frame-botentitystate-eventparm-eventparm-src-mq3-game-bot-ai-frame-ml-607022556"></a>
### eventParm

```ml
eventParm
```

Parameter accompanying the current entity event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L81)

<a id="field-field-mq3-game-bot-ai-frame-botentitystate-flags-flags-src-mq3-game-bot-ai-frame-ml-134629252"></a>
### flags

```ml
flags
```

Entity flags forwarded to botlib world-state updates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L67)

<a id="field-field-mq3-game-bot-ai-frame-botentitystate-frame-frame-src-mq3-game-bot-ai-frame-ml-1495277688"></a>
### frame

```ml
frame
```

Model animation frame forwarded to botlib.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L77)

<a id="field-field-mq3-game-bot-ai-frame-botentitystate-groundent-groundent-src-mq3-game-bot-ai-frame-ml-1961043088"></a>
### groundent

```ml
groundent
```

Entity identifier currently supporting the bot or movement state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L71)

<a id="field-field-mq3-game-bot-ai-frame-botentitystate-legsanim-legsanim-src-mq3-game-bot-ai-frame-ml-102722604"></a>
### legsAnim

```ml
legsAnim
```

Leg-animation identifier including its restart toggle bit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L85)

<a id="field-field-mq3-game-bot-ai-frame-botentitystate-maxs-maxs-src-mq3-game-bot-ai-frame-ml-1309533494"></a>
### maxs

```ml
maxs
```

Upper local entity bound sent to botlib during the AI frame update.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L63)

<a id="field-field-mq3-game-bot-ai-frame-botentitystate-mins-mins-src-mq3-game-bot-ai-frame-ml-876499114"></a>
### mins

```ml
mins
```

Lower local entity bound sent to botlib during the AI frame update.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L61)

<a id="field-field-mq3-game-bot-ai-frame-botentitystate-modelindex-modelindex-src-mq3-game-bot-ai-frame-ml-1812819018"></a>
### modelindex

```ml
modelindex
```

Primary model index referenced by the entity snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L73)

<a id="field-field-mq3-game-bot-ai-frame-botentitystate-modelindex2-modelindex2-src-mq3-game-bot-ai-frame-ml-1492995028"></a>
### modelindex2

```ml
modelindex2
```

Secondary model index referenced by the entity snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L75)

<a id="field-field-mq3-game-bot-ai-frame-botentitystate-oldorigin-oldorigin-src-mq3-game-bot-ai-frame-ml-284083140"></a>
### oldOrigin

```ml
oldOrigin
```

Previously recorded origin, used to compare or interpolate movement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L59)

<a id="field-field-mq3-game-bot-ai-frame-botentitystate-origin-origin-src-mq3-game-bot-ai-frame-ml-965945376"></a>
### origin

```ml
origin
```

Entity world-space position sent to botlib during the AI frame update.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L55)

<a id="field-field-mq3-game-bot-ai-frame-botentitystate-powerups-powerups-src-mq3-game-bot-ai-frame-ml-919252094"></a>
### powerups

```ml
powerups
```

Powerup state or expiration values indexed by PW_* identifiers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L83)

<a id="field-field-mq3-game-bot-ai-frame-botentitystate-solid-solid-src-mq3-game-bot-ai-frame-ml-2053336564"></a>
### solid

```ml
solid
```

Encoded collision representation advertised by the entity state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L69)

<a id="field-field-mq3-game-bot-ai-frame-botentitystate-torsoanim-torsoanim-src-mq3-game-bot-ai-frame-ml-267175676"></a>
### torsoAnim

```ml
torsoAnim
```

Torso-animation identifier including its restart toggle bit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L87)

<a id="field-field-mq3-game-bot-ai-frame-botentitystate-type-type-src-mq3-game-bot-ai-frame-ml-597438012"></a>
### type

```ml
type
```

Entity category forwarded to botlib world-state updates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L65)

<a id="field-field-mq3-game-bot-ai-frame-botentitystate-weapon-weapon-src-mq3-game-bot-ai-frame-ml-2094222908"></a>
### weapon

```ml
weapon
```

Selected or reported weapon identifier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_ai_frame.ml#L89)
