# `mq3.collision.patchmesh.Patch`

[Home](README.md) · [Source file](File-src-mq3-collision-patchmesh-ml-245132781.md)

<a id="struct-struct-mq3-collision-patchmesh-patch-struct-patch-src-mq3-collision-patchmesh-ml-1040577243"></a>
## Patch

```ml
struct Patch
```

Patch record for collision.patchmesh, containing `planes`, `facets`, `bounds`, `planeCache`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L33)

## Members

<a id="field-field-mq3-collision-patchmesh-patch-bounds-bounds-src-mq3-collision-patchmesh-ml-905328955"></a>
### bounds

```ml
bounds
```

Minimum and maximum corners enclosing the patch, expanded for collision tolerance.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L39)

<a id="field-field-mq3-collision-patchmesh-patch-facets-facets-src-mq3-collision-patchmesh-ml-1942888197"></a>
### facets

```ml
facets
```

Collision facets generated from the curved patch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L37)

<a id="field-field-mq3-collision-patchmesh-patch-planecache-planecache-src-mq3-collision-patchmesh-ml-527427453"></a>
### planeCache

```ml
planeCache
```

Lookup cache used to reuse equivalent patch clipping planes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L41)

<a id="field-field-mq3-collision-patchmesh-patch-planes-planes-src-mq3-collision-patchmesh-ml-1493809119"></a>
### planes

```ml
planes
```

Plane records used to classify or clip the represented geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L35)
