# `mq3.client.playable_viewmodel.Pose`

[Home](README.md) · [Source file](File-src-mq3-client-playable-viewmodel-ml-1609227520.md)

<a id="struct-struct-mq3-client-playable-viewmodel-pose-struct-pose-src-mq3-client-playable-viewmodel-ml-220464025"></a>
## Pose

```ml
struct Pose
```

Stores playable viewmodel pose record, including `origin`, `axis`, `scale`, `fovOffset`, `bobCycle`, `bobFraction` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L64)

## Members

<a id="field-field-mq3-client-playable-viewmodel-pose-axis-axis-src-mq3-client-playable-viewmodel-ml-767359996"></a>
### axis

```ml
axis
```

Three orientation basis vectors used to transform the rendered object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L68)

<a id="field-field-mq3-client-playable-viewmodel-pose-bobcycle-bobcycle-src-mq3-client-playable-viewmodel-ml-2075409752"></a>
### bobCycle

```ml
bobCycle
```

When constructing this record, `calculate` supplies `bob.cycle` for this member. Used by `withRecoil` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L77)

<a id="field-field-mq3-client-playable-viewmodel-pose-bobfraction-bobfraction-src-mq3-client-playable-viewmodel-ml-817104146"></a>
### bobFraction

```ml
bobFraction
```

When constructing this record, `calculate` supplies `bob.fraction` for this member. Used by `withRecoil` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L80)

<a id="field-field-mq3-client-playable-viewmodel-pose-fovoffset-fovoffset-src-mq3-client-playable-viewmodel-ml-735456162"></a>
### fovOffset

```ml
fovOffset
```

When constructing this record, `calculate` supplies `fovOffset(config.horizontalFov)` for this member. Used by `withRecoil` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L74)

<a id="field-field-mq3-client-playable-viewmodel-pose-origin-origin-src-mq3-client-playable-viewmodel-ml-1164204898"></a>
### origin

```ml
origin
```

Origin of the first-person weapon pose used to construct its model transform.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L66)

<a id="field-field-mq3-client-playable-viewmodel-pose-scale-scale-src-mq3-client-playable-viewmodel-ml-504660718"></a>
### scale

```ml
scale
```

When constructing this record, `calculate` supplies `config.modelScale` for this member. Used by `transform` and `attachWeapon` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L71)

<a id="field-field-mq3-client-playable-viewmodel-pose-xyspeed-xyspeed-src-mq3-client-playable-viewmodel-ml-269320046"></a>
### xySpeed

```ml
xySpeed
```

When constructing this record, `calculate` supplies `bob.xySpeed` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_viewmodel.ml#L82)
