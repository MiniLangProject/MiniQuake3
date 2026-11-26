# `mq3.renderer.playable_world_batch.VertexCache`

[Home](README.md) · [Source file](File-src-mq3-renderer-playable-world-batch-ml-1411140007.md)

<a id="struct-struct-mq3-renderer-playable-world-batch-vertexcache-struct-vertexcache-src-mq3-renderer-playable-world-batch-ml-526363981"></a>
## VertexCache

```ml
struct VertexCache
```

Data record for `mq3.renderer.playable_world_batch.VertexCache`; groups `slots`, `frames`, `positions`, `uvs`, `colors`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L45)

## Members

<a id="field-field-mq3-renderer-playable-world-batch-vertexcache-colors-colors-src-mq3-renderer-playable-world-batch-ml-1374201073"></a>
### colors

```ml
colors
```

Evaluated stage colors cached for reusable source vertices in the current update generation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L55)

<a id="field-field-mq3-renderer-playable-world-batch-vertexcache-frames-frames-src-mq3-renderer-playable-world-batch-ml-249205769"></a>
### frames

```ml
frames
```

Generation stamps identifying valid cached vertex results.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L49)

<a id="field-field-mq3-renderer-playable-world-batch-vertexcache-positions-positions-src-mq3-renderer-playable-world-batch-ml-1699730869"></a>
### positions

```ml
positions
```

Evaluated vertex positions cached after the current material's deformation step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L51)

<a id="field-field-mq3-renderer-playable-world-batch-vertexcache-slots-slots-src-mq3-renderer-playable-world-batch-ml-637937813"></a>
### slots

```ml
slots
```

Resource slots or backing arrays retained by this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L47)

<a id="field-field-mq3-renderer-playable-world-batch-vertexcache-uvs-uvs-src-mq3-renderer-playable-world-batch-ml-621980665"></a>
### uvs

```ml
uvs
```

Texture coordinates generated for the pass or its vertices.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/playable_world_batch.ml#L53)
