# `mq3.qcommon.huffman.Node`

[Home](README.md) · [Source file](File-src-mq3-qcommon-huffman-ml-898182869.md)

<a id="struct-struct-mq3-qcommon-huffman-node-struct-node-src-mq3-qcommon-huffman-ml-188505737"></a>
## Node

```ml
struct Node
```

Node record for qcommon.huffman, containing `code`, `weight`, `next`, `prev`, `parent`, `left`, and 2 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L13)

## Members

<a id="field-field-mq3-qcommon-huffman-node-code-code-src-mq3-qcommon-huffman-ml-1274490479"></a>
### code

```ml
code
```

Symbol identifier or internal-node marker represented by this node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L15)

<a id="field-field-mq3-qcommon-huffman-node-head-head-src-mq3-qcommon-huffman-ml-2002769213"></a>
### head

```ml
head
```

Highest ranked node in block.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L29)

<a id="field-field-mq3-qcommon-huffman-node-left-left-src-mq3-qcommon-huffman-ml-57343603"></a>
### left

```ml
left
```

Index of the child selected by a zero bit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L25)

<a id="field-field-mq3-qcommon-huffman-node-next-next-src-mq3-qcommon-huffman-ml-1216785475"></a>
### next

```ml
next
```

Next node in the adaptive Huffman weight-order list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L19)

<a id="field-field-mq3-qcommon-huffman-node-parent-parent-src-mq3-qcommon-huffman-ml-1770627737"></a>
### parent

```ml
parent
```

Index of the parent Huffman tree node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L23)

<a id="field-field-mq3-qcommon-huffman-node-prev-prev-src-mq3-qcommon-huffman-ml-1617485275"></a>
### prev

```ml
prev
```

Previous node in the adaptive Huffman weight-order list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L21)

<a id="field-field-mq3-qcommon-huffman-node-right-right-src-mq3-qcommon-huffman-ml-745428569"></a>
### right

```ml
right
```

Index of the child selected by a one bit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L27)

<a id="field-field-mq3-qcommon-huffman-node-weight-weight-src-mq3-qcommon-huffman-ml-937712713"></a>
### weight

```ml
weight
```

Occurrence count used to order nodes in the adaptive Huffman tree.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/huffman.ml#L17)
