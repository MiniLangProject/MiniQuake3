# `src/mq3/qcommon/huffman.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.qcommon.huffman`](Package-mq3-qcommon-huffman-383710499.md)

Reachable from entry: **yes**

## Declarations

<a id="function-function-mq3-qcommon-huffman-addref-function-addref-h-ch-src-mq3-qcommon-huffman-ml-891948613"></a>
### addRef

```ml
function addRef(h, ch)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `h` | `dynamic` | — |  |
| `ch` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/huffman.ml#L110)

<a id="function-function-mq3-qcommon-huffman-bitlength-function-bitlength-h-ch-src-mq3-qcommon-huffman-ml-1171831483"></a>
### bitLength

```ml
function bitLength(h, ch)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `h` | `dynamic` | — |  |
| `ch` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/huffman.ml#L162)

<a id="function-function-mq3-qcommon-huffman-blanknode-function-blanknode-src-mq3-qcommon-huffman-ml-1316198688"></a>
### blankNode

```ml
function blankNode()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/huffman.ml#L32)

<a id="function-function-mq3-qcommon-huffman-compresspacket-function-compresspacket-data-offset-src-mq3-qcommon-huffman-ml-810765335"></a>
### compressPacket

```ml
function compressPacket(data, offset)
```

Packet-level adaptive codec used by Huff_Compress/Huff_Decompress.  The first two bytes store the uncompressed length in network byte order; the bitstream starts at bit 16 and Baseq3 reserves one final padding byte.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/huffman.ml#L231)

<a id="function-function-mq3-qcommon-huffman-decompresspacket-function-decompresspacket-data-offset-maxsize-src-mq3-qcommon-huffman-ml-12695628"></a>
### decompressPacket

```ml
function decompressPacket(data, offset, maxsize)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `maxsize` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/huffman.ml#L242)

<a id="function-function-mq3-qcommon-huffman-freehead-function-freehead-h-slot-src-mq3-qcommon-huffman-ml-470661718"></a>
### freeHead

```ml
function freeHead(h, slot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `h` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/huffman.ml#L49)

<a id="function-function-mq3-qcommon-huffman-getbit-function-getbit-data-offset-src-mq3-qcommon-huffman-ml-1304879247"></a>
### getBit

```ml
function getBit(data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/huffman.ml#L153)

<a id="function-function-mq3-qcommon-huffman-getbitbounded-function-getbitbounded-data-offset-limit-src-mq3-qcommon-huffman-ml-678238548"></a>
### getBitBounded

```ml
function getBitBounded(data, offset, limit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `limit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/huffman.ml#L157)

<a id="function-function-mq3-qcommon-huffman-gethead-function-gethead-h-src-mq3-qcommon-huffman-ml-2141719334"></a>
### getHead

```ml
function getHead(h)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `h` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/huffman.ml#L42)

- [mq3.qcommon.huffman.Huff](Type-mq3-qcommon-huffman-huff-2035650852.md) — struct
<a id="function-function-mq3-qcommon-huffman-increment-function-increment-h-index-src-mq3-qcommon-huffman-ml-428186030"></a>
### increment

```ml
function increment(h, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `h` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/huffman.ml#L79)

<a id="function-function-mq3-qcommon-huffman-init-function-init-src-mq3-qcommon-huffman-ml-417605828"></a>
### init

```ml
function init()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/huffman.ml#L36)

<a id="function-function-mq3-qcommon-huffman-initmessage-function-initmessage-src-mq3-qcommon-huffman-ml-1641784394"></a>
### initMessage

```ml
function initMessage()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/huffman.ml#L265)

<a id="function-function-mq3-qcommon-huffman-initmessagestatic-function-initmessagestatic-src-mq3-qcommon-huffman-ml-821505482"></a>
### initMessageStatic

```ml
function initMessageStatic()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/huffman.ml#L274)

<a id="constant-constant-mq3-qcommon-huffman-internal-node-const-internal-node-257-src-mq3-qcommon-huffman-ml-2061811241"></a>
### INTERNAL_NODE

```ml
const INTERNAL_NODE = 257
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/huffman.ml#L6)

<a id="function-function-mq3-qcommon-huffman-messagefrequencies-function-messagefrequencies-src-mq3-qcommon-huffman-ml-1623016068"></a>
### messageFrequencies

```ml
function messageFrequencies()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/huffman.ml#L261)

- [mq3.qcommon.huffman.Node](Type-mq3-qcommon-huffman-node-1918665367.md) — struct
<a id="constant-constant-mq3-qcommon-huffman-node-capacity-const-node-capacity-768-src-mq3-qcommon-huffman-ml-1225617398"></a>
### NODE_CAPACITY

```ml
const NODE_CAPACITY = 768
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/huffman.ml#L7)

<a id="constant-constant-mq3-qcommon-huffman-nyt-const-nyt-256-src-mq3-qcommon-huffman-ml-1151683912"></a>
### NYT

```ml
const NYT = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/huffman.ml#L5)

<a id="function-function-mq3-qcommon-huffman-putbit-function-putbit-bit-data-offset-src-mq3-qcommon-huffman-ml-1073414330"></a>
### putBit

```ml
function putBit(bit, data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bit` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/huffman.ml#L147)

<a id="function-function-mq3-qcommon-huffman-receive-function-receive-h-data-offset-src-mq3-qcommon-huffman-ml-816861415"></a>
### receive

```ml
function receive(h, data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `h` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/huffman.ml#L186)

<a id="function-function-mq3-qcommon-huffman-receiveadaptive-function-receiveadaptive-h-data-offset-src-mq3-qcommon-huffman-ml-1000413251"></a>
### receiveAdaptive

```ml
function receiveAdaptive(h, data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `h` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/huffman.ml#L218)

<a id="function-function-mq3-qcommon-huffman-receivebounded-function-receivebounded-h-data-offset-limit-src-mq3-qcommon-huffman-ml-1008160666"></a>
### receiveBounded

```ml
function receiveBounded(h, data, offset, limit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `h` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `limit` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/huffman.ml#L196)

<a id="function-function-mq3-qcommon-huffman-swaplist-function-swaplist-h-a-b-src-mq3-qcommon-huffman-ml-2137151349"></a>
### swapList

```ml
function swapList(h, a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `h` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/huffman.ml#L67)

<a id="function-function-mq3-qcommon-huffman-swaptree-function-swaptree-h-a-b-src-mq3-qcommon-huffman-ml-1839515305"></a>
### swapTree

```ml
function swapTree(h, a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `h` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/huffman.ml#L53)

<a id="function-function-mq3-qcommon-huffman-transmit-function-transmit-h-ch-data-offset-src-mq3-qcommon-huffman-ml-1223004754"></a>
### transmit

```ml
function transmit(h, ch, data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `h` | `dynamic` | — |  |
| `ch` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/huffman.ml#L170)

<a id="function-function-mq3-qcommon-huffman-transmitadaptive-function-transmitadaptive-h-ch-data-offset-src-mq3-qcommon-huffman-ml-782592538"></a>
### transmitAdaptive

```ml
function transmitAdaptive(h, ch, data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `h` | `dynamic` | — |  |
| `ch` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/qcommon/huffman.ml#L208)
