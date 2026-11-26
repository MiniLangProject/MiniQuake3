# `mq3.renderer.tr_world_runtime.Node`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-world-runtime-ml-1466231431.md)

<a id="struct-struct-mq3-renderer-tr-world-runtime-node-struct-node-src-mq3-renderer-tr-world-runtime-ml-1940072735"></a>
## Node

```ml
struct Node
```

Data record for `mq3.renderer.tr_world_runtime.Node`; groups `contents`, `mins`, `maxs`, `plane`, `children`, `parent`, and 4 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_world_runtime.ml#L60)

## Members

<a id="field-field-mq3-renderer-tr-world-runtime-node-area-area-src-mq3-renderer-tr-world-runtime-ml-1536292273"></a>
### area

```ml
area
```

BSP area number used when applying area-visibility masking.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_world_runtime.ml#L76)

<a id="field-field-mq3-renderer-tr-world-runtime-node-children-children-src-mq3-renderer-tr-world-runtime-ml-348801913"></a>
### children

```ml
children
```

Child node or leaf references of the BSP partition.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_world_runtime.ml#L70)

<a id="field-field-mq3-renderer-tr-world-runtime-node-cluster-cluster-src-mq3-renderer-tr-world-runtime-ml-904939863"></a>
### cluster

```ml
cluster
```

Visibility cluster containing the BSP leaf.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_world_runtime.ml#L74)

<a id="field-field-mq3-renderer-tr-world-runtime-node-contents-contents-src-mq3-renderer-tr-world-runtime-ml-1085670327"></a>
### contents

```ml
contents
```

BSP node marker or collision-content bits for this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_world_runtime.ml#L62)

<a id="field-field-mq3-renderer-tr-world-runtime-node-marks-marks-src-mq3-renderer-tr-world-runtime-ml-1666850359"></a>
### marks

```ml
marks
```

Surface references associated with the BSP leaf.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_world_runtime.ml#L78)

<a id="field-field-mq3-renderer-tr-world-runtime-node-maxs-maxs-src-mq3-renderer-tr-world-runtime-ml-21362485"></a>
### maxs

```ml
maxs
```

Maximum horizontal texture coordinate reached on the clipped sky face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_world_runtime.ml#L66)

<a id="field-field-mq3-renderer-tr-world-runtime-node-mins-mins-src-mq3-renderer-tr-world-runtime-ml-750372017"></a>
### mins

```ml
mins
```

Minimum horizontal texture coordinate reached on the clipped sky face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_world_runtime.ml#L64)

<a id="field-field-mq3-renderer-tr-world-runtime-node-parent-parent-src-mq3-renderer-tr-world-runtime-ml-177800023"></a>
### parent

```ml
parent
```

Parent node in the BSP hierarchy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_world_runtime.ml#L72)

<a id="field-field-mq3-renderer-tr-world-runtime-node-plane-plane-src-mq3-renderer-tr-world-runtime-ml-701504407"></a>
### plane

```ml
plane
```

Splitting or clipping plane associated with the BSP node or surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_world_runtime.ml#L68)

<a id="field-field-mq3-renderer-tr-world-runtime-node-visframe-visframe-src-mq3-renderer-tr-world-runtime-ml-1471648825"></a>
### visframe

```ml
visframe
```

Visibility generation in which the BSP node was marked visible.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_world_runtime.ml#L80)
