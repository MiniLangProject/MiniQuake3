# `mq3.renderer.world_surface_selection.Selection`

[Home](README.md) · [Source file](File-src-mq3-renderer-world-surface-selection-ml-1945526598.md)

<a id="struct-struct-mq3-renderer-world-surface-selection-selection-struct-selection-src-mq3-renderer-world-surface-selection-ml-365679549"></a>
## Selection

```ml
struct Selection
```

Data record for `mq3.renderer.world_surface_selection.Selection`; groups `faceIndexes`, `candidateCount`, `selectedSurfaceCount`, `estimatedTriangleCount`, `pvsUsed`, `cameraLeaf`, and 6 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L81)

## Members

<a id="field-field-mq3-renderer-world-surface-selection-selection-cameracluster-cameracluster-src-mq3-renderer-world-surface-selection-ml-1261430667"></a>
### cameraCluster

```ml
cameraCluster
```

Visibility cluster containing the camera position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L95)

<a id="field-field-mq3-renderer-world-surface-selection-selection-cameraleaf-cameraleaf-src-mq3-renderer-world-surface-selection-ml-1597078805"></a>
### cameraLeaf

```ml
cameraLeaf
```

BSP leaf containing the camera position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L93)

<a id="field-field-mq3-renderer-world-surface-selection-selection-candidatecount-candidatecount-src-mq3-renderer-world-surface-selection-ml-255671027"></a>
### candidateCount

```ml
candidateCount
```

Number of surfaces considered by the selection pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L85)

<a id="field-field-mq3-renderer-world-surface-selection-selection-estimatedtrianglecount-estimatedtrianglecount-src-mq3-renderer-world-surface-selection-ml-242681873"></a>
### estimatedTriangleCount

```ml
estimatedTriangleCount
```

Estimated number of triangles emitted by the selected surfaces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L89)

<a id="field-field-mq3-renderer-world-surface-selection-selection-faceindexes-faceindexes-src-mq3-renderer-world-surface-selection-ml-403717547"></a>
### faceIndexes

```ml
faceIndexes
```

Indices of BSP faces retained by the current selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L83)

<a id="field-field-mq3-renderer-world-surface-selection-selection-pvsused-pvsused-src-mq3-renderer-world-surface-selection-ml-1861885739"></a>
### pvsUsed

```ml
pvsUsed
```

Whether the selection used BSP potentially-visible-set data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L91)

<a id="field-field-mq3-renderer-world-surface-selection-selection-rejectedbackface-rejectedbackface-src-mq3-renderer-world-surface-selection-ml-336131031"></a>
### rejectedBackface

```ml
rejectedBackface
```

Number of candidates rejected by back-face culling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L101)

<a id="field-field-mq3-renderer-world-surface-selection-selection-rejectedbudget-rejectedbudget-src-mq3-renderer-world-surface-selection-ml-966472405"></a>
### rejectedBudget

```ml
rejectedBudget
```

Number of candidates rejected by the triangle budget.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L105)

<a id="field-field-mq3-renderer-world-surface-selection-selection-rejecteddistance-rejecteddistance-src-mq3-renderer-world-surface-selection-ml-2055280341"></a>
### rejectedDistance

```ml
rejectedDistance
```

Number of candidates rejected by distance limits.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L103)

<a id="field-field-mq3-renderer-world-surface-selection-selection-rejectedfrustum-rejectedfrustum-src-mq3-renderer-world-surface-selection-ml-572790811"></a>
### rejectedFrustum

```ml
rejectedFrustum
```

Number of candidates rejected by the camera frustum.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L99)

<a id="field-field-mq3-renderer-world-surface-selection-selection-rejectedpvs-rejectedpvs-src-mq3-renderer-world-surface-selection-ml-1881328435"></a>
### rejectedPvs

```ml
rejectedPvs
```

Number of candidates rejected by the potentially-visible-set mask.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L97)

<a id="field-field-mq3-renderer-world-surface-selection-selection-selectedsurfacecount-selectedsurfacecount-src-mq3-renderer-world-surface-selection-ml-19886813"></a>
### selectedSurfaceCount

```ml
selectedSurfaceCount
```

Number of surfaces retained by the selection pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L87)
