# `mq3.renderer.qvm_2d_batch.Triangle`

[Home](README.md) · [Source file](File-src-mq3-renderer-qvm-2d-batch-ml-1820350507.md)

<a id="struct-struct-mq3-renderer-qvm-2d-batch-triangle-struct-triangle-src-mq3-renderer-qvm-2d-batch-ml-1608075239"></a>
## Triangle

```ml
struct Triangle
```

Data record for `mq3.renderer.qvm_2d_batch.Triangle`; groups `positions`, `texCoords`, `colors`, `commandIndex`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L45)

## Members

<a id="field-field-mq3-renderer-qvm-2d-batch-triangle-colors-colors-src-mq3-renderer-qvm-2d-batch-ml-1821531383"></a>
### colors

```ml
colors
```

Per-corner modulation colors retained after splitting a 2D command into triangles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L51)

<a id="field-field-mq3-renderer-qvm-2d-batch-triangle-commandindex-commandindex-src-mq3-renderer-qvm-2d-batch-ml-584765333"></a>
### commandIndex

```ml
commandIndex
```

Index of the original drawing command that produced this primitive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L53)

<a id="field-field-mq3-renderer-qvm-2d-batch-triangle-positions-positions-src-mq3-renderer-qvm-2d-batch-ml-1339143843"></a>
### positions

```ml
positions
```

Three screen-space corners produced when triangulating a two-dimensional drawing command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L47)

<a id="field-field-mq3-renderer-qvm-2d-batch-triangle-texcoords-texcoords-src-mq3-renderer-qvm-2d-batch-ml-113587299"></a>
### texCoords

```ml
texCoords
```

Three interpolated texture coordinates of a triangle produced from a 2D drawing rectangle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L49)
