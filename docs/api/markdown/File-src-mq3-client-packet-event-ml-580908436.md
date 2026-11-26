# `src/mq3/client/packet_event.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.packet_event`](Package-mq3-client-packet-event-692286670.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/connectionless.ml` as `clientConnectionless` → [src/mq3/client/connectionless.ml](File-src-mq3-client-connectionless-ml-1561502254.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="constant-constant-mq3-client-packet-event-ca-connected-const-ca-connected-5-src-mq3-client-packet-event-ml-711187530"></a>
### CA_CONNECTED

```ml
const CA_CONNECTED = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/packet_event.ml#L8)

<a id="function-function-mq3-client-packet-event-create-function-create-connectionstate-src-mq3-client-packet-event-ml-1322778445"></a>
### create

```ml
function create(connectionState)
```

Calls `mq3.client.packet_event.State` from packet event `create`. The final path returns `State(connectionState,0,0,false,false)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `connectionState` | `dynamic` | — | Value used by `if connectionState==void then return error(6980,"packet event: missing connection state") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/packet_event.ml#L21)

<a id="function-function-mq3-client-packet-event-isoob-function-isoob-msg-src-mq3-client-packet-event-ml-694438301"></a>
### isOob

```ml
function isOob(msg)
```

Computes `msg.cursize>=4 and numeric.readI32(msg.data,0)==-1` for packet event `isOob`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Record read through `msg.cursize`, `msg.data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/packet_event.ml#L34)

<a id="function-function-mq3-client-packet-event-packetevent-function-packetevent-state-host-source-msg-src-mq3-client-packet-event-ml-909878735"></a>
### packetEvent

```ml
function packetEvent(state, host, source, msg)
```

processFn(host,state,msg) owns CL_Netchan_Process. parseFn is normally bound to protocol_runtime.parse; demoFn owns the filesystem recording boundary.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable packet event record/storage; this routine assigns `state.connection.realtime`, `state.connection.lastPacketTime`, `state.serverMessageSequence`. |
| `host` | `dynamic` | — | Record read through `host.connectionlessHost`, `host.processFn`, `host.parseFn`, `host.demoFn`. |
| `source` | `dynamic` | — | Value used by `if state==void or state.connection==void or host==void or source==void or msg==void then return error(6981,"packet event: missing input") end if`. |
| `msg` | `dynamic` | — | Record read through `msg.cursize`, `msg.readcount`, `msg.data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/packet_event.ml#L44)

<a id="function-function-mq3-client-packet-event-services-function-services-connectionlesshost-src-mq3-client-packet-event-ml-1457457375"></a>
### services

```ml
function services(connectionlessHost)
```

Creates a `mq3.client.packet_event.Services` record. Assigns `connectionlessHost` from `connectionlessHost`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `connectionlessHost` | `dynamic` | — | Value used to initialize `Services.connectionlessHost`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/packet_event.ml#L30)

- [mq3.client.packet_event.Services](Type-mq3-client-packet-event-services-377319072.md) — struct
- [mq3.client.packet_event.State](Type-mq3-client-packet-event-state-64967829.md) — struct
