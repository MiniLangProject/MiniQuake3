# `mq3.renderer.qvm_scene_batch.Prepared`

[Home](README.md) · [Source file](File-src-mq3-renderer-qvm-scene-batch-ml-1031575875.md)

<a id="struct-struct-mq3-renderer-qvm-scene-batch-prepared-struct-prepared-src-mq3-renderer-qvm-scene-batch-ml-1744209835"></a>
## Prepared

```ml
struct Prepared
```

Data record for `mq3.renderer.qvm_scene_batch.Prepared`; groups `geometry`, `batch`, `depthHackGeometry`, `depthHackBatch`, `dynamicGeometry`, `shadowBatch`, and 1 further field.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L17)

## Members

<a id="field-field-mq3-renderer-qvm-scene-batch-prepared-batch-batch-src-mq3-renderer-qvm-scene-batch-ml-487659520"></a>
### batch

```ml
batch
```

Prepared drawing batch associated with the selected geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L21)

<a id="field-field-mq3-renderer-qvm-scene-batch-prepared-depthhackbatch-depthhackbatch-src-mq3-renderer-qvm-scene-batch-ml-1293965748"></a>
### depthHackBatch

```ml
depthHackBatch
```

Drawing batch for geometry using the weapon depth hack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L25)

<a id="field-field-mq3-renderer-qvm-scene-batch-prepared-depthhackgeometry-depthhackgeometry-src-mq3-renderer-qvm-scene-batch-ml-332639876"></a>
### depthHackGeometry

```ml
depthHackGeometry
```

Geometry that requires the shortened weapon depth range.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L23)

<a id="field-field-mq3-renderer-qvm-scene-batch-prepared-dynamicgeometry-dynamicgeometry-src-mq3-renderer-qvm-scene-batch-ml-960867376"></a>
### dynamicGeometry

```ml
dynamicGeometry
```

Geometry retained for time-dependent or entity-dependent updates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L27)

<a id="field-field-mq3-renderer-qvm-scene-batch-prepared-geometry-geometry-src-mq3-renderer-qvm-scene-batch-ml-464875168"></a>
### geometry

```ml
geometry
```

Prepared geometry used by the drawing operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L19)

<a id="field-field-mq3-renderer-qvm-scene-batch-prepared-shadowbatch-shadowbatch-src-mq3-renderer-qvm-scene-batch-ml-1355074228"></a>
### shadowBatch

```ml
shadowBatch
```

Drawing batch containing shadow geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L29)

<a id="field-field-mq3-renderer-qvm-scene-batch-prepared-shadowcount-shadowcount-src-mq3-renderer-qvm-scene-batch-ml-197047984"></a>
### shadowCount

```ml
shadowCount
```

Number of shadow primitives prepared for submission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L31)
