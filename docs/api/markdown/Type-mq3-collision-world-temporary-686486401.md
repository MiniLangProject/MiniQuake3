# `mq3.collision.world.Temporary`

[Home](README.md) · [Source file](File-src-mq3-collision-world-ml-863162236.md)

<a id="struct-struct-mq3-collision-world-temporary-struct-temporary-src-mq3-collision-world-ml-585102815"></a>
## Temporary

```ml
struct Temporary
```

Temporary record for collision.world, containing `bounds`, `brush`, `capsuleReady`, `brushVisits`, `patchVisits`, `visitSerial`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L180)

## Members

<a id="field-field-mq3-collision-world-temporary-bounds-bounds-src-mq3-collision-world-ml-1612766288"></a>
### bounds

```ml
bounds
```

Minimum and maximum corners of the temporary box or capsule model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L182)

<a id="field-field-mq3-collision-world-temporary-brush-brush-src-mq3-collision-world-ml-997814114"></a>
### brush

```ml
brush
```

Reusable brush geometry for temporary box traces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L184)

<a id="field-field-mq3-collision-world-temporary-brushvisits-brushvisits-src-mq3-collision-world-ml-904806182"></a>
### brushVisits

```ml
brushVisits
```

Visit markers used by temporary brush traces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L188)

<a id="field-field-mq3-collision-world-temporary-capsuleready-capsuleready-src-mq3-collision-world-ml-576067038"></a>
### capsuleReady

```ml
capsuleReady
```

True after the temporary capsule parameters have been initialized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L186)

<a id="field-field-mq3-collision-world-temporary-patchvisits-patchvisits-src-mq3-collision-world-ml-1357595974"></a>
### patchVisits

```ml
patchVisits
```

Visit markers used by temporary patch traces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L190)

<a id="field-field-mq3-collision-world-temporary-visitserial-visitserial-src-mq3-collision-world-ml-2107638858"></a>
### visitSerial

```ml
visitSerial
```

Serial number used to avoid visiting the same collision element twice.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/world.ml#L192)
