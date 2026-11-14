# `src/mq3/qcommon/netchan.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.qcommon.netchan`](Package-mq3-qcommon-netchan-1738442321.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/qcommon/headers.ml` as `qcommonHeaders` → [src/mq3/qcommon/headers.ml](File-src-mq3-qcommon-headers-ml-405080448.md)

## Declarations

- [mq3.qcommon.netchan.Address](Type-mq3-qcommon-netchan-address-1634454891.md) — struct
- [mq3.qcommon.netchan.Channel](Type-mq3-qcommon-netchan-channel-1206949820.md) — struct
<a id="function-function-mq3-qcommon-netchan-emit-function-emit-runtime-channel-packet-src-mq3-qcommon-netchan-ml-1067817283"></a>
### emit

```ml
function emit(runtime, channel, packet)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `channel` | `dynamic` | — |  |
| `packet` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L65)

<a id="constant-constant-mq3-qcommon-netchan-fragment-bit-const-fragment-bit-2147483648-src-mq3-qcommon-netchan-ml-218011216"></a>
### FRAGMENT_BIT

```ml
const FRAGMENT_BIT = 2147483648
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L14)

<a id="constant-constant-mq3-qcommon-netchan-fragment-size-const-fragment-size-1300-src-mq3-qcommon-netchan-ml-875439565"></a>
### FRAGMENT_SIZE

```ml
const FRAGMENT_SIZE = 1300
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L11)

<a id="function-function-mq3-qcommon-netchan-init-function-init-port-src-mq3-qcommon-netchan-ml-931423395"></a>
### init

```ml
function init(port)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `port` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L43)

<a id="constant-constant-mq3-qcommon-netchan-max-msglen-const-max-msglen-qcommonheaders-max-msglen-src-mq3-qcommon-netchan-ml-954055660"></a>
### MAX_MSGLEN

```ml
const MAX_MSGLEN = qcommonHeaders.MAX_MSGLEN
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L13)

<a id="constant-constant-mq3-qcommon-netchan-max-packetlen-const-max-packetlen-1400-src-mq3-qcommon-netchan-ml-1562908450"></a>
### MAX_PACKETLEN

```ml
const MAX_PACKETLEN = 1400
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L10)

<a id="constant-constant-mq3-qcommon-netchan-ns-client-const-ns-client-0-src-mq3-qcommon-netchan-ml-1320538675"></a>
### NS_CLIENT

```ml
const NS_CLIENT = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L8)

<a id="constant-constant-mq3-qcommon-netchan-ns-server-const-ns-server-1-src-mq3-qcommon-netchan-ml-1984388870"></a>
### NS_SERVER

```ml
const NS_SERVER = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L9)

<a id="constant-constant-mq3-qcommon-netchan-packet-header-const-packet-header-10-src-mq3-qcommon-netchan-ml-435504966"></a>
### PACKET_HEADER

```ml
const PACKET_HEADER = 10
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L12)

<a id="function-function-mq3-qcommon-netchan-process-function-process-channel-data-maxsize-src-mq3-qcommon-netchan-ml-643219896"></a>
### process

```ml
function process(channel, data, maxsize)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `channel` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `maxsize` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L107)

- [mq3.qcommon.netchan.ProcessResult](Type-mq3-qcommon-netchan-processresult-1295575579.md) — struct
<a id="function-function-mq3-qcommon-netchan-readshort-function-readshort-data-offset-src-mq3-qcommon-netchan-ml-1892004011"></a>
### readShort

```ml
function readShort(data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L59)

<a id="function-function-mq3-qcommon-netchan-rejected-function-rejected-data-readcount-src-mq3-qcommon-netchan-ml-985126109"></a>
### rejected

```ml
function rejected(data, readcount)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `readcount` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L103)

- [mq3.qcommon.netchan.Runtime](Type-mq3-qcommon-netchan-runtime-1334623059.md) — struct
<a id="constant-constant-mq3-qcommon-netchan-scramble-start-const-scramble-start-6-src-mq3-qcommon-netchan-ml-1729049471"></a>
### SCRAMBLE_START

```ml
const SCRAMBLE_START = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L15)

<a id="function-function-mq3-qcommon-netchan-scramblepacket-function-scramblepacket-data-src-mq3-qcommon-netchan-ml-176520908"></a>
### scramblePacket

```ml
function scramblePacket(data)
```

These two routines are inside Baseq3's #if 0 block, but keeping the exact transform here makes the complete source-file contract available to tools and preserves the original reversible packet codec.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L143)

<a id="function-function-mq3-qcommon-netchan-setup-function-setup-sock-address-qport-src-mq3-qcommon-netchan-ml-218128106"></a>
### setup

```ml
function setup(sock, address, qport)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sock` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `qport` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L47)

<a id="function-function-mq3-qcommon-netchan-transmit-function-transmit-runtime-channel-data-src-mq3-qcommon-netchan-ml-1030911527"></a>
### transmit

```ml
function transmit(runtime, channel, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `channel` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L88)

<a id="function-function-mq3-qcommon-netchan-transmitnextfragment-function-transmitnextfragment-runtime-channel-src-mq3-qcommon-netchan-ml-644208431"></a>
### transmitNextFragment

```ml
function transmitNextFragment(runtime, channel)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `channel` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L70)

<a id="function-function-mq3-qcommon-netchan-unscramblepacket-function-unscramblepacket-data-src-mq3-qcommon-netchan-ml-1014647252"></a>
### unscramblePacket

```ml
function unscramblePacket(data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L154)

<a id="function-function-mq3-qcommon-netchan-writelong-function-writelong-data-offset-value-src-mq3-qcommon-netchan-ml-1836131760"></a>
### writeLong

```ml
function writeLong(data, offset, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L55)

<a id="function-function-mq3-qcommon-netchan-writeshort-function-writeshort-data-offset-value-src-mq3-qcommon-netchan-ml-528833118"></a>
### writeShort

```ml
function writeShort(data, offset, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/netchan.ml#L51)
