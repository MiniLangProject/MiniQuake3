# `src/mq3/client/snapshot_parse.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.snapshot_parse`](Package-mq3-client-snapshot-parse-1943725121.md)

Reachable from entry: **yes**

## Imports

- `mq3/game/entitystate.ml` as `entitystate` → [src/mq3/game/entitystate.ml](File-src-mq3-game-entitystate-ml-1227653182.md)
- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)
- `mq3/qcommon/message_state_delta.ml` as `delta` → [src/mq3/qcommon/message_state_delta.ml](File-src-mq3-qcommon-message-state-delta-ml-255612102.md)

## Declarations

<a id="function-function-mq3-client-snapshot-parse-baseline-function-baseline-state-number-src-mq3-client-snapshot-parse-ml-1104974508"></a>
### baseline

```ml
function baseline(state, number)
```

Returns a validated entity baseline or creates a zeroed fallback carrying the requested entity number.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.entityBaselines`. |
| `number` | `dynamic` | — | Value assigned to `value.number`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L65)

<a id="function-function-mq3-client-snapshot-parse-createframe-function-createframe-src-mq3-client-snapshot-parse-ml-2002156060"></a>
### createFrame

```ml
function createFrame()
```

Creates an empty packet-entity frame descriptor with zero ring origin and entity count.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L43)

<a id="function-function-mq3-client-snapshot-parse-createstate-function-createstate-src-mq3-client-snapshot-parse-ml-451193908"></a>
### createState

```ml
function createState()
```

Allocates the 2,048-entry parse-entity ring and 1,024 baseline slots with diagnostic tracing disabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L46)

<a id="function-function-mq3-client-snapshot-parse-deltaentity-function-deltaentity-state-msg-frame-newnum-old-unchanged-src-mq3-client-snapshot-parse-ml-820825949"></a>
### deltaEntity

```ml
function deltaEntity(state, msg, frame, newnum, old, unchanged)
```

Mirrors CL_DeltaEntity: removed records occupy no ring slot.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable snapshot parse record/storage; this routine assigns `state.parseEntities[state.parseEntitiesNum&(MAX_PARSE_ENTITIES-1)]`, `state.parseEntitiesNum`. |
| `msg` | `dynamic` | — | Value used by `if unchanged then value=entitystate.copy(old) else value=delta.readDeltaEntity(msg,old,newnum) end if`. |
| `frame` | `dynamic` | — | Mutable snapshot parse record/storage; this routine assigns `frame.numEntities`. |
| `newnum` | `dynamic` | — | Value used by `if newnum<0 or newnum>=MAX_GENTITIES then return error(6853,"snapshot parse: bad entity number") end if`. |
| `old` | `dynamic` | — | Value used by `if old==void then old=baseline(state,newnum) end if`. |
| `unchanged` | `dynamic` | — | Value used by `if unchanged then value=entitystate.copy(old) else value=delta.readDeltaEntity(msg,old,newnum) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L89)

<a id="constant-constant-mq3-client-snapshot-parse-entity-sentinel-const-entity-sentinel-1023-src-mq3-client-snapshot-parse-ml-1719151565"></a>
### ENTITY_SENTINEL

```ml
const ENTITY_SENTINEL = 1023
```

Terminating entity identifier used to mark the end of the entity sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L16)

- [mq3.client.snapshot_parse.Frame](Type-mq3-client-snapshot-parse-frame-1256871486.md) — struct
<a id="constant-constant-mq3-client-snapshot-parse-gentitynum-bits-const-gentitynum-bits-10-src-mq3-client-snapshot-parse-ml-1382251852"></a>
### GENTITYNUM_BITS

```ml
const GENTITYNUM_BITS = 10
```

Number of bits allocated to an entity number in the native network protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L14)

<a id="constant-constant-mq3-client-snapshot-parse-max-gentities-const-max-gentities-1024-src-mq3-client-snapshot-parse-ml-521391106"></a>
### MAX_GENTITIES

```ml
const MAX_GENTITIES = 1024
```

Capacity limit for the gentities collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L12)

<a id="constant-constant-mq3-client-snapshot-parse-max-parse-entities-const-max-parse-entities-2048-src-mq3-client-snapshot-parse-ml-974007535"></a>
### MAX_PARSE_ENTITIES

```ml
const MAX_PARSE_ENTITIES = 2048
```

Capacity limit for the parse entities collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L10)

<a id="function-function-mq3-client-snapshot-parse-nextold-function-nextold-state-oldframe-index-src-mq3-client-snapshot-parse-ml-1052477959"></a>
### nextOld

```ml
function nextOld(state, oldframe, index)
```

Reads the next entity from the prior snapshot, returning the merge sentinel pair [99999, void] at the end.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared snapshot parse state passed to the helper calls in `nextOld`. |
| `oldframe` | `dynamic` | — | Record read through `oldframe.numEntities`, `oldframe.parseEntitiesNum`. |
| `index` | `dynamic` | — | Value tested by `oldframe==void or index>=oldframe.numEntities` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L104)

<a id="function-function-mq3-client-snapshot-parse-pad3-function-pad3-value-src-mq3-client-snapshot-parse-ml-1597113205"></a>
### pad3

```ml
function pad3(value)
```

Left-pads a packet offset to at least three characters for entity diagnostics.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `text=str(value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L52)

<a id="function-function-mq3-client-snapshot-parse-parsedentity-function-parsedentity-state-absoluteindex-src-mq3-client-snapshot-parse-ml-1814045254"></a>
### parsedEntity

```ml
function parsedEntity(state, absoluteIndex)
```

Reads an absolute entity sequence through the parse ring, rejecting negative indices and missing history entries.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.parseEntities`. |
| `absoluteIndex` | `dynamic` | — | Value used by `if absoluteIndex<0 then return error(6851,"snapshot parse: negative entity index") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L75)

<a id="function-function-mq3-client-snapshot-parse-parsepacketentities-function-parsepacketentities-state-msg-oldframe-newframe-src-mq3-client-snapshot-parse-ml-207349741"></a>
### parsePacketEntities

```ml
function parsePacketEntities(state, msg, oldframe, newframe)
```

Merge the sorted wire entity stream with the prior snapshot's sorted ring slice.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.parseEntitiesNum`. |
| `msg` | `dynamic` | — | Record read through `msg.readcount`, `msg.cursize`. |
| `oldframe` | `dynamic` | — | Value used by `pair=nextOld(state,oldframe,oldindex)`. |
| `newframe` | `dynamic` | — | Mutable snapshot parse record/storage; this routine assigns `newframe.parseEntitiesNum`, `newframe.numEntities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L115)

- [mq3.client.snapshot_parse.State](Type-mq3-client-snapshot-parse-state-1252978174.md) — struct
<a id="function-function-mq3-client-snapshot-parse-trace-function-trace-state-msg-text-src-mq3-client-snapshot-parse-ml-1471661677"></a>
### trace

```ml
function trace(state, msg, text)
```

Records packet-entity trace lines only at shownet level three.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable snapshot parse record/storage; this routine assigns `state.shownetLines`. |
| `msg` | `dynamic` | — | Record read through `msg.readcount`. |
| `text` | `dynamic` | — | Text consumed or emitted by `trace` in the snapshot parse path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L57)
