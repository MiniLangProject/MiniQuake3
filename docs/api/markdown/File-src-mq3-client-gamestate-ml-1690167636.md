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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/gamestate.ml#L39)

<a id="function-function-mq3-client-gamestate-configstring-function-configstring-state-index-src-mq3-client-gamestate-ml-89968791"></a>
### configString

```ml
function configString(state, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/gamestate.ml#L45)

<a id="function-function-mq3-client-gamestate-create-function-create-src-mq3-client-gamestate-ml-422794250"></a>
### create

```ml
function create()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/gamestate.ml#L35)

<a id="constant-constant-mq3-client-gamestate-gentitynum-bits-const-gentitynum-bits-10-src-mq3-client-gamestate-ml-1643500988"></a>
### GENTITYNUM_BITS

```ml
const GENTITYNUM_BITS = 10
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/gamestate.ml#L12)

<a id="constant-constant-mq3-client-gamestate-max-configstrings-const-max-configstrings-1024-src-mq3-client-gamestate-ml-1754181646"></a>
### MAX_CONFIGSTRINGS

```ml
const MAX_CONFIGSTRINGS = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/gamestate.ml#L9)

<a id="constant-constant-mq3-client-gamestate-max-gamestate-chars-const-max-gamestate-chars-16000-src-mq3-client-gamestate-ml-126047816"></a>
### MAX_GAMESTATE_CHARS

```ml
const MAX_GAMESTATE_CHARS = 16000
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/gamestate.ml#L10)

<a id="constant-constant-mq3-client-gamestate-max-gentities-const-max-gentities-1024-src-mq3-client-gamestate-ml-1416240374"></a>
### MAX_GENTITIES

```ml
const MAX_GENTITIES = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/gamestate.ml#L11)

<a id="function-function-mq3-client-gamestate-parse-function-parse-state-msg-src-mq3-client-gamestate-ml-9521342"></a>
### parse

```ml
function parse(state, msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/gamestate.ml#L56)

- [mq3.client.gamestate.State](Type-mq3-client-gamestate-state-156757087.md) — struct
<a id="constant-constant-mq3-client-gamestate-svc-baseline-const-svc-baseline-4-src-mq3-client-gamestate-ml-1221981739"></a>
### SVC_BASELINE

```ml
const SVC_BASELINE = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/gamestate.ml#L14)

<a id="constant-constant-mq3-client-gamestate-svc-configstring-const-svc-configstring-3-src-mq3-client-gamestate-ml-230624466"></a>
### SVC_CONFIGSTRING

```ml
const SVC_CONFIGSTRING = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/gamestate.ml#L13)

<a id="constant-constant-mq3-client-gamestate-svc-eof-const-svc-eof-8-src-mq3-client-gamestate-ml-1342501085"></a>
### SVC_EOF

```ml
const SVC_EOF = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/gamestate.ml#L15)
