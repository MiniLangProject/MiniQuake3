# `mq3.collision.world.LoadResult`

[Home](README.md) · [Source file](File-src-mq3-collision-world-ml-863162236.md)

<a id="struct-struct-mq3-collision-world-loadresult-struct-loadresult-src-mq3-collision-world-ml-1679948551"></a>
## LoadResult

```ml
struct LoadResult
```

LoadResult record for collision.world, containing `world`, `checksum`, `cached`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L171)

## Members

<a id="field-field-mq3-collision-world-loadresult-cached-cached-src-mq3-collision-world-ml-1552266256"></a>
### cached

```ml
cached
```

True when an existing collision world was reused.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L177)

<a id="field-field-mq3-collision-world-loadresult-checksum-checksum-src-mq3-collision-world-ml-114913066"></a>
### checksum

```ml
checksum
```

Checksum used to validate or identify the represented data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L175)

<a id="field-field-mq3-collision-world-loadresult-world-world-src-mq3-collision-world-ml-1572559344"></a>
### world

```ml
world
```

Collision or navigation world used by this operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L173)
