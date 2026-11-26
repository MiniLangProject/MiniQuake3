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

Matches the snapshot command time to the outgoing-packet history and computes elapsed client time, leaving ping at 999 when no packet matches.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.outgoingSequence`, `state.outPackets`, `state.realtime`. |
| `snapshot` | `dynamic` | — | Mutable snapshot command record/storage; this routine assigns `snapshot.ping`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_command.ml#L145)

<a id="function-function-mq3-client-snapshot-command-commitentitystate-function-commitentitystate-target-source-src-mq3-client-snapshot-command-ml-267906960"></a>
### commitEntityState

```ml
function commitEntityState(target, source)
```

Promotes the successfully parsed entity ring, absolute sequence and diagnostic state into the live snapshot parser.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `target` | `dynamic` | — | Mutable snapshot command record/storage; this routine assigns `target.parseEntities`, `target.parseEntitiesNum`, `target.shownetLevel`, `target.shownetLines`. |
| `source` | `dynamic` | — | Record read through `source.parseEntities`, `source.parseEntitiesNum`, `source.shownetLevel`, `source.shownetLines`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_command.ml#L170)

<a id="function-function-mq3-client-snapshot-command-copyareamask-function-copyareamask-source-src-mq3-client-snapshot-command-ml-1801603295"></a>
### copyAreaMask

```ml
function copyAreaMask(source)
```

Copies at most MAX_MAP_AREA_BYTES bytes into a zero-filled area mask; a void source produces an all-zero mask.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Optional area-mask bytes; at most MAX_MAP_AREA_BYTES are copied and the remaining destination bytes stay zero. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_command.ml#L96)

<a id="function-function-mq3-client-snapshot-command-copyentitystate-function-copyentitystate-source-src-mq3-client-snapshot-command-ml-110548049"></a>
### copyEntityState

```ml
function copyEntityState(source)
```

Parse packet entities against an isolated copy.  A malformed packet must not advance or overwrite the live parse-entity ring before its error reaches the outer CL_ParseServerMessage dispatcher.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Record read through `source.parseEntitiesNum`, `source.shownetLevel`, `source.shownetLines`, `source.parseEntities` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_command.ml#L159)

<a id="function-function-mq3-client-snapshot-command-copysnapshot-function-copysnapshot-source-src-mq3-client-snapshot-command-ml-1504396803"></a>
### copySnapshot

```ml
function copySnapshot(source)
```

Copies snapshot metadata, area-mask bytes and player state; a void source produces an empty snapshot.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Record read through `source.valid`, `source.snapFlags`, `source.serverTime`, `source.messageNum` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_command.ml#L107)

<a id="function-function-mq3-client-snapshot-command-create-function-create-src-mq3-client-snapshot-command-ml-2032507478"></a>
### create

```ml
function create()
```

Creates the client snapshot ring, outgoing-packet ring and entity-delta state with demo waiting enabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_command.ml#L114)

<a id="function-function-mq3-client-snapshot-command-emptysnapshot-function-emptysnapshot-src-mq3-client-snapshot-command-ml-769510300"></a>
### emptySnapshot

```ml
function emptySnapshot()
```

Creates an invalid snapshot with a zeroed area mask, fresh player state and empty sequence metadata.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_command.ml#L90)

<a id="constant-constant-mq3-client-snapshot-command-max-map-area-bytes-const-max-map-area-bytes-32-src-mq3-client-snapshot-command-ml-538784588"></a>
### MAX_MAP_AREA_BYTES

```ml
const MAX_MAP_AREA_BYTES = 32
```

Number of bytes available for the snapshot's portal-area visibility bitset.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_command.ml#L17)

<a id="constant-constant-mq3-client-snapshot-command-max-parse-entities-const-max-parse-entities-2048-src-mq3-client-snapshot-command-ml-1370360043"></a>
### MAX_PARSE_ENTITIES

```ml
const MAX_PARSE_ENTITIES = 2048
```

Capacity limit for the parse entities collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_command.ml#L15)

<a id="function-function-mq3-client-snapshot-command-oldframefor-function-oldframefor-state-newsnapshot-src-mq3-client-snapshot-command-ml-343411901"></a>
### oldFrameFor

```ml
function oldFrameFor(state, newSnapshot)
```

Finds the snapshot delta base and marks the new snapshot valid only when its sequence and parse-entity window can be reused.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.snapshots`, `state.entityState.parseEntitiesNum`. |
| `newSnapshot` | `dynamic` | — | Snapshot being reconstructed; its valid flag is set only when the delta base and entity history can be reused. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_command.ml#L135)

- [mq3.client.snapshot_command.OutPacket](Type-mq3-client-snapshot-command-outpacket-1875905137.md) — struct
<a id="constant-constant-mq3-client-snapshot-command-packet-backup-const-packet-backup-32-src-mq3-client-snapshot-command-ml-1921134424"></a>
### PACKET_BACKUP

```ml
const PACKET_BACKUP = 32
```

Number of packet records retained in the client packet-history ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_command.ml#L11)

<a id="constant-constant-mq3-client-snapshot-command-packet-mask-const-packet-mask-31-src-mq3-client-snapshot-command-ml-1207626463"></a>
### PACKET_MASK

```ml
const PACKET_MASK = 31
```

Mask that maps a packet sequence number into the packet-history ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_command.ml#L13)

<a id="function-function-mq3-client-snapshot-command-pad3-function-pad3-value-src-mq3-client-snapshot-command-ml-69502757"></a>
### pad3

```ml
function pad3(value)
```

Left-pads a snapshot diagnostic offset to at least three characters.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `text=str(value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_command.ml#L122)

<a id="function-function-mq3-client-snapshot-command-parsesnapshot-function-parsesnapshot-state-msg-src-mq3-client-snapshot-command-ml-855957914"></a>
### parseSnapshot

```ml
function parseSnapshot(state, msg)
```

`svc_snapshot` has already been consumed by CL_ParseServerMessage. Invalid deltas are fully consumed and populate the parse-entity ring like C, but are not promoted to the current/backup snapshot.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable snapshot command record/storage; this routine assigns `state.shownetLines`, `state.demoWaiting`, `state.snapshots[oldMessageNum&PACKET_MASK].valid`, `state.snap` and additional values. |
| `msg` | `dynamic` | — | Record read through `msg.readcount`, `msg.cursize`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_command.ml#L181)

<a id="function-function-mq3-client-snapshot-command-shownet-function-shownet-state-msg-text-src-mq3-client-snapshot-command-ml-1833858263"></a>
### shownet

```ml
function shownet(state, msg, text)
```

Adds a snapshot parser offset/message diagnostic when shownet verbosity is at least two.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable snapshot command record/storage; this routine assigns `state.shownetLines`. |
| `msg` | `dynamic` | — | Record read through `msg.readcount`. |
| `text` | `dynamic` | — | Text consumed or emitted by `shownet` in the snapshot command path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_command.ml#L127)

- [mq3.client.snapshot_command.Snapshot](Type-mq3-client-snapshot-command-snapshot-208860851.md) — struct
- [mq3.client.snapshot_command.State](Type-mq3-client-snapshot-command-state-1221162148.md) — struct
