# `src/mq3/qcommon/net_transport.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.qcommon.net_transport`](Package-mq3-qcommon-net-transport-1901248563.md)

Reachable from entry: **yes**

## Imports

- `mq3/platform/udp.ml` as `udp` → [src/mq3/platform/udp.ml](File-src-mq3-platform-udp-ml-646757928.md)
- `mq3/qcommon/huffman.ml` as `huffman` → [src/mq3/qcommon/huffman.ml](File-src-mq3-qcommon-huffman-ml-898182869.md)
- `mq3/qcommon/netchan.ml` as `netchan` → [src/mq3/qcommon/netchan.ml](File-src-mq3-qcommon-netchan-ml-1381353623.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

- [mq3.qcommon.net_transport.AddressResult](Type-mq3-qcommon-net-transport-addressresult-1660977812.md) — struct
<a id="function-function-mq3-qcommon-net-transport-addresstoendpoint-function-addresstoendpoint-address-src-mq3-qcommon-net-transport-ml-138107026"></a>
### addressToEndpoint

```ml
function addressToEndpoint(address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L106)

<a id="function-function-mq3-qcommon-net-transport-addresstostring-function-addresstostring-address-src-mq3-qcommon-net-transport-ml-1430742938"></a>
### addressToString

```ml
function addressToString(address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L61)

<a id="function-function-mq3-qcommon-net-transport-attach-function-attach-runtime-socket-src-mq3-qcommon-net-transport-ml-7827483"></a>
### attach

```ml
function attach(runtime, socket)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `socket` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L144)

<a id="function-function-mq3-qcommon-net-transport-attachloopback-function-attachloopback-runtime-loopbacks-src-mq3-qcommon-net-transport-ml-887664398"></a>
### attachLoopback

```ml
function attachLoopback(runtime, loopbacks)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `loopbacks` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L152)

<a id="function-function-mq3-qcommon-net-transport-attachshared-function-attachshared-runtime-socket-loopbacks-src-mq3-qcommon-net-transport-ml-2040505237"></a>
### attachShared

```ml
function attachShared(runtime, socket, loopbacks)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `socket` | `dynamic` | — |  |
| `loopbacks` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L148)

<a id="function-function-mq3-qcommon-net-transport-blankaddress-function-blankaddress-kind-src-mq3-qcommon-net-transport-ml-1043269426"></a>
### blankAddress

```ml
function blankAddress(kind)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `kind` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L28)

<a id="function-function-mq3-qcommon-net-transport-compareaddress-function-compareaddress-first-second-src-mq3-qcommon-net-transport-ml-641286284"></a>
### compareAddress

```ml
function compareAddress(first, second)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L46)

<a id="function-function-mq3-qcommon-net-transport-comparebaseaddress-function-comparebaseaddress-first-second-src-mq3-qcommon-net-transport-ml-135103324"></a>
### compareBaseAddress

```ml
function compareBaseAddress(first, second)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L37)

<a id="function-function-mq3-qcommon-net-transport-create-function-create-socket-src-mq3-qcommon-net-transport-ml-1764602757"></a>
### create

```ml
function create(socket)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L121)

<a id="function-function-mq3-qcommon-net-transport-createloopback-function-createloopback-loopbacks-src-mq3-qcommon-net-transport-ml-1615181576"></a>
### createLoopback

```ml
function createLoopback(loopbacks)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `loopbacks` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L131)

<a id="function-function-mq3-qcommon-net-transport-createloopbacks-function-createloopbacks-src-mq3-qcommon-net-transport-ml-749058508"></a>
### createLoopbacks

```ml
function createLoopbacks()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L29)

<a id="function-function-mq3-qcommon-net-transport-createshared-function-createshared-socket-loopbacks-src-mq3-qcommon-net-transport-ml-1489881911"></a>
### createShared

```ml
function createShared(socket, loopbacks)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `dynamic` | — |  |
| `loopbacks` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L126)

<a id="function-function-mq3-qcommon-net-transport-endpointtoaddress-function-endpointtoaddress-endpoint-src-mq3-qcommon-net-transport-ml-1497338589"></a>
### endpointToAddress

```ml
function endpointToAddress(endpoint)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `endpoint` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L116)

<a id="function-function-mq3-qcommon-net-transport-getlooppacket-function-getlooppacket-loopbacks-sock-capacity-src-mq3-qcommon-net-transport-ml-1322598344"></a>
### getLoopPacket

```ml
function getLoopPacket(loopbacks, sock, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `loopbacks` | `dynamic` | — |  |
| `sock` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L97)

<a id="function-function-mq3-qcommon-net-transport-hexbyte-function-hexbyte-value-src-mq3-qcommon-net-transport-ml-14974673"></a>
### hexByte

```ml
function hexByte(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L52)

<a id="function-function-mq3-qcommon-net-transport-ipxtostring-function-ipxtostring-values-port-src-mq3-qcommon-net-transport-ml-531144863"></a>
### ipxToString

```ml
function ipxToString(values, port)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `port` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L56)

<a id="function-function-mq3-qcommon-net-transport-islocaladdress-function-islocaladdress-address-src-mq3-qcommon-net-transport-ml-698580210"></a>
### isLocalAddress

```ml
function isLocalAddress(address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L50)

- [mq3.qcommon.net_transport.Loopbacks](Type-mq3-qcommon-net-transport-loopbacks-2141534891.md) — struct
- [mq3.qcommon.net_transport.LoopMessage](Type-mq3-qcommon-net-transport-loopmessage-1709381836.md) — struct
- [mq3.qcommon.net_transport.LoopQueue](Type-mq3-qcommon-net-transport-loopqueue-560582288.md) — struct
<a id="constant-constant-mq3-qcommon-net-transport-max-loopback-const-max-loopback-16-src-mq3-qcommon-net-transport-ml-1070752902"></a>
### MAX_LOOPBACK

```ml
const MAX_LOOPBACK = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L18)

<a id="constant-constant-mq3-qcommon-net-transport-max-packetlen-const-max-packetlen-1400-src-mq3-qcommon-net-transport-ml-1111098622"></a>
### MAX_PACKETLEN

```ml
const MAX_PACKETLEN = 1400
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L19)

<a id="constant-constant-mq3-qcommon-net-transport-na-bad-const-na-bad-1-src-mq3-qcommon-net-transport-ml-368575434"></a>
### NA_BAD

```ml
const NA_BAD = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L11)

<a id="constant-constant-mq3-qcommon-net-transport-na-bot-const-na-bot-0-src-mq3-qcommon-net-transport-ml-1399234719"></a>
### NA_BOT

```ml
const NA_BOT = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L10)

<a id="constant-constant-mq3-qcommon-net-transport-na-broadcast-const-na-broadcast-3-src-mq3-qcommon-net-transport-ml-1880602404"></a>
### NA_BROADCAST

```ml
const NA_BROADCAST = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L13)

<a id="constant-constant-mq3-qcommon-net-transport-na-broadcast-ipx-const-na-broadcast-ipx-6-src-mq3-qcommon-net-transport-ml-1846107497"></a>
### NA_BROADCAST_IPX

```ml
const NA_BROADCAST_IPX = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L16)

<a id="constant-constant-mq3-qcommon-net-transport-na-ip-const-na-ip-4-src-mq3-qcommon-net-transport-ml-1656798883"></a>
### NA_IP

```ml
const NA_IP = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L14)

<a id="constant-constant-mq3-qcommon-net-transport-na-ipx-const-na-ipx-5-src-mq3-qcommon-net-transport-ml-1216819554"></a>
### NA_IPX

```ml
const NA_IPX = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L15)

<a id="constant-constant-mq3-qcommon-net-transport-na-loopback-const-na-loopback-2-src-mq3-qcommon-net-transport-ml-727319733"></a>
### NA_LOOPBACK

```ml
const NA_LOOPBACK = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L12)

<a id="function-function-mq3-qcommon-net-transport-nativeresolve-function-nativeresolve-context-name-src-mq3-qcommon-net-transport-ml-1483018548"></a>
### nativeResolve

```ml
function nativeResolve(context, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L85)

<a id="function-function-mq3-qcommon-net-transport-outofbanddata-function-outofbanddata-socket-address-data-src-mq3-qcommon-net-transport-ml-2059595517"></a>
### outOfBandData

```ml
function outOfBandData(socket, address, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L181)

<a id="function-function-mq3-qcommon-net-transport-outofbanddatapacket-function-outofbanddatapacket-data-src-mq3-qcommon-net-transport-ml-1981526808"></a>
### outOfBandDataPacket

```ml
function outOfBandDataPacket(data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L174)

<a id="function-function-mq3-qcommon-net-transport-outofbandprint-function-outofbandprint-socket-address-text-src-mq3-qcommon-net-transport-ml-1160157850"></a>
### outOfBandPrint

```ml
function outOfBandPrint(socket, address, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L170)

<a id="function-function-mq3-qcommon-net-transport-outofbandprintpacket-function-outofbandprintpacket-text-src-mq3-qcommon-net-transport-ml-1838799303"></a>
### outOfBandPrintPacket

```ml
function outOfBandPrintPacket(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L168)

- [mq3.qcommon.net_transport.Packet](Type-mq3-qcommon-net-transport-packet-1610243603.md) — struct
<a id="constant-constant-mq3-qcommon-net-transport-port-server-const-port-server-27960-src-mq3-qcommon-net-transport-ml-119512519"></a>
### PORT_SERVER

```ml
const PORT_SERVER = 27960
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L17)

<a id="function-function-mq3-qcommon-net-transport-receive-function-receive-socket-capacity-src-mq3-qcommon-net-transport-ml-591526667"></a>
### receive

```ml
function receive(socket, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L156)

<a id="function-function-mq3-qcommon-net-transport-receivebuffered-function-receivebuffered-socket-data-metadata-capacity-src-mq3-qcommon-net-transport-ml-1736307460"></a>
### receiveBuffered

```ml
function receiveBuffered(socket, data, metadata, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `metadata` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L162)

<a id="function-function-mq3-qcommon-net-transport-resolved-function-resolved-ok-address-src-mq3-qcommon-net-transport-ml-1653230260"></a>
### resolved

```ml
function resolved(ok, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ok` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L71)

<a id="function-function-mq3-qcommon-net-transport-resolveipv4-function-resolveipv4-name-port-src-mq3-qcommon-net-transport-ml-1481434166"></a>
### resolveIPv4

```ml
function resolveIPv4(name, port)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `port` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L111)

<a id="function-function-mq3-qcommon-net-transport-sendlooppacket-function-sendlooppacket-loopbacks-sock-data-src-mq3-qcommon-net-transport-ml-1604708740"></a>
### sendLoopPacket

```ml
function sendLoopPacket(loopbacks, sock, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `loopbacks` | `dynamic` | — |  |
| `sock` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L91)

<a id="function-function-mq3-qcommon-net-transport-sendpacket-function-sendpacket-runtime-sock-data-address-src-mq3-qcommon-net-transport-ml-1903283400"></a>
### sendPacket

```ml
function sendPacket(runtime, sock, data, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `sock` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L136)

<a id="function-function-mq3-qcommon-net-transport-stringtoaddress-function-stringtoaddress-text-src-mq3-qcommon-net-transport-ml-1422326739"></a>
### stringToAddress

```ml
function stringToAddress(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L89)

<a id="function-function-mq3-qcommon-net-transport-stringtoaddresswith-function-stringtoaddresswith-text-resolvefn-context-src-mq3-qcommon-net-transport-ml-1716046816"></a>
### stringToAddressWith

```ml
function stringToAddressWith(text, resolveFn, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `resolveFn` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L73)

- [mq3.qcommon.net_transport.Transport](Type-mq3-qcommon-net-transport-transport-2024000260.md) — struct
<a id="function-function-mq3-qcommon-net-transport-validaddress-function-validaddress-address-count-src-mq3-qcommon-net-transport-ml-91107803"></a>
### validAddress

```ml
function validAddress(address, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/net_transport.ml#L33)
