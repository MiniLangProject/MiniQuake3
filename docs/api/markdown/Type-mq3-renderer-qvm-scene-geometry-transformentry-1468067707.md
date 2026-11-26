# `mq3.renderer.qvm_scene_geometry.TransformEntry`

[Home](README.md) · [Source file](File-src-mq3-renderer-qvm-scene-geometry-ml-51177627.md)

<a id="struct-struct-mq3-renderer-qvm-scene-geometry-transformentry-struct-transformentry-src-mq3-renderer-qvm-scene-geometry-ml-1585205999"></a>
## TransformEntry

```ml
struct TransformEntry
```

Data record for `mq3.renderer.qvm_scene_geometry.TransformEntry`; groups `modelHandle`, `surfaceIndex`, `frame`, `oldFrame`, `backlerp`, `origin`, and 8 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L187)

## Members

<a id="field-field-mq3-renderer-qvm-scene-geometry-transformentry-axis-axis-src-mq3-renderer-qvm-scene-geometry-ml-519585545"></a>
### axis

```ml
axis
```

Entity orientation basis included in the transformed-geometry cache key.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L201)

<a id="field-field-mq3-renderer-qvm-scene-geometry-transformentry-backlerp-backlerp-src-mq3-renderer-qvm-scene-geometry-ml-1499170007"></a>
### backlerp

```ml
backlerp
```

Interpolation weight of the previous frame: zero selects current, one selects previous.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L197)

<a id="field-field-mq3-renderer-qvm-scene-geometry-transformentry-colors-colors-src-mq3-renderer-qvm-scene-geometry-ml-949099139"></a>
### colors

```ml
colors
```

Lit vertex colors cached with the entity's transformed model geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L215)

<a id="field-field-mq3-renderer-qvm-scene-geometry-transformentry-frame-frame-src-mq3-renderer-qvm-scene-geometry-ml-1907680895"></a>
### frame

```ml
frame
```

Current model animation-frame index.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L193)

<a id="field-field-mq3-renderer-qvm-scene-geometry-transformentry-lightalpha-lightalpha-src-mq3-renderer-qvm-scene-geometry-ml-1703895995"></a>
### lightAlpha

```ml
lightAlpha
```

Alpha component retained when applying entity lighting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L213)

<a id="field-field-mq3-renderer-qvm-scene-geometry-transformentry-lightambient-lightambient-src-mq3-renderer-qvm-scene-geometry-ml-2132884451"></a>
### lightAmbient

```ml
lightAmbient
```

Ambient light contribution used when calculating vertex colors.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L207)

<a id="field-field-mq3-renderer-qvm-scene-geometry-transformentry-lightdirected-lightdirected-src-mq3-renderer-qvm-scene-geometry-ml-1163910943"></a>
### lightDirected

```ml
lightDirected
```

Directional light contribution used when calculating vertex colors.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L209)

<a id="field-field-mq3-renderer-qvm-scene-geometry-transformentry-lightdirection-lightdirection-src-mq3-renderer-qvm-scene-geometry-ml-526685977"></a>
### lightDirection

```ml
lightDirection
```

Direction from which the entity's dominant light arrives.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L211)

<a id="field-field-mq3-renderer-qvm-scene-geometry-transformentry-modelhandle-modelhandle-src-mq3-renderer-qvm-scene-geometry-ml-421160599"></a>
### modelHandle

```ml
modelHandle
```

Registered model handle used to identify cached mesh data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L189)

<a id="field-field-mq3-renderer-qvm-scene-geometry-transformentry-normals-normals-src-mq3-renderer-qvm-scene-geometry-ml-1461170595"></a>
### normals

```ml
normals
```

Vertex normals used when lighting or transforming the geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L205)

<a id="field-field-mq3-renderer-qvm-scene-geometry-transformentry-oldframe-oldframe-src-mq3-renderer-qvm-scene-geometry-ml-1494592947"></a>
### oldFrame

```ml
oldFrame
```

Previous animation frame used for interpolation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L195)

<a id="field-field-mq3-renderer-qvm-scene-geometry-transformentry-origin-origin-src-mq3-renderer-qvm-scene-geometry-ml-913571791"></a>
### origin

```ml
origin
```

Entity translation included in the cache key for transformed model geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L199)

<a id="field-field-mq3-renderer-qvm-scene-geometry-transformentry-positions-positions-src-mq3-renderer-qvm-scene-geometry-ml-2054897479"></a>
### positions

```ml
positions
```

Model vertex positions cached after the entity orientation and translation are applied.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L203)

<a id="field-field-mq3-renderer-qvm-scene-geometry-transformentry-surfaceindex-surfaceindex-src-mq3-renderer-qvm-scene-geometry-ml-1372008197"></a>
### surfaceIndex

```ml
surfaceIndex
```

Index of the source surface within the model or world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_geometry.ml#L191)
