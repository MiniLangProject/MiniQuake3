# `src/mq3/client/network_ingress.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.network_ingress`](Package-mq3-client-network-ingress-1911277453.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/netchan.ml` as `clientNetchanRuntime` → [src/mq3/client/netchan.ml](File-src-mq3-client-netchan-ml-1745063016.md)
- `mq3/client/packet_event.ml` as `clientPacketEvent` → [src/mq3/client/packet_event.ml](File-src-mq3-client-packet-event-ml-580908436.md)
- `mq3/client/protocol_runtime.ml` as `protocolRuntime` → [src/mq3/client/protocol_runtime.ml](File-src-mq3-client-protocol-runtime-ml-1085434472.md)
- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)
- `mq3/qcommon/netchan.ml` as `ingressWireNetchan` → [src/mq3/qcommon/netchan.ml](File-src-mq3-qcommon-netchan-ml-1381353623.md)
- `mq3/qcommon/network_pump.ml` as `networkPump` → [src/mq3/qcommon/network_pump.ml](File-src-mq3-qcommon-network-pump-ml-493477247.md)

## Declarations

<a id="function-function-mq3-client-network-ingress-clientpacket-function-clientpacket-runtime-address-data-src-mq3-client-network-ingress-ml-1520193426"></a>
### clientPacket

```ml
function clientPacket(runtime, address, data)
```

Wraps a UDP datagram in message storage, runs client packet processing, and records its result and packet count.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Mutable network ingress record/storage; this routine assigns `runtime.codec`, `runtime.lastPacketResult`, `runtime.packetCount`. |
| `address` | `dynamic` | — | Source network address checked by the client packet-event path. |
| `data` | `dynamic` | — | Received UDP datagram bytes, wrapped in message storage large enough for netchan reassembly. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_ingress.ml#L131)

<a id="function-function-mq3-client-network-ingress-create-function-create-connectionstate-netchanruntime-protocol-hostservices-src-mq3-client-network-ingress-ml-88483758"></a>
### create

```ml
function create(connectionState, netchanRuntime, protocol, hostServices)
```

Connect client packet handling, netchan decoding, and protocol parsing to one ingress runtime. Creates packet-event state and binds its callbacks to this runtime. All four arguments must be present, and the supplied Services must contain a connectionless service bundle; missing configuration returns error 6994.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `connectionState` | `dynamic` | — | Shared client connection state, including the active remote netchan channel. |
| `netchanRuntime` | `dynamic` | — | Client netchan decoder and its reliable-command connection state. |
| `protocol` | `dynamic` | — | Client protocol parser Runtime containing dispatcher, gamestate, and download state. |
| `hostServices` | `dynamic` | — | Ingress Services containing connectionless support and optional recording/server callbacks. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_ingress.ml#L107)

<a id="function-function-mq3-client-network-ingress-createpump-function-createpump-runtime-clientsocket-serversocket-capacity-src-mq3-client-network-ingress-ml-583708552"></a>
### createPump

```ml
function createPump(runtime, clientSocket, serverSocket, capacity)
```

Create a UDP pump whose client and server callbacks are bound to this ingress runtime. Returns the pump or a missing-runtime, missing-socket, or invalid-capacity error.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Ingress runtime retained as the pump's callback context. |
| `clientSocket` | `dynamic` | — | Open client UDP socket, or `void` to omit client-side polling. |
| `serverSocket` | `dynamic` | — | Open server UDP socket, or `void` to omit server-side polling; at least one socket is required. |
| `capacity` | `dynamic` | — | Receive-buffer size in bytes per endpoint, from 1 through 65,535. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_ingress.ml#L167)

<a id="function-function-mq3-client-network-ingress-parse-function-parse-packethost-state-msg-src-mq3-client-network-ingress-ml-797369456"></a>
### parse

```ml
function parse(packetHost, state, msg)
```

Parse a server payload and synchronize snapshot sequencing and reliable server-command history. The packet-event server sequence is copied into the snapshot parser before decoding. Afterwards the decoded server-command ring is shared with the outgoing netchan XOR encoder. Returns and retains the parser result in `lastParseResult`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `packetHost` | `dynamic` | — | Packet-event Services record whose context references this ingress runtime. |
| `state` | `dynamic` | — | Packet-event State containing the physical server-message sequence number. |
| `msg` | `dynamic` | — | Mutable message positioned at the server payload after netchan processing. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_ingress.ml#L73)

<a id="function-function-mq3-client-network-ingress-process-function-process-packethost-state-msg-src-mq3-client-network-ingress-ml-696061568"></a>
### process

```ml
function process(packetHost, state, msg)
```

Pass a sequenced server packet through the client netchan decoder and return its acceptance result. Missing ingress or netchan configuration produces error 6994.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `packetHost` | `dynamic` | — | Packet-event Services record whose context references this ingress runtime. |
| `state` | `dynamic` | — | Packet-event State whose connection owns the remote netchan channel. |
| `msg` | `dynamic` | — | Mutable received message whose payload and read cursor are processed by the netchan. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_ingress.ml#L60)

<a id="function-function-mq3-client-network-ingress-receiveclient-function-receiveclient-runtime-address-data-src-mq3-client-network-ingress-ml-353274470"></a>
### receiveClient

```ml
function receiveClient(runtime, address, data)
```

Adapt the pump's client datagram callback to ingress packet processing. Returns the same packet-event result as `clientPacket` and updates its accounting and codec state.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Ingress runtime passed by the network pump as its callback context. |
| `address` | `dynamic` | — | Sender's network address, checked against the connected server for sequenced traffic. |
| `data` | `dynamic` | — | Received UDP datagram bytes. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_ingress.ml#L147)

<a id="function-function-mq3-client-network-ingress-receiveserver-function-receiveserver-runtime-address-data-src-mq3-client-network-ingress-ml-1814103582"></a>
### receiveServer

```ml
function receiveServer(runtime, address, data)
```

Pass a server-side datagram to `serverPacketFn(services, address, data)` when configured. Returns the service result unchanged, or `void` when server-packet handling is disabled.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Ingress runtime whose Services contains the optional server callback and context. |
| `address` | `dynamic` | — | Sender's network address. |
| `data` | `dynamic` | — | Received UDP datagram bytes for the server endpoint. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_ingress.ml#L156)

<a id="function-function-mq3-client-network-ingress-recorddemo-function-recorddemo-packethost-state-msg-headerbytes-src-mq3-client-network-ingress-ml-998594900"></a>
### recordDemo

```ml
function recordDemo(packetHost, state, msg, headerBytes)
```

Forward a received server message to the installed demo recorder and return its result unchanged. The callback is `demoFn(services, state, msg, headerBytes)`; a missing recorder produces error 6994.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `packetHost` | `dynamic` | — | Packet-event Services record whose context references this ingress runtime. |
| `state` | `dynamic` | — | Packet-event State associated with the recorded server message. |
| `msg` | `dynamic` | — | Received message after server-payload parsing; the recorder receives the same message object. |
| `headerBytes` | `dynamic` | — | Number of transport/header bytes preceding the payload to record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_ingress.ml#L94)

- [mq3.client.network_ingress.Runtime](Type-mq3-client-network-ingress-runtime-464646655.md) — struct
<a id="function-function-mq3-client-network-ingress-services-function-services-connectionlesshost-src-mq3-client-network-ingress-ml-807274063"></a>
### services

```ml
function services(connectionlessHost)
```

Create the ingress service bundle with demo and server-packet callbacks initially unset.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `connectionlessHost` | `dynamic` | — | Client connectionless service bundle required later by `create`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_ingress.ml#L51)

- [mq3.client.network_ingress.Services](Type-mq3-client-network-ingress-services-622981985.md) — struct
<a id="function-function-mq3-client-network-ingress-setrealtime-function-setrealtime-runtime-realtime-src-mq3-client-network-ingress-ml-735561797"></a>
### setRealtime

```ml
function setRealtime(runtime, realtime)
```

Updates both packet-event and snapshot-parser clocks to the supplied client real time.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Mutable network ingress record/storage; this routine assigns `runtime.packetState.realtime`, `runtime.protocol.dispatcher.snapshotState.realtime`. |
| `realtime` | `dynamic` | — | Current client real-time clock in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_ingress.ml#L120)
