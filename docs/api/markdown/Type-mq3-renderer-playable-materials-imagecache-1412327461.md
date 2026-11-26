# `mq3.renderer.playable_materials.ImageCache`

[Home](README.md) · [Source file](File-src-mq3-renderer-playable-materials-ml-320329628.md)

<a id="struct-struct-mq3-renderer-playable-materials-imagecache-struct-imagecache-src-mq3-renderer-playable-materials-ml-1123853737"></a>
## ImageCache

```ml
struct ImageCache
```

Data record for `mq3.renderer.playable_materials.ImageCache`; groups `archive`, `images`, `count`, `hits`, `misses`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L177)

## Members

<a id="field-field-mq3-renderer-playable-materials-imagecache-archive-archive-src-mq3-renderer-playable-materials-ml-1376310406"></a>
### archive

```ml
archive
```

Asset archive used to resolve game resources by virtual path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L179)

<a id="field-field-mq3-renderer-playable-materials-imagecache-count-count-src-mq3-renderer-playable-materials-ml-2067388346"></a>
### count

```ml
count
```

Number of decoded images currently retained by the cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L183)

<a id="field-field-mq3-renderer-playable-materials-imagecache-hits-hits-src-mq3-renderer-playable-materials-ml-1476533822"></a>
### hits

```ml
hits
```

Number of lookups satisfied by an existing cache entry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L185)

<a id="field-field-mq3-renderer-playable-materials-imagecache-images-images-src-mq3-renderer-playable-materials-ml-1337223138"></a>
### images

```ml
images
```

Image resources or image-animation frames retained by the record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L181)

<a id="field-field-mq3-renderer-playable-materials-imagecache-misses-misses-src-mq3-renderer-playable-materials-ml-2000662454"></a>
### misses

```ml
misses
```

Number of lookups that required loading or rebuilding data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_materials.ml#L187)
