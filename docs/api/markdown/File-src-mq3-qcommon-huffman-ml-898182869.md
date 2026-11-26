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

Add ref in qcommon.huffman; updates `h.blocNode`, `h.tree`.

Direct state writes: `h.blocNode`, `h.tree`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `h` | `dynamic` | — | Record exposing `loc`, `blocNode`, `nodes`, `lhead`, `headValues`. Updated in place: `blocNode`, `tree`. |
| `ch` | `dynamic` | — | Zero-based index into `h.loc`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L161)

<a id="function-function-mq3-qcommon-huffman-bitlength-function-bitlength-h-ch-src-mq3-qcommon-huffman-ml-1171831483"></a>
### bitLength

```ml
function bitLength(h, ch)
```

Compute bit length in qcommon.huffman; the normal completion returns `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `h` | `dynamic` | — | Record exposing `loc`, `nodes`. |
| `ch` | `dynamic` | — | Zero-based index into `h.loc`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L229)

<a id="function-function-mq3-qcommon-huffman-blanknode-function-blanknode-src-mq3-qcommon-huffman-ml-1316198688"></a>
### blankNode

```ml
function blankNode()
```

Create `mq3.qcommon.huffman.Node` with code=0; weight=0; next=- 1; prev=- 1; parent=- 1; left=- 1; right=- 1; head=- 1.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L55)

<a id="function-function-mq3-qcommon-huffman-compresspacket-function-compresspacket-data-offset-src-mq3-qcommon-huffman-ml-810765335"></a>
### compressPacket

```ml
function compressPacket(data, offset)
```

Packet-level adaptive codec used by Huff_Compress/Huff_Decompress.  The first two bytes store the uncompressed length in network byte order; the bitstream starts at bit 16 and Baseq3 reserves one final padding byte.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `len(data)` and `(data == void)`. |
| `offset` | `dynamic` | — | Offset used in `(offset < 0)` and `(offset + index)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L325)

<a id="function-function-mq3-qcommon-huffman-decompresspacket-function-decompresspacket-data-offset-maxsize-src-mq3-qcommon-huffman-ml-12695628"></a>
### decompressPacket

```ml
function decompressPacket(data, offset, maxsize)
```

Decompress packet in qcommon.huffman; the normal completion returns `(slice(data, 0, offset) + decoded)`.

Validation failures include `huffman.decompressPacket: invalid input`; `huffman.decompressPacket: truncated length`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `len(data)` and `data[offset]`. |
| `offset` | `dynamic` | — | Zero-based index into `data`. |
| `maxsize` | `dynamic` | — | Maxsize used in `(maxsize < offset)` and `(maxsize - offset)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L342)

<a id="function-function-mq3-qcommon-huffman-freehead-function-freehead-h-slot-src-mq3-qcommon-huffman-ml-470661718"></a>
### freeHead

```ml
function freeHead(h, slot)
```

Update `h.freelist` in qcommon.huffman.

Direct state writes: `h.freelist`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `h` | `dynamic` | — | Record exposing `headValues`, `freelist`. Updated in place: `freelist`. |
| `slot` | `dynamic` | — | Slot operand used by `freeHead`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L82)

<a id="function-function-mq3-qcommon-huffman-getbit-function-getbit-data-offset-src-mq3-qcommon-huffman-ml-1304879247"></a>
### getBit

```ml
function getBit(data, offset)
```

Compute qcommon.huffman.getBit as `[((data[(offset >> 3)] >> (offset & 7)) & 1), (offset + 1)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `data[(offset >> 3)]` and `(data[(offset >> 3)] >> (offset & 7))`. |
| `offset` | `dynamic` | — | Offset used in `(offset & 7)` and `(offset + 1)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L213)

<a id="function-function-mq3-qcommon-huffman-getbitbounded-function-getbitbounded-data-offset-limit-src-mq3-qcommon-huffman-ml-678238548"></a>
### getBitBounded

```ml
function getBitBounded(data, offset, limit)
```

Get bit bounded in qcommon.huffman; the normal completion returns `[((data[(offset >> 3)] >> (offset & 7)) & 1), (offset + 1), true]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `len(data)` and `data[(offset >> 3)]`. |
| `offset` | `dynamic` | — | Offset used in `(offset & 7)` and `(offset + 1)`. |
| `limit` | `dynamic` | — | Limit used in `(offset >= limit)` and `((offset >= limit) or ((offset >> 3) >= len(data)))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L221)

<a id="function-function-mq3-qcommon-huffman-gethead-function-gethead-h-src-mq3-qcommon-huffman-ml-2141719334"></a>
### getHead

```ml
function getHead(h)
```

Get head in qcommon.huffman; the normal completion returns `slot`.

Direct state writes: `h.blocPtrs`, `h.freelist`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `h` | `dynamic` | — | Record exposing `freelist`, `blocPtrs`, `headValues`. Updated in place: `blocPtrs`, `freelist`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L70)

- [mq3.qcommon.huffman.Huff](Type-mq3-qcommon-huffman-huff-2035650852.md) — struct
<a id="function-function-mq3-qcommon-huffman-increment-function-increment-h-index-src-mq3-qcommon-huffman-ml-428186030"></a>
### increment

```ml
function increment(h, index)
```

Compute increment in qcommon.huffman.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `h` | `dynamic` | — | Record exposing `nodes`, `headValues`. |
| `index` | `dynamic` | — | B passed as `b` to `mq3.qcommon.huffman.swapTree`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L125)

<a id="function-function-mq3-qcommon-huffman-init-function-init-src-mq3-qcommon-huffman-ml-417605828"></a>
### init

```ml
function init()
```

Compute init in qcommon.huffman; the normal completion returns `Huff(nodes, loc, 0, 0, 0, 1, array(NODE_CAPACITY, - 1), 0, - 1)`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L60)

<a id="function-function-mq3-qcommon-huffman-initmessage-function-initmessage-src-mq3-qcommon-huffman-ml-1641784394"></a>
### initMessage

```ml
function initMessage()
```

Compute init message in qcommon.huffman; the normal completion returns `h`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L367)

<a id="function-function-mq3-qcommon-huffman-initmessagestatic-function-initmessagestatic-src-mq3-qcommon-huffman-ml-821505482"></a>
### initMessageStatic

```ml
function initMessageStatic()
```

Compute init message static in qcommon.huffman; the normal completion returns `Huff(nodes, loc, 2, 0, 0, 513, array(NODE_CAPACITY, - 1), 0, - 1)`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L377)

<a id="constant-constant-mq3-qcommon-huffman-internal-node-const-internal-node-257-src-mq3-qcommon-huffman-ml-2061811241"></a>
### INTERNAL_NODE

```ml
const INTERNAL_NODE = 257
```

Huffman symbol code reserved for an internal tree node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L8)

<a id="function-function-mq3-qcommon-huffman-messagefrequencies-function-messagefrequencies-src-mq3-qcommon-huffman-ml-1623016068"></a>
### messageFrequencies

```ml
function messageFrequencies()
```

Provide the message frequencies lookup table in qcommon.huffman.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L362)

- [mq3.qcommon.huffman.Node](Type-mq3-qcommon-huffman-node-1918665367.md) — struct
<a id="constant-constant-mq3-qcommon-huffman-node-capacity-const-node-capacity-768-src-mq3-qcommon-huffman-ml-1225617398"></a>
### NODE_CAPACITY

```ml
const NODE_CAPACITY = 768
```

Maximum number of nodes reserved for the adaptive Huffman tree.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L10)

<a id="constant-constant-mq3-qcommon-huffman-nyt-const-nyt-256-src-mq3-qcommon-huffman-ml-1151683912"></a>
### NYT

```ml
const NYT = 256
```

NYT = Not Yet Transmitted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L6)

<a id="function-function-mq3-qcommon-huffman-putbit-function-putbit-bit-data-offset-src-mq3-qcommon-huffman-ml-1073414330"></a>
### putBit

```ml
function putBit(bit, data, offset)
```

Update `data entries` in qcommon.huffman; the normal completion returns `(offset + 1)`.

Direct state writes: `data elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bit` | `dynamic` | — | Bit used in `(bit & 1)` and `((bit & 1) << (offset & 7))`. |
| `data` | `dynamic` | — | Mutable sequence written at `(offset >> 3)`. |
| `offset` | `dynamic` | — | Offset used in `(offset & 7)` and `(offset + 1)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L204)

<a id="function-function-mq3-qcommon-huffman-receive-function-receive-h-data-offset-src-mq3-qcommon-huffman-ml-816861415"></a>
### receive

```ml
function receive(h, data, offset)
```

Receive huffman in qcommon.huffman; the normal completion returns `[h.nodes[index].code, offset, true]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `h` | `dynamic` | — | Record exposing `tree`, `nodes`. |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.qcommon.huffman.getBit`. |
| `offset` | `dynamic` | — | Offset passed as `offset` to `mq3.qcommon.huffman.getBit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L264)

<a id="function-function-mq3-qcommon-huffman-receiveadaptive-function-receiveadaptive-h-data-offset-src-mq3-qcommon-huffman-ml-1000413251"></a>
### receiveAdaptive

```ml
function receiveAdaptive(h, data, offset)
```

Receive adaptive in qcommon.huffman; the normal completion returns `[ch, offset, true]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `h` | `dynamic` | — | H passed as `h` to `mq3.qcommon.huffman.receive`. |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.qcommon.huffman.receive`. |
| `offset` | `dynamic` | — | Offset passed as `offset` to `mq3.qcommon.huffman.receive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L310)

<a id="function-function-mq3-qcommon-huffman-receivebounded-function-receivebounded-h-data-offset-limit-src-mq3-qcommon-huffman-ml-1008160666"></a>
### receiveBounded

```ml
function receiveBounded(h, data, offset, limit)
```

Receive bounded in qcommon.huffman; the normal completion returns `[h.nodes[index].code, offset, true]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `h` | `dynamic` | — | Record exposing `tree`, `nodes`. |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.qcommon.huffman.getBitBounded`. |
| `offset` | `dynamic` | — | Offset passed as `offset` to `mq3.qcommon.huffman.getBitBounded`. |
| `limit` | `dynamic` | — | Limit passed as `limit` to `mq3.qcommon.huffman.getBitBounded`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L279)

<a id="function-function-mq3-qcommon-huffman-swaplist-function-swaplist-h-a-b-src-mq3-qcommon-huffman-ml-2137151349"></a>
### swapList

```ml
function swapList(h, a, b)
```

Compute swap list in qcommon.huffman.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `h` | `dynamic` | — | Record exposing `nodes`. |
| `a` | `dynamic` | — | Zero-based index into `h.nodes`. |
| `b` | `dynamic` | — | Zero-based index into `h.nodes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L110)

<a id="function-function-mq3-qcommon-huffman-swaptree-function-swaptree-h-a-b-src-mq3-qcommon-huffman-ml-1839515305"></a>
### swapTree

```ml
function swapTree(h, a, b)
```

Update `h.tree` in qcommon.huffman.

Direct state writes: `h.tree`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `h` | `dynamic` | — | Record exposing `nodes`. Updated in place: `tree`. |
| `a` | `dynamic` | — | Zero-based index into `h.nodes`. |
| `b` | `dynamic` | — | Zero-based index into `h.nodes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L92)

<a id="function-function-mq3-qcommon-huffman-transmit-function-transmit-h-ch-data-offset-src-mq3-qcommon-huffman-ml-1223004754"></a>
### transmit

```ml
function transmit(h, ch, data, offset)
```

Compute transmit in qcommon.huffman; the normal completion returns `offset`.

Validation failures include `huffman.transmit: unknown symbol`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `h` | `dynamic` | — | Record exposing `loc`, `nodes`. |
| `ch` | `dynamic` | — | Zero-based index into `h.loc`. |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.qcommon.huffman.putBit`. |
| `offset` | `dynamic` | — | Offset passed as `offset` to `mq3.qcommon.huffman.putBit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L244)

<a id="function-function-mq3-qcommon-huffman-transmitadaptive-function-transmitadaptive-h-ch-data-offset-src-mq3-qcommon-huffman-ml-782592538"></a>
### transmitAdaptive

```ml
function transmitAdaptive(h, ch, data, offset)
```

Compute transmit adaptive in qcommon.huffman; the normal completion returns `offset`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `h` | `dynamic` | — | Record exposing `loc`. |
| `ch` | `dynamic` | — | Ch passed as `ch` to `mq3.qcommon.huffman.transmit`. |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.qcommon.huffman.transmit`. |
| `offset` | `dynamic` | — | Offset passed as `offset` to `mq3.qcommon.huffman.transmit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L296)
