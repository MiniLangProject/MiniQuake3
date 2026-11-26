# `mq3.collision.brush.Trace`

[Home](README.md) · [Source file](File-src-mq3-collision-brush-ml-582513812.md)

<a id="struct-struct-mq3-collision-brush-trace-struct-trace-src-mq3-collision-brush-ml-562562587"></a>
## Trace

```ml
struct Trace
```

Trace record for collision.brush, containing `fraction`, `normal`, `distance`, `surfaceFlags`, `contents`, `startsolid`, and 2 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/brush.ml#L39)

## Members

<a id="field-field-mq3-collision-brush-trace-allsolid-allsolid-src-mq3-collision-brush-ml-987180048"></a>
### allsolid

```ml
allsolid
```

True when the entire trace begins and remains within solid geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/brush.ml#L53)

<a id="field-field-mq3-collision-brush-trace-contents-contents-src-mq3-collision-brush-ml-1903935844"></a>
### contents

```ml
contents
```

Collision or AAS contents flags describing the represented volume.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/brush.ml#L49)

<a id="field-field-mq3-collision-brush-trace-distance-distance-src-mq3-collision-brush-ml-1759185362"></a>
### distance

```ml
distance
```

Distance term of the impact plane.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/brush.ml#L45)

<a id="field-field-mq3-collision-brush-trace-fraction-fraction-src-mq3-collision-brush-ml-473783244"></a>
### fraction

```ml
fraction
```

Fraction of the requested trace segment completed before the first collision.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/brush.ml#L41)

<a id="field-field-mq3-collision-brush-trace-normal-normal-src-mq3-collision-brush-ml-1836279002"></a>
### normal

```ml
normal
```

Normal of the brush plane hit by the swept collision test.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/brush.ml#L43)

<a id="field-field-mq3-collision-brush-trace-planemetadata-planemetadata-src-mq3-collision-brush-ml-561822364"></a>
### planeMetadata

```ml
planeMetadata
```

Packed impact-plane type in the low byte (0..2 axial, 3 nonaxial) and normal sign bits starting at bit 8.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/brush.ml#L55)

<a id="field-field-mq3-collision-brush-trace-startsolid-startsolid-src-mq3-collision-brush-ml-1070360370"></a>
### startsolid

```ml
startsolid
```

True when the initial trace position lies inside solid geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/brush.ml#L51)

<a id="field-field-mq3-collision-brush-trace-surfaceflags-surfaceflags-src-mq3-collision-brush-ml-1134463388"></a>
### surfaceFlags

```ml
surfaceFlags
```

Surface-property flags reported for the intersected surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/brush.ml#L47)
