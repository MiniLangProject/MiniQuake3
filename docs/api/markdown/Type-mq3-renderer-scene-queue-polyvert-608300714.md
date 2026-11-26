# `mq3.renderer.scene_queue.PolyVert`

[Home](README.md) · [Source file](File-src-mq3-renderer-scene-queue-ml-703423413.md)

<a id="struct-struct-mq3-renderer-scene-queue-polyvert-struct-polyvert-src-mq3-renderer-scene-queue-ml-57670819"></a>
## PolyVert

```ml
struct PolyVert
```

Data record for `mq3.renderer.scene_queue.PolyVert`; groups `xyz`, `st`, `modulate`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L24)

## Members

<a id="field-field-mq3-renderer-scene-queue-polyvert-modulate-modulate-src-mq3-renderer-scene-queue-ml-2010021314"></a>
### modulate

```ml
modulate
```

Per-vertex RGBA color bytes that modulate the sampled texture.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L30)

<a id="field-field-mq3-renderer-scene-queue-polyvert-st-st-src-mq3-renderer-scene-queue-ml-159355294"></a>
### st

```ml
st
```

Two-dimensional texture coordinates associated with the vertex.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L28)

<a id="field-field-mq3-renderer-scene-queue-polyvert-xyz-xyz-src-mq3-renderer-scene-queue-ml-1784702544"></a>
### xyz

```ml
xyz
```

Three-dimensional position of this vertex.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/scene_queue.ml#L26)
