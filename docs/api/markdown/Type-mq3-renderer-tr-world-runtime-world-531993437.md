# `mq3.renderer.tr_world_runtime.World`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-world-runtime-ml-1466231431.md)

<a id="struct-struct-mq3-renderer-tr-world-runtime-world-struct-world-src-mq3-renderer-tr-world-runtime-ml-477318749"></a>
## World

```ml
struct World
```

Data record for `mq3.renderer.tr_world_runtime.World`; groups `nodes`, `planes`, `surfaces`, `vis`, `novis`, `numClusters`, and 3 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L83)

## Members

<a id="field-field-mq3-renderer-tr-world-runtime-world-clusterbytes-clusterbytes-src-mq3-renderer-tr-world-runtime-ml-2140120895"></a>
### clusterBytes

```ml
clusterBytes
```

Number of bytes in one potentially-visible-cluster bitset.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L97)

<a id="field-field-mq3-renderer-tr-world-runtime-world-nodes-nodes-src-mq3-renderer-tr-world-runtime-ml-1641774349"></a>
### nodes

```ml
nodes
```

Nodes and leaves of the BSP hierarchy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L85)

<a id="field-field-mq3-renderer-tr-world-runtime-world-novis-novis-src-mq3-renderer-tr-world-runtime-ml-236017485"></a>
### novis

```ml
novis
```

Fallback visibility mask used when no valid PVS data is available.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L93)

<a id="field-field-mq3-renderer-tr-world-runtime-world-numclusters-numclusters-src-mq3-renderer-tr-world-runtime-ml-2103449217"></a>
### numClusters

```ml
numClusters
```

Number of clusters represented by the visibility table.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L95)

<a id="field-field-mq3-renderer-tr-world-runtime-world-planes-planes-src-mq3-renderer-tr-world-runtime-ml-200261595"></a>
### planes

```ml
planes
```

Planes defining BSP partitions or clipping boundaries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L87)

<a id="field-field-mq3-renderer-tr-world-runtime-world-surfaces-surfaces-src-mq3-renderer-tr-world-runtime-ml-411977317"></a>
### surfaces

```ml
surfaces
```

Surface records owned by the world, model, or drawing group.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L89)

<a id="field-field-mq3-renderer-tr-world-runtime-world-viewcluster-viewcluster-src-mq3-renderer-tr-world-runtime-ml-1274992153"></a>
### viewCluster

```ml
viewCluster
```

Visibility cluster used by the current world view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L101)

<a id="field-field-mq3-renderer-tr-world-runtime-world-vis-vis-src-mq3-renderer-tr-world-runtime-ml-622753117"></a>
### vis

```ml
vis
```

Packed potentially-visible-cluster data for the world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L91)

<a id="field-field-mq3-renderer-tr-world-runtime-world-viscount-viscount-src-mq3-renderer-tr-world-runtime-ml-308421055"></a>
### visCount

```ml
visCount
```

Current visibility-marking generation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L99)
