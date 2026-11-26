# `mq3.renderer.surface_grid.Batch`

[Home](README.md) · [Source file](File-src-mq3-renderer-surface-grid-ml-668182529.md)

<a id="struct-struct-mq3-renderer-surface-grid-batch-struct-batch-src-mq3-renderer-surface-grid-ml-760950097"></a>
## Batch

```ml
struct Batch
```

Data record for `mq3.renderer.surface_grid.Batch`; groups `xyz`, `normals`, `texCoords`, `colors`, `vertexDlightBits`, `indexes`, and 3 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L35)

## Members

<a id="field-field-mq3-renderer-surface-grid-batch-colors-colors-src-mq3-renderer-surface-grid-ml-2121581081"></a>
### colors

```ml
colors
```

Interpolated vertex colors for the tessellated curved-patch batch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L43)

<a id="field-field-mq3-renderer-surface-grid-batch-dlightbits-dlightbits-src-mq3-renderer-surface-grid-ml-2033666985"></a>
### dlightBits

```ml
dlightBits
```

Bit mask identifying dynamic lights that affect this surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L53)

<a id="field-field-mq3-renderer-surface-grid-batch-indexes-indexes-src-mq3-renderer-surface-grid-ml-1152088233"></a>
### indexes

```ml
indexes
```

Triangle indices connecting adjacent cells of the selected patch-grid tessellation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L47)

<a id="field-field-mq3-renderer-surface-grid-batch-normals-normals-src-mq3-renderer-surface-grid-ml-1758088825"></a>
### normals

```ml
normals
```

Vertex normals used when lighting or transforming the geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L39)

<a id="field-field-mq3-renderer-surface-grid-batch-numindexes-numindexes-src-mq3-renderer-surface-grid-ml-738380849"></a>
### numIndexes

```ml
numIndexes
```

Number of indices currently stored or submitted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L51)

<a id="field-field-mq3-renderer-surface-grid-batch-numvertexes-numvertexes-src-mq3-renderer-surface-grid-ml-866698233"></a>
### numVertexes

```ml
numVertexes
```

Number of vertices currently stored or submitted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L49)

<a id="field-field-mq3-renderer-surface-grid-batch-texcoords-texcoords-src-mq3-renderer-surface-grid-ml-969392341"></a>
### texCoords

```ml
texCoords
```

Base and lightmap coordinates emitted for the selected rows and columns of a patch grid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L41)

<a id="field-field-mq3-renderer-surface-grid-batch-vertexdlightbits-vertexdlightbits-src-mq3-renderer-surface-grid-ml-1582823361"></a>
### vertexDlightBits

```ml
vertexDlightBits
```

Per-vertex mask of dynamic lights that can affect the geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L45)

<a id="field-field-mq3-renderer-surface-grid-batch-xyz-xyz-src-mq3-renderer-surface-grid-ml-1435938525"></a>
### xyz

```ml
xyz
```

Three-dimensional vertex positions used by this geometry record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_grid.ml#L37)
