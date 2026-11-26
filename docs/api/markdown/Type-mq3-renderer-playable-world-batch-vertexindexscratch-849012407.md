# `mq3.renderer.playable_world_batch.VertexIndexScratch`

[Home](README.md) · [Source file](File-src-mq3-renderer-playable-world-batch-ml-1411140007.md)

<a id="struct-struct-mq3-renderer-playable-world-batch-vertexindexscratch-struct-vertexindexscratch-src-mq3-renderer-playable-world-batch-ml-1393945443"></a>
## VertexIndexScratch

```ml
struct VertexIndexScratch
```

Data record for `mq3.renderer.playable_world_batch.VertexIndexScratch`; groups `visited`, `slots`, `serial`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L58)

## Members

<a id="field-field-mq3-renderer-playable-world-batch-vertexindexscratch-serial-serial-src-mq3-renderer-playable-world-batch-ml-291355539"></a>
### serial

```ml
serial
```

Generation number used to invalidate earlier visitation or cache markers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L64)

<a id="field-field-mq3-renderer-playable-world-batch-vertexindexscratch-slots-slots-src-mq3-renderer-playable-world-batch-ml-1960057679"></a>
### slots

```ml
slots
```

Resource slots or backing arrays retained by this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L62)

<a id="field-field-mq3-renderer-playable-world-batch-vertexindexscratch-visited-visited-src-mq3-renderer-playable-world-batch-ml-2029860387"></a>
### visited

```ml
visited
```

Per-vertex visitation markers used to avoid repeated work.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L60)
