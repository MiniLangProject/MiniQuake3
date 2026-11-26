# `mq3.renderer.world_surface_selection.Candidate`

[Home](README.md) · [Source file](File-src-mq3-renderer-world-surface-selection-ml-1945526598.md)

<a id="struct-struct-mq3-renderer-world-surface-selection-candidate-struct-candidate-src-mq3-renderer-world-surface-selection-ml-989781923"></a>
## Candidate

```ml
struct Candidate
```

Data record for `mq3.renderer.world_surface_selection.Candidate`; groups `faceIndex`, `triangleCount`, `distanceSquared`, `importance`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L70)

## Members

<a id="field-field-mq3-renderer-world-surface-selection-candidate-distancesquared-distancesquared-src-mq3-renderer-world-surface-selection-ml-1901376044"></a>
### distanceSquared

```ml
distanceSquared
```

Squared distance used for ordering or rejecting the candidate.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L76)

<a id="field-field-mq3-renderer-world-surface-selection-candidate-faceindex-faceindex-src-mq3-renderer-world-surface-selection-ml-879933192"></a>
### faceIndex

```ml
faceIndex
```

Index of the source BSP face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L72)

<a id="field-field-mq3-renderer-world-surface-selection-candidate-importance-importance-src-mq3-renderer-world-surface-selection-ml-2117090076"></a>
### importance

```ml
importance
```

Priority assigned to the surface when enforcing the triangle budget.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L78)

<a id="field-field-mq3-renderer-world-surface-selection-candidate-trianglecount-trianglecount-src-mq3-renderer-world-surface-selection-ml-254197404"></a>
### triangleCount

```ml
triangleCount
```

Number of triangles represented by this geometry or result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/world_surface_selection.ml#L74)
