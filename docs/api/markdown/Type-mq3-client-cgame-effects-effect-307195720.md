# `mq3.client.cgame_effects.Effect`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-effects-ml-498960699.md)

<a id="struct-struct-mq3-client-cgame-effects-effect-struct-effect-src-mq3-client-cgame-effects-ml-470313231"></a>
## Effect

```ml
struct Effect
```

An Effect contains every field written by cg_effects.c.  Unused scalar fields are zero and unused names are empty strings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L92)

## Members

<a id="field-field-mq3-client-cgame-effects-effect-angles-angles-src-mq3-client-cgame-effects-ml-1172831340"></a>
### angles

```ml
angles
```

Euler orientation used to place or animate the object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L119)

<a id="field-field-mq3-client-cgame-effects-effect-bouncefactor-bouncefactor-src-mq3-client-cgame-effects-ml-1450111758"></a>
### bounceFactor

```ml
bounceFactor
```

Velocity multiplier after an impact; zero stops the fragment and one preserves its speed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L135)

<a id="field-field-mq3-client-cgame-effects-effect-bouncesound-bouncesound-src-mq3-client-cgame-effects-ml-848632320"></a>
### bounceSound

```ml
bounceSound
```

Sound resource selected for the bounce event or effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L137)

<a id="field-field-mq3-client-cgame-effects-effect-boundary-boundary-src-mq3-client-cgame-effects-ml-1728194884"></a>
### boundary

```ml
boundary
```

Host service category recorded with a request emitted while constructing smoke, bubble, debris, and explosion effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L95)

<a id="field-field-mq3-client-cgame-effects-effect-channel-channel-src-mq3-client-cgame-effects-ml-1172684372"></a>
### channel

```ml
channel
```

When constructing this record, `effect` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L152)

<a id="field-field-mq3-client-cgame-effects-effect-color-color-src-mq3-client-cgame-effects-ml-1499650704"></a>
### color

```ml
color
```

Normalized RGBA tint and opacity from which the spawned effect computes its shader color.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L123)

<a id="field-field-mq3-client-cgame-effects-effect-dispatched-dispatched-src-mq3-client-cgame-effects-ml-1933394258"></a>
### dispatched

```ml
dispatched
```

True when this request is marked for native dispatch while constructing smoke, bubble, debris, and explosion effects; false when its native effect is suppressed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L155)

<a id="field-field-mq3-client-cgame-effects-effect-endtime-endtime-src-mq3-client-cgame-effects-ml-852165056"></a>
### endTime

```ml
endTime
```

When constructing this record, `effect` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L105)

<a id="field-field-mq3-client-cgame-effects-effect-entity-entity-src-mq3-client-cgame-effects-ml-854961478"></a>
### entity

```ml
entity
```

When constructing this record, `effect` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L150)

<a id="field-field-mq3-client-cgame-effects-effect-fadeintime-fadeintime-src-mq3-client-cgame-effects-ml-877312064"></a>
### fadeInTime

```ml
fadeInTime
```

When constructing this record, `effect` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L103)

<a id="field-field-mq3-client-cgame-effects-effect-flags-flags-src-mq3-client-cgame-effects-ml-479603996"></a>
### flags

```ml
flags
```

When constructing this record, `effect` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L109)

<a id="field-field-mq3-client-cgame-effects-effect-kind-kind-src-mq3-client-cgame-effects-ml-1224501412"></a>
### kind

```ml
kind
```

Effect or media category selecting the matching geometry, texture, or presentation behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L97)

<a id="field-field-mq3-client-cgame-effects-effect-letype-letype-src-mq3-client-cgame-effects-ml-1237411082"></a>
### leType

```ml
leType
```

Local-effect entity kind selecting its update and rendering behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L99)

<a id="field-field-mq3-client-cgame-effects-effect-liferate-liferate-src-mq3-client-cgame-effects-ml-995247928"></a>
### lifeRate

```ml
lifeRate
```

Reciprocal effect lifetime used to normalize the fade or growth fraction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L107)

<a id="field-field-mq3-client-cgame-effects-effect-light-light-src-mq3-client-cgame-effects-ml-909327592"></a>
### light

```ml
light
```

Dynamic-light intensity emitted by the local effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L146)

<a id="field-field-mq3-client-cgame-effects-effect-lightcolor-lightcolor-src-mq3-client-cgame-effects-ml-1768675418"></a>
### lightColor

```ml
lightColor
```

RGB components of the dynamic light emitted by the effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L148)

<a id="field-field-mq3-client-cgame-effects-effect-marktype-marktype-src-mq3-client-cgame-effects-ml-1073111294"></a>
### markType

```ml
markType
```

When constructing this record, `effect` supplies `LEMT_NONE` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L139)

<a id="field-field-mq3-client-cgame-effects-effect-model-model-src-mq3-client-cgame-effects-ml-103150164"></a>
### model

```ml
model
```

Model resource selected for rendering the object.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L127)

<a id="field-field-mq3-client-cgame-effects-effect-oldposition-oldposition-src-mq3-client-cgame-effects-ml-2071071108"></a>
### oldPosition

```ml
oldPosition
```

When constructing this record, `effect` supplies `[0.0,0.0,0.0]` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L115)

<a id="field-field-mq3-client-cgame-effects-effect-position-position-src-mq3-client-cgame-effects-ml-589002450"></a>
### position

```ml
position
```

When constructing this record, `effect` supplies `[0.0,0.0,0.0]` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L113)

<a id="field-field-mq3-client-cgame-effects-effect-radius-radius-src-mq3-client-cgame-effects-ml-507367348"></a>
### radius

```ml
radius
```

World-space radius supplied when creating a smoke puff, bubble, or other temporary effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L121)

<a id="field-field-mq3-client-cgame-effects-effect-renderfx-renderfx-src-mq3-client-cgame-effects-ml-1298649260"></a>
### renderfx

```ml
renderfx
```

Renderer-entity flags controlling lighting, view restrictions, depth handling, and related effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L144)

<a id="field-field-mq3-client-cgame-effects-effect-retype-retype-src-mq3-client-cgame-effects-ml-189746886"></a>
### reType

```ml
reType
```

When constructing this record, `effect` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L141)

<a id="field-field-mq3-client-cgame-effects-effect-rotation-rotation-src-mq3-client-cgame-effects-ml-1787897708"></a>
### rotation

```ml
rotation
```

When constructing this record, `effect` supplies `0.0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L133)

<a id="field-field-mq3-client-cgame-effects-effect-shader-shader-src-mq3-client-cgame-effects-ml-322434846"></a>
### shader

```ml
shader
```

Material selected for the spawned smoke, bubble, teleport, or other temporary visual effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L129)

<a id="field-field-mq3-client-cgame-effects-effect-shadercolor-shadercolor-src-mq3-client-cgame-effects-ml-1633347532"></a>
### shaderColor

```ml
shaderColor
```

When constructing this record, `effect` supplies `[0.0,0.0,0.0,0.0]` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L125)

<a id="field-field-mq3-client-cgame-effects-effect-shadertime-shadertime-src-mq3-client-cgame-effects-ml-2140097496"></a>
### shaderTime

```ml
shaderTime
```

When constructing this record, `effect` supplies `0.0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L131)

<a id="field-field-mq3-client-cgame-effects-effect-starttime-starttime-src-mq3-client-cgame-effects-ml-2037681288"></a>
### startTime

```ml
startTime
```

When constructing this record, `effect` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L101)

<a id="field-field-mq3-client-cgame-effects-effect-trajectorytype-trajectorytype-src-mq3-client-cgame-effects-ml-1110152870"></a>
### trajectoryType

```ml
trajectoryType
```

When constructing this record, `effect` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L111)

<a id="field-field-mq3-client-cgame-effects-effect-velocity-velocity-src-mq3-client-cgame-effects-ml-915376022"></a>
### velocity

```ml
velocity
```

Linear rate of change of position used by movement or effect integration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_effects.ml#L117)
