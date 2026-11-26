# `mq3.renderer.qvm_2d_batch.StagePass`

[Home](README.md) · [Source file](File-src-mq3-renderer-qvm-2d-batch-ml-1820350507.md)

<a id="struct-struct-mq3-renderer-qvm-2d-batch-stagepass-struct-stagepass-src-mq3-renderer-qvm-2d-batch-ml-539527095"></a>
## StagePass

```ml
struct StagePass
```

Data record for `mq3.renderer.qvm_2d_batch.StagePass`; groups `stage`, `triangles`, `batch`, `timeOffset`, `clampTime`, `initialized`, and 1 further field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L82)

## Members

<a id="field-field-mq3-renderer-qvm-2d-batch-stagepass-batch-batch-src-mq3-renderer-qvm-2d-batch-ml-269406552"></a>
### batch

```ml
batch
```

Prepared drawing batch associated with the selected geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L88)

<a id="field-field-mq3-renderer-qvm-2d-batch-stagepass-clamptime-clamptime-src-mq3-renderer-qvm-2d-batch-ml-29949888"></a>
### clampTime

```ml
clampTime
```

Upper limit applied to the shader's effect time; zero disables clamping.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L92)

<a id="field-field-mq3-renderer-qvm-2d-batch-stagepass-dynamic-dynamic-src-mq3-renderer-qvm-2d-batch-ml-1833644104"></a>
### dynamic

```ml
dynamic
```

Whether this pass requires per-frame updates for animated effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L96)

<a id="field-field-mq3-renderer-qvm-2d-batch-stagepass-initialized-initialized-src-mq3-renderer-qvm-2d-batch-ml-1045244240"></a>
### initialized

```ml
initialized
```

Whether initialization completed successfully.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L94)

<a id="field-field-mq3-renderer-qvm-2d-batch-stagepass-stage-stage-src-mq3-renderer-qvm-2d-batch-ml-1850765824"></a>
### stage

```ml
stage
```

Runtime material stage executed by this drawing pass.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L84)

<a id="field-field-mq3-renderer-qvm-2d-batch-stagepass-timeoffset-timeoffset-src-mq3-renderer-qvm-2d-batch-ml-945454272"></a>
### timeOffset

```ml
timeOffset
```

Offset in seconds applied to the material's shader time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L90)

<a id="field-field-mq3-renderer-qvm-2d-batch-stagepass-triangles-triangles-src-mq3-renderer-qvm-2d-batch-ml-1139742248"></a>
### triangles

```ml
triangles
```

Triangle records or index triplets represented by this geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L86)
