# `mq3.format.qfiles.Dnode`

[Home](README.md) · [Source file](File-src-mq3-format-qfiles-ml-1013095051.md)

<a id="struct-struct-mq3-format-qfiles-dnode-struct-dnode-src-mq3-format-qfiles-ml-1124126985"></a>
## Dnode

```ml
struct Dnode
```

Dnode record for format.qfiles, containing `planeNum`, `children`, `mins`, `maxs`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L484)

## Members

<a id="field-field-mq3-format-qfiles-dnode-children-children-src-mq3-format-qfiles-ml-344749215"></a>
### children

```ml
children
```

Child node indices, with negative values encoding minus one minus the BSP leaf index.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L488)

<a id="field-field-mq3-format-qfiles-dnode-maxs-maxs-src-mq3-format-qfiles-ml-263049355"></a>
### maxs

```ml
maxs
```

Maximum XYZ corner of the BSP subtree below this serialized node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L492)

<a id="field-field-mq3-format-qfiles-dnode-mins-mins-src-mq3-format-qfiles-ml-748313863"></a>
### mins

```ml
mins
```

Minimum XYZ corner of the BSP subtree below this serialized node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L490)

<a id="field-field-mq3-format-qfiles-dnode-planenum-planenum-src-mq3-format-qfiles-ml-1864317693"></a>
### planeNum

```ml
planeNum
```

BSP plane-lump index of the split represented by this serialized node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/format/qfiles.ml#L486)
