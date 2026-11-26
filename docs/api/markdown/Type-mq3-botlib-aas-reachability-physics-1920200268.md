# `mq3.botlib.aas_reachability.Physics`

[Home](README.md) · [Source file](File-src-mq3-botlib-aas-reachability-ml-713478871.md)

<a id="struct-struct-mq3-botlib-aas-reachability-physics-struct-physics-src-mq3-botlib-aas-reachability-ml-1052885255"></a>
## Physics

```ml
struct Physics
```

`Physics` record for aas reachability, containing `gravity`, `jumpVelocity`, `maxVelocity`, `maxJumpFallHeight` and `step` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L69)

## Members

<a id="field-field-mq3-botlib-aas-reachability-physics-barrier-barrier-src-mq3-botlib-aas-reachability-ml-1349251314"></a>
### barrier

```ml
barrier
```

Maximum height crossed by a barrier jump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L81)

<a id="field-field-mq3-botlib-aas-reachability-physics-falldamage10-falldamage10-src-mq3-botlib-aas-reachability-ml-190676968"></a>
### fallDamage10

```ml
fallDamage10
```

Routing penalty assigned to the higher fall-damage category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L93)

<a id="field-field-mq3-botlib-aas-reachability-physics-falldamage5-falldamage5-src-mq3-botlib-aas-reachability-ml-1022672734"></a>
### fallDamage5

```ml
fallDamage5
```

Routing penalty assigned to the lower fall-damage category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L91)

<a id="field-field-mq3-botlib-aas-reachability-physics-falldelta10-falldelta10-src-mq3-botlib-aas-reachability-ml-1960916494"></a>
### fallDelta10

```ml
fallDelta10
```

Impact-velocity threshold for the higher fall-damage category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L89)

<a id="field-field-mq3-botlib-aas-reachability-physics-falldelta5-falldelta5-src-mq3-botlib-aas-reachability-ml-1952003450"></a>
### fallDelta5

```ml
fallDelta5
```

Impact-velocity threshold for the lower fall-damage category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L87)

<a id="field-field-mq3-botlib-aas-reachability-physics-gravity-gravity-src-mq3-botlib-aas-reachability-ml-1479656834"></a>
### gravity

```ml
gravity
```

Gravity magnitude used when predicting movement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L71)

<a id="field-field-mq3-botlib-aas-reachability-physics-jumpvelocity-jumpvelocity-src-mq3-botlib-aas-reachability-ml-1077456340"></a>
### jumpVelocity

```ml
jumpVelocity
```

Initial upward velocity applied when beginning a jump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L73)

<a id="field-field-mq3-botlib-aas-reachability-physics-maxjumpfallheight-maxjumpfallheight-src-mq3-botlib-aas-reachability-ml-537739870"></a>
### maxJumpFallHeight

```ml
maxJumpFallHeight
```

Maximum descent considered acceptable after a jump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L77)

<a id="field-field-mq3-botlib-aas-reachability-physics-maxvelocity-maxvelocity-src-mq3-botlib-aas-reachability-ml-2115141566"></a>
### maxVelocity

```ml
maxVelocity
```

Upper bound on velocity used by movement prediction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L75)

<a id="field-field-mq3-botlib-aas-reachability-physics-startwalkoff-startwalkoff-src-mq3-botlib-aas-reachability-ml-871186722"></a>
### startWalkOff

```ml
startWalkOff
```

Initial routing-cost penalty assigned when walking off a ledge.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L85)

<a id="field-field-mq3-botlib-aas-reachability-physics-step-step-src-mq3-botlib-aas-reachability-ml-887365970"></a>
### step

```ml
step
```

Maximum height crossed by an ordinary walking step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L79)

<a id="field-field-mq3-botlib-aas-reachability-physics-waterjump-waterjump-src-mq3-botlib-aas-reachability-ml-18809106"></a>
### waterJump

```ml
waterJump
```

Maximum obstacle height crossed when jumping out of water.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_reachability.ml#L83)
