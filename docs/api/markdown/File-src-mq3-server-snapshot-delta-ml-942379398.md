# `src/mq3/server/snapshot_delta.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.snapshot_delta`](Package-mq3-server-snapshot-delta-1531985500.md)

Reachable from entry: **yes**

## Imports

- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)
- `mq3/qcommon/message_state_delta.ml` as `delta` → [src/mq3/qcommon/message_state_delta.ml](File-src-mq3-qcommon-message-state-delta-ml-255612102.md)

## Declarations

<a id="function-function-mq3-server-snapshot-delta-baselinefor-function-baselinefor-baselines-number-src-mq3-server-snapshot-delta-ml-1141985457"></a>
### baselineFor

```ml
function baselineFor(baselines, number)
```

Baselines are supplied by the server host as entityState records. Keeping this lookup outside the game-state model avoids importing svEntity_t.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `baselines` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_delta.ml#L52)

<a id="function-function-mq3-server-snapshot-delta-deltaframevalid-function-deltaframevalid-deltamessage-outgoingsequence-clientactive-oldframe-nextsnapshotentities-capacity-src-mq3-server-snapshot-delta-ml-1224473833"></a>
### deltaFrameValid

```ml
function deltaFrameValid(deltaMessage, outgoingSequence, clientActive, oldFrame, nextSnapshotEntities, capacity)
```

The host supplies the frame indexed by deltaMessage. This predicate mirrors the rejection conditions in SV_WriteSnapshotToClient before it is used.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `deltaMessage` | `dynamic` | — |  |
| `outgoingSequence` | `dynamic` | — |  |
| `clientActive` | `dynamic` | — |  |
| `oldFrame` | `dynamic` | — |  |
| `nextSnapshotEntities` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_delta.ml#L34)

<a id="function-function-mq3-server-snapshot-delta-emitpacketentities-function-emitpacketentities-msg-oldframe-newframe-snapshotentities-capacity-baselines-src-mq3-server-snapshot-delta-ml-485420501"></a>
### emitPacketEntities

```ml
function emitPacketEntities(msg, oldFrame, newFrame, snapshotEntities, capacity, baselines)
```

Exact SV_EmitPacketEntities two-way sorted merge. `oldFrame` may be void for a non-delta snapshot. Returns the number of emitted entity records; the protocol terminator is not counted.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `oldFrame` | `dynamic` | — |  |
| `newFrame` | `dynamic` | — |  |
| `snapshotEntities` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |
| `baselines` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_delta.ml#L62)

<a id="constant-constant-mq3-server-snapshot-delta-entity-sentinel-const-entity-sentinel-9999-src-mq3-server-snapshot-delta-ml-1946878713"></a>
### ENTITY_SENTINEL

```ml
const ENTITY_SENTINEL = 9999
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_delta.ml#L8)

<a id="function-function-mq3-server-snapshot-delta-entityat-function-entityat-snapshotentities-capacity-absoluteindex-src-mq3-server-snapshot-delta-ml-1627907102"></a>
### entityAt

```ml
function entityAt(snapshotEntities, capacity, absoluteIndex)
```

Snapshot-ring ownership remains with the server host. This helper applies Baseq3's modulo addressing and rejects an invalid host boundary explicitly.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshotEntities` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |
| `absoluteIndex` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_delta.ml#L43)

<a id="function-function-mq3-server-snapshot-delta-frame-function-frame-firstentity-numentities-src-mq3-server-snapshot-delta-ml-561384462"></a>
### frame

```ml
function frame(firstEntity, numEntities)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `firstEntity` | `dynamic` | — |  |
| `numEntities` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_delta.ml#L17)

<a id="constant-constant-mq3-server-snapshot-delta-packet-backup-const-packet-backup-32-src-mq3-server-snapshot-delta-ml-998081418"></a>
### PACKET_BACKUP

```ml
const PACKET_BACKUP = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_delta.ml#L10)

<a id="function-function-mq3-server-snapshot-delta-packetframe-function-packetframe-firstentity-numentities-areabits-playerstate-src-mq3-server-snapshot-delta-ml-1583591499"></a>
### packetFrame

```ml
function packetFrame(firstEntity, numEntities, areaBits, playerState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `firstEntity` | `dynamic` | — |  |
| `numEntities` | `dynamic` | — |  |
| `areaBits` | `dynamic` | — |  |
| `playerState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_delta.ml#L28)

- [mq3.server.snapshot_delta.PacketFrame](Type-mq3-server-snapshot-delta-packetframe-960146415.md) — struct
- [mq3.server.snapshot_delta.SnapshotFrame](Type-mq3-server-snapshot-delta-snapshotframe-272320763.md) — struct
<a id="constant-constant-mq3-server-snapshot-delta-svc-snapshot-const-svc-snapshot-7-src-mq3-server-snapshot-delta-ml-597659610"></a>
### SVC_SNAPSHOT

```ml
const SVC_SNAPSHOT = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_delta.ml#L9)

<a id="function-function-mq3-server-snapshot-delta-writesnapshotpayload-function-writesnapshotpayload-msg-oldframe-newframe-snapshotentities-capacity-baselines-servertime-lastframe-snapflags-src-mq3-server-snapshot-delta-ml-441911843"></a>
### writeSnapshotPayload

```ml
function writeSnapshotPayload(msg, oldFrame, newFrame, snapshotEntities, capacity, baselines, serverTime, lastFrame, snapFlags)
```

Snapshot payload beginning at svc_snapshot. The outer sequencing, flags and padding are provided by server/snapshot_send.ml.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `oldFrame` | `dynamic` | — |  |
| `newFrame` | `dynamic` | — |  |
| `snapshotEntities` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |
| `baselines` | `dynamic` | — |  |
| `serverTime` | `dynamic` | — |  |
| `lastFrame` | `dynamic` | — |  |
| `snapFlags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_delta.ml#L96)
