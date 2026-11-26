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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_ingress.ml#L95)

<a id="function-function-mq3-client-network-ingress-create-function-create-connectionstate-netchanruntime-protocol-hostservices-src-mq3-client-network-ingress-ml-88483758"></a>
### create

```ml
function create(connectionState, netchanRuntime, protocol, hostServices)
```

Connects client packet, netchan and protocol state to the incoming-packet callbacks after validating all required services.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `connectionState` | `dynamic` | — | Value used by `if connectionState==void or netchanRuntime==void or protocol==void or hostServices==void then return error(6994,"client ingress: missing confi...`. |
| `netchanRuntime` | `dynamic` | — | Value used by `if connectionState==void or netchanRuntime==void or protocol==void or hostServices==void then return error(6994,"client ingress: missing confi...`. |
| `protocol` | `dynamic` | — | Value used by `if connectionState==void or netchanRuntime==void or protocol==void or hostServices==void then return error(6994,"client ingress: missing confi...`. |
| `hostServices` | `dynamic` | — | Record read through `hostServices.connectionlessHost`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_ingress.ml#L71)

<a id="function-function-mq3-client-network-ingress-createpump-function-createpump-runtime-clientsocket-serversocket-capacity-src-mq3-client-network-ingress-ml-583708552"></a>
### createPump

```ml
function createPump(runtime, clientSocket, serverSocket, capacity)
```

Calls `mq3.qcommon.network_pump.create` from network ingress `createPump`. The final path returns `networkPump.create(clientSocket,serverSocket,capacity,runtime,receiveClient,receiveServer)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | runtime record passed to the network ingress helper calls. |
| `clientSocket` | `dynamic` | — | Value used by `return networkPump.create(clientSocket,serverSocket,capacity,runtime,receiveClient,receiveServer)`. |
| `serverSocket` | `dynamic` | — | Value used by `return networkPump.create(clientSocket,serverSocket,capacity,runtime,receiveClient,receiveServer)`. |
| `capacity` | `dynamic` | — | Maximum number of entries or bytes accepted by this container. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_ingress.ml#L128)

<a id="function-function-mq3-client-network-ingress-parse-function-parse-packethost-state-msg-src-mq3-client-network-ingress-ml-797369456"></a>
### parse

```ml
function parse(packetHost, state, msg)
```

Parses a server message, synchronizes snapshot and reliable-command sequence state, and records the parse result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `packetHost` | `dynamic` | — | Record read through `packetHost.context`. |
| `state` | `dynamic` | — | Record read through `state.serverMessageSequence`. |
| `msg` | `dynamic` | — | Value used by `result=protocolRuntime.parse(runtime.protocol,msg)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_ingress.ml#L40)

<a id="function-function-mq3-client-network-ingress-process-function-process-packethost-state-msg-src-mq3-client-network-ingress-ml-696061568"></a>
### process

```ml
function process(packetHost, state, msg)
```

Passes a server packet to the client netchan after checking that the packet host has a configured netchan runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `packetHost` | `dynamic` | — | Record read through `packetHost.context`. |
| `state` | `dynamic` | — | Record read through `state.connection.channel`. |
| `msg` | `dynamic` | — | Value used by `return clientNetchanRuntime.process(runtime.netchanRuntime,state.connection.channel,msg)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_ingress.ml#L30)

<a id="function-function-mq3-client-network-ingress-receiveclient-function-receiveclient-runtime-address-data-src-mq3-client-network-ingress-ml-353274470"></a>
### receiveClient

```ml
function receiveClient(runtime, address, data)
```

Adapts `mq3.client.network_ingress.clientPacket` to network ingress `receiveClient`, returning its result for `runtime, address, data`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Argument 1 of `mq3.client.network_ingress.clientPacket`. |
| `address` | `dynamic` | — | Argument 2 of `mq3.client.network_ingress.clientPacket`. |
| `data` | `dynamic` | — | Argument 3 of `mq3.client.network_ingress.clientPacket`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_ingress.ml#L110)

<a id="function-function-mq3-client-network-ingress-receiveserver-function-receiveserver-runtime-address-data-src-mq3-client-network-ingress-ml-1814103582"></a>
### receiveServer

```ml
function receiveServer(runtime, address, data)
```

Forwards a server-side datagram to the optional server packet service, or returns void when no service is installed.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record read through `runtime.services.serverPacketFn`, `runtime.services`. |
| `address` | `dynamic` | — | Value used by `if runtime.services.serverPacketFn!=void then return runtime.services.serverPacketFn(runtime.services,address,data) end if`. |
| `data` | `dynamic` | — | Value used by `if runtime.services.serverPacketFn!=void then return runtime.services.serverPacketFn(runtime.services,address,data) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_ingress.ml#L118)

<a id="function-function-mq3-client-network-ingress-recorddemo-function-recorddemo-packethost-state-msg-headerbytes-src-mq3-client-network-ingress-ml-998594900"></a>
### recordDemo

```ml
function recordDemo(packetHost, state, msg, headerBytes)
```

Forwards a received message and its header length to the configured demo recorder.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `packetHost` | `dynamic` | — | Record read through `packetHost.context`. |
| `state` | `dynamic` | — | Shared network ingress state passed to the helper calls in `recordDemo`. |
| `msg` | `dynamic` | — | Value used by `return runtime.services.demoFn(runtime.services,state,msg,headerBytes)`. |
| `headerBytes` | `dynamic` | — | Number of transport/header bytes preceding the recorded message payload. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_ingress.ml#L60)

- [mq3.client.network_ingress.Runtime](Type-mq3-client-network-ingress-runtime-464646655.md) — struct
<a id="function-function-mq3-client-network-ingress-services-function-services-connectionlesshost-src-mq3-client-network-ingress-ml-807274063"></a>
### services

```ml
function services(connectionlessHost)
```

Creates a `mq3.client.network_ingress.Services` record. Assigns `connectionlessHost` from `connectionlessHost`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `connectionlessHost` | `dynamic` | — | Value used to initialize `Services.connectionlessHost`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_ingress.ml#L22)

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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/network_ingress.ml#L84)
