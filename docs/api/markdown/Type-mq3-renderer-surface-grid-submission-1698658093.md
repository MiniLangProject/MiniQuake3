# `mq3.renderer.surface_grid.Submission`

[Home](README.md) · [Source file](File-src-mq3-renderer-surface-grid-ml-668182529.md)

<a id="struct-struct-mq3-renderer-surface-grid-submission-struct-submission-src-mq3-renderer-surface-grid-ml-1530106695"></a>
## Submission

```ml
struct Submission
```

Data record for `mq3.renderer.surface_grid.Submission`; groups `widthTable`, `heightTable`, `batches`, `flushes`, `numVertexes`, `numIndexes`, and 1 further field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_grid.ml#L56)

## Members

<a id="field-field-mq3-renderer-surface-grid-submission-batches-batches-src-mq3-renderer-surface-grid-ml-2039744987"></a>
### batches

```ml
batches
```

Geometry batches produced when the surface exceeds a single buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_grid.ml#L62)

<a id="field-field-mq3-renderer-surface-grid-submission-dlightbits-dlightbits-src-mq3-renderer-surface-grid-ml-1743988423"></a>
### dlightBits

```ml
dlightBits
```

Bit mask identifying dynamic lights that affect this surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_grid.ml#L70)

<a id="field-field-mq3-renderer-surface-grid-submission-flushes-flushes-src-mq3-renderer-surface-grid-ml-2059230799"></a>
### flushes

```ml
flushes
```

Number of batch flushes needed to submit the geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_grid.ml#L64)

<a id="field-field-mq3-renderer-surface-grid-submission-heighttable-heighttable-src-mq3-renderer-surface-grid-ml-603594147"></a>
### heightTable

```ml
heightTable
```

Selected grid rows retained at the current patch detail level.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_grid.ml#L60)

<a id="field-field-mq3-renderer-surface-grid-submission-numindexes-numindexes-src-mq3-renderer-surface-grid-ml-2019923759"></a>
### numIndexes

```ml
numIndexes
```

Number of indices currently stored or submitted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_grid.ml#L68)

<a id="field-field-mq3-renderer-surface-grid-submission-numvertexes-numvertexes-src-mq3-renderer-surface-grid-ml-2048715895"></a>
### numVertexes

```ml
numVertexes
```

Number of vertices currently stored or submitted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_grid.ml#L66)

<a id="field-field-mq3-renderer-surface-grid-submission-widthtable-widthtable-src-mq3-renderer-surface-grid-ml-640887223"></a>
### widthTable

```ml
widthTable
```

Selected grid columns retained at the current patch detail level.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/surface_grid.ml#L58)
