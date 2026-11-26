# `mq3.renderer.qvm_scene_geometry.FrameEntry`

[Home](README.md) · [Source file](File-src-mq3-renderer-qvm-scene-geometry-ml-51177627.md)

<a id="struct-struct-mq3-renderer-qvm-scene-geometry-frameentry-struct-frameentry-src-mq3-renderer-qvm-scene-geometry-ml-2055171767"></a>
## FrameEntry

```ml
struct FrameEntry
```

Data record for `mq3.renderer.qvm_scene_geometry.FrameEntry`; groups `modelHandle`, `surfaceIndex`, `frame`, `oldFrame`, `backlerp`, `xyz`, and 3 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L166)

## Members

<a id="field-field-mq3-renderer-qvm-scene-geometry-frameentry-backlerp-backlerp-src-mq3-renderer-qvm-scene-geometry-ml-1613076698"></a>
### backlerp

```ml
backlerp
```

Interpolation weight of the previous frame: zero selects current, one selects previous.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L176)

<a id="field-field-mq3-renderer-qvm-scene-geometry-frameentry-frame-frame-src-mq3-renderer-qvm-scene-geometry-ml-810474518"></a>
### frame

```ml
frame
```

Current model animation-frame index.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L172)

<a id="field-field-mq3-renderer-qvm-scene-geometry-frameentry-modelhandle-modelhandle-src-mq3-renderer-qvm-scene-geometry-ml-2110615350"></a>
### modelHandle

```ml
modelHandle
```

Registered model handle used to identify cached mesh data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L168)

<a id="field-field-mq3-renderer-qvm-scene-geometry-frameentry-normals-normals-src-mq3-renderer-qvm-scene-geometry-ml-1785060506"></a>
### normals

```ml
normals
```

Vertex normals used when lighting or transforming the geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L180)

<a id="field-field-mq3-renderer-qvm-scene-geometry-frameentry-oldframe-oldframe-src-mq3-renderer-qvm-scene-geometry-ml-1063495322"></a>
### oldFrame

```ml
oldFrame
```

Previous animation frame used for interpolation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L174)

<a id="field-field-mq3-renderer-qvm-scene-geometry-frameentry-packed-packed-src-mq3-renderer-qvm-scene-geometry-ml-670639070"></a>
### packed

```ml
packed
```

Whether the cached frame uses the model's packed vertex representation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L182)

<a id="field-field-mq3-renderer-qvm-scene-geometry-frameentry-surfaceindex-surfaceindex-src-mq3-renderer-qvm-scene-geometry-ml-1701064488"></a>
### surfaceIndex

```ml
surfaceIndex
```

Index of the source surface within the model or world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L170)

<a id="field-field-mq3-renderer-qvm-scene-geometry-frameentry-vertexcount-vertexcount-src-mq3-renderer-qvm-scene-geometry-ml-422723598"></a>
### vertexCount

```ml
vertexCount
```

Number of vertices represented by the cached frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L184)

<a id="field-field-mq3-renderer-qvm-scene-geometry-frameentry-xyz-xyz-src-mq3-renderer-qvm-scene-geometry-ml-710178246"></a>
### xyz

```ml
xyz
```

Three-dimensional vertex positions used by this geometry record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L178)
