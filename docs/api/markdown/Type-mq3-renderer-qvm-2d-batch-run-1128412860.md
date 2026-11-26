# `mq3.renderer.qvm_2d_batch.Run`

[Home](README.md) · [Source file](File-src-mq3-renderer-qvm-2d-batch-ml-1820350507.md)

<a id="struct-struct-mq3-renderer-qvm-2d-batch-run-struct-run-src-mq3-renderer-qvm-2d-batch-ml-1672484455"></a>
## Run

```ml
struct Run
```

Data record for `mq3.renderer.qvm_2d_batch.Run`; groups `materialIndex`, `shaderHandle`, `passes`, `quadCount`, `triangleCount`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L99)

## Members

<a id="field-field-mq3-renderer-qvm-2d-batch-run-materialindex-materialindex-src-mq3-renderer-qvm-2d-batch-ml-1169494170"></a>
### materialIndex

```ml
materialIndex
```

Index of the resolved material in the material catalog.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L101)

<a id="field-field-mq3-renderer-qvm-2d-batch-run-passes-passes-src-mq3-renderer-qvm-2d-batch-ml-638670492"></a>
### passes

```ml
passes
```

Drawing passes required by the material or retained batch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L105)

<a id="field-field-mq3-renderer-qvm-2d-batch-run-quadcount-quadcount-src-mq3-renderer-qvm-2d-batch-ml-822198946"></a>
### quadCount

```ml
quadCount
```

Number of two-dimensional quads represented by this draw run.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L107)

<a id="field-field-mq3-renderer-qvm-2d-batch-run-shaderhandle-shaderhandle-src-mq3-renderer-qvm-2d-batch-ml-1095492476"></a>
### shaderHandle

```ml
shaderHandle
```

Registered shader handle used to resolve the drawing material.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L103)

<a id="field-field-mq3-renderer-qvm-2d-batch-run-trianglecount-trianglecount-src-mq3-renderer-qvm-2d-batch-ml-2103132078"></a>
### triangleCount

```ml
triangleCount
```

Number of triangles represented by this geometry or result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L109)
