# `mq3.format.aas.Node`

[Home](README.md) · [Source file](File-src-mq3-format-aas-ml-835678928.md)

<a id="struct-struct-mq3-format-aas-node-struct-node-src-mq3-format-aas-ml-1368274207"></a>
## Node

```ml
struct Node
```

Node record for format.aas, containing `planeNum`, `children`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/aas.ml#L319)

## Members

<a id="field-field-mq3-format-aas-node-children-children-src-mq3-format-aas-ml-1696851203"></a>
### children

```ml
children
```

Child nodes of this node, or areas as leaves when negative.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/aas.ml#L323)

<a id="field-field-mq3-format-aas-node-planenum-planenum-src-mq3-format-aas-ml-1835606593"></a>
### planeNum

```ml
planeNum
```

AAS plane index dividing the child regions of this serialized node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/format/aas.ml#L321)
