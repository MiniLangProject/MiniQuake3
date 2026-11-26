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

Begin reading in qcommon.message; updates `msg.readcount`, `msg.bit`, `msg.oob`.

Direct state writes: `msg.readcount`, `msg.bit`, `msg.oob`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Updated in place: `readcount`, `bit`, `oob`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L85)

<a id="function-function-mq3-qcommon-message-beginreadingoob-function-beginreadingoob-msg-src-mq3-qcommon-message-ml-429375801"></a>
### beginReadingOob

```ml
function beginReadingOob(msg)
```

Begin reading oob in qcommon.message; updates `msg.readcount`, `msg.bit`, `msg.oob`.

Direct state writes: `msg.readcount`, `msg.bit`, `msg.oob`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Updated in place: `readcount`, `bit`, `oob`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L94)

<a id="constant-constant-mq3-qcommon-message-big-info-string-const-big-info-string-8192-src-mq3-qcommon-message-ml-1127145753"></a>
### BIG_INFO_STRING

```ml
const BIG_INFO_STRING = 8192
```

Used for system info key only.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L10)

<a id="function-function-mq3-qcommon-message-bitstream-function-bitstream-msg-src-mq3-qcommon-message-ml-354243805"></a>
### bitstream

```ml
function bitstream(msg)
```

Update `msg.oob` in qcommon.message.

Direct state writes: `msg.oob`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Updated in place: `oob`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L77)

<a id="function-function-mq3-qcommon-message-clear-function-clear-msg-src-mq3-qcommon-message-ml-1873558913"></a>
### clear

```ml
function clear(msg)
```

Clear message in qcommon.message; updates `msg.cursize`, `msg.overflowed`, `msg.bit`.

Direct state writes: `msg.cursize`, `msg.overflowed`, `msg.bit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Updated in place: `cursize`, `overflowed`, `bit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L68)

<a id="function-function-mq3-qcommon-message-copy-function-copy-source-length-src-mq3-qcommon-message-ml-615010105"></a>
### copy

```ml
function copy(source, length)
```

MSG_Copy preserves all source cursor/state fields and installs independent storage containing the bytes written so far.  Baseq3 deliberately retains src->maxsize; length is only the destination-capacity guard.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Record exposing `cursize`, `data`, `allowoverflow`, `overflowed`, `oob`, `maxsize`, `readcount` and further fields. |
| `length` | `dynamic` | — | Length used in `bytes(length, 0)` and `(length < source.cursize)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L104)

<a id="function-function-mq3-qcommon-message-init-function-init-length-src-mq3-qcommon-message-ml-136413964"></a>
### init

```ml
function init(length)
```

Return `mq3.qcommon.message.initStorage(bytes(length, 0), length, false)` from `qcommon.message.init`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `length` | `dynamic` | — | Length passed as `length` to `mq3.qcommon.message.initStorage`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L54)

<a id="function-function-mq3-qcommon-message-initoob-function-initoob-length-src-mq3-qcommon-message-ml-2033628292"></a>
### initOob

```ml
function initOob(length)
```

Return `mq3.qcommon.message.initStorage(bytes(length, 0), length, true)` from `qcommon.message.initOob`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `length` | `dynamic` | — | Length passed as `length` to `mq3.qcommon.message.initStorage`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L60)

<a id="function-function-mq3-qcommon-message-initstorage-function-initstorage-data-length-oob-src-mq3-qcommon-message-ml-1993176884"></a>
### initStorage

```ml
function initStorage(data, length, oob)
```

Return `mq3.qcommon.message.initStorageWithCodec(data, length, oob, void)` from `qcommon.message.initStorage`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.qcommon.message.initStorageWithCodec`. |
| `length` | `dynamic` | — | Length passed as `length` to `mq3.qcommon.message.initStorageWithCodec`. |
| `oob` | `dynamic` | — | Oob passed as `oob` to `mq3.qcommon.message.initStorageWithCodec`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L48)

<a id="function-function-mq3-qcommon-message-initstoragewithcodec-function-initstoragewithcodec-data-length-oob-codec-src-mq3-qcommon-message-ml-2140469862"></a>
### initStorageWithCodec

```ml
function initStorageWithCodec(data, length, oob, codec)
```

Compute init storage with codec in qcommon.message; the normal completion returns `Message(false, false, oob, data, length, 0, 0, 0, codec)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Initial `data` field stored in the returned or constructed `mq3.qcommon.message.Message` record. |
| `length` | `dynamic` | — | Initial `maxsize` field stored in the returned or constructed `mq3.qcommon.message.Message` record. |
| `oob` | `dynamic` | — | Initial `oob` field stored in the returned or constructed `mq3.qcommon.message.Message` record. |
| `codec` | `dynamic` | — | Initial `codec` field stored in the returned or constructed `mq3.qcommon.message.Message` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L39)

<a id="constant-constant-mq3-qcommon-message-max-string-chars-const-max-string-chars-1024-src-mq3-qcommon-message-ml-835710058"></a>
### MAX_STRING_CHARS

```ml
const MAX_STRING_CHARS = 1024
```

Max length of a string passed to Cmd_TokenizeString.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L8)

- [mq3.qcommon.message.Message](Type-mq3-qcommon-message-message-1158097836.md) — struct
<a id="function-function-mq3-qcommon-message-readangle16-function-readangle16-msg-src-mq3-qcommon-message-ml-108316579"></a>
### readAngle16

```ml
function readAngle16(msg)
```

Return `mq3.compat.numeric.fmul(readI16(msg), (360.0 / 65536.0))` from `qcommon.message.readAngle16`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.readI16`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L329)

<a id="function-function-mq3-qcommon-message-readbigcstring-function-readbigcstring-msg-src-mq3-qcommon-message-ml-513024435"></a>
### readBigCString

```ml
function readBigCString(msg)
```

Read big c string in qcommon.message; the normal completion returns `text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.readU8`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L354)

<a id="function-function-mq3-qcommon-message-readbits-function-readbits-msg-bits-src-mq3-qcommon-message-ml-542616279"></a>
### readBits

```ml
function readBits(msg, bits)
```

Read bits in qcommon.message; the normal completion returns `n.i32(value)`.

Validation failures include `message.readBits: invalid OOB width`.
Direct state writes: `msg.readcount`, `msg.bit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Record exposing `oob`, `readcount`, `data`, `bit`, `cursize`, `codec`. Updated in place: `readcount`, `bit`. |
| `bits` | `dynamic` | — | Bits operand used by `readBits`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L240)

<a id="function-function-mq3-qcommon-message-readcstring-function-readcstring-msg-src-mq3-qcommon-message-ml-1352700011"></a>
### readCString

```ml
function readCString(msg)
```

Return `mq3.qcommon.message.readText(msg, false)` from `qcommon.message.readCString`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.readText`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L347)

<a id="function-function-mq3-qcommon-message-readcstringline-function-readcstringline-msg-src-mq3-qcommon-message-ml-1159414479"></a>
### readCStringLine

```ml
function readCStringLine(msg)
```

Return `mq3.qcommon.message.readText(msg, true)` from `qcommon.message.readCStringLine`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.readText`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L350)

<a id="function-function-mq3-qcommon-message-readdata-function-readdata-msg-length-src-mq3-qcommon-message-ml-1624599635"></a>
### readData

```ml
function readData(msg, length)
```

Read data in qcommon.message; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.readU8`. |
| `length` | `dynamic` | — | Length used in `(length > 0)` and `(length - 1)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L368)

<a id="function-function-mq3-qcommon-message-readfloat-function-readfloat-msg-src-mq3-qcommon-message-ml-115238527"></a>
### readFloat

```ml
function readFloat(msg)
```

Read float in qcommon.message; the normal completion returns `n.bitsFloat(value)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Record exposing `readcount`, `cursize`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L321)

<a id="function-function-mq3-qcommon-message-readi16-function-readi16-msg-src-mq3-qcommon-message-ml-548491275"></a>
### readI16

```ml
function readI16(msg)
```

Read i 16 in qcommon.message; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Record exposing `readcount`, `cursize`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L305)

<a id="function-function-mq3-qcommon-message-readi32-function-readi32-msg-src-mq3-qcommon-message-ml-1118255319"></a>
### readI32

```ml
function readI32(msg)
```

Read i 32 in qcommon.message; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Record exposing `readcount`, `cursize`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L313)

<a id="function-function-mq3-qcommon-message-readi8-function-readi8-msg-src-mq3-qcommon-message-ml-449279623"></a>
### readI8

```ml
function readI8(msg)
```

Read i 8 in qcommon.message; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Record exposing `readcount`, `cursize`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L289)

<a id="function-function-mq3-qcommon-message-readtext-function-readtext-msg-lineonly-src-mq3-qcommon-message-ml-882163815"></a>
### readText

```ml
function readText(msg, lineOnly)
```

Read text in qcommon.message; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.readU8`. |
| `lineOnly` | `dynamic` | — | Line only used in `(lineOnly and (value == 10))` and `(not lineOnly and (value > 127))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L334)

<a id="function-function-mq3-qcommon-message-readu8-function-readu8-msg-src-mq3-qcommon-message-ml-93008623"></a>
### readU8

```ml
function readU8(msg)
```

Read u 8 in qcommon.message; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Record exposing `readcount`, `cursize`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L297)

<a id="function-function-mq3-qcommon-message-writeangle-function-writeangle-msg-value-src-mq3-qcommon-message-ml-1944940614"></a>
### writeAngle

```ml
function writeAngle(msg, value)
```

Return `mq3.qcommon.message.writeByte(msg, (n.trunc32(n.fdiv(n.fmul(value, 256.0), 360.0)) & 255))` from `qcommon.message.writeAngle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeByte`. |
| `value` | `dynamic` | — | Left floating-point operand. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L185)

<a id="function-function-mq3-qcommon-message-writeangle16-function-writeangle16-msg-value-src-mq3-qcommon-message-ml-1763776446"></a>
### writeAngle16

```ml
function writeAngle16(msg, value)
```

Return `mq3.qcommon.message.writeShort(msg, (n.trunc32(n.fdiv(n.fmul(value, 65536.0), 360.0)) & 65535))` from `qcommon.message.writeAngle16`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeShort`. |
| `value` | `dynamic` | — | Left floating-point operand. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L189)

<a id="function-function-mq3-qcommon-message-writebigstring-function-writebigstring-msg-text-src-mq3-qcommon-message-ml-785629708"></a>
### writeBigString

```ml
function writeBigString(msg, text)
```

Write big string in qcommon.message.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeByte`. |
| `text` | `dynamic` | — | Text used in `bytes(text)` and `(text == void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L221)

<a id="function-function-mq3-qcommon-message-writebits-function-writebits-msg-value-bits-src-mq3-qcommon-message-ml-1400369584"></a>
### writeBits

```ml
function writeBits(msg, value, bits)
```

Write bits in qcommon.message; the normal completion returns `true`.

Validation failures include `message.writeBits: invalid bit width`; `message.writeBits: invalid OOB width`.
Direct state writes: `msg.overflowed`, `msg.cursize`, `msg.bit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Record exposing `maxsize`, `cursize`, `oob`, `data`, `bit`, `codec`. Updated in place: `overflowed`, `cursize`, `bit`. |
| `value` | `dynamic` | — | Value used in `(value & 1)` and `(value >> 8)`. |
| `bits` | `dynamic` | — | Bits used in `(bits == 0)` and `(bits > 32)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L118)

<a id="function-function-mq3-qcommon-message-writebyte-function-writebyte-msg-value-src-mq3-qcommon-message-ml-254135048"></a>
### writeByte

```ml
function writeByte(msg, value)
```

Return `mq3.qcommon.message.writeBits(msg, value, 8)` from `qcommon.message.writeByte`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeBits`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.message.writeBits`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L169)

<a id="function-function-mq3-qcommon-message-writechar-function-writechar-msg-value-src-mq3-qcommon-message-ml-1085344504"></a>
### writeChar

```ml
function writeChar(msg, value)
```

Return `mq3.qcommon.message.writeBits(msg, value, 8)` from `qcommon.message.writeChar`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeBits`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.message.writeBits`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L165)

<a id="function-function-mq3-qcommon-message-writedata-function-writedata-msg-data-src-mq3-qcommon-message-ml-1946625525"></a>
### writeData

```ml
function writeData(msg, data)
```

Write data in qcommon.message.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeByte`. |
| `data` | `dynamic` | — | Sequence traversed as `value` by the loop in `writeData`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L194)

<a id="function-function-mq3-qcommon-message-writefloat-function-writefloat-msg-value-src-mq3-qcommon-message-ml-566884686"></a>
### writeFloat

```ml
function writeFloat(msg, value)
```

Return `mq3.qcommon.message.writeBits(msg, n.i32(n.floatBits(value)), 32)` from `qcommon.message.writeFloat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeBits`. |
| `value` | `dynamic` | — | Floating-point value to narrow and reinterpret. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L181)

<a id="function-function-mq3-qcommon-message-writelong-function-writelong-msg-value-src-mq3-qcommon-message-ml-1887971848"></a>
### writeLong

```ml
function writeLong(msg, value)
```

Return `mq3.qcommon.message.writeBits(msg, value, 32)` from `qcommon.message.writeLong`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeBits`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.message.writeBits`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L177)

<a id="function-function-mq3-qcommon-message-writeshort-function-writeshort-msg-value-src-mq3-qcommon-message-ml-2019316306"></a>
### writeShort

```ml
function writeShort(msg, value)
```

Return `mq3.qcommon.message.writeBits(msg, value, 16)` from `qcommon.message.writeShort`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeBits`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.message.writeBits`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L173)

<a id="function-function-mq3-qcommon-message-writestring-function-writestring-msg-text-src-mq3-qcommon-message-ml-259781476"></a>
### writeString

```ml
function writeString(msg, text)
```

Write string in qcommon.message.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeByte`. |
| `text` | `dynamic` | — | Text used in `bytes(text)` and `(text == void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/message.ml#L202)
