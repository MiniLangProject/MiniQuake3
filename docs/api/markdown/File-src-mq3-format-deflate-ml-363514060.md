# `src/mq3/format/deflate.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.format.deflate`](Package-mq3-format-deflate-451884264.md)

Reachable from entry: **yes**

## Declarations

- [mq3.format.deflate.Bits](Type-mq3-format-deflate-bits-2050002282.md) — struct
<a id="function-function-mq3-format-deflate-buildprefix-function-buildprefix-counts-symbols-src-mq3-format-deflate-ml-999937985"></a>
### buildPrefix

```ml
function buildPrefix(counts, symbols)
```

Short canonical codes have one entry at every possible eight-bit suffix. DEFLATE transmits their high bit first inside the low-bit-first byte stream.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `counts` | `dynamic` | — | Counts used in `counts[width]`. |
| `symbols` | `dynamic` | — | Symbols used in `symbols[(index + offset)]` and `(symbols[(index + offset)] << 4)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/deflate.ml#L55)

<a id="function-function-mq3-format-deflate-decodesymbol-function-decodesymbol-reader-codes-src-mq3-format-deflate-ml-784818855"></a>
### decodeSymbol

```ml
function decodeSymbol(reader, codes)
```

Decode symbol in format.deflate; the normal completion returns `fail("invalid Huffman code")`.

Direct state writes: `reader.value`, `reader.available`, `reader.offset`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Record exposing `available`, `value`, `offset`, `data`. Updated in place: `value`, `available`, `offset`. |
| `codes` | `dynamic` | — | Record exposing `prefix`, `counts`, `symbols`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/deflate.ml#L113)

<a id="function-function-mq3-format-deflate-dynamictrees-function-dynamictrees-reader-src-mq3-format-deflate-ml-1383757355"></a>
### dynamicTrees

```ml
function dynamicTrees(reader)
```

Compute dynamic trees in format.deflate; the normal completion returns `[tree(literals), tree(distances)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — | Reader passed as `reader` to `mq3.format.deflate.readBits`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/deflate.ml#L162)

<a id="function-function-mq3-format-deflate-fail-function-fail-message-src-mq3-format-deflate-ml-293057215"></a>
### fail

```ml
function fail(message)
```

Create the format.deflate error for `fail` with 3500 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("DEFLATE: " + message)` and `error(3500, ("DEFLATE: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/deflate.ml#L29)

<a id="function-function-mq3-format-deflate-fixedtrees-function-fixedtrees-src-mq3-format-deflate-ml-1262350762"></a>
### fixedTrees

```ml
function fixedTrees()
```

Compute fixed trees in format.deflate; the normal completion returns `[tree(lengths), tree(array(32, 5))]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/deflate.ml#L149)

- [mq3.format.deflate.Huffman](Type-mq3-format-deflate-huffman-1324627979.md) — struct
<a id="function-function-mq3-format-deflate-inflate-function-inflate-data-expectedsize-src-mq3-format-deflate-ml-1726441759"></a>
### inflate

```ml
function inflate(data, expectedSize)
```

Compute inflate in format.deflate; the normal completion returns `output`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Initial `data` field stored in the returned or constructed `mq3.format.deflate.Bits` record. |
| `expectedSize` | `dynamic` | — | Expected size used in `(expectedSize < 0)` and `bytes(expectedSize, 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/deflate.ml#L211)

<a id="function-function-mq3-format-deflate-readbits-function-readbits-reader-as-bits-count-as-int-src-mq3-format-deflate-ml-395759967"></a>
### readBits

```ml
function readBits(reader as Bits, count as int)
```

Read bits in format.deflate; the normal completion returns `result`.

Direct state writes: `reader.value`, `reader.available`, `reader.offset`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `Bits` | — | Record exposing `available`, `offset`, `data`, `value`. Updated in place: `value`, `available`, `offset`. |
| `count` | `int` | — | Count used in `(1 << count)` and `((1 << count) - 1)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/deflate.ml#L38)

<a id="function-function-mq3-format-deflate-tree-function-tree-lengths-src-mq3-format-deflate-ml-524636917"></a>
### tree

```ml
function tree(lengths)
```

Compute tree in format.deflate; the normal completion returns `Huffman(counts, symbols, buildPrefix(counts, symbols))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `lengths` | `dynamic` | — | Lengths used in `len(lengths)` and `lengths[sym]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/deflate.ml#L82)
