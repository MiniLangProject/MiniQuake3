# `mq3.renderer.qvm_scene_geometry.Md3Selection`

[Home](README.md) · [Source file](File-src-mq3-renderer-qvm-scene-geometry-ml-51177627.md)

<a id="struct-struct-mq3-renderer-qvm-scene-geometry-md3selection-struct-md3selection-src-mq3-renderer-qvm-scene-geometry-ml-1044997895"></a>
## Md3Selection

```ml
struct Md3Selection
```

Data record for `mq3.renderer.qvm_scene_geometry.Md3Selection`; groups `model`, `lod`, `frames`, `cull`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_geometry.ml#L155)

## Members

<a id="field-field-mq3-renderer-qvm-scene-geometry-md3selection-cull-cull-src-mq3-renderer-qvm-scene-geometry-ml-158349035"></a>
### cull

```ml
cull
```

Culling mode or classification applied to this geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_geometry.ml#L163)

<a id="field-field-mq3-renderer-qvm-scene-geometry-md3selection-frames-frames-src-mq3-renderer-qvm-scene-geometry-ml-1690536243"></a>
### frames

```ml
frames
```

Validated current and previous MD3 frame selection used for interpolation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_geometry.ml#L161)

<a id="field-field-mq3-renderer-qvm-scene-geometry-md3selection-lod-lod-src-mq3-renderer-qvm-scene-geometry-ml-1308152883"></a>
### lod

```ml
lod
```

Level-of-detail selection used for this model or draw result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_geometry.ml#L159)

<a id="field-field-mq3-renderer-qvm-scene-geometry-md3selection-model-model-src-mq3-renderer-qvm-scene-geometry-ml-30556171"></a>
### model

```ml
model
```

Loaded model selected for animation or drawing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_geometry.ml#L157)
