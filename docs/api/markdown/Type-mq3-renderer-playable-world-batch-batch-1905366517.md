# `mq3.renderer.playable_world_batch.Batch`

[Home](README.md) · [Source file](File-src-mq3-renderer-playable-world-batch-ml-1411140007.md)

<a id="struct-struct-mq3-renderer-playable-world-batch-batch-struct-batch-src-mq3-renderer-playable-world-batch-ml-336301913"></a>
## Batch

```ml
struct Batch
```

Data record for `mq3.renderer.playable_world_batch.Batch`; groups `commands`, `sourceTriangles`, `drawableTriangles`, `skippedSky`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L19)

## Members

<a id="field-field-mq3-renderer-playable-world-batch-batch-commands-commands-src-mq3-renderer-playable-world-batch-ml-1577418877"></a>
### commands

```ml
commands
```

Operations or drawing commands queued by this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L21)

<a id="field-field-mq3-renderer-playable-world-batch-batch-drawabletriangles-drawabletriangles-src-mq3-renderer-playable-world-batch-ml-849893873"></a>
### drawableTriangles

```ml
drawableTriangles
```

Number of source triangles that can be submitted for drawing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L25)

<a id="field-field-mq3-renderer-playable-world-batch-batch-skippedsky-skippedsky-src-mq3-renderer-playable-world-batch-ml-1419347999"></a>
### skippedSky

```ml
skippedSky
```

Number of sky primitives handled outside the normal material batch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L27)

<a id="field-field-mq3-renderer-playable-world-batch-batch-sourcetriangles-sourcetriangles-src-mq3-renderer-playable-world-batch-ml-1279938697"></a>
### sourceTriangles

```ml
sourceTriangles
```

Number of source triangles considered when preparing the batch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L23)
