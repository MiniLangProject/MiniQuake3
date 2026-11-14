# `src/mq3/server/client_pings.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.client_pings`](Package-mq3-server-client-pings-1419030160.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-server-client-pings-calculate-function-calculate-clients-playerstates-src-mq3-server-client-pings-ml-1950895407"></a>
### calculate

```ml
function calculate(clients, playerStates)
```

Updates each engine client's ping and mirrors active, non-bot values into the corresponding game playerState, preserving the original early-continue rules.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clients` | `dynamic` | — |  |
| `playerStates` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_pings.ml#L27)

<a id="function-function-mq3-server-client-pings-client-function-client-src-mq3-server-client-pings-ml-519910768"></a>
### client

```ml
function client()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_pings.ml#L21)

- [mq3.server.client_pings.Client](Type-mq3-server-client-pings-client-1462703897.md) — struct
<a id="constant-constant-mq3-server-client-pings-cs-active-const-cs-active-4-src-mq3-server-client-pings-ml-1807043629"></a>
### CS_ACTIVE

```ml
const CS_ACTIVE = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_pings.ml#L8)

<a id="function-function-mq3-server-client-pings-frame-function-frame-sent-acked-src-mq3-server-client-pings-ml-1158573280"></a>
### frame

```ml
function frame(sent, acked)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sent` | `dynamic` | — |  |
| `acked` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_pings.ml#L12)

<a id="function-function-mq3-server-client-pings-gameentity-function-gameentity-flags-src-mq3-server-client-pings-ml-1286756867"></a>
### gameEntity

```ml
function gameEntity(flags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `flags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_pings.ml#L15)

- [mq3.server.client_pings.GameEntity](Type-mq3-server-client-pings-gameentity-23766339.md) — struct
<a id="constant-constant-mq3-server-client-pings-packet-backup-const-packet-backup-32-src-mq3-server-client-pings-ml-949092278"></a>
### PACKET_BACKUP

```ml
const PACKET_BACKUP = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_pings.ml#L7)

- [mq3.server.client_pings.PingFrame](Type-mq3-server-client-pings-pingframe-1788311395.md) — struct
<a id="function-function-mq3-server-client-pings-playerstate-function-playerstate-src-mq3-server-client-pings-ml-2058063404"></a>
### playerState

```ml
function playerState()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_pings.ml#L18)

- [mq3.server.client_pings.PlayerState](Type-mq3-server-client-pings-playerstate-2126532420.md) — struct
<a id="constant-constant-mq3-server-client-pings-svf-bot-const-svf-bot-8-src-mq3-server-client-pings-ml-434488321"></a>
### SVF_BOT

```ml
const SVF_BOT = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_pings.ml#L9)
