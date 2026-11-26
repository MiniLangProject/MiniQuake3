# `mq3.client.cgame_localents.LocalEntity`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-localents-ml-2123896286.md)

<a id="struct-struct-mq3-client-cgame-localents-localentity-struct-localentity-src-mq3-client-cgame-localents-ml-1824908189"></a>
## LocalEntity

```ml
struct LocalEntity
```

Stores client game localents local entity record, including `id`, `active`, `leType`, `leFlags`, `startTime`, `endTime` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L134)

## Members

<a id="field-field-mq3-client-cgame-localents-localentity-active-active-src-mq3-client-cgame-localents-ml-1193681733"></a>
### active

```ml
active
```

When constructing this record, `newLocalEntity` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L138)

<a id="field-field-mq3-client-cgame-localents-localentity-angles-angles-src-mq3-client-cgame-localents-ml-660528573"></a>
### angles

```ml
angles
```

Euler orientation used to place or animate the object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L154)

<a id="field-field-mq3-client-cgame-localents-localentity-bouncefactor-bouncefactor-src-mq3-client-cgame-localents-ml-1991686583"></a>
### bounceFactor

```ml
bounceFactor
```

Velocity multiplier after an impact; zero stops the fragment and one preserves its speed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L156)

<a id="field-field-mq3-client-cgame-localents-localentity-color-color-src-mq3-client-cgame-localents-ml-285346025"></a>
### color

```ml
color
```

Normalized RGBA base color used to compute the temporary effect fade.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L158)

<a id="field-field-mq3-client-cgame-localents-localentity-endtime-endtime-src-mq3-client-cgame-localents-ml-1992610873"></a>
### endTime

```ml
endTime
```

When constructing this record, `newLocalEntity` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L146)

<a id="field-field-mq3-client-cgame-localents-localentity-fadeintime-fadeintime-src-mq3-client-cgame-localents-ml-214864889"></a>
### fadeInTime

```ml
fadeInTime
```

When constructing this record, `newLocalEntity` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L148)

<a id="field-field-mq3-client-cgame-localents-localentity-id-id-src-mq3-client-cgame-localents-ml-1784095467"></a>
### id

```ml
id
```

Stable effect identifier used to track or replace this projectile, particle, or mark.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L136)

<a id="field-field-mq3-client-cgame-localents-localentity-lebouncesoundtype-lebouncesoundtype-src-mq3-client-cgame-localents-ml-99355909"></a>
### leBounceSoundType

```ml
leBounceSoundType
```

Impact-sound category used when an effect fragment bounces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L168)

<a id="field-field-mq3-client-cgame-localents-localentity-leflags-leflags-src-mq3-client-cgame-localents-ml-1940149413"></a>
### leFlags

```ml
leFlags
```

Local-effect flags controlling fading, scaling, tumbling, or sound behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L142)

<a id="field-field-mq3-client-cgame-localents-localentity-lemarktype-lemarktype-src-mq3-client-cgame-localents-ml-1382578429"></a>
### leMarkType

```ml
leMarkType
```

Decal category to leave when an effect fragment strikes a surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L166)

<a id="field-field-mq3-client-cgame-localents-localentity-letype-letype-src-mq3-client-cgame-localents-ml-721858923"></a>
### leType

```ml
leType
```

Local-effect entity kind selecting its update and rendering behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L140)

<a id="field-field-mq3-client-cgame-localents-localentity-liferate-liferate-src-mq3-client-cgame-localents-ml-228762033"></a>
### lifeRate

```ml
lifeRate
```

Reciprocal effect lifetime used to normalize the fade or growth fraction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L150)

<a id="field-field-mq3-client-cgame-localents-localentity-light-light-src-mq3-client-cgame-localents-ml-60084497"></a>
### light

```ml
light
```

Dynamic-light intensity emitted by the local effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L162)

<a id="field-field-mq3-client-cgame-localents-localentity-lightcolor-lightcolor-src-mq3-client-cgame-localents-ml-1637389147"></a>
### lightColor

```ml
lightColor
```

RGB components of the dynamic light emitted by the effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L164)

<a id="field-field-mq3-client-cgame-localents-localentity-pos-pos-src-mq3-client-cgame-localents-ml-1583773205"></a>
### pos

```ml
pos
```

When constructing this record, `newLocalEntity` supplies `newTrajectory()` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L152)

<a id="field-field-mq3-client-cgame-localents-localentity-radius-radius-src-mq3-client-cgame-localents-ml-469957237"></a>
### radius

```ml
radius
```

Base world-space effect radius used when computing temporary sprite growth.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L160)

<a id="field-field-mq3-client-cgame-localents-localentity-refentity-refentity-src-mq3-client-cgame-localents-ml-1809421589"></a>
### refEntity

```ml
refEntity
```

Renderer-facing entity description submitted for this local effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L170)

<a id="field-field-mq3-client-cgame-localents-localentity-starttime-starttime-src-mq3-client-cgame-localents-ml-1084155937"></a>
### startTime

```ml
startTime
```

When constructing this record, `newLocalEntity` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L144)
