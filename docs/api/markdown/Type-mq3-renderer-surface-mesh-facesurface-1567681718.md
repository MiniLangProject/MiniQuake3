# `mq3.renderer.surface_mesh.FaceSurface`

[Home](README.md) · [Source file](File-src-mq3-renderer-surface-mesh-ml-873120018.md)

<a id="struct-struct-mq3-renderer-surface-mesh-facesurface-struct-facesurface-src-mq3-renderer-surface-mesh-ml-1595791603"></a>
## FaceSurface

```ml
struct FaceSurface
```

Data record for `mq3.renderer.surface_mesh.FaceSurface`; groups `normal`, `points`, `indexes`, `dlightBits`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_mesh.ml#L29)

## Members

<a id="field-field-mq3-renderer-surface-mesh-facesurface-dlightbits-dlightbits-src-mq3-renderer-surface-mesh-ml-370499805"></a>
### dlightBits

```ml
dlightBits
```

Bit mask identifying dynamic lights that affect this surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_mesh.ml#L37)

<a id="field-field-mq3-renderer-surface-mesh-facesurface-indexes-indexes-src-mq3-renderer-surface-mesh-ml-1703149093"></a>
### indexes

```ml
indexes
```

Triangle index list defining the planar face's polygon tessellation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_mesh.ml#L35)

<a id="field-field-mq3-renderer-surface-mesh-facesurface-normal-normal-src-mq3-renderer-surface-mesh-ml-302969583"></a>
### normal

```ml
normal
```

Plane normal shared by the vertices of this planar face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_mesh.ml#L31)

<a id="field-field-mq3-renderer-surface-mesh-facesurface-points-points-src-mq3-renderer-surface-mesh-ml-1233188127"></a>
### points

```ml
points
```

Points defining the face, polygon, or clipping result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_mesh.ml#L33)
