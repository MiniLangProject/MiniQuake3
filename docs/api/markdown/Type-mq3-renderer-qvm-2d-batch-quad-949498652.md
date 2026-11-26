# `mq3.renderer.qvm_2d_batch.Quad`

[Home](README.md) · [Source file](File-src-mq3-renderer-qvm-2d-batch-ml-1820350507.md)

<a id="struct-struct-mq3-renderer-qvm-2d-batch-quad-struct-quad-src-mq3-renderer-qvm-2d-batch-ml-2116905555"></a>
## Quad

```ml
struct Quad
```

Data record for `mq3.renderer.qvm_2d_batch.Quad`; groups `shaderHandle`, `shaderName`, `positions`, `texCoords`, `color`, `commandIndex`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L30)

## Members

<a id="field-field-mq3-renderer-qvm-2d-batch-quad-color-color-src-mq3-renderer-qvm-2d-batch-ml-925320562"></a>
### color

```ml
color
```

Modulation color active when the VM submitted this two-dimensional rectangle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L40)

<a id="field-field-mq3-renderer-qvm-2d-batch-quad-commandindex-commandindex-src-mq3-renderer-qvm-2d-batch-ml-1322038812"></a>
### commandIndex

```ml
commandIndex
```

Index of the original drawing command that produced this primitive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L42)

<a id="field-field-mq3-renderer-qvm-2d-batch-quad-positions-positions-src-mq3-renderer-qvm-2d-batch-ml-1208154122"></a>
### positions

```ml
positions
```

Four corners of the submitted two-dimensional rectangle before triangulation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L36)

<a id="field-field-mq3-renderer-qvm-2d-batch-quad-shaderhandle-shaderhandle-src-mq3-renderer-qvm-2d-batch-ml-1358294864"></a>
### shaderHandle

```ml
shaderHandle
```

Registered shader handle used to resolve the drawing material.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L32)

<a id="field-field-mq3-renderer-qvm-2d-batch-quad-shadername-shadername-src-mq3-renderer-qvm-2d-batch-ml-917897678"></a>
### shaderName

```ml
shaderName
```

Registered material name selected by the VM's stretch-picture command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L34)

<a id="field-field-mq3-renderer-qvm-2d-batch-quad-texcoords-texcoords-src-mq3-renderer-qvm-2d-batch-ml-1453240786"></a>
### texCoords

```ml
texCoords
```

Four texture corners specified by the two-dimensional stretch-picture command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L38)
