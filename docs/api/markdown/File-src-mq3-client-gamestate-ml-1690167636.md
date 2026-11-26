# `src/mq3/client/gamestate.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.gamestate`](Package-mq3-client-gamestate-198721696.md)

Reachable from entry: **yes**

## Imports

- `mq3/game/entitystate.ml` as `entitystate` → [src/mq3/game/entitystate.ml](File-src-mq3-game-entitystate-ml-1227653182.md)
- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)
- `mq3/qcommon/message_state_delta.ml` as `delta` → [src/mq3/qcommon/message_state_delta.ml](File-src-mq3-qcommon-message-state-delta-ml-255612102.md)

## Declarations

<a id="function-function-mq3-client-gamestate-clear-function-clear-state-src-mq3-client-gamestate-ml-1719538979"></a>
### clear

```ml
function clear(state)
```

Updates `state.stringOffsets`, `state.stringData`, `state.dataCount`, `state.baselines` and additional values during gamestate `clear`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable gamestate record/storage; this routine assigns `state.stringOffsets`, `state.stringData`, `state.dataCount`, `state.baselines` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/gamestate.ml#L73)

<a id="function-function-mq3-client-gamestate-configstring-function-configstring-state-index-src-mq3-client-gamestate-ml-89968791"></a>
### configString

```ml
function configString(state, index)
```

Calls `decode`, `slice` from gamestate `configString`. The final path returns `decode(slice(state.stringData,offset,finish-offset))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.stringOffsets`, `state.stringData`. |
| `index` | `dynamic` | — | Value tested by `index<0 or index>=MAX_CONFIGSTRINGS` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/gamestate.ml#L82)

<a id="function-function-mq3-client-gamestate-create-function-create-src-mq3-client-gamestate-ml-422794250"></a>
### create

```ml
function create()
```

Creates a `mq3.client.gamestate.State` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/gamestate.ml#L67)

<a id="constant-constant-mq3-client-gamestate-gentitynum-bits-const-gentitynum-bits-10-src-mq3-client-gamestate-ml-1643500988"></a>
### GENTITYNUM_BITS

```ml
const GENTITYNUM_BITS = 10
```

Number of bits allocated to an entity number in the native network protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/gamestate.ml#L16)

<a id="constant-constant-mq3-client-gamestate-max-configstrings-const-max-configstrings-1024-src-mq3-client-gamestate-ml-1754181646"></a>
### MAX_CONFIGSTRINGS

```ml
const MAX_CONFIGSTRINGS = 1024
```

Capacity limit for the configstrings collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/gamestate.ml#L10)

<a id="constant-constant-mq3-client-gamestate-max-gamestate-chars-const-max-gamestate-chars-16000-src-mq3-client-gamestate-ml-126047816"></a>
### MAX_GAMESTATE_CHARS

```ml
const MAX_GAMESTATE_CHARS = 16000
```

Capacity of the packed server configuration-string character storage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/gamestate.ml#L12)

<a id="constant-constant-mq3-client-gamestate-max-gentities-const-max-gentities-1024-src-mq3-client-gamestate-ml-1416240374"></a>
### MAX_GENTITIES

```ml
const MAX_GENTITIES = 1024
```

Capacity limit for the gentities collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/gamestate.ml#L14)

<a id="function-function-mq3-client-gamestate-parse-function-parse-state-msg-src-mq3-client-gamestate-ml-9521342"></a>
### parse

```ml
function parse(state, msg)
```

Updates `state.connectPacketCount`, `state.serverCommandSequence`, `state.stringOffsets[index]`, `state.stringData[state.dataCount+offset]` and additional values during gamestate `parse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable gamestate record/storage; this routine assigns `state.connectPacketCount`, `state.serverCommandSequence`, `state.stringOffsets[index]`, `state.stringData[state.dataCount+offset]` and additional values. |
| `msg` | `dynamic` | — | Record read through `msg.readcount`, `msg.cursize`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/gamestate.ml#L128)

- [mq3.client.gamestate.State](Type-mq3-client-gamestate-state-156757087.md) — struct
<a id="constant-constant-mq3-client-gamestate-svc-baseline-const-svc-baseline-4-src-mq3-client-gamestate-ml-1221981739"></a>
### SVC_BASELINE

```ml
const SVC_BASELINE = 4
```

Server-message command byte selecting the baseline protocol operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/gamestate.ml#L20)

<a id="constant-constant-mq3-client-gamestate-svc-configstring-const-svc-configstring-3-src-mq3-client-gamestate-ml-230624466"></a>
### SVC_CONFIGSTRING

```ml
const SVC_CONFIGSTRING = 3
```

Server-message command byte selecting the configstring protocol operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/gamestate.ml#L18)

<a id="constant-constant-mq3-client-gamestate-svc-eof-const-svc-eof-8-src-mq3-client-gamestate-ml-1342501085"></a>
### SVC_EOF

```ml
const SVC_EOF = 8
```

Server-message command byte selecting the eof protocol operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/gamestate.ml#L22)

<a id="function-function-mq3-client-gamestate-updateconfigstring-function-updateconfigstring-state-index-value-src-mq3-client-gamestate-ml-342217550"></a>
### updateConfigString

```ml
function updateConfigString(state, index, value)
```

Replaces one configstring by rebuilding packed string storage before publishing any mutation. Returns false for identical text and true when the offsets, bytes and used-byte count change. Empty text removes the slot. Error 6900 rejects missing inputs, an invalid index or embedded zero bytes; error 6904 rejects storage overflow. Every failed update preserves the prior state. Unchanged strings are copied as bytes, and the packed table reserves byte zero and each terminator.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable gamestate with valid packed string offsets and storage. |
| `index` | `dynamic` | — | Configstring slot in the range zero through `MAX_CONFIGSTRINGS - 1`. |
| `value` | `dynamic` | — | Replacement text whose encoded bytes must fit within `MAX_GAMESTATE_CHARS` with all other strings. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/gamestate.ml#L99)
