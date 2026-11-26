# `mq3.client.playable_sky.Vertex`

[Home](README.md) · [Source file](File-src-mq3-client-playable-sky-ml-624488737.md)

<a id="struct-struct-mq3-client-playable-sky-vertex-struct-vertex-src-mq3-client-playable-sky-ml-1522770423"></a>
## Vertex

```ml
struct Vertex
```

Stores playable sky vertex record, including `point`, `uv`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L111)

## Members

<a id="field-field-mq3-client-playable-sky-vertex-point-point-src-mq3-client-playable-sky-ml-885894069"></a>
### point

```ml
point
```

When constructing this record, `vertex` supplies `viewer.ScreenPoint(x,y,depth)` for this member. Used by `retainedBatchPrepared` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L114)

<a id="field-field-mq3-client-playable-sky-vertex-uv-uv-src-mq3-client-playable-sky-ml-1953839259"></a>
### uv

```ml
uv
```

When constructing this record, `vertex` supplies `mapped` for this member. Used by `retainedBatchPrepared` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L117)
