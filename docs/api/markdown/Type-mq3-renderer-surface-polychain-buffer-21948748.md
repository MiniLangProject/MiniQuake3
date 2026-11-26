# `mq3.renderer.surface_polychain.Buffer`

[Home](README.md) · [Source file](File-src-mq3-renderer-surface-polychain-ml-2005384852.md)

<a id="struct-struct-mq3-renderer-surface-polychain-buffer-struct-buffer-src-mq3-renderer-surface-polychain-ml-1943875723"></a>
## Buffer

```ml
struct Buffer
```

Data record for `mq3.renderer.surface_polychain.Buffer`; groups `maxVertexes`, `maxIndexes`, `xyz`, `texCoords`, `colors`, `indexes`, and 3 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_polychain.ml#L21)

## Members

<a id="field-field-mq3-renderer-surface-polychain-buffer-colors-colors-src-mq3-renderer-surface-polychain-ml-1495432299"></a>
### colors

```ml
colors
```

Per-vertex modulation colors accumulated with the submitted polygon geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_polychain.ml#L31)

<a id="field-field-mq3-renderer-surface-polychain-buffer-flushes-flushes-src-mq3-renderer-surface-polychain-ml-298955643"></a>
### flushes

```ml
flushes
```

Number of batch flushes needed to submit the geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_polychain.ml#L39)

<a id="field-field-mq3-renderer-surface-polychain-buffer-indexes-indexes-src-mq3-renderer-surface-polychain-ml-1077036435"></a>
### indexes

```ml
indexes
```

Triangle indices connecting the vertices accumulated from polygon-chain submissions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_polychain.ml#L33)

<a id="field-field-mq3-renderer-surface-polychain-buffer-maxindexes-maxindexes-src-mq3-renderer-surface-polychain-ml-156267043"></a>
### maxIndexes

```ml
maxIndexes
```

Maximum permitted number of indexes used by this buffer record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_polychain.ml#L25)

<a id="field-field-mq3-renderer-surface-polychain-buffer-maxvertexes-maxvertexes-src-mq3-renderer-surface-polychain-ml-1760261551"></a>
### maxVertexes

```ml
maxVertexes
```

Maximum permitted number of vertexes used by this buffer record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_polychain.ml#L23)

<a id="field-field-mq3-renderer-surface-polychain-buffer-numindexes-numindexes-src-mq3-renderer-surface-polychain-ml-1409953083"></a>
### numIndexes

```ml
numIndexes
```

Number of indices currently stored or submitted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_polychain.ml#L37)

<a id="field-field-mq3-renderer-surface-polychain-buffer-numvertexes-numvertexes-src-mq3-renderer-surface-polychain-ml-1381246523"></a>
### numVertexes

```ml
numVertexes
```

Number of vertices currently stored or submitted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_polychain.ml#L35)

<a id="field-field-mq3-renderer-surface-polychain-buffer-texcoords-texcoords-src-mq3-renderer-surface-polychain-ml-618863927"></a>
### texCoords

```ml
texCoords
```

Texture-coordinate array accumulated while triangulating submitted polygons.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_polychain.ml#L29)

<a id="field-field-mq3-renderer-surface-polychain-buffer-xyz-xyz-src-mq3-renderer-surface-polychain-ml-1721780919"></a>
### xyz

```ml
xyz
```

Three-dimensional vertex positions used by this geometry record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_polychain.ml#L27)
