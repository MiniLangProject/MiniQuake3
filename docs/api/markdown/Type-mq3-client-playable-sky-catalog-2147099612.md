# `mq3.client.playable_sky.Catalog`

[Home](README.md) · [Source file](File-src-mq3-client-playable-sky-ml-624488737.md)

<a id="struct-struct-mq3-client-playable-sky-catalog-struct-catalog-src-mq3-client-playable-sky-ml-1773185655"></a>
## Catalog

```ml
struct Catalog
```

Stores playable sky catalog record, including `layers`, `firstTextureSlot`, `textureCount`, `shaderName`, `cloudHeight`, `cache`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L93)

## Members

<a id="field-field-mq3-client-playable-sky-catalog-cache-cache-src-mq3-client-playable-sky-ml-1370735852"></a>
### cache

```ml
cache
```

When constructing this record, `loadIndexed` supplies an absent (`void`) value for this member. Used by `release` and `retainedBatchPrepared` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L108)

<a id="field-field-mq3-client-playable-sky-catalog-cloudheight-cloudheight-src-mq3-client-playable-sky-ml-1134205836"></a>
### cloudHeight

```ml
cloudHeight
```

When constructing this record, `loadIndexed` supplies `parsed.cloudHeight` for this member. Used by `buildBatchPrepared` and `retainedBatchPrepared` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L105)

<a id="field-field-mq3-client-playable-sky-catalog-firsttextureslot-firsttextureslot-src-mq3-client-playable-sky-ml-612725798"></a>
### firstTextureSlot

```ml
firstTextureSlot
```

First texture-cache slot reserved for this module's media resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L98)

<a id="field-field-mq3-client-playable-sky-catalog-layers-layers-src-mq3-client-playable-sky-ml-1179484028"></a>
### layers

```ml
layers
```

When constructing this record, `loadIndexed` supplies `layers` for this member. Used by `upload` and `release` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L96)

<a id="field-field-mq3-client-playable-sky-catalog-shadername-shadername-src-mq3-client-playable-sky-ml-848150508"></a>
### shaderName

```ml
shaderName
```

Virtual shader name used to register or resolve the displayed resource.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L102)

<a id="field-field-mq3-client-playable-sky-catalog-texturecount-texturecount-src-mq3-client-playable-sky-ml-842769004"></a>
### textureCount

```ml
textureCount
```

Number of texture resources or texture-cache slots represented by this media record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L100)
