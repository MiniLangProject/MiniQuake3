# `mq3.client.cgame_snapshot.State`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-snapshot-ml-1128039285.md)

<a id="struct-struct-mq3-client-cgame-snapshot-state-struct-state-src-mq3-client-cgame-snapshot-ml-1161348219"></a>
## State

```ml
struct State
```

Stores client game snapshot state, including `time`, `latestSnapshotNum`, `latestSnapshotTime`, `processedSnapshotNum`, `snap`, `nextSnap` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L60)

## Members

<a id="field-field-mq3-client-cgame-snapshot-state-demoplayback-demoplayback-src-mq3-client-cgame-snapshot-ml-978948122"></a>
### demoPlayback

```ml
demoPlayback
```

True when snapshots and commands are being read from a recorded demo.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L99)

<a id="field-field-mq3-client-cgame-snapshot-state-entities-entities-src-mq3-client-cgame-snapshot-ml-354246860"></a>
### entities

```ml
entities
```

Entity-state or renderer-entity entries represented by the current snapshot or scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L76)

<a id="field-field-mq3-client-cgame-snapshot-state-errors-errors-src-mq3-client-cgame-snapshot-ml-474584728"></a>
### errors

```ml
errors
```

Diagnostic messages collected while parsing or processing the input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L94)

<a id="field-field-mq3-client-cgame-snapshot-state-executedsequences-executedsequences-src-mq3-client-cgame-snapshot-ml-822598238"></a>
### executedSequences

```ml
executedSequences
```

When constructing this record, `create` supplies an empty list for this member. Used by `executeSequence` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L89)

<a id="field-field-mq3-client-cgame-snapshot-state-lagometer-lagometer-src-mq3-client-cgame-snapshot-ml-332705738"></a>
### lagometer

```ml
lagometer
```

When constructing this record, `create` supplies an empty list for this member. Used by `readNextSnapshot` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L92)

<a id="field-field-mq3-client-cgame-snapshot-state-latestsnapshotnum-latestsnapshotnum-src-mq3-client-cgame-snapshot-ml-948833926"></a>
### latestSnapshotNum

```ml
latestSnapshotNum
```

Sequence number of the latest snapshot received from the engine.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L64)

<a id="field-field-mq3-client-cgame-snapshot-state-latestsnapshottime-latestsnapshottime-src-mq3-client-cgame-snapshot-ml-987900554"></a>
### latestSnapshotTime

```ml
latestSnapshotTime
```

Server timestamp associated with the latest received snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L66)

<a id="field-field-mq3-client-cgame-snapshot-state-nextframeteleport-nextframeteleport-src-mq3-client-cgame-snapshot-ml-1709043502"></a>
### nextFrameTeleport

```ml
nextFrameTeleport
```

True when the following snapshot transition must bypass interpolation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L80)

<a id="field-field-mq3-client-cgame-snapshot-state-nextsnap-nextsnap-src-mq3-client-cgame-snapshot-ml-2094269988"></a>
### nextSnap

```ml
nextSnap
```

Following snapshot used as the upper endpoint of client interpolation, when available.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L72)

<a id="field-field-mq3-client-cgame-snapshot-state-nopredict-nopredict-src-mq3-client-cgame-snapshot-ml-580372426"></a>
### noPredict

```ml
noPredict
```

When constructing this record, `create` supplies `false` for this member. Used by `transitionSnapshot` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L102)

<a id="field-field-mq3-client-cgame-snapshot-state-playerstatetransitions-playerstatetransitions-src-mq3-client-cgame-snapshot-ml-1768116314"></a>
### playerStateTransitions

```ml
playerStateTransitions
```

When constructing this record, `create` supplies an empty list for this member. Used by `transitionSnapshot` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L97)

<a id="field-field-mq3-client-cgame-snapshot-state-prediction-prediction-src-mq3-client-cgame-snapshot-ml-1677339832"></a>
### prediction

```ml
prediction
```

Optional prediction attachment retained by the snapshot record; the snapshot factory initializes it to an absent value.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L108)

<a id="field-field-mq3-client-cgame-snapshot-state-processedsnapshotnum-processedsnapshotnum-src-mq3-client-cgame-snapshot-ml-1611367430"></a>
### processedSnapshotNum

```ml
processedSnapshotNum
```

Highest snapshot sequence already requested or processed by CGame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L68)

<a id="field-field-mq3-client-cgame-snapshot-state-respawns-respawns-src-mq3-client-cgame-snapshot-ml-1037368504"></a>
### respawns

```ml
respawns
```

When constructing this record, `create` supplies `0` for this member. Used by `setInitialSnapshot` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L86)

<a id="field-field-mq3-client-cgame-snapshot-state-snap-snap-src-mq3-client-cgame-snapshot-ml-640064326"></a>
### snap

```ml
snap
```

Current snapshot used as the lower endpoint of client interpolation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L70)

<a id="field-field-mq3-client-cgame-snapshot-state-snapshots-snapshots-src-mq3-client-cgame-snapshot-ml-1965061250"></a>
### snapshots

```ml
snapshots
```

Snapshot history indexed by sequence number for interpolation and delta decoding.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L74)

<a id="field-field-mq3-client-cgame-snapshot-state-solidbuilds-solidbuilds-src-mq3-client-cgame-snapshot-ml-625591106"></a>
### solidBuilds

```ml
solidBuilds
```

When constructing this record, `create` supplies `0` for this member. Used by `setInitialSnapshot` and `setNextSnap` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L83)

<a id="field-field-mq3-client-cgame-snapshot-state-synchronousclients-synchronousclients-src-mq3-client-cgame-snapshot-ml-511448284"></a>
### synchronousClients

```ml
synchronousClients
```

When constructing this record, `create` supplies `false` for this member. Used by `transitionSnapshot` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L105)

<a id="field-field-mq3-client-cgame-snapshot-state-thisframeteleport-thisframeteleport-src-mq3-client-cgame-snapshot-ml-710371834"></a>
### thisFrameTeleport

```ml
thisFrameTeleport
```

True when the current snapshot transition represents a teleport.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L78)

<a id="field-field-mq3-client-cgame-snapshot-state-time-time-src-mq3-client-cgame-snapshot-ml-1498727684"></a>
### time

```ml
time
```

Client presentation time in milliseconds used to process and transition between server snapshots.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L62)
