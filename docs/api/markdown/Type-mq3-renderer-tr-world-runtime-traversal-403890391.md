# `mq3.renderer.tr_world_runtime.Traversal`

[Home](README.md) · [Source file](File-src-mq3-renderer-tr-world-runtime-ml-1466231431.md)

<a id="struct-struct-mq3-renderer-tr-world-runtime-traversal-struct-traversal-src-mq3-renderer-tr-world-runtime-ml-696604613"></a>
## Traversal

```ml
struct Traversal
```

Data record for `mq3.renderer.tr_world_runtime.Traversal`; groups `draws`, `leafs`, `visBounds`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L113)

## Members

<a id="field-field-mq3-renderer-tr-world-runtime-traversal-draws-draws-src-mq3-renderer-tr-world-runtime-ml-400553359"></a>
### draws

```ml
draws
```

Draw-surface records emitted while traversing the world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L115)

<a id="field-field-mq3-renderer-tr-world-runtime-traversal-leafs-leafs-src-mq3-renderer-tr-world-runtime-ml-997203967"></a>
### leafs

```ml
leafs
```

BSP leaves visited or retained by world traversal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L117)

<a id="field-field-mq3-renderer-tr-world-runtime-traversal-visbounds-visbounds-src-mq3-renderer-tr-world-runtime-ml-1045107995"></a>
### visBounds

```ml
visBounds
```

Bounds accumulated over the visible BSP leaves.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_world_runtime.ml#L119)
