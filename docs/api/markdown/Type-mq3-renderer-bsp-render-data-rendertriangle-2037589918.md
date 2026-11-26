# `mq3.renderer.bsp_render_data.RenderTriangle`

[Home](README.md) · [Source file](File-src-mq3-renderer-bsp-render-data-ml-926244912.md)

<a id="struct-struct-mq3-renderer-bsp-render-data-rendertriangle-struct-rendertriangle-src-mq3-renderer-bsp-render-data-ml-1744257471"></a>
## RenderTriangle

```ml
struct RenderTriangle
```

Data record for `mq3.renderer.bsp_render_data.RenderTriangle`; groups `vertices`, `textureIndex`, `lightmapIndex`, `fogIndex`, `faceIndex`, `triangleIndex`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L53)

## Members

<a id="field-field-mq3-renderer-bsp-render-data-rendertriangle-faceindex-faceindex-src-mq3-renderer-bsp-render-data-ml-1802671593"></a>
### faceIndex

```ml
faceIndex
```

Index of the source BSP face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L63)

<a id="field-field-mq3-renderer-bsp-render-data-rendertriangle-fogindex-fogindex-src-mq3-renderer-bsp-render-data-ml-1079546493"></a>
### fogIndex

```ml
fogIndex
```

Index of the fog volume affecting the surface or primitive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L61)

<a id="field-field-mq3-renderer-bsp-render-data-rendertriangle-lightmapindex-lightmapindex-src-mq3-renderer-bsp-render-data-ml-1833314529"></a>
### lightmapIndex

```ml
lightmapIndex
```

Index or special selector identifying the surface's baked lightmap.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L59)

<a id="field-field-mq3-renderer-bsp-render-data-rendertriangle-textureindex-textureindex-src-mq3-renderer-bsp-render-data-ml-1355420931"></a>
### textureIndex

```ml
textureIndex
```

Index identifying the texture or BSP shader assigned to the surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L57)

<a id="field-field-mq3-renderer-bsp-render-data-rendertriangle-triangleindex-triangleindex-src-mq3-renderer-bsp-render-data-ml-1088941481"></a>
### triangleIndex

```ml
triangleIndex
```

Index of the triangle within its source face or surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L65)

<a id="field-field-mq3-renderer-bsp-render-data-rendertriangle-vertices-vertices-src-mq3-renderer-bsp-render-data-ml-1029841463"></a>
### vertices

```ml
vertices
```

Three world vertex records carrying the triangle's positions, lighting, and material coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/bsp_render_data.ml#L55)
