# `src/mq3/client/network_ingress.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.network_ingress`](Package-mq3-client-network-ingress-1911277453.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/netchan.ml` as `clientNetchanRuntime` → [src/mq3/client/netchan.ml](File-src-mq3-client-netchan-ml-1745063016.md)
- `mq3/client/packet_event.ml` as `clientPacketEvent` → [src/mq3/client/packet_event.ml](File-src-mq3-client-packet-event-ml-580908436.md)
- `mq3/client/protocol_runtime.ml` as `protocolRuntime` → [src/mq3/client/protocol_runtime.ml](File-src-mq3-client-protocol-runtime-ml-1085434472.md)
- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)
- `mq3/qcommon/network_pump.ml` as `networkPump` → [src/mq3/qcommon/network_pump.ml](File-src-mq3-qcommon-network-pump-ml-493477247.md)

## Declarations

<a id="function-function-mq3-client-network-ingress-clientpacket-function-clientpacket-runtime-address-data-src-mq3-client-network-ingress-ml-1520193426"></a>
### clientPacket

```ml
function clientPacket(runtime, address, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_ingress.ml#L65)

<a id="function-function-mq3-client-network-ingress-create-function-create-connectionstate-netchanruntime-protocol-hostservices-src-mq3-client-network-ingress-ml-88483758"></a>
### create

```ml
function create(connectionState, netchanRuntime, protocol, hostServices)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `connectionState` | `dynamic` | — |  |
| `netchanRuntime` | `dynamic` | — |  |
| `protocol` | `dynamic` | — |  |
| `hostServices` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_ingress.ml#L48)

<a id="function-function-mq3-client-network-ingress-createpump-function-createpump-runtime-clientsocket-serversocket-capacity-src-mq3-client-network-ingress-ml-583708552"></a>
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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_ingress.ml#L82)

<a id="function-function-mq3-client-network-ingress-parse-function-parse-packethost-state-msg-src-mq3-client-network-ingress-ml-797369456"></a>
### parse

```ml
function parse(packetHost, state, msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `packetHost` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_ingress.ml#L27)

<a id="function-function-mq3-client-network-ingress-process-function-process-packethost-state-msg-src-mq3-client-network-ingress-ml-696061568"></a>
### process

```ml
function process(packetHost, state, msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `packetHost` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_ingress.ml#L21)

<a id="function-function-mq3-client-network-ingress-receiveclient-function-receiveclient-runtime-address-data-src-mq3-client-network-ingress-ml-353274470"></a>
### receiveClient

```ml
function receiveClient(runtime, address, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_ingress.ml#L73)

<a id="function-function-mq3-client-network-ingress-receiveserver-function-receiveserver-runtime-address-data-src-mq3-client-network-ingress-ml-1814103582"></a>
### receiveServer

```ml
function receiveServer(runtime, address, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_ingress.ml#L77)

<a id="function-function-mq3-client-network-ingress-recorddemo-function-recorddemo-packethost-state-msg-headerbytes-src-mq3-client-network-ingress-ml-998594900"></a>
### recordDemo

```ml
function recordDemo(packetHost, state, msg, headerBytes)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `packetHost` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |
| `headerBytes` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_ingress.ml#L42)

- [mq3.client.network_ingress.Runtime](Type-mq3-client-network-ingress-runtime-464646655.md) — struct
<a id="function-function-mq3-client-network-ingress-services-function-services-connectionlesshost-src-mq3-client-network-ingress-ml-807274063"></a>
### services

```ml
function services(connectionlessHost)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `connectionlessHost` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_ingress.ml#L17)

- [mq3.client.network_ingress.Services](Type-mq3-client-network-ingress-services-622981985.md) — struct
<a id="function-function-mq3-client-network-ingress-setrealtime-function-setrealtime-runtime-realtime-src-mq3-client-network-ingress-ml-735561797"></a>
### setRealtime

```ml
function setRealtime(runtime, realtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `realtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/network_ingress.ml#L58)
