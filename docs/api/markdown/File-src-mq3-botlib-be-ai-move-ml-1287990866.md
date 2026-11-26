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
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-botlib-be-ai-move-absfloat-function-absfloat-value-src-mq3-botlib-be-ai-move-ml-1296957397"></a>
### absFloat

```ml
function absFloat(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L32)

- [mq3.botlib.be_ai_move.Adapter](Type-mq3-botlib-be-ai-move-adapter-2002977585.md) — struct
<a id="function-function-mq3-botlib-be-ai-move-anglediff-function-anglediff-ang1-ang2-src-mq3-botlib-be-ai-move-ml-2006373749"></a>
### AngleDiff

```ml
function AngleDiff(ang1, ang2)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ang1` | `dynamic` | — |  |
| `ang2` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L34)

<a id="constant-constant-mq3-botlib-be-ai-move-avoid-always-const-avoid-always-1-src-mq3-botlib-be-ai-move-ml-1528824628"></a>
### AVOID_ALWAYS

```ml
const AVOID_ALWAYS = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L21)

<a id="constant-constant-mq3-botlib-be-ai-move-avoid-clear-const-avoid-clear-0-src-mq3-botlib-be-ai-move-ml-1893825813"></a>
### AVOID_CLEAR

```ml
const AVOID_CLEAR = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L20)

<a id="constant-constant-mq3-botlib-be-ai-move-avoid-dontblock-const-avoid-dontblock-2-src-mq3-botlib-be-ai-move-ml-1943895339"></a>
### AVOID_DONTBLOCK

```ml
const AVOID_DONTBLOCK = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L22)

<a id="function-function-mq3-botlib-be-ai-move-botaddavoidspot-function-botaddavoidspot-adapter-handle-origin-radius-type-src-mq3-botlib-be-ai-move-ml-1431653795"></a>
### BotAddAvoidSpot

```ml
function BotAddAvoidSpot(adapter, handle, origin, radius, type)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L73)

<a id="function-function-mq3-botlib-be-ai-move-botaddtoavoidreach-function-botaddtoavoidreach-adapter-state-number-avoidtime-src-mq3-botlib-be-ai-move-ml-1812118947"></a>
### BotAddToAvoidReach

```ml
function BotAddToAvoidReach(adapter, state, number, avoidTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |
| `avoidTime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L47)

<a id="function-function-mq3-botlib-be-ai-move-botaddtotarget-function-botaddtotarget-start-finish-maxdistance-travelled-target-src-mq3-botlib-be-ai-move-ml-786931064"></a>
### BotAddToTarget

```ml
function BotAddToTarget(start, finish, maxDistance, travelled, target)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `maxDistance` | `dynamic` | — |  |
| `travelled` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L95)

<a id="function-function-mq3-botlib-be-ai-move-botaircontrol-function-botaircontrol-adapter-origin-velocity-goal-src-mq3-botlib-be-ai-move-ml-547858121"></a>
### BotAirControl

```ml
function BotAirControl(adapter, origin, velocity, goal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L151)

<a id="function-function-mq3-botlib-be-ai-move-botallocmovestate-function-botallocmovestate-adapter-src-mq3-botlib-be-ai-move-ml-907601267"></a>
### BotAllocMoveState

```ml
function BotAllocMoveState(adapter)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L36)

<a id="function-function-mq3-botlib-be-ai-move-botavoidspots-function-botavoidspots-origin-reach-spots-numspots-src-mq3-botlib-be-ai-move-ml-1310553241"></a>
### BotAvoidSpots

```ml
function BotAvoidSpots(origin, reach, spots, numSpots)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |
| `spots` | `dynamic` | — |  |
| `numSpots` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L59)

<a id="function-function-mq3-botlib-be-ai-move-botcheckbarrierjump-function-botcheckbarrierjump-adapter-state-direction-speed-src-mq3-botlib-be-ai-move-ml-896509968"></a>
### BotCheckBarrierJump

```ml
function BotCheckBarrierJump(adapter, state, direction, speed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |
| `speed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L127)

<a id="function-function-mq3-botlib-be-ai-move-botcheckblocked-function-botcheckblocked-adapter-state-direction-checkbottom-result-src-mq3-botlib-be-ai-move-ml-308205043"></a>
### BotCheckBlocked

```ml
function BotCheckBlocked(adapter, state, direction, checkBottom, result)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |
| `checkBottom` | `dynamic` | — |  |
| `result` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L137)

<a id="function-function-mq3-botlib-be-ai-move-botclearmoveresult-function-botclearmoveresult-result-src-mq3-botlib-be-ai-move-ml-627036917"></a>
### BotClearMoveResult

```ml
function BotClearMoveResult(result)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `result` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L138)

<a id="function-function-mq3-botlib-be-ai-move-botfinishtravel-barrierjump-function-botfinishtravel-barrierjump-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-636878099"></a>
### BotFinishTravel_BarrierJump

```ml
function BotFinishTravel_BarrierJump(adapter, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L146)

<a id="function-function-mq3-botlib-be-ai-move-botfinishtravel-elevator-function-botfinishtravel-elevator-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-1443412227"></a>
### BotFinishTravel_Elevator

```ml
function BotFinishTravel_Elevator(adapter, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L158)

<a id="function-function-mq3-botlib-be-ai-move-botfinishtravel-funcbobbing-function-botfinishtravel-funcbobbing-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-483757123"></a>
### BotFinishTravel_FuncBobbing

```ml
function BotFinishTravel_FuncBobbing(adapter, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L167)

<a id="function-function-mq3-botlib-be-ai-move-botfinishtravel-jump-function-botfinishtravel-jump-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-635997583"></a>
### BotFinishTravel_Jump

```ml
function BotFinishTravel_Jump(adapter, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L154)

<a id="function-function-mq3-botlib-be-ai-move-botfinishtravel-jumppad-function-botfinishtravel-jumppad-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-1078383287"></a>
### BotFinishTravel_JumpPad

```ml
function BotFinishTravel_JumpPad(adapter, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L175)

<a id="function-function-mq3-botlib-be-ai-move-botfinishtravel-walk-function-botfinishtravel-walk-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-2080074323"></a>
### BotFinishTravel_Walk

```ml
function BotFinishTravel_Walk(adapter, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L141)

<a id="function-function-mq3-botlib-be-ai-move-botfinishtravel-walkoffledge-function-botfinishtravel-walkoffledge-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-526846895"></a>
### BotFinishTravel_WalkOffLedge

```ml
function BotFinishTravel_WalkOffLedge(adapter, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L152)

<a id="function-function-mq3-botlib-be-ai-move-botfinishtravel-waterjump-function-botfinishtravel-waterjump-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-1543748707"></a>
### BotFinishTravel_WaterJump

```ml
function BotFinishTravel_WaterJump(adapter, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L149)

<a id="function-function-mq3-botlib-be-ai-move-botfinishtravel-weaponjump-function-botfinishtravel-weaponjump-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-1368231431"></a>
### BotFinishTravel_WeaponJump

```ml
function BotFinishTravel_WeaponJump(adapter, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L173)

<a id="function-function-mq3-botlib-be-ai-move-botfreemovestate-function-botfreemovestate-adapter-handle-src-mq3-botlib-be-ai-move-ml-1662774481"></a>
### BotFreeMoveState

```ml
function BotFreeMoveState(adapter, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L37)

<a id="function-function-mq3-botlib-be-ai-move-botfuncbobstartend-function-botfuncbobstartend-adapter-reach-src-mq3-botlib-be-ai-move-ml-973852502"></a>
### BotFuncBobStartEnd

```ml
function BotFuncBobStartEnd(adapter, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L161)

<a id="function-function-mq3-botlib-be-ai-move-botfuzzypointreachabilityarea-function-botfuzzypointreachabilityarea-adapter-origin-src-mq3-botlib-be-ai-move-ml-1453381903"></a>
### BotFuzzyPointReachabilityArea

```ml
function BotFuzzyPointReachabilityArea(adapter, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L44)

<a id="function-function-mq3-botlib-be-ai-move-botgapdistance-function-botgapdistance-adapter-origin-horizontaldirection-entitynum-src-mq3-botlib-be-ai-move-ml-1820679143"></a>
### BotGapDistance

```ml
function BotGapDistance(adapter, origin, horizontalDirection, entityNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `horizontalDirection` | `dynamic` | — |  |
| `entityNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L124)

<a id="function-function-mq3-botlib-be-ai-move-botgetreachabilitytogoal-function-botgetreachabilitytogoal-adapter-origin-areanum-lastgoalareanum-lastareanum-avoidreach-avoidtimes-avoidtries-goal-travelflags-movetravelflags-avoidspots-src-mq3-botlib-be-ai-move-ml-463684122"></a>
### BotGetReachabilityToGoal

```ml
function BotGetReachabilityToGoal(adapter, origin, areaNum, lastGoalAreaNum, lastAreaNum, avoidReach, avoidTimes, avoidTries, goal, travelFlags, moveTravelFlags, avoidSpots)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `lastGoalAreaNum` | `dynamic` | — |  |
| `lastAreaNum` | `dynamic` | — |  |
| `avoidReach` | `dynamic` | — |  |
| `avoidTimes` | `dynamic` | — |  |
| `avoidTries` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |
| `moveTravelFlags` | `dynamic` | — |  |
| `avoidSpots` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L81)

<a id="function-function-mq3-botlib-be-ai-move-botinitmovestate-function-botinitmovestate-adapter-handle-value-src-mq3-botlib-be-ai-move-ml-1647133282"></a>
### BotInitMoveState

```ml
function BotInitMoveState(adapter, handle, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L39)

<a id="function-function-mq3-botlib-be-ai-move-botmoveindirection-function-botmoveindirection-adapter-handle-direction-speed-type-src-mq3-botlib-be-ai-move-ml-926826181"></a>
### BotMoveInDirection

```ml
function BotMoveInDirection(adapter, handle, direction, speed, type)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |
| `speed` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L130)

<a id="function-function-mq3-botlib-be-ai-move-botmoveingoalarea-function-botmoveingoalarea-adapter-state-goal-src-mq3-botlib-be-ai-move-ml-40169097"></a>
### BotMoveInGoalArea

```ml
function BotMoveInGoalArea(adapter, state, goal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L177)

<a id="function-function-mq3-botlib-be-ai-move-botmovementviewtarget-function-botmovementviewtarget-adapter-handle-goal-travelflags-lookahead-target-src-mq3-botlib-be-ai-move-ml-995480582"></a>
### BotMovementViewTarget

```ml
function BotMovementViewTarget(adapter, handle, goal, travelFlags, lookAhead, target)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |
| `lookAhead` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L96)

<a id="function-function-mq3-botlib-be-ai-move-botmovestatefromhandle-function-botmovestatefromhandle-adapter-handle-src-mq3-botlib-be-ai-move-ml-1468977985"></a>
### BotMoveStateFromHandle

```ml
function BotMoveStateFromHandle(adapter, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L38)

<a id="function-function-mq3-botlib-be-ai-move-botmovetogoal-function-botmovetogoal-adapter-handle-goal-travelflags-src-mq3-botlib-be-ai-move-ml-1711242537"></a>
### BotMoveToGoal

```ml
function BotMoveToGoal(adapter, handle, goal, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L178)

<a id="function-function-mq3-botlib-be-ai-move-botonmover-function-botonmover-adapter-origin-entitynum-reach-src-mq3-botlib-be-ai-move-ml-1032723161"></a>
### BotOnMover

```ml
function BotOnMover(adapter, origin, entityNum, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `entityNum` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L115)

<a id="function-function-mq3-botlib-be-ai-move-botontopofentity-function-botontopofentity-adapter-state-src-mq3-botlib-be-ai-move-ml-91900920"></a>
### BotOnTopOfEntity

```ml
function BotOnTopOfEntity(adapter, state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L116)

<a id="function-function-mq3-botlib-be-ai-move-botpredictvisibleposition-function-botpredictvisibleposition-adapter-origin-areanum-goal-travelflags-src-mq3-botlib-be-ai-move-ml-2018812740"></a>
### BotPredictVisiblePosition

```ml
function BotPredictVisiblePosition(adapter, origin, areaNum, goal, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L103)

<a id="function-function-mq3-botlib-be-ai-move-botreachabilityarea-function-botreachabilityarea-adapter-origin-client-src-mq3-botlib-be-ai-move-ml-1684238632"></a>
### BotReachabilityArea

```ml
function BotReachabilityArea(adapter, origin, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L45)

<a id="function-function-mq3-botlib-be-ai-move-botreachabilitytime-function-botreachabilitytime-reach-src-mq3-botlib-be-ai-move-ml-851823949"></a>
### BotReachabilityTime

```ml
function BotReachabilityTime(reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L176)

<a id="function-function-mq3-botlib-be-ai-move-botresetavoidreach-function-botresetavoidreach-adapter-handle-src-mq3-botlib-be-ai-move-ml-268536821"></a>
### BotResetAvoidReach

```ml
function BotResetAvoidReach(adapter, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L40)

<a id="function-function-mq3-botlib-be-ai-move-botresetgrapple-function-botresetgrapple-adapter-state-src-mq3-botlib-be-ai-move-ml-650411826"></a>
### BotResetGrapple

```ml
function BotResetGrapple(adapter, state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L169)

<a id="function-function-mq3-botlib-be-ai-move-botresetlastavoidreach-function-botresetlastavoidreach-adapter-handle-src-mq3-botlib-be-ai-move-ml-903537641"></a>
### BotResetLastAvoidReach

```ml
function BotResetLastAvoidReach(adapter, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L41)

<a id="function-function-mq3-botlib-be-ai-move-botresetmovestate-function-botresetmovestate-adapter-handle-src-mq3-botlib-be-ai-move-ml-1419802833"></a>
### BotResetMoveState

```ml
function BotResetMoveState(adapter, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L42)

<a id="function-function-mq3-botlib-be-ai-move-botsetbrushmodeltypes-function-botsetbrushmodeltypes-adapter-entities-src-mq3-botlib-be-ai-move-ml-1091909118"></a>
### BotSetBrushModelTypes

```ml
function BotSetBrushModelTypes(adapter, entities)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `entities` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L118)

<a id="function-function-mq3-botlib-be-ai-move-botsetupmoveai-function-botsetupmoveai-adapter-entities-src-mq3-botlib-be-ai-move-ml-891362920"></a>
### BotSetupMoveAI

```ml
function BotSetupMoveAI(adapter, entities)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `entities` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L180)

<a id="function-function-mq3-botlib-be-ai-move-botshutdownmoveai-function-botshutdownmoveai-adapter-src-mq3-botlib-be-ai-move-ml-981710863"></a>
### BotShutdownMoveAI

```ml
function BotShutdownMoveAI(adapter)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L183)

<a id="function-function-mq3-botlib-be-ai-move-botswimindirection-function-botswimindirection-adapter-state-direction-speed-type-src-mq3-botlib-be-ai-move-ml-1798113992"></a>
### BotSwimInDirection

```ml
function BotSwimInDirection(adapter, state, direction, speed, type)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |
| `speed` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L128)

<a id="function-function-mq3-botlib-be-ai-move-bottravel-barrierjump-function-bottravel-barrierjump-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-571546665"></a>
### BotTravel_BarrierJump

```ml
function BotTravel_BarrierJump(adapter, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L145)

<a id="function-function-mq3-botlib-be-ai-move-bottravel-bfgjump-function-bottravel-bfgjump-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-1758113521"></a>
### BotTravel_BFGJump

```ml
function BotTravel_BFGJump(adapter, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L172)

<a id="function-function-mq3-botlib-be-ai-move-bottravel-crouch-function-bottravel-crouch-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-940900595"></a>
### BotTravel_Crouch

```ml
function BotTravel_Crouch(adapter, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L144)

<a id="function-function-mq3-botlib-be-ai-move-bottravel-elevator-function-bottravel-elevator-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-1831331639"></a>
### BotTravel_Elevator

```ml
function BotTravel_Elevator(adapter, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L157)

<a id="function-function-mq3-botlib-be-ai-move-bottravel-funcbobbing-function-bottravel-funcbobbing-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-341745105"></a>
### BotTravel_FuncBobbing

```ml
function BotTravel_FuncBobbing(adapter, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L166)

<a id="function-function-mq3-botlib-be-ai-move-bottravel-grapple-function-bottravel-grapple-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-478527917"></a>
### BotTravel_Grapple

```ml
function BotTravel_Grapple(adapter, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L170)

<a id="function-function-mq3-botlib-be-ai-move-bottravel-jump-function-bottravel-jump-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-1442748435"></a>
### BotTravel_Jump

```ml
function BotTravel_Jump(adapter, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L153)

<a id="function-function-mq3-botlib-be-ai-move-bottravel-jumppad-function-bottravel-jumppad-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-512225925"></a>
### BotTravel_JumpPad

```ml
function BotTravel_JumpPad(adapter, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L174)

<a id="function-function-mq3-botlib-be-ai-move-bottravel-ladder-function-bottravel-ladder-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-1100867267"></a>
### BotTravel_Ladder

```ml
function BotTravel_Ladder(adapter, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L155)

<a id="function-function-mq3-botlib-be-ai-move-bottravel-rocketjump-function-bottravel-rocketjump-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-104468867"></a>
### BotTravel_RocketJump

```ml
function BotTravel_RocketJump(adapter, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L171)

<a id="function-function-mq3-botlib-be-ai-move-bottravel-swim-function-bottravel-swim-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-1931350483"></a>
### BotTravel_Swim

```ml
function BotTravel_Swim(adapter, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L147)

<a id="function-function-mq3-botlib-be-ai-move-bottravel-teleport-function-bottravel-teleport-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-260442547"></a>
### BotTravel_Teleport

```ml
function BotTravel_Teleport(adapter, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L156)

<a id="function-function-mq3-botlib-be-ai-move-bottravel-walk-function-bottravel-walk-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-214467319"></a>
### BotTravel_Walk

```ml
function BotTravel_Walk(adapter, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L140)

<a id="function-function-mq3-botlib-be-ai-move-bottravel-walkoffledge-function-bottravel-walkoffledge-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-741865975"></a>
### BotTravel_WalkOffLedge

```ml
function BotTravel_WalkOffLedge(adapter, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L150)

<a id="function-function-mq3-botlib-be-ai-move-bottravel-waterjump-function-bottravel-waterjump-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-190590669"></a>
### BotTravel_WaterJump

```ml
function BotTravel_WaterJump(adapter, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L148)

<a id="function-function-mq3-botlib-be-ai-move-botvalidtravel-function-botvalidtravel-adapter-origin-reach-travelflags-src-mq3-botlib-be-ai-move-ml-2123244211"></a>
### BotValidTravel

```ml
function BotValidTravel(adapter, origin, reach, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L75)

<a id="function-function-mq3-botlib-be-ai-move-botvisible-function-botvisible-adapter-entity-eye-target-src-mq3-botlib-be-ai-move-ml-1718991824"></a>
### BotVisible

```ml
function BotVisible(adapter, entity, eye, target)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `eye` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L98)

<a id="function-function-mq3-botlib-be-ai-move-botwalkindirection-function-botwalkindirection-adapter-state-direction-speed-type-src-mq3-botlib-be-ai-move-ml-2115134604"></a>
### BotWalkInDirection

```ml
function BotWalkInDirection(adapter, state, direction, speed, type)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |
| `speed` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L129)

- [mq3.botlib.be_ai_move.BrushEntity](Type-mq3-botlib-be-ai-move-brushentity-566568305.md) — struct
<a id="function-function-mq3-botlib-be-ai-move-create-function-create-runtime-src-mq3-botlib-be-ai-move-ml-1577810536"></a>
### create

```ml
function create(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L28)

<a id="function-function-mq3-botlib-be-ai-move-distancefromlinesquared-function-distancefromlinesquared-point-start-finish-src-mq3-botlib-be-ai-move-ml-1003698229"></a>
### DistanceFromLineSquared

```ml
function DistanceFromLineSquared(point, start, finish)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L56)

<a id="function-function-mq3-botlib-be-ai-move-grapplestate-function-grapplestate-adapter-state-reach-src-mq3-botlib-be-ai-move-ml-1168245539"></a>
### GrappleState

```ml
function GrappleState(adapter, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L168)

<a id="function-function-mq3-botlib-be-ai-move-intersection-function-intersection-firststart-firstend-secondstart-secondend-target-src-mq3-botlib-be-ai-move-ml-1357944225"></a>
### Intersection

```ml
function Intersection(firstStart, firstEnd, secondStart, secondEnd, target)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `firstStart` | `dynamic` | — |  |
| `firstEnd` | `dynamic` | — |  |
| `secondStart` | `dynamic` | — |  |
| `secondEnd` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L132)

<a id="constant-constant-mq3-botlib-be-ai-move-max-models-const-max-models-256-src-mq3-botlib-be-ai-move-ml-893479686"></a>
### MAX_MODELS

```ml
const MAX_MODELS = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L14)

<a id="constant-constant-mq3-botlib-be-ai-move-modeltype-func-bob-const-modeltype-func-bob-2-src-mq3-botlib-be-ai-move-ml-33247725"></a>
### MODELTYPE_FUNC_BOB

```ml
const MODELTYPE_FUNC_BOB = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L17)

<a id="constant-constant-mq3-botlib-be-ai-move-modeltype-func-door-const-modeltype-func-door-3-src-mq3-botlib-be-ai-move-ml-219445714"></a>
### MODELTYPE_FUNC_DOOR

```ml
const MODELTYPE_FUNC_DOOR = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L18)

<a id="constant-constant-mq3-botlib-be-ai-move-modeltype-func-plat-const-modeltype-func-plat-1-src-mq3-botlib-be-ai-move-ml-661742996"></a>
### MODELTYPE_FUNC_PLAT

```ml
const MODELTYPE_FUNC_PLAT = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L16)

<a id="constant-constant-mq3-botlib-be-ai-move-modeltype-func-static-const-modeltype-func-static-4-src-mq3-botlib-be-ai-move-ml-1472673997"></a>
### MODELTYPE_FUNC_STATIC

```ml
const MODELTYPE_FUNC_STATIC = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L19)

<a id="constant-constant-mq3-botlib-be-ai-move-modeltype-none-const-modeltype-none-0-src-mq3-botlib-be-ai-move-ml-1608806523"></a>
### MODELTYPE_NONE

```ml
const MODELTYPE_NONE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L15)

<a id="function-function-mq3-botlib-be-ai-move-moverbottomcenter-function-moverbottomcenter-adapter-reach-src-mq3-botlib-be-ai-move-ml-748664776"></a>
### MoverBottomCenter

```ml
function MoverBottomCenter(adapter, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L108)

<a id="function-function-mq3-botlib-be-ai-move-moverdown-function-moverdown-adapter-reach-src-mq3-botlib-be-ai-move-ml-553803108"></a>
### MoverDown

```ml
function MoverDown(adapter, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adapter` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L112)

- [mq3.botlib.be_ai_move.MoverInfo](Type-mq3-botlib-be-ai-move-moverinfo-201165283.md) — struct
<a id="function-function-mq3-botlib-be-ai-move-signed16-function-signed16-value-src-mq3-botlib-be-ai-move-ml-349153705"></a>
### signed16

```ml
function signed16(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L160)

<a id="function-function-mq3-botlib-be-ai-move-vectordistancesquared-function-vectordistancesquared-first-second-src-mq3-botlib-be-ai-move-ml-1972447772"></a>
### VectorDistanceSquared

```ml
function VectorDistanceSquared(first, second)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L57)

<a id="function-function-mq3-botlib-be-ai-move-visiblecallback-function-visiblecallback-context-goal-point-entity-contents-src-mq3-botlib-be-ai-move-ml-2011992057"></a>
### visibleCallback

```ml
function visibleCallback(context, goal, point, entity, contents)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `contents` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_ai_move.ml#L102)
