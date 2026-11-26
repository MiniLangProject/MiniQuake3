# `mq3.renderer.qvm_scene_geometry.ShadowTriangle`

[Home](README.md) · [Source file](File-src-mq3-renderer-qvm-scene-geometry-ml-51177627.md)

<a id="struct-struct-mq3-renderer-qvm-scene-geometry-shadowtriangle-struct-shadowtriangle-src-mq3-renderer-qvm-scene-geometry-ml-543616515"></a>
## ShadowTriangle

```ml
struct ShadowTriangle
```

Data record for `mq3.renderer.qvm_scene_geometry.ShadowTriangle`; groups `positions`, `entityIndex`, `surfaceIndex`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L97)

## Members

<a id="field-field-mq3-renderer-qvm-scene-geometry-shadowtriangle-entityindex-entityindex-src-mq3-renderer-qvm-scene-geometry-ml-663561207"></a>
### entityIndex

```ml
entityIndex
```

Index of the scene entity that produced this geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L101)

<a id="field-field-mq3-renderer-qvm-scene-geometry-shadowtriangle-positions-positions-src-mq3-renderer-qvm-scene-geometry-ml-1600184483"></a>
### positions

```ml
positions
```

World-space corners retained for projected or stencil-shadow processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L99)

<a id="field-field-mq3-renderer-qvm-scene-geometry-shadowtriangle-surfaceindex-surfaceindex-src-mq3-renderer-qvm-scene-geometry-ml-1871701153"></a>
### surfaceIndex

```ml
surfaceIndex
```

Index of the source surface within the model or world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L103)
