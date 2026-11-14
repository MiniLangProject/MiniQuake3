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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L18)

<a id="function-function-mq3-qcommon-msg-msg-beginreadingoob-function-msg-beginreadingoob-msg-src-mq3-qcommon-msg-ml-1061087037"></a>
### MSG_BeginReadingOOB

```ml
function MSG_BeginReadingOOB(msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L19)

<a id="function-function-mq3-qcommon-msg-msg-bitstream-function-msg-bitstream-msg-src-mq3-qcommon-msg-ml-662861"></a>
### MSG_Bitstream

```ml
function MSG_Bitstream(msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L17)

<a id="function-function-mq3-qcommon-msg-msg-clear-function-msg-clear-msg-src-mq3-qcommon-msg-ml-644996945"></a>
### MSG_Clear

```ml
function MSG_Clear(msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L16)

<a id="function-function-mq3-qcommon-msg-msg-copy-function-msg-copy-source-length-src-mq3-qcommon-msg-ml-1810715965"></a>
### MSG_Copy

```ml
function MSG_Copy(source, length)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `length` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L20)

<a id="function-function-mq3-qcommon-msg-msg-init-function-msg-init-data-length-src-mq3-qcommon-msg-ml-1480542152"></a>
### MSG_Init

```ml
function MSG_Init(data, length)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `length` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L14)

<a id="function-function-mq3-qcommon-msg-msg-inithuffman-function-msg-inithuffman-src-mq3-qcommon-msg-ml-1369336802"></a>
### MSG_initHuffman

```ml
function MSG_initHuffman()
```

Baseq3 trains the global compressor and decompressor identically. Messages own immutable equivalents in MiniLang, avoiding process-global mutation.


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L71)

<a id="function-function-mq3-qcommon-msg-msg-initoob-function-msg-initoob-data-length-src-mq3-qcommon-msg-ml-999567916"></a>
### MSG_InitOOB

```ml
function MSG_InitOOB(data, length)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `length` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L15)

<a id="function-function-mq3-qcommon-msg-msg-nuinithuffman-function-msg-nuinithuffman-data-src-mq3-qcommon-msg-ml-647759960"></a>
### MSG_NUinitHuffman

```ml
function MSG_NUinitHuffman(data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L72)

<a id="function-function-mq3-qcommon-msg-msg-readangle16-function-msg-readangle16-msg-src-mq3-qcommon-msg-ml-1339373575"></a>
### MSG_ReadAngle16

```ml
function MSG_ReadAngle16(msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L42)

<a id="function-function-mq3-qcommon-msg-msg-readbigstring-function-msg-readbigstring-msg-src-mq3-qcommon-msg-ml-420617897"></a>
### MSG_ReadBigString

```ml
function MSG_ReadBigString(msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L40)

<a id="function-function-mq3-qcommon-msg-msg-readbits-function-msg-readbits-msg-bits-src-mq3-qcommon-msg-ml-2968463"></a>
### MSG_ReadBits

```ml
function MSG_ReadBits(msg, bits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `bits` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L23)

<a id="function-function-mq3-qcommon-msg-msg-readbyte-function-msg-readbyte-msg-src-mq3-qcommon-msg-ml-1523403315"></a>
### MSG_ReadByte

```ml
function MSG_ReadByte(msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L35)

<a id="function-function-mq3-qcommon-msg-msg-readchar-function-msg-readchar-msg-src-mq3-qcommon-msg-ml-657779555"></a>
### MSG_ReadChar

```ml
function MSG_ReadChar(msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L34)

<a id="function-function-mq3-qcommon-msg-msg-readdata-function-msg-readdata-msg-length-src-mq3-qcommon-msg-ml-133600947"></a>
### MSG_ReadData

```ml
function MSG_ReadData(msg, length)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `length` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L43)

<a id="function-function-mq3-qcommon-msg-msg-readdelta-function-msg-readdelta-msg-oldvalue-bits-src-mq3-qcommon-msg-ml-1864898913"></a>
### MSG_ReadDelta

```ml
function MSG_ReadDelta(msg, oldValue, bits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `oldValue` | `dynamic` | — |  |
| `bits` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L46)

<a id="function-function-mq3-qcommon-msg-msg-readdeltaentity-function-msg-readdeltaentity-msg-fromvalue-number-src-mq3-qcommon-msg-ml-1567165477"></a>
### MSG_ReadDeltaEntity

```ml
function MSG_ReadDeltaEntity(msg, fromValue, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `fromValue` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L59)

<a id="function-function-mq3-qcommon-msg-msg-readdeltafloat-function-msg-readdeltafloat-msg-oldvalue-src-mq3-qcommon-msg-ml-451726981"></a>
### MSG_ReadDeltaFloat

```ml
function MSG_ReadDeltaFloat(msg, oldValue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `oldValue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L48)

<a id="function-function-mq3-qcommon-msg-msg-readdeltakey-function-msg-readdeltakey-msg-key-oldvalue-bits-src-mq3-qcommon-msg-ml-1117263378"></a>
### MSG_ReadDeltaKey

```ml
function MSG_ReadDeltaKey(msg, key, oldValue, bits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `oldValue` | `dynamic` | — |  |
| `bits` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L50)

<a id="function-function-mq3-qcommon-msg-msg-readdeltakeyfloat-function-msg-readdeltakeyfloat-msg-key-oldvalue-src-mq3-qcommon-msg-ml-437528952"></a>
### MSG_ReadDeltaKeyFloat

```ml
function MSG_ReadDeltaKeyFloat(msg, key, oldValue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `oldValue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L52)

<a id="function-function-mq3-qcommon-msg-msg-readdeltaplayerstate-function-msg-readdeltaplayerstate-msg-fromvalue-src-mq3-qcommon-msg-ml-2073223026"></a>
### MSG_ReadDeltaPlayerstate

```ml
function MSG_ReadDeltaPlayerstate(msg, fromValue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `fromValue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L61)

<a id="function-function-mq3-qcommon-msg-msg-readdeltausercmd-function-msg-readdeltausercmd-msg-fromvalue-src-mq3-qcommon-msg-ml-824248314"></a>
### MSG_ReadDeltaUsercmd

```ml
function MSG_ReadDeltaUsercmd(msg, fromValue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `fromValue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L54)

<a id="function-function-mq3-qcommon-msg-msg-readdeltausercmdkey-function-msg-readdeltausercmdkey-msg-key-fromvalue-src-mq3-qcommon-msg-ml-123873171"></a>
### MSG_ReadDeltaUsercmdKey

```ml
function MSG_ReadDeltaUsercmdKey(msg, key, fromValue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `fromValue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L56)

<a id="function-function-mq3-qcommon-msg-msg-readfloat-function-msg-readfloat-msg-src-mq3-qcommon-msg-ml-450888507"></a>
### MSG_ReadFloat

```ml
function MSG_ReadFloat(msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L38)

<a id="function-function-mq3-qcommon-msg-msg-readlong-function-msg-readlong-msg-src-mq3-qcommon-msg-ml-420685355"></a>
### MSG_ReadLong

```ml
function MSG_ReadLong(msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L37)

<a id="function-function-mq3-qcommon-msg-msg-readshort-function-msg-readshort-msg-src-mq3-qcommon-msg-ml-1762783419"></a>
### MSG_ReadShort

```ml
function MSG_ReadShort(msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L36)

<a id="function-function-mq3-qcommon-msg-msg-readstring-function-msg-readstring-msg-src-mq3-qcommon-msg-ml-883549787"></a>
### MSG_ReadString

```ml
function MSG_ReadString(msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L39)

<a id="function-function-mq3-qcommon-msg-msg-readstringline-function-msg-readstringline-msg-src-mq3-qcommon-msg-ml-936492211"></a>
### MSG_ReadStringLine

```ml
function MSG_ReadStringLine(msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L41)

<a id="function-function-mq3-qcommon-msg-msg-reportchangevectors-f-function-msg-reportchangevectors-f-report-src-mq3-qcommon-msg-ml-901878448"></a>
### MSG_ReportChangeVectors_f

```ml
function MSG_ReportChangeVectors_f(report)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `report` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L63)

<a id="function-function-mq3-qcommon-msg-msg-writeangle-function-msg-writeangle-msg-value-src-mq3-qcommon-msg-ml-216764506"></a>
### MSG_WriteAngle

```ml
function MSG_WriteAngle(msg, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L32)

<a id="function-function-mq3-qcommon-msg-msg-writeangle16-function-msg-writeangle16-msg-value-src-mq3-qcommon-msg-ml-1994547234"></a>
### MSG_WriteAngle16

```ml
function MSG_WriteAngle16(msg, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L33)

<a id="function-function-mq3-qcommon-msg-msg-writebigstring-function-msg-writebigstring-msg-value-src-mq3-qcommon-msg-ml-106645658"></a>
### MSG_WriteBigString

```ml
function MSG_WriteBigString(msg, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L31)

<a id="function-function-mq3-qcommon-msg-msg-writebits-function-msg-writebits-msg-value-bits-src-mq3-qcommon-msg-ml-2101834328"></a>
### MSG_WriteBits

```ml
function MSG_WriteBits(msg, value, bits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `bits` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L22)

<a id="function-function-mq3-qcommon-msg-msg-writebyte-function-msg-writebyte-msg-value-src-mq3-qcommon-msg-ml-689158112"></a>
### MSG_WriteByte

```ml
function MSG_WriteByte(msg, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L25)

<a id="function-function-mq3-qcommon-msg-msg-writechar-function-msg-writechar-msg-value-src-mq3-qcommon-msg-ml-1549317528"></a>
### MSG_WriteChar

```ml
function MSG_WriteChar(msg, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L24)

<a id="function-function-mq3-qcommon-msg-msg-writedata-function-msg-writedata-msg-data-length-src-mq3-qcommon-msg-ml-1584882121"></a>
### MSG_WriteData

```ml
function MSG_WriteData(msg, data, length)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `length` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L26)

<a id="function-function-mq3-qcommon-msg-msg-writedelta-function-msg-writedelta-msg-oldvalue-newvalue-bits-src-mq3-qcommon-msg-ml-1171149186"></a>
### MSG_WriteDelta

```ml
function MSG_WriteDelta(msg, oldValue, newValue, bits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `oldValue` | `dynamic` | — |  |
| `newValue` | `dynamic` | — |  |
| `bits` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L45)

<a id="function-function-mq3-qcommon-msg-msg-writedeltaentity-function-msg-writedeltaentity-msg-fromvalue-tovalue-force-src-mq3-qcommon-msg-ml-2070636495"></a>
### MSG_WriteDeltaEntity

```ml
function MSG_WriteDeltaEntity(msg, fromValue, toValue, force)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `fromValue` | `dynamic` | — |  |
| `toValue` | `dynamic` | — |  |
| `force` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L58)

<a id="function-function-mq3-qcommon-msg-msg-writedeltafloat-function-msg-writedeltafloat-msg-oldvalue-newvalue-src-mq3-qcommon-msg-ml-886310000"></a>
### MSG_WriteDeltaFloat

```ml
function MSG_WriteDeltaFloat(msg, oldValue, newValue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `oldValue` | `dynamic` | — |  |
| `newValue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L47)

<a id="function-function-mq3-qcommon-msg-msg-writedeltakey-function-msg-writedeltakey-msg-key-oldvalue-newvalue-bits-src-mq3-qcommon-msg-ml-294315209"></a>
### MSG_WriteDeltaKey

```ml
function MSG_WriteDeltaKey(msg, key, oldValue, newValue, bits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `oldValue` | `dynamic` | — |  |
| `newValue` | `dynamic` | — |  |
| `bits` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L49)

<a id="function-function-mq3-qcommon-msg-msg-writedeltakeyfloat-function-msg-writedeltakeyfloat-msg-key-oldvalue-newvalue-src-mq3-qcommon-msg-ml-2016875261"></a>
### MSG_WriteDeltaKeyFloat

```ml
function MSG_WriteDeltaKeyFloat(msg, key, oldValue, newValue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `oldValue` | `dynamic` | — |  |
| `newValue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L51)

<a id="function-function-mq3-qcommon-msg-msg-writedeltaplayerstate-function-msg-writedeltaplayerstate-msg-fromvalue-tovalue-src-mq3-qcommon-msg-ml-1009670308"></a>
### MSG_WriteDeltaPlayerstate

```ml
function MSG_WriteDeltaPlayerstate(msg, fromValue, toValue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `fromValue` | `dynamic` | — |  |
| `toValue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L60)

<a id="function-function-mq3-qcommon-msg-msg-writedeltausercmd-function-msg-writedeltausercmd-msg-fromvalue-tovalue-src-mq3-qcommon-msg-ml-669649790"></a>
### MSG_WriteDeltaUsercmd

```ml
function MSG_WriteDeltaUsercmd(msg, fromValue, toValue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `fromValue` | `dynamic` | — |  |
| `toValue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L53)

<a id="function-function-mq3-qcommon-msg-msg-writedeltausercmdkey-function-msg-writedeltausercmdkey-msg-key-fromvalue-tovalue-src-mq3-qcommon-msg-ml-598034301"></a>
### MSG_WriteDeltaUsercmdKey

```ml
function MSG_WriteDeltaUsercmdKey(msg, key, fromValue, toValue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `fromValue` | `dynamic` | — |  |
| `toValue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L55)

<a id="function-function-mq3-qcommon-msg-msg-writefloat-function-msg-writefloat-msg-value-src-mq3-qcommon-msg-ml-336867282"></a>
### MSG_WriteFloat

```ml
function MSG_WriteFloat(msg, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L29)

<a id="function-function-mq3-qcommon-msg-msg-writelong-function-msg-writelong-msg-value-src-mq3-qcommon-msg-ml-446486640"></a>
### MSG_WriteLong

```ml
function MSG_WriteLong(msg, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L28)

<a id="function-function-mq3-qcommon-msg-msg-writeshort-function-msg-writeshort-msg-value-src-mq3-qcommon-msg-ml-1103723722"></a>
### MSG_WriteShort

```ml
function MSG_WriteShort(msg, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L27)

<a id="function-function-mq3-qcommon-msg-msg-writestring-function-msg-writestring-msg-value-src-mq3-qcommon-msg-ml-1577332602"></a>
### MSG_WriteString

```ml
function MSG_WriteString(msg, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/qcommon/msg.ml#L30)

- [mq3.qcommon.msg.NUHuffman](Type-mq3-qcommon-msg-nuhuffman-45583967.md) — struct
