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

Emit netchan in qcommon.netchan.

Validation failures include `Netchan transmit requires NET_SendPacket service`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `sendPacketFn`. |
| `channel` | `dynamic` | — | Record exposing `sock`, `remoteAddress`. |
| `packet` | `dynamic` | — | Packet used in `runtime.sendPacketFn(runtime, channel.sock, packet, channel.remoteAddress)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/netchan.ml#L136)

<a id="constant-constant-mq3-qcommon-netchan-fragment-bit-const-fragment-bit-2147483648-src-mq3-qcommon-netchan-ml-218011216"></a>
### FRAGMENT_BIT

```ml
const FRAGMENT_BIT = 2147483648
```

Sequence-header bit indicating that a packet carries a message fragment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/netchan.ml#L21)

<a id="constant-constant-mq3-qcommon-netchan-fragment-size-const-fragment-size-1300-src-mq3-qcommon-netchan-ml-875439565"></a>
### FRAGMENT_SIZE

```ml
const FRAGMENT_SIZE = 1300
```

Maximum payload bytes carried by a single network-message fragment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/netchan.ml#L15)

<a id="function-function-mq3-qcommon-netchan-init-function-init-port-src-mq3-qcommon-netchan-ml-931423395"></a>
### init

```ml
function init(port)
```

Create `mq3.qcommon.netchan.Runtime` with qport=(port & 65535); sendPacketFn=void; context=void.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `port` | `dynamic` | — | Port used in `(port & 65535)` and `Runtime((port & 65535), void, void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/netchan.ml#L91)

<a id="constant-constant-mq3-qcommon-netchan-max-msglen-const-max-msglen-qcommonheaders-max-msglen-src-mq3-qcommon-netchan-ml-954055660"></a>
### MAX_MSGLEN

```ml
const MAX_MSGLEN = qcommonHeaders.MAX_MSGLEN
```

Maximum byte length of a complete sequenced network message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/netchan.ml#L19)

<a id="constant-constant-mq3-qcommon-netchan-max-packetlen-const-max-packetlen-1400-src-mq3-qcommon-netchan-ml-1562908450"></a>
### MAX_PACKETLEN

```ml
const MAX_PACKETLEN = 1400
```

Maximum byte length of an individual network datagram.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/netchan.ml#L13)

<a id="constant-constant-mq3-qcommon-netchan-ns-client-const-ns-client-0-src-mq3-qcommon-netchan-ml-1320538675"></a>
### NS_CLIENT

```ml
const NS_CLIENT = 0
```

Network socket-side selector for the client endpoint.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/netchan.ml#L9)

<a id="constant-constant-mq3-qcommon-netchan-ns-server-const-ns-server-1-src-mq3-qcommon-netchan-ml-1984388870"></a>
### NS_SERVER

```ml
const NS_SERVER = 1
```

Network socket-side selector for the server endpoint.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/netchan.ml#L11)

<a id="constant-constant-mq3-qcommon-netchan-packet-header-const-packet-header-10-src-mq3-qcommon-netchan-ml-435504966"></a>
### PACKET_HEADER

```ml
const PACKET_HEADER = 10
```

Byte size of the managed netchan packet header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/netchan.ml#L17)

<a id="function-function-mq3-qcommon-netchan-process-function-process-channel-data-maxsize-src-mq3-qcommon-netchan-ml-643219896"></a>
### process

```ml
function process(channel, data, maxsize)
```

Process netchan in qcommon.netchan; the normal completion returns `ProcessResult(true, data, cursize, readcount, (readcount * 8))`.

Direct state writes: `channel.dropped`, `channel.fragmentSequence`, `channel.fragmentLength`, `channel.incomingSequence`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `channel` | `dynamic` | — | Record exposing `sock`, `incomingSequence`, `fragmentSequence`, `fragmentLength`, `fragmentBuffer`. Updated in place: `dropped`, `fragmentSequence`, `fragmentLength`, `incomingSequence`. |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.qcommon.netchan.rejected`. |
| `maxsize` | `dynamic` | — | Maxsize used in `((channel.fragmentLength + 4) > maxsize)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/netchan.ml#L200)

- [mq3.qcommon.netchan.ProcessResult](Type-mq3-qcommon-netchan-processresult-1295575579.md) — struct
<a id="function-function-mq3-qcommon-netchan-readshort-function-readshort-data-offset-src-mq3-qcommon-netchan-ml-1892004011"></a>
### readShort

```ml
function readShort(data, offset)
```

Read short in qcommon.netchan; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `data[offset]` and `data[(offset + 1)]`. |
| `offset` | `dynamic` | — | Zero-based index into `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/netchan.ml#L124)

<a id="function-function-mq3-qcommon-netchan-rejected-function-rejected-data-readcount-src-mq3-qcommon-netchan-ml-985126109"></a>
### rejected

```ml
function rejected(data, readcount)
```

Create `mq3.qcommon.netchan.ProcessResult` with accepted=false; data=data; cursize=len(data); readcount=readcount; bit=(readcount * 8).

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Initial `data` field stored in the returned or constructed `mq3.qcommon.netchan.ProcessResult` record. |
| `readcount` | `dynamic` | — | Initial `readcount` field stored in the returned or constructed `mq3.qcommon.netchan.ProcessResult` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/netchan.ml#L190)

- [mq3.qcommon.netchan.Runtime](Type-mq3-qcommon-netchan-runtime-1334623059.md) — struct
<a id="constant-constant-mq3-qcommon-netchan-scramble-start-const-scramble-start-6-src-mq3-qcommon-netchan-ml-1729049471"></a>
### SCRAMBLE_START

```ml
const SCRAMBLE_START = 6
```

Byte offset at which generic managed-channel payload scrambling begins.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/netchan.ml#L23)

<a id="function-function-mq3-qcommon-netchan-scramblepacket-function-scramblepacket-data-src-mq3-qcommon-netchan-ml-176520908"></a>
### scramblePacket

```ml
function scramblePacket(data)
```

These two routines are inside Baseq3's #if 0 block, but keeping the exact transform here makes the complete source-file contract available to tools and preserves the original reversible packet codec.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `len(data)` and `bytes(data)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/netchan.ml#L237)

<a id="function-function-mq3-qcommon-netchan-setup-function-setup-sock-address-qport-src-mq3-qcommon-netchan-ml-218128106"></a>
### setup

```ml
function setup(sock, address, qport)
```

Create `mq3.qcommon.netchan.Channel` with sock=sock; dropped=0; remoteAddress=address; qport=qport; 9 further fields.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sock` | `dynamic` | — | Initial `sock` field stored in the returned or constructed `mq3.qcommon.netchan.Channel` record. |
| `address` | `dynamic` | — | Initial `remoteAddress` field stored in the returned or constructed `mq3.qcommon.netchan.Channel` record. |
| `qport` | `dynamic` | — | Initial `qport` field stored in the returned or constructed `mq3.qcommon.netchan.Channel` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/netchan.ml#L99)

<a id="function-function-mq3-qcommon-netchan-transmit-function-transmit-runtime-channel-data-src-mq3-qcommon-netchan-ml-1030911527"></a>
### transmit

```ml
function transmit(runtime, channel, data)
```

Update `channel.unsentFragmentStart`, `channel.unsentFragments`, `channel.unsentLength`, `channel.outgoingSequence` in qcommon.netchan; the normal completion returns `packet`.

Validation failures include `Netchan_Transmit length exceeds MAX_MSGLEN`.
Direct state writes: `channel.unsentFragmentStart`, `channel.unsentFragments`, `channel.unsentLength`, `channel.outgoingSequence`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `qport`. |
| `channel` | `dynamic` | — | Record exposing `unsentBuffer`, `sock`, `outgoingSequence`. Updated in place: `unsentFragmentStart`, `unsentFragments`, `unsentLength`, `outgoingSequence`. |
| `data` | `dynamic` | — | Data used in `len(data)` and `data[index]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/netchan.ml#L172)

<a id="function-function-mq3-qcommon-netchan-transmitnextfragment-function-transmitnextfragment-runtime-channel-src-mq3-qcommon-netchan-ml-644208431"></a>
### transmitNextFragment

```ml
function transmitNextFragment(runtime, channel)
```

Update `channel.unsentFragmentStart`, `channel.outgoingSequence`, `channel.unsentFragments` in qcommon.netchan; the normal completion returns `packet`.

Validation failures include `Netchan has no pending fragments`.
Direct state writes: `channel.unsentFragmentStart`, `channel.outgoingSequence`, `channel.unsentFragments`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `qport`. |
| `channel` | `dynamic` | — | Record exposing `unsentFragments`, `unsentFragmentStart`, `unsentLength`, `sock`, `outgoingSequence`, `unsentBuffer`. Updated in place: `unsentFragmentStart`, `outgoingSequence`, `unsentFragments`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/netchan.ml#L147)

<a id="function-function-mq3-qcommon-netchan-unscramblepacket-function-unscramblepacket-data-src-mq3-qcommon-netchan-ml-1014647252"></a>
### unscramblePacket

```ml
function unscramblePacket(data)
```

Compute unscramble packet in qcommon.netchan; the normal completion returns `result`.

Validation failures include `Netchan unscramble exceeds MAX_PACKETLEN`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `len(data)` and `bytes(data)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/netchan.ml#L252)

<a id="function-function-mq3-qcommon-netchan-writelong-function-writelong-data-offset-value-src-mq3-qcommon-netchan-ml-1836131760"></a>
### writeLong

```ml
function writeLong(data, offset, value)
```

Write long in qcommon.netchan.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.compat.numeric.writeU32`. |
| `offset` | `dynamic` | — | Offset passed as `offset` to `mq3.compat.numeric.writeU32`. |
| `value` | `dynamic` | — | Integer whose low 32 bits are retained. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/netchan.ml#L117)

<a id="function-function-mq3-qcommon-netchan-writeshort-function-writeshort-data-offset-value-src-mq3-qcommon-netchan-ml-528833118"></a>
### writeShort

```ml
function writeShort(data, offset, value)
```

Write short in qcommon.netchan; updates `data entries`.

Direct state writes: `data elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Mutable sequence written at `offset`, `(offset + 1)`. |
| `offset` | `dynamic` | — | Offset used in `(offset + 1)`. |
| `value` | `dynamic` | — | Value used in `(value >> 8)` and `(value & 255)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/netchan.ml#L109)
