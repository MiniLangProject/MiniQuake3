# `mq3.game.entitystate.EntityState`

[Home](README.md) · [Source file](File-src-mq3-game-entitystate-ml-1227653182.md)

<a id="struct-struct-mq3-game-entitystate-entitystate-struct-entitystate-src-mq3-game-entitystate-ml-25023797"></a>
## EntityState

```ml
struct EntityState
```

`EntityState` record for entitystate, containing `number`, `eType`, `eFlags`, `pos` and `apos` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entitystate.ml#L10)

## Members

<a id="field-field-mq3-game-entitystate-entitystate-angles-angles-src-mq3-game-entitystate-ml-2138817701"></a>
### angles

```ml
angles
```

Orientation angles used by the entity or movement operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entitystate.ml#L30)

<a id="field-field-mq3-game-entitystate-entitystate-angles2-angles2-src-mq3-game-entitystate-ml-1682064693"></a>
### angles2

```ml
angles2
```

Secondary angular channel carried by the entity state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entitystate.ml#L32)

<a id="field-field-mq3-game-entitystate-entitystate-apos-apos-src-mq3-game-entitystate-ml-250680959"></a>
### apos

```ml
apos
```

Angular trajectory carried by the network entity state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entitystate.ml#L20)

<a id="field-field-mq3-game-entitystate-entitystate-clientnum-clientnum-src-mq3-game-entitystate-ml-528643761"></a>
### clientNum

```ml
clientNum
```

Client slot number represented by this player state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entitystate.ml#L48)

<a id="field-field-mq3-game-entitystate-entitystate-constantlight-constantlight-src-mq3-game-entitystate-ml-2139455637"></a>
### constantLight

```ml
constantLight
```

Packed constant-light color and intensity associated with the entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entitystate.ml#L40)

<a id="field-field-mq3-game-entitystate-entitystate-eflags-eflags-src-mq3-game-entitystate-ml-807312285"></a>
### eFlags

```ml
eFlags
```

Network-visible entity flags selected from the EF_* constants.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entitystate.ml#L16)

<a id="field-field-mq3-game-entitystate-entitystate-etype-etype-src-mq3-game-entitystate-ml-461261025"></a>
### eType

```ml
eType
```

Network entity category selected from the ET_* constants.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entitystate.ml#L14)

<a id="field-field-mq3-game-entitystate-entitystate-event-event-src-mq3-game-entitystate-ml-2140270357"></a>
### event

```ml
event
```

Transient event identifier associated with the entity or snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entitystate.ml#L54)

<a id="field-field-mq3-game-entitystate-entitystate-eventparm-eventparm-src-mq3-game-entitystate-ml-293604877"></a>
### eventParm

```ml
eventParm
```

Parameter accompanying the current entity event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entitystate.ml#L56)

<a id="field-field-mq3-game-entitystate-entitystate-frame-frame-src-mq3-game-entitystate-ml-1276186433"></a>
### frame

```ml
frame
```

Model animation frame carried by the entity state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entitystate.ml#L50)

<a id="field-field-mq3-game-entitystate-entitystate-generic1-generic1-src-mq3-game-entitystate-ml-1057066961"></a>
### generic1

```ml
generic1
```

Protocol-defined auxiliary entity/player value whose interpretation depends on the game object type.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entitystate.ml#L67)

<a id="field-field-mq3-game-entitystate-entitystate-groundentitynum-groundentitynum-src-mq3-game-entitystate-ml-1533747717"></a>
### groundEntityNum

```ml
groundEntityNum
```

Entity number supporting the player, or ENTITYNUM_NONE while airborne.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entitystate.ml#L38)

<a id="field-field-mq3-game-entitystate-entitystate-legsanim-legsanim-src-mq3-game-entitystate-ml-1185644269"></a>
### legsAnim

```ml
legsAnim
```

Leg-animation identifier including its restart toggle bit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entitystate.ml#L62)

<a id="field-field-mq3-game-entitystate-entitystate-loopsound-loopsound-src-mq3-game-entitystate-ml-1729244941"></a>
### loopSound

```ml
loopSound
```

Continuously playing sound identifier associated with the entity state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entitystate.ml#L42)

<a id="field-field-mq3-game-entitystate-entitystate-modelindex-modelindex-src-mq3-game-entitystate-ml-1790196175"></a>
### modelindex

```ml
modelindex
```

Primary model index referenced by the entity snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entitystate.ml#L44)

<a id="field-field-mq3-game-entitystate-entitystate-modelindex2-modelindex2-src-mq3-game-entitystate-ml-1039203637"></a>
### modelindex2

```ml
modelindex2
```

Secondary model index referenced by the entity snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entitystate.ml#L46)

<a id="field-field-mq3-game-entitystate-entitystate-number-number-src-mq3-game-entitystate-ml-648358631"></a>
### number

```ml
number
```

Network entity slot number.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entitystate.ml#L12)

<a id="field-field-mq3-game-entitystate-entitystate-origin-origin-src-mq3-game-entitystate-ml-638606045"></a>
### origin

```ml
origin
```

Entity origin carried by the networked entity-state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entitystate.ml#L26)

<a id="field-field-mq3-game-entitystate-entitystate-origin2-origin2-src-mq3-game-entitystate-ml-1367939705"></a>
### origin2

```ml
origin2
```

Secondary position/vector channel carried by the entity state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entitystate.ml#L28)

<a id="field-field-mq3-game-entitystate-entitystate-otherentitynum-otherentitynum-src-mq3-game-entitystate-ml-1672810207"></a>
### otherEntityNum

```ml
otherEntityNum
```

Primary related entity number carried by an entity event or snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entitystate.ml#L34)

<a id="field-field-mq3-game-entitystate-entitystate-otherentitynum2-otherentitynum2-src-mq3-game-entitystate-ml-1798785597"></a>
### otherEntityNum2

```ml
otherEntityNum2
```

Secondary related entity number carried by an entity event or snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entitystate.ml#L36)

<a id="field-field-mq3-game-entitystate-entitystate-pos-pos-src-mq3-game-entitystate-ml-2128890125"></a>
### pos

```ml
pos
```

Position trajectory carried by the network entity state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entitystate.ml#L18)

<a id="field-field-mq3-game-entitystate-entitystate-powerups-powerups-src-mq3-game-entitystate-ml-1876039083"></a>
### powerups

```ml
powerups
```

Powerup state or expiration values indexed by PW_* identifiers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entitystate.ml#L58)

<a id="field-field-mq3-game-entitystate-entitystate-solid-solid-src-mq3-game-entitystate-ml-620844661"></a>
### solid

```ml
solid
```

Encoded collision representation advertised by the entity state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entitystate.ml#L52)

<a id="field-field-mq3-game-entitystate-entitystate-time-time-src-mq3-game-entitystate-ml-97143875"></a>
### time

```ml
time
```

Primary game timestamp carried by the network entity state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entitystate.ml#L22)

<a id="field-field-mq3-game-entitystate-entitystate-time2-time2-src-mq3-game-entitystate-ml-876273817"></a>
### time2

```ml
time2
```

Secondary game timestamp carried by the entity state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entitystate.ml#L24)

<a id="field-field-mq3-game-entitystate-entitystate-torsoanim-torsoanim-src-mq3-game-entitystate-ml-193848829"></a>
### torsoAnim

```ml
torsoAnim
```

Torso-animation identifier including its restart toggle bit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entitystate.ml#L64)

<a id="field-field-mq3-game-entitystate-entitystate-weapon-weapon-src-mq3-game-entitystate-ml-415725725"></a>
### weapon

```ml
weapon
```

Selected or reported weapon identifier.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/entitystate.ml#L60)
