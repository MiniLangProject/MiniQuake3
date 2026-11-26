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

Create network pump in qcommon.network_pump.

Validation failures include `network pump: no sockets`; `network pump: invalid capacity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientSocket` | `dynamic` | — | Initial `clientSocket` field stored in the returned or constructed `mq3.qcommon.network_pump.Runtime` record. |
| `serverSocket` | `dynamic` | — | Initial `serverSocket` field stored in the returned or constructed `mq3.qcommon.network_pump.Runtime` record. |
| `capacity` | `dynamic` | — | Initial `capacity` field stored in the returned or constructed `mq3.qcommon.network_pump.Runtime` record. |
| `context` | `dynamic` | — | Initial `context` field stored in the returned or constructed `mq3.qcommon.network_pump.Runtime` record. |
| `clientPacketFn` | `dynamic` | — | Initial `clientPacketFn` field stored in the returned or constructed `mq3.qcommon.network_pump.Runtime` record. |
| `serverPacketFn` | `dynamic` | — | Initial `serverPacketFn` field stored in the returned or constructed `mq3.qcommon.network_pump.Runtime` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/network_pump.ml#L23)

<a id="function-function-mq3-qcommon-network-pump-drain-function-drain-runtime-maxpackets-src-mq3-qcommon-network-pump-ml-2080990963"></a>
### drain

```ml
function drain(runtime, maxPackets)
```

Drain currently available datagrams up to an explicit per-frame budget. A zero budget is useful for callers that only want deterministic accounting.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Runtime passed as `runtime` to `mq3.qcommon.network_pump.pumpOnce`. |
| `maxPackets` | `dynamic` | — | Max packets used in `(maxPackets < 0)` and `(count < maxPackets)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/network_pump.ml#L64)

<a id="function-function-mq3-qcommon-network-pump-pumponce-function-pumponce-runtime-src-mq3-qcommon-network-pump-ml-271500050"></a>
### pumpOnce

```ml
function pumpOnce(runtime)
```

Consume at most one datagram.  When both queues are ready, alternate the first socket examined so neither side can starve the other.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `nextSide`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/network_pump.ml#L53)

<a id="function-function-mq3-qcommon-network-pump-receiveside-function-receiveside-runtime-side-src-mq3-qcommon-network-pump-ml-1670796535"></a>
### receiveSide

```ml
function receiveSide(runtime, side)
```

Receive side in qcommon.network_pump; the normal completion returns `Step(true, side, packet.address, packet.data)`.

Direct state writes: `runtime.nextSide`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `clientSocket`, `serverSocket`, `clientBuffer`, `clientMetadata`, `serverBuffer`, `serverMetadata`, `capacity` and further fields. Updated in place: `nextSide`. |
| `side` | `dynamic` | — | Initial `side` field stored in the returned or constructed `mq3.qcommon.network_pump.Step` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/network_pump.ml#L34)

- [mq3.qcommon.network_pump.Runtime](Type-mq3-qcommon-network-pump-runtime-1753198241.md) — struct
<a id="constant-constant-mq3-qcommon-network-pump-side-client-const-side-client-0-src-mq3-qcommon-network-pump-ml-1155793613"></a>
### SIDE_CLIENT

```ml
const SIDE_CLIENT = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/network_pump.ml#L6)

<a id="constant-constant-mq3-qcommon-network-pump-side-server-const-side-server-1-src-mq3-qcommon-network-pump-ml-2135689626"></a>
### SIDE_SERVER

```ml
const SIDE_SERVER = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/network_pump.ml#L7)

- [mq3.qcommon.network_pump.Step](Type-mq3-qcommon-network-pump-step-1198220221.md) — struct
