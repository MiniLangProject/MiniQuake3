# `mq3.collision.patchmesh.Facet`

[Home](README.md) · [Source file](File-src-mq3-collision-patchmesh-ml-245132781.md)

<a id="struct-struct-mq3-collision-patchmesh-facet-struct-facet-src-mq3-collision-patchmesh-ml-297904465"></a>
## Facet

```ml
struct Facet
```

Facet record for collision.patchmesh, containing `surface`, `borders`, `inward`, `noAdjust`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L22)

## Members

<a id="field-field-mq3-collision-patchmesh-facet-borders-borders-src-mq3-collision-patchmesh-ml-557164510"></a>
### borders

```ml
borders
```

Plane indexes forming the edges of the collision facet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L26)

<a id="field-field-mq3-collision-patchmesh-facet-inward-inward-src-mq3-collision-patchmesh-ml-123677868"></a>
### inward

```ml
inward
```

Flags indicating which border planes face inward.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L28)

<a id="field-field-mq3-collision-patchmesh-facet-noadjust-noadjust-src-mq3-collision-patchmesh-ml-1067677246"></a>
### noAdjust

```ml
noAdjust
```

Flags preventing selected border planes from being expanded for trace bounds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L30)

<a id="field-field-mq3-collision-patchmesh-facet-surface-surface-src-mq3-collision-patchmesh-ml-1644434350"></a>
### surface

```ml
surface
```

Index of the facet's primary surface plane.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchmesh.ml#L24)
