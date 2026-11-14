# `src/mq3/server/network_ingress.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.network_ingress`](Package-mq3-server-network-ingress-866091425.md)

Reachable from entry: **yes**

## Imports

- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)
- `mq3/qcommon/network_pump.ml` as `networkPump` → [src/mq3/qcommon/network_pump.ml](File-src-mq3-qcommon-network-pump-ml-493477247.md)
- `mq3/server/client_message.ml` as `clientMessage` → [src/mq3/server/client_message.ml](File-src-mq3-server-client-message-ml-526567844.md)
- `mq3/server/packet_event.ml` as `packetEvent` → [src/mq3/server/packet_event.ml](File-src-mq3-server-packet-event-ml-761376352.md)

## Declarations

<a id="function-function-mq3-server-network-ingress-binding-function-binding-packetclient-messageclient-src-mq3-server-network-ingress-ml-732670641"></a>
### binding

```ml
function binding(packetClient, messageClient)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `packetClient` | `dynamic` | — |  |
| `messageClient` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L27)

- [mq3.server.network_ingress.Binding](Type-mq3-server-network-ingress-binding-1863188906.md) — struct
<a id="function-function-mq3-server-network-ingress-create-function-create-serverstate-bindings-hostservices-src-mq3-server-network-ingress-ml-978198232"></a>
### create

```ml
function create(serverState, bindings, hostServices)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `serverState` | `dynamic` | — |  |
| `bindings` | `dynamic` | — |  |
| `hostServices` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L68)

<a id="function-function-mq3-server-network-ingress-createpump-function-createpump-runtime-clientsocket-serversocket-capacity-src-mq3-server-network-ingress-ml-1795197464"></a>
### createPump

```ml
function createPump(runtime, clientSocket, serverSocket, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `clientSocket` | `dynamic` | — |  |
| `serverSocket` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L109)

<a id="function-function-mq3-server-network-ingress-disconnect-function-disconnect-packethost-address-text-src-mq3-server-network-ingress-ml-1208567347"></a>
### disconnect

```ml
function disconnect(packetHost, address, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `packetHost` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L56)

<a id="function-function-mq3-server-network-ingress-executeclient-function-executeclient-packethost-packetclient-msg-src-mq3-server-network-ingress-ml-485836762"></a>
### executeClient

```ml
function executeClient(packetHost, packetClient, msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `packetHost` | `dynamic` | — |  |
| `packetClient` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L43)

<a id="function-function-mq3-server-network-ingress-findbinding-function-findbinding-runtime-packetclient-src-mq3-server-network-ingress-ml-1007899529"></a>
### findBinding

```ml
function findBinding(runtime, packetClient)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `packetClient` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L36)

<a id="function-function-mq3-server-network-ingress-packetdiagnostic-function-packetdiagnostic-packethost-packetclient-address-src-mq3-server-network-ingress-ml-1331730677"></a>
### packetDiagnostic

```ml
function packetDiagnostic(packetHost, packetClient, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `packetHost` | `dynamic` | — |  |
| `packetClient` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L62)

<a id="function-function-mq3-server-network-ingress-receiveclient-function-receiveclient-runtime-address-data-src-mq3-server-network-ingress-ml-1673744334"></a>
### receiveClient

```ml
function receiveClient(runtime, address, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L100)

<a id="function-function-mq3-server-network-ingress-receiveserver-function-receiveserver-runtime-address-data-src-mq3-server-network-ingress-ml-1089833030"></a>
### receiveServer

```ml
function receiveServer(runtime, address, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L105)

- [mq3.server.network_ingress.Runtime](Type-mq3-server-network-ingress-runtime-956979395.md) — struct
<a id="function-function-mq3-server-network-ingress-serverpacket-function-serverpacket-runtime-address-data-src-mq3-server-network-ingress-ml-1505597234"></a>
### serverPacket

```ml
function serverPacket(runtime, address, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L92)

<a id="function-function-mq3-server-network-ingress-services-function-services-src-mq3-server-network-ingress-ml-825236030"></a>
### services

```ml
function services()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L32)

- [mq3.server.network_ingress.Services](Type-mq3-server-network-ingress-services-994545629.md) — struct
<a id="function-function-mq3-server-network-ingress-settime-function-settime-runtime-time-src-mq3-server-network-ingress-ml-59637469"></a>
### setTime

```ml
function setTime(runtime, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/network_ingress.ml#L87)
