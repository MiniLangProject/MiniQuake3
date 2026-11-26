# `mq3.renderer.scene_queue.Poly`

[Home](README.md) · [Source file](File-src-mq3-renderer-scene-queue-ml-703423413.md)

<a id="struct-struct-mq3-renderer-scene-queue-poly-struct-poly-src-mq3-renderer-scene-queue-ml-1617205355"></a>
## Poly

```ml
struct Poly
```

Data record for `mq3.renderer.scene_queue.Poly`; groups `hShader`, `verts`, `fogIndex`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L33)

## Members

<a id="field-field-mq3-renderer-scene-queue-poly-fogindex-fogindex-src-mq3-renderer-scene-queue-ml-185492143"></a>
### fogIndex

```ml
fogIndex
```

Index of the fog volume affecting the surface or primitive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L39)

<a id="field-field-mq3-renderer-scene-queue-poly-hshader-hshader-src-mq3-renderer-scene-queue-ml-1006949331"></a>
### hShader

```ml
hShader
```

Registered shader handle used to draw the polygon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L35)

<a id="field-field-mq3-renderer-scene-queue-poly-verts-verts-src-mq3-renderer-scene-queue-ml-1196996011"></a>
### verts

```ml
verts
```

Submitted polygon vertices retained until the queued scene is rendered.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L37)
