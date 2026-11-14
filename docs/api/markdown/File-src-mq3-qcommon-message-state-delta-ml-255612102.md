# `src/mq3/qcommon/message_state_delta.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.qcommon.message_state_delta`](Package-mq3-qcommon-message-state-delta-1477196902.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/entitystate.ml` as `entitystate` → [src/mq3/game/entitystate.ml](File-src-mq3-game-entitystate-ml-1227653182.md)
- `mq3/game/playerstate.ml` as `playerstate` → [src/mq3/game/playerstate.ml](File-src-mq3-game-playerstate-ml-1407876292.md)
- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)

## Declarations

<a id="function-function-mq3-qcommon-message-state-delta-arraymask-function-arraymask-tovalues-fromvalues-src-mq3-qcommon-message-state-delta-ml-200928237"></a>
### arrayMask

```ml
function arrayMask(toValues, fromValues)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `toValues` | `dynamic` | — |  |
| `fromValues` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_state_delta.ml#L103)

<a id="function-function-mq3-qcommon-message-state-delta-entitybits-function-entitybits-src-mq3-qcommon-message-state-delta-ml-883657394"></a>
### entityBits

```ml
function entityBits()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_state_delta.ml#L17)

<a id="function-function-mq3-qcommon-message-state-delta-entitydata-function-entitydata-state-src-mq3-qcommon-message-state-delta-ml-109694951"></a>
### entityData

```ml
function entityData(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_state_delta.ml#L27)

<a id="function-function-mq3-qcommon-message-state-delta-entityoffsets-function-entityoffsets-src-mq3-qcommon-message-state-delta-ml-143023600"></a>
### entityOffsets

```ml
function entityOffsets()
```

Struct byte offsets in the exact, deliberately hand-tuned wire order of msg.c.


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_state_delta.ml#L16)

<a id="constant-constant-mq3-qcommon-message-state-delta-float-int-bias-const-float-int-bias-4096-src-mq3-qcommon-message-state-delta-ml-12164716"></a>
### FLOAT_INT_BIAS

```ml
const FLOAT_INT_BIAS = 4096
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_state_delta.ml#L13)

<a id="constant-constant-mq3-qcommon-message-state-delta-float-int-bits-const-float-int-bits-13-src-mq3-qcommon-message-state-delta-ml-1381317251"></a>
### FLOAT_INT_BITS

```ml
const FLOAT_INT_BITS = 13
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_state_delta.ml#L12)

<a id="constant-constant-mq3-qcommon-message-state-delta-gentitynum-bits-const-gentitynum-bits-10-src-mq3-qcommon-message-state-delta-ml-2034970216"></a>
### GENTITYNUM_BITS

```ml
const GENTITYNUM_BITS = 10
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_state_delta.ml#L10)

<a id="constant-constant-mq3-qcommon-message-state-delta-max-gentities-const-max-gentities-1024-src-mq3-qcommon-message-state-delta-ml-697810970"></a>
### MAX_GENTITIES

```ml
const MAX_GENTITIES = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_state_delta.ml#L11)

<a id="function-function-mq3-qcommon-message-state-delta-playerbits-function-playerbits-src-mq3-qcommon-message-state-delta-ml-349273486"></a>
### playerBits

```ml
function playerBits()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_state_delta.ml#L19)

<a id="function-function-mq3-qcommon-message-state-delta-playerdata-function-playerdata-state-src-mq3-qcommon-message-state-delta-ml-7468883"></a>
### playerData

```ml
function playerData(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_state_delta.ml#L28)

<a id="function-function-mq3-qcommon-message-state-delta-playeroffsets-function-playeroffsets-src-mq3-qcommon-message-state-delta-ml-1910777500"></a>
### playerOffsets

```ml
function playerOffsets()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_state_delta.ml#L18)

<a id="function-function-mq3-qcommon-message-state-delta-readdeltaentity-function-readdeltaentity-msg-basestate-number-src-mq3-qcommon-message-state-delta-ml-1267940896"></a>
### readDeltaEntity

```ml
function readDeltaEntity(msg, baseState, number)
```

The entity number has already been consumed, as in MSG_ReadDeltaEntity.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `baseState` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_state_delta.ml#L81)

<a id="function-function-mq3-qcommon-message-state-delta-readdeltaplayerstate-function-readdeltaplayerstate-msg-basestate-src-mq3-qcommon-message-state-delta-ml-2025929015"></a>
### readDeltaPlayerstate

```ml
function readDeltaPlayerstate(msg, baseState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `baseState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_state_delta.ml#L153)

<a id="function-function-mq3-qcommon-message-state-delta-readfloat-function-readfloat-msg-allowzero-src-mq3-qcommon-message-state-delta-ml-1923554854"></a>
### readFloat

```ml
function readFloat(msg, allowZero)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `allowZero` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_state_delta.ml#L44)

<a id="function-function-mq3-qcommon-message-state-delta-readshortarray-function-readshortarray-msg-values-src-mq3-qcommon-message-state-delta-ml-384364997"></a>
### readShortArray

```ml
function readShortArray(msg, values)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `values` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_state_delta.ml#L147)

<a id="function-function-mq3-qcommon-message-state-delta-statedata-function-statedata-words-size-src-mq3-qcommon-message-state-delta-ml-1614670192"></a>
### stateData

```ml
function stateData(words, size)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `words` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_state_delta.ml#L21)

<a id="function-function-mq3-qcommon-message-state-delta-writedeltaentity-function-writedeltaentity-msg-basestate-nextstate-force-src-mq3-qcommon-message-state-delta-ml-454087322"></a>
### writeDeltaEntity

```ml
function writeDeltaEntity(msg, baseState, nextState, force)
```

Returns true when a record was emitted. A void `nextState` emits a remove record.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `baseState` | `dynamic` | — |  |
| `nextState` | `dynamic` | — |  |
| `force` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_state_delta.ml#L51)

<a id="function-function-mq3-qcommon-message-state-delta-writedeltaplayerstate-function-writedeltaplayerstate-msg-basestate-nextstate-src-mq3-qcommon-message-state-delta-ml-808497309"></a>
### writeDeltaPlayerstate

```ml
function writeDeltaPlayerstate(msg, baseState, nextState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `baseState` | `dynamic` | — |  |
| `nextState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_state_delta.ml#L115)

<a id="function-function-mq3-qcommon-message-state-delta-writefloat-function-writefloat-msg-raw-allowzero-src-mq3-qcommon-message-state-delta-ml-1849026338"></a>
### writeFloat

```ml
function writeFloat(msg, raw, allowZero)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `raw` | `dynamic` | — |  |
| `allowZero` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_state_delta.ml#L30)

<a id="function-function-mq3-qcommon-message-state-delta-writeshortarray-function-writeshortarray-msg-mask-values-src-mq3-qcommon-message-state-delta-ml-320522645"></a>
### writeShortArray

```ml
function writeShortArray(msg, mask, values)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `mask` | `dynamic` | — |  |
| `values` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message_state_delta.ml#L109)
