# `mq3.client.cgame_ents.State`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-ents-ml-1890303843.md)

<a id="struct-struct-mq3-client-cgame-ents-state-struct-state-src-mq3-client-cgame-ents-ml-774201131"></a>
## State

```ml
struct State
```

Stores client game ents state, including `time`, `snap`, `nextSnap`, `frameInterpolation`, `smoothClients`, `simpleItems` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L146)

## Members

<a id="field-field-mq3-client-cgame-ents-state-actions-actions-src-mq3-client-cgame-ents-ml-1207536534"></a>
### actions

```ml
actions
```

Host requests queued while presenting snapshot entities through scene and sound services, retained in request order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L188)

<a id="field-field-mq3-client-cgame-ents-state-audio-audio-src-mq3-client-cgame-ents-ml-306711314"></a>
### audio

```ml
audio
```

When constructing this record, `create` supplies an empty list for this member. Used by `boundary` and `clearBoundaries` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L194)

<a id="field-field-mq3-client-cgame-ents-state-dispatched-dispatched-src-mq3-client-cgame-ents-ml-1900174252"></a>
### dispatched

```ml
dispatched
```

Number of snapshot-entity scene and sound requests marked for native dispatch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L203)

<a id="field-field-mq3-client-cgame-ents-state-entities-entities-src-mq3-client-cgame-ents-ml-1908180460"></a>
### entities

```ml
entities
```

Entity-state or renderer-entity entries represented by the current snapshot or scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L171)

<a id="field-field-mq3-client-cgame-ents-state-errors-errors-src-mq3-client-cgame-ents-ml-160544384"></a>
### errors

```ml
errors
```

Diagnostic messages collected while parsing or processing the input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L199)

<a id="field-field-mq3-client-cgame-ents-state-frameinterpolation-frameinterpolation-src-mq3-client-cgame-ents-ml-1107776080"></a>
### frameInterpolation

```ml
frameInterpolation
```

Fraction between the current and following snapshot times used for interpolation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L155)

<a id="field-field-mq3-client-cgame-ents-state-gametype-gametype-src-mq3-client-cgame-ents-ml-1260602050"></a>
### gametype

```ml
gametype
```

Active game-rule identifier used to decide whether capture-the-flag base entities are rendered.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L163)

<a id="field-field-mq3-client-cgame-ents-state-inlinemidpoints-inlinemidpoints-src-mq3-client-cgame-ents-ml-1429261506"></a>
### inlineMidpoints

```ml
inlineMidpoints
```

When constructing this record, `create` supplies an empty list for this member. Used by `setEntitySoundPosition` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L174)

<a id="field-field-mq3-client-cgame-ents-state-localclient-localclient-src-mq3-client-cgame-ents-ml-1645220298"></a>
### localClient

```ml
localClient
```

When constructing this record, `create` supplies `0` for this member. Used by `general` and `addPacketEntities` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L166)

<a id="field-field-mq3-client-cgame-ents-state-missilelights-missilelights-src-mq3-client-cgame-ents-ml-418295522"></a>
### missileLights

```ml
missileLights
```

When constructing this record, `create` supplies `array(WP_NUM_WEAPONS+1,0.0)` for this member. Used by `missile` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L180)

<a id="field-field-mq3-client-cgame-ents-state-missilesounds-missilesounds-src-mq3-client-cgame-ents-ml-373222818"></a>
### missileSounds

```ml
missileSounds
```

Sound resources selected for the missile event or effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L182)

<a id="field-field-mq3-client-cgame-ents-state-nextsnap-nextsnap-src-mq3-client-cgame-ents-ml-1091251948"></a>
### nextSnap

```ml
nextSnap
```

Following snapshot used as the upper endpoint of client interpolation, when available.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L153)

<a id="field-field-mq3-client-cgame-ents-state-predictedentity-predictedentity-src-mq3-client-cgame-ents-ml-662452990"></a>
### predictedEntity

```ml
predictedEntity
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `addPacketEntities` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L169)

<a id="field-field-mq3-client-cgame-ents-state-random-random-src-mq3-client-cgame-ents-ml-1075463868"></a>
### random

```ml
random
```

When constructing this record, `create` supplies `q.RandomState(1)` for this member. Used by `speaker` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L185)

<a id="field-field-mq3-client-cgame-ents-state-scene-scene-src-mq3-client-cgame-ents-ml-964168678"></a>
### scene

```ml
scene
```

When constructing this record, `create` supplies an empty list for this member. Used by `boundary` and `clearBoundaries` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L191)

<a id="field-field-mq3-client-cgame-ents-state-simpleitems-simpleitems-src-mq3-client-cgame-ents-ml-2019865738"></a>
### simpleItems

```ml
simpleItems
```

When constructing this record, `create` supplies `false` for this member. Used by `item` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L161)

<a id="field-field-mq3-client-cgame-ents-state-smoothclients-smoothclients-src-mq3-client-cgame-ents-ml-385174450"></a>
### smoothClients

```ml
smoothClients
```

When constructing this record, `create` supplies `true` for this member. Used by `calcEntityLerpPositions` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L158)

<a id="field-field-mq3-client-cgame-ents-state-snap-snap-src-mq3-client-cgame-ents-ml-1003639438"></a>
### snap

```ml
snap
```

Current snapshot used as the lower endpoint of client interpolation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L151)

<a id="field-field-mq3-client-cgame-ents-state-soundpositions-soundpositions-src-mq3-client-cgame-ents-ml-1926236024"></a>
### soundPositions

```ml
soundPositions
```

When constructing this record, `create` supplies an empty list for this member. Used by `boundary` and `clearBoundaries` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L197)

<a id="field-field-mq3-client-cgame-ents-state-suppressed-suppressed-src-mq3-client-cgame-ents-ml-390542242"></a>
### suppressed

```ml
suppressed
```

Number of snapshot-entity requests withheld because the retail CGame QVM owns their presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L201)

<a id="field-field-mq3-client-cgame-ents-state-time-time-src-mq3-client-cgame-ents-ml-1806460660"></a>
### time

```ml
time
```

Client presentation time in milliseconds used to evaluate and interpolate entity rendering and sound.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L149)

<a id="field-field-mq3-client-cgame-ents-state-weaponmidpoints-weaponmidpoints-src-mq3-client-cgame-ents-ml-229504286"></a>
### weaponMidpoints

```ml
weaponMidpoints
```

When constructing this record, `create` supplies an empty list for this member. Used by `weaponMidpoint` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_ents.ml#L177)
