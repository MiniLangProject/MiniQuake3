# `src/mq3/client/snapshot_command.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.snapshot_command`](Package-mq3-client-snapshot-command-2051700367.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/snapshot_parse.ml` as `snapshotEntities` → [src/mq3/client/snapshot_parse.ml](File-src-mq3-client-snapshot-parse-ml-455311349.md)
- `mq3/game/playerstate.ml` as `playerstate` → [src/mq3/game/playerstate.ml](File-src-mq3-game-playerstate-ml-1407876292.md)
- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)
- `mq3/qcommon/message_state_delta.ml` as `delta` → [src/mq3/qcommon/message_state_delta.ml](File-src-mq3-qcommon-message-state-delta-ml-255612102.md)

## Declarations

<a id="function-function-mq3-client-snapshot-command-calculateping-function-calculateping-state-snapshot-src-mq3-client-snapshot-command-ml-1725094513"></a>
### calculatePing

```ml
function calculatePing(state, snapshot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `snapshot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/snapshot_command.ml#L87)

<a id="function-function-mq3-client-snapshot-command-commitentitystate-function-commitentitystate-target-source-src-mq3-client-snapshot-command-ml-267906960"></a>
### commitEntityState

```ml
function commitEntityState(target, source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `target` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/snapshot_command.ml#L108)

<a id="function-function-mq3-client-snapshot-command-copyareamask-function-copyareamask-source-src-mq3-client-snapshot-command-ml-1801603295"></a>
### copyAreaMask

```ml
function copyAreaMask(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/snapshot_command.ml#L53)

<a id="function-function-mq3-client-snapshot-command-copyentitystate-function-copyentitystate-source-src-mq3-client-snapshot-command-ml-110548049"></a>
### copyEntityState

```ml
function copyEntityState(source)
```

Parse packet entities against an isolated copy.  A malformed packet must not advance or overwrite the live parse-entity ring before its error reaches the outer CL_ParseServerMessage dispatcher.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/snapshot_command.ml#L100)

<a id="function-function-mq3-client-snapshot-command-copysnapshot-function-copysnapshot-source-src-mq3-client-snapshot-command-ml-1504396803"></a>
### copySnapshot

```ml
function copySnapshot(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/snapshot_command.ml#L62)

<a id="function-function-mq3-client-snapshot-command-create-function-create-src-mq3-client-snapshot-command-ml-2032507478"></a>
### create

```ml
function create()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/snapshot_command.ml#L68)

<a id="function-function-mq3-client-snapshot-command-emptysnapshot-function-emptysnapshot-src-mq3-client-snapshot-command-ml-769510300"></a>
### emptySnapshot

```ml
function emptySnapshot()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/snapshot_command.ml#L49)

<a id="constant-constant-mq3-client-snapshot-command-max-map-area-bytes-const-max-map-area-bytes-32-src-mq3-client-snapshot-command-ml-538784588"></a>
### MAX_MAP_AREA_BYTES

```ml
const MAX_MAP_AREA_BYTES = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/snapshot_command.ml#L13)

<a id="constant-constant-mq3-client-snapshot-command-max-parse-entities-const-max-parse-entities-2048-src-mq3-client-snapshot-command-ml-1370360043"></a>
### MAX_PARSE_ENTITIES

```ml
const MAX_PARSE_ENTITIES = 2048
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/snapshot_command.ml#L12)

<a id="function-function-mq3-client-snapshot-command-oldframefor-function-oldframefor-state-newsnapshot-src-mq3-client-snapshot-command-ml-343411901"></a>
### oldFrameFor

```ml
function oldFrameFor(state, newSnapshot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `newSnapshot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/snapshot_command.ml#L80)

- [mq3.client.snapshot_command.OutPacket](Type-mq3-client-snapshot-command-outpacket-1875905137.md) — struct
<a id="constant-constant-mq3-client-snapshot-command-packet-backup-const-packet-backup-32-src-mq3-client-snapshot-command-ml-1921134424"></a>
### PACKET_BACKUP

```ml
const PACKET_BACKUP = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/snapshot_command.ml#L10)

<a id="constant-constant-mq3-client-snapshot-command-packet-mask-const-packet-mask-31-src-mq3-client-snapshot-command-ml-1207626463"></a>
### PACKET_MASK

```ml
const PACKET_MASK = 31
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/snapshot_command.ml#L11)

<a id="function-function-mq3-client-snapshot-command-pad3-function-pad3-value-src-mq3-client-snapshot-command-ml-69502757"></a>
### pad3

```ml
function pad3(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/snapshot_command.ml#L74)

<a id="function-function-mq3-client-snapshot-command-parsesnapshot-function-parsesnapshot-state-msg-src-mq3-client-snapshot-command-ml-855957914"></a>
### parseSnapshot

```ml
function parseSnapshot(state, msg)
```

`svc_snapshot` has already been consumed by CL_ParseServerMessage. Invalid deltas are fully consumed and populate the parse-entity ring like C, but are not promoted to the current/backup snapshot.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/snapshot_command.ml#L117)

<a id="function-function-mq3-client-snapshot-command-shownet-function-shownet-state-msg-text-src-mq3-client-snapshot-command-ml-1833858263"></a>
### shownet

```ml
function shownet(state, msg, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/snapshot_command.ml#L75)

- [mq3.client.snapshot_command.Snapshot](Type-mq3-client-snapshot-command-snapshot-208860851.md) — struct
- [mq3.client.snapshot_command.State](Type-mq3-client-snapshot-command-state-1221162148.md) — struct
