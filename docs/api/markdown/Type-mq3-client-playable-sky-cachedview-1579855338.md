# `mq3.client.playable_sky.CachedView`

[Home](README.md) · [Source file](File-src-mq3-client-playable-sky-ml-624488737.md)

<a id="struct-struct-mq3-client-playable-sky-cachedview-struct-cachedview-src-mq3-client-playable-sky-ml-1413487503"></a>
## CachedView

```ml
struct CachedView
```

Stores playable sky cached view record, including `basis`, `left`, `top`, `width`, `height`, `source` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L120)

## Members

<a id="field-field-mq3-client-playable-sky-cachedview-basis-basis-src-mq3-client-playable-sky-ml-420269450"></a>
### basis

```ml
basis
```

When constructing this record, `retainedBatchPrepared` supplies `copyBasis(basis)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L123)

<a id="field-field-mq3-client-playable-sky-cachedview-batch-batch-src-mq3-client-playable-sky-ml-861906970"></a>
### batch

```ml
batch
```

When constructing this record, `retainedBatchPrepared` supplies `batch` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L136)

<a id="field-field-mq3-client-playable-sky-cachedview-height-height-src-mq3-client-playable-sky-ml-1704465196"></a>
### height

```ml
height
```

Pixel height of the sky viewport for which this projected-geometry cache was built.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L131)

<a id="field-field-mq3-client-playable-sky-cachedview-left-left-src-mq3-client-playable-sky-ml-1911311100"></a>
### left

```ml
left
```

Left boundary of the interactive or clipped region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L125)

<a id="field-field-mq3-client-playable-sky-cachedview-source-source-src-mq3-client-playable-sky-ml-1255893760"></a>
### source

```ml
source
```

When constructing this record, `retainedBatchPrepared` supplies `bytes(len(grid)*SOURCE_VERTEX_BYTES,0)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L134)

<a id="field-field-mq3-client-playable-sky-cachedview-top-top-src-mq3-client-playable-sky-ml-676255530"></a>
### top

```ml
top
```

Top boundary of the interactive or clipped region.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L127)

<a id="field-field-mq3-client-playable-sky-cachedview-width-width-src-mq3-client-playable-sky-ml-789314958"></a>
### width

```ml
width
```

Pixel width of the sky viewport for which this projected-geometry cache was built.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L129)
