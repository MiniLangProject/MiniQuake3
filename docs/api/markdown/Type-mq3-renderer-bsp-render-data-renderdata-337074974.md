# `mq3.renderer.bsp_render_data.RenderData`

[Home](README.md) · [Source file](File-src-mq3-renderer-bsp-render-data-ml-926244912.md)

<a id="struct-struct-mq3-renderer-bsp-render-data-renderdata-struct-renderdata-src-mq3-renderer-bsp-render-data-ml-1763029779"></a>
## RenderData

```ml
struct RenderData
```

Data record for `mq3.renderer.bsp_render_data.RenderData`; groups `triangles`, `surfaceCount`, `triangleCount`, `skippedSurfaceCount`, `truncated`, `patchSurfaceCount`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L68)

## Members

<a id="field-field-mq3-renderer-bsp-render-data-renderdata-patchsurfacecount-patchsurfacecount-src-mq3-renderer-bsp-render-data-ml-2104549709"></a>
### patchSurfaceCount

```ml
patchSurfaceCount
```

Number of curved patch surfaces represented by the render data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L80)

<a id="field-field-mq3-renderer-bsp-render-data-renderdata-skippedsurfacecount-skippedsurfacecount-src-mq3-renderer-bsp-render-data-ml-10855685"></a>
### skippedSurfaceCount

```ml
skippedSurfaceCount
```

Number of surfaces omitted while constructing render data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L76)

<a id="field-field-mq3-renderer-bsp-render-data-renderdata-surfacecount-surfacecount-src-mq3-renderer-bsp-render-data-ml-1835575181"></a>
### surfaceCount

```ml
surfaceCount
```

Number of source surfaces represented by this result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L72)

<a id="field-field-mq3-renderer-bsp-render-data-renderdata-trianglecount-trianglecount-src-mq3-renderer-bsp-render-data-ml-1576479497"></a>
### triangleCount

```ml
triangleCount
```

Number of triangles represented by this geometry or result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L74)

<a id="field-field-mq3-renderer-bsp-render-data-renderdata-triangles-triangles-src-mq3-renderer-bsp-render-data-ml-1969169549"></a>
### triangles

```ml
triangles
```

Triangle records or index triplets represented by this geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L70)

<a id="field-field-mq3-renderer-bsp-render-data-renderdata-truncated-truncated-src-mq3-renderer-bsp-render-data-ml-1964929429"></a>
### truncated

```ml
truncated
```

Whether a configured limit prevented retaining every source primitive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/bsp_render_data.ml#L78)
