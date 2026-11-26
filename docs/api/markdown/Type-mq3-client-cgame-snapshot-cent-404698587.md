# `mq3.client.cgame_snapshot.Cent`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-snapshot-ml-1128039285.md)

<a id="struct-struct-mq3-client-cgame-snapshot-cent-struct-cent-src-mq3-client-cgame-snapshot-ml-1780359503"></a>
## Cent

```ml
struct Cent
```

Stores client game snapshot cent record, including `currentState`, `nextState`, `currentValid`, `interpolate`, `previousEvent`, `trailTime` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L35)

## Members

<a id="field-field-mq3-client-cgame-snapshot-cent-currentstate-currentstate-src-mq3-client-cgame-snapshot-ml-2044873525"></a>
### currentState

```ml
currentState
```

Entity state received in the current server snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L37)

<a id="field-field-mq3-client-cgame-snapshot-cent-currentvalid-currentvalid-src-mq3-client-cgame-snapshot-ml-416896219"></a>
### currentValid

```ml
currentValid
```

True when the current snapshot contains a valid state for this entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L41)

<a id="field-field-mq3-client-cgame-snapshot-cent-events-events-src-mq3-client-cgame-snapshot-ml-1564448987"></a>
### events

```ml
events
```

When constructing this record, `cent` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L57)

<a id="field-field-mq3-client-cgame-snapshot-cent-interpolate-interpolate-src-mq3-client-cgame-snapshot-ml-1694509613"></a>
### interpolate

```ml
interpolate
```

True when a valid following snapshot permits interpolation of this entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L43)

<a id="field-field-mq3-client-cgame-snapshot-cent-lerpangles-lerpangles-src-mq3-client-cgame-snapshot-ml-1534437647"></a>
### lerpAngles

```ml
lerpAngles
```

Entity orientation after snapshot interpolation and smoothing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L51)

<a id="field-field-mq3-client-cgame-snapshot-cent-lerporigin-lerporigin-src-mq3-client-cgame-snapshot-ml-482647103"></a>
### lerpOrigin

```ml
lerpOrigin
```

Entity position after snapshot interpolation and smoothing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L49)

<a id="field-field-mq3-client-cgame-snapshot-cent-nextstate-nextstate-src-mq3-client-cgame-snapshot-ml-1377170861"></a>
### nextState

```ml
nextState
```

Entity state from the following snapshot, used when interpolation is available.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L39)

<a id="field-field-mq3-client-cgame-snapshot-cent-playerresets-playerresets-src-mq3-client-cgame-snapshot-ml-148372967"></a>
### playerResets

```ml
playerResets
```

When constructing this record, `cent` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L55)

<a id="field-field-mq3-client-cgame-snapshot-cent-previousevent-previousevent-src-mq3-client-cgame-snapshot-ml-1507247753"></a>
### previousEvent

```ml
previousEvent
```

Last processed entity event, retained to avoid replaying the same event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L45)

<a id="field-field-mq3-client-cgame-snapshot-cent-snapshottime-snapshottime-src-mq3-client-cgame-snapshot-ml-1708335603"></a>
### snapShotTime

```ml
snapShotTime
```

Timestamp of the most recent snapshot containing this entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L53)

<a id="field-field-mq3-client-cgame-snapshot-cent-trailtime-trailtime-src-mq3-client-cgame-snapshot-ml-819155005"></a>
### trailTime

```ml
trailTime
```

Last trail-emission time, allowing missile trails to catch up across dropped packets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L47)
