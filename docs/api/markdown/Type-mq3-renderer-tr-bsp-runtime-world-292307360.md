# `mq3.renderer.tr_bsp_runtime.World`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-bsp-runtime-ml-595364148.md)

<a id="struct-struct-mq3-renderer-tr-bsp-runtime-world-struct-world-src-mq3-renderer-tr-bsp-runtime-ml-1719563123"></a>
## World

```ml
struct World
```

Data record for `mq3.renderer.tr_bsp_runtime.World`; groups `name`, `baseName`, `map`, `shaders`, `lightmaps`, `planes`, and 11 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L151)

## Members

<a id="field-field-mq3-renderer-tr-bsp-runtime-world-basename-basename-src-mq3-renderer-tr-bsp-runtime-ml-811291913"></a>
### baseName

```ml
baseName
```

Map name with directory and extension removed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L155)

<a id="field-field-mq3-renderer-tr-bsp-runtime-world-datasize-datasize-src-mq3-renderer-tr-bsp-runtime-ml-942097651"></a>
### dataSize

```ml
dataSize
```

Size in bytes of the loaded model or world data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L185)

<a id="field-field-mq3-renderer-tr-bsp-runtime-world-entities-entities-src-mq3-renderer-tr-bsp-runtime-ml-1581940659"></a>
### entities

```ml
entities
```

Entity records associated with the current world, scene, or snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L177)

<a id="field-field-mq3-renderer-tr-bsp-runtime-world-entityparser-entityparser-src-mq3-renderer-tr-bsp-runtime-ml-1362505405"></a>
### entityParser

```ml
entityParser
```

Cursor used to read key/value entities from the BSP entity lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L179)

<a id="field-field-mq3-renderer-tr-bsp-runtime-world-flarecatalog-flarecatalog-src-mq3-renderer-tr-bsp-runtime-ml-345922463"></a>
### flareCatalog

```ml
flareCatalog
```

Map flares and the state required to render them.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L183)

<a id="field-field-mq3-renderer-tr-bsp-runtime-world-fogs-fogs-src-mq3-renderer-tr-bsp-runtime-ml-315700315"></a>
### fogs

```ml
fogs
```

Fog volumes loaded from the world map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L165)

<a id="field-field-mq3-renderer-tr-bsp-runtime-world-lightgrid-lightgrid-src-mq3-renderer-tr-bsp-runtime-ml-1958433533"></a>
### lightGrid

```ml
lightGrid
```

Baked lighting grid used to light dynamic entities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L181)

<a id="field-field-mq3-renderer-tr-bsp-runtime-world-lightmaps-lightmaps-src-mq3-renderer-tr-bsp-runtime-ml-210958645"></a>
### lightmaps

```ml
lightmaps
```

Baked lightmap images referenced by BSP surfaces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L161)

<a id="field-field-mq3-renderer-tr-bsp-runtime-world-map-map-src-mq3-renderer-tr-bsp-runtime-ml-265548153"></a>
### map

```ml
map
```

Parsed BSP map used by geometry, visibility, or lighting operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L157)

<a id="field-field-mq3-renderer-tr-bsp-runtime-world-marksurfaces-marksurfaces-src-mq3-renderer-tr-bsp-runtime-ml-1225121431"></a>
### marksurfaces

```ml
marksurfaces
```

Surface references associated with BSP leaves.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L169)

<a id="field-field-mq3-renderer-tr-bsp-runtime-world-models-models-src-mq3-renderer-tr-bsp-runtime-ml-1354604745"></a>
### models

```ml
models
```

Registered models or model parts available to the subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L173)

<a id="field-field-mq3-renderer-tr-bsp-runtime-world-name-name-src-mq3-renderer-tr-bsp-runtime-ml-1413780939"></a>
### name

```ml
name
```

Map resource name associated with the loaded BSP world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L153)

<a id="field-field-mq3-renderer-tr-bsp-runtime-world-nodes-nodes-src-mq3-renderer-tr-bsp-runtime-ml-1932062105"></a>
### nodes

```ml
nodes
```

Nodes and leaves of the BSP hierarchy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L171)

<a id="field-field-mq3-renderer-tr-bsp-runtime-world-planes-planes-src-mq3-renderer-tr-bsp-runtime-ml-160973563"></a>
### planes

```ml
planes
```

Planes defining BSP partitions or clipping boundaries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L163)

<a id="field-field-mq3-renderer-tr-bsp-runtime-world-shaders-shaders-src-mq3-renderer-tr-bsp-runtime-ml-1032438417"></a>
### shaders

```ml
shaders
```

Shader records available to resolve the queued drawing surfaces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L159)

<a id="field-field-mq3-renderer-tr-bsp-runtime-world-surfaces-surfaces-src-mq3-renderer-tr-bsp-runtime-ml-498949137"></a>
### surfaces

```ml
surfaces
```

Surface records owned by the world, model, or drawing group.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L167)

<a id="field-field-mq3-renderer-tr-bsp-runtime-world-visibility-visibility-src-mq3-renderer-tr-bsp-runtime-ml-1384560969"></a>
### visibility

```ml
visibility
```

Potentially-visible-cluster information loaded for the world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_bsp_runtime.ml#L175)
