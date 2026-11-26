# `mq3.renderer.surface_md3.Submission`

[Home](README.md) · [Source file](File-src-mq3-renderer-surface-md3-ml-438987327.md)

<a id="struct-struct-mq3-renderer-surface-md3-submission-struct-submission-src-mq3-renderer-surface-md3-ml-1413942311"></a>
## Submission

```ml
struct Submission
```

Data record for `mq3.renderer.surface_md3.Submission`; groups `xyz`, `normals`, `texCoords`, `indexes`, `baseVertex`, `baseIndex`, and 5 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L43)

## Members

<a id="field-field-mq3-renderer-surface-md3-submission-baseindex-baseindex-src-mq3-renderer-surface-md3-ml-1518883729"></a>
### baseIndex

```ml
baseIndex
```

First index slot used by the submitted geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L55)

<a id="field-field-mq3-renderer-surface-md3-submission-basevertex-basevertex-src-mq3-renderer-surface-md3-ml-44771883"></a>
### baseVertex

```ml
baseVertex
```

First vertex slot used by the submitted geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L53)

<a id="field-field-mq3-renderer-surface-md3-submission-dlightbits-dlightbits-src-mq3-renderer-surface-md3-ml-496703305"></a>
### dlightBits

```ml
dlightBits
```

Bit mask identifying dynamic lights that affect this surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L63)

<a id="field-field-mq3-renderer-surface-md3-submission-flushed-flushed-src-mq3-renderer-surface-md3-ml-1111894681"></a>
### flushed

```ml
flushed
```

Whether the current batch was flushed before this geometry was appended.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L61)

<a id="field-field-mq3-renderer-surface-md3-submission-indexes-indexes-src-mq3-renderer-surface-md3-ml-1475797425"></a>
### indexes

```ml
indexes
```

MD3 triangle indices rebased to the interpolated vertices in the destination buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L51)

<a id="field-field-mq3-renderer-surface-md3-submission-normals-normals-src-mq3-renderer-surface-md3-ml-316889585"></a>
### normals

```ml
normals
```

Vertex normals used when lighting or transforming the geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L47)

<a id="field-field-mq3-renderer-surface-md3-submission-numindexes-numindexes-src-mq3-renderer-surface-md3-ml-691626929"></a>
### numIndexes

```ml
numIndexes
```

Number of indices currently stored or submitted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L59)

<a id="field-field-mq3-renderer-surface-md3-submission-numvertexes-numvertexes-src-mq3-renderer-surface-md3-ml-642757273"></a>
### numVertexes

```ml
numVertexes
```

Number of vertices currently stored or submitted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L57)

<a id="field-field-mq3-renderer-surface-md3-submission-texcoords-texcoords-src-mq3-renderer-surface-md3-ml-1984942461"></a>
### texCoords

```ml
texCoords
```

MD3 surface texture coordinates copied alongside the interpolated vertex positions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L49)

<a id="field-field-mq3-renderer-surface-md3-submission-touchesdlights-touchesdlights-src-mq3-renderer-surface-md3-ml-1280064537"></a>
### touchesDlights

```ml
touchesDlights
```

Whether the submitted geometry is affected by dynamic lighting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L65)

<a id="field-field-mq3-renderer-surface-md3-submission-xyz-xyz-src-mq3-renderer-surface-md3-ml-800209397"></a>
### xyz

```ml
xyz
```

Three-dimensional vertex positions used by this geometry record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_md3.ml#L45)
