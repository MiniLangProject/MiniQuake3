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
| `clients` | `dynamic` | — | Clients used in `clients[i]` and `len(clients)`. |
| `playerStates` | `dynamic` | — | Player states used in `playerStates[i]` and `len(playerStates)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_pings.ml#L64)

<a id="function-function-mq3-server-client-pings-client-function-client-src-mq3-server-client-pings-ml-519910768"></a>
### client

```ml
function client()
```

Create `mq3.server.client_pings.Client` with state=0; ping=0; gentity=void; frames=array(PACKET_BACKUP, void).


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_pings.ml#L56)

- [mq3.server.client_pings.Client](Type-mq3-server-client-pings-client-1462703897.md) — struct
<a id="constant-constant-mq3-server-client-pings-cs-active-const-cs-active-4-src-mq3-server-client-pings-ml-1807043629"></a>
### CS_ACTIVE

```ml
const CS_ACTIVE = 4
```

Client-state value identifying a client whose acknowledged snapshots contribute to ping calculation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_pings.ml#L10)

<a id="function-function-mq3-server-client-pings-frame-function-frame-sent-acked-src-mq3-server-client-pings-ml-1158573280"></a>
### frame

```ml
function frame(sent, acked)
```

Create `mq3.server.client_pings.PingFrame` with messageSent=sent; messageAcked=acked.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sent` | `dynamic` | — | Initial `messageSent` field stored in the returned or constructed `mq3.server.client_pings.PingFrame` record. |
| `acked` | `dynamic` | — | Initial `messageAcked` field stored in the returned or constructed `mq3.server.client_pings.PingFrame` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_pings.ml#L24)

<a id="function-function-mq3-server-client-pings-gameentity-function-gameentity-flags-src-mq3-server-client-pings-ml-1286756867"></a>
### gameEntity

```ml
function gameEntity(flags)
```

Create `mq3.server.client_pings.GameEntity` with svFlags=flags.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `flags` | `dynamic` | — | Initial `svFlags` field stored in the returned or constructed `mq3.server.client_pings.GameEntity` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_pings.ml#L33)

- [mq3.server.client_pings.GameEntity](Type-mq3-server-client-pings-gameentity-23766339.md) — struct
<a id="constant-constant-mq3-server-client-pings-packet-backup-const-packet-backup-32-src-mq3-server-client-pings-ml-949092278"></a>
### PACKET_BACKUP

```ml
const PACKET_BACKUP = 32
```

Number of old messages that must be kept on client and.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_pings.ml#L8)

- [mq3.server.client_pings.PingFrame](Type-mq3-server-client-pings-pingframe-1788311395.md) — struct
<a id="function-function-mq3-server-client-pings-playerstate-function-playerstate-src-mq3-server-client-pings-ml-2058063404"></a>
### playerState

```ml
function playerState()
```

Create `mq3.server.client_pings.PlayerState` with ping=0.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_pings.ml#L41)

- [mq3.server.client_pings.PlayerState](Type-mq3-server-client-pings-playerstate-2126532420.md) — struct
<a id="constant-constant-mq3-server-client-pings-svf-bot-const-svf-bot-8-src-mq3-server-client-pings-ml-434488321"></a>
### SVF_BOT

```ml
const SVF_BOT = 8
```

Set if the entity is a bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_pings.ml#L12)
