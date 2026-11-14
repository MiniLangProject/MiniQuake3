# `src/mq3/botlib/ai_move_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_move_runtime`](Package-mq3-botlib-ai-move-runtime-1212278741.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/aas_routing.ml` as `moveRouting` → [src/mq3/botlib/aas_routing.ml](File-src-mq3-botlib-aas-routing-ml-230871418.md)
- `mq3/botlib/aas_runtime.ml` as `moveAas` → [src/mq3/botlib/aas_runtime.ml](File-src-mq3-botlib-aas-runtime-ml-1322908116.md)
- `mq3/botlib/aas_trace_areas.ml` as `moveTraceAreas` → [src/mq3/botlib/aas_trace_areas.ml](File-src-mq3-botlib-aas-trace-areas-ml-2060721500.md)
- `mq3/botlib/ai_resource_pools.ml` as `resources` → [src/mq3/botlib/ai_resource_pools.ml](File-src-mq3-botlib-ai-resource-pools-ml-103445473.md)
- `mq3/botlib/elementary_actions.ml` as `moveEa` → [src/mq3/botlib/elementary_actions.ml](File-src-mq3-botlib-elementary-actions-ml-737481412.md)
- `mq3/botlib/public_headers.ml` as `publicHeaders` → [src/mq3/botlib/public_headers.ml](File-src-mq3-botlib-public-headers-ml-206085358.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/shared/math.ml` as `moveQMath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-botlib-ai-move-runtime-absfloat-function-absfloat-value-src-mq3-botlib-ai-move-runtime-ml-1037057855"></a>
### absFloat

```ml
function absFloat(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L175)

<a id="function-function-mq3-botlib-ai-move-runtime-addtotarget-function-addtotarget-start-finish-maxdistance-travelled-target-src-mq3-botlib-ai-move-runtime-ml-763467134"></a>
### addToTarget

```ml
function addToTarget(start, finish, maxDistance, travelled, target)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `maxDistance` | `dynamic` | — |  |
| `travelled` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L120)

<a id="function-function-mq3-botlib-ai-move-runtime-aircontrol-function-aircontrol-runtime-origin-velocity-goal-src-mq3-botlib-ai-move-runtime-ml-369501802"></a>
### airControl

```ml
function airControl(runtime, origin, velocity, goal)
```

BotAirControl integrates the original 0.1-second velocity units for up to 50 frames and computes the horizontal correction at the goal height.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L307)

<a id="function-function-mq3-botlib-ai-move-runtime-anglediff-function-anglediff-first-second-src-mq3-botlib-ai-move-runtime-ml-1350599758"></a>
### angleDiff

```ml
function angleDiff(first, second)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L326)

<a id="constant-constant-mq3-botlib-ai-move-runtime-avoid-always-const-avoid-always-publicheaders-avoid-always-src-mq3-botlib-ai-move-runtime-ml-1594182771"></a>
### AVOID_ALWAYS

```ml
const AVOID_ALWAYS = publicHeaders.AVOID_ALWAYS
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L53)

<a id="constant-constant-mq3-botlib-ai-move-runtime-avoidreach-tries-const-avoidreach-tries-4-src-mq3-botlib-ai-move-runtime-ml-1950044373"></a>
### AVOIDREACH_TRIES

```ml
const AVOIDREACH_TRIES = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L54)

<a id="function-function-mq3-botlib-ai-move-runtime-bestreachability-function-bestreachability-runtime-state-goal-travelflags-src-mq3-botlib-ai-move-runtime-ml-1060606427"></a>
### bestReachability

```ml
function bestReachability(runtime, state, goal, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L191)

<a id="function-function-mq3-botlib-ai-move-runtime-callgroundtrace-function-callgroundtrace-runtime-origin-client-src-mq3-botlib-ai-move-runtime-ml-99486243"></a>
### callGroundTrace

```ml
function callGroundTrace(runtime, origin, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L99)

<a id="function-function-mq3-botlib-ai-move-runtime-checkbarrierjump-function-checkbarrierjump-runtime-state-direction-speed-src-mq3-botlib-ai-move-runtime-ml-137129625"></a>
### checkBarrierJump

```ml
function checkBarrierJump(runtime, state, direction, speed)
```

BotCheckBarrierJump's callback reports only collision geometry. The runtime owns the original EA side effects and MFL_BARRIERJUMP state transition.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |
| `speed` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L338)

<a id="function-function-mq3-botlib-ai-move-runtime-checkblocked-function-checkblocked-runtime-state-direction-checkbottom-result-src-mq3-botlib-ai-move-runtime-ml-1400147962"></a>
### checkBlocked

```ml
function checkBlocked(runtime, state, direction, checkBottom, result)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |
| `checkBottom` | `dynamic` | — |  |
| `result` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L169)

<a id="constant-constant-mq3-botlib-ai-move-runtime-contents-lava-const-contents-lava-8-src-mq3-botlib-ai-move-runtime-ml-872807255"></a>
### CONTENTS_LAVA

```ml
const CONTENTS_LAVA = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L36)

<a id="constant-constant-mq3-botlib-ai-move-runtime-contents-slime-const-contents-slime-16-src-mq3-botlib-ai-move-runtime-ml-2036013090"></a>
### CONTENTS_SLIME

```ml
const CONTENTS_SLIME = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L37)

<a id="constant-constant-mq3-botlib-ai-move-runtime-contents-solid-playerclip-const-contents-solid-playerclip-65537-src-mq3-botlib-ai-move-runtime-ml-527001169"></a>
### CONTENTS_SOLID_PLAYERCLIP

```ml
const CONTENTS_SOLID_PLAYERCLIP = 65537
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L35)

<a id="constant-constant-mq3-botlib-ai-move-runtime-contents-water-const-contents-water-32-src-mq3-botlib-ai-move-runtime-ml-922051590"></a>
### CONTENTS_WATER

```ml
const CONTENTS_WATER = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L38)

<a id="function-function-mq3-botlib-ai-move-runtime-copyvector-function-copyvector-value-src-mq3-botlib-ai-move-runtime-ml-103266047"></a>
### copyVector

```ml
function copyVector(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L72)

<a id="function-function-mq3-botlib-ai-move-runtime-create-function-create-pools-aas-router-host-src-mq3-botlib-ai-move-runtime-ml-1744596741"></a>
### create

```ml
function create(pools, aas, router, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — |  |
| `aas` | `dynamic` | — |  |
| `router` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L71)

<a id="function-function-mq3-botlib-ai-move-runtime-distance-function-distance-a-b-src-mq3-botlib-ai-move-runtime-ml-2115820543"></a>
### distance

```ml
function distance(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L73)

<a id="function-function-mq3-botlib-ai-move-runtime-distancefromlinesquared-function-distancefromlinesquared-point-start-finish-src-mq3-botlib-ai-move-runtime-ml-754998545"></a>
### distanceFromLineSquared

```ml
function distanceFromLineSquared(point, start, finish)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L176)

<a id="function-function-mq3-botlib-ai-move-runtime-dot-function-dot-a-b-src-mq3-botlib-ai-move-runtime-ml-1925816749"></a>
### dot

```ml
function dot(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L223)

<a id="function-function-mq3-botlib-ai-move-runtime-elevatorstate-function-elevatorstate-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-1459700302"></a>
### elevatorState

```ml
function elevatorState(runtime, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L332)

- [mq3.botlib.ai_move_runtime.ElevatorState](Type-mq3-botlib-ai-move-runtime-elevatorstate-1949201620.md) — struct
<a id="function-function-mq3-botlib-ai-move-runtime-emitattack-function-emitattack-runtime-state-src-mq3-botlib-ai-move-runtime-ml-1307832097"></a>
### emitAttack

```ml
function emitAttack(runtime, state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L155)

<a id="function-function-mq3-botlib-ai-move-runtime-emitcommand-function-emitcommand-runtime-state-text-src-mq3-botlib-ai-move-runtime-ml-250458504"></a>
### emitCommand

```ml
function emitCommand(runtime, state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L159)

<a id="function-function-mq3-botlib-ai-move-runtime-emitcrouch-function-emitcrouch-runtime-state-src-mq3-botlib-ai-move-runtime-ml-14006697"></a>
### emitCrouch

```ml
function emitCrouch(runtime, state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L151)

<a id="function-function-mq3-botlib-ai-move-runtime-emitdelayedjump-function-emitdelayedjump-runtime-state-src-mq3-botlib-ai-move-runtime-ml-1005886563"></a>
### emitDelayedJump

```ml
function emitDelayedJump(runtime, state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L153)

<a id="function-function-mq3-botlib-ai-move-runtime-emitjump-function-emitjump-runtime-state-src-mq3-botlib-ai-move-runtime-ml-430609401"></a>
### emitJump

```ml
function emitJump(runtime, state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L152)

<a id="function-function-mq3-botlib-ai-move-runtime-emitmoveforward-function-emitmoveforward-runtime-state-src-mq3-botlib-ai-move-runtime-ml-142641847"></a>
### emitMoveForward

```ml
function emitMoveForward(runtime, state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L154)

<a id="function-function-mq3-botlib-ai-move-runtime-emitmovement-function-emitmovement-runtime-state-direction-speed-src-mq3-botlib-ai-move-runtime-ml-1156606861"></a>
### emitMovement

```ml
function emitMovement(runtime, state, direction, speed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |
| `speed` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L147)

<a id="function-function-mq3-botlib-ai-move-runtime-emitmoveup-function-emitmoveup-runtime-state-src-mq3-botlib-ai-move-runtime-ml-1792188449"></a>
### emitMoveUp

```ml
function emitMoveUp(runtime, state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L158)

<a id="function-function-mq3-botlib-ai-move-runtime-emitselectweapon-function-emitselectweapon-runtime-state-weapon-src-mq3-botlib-ai-move-runtime-ml-1343873701"></a>
### emitSelectWeapon

```ml
function emitSelectWeapon(runtime, state, weapon)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `weapon` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L157)

<a id="function-function-mq3-botlib-ai-move-runtime-emitview-function-emitview-runtime-state-angles-src-mq3-botlib-ai-move-runtime-ml-142956701"></a>
### emitView

```ml
function emitView(runtime, state, angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L156)

<a id="function-function-mq3-botlib-ai-move-runtime-emitwalk-function-emitwalk-runtime-state-src-mq3-botlib-ai-move-runtime-ml-1704129737"></a>
### emitWalk

```ml
function emitWalk(runtime, state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L150)

<a id="function-function-mq3-botlib-ai-move-runtime-emptymoveresult-function-emptymoveresult-src-mq3-botlib-ai-move-runtime-ml-1321475224"></a>
### emptyMoveResult

```ml
function emptyMoveResult()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L143)

<a id="constant-constant-mq3-botlib-ai-move-runtime-entitynum-none-const-entitynum-none-1023-src-mq3-botlib-ai-move-runtime-ml-2100838685"></a>
### ENTITYNUM_NONE

```ml
const ENTITYNUM_NONE = 1023
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L34)

<a id="constant-constant-mq3-botlib-ai-move-runtime-entitynum-world-const-entitynum-world-1022-src-mq3-botlib-ai-move-runtime-ml-1470985788"></a>
### ENTITYNUM_WORLD

```ml
const ENTITYNUM_WORLD = 1022
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L33)

<a id="constant-constant-mq3-botlib-ai-move-runtime-external-move-flags-const-external-move-flags-mfl-onground-mfl-waterjump-mfl-teleported-mfl-grapplepull-mfl-walk-src-mq3-botlib-ai-move-runtime-ml-591628661"></a>
### EXTERNAL_MOVE_FLAGS

```ml
const EXTERNAL_MOVE_FLAGS = MFL_ONGROUND | MFL_WATERJUMP | MFL_TELEPORTED | MFL_GRAPPLEPULL | MFL_WALK
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L30)

<a id="function-function-mq3-botlib-ai-move-runtime-finishtravelbarrierjump-function-finishtravelbarrierjump-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-1085750428"></a>
### finishTravelBarrierJump

```ml
function finishTravelBarrierJump(runtime, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L288)

<a id="function-function-mq3-botlib-ai-move-runtime-finishtravelelevator-function-finishtravelelevator-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-1490737688"></a>
### finishTravelElevator

```ml
function finishTravelElevator(runtime, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L381)

<a id="function-function-mq3-botlib-ai-move-runtime-finishtravelfuncbob-function-finishtravelfuncbob-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-178442484"></a>
### finishTravelFuncBob

```ml
function finishTravelFuncBob(runtime, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L458)

<a id="function-function-mq3-botlib-ai-move-runtime-finishtraveljump-function-finishtraveljump-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-1647792096"></a>
### finishTravelJump

```ml
function finishTravelJump(runtime, state, reach)
```

BotFinishTravel_Jump: retain maximum in-air speed until just past the landing.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L264)

<a id="function-function-mq3-botlib-ai-move-runtime-finishtraveljumppad-function-finishtraveljumppad-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-1986525396"></a>
### finishTravelJumpPad

```ml
function finishTravelJumpPad(runtime, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L413)

<a id="function-function-mq3-botlib-ai-move-runtime-finishtravelwalkoffledge-function-finishtravelwalkoffledge-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-1779860244"></a>
### finishTravelWalkOffLedge

```ml
function finishTravelWalkOffLedge(runtime, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L318)

<a id="function-function-mq3-botlib-ai-move-runtime-finishtravelwaterjump-function-finishtravelwaterjump-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-1054644508"></a>
### finishTravelWaterJump

```ml
function finishTravelWaterJump(runtime, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L430)

<a id="function-function-mq3-botlib-ai-move-runtime-finishtravelweaponjump-function-finishtravelweaponjump-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-1475600144"></a>
### finishTravelWeaponJump

```ml
function finishTravelWeaponJump(runtime, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L404)

<a id="function-function-mq3-botlib-ai-move-runtime-funcbobstate-function-funcbobstate-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-1356011508"></a>
### funcBobState

```ml
function funcBobState(runtime, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L435)

- [mq3.botlib.ai_move_runtime.FuncBobState](Type-mq3-botlib-ai-move-runtime-funcbobstate-960080111.md) — struct
<a id="function-function-mq3-botlib-ai-move-runtime-fuzzypointreachabilityarea-function-fuzzypointreachabilityarea-runtime-origin-src-mq3-botlib-ai-move-runtime-ml-1454296306"></a>
### fuzzyPointReachabilityArea

```ml
function fuzzyPointReachabilityArea(runtime, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L81)

<a id="function-function-mq3-botlib-ai-move-runtime-gapdistance-function-gapdistance-runtime-state-direction-src-mq3-botlib-ai-move-runtime-ml-579777952"></a>
### gapDistance

```ml
function gapDistance(runtime, state, direction)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L166)

<a id="function-function-mq3-botlib-ai-move-runtime-grappleconfig-function-grappleconfig-runtime-src-mq3-botlib-ai-move-runtime-ml-159145354"></a>
### grappleConfig

```ml
function grappleConfig(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L469)

- [mq3.botlib.ai_move_runtime.GrappleConfig](Type-mq3-botlib-ai-move-runtime-grappleconfig-2142469774.md) — struct
<a id="function-function-mq3-botlib-ai-move-runtime-grapplestate-function-grapplestate-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-1919743172"></a>
### grappleState

```ml
function grappleState(runtime, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L472)

<a id="function-function-mq3-botlib-ai-move-runtime-gravity-function-gravity-runtime-src-mq3-botlib-ai-move-runtime-ml-1470987268"></a>
### gravity

```ml
function gravity(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L232)

- [mq3.botlib.ai_move_runtime.GroundTrace](Type-mq3-botlib-ai-move-runtime-groundtrace-1608856495.md) — struct
<a id="function-function-mq3-botlib-ai-move-runtime-horizontalvelocityforjump-function-horizontalvelocityforjump-runtime-zvelocity-start-finish-src-mq3-botlib-ai-move-runtime-ml-944281392"></a>
### horizontalVelocityForJump

```ml
function horizontalVelocityForJump(runtime, zVelocity, start, finish)
```

AAS_HorizontalVelocityForJump with Baseq3 default physics. A host callback can supply the live aassettings values and returns [success, velocity].

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `zVelocity` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L226)

- [mq3.botlib.ai_move_runtime.InitMove](Type-mq3-botlib-ai-move-runtime-initmove-1706906806.md) — struct
<a id="function-function-mq3-botlib-ai-move-runtime-initmovestate-function-initmovestate-runtime-handle-init-src-mq3-botlib-ai-move-runtime-ml-1495720128"></a>
### initMoveState

```ml
function initMoveState(runtime, handle, init)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `init` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L75)

<a id="function-function-mq3-botlib-ai-move-runtime-isswimming-function-isswimming-runtime-state-src-mq3-botlib-ai-move-runtime-ml-1474001585"></a>
### isSwimming

```ml
function isSwimming(runtime, state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L163)

<a id="function-function-mq3-botlib-ai-move-runtime-jumpreachrunstart-function-jumpreachrunstart-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-828184324"></a>
### jumpReachRunStart

```ml
function jumpReachRunStart(runtime, state, reach)
```

AAS_JumpReachRunStart predicts two 0.1 second frames at speed 400 away from the jump. The callback supplies the collision-accurate predicted end. The fallback preserves its unobstructed direction; BotTravel_Jump normalizes that direction and constructs the actual 80-unit run start immediately after.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L237)

<a id="constant-constant-mq3-botlib-ai-move-runtime-mfl-activegrapple-const-mfl-activegrapple-publicheaders-mfl-activegrapple-src-mq3-botlib-ai-move-runtime-ml-1154446863"></a>
### MFL_ACTIVEGRAPPLE

```ml
const MFL_ACTIVEGRAPPLE = publicHeaders.MFL_ACTIVEGRAPPLE
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L28)

<a id="constant-constant-mq3-botlib-ai-move-runtime-mfl-againstladder-const-mfl-againstladder-publicheaders-mfl-againstladder-src-mq3-botlib-ai-move-runtime-ml-460561325"></a>
### MFL_AGAINSTLADDER

```ml
const MFL_AGAINSTLADDER = publicHeaders.MFL_AGAINSTLADDER
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L23)

<a id="constant-constant-mq3-botlib-ai-move-runtime-mfl-barrierjump-const-mfl-barrierjump-publicheaders-mfl-barrierjump-src-mq3-botlib-ai-move-runtime-ml-609939161"></a>
### MFL_BARRIERJUMP

```ml
const MFL_BARRIERJUMP = publicHeaders.MFL_BARRIERJUMP
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L20)

<a id="constant-constant-mq3-botlib-ai-move-runtime-mfl-grapplepull-const-mfl-grapplepull-publicheaders-mfl-grapplepull-src-mq3-botlib-ai-move-runtime-ml-582264202"></a>
### MFL_GRAPPLEPULL

```ml
const MFL_GRAPPLEPULL = publicHeaders.MFL_GRAPPLEPULL
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L26)

<a id="constant-constant-mq3-botlib-ai-move-runtime-mfl-grapplereset-const-mfl-grapplereset-publicheaders-mfl-grapplereset-src-mq3-botlib-ai-move-runtime-ml-2089522038"></a>
### MFL_GRAPPLERESET

```ml
const MFL_GRAPPLERESET = publicHeaders.MFL_GRAPPLERESET
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L29)

<a id="constant-constant-mq3-botlib-ai-move-runtime-mfl-onground-const-mfl-onground-publicheaders-mfl-onground-src-mq3-botlib-ai-move-runtime-ml-792567462"></a>
### MFL_ONGROUND

```ml
const MFL_ONGROUND = publicHeaders.MFL_ONGROUND
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L21)

<a id="constant-constant-mq3-botlib-ai-move-runtime-mfl-swimming-const-mfl-swimming-publicheaders-mfl-swimming-src-mq3-botlib-ai-move-runtime-ml-1243091967"></a>
### MFL_SWIMMING

```ml
const MFL_SWIMMING = publicHeaders.MFL_SWIMMING
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L22)

<a id="constant-constant-mq3-botlib-ai-move-runtime-mfl-teleported-const-mfl-teleported-publicheaders-mfl-teleported-src-mq3-botlib-ai-move-runtime-ml-2122021362"></a>
### MFL_TELEPORTED

```ml
const MFL_TELEPORTED = publicHeaders.MFL_TELEPORTED
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L25)

<a id="constant-constant-mq3-botlib-ai-move-runtime-mfl-walk-const-mfl-walk-publicheaders-mfl-walk-src-mq3-botlib-ai-move-runtime-ml-1664927011"></a>
### MFL_WALK

```ml
const MFL_WALK = publicHeaders.MFL_WALK
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L27)

<a id="constant-constant-mq3-botlib-ai-move-runtime-mfl-waterjump-const-mfl-waterjump-publicheaders-mfl-waterjump-src-mq3-botlib-ai-move-runtime-ml-556771421"></a>
### MFL_WATERJUMP

```ml
const MFL_WATERJUMP = publicHeaders.MFL_WATERJUMP
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L24)

<a id="constant-constant-mq3-botlib-ai-move-runtime-modeltype-func-bob-const-modeltype-func-bob-2-src-mq3-botlib-ai-move-runtime-ml-1675677595"></a>
### MODELTYPE_FUNC_BOB

```ml
const MODELTYPE_FUNC_BOB = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L32)

<a id="constant-constant-mq3-botlib-ai-move-runtime-modeltype-func-plat-const-modeltype-func-plat-1-src-mq3-botlib-ai-move-runtime-ml-2058523656"></a>
### MODELTYPE_FUNC_PLAT

```ml
const MODELTYPE_FUNC_PLAT = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L31)

<a id="constant-constant-mq3-botlib-ai-move-runtime-move-crouch-const-move-crouch-publicheaders-move-crouch-src-mq3-botlib-ai-move-runtime-ml-2073805504"></a>
### MOVE_CROUCH

```ml
const MOVE_CROUCH = publicHeaders.MOVE_CROUCH
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L40)

<a id="constant-constant-mq3-botlib-ai-move-runtime-move-jump-const-move-jump-publicheaders-move-jump-src-mq3-botlib-ai-move-runtime-ml-7225530"></a>
### MOVE_JUMP

```ml
const MOVE_JUMP = publicHeaders.MOVE_JUMP
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L41)

<a id="constant-constant-mq3-botlib-ai-move-runtime-move-walk-const-move-walk-publicheaders-move-walk-src-mq3-botlib-ai-move-runtime-ml-1680339735"></a>
### MOVE_WALK

```ml
const MOVE_WALK = publicHeaders.MOVE_WALK
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L39)

<a id="function-function-mq3-botlib-ai-move-runtime-moveindirection-function-moveindirection-runtime-handle-direction-speed-type-src-mq3-botlib-ai-move-runtime-ml-1929481504"></a>
### moveInDirection

```ml
function moveInDirection(runtime, handle, direction, speed, type)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |
| `speed` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L565)

<a id="function-function-mq3-botlib-ai-move-runtime-moveingoalarea-function-moveingoalarea-runtime-state-goal-src-mq3-botlib-ai-move-runtime-ml-1761577376"></a>
### moveInGoalArea

```ml
function moveInGoalArea(runtime, state, goal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L501)

<a id="function-function-mq3-botlib-ai-move-runtime-movementviewtarget-function-movementviewtarget-runtime-handle-goal-travelflags-lookahead-target-src-mq3-botlib-ai-move-runtime-ml-132569159"></a>
### movementViewTarget

```ml
function movementViewTarget(runtime, handle, goal, travelFlags, lookAhead, target)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |
| `lookAhead` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L130)

- [mq3.botlib.ai_move_runtime.MoveResult](Type-mq3-botlib-ai-move-runtime-moveresult-1165725401.md) — struct
<a id="constant-constant-mq3-botlib-ai-move-runtime-moveresult-blockedbyavoidspot-const-moveresult-blockedbyavoidspot-publicheaders-moveresult-blockedbyavoidspot-src-mq3-botlib-ai-move-runtime-ml-2119590339"></a>
### MOVERESULT_BLOCKEDBYAVOIDSPOT

```ml
const MOVERESULT_BLOCKEDBYAVOIDSPOT = publicHeaders.MOVERESULT_BLOCKEDBYAVOIDSPOT
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L48)

<a id="constant-constant-mq3-botlib-ai-move-runtime-moveresult-movementview-const-moveresult-movementview-publicheaders-moveresult-movementview-src-mq3-botlib-ai-move-runtime-ml-2099968109"></a>
### MOVERESULT_MOVEMENTVIEW

```ml
const MOVERESULT_MOVEMENTVIEW = publicHeaders.MOVERESULT_MOVEMENTVIEW
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L42)

<a id="constant-constant-mq3-botlib-ai-move-runtime-moveresult-movementviewset-const-moveresult-movementviewset-publicheaders-moveresult-movementviewset-src-mq3-botlib-ai-move-runtime-ml-708633795"></a>
### MOVERESULT_MOVEMENTVIEWSET

```ml
const MOVERESULT_MOVEMENTVIEWSET = publicHeaders.MOVERESULT_MOVEMENTVIEWSET
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L45)

<a id="constant-constant-mq3-botlib-ai-move-runtime-moveresult-movementweapon-const-moveresult-movementweapon-publicheaders-moveresult-movementweapon-src-mq3-botlib-ai-move-runtime-ml-1782836312"></a>
### MOVERESULT_MOVEMENTWEAPON

```ml
const MOVERESULT_MOVEMENTWEAPON = publicHeaders.MOVERESULT_MOVEMENTWEAPON
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L46)

<a id="constant-constant-mq3-botlib-ai-move-runtime-moveresult-ontopofobstacle-const-moveresult-ontopofobstacle-publicheaders-moveresult-ontopofobstacle-src-mq3-botlib-ai-move-runtime-ml-200430183"></a>
### MOVERESULT_ONTOPOFOBSTACLE

```ml
const MOVERESULT_ONTOPOFOBSTACLE = publicHeaders.MOVERESULT_ONTOPOFOBSTACLE
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L47)

<a id="constant-constant-mq3-botlib-ai-move-runtime-moveresult-swimview-const-moveresult-swimview-publicheaders-moveresult-swimview-src-mq3-botlib-ai-move-runtime-ml-685495724"></a>
### MOVERESULT_SWIMVIEW

```ml
const MOVERESULT_SWIMVIEW = publicHeaders.MOVERESULT_SWIMVIEW
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L43)

<a id="constant-constant-mq3-botlib-ai-move-runtime-moveresult-waiting-const-moveresult-waiting-publicheaders-moveresult-waiting-src-mq3-botlib-ai-move-runtime-ml-763238470"></a>
### MOVERESULT_WAITING

```ml
const MOVERESULT_WAITING = publicHeaders.MOVERESULT_WAITING
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L44)

<a id="function-function-mq3-botlib-ai-move-runtime-movetogoal-function-movetogoal-runtime-handle-goal-travelflags-src-mq3-botlib-ai-move-runtime-ml-864810454"></a>
### moveToGoal

```ml
function moveToGoal(runtime, handle, goal, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L511)

<a id="function-function-mq3-botlib-ai-move-runtime-nextreachability-function-nextreachability-runtime-state-origin-areanum-goal-travelflags-lastareanum-src-mq3-botlib-ai-move-runtime-ml-2133533861"></a>
### nextReachability

```ml
function nextReachability(runtime, state, origin, areaNum, goal, travelFlags, lastAreaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |
| `lastAreaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L125)

<a id="function-function-mq3-botlib-ai-move-runtime-normalize-function-normalize-value-src-mq3-botlib-ai-move-runtime-ml-613622321"></a>
### normalize

```ml
function normalize(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L144)

<a id="function-function-mq3-botlib-ai-move-runtime-onground-function-onground-runtime-state-src-mq3-botlib-ai-move-runtime-ml-248779849"></a>
### onGround

```ml
function onGround(runtime, state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L160)

<a id="constant-constant-mq3-botlib-ai-move-runtime-op-init-move-state-const-op-init-move-state-557-src-mq3-botlib-ai-move-runtime-ml-2058572358"></a>
### OP_INIT_MOVE_STATE

```ml
const OP_INIT_MOVE_STATE = 557
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L19)

<a id="constant-constant-mq3-botlib-ai-move-runtime-op-move-in-direction-const-op-move-in-direction-550-src-mq3-botlib-ai-move-runtime-ml-620804837"></a>
### OP_MOVE_IN_DIRECTION

```ml
const OP_MOVE_IN_DIRECTION = 550
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L16)

<a id="constant-constant-mq3-botlib-ai-move-runtime-op-move-to-goal-const-op-move-to-goal-549-src-mq3-botlib-ai-move-runtime-ml-1022897155"></a>
### OP_MOVE_TO_GOAL

```ml
const OP_MOVE_TO_GOAL = 549
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L15)

<a id="constant-constant-mq3-botlib-ai-move-runtime-op-movement-view-target-const-op-movement-view-target-554-src-mq3-botlib-ai-move-runtime-ml-506498585"></a>
### OP_MOVEMENT_VIEW_TARGET

```ml
const OP_MOVEMENT_VIEW_TARGET = 554
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L18)

<a id="constant-constant-mq3-botlib-ai-move-runtime-op-reachability-area-const-op-reachability-area-553-src-mq3-botlib-ai-move-runtime-ml-914729588"></a>
### OP_REACHABILITY_AREA

```ml
const OP_REACHABILITY_AREA = 553
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L17)

<a id="function-function-mq3-botlib-ai-move-runtime-pointcontents-function-pointcontents-runtime-point-src-mq3-botlib-ai-move-runtime-ml-545864916"></a>
### pointContents

```ml
function pointContents(runtime, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L419)

<a id="function-function-mq3-botlib-ai-move-runtime-reachabilityarea-function-reachabilityarea-runtime-origin-client-src-mq3-botlib-ai-move-runtime-ml-78405339"></a>
### reachabilityArea

```ml
function reachabilityArea(runtime, origin, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L103)

<a id="function-function-mq3-botlib-ai-move-runtime-reachabilitytime-function-reachabilitytime-reach-src-mq3-botlib-ai-move-runtime-ml-471805713"></a>
### reachabilityTime

```ml
function reachabilityTime(reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L202)

<a id="function-function-mq3-botlib-ai-move-runtime-reachavoided-function-reachavoided-state-reach-origin-src-mq3-botlib-ai-move-runtime-ml-1918995032"></a>
### reachAvoided

```ml
function reachAvoided(state, reach, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L182)

<a id="function-function-mq3-botlib-ai-move-runtime-resetgrapple-function-resetgrapple-runtime-state-src-mq3-botlib-ai-move-runtime-ml-1030653865"></a>
### resetGrapple

```ml
function resetGrapple(runtime, state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L475)

<a id="constant-constant-mq3-botlib-ai-move-runtime-resulttype-badgrapplepath-const-resulttype-badgrapplepath-publicheaders-resulttype-badgrapplepath-src-mq3-botlib-ai-move-runtime-ml-1795534443"></a>
### RESULTTYPE_BADGRAPPLEPATH

```ml
const RESULTTYPE_BADGRAPPLEPATH = publicHeaders.RESULTTYPE_BADGRAPPLEPATH
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L51)

<a id="constant-constant-mq3-botlib-ai-move-runtime-resulttype-elevatorup-const-resulttype-elevatorup-publicheaders-resulttype-elevatorup-src-mq3-botlib-ai-move-runtime-ml-2142609165"></a>
### RESULTTYPE_ELEVATORUP

```ml
const RESULTTYPE_ELEVATORUP = publicHeaders.RESULTTYPE_ELEVATORUP
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L49)

<a id="constant-constant-mq3-botlib-ai-move-runtime-resulttype-insolidarea-const-resulttype-insolidarea-publicheaders-resulttype-insolidarea-src-mq3-botlib-ai-move-runtime-ml-1451592037"></a>
### RESULTTYPE_INSOLIDAREA

```ml
const RESULTTYPE_INSOLIDAREA = publicHeaders.RESULTTYPE_INSOLIDAREA
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L52)

<a id="constant-constant-mq3-botlib-ai-move-runtime-resulttype-waitforfuncbobbing-const-resulttype-waitforfuncbobbing-publicheaders-resulttype-waitforfuncbobbing-src-mq3-botlib-ai-move-runtime-ml-279925265"></a>
### RESULTTYPE_WAITFORFUNCBOBBING

```ml
const RESULTTYPE_WAITFORFUNCBOBBING = publicHeaders.RESULTTYPE_WAITFORFUNCBOBBING
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L50)

- [mq3.botlib.ai_move_runtime.Runtime](Type-mq3-botlib-ai-move-runtime-runtime-945081511.md) — struct
<a id="function-function-mq3-botlib-ai-move-runtime-services-function-services-context-src-mq3-botlib-ai-move-runtime-ml-755952669"></a>
### services

```ml
function services(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L70)

- [mq3.botlib.ai_move_runtime.Services](Type-mq3-botlib-ai-move-runtime-services-49942585.md) — struct
<a id="function-function-mq3-botlib-ai-move-runtime-signedrandom-function-signedrandom-runtime-src-mq3-botlib-ai-move-runtime-ml-467566224"></a>
### signedRandom

```ml
function signedRandom(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L418)

<a id="function-function-mq3-botlib-ai-move-runtime-stopgrapple-function-stopgrapple-runtime-state-config-src-mq3-botlib-ai-move-runtime-ml-196550677"></a>
### stopGrapple

```ml
function stopGrapple(runtime, state, config)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `config` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L479)

<a id="function-function-mq3-botlib-ai-move-runtime-supportstrap-function-supportstrap-op-src-mq3-botlib-ai-move-runtime-ml-169953587"></a>
### supportsTrap

```ml
function supportsTrap(op)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `op` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L570)

<a id="function-function-mq3-botlib-ai-move-runtime-travelbarrierjump-function-travelbarrierjump-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-751989150"></a>
### travelBarrierJump

```ml
function travelBarrierJump(runtime, state, reach)
```

BotTravel_BarrierJump and its airborne finish path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L280)

<a id="function-function-mq3-botlib-ai-move-runtime-travelcrouch-function-travelcrouch-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-1020778532"></a>
### travelCrouch

```ml
function travelCrouch(runtime, state, reach)
```

BotTravel_Crouch: always crouch and move horizontally towards the reach end.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L219)

<a id="function-function-mq3-botlib-ai-move-runtime-travelelevator-function-travelelevator-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-1692220956"></a>
### travelElevator

```ml
function travelElevator(runtime, state, reach)
```

BotTravel_Elevator depends on live mover bounds/origin and entity tracing. Missing mover state is an explicit failure instead of guessed success.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L351)

<a id="function-function-mq3-botlib-ai-move-runtime-travelfuncbob-function-travelfuncbob-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-1984710090"></a>
### travelFuncBob

```ml
function travelFuncBob(runtime, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L439)

<a id="function-function-mq3-botlib-ai-move-runtime-travelgrapple-function-travelgrapple-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-892003882"></a>
### travelGrapple

```ml
function travelGrapple(runtime, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L482)

<a id="function-function-mq3-botlib-ai-move-runtime-traveljump-function-traveljump-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-2107854028"></a>
### travelJump

```ml
function travelJump(runtime, state, reach)
```

BotTravel_Jump, including its ten-unit gap scan and jump/delayed-jump thresholds.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L242)

<a id="function-function-mq3-botlib-ai-move-runtime-traveljumppad-function-traveljumppad-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-916212670"></a>
### travelJumpPad

```ml
function travelJumpPad(runtime, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L409)

<a id="function-function-mq3-botlib-ai-move-runtime-travelladder-function-travelladder-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-323737460"></a>
### travelLadder

```ml
function travelLadder(runtime, state, reach)
```

BotTravel_Ladder: face along the vertically weighted ladder direction and use the forward action; EA_Move intentionally carries zero speed.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L273)

<a id="function-function-mq3-botlib-ai-move-runtime-travelswim-function-travelswim-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-233855088"></a>
### travelSwim

```ml
function travelSwim(runtime, state, reach)
```

BotTravel_Swim is shared by the grounded and airborne switches.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L421)

<a id="function-function-mq3-botlib-ai-move-runtime-travelteleport-function-travelteleport-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-687162316"></a>
### travelTeleport

```ml
function travelTeleport(runtime, state, reach)
```

BotTravel_Teleport. The airborne finish case is an intentional no-op in BotMoveToGoal and is handled in the dispatcher below.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L344)

<a id="function-function-mq3-botlib-ai-move-runtime-travelwalk-function-travelwalk-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-261089188"></a>
### travelWalk

```ml
function travelWalk(runtime, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L205)

<a id="function-function-mq3-botlib-ai-move-runtime-travelwalkoffledge-function-travelwalkoffledge-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-1188212200"></a>
### travelWalkOffLedge

```ml
function travelWalkOffLedge(runtime, state, reach)
```

BotTravel_WalkOffLedge selects a careful vertical drop speed or the ballistic horizontal speed calculated by AAS_HorizontalVelocityForJump.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L295)

<a id="function-function-mq3-botlib-ai-move-runtime-travelwaterjump-function-travelwaterjump-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-1741001034"></a>
### travelWaterJump

```ml
function travelWaterJump(runtime, state, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L425)

<a id="function-function-mq3-botlib-ai-move-runtime-travelweaponjump-function-travelweaponjump-runtime-state-reach-weapon-src-mq3-botlib-ai-move-runtime-ml-1390896692"></a>
### travelWeaponJump

```ml
function travelWeaponJump(runtime, state, reach, weapon)
```

Shared source body for BotTravel_RocketJump and BotTravel_BFGJump.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |
| `weapon` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L388)

<a id="function-function-mq3-botlib-ai-move-runtime-unsupportedtravel-function-unsupportedtravel-reach-src-mq3-botlib-ai-move-runtime-ml-1374214695"></a>
### unsupportedTravel

```ml
function unsupportedTravel(reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L508)

<a id="function-function-mq3-botlib-ai-move-runtime-vectordistancesquared-function-vectordistancesquared-a-b-src-mq3-botlib-ai-move-runtime-ml-62805857"></a>
### vectorDistanceSquared

```ml
function vectorDistanceSquared(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L174)

- [mq3.botlib.ai_move_runtime.ViewTargetResult](Type-mq3-botlib-ai-move-runtime-viewtargetresult-2009883812.md) — struct
<a id="constant-constant-mq3-botlib-ai-move-runtime-weapon-bfg-const-weapon-bfg-9-src-mq3-botlib-ai-move-runtime-ml-1421360106"></a>
### WEAPON_BFG

```ml
const WEAPON_BFG = 9
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L58)

<a id="constant-constant-mq3-botlib-ai-move-runtime-weapon-grapple-const-weapon-grapple-10-src-mq3-botlib-ai-move-runtime-ml-1163723134"></a>
### WEAPON_GRAPPLE

```ml
const WEAPON_GRAPPLE = 10
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L59)

<a id="constant-constant-mq3-botlib-ai-move-runtime-weapon-rocket-launcher-const-weapon-rocket-launcher-5-src-mq3-botlib-ai-move-runtime-ml-1852194754"></a>
### WEAPON_ROCKET_LAUNCHER

```ml
const WEAPON_ROCKET_LAUNCHER = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_runtime.ml#L57)
