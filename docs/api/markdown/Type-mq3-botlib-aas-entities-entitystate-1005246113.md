# `mq3.botlib.aas_entities.EntityState`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-entities-ml-525847367.md)

<a id="struct-struct-mq3-botlib-aas-entities-entitystate-struct-entitystate-src-mq3-botlib-aas-entities-ml-346657361"></a>
## EntityState

```ml
struct EntityState
```

`EntityState` record for aas entities, containing `type`, `flags`, `origin`, `angles` and `oldOrigin` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_entities.ml#L21)

## Members

<a id="field-field-mq3-botlib-aas-entities-entitystate-angles-angles-src-mq3-botlib-aas-entities-ml-760496205"></a>
### angles

```ml
angles
```

Pitch, yaw, and roll values carried by the entity or user command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_entities.ml#L29)

<a id="field-field-mq3-botlib-aas-entities-entitystate-event-event-src-mq3-botlib-aas-entities-ml-729919405"></a>
### event

```ml
event
```

Transient entity event identifier, such as a footstep or muzzle flash.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_entities.ml#L47)

<a id="field-field-mq3-botlib-aas-entities-entitystate-eventparm-eventparm-src-mq3-botlib-aas-entities-ml-1290725741"></a>
### eventParm

```ml
eventParm
```

Parameter value associated with the current network entity event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_entities.ml#L49)

<a id="field-field-mq3-botlib-aas-entities-entitystate-flags-flags-src-mq3-botlib-aas-entities-ml-1382639077"></a>
### flags

```ml
flags
```

Network entity flags reported to the navigation system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_entities.ml#L25)

<a id="field-field-mq3-botlib-aas-entities-entitystate-frame-frame-src-mq3-botlib-aas-entities-ml-1761602993"></a>
### frame

```ml
frame
```

Current animation-frame number reported by the entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_entities.ml#L45)

<a id="field-field-mq3-botlib-aas-entities-entitystate-groundent-groundent-src-mq3-botlib-aas-entities-ml-1140341721"></a>
### groundent

```ml
groundent
```

Entity number of the ground supporting this entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_entities.ml#L37)

<a id="field-field-mq3-botlib-aas-entities-entitystate-legsanim-legsanim-src-mq3-botlib-aas-entities-ml-953043581"></a>
### legsAnim

```ml
legsAnim
```

Leg animation identifier, including the animation-toggle bit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_entities.ml#L55)

<a id="field-field-mq3-botlib-aas-entities-entitystate-maxs-maxs-src-mq3-botlib-aas-entities-ml-691777503"></a>
### maxs

```ml
maxs
```

Maximum XYZ corner of the incoming game entity collision box relative to its origin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_entities.ml#L35)

<a id="field-field-mq3-botlib-aas-entities-entitystate-mins-mins-src-mq3-botlib-aas-entities-ml-113028763"></a>
### mins

```ml
mins
```

Minimum XYZ corner of the incoming game entity collision box relative to its origin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_entities.ml#L33)

<a id="field-field-mq3-botlib-aas-entities-entitystate-modelindex-modelindex-src-mq3-botlib-aas-entities-ml-983668731"></a>
### modelindex

```ml
modelindex
```

Model index used to associate this entity or item with registered model data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_entities.ml#L41)

<a id="field-field-mq3-botlib-aas-entities-entitystate-modelindex2-modelindex2-src-mq3-botlib-aas-entities-ml-941635637"></a>
### modelindex2

```ml
modelindex2
```

Secondary game model index, commonly used for carried weapons or flags.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_entities.ml#L43)

<a id="field-field-mq3-botlib-aas-entities-entitystate-oldorigin-oldorigin-src-mq3-botlib-aas-entities-ml-1130662181"></a>
### oldOrigin

```ml
oldOrigin
```

Entity origin retained from the previous update.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_entities.ml#L31)

<a id="field-field-mq3-botlib-aas-entities-entitystate-origin-origin-src-mq3-botlib-aas-entities-ml-578988009"></a>
### origin

```ml
origin
```

World-space entity position received from the game for the next AAS update.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_entities.ml#L27)

<a id="field-field-mq3-botlib-aas-entities-entitystate-powerups-powerups-src-mq3-botlib-aas-entities-ml-79828503"></a>
### powerups

```ml
powerups
```

Bit mask of powerup effects currently associated with the entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_entities.ml#L51)

<a id="field-field-mq3-botlib-aas-entities-entitystate-solid-solid-src-mq3-botlib-aas-entities-ml-1023508117"></a>
### solid

```ml
solid
```

Encoded collision-hull or solidity value associated with the entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_entities.ml#L39)

<a id="field-field-mq3-botlib-aas-entities-entitystate-torsoanim-torsoanim-src-mq3-botlib-aas-entities-ml-773598029"></a>
### torsoAnim

```ml
torsoAnim
```

Torso animation identifier, including the animation-toggle bit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_entities.ml#L57)

<a id="field-field-mq3-botlib-aas-entities-entitystate-type-type-src-mq3-botlib-aas-entities-ml-1372639117"></a>
### type

```ml
type
```

Network entity-type identifier reported to the navigation system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_entities.ml#L23)

<a id="field-field-mq3-botlib-aas-entities-entitystate-weapon-weapon-src-mq3-botlib-aas-entities-ml-1470349197"></a>
### weapon

```ml
weapon
```

Weapon identifier selected by the bot or user command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_entities.ml#L53)
