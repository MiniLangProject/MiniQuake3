# `mq3.renderer.surface_entities.Submission`

[Home](README.md) · [Source file](File-src-mq3-renderer-surface-entities-ml-629652876.md)

<a id="struct-struct-mq3-renderer-surface-entities-submission-struct-submission-src-mq3-renderer-surface-entities-ml-709456081"></a>
## Submission

```ml
struct Submission
```

Data record for `mq3.renderer.surface_entities.Submission`; groups `vertices`, `indexes`, `baseVertex`, `baseIndex`, `numVertexes`, `numIndexes`, and 1 further field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_entities.ml#L26)

## Members

<a id="field-field-mq3-renderer-surface-entities-submission-baseindex-baseindex-src-mq3-renderer-surface-entities-ml-1091157449"></a>
### baseIndex

```ml
baseIndex
```

First index slot used by the submitted geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_entities.ml#L34)

<a id="field-field-mq3-renderer-surface-entities-submission-basevertex-basevertex-src-mq3-renderer-surface-entities-ml-242727235"></a>
### baseVertex

```ml
baseVertex
```

First vertex slot used by the submitted geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_entities.ml#L32)

<a id="field-field-mq3-renderer-surface-entities-submission-flushed-flushed-src-mq3-renderer-surface-entities-ml-1424554289"></a>
### flushed

```ml
flushed
```

Whether the current batch was flushed before this geometry was appended.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_entities.ml#L40)

<a id="field-field-mq3-renderer-surface-entities-submission-indexes-indexes-src-mq3-renderer-surface-entities-ml-2056232561"></a>
### indexes

```ml
indexes
```

Indices connecting the generated vertices of procedural entity surfaces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_entities.ml#L30)

<a id="field-field-mq3-renderer-surface-entities-submission-numindexes-numindexes-src-mq3-renderer-surface-entities-ml-1262927065"></a>
### numIndexes

```ml
numIndexes
```

Number of indices currently stored or submitted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_entities.ml#L38)

<a id="field-field-mq3-renderer-surface-entities-submission-numvertexes-numvertexes-src-mq3-renderer-surface-entities-ml-1136219097"></a>
### numVertexes

```ml
numVertexes
```

Number of vertices currently stored or submitted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_entities.ml#L36)

<a id="field-field-mq3-renderer-surface-entities-submission-vertices-vertices-src-mq3-renderer-surface-entities-ml-87081923"></a>
### vertices

```ml
vertices
```

Vertex records produced while expanding a sprite, beam, or other procedural entity surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/surface_entities.ml#L28)
