# `src/mq3/server/network_ingress.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.network_ingress`](Package-mq3-server-network-ingress-866091425.md)

Reachable from entry: **yes**

## Imports

- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)
- `mq3/qcommon/network_pump.ml` as `networkPump` → [src/mq3/qcommon/network_pump.ml](File-src-mq3-qcommon-network-pump-ml-493477247.md)
- `mq3/qcommon/received_message.ml` as `receivedMessage` → [src/mq3/qcommon/received_message.ml](File-src-mq3-qcommon-received-message-ml-265262813.md)
- `mq3/server/client_message.ml` as `clientMessage` → [src/mq3/server/client_message.ml](File-src-mq3-server-client-message-ml-526567844.md)
- `mq3/server/packet_event.ml` as `packetEvent` → [src/mq3/server/packet_event.ml](File-src-mq3-server-packet-event-ml-761376352.md)

## Declarations

<a id="function-function-mq3-server-network-ingress-binding-function-binding-packetclient-messageclient-src-mq3-server-network-ingress-ml-732670641"></a>
### binding

```ml
function binding(packetClient, messageClient)
```

Compute binding in server.network_ingress; the normal completion returns `Binding(packetClient, messageClient)`.

Validation failures include `server ingress: invalid client binding`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `packetClient` | `dynamic` | — | Initial `packetClient` field stored in the returned or constructed `mq3.server.network_ingress.Binding` record. |
| `messageClient` | `dynamic` | — | Initial `messageClient` field stored in the returned or constructed `mq3.server.network_ingress.Binding` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L75)

- [mq3.server.network_ingress.Binding](Type-mq3-server-network-ingress-binding-1863188906.md) — struct
<a id="function-function-mq3-server-network-ingress-create-function-create-serverstate-bindings-hostservices-src-mq3-server-network-ingress-ml-978198232"></a>
### create

```ml
function create(serverState, bindings, hostServices)
```

Create network ingress in server.network_ingress; the normal completion returns `runtime`.

Validation failures include `server ingress: missing configuration`; `server ingress: invalid binding`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `serverState` | `dynamic` | — | Initial `server` field stored in the returned or constructed `mq3.server.network_ingress.Runtime` record. |
| `bindings` | `dynamic` | — | Initial `bindings` field stored in the returned or constructed `mq3.server.network_ingress.Runtime` record. |
| `hostServices` | `dynamic` | — | Record exposing `connectionlessRuntime`, `connectionlessHost`, `context`, `clientCommandFn`, `userMoveFn`, `sendGamestateFn`, `dropFn` and further fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L143)

<a id="function-function-mq3-server-network-ingress-createpump-function-createpump-runtime-clientsocket-serversocket-capacity-src-mq3-server-network-ingress-ml-1795197464"></a>
### createPump

```ml
function createPump(runtime, clientSocket, serverSocket, capacity)
```

Create pump in server.network_ingress; the normal completion returns `networkPump.create(clientSocket, serverSocket, capacity, runtime, receiveClient, receiveServer)`.

Validation failures include `server ingress: missing runtime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Context passed as `context` to `mq3.qcommon.network_pump.create`. |
| `clientSocket` | `dynamic` | — | Client socket passed as `clientSocket` to `mq3.qcommon.network_pump.create`. |
| `serverSocket` | `dynamic` | — | Server socket passed as `serverSocket` to `mq3.qcommon.network_pump.create`. |
| `capacity` | `dynamic` | — | Capacity passed as `capacity` to `mq3.qcommon.network_pump.create`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L211)

<a id="function-function-mq3-server-network-ingress-disconnect-function-disconnect-packethost-address-text-src-mq3-server-network-ingress-ml-1208567347"></a>
### disconnect

```ml
function disconnect(packetHost, address, text)
```

Compute disconnect in server.network_ingress; the normal completion returns `runtime.services.disconnectFn(runtime.services, address, text)`.

Validation failures include `server ingress: missing disconnect service`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `packetHost` | `dynamic` | — | Record exposing `context`. |
| `address` | `dynamic` | — | Address used in `runtime.services.disconnectFn(runtime.services, address, text)`. |
| `text` | `dynamic` | — | Text used in `runtime.services.disconnectFn(runtime.services, address, text)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L121)

<a id="function-function-mq3-server-network-ingress-executeclient-function-executeclient-packethost-packetclient-msg-src-mq3-server-network-ingress-ml-485836762"></a>
### executeClient

```ml
function executeClient(packetHost, packetClient, msg)
```

Execute client in server.network_ingress; the normal completion returns `result`.

Validation failures include `server ingress: missing client-message binding`.
Direct state writes: `packetClient.state`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `packetHost` | `dynamic` | — | Record exposing `context`. |
| `packetClient` | `dynamic` | — | Record exposing `state`, `netchan`. Updated in place: `state`. |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.server.client_message.execute`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L102)

<a id="function-function-mq3-server-network-ingress-findbinding-function-findbinding-runtime-packetclient-src-mq3-server-network-ingress-ml-1007899529"></a>
### findBinding

```ml
function findBinding(runtime, packetClient)
```

Find binding in server.network_ingress.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `bindings`. |
| `packetClient` | `dynamic` | — | Packet client used in `(current.packetClient == packetClient)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L88)

<a id="function-function-mq3-server-network-ingress-packetdiagnostic-function-packetdiagnostic-packethost-packetclient-address-src-mq3-server-network-ingress-ml-1331730677"></a>
### packetDiagnostic

```ml
function packetDiagnostic(packetHost, packetClient, address)
```

Compute packet diagnostic in server.network_ingress.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `packetHost` | `dynamic` | — | Record exposing `context`. |
| `packetClient` | `dynamic` | — | Packet client used in `runtime.services.packetDiagnosticFn(runtime.services, packetClient, address)`. |
| `address` | `dynamic` | — | Address used in `runtime.services.packetDiagnosticFn(runtime.services, packetClient, address)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L131)

<a id="function-function-mq3-server-network-ingress-receiveclient-function-receiveclient-runtime-address-data-src-mq3-server-network-ingress-ml-1673744334"></a>
### receiveClient

```ml
function receiveClient(runtime, address, data)
```

Receive client in server.network_ingress.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `services`. |
| `address` | `dynamic` | — | Address used in `runtime.services.clientPacketFn(runtime.services, address, data)`. |
| `data` | `dynamic` | — | Data used in `runtime.services.clientPacketFn(runtime.services, address, data)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L191)

<a id="function-function-mq3-server-network-ingress-receiveserver-function-receiveserver-runtime-address-data-src-mq3-server-network-ingress-ml-1089833030"></a>
### receiveServer

```ml
function receiveServer(runtime, address, data)
```

Return `mq3.server.network_ingress.serverPacket(runtime, address, data)` from `server.network_ingress.receiveServer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Runtime passed as `runtime` to `mq3.server.network_ingress.serverPacket`. |
| `address` | `dynamic` | — | Address passed as `address` to `mq3.server.network_ingress.serverPacket`. |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.server.network_ingress.serverPacket`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L200)

- [mq3.server.network_ingress.Runtime](Type-mq3-server-network-ingress-runtime-956979395.md) — struct
<a id="function-function-mq3-server-network-ingress-serverpacket-function-serverpacket-runtime-address-data-src-mq3-server-network-ingress-ml-1505597234"></a>
### serverPacket

```ml
function serverPacket(runtime, address, data)
```

Wraps a client datagram, dispatches server packet processing, and returns and retains the packet-event result. Fragmented datagrams receive full message capacity through `received_message.create`; ordinary datagrams retain their supplied storage. Oversized datagrams return error 7981 before packet accounting. Missing input produces error 6996; successful dispatch increments the runtime packet count.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Ingress runtime owning the packet-event state, services, last result and packet count. |
| `address` | `dynamic` | — | Sender network address used by server connectionless or connected packet handling. |
| `data` | `dynamic` | — | Received UDP datagram bytes passed to the receive-storage constructor and packet-event path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L179)

<a id="function-function-mq3-server-network-ingress-services-function-services-src-mq3-server-network-ingress-ml-825236030"></a>
### services

```ml
function services()
```

Create `mq3.server.network_ingress.Services` with connectionlessRuntime=void; connectionlessHost=void; clientPacketFn=void; clientCommandFn=void; 7 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L81)

- [mq3.server.network_ingress.Services](Type-mq3-server-network-ingress-services-994545629.md) — struct
<a id="function-function-mq3-server-network-ingress-settime-function-settime-runtime-time-src-mq3-server-network-ingress-ml-59637469"></a>
### setTime

```ml
function setTime(runtime, time)
```

Set time in server.network_ingress.

Validation failures include `server ingress: missing runtime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `packetState`. |
| `time` | `dynamic` | — | Time operand used by `setTime`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L167)
