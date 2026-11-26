# `mq3.game.bot_deathmatch.Entity`

[Home](README.md) · [Source file](File-src-mq3-game-bot-deathmatch-ml-113231271.md)

<a id="struct-struct-mq3-game-bot-deathmatch-entity-struct-entity-src-mq3-game-bot-deathmatch-ml-212233423"></a>
## Entity

```ml
struct Entity
```

`Entity` record for bot deathmatch, containing `number`, `valid`, `eType`, `weapon` and `flags` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L95)

## Members

<a id="field-field-mq3-game-bot-deathmatch-entity-classname-classname-src-mq3-game-bot-deathmatch-ml-1758165614"></a>
### classname

```ml
classname
```

Map entity class name used to select a spawn function.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L122)

<a id="field-field-mq3-game-bot-deathmatch-entity-contents-contents-src-mq3-game-bot-deathmatch-ml-398684906"></a>
### contents

```ml
contents
```

CONTENTS_* mask describing the collision contents of this object or query result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L118)

<a id="field-field-mq3-game-bot-deathmatch-entity-etype-etype-src-mq3-game-bot-deathmatch-ml-1267549918"></a>
### eType

```ml
eType
```

Network entity category selected from the ET_* constants.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L101)

<a id="field-field-mq3-game-bot-deathmatch-entity-event-event-src-mq3-game-bot-deathmatch-ml-165263266"></a>
### event

```ml
event
```

Transient event identifier associated with the entity or snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L124)

<a id="field-field-mq3-game-bot-deathmatch-entity-eventparm-eventparm-src-mq3-game-bot-deathmatch-ml-410821418"></a>
### eventParm

```ml
eventParm
```

Parameter accompanying the current entity event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L126)

<a id="field-field-mq3-game-bot-deathmatch-entity-eventtime-eventtime-src-mq3-game-bot-deathmatch-ml-1671938674"></a>
### eventTime

```ml
eventTime
```

Timestamp of the most recently recorded entity event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L132)

<a id="field-field-mq3-game-bot-deathmatch-entity-flags-flags-src-mq3-game-bot-deathmatch-ml-110035138"></a>
### flags

```ml
flags
```

Entity-flag mask supplied by the tracked game or botlib entity state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L105)

<a id="field-field-mq3-game-bot-deathmatch-entity-generic1-generic1-src-mq3-game-bot-deathmatch-ml-2081925582"></a>
### generic1

```ml
generic1
```

Protocol-defined auxiliary entity/player value whose interpretation depends on the game object type.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L110)

<a id="field-field-mq3-game-bot-deathmatch-entity-maxs-maxs-src-mq3-game-bot-deathmatch-ml-716800752"></a>
### maxs

```ml
maxs
```

Upper local entity bound used by deathmatch model and collision queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L116)

<a id="field-field-mq3-game-bot-deathmatch-entity-mins-mins-src-mq3-game-bot-deathmatch-ml-1309065016"></a>
### mins

```ml
mins
```

Lower local entity bound used by deathmatch model and collision queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L114)

<a id="field-field-mq3-game-bot-deathmatch-entity-modelindex-modelindex-src-mq3-game-bot-deathmatch-ml-988931296"></a>
### modelindex

```ml
modelindex
```

Primary model index referenced by the entity snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L120)

<a id="field-field-mq3-game-bot-deathmatch-entity-number-number-src-mq3-game-bot-deathmatch-ml-320828968"></a>
### number

```ml
number
```

Entity number identifying the tracked game object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L97)

<a id="field-field-mq3-game-bot-deathmatch-entity-origin-origin-src-mq3-game-bot-deathmatch-ml-1218724922"></a>
### origin

```ml
origin
```

Entity world-space position used by deathmatch goal and visibility queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L112)

<a id="field-field-mq3-game-bot-deathmatch-entity-otherentitynum-otherentitynum-src-mq3-game-bot-deathmatch-ml-2131984816"></a>
### otherEntityNum

```ml
otherEntityNum
```

Primary related entity number carried by an entity event or snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L128)

<a id="field-field-mq3-game-bot-deathmatch-entity-otherentitynum2-otherentitynum2-src-mq3-game-bot-deathmatch-ml-1628466330"></a>
### otherEntityNum2

```ml
otherEntityNum2
```

Secondary related entity number carried by an entity event or snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L130)

<a id="field-field-mq3-game-bot-deathmatch-entity-powerups-powerups-src-mq3-game-bot-deathmatch-ml-468378604"></a>
### powerups

```ml
powerups
```

Powerup state or expiration values indexed by PW_* identifiers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L107)

<a id="field-field-mq3-game-bot-deathmatch-entity-valid-valid-src-mq3-game-bot-deathmatch-ml-2035438058"></a>
### valid

```ml
valid
```

True when this entity slot contains information usable by deathmatch-bot queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L99)

<a id="field-field-mq3-game-bot-deathmatch-entity-weapon-weapon-src-mq3-game-bot-deathmatch-ml-1338727226"></a>
### weapon

```ml
weapon
```

Selected or reported weapon identifier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L103)
