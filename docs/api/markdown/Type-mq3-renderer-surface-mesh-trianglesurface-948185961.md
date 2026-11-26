# `mq3.renderer.surface_mesh.TriangleSurface`

[Home](README.md) · [Source file](File-src-mq3-renderer-surface-mesh-ml-873120018.md)

<a id="struct-struct-mq3-renderer-surface-mesh-trianglesurface-struct-trianglesurface-src-mq3-renderer-surface-mesh-ml-1862188641"></a>
## TriangleSurface

```ml
struct TriangleSurface
```

Data record for `mq3.renderer.surface_mesh.TriangleSurface`; groups `verts`, `indexes`, `dlightBits`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_mesh.ml#L20)

## Members

<a id="field-field-mq3-renderer-surface-mesh-trianglesurface-dlightbits-dlightbits-src-mq3-renderer-surface-mesh-ml-1208737332"></a>
### dlightBits

```ml
dlightBits
```

Bit mask identifying dynamic lights that affect this surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_mesh.ml#L26)

<a id="field-field-mq3-renderer-surface-mesh-trianglesurface-indexes-indexes-src-mq3-renderer-surface-mesh-ml-561681580"></a>
### indexes

```ml
indexes
```

Source triangle index list referencing the static surface's vertex records.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_mesh.ml#L24)

<a id="field-field-mq3-renderer-surface-mesh-trianglesurface-verts-verts-src-mq3-renderer-surface-mesh-ml-1643168648"></a>
### verts

```ml
verts
```

Source vertex records referenced by the static triangle surface's index list.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_mesh.ml#L22)
