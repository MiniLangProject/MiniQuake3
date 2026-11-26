# `src/mq3/client/cgame_snapshot.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cgame_snapshot`](Package-mq3-client-cgame-snapshot-1647615885.md)

Reachable from entry: **yes**

## Imports

- `mq3/game/entitystate.ml` as `entitystate` → [src/mq3/game/entitystate.ml](File-src-mq3-game-entitystate-ml-1227653182.md)

## Declarations

<a id="function-function-mq3-client-cgame-snapshot-cent-function-cent-src-mq3-client-cgame-snapshot-ml-681098346"></a>
### cent

```ml
function cent()
```

Creates a client entity with separate current/next entity states and cleared interpolation/event history.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L111)

- [mq3.client.cgame_snapshot.Cent](Type-mq3-client-cgame-snapshot-cent-404698587.md) — struct
<a id="function-function-mq3-client-cgame-snapshot-create-function-create-maxentities-src-mq3-client-cgame-snapshot-ml-329192081"></a>
### create

```ml
function create(maxEntities)
```

Creates the client-game snapshot transition state and allocates the requested entity slots.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxEntities` | `dynamic` | — | Number of client-entity slots allocated; ensureEntity rejects numbers outside this range. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L114)

<a id="constant-constant-mq3-client-cgame-snapshot-ef-teleport-bit-const-ef-teleport-bit-4-src-mq3-client-cgame-snapshot-ml-1131897933"></a>
### EF_TELEPORT_BIT

```ml
const EF_TELEPORT_BIT = 4
```

Entity-state flag selecting teleport bit behavior in client presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L12)

<a id="function-function-mq3-client-cgame-snapshot-ensureentity-function-ensureentity-state-number-src-mq3-client-cgame-snapshot-ml-1260895128"></a>
### ensureEntity

```ml
function ensureEntity(state, number)
```

Lazily creates the requested client entity, or returns error 7701 when its number is outside the entity table.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game snapshot record/storage; this routine assigns `state.entities[number]`. |
| `number` | `dynamic` | — | Zero-based entity slot to initialize or read. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L124)

<a id="constant-constant-mq3-client-cgame-snapshot-et-player-const-et-player-1-src-mq3-client-cgame-snapshot-ml-1407721840"></a>
### ET_PLAYER

```ml
const ET_PLAYER = 1
```

Entity-state type selecting the player protocol interpretation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L10)

<a id="constant-constant-mq3-client-cgame-snapshot-event-valid-msec-const-event-valid-msec-300-src-mq3-client-cgame-snapshot-ml-1000420852"></a>
### EVENT_VALID_MSEC

```ml
const EVENT_VALID_MSEC = 300
```

Maximum event age in milliseconds before an entity event is considered stale.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L8)

<a id="function-function-mq3-client-cgame-snapshot-executesequence-function-executesequence-state-sequence-src-mq3-client-cgame-snapshot-ml-222744208"></a>
### executeSequence

```ml
function executeSequence(state, sequence)
```

Appends a reliable server-command sequence to the snapshot model's execution log.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game snapshot record/storage; this routine assigns `state.executedSequences`. |
| `sequence` | `dynamic` | — | Value used by `state.executedSequences=state.executedSequences+[sequence]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L148)

<a id="function-function-mq3-client-cgame-snapshot-findsnapshot-function-findsnapshot-state-number-src-mq3-client-cgame-snapshot-ml-946366476"></a>
### findSnapshot

```ml
function findSnapshot(state, number)
```

Finds a buffered snapshot by number, returning void when it has not been published.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.snapshots`. |
| `number` | `dynamic` | — | Value tested by `snap.number==number` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L177)

<a id="function-function-mq3-client-cgame-snapshot-playerentity-function-playerentity-ps-src-mq3-client-cgame-snapshot-ml-748599323"></a>
### playerEntity

```ml
function playerEntity(ps)
```

Converts player state into an ET_PLAYER entity state, copying position, view angles, flags, client number and weapon.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ps` | `dynamic` | — | Player-state record containing authoritative or predicted player data. Record read through `ps.clientNum`, `ps.eFlags`, `ps.origin`, `ps.viewangles` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L130)

<a id="constant-constant-mq3-client-cgame-snapshot-pmf-follow-const-pmf-follow-4096-src-mq3-client-cgame-snapshot-ml-2144983870"></a>
### PMF_FOLLOW

```ml
const PMF_FOLLOW = 4096
```

Player-movement state flag indicating follow.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L14)

<a id="function-function-mq3-client-cgame-snapshot-processsnapshots-function-processsnapshots-state-time-src-mq3-client-cgame-snapshot-ml-1877531800"></a>
### processSnapshots

```ml
function processSnapshots(state, time)
```

CG_ProcessSnapshots

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game snapshot record/storage; this routine assigns `state.time`. |
| `time` | `dynamic` | — | Value assigned to `state.time`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L187)

<a id="function-function-mq3-client-cgame-snapshot-publish-function-publish-state-number-source-snapflags-commandsequence-time-src-mq3-client-cgame-snapshot-ml-192774703"></a>
### publish

```ml
function publish(state, number, source, snapFlags, commandSequence, time)
```

Engine-side observer: preserve every published snapshot and run the native transition model without issuing Cgame events a second time.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game snapshot record/storage; this routine assigns `state.snapshots`, `state.latestSnapshotNum`, `state.latestSnapshotTime`. |
| `number` | `dynamic` | — | Value assigned to `state.latestSnapshotNum`. |
| `source` | `dynamic` | — | Record read through `source.serverTime`. |
| `snapFlags` | `dynamic` | — | Snapshot flags controlling validity, interpolation and server restarts. |
| `commandSequence` | `dynamic` | — | Reliable server-command sequence associated with the snapshot. |
| `time` | `dynamic` | — | Value used by `return processSnapshots(state,time)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L204)

<a id="function-function-mq3-client-cgame-snapshot-readnextsnapshot-function-readnextsnapshot-state-src-mq3-client-cgame-snapshot-ml-1608698293"></a>
### readNextSnapshot

```ml
function readNextSnapshot(state)
```

CG_ReadNextSnapshot

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game snapshot record/storage; this routine assigns `state.errors`, `state.processedSnapshotNum`, `state.lagometer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L180)

<a id="function-function-mq3-client-cgame-snapshot-resetentity-function-resetentity-state-value-src-mq3-client-cgame-snapshot-ml-1741398136"></a>
### resetEntity

```ml
function resetEntity(state, value)
```

CG_ResetEntity

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`, `state.snap.serverTime`. |
| `value` | `dynamic` | — | Mutable client game snapshot record/storage; this routine assigns `value.previousEvent`, `value.trailTime`, `value.lerpOrigin`, `value.lerpAngles` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L136)

<a id="function-function-mq3-client-cgame-snapshot-setinitialsnapshot-function-setinitialsnapshot-state-snap-src-mq3-client-cgame-snapshot-ml-1451250681"></a>
### setInitialSnapshot

```ml
function setInitialSnapshot(state, snap)
```

CG_SetInitialSnapshot

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game snapshot record/storage; this routine assigns `state.snap`, `state.solidBuilds`, `state.respawns`. |
| `snap` | `dynamic` | — | Record read through `snap.playerState.clientNum`, `snap.playerState`, `snap.serverCommandSequence`, `snap.entities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L152)

<a id="function-function-mq3-client-cgame-snapshot-setnextsnap-function-setnextsnap-state-snap-src-mq3-client-cgame-snapshot-ml-1122401031"></a>
### setNextSnap

```ml
function setNextSnap(state, snap)
```

CG_SetNextSnap

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game snapshot record/storage; this routine assigns `state.nextSnap`, `state.nextFrameTeleport`, `state.solidBuilds`. |
| `snap` | `dynamic` | — | Record read through `snap.playerState.clientNum`, `snap.playerState`, `snap.entities`, `snap.playerState.eFlags` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L169)

<a id="constant-constant-mq3-client-cgame-snapshot-snapflag-not-active-const-snapflag-not-active-1-src-mq3-client-cgame-snapshot-ml-1352880072"></a>
### SNAPFLAG_NOT_ACTIVE

```ml
const SNAPFLAG_NOT_ACTIVE = 1
```

Snapshot flag indicating that the server state is not yet active for normal gameplay.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L16)

<a id="constant-constant-mq3-client-cgame-snapshot-snapflag-servercount-const-snapflag-servercount-4-src-mq3-client-cgame-snapshot-ml-37190485"></a>
### SNAPFLAG_SERVERCOUNT

```ml
const SNAPFLAG_SERVERCOUNT = 4
```

Snapshot bit toggled on server/map restarts so clients can recognize a new server state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L18)

- [mq3.client.cgame_snapshot.Snapshot](Type-mq3-client-cgame-snapshot-snapshot-1033758793.md) — struct
- [mq3.client.cgame_snapshot.State](Type-mq3-client-cgame-snapshot-state-974447034.md) — struct
<a id="function-function-mq3-client-cgame-snapshot-transitionentity-function-transitionentity-state-value-src-mq3-client-cgame-snapshot-ml-2122595132"></a>
### transitionEntity

```ml
function transitionEntity(state, value)
```

CG_TransitionEntity

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game snapshot state passed to the helper calls in `transitionEntity`. |
| `value` | `dynamic` | — | Mutable client game snapshot record/storage; this routine assigns `value.currentState`, `value.currentValid`, `value.interpolate`, `value.events`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L142)

<a id="function-function-mq3-client-cgame-snapshot-transitionsnapshot-function-transitionsnapshot-state-src-mq3-client-cgame-snapshot-ml-94513477"></a>
### transitionSnapshot

```ml
function transitionSnapshot(state)
```

CG_TransitionSnapshot

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game snapshot record/storage; this routine assigns `state.snap`, `state.nextSnap`, `state.thisFrameTeleport`, `state.playerStateTransitions`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L158)

<a id="function-function-mq3-client-cgame-snapshot-wrap-function-wrap-number-source-snapflags-commandsequence-src-mq3-client-cgame-snapshot-ml-235767607"></a>
### wrap

```ml
function wrap(number, source, snapFlags, commandSequence)
```

Wraps parsed player/entity data with its snapshot number, server-command sequence and snapshot flags.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — | Value used to initialize `Snapshot.number`. |
| `source` | `dynamic` | — | Record read through `source.serverTime`, `source.playerState`, `source.entities`. |
| `snapFlags` | `dynamic` | — | Value used to initialize `Snapshot.snapFlags`. |
| `commandSequence` | `dynamic` | — | Value used to initialize `Snapshot.serverCommandSequence`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L120)
