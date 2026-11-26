# `mq3.botlib.aas_entities.EntityInfo`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-entities-ml-525847367.md)

<a id="struct-struct-mq3-botlib-aas-entities-entityinfo-struct-entityinfo-src-mq3-botlib-aas-entities-ml-211433271"></a>
## EntityInfo

```ml
struct EntityInfo
```

`EntityInfo` record for aas entities, containing `valid`, `type`, `flags`, `ltime` and `updateTime` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L60)

## Members

<a id="field-field-mq3-botlib-aas-entities-entityinfo-angles-angles-src-mq3-botlib-aas-entities-ml-1694619054"></a>
### angles

```ml
angles
```

Pitch, yaw, and roll values carried by the entity or user command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L76)

<a id="field-field-mq3-botlib-aas-entities-entityinfo-event-event-src-mq3-botlib-aas-entities-ml-40790366"></a>
### event

```ml
event
```

Transient entity event identifier, such as a footstep or muzzle flash.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L96)

<a id="field-field-mq3-botlib-aas-entities-entityinfo-eventparm-eventparm-src-mq3-botlib-aas-entities-ml-1237390806"></a>
### eventParm

```ml
eventParm
```

Parameter value associated with the current network entity event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L98)

<a id="field-field-mq3-botlib-aas-entities-entityinfo-flags-flags-src-mq3-botlib-aas-entities-ml-543275646"></a>
### flags

```ml
flags
```

Network entity flags retained by the navigation system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L66)

<a id="field-field-mq3-botlib-aas-entities-entityinfo-frame-frame-src-mq3-botlib-aas-entities-ml-1032881338"></a>
### frame

```ml
frame
```

Current animation-frame number retained for the entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L94)

<a id="field-field-mq3-botlib-aas-entities-entityinfo-groundent-groundent-src-mq3-botlib-aas-entities-ml-962104402"></a>
### groundent

```ml
groundent
```

Entity number of the ground supporting this entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L86)

<a id="field-field-mq3-botlib-aas-entities-entityinfo-lastvisorigin-lastvisorigin-src-mq3-botlib-aas-entities-ml-275904642"></a>
### lastVisOrigin

```ml
lastVisOrigin
```

Most recent recorded position at which this entity was visible.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L80)

<a id="field-field-mq3-botlib-aas-entities-entityinfo-legsanim-legsanim-src-mq3-botlib-aas-entities-ml-40425174"></a>
### legsAnim

```ml
legsAnim
```

Leg animation identifier, including the animation-toggle bit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L104)

<a id="field-field-mq3-botlib-aas-entities-entityinfo-ltime-ltime-src-mq3-botlib-aas-entities-ml-1786397414"></a>
### ltime

```ml
ltime
```

Timestamp of the previous entity-information update.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L68)

<a id="field-field-mq3-botlib-aas-entities-entityinfo-maxs-maxs-src-mq3-botlib-aas-entities-ml-598013028"></a>
### maxs

```ml
maxs
```

Maximum XYZ corner of the cached AAS entity collision box relative to its origin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L84)

<a id="field-field-mq3-botlib-aas-entities-entityinfo-mins-mins-src-mq3-botlib-aas-entities-ml-720169468"></a>
### mins

```ml
mins
```

Minimum XYZ corner of the cached AAS entity collision box relative to its origin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L82)

<a id="field-field-mq3-botlib-aas-entities-entityinfo-modelindex-modelindex-src-mq3-botlib-aas-entities-ml-1990203540"></a>
### modelindex

```ml
modelindex
```

Model index used to associate this entity or item with registered model data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L90)

<a id="field-field-mq3-botlib-aas-entities-entityinfo-modelindex2-modelindex2-src-mq3-botlib-aas-entities-ml-529951454"></a>
### modelindex2

```ml
modelindex2
```

Secondary game model index, commonly used for carried weapons or flags.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L92)

<a id="field-field-mq3-botlib-aas-entities-entityinfo-number-number-src-mq3-botlib-aas-entities-ml-94605164"></a>
### number

```ml
number
```

Game-entity number identifying this navigation entity record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L72)

<a id="field-field-mq3-botlib-aas-entities-entityinfo-oldorigin-oldorigin-src-mq3-botlib-aas-entities-ml-1074297822"></a>
### oldOrigin

```ml
oldOrigin
```

Entity origin retained from the previous update.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L78)

<a id="field-field-mq3-botlib-aas-entities-entityinfo-origin-origin-src-mq3-botlib-aas-entities-ml-1690954406"></a>
### origin

```ml
origin
```

Most recently cached world-space position of this AAS-tracked game entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L74)

<a id="field-field-mq3-botlib-aas-entities-entityinfo-powerups-powerups-src-mq3-botlib-aas-entities-ml-666159760"></a>
### powerups

```ml
powerups
```

Bit mask of powerup effects currently associated with the entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L100)

<a id="field-field-mq3-botlib-aas-entities-entityinfo-solid-solid-src-mq3-botlib-aas-entities-ml-1446884478"></a>
### solid

```ml
solid
```

Encoded collision-hull or solidity value associated with the entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L88)

<a id="field-field-mq3-botlib-aas-entities-entityinfo-torsoanim-torsoanim-src-mq3-botlib-aas-entities-ml-1656959078"></a>
### torsoAnim

```ml
torsoAnim
```

Torso animation identifier, including the animation-toggle bit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L106)

<a id="field-field-mq3-botlib-aas-entities-entityinfo-type-type-src-mq3-botlib-aas-entities-ml-2127455466"></a>
### type

```ml
type
```

Network entity-type identifier retained by the navigation system.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L64)

<a id="field-field-mq3-botlib-aas-entities-entityinfo-updatetime-updatetime-src-mq3-botlib-aas-entities-ml-1439883106"></a>
### updateTime

```ml
updateTime
```

Time between last and current update.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L70)

<a id="field-field-mq3-botlib-aas-entities-entityinfo-valid-valid-src-mq3-botlib-aas-entities-ml-1603101910"></a>
### valid

```ml
valid
```

True when the represented entry contains usable data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L62)

<a id="field-field-mq3-botlib-aas-entities-entityinfo-weapon-weapon-src-mq3-botlib-aas-entities-ml-986180774"></a>
### weapon

```ml
weapon
```

Weapon identifier selected by the bot or user command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_entities.ml#L102)
