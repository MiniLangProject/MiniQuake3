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

Calls `mq3.platform.udp.close`, `mq3.platform.udp.cleanup` from UI LAN udp `abandon`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientSocket` | `dynamic` | — | Value used by `if clientSocket!=void then ignored=try(udp.close(clientSocket)) end if`. |
| `serverSocket` | `dynamic` | — | Value used by `if serverSocket!=void then ignored=try(udp.close(serverSocket)) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_udp.ml#L21)

<a id="function-function-mq3-client-ui-lan-udp-close-function-close-context-src-mq3-client-ui-lan-udp-ml-1037887983"></a>
### close

```ml
function close(context)
```

Updates `context.active` during UI LAN udp `close`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Mutable UI LAN udp record/storage; this routine assigns `context.active`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_udp.ml#L123)

- [mq3.client.ui_lan_udp.Context](Type-mq3-client-ui-lan-udp-context-1461703758.md) — struct
<a id="function-function-mq3-client-ui-lan-udp-dispatch-function-dispatch-context-packet-src-mq3-client-ui-lan-udp-ml-106583563"></a>
### dispatch

```ml
function dispatch(context, packet)
```

Calls `mq3.client.ui_lan_udp.isOob`, `mq3.qcommon.message.initStorage`, `mq3.client.connectionless.dispatch` from UI LAN udp `dispatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record read through `context.clientState`, `context.ingressServices`. |
| `packet` | `dynamic` | — | Record read through `packet.received`, `packet.data`, `packet.address`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_udp.ml#L90)

<a id="function-function-mq3-client-ui-lan-udp-isoob-function-isoob-data-src-mq3-client-ui-lan-udp-ml-1391967098"></a>
### isOob

```ml
function isOob(data)
```

Computes `data!=void and len(data)>=5 and data[0]==255 and data[1]==255 and data[2]==255 and data[3]==255` for UI LAN udp `isOob`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Sequence read at `data[0]`, `data[1]`, `data[2]`, `data[3]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_udp.ml#L83)

<a id="function-function-mq3-client-ui-lan-udp-localendpoint-function-localendpoint-context-sock-src-mq3-client-ui-lan-udp-ml-564053935"></a>
### localEndpoint

```ml
function localEndpoint(context, sock)
```

Adapts `mq3.platform.udp.localEndpoint` to UI LAN udp `localEndpoint`, returning its result for `selectedSocket(context,sock)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Argument 1 of `mq3.platform.udp.localEndpoint`; passed as `selectedSocket(context,sock)`. |
| `sock` | `dynamic` | — | Argument 1 of `mq3.platform.udp.localEndpoint`; passed as `selectedSocket(context,sock)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_udp.ml#L79)

<a id="function-function-mq3-client-ui-lan-udp-open-function-open-ingressstate-src-mq3-client-ui-lan-udp-ml-79120454"></a>
### open

```ml
function open(ingressState)
```

Calls `mq3.platform.udp.startup`, `mq3.platform.udp.open`, `mq3.client.ui_lan_udp.abandon` and additional helpers from UI LAN udp `open`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ingressState` | `dynamic` | — | Value used by `if ingressState==void then return error(7702,"UI LAN UDP: missing ingress state") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_udp.ml#L29)

<a id="constant-constant-mq3-client-ui-lan-udp-packet-capacity-const-packet-capacity-65535-src-mq3-client-ui-lan-udp-ml-920455637"></a>
### PACKET_CAPACITY

```ml
const PACKET_CAPACITY = 65535
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_udp.ml#L14)

<a id="function-function-mq3-client-ui-lan-udp-pump-function-pump-context-budget-src-mq3-client-ui-lan-udp-ml-2043753398"></a>
### pump

```ml
function pump(context, budget)
```

Drain bounded work from both Baseq3 source sockets. The NS_SERVER socket is needed because CL_GlobalServers_f deliberately sends its master request on it.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record read through `context.active`, `context.clientSocket`, `context.serverSocket`. |
| `budget` | `dynamic` | — | Value used by `if context==void or not context.active or budget<1 then return 0 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_udp.ml#L113)

<a id="function-function-mq3-client-ui-lan-udp-pumpsocket-function-pumpsocket-context-socket-budget-src-mq3-client-ui-lan-udp-ml-1225993759"></a>
### pumpSocket

```ml
function pumpSocket(context, socket, budget)
```

Calls `mq3.qcommon.net_transport.receive`, `mq3.client.ui_lan_udp.dispatch` from UI LAN udp `pumpSocket`. The final path returns `handled`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | context record passed to the UI LAN udp helper calls. |
| `socket` | `dynamic` | — | Value used by `packet=transport.receive(socket,PACKET_CAPACITY)`. |
| `budget` | `dynamic` | — | Value used by `for index=0 to budget-1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_udp.ml#L100)

<a id="function-function-mq3-client-ui-lan-udp-resolveaddress-function-resolveaddress-context-name-port-src-mq3-client-ui-lan-udp-ml-2104714375"></a>
### resolveAddress

```ml
function resolveAddress(context, name, port)
```

Calls `mq3.qcommon.net_transport.resolveIPv4` from UI LAN udp `resolveAddress`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record read through `context.active`. |
| `name` | `dynamic` | — | Name used to select or register the corresponding UI LAN udp resource. |
| `port` | `dynamic` | — | Value used by `result=try(transport.resolveIPv4(name,port))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_udp.ml#L65)

<a id="function-function-mq3-client-ui-lan-udp-selectedsocket-function-selectedsocket-context-sock-src-mq3-client-ui-lan-udp-ml-939718839"></a>
### selectedSocket

```ml
function selectedSocket(context, sock)
```

Evaluates UI LAN udp `selectedSocket` and returns `error(7702,"UI LAN UDP: inactive host")`, `error(7702,"UI LAN UDP: invalid source socket")`, `context.serverSocket` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Record read through `context.active`, `context.serverSocket`, `context.clientSocket`. |
| `sock` | `dynamic` | — | Value used by `if sock!=netchan.NS_CLIENT and sock!=netchan.NS_SERVER then return error(7702,"UI LAN UDP: invalid source socket") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_udp.ml#L45)

<a id="function-function-mq3-client-ui-lan-udp-sendpacket-function-sendpacket-context-sock-address-packet-src-mq3-client-ui-lan-udp-ml-1800508099"></a>
### sendPacket

```ml
function sendPacket(context, sock, address, packet)
```

Calls `mq3.client.ui_lan_udp.selectedSocket`, `mq3.platform.udp.sendTo`, `mq3.qcommon.net_transport.addressToEndpoint` from UI LAN udp `sendPacket`. The final path returns `udp.sendTo(socket,transport.addressToEndpoint(address),packet)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | context record passed to the UI LAN udp helper calls. |
| `sock` | `dynamic` | — | Value used by `socket=selectedSocket(context,sock)`. |
| `address` | `dynamic` | — | Value used by `return udp.sendTo(socket,transport.addressToEndpoint(address),packet)`. |
| `packet` | `dynamic` | — | Value used by `return udp.sendTo(socket,transport.addressToEndpoint(address),packet)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_udp.ml#L57)

<a id="function-function-mq3-client-ui-lan-udp-services-function-services-context-src-mq3-client-ui-lan-udp-ml-1039394863"></a>
### services

```ml
function services(context)
```

Calls `mq3.client.ui_lan_queries.services` from UI LAN udp `services`. The final path returns `host`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Value assigned to `host.context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/ui_lan_udp.ml#L72)
