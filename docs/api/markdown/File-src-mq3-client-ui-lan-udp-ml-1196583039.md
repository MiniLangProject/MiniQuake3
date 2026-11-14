# `src/mq3/client/ui_lan_udp.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.ui_lan_udp`](Package-mq3-client-ui-lan-udp-1814205107.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/connectionless.ml` as `connectionless` → [src/mq3/client/connectionless.ml](File-src-mq3-client-connectionless-ml-1561502254.md)
- `mq3/client/ui_lan_ingress.ml` as `ingress` → [src/mq3/client/ui_lan_ingress.ml](File-src-mq3-client-ui-lan-ingress-ml-732601155.md)
- `mq3/client/ui_lan_queries.ml` as `queries` → [src/mq3/client/ui_lan_queries.ml](File-src-mq3-client-ui-lan-queries-ml-738625990.md)
- `mq3/platform/udp.ml` as `udp` → [src/mq3/platform/udp.ml](File-src-mq3-platform-udp-ml-646757928.md)
- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)
- `mq3/qcommon/net_transport.ml` as `transport` → [src/mq3/qcommon/net_transport.ml](File-src-mq3-qcommon-net-transport-ml-1557933377.md)
- `mq3/qcommon/netchan.ml` as `netchan` → [src/mq3/qcommon/netchan.ml](File-src-mq3-qcommon-netchan-ml-1381353623.md)

## Declarations

<a id="function-function-mq3-client-ui-lan-udp-abandon-function-abandon-clientsocket-serversocket-src-mq3-client-ui-lan-udp-ml-1121278100"></a>
### abandon

```ml
function abandon(clientSocket, serverSocket)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientSocket` | `dynamic` | — |  |
| `serverSocket` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_udp.ml#L17)

<a id="function-function-mq3-client-ui-lan-udp-close-function-close-context-src-mq3-client-ui-lan-udp-ml-1037887983"></a>
### close

```ml
function close(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_udp.ml#L87)

- [mq3.client.ui_lan_udp.Context](Type-mq3-client-ui-lan-udp-context-1461703758.md) — struct
<a id="function-function-mq3-client-ui-lan-udp-dispatch-function-dispatch-context-packet-src-mq3-client-ui-lan-udp-ml-106583563"></a>
### dispatch

```ml
function dispatch(context, packet)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `packet` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_udp.ml#L62)

<a id="function-function-mq3-client-ui-lan-udp-isoob-function-isoob-data-src-mq3-client-ui-lan-udp-ml-1391967098"></a>
### isOob

```ml
function isOob(data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_udp.ml#L58)

<a id="function-function-mq3-client-ui-lan-udp-localendpoint-function-localendpoint-context-sock-src-mq3-client-ui-lan-udp-ml-564053935"></a>
### localEndpoint

```ml
function localEndpoint(context, sock)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `sock` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_udp.ml#L56)

<a id="function-function-mq3-client-ui-lan-udp-open-function-open-ingressstate-src-mq3-client-ui-lan-udp-ml-79120454"></a>
### open

```ml
function open(ingressState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ingressState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_udp.ml#L23)

<a id="constant-constant-mq3-client-ui-lan-udp-packet-capacity-const-packet-capacity-65535-src-mq3-client-ui-lan-udp-ml-920455637"></a>
### PACKET_CAPACITY

```ml
const PACKET_CAPACITY = 65535
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_udp.ml#L14)

<a id="function-function-mq3-client-ui-lan-udp-pump-function-pump-context-budget-src-mq3-client-ui-lan-udp-ml-2043753398"></a>
### pump

```ml
function pump(context, budget)
```

Drain bounded work from both Baseq3 source sockets. The NS_SERVER socket is needed because CL_GlobalServers_f deliberately sends its master request on it.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `budget` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_udp.ml#L79)

<a id="function-function-mq3-client-ui-lan-udp-pumpsocket-function-pumpsocket-context-socket-budget-src-mq3-client-ui-lan-udp-ml-1225993759"></a>
### pumpSocket

```ml
function pumpSocket(context, socket, budget)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `socket` | `dynamic` | — |  |
| `budget` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_udp.ml#L68)

<a id="function-function-mq3-client-ui-lan-udp-resolveaddress-function-resolveaddress-context-name-port-src-mq3-client-ui-lan-udp-ml-2104714375"></a>
### resolveAddress

```ml
function resolveAddress(context, name, port)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `port` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_udp.ml#L47)

<a id="function-function-mq3-client-ui-lan-udp-selectedsocket-function-selectedsocket-context-sock-src-mq3-client-ui-lan-udp-ml-939718839"></a>
### selectedSocket

```ml
function selectedSocket(context, sock)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `sock` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_udp.ml#L36)

<a id="function-function-mq3-client-ui-lan-udp-sendpacket-function-sendpacket-context-sock-address-packet-src-mq3-client-ui-lan-udp-ml-1800508099"></a>
### sendPacket

```ml
function sendPacket(context, sock, address, packet)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `sock` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `packet` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_udp.ml#L43)

<a id="function-function-mq3-client-ui-lan-udp-services-function-services-context-src-mq3-client-ui-lan-udp-ml-1039394863"></a>
### services

```ml
function services(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/ui_lan_udp.ml#L52)
