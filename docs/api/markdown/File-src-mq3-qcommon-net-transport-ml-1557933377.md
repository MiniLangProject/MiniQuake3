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

Compute address to endpoint in qcommon.net_transport; the normal completion returns `udp.Endpoint(udp.ipv4(address.ip[0], address.ip[1], address.ip[2], address.ip[3]), address.port)`.

Validation failures include `net transport: unsupported address`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — | Record exposing `type`, `ip`, `port`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L161)

<a id="function-function-mq3-qcommon-net-transport-addresstostring-function-addresstostring-address-src-mq3-qcommon-net-transport-ml-1430742938"></a>
### addressToString

```ml
function addressToString(address)
```

Compute address to string in qcommon.net_transport; the normal completion returns `ipxToString([], address.port)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — | Record exposing `type`, `ip`, `port`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L88)

<a id="function-function-mq3-qcommon-net-transport-attach-function-attach-runtime-socket-src-mq3-qcommon-net-transport-ml-7827483"></a>
### attach

```ml
function attach(runtime, socket)
```

Update `runtime.context`, `runtime.sendPacketFn` in qcommon.net_transport; the normal completion returns `runtime`.

Direct state writes: `runtime.context`, `runtime.sendPacketFn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Updated in place: `context`, `sendPacketFn`. |
| `socket` | `dynamic` | — | Socket passed as `socket` to `mq3.qcommon.net_transport.create`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L233)

<a id="function-function-mq3-qcommon-net-transport-attachloopback-function-attachloopback-runtime-loopbacks-src-mq3-qcommon-net-transport-ml-887664398"></a>
### attachLoopback

```ml
function attachLoopback(runtime, loopbacks)
```

Update `runtime.context`, `runtime.sendPacketFn` in qcommon.net_transport; the normal completion returns `runtime`.

Direct state writes: `runtime.context`, `runtime.sendPacketFn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Updated in place: `context`, `sendPacketFn`. |
| `loopbacks` | `dynamic` | — | Loopbacks passed as `loopbacks` to `mq3.qcommon.net_transport.createLoopback`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L252)

<a id="function-function-mq3-qcommon-net-transport-attachshared-function-attachshared-runtime-socket-loopbacks-src-mq3-qcommon-net-transport-ml-2040505237"></a>
### attachShared

```ml
function attachShared(runtime, socket, loopbacks)
```

Update `runtime.context`, `runtime.sendPacketFn` in qcommon.net_transport; the normal completion returns `runtime`.

Direct state writes: `runtime.context`, `runtime.sendPacketFn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Updated in place: `context`, `sendPacketFn`. |
| `socket` | `dynamic` | — | Socket passed as `socket` to `mq3.qcommon.net_transport.createShared`. |
| `loopbacks` | `dynamic` | — | Loopbacks passed as `loopbacks` to `mq3.qcommon.net_transport.createShared`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L243)

<a id="function-function-mq3-qcommon-net-transport-blankaddress-function-blankaddress-kind-src-mq3-qcommon-net-transport-ml-1043269426"></a>
### blankAddress

```ml
function blankAddress(kind)
```

Return `mq3.qcommon.netchan.Address(kind, [0, 0, 0, 0], 0)` from `qcommon.net_transport.blankAddress`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `kind` | `dynamic` | — | Initial `type` field stored in the returned or constructed `mq3.qcommon.netchan.Address` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L36)

<a id="function-function-mq3-qcommon-net-transport-compareaddress-function-compareaddress-first-second-src-mq3-qcommon-net-transport-ml-641286284"></a>
### compareAddress

```ml
function compareAddress(first, second)
```

Compute qcommon.net_transport.compareAddress as `(compareBaseAddress(first, second) and ((first.type == NA_LOOPBACK) or (first.port == second.port)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — | Record exposing `type`, `port`. |
| `second` | `dynamic` | — | Record exposing `port`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L64)

<a id="function-function-mq3-qcommon-net-transport-comparebaseaddress-function-comparebaseaddress-first-second-src-mq3-qcommon-net-transport-ml-135103324"></a>
### compareBaseAddress

```ml
function compareBaseAddress(first, second)
```

Test compare base address in qcommon.net_transport; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — | Record exposing `type`, `ip`. |
| `second` | `dynamic` | — | Record exposing `type`, `ip`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L52)

<a id="function-function-mq3-qcommon-net-transport-create-function-create-socket-src-mq3-qcommon-net-transport-ml-1764602757"></a>
### create

```ml
function create(socket)
```

Create net transport in qcommon.net_transport; the normal completion returns `Transport(socket, createLoopbacks())`.

Validation failures include `net transport: missing socket`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `dynamic` | — | Initial `socket` field stored in the returned or constructed `mq3.qcommon.net_transport.Transport` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L189)

<a id="function-function-mq3-qcommon-net-transport-createloopback-function-createloopback-loopbacks-src-mq3-qcommon-net-transport-ml-1615181576"></a>
### createLoopback

```ml
function createLoopback(loopbacks)
```

Create loopback in qcommon.net_transport; the normal completion returns `Transport(void, loopbacks)`.

Validation failures include `net transport: missing loopback transport`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `loopbacks` | `dynamic` | — | Initial `loopbacks` field stored in the returned or constructed `mq3.qcommon.net_transport.Transport` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L208)

<a id="function-function-mq3-qcommon-net-transport-createloopbacks-function-createloopbacks-src-mq3-qcommon-net-transport-ml-749058508"></a>
### createLoopbacks

```ml
function createLoopbacks()
```

Create `mq3.qcommon.net_transport.Loopbacks` with queues=[LoopQueue(array(MAX_LOOPBACK, void), 0, 0), LoopQueue(array(MAX_LOOPBACK, void), 0, 0)].


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L38)

<a id="function-function-mq3-qcommon-net-transport-createshared-function-createshared-socket-loopbacks-src-mq3-qcommon-net-transport-ml-1489881911"></a>
### createShared

```ml
function createShared(socket, loopbacks)
```

Create shared in qcommon.net_transport; the normal completion returns `Transport(socket, loopbacks)`.

Validation failures include `net transport: missing shared transport`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `dynamic` | — | Initial `socket` field stored in the returned or constructed `mq3.qcommon.net_transport.Transport` record. |
| `loopbacks` | `dynamic` | — | Initial `loopbacks` field stored in the returned or constructed `mq3.qcommon.net_transport.Transport` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L199)

<a id="function-function-mq3-qcommon-net-transport-endpointtoaddress-function-endpointtoaddress-endpoint-src-mq3-qcommon-net-transport-ml-1497338589"></a>
### endpointToAddress

```ml
function endpointToAddress(endpoint)
```

Compute endpoint to address in qcommon.net_transport; the normal completion returns `netchan.Address(NA_IP, udp.octets(endpoint.address), endpoint.port)`.

Validation failures include `net transport: missing endpoint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `endpoint` | `dynamic` | — | Record exposing `address`, `port`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L180)

<a id="function-function-mq3-qcommon-net-transport-getlooppacket-function-getlooppacket-loopbacks-sock-capacity-src-mq3-qcommon-net-transport-ml-1322598344"></a>
### getLoopPacket

```ml
function getLoopPacket(loopbacks, sock, capacity)
```

Get loop packet in qcommon.net_transport; the normal completion returns `Packet(true, blankAddress(NA_LOOPBACK), bytes(data))`.

Validation failures include `net transport: invalid loopback receive`; `net transport: loopback receive capacity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `loopbacks` | `dynamic` | — | Record exposing `queues`. |
| `sock` | `dynamic` | — | Zero-based index into `loopbacks.queues`. |
| `capacity` | `dynamic` | — | Capacity used in `(capacity < 1)` and `(len(data) > capacity)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L148)

<a id="function-function-mq3-qcommon-net-transport-hexbyte-function-hexbyte-value-src-mq3-qcommon-net-transport-ml-14974673"></a>
### hexByte

```ml
function hexByte(value)
```

Compute hex byte in qcommon.net_transport; the normal completion returns `decode(bytes([digits[((value >> 4) & 15)], digits[(value & 15)]]))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value >> 4)` and `(value & 15)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L74)

<a id="function-function-mq3-qcommon-net-transport-ipxtostring-function-ipxtostring-values-port-src-mq3-qcommon-net-transport-ml-531144863"></a>
### ipxToString

```ml
function ipxToString(values, port)
```

Apply `mq3.qcommon.net_transport.hexByte` for ipx to string in qcommon.net_transport.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Values used in `len(values)` and `values[index]`. |
| `port` | `dynamic` | — | Port used in `str(port)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L81)

<a id="function-function-mq3-qcommon-net-transport-islocaladdress-function-islocaladdress-address-src-mq3-qcommon-net-transport-ml-698580210"></a>
### isLocalAddress

```ml
function isLocalAddress(address)
```

Compute qcommon.net_transport.isLocalAddress as `((address != void) and (address.type == NA_LOOPBACK))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — | Record exposing `type`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L70)

- [mq3.qcommon.net_transport.Loopbacks](Type-mq3-qcommon-net-transport-loopbacks-2141534891.md) — struct
- [mq3.qcommon.net_transport.LoopMessage](Type-mq3-qcommon-net-transport-loopmessage-1709381836.md) — struct
- [mq3.qcommon.net_transport.LoopQueue](Type-mq3-qcommon-net-transport-loopqueue-560582288.md) — struct
<a id="constant-constant-mq3-qcommon-net-transport-max-loopback-const-max-loopback-16-src-mq3-qcommon-net-transport-ml-1070752902"></a>
### MAX_LOOPBACK

```ml
const MAX_LOOPBACK = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L18)

<a id="constant-constant-mq3-qcommon-net-transport-max-packetlen-const-max-packetlen-1400-src-mq3-qcommon-net-transport-ml-1111098622"></a>
### MAX_PACKETLEN

```ml
const MAX_PACKETLEN = 1400
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L19)

<a id="constant-constant-mq3-qcommon-net-transport-na-bad-const-na-bad-1-src-mq3-qcommon-net-transport-ml-368575434"></a>
### NA_BAD

```ml
const NA_BAD = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L11)

<a id="constant-constant-mq3-qcommon-net-transport-na-bot-const-na-bot-0-src-mq3-qcommon-net-transport-ml-1399234719"></a>
### NA_BOT

```ml
const NA_BOT = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L10)

<a id="constant-constant-mq3-qcommon-net-transport-na-broadcast-const-na-broadcast-3-src-mq3-qcommon-net-transport-ml-1880602404"></a>
### NA_BROADCAST

```ml
const NA_BROADCAST = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L13)

<a id="constant-constant-mq3-qcommon-net-transport-na-broadcast-ipx-const-na-broadcast-ipx-6-src-mq3-qcommon-net-transport-ml-1846107497"></a>
### NA_BROADCAST_IPX

```ml
const NA_BROADCAST_IPX = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L16)

<a id="constant-constant-mq3-qcommon-net-transport-na-ip-const-na-ip-4-src-mq3-qcommon-net-transport-ml-1656798883"></a>
### NA_IP

```ml
const NA_IP = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L14)

<a id="constant-constant-mq3-qcommon-net-transport-na-ipx-const-na-ipx-5-src-mq3-qcommon-net-transport-ml-1216819554"></a>
### NA_IPX

```ml
const NA_IPX = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L15)

<a id="constant-constant-mq3-qcommon-net-transport-na-loopback-const-na-loopback-2-src-mq3-qcommon-net-transport-ml-727319733"></a>
### NA_LOOPBACK

```ml
const NA_LOOPBACK = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L12)

<a id="function-function-mq3-qcommon-net-transport-nativeresolve-function-nativeresolve-context-name-src-mq3-qcommon-net-transport-ml-1483018548"></a>
### nativeResolve

```ml
function nativeResolve(context, name)
```

Compute native resolve in qcommon.net_transport; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.qcommon.net_transport.resolveIPv4`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L122)

<a id="function-function-mq3-qcommon-net-transport-outofbanddata-function-outofbanddata-socket-address-data-src-mq3-qcommon-net-transport-ml-2059595517"></a>
### outOfBandData

```ml
function outOfBandData(socket, address, data)
```

Compute out of band data in qcommon.net_transport; the normal completion returns `packet`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `dynamic` | — | Socket passed as `socket` to `mq3.platform.udp.sendTo`. |
| `address` | `dynamic` | — | Address passed as `address` to `mq3.qcommon.net_transport.addressToEndpoint`. |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.qcommon.net_transport.outOfBandDataPacket`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L301)

<a id="function-function-mq3-qcommon-net-transport-outofbanddatapacket-function-outofbanddatapacket-data-src-mq3-qcommon-net-transport-ml-1981526808"></a>
### outOfBandDataPacket

```ml
function outOfBandDataPacket(data)
```

Compute out of band data packet in qcommon.net_transport; the normal completion returns `huffman.compressPacket(packet, 12)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `(bytes([255, 255, 255, 255]) + data)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L290)

<a id="function-function-mq3-qcommon-net-transport-outofbandprint-function-outofbandprint-socket-address-text-src-mq3-qcommon-net-transport-ml-1160157850"></a>
### outOfBandPrint

```ml
function outOfBandPrint(socket, address, text)
```

Compute out of band print in qcommon.net_transport; the normal completion returns `packet`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `dynamic` | — | Socket passed as `socket` to `mq3.platform.udp.sendTo`. |
| `address` | `dynamic` | — | Address passed as `address` to `mq3.qcommon.net_transport.addressToEndpoint`. |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.net_transport.outOfBandPrintPacket`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L284)

<a id="function-function-mq3-qcommon-net-transport-outofbandprintpacket-function-outofbandprintpacket-text-src-mq3-qcommon-net-transport-ml-1838799303"></a>
### outOfBandPrintPacket

```ml
function outOfBandPrintPacket(text)
```

Compute qcommon.net_transport.outOfBandPrintPacket as `(bytes([255, 255, 255, 255]) + bytes(text))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text used in `bytes(text)` and `(bytes([255, 255, 255, 255]) + bytes(text))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L278)

- [mq3.qcommon.net_transport.Packet](Type-mq3-qcommon-net-transport-packet-1610243603.md) — struct
<a id="constant-constant-mq3-qcommon-net-transport-port-server-const-port-server-27960-src-mq3-qcommon-net-transport-ml-119512519"></a>
### PORT_SERVER

```ml
const PORT_SERVER = 27960
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L17)

<a id="function-function-mq3-qcommon-net-transport-receive-function-receive-socket-capacity-src-mq3-qcommon-net-transport-ml-591526667"></a>
### receive

```ml
function receive(socket, capacity)
```

Receive net transport in qcommon.net_transport; the normal completion returns `Packet(true, endpointToAddress(datagram.endpoint), datagram.data)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `dynamic` | — | Socket passed as `socket` to `mq3.platform.udp.receiveFrom`. |
| `capacity` | `dynamic` | — | Capacity passed as `capacity` to `mq3.platform.udp.receiveFrom`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L259)

<a id="function-function-mq3-qcommon-net-transport-receivebuffered-function-receivebuffered-socket-data-metadata-capacity-src-mq3-qcommon-net-transport-ml-1736307460"></a>
### receiveBuffered

```ml
function receiveBuffered(socket, data, metadata, capacity)
```

Receive buffered in qcommon.net_transport; the normal completion returns `Packet(true, endpointToAddress(datagram.endpoint), datagram.data)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `socket` | `dynamic` | — | Socket passed as `socket` to `mq3.platform.udp.receiveFromBuffered`. |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.platform.udp.receiveFromBuffered`. |
| `metadata` | `dynamic` | — | Metadata passed as `metadata` to `mq3.platform.udp.receiveFromBuffered`. |
| `capacity` | `dynamic` | — | Capacity passed as `capacity` to `mq3.platform.udp.receiveFromBuffered`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L270)

<a id="function-function-mq3-qcommon-net-transport-resolved-function-resolved-ok-address-src-mq3-qcommon-net-transport-ml-1653230260"></a>
### resolved

```ml
function resolved(ok, address)
```

Create `mq3.qcommon.net_transport.AddressResult` with ok=ok; address=address.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ok` | `dynamic` | — | Initial `ok` field stored in the returned or constructed `mq3.qcommon.net_transport.AddressResult` record. |
| `address` | `dynamic` | — | Initial `address` field stored in the returned or constructed `mq3.qcommon.net_transport.AddressResult` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L101)

<a id="function-function-mq3-qcommon-net-transport-resolveipv4-function-resolveipv4-name-port-src-mq3-qcommon-net-transport-ml-1481434166"></a>
### resolveIPv4

```ml
function resolveIPv4(name, port)
```

Resolve i pv 4 in qcommon.net_transport; the normal completion returns `netchan.Address(NA_IP, udp.octets(address), port)`.

Validation failures include `net transport: invalid resolved port`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.platform.udp.resolveIPv4`. |
| `port` | `dynamic` | — | Initial `port` field stored in the returned or constructed `mq3.qcommon.netchan.Address` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L171)

<a id="function-function-mq3-qcommon-net-transport-sendlooppacket-function-sendlooppacket-loopbacks-sock-data-src-mq3-qcommon-net-transport-ml-1604708740"></a>
### sendLoopPacket

```ml
function sendLoopPacket(loopbacks, sock, data)
```

Send loop packet in qcommon.net_transport; the normal completion returns `len(data)`.

Validation failures include `net transport: invalid loopback send`; `net transport: loopback packet exceeds MAX_PACKETLEN`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `loopbacks` | `dynamic` | — | Record exposing `queues`. |
| `sock` | `dynamic` | — | Sock used in `(sock ^ 1)` and `(sock < netchan.NS_CLIENT)`. |
| `data` | `dynamic` | — | Data used in `len(data)` and `bytes(data)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L136)

<a id="function-function-mq3-qcommon-net-transport-sendpacket-function-sendpacket-runtime-sock-data-address-src-mq3-qcommon-net-transport-ml-1903283400"></a>
### sendPacket

```ml
function sendPacket(runtime, sock, data, address)
```

Send packet in qcommon.net_transport; the normal completion returns `udp.sendTo(runtime.context.socket, addressToEndpoint(address), data)`.

Validation failures include `net transport: missing runtime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `context`. |
| `sock` | `dynamic` | — | Sock passed as `sock` to `mq3.qcommon.net_transport.sendLoopPacket`. |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.qcommon.net_transport.sendLoopPacket`. |
| `address` | `dynamic` | — | Record exposing `type`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L220)

<a id="function-function-mq3-qcommon-net-transport-stringtoaddress-function-stringtoaddress-text-src-mq3-qcommon-net-transport-ml-1422326739"></a>
### stringToAddress

```ml
function stringToAddress(text)
```

Return `mq3.qcommon.net_transport.stringToAddressWith(text, nativeResolve, void)` from `qcommon.net_transport.stringToAddress`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.net_transport.stringToAddressWith`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L128)

<a id="function-function-mq3-qcommon-net-transport-stringtoaddresswith-function-stringtoaddresswith-text-resolvefn-context-src-mq3-qcommon-net-transport-ml-1716046816"></a>
### stringToAddressWith

```ml
function stringToAddressWith(text, resolveFn, context)
```

Compute string to address with in qcommon.net_transport; the normal completion returns `resolved(true, address)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text used in `(text == "localhost")`. |
| `resolveFn` | `dynamic` | — | Callback invoked for resolve; the call sites below define the callback arguments. |
| `context` | `dynamic` | — | Context used in `resolveFn(context, base)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L107)

- [mq3.qcommon.net_transport.Transport](Type-mq3-qcommon-net-transport-transport-2024000260.md) — struct
<a id="function-function-mq3-qcommon-net-transport-validaddress-function-validaddress-address-count-src-mq3-qcommon-net-transport-ml-91107803"></a>
### validAddress

```ml
function validAddress(address, count)
```

Compute qcommon.net_transport.validAddress as `((address != void) and (len(address.ip) >= count))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `address` | `dynamic` | — | Record exposing `ip`. |
| `count` | `dynamic` | — | Count used in `(len(address.ip) >= count)` and `((address != void) and (len(address.ip) >= count))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/net_transport.ml#L45)
