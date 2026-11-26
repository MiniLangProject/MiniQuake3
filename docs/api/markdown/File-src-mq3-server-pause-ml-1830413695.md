# `src/mq3/server/pause.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.pause`](Package-mq3-server-pause-60666049.md)

Reachable from entry: **yes**

## Declarations

<a id="function-function-mq3-server-pause-check-function-check-clients-clpaused-svpaused-src-mq3-server-pause-ml-543815482"></a>
### check

```ml
function check(clients, clPaused, svPaused)
```

Check pause in server.pause; the normal completion returns `PauseResult(true, svPaused, 0)`.

Validation failures include `server pause: missing client array`; `server pause: missing client`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clients` | `dynamic` | — | Clients used in `clients[i]` and `len(clients)`. |
| `clPaused` | `dynamic` | — | Cl paused used in `(clPaused == 0)`. |
| `svPaused` | `dynamic` | — | Initial `svPaused` field stored in the returned or constructed `mq3.server.pause.PauseResult` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pause.ml#L49)

<a id="function-function-mq3-server-pause-client-function-client-state-addresstype-src-mq3-server-pause-ml-945974459"></a>
### client

```ml
function client(state, addressType)
```

Create `mq3.server.pause.Client` with state=state; addressType=addressType.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Initial `state` field stored in the returned or constructed `mq3.server.pause.Client` record. |
| `addressType` | `dynamic` | — | Initial `addressType` field stored in the returned or constructed `mq3.server.pause.Client` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pause.ml#L30)

- [mq3.server.pause.Client](Type-mq3-server-pause-client-1009448838.md) — struct
<a id="constant-constant-mq3-server-pause-cs-active-const-cs-active-4-src-mq3-server-pause-ml-1058145291"></a>
### CS_ACTIVE

```ml
const CS_ACTIVE = 4
```

Client-state value identifying a playing client counted when deciding whether the server may pause.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pause.ml#L17)

<a id="constant-constant-mq3-server-pause-cs-connected-const-cs-connected-2-src-mq3-server-pause-ml-910178823"></a>
### CS_CONNECTED

```ml
const CS_CONNECTED = 2
```

Client lifecycle state after connection but before gamestate priming.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pause.ml#L13)

<a id="constant-constant-mq3-server-pause-cs-free-const-cs-free-0-src-mq3-server-pause-ml-1744887687"></a>
### CS_FREE

```ml
const CS_FREE = 0
```

Client-state value identifying a vacant slot excluded from the pause decision.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pause.ml#L9)

<a id="constant-constant-mq3-server-pause-cs-primed-const-cs-primed-3-src-mq3-server-pause-ml-1611575926"></a>
### CS_PRIMED

```ml
const CS_PRIMED = 3
```

Client lifecycle state after gamestate delivery and before entering active play.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pause.ml#L15)

<a id="constant-constant-mq3-server-pause-cs-zombie-const-cs-zombie-1-src-mq3-server-pause-ml-20241952"></a>
### CS_ZOMBIE

```ml
const CS_ZOMBIE = 1
```

Client lifecycle state retaining a recently disconnected client for final messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pause.ml#L11)

<a id="constant-constant-mq3-server-pause-na-bot-const-na-bot-0-src-mq3-server-pause-ml-1375286791"></a>
### NA_BOT

```ml
const NA_BOT = 0
```

Network-address kind reserved for an in-process bot client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pause.ml#L7)

- [mq3.server.pause.PauseResult](Type-mq3-server-pause-pauseresult-352000980.md) — struct
