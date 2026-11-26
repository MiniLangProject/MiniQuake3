# `mq3.renderer.tr_bsp_runtime.Node`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-bsp-runtime-ml-595364148.md)

<a id="struct-struct-mq3-renderer-tr-bsp-runtime-node-struct-node-src-mq3-renderer-tr-bsp-runtime-ml-736871305"></a>
## Node

```ml
struct Node
```

Data record for `mq3.renderer.tr_bsp_runtime.Node`; groups `index`, `planeIndex`, `children`, `mins`, `maxs`, `parent`, and 5 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L92)

## Members

<a id="field-field-mq3-renderer-tr-bsp-runtime-node-area-area-src-mq3-renderer-tr-bsp-runtime-ml-1383408651"></a>
### area

```ml
area
```

BSP area number used by area-visibility masking.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L110)

<a id="field-field-mq3-renderer-tr-bsp-runtime-node-children-children-src-mq3-renderer-tr-bsp-runtime-ml-1239494339"></a>
### children

```ml
children
```

Child node or leaf references of the BSP partition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L98)

<a id="field-field-mq3-renderer-tr-bsp-runtime-node-cluster-cluster-src-mq3-renderer-tr-bsp-runtime-ml-553115337"></a>
### cluster

```ml
cluster
```

Visibility cluster containing the BSP leaf.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L108)

<a id="field-field-mq3-renderer-tr-bsp-runtime-node-contents-contents-src-mq3-renderer-tr-bsp-runtime-ml-1172705017"></a>
### contents

```ml
contents
```

BSP node marker or collision-content bits for this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L106)

<a id="field-field-mq3-renderer-tr-bsp-runtime-node-firstmarksurface-firstmarksurface-src-mq3-renderer-tr-bsp-runtime-ml-1263081657"></a>
### firstMarkSurface

```ml
firstMarkSurface
```

First referenced surface in the leaf's marksurface list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L112)

<a id="field-field-mq3-renderer-tr-bsp-runtime-node-index-index-src-mq3-renderer-tr-bsp-runtime-ml-2066146109"></a>
### index

```ml
index
```

Position of this record in its owning table or list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L94)

<a id="field-field-mq3-renderer-tr-bsp-runtime-node-maxs-maxs-src-mq3-renderer-tr-bsp-runtime-ml-677240567"></a>
### maxs

```ml
maxs
```

Maximum horizontal texture coordinate reached on the clipped sky face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L102)

<a id="field-field-mq3-renderer-tr-bsp-runtime-node-mins-mins-src-mq3-renderer-tr-bsp-runtime-ml-1958124095"></a>
### mins

```ml
mins
```

Minimum horizontal texture coordinate reached on the clipped sky face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L100)

<a id="field-field-mq3-renderer-tr-bsp-runtime-node-nummarksurfaces-nummarksurfaces-src-mq3-renderer-tr-bsp-runtime-ml-1371816341"></a>
### numMarkSurfaces

```ml
numMarkSurfaces
```

Number of surface references associated with the BSP leaf.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L114)

<a id="field-field-mq3-renderer-tr-bsp-runtime-node-parent-parent-src-mq3-renderer-tr-bsp-runtime-ml-1748079333"></a>
### parent

```ml
parent
```

Parent node in the BSP hierarchy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L104)

<a id="field-field-mq3-renderer-tr-bsp-runtime-node-planeindex-planeindex-src-mq3-renderer-tr-bsp-runtime-ml-886544537"></a>
### planeIndex

```ml
planeIndex
```

Index of the splitting plane associated with the BSP node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_bsp_runtime.ml#L96)
