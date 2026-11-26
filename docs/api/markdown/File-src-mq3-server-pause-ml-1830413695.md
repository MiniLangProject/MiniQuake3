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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clients` | `dynamic` | — |  |
| `clPaused` | `dynamic` | — |  |
| `svPaused` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pause.ml#L20)

<a id="function-function-mq3-server-pause-client-function-client-state-addresstype-src-mq3-server-pause-ml-945974459"></a>
### client

```ml
function client(state, addressType)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `addressType` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pause.ml#L14)

- [mq3.server.pause.Client](Type-mq3-server-pause-client-1009448838.md) — struct
<a id="constant-constant-mq3-server-pause-cs-active-const-cs-active-4-src-mq3-server-pause-ml-1058145291"></a>
### CS_ACTIVE

```ml
const CS_ACTIVE = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pause.ml#L11)

<a id="constant-constant-mq3-server-pause-cs-connected-const-cs-connected-2-src-mq3-server-pause-ml-910178823"></a>
### CS_CONNECTED

```ml
const CS_CONNECTED = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pause.ml#L9)

<a id="constant-constant-mq3-server-pause-cs-free-const-cs-free-0-src-mq3-server-pause-ml-1744887687"></a>
### CS_FREE

```ml
const CS_FREE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pause.ml#L7)

<a id="constant-constant-mq3-server-pause-cs-primed-const-cs-primed-3-src-mq3-server-pause-ml-1611575926"></a>
### CS_PRIMED

```ml
const CS_PRIMED = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pause.ml#L10)

<a id="constant-constant-mq3-server-pause-cs-zombie-const-cs-zombie-1-src-mq3-server-pause-ml-20241952"></a>
### CS_ZOMBIE

```ml
const CS_ZOMBIE = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pause.ml#L8)

<a id="constant-constant-mq3-server-pause-na-bot-const-na-bot-0-src-mq3-server-pause-ml-1375286791"></a>
### NA_BOT

```ml
const NA_BOT = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pause.ml#L6)

- [mq3.server.pause.PauseResult](Type-mq3-server-pause-pauseresult-352000980.md) — struct
