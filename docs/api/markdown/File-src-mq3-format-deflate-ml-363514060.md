# `src/mq3/format/deflate.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.format.deflate`](Package-mq3-format-deflate-451884264.md)

Reachable from entry: **yes**

## Declarations

- [mq3.format.deflate.Bits](Type-mq3-format-deflate-bits-2050002282.md) — struct
<a id="function-function-mq3-format-deflate-decodesymbol-function-decodesymbol-reader-codes-src-mq3-format-deflate-ml-784818855"></a>
### decodeSymbol

```ml
function decodeSymbol(reader, codes)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |
| `codes` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/deflate.ml#L60)

<a id="function-function-mq3-format-deflate-dynamictrees-function-dynamictrees-reader-src-mq3-format-deflate-ml-1383757355"></a>
### dynamicTrees

```ml
function dynamicTrees(reader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/deflate.ml#L86)

<a id="function-function-mq3-format-deflate-fail-function-fail-message-src-mq3-format-deflate-ml-293057215"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/deflate.ml#L17)

<a id="function-function-mq3-format-deflate-fixedtrees-function-fixedtrees-src-mq3-format-deflate-ml-1262350762"></a>
### fixedTrees

```ml
function fixedTrees()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/deflate.ml#L75)

- [mq3.format.deflate.Huffman](Type-mq3-format-deflate-huffman-1324627979.md) — struct
<a id="function-function-mq3-format-deflate-inflate-function-inflate-data-expectedsize-src-mq3-format-deflate-ml-1726441759"></a>
### inflate

```ml
function inflate(data, expectedSize)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `expectedSize` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/deflate.ml#L132)

<a id="function-function-mq3-format-deflate-readbits-function-readbits-reader-count-src-mq3-format-deflate-ml-750129564"></a>
### readBits

```ml
function readBits(reader, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reader` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/deflate.ml#L21)

<a id="function-function-mq3-format-deflate-tree-function-tree-lengths-src-mq3-format-deflate-ml-524636917"></a>
### tree

```ml
function tree(lengths)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `lengths` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/format/deflate.ml#L34)
