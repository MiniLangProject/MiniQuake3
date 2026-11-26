# `mq3.renderer.surface_mesh.Submission`

[Home](README.md) · [Source file](File-src-mq3-renderer-surface-mesh-ml-873120018.md)

<a id="struct-struct-mq3-renderer-surface-mesh-submission-struct-submission-src-mq3-renderer-surface-mesh-ml-44053429"></a>
## Submission

```ml
struct Submission
```

Data record for `mq3.renderer.surface_mesh.Submission`; groups `xyz`, `normals`, `texCoords`, `colors`, `vertexDlightBits`, `indexes`, and 6 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_mesh.ml#L40)

## Members

<a id="field-field-mq3-renderer-surface-mesh-submission-baseindex-baseindex-src-mq3-renderer-surface-mesh-ml-1615692561"></a>
### baseIndex

```ml
baseIndex
```

First index slot used by the submitted geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_mesh.ml#L56)

<a id="field-field-mq3-renderer-surface-mesh-submission-basevertex-basevertex-src-mq3-renderer-surface-mesh-ml-1970432047"></a>
### baseVertex

```ml
baseVertex
```

First vertex slot used by the submitted geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_mesh.ml#L54)

<a id="field-field-mq3-renderer-surface-mesh-submission-colors-colors-src-mq3-renderer-surface-mesh-ml-75648217"></a>
### colors

```ml
colors
```

Vertex colors emitted from a static mesh into the tessellation submission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_mesh.ml#L48)

<a id="field-field-mq3-renderer-surface-mesh-submission-dlightbits-dlightbits-src-mq3-renderer-surface-mesh-ml-1714626729"></a>
### dlightBits

```ml
dlightBits
```

Bit mask identifying dynamic lights that affect this surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_mesh.ml#L62)

<a id="field-field-mq3-renderer-surface-mesh-submission-flushed-flushed-src-mq3-renderer-surface-mesh-ml-524966225"></a>
### flushed

```ml
flushed
```

Whether the current batch was flushed before this geometry was appended.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_mesh.ml#L64)

<a id="field-field-mq3-renderer-surface-mesh-submission-indexes-indexes-src-mq3-renderer-surface-mesh-ml-563098321"></a>
### indexes

```ml
indexes
```

Mesh triangle indices rebased into the destination tessellation buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_mesh.ml#L52)

<a id="field-field-mq3-renderer-surface-mesh-submission-normals-normals-src-mq3-renderer-surface-mesh-ml-1012791553"></a>
### normals

```ml
normals
```

Vertex normals used when lighting or transforming the geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_mesh.ml#L44)

<a id="field-field-mq3-renderer-surface-mesh-submission-numindexes-numindexes-src-mq3-renderer-surface-mesh-ml-1112311961"></a>
### numIndexes

```ml
numIndexes
```

Number of indices currently stored or submitted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_mesh.ml#L60)

<a id="field-field-mq3-renderer-surface-mesh-submission-numvertexes-numvertexes-src-mq3-renderer-surface-mesh-ml-1435666081"></a>
### numVertexes

```ml
numVertexes
```

Number of vertices currently stored or submitted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_mesh.ml#L58)

<a id="field-field-mq3-renderer-surface-mesh-submission-texcoords-texcoords-src-mq3-renderer-surface-mesh-ml-292843949"></a>
### texCoords

```ml
texCoords
```

Texture-coordinate arrays emitted with the submitted static mesh vertices.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_mesh.ml#L46)

<a id="field-field-mq3-renderer-surface-mesh-submission-vertexdlightbits-vertexdlightbits-src-mq3-renderer-surface-mesh-ml-1842744185"></a>
### vertexDlightBits

```ml
vertexDlightBits
```

Per-vertex mask of dynamic lights that can affect the geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_mesh.ml#L50)

<a id="field-field-mq3-renderer-surface-mesh-submission-xyz-xyz-src-mq3-renderer-surface-mesh-ml-759644141"></a>
### xyz

```ml
xyz
```

Three-dimensional vertex positions used by this geometry record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_mesh.ml#L42)
