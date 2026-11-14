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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_snapshot.ml#L16)

- [mq3.client.cgame_snapshot.Cent](Type-mq3-client-cgame-snapshot-cent-404698587.md) — struct
<a id="function-function-mq3-client-cgame-snapshot-create-function-create-maxentities-src-mq3-client-cgame-snapshot-ml-329192081"></a>
### create

```ml
function create(maxEntities)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxEntities` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_snapshot.ml#L17)

<a id="constant-constant-mq3-client-cgame-snapshot-ef-teleport-bit-const-ef-teleport-bit-4-src-mq3-client-cgame-snapshot-ml-1131897933"></a>
### EF_TELEPORT_BIT

```ml
const EF_TELEPORT_BIT = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_snapshot.ml#L9)

<a id="function-function-mq3-client-cgame-snapshot-ensureentity-function-ensureentity-state-number-src-mq3-client-cgame-snapshot-ml-1260895128"></a>
### ensureEntity

```ml
function ensureEntity(state, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_snapshot.ml#L19)

<a id="constant-constant-mq3-client-cgame-snapshot-et-player-const-et-player-1-src-mq3-client-cgame-snapshot-ml-1407721840"></a>
### ET_PLAYER

```ml
const ET_PLAYER = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_snapshot.ml#L8)

<a id="constant-constant-mq3-client-cgame-snapshot-event-valid-msec-const-event-valid-msec-300-src-mq3-client-cgame-snapshot-ml-1000420852"></a>
### EVENT_VALID_MSEC

```ml
const EVENT_VALID_MSEC = 300
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_snapshot.ml#L7)

<a id="function-function-mq3-client-cgame-snapshot-executesequence-function-executesequence-state-sequence-src-mq3-client-cgame-snapshot-ml-222744208"></a>
### executeSequence

```ml
function executeSequence(state, sequence)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `sequence` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_snapshot.ml#L34)

<a id="function-function-mq3-client-cgame-snapshot-findsnapshot-function-findsnapshot-state-number-src-mq3-client-cgame-snapshot-ml-946366476"></a>
### findSnapshot

```ml
function findSnapshot(state, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_snapshot.ml#L55)

<a id="function-function-mq3-client-cgame-snapshot-playerentity-function-playerentity-ps-src-mq3-client-cgame-snapshot-ml-748599323"></a>
### playerEntity

```ml
function playerEntity(ps)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ps` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_snapshot.ml#L23)

<a id="constant-constant-mq3-client-cgame-snapshot-pmf-follow-const-pmf-follow-4096-src-mq3-client-cgame-snapshot-ml-2144983870"></a>
### PMF_FOLLOW

```ml
const PMF_FOLLOW = 4096
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_snapshot.ml#L10)

<a id="function-function-mq3-client-cgame-snapshot-processsnapshots-function-processsnapshots-state-time-src-mq3-client-cgame-snapshot-ml-1877531800"></a>
### processSnapshots

```ml
function processSnapshots(state, time)
```

CG_ProcessSnapshots

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_snapshot.ml#L62)

<a id="function-function-mq3-client-cgame-snapshot-publish-function-publish-state-number-source-snapflags-commandsequence-time-src-mq3-client-cgame-snapshot-ml-192774703"></a>
### publish

```ml
function publish(state, number, source, snapFlags, commandSequence, time)
```

Engine-side observer: preserve every published snapshot and run the native transition model without issuing Cgame events a second time.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `snapFlags` | `dynamic` | — |  |
| `commandSequence` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_snapshot.ml#L73)

<a id="function-function-mq3-client-cgame-snapshot-readnextsnapshot-function-readnextsnapshot-state-src-mq3-client-cgame-snapshot-ml-1608698293"></a>
### readNextSnapshot

```ml
function readNextSnapshot(state)
```

CG_ReadNextSnapshot

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_snapshot.ml#L57)

<a id="function-function-mq3-client-cgame-snapshot-resetentity-function-resetentity-state-value-src-mq3-client-cgame-snapshot-ml-1741398136"></a>
### resetEntity

```ml
function resetEntity(state, value)
```

CG_ResetEntity

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_snapshot.ml#L27)

<a id="function-function-mq3-client-cgame-snapshot-setinitialsnapshot-function-setinitialsnapshot-state-snap-src-mq3-client-cgame-snapshot-ml-1451250681"></a>
### setInitialSnapshot

```ml
function setInitialSnapshot(state, snap)
```

CG_SetInitialSnapshot

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `snap` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_snapshot.ml#L36)

<a id="function-function-mq3-client-cgame-snapshot-setnextsnap-function-setnextsnap-state-snap-src-mq3-client-cgame-snapshot-ml-1122401031"></a>
### setNextSnap

```ml
function setNextSnap(state, snap)
```

CG_SetNextSnap

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `snap` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_snapshot.ml#L50)

<a id="constant-constant-mq3-client-cgame-snapshot-snapflag-not-active-const-snapflag-not-active-1-src-mq3-client-cgame-snapshot-ml-1352880072"></a>
### SNAPFLAG_NOT_ACTIVE

```ml
const SNAPFLAG_NOT_ACTIVE = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_snapshot.ml#L11)

<a id="constant-constant-mq3-client-cgame-snapshot-snapflag-servercount-const-snapflag-servercount-4-src-mq3-client-cgame-snapshot-ml-37190485"></a>
### SNAPFLAG_SERVERCOUNT

```ml
const SNAPFLAG_SERVERCOUNT = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_snapshot.ml#L12)

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
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_snapshot.ml#L31)

<a id="function-function-mq3-client-cgame-snapshot-transitionsnapshot-function-transitionsnapshot-state-src-mq3-client-cgame-snapshot-ml-94513477"></a>
### transitionSnapshot

```ml
function transitionSnapshot(state)
```

CG_TransitionSnapshot

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_snapshot.ml#L41)

<a id="function-function-mq3-client-cgame-snapshot-wrap-function-wrap-number-source-snapflags-commandsequence-src-mq3-client-cgame-snapshot-ml-235767607"></a>
### wrap

```ml
function wrap(number, source, snapFlags, commandSequence)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `snapFlags` | `dynamic` | — |  |
| `commandSequence` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_snapshot.ml#L18)
