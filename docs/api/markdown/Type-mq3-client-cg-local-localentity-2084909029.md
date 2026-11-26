# `mq3.client.cg_local.LocalEntity`

[Home](README.md) · [Source file](File-src-mq3-client-cg-local-ml-909335699.md)

<a id="struct-struct-mq3-client-cg-local-localentity-struct-localentity-src-mq3-client-cg-local-ml-714438981"></a>
## LocalEntity

```ml
struct LocalEntity
```

Stores client game local local entity record, including `prev`, `next`, `leType`, `leFlags`, `startTime`, `endTime` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L304)

## Members

<a id="field-field-mq3-client-cg-local-localentity-angles-angles-src-mq3-client-cg-local-ml-973507777"></a>
### angles

```ml
angles
```

Euler orientation used to place or animate the object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L330)

<a id="field-field-mq3-client-cg-local-localentity-bouncefactor-bouncefactor-src-mq3-client-cg-local-ml-1228978279"></a>
### bounceFactor

```ml
bounceFactor
```

Velocity multiplier after an impact; zero stops the fragment and one preserves its speed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L332)

<a id="field-field-mq3-client-cg-local-localentity-color-color-src-mq3-client-cg-local-ml-75437229"></a>
### color

```ml
color
```

RGBA base color retained by the native-compatible temporary local effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L334)

<a id="field-field-mq3-client-cg-local-localentity-endtime-endtime-src-mq3-client-cg-local-ml-617939845"></a>
### endTime

```ml
endTime
```

Compatibility member corresponding to native `localEntity_t.endTime`; the original declaration is `int endTime`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L320)

<a id="field-field-mq3-client-cg-local-localentity-fadeintime-fadeintime-src-mq3-client-cg-local-ml-725263321"></a>
### fadeInTime

```ml
fadeInTime
```

Compatibility member corresponding to native `localEntity_t.fadeInTime`; the original declaration is `int fadeInTime`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L323)

<a id="field-field-mq3-client-cg-local-localentity-lebouncesoundtype-lebouncesoundtype-src-mq3-client-cg-local-ml-2014427433"></a>
### leBounceSoundType

```ml
leBounceSoundType
```

Impact-sound category used when an effect fragment bounces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L344)

<a id="field-field-mq3-client-cg-local-localentity-leflags-leflags-src-mq3-client-cg-local-ml-1273566561"></a>
### leFlags

```ml
leFlags
```

Local-effect flags controlling fading, scaling, tumbling, or sound behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L314)

<a id="field-field-mq3-client-cg-local-localentity-lemarktype-lemarktype-src-mq3-client-cg-local-ml-1077256317"></a>
### leMarkType

```ml
leMarkType
```

Decal category to leave when an effect fragment strikes a surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L342)

<a id="field-field-mq3-client-cg-local-localentity-letype-letype-src-mq3-client-cg-local-ml-1527765571"></a>
### leType

```ml
leType
```

Local-effect entity kind selecting its update and rendering behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L312)

<a id="field-field-mq3-client-cg-local-localentity-liferate-liferate-src-mq3-client-cg-local-ml-930545201"></a>
### lifeRate

```ml
lifeRate
```

Reciprocal effect lifetime used to normalize the fade or growth fraction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L325)

<a id="field-field-mq3-client-cg-local-localentity-light-light-src-mq3-client-cg-local-ml-631127533"></a>
### light

```ml
light
```

Dynamic-light intensity emitted by the local effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L338)

<a id="field-field-mq3-client-cg-local-localentity-lightcolor-lightcolor-src-mq3-client-cg-local-ml-535039471"></a>
### lightColor

```ml
lightColor
```

RGB components of the dynamic light emitted by the effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L340)

<a id="field-field-mq3-client-cg-local-localentity-next-next-src-mq3-client-cg-local-ml-1128138771"></a>
### next

```ml
next
```

Compatibility member corresponding to native `localEntity_t.next`; the original declaration is `struct localEntity_s *prev, *next`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L310)

<a id="field-field-mq3-client-cg-local-localentity-pos-pos-src-mq3-client-cg-local-ml-692274497"></a>
### pos

```ml
pos
```

Compatibility member corresponding to native `localEntity_t.pos`; the original declaration is `trajectory_t pos`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L328)

<a id="field-field-mq3-client-cg-local-localentity-prev-prev-src-mq3-client-cg-local-ml-2064117451"></a>
### prev

```ml
prev
```

Compatibility member corresponding to native `localEntity_t.prev`; the original declaration is `struct localEntity_s *prev, *next`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L307)

<a id="field-field-mq3-client-cg-local-localentity-radius-radius-src-mq3-client-cg-local-ml-1571972989"></a>
### radius

```ml
radius
```

Base radius retained by the native-compatible local-effect record for sprite scaling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L336)

<a id="field-field-mq3-client-cg-local-localentity-refentity-refentity-src-mq3-client-cg-local-ml-752110057"></a>
### refEntity

```ml
refEntity
```

Renderer-facing entity description submitted for this local effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L346)

<a id="field-field-mq3-client-cg-local-localentity-starttime-starttime-src-mq3-client-cg-local-ml-2054674749"></a>
### startTime

```ml
startTime
```

Compatibility member corresponding to native `localEntity_t.startTime`; the original declaration is `int startTime`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cg_local.ml#L317)
