# `mq3.qcommon.huffman.Huff`

[Home](README.md) · [Source file](File-src-mq3-qcommon-huffman-ml-898182869.md)

<a id="struct-struct-mq3-qcommon-huffman-huff-struct-huff-src-mq3-qcommon-huffman-ml-457165341"></a>
## Huff

```ml
struct Huff
```

Huff record for qcommon.huffman, containing `nodes`, `loc`, `tree`, `lhead`, `ltail`, `blocNode`, and 3 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L33)

## Members

<a id="field-field-mq3-qcommon-huffman-huff-blocnode-blocnode-src-mq3-qcommon-huffman-ml-1715522168"></a>
### blocNode

```ml
blocNode
```

Next unused slot in the fixed node pool.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L45)

<a id="field-field-mq3-qcommon-huffman-huff-blocptrs-blocptrs-src-mq3-qcommon-huffman-ml-1833152602"></a>
### blocPtrs

```ml
blocPtrs
```

Next unused slot in the weight-group pointer pool.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L49)

<a id="field-field-mq3-qcommon-huffman-huff-freelist-freelist-src-mq3-qcommon-huffman-ml-389810560"></a>
### freelist

```ml
freelist
```

Reusable slots in the weight-group pointer pool.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L51)

<a id="field-field-mq3-qcommon-huffman-huff-headvalues-headvalues-src-mq3-qcommon-huffman-ml-854981692"></a>
### headValues

```ml
headValues
```

Head-node references for groups of equal Huffman weight.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L47)

<a id="field-field-mq3-qcommon-huffman-huff-lhead-lhead-src-mq3-qcommon-huffman-ml-1073988464"></a>
### lhead

```ml
lhead
```

First node in the Huffman weight-order list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L41)

<a id="field-field-mq3-qcommon-huffman-huff-loc-loc-src-mq3-qcommon-huffman-ml-912979240"></a>
### loc

```ml
loc
```

Lookup table from byte symbols to their current tree nodes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L37)

<a id="field-field-mq3-qcommon-huffman-huff-ltail-ltail-src-mq3-qcommon-huffman-ml-244095760"></a>
### ltail

```ml
ltail
```

Last node in the Huffman weight-order list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L43)

<a id="field-field-mq3-qcommon-huffman-huff-nodes-nodes-src-mq3-qcommon-huffman-ml-1807401136"></a>
### nodes

```ml
nodes
```

BSP nodes used to partition the collision or navigation world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L35)

<a id="field-field-mq3-qcommon-huffman-huff-tree-tree-src-mq3-qcommon-huffman-ml-1606710864"></a>
### tree

```ml
tree
```

Index of the root of the adaptive Huffman tree.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L39)
