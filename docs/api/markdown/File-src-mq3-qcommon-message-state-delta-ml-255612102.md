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

Compute array mask in qcommon.message_state_delta; the normal completion returns `mask`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `toValues` | `dynamic` | — | To values used in `toValues[index]` and `(toValues[index] != fromValues[index])`. |
| `fromValues` | `dynamic` | — | From values used in `fromValues[index]` and `(toValues[index] != fromValues[index])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_state_delta.ml#L130)

<a id="function-function-mq3-qcommon-message-state-delta-entitybits-function-entitybits-src-mq3-qcommon-message-state-delta-ml-883657394"></a>
### entityBits

```ml
function entityBits()
```

Compute qcommon.message_state_delta.entityBits as `[32, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 8, 8, 8, 8, 10, 8, 19, 10, 8, 8, 0, 32, 8, 0, 0, 0, 24, 16, 8, 10, 8, 8, 0, 0, 0, 8, 0, 32, 32, 32, 0, 0, 0, 0, 32, 0, 0, 0, 32, 16]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_state_delta.ml#L18)

<a id="function-function-mq3-qcommon-message-state-delta-entitydata-function-entitydata-state-src-mq3-qcommon-message-state-delta-ml-109694951"></a>
### entityData

```ml
function entityData(state)
```

Return `mq3.qcommon.message_state_delta.stateData(entitystate.words(state), entitystate.BYTE_SIZE)` from `qcommon.message_state_delta.entityData`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.game.entitystate.words`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_state_delta.ml#L35)

<a id="function-function-mq3-qcommon-message-state-delta-entityoffsets-function-entityoffsets-src-mq3-qcommon-message-state-delta-ml-143023600"></a>
### entityOffsets

```ml
function entityOffsets()
```

Struct byte offsets in the exact, deliberately hand-tuned wire order of msg.c.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_state_delta.ml#L16)

<a id="constant-constant-mq3-qcommon-message-state-delta-float-int-bias-const-float-int-bias-4096-src-mq3-qcommon-message-state-delta-ml-12164716"></a>
### FLOAT_INT_BIAS

```ml
const FLOAT_INT_BIAS = 4096
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_state_delta.ml#L13)

<a id="constant-constant-mq3-qcommon-message-state-delta-float-int-bits-const-float-int-bits-13-src-mq3-qcommon-message-state-delta-ml-1381317251"></a>
### FLOAT_INT_BITS

```ml
const FLOAT_INT_BITS = 13
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_state_delta.ml#L12)

<a id="constant-constant-mq3-qcommon-message-state-delta-gentitynum-bits-const-gentitynum-bits-10-src-mq3-qcommon-message-state-delta-ml-2034970216"></a>
### GENTITYNUM_BITS

```ml
const GENTITYNUM_BITS = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_state_delta.ml#L10)

<a id="constant-constant-mq3-qcommon-message-state-delta-max-gentities-const-max-gentities-1024-src-mq3-qcommon-message-state-delta-ml-697810970"></a>
### MAX_GENTITIES

```ml
const MAX_GENTITIES = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_state_delta.ml#L11)

<a id="function-function-mq3-qcommon-message-state-delta-playerbits-function-playerbits-src-mq3-qcommon-message-state-delta-ml-349273486"></a>
### playerBits

```ml
function playerBits()
```

Compute qcommon.message_state_delta.playerBits as `[32, 0, 0, 8, 0, 0, 0, 0, - 16, 0, 0, 8, - 16, 16, 8, 4, 8, 8, 8, 16, 10, 4, 16, 10, 16, 16, 16, 8, - 8, 8, 8, 8, 8, 8, 8, 16, 16, 12, 8, 8, 8, 5, 0, 0, 0, 0, 10, 16]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_state_delta.ml#L22)

<a id="function-function-mq3-qcommon-message-state-delta-playerdata-function-playerdata-state-src-mq3-qcommon-message-state-delta-ml-7468883"></a>
### playerData

```ml
function playerData(state)
```

Return `mq3.qcommon.message_state_delta.stateData(playerstate.words(state), playerstate.BYTE_SIZE)` from `qcommon.message_state_delta.playerData`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Ps passed as `ps` to `mq3.game.playerstate.words`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_state_delta.ml#L38)

<a id="function-function-mq3-qcommon-message-state-delta-playeroffsets-function-playeroffsets-src-mq3-qcommon-message-state-delta-ml-1910777500"></a>
### playerOffsets

```ml
function playerOffsets()
```

Compute qcommon.message_state_delta.playerOffsets as `[0, 20, 24, 8, 32, 36, 156, 152, 44, 28, 40, 72, 16, 108, 84, 88, 112, 76, 116, 12, 68, 148, 104, 128, 48, 52, 60, 132, 164, 168, 172, 176, 180, 440, 4, 56, 64, 80, 120, 124, 140, 144, 160, 92, 96, 100, 448, 444]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_state_delta.ml#L20)

<a id="function-function-mq3-qcommon-message-state-delta-readdeltaentity-function-readdeltaentity-msg-basestate-number-src-mq3-qcommon-message-state-delta-ml-1267940896"></a>
### readDeltaEntity

```ml
function readDeltaEntity(msg, baseState, number)
```

The entity number has already been consumed, as in MSG_ReadDeltaEntity.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.readBits`. |
| `baseState` | `dynamic` | — | Source passed as `source` to `mq3.game.entitystate.copy`. |
| `number` | `dynamic` | — | Number used in `(number < 0)` and `(number >= MAX_GENTITIES)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_state_delta.ml#L105)

<a id="function-function-mq3-qcommon-message-state-delta-readdeltaplayerstate-function-readdeltaplayerstate-msg-basestate-src-mq3-qcommon-message-state-delta-ml-2025929015"></a>
### readDeltaPlayerstate

```ml
function readDeltaPlayerstate(msg, baseState)
```

Read delta playerstate in qcommon.message_state_delta; the normal completion returns `result`.

Validation failures include `message delta: bad player field count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.readU8`. |
| `baseState` | `dynamic` | — | State passed as `state` to `mq3.qcommon.message_state_delta.playerData`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_state_delta.ml#L200)

<a id="function-function-mq3-qcommon-message-state-delta-readfloat-function-readfloat-msg-allowzero-src-mq3-qcommon-message-state-delta-ml-1923554854"></a>
### readFloat

```ml
function readFloat(msg, allowZero)
```

Read float in qcommon.message_state_delta; the normal completion returns `message.readBits(msg, 32)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.readBits`. |
| `allowZero` | `dynamic` | — | Allow zero used in `(allowZero and (message.readBits(msg, 1) == 0))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_state_delta.ml#L61)

<a id="function-function-mq3-qcommon-message-state-delta-readshortarray-function-readshortarray-msg-values-src-mq3-qcommon-message-state-delta-ml-384364997"></a>
### readShortArray

```ml
function readShortArray(msg, values)
```

Read short array in qcommon.message_state_delta; updates `values entries`.

Direct state writes: `values elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.readI16`. |
| `values` | `dynamic` | — | Mutable sequence written at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_state_delta.ml#L189)

<a id="function-function-mq3-qcommon-message-state-delta-statedata-function-statedata-words-size-src-mq3-qcommon-message-state-delta-ml-1614670192"></a>
### stateData

```ml
function stateData(words, size)
```

Compute state data in qcommon.message_state_delta; the normal completion returns `data`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `words` | `dynamic` | — | Words used in `len(words)` and `words[index]`. |
| `size` | `dynamic` | — | Size used in `bytes(size, 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_state_delta.ml#L27)

<a id="function-function-mq3-qcommon-message-state-delta-writedeltaentity-function-writedeltaentity-msg-basestate-nextstate-force-src-mq3-qcommon-message-state-delta-ml-454087322"></a>
### writeDeltaEntity

```ml
function writeDeltaEntity(msg, baseState, nextState, force)
```

Returns true when a record was emitted. A void `nextState` emits a remove record.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeBits`. |
| `baseState` | `dynamic` | — | Record exposing `number`. |
| `nextState` | `dynamic` | — | Record exposing `number`. |
| `force` | `dynamic` | — | Force operand used by `writeDeltaEntity`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_state_delta.ml#L72)

<a id="function-function-mq3-qcommon-message-state-delta-writedeltaplayerstate-function-writedeltaplayerstate-msg-basestate-nextstate-src-mq3-qcommon-message-state-delta-ml-808497309"></a>
### writeDeltaPlayerstate

```ml
function writeDeltaPlayerstate(msg, baseState, nextState)
```

Write delta playerstate in qcommon.message_state_delta.

Validation failures include `message delta: missing playerstate`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeByte`. |
| `baseState` | `dynamic` | — | Record exposing `stats`, `persistant`, `ammo`, `powerups`. |
| `nextState` | `dynamic` | — | Record exposing `stats`, `persistant`, `ammo`, `powerups`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_state_delta.ml#L152)

<a id="function-function-mq3-qcommon-message-state-delta-writefloat-function-writefloat-msg-raw-allowzero-src-mq3-qcommon-message-state-delta-ml-1849026338"></a>
### writeFloat

```ml
function writeFloat(msg, raw, allowZero)
```

Write float in qcommon.message_state_delta.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeBits`. |
| `raw` | `dynamic` | — | Low 32 bits containing an IEEE-754 binary32 encoding. |
| `allowZero` | `dynamic` | — | Allow zero operand used by `writeFloat`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_state_delta.ml#L44)

<a id="function-function-mq3-qcommon-message-state-delta-writeshortarray-function-writeshortarray-msg-mask-values-src-mq3-qcommon-message-state-delta-ml-320522645"></a>
### writeShortArray

```ml
function writeShortArray(msg, mask, values)
```

Write short array in qcommon.message_state_delta.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeShort`. |
| `mask` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.message.writeShort`. |
| `values` | `dynamic` | — | Values used in `values[index]` and `message.writeShort(msg, values[index])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/message_state_delta.ml#L140)
