# `src/mq3/qcommon/message.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.qcommon.message`](Package-mq3-qcommon-message-2059326129.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/qcommon/huffman.ml` as `huffman` → [src/mq3/qcommon/huffman.ml](File-src-mq3-qcommon-huffman-ml-898182869.md)

## Declarations

<a id="function-function-mq3-qcommon-message-beginreading-function-beginreading-msg-src-mq3-qcommon-message-ml-904416943"></a>
### beginReading

```ml
function beginReading(msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L48)

<a id="function-function-mq3-qcommon-message-beginreadingoob-function-beginreadingoob-msg-src-mq3-qcommon-message-ml-429375801"></a>
### beginReadingOob

```ml
function beginReadingOob(msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L53)

<a id="constant-constant-mq3-qcommon-message-big-info-string-const-big-info-string-8192-src-mq3-qcommon-message-ml-1127145753"></a>
### BIG_INFO_STRING

```ml
const BIG_INFO_STRING = 8192
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L8)

<a id="function-function-mq3-qcommon-message-bitstream-function-bitstream-msg-src-mq3-qcommon-message-ml-354243805"></a>
### bitstream

```ml
function bitstream(msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L44)

<a id="function-function-mq3-qcommon-message-clear-function-clear-msg-src-mq3-qcommon-message-ml-1873558913"></a>
### clear

```ml
function clear(msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L39)

<a id="function-function-mq3-qcommon-message-copy-function-copy-source-length-src-mq3-qcommon-message-ml-615010105"></a>
### copy

```ml
function copy(source, length)
```

MSG_Copy preserves all source cursor/state fields and installs independent storage containing the bytes written so far.  Baseq3 deliberately retains src->maxsize; length is only the destination-capacity guard.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `length` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L61)

<a id="function-function-mq3-qcommon-message-init-function-init-length-src-mq3-qcommon-message-ml-136413964"></a>
### init

```ml
function init(length)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `length` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L31)

<a id="function-function-mq3-qcommon-message-initoob-function-initoob-length-src-mq3-qcommon-message-ml-2033628292"></a>
### initOob

```ml
function initOob(length)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `length` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L35)

<a id="function-function-mq3-qcommon-message-initstorage-function-initstorage-data-length-oob-src-mq3-qcommon-message-ml-1993176884"></a>
### initStorage

```ml
function initStorage(data, length, oob)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `length` | `dynamic` | — |  |
| `oob` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L27)

<a id="function-function-mq3-qcommon-message-initstoragewithcodec-function-initstoragewithcodec-data-length-oob-codec-src-mq3-qcommon-message-ml-2140469862"></a>
### initStorageWithCodec

```ml
function initStorageWithCodec(data, length, oob, codec)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `length` | `dynamic` | — |  |
| `oob` | `dynamic` | — |  |
| `codec` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L22)

<a id="constant-constant-mq3-qcommon-message-max-string-chars-const-max-string-chars-1024-src-mq3-qcommon-message-ml-835710058"></a>
### MAX_STRING_CHARS

```ml
const MAX_STRING_CHARS = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L7)

- [mq3.qcommon.message.Message](Type-mq3-qcommon-message-message-1158097836.md) — struct
<a id="function-function-mq3-qcommon-message-readangle16-function-readangle16-msg-src-mq3-qcommon-message-ml-108316579"></a>
### readAngle16

```ml
function readAngle16(msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L231)

<a id="function-function-mq3-qcommon-message-readbigcstring-function-readbigcstring-msg-src-mq3-qcommon-message-ml-513024435"></a>
### readBigCString

```ml
function readBigCString(msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L247)

<a id="function-function-mq3-qcommon-message-readbits-function-readbits-msg-bits-src-mq3-qcommon-message-ml-542616279"></a>
### readBits

```ml
function readBits(msg, bits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `bits` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L154)

<a id="function-function-mq3-qcommon-message-readcstring-function-readcstring-msg-src-mq3-qcommon-message-ml-1352700011"></a>
### readCString

```ml
function readCString(msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L244)

<a id="function-function-mq3-qcommon-message-readcstringline-function-readcstringline-msg-src-mq3-qcommon-message-ml-1159414479"></a>
### readCStringLine

```ml
function readCStringLine(msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L245)

<a id="function-function-mq3-qcommon-message-readdata-function-readdata-msg-length-src-mq3-qcommon-message-ml-1624599635"></a>
### readData

```ml
function readData(msg, length)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `length` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L258)

<a id="function-function-mq3-qcommon-message-readfloat-function-readfloat-msg-src-mq3-qcommon-message-ml-115238527"></a>
### readFloat

```ml
function readFloat(msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L225)

<a id="function-function-mq3-qcommon-message-readi16-function-readi16-msg-src-mq3-qcommon-message-ml-548491275"></a>
### readI16

```ml
function readI16(msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L213)

<a id="function-function-mq3-qcommon-message-readi32-function-readi32-msg-src-mq3-qcommon-message-ml-1118255319"></a>
### readI32

```ml
function readI32(msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L219)

<a id="function-function-mq3-qcommon-message-readi8-function-readi8-msg-src-mq3-qcommon-message-ml-449279623"></a>
### readI8

```ml
function readI8(msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L201)

<a id="function-function-mq3-qcommon-message-readtext-function-readtext-msg-lineonly-src-mq3-qcommon-message-ml-882163815"></a>
### readText

```ml
function readText(msg, lineOnly)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `lineOnly` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L233)

<a id="function-function-mq3-qcommon-message-readu8-function-readu8-msg-src-mq3-qcommon-message-ml-93008623"></a>
### readU8

```ml
function readU8(msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L207)

<a id="function-function-mq3-qcommon-message-writeangle-function-writeangle-msg-value-src-mq3-qcommon-message-ml-1944940614"></a>
### writeAngle

```ml
function writeAngle(msg, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L117)

<a id="function-function-mq3-qcommon-message-writeangle16-function-writeangle16-msg-value-src-mq3-qcommon-message-ml-1763776446"></a>
### writeAngle16

```ml
function writeAngle16(msg, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L118)

<a id="function-function-mq3-qcommon-message-writebigstring-function-writebigstring-msg-text-src-mq3-qcommon-message-ml-785629708"></a>
### writeBigString

```ml
function writeBigString(msg, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L141)

<a id="function-function-mq3-qcommon-message-writebits-function-writebits-msg-value-bits-src-mq3-qcommon-message-ml-1400369584"></a>
### writeBits

```ml
function writeBits(msg, value, bits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `bits` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L68)

<a id="function-function-mq3-qcommon-message-writebyte-function-writebyte-msg-value-src-mq3-qcommon-message-ml-254135048"></a>
### writeByte

```ml
function writeByte(msg, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L113)

<a id="function-function-mq3-qcommon-message-writechar-function-writechar-msg-value-src-mq3-qcommon-message-ml-1085344504"></a>
### writeChar

```ml
function writeChar(msg, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L112)

<a id="function-function-mq3-qcommon-message-writedata-function-writedata-msg-data-src-mq3-qcommon-message-ml-1946625525"></a>
### writeData

```ml
function writeData(msg, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L120)

<a id="function-function-mq3-qcommon-message-writefloat-function-writefloat-msg-value-src-mq3-qcommon-message-ml-566884686"></a>
### writeFloat

```ml
function writeFloat(msg, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L116)

<a id="function-function-mq3-qcommon-message-writelong-function-writelong-msg-value-src-mq3-qcommon-message-ml-1887971848"></a>
### writeLong

```ml
function writeLong(msg, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L115)

<a id="function-function-mq3-qcommon-message-writeshort-function-writeshort-msg-value-src-mq3-qcommon-message-ml-2019316306"></a>
### writeShort

```ml
function writeShort(msg, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L114)

<a id="function-function-mq3-qcommon-message-writestring-function-writestring-msg-text-src-mq3-qcommon-message-ml-259781476"></a>
### writeString

```ml
function writeString(msg, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L125)
