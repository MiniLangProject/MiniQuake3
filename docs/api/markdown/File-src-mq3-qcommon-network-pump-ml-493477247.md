# `src/mq3/qcommon/network_pump.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.qcommon.network_pump`](Package-mq3-qcommon-network-pump-396688763.md)

Reachable from entry: **yes**

## Imports

- `mq3/qcommon/net_transport.ml` as `transport` → [src/mq3/qcommon/net_transport.ml](File-src-mq3-qcommon-net-transport-ml-1557933377.md)

## Declarations

<a id="function-function-mq3-qcommon-network-pump-create-function-create-clientsocket-serversocket-capacity-context-clientpacketfn-serverpacketfn-src-mq3-qcommon-network-pump-ml-1923149647"></a>
### create

```ml
function create(clientSocket, serverSocket, capacity, context, clientPacketFn, serverPacketFn)
```

Create a nonblocking client/server UDP pump with reusable receive buffers. At least one socket must be present. Each endpoint receives a `capacity`-byte buffer and eight bytes of address metadata. Polling initially prefers the client side; no sockets are opened or closed here.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientSocket` | `dynamic` | — | Open client UDP socket, or `void` to disable client-side receives. |
| `serverSocket` | `dynamic` | — | Open server UDP socket, or `void` to disable server-side receives. |
| `capacity` | `dynamic` | — | Maximum receive size in bytes per datagram, from 1 through 65,535. |
| `context` | `dynamic` | — | Opaque value passed unchanged to either packet callback. |
| `clientPacketFn` | `dynamic` | — | Optional callback `(context, address, data)` for client-side datagrams. |
| `serverPacketFn` | `dynamic` | — | Optional callback `(context, address, data)` for server-side datagrams. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/network_pump.ml#L60)

<a id="function-function-mq3-qcommon-network-pump-drain-function-drain-runtime-maxpackets-src-mq3-qcommon-network-pump-ml-2080990963"></a>
### drain

```ml
function drain(runtime, maxPackets)
```

Drain currently available datagrams up to an explicit per-frame budget. A zero budget is useful for callers that only want deterministic accounting. Process currently available UDP datagrams up to the supplied packet budget. Returns the number processed, stopping early when both endpoints are empty. A zero budget returns zero without polling; a negative budget or missing runtime produces error 6975.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Pump supplying receive buffers, callback context, and alternating endpoint priority. |
| `maxPackets` | `dynamic` | — | Maximum number of datagrams to process in this call, not a byte limit. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/network_pump.ml#L108)

<a id="function-function-mq3-qcommon-network-pump-pumponce-function-pumponce-runtime-src-mq3-qcommon-network-pump-ml-271500050"></a>
### pumpOnce

```ml
function pumpOnce(runtime)
```

Consume at most one datagram.  When both queues are ready, alternate the first socket examined so neither side can starve the other. Poll at most two endpoints and consume at most one available datagram. The endpoint chosen by `nextSide` is examined first; an empty first attempt falls through to the other. Returns the processed Step or the final empty Step when neither endpoint has a packet.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Nonblocking pump whose next polling side is updated after a successful receive. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/network_pump.ml#L94)

<a id="function-function-mq3-qcommon-network-pump-receiveside-function-receiveside-runtime-side-src-mq3-qcommon-network-pump-ml-1670796535"></a>
### receiveSide

```ml
function receiveSide(runtime, side)
```

Try to receive one datagram from the selected socket and invoke its optional packet callback. Returns an unprocessed Step when the socket is absent or has no packet, or a processed Step containing the sender and payload after successful handling. Transport or callback errors are returned directly. After successful reception the opposite endpoint becomes the next preferred side.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Pump containing the sockets, reusable receive buffers, callbacks, and polling state. |
| `side` | `dynamic` | — | Endpoint selector, SIDE_CLIENT or SIDE_SERVER. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/network_pump.ml#L72)

- [mq3.qcommon.network_pump.Runtime](Type-mq3-qcommon-network-pump-runtime-1753198241.md) — struct
<a id="constant-constant-mq3-qcommon-network-pump-side-client-const-side-client-0-src-mq3-qcommon-network-pump-ml-1155793613"></a>
### SIDE_CLIENT

```ml
const SIDE_CLIENT = 0
```

Network-pump selector for the client side.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/network_pump.ml#L7)

<a id="constant-constant-mq3-qcommon-network-pump-side-server-const-side-server-1-src-mq3-qcommon-network-pump-ml-2135689626"></a>
### SIDE_SERVER

```ml
const SIDE_SERVER = 1
```

Network-pump selector for the server side.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/network_pump.ml#L9)

- [mq3.qcommon.network_pump.Step](Type-mq3-qcommon-network-pump-step-1198220221.md) — struct
