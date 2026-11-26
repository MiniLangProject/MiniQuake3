# `mq3.botlib.be_aas_move.Settings`

[Home](README.md) · [Source file](File-src-mq3-botlib-be-aas-move-ml-1175504309.md)

<a id="struct-struct-mq3-botlib-be-aas-move-settings-struct-settings-src-mq3-botlib-be-aas-move-ml-282811003"></a>
## Settings

```ml
struct Settings
```

`Settings` record for be aas move, containing `gravityDirection`, `friction`, `stopSpeed`, `gravity` and `waterFriction` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L12)

## Members

<a id="field-field-mq3-botlib-be-aas-move-settings-airaccelerate-airaccelerate-src-mq3-botlib-be-aas-move-ml-828657824"></a>
### airAccelerate

```ml
airAccelerate
```

Acceleration coefficient applied while the bot is airborne.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L36)

<a id="field-field-mq3-botlib-be-aas-move-settings-falldelta10-falldelta10-src-mq3-botlib-be-aas-move-ml-14707356"></a>
### fallDelta10

```ml
fallDelta10
```

Impact-velocity threshold for the higher fall-damage category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L52)

<a id="field-field-mq3-botlib-be-aas-move-settings-falldelta5-falldelta5-src-mq3-botlib-be-aas-move-ml-693280032"></a>
### fallDelta5

```ml
fallDelta5
```

Impact-velocity threshold for the lower fall-damage category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L50)

<a id="field-field-mq3-botlib-be-aas-move-settings-friction-friction-src-mq3-botlib-be-aas-move-ml-52769816"></a>
### friction

```ml
friction
```

Ground-friction coefficient used by movement prediction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L16)

<a id="field-field-mq3-botlib-be-aas-move-settings-gravity-gravity-src-mq3-botlib-be-aas-move-ml-1219606984"></a>
### gravity

```ml
gravity
```

Gravity magnitude used when predicting movement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L20)

<a id="field-field-mq3-botlib-be-aas-move-settings-gravitydirection-gravitydirection-src-mq3-botlib-be-aas-move-ml-1299980290"></a>
### gravityDirection

```ml
gravityDirection
```

Normalized direction in which gravity accelerates the moving bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L14)

<a id="field-field-mq3-botlib-be-aas-move-settings-jumpvelocity-jumpvelocity-src-mq3-botlib-be-aas-move-ml-1502712738"></a>
### jumpVelocity

```ml
jumpVelocity
```

Initial upward velocity applied when beginning a jump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L48)

<a id="field-field-mq3-botlib-be-aas-move-settings-maxbarrier-maxbarrier-src-mq3-botlib-be-aas-move-ml-2098076498"></a>
### maxBarrier

```ml
maxBarrier
```

Maximum obstacle height accepted by a barrier-jump prediction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L46)

<a id="field-field-mq3-botlib-be-aas-move-settings-maxcrouchvelocity-maxcrouchvelocity-src-mq3-botlib-be-aas-move-ml-2096650952"></a>
### maxCrouchVelocity

```ml
maxCrouchVelocity
```

Maximum crouched movement speed allowed by movement prediction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L30)

<a id="field-field-mq3-botlib-be-aas-move-settings-maxsteepness-maxsteepness-src-mq3-botlib-be-aas-move-ml-893882904"></a>
### maxSteepness

```ml
maxSteepness
```

Steepness threshold separating walkable ground from an impassable slope.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L42)

<a id="field-field-mq3-botlib-be-aas-move-settings-maxstep-maxstep-src-mq3-botlib-be-aas-move-ml-1740871748"></a>
### maxStep

```ml
maxStep
```

Maximum obstacle height that can be crossed by stepping.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L40)

<a id="field-field-mq3-botlib-be-aas-move-settings-maxswimvelocity-maxswimvelocity-src-mq3-botlib-be-aas-move-ml-2123825624"></a>
### maxSwimVelocity

```ml
maxSwimVelocity
```

Maximum swimming speed allowed by movement prediction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L32)

<a id="field-field-mq3-botlib-be-aas-move-settings-maxvelocity-maxvelocity-src-mq3-botlib-be-aas-move-ml-260168804"></a>
### maxVelocity

```ml
maxVelocity
```

Upper bound on velocity used by movement prediction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L26)

<a id="field-field-mq3-botlib-be-aas-move-settings-maxwalkvelocity-maxwalkvelocity-src-mq3-botlib-be-aas-move-ml-751298172"></a>
### maxWalkVelocity

```ml
maxWalkVelocity
```

Maximum walking speed allowed by movement prediction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L28)

<a id="field-field-mq3-botlib-be-aas-move-settings-maxwaterjump-maxwaterjump-src-mq3-botlib-be-aas-move-ml-1805197714"></a>
### maxWaterJump

```ml
maxWaterJump
```

Maximum obstacle height accepted by a jump out of water.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L44)

<a id="field-field-mq3-botlib-be-aas-move-settings-rsaircontrolledjumppad-rsaircontrolledjumppad-src-mq3-botlib-be-aas-move-ml-1261669176"></a>
### rsAirControlledJumpPad

```ml
rsAirControlledJumpPad
```

Routing-cost setting for air controlled jump pad.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L74)

<a id="field-field-mq3-botlib-be-aas-move-settings-rsbarrierjump-rsbarrierjump-src-mq3-botlib-be-aas-move-ml-1652432520"></a>
### rsBarrierJump

```ml
rsBarrierJump
```

Routing-cost setting for barrier jump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L58)

<a id="field-field-mq3-botlib-be-aas-move-settings-rsbfgjump-rsbfgjump-src-mq3-botlib-be-aas-move-ml-268987224"></a>
### rsBfgJump

```ml
rsBfgJump
```

Routing-cost setting for bfg jump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L70)

<a id="field-field-mq3-botlib-be-aas-move-settings-rsfalldamage10-rsfalldamage10-src-mq3-botlib-be-aas-move-ml-1210205736"></a>
### rsFallDamage10

```ml
rsFallDamage10
```

Routing-cost setting for fall damage10.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L82)

<a id="field-field-mq3-botlib-be-aas-move-settings-rsfalldamage5-rsfalldamage5-src-mq3-botlib-be-aas-move-ml-162923184"></a>
### rsFallDamage5

```ml
rsFallDamage5
```

Routing-cost setting for fall damage5.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L80)

<a id="field-field-mq3-botlib-be-aas-move-settings-rsfuncbob-rsfuncbob-src-mq3-botlib-be-aas-move-ml-127181184"></a>
### rsFuncBob

```ml
rsFuncBob
```

Routing-cost setting for func bob.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L76)

<a id="field-field-mq3-botlib-be-aas-move-settings-rsjumppad-rsjumppad-src-mq3-botlib-be-aas-move-ml-2085551620"></a>
### rsJumpPad

```ml
rsJumpPad
```

Routing-cost setting for jump pad.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L72)

<a id="field-field-mq3-botlib-be-aas-move-settings-rsmaxfallheight-rsmaxfallheight-src-mq3-botlib-be-aas-move-ml-397799624"></a>
### rsMaxFallHeight

```ml
rsMaxFallHeight
```

Routing-cost setting for max fall height.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L84)

<a id="field-field-mq3-botlib-be-aas-move-settings-rsmaxjumpfallheight-rsmaxjumpfallheight-src-mq3-botlib-be-aas-move-ml-859743960"></a>
### rsMaxJumpFallHeight

```ml
rsMaxJumpFallHeight
```

Routing-cost setting for max jump fall height.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L86)

<a id="field-field-mq3-botlib-be-aas-move-settings-rsrocketjump-rsrocketjump-src-mq3-botlib-be-aas-move-ml-1811579386"></a>
### rsRocketJump

```ml
rsRocketJump
```

Routing-cost setting for rocket jump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L68)

<a id="field-field-mq3-botlib-be-aas-move-settings-rsstartcrouch-rsstartcrouch-src-mq3-botlib-be-aas-move-ml-305719296"></a>
### rsStartCrouch

```ml
rsStartCrouch
```

Routing-cost setting for start crouch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L60)

<a id="field-field-mq3-botlib-be-aas-move-settings-rsstartelevator-rsstartelevator-src-mq3-botlib-be-aas-move-ml-113296760"></a>
### rsStartElevator

```ml
rsStartElevator
```

Routing-cost setting for start elevator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L78)

<a id="field-field-mq3-botlib-be-aas-move-settings-rsstartgrapple-rsstartgrapple-src-mq3-botlib-be-aas-move-ml-1130148516"></a>
### rsStartGrapple

```ml
rsStartGrapple
```

Routing-cost setting for start grapple.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L62)

<a id="field-field-mq3-botlib-be-aas-move-settings-rsstartjump-rsstartjump-src-mq3-botlib-be-aas-move-ml-13332144"></a>
### rsStartJump

```ml
rsStartJump
```

Routing-cost setting for start jump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L66)

<a id="field-field-mq3-botlib-be-aas-move-settings-rsstartwalkoffledge-rsstartwalkoffledge-src-mq3-botlib-be-aas-move-ml-974794824"></a>
### rsStartWalkOffLedge

```ml
rsStartWalkOffLedge
```

Routing-cost setting for start walk off ledge.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L64)

<a id="field-field-mq3-botlib-be-aas-move-settings-rsteleport-rsteleport-src-mq3-botlib-be-aas-move-ml-1797397988"></a>
### rsTeleport

```ml
rsTeleport
```

Routing-cost setting for teleport.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L56)

<a id="field-field-mq3-botlib-be-aas-move-settings-rswaterjump-rswaterjump-src-mq3-botlib-be-aas-move-ml-998907704"></a>
### rsWaterJump

```ml
rsWaterJump
```

Routing-cost setting for water jump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L54)

<a id="field-field-mq3-botlib-be-aas-move-settings-stopspeed-stopspeed-src-mq3-botlib-be-aas-move-ml-315590260"></a>
### stopSpeed

```ml
stopSpeed
```

Minimum speed used when calculating ground-friction deceleration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L18)

<a id="field-field-mq3-botlib-be-aas-move-settings-swimaccelerate-swimaccelerate-src-mq3-botlib-be-aas-move-ml-876462362"></a>
### swimAccelerate

```ml
swimAccelerate
```

Acceleration coefficient applied to swimming input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L38)

<a id="field-field-mq3-botlib-be-aas-move-settings-walkaccelerate-walkaccelerate-src-mq3-botlib-be-aas-move-ml-1248194104"></a>
### walkAccelerate

```ml
walkAccelerate
```

Acceleration coefficient applied to grounded walking input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L34)

<a id="field-field-mq3-botlib-be-aas-move-settings-waterfriction-waterfriction-src-mq3-botlib-be-aas-move-ml-948952300"></a>
### waterFriction

```ml
waterFriction
```

Friction coefficient applied while the bot is swimming.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L22)

<a id="field-field-mq3-botlib-be-aas-move-settings-watergravity-watergravity-src-mq3-botlib-be-aas-move-ml-1664067682"></a>
### waterGravity

```ml
waterGravity
```

Gravity magnitude used while the bot is submerged.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L24)
