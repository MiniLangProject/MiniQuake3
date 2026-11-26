# `mq3.collision.world.LeafList`

[Home](README.md) · [Source file](File-src-mq3-collision-world-ml-863162236.md)

<a id="struct-struct-mq3-collision-world-leaflist-struct-leaflist-src-mq3-collision-world-ml-1785328191"></a>
## LeafList

```ml
struct LeafList
```

LeafList record for collision.world, containing `entries`, `lastLeaf`, `overflowed`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L245)

## Members

<a id="field-field-mq3-collision-world-leaflist-entries-entries-src-mq3-collision-world-ml-992063151"></a>
### entries

```ml
entries
```

BSP leaf indexes intersected by the requested bounds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L247)

<a id="field-field-mq3-collision-world-leaflist-lastleaf-lastleaf-src-mq3-collision-world-ml-484572023"></a>
### lastLeaf

```ml
lastLeaf
```

Last non-opaque leaf visited, retained when the bounded leaf list overflows.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L249)

<a id="field-field-mq3-collision-world-leaflist-overflowed-overflowed-src-mq3-collision-world-ml-971373029"></a>
### overflowed

```ml
overflowed
```

True when more leaves were found than the result capacity allows.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L251)
