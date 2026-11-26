# `mq3.botlib.aas_client_movement.Settings`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-client-movement-ml-551897611.md)

<a id="struct-struct-mq3-botlib-aas-client-movement-settings-struct-settings-src-mq3-botlib-aas-client-movement-ml-1185627879"></a>
## Settings

```ml
struct Settings
```

`Settings` record for aas client movement, containing `friction`, `stopspeed`, `gravity`, `waterfriction` and `watergravity` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_movement.ml#L60)

## Members

<a id="field-field-mq3-botlib-aas-client-movement-settings-airaccelerate-airaccelerate-src-mq3-botlib-aas-client-movement-ml-261611788"></a>
### airaccelerate

```ml
airaccelerate
```

Acceleration coefficient applied while the bot is airborne.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_movement.ml#L80)

<a id="field-field-mq3-botlib-aas-client-movement-settings-friction-friction-src-mq3-botlib-aas-client-movement-ml-1661439868"></a>
### friction

```ml
friction
```

Ground-friction coefficient used by movement prediction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_movement.ml#L62)

<a id="field-field-mq3-botlib-aas-client-movement-settings-gravity-gravity-src-mq3-botlib-aas-client-movement-ml-1046621948"></a>
### gravity

```ml
gravity
```

Gravity magnitude used when predicting movement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_movement.ml#L66)

<a id="field-field-mq3-botlib-aas-client-movement-settings-jumpvel-jumpvel-src-mq3-botlib-aas-client-movement-ml-34688872"></a>
### jumpvel

```ml
jumpvel
```

Initial upward velocity applied when beginning a jump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_movement.ml#L90)

<a id="field-field-mq3-botlib-aas-client-movement-settings-maxbarrier-maxbarrier-src-mq3-botlib-aas-client-movement-ml-723409310"></a>
### maxbarrier

```ml
maxbarrier
```

Maximum obstacle height accepted by a barrier-jump prediction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_movement.ml#L88)

<a id="field-field-mq3-botlib-aas-client-movement-settings-maxcrouchvelocity-maxcrouchvelocity-src-mq3-botlib-aas-client-movement-ml-764649244"></a>
### maxcrouchvelocity

```ml
maxcrouchvelocity
```

Maximum crouched movement speed allowed by movement prediction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_movement.ml#L74)

<a id="field-field-mq3-botlib-aas-client-movement-settings-maxsteepness-maxsteepness-src-mq3-botlib-aas-client-movement-ml-2129011980"></a>
### maxsteepness

```ml
maxsteepness
```

Steepness threshold separating walkable ground from an impassable slope.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_movement.ml#L86)

<a id="field-field-mq3-botlib-aas-client-movement-settings-maxstep-maxstep-src-mq3-botlib-aas-client-movement-ml-1281992584"></a>
### maxstep

```ml
maxstep
```

Maximum obstacle height that can be crossed by stepping.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_movement.ml#L84)

<a id="field-field-mq3-botlib-aas-client-movement-settings-maxswimvelocity-maxswimvelocity-src-mq3-botlib-aas-client-movement-ml-916607268"></a>
### maxswimvelocity

```ml
maxswimvelocity
```

Maximum swimming speed allowed by movement prediction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_movement.ml#L76)

<a id="field-field-mq3-botlib-aas-client-movement-settings-maxwalkvelocity-maxwalkvelocity-src-mq3-botlib-aas-client-movement-ml-109063864"></a>
### maxwalkvelocity

```ml
maxwalkvelocity
```

Maximum walking speed allowed by movement prediction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_movement.ml#L72)

<a id="field-field-mq3-botlib-aas-client-movement-settings-stopspeed-stopspeed-src-mq3-botlib-aas-client-movement-ml-846606752"></a>
### stopspeed

```ml
stopspeed
```

Minimum speed used when calculating ground-friction deceleration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_movement.ml#L64)

<a id="field-field-mq3-botlib-aas-client-movement-settings-swimaccelerate-swimaccelerate-src-mq3-botlib-aas-client-movement-ml-444491758"></a>
### swimaccelerate

```ml
swimaccelerate
```

Acceleration coefficient applied to swimming input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_movement.ml#L82)

<a id="field-field-mq3-botlib-aas-client-movement-settings-walkaccelerate-walkaccelerate-src-mq3-botlib-aas-client-movement-ml-1840679532"></a>
### walkaccelerate

```ml
walkaccelerate
```

Acceleration coefficient applied to grounded walking input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_movement.ml#L78)

<a id="field-field-mq3-botlib-aas-client-movement-settings-waterfriction-waterfriction-src-mq3-botlib-aas-client-movement-ml-1617421424"></a>
### waterfriction

```ml
waterfriction
```

Friction coefficient applied while the bot is swimming.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_movement.ml#L68)

<a id="field-field-mq3-botlib-aas-client-movement-settings-watergravity-watergravity-src-mq3-botlib-aas-client-movement-ml-2022730318"></a>
### watergravity

```ml
watergravity
```

Gravity magnitude used while the bot is submerged.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_client_movement.ml#L70)
