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

Forward `AAS_Accelerate` to `mq3.botlib.aas_client_movement.accelerate` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `velocity` | `dynamic` | — | Three-component movement velocity. |
| `frameTime` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.fmul`. |
| `wishDirection` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `wishSpeed` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.fsub`. |
| `acceleration` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.fmul`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L154)

<a id="function-function-mq3-botlib-be-aas-move-aas-againstladder-function-aas-againstladder-runtime-origin-src-mq3-botlib-be-aas-move-ml-780065788"></a>
### AAS_AgainstLadder

```ml
function AAS_AgainstLadder(runtime, origin)
```

Use `runtime.againstLadderFn` to perform `AAS_AgainstLadder`. Return paths include `runtime.againstLadderFn(runtime.context,origin)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Be AAS move runtime; accesses `againstLadderFn` and `context`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L81)

<a id="function-function-mq3-botlib-be-aas-move-aas-aircontrol-function-aas-aircontrol-start-finish-velocity-commandmove-src-mq3-botlib-be-aas-move-ml-895322494"></a>
### AAS_AirControl

```ml
function AAS_AirControl(start, finish, velocity, commandMove)
```

Apply `mq3.botlib.be_aas_move.subtract` while evaluating `AAS_AirControl`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `finish` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `velocity` | `dynamic` | — | Not read by this implementation; retained in the `AAS_AirControl` signature. |
| `commandMove` | `dynamic` | — | Not read by this implementation; retained in the `AAS_AirControl` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L162)

<a id="function-function-mq3-botlib-be-aas-move-aas-applyfriction-function-aas-applyfriction-velocity-friction-stopspeed-frametime-src-mq3-botlib-be-aas-move-ml-1625936474"></a>
### AAS_ApplyFriction

```ml
function AAS_ApplyFriction(velocity, friction, stopSpeed, frameTime)
```

Forward `AAS_ApplyFriction` to `mq3.botlib.aas_client_movement.applyFriction` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `velocity` | `dynamic` | — | Three-component movement velocity. |
| `friction` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.fmul`. |
| `stopSpeed` | `dynamic` | — | Value used by `applyFriction` in `if control<stopspeed then control=stopspeed end if`. |
| `frameTime` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.fmul`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L171)

<a id="function-function-mq3-botlib-be-aas-move-aas-bfgjumpzvelocity-function-aas-bfgjumpzvelocity-runtime-origin-src-mq3-botlib-be-aas-move-ml-721337410"></a>
### AAS_BFGJumpZVelocity

```ml
function AAS_BFGJumpZVelocity(runtime, origin)
```

Forward `AAS_BFGJumpZVelocity` to `mq3.botlib.be_aas_move.AAS_WeaponJumpZVelocity` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Be AAS move runtime; accesses `services` and `settings`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L146)

<a id="function-function-mq3-botlib-be-aas-move-aas-clientmovementhitbbox-function-aas-clientmovementhitbbox-runtime-entitynum-origin-presencetype-onground-velocity-commandmove-commandframes-maxframes-frametime-mins-maxs-visualize-src-mq3-botlib-be-aas-move-ml-260032548"></a>
### AAS_ClientMovementHitBBox

```ml
function AAS_ClientMovementHitBBox(runtime, entityNum, origin, presenceType, onGround, velocity, commandMove, commandFrames, maxFrames, frameTime, mins, maxs, visualize)
```

Forward `AAS_ClientMovementHitBBox` to `mq3.botlib.be_aas_move.AAS_ClientMovementPrediction` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Be AAS move runtime; accesses `services`. |
| `entityNum` | `dynamic` | — | Entity number in the game or AAS entity table. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `presenceType` | `dynamic` | — | AAS presence type selecting the movement bounds. |
| `onGround` | `dynamic` | — | Value used by `predictWithBBox` in `if onground or inWater then friction=cfg.waterfriction`. |
| `velocity` | `dynamic` | — | Three-component movement velocity. |
| `commandMove` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `commandFrames` | `dynamic` | — | Value used by `predictWithBBox` in `if frame<cmdframes then`. |
| `maxFrames` | `dynamic` | — | Value used by `predictWithBBox` in `while frame<maxframes`. |
| `frameTime` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.fmul`. |
| `mins` | `dynamic` | — | Minimum coordinates of the axis-aligned bounds. |
| `maxs` | `dynamic` | — | Maximum coordinates of the axis-aligned bounds. |
| `visualize` | `dynamic` | — | Value passed as argument 15 to `mq3.botlib.aas_client_movement.predictWithBBox`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L233)

<a id="function-function-mq3-botlib-be-aas-move-aas-clientmovementprediction-function-aas-clientmovementprediction-runtime-entitynum-origin-presencetype-onground-velocity-commandmove-commandframes-maxframes-frametime-stopevent-stopareanum-mins-maxs-visualize-src-mq3-botlib-be-aas-move-ml-709321799"></a>
### AAS_ClientMovementPrediction

```ml
function AAS_ClientMovementPrediction(runtime, entityNum, origin, presenceType, onGround, velocity, commandMove, commandFrames, maxFrames, frameTime, stopEvent, stopAreaNum, mins, maxs, visualize)
```

Forward `AAS_ClientMovementPrediction` to `mq3.botlib.aas_client_movement.predictWithBBox` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Be AAS move runtime; accesses `services`. |
| `entityNum` | `dynamic` | — | Entity number in the game or AAS entity table. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `presenceType` | `dynamic` | — | AAS presence type selecting the movement bounds. |
| `onGround` | `dynamic` | — | Value used by `predictWithBBox` in `if onground or inWater then friction=cfg.waterfriction`. |
| `velocity` | `dynamic` | — | Three-component movement velocity. |
| `commandMove` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `commandFrames` | `dynamic` | — | Value used by `predictWithBBox` in `if frame<cmdframes then`. |
| `maxFrames` | `dynamic` | — | Value used by `predictWithBBox` in `while frame<maxframes`. |
| `frameTime` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.fmul`. |
| `stopEvent` | `dynamic` | — | Operand used to evaluate the returned expression `stopped(s,org,frameVelocity,frametime,presence,event&stopevents,contents,frame,zeroTrace(),area)`. |
| `stopAreaNum` | `dynamic` | — | Value used by `stopped` in `if area>=0 then value.endarea=area end if`. |
| `mins` | `dynamic` | — | Minimum coordinates of the axis-aligned bounds. |
| `maxs` | `dynamic` | — | Maximum coordinates of the axis-aligned bounds. |
| `visualize` | `dynamic` | — | Value passed as argument 15 to `mq3.botlib.aas_client_movement.predictWithBBox`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L199)

<a id="function-function-mq3-botlib-be-aas-move-aas-cliptobbox-function-aas-cliptobbox-start-finish-presencetype-mins-maxs-src-mq3-botlib-be-aas-move-ml-260516552"></a>
### AAS_ClipToBBox

```ml
function AAS_ClipToBBox(start, finish, presenceType, mins, maxs)
```

Forward `AAS_ClipToBBox` to `mq3.botlib.aas_client_movement.clipToBBox` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `finish` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `presenceType` | `dynamic` | — | AAS presence type selecting the movement bounds. |
| `mins` | `dynamic` | — | Minimum coordinates of the axis-aligned bounds. |
| `maxs` | `dynamic` | — | Maximum coordinates of the axis-aligned bounds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L180)

<a id="function-function-mq3-botlib-be-aas-move-aas-droptofloor-function-aas-droptofloor-runtime-origin-mins-maxs-src-mq3-botlib-be-aas-move-ml-1778142316"></a>
### AAS_DropToFloor

```ml
function AAS_DropToFloor(runtime, origin, mins, maxs)
```

Set `origin[axis]` to `trace.endpos[axis]` in `mq3.botlib.be_aas_move.AAS_DropToFloor`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Be AAS move runtime; accesses `services`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. Entries may be updated in place. |
| `mins` | `dynamic` | — | Not read by this implementation; retained in the `AAS_DropToFloor` signature. |
| `maxs` | `dynamic` | — | Not read by this implementation; retained in the `AAS_DropToFloor` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L70)

<a id="function-function-mq3-botlib-be-aas-move-aas-horizontalvelocityforjump-function-aas-horizontalvelocityforjump-runtime-zvelocity-start-finish-src-mq3-botlib-be-aas-move-ml-1180066620"></a>
### AAS_HorizontalVelocityForJump

```ml
function AAS_HorizontalVelocityForJump(runtime, zVelocity, start, finish)
```

Apply `mq3.botlib.be_aas_move.subtract` while evaluating `AAS_HorizontalVelocityForJump`. Return paths include `[true,speed]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Be AAS move runtime; accesses `settings`. |
| `zVelocity` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.fdiv`. |
| `start` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `finish` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L251)

<a id="function-function-mq3-botlib-be-aas-move-aas-initsettings-function-aas-initsettings-src-mq3-botlib-be-aas-move-ml-1289301418"></a>
### AAS_InitSettings

```ml
function AAS_InitSettings()
```

Create a `mq3.botlib.be_aas_move.Settings` record, initializing `gravityDirection` as `[0.0,0.0,-1.0]`, `friction` as `6.0` and `stopSpeed` as `100.0`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L27)

<a id="function-function-mq3-botlib-be-aas-move-aas-jumpreachrunstart-function-aas-jumpreachrunstart-runtime-reach-src-mq3-botlib-be-aas-move-ml-1947220811"></a>
### AAS_JumpReachRunStart

```ml
function AAS_JumpReachRunStart(runtime, reach)
```

Apply `mq3.botlib.be_aas_move.normalize`, `mq3.botlib.be_aas_move.copy` and `mq3.botlib.be_aas_move.scale` while evaluating `AAS_JumpReachRunStart`. Return paths include `copy(result.endpos)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Be AAS move runtime; accesses `services`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `start` and `finish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L111)

<a id="function-function-mq3-botlib-be-aas-move-aas-onground-function-aas-onground-runtime-origin-presencetype-passentity-src-mq3-botlib-be-aas-move-ml-83817059"></a>
### AAS_OnGround

```ml
function AAS_OnGround(runtime, origin, presenceType, passEntity)
```

Forward `AAS_OnGround` to `mq3.botlib.aas_client_movement.onGround` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Be AAS move runtime; accesses `services` and `settings`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `presenceType` | `dynamic` | — | AAS presence type selecting the movement bounds. |
| `passEntity` | `dynamic` | — | Value passed as argument 5 to `s.traceFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L91)

<a id="function-function-mq3-botlib-be-aas-move-aas-predictclientmovement-function-aas-predictclientmovement-runtime-entitynum-origin-presencetype-onground-velocity-commandmove-commandframes-maxframes-frametime-stopevent-stopareanum-visualize-src-mq3-botlib-be-aas-move-ml-762221507"></a>
### AAS_PredictClientMovement

```ml
function AAS_PredictClientMovement(runtime, entityNum, origin, presenceType, onGround, velocity, commandMove, commandFrames, maxFrames, frameTime, stopEvent, stopAreaNum, visualize)
```

Forward `AAS_PredictClientMovement` to `mq3.botlib.aas_client_movement.predict` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Be AAS move runtime; accesses `services`. |
| `entityNum` | `dynamic` | — | Entity number in the game or AAS entity table. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `presenceType` | `dynamic` | — | AAS presence type selecting the movement bounds. |
| `onGround` | `dynamic` | — | Value used by `predictWithBBox` in `if onground or inWater then friction=cfg.waterfriction`. |
| `velocity` | `dynamic` | — | Three-component movement velocity. |
| `commandMove` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `commandFrames` | `dynamic` | — | Value used by `predictWithBBox` in `if frame<cmdframes then`. |
| `maxFrames` | `dynamic` | — | Value used by `predictWithBBox` in `while frame<maxframes`. |
| `frameTime` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.fmul`. |
| `stopEvent` | `dynamic` | — | Operand used to evaluate the returned expression `stopped(s,org,frameVelocity,frametime,presence,event&stopevents,contents,frame,zeroTrace(),area)`. |
| `stopAreaNum` | `dynamic` | — | Value used by `stopped` in `if area>=0 then value.endarea=area end if`. |
| `visualize` | `dynamic` | — | Value passed as argument 15 to `mq3.botlib.aas_client_movement.predictWithBBox`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L216)

<a id="function-function-mq3-botlib-be-aas-move-aas-rocketjumpzvelocity-function-aas-rocketjumpzvelocity-runtime-origin-src-mq3-botlib-be-aas-move-ml-1061566492"></a>
### AAS_RocketJumpZVelocity

```ml
function AAS_RocketJumpZVelocity(runtime, origin)
```

Forward `AAS_RocketJumpZVelocity` to `mq3.botlib.be_aas_move.AAS_WeaponJumpZVelocity` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Be AAS move runtime; accesses `services` and `settings`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L142)

<a id="function-function-mq3-botlib-be-aas-move-aas-setmovedir-function-aas-setmovedir-angles-src-mq3-botlib-be-aas-move-ml-221708926"></a>
### AAS_SetMovedir

```ml
function AAS_SetMovedir(angles)
```

Convert angles to a movement direction, recognizing the original straight-up and straight-down angle sentinels.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angles` | `dynamic` | — | Pitch, yaw and roll angles in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L102)

<a id="function-function-mq3-botlib-be-aas-move-aas-swimming-function-aas-swimming-runtime-origin-src-mq3-botlib-be-aas-move-ml-1506305754"></a>
### AAS_Swimming

```ml
function AAS_Swimming(runtime, origin)
```

Forward `AAS_Swimming` to `mq3.botlib.aas_client_movement.swimming` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Be AAS move runtime; accesses `services`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L98)

<a id="function-function-mq3-botlib-be-aas-move-aas-testmovementprediction-function-aas-testmovementprediction-runtime-entitynum-origin-direction-src-mq3-botlib-be-aas-move-ml-681352440"></a>
### AAS_TestMovementPrediction

```ml
function AAS_TestMovementPrediction(runtime, entityNum, origin, direction)
```

Use `runtime.debugClearFn` to perform `AAS_TestMovementPrediction`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Be AAS move runtime; accesses `debugClearFn` and `context`. |
| `entityNum` | `dynamic` | — | Entity number in the game or AAS entity table. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `direction` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L241)

<a id="function-function-mq3-botlib-be-aas-move-aas-weaponjumpzvelocity-function-aas-weaponjumpzvelocity-runtime-origin-radiusdamage-src-mq3-botlib-be-aas-move-ml-1795328117"></a>
### AAS_WeaponJumpZVelocity

```ml
function AAS_WeaponJumpZVelocity(runtime, origin, radiusDamage)
```

Use `runtime.services.traceFn` to perform `AAS_WeaponJumpZVelocity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Be AAS move runtime; accesses `services` and `settings`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `radiusDamage` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.fsub`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L125)

<a id="function-function-mq3-botlib-be-aas-move-add-function-add-a-b-src-mq3-botlib-be-aas-move-ml-2025490461"></a>
### add

```ml
function add(a, b)
```

Return a new array `[n.fadd(a[0],b[0]),n.fadd(a[1],b[1]),n.fadd(a[2],b[2])]` for `add`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `b` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L50)

<a id="function-function-mq3-botlib-be-aas-move-copy-function-copy-value-src-mq3-botlib-be-aas-move-ml-1736691095"></a>
### copy

```ml
function copy(value)
```

Copy `value[0]`, `value[1]` and `value[2]` into a new ordered array for be aas move.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L42)

<a id="function-function-mq3-botlib-be-aas-move-create-function-create-services-src-mq3-botlib-be-aas-move-ml-1208736530"></a>
### create

```ml
function create(services)
```

Create a `mq3.botlib.be_aas_move.Runtime` record, initializing `services` from `services` and `settings` as `AAS_InitSettings()`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Initial value stored in `mq3.botlib.be_aas_move.Runtime.services`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L36)

<a id="function-function-mq3-botlib-be-aas-move-length-function-length-value-src-mq3-botlib-be-aas-move-ml-2070494755"></a>
### length

```ml
function length(value)
```

Forward `length` to `mq3.compat.numeric.fsqrt` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L57)

<a id="function-function-mq3-botlib-be-aas-move-normalize-function-normalize-value-src-mq3-botlib-be-aas-move-ml-1615402201"></a>
### normalize

```ml
function normalize(value)
```

Apply `mq3.botlib.be_aas_move.length` and `mq3.botlib.be_aas_move.scale` while evaluating `normalize`. Return paths include `scale(value,n.fdiv(1.0,magnitude))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L60)

- [mq3.botlib.be_aas_move.Runtime](Type-mq3-botlib-be-aas-move-runtime-1181401265.md) — struct
<a id="function-function-mq3-botlib-be-aas-move-scale-function-scale-value-factor-src-mq3-botlib-be-aas-move-ml-1873118550"></a>
### scale

```ml
function scale(value, factor)
```

Return a new array `[n.fmul(value[0],factor),n.fmul(value[1],factor),n.fmul(value[2],factor)]` for `scale`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `factor` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.fmul`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L54)

- [mq3.botlib.be_aas_move.Settings](Type-mq3-botlib-be-aas-move-settings-79851474.md) — struct
<a id="function-function-mq3-botlib-be-aas-move-subtract-function-subtract-a-b-src-mq3-botlib-be-aas-move-ml-694074187"></a>
### subtract

```ml
function subtract(a, b)
```

Return a new array `[n.fsub(a[0],b[0]),n.fsub(a[1],b[1]),n.fsub(a[2],b[2])]` for `subtract`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `b` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_move.ml#L46)
