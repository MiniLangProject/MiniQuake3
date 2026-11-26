# `mq3.renderer.md3_cache_index.Index`

[Home](README.md) · [Source file](File-src-mq3-renderer-md3-cache-index-ml-212366937.md)

<a id="struct-struct-mq3-renderer-md3-cache-index-index-struct-index-src-mq3-renderer-md3-cache-index-ml-692313341"></a>
## Index

```ml
struct Index
```

Data record for `mq3.renderer.md3_cache_index.Index`; groups `heads`, `links`, `hashes`, `mask`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_cache_index.ml#L7)

## Members

<a id="field-field-mq3-renderer-md3-cache-index-index-hashes-hashes-src-mq3-renderer-md3-cache-index-ml-48957731"></a>
### hashes

```ml
hashes
```

Stored hash value associated with each cache entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_cache_index.ml#L13)

<a id="field-field-mq3-renderer-md3-cache-index-index-heads-heads-src-mq3-renderer-md3-cache-index-ml-813807343"></a>
### heads

```ml
heads
```

Head entry of each hash bucket in the cache index.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_cache_index.ml#L9)

<a id="field-field-mq3-renderer-md3-cache-index-index-links-links-src-mq3-renderer-md3-cache-index-ml-381712163"></a>
### links

```ml
links
```

Next-entry links used to traverse collisions in a hash bucket.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_cache_index.ml#L11)

<a id="field-field-mq3-renderer-md3-cache-index-index-mask-mask-src-mq3-renderer-md3-cache-index-ml-782643067"></a>
### mask

```ml
mask
```

Bit mask used to select relevant values or wrap a bounded index.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/md3_cache_index.ml#L15)
