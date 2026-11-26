# `src/mq3/botlib/be_ai_move.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.be_ai_move`](Package-mq3-botlib-be-ai-move-1922511304.md)

Reachable from entry: **no**

## Imports

- `mq3/botlib/aas_routing.ml` as `routing` → [src/mq3/botlib/aas_routing.ml](File-src-mq3-botlib-aas-routing-ml-230871418.md)
- `mq3/botlib/aas_runtime.ml` as `moveAas` → [src/mq3/botlib/aas_runtime.ml](File-src-mq3-botlib-aas-runtime-ml-1322908116.md)
- `mq3/botlib/ai_avoid_spots.ml` as `avoid` → [src/mq3/botlib/ai_avoid_spots.ml](File-src-mq3-botlib-ai-avoid-spots-ml-627085596.md)
- `mq3/botlib/ai_move_runtime.ml` as `move` → [src/mq3/botlib/ai_move_runtime.ml](File-src-mq3-botlib-ai-move-runtime-ml-1991141291.md)
- `mq3/botlib/ai_predict_visible_position.ml` as `predict` → [src/mq3/botlib/ai_predict_visible_position.ml](File-src-mq3-botlib-ai-predict-visible-position-ml-125650055.md)
- `mq3/botlib/ai_resource_pools.ml` as `pools` → [src/mq3/botlib/ai_resource_pools.ml](File-src-mq3-botlib-ai-resource-pools-ml-103445473.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-botlib-be-ai-move-absfloat-function-absfloat-value-src-mq3-botlib-be-ai-move-ml-1296957397"></a>
### absFloat

```ml
function absFloat(value)
```

Return the absolute value of the numeric argument for be ai move.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `0.0-value`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L82)

- [mq3.botlib.be_ai_move.Adapter](Type-mq3-botlib-be-ai-move-adapter-2002977585.md) — struct
<a id="function-function-mq3-botlib-be-ai-move-anglediff-function-anglediff-ang1-ang2-src-mq3-botlib-be-ai-move-ml-2006373749"></a>
### AngleDiff

```ml
function AngleDiff(ang1, ang2)
```

Forward `AngleDiff` to `mq3.botlib.ai_move_runtime.angleDiff` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ang1` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.fsub`. |
| `ang2` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.fsub`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L87)

<a id="constant-constant-mq3-botlib-be-ai-move-avoid-always-const-avoid-always-1-src-mq3-botlib-be-ai-move-ml-1528824628"></a>
### AVOID_ALWAYS

```ml
const AVOID_ALWAYS = 1
```

Avoidance-spot mode that always rejects paths through the spot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L29)

<a id="constant-constant-mq3-botlib-be-ai-move-avoid-clear-const-avoid-clear-0-src-mq3-botlib-be-ai-move-ml-1893825813"></a>
### AVOID_CLEAR

```ml
const AVOID_CLEAR = 0
```

Avoidance-spot mode that removes the previously registered spots.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L27)

<a id="constant-constant-mq3-botlib-be-ai-move-avoid-dontblock-const-avoid-dontblock-2-src-mq3-botlib-be-ai-move-ml-1943895339"></a>
### AVOID_DONTBLOCK

```ml
const AVOID_DONTBLOCK = 2
```

Avoidance-spot mode that influences path choice without blocking all movement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L31)

<a id="function-function-mq3-botlib-be-ai-move-botaddavoidspot-function-botaddavoidspot-adapter-handle-origin-radius-type-src-mq3-botlib-be-ai-move-ml-1431653795"></a>
### BotAddAvoidSpot

```ml
function BotAddAvoidSpot(adapter, handle, origin, radius, type)
```

Apply `mq3.botlib.ai_avoid_spots.add` while evaluating `BotAddAvoidSpot`. Return paths include `avoid.add(adapter.runtime.pools,handle,origin,radius,type)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `handle` | `dynamic` | — | Resource handle resolved by the owning pool or host service. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `radius` | `dynamic` | — | Radius used by the spatial or damage query. |
| `type` | `dynamic` | — | Value used by `add` in `if type==AVOID_CLEAR then state.numAvoidSpots=0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L177)

<a id="function-function-mq3-botlib-be-ai-move-botaddtoavoidreach-function-botaddtoavoidreach-adapter-state-number-avoidtime-src-mq3-botlib-be-ai-move-ml-1812118947"></a>
### BotAddToAvoidReach

```ml
function BotAddToAvoidReach(adapter, state, number, avoidTime)
```

Update `state.avoidReachTries[index]`, `state.avoidReachTimes[index]` and `state.avoidReach[index]` during `BotAddToAvoidReach`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | Be AI move state; accesses `avoidReach`, `avoidReachTimes` and `avoidReachTries`. May update `state.avoidReachTries[index]`, `state.avoidReachTimes[index]` and `state.avoidReach[index]` in place. |
| `number` | `dynamic` | — | Value used by `BotAddToAvoidReach` in `if state.avoidReach[index]==number then if state.avoidReachTimes[index]>now then state.avoidReachTries[index]=st...`. |
| `avoidTime` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.fadd`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L133)

<a id="function-function-mq3-botlib-be-ai-move-botaddtotarget-function-botaddtotarget-start-finish-maxdistance-travelled-target-src-mq3-botlib-be-ai-move-ml-786931064"></a>
### BotAddToTarget

```ml
function BotAddToTarget(start, finish, maxDistance, travelled, target)
```

Forward `BotAddToTarget` to `mq3.botlib.ai_move_runtime.addToTarget` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — | World-space start of the current path segment. |
| `finish` | `dynamic` | — | World-space end of the current path segment. |
| `maxDistance` | `dynamic` | — | Maximum distance to advance along the path. |
| `travelled` | `dynamic` | — | Distance already accumulated before this segment. |
| `target` | `dynamic` | — | Mutable three-component look-ahead target written when the requested distance falls on this segment. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L223)

<a id="function-function-mq3-botlib-be-ai-move-botaircontrol-function-botaircontrol-adapter-origin-velocity-goal-src-mq3-botlib-be-ai-move-ml-547858121"></a>
### BotAirControl

```ml
function BotAirControl(adapter, origin, velocity, goal)
```

Forward `BotAirControl` to `mq3.botlib.ai_move_runtime.airControl` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `velocity` | `dynamic` | — | Three-component movement velocity. |
| `goal` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L403)

<a id="function-function-mq3-botlib-be-ai-move-botallocmovestate-function-botallocmovestate-adapter-src-mq3-botlib-be-ai-move-ml-907601267"></a>
### BotAllocMoveState

```ml
function BotAllocMoveState(adapter)
```

Apply `mq3.botlib.ai_resource_pools.allocMoveState` while evaluating `BotAllocMoveState`. Return paths include `pools.allocMoveState(adapter.runtime.pools)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L91)

<a id="function-function-mq3-botlib-be-ai-move-botavoidspots-function-botavoidspots-origin-reach-spots-numspots-src-mq3-botlib-be-ai-move-ml-1310553241"></a>
### BotAvoidSpots

```ml
function BotAvoidSpots(origin, reach, spots, numSpots)
```

Apply `mq3.botlib.be_ai_move.DistanceFromLineSquared` and `mq3.botlib.be_ai_move.VectorDistanceSquared` while evaluating `BotAvoidSpots`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `travelType`, `start` and `finish`. |
| `spots` | `dynamic` | — | Array or byte sequence accessed at `index`. |
| `numSpots` | `dynamic` | — | Value used by `BotAvoidSpots` in `if numSpots>len(spots) then numSpots=len(spots) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L157)

<a id="function-function-mq3-botlib-be-ai-move-botcheckbarrierjump-function-botcheckbarrierjump-adapter-state-direction-speed-src-mq3-botlib-be-ai-move-ml-896509968"></a>
### BotCheckBarrierJump

```ml
function BotCheckBarrierJump(adapter, state, direction, speed)
```

Forward `BotCheckBarrierJump` to `mq3.botlib.ai_move_runtime.checkBarrierJump` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `moveFlags`. May update `state.moveFlags` in place. |
| `direction` | `dynamic` | — | Array or byte sequence accessed at `0` and `1`. |
| `speed` | `dynamic` | — | Requested movement speed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L306)

<a id="function-function-mq3-botlib-be-ai-move-botcheckblocked-function-botcheckblocked-adapter-state-direction-checkbottom-result-src-mq3-botlib-be-ai-move-ml-308205043"></a>
### BotCheckBlocked

```ml
function BotCheckBlocked(adapter, state, direction, checkBottom, result)
```

Forward `BotCheckBlocked` to `mq3.botlib.ai_move_runtime.checkBlocked` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | Value passed as argument 2 to `runtime.services.blockTraceFn`. |
| `direction` | `dynamic` | — | Value passed as argument 3 to `runtime.services.blockTraceFn`. |
| `checkBottom` | `dynamic` | — | Value passed as argument 4 to `runtime.services.blockTraceFn`. |
| `result` | `dynamic` | — | Result record; accesses `blocked` and `blockEntity`. May update `result.blocked` and `result.blockEntity` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L346)

<a id="function-function-mq3-botlib-be-ai-move-botclearmoveresult-function-botclearmoveresult-result-src-mq3-botlib-be-ai-move-ml-627036917"></a>
### BotClearMoveResult

```ml
function BotClearMoveResult(result)
```

Update `result.failure`, `result.type`, `result.blocked` and `result.blockEntity` and related state during `BotClearMoveResult`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — | Result record; accesses `failure`, `type`, `blocked`, `blockEntity` and `travelType` and related fields. May update `result.failure`, `result.type` and `result.blocked` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L349)

<a id="function-function-mq3-botlib-be-ai-move-botfinishtravel-barrierjump-function-botfinishtravel-barrierjump-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-636878099"></a>
### BotFinishTravel_BarrierJump

```ml
function BotFinishTravel_BarrierJump(adapter, state, reach)
```

Forward `BotFinishTravel_BarrierJump` to `mq3.botlib.ai_move_runtime.finishTravelBarrierJump` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `velocity` and `origin`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `finish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L377)

<a id="function-function-mq3-botlib-be-ai-move-botfinishtravel-elevator-function-botfinishtravel-elevator-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-1443412227"></a>
### BotFinishTravel_Elevator

```ml
function BotFinishTravel_Elevator(adapter, state, reach)
```

Forward `BotFinishTravel_Elevator` to `mq3.botlib.ai_move_runtime.finishTravelElevator` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `origin`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `finish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L438)

<a id="function-function-mq3-botlib-be-ai-move-botfinishtravel-funcbobbing-function-botfinishtravel-funcbobbing-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-483757123"></a>
### BotFinishTravel_FuncBobbing

```ml
function BotFinishTravel_FuncBobbing(adapter, state, reach)
```

Forward `BotFinishTravel_FuncBobbing` to `mq3.botlib.ai_move_runtime.finishTravelFuncBob` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `moveFlags` and `origin`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `finish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L460)

<a id="function-function-mq3-botlib-be-ai-move-botfinishtravel-jump-function-botfinishtravel-jump-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-635997583"></a>
### BotFinishTravel_Jump

```ml
function BotFinishTravel_Jump(adapter, state, reach)
```

Forward `BotFinishTravel_Jump` to `mq3.botlib.ai_move_runtime.finishTravelJump` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `jumpReach` and `origin`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `finish` and `start`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L418)

<a id="function-function-mq3-botlib-be-ai-move-botfinishtravel-jumppad-function-botfinishtravel-jumppad-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-1078383287"></a>
### BotFinishTravel_JumpPad

```ml
function BotFinishTravel_JumpPad(adapter, state, reach)
```

Forward `BotFinishTravel_JumpPad` to `mq3.botlib.ai_move_runtime.finishTravelJumpPad` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `origin` and `velocity`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `finish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L499)

<a id="function-function-mq3-botlib-be-ai-move-botfinishtravel-walk-function-botfinishtravel-walk-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-2080074323"></a>
### BotFinishTravel_Walk

```ml
function BotFinishTravel_Walk(adapter, state, reach)
```

Apply `mq3.botlib.ai_move_runtime.emptyMoveResult`, `mq3.botlib.ai_move_runtime.normalize` and `mq3.botlib.ai_move_runtime.emitMovement` while evaluating `BotFinishTravel_Walk`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | Be AI move state; accesses `origin`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `finish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L360)

<a id="function-function-mq3-botlib-be-ai-move-botfinishtravel-walkoffledge-function-botfinishtravel-walkoffledge-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-526846895"></a>
### BotFinishTravel_WalkOffLedge

```ml
function BotFinishTravel_WalkOffLedge(adapter, state, reach)
```

Forward `BotFinishTravel_WalkOffLedge` to `mq3.botlib.ai_move_runtime.finishTravelWalkOffLedge` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `origin` and `velocity`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `finish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L408)

<a id="function-function-mq3-botlib-be-ai-move-botfinishtravel-waterjump-function-botfinishtravel-waterjump-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-1543748707"></a>
### BotFinishTravel_WaterJump

```ml
function BotFinishTravel_WaterJump(adapter, state, reach)
```

Forward `BotFinishTravel_WaterJump` to `mq3.botlib.ai_move_runtime.finishTravelWaterJump` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `moveFlags` and `origin`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `finish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L392)

<a id="function-function-mq3-botlib-be-ai-move-botfinishtravel-weaponjump-function-botfinishtravel-weaponjump-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-1368231431"></a>
### BotFinishTravel_WeaponJump

```ml
function BotFinishTravel_WeaponJump(adapter, state, reach)
```

Forward `BotFinishTravel_WeaponJump` to `mq3.botlib.ai_move_runtime.finishTravelWeaponJump` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `jumpReach`, `origin` and `velocity`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `finish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L489)

<a id="function-function-mq3-botlib-be-ai-move-botfreemovestate-function-botfreemovestate-adapter-handle-src-mq3-botlib-be-ai-move-ml-1662774481"></a>
### BotFreeMoveState

```ml
function BotFreeMoveState(adapter, handle)
```

Apply `mq3.botlib.ai_resource_pools.freeMoveState` while evaluating `BotFreeMoveState`. Return paths include `pools.freeMoveState(adapter.runtime.pools,handle)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot movement state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L95)

<a id="function-function-mq3-botlib-be-ai-move-botfuncbobstartend-function-botfuncbobstartend-adapter-reach-src-mq3-botlib-be-ai-move-ml-973852502"></a>
### BotFuncBobStartEnd

```ml
function BotFuncBobStartEnd(adapter, reach)
```

Use `adapter.moverInfoFn` to perform `BotFuncBobStartEnd`. Return paths include `[start,finish,origin]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `moverInfoFn` and `context`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `faceNum` and `edgeNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L446)

<a id="function-function-mq3-botlib-be-ai-move-botfuzzypointreachabilityarea-function-botfuzzypointreachabilityarea-adapter-origin-src-mq3-botlib-be-ai-move-ml-1453381903"></a>
### BotFuzzyPointReachabilityArea

```ml
function BotFuzzyPointReachabilityArea(adapter, origin)
```

Forward `BotFuzzyPointReachabilityArea` to `mq3.botlib.ai_move_runtime.fuzzyPointReachabilityArea` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L121)

<a id="function-function-mq3-botlib-be-ai-move-botgapdistance-function-botgapdistance-adapter-origin-horizontaldirection-entitynum-src-mq3-botlib-be-ai-move-ml-1820679143"></a>
### BotGapDistance

```ml
function BotGapDistance(adapter, origin, horizontalDirection, entityNum)
```

Use `adapter.runtime.services.gapDistanceFn` to perform `BotGapDistance`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `horizontalDirection` | `dynamic` | — | Value passed as argument 3 to `adapter.runtime.services.gapDistanceFn`. |
| `entityNum` | `dynamic` | — | Entity number in the game or AAS entity table. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L298)

<a id="function-function-mq3-botlib-be-ai-move-botgetreachabilitytogoal-function-botgetreachabilitytogoal-adapter-origin-areanum-lastgoalareanum-lastareanum-avoidreach-avoidtimes-avoidtries-goal-travelflags-movetravelflags-avoidspots-src-mq3-botlib-be-ai-move-ml-463684122"></a>
### BotGetReachabilityToGoal

```ml
function BotGetReachabilityToGoal(adapter, origin, areaNum, lastGoalAreaNum, lastAreaNum, avoidReach, avoidTimes, avoidTries, goal, travelFlags, moveTravelFlags, avoidSpots)
```

Apply `mq3.botlib.aas_runtime.getTime`, `mq3.botlib.be_ai_move.BotValidTravel` and `mq3.botlib.aas_routing.areaTravelTimeToGoalArea` while evaluating `BotGetReachabilityToGoal`. Return paths include `[best,resultFlags]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `lastGoalAreaNum` | `dynamic` | — | Value used by `BotGetReachabilityToGoal` in `if lastGoalAreaNum==goal.areaNum and reach.areaNum==lastAreaNum then continue end if`. |
| `lastAreaNum` | `dynamic` | — | Previously visited AAS area number. |
| `avoidReach` | `dynamic` | — | Array or byte sequence accessed at `index`. |
| `avoidTimes` | `dynamic` | — | Array or byte sequence accessed at `index`. |
| `avoidTries` | `dynamic` | — | Array or byte sequence accessed at `index`. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `areaNum`. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |
| `moveTravelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |
| `avoidSpots` | `dynamic` | — | Array or byte sequence accessed at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L203)

<a id="function-function-mq3-botlib-be-ai-move-botinitmovestate-function-botinitmovestate-adapter-handle-value-src-mq3-botlib-be-ai-move-ml-1647133282"></a>
### BotInitMoveState

```ml
function BotInitMoveState(adapter, handle, value)
```

Apply `mq3.botlib.ai_move_runtime.initMoveState` while evaluating `BotInitMoveState`. Return paths include `move.initMoveState(adapter.runtime,handle,value)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot movement state. |
| `value` | `dynamic` | — | Movement initialization record; accesses `origin`, `velocity`, `viewOffset`, `entityNum` and `client` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L104)

<a id="function-function-mq3-botlib-be-ai-move-botmoveindirection-function-botmoveindirection-adapter-handle-direction-speed-type-src-mq3-botlib-be-ai-move-ml-926826181"></a>
### BotMoveInDirection

```ml
function BotMoveInDirection(adapter, handle, direction, speed, type)
```

Forward `BotMoveInDirection` to `mq3.botlib.ai_move_runtime.moveInDirection` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `handle` | `dynamic` | — | Resource handle resolved by the owning pool or host service. |
| `direction` | `dynamic` | — | Second three-component point. |
| `speed` | `dynamic` | — | Requested movement speed. |
| `type` | `dynamic` | — | Value passed as argument 5 to `runtime.services.walkDirectionFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L327)

<a id="function-function-mq3-botlib-be-ai-move-botmoveingoalarea-function-botmoveingoalarea-adapter-state-goal-src-mq3-botlib-be-ai-move-ml-40169097"></a>
### BotMoveInGoalArea

```ml
function BotMoveInGoalArea(adapter, state, goal)
```

Forward `BotMoveInGoalArea` to `mq3.botlib.ai_move_runtime.moveInGoalArea` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `moveFlags`, `origin`, `lastReachNum`, `lastAreaNum` and `lastGoalAreaNum` and related fields. May update `state.lastReachNum`, `state.lastAreaNum` and `state.lastGoalAreaNum` and additional fields in place. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `origin` and `areaNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L507)

<a id="function-function-mq3-botlib-be-ai-move-botmovementviewtarget-function-botmovementviewtarget-adapter-handle-goal-travelflags-lookahead-target-src-mq3-botlib-be-ai-move-ml-995480582"></a>
### BotMovementViewTarget

```ml
function BotMovementViewTarget(adapter, handle, goal, travelFlags, lookAhead, target)
```

Forward `BotMovementViewTarget` to `mq3.botlib.ai_move_runtime.movementViewTarget` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `handle` | `dynamic` | — | Resource handle resolved by the owning pool or host service. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `areaNum` and `origin`. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |
| `lookAhead` | `dynamic` | — | Distance to follow along the route when selecting the view target. |
| `target` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L231)

<a id="function-function-mq3-botlib-be-ai-move-botmovestatefromhandle-function-botmovestatefromhandle-adapter-handle-src-mq3-botlib-be-ai-move-ml-1468977985"></a>
### BotMoveStateFromHandle

```ml
function BotMoveStateFromHandle(adapter, handle)
```

Apply `mq3.botlib.ai_resource_pools.moveState` while evaluating `BotMoveStateFromHandle`. Return paths include `pools.moveState(adapter.runtime.pools,handle)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot movement state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L99)

<a id="function-function-mq3-botlib-be-ai-move-botmovetogoal-function-botmovetogoal-adapter-handle-goal-travelflags-src-mq3-botlib-be-ai-move-ml-1711242537"></a>
### BotMoveToGoal

```ml
function BotMoveToGoal(adapter, handle, goal, travelFlags)
```

Forward `BotMoveToGoal` to `mq3.botlib.ai_move_runtime.moveToGoal` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `handle` | `dynamic` | — | Resource handle resolved by the owning pool or host service. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `areaNum`. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L513)

<a id="function-function-mq3-botlib-be-ai-move-botonmover-function-botonmover-adapter-origin-entitynum-reach-src-mq3-botlib-be-ai-move-ml-1032723161"></a>
### BotOnMover

```ml
function BotOnMover(adapter, origin, entityNum, reach)
```

Use `adapter.onMoverFn` to perform `BotOnMover`. Return paths include `adapter.onMoverFn(adapter.context,origin,entityNum,reach)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `onMoverFn` and `context`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `entityNum` | `dynamic` | — | Entity number in the game or AAS entity table. |
| `reach` | `dynamic` | — | Value passed as argument 4 to `adapter.onMoverFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L278)

<a id="function-function-mq3-botlib-be-ai-move-botontopofentity-function-botontopofentity-adapter-state-src-mq3-botlib-be-ai-move-ml-91900920"></a>
### BotOnTopOfEntity

```ml
function BotOnTopOfEntity(adapter, state)
```

Use `adapter.onTopFn` to perform `BotOnTopOfEntity`. Return paths include `adapter.onTopFn(adapter.context,state)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `onTopFn` and `context`. |
| `state` | `dynamic` | — | Value passed as argument 2 to `adapter.onTopFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L282)

<a id="function-function-mq3-botlib-be-ai-move-botpredictvisibleposition-function-botpredictvisibleposition-adapter-origin-areanum-goal-travelflags-src-mq3-botlib-be-ai-move-ml-2018812740"></a>
### BotPredictVisiblePosition

```ml
function BotPredictVisiblePosition(adapter, origin, areaNum, goal, travelFlags)
```

Build the `mq3.botlib.ai_predict_visible_position.Result` result for `BotPredictVisiblePosition`. Return paths include `predict.predict(runtime,origin,areaNum,goal,travelFlags)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `visibleTraceFn` and `runtime`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `areaNum`. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L255)

<a id="function-function-mq3-botlib-be-ai-move-botreachabilityarea-function-botreachabilityarea-adapter-origin-client-src-mq3-botlib-be-ai-move-ml-1684238632"></a>
### BotReachabilityArea

```ml
function BotReachabilityArea(adapter, origin, client)
```

Forward `BotReachabilityArea` to `mq3.botlib.ai_move_runtime.reachabilityArea` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `client` | `dynamic` | — | Value passed as argument 6 to `runtime.services.groundTraceFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L126)

<a id="function-function-mq3-botlib-be-ai-move-botreachabilitytime-function-botreachabilitytime-reach-src-mq3-botlib-be-ai-move-ml-851823949"></a>
### BotReachabilityTime

```ml
function BotReachabilityTime(reach)
```

Forward `BotReachabilityTime` to `mq3.botlib.ai_move_runtime.reachabilityTime` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reach` | `dynamic` | — | AAS reachability record; accesses `travelType`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L502)

<a id="function-function-mq3-botlib-be-ai-move-botresetavoidreach-function-botresetavoidreach-adapter-handle-src-mq3-botlib-be-ai-move-ml-268536821"></a>
### BotResetAvoidReach

```ml
function BotResetAvoidReach(adapter, handle)
```

Apply `mq3.botlib.ai_resource_pools.resetAvoidReach` while evaluating `BotResetAvoidReach`. Return paths include `pools.resetAvoidReach(adapter.runtime.pools,handle)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `handle` | `dynamic` | — | Resource handle resolved by the owning pool or host service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L108)

<a id="function-function-mq3-botlib-be-ai-move-botresetgrapple-function-botresetgrapple-adapter-state-src-mq3-botlib-be-ai-move-ml-650411826"></a>
### BotResetGrapple

```ml
function BotResetGrapple(adapter, state)
```

Forward `BotResetGrapple` to `mq3.botlib.ai_move_runtime.resetGrapple` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `lastReachNum`, `moveFlags` and `grappleVisibleTime`. May update `state.moveFlags` and `state.grappleVisibleTime` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L469)

<a id="function-function-mq3-botlib-be-ai-move-botresetlastavoidreach-function-botresetlastavoidreach-adapter-handle-src-mq3-botlib-be-ai-move-ml-903537641"></a>
### BotResetLastAvoidReach

```ml
function BotResetLastAvoidReach(adapter, handle)
```

Apply `mq3.botlib.ai_resource_pools.resetLastAvoidReach` while evaluating `BotResetLastAvoidReach`. Return paths include `pools.resetLastAvoidReach(adapter.runtime.pools,handle)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `handle` | `dynamic` | — | Resource handle resolved by the owning pool or host service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L112)

<a id="function-function-mq3-botlib-be-ai-move-botresetmovestate-function-botresetmovestate-adapter-handle-src-mq3-botlib-be-ai-move-ml-1419802833"></a>
### BotResetMoveState

```ml
function BotResetMoveState(adapter, handle)
```

Apply `mq3.botlib.ai_resource_pools.resetMoveState` while evaluating `BotResetMoveState`. Return paths include `pools.resetMoveState(adapter.runtime.pools,handle)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot movement state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L116)

<a id="function-function-mq3-botlib-be-ai-move-botsetbrushmodeltypes-function-botsetbrushmodeltypes-adapter-entities-src-mq3-botlib-be-ai-move-ml-1091909118"></a>
### BotSetBrushModelTypes

```ml
function BotSetBrushModelTypes(adapter, entities)
```

Update `adapter.modelTypes` and `adapter.modelTypes[model]` during `BotSetBrushModelTypes`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `modelTypes`. May update `adapter.modelTypes` and `adapter.modelTypes[model]` in place. |
| `entities` | `dynamic` | — | Value used by `BotSetBrushModelTypes` in `for each entity in entities model=entity.modelNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L287)

<a id="function-function-mq3-botlib-be-ai-move-botsetupmoveai-function-botsetupmoveai-adapter-entities-src-mq3-botlib-be-ai-move-ml-891362920"></a>
### BotSetupMoveAI

```ml
function BotSetupMoveAI(adapter, entities)
```

Use `adapter.setupFn` to perform `BotSetupMoveAI`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `setupFn` and `context`. |
| `entities` | `dynamic` | — | Value used by `BotSetBrushModelTypes` in `for each entity in entities model=entity.modelNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L518)

<a id="function-function-mq3-botlib-be-ai-move-botshutdownmoveai-function-botshutdownmoveai-adapter-src-mq3-botlib-be-ai-move-ml-981710863"></a>
### BotShutdownMoveAI

```ml
function BotShutdownMoveAI(adapter)
```

Use `adapter.shutdownFn` to perform `BotShutdownMoveAI`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `shutdownFn`, `context` and `runtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L523)

<a id="function-function-mq3-botlib-be-ai-move-botswimindirection-function-botswimindirection-adapter-state-direction-speed-type-src-mq3-botlib-be-ai-move-ml-1798113992"></a>
### BotSwimInDirection

```ml
function BotSwimInDirection(adapter, state, direction, speed, type)
```

Apply `mq3.botlib.ai_move_runtime.normalize` and `mq3.botlib.ai_move_runtime.emitMovement` while evaluating `BotSwimInDirection`. Return paths include `move.emitMovement(adapter.runtime,state,normalized,speed)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `client`. |
| `direction` | `dynamic` | — | Second three-component point. |
| `speed` | `dynamic` | — | Requested movement speed. |
| `type` | `dynamic` | — | Not read by this implementation; retained in the `BotSwimInDirection` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L313)

<a id="function-function-mq3-botlib-be-ai-move-bottravel-barrierjump-function-bottravel-barrierjump-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-571546665"></a>
### BotTravel_BarrierJump

```ml
function BotTravel_BarrierJump(adapter, state, reach)
```

Forward `BotTravel_BarrierJump` to `mq3.botlib.ai_move_runtime.travelBarrierJump` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `origin`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `start`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L372)

<a id="function-function-mq3-botlib-be-ai-move-bottravel-bfgjump-function-bottravel-bfgjump-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-1758113521"></a>
### BotTravel_BFGJump

```ml
function BotTravel_BFGJump(adapter, state, reach)
```

Forward `BotTravel_BFGJump` to `mq3.botlib.ai_move_runtime.travelWeaponJump` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `origin`, `viewAngles`, `jumpReach` and `lastReachNum`. May update `state.jumpReach` in place. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `start` and `finish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L484)

<a id="function-function-mq3-botlib-be-ai-move-bottravel-crouch-function-bottravel-crouch-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-940900595"></a>
### BotTravel_Crouch

```ml
function BotTravel_Crouch(adapter, state, reach)
```

Forward `BotTravel_Crouch` to `mq3.botlib.ai_move_runtime.travelCrouch` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `origin`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `finish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L367)

<a id="function-function-mq3-botlib-be-ai-move-bottravel-elevator-function-bottravel-elevator-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-1831331639"></a>
### BotTravel_Elevator

```ml
function BotTravel_Elevator(adapter, state, reach)
```

Forward `BotTravel_Elevator` to `mq3.botlib.ai_move_runtime.travelElevator` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `moveFlags`, `origin` and `reachabilityTime`. May update `state.reachabilityTime` in place. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `finish` and `start`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L433)

<a id="function-function-mq3-botlib-be-ai-move-bottravel-funcbobbing-function-bottravel-funcbobbing-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-341745105"></a>
### BotTravel_FuncBobbing

```ml
function BotTravel_FuncBobbing(adapter, state, reach)
```

Forward `BotTravel_FuncBobbing` to `mq3.botlib.ai_move_runtime.travelFuncBob` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `moveFlags`, `origin` and `reachabilityTime`. May update `state.reachabilityTime` in place. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `finish` and `start`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L455)

<a id="function-function-mq3-botlib-be-ai-move-bottravel-grapple-function-bottravel-grapple-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-478527917"></a>
### BotTravel_Grapple

```ml
function BotTravel_Grapple(adapter, state, reach)
```

Forward `BotTravel_Grapple` to `mq3.botlib.ai_move_runtime.travelGrapple` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `moveFlags`, `origin`, `lastGrappleDist`, `grappleVisibleTime` and `viewOffset` and related fields. May update `state.moveFlags`, `state.grappleVisibleTime` and `state.lastGrappleDist` and additional fields in place. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `finish` and `start`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L474)

<a id="function-function-mq3-botlib-be-ai-move-bottravel-jump-function-bottravel-jump-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-1442748435"></a>
### BotTravel_Jump

```ml
function BotTravel_Jump(adapter, state, reach)
```

Forward `BotTravel_Jump` to `mq3.botlib.ai_move_runtime.travelJump` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `reachAreaNum`, `origin`, `jumpReach` and `lastReachNum`. May update `state.jumpReach` in place. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `start` and `finish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L413)

<a id="function-function-mq3-botlib-be-ai-move-bottravel-jumppad-function-bottravel-jumppad-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-512225925"></a>
### BotTravel_JumpPad

```ml
function BotTravel_JumpPad(adapter, state, reach)
```

Forward `BotTravel_JumpPad` to `mq3.botlib.ai_move_runtime.travelJumpPad` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `origin`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `start`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L494)

<a id="function-function-mq3-botlib-be-ai-move-bottravel-ladder-function-bottravel-ladder-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-1100867267"></a>
### BotTravel_Ladder

```ml
function BotTravel_Ladder(adapter, state, reach)
```

Forward `BotTravel_Ladder` to `mq3.botlib.ai_move_runtime.travelLadder` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `origin`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `finish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L423)

<a id="function-function-mq3-botlib-be-ai-move-bottravel-rocketjump-function-bottravel-rocketjump-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-104468867"></a>
### BotTravel_RocketJump

```ml
function BotTravel_RocketJump(adapter, state, reach)
```

Forward `BotTravel_RocketJump` to `mq3.botlib.ai_move_runtime.travelWeaponJump` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `origin`, `viewAngles`, `jumpReach` and `lastReachNum`. May update `state.jumpReach` in place. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `start` and `finish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L479)

<a id="function-function-mq3-botlib-be-ai-move-bottravel-swim-function-bottravel-swim-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-1931350483"></a>
### BotTravel_Swim

```ml
function BotTravel_Swim(adapter, state, reach)
```

Forward `BotTravel_Swim` to `mq3.botlib.ai_move_runtime.travelSwim` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `origin`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `start`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L382)

<a id="function-function-mq3-botlib-be-ai-move-bottravel-teleport-function-bottravel-teleport-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-260442547"></a>
### BotTravel_Teleport

```ml
function BotTravel_Teleport(adapter, state, reach)
```

Forward `BotTravel_Teleport` to `mq3.botlib.ai_move_runtime.travelTeleport` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `moveFlags` and `origin`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `start`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L428)

<a id="function-function-mq3-botlib-be-ai-move-bottravel-walk-function-bottravel-walk-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-214467319"></a>
### BotTravel_Walk

```ml
function BotTravel_Walk(adapter, state, reach)
```

Forward `BotTravel_Walk` to `mq3.botlib.ai_move_runtime.travelWalk` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `origin` and `moveFlags`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `start`, `finish` and `areaNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L355)

<a id="function-function-mq3-botlib-be-ai-move-bottravel-walkoffledge-function-bottravel-walkoffledge-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-741865975"></a>
### BotTravel_WalkOffLedge

```ml
function BotTravel_WalkOffLedge(adapter, state, reach)
```

Forward `BotTravel_WalkOffLedge` to `mq3.botlib.ai_move_runtime.travelWalkOffLedge` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `origin`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `start` and `finish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L397)

<a id="function-function-mq3-botlib-be-ai-move-bottravel-waterjump-function-bottravel-waterjump-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-190590669"></a>
### BotTravel_WaterJump

```ml
function BotTravel_WaterJump(adapter, state, reach)
```

Forward `BotTravel_WaterJump` to `mq3.botlib.ai_move_runtime.travelWaterJump` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `origin`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `finish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L387)

<a id="function-function-mq3-botlib-be-ai-move-botvalidtravel-function-botvalidtravel-adapter-origin-reach-travelflags-src-mq3-botlib-be-ai-move-ml-2123244211"></a>
### BotValidTravel

```ml
function BotValidTravel(adapter, origin, reach, travelFlags)
```

Apply `mq3.botlib.aas_routing.travelFlagForType` and `mq3.botlib.aas_routing.areaContentsTravelFlags` while evaluating `BotValidTravel`. Return paths include `(travelRequired&(~travelFlags))==0 and (areaRequired&(~travelFlags))==0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `origin` | `dynamic` | — | Not read by this implementation; retained in the `BotValidTravel` signature. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `travelType` and `areaNum`. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L184)

<a id="function-function-mq3-botlib-be-ai-move-botvisible-function-botvisible-adapter-entity-eye-target-src-mq3-botlib-be-ai-move-ml-1718991824"></a>
### BotVisible

```ml
function BotVisible(adapter, entity, eye, target)
```

Use `adapter.visibleTraceFn` to perform `BotVisible`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `visibleTraceFn` and `context`. |
| `entity` | `dynamic` | — | Value passed as argument 4 to `adapter.visibleTraceFn`. |
| `eye` | `dynamic` | — | Value passed as argument 2 to `adapter.visibleTraceFn`. |
| `target` | `dynamic` | — | Value passed as argument 3 to `adapter.visibleTraceFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L238)

<a id="function-function-mq3-botlib-be-ai-move-botwalkindirection-function-botwalkindirection-adapter-state-direction-speed-type-src-mq3-botlib-be-ai-move-ml-2115134604"></a>
### BotWalkInDirection

```ml
function BotWalkInDirection(adapter, state, direction, speed, type)
```

Use `adapter.runtime.services.walkDirectionFn` to perform `BotWalkInDirection`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | Value passed as argument 2 to `adapter.runtime.services.walkDirectionFn`. |
| `direction` | `dynamic` | — | Value passed as argument 3 to `adapter.runtime.services.walkDirectionFn`. |
| `speed` | `dynamic` | — | Requested movement speed. |
| `type` | `dynamic` | — | Value passed as argument 5 to `adapter.runtime.services.walkDirectionFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L320)

- [mq3.botlib.be_ai_move.BrushEntity](Type-mq3-botlib-be-ai-move-brushentity-566568305.md) — struct
<a id="function-function-mq3-botlib-be-ai-move-create-function-create-runtime-src-mq3-botlib-be-ai-move-ml-1577810536"></a>
### create

```ml
function create(runtime)
```

Create a `mq3.botlib.be_ai_move.Adapter` record, initializing `runtime` from `runtime` and `modelTypes` as `array(MAX_MODELS,MODELTYPE_NONE)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Initial value stored in `mq3.botlib.be_ai_move.Adapter.runtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L76)

<a id="function-function-mq3-botlib-be-ai-move-distancefromlinesquared-function-distancefromlinesquared-point-start-finish-src-mq3-botlib-be-ai-move-ml-1003698229"></a>
### DistanceFromLineSquared

```ml
function DistanceFromLineSquared(point, start, finish)
```

Forward `DistanceFromLineSquared` to `mq3.botlib.ai_move_runtime.distanceFromLineSquared` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |
| `start` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `finish` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L146)

<a id="function-function-mq3-botlib-be-ai-move-grapplestate-function-grapplestate-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-1168245539"></a>
### GrappleState

```ml
function GrappleState(adapter, state, reach)
```

Forward `GrappleState` to `mq3.botlib.ai_move_runtime.grappleState` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `runtime`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `moveFlags`. |
| `reach` | `dynamic` | — | Value passed as argument 3 to `runtime.services.grappleStateFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L465)

<a id="function-function-mq3-botlib-be-ai-move-intersection-function-intersection-firststart-firstend-secondstart-secondend-target-src-mq3-botlib-be-ai-move-ml-1357944225"></a>
### Intersection

```ml
function Intersection(firstStart, firstEnd, secondStart, secondEnd, target)
```

Update `target[0]` and `target[1]` during `Intersection`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `firstStart` | `dynamic` | — | Array or byte sequence accessed at `0` and `1`. |
| `firstEnd` | `dynamic` | — | Array or byte sequence accessed at `0` and `1`. |
| `secondStart` | `dynamic` | — | Array or byte sequence accessed at `0` and `1`. |
| `secondEnd` | `dynamic` | — | Array or byte sequence accessed at `0` and `1`. |
| `target` | `dynamic` | — | Array or byte sequence accessed at `0` and `1`. Entries are written in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L335)

<a id="constant-constant-mq3-botlib-be-ai-move-max-models-const-max-models-256-src-mq3-botlib-be-ai-move-ml-893479686"></a>
### MAX_MODELS

```ml
const MAX_MODELS = 256
```

These are sent over the net as 8 bits.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L15)

<a id="constant-constant-mq3-botlib-be-ai-move-modeltype-func-bob-const-modeltype-func-bob-2-src-mq3-botlib-be-ai-move-ml-33247725"></a>
### MODELTYPE_FUNC_BOB

```ml
const MODELTYPE_FUNC_BOB = 2
```

Bot mover-model classification for func bob.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L21)

<a id="constant-constant-mq3-botlib-be-ai-move-modeltype-func-door-const-modeltype-func-door-3-src-mq3-botlib-be-ai-move-ml-219445714"></a>
### MODELTYPE_FUNC_DOOR

```ml
const MODELTYPE_FUNC_DOOR = 3
```

Bot mover-model classification for func door.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L23)

<a id="constant-constant-mq3-botlib-be-ai-move-modeltype-func-plat-const-modeltype-func-plat-1-src-mq3-botlib-be-ai-move-ml-661742996"></a>
### MODELTYPE_FUNC_PLAT

```ml
const MODELTYPE_FUNC_PLAT = 1
```

Bot mover-model classification for func plat.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L19)

<a id="constant-constant-mq3-botlib-be-ai-move-modeltype-func-static-const-modeltype-func-static-4-src-mq3-botlib-be-ai-move-ml-1472673997"></a>
### MODELTYPE_FUNC_STATIC

```ml
const MODELTYPE_FUNC_STATIC = 4
```

Bot mover-model classification for func static.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L25)

<a id="constant-constant-mq3-botlib-be-ai-move-modeltype-none-const-modeltype-none-0-src-mq3-botlib-be-ai-move-ml-1608806523"></a>
### MODELTYPE_NONE

```ml
const MODELTYPE_NONE = 0
```

Bot mover-model classification for none.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L17)

<a id="function-function-mq3-botlib-be-ai-move-moverbottomcenter-function-moverbottomcenter-adapter-reach-src-mq3-botlib-be-ai-move-ml-748664776"></a>
### MoverBottomCenter

```ml
function MoverBottomCenter(adapter, reach)
```

Use `adapter.moverInfoFn` to perform `MoverBottomCenter`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `moverInfoFn` and `context`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `start` and `faceNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L263)

<a id="function-function-mq3-botlib-be-ai-move-moverdown-function-moverdown-adapter-reach-src-mq3-botlib-be-ai-move-ml-553803108"></a>
### MoverDown

```ml
function MoverDown(adapter, reach)
```

Use `adapter.moverInfoFn` to perform `MoverDown`. Return paths include `n.fadd(value.currentOrigin[2],value.maxs[2])<reach.start[2]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — | Adapter record; accesses `moverInfoFn` and `context`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `faceNum` and `start`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L270)

- [mq3.botlib.be_ai_move.MoverInfo](Type-mq3-botlib-be-ai-move-moverinfo-201165283.md) — struct
<a id="function-function-mq3-botlib-be-ai-move-signed16-function-signed16-value-src-mq3-botlib-be-ai-move-ml-349153705"></a>
### signed16

```ml
function signed16(value)
```

Sign-extend the low sixteen bits into the original 32-bit signed representation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `value`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L442)

<a id="function-function-mq3-botlib-be-ai-move-vectordistancesquared-function-vectordistancesquared-first-second-src-mq3-botlib-be-ai-move-ml-1972447772"></a>
### VectorDistanceSquared

```ml
function VectorDistanceSquared(first, second)
```

Forward `VectorDistanceSquared` to `mq3.botlib.ai_move_runtime.vectorDistanceSquared` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `second` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L150)

<a id="function-function-mq3-botlib-be-ai-move-visiblecallback-function-visiblecallback-context-goal-point-entity-contents-src-mq3-botlib-be-ai-move-ml-2011992057"></a>
### visibleCallback

```ml
function visibleCallback(context, goal, point, entity, contents)
```

Return the result of `context.visibleTraceFn(context.context,goal,point,entity,contents)` for `visibleCallback`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context record; accesses `visibleTraceFn` and `context`. |
| `goal` | `dynamic` | — | Value passed as argument 2 to `context.visibleTraceFn`. |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |
| `entity` | `dynamic` | — | Value passed as argument 4 to `context.visibleTraceFn`. |
| `contents` | `dynamic` | — | Value passed as argument 5 to `context.visibleTraceFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_ai_move.ml#L248)
