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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L39)

<a id="function-function-mq3-client-snapshot-parse-createframe-function-createframe-src-mq3-client-snapshot-parse-ml-2002156060"></a>
### createFrame

```ml
function createFrame()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L27)

<a id="function-function-mq3-client-snapshot-parse-createstate-function-createstate-src-mq3-client-snapshot-parse-ml-451193908"></a>
### createState

```ml
function createState()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L29)

<a id="function-function-mq3-client-snapshot-parse-deltaentity-function-deltaentity-state-msg-frame-newnum-old-unchanged-src-mq3-client-snapshot-parse-ml-820825949"></a>
### deltaEntity

```ml
function deltaEntity(state, msg, frame, newnum, old, unchanged)
```

Mirrors CL_DeltaEntity: removed records occupy no ring slot.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |
| `frame` | `dynamic` | — |  |
| `newnum` | `dynamic` | — |  |
| `old` | `dynamic` | — |  |
| `unchanged` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L54)

<a id="constant-constant-mq3-client-snapshot-parse-entity-sentinel-const-entity-sentinel-1023-src-mq3-client-snapshot-parse-ml-1719151565"></a>
### ENTITY_SENTINEL

```ml
const ENTITY_SENTINEL = 1023
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L12)

- [mq3.client.snapshot_parse.Frame](Type-mq3-client-snapshot-parse-frame-1256871486.md) — struct
<a id="constant-constant-mq3-client-snapshot-parse-gentitynum-bits-const-gentitynum-bits-10-src-mq3-client-snapshot-parse-ml-1382251852"></a>
### GENTITYNUM_BITS

```ml
const GENTITYNUM_BITS = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L11)

<a id="constant-constant-mq3-client-snapshot-parse-max-gentities-const-max-gentities-1024-src-mq3-client-snapshot-parse-ml-521391106"></a>
### MAX_GENTITIES

```ml
const MAX_GENTITIES = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L10)

<a id="constant-constant-mq3-client-snapshot-parse-max-parse-entities-const-max-parse-entities-2048-src-mq3-client-snapshot-parse-ml-974007535"></a>
### MAX_PARSE_ENTITIES

```ml
const MAX_PARSE_ENTITIES = 2048
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L9)

<a id="function-function-mq3-client-snapshot-parse-nextold-function-nextold-state-oldframe-index-src-mq3-client-snapshot-parse-ml-1052477959"></a>
### nextOld

```ml
function nextOld(state, oldframe, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `oldframe` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L65)

<a id="function-function-mq3-client-snapshot-parse-pad3-function-pad3-value-src-mq3-client-snapshot-parse-ml-1597113205"></a>
### pad3

```ml
function pad3(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L33)

<a id="function-function-mq3-client-snapshot-parse-parsedentity-function-parsedentity-state-absoluteindex-src-mq3-client-snapshot-parse-ml-1814045254"></a>
### parsedEntity

```ml
function parsedEntity(state, absoluteIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `absoluteIndex` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L46)

<a id="function-function-mq3-client-snapshot-parse-parsepacketentities-function-parsepacketentities-state-msg-oldframe-newframe-src-mq3-client-snapshot-parse-ml-207349741"></a>
### parsePacketEntities

```ml
function parsePacketEntities(state, msg, oldframe, newframe)
```

Merge the sorted wire entity stream with the prior snapshot's sorted ring slice.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |
| `oldframe` | `dynamic` | — |  |
| `newframe` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L72)

- [mq3.client.snapshot_parse.State](Type-mq3-client-snapshot-parse-state-1252978174.md) — struct
<a id="function-function-mq3-client-snapshot-parse-trace-function-trace-state-msg-text-src-mq3-client-snapshot-parse-ml-1471661677"></a>
### trace

```ml
function trace(state, msg, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_parse.ml#L34)
