# `mq3.collision.world.Work`

[Home](README.md) · [Source file](File-src-mq3-collision-world-ml-863162236.md)

<a id="struct-struct-mq3-collision-world-work-struct-work-src-mq3-collision-world-ml-395048239"></a>
## Work

```ml
struct Work
```

Work record for collision.world, containing `world`, `trace`, `start`, `finish`, `mins`, `maxs`, and 14 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L195)

## Members

<a id="field-field-mq3-collision-world-work-boundsmax-boundsmax-src-mq3-collision-world-ml-913211624"></a>
### boundsMax

```ml
boundsMax
```

Maximum XYZ corner of the enclosing bounds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L211)

<a id="field-field-mq3-collision-world-work-boundsmin-boundsmin-src-mq3-collision-world-ml-446011892"></a>
### boundsMin

```ml
boundsMin
```

Minimum XYZ corner of the enclosing bounds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L209)

<a id="field-field-mq3-collision-world-work-brushscratch-brushscratch-src-mq3-collision-world-ml-829367892"></a>
### brushScratch

```ml
brushScratch
```

Reusable temporary storage for brush-clipping calculations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L233)

<a id="field-field-mq3-collision-world-work-capsule-capsule-src-mq3-collision-world-ml-784377060"></a>
### capsule

```ml
capsule
```

True when collision testing uses a capsule instead of a box.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L213)

<a id="field-field-mq3-collision-world-work-capsuleoffset-capsuleoffset-src-mq3-collision-world-ml-1664783540"></a>
### capsuleOffset

```ml
capsuleOffset
```

Offset of the capsule's end spheres from its center.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L219)

<a id="field-field-mq3-collision-world-work-curves-curves-src-mq3-collision-world-ml-127256516"></a>
### curves

```ml
curves
```

True when collision tests include curved patch surfaces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L235)

<a id="field-field-mq3-collision-world-work-finish-finish-src-mq3-collision-world-ml-1150376862"></a>
### finish

```ml
finish
```

Reference position requested at the end of the swept world-collision test.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L203)

<a id="field-field-mq3-collision-world-work-halfheight-halfheight-src-mq3-collision-world-ml-275305896"></a>
### halfheight

```ml
halfheight
```

Half of the capsule height measured along its principal axis.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L217)

<a id="field-field-mq3-collision-world-work-ispoint-ispoint-src-mq3-collision-world-ml-1312704580"></a>
### isPoint

```ml
isPoint
```

True when the trace volume has zero extent and can use point tests.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L225)

<a id="field-field-mq3-collision-world-work-mask-mask-src-mq3-collision-world-ml-277629468"></a>
### mask

```ml
mask
```

Combined contents mask selecting collidable geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L223)

<a id="field-field-mq3-collision-world-work-maxs-maxs-src-mq3-collision-world-ml-1938637066"></a>
### maxs

```ml
maxs
```

Maximum XYZ corner of the swept collision box relative to its reference position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L207)

<a id="field-field-mq3-collision-world-work-mins-mins-src-mq3-collision-world-ml-658286710"></a>
### mins

```ml
mins
```

Minimum XYZ corner of the swept collision box relative to its reference position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L205)

<a id="field-field-mq3-collision-world-work-modelorigin-modelorigin-src-mq3-collision-world-ml-23777904"></a>
### modelOrigin

```ml
modelOrigin
```

World-space origin of the collision model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L221)

<a id="field-field-mq3-collision-world-work-radius-radius-src-mq3-collision-world-ml-1230092312"></a>
### radius

```ml
radius
```

Radius of the represented sphere or capsule.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L215)

<a id="field-field-mq3-collision-world-work-seen-seen-src-mq3-collision-world-ml-1870508014"></a>
### seen

```ml
seen
```

Visit markers preventing duplicate brush tests.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L227)

<a id="field-field-mq3-collision-world-work-seenpatches-seenpatches-src-mq3-collision-world-ml-1304891120"></a>
### seenPatches

```ml
seenPatches
```

Visit markers preventing duplicate patch tests.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L229)

<a id="field-field-mq3-collision-world-work-start-start-src-mq3-collision-world-ml-1199481132"></a>
### start

```ml
start
```

Reference position at the beginning of the swept world-collision test.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L201)

<a id="field-field-mq3-collision-world-work-trace-trace-src-mq3-collision-world-ml-1260732692"></a>
### trace

```ml
trace
```

Collision trace result or active trace state for this operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L199)

<a id="field-field-mq3-collision-world-work-visitserial-visitserial-src-mq3-collision-world-ml-979335536"></a>
### visitSerial

```ml
visitSerial
```

Serial number used to avoid visiting the same collision element twice.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L231)

<a id="field-field-mq3-collision-world-work-world-world-src-mq3-collision-world-ml-2012854576"></a>
### world

```ml
world
```

Collision or navigation world used by this operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/world.ml#L197)
