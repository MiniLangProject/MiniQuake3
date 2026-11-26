# `mq3.collision.world.Brush`

[Home](README.md) · [Source file](File-src-mq3-collision-world-ml-863162236.md)

<a id="struct-struct-mq3-collision-world-brush-struct-brush-src-mq3-collision-world-ml-1495187473"></a>
## Brush

```ml
struct Brush
```

Brush record for collision.world, containing `planes`, `packedPlanes`, `contents`, `mins`, `maxs`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L82)

## Members

<a id="field-field-mq3-collision-world-brush-contents-contents-src-mq3-collision-world-ml-841945683"></a>
### contents

```ml
contents
```

Collision or AAS contents flags describing the represented volume.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L88)

<a id="field-field-mq3-collision-world-brush-maxs-maxs-src-mq3-collision-world-ml-1592212165"></a>
### maxs

```ml
maxs
```

Maximum XYZ corner of the static convex brush in world coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L92)

<a id="field-field-mq3-collision-world-brush-mins-mins-src-mq3-collision-world-ml-54727869"></a>
### mins

```ml
mins
```

Minimum XYZ corner of the static convex brush in world coordinates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L90)

<a id="field-field-mq3-collision-world-brush-packedplanes-packedplanes-src-mq3-collision-world-ml-1272363205"></a>
### packedPlanes

```ml
packedPlanes
```

Compact plane representation used by accelerated brush traces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L86)

<a id="field-field-mq3-collision-world-brush-planes-planes-src-mq3-collision-world-ml-1030623793"></a>
### planes

```ml
planes
```

Plane records used to classify or clip the represented geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L84)
