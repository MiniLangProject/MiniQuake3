# `src/mq3/botlib/be_aas_move.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.be_aas_move`](Package-mq3-botlib-be-aas-move-1164263979.md)

Reachable from entry: **no**

## Imports

- `mq3/botlib/aas_client_movement.ml` as `movement` → [src/mq3/botlib/aas_client_movement.ml](File-src-mq3-botlib-aas-client-movement-ml-551897611.md)
- `mq3/botlib/aas_runtime.ml` as `aasRuntime` → [src/mq3/botlib/aas_runtime.ml](File-src-mq3-botlib-aas-runtime-ml-1322908116.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-botlib-be-aas-move-aas-accelerate-function-aas-accelerate-velocity-frametime-wishdirection-wishspeed-acceleration-src-mq3-botlib-be-aas-move-ml-1285795585"></a>
### AAS_Accelerate

```ml
function AAS_Accelerate(velocity, frameTime, wishDirection, wishSpeed, acceleration)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `velocity` | `dynamic` | — |  |
| `frameTime` | `dynamic` | — |  |
| `wishDirection` | `dynamic` | — |  |
| `wishSpeed` | `dynamic` | — |  |
| `acceleration` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L97)

<a id="function-function-mq3-botlib-be-aas-move-aas-againstladder-function-aas-againstladder-runtime-origin-src-mq3-botlib-be-aas-move-ml-780065788"></a>
### AAS_AgainstLadder

```ml
function AAS_AgainstLadder(runtime, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L53)

<a id="function-function-mq3-botlib-be-aas-move-aas-aircontrol-function-aas-aircontrol-start-finish-velocity-commandmove-src-mq3-botlib-be-aas-move-ml-895322494"></a>
### AAS_AirControl

```ml
function AAS_AirControl(start, finish, velocity, commandMove)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |
| `commandMove` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L100)

<a id="function-function-mq3-botlib-be-aas-move-aas-applyfriction-function-aas-applyfriction-velocity-friction-stopspeed-frametime-src-mq3-botlib-be-aas-move-ml-1625936474"></a>
### AAS_ApplyFriction

```ml
function AAS_ApplyFriction(velocity, friction, stopSpeed, frameTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `velocity` | `dynamic` | — |  |
| `friction` | `dynamic` | — |  |
| `stopSpeed` | `dynamic` | — |  |
| `frameTime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L104)

<a id="function-function-mq3-botlib-be-aas-move-aas-bfgjumpzvelocity-function-aas-bfgjumpzvelocity-runtime-origin-src-mq3-botlib-be-aas-move-ml-721337410"></a>
### AAS_BFGJumpZVelocity

```ml
function AAS_BFGJumpZVelocity(runtime, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L95)

<a id="function-function-mq3-botlib-be-aas-move-aas-clientmovementhitbbox-function-aas-clientmovementhitbbox-runtime-entitynum-origin-presencetype-onground-velocity-commandmove-commandframes-maxframes-frametime-mins-maxs-visualize-src-mq3-botlib-be-aas-move-ml-260032548"></a>
### AAS_ClientMovementHitBBox

```ml
function AAS_ClientMovementHitBBox(runtime, entityNum, origin, presenceType, onGround, velocity, commandMove, commandFrames, maxFrames, frameTime, mins, maxs, visualize)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `entityNum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `presenceType` | `dynamic` | — |  |
| `onGround` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |
| `commandMove` | `dynamic` | — |  |
| `commandFrames` | `dynamic` | — |  |
| `maxFrames` | `dynamic` | — |  |
| `frameTime` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `visualize` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L116)

<a id="function-function-mq3-botlib-be-aas-move-aas-clientmovementprediction-function-aas-clientmovementprediction-runtime-entitynum-origin-presencetype-onground-velocity-commandmove-commandframes-maxframes-frametime-stopevent-stopareanum-mins-maxs-visualize-src-mq3-botlib-be-aas-move-ml-709321799"></a>
### AAS_ClientMovementPrediction

```ml
function AAS_ClientMovementPrediction(runtime, entityNum, origin, presenceType, onGround, velocity, commandMove, commandFrames, maxFrames, frameTime, stopEvent, stopAreaNum, mins, maxs, visualize)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `entityNum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `presenceType` | `dynamic` | — |  |
| `onGround` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |
| `commandMove` | `dynamic` | — |  |
| `commandFrames` | `dynamic` | — |  |
| `maxFrames` | `dynamic` | — |  |
| `frameTime` | `dynamic` | — |  |
| `stopEvent` | `dynamic` | — |  |
| `stopAreaNum` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `visualize` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L110)

<a id="function-function-mq3-botlib-be-aas-move-aas-cliptobbox-function-aas-cliptobbox-start-finish-presencetype-mins-maxs-src-mq3-botlib-be-aas-move-ml-260516552"></a>
### AAS_ClipToBBox

```ml
function AAS_ClipToBBox(start, finish, presenceType, mins, maxs)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `presenceType` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L107)

<a id="function-function-mq3-botlib-be-aas-move-aas-droptofloor-function-aas-droptofloor-runtime-origin-mins-maxs-src-mq3-botlib-be-aas-move-ml-1778142316"></a>
### AAS_DropToFloor

```ml
function AAS_DropToFloor(runtime, origin, mins, maxs)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L45)

<a id="function-function-mq3-botlib-be-aas-move-aas-horizontalvelocityforjump-function-aas-horizontalvelocityforjump-runtime-zvelocity-start-finish-src-mq3-botlib-be-aas-move-ml-1180066620"></a>
### AAS_HorizontalVelocityForJump

```ml
function AAS_HorizontalVelocityForJump(runtime, zVelocity, start, finish)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `zVelocity` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L124)

<a id="function-function-mq3-botlib-be-aas-move-aas-initsettings-function-aas-initsettings-src-mq3-botlib-be-aas-move-ml-1289301418"></a>
### AAS_InitSettings

```ml
function AAS_InitSettings()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L24)

<a id="function-function-mq3-botlib-be-aas-move-aas-jumpreachrunstart-function-aas-jumpreachrunstart-runtime-reach-src-mq3-botlib-be-aas-move-ml-1947220811"></a>
### AAS_JumpReachRunStart

```ml
function AAS_JumpReachRunStart(runtime, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L70)

<a id="function-function-mq3-botlib-be-aas-move-aas-onground-function-aas-onground-runtime-origin-presencetype-passentity-src-mq3-botlib-be-aas-move-ml-83817059"></a>
### AAS_OnGround

```ml
function AAS_OnGround(runtime, origin, presenceType, passEntity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `presenceType` | `dynamic` | — |  |
| `passEntity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L58)

<a id="function-function-mq3-botlib-be-aas-move-aas-predictclientmovement-function-aas-predictclientmovement-runtime-entitynum-origin-presencetype-onground-velocity-commandmove-commandframes-maxframes-frametime-stopevent-stopareanum-visualize-src-mq3-botlib-be-aas-move-ml-762221507"></a>
### AAS_PredictClientMovement

```ml
function AAS_PredictClientMovement(runtime, entityNum, origin, presenceType, onGround, velocity, commandMove, commandFrames, maxFrames, frameTime, stopEvent, stopAreaNum, visualize)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `entityNum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `presenceType` | `dynamic` | — |  |
| `onGround` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |
| `commandMove` | `dynamic` | — |  |
| `commandFrames` | `dynamic` | — |  |
| `maxFrames` | `dynamic` | — |  |
| `frameTime` | `dynamic` | — |  |
| `stopEvent` | `dynamic` | — |  |
| `stopAreaNum` | `dynamic` | — |  |
| `visualize` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L113)

<a id="function-function-mq3-botlib-be-aas-move-aas-rocketjumpzvelocity-function-aas-rocketjumpzvelocity-runtime-origin-src-mq3-botlib-be-aas-move-ml-1061566492"></a>
### AAS_RocketJumpZVelocity

```ml
function AAS_RocketJumpZVelocity(runtime, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L94)

<a id="function-function-mq3-botlib-be-aas-move-aas-setmovedir-function-aas-setmovedir-angles-src-mq3-botlib-be-aas-move-ml-221708926"></a>
### AAS_SetMovedir

```ml
function AAS_SetMovedir(angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L64)

<a id="function-function-mq3-botlib-be-aas-move-aas-swimming-function-aas-swimming-runtime-origin-src-mq3-botlib-be-aas-move-ml-1506305754"></a>
### AAS_Swimming

```ml
function AAS_Swimming(runtime, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L62)

<a id="function-function-mq3-botlib-be-aas-move-aas-testmovementprediction-function-aas-testmovementprediction-runtime-entitynum-origin-direction-src-mq3-botlib-be-aas-move-ml-681352440"></a>
### AAS_TestMovementPrediction

```ml
function AAS_TestMovementPrediction(runtime, entityNum, origin, direction)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `entityNum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L119)

<a id="function-function-mq3-botlib-be-aas-move-aas-weaponjumpzvelocity-function-aas-weaponjumpzvelocity-runtime-origin-radiusdamage-src-mq3-botlib-be-aas-move-ml-1795328117"></a>
### AAS_WeaponJumpZVelocity

```ml
function AAS_WeaponJumpZVelocity(runtime, origin, radiusDamage)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `radiusDamage` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L80)

<a id="function-function-mq3-botlib-be-aas-move-add-function-add-a-b-src-mq3-botlib-be-aas-move-ml-2025490461"></a>
### add

```ml
function add(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L37)

<a id="function-function-mq3-botlib-be-aas-move-copy-function-copy-value-src-mq3-botlib-be-aas-move-ml-1736691095"></a>
### copy

```ml
function copy(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L35)

<a id="function-function-mq3-botlib-be-aas-move-create-function-create-services-src-mq3-botlib-be-aas-move-ml-1208736530"></a>
### create

```ml
function create(services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L31)

<a id="function-function-mq3-botlib-be-aas-move-length-function-length-value-src-mq3-botlib-be-aas-move-ml-2070494755"></a>
### length

```ml
function length(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L39)

<a id="function-function-mq3-botlib-be-aas-move-normalize-function-normalize-value-src-mq3-botlib-be-aas-move-ml-1615402201"></a>
### normalize

```ml
function normalize(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L40)

- [mq3.botlib.be_aas_move.Runtime](Type-mq3-botlib-be-aas-move-runtime-1181401265.md) — struct
<a id="function-function-mq3-botlib-be-aas-move-scale-function-scale-value-factor-src-mq3-botlib-be-aas-move-ml-1873118550"></a>
### scale

```ml
function scale(value, factor)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `factor` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L38)

- [mq3.botlib.be_aas_move.Settings](Type-mq3-botlib-be-aas-move-settings-79851474.md) — struct
<a id="function-function-mq3-botlib-be-aas-move-subtract-function-subtract-a-b-src-mq3-botlib-be-aas-move-ml-694074187"></a>
### subtract

```ml
function subtract(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L36)
