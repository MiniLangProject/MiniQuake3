# `mq3.client.playable_sky.ViewCache`

[Home](README.md) · [Source file](File-src-mq3-client-playable-sky-ml-624488737.md)

<a id="struct-struct-mq3-client-playable-sky-viewcache-struct-viewcache-src-mq3-client-playable-sky-ml-1008201051"></a>
## ViewCache

```ml
struct ViewCache
```

Stores playable sky view cache record, including `entries`, `next`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L139)

## Members

<a id="field-field-mq3-client-playable-sky-viewcache-entries-entries-src-mq3-client-playable-sky-ml-39019830"></a>
### entries

```ml
entries
```

When constructing this record, `retainedBatchPrepared` supplies `array(MAX_CACHED_VIEWS,void)` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L142)

<a id="field-field-mq3-client-playable-sky-viewcache-next-next-src-mq3-client-playable-sky-ml-938752404"></a>
### next

```ml
next
```

When constructing this record, `retainedBatchPrepared` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L144)
