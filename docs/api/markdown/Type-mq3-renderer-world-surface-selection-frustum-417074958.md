# `mq3.renderer.world_surface_selection.Frustum`

[Home](README.md) · [Source file](File-src-mq3-renderer-world-surface-selection-ml-1945526598.md)

<a id="struct-struct-mq3-renderer-world-surface-selection-frustum-struct-frustum-src-mq3-renderer-world-surface-selection-ml-396960949"></a>
## Frustum

```ml
struct Frustum
```

Data record for `mq3.renderer.world_surface_selection.Frustum`; groups `slopeX`, `slopeY`, `radiusScaleX`, `radiusScaleY`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L115)

## Members

<a id="field-field-mq3-renderer-world-surface-selection-frustum-radiusscalex-radiusscalex-src-mq3-renderer-world-surface-selection-ml-205747427"></a>
### radiusScaleX

```ml
radiusScaleX
```

Horizontal bound expansion used when testing spheres against the frustum.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L121)

<a id="field-field-mq3-renderer-world-surface-selection-frustum-radiusscaley-radiusscaley-src-mq3-renderer-world-surface-selection-ml-556097637"></a>
### radiusScaleY

```ml
radiusScaleY
```

Vertical bound expansion used when testing spheres against the frustum.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L123)

<a id="field-field-mq3-renderer-world-surface-selection-frustum-slopex-slopex-src-mq3-renderer-world-surface-selection-ml-324881661"></a>
### slopeX

```ml
slopeX
```

Horizontal frustum slope derived from the camera field of view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L117)

<a id="field-field-mq3-renderer-world-surface-selection-frustum-slopey-slopey-src-mq3-renderer-world-surface-selection-ml-394805255"></a>
### slopeY

```ml
slopeY
```

Vertical frustum slope derived from the camera field of view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L119)
