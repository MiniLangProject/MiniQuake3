# `src/mq3/qcommon/msg.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.qcommon.msg`](Package-mq3-qcommon-msg-401321151.md)

Reachable from entry: **no**

## Imports

- `mq3/qcommon/huffman.ml` as `huffman` → [src/mq3/qcommon/huffman.ml](File-src-mq3-qcommon-huffman-ml-898182869.md)
- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)
- `mq3/qcommon/message_delta.ml` as `delta` → [src/mq3/qcommon/message_delta.ml](File-src-mq3-qcommon-message-delta-ml-1923515516.md)
- `mq3/qcommon/message_state_delta.ml` as `stateDelta` → [src/mq3/qcommon/message_state_delta.ml](File-src-mq3-qcommon-message-state-delta-ml-255612102.md)

## Declarations

- [mq3.qcommon.msg.ChangeReport](Type-mq3-qcommon-msg-changereport-1040565977.md) — struct
<a id="function-function-mq3-qcommon-msg-msg-beginreading-function-msg-beginreading-msg-src-mq3-qcommon-msg-ml-1562558783"></a>
### MSG_BeginReading

```ml
function MSG_BeginReading(msg)
```

Return `mq3.qcommon.message.beginReading(msg)` from `qcommon.msg.MSG_BeginReading`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.beginReading`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L46)

<a id="function-function-mq3-qcommon-msg-msg-beginreadingoob-function-msg-beginreadingoob-msg-src-mq3-qcommon-msg-ml-1061087037"></a>
### MSG_BeginReadingOOB

```ml
function MSG_BeginReadingOOB(msg)
```

Return `mq3.qcommon.message.beginReadingOob(msg)` from `qcommon.msg.MSG_BeginReadingOOB`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.beginReadingOob`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L49)

<a id="function-function-mq3-qcommon-msg-msg-bitstream-function-msg-bitstream-msg-src-mq3-qcommon-msg-ml-662861"></a>
### MSG_Bitstream

```ml
function MSG_Bitstream(msg)
```

Return `mq3.qcommon.message.bitstream(msg)` from `qcommon.msg.MSG_Bitstream`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.bitstream`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L43)

<a id="function-function-mq3-qcommon-msg-msg-clear-function-msg-clear-msg-src-mq3-qcommon-msg-ml-644996945"></a>
### MSG_Clear

```ml
function MSG_Clear(msg)
```

Return `mq3.qcommon.message.clear(msg)` from `qcommon.msg.MSG_Clear`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.clear`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L40)

<a id="function-function-mq3-qcommon-msg-msg-copy-function-msg-copy-source-length-src-mq3-qcommon-msg-ml-1810715965"></a>
### MSG_Copy

```ml
function MSG_Copy(source, length)
```

Return `mq3.qcommon.message.copy(source, length)` from `qcommon.msg.MSG_Copy`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Source passed as `source` to `mq3.qcommon.message.copy`. |
| `length` | `dynamic` | — | Length passed as `length` to `mq3.qcommon.message.copy`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L53)

<a id="function-function-mq3-qcommon-msg-msg-init-function-msg-init-data-length-src-mq3-qcommon-msg-ml-1480542152"></a>
### MSG_Init

```ml
function MSG_Init(data, length)
```

Compute init in qcommon.msg; the normal completion returns `message.initStorage(data, length, false)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.qcommon.message.initStorage`. |
| `length` | `dynamic` | — | Length passed as `length` to `mq3.qcommon.message.initStorage`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L33)

<a id="function-function-mq3-qcommon-msg-msg-inithuffman-function-msg-inithuffman-src-mq3-qcommon-msg-ml-1369336802"></a>
### MSG_initHuffman

```ml
function MSG_initHuffman()
```

Baseq3 trains the global compressor and decompressor identically. Messages own immutable equivalents in MiniLang, avoiding process-global mutation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L235)

<a id="function-function-mq3-qcommon-msg-msg-initoob-function-msg-initoob-data-length-src-mq3-qcommon-msg-ml-999567916"></a>
### MSG_InitOOB

```ml
function MSG_InitOOB(data, length)
```

Compute init oob in qcommon.msg; the normal completion returns `message.initStorage(data, length, true)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.qcommon.message.initStorage`. |
| `length` | `dynamic` | — | Length passed as `length` to `mq3.qcommon.message.initStorage`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L37)

<a id="function-function-mq3-qcommon-msg-msg-nuinithuffman-function-msg-nuinithuffman-data-src-mq3-qcommon-msg-ml-647759960"></a>
### MSG_NUinitHuffman

```ml
function MSG_NUinitHuffman(data)
```

Compute n uinit huffman in qcommon.msg; the normal completion returns `NUHuffman(compressor, decompressor, frequencies)`.

Validation failures include `MSG_NUinitHuffman: missing sample`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `(data == void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L240)

<a id="function-function-mq3-qcommon-msg-msg-readangle16-function-msg-readangle16-msg-src-mq3-qcommon-msg-ml-1339373575"></a>
### MSG_ReadAngle16

```ml
function MSG_ReadAngle16(msg)
```

Return `mq3.qcommon.message.readAngle16(msg)` from `qcommon.msg.MSG_ReadAngle16`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.readAngle16`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L133)

<a id="function-function-mq3-qcommon-msg-msg-readbigstring-function-msg-readbigstring-msg-src-mq3-qcommon-msg-ml-420617897"></a>
### MSG_ReadBigString

```ml
function MSG_ReadBigString(msg)
```

Return `mq3.qcommon.message.readBigCString(msg)` from `qcommon.msg.MSG_ReadBigString`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.readBigCString`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L127)

<a id="function-function-mq3-qcommon-msg-msg-readbits-function-msg-readbits-msg-bits-src-mq3-qcommon-msg-ml-2968463"></a>
### MSG_ReadBits

```ml
function MSG_ReadBits(msg, bits)
```

Return `mq3.qcommon.message.readBits(msg, bits)` from `qcommon.msg.MSG_ReadBits`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.readBits`. |
| `bits` | `dynamic` | — | Bits passed as `bits` to `mq3.qcommon.message.readBits`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L63)

<a id="function-function-mq3-qcommon-msg-msg-readbyte-function-msg-readbyte-msg-src-mq3-qcommon-msg-ml-1523403315"></a>
### MSG_ReadByte

```ml
function MSG_ReadByte(msg)
```

Return `mq3.qcommon.message.readU8(msg)` from `qcommon.msg.MSG_ReadByte`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.readU8`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L112)

<a id="function-function-mq3-qcommon-msg-msg-readchar-function-msg-readchar-msg-src-mq3-qcommon-msg-ml-657779555"></a>
### MSG_ReadChar

```ml
function MSG_ReadChar(msg)
```

Return `mq3.qcommon.message.readI8(msg)` from `qcommon.msg.MSG_ReadChar`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.readI8`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L109)

<a id="function-function-mq3-qcommon-msg-msg-readdata-function-msg-readdata-msg-length-src-mq3-qcommon-msg-ml-133600947"></a>
### MSG_ReadData

```ml
function MSG_ReadData(msg, length)
```

Return `mq3.qcommon.message.readData(msg, length)` from `qcommon.msg.MSG_ReadData`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.readData`. |
| `length` | `dynamic` | — | Length passed as `length` to `mq3.qcommon.message.readData`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L137)

<a id="function-function-mq3-qcommon-msg-msg-readdelta-function-msg-readdelta-msg-oldvalue-bits-src-mq3-qcommon-msg-ml-1864898913"></a>
### MSG_ReadDelta

```ml
function MSG_ReadDelta(msg, oldValue, bits)
```

Return `mq3.qcommon.message_delta.readDelta(msg, oldValue, bits)` from `qcommon.msg.MSG_ReadDelta`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message_delta.readDelta`. |
| `oldValue` | `dynamic` | — | Old v passed as `oldV` to `mq3.qcommon.message_delta.readDelta`. |
| `bits` | `dynamic` | — | Bits passed as `bits` to `mq3.qcommon.message_delta.readDelta`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L149)

<a id="function-function-mq3-qcommon-msg-msg-readdeltaentity-function-msg-readdeltaentity-msg-fromvalue-number-src-mq3-qcommon-msg-ml-1567165477"></a>
### MSG_ReadDeltaEntity

```ml
function MSG_ReadDeltaEntity(msg, fromValue, number)
```

Return `mq3.qcommon.message_state_delta.readDeltaEntity(msg, fromValue, number)` from `qcommon.msg.MSG_ReadDeltaEntity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message_state_delta.readDeltaEntity`. |
| `fromValue` | `dynamic` | — | Base state passed as `baseState` to `mq3.qcommon.message_state_delta.readDeltaEntity`. |
| `number` | `dynamic` | — | Number passed as `number` to `mq3.qcommon.message_state_delta.readDeltaEntity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L214)

<a id="function-function-mq3-qcommon-msg-msg-readdeltafloat-function-msg-readdeltafloat-msg-oldvalue-src-mq3-qcommon-msg-ml-451726981"></a>
### MSG_ReadDeltaFloat

```ml
function MSG_ReadDeltaFloat(msg, oldValue)
```

Return `mq3.qcommon.message_delta.readDeltaFloat(msg, oldValue)` from `qcommon.msg.MSG_ReadDeltaFloat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message_delta.readDeltaFloat`. |
| `oldValue` | `dynamic` | — | Old v passed as `oldV` to `mq3.qcommon.message_delta.readDeltaFloat`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L158)

<a id="function-function-mq3-qcommon-msg-msg-readdeltakey-function-msg-readdeltakey-msg-key-oldvalue-bits-src-mq3-qcommon-msg-ml-1117263378"></a>
### MSG_ReadDeltaKey

```ml
function MSG_ReadDeltaKey(msg, key, oldValue, bits)
```

Return `mq3.qcommon.message_delta.readDeltaKey(msg, key, oldValue, bits)` from `qcommon.msg.MSG_ReadDeltaKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message_delta.readDeltaKey`. |
| `key` | `dynamic` | — | Key passed as `key` to `mq3.qcommon.message_delta.readDeltaKey`. |
| `oldValue` | `dynamic` | — | Old v passed as `oldV` to `mq3.qcommon.message_delta.readDeltaKey`. |
| `bits` | `dynamic` | — | Bits passed as `bits` to `mq3.qcommon.message_delta.readDeltaKey`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L171)

<a id="function-function-mq3-qcommon-msg-msg-readdeltakeyfloat-function-msg-readdeltakeyfloat-msg-key-oldvalue-src-mq3-qcommon-msg-ml-437528952"></a>
### MSG_ReadDeltaKeyFloat

```ml
function MSG_ReadDeltaKeyFloat(msg, key, oldValue)
```

Return `mq3.qcommon.message_delta.readDeltaKeyFloat(msg, key, oldValue)` from `qcommon.msg.MSG_ReadDeltaKeyFloat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message_delta.readDeltaKeyFloat`. |
| `key` | `dynamic` | — | Key passed as `key` to `mq3.qcommon.message_delta.readDeltaKeyFloat`. |
| `oldValue` | `dynamic` | — | Old v passed as `oldV` to `mq3.qcommon.message_delta.readDeltaKeyFloat`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L182)

<a id="function-function-mq3-qcommon-msg-msg-readdeltaplayerstate-function-msg-readdeltaplayerstate-msg-fromvalue-src-mq3-qcommon-msg-ml-2073223026"></a>
### MSG_ReadDeltaPlayerstate

```ml
function MSG_ReadDeltaPlayerstate(msg, fromValue)
```

Return `mq3.qcommon.message_state_delta.readDeltaPlayerstate(msg, fromValue)` from `qcommon.msg.MSG_ReadDeltaPlayerstate`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message_state_delta.readDeltaPlayerstate`. |
| `fromValue` | `dynamic` | — | Base state passed as `baseState` to `mq3.qcommon.message_state_delta.readDeltaPlayerstate`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L223)

<a id="function-function-mq3-qcommon-msg-msg-readdeltausercmd-function-msg-readdeltausercmd-msg-fromvalue-src-mq3-qcommon-msg-ml-824248314"></a>
### MSG_ReadDeltaUsercmd

```ml
function MSG_ReadDeltaUsercmd(msg, fromValue)
```

Return `mq3.qcommon.message_delta.readDeltaUsercmd(msg, fromValue)` from `qcommon.msg.MSG_ReadDeltaUsercmd`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message_delta.readDeltaUsercmd`. |
| `fromValue` | `dynamic` | — | Previous passed as `previous` to `mq3.qcommon.message_delta.readDeltaUsercmd`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L191)

<a id="function-function-mq3-qcommon-msg-msg-readdeltausercmdkey-function-msg-readdeltausercmdkey-msg-key-fromvalue-src-mq3-qcommon-msg-ml-123873171"></a>
### MSG_ReadDeltaUsercmdKey

```ml
function MSG_ReadDeltaUsercmdKey(msg, key, fromValue)
```

Return `mq3.qcommon.message_delta.readDeltaUsercmdKey(msg, key, fromValue)` from `qcommon.msg.MSG_ReadDeltaUsercmdKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message_delta.readDeltaUsercmdKey`. |
| `key` | `dynamic` | — | Key passed as `key` to `mq3.qcommon.message_delta.readDeltaUsercmdKey`. |
| `fromValue` | `dynamic` | — | Previous passed as `previous` to `mq3.qcommon.message_delta.readDeltaUsercmdKey`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L202)

<a id="function-function-mq3-qcommon-msg-msg-readfloat-function-msg-readfloat-msg-src-mq3-qcommon-msg-ml-450888507"></a>
### MSG_ReadFloat

```ml
function MSG_ReadFloat(msg)
```

Return `mq3.qcommon.message.readFloat(msg)` from `qcommon.msg.MSG_ReadFloat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.readFloat`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L121)

<a id="function-function-mq3-qcommon-msg-msg-readlong-function-msg-readlong-msg-src-mq3-qcommon-msg-ml-420685355"></a>
### MSG_ReadLong

```ml
function MSG_ReadLong(msg)
```

Return `mq3.qcommon.message.readI32(msg)` from `qcommon.msg.MSG_ReadLong`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.readI32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L118)

<a id="function-function-mq3-qcommon-msg-msg-readshort-function-msg-readshort-msg-src-mq3-qcommon-msg-ml-1762783419"></a>
### MSG_ReadShort

```ml
function MSG_ReadShort(msg)
```

Return `mq3.qcommon.message.readI16(msg)` from `qcommon.msg.MSG_ReadShort`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.readI16`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L115)

<a id="function-function-mq3-qcommon-msg-msg-readstring-function-msg-readstring-msg-src-mq3-qcommon-msg-ml-883549787"></a>
### MSG_ReadString

```ml
function MSG_ReadString(msg)
```

Return `mq3.qcommon.message.readCString(msg)` from `qcommon.msg.MSG_ReadString`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.readCString`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L124)

<a id="function-function-mq3-qcommon-msg-msg-readstringline-function-msg-readstringline-msg-src-mq3-qcommon-msg-ml-936492211"></a>
### MSG_ReadStringLine

```ml
function MSG_ReadStringLine(msg)
```

Return `mq3.qcommon.message.readCStringLine(msg)` from `qcommon.msg.MSG_ReadStringLine`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.readCStringLine`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L130)

<a id="function-function-mq3-qcommon-msg-msg-reportchangevectors-f-function-msg-reportchangevectors-f-report-src-mq3-qcommon-msg-ml-901878448"></a>
### MSG_ReportChangeVectors_f

```ml
function MSG_ReportChangeVectors_f(report)
```

Compute report change vectors f in qcommon.msg; the normal completion returns `rows`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `report` | `dynamic` | — | Record exposing `counts`, `printFn`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L227)

<a id="function-function-mq3-qcommon-msg-msg-writeangle-function-msg-writeangle-msg-value-src-mq3-qcommon-msg-ml-216764506"></a>
### MSG_WriteAngle

```ml
function MSG_WriteAngle(msg, value)
```

Return `mq3.qcommon.message.writeAngle(msg, value)` from `qcommon.msg.MSG_WriteAngle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeAngle`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.message.writeAngle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L102)

<a id="function-function-mq3-qcommon-msg-msg-writeangle16-function-msg-writeangle16-msg-value-src-mq3-qcommon-msg-ml-1994547234"></a>
### MSG_WriteAngle16

```ml
function MSG_WriteAngle16(msg, value)
```

Return `mq3.qcommon.message.writeAngle16(msg, value)` from `qcommon.msg.MSG_WriteAngle16`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeAngle16`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.message.writeAngle16`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L106)

<a id="function-function-mq3-qcommon-msg-msg-writebigstring-function-msg-writebigstring-msg-value-src-mq3-qcommon-msg-ml-106645658"></a>
### MSG_WriteBigString

```ml
function MSG_WriteBigString(msg, value)
```

Return `mq3.qcommon.message.writeBigString(msg, value)` from `qcommon.msg.MSG_WriteBigString`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeBigString`. |
| `value` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.message.writeBigString`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L98)

<a id="function-function-mq3-qcommon-msg-msg-writebits-function-msg-writebits-msg-value-bits-src-mq3-qcommon-msg-ml-2101834328"></a>
### MSG_WriteBits

```ml
function MSG_WriteBits(msg, value, bits)
```

Return `mq3.qcommon.message.writeBits(msg, value, bits)` from `qcommon.msg.MSG_WriteBits`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeBits`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.message.writeBits`. |
| `bits` | `dynamic` | — | Bits passed as `bits` to `mq3.qcommon.message.writeBits`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L59)

<a id="function-function-mq3-qcommon-msg-msg-writebyte-function-msg-writebyte-msg-value-src-mq3-qcommon-msg-ml-689158112"></a>
### MSG_WriteByte

```ml
function MSG_WriteByte(msg, value)
```

Return `mq3.qcommon.message.writeByte(msg, value)` from `qcommon.msg.MSG_WriteByte`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeByte`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.message.writeByte`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L71)

<a id="function-function-mq3-qcommon-msg-msg-writechar-function-msg-writechar-msg-value-src-mq3-qcommon-msg-ml-1549317528"></a>
### MSG_WriteChar

```ml
function MSG_WriteChar(msg, value)
```

Return `mq3.qcommon.message.writeChar(msg, value)` from `qcommon.msg.MSG_WriteChar`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeChar`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.message.writeChar`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L67)

<a id="function-function-mq3-qcommon-msg-msg-writedata-function-msg-writedata-msg-data-length-src-mq3-qcommon-msg-ml-1584882121"></a>
### MSG_WriteData

```ml
function MSG_WriteData(msg, data, length)
```

Write data in qcommon.msg; the normal completion returns `message.writeData(msg, slice(data, 0, length))`.

Validation failures include `MSG_WriteData: invalid length`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeData`. |
| `data` | `dynamic` | — | Data used in `len(data)` and `(length > len(data))`. |
| `length` | `dynamic` | — | Length used in `(length < 0)` and `(length > len(data))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L78)

<a id="function-function-mq3-qcommon-msg-msg-writedelta-function-msg-writedelta-msg-oldvalue-newvalue-bits-src-mq3-qcommon-msg-ml-1171149186"></a>
### MSG_WriteDelta

```ml
function MSG_WriteDelta(msg, oldValue, newValue, bits)
```

Return `mq3.qcommon.message_delta.writeDelta(msg, oldValue, newValue, bits)` from `qcommon.msg.MSG_WriteDelta`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message_delta.writeDelta`. |
| `oldValue` | `dynamic` | — | Old v passed as `oldV` to `mq3.qcommon.message_delta.writeDelta`. |
| `newValue` | `dynamic` | — | New v passed as `newV` to `mq3.qcommon.message_delta.writeDelta`. |
| `bits` | `dynamic` | — | Bits passed as `bits` to `mq3.qcommon.message_delta.writeDelta`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L144)

<a id="function-function-mq3-qcommon-msg-msg-writedeltaentity-function-msg-writedeltaentity-msg-fromvalue-tovalue-force-src-mq3-qcommon-msg-ml-2070636495"></a>
### MSG_WriteDeltaEntity

```ml
function MSG_WriteDeltaEntity(msg, fromValue, toValue, force)
```

Return `mq3.qcommon.message_state_delta.writeDeltaEntity(msg, fromValue, toValue, force)` from `qcommon.msg.MSG_WriteDeltaEntity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message_state_delta.writeDeltaEntity`. |
| `fromValue` | `dynamic` | — | Base state passed as `baseState` to `mq3.qcommon.message_state_delta.writeDeltaEntity`. |
| `toValue` | `dynamic` | — | Next state passed as `nextState` to `mq3.qcommon.message_state_delta.writeDeltaEntity`. |
| `force` | `dynamic` | — | Force passed as `force` to `mq3.qcommon.message_state_delta.writeDeltaEntity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L209)

<a id="function-function-mq3-qcommon-msg-msg-writedeltafloat-function-msg-writedeltafloat-msg-oldvalue-newvalue-src-mq3-qcommon-msg-ml-886310000"></a>
### MSG_WriteDeltaFloat

```ml
function MSG_WriteDeltaFloat(msg, oldValue, newValue)
```

Return `mq3.qcommon.message_delta.writeDeltaFloat(msg, oldValue, newValue)` from `qcommon.msg.MSG_WriteDeltaFloat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message_delta.writeDeltaFloat`. |
| `oldValue` | `dynamic` | — | Old v passed as `oldV` to `mq3.qcommon.message_delta.writeDeltaFloat`. |
| `newValue` | `dynamic` | — | New v passed as `newV` to `mq3.qcommon.message_delta.writeDeltaFloat`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L154)

<a id="function-function-mq3-qcommon-msg-msg-writedeltakey-function-msg-writedeltakey-msg-key-oldvalue-newvalue-bits-src-mq3-qcommon-msg-ml-294315209"></a>
### MSG_WriteDeltaKey

```ml
function MSG_WriteDeltaKey(msg, key, oldValue, newValue, bits)
```

Return `mq3.qcommon.message_delta.writeDeltaKey(msg, key, oldValue, newValue, bits)` from `qcommon.msg.MSG_WriteDeltaKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message_delta.writeDeltaKey`. |
| `key` | `dynamic` | — | Key passed as `key` to `mq3.qcommon.message_delta.writeDeltaKey`. |
| `oldValue` | `dynamic` | — | Old v passed as `oldV` to `mq3.qcommon.message_delta.writeDeltaKey`. |
| `newValue` | `dynamic` | — | New v passed as `newV` to `mq3.qcommon.message_delta.writeDeltaKey`. |
| `bits` | `dynamic` | — | Bits passed as `bits` to `mq3.qcommon.message_delta.writeDeltaKey`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L165)

<a id="function-function-mq3-qcommon-msg-msg-writedeltakeyfloat-function-msg-writedeltakeyfloat-msg-key-oldvalue-newvalue-src-mq3-qcommon-msg-ml-2016875261"></a>
### MSG_WriteDeltaKeyFloat

```ml
function MSG_WriteDeltaKeyFloat(msg, key, oldValue, newValue)
```

Return `mq3.qcommon.message_delta.writeDeltaKeyFloat(msg, key, oldValue, newValue)` from `qcommon.msg.MSG_WriteDeltaKeyFloat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message_delta.writeDeltaKeyFloat`. |
| `key` | `dynamic` | — | Key passed as `key` to `mq3.qcommon.message_delta.writeDeltaKeyFloat`. |
| `oldValue` | `dynamic` | — | Old v passed as `oldV` to `mq3.qcommon.message_delta.writeDeltaKeyFloat`. |
| `newValue` | `dynamic` | — | New v passed as `newV` to `mq3.qcommon.message_delta.writeDeltaKeyFloat`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L177)

<a id="function-function-mq3-qcommon-msg-msg-writedeltaplayerstate-function-msg-writedeltaplayerstate-msg-fromvalue-tovalue-src-mq3-qcommon-msg-ml-1009670308"></a>
### MSG_WriteDeltaPlayerstate

```ml
function MSG_WriteDeltaPlayerstate(msg, fromValue, toValue)
```

Return `mq3.qcommon.message_state_delta.writeDeltaPlayerstate(msg, fromValue, toValue)` from `qcommon.msg.MSG_WriteDeltaPlayerstate`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message_state_delta.writeDeltaPlayerstate`. |
| `fromValue` | `dynamic` | — | Base state passed as `baseState` to `mq3.qcommon.message_state_delta.writeDeltaPlayerstate`. |
| `toValue` | `dynamic` | — | Next state passed as `nextState` to `mq3.qcommon.message_state_delta.writeDeltaPlayerstate`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L219)

<a id="function-function-mq3-qcommon-msg-msg-writedeltausercmd-function-msg-writedeltausercmd-msg-fromvalue-tovalue-src-mq3-qcommon-msg-ml-669649790"></a>
### MSG_WriteDeltaUsercmd

```ml
function MSG_WriteDeltaUsercmd(msg, fromValue, toValue)
```

Return `mq3.qcommon.message_delta.writeDeltaUsercmd(msg, fromValue, toValue)` from `qcommon.msg.MSG_WriteDeltaUsercmd`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message_delta.writeDeltaUsercmd`. |
| `fromValue` | `dynamic` | — | Previous passed as `previous` to `mq3.qcommon.message_delta.writeDeltaUsercmd`. |
| `toValue` | `dynamic` | — | Current passed as `current` to `mq3.qcommon.message_delta.writeDeltaUsercmd`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L187)

<a id="function-function-mq3-qcommon-msg-msg-writedeltausercmdkey-function-msg-writedeltausercmdkey-msg-key-fromvalue-tovalue-src-mq3-qcommon-msg-ml-598034301"></a>
### MSG_WriteDeltaUsercmdKey

```ml
function MSG_WriteDeltaUsercmdKey(msg, key, fromValue, toValue)
```

Return `mq3.qcommon.message_delta.writeDeltaUsercmdKey(msg, key, fromValue, toValue)` from `qcommon.msg.MSG_WriteDeltaUsercmdKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message_delta.writeDeltaUsercmdKey`. |
| `key` | `dynamic` | — | Key passed as `key` to `mq3.qcommon.message_delta.writeDeltaUsercmdKey`. |
| `fromValue` | `dynamic` | — | Previous passed as `previous` to `mq3.qcommon.message_delta.writeDeltaUsercmdKey`. |
| `toValue` | `dynamic` | — | Current passed as `current` to `mq3.qcommon.message_delta.writeDeltaUsercmdKey`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L197)

<a id="function-function-mq3-qcommon-msg-msg-writefloat-function-msg-writefloat-msg-value-src-mq3-qcommon-msg-ml-336867282"></a>
### MSG_WriteFloat

```ml
function MSG_WriteFloat(msg, value)
```

Return `mq3.qcommon.message.writeFloat(msg, value)` from `qcommon.msg.MSG_WriteFloat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeFloat`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.message.writeFloat`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L90)

<a id="function-function-mq3-qcommon-msg-msg-writelong-function-msg-writelong-msg-value-src-mq3-qcommon-msg-ml-446486640"></a>
### MSG_WriteLong

```ml
function MSG_WriteLong(msg, value)
```

Return `mq3.qcommon.message.writeLong(msg, value)` from `qcommon.msg.MSG_WriteLong`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeLong`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.message.writeLong`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L86)

<a id="function-function-mq3-qcommon-msg-msg-writeshort-function-msg-writeshort-msg-value-src-mq3-qcommon-msg-ml-1103723722"></a>
### MSG_WriteShort

```ml
function MSG_WriteShort(msg, value)
```

Return `mq3.qcommon.message.writeShort(msg, value)` from `qcommon.msg.MSG_WriteShort`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeShort`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.message.writeShort`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L82)

<a id="function-function-mq3-qcommon-msg-msg-writestring-function-msg-writestring-msg-value-src-mq3-qcommon-msg-ml-1577332602"></a>
### MSG_WriteString

```ml
function MSG_WriteString(msg, value)
```

Return `mq3.qcommon.message.writeString(msg, value)` from `qcommon.msg.MSG_WriteString`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeString`. |
| `value` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.message.writeString`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/msg.ml#L94)

- [mq3.qcommon.msg.NUHuffman](Type-mq3-qcommon-msg-nuhuffman-45583967.md) — struct
