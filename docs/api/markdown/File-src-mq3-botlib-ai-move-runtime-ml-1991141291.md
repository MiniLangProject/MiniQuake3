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

Return the absolute value of the numeric argument for ai move runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `0.0-value`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L489)

<a id="function-function-mq3-botlib-ai-move-runtime-addtotarget-function-addtotarget-start-finish-maxdistance-travelled-target-src-mq3-botlib-ai-move-runtime-ml-763467134"></a>
### addToTarget

```ml
function addToTarget(start, finish, maxDistance, travelled, target)
```

Advance a look-ahead target along a path segment and return whether the requested distance has been reached.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — | World-space start of the current path segment. |
| `finish` | `dynamic` | — | World-space end of the current path segment. |
| `maxDistance` | `dynamic` | — | Maximum distance to advance along the path. |
| `travelled` | `dynamic` | — | Distance already accumulated before this segment. |
| `target` | `dynamic` | — | Mutable three-component look-ahead target written when the requested distance falls on this segment. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L357)

<a id="function-function-mq3-botlib-ai-move-runtime-aircontrol-function-aircontrol-runtime-origin-velocity-goal-src-mq3-botlib-ai-move-runtime-ml-369501802"></a>
### airControl

```ml
function airControl(runtime, origin, velocity, goal)
```

BotAirControl integrates the original 0.1-second velocity units for up to 50 frames and computes the horizontal correction at the goal height.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `velocity` | `dynamic` | — | Three-component movement velocity. |
| `goal` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L681)

<a id="function-function-mq3-botlib-ai-move-runtime-anglediff-function-anglediff-first-second-src-mq3-botlib-ai-move-runtime-ml-1350599758"></a>
### angleDiff

```ml
function angleDiff(first, second)
```

Compute the signed difference between two angles and wrap it into the shortest-turn range.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.fsub`. |
| `second` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.fsub`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L707)

<a id="constant-constant-mq3-botlib-ai-move-runtime-avoid-always-const-avoid-always-publicheaders-avoid-always-src-mq3-botlib-ai-move-runtime-ml-1594182771"></a>
### AVOID_ALWAYS

```ml
const AVOID_ALWAYS = publicHeaders.AVOID_ALWAYS
```

Avoidance-spot mode that always rejects paths through the spot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L96)

<a id="constant-constant-mq3-botlib-ai-move-runtime-avoidreach-tries-const-avoidreach-tries-4-src-mq3-botlib-ai-move-runtime-ml-1950044373"></a>
### AVOIDREACH_TRIES

```ml
const AVOIDREACH_TRIES = 4
```

Number of failed attempts before a reachability is temporarily avoided.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L98)

<a id="function-function-mq3-botlib-ai-move-runtime-bestreachability-function-bestreachability-runtime-state-goal-travelflags-src-mq3-botlib-ai-move-runtime-ml-1060606427"></a>
### bestReachability

```ml
function bestReachability(runtime, state, goal, travelFlags)
```

Use `runtime.services.routeTravelTimeFn` to perform `bestReachability`. Return paths include `[best,resultFlags]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `router`, `aas` and `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `areaNum`, `avoidReach`, `avoidReachTimes`, `avoidReachTries` and `lastGoalAreaNum` and related fields. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `areaNum`. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L518)

<a id="function-function-mq3-botlib-ai-move-runtime-callgroundtrace-function-callgroundtrace-runtime-origin-client-src-mq3-botlib-ai-move-runtime-ml-99486243"></a>
### callGroundTrace

```ml
function callGroundTrace(runtime, origin, client)
```

Trace three units downward with crouching bounds through the host ground-trace callback; return void when unavailable.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `client` | `dynamic` | — | Value passed as argument 6 to `runtime.services.groundTraceFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L326)

<a id="function-function-mq3-botlib-ai-move-runtime-checkbarrierjump-function-checkbarrierjump-runtime-state-direction-speed-src-mq3-botlib-ai-move-runtime-ml-137129625"></a>
### checkBarrierJump

```ml
function checkBarrierJump(runtime, state, direction, speed)
```

BotCheckBarrierJump's callback reports only collision geometry. The runtime owns the original EA side effects and MFL_BARRIERJUMP state transition.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `moveFlags`. May update `state.moveFlags` in place. |
| `direction` | `dynamic` | — | Array or byte sequence accessed at `0` and `1`. |
| `speed` | `dynamic` | — | Requested movement speed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L727)

<a id="function-function-mq3-botlib-ai-move-runtime-checkblocked-function-checkblocked-runtime-state-direction-checkbottom-result-src-mq3-botlib-ai-move-runtime-ml-1400147962"></a>
### checkBlocked

```ml
function checkBlocked(runtime, state, direction, checkBottom, result)
```

Set `result.blocked` to `true` and `result.blockEntity` to `trace.entity` in `mq3.botlib.ai_move_runtime.checkBlocked`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | Value passed as argument 2 to `runtime.services.blockTraceFn`. |
| `direction` | `dynamic` | — | Value passed as argument 3 to `runtime.services.blockTraceFn`. |
| `checkBottom` | `dynamic` | — | Value passed as argument 4 to `runtime.services.blockTraceFn`. |
| `result` | `dynamic` | — | Result record; accesses `blocked` and `blockEntity`. May update `result.blocked` and `result.blockEntity` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L478)

<a id="function-function-mq3-botlib-ai-move-runtime-checkstandingonmover-function-checkstandingonmover-runtime-state-result-src-mq3-botlib-ai-move-runtime-ml-56741670"></a>
### checkStandingOnMover

```ml
function checkStandingOnMover(runtime, state, result)
```

Update `state.lastReachNum`, `state.reachabilityTime`, `result.flags` and `result.blocked` and related state during `checkStandingOnMover`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`, `router` and `aas`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `presenceType`, `origin`, `entityNum`, `lastReachNum` and `reachabilityTime`. May update `state.lastReachNum` and `state.reachabilityTime` in place. |
| `result` | `dynamic` | — | Result record; accesses `flags`, `blocked` and `blockEntity`. May update `result.flags`, `result.blocked` and `result.blockEntity` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L981)

<a id="constant-constant-mq3-botlib-ai-move-runtime-contents-lava-const-contents-lava-8-src-mq3-botlib-ai-move-runtime-ml-872807255"></a>
### CONTENTS_LAVA

```ml
const CONTENTS_LAVA = 8
```

Collision contents bit marking lava.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L62)

<a id="constant-constant-mq3-botlib-ai-move-runtime-contents-slime-const-contents-slime-16-src-mq3-botlib-ai-move-runtime-ml-2036013090"></a>
### CONTENTS_SLIME

```ml
const CONTENTS_SLIME = 16
```

Collision contents bit marking slime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L64)

<a id="constant-constant-mq3-botlib-ai-move-runtime-contents-solid-playerclip-const-contents-solid-playerclip-65537-src-mq3-botlib-ai-move-runtime-ml-527001169"></a>
### CONTENTS_SOLID_PLAYERCLIP

```ml
const CONTENTS_SOLID_PLAYERCLIP = 65537
```

Combined collision mask for solid geometry and player-only clipping volumes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L60)

<a id="constant-constant-mq3-botlib-ai-move-runtime-contents-water-const-contents-water-32-src-mq3-botlib-ai-move-runtime-ml-922051590"></a>
### CONTENTS_WATER

```ml
const CONTENTS_WATER = 32
```

Collision contents bit marking water.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L66)

<a id="function-function-mq3-botlib-ai-move-runtime-copyvector-function-copyvector-value-src-mq3-botlib-ai-move-runtime-ml-103266047"></a>
### copyVector

```ml
function copyVector(value)
```

Copy `value[0]`, `value[1]` and `value[2]` into a new ordered array for ai move runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L285)

<a id="function-function-mq3-botlib-ai-move-runtime-create-function-create-pools-aas-router-host-src-mq3-botlib-ai-move-runtime-ml-1744596741"></a>
### create

```ml
function create(pools, aas, router, host)
```

Create a `mq3.botlib.ai_move_runtime.Runtime` record, initializing `pools` from `pools`, `aas` from `aas` and `router` from `router`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_move_runtime.Runtime.pools`. |
| `aas` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_move_runtime.Runtime.aas`. |
| `router` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_move_runtime.Runtime.router`. |
| `host` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_move_runtime.Runtime.services`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L282)

<a id="function-function-mq3-botlib-ai-move-runtime-distance-function-distance-a-b-src-mq3-botlib-ai-move-runtime-ml-2115820543"></a>
### distance

```ml
function distance(a, b)
```

Calculate Euclidean distance between two 3D points using the original single-precision arithmetic sequence.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | First three-component point. |
| `b` | `dynamic` | — | Second three-component point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L289)

<a id="function-function-mq3-botlib-ai-move-runtime-distancefromlinesquared-function-distancefromlinesquared-point-start-finish-src-mq3-botlib-ai-move-runtime-ml-754998545"></a>
### distanceFromLineSquared

```ml
function distanceFromLineSquared(point, start, finish)
```

Apply `mq3.botlib.ai_move_runtime.vectorDistanceSquared` and `mq3.botlib.ai_move_runtime.absFloat` while evaluating `distanceFromLineSquared`. Return paths include `vectorDistanceSquared(point,projected)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |
| `start` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `finish` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L494)

<a id="function-function-mq3-botlib-ai-move-runtime-dot-function-dot-a-b-src-mq3-botlib-ai-move-runtime-ml-1925816749"></a>
### dot

```ml
function dot(a, b)
```

Return the result of `n.fadd(n.fadd(n.fmul(a[0],b[0]),n.fmul(a[1],b[1])),n.fmul(a[2],b[2]))` for `dot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `b` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L565)

<a id="function-function-mq3-botlib-ai-move-runtime-elevatorstate-function-elevatorstate-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-1459700302"></a>
### elevatorState

```ml
function elevatorState(runtime, state, reach)
```

Use `runtime.services.elevatorStateFn` to perform `elevatorState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | Value passed as argument 2 to `runtime.services.elevatorStateFn`. |
| `reach` | `dynamic` | — | Value passed as argument 3 to `runtime.services.elevatorStateFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L717)

- [mq3.botlib.ai_move_runtime.ElevatorState](Type-mq3-botlib-ai-move-runtime-elevatorstate-1949201620.md) — struct
<a id="function-function-mq3-botlib-ai-move-runtime-emitattack-function-emitattack-runtime-state-src-mq3-botlib-ai-move-runtime-ml-1307832097"></a>
### emitAttack

```ml
function emitAttack(runtime, state)
```

Apply `mq3.botlib.elementary_actions.attack` while evaluating `emitAttack`. Return paths include `not (result is error)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L433)

<a id="function-function-mq3-botlib-ai-move-runtime-emitcommand-function-emitcommand-runtime-state-text-src-mq3-botlib-ai-move-runtime-ml-250458504"></a>
### emitCommand

```ml
function emitCommand(runtime, state, text)
```

Apply `mq3.botlib.elementary_actions.command` while evaluating `emitCommand`. Return paths include `not (result is error)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `client`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L452)

<a id="function-function-mq3-botlib-ai-move-runtime-emitcrouch-function-emitcrouch-runtime-state-src-mq3-botlib-ai-move-runtime-ml-14006697"></a>
### emitCrouch

```ml
function emitCrouch(runtime, state)
```

Apply `mq3.botlib.elementary_actions.crouch` while evaluating `emitCrouch`. Return paths include `not (result is error)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L417)

<a id="function-function-mq3-botlib-ai-move-runtime-emitdelayedjump-function-emitdelayedjump-runtime-state-src-mq3-botlib-ai-move-runtime-ml-1005886563"></a>
### emitDelayedJump

```ml
function emitDelayedJump(runtime, state)
```

Apply `mq3.botlib.elementary_actions.delayedJump` while evaluating `emitDelayedJump`. Return paths include `not (result is error)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L425)

<a id="function-function-mq3-botlib-ai-move-runtime-emitjump-function-emitjump-runtime-state-src-mq3-botlib-ai-move-runtime-ml-430609401"></a>
### emitJump

```ml
function emitJump(runtime, state)
```

Apply `mq3.botlib.elementary_actions.jump` while evaluating `emitJump`. Return paths include `not (result is error)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L421)

<a id="function-function-mq3-botlib-ai-move-runtime-emitmoveforward-function-emitmoveforward-runtime-state-src-mq3-botlib-ai-move-runtime-ml-142641847"></a>
### emitMoveForward

```ml
function emitMoveForward(runtime, state)
```

Apply `mq3.botlib.elementary_actions.moveForward` while evaluating `emitMoveForward`. Return paths include `not (result is error)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L429)

<a id="function-function-mq3-botlib-ai-move-runtime-emitmovement-function-emitmovement-runtime-state-direction-speed-src-mq3-botlib-ai-move-runtime-ml-1156606861"></a>
### emitMovement

```ml
function emitMovement(runtime, state, direction, speed)
```

Send movement direction and speed to elementary actions and report whether the host action succeeded.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `client`. |
| `direction` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `speed` | `dynamic` | — | Requested movement speed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L407)

<a id="function-function-mq3-botlib-ai-move-runtime-emitmoveup-function-emitmoveup-runtime-state-src-mq3-botlib-ai-move-runtime-ml-1792188449"></a>
### emitMoveUp

```ml
function emitMoveUp(runtime, state)
```

Apply `mq3.botlib.elementary_actions.moveUp` while evaluating `emitMoveUp`. Return paths include `not (result is error)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L447)

<a id="function-function-mq3-botlib-ai-move-runtime-emitselectweapon-function-emitselectweapon-runtime-state-weapon-src-mq3-botlib-ai-move-runtime-ml-1343873701"></a>
### emitSelectWeapon

```ml
function emitSelectWeapon(runtime, state, weapon)
```

Apply `mq3.botlib.elementary_actions.selectWeapon` while evaluating `emitSelectWeapon`. Return paths include `not (result is error)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `client`. |
| `weapon` | `dynamic` | — | Weapon identifier used by the action or inventory lookup. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L443)

<a id="function-function-mq3-botlib-ai-move-runtime-emitview-function-emitview-runtime-state-angles-src-mq3-botlib-ai-move-runtime-ml-142956701"></a>
### emitView

```ml
function emitView(runtime, state, angles)
```

Apply `mq3.botlib.elementary_actions.view` while evaluating `emitView`. Return paths include `not (result is error)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `client`. |
| `angles` | `dynamic` | — | Pitch, yaw and roll angles in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L438)

<a id="function-function-mq3-botlib-ai-move-runtime-emitwalk-function-emitwalk-runtime-state-src-mq3-botlib-ai-move-runtime-ml-1704129737"></a>
### emitWalk

```ml
function emitWalk(runtime, state)
```

Apply `mq3.botlib.elementary_actions.walk` while evaluating `emitWalk`. Return paths include `not (result is error)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L413)

<a id="function-function-mq3-botlib-ai-move-runtime-emptymoveresult-function-emptymoveresult-src-mq3-botlib-ai-move-runtime-ml-1321475224"></a>
### emptyMoveResult

```ml
function emptyMoveResult()
```

Create a `mq3.botlib.ai_move_runtime.MoveResult` record, initializing `moveDir` as `[0.0,0.0,0.0]` and `idealViewAngles` as `[0.0,0.0,0.0]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L396)

<a id="constant-constant-mq3-botlib-ai-move-runtime-entitynum-none-const-entitynum-none-1023-src-mq3-botlib-ai-move-runtime-ml-2100838685"></a>
### ENTITYNUM_NONE

```ml
const ENTITYNUM_NONE = 1023
```

Reserved entity number indicating that no game entity is selected.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L58)

<a id="constant-constant-mq3-botlib-ai-move-runtime-entitynum-world-const-entitynum-world-1022-src-mq3-botlib-ai-move-runtime-ml-1470985788"></a>
### ENTITYNUM_WORLD

```ml
const ENTITYNUM_WORLD = 1022
```

Reserved entity number identifying world geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L56)

<a id="constant-constant-mq3-botlib-ai-move-runtime-external-move-flags-const-external-move-flags-mfl-onground-mfl-waterjump-mfl-teleported-mfl-grapplepull-mfl-walk-src-mq3-botlib-ai-move-runtime-ml-591628661"></a>
### EXTERNAL_MOVE_FLAGS

```ml
const EXTERNAL_MOVE_FLAGS = MFL_ONGROUND | MFL_WATERJUMP | MFL_TELEPORTED | MFL_GRAPPLEPULL | MFL_WALK
```

Combined mask of movement-state flags that callers may supply externally.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L46)

<a id="function-function-mq3-botlib-ai-move-runtime-finishtravelbarrierjump-function-finishtravelbarrierjump-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-1085750428"></a>
### finishTravelBarrierJump

```ml
function finishTravelBarrierJump(runtime, state, reach)
```

Apply `mq3.botlib.ai_move_runtime.emptyMoveResult`, `mq3.botlib.ai_move_runtime.normalize` and `mq3.botlib.ai_move_runtime.checkBlocked` while evaluating `finishTravelBarrierJump`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `velocity` and `origin`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `finish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L655)

<a id="function-function-mq3-botlib-ai-move-runtime-finishtravelelevator-function-finishtravelelevator-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-1490737688"></a>
### finishTravelElevator

```ml
function finishTravelElevator(runtime, state, reach)
```

Apply `mq3.botlib.ai_move_runtime.emptyMoveResult`, `mq3.botlib.ai_move_runtime.elevatorState` and `mq3.botlib.ai_move_runtime.normalize` while evaluating `finishTravelElevator`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `origin`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `finish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L780)

<a id="function-function-mq3-botlib-ai-move-runtime-finishtravelfuncbob-function-finishtravelfuncbob-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-178442484"></a>
### finishTravelFuncBob

```ml
function finishTravelFuncBob(runtime, state, reach)
```

Apply `mq3.botlib.ai_move_runtime.emptyMoveResult`, `mq3.botlib.ai_move_runtime.funcBobState` and `mq3.botlib.ai_move_runtime.normalize` while evaluating `finishTravelFuncBob`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `moveFlags` and `origin`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `finish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L901)

<a id="function-function-mq3-botlib-ai-move-runtime-finishtraveljump-function-finishtraveljump-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-1647792096"></a>
### finishTravelJump

```ml
function finishTravelJump(runtime, state, reach)
```

BotFinishTravel_Jump: retain maximum in-air speed until just past the landing.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `jumpReach` and `origin`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `finish` and `start`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L621)

<a id="function-function-mq3-botlib-ai-move-runtime-finishtraveljumppad-function-finishtraveljumppad-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-1986525396"></a>
### finishTravelJumpPad

```ml
function finishTravelJumpPad(runtime, state, reach)
```

Apply `mq3.botlib.ai_move_runtime.emptyMoveResult`, `mq3.botlib.ai_move_runtime.airControl` and `mq3.botlib.ai_move_runtime.normalize` while evaluating `finishTravelJumpPad`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `origin` and `velocity`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `finish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L828)

<a id="function-function-mq3-botlib-ai-move-runtime-finishtravelwalkoffledge-function-finishtravelwalkoffledge-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-1779860244"></a>
### finishTravelWalkOffLedge

```ml
function finishTravelWalkOffLedge(runtime, state, reach)
```

Apply `mq3.botlib.ai_move_runtime.emptyMoveResult`, `mq3.botlib.ai_move_runtime.checkBlocked` and `mq3.botlib.ai_move_runtime.normalize` while evaluating `finishTravelWalkOffLedge`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `origin` and `velocity`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `finish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L696)

<a id="function-function-mq3-botlib-ai-move-runtime-finishtravelwaterjump-function-finishtravelwaterjump-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-1054644508"></a>
### finishTravelWaterJump

```ml
function finishTravelWaterJump(runtime, state, reach)
```

Apply `mq3.botlib.ai_move_runtime.emptyMoveResult`, `mq3.botlib.ai_move_runtime.copyVector` and `mq3.botlib.ai_move_runtime.pointContents` while evaluating `finishTravelWaterJump`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `moveFlags` and `origin`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `finish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L861)

<a id="function-function-mq3-botlib-ai-move-runtime-finishtravelweaponjump-function-finishtravelweaponjump-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-1475600144"></a>
### finishTravelWeaponJump

```ml
function finishTravelWeaponJump(runtime, state, reach)
```

Apply `mq3.botlib.ai_move_runtime.emptyMoveResult`, `mq3.botlib.ai_move_runtime.airControl` and `mq3.botlib.ai_move_runtime.normalize` while evaluating `finishTravelWeaponJump`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `jumpReach`, `origin` and `velocity`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `finish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L811)

<a id="function-function-mq3-botlib-ai-move-runtime-funcbobstate-function-funcbobstate-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-1356011508"></a>
### funcBobState

```ml
function funcBobState(runtime, state, reach)
```

Use `runtime.services.funcBobStateFn` to perform `funcBobState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | Value passed as argument 2 to `runtime.services.funcBobStateFn`. |
| `reach` | `dynamic` | — | Value passed as argument 3 to `runtime.services.funcBobStateFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L870)

- [mq3.botlib.ai_move_runtime.FuncBobState](Type-mq3-botlib-ai-move-runtime-funcbobstate-960080111.md) — struct
<a id="function-function-mq3-botlib-ai-move-runtime-fuzzypointreachabilityarea-function-fuzzypointreachabilityarea-runtime-origin-src-mq3-botlib-ai-move-runtime-ml-1454296306"></a>
### fuzzyPointReachabilityArea

```ml
function fuzzyPointReachabilityArea(runtime, origin)
```

Find a reachable AAS area at or near an origin using upward and neighboring traces, with the containing area as fallback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `aas`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L304)

<a id="function-function-mq3-botlib-ai-move-runtime-gapdistance-function-gapdistance-runtime-state-direction-src-mq3-botlib-ai-move-runtime-ml-579777952"></a>
### gapDistance

```ml
function gapDistance(runtime, state, direction)
```

Use `runtime.services.gapDistanceFn` to perform `gapDistance`. Return paths include `0.0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `origin` and `entityNum`. |
| `direction` | `dynamic` | — | Value passed as argument 3 to `runtime.services.gapDistanceFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L469)

<a id="function-function-mq3-botlib-ai-move-runtime-grappleconfig-function-grappleconfig-runtime-src-mq3-botlib-ai-move-runtime-ml-159145354"></a>
### grappleConfig

```ml
function grappleConfig(runtime)
```

Use `runtime.services.grappleConfigFn` to perform `grappleConfig`. Return paths include `GrappleConfig(false,WEAPON_GRAPPLE,"grappleon","grappleoff")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L914)

- [mq3.botlib.ai_move_runtime.GrappleConfig](Type-mq3-botlib-ai-move-runtime-grappleconfig-2142469774.md) — struct
<a id="function-function-mq3-botlib-ai-move-runtime-grapplestate-function-grapplestate-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-1919743172"></a>
### grappleState

```ml
function grappleState(runtime, state, reach)
```

Use `runtime.services.grappleStateFn` to perform `grappleState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `moveFlags`. |
| `reach` | `dynamic` | — | Value passed as argument 3 to `runtime.services.grappleStateFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L921)

<a id="function-function-mq3-botlib-ai-move-runtime-gravity-function-gravity-runtime-src-mq3-botlib-ai-move-runtime-ml-1470987268"></a>
### gravity

```ml
function gravity(runtime)
```

Use `runtime.services.gravityFn` to perform `gravity`. Return paths include `800.0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L580)

- [mq3.botlib.ai_move_runtime.GroundTrace](Type-mq3-botlib-ai-move-runtime-groundtrace-1608856495.md) — struct
<a id="function-function-mq3-botlib-ai-move-runtime-horizontalvelocityforjump-function-horizontalvelocityforjump-runtime-zvelocity-start-finish-src-mq3-botlib-ai-move-runtime-ml-944281392"></a>
### horizontalVelocityForJump

```ml
function horizontalVelocityForJump(runtime, zVelocity, start, finish)
```

AAS_HorizontalVelocityForJump with Baseq3 default physics. A host callback can supply the live aassettings values and returns [success, velocity].

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `zVelocity` | `dynamic` | — | Value passed as argument 2 to `runtime.services.horizontalVelocityForJumpFn`. |
| `start` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `finish` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L572)

- [mq3.botlib.ai_move_runtime.InitMove](Type-mq3-botlib-ai-move-runtime-initmove-1706906806.md) — struct
<a id="function-function-mq3-botlib-ai-move-runtime-initmovestate-function-initmovestate-runtime-handle-init-src-mq3-botlib-ai-move-runtime-ml-1495720128"></a>
### initMoveState

```ml
function initMoveState(runtime, handle, init)
```

Initialize a pooled bot movement state, copy its vectors, and replace only the externally supplied movement flags.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `pools`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot movement state. |
| `init` | `dynamic` | — | Movement initialization record; accesses `origin`, `velocity`, `viewOffset`, `entityNum` and `client` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L295)

<a id="function-function-mq3-botlib-ai-move-runtime-isswimming-function-isswimming-runtime-state-src-mq3-botlib-ai-move-runtime-ml-1474001585"></a>
### isSwimming

```ml
function isSwimming(runtime, state)
```

Use `runtime.services.swimmingFn` to perform `isSwimming`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `origin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L462)

<a id="function-function-mq3-botlib-ai-move-runtime-jumpreachrunstart-function-jumpreachrunstart-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-828184324"></a>
### jumpReachRunStart

```ml
function jumpReachRunStart(runtime, state, reach)
```

AAS_JumpReachRunStart predicts two 0.1 second frames at speed 400 away from the jump. The callback supplies the collision-accurate predicted end. The fallback preserves its unobstructed direction; BotTravel_Jump normalizes that direction and constructs the actual 80-unit run start immediately after.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | Value passed as argument 2 to `runtime.services.jumpRunStartFn`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `start` and `finish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L588)

<a id="constant-constant-mq3-botlib-ai-move-runtime-mfl-activegrapple-const-mfl-activegrapple-publicheaders-mfl-activegrapple-src-mq3-botlib-ai-move-runtime-ml-1154446863"></a>
### MFL_ACTIVEGRAPPLE

```ml
const MFL_ACTIVEGRAPPLE = publicHeaders.MFL_ACTIVEGRAPPLE
```

Bot is using the grapple hook.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L42)

<a id="constant-constant-mq3-botlib-ai-move-runtime-mfl-againstladder-const-mfl-againstladder-publicheaders-mfl-againstladder-src-mq3-botlib-ai-move-runtime-ml-460561325"></a>
### MFL_AGAINSTLADDER

```ml
const MFL_AGAINSTLADDER = publicHeaders.MFL_AGAINSTLADDER
```

Bot is against a ladder.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L32)

<a id="constant-constant-mq3-botlib-ai-move-runtime-mfl-barrierjump-const-mfl-barrierjump-publicheaders-mfl-barrierjump-src-mq3-botlib-ai-move-runtime-ml-609939161"></a>
### MFL_BARRIERJUMP

```ml
const MFL_BARRIERJUMP = publicHeaders.MFL_BARRIERJUMP
```

Bot is performing a barrier jump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L26)

<a id="constant-constant-mq3-botlib-ai-move-runtime-mfl-grapplepull-const-mfl-grapplepull-publicheaders-mfl-grapplepull-src-mq3-botlib-ai-move-runtime-ml-582264202"></a>
### MFL_GRAPPLEPULL

```ml
const MFL_GRAPPLEPULL = publicHeaders.MFL_GRAPPLEPULL
```

Bot is being pulled by the grapple.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L38)

<a id="constant-constant-mq3-botlib-ai-move-runtime-mfl-grapplereset-const-mfl-grapplereset-publicheaders-mfl-grapplereset-src-mq3-botlib-ai-move-runtime-ml-2089522038"></a>
### MFL_GRAPPLERESET

```ml
const MFL_GRAPPLERESET = publicHeaders.MFL_GRAPPLERESET
```

Bot has reset the grapple.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L44)

<a id="constant-constant-mq3-botlib-ai-move-runtime-mfl-onground-const-mfl-onground-publicheaders-mfl-onground-src-mq3-botlib-ai-move-runtime-ml-792567462"></a>
### MFL_ONGROUND

```ml
const MFL_ONGROUND = publicHeaders.MFL_ONGROUND
```

Bot is in the ground.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L28)

<a id="constant-constant-mq3-botlib-ai-move-runtime-mfl-swimming-const-mfl-swimming-publicheaders-mfl-swimming-src-mq3-botlib-ai-move-runtime-ml-1243091967"></a>
### MFL_SWIMMING

```ml
const MFL_SWIMMING = publicHeaders.MFL_SWIMMING
```

Bot is swimming.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L30)

<a id="constant-constant-mq3-botlib-ai-move-runtime-mfl-teleported-const-mfl-teleported-publicheaders-mfl-teleported-src-mq3-botlib-ai-move-runtime-ml-2122021362"></a>
### MFL_TELEPORTED

```ml
const MFL_TELEPORTED = publicHeaders.MFL_TELEPORTED
```

Bot is being teleported.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L36)

<a id="constant-constant-mq3-botlib-ai-move-runtime-mfl-walk-const-mfl-walk-publicheaders-mfl-walk-src-mq3-botlib-ai-move-runtime-ml-1664927011"></a>
### MFL_WALK

```ml
const MFL_WALK = publicHeaders.MFL_WALK
```

Bot should walk slowly.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L40)

<a id="constant-constant-mq3-botlib-ai-move-runtime-mfl-waterjump-const-mfl-waterjump-publicheaders-mfl-waterjump-src-mq3-botlib-ai-move-runtime-ml-556771421"></a>
### MFL_WATERJUMP

```ml
const MFL_WATERJUMP = publicHeaders.MFL_WATERJUMP
```

Bot is waterjumping.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L34)

<a id="constant-constant-mq3-botlib-ai-move-runtime-modeltype-func-bob-const-modeltype-func-bob-2-src-mq3-botlib-ai-move-runtime-ml-1675677595"></a>
### MODELTYPE_FUNC_BOB

```ml
const MODELTYPE_FUNC_BOB = 2
```

Bot mover-model classification for func bob.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L50)

<a id="constant-constant-mq3-botlib-ai-move-runtime-modeltype-func-door-const-modeltype-func-door-3-src-mq3-botlib-ai-move-runtime-ml-171156522"></a>
### MODELTYPE_FUNC_DOOR

```ml
const MODELTYPE_FUNC_DOOR = 3
```

Bot mover-model classification for func door.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L52)

<a id="constant-constant-mq3-botlib-ai-move-runtime-modeltype-func-plat-const-modeltype-func-plat-1-src-mq3-botlib-ai-move-runtime-ml-2058523656"></a>
### MODELTYPE_FUNC_PLAT

```ml
const MODELTYPE_FUNC_PLAT = 1
```

Bot mover-model classification for func plat.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L48)

<a id="constant-constant-mq3-botlib-ai-move-runtime-modeltype-func-static-const-modeltype-func-static-4-src-mq3-botlib-ai-move-runtime-ml-1341408819"></a>
### MODELTYPE_FUNC_STATIC

```ml
const MODELTYPE_FUNC_STATIC = 4
```

Bot mover-model classification for func static.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L54)

<a id="constant-constant-mq3-botlib-ai-move-runtime-move-crouch-const-move-crouch-publicheaders-move-crouch-src-mq3-botlib-ai-move-runtime-ml-2073805504"></a>
### MOVE_CROUCH

```ml
const MOVE_CROUCH = publicHeaders.MOVE_CROUCH
```

Bot movement-mode identifier for crouch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L70)

<a id="constant-constant-mq3-botlib-ai-move-runtime-move-jump-const-move-jump-publicheaders-move-jump-src-mq3-botlib-ai-move-runtime-ml-7225530"></a>
### MOVE_JUMP

```ml
const MOVE_JUMP = publicHeaders.MOVE_JUMP
```

Bot movement-mode identifier for jump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L72)

<a id="constant-constant-mq3-botlib-ai-move-runtime-move-walk-const-move-walk-publicheaders-move-walk-src-mq3-botlib-ai-move-runtime-ml-1680339735"></a>
### MOVE_WALK

```ml
const MOVE_WALK = publicHeaders.MOVE_WALK
```

Bot movement-mode identifier for walk.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L68)

<a id="function-function-mq3-botlib-ai-move-runtime-moveindirection-function-moveindirection-runtime-handle-direction-speed-type-src-mq3-botlib-ai-move-runtime-ml-1929481504"></a>
### moveInDirection

```ml
function moveInDirection(runtime, handle, direction, speed, type)
```

Use `runtime.services.walkDirectionFn` to perform `moveInDirection`. Return paths include `runtime.services.walkDirectionFn(runtime.services.context,state,direction,speed,type)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `pools` and `services`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot movement state. |
| `direction` | `dynamic` | — | Second three-component point. |
| `speed` | `dynamic` | — | Requested movement speed. |
| `type` | `dynamic` | — | Value passed as argument 5 to `runtime.services.walkDirectionFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L1086)

<a id="function-function-mq3-botlib-ai-move-runtime-moveingoalarea-function-moveingoalarea-runtime-state-goal-src-mq3-botlib-ai-move-runtime-ml-1761577376"></a>
### moveInGoalArea

```ml
function moveInGoalArea(runtime, state, goal)
```

Update `state.lastReachNum`, `state.lastAreaNum`, `state.lastGoalAreaNum` and `state.lastOrigin` during `moveInGoalArea`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `moveFlags`, `origin`, `lastReachNum`, `lastAreaNum` and `lastGoalAreaNum` and related fields. May update `state.lastReachNum`, `state.lastAreaNum` and `state.lastGoalAreaNum` and additional fields in place. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `origin` and `areaNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L965)

<a id="function-function-mq3-botlib-ai-move-runtime-movementviewtarget-function-movementviewtarget-runtime-handle-goal-travelflags-lookahead-target-src-mq3-botlib-ai-move-runtime-ml-132569159"></a>
### movementViewTarget

```ml
function movementViewTarget(runtime, handle, goal, travelFlags, lookAhead, target)
```

Follow route reachabilities to find a look-ahead view target, stopping at special traversal edges or the goal.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `router` and `pools`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot movement state. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `areaNum` and `origin`. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |
| `lookAhead` | `dynamic` | — | Distance to follow along the route when selecting the view target. |
| `target` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L382)

- [mq3.botlib.ai_move_runtime.MoveResult](Type-mq3-botlib-ai-move-runtime-moveresult-1165725401.md) — struct
<a id="constant-constant-mq3-botlib-ai-move-runtime-moveresult-blockedbyavoidspot-const-moveresult-blockedbyavoidspot-publicheaders-moveresult-blockedbyavoidspot-src-mq3-botlib-ai-move-runtime-ml-2119590339"></a>
### MOVERESULT_BLOCKEDBYAVOIDSPOT

```ml
const MOVERESULT_BLOCKEDBYAVOIDSPOT = publicHeaders.MOVERESULT_BLOCKEDBYAVOIDSPOT
```

Bot is blocked by an avoid spot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L86)

<a id="constant-constant-mq3-botlib-ai-move-runtime-moveresult-movementview-const-moveresult-movementview-publicheaders-moveresult-movementview-src-mq3-botlib-ai-move-runtime-ml-2099968109"></a>
### MOVERESULT_MOVEMENTVIEW

```ml
const MOVERESULT_MOVEMENTVIEW = publicHeaders.MOVERESULT_MOVEMENTVIEW
```

Bot uses view for movement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L74)

<a id="constant-constant-mq3-botlib-ai-move-runtime-moveresult-movementviewset-const-moveresult-movementviewset-publicheaders-moveresult-movementviewset-src-mq3-botlib-ai-move-runtime-ml-708633795"></a>
### MOVERESULT_MOVEMENTVIEWSET

```ml
const MOVERESULT_MOVEMENTVIEWSET = publicHeaders.MOVERESULT_MOVEMENTVIEWSET
```

Bot has set the view in movement code.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L80)

<a id="constant-constant-mq3-botlib-ai-move-runtime-moveresult-movementweapon-const-moveresult-movementweapon-publicheaders-moveresult-movementweapon-src-mq3-botlib-ai-move-runtime-ml-1782836312"></a>
### MOVERESULT_MOVEMENTWEAPON

```ml
const MOVERESULT_MOVEMENTWEAPON = publicHeaders.MOVERESULT_MOVEMENTWEAPON
```

Bot uses weapon for movement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L82)

<a id="constant-constant-mq3-botlib-ai-move-runtime-moveresult-ontopofobstacle-const-moveresult-ontopofobstacle-publicheaders-moveresult-ontopofobstacle-src-mq3-botlib-ai-move-runtime-ml-200430183"></a>
### MOVERESULT_ONTOPOFOBSTACLE

```ml
const MOVERESULT_ONTOPOFOBSTACLE = publicHeaders.MOVERESULT_ONTOPOFOBSTACLE
```

Bot is ontop of obstacle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L84)

<a id="constant-constant-mq3-botlib-ai-move-runtime-moveresult-swimview-const-moveresult-swimview-publicheaders-moveresult-swimview-src-mq3-botlib-ai-move-runtime-ml-685495724"></a>
### MOVERESULT_SWIMVIEW

```ml
const MOVERESULT_SWIMVIEW = publicHeaders.MOVERESULT_SWIMVIEW
```

Bot uses view for swimming.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L76)

<a id="constant-constant-mq3-botlib-ai-move-runtime-moveresult-waiting-const-moveresult-waiting-publicheaders-moveresult-waiting-src-mq3-botlib-ai-move-runtime-ml-763238470"></a>
### MOVERESULT_WAITING

```ml
const MOVERESULT_WAITING = publicHeaders.MOVERESULT_WAITING
```

Bot is waiting for something.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L78)

<a id="function-function-mq3-botlib-ai-move-runtime-movetogoal-function-movetogoal-runtime-handle-goal-travelflags-src-mq3-botlib-ai-move-runtime-ml-864810454"></a>
### moveToGoal

```ml
function moveToGoal(runtime, handle, goal, travelFlags)
```

Use `runtime.services.againstLadderFn` to perform `moveToGoal`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `router`, `pools`, `services` and `aas`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot movement state. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `areaNum`. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L1017)

<a id="function-function-mq3-botlib-ai-move-runtime-nextreachability-function-nextreachability-runtime-state-origin-areanum-goal-travelflags-lastareanum-src-mq3-botlib-ai-move-runtime-ml-2133533861"></a>
### nextReachability

```ml
function nextReachability(runtime, state, origin, areaNum, goal, travelFlags, lastAreaNum)
```

Choose the next route edge through host callbacks or the local AAS router, preserving avoided-reachability state.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services` and `router`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `lastGoalAreaNum`, `avoidReach`, `avoidReachTimes` and `avoidReachTries`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `areaNum`. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |
| `lastAreaNum` | `dynamic` | — | Previously visited AAS area number. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L370)

<a id="function-function-mq3-botlib-ai-move-runtime-normalize-function-normalize-value-src-mq3-botlib-ai-move-runtime-ml-613622321"></a>
### normalize

```ml
function normalize(value)
```

Return a vector's length and normalized components, using a zero vector when the input length is nonpositive.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Second three-component point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L399)

<a id="function-function-mq3-botlib-ai-move-runtime-onground-function-onground-runtime-state-src-mq3-botlib-ai-move-runtime-ml-248779849"></a>
### onGround

```ml
function onGround(runtime, state)
```

Use `runtime.services.onGroundFn` to perform `onGround`. Return paths include `(state.moveFlags&MFL_ONGROUND)!=0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `origin`, `presenceType`, `entityNum` and `moveFlags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L456)

<a id="constant-constant-mq3-botlib-ai-move-runtime-op-init-move-state-const-op-init-move-state-557-src-mq3-botlib-ai-move-runtime-ml-2058572358"></a>
### OP_INIT_MOVE_STATE

```ml
const OP_INIT_MOVE_STATE = 557
```

Bot-library syscall identifier for init move state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L24)

<a id="constant-constant-mq3-botlib-ai-move-runtime-op-move-in-direction-const-op-move-in-direction-550-src-mq3-botlib-ai-move-runtime-ml-620804837"></a>
### OP_MOVE_IN_DIRECTION

```ml
const OP_MOVE_IN_DIRECTION = 550
```

Bot-library syscall identifier for move in direction.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L18)

<a id="constant-constant-mq3-botlib-ai-move-runtime-op-move-to-goal-const-op-move-to-goal-549-src-mq3-botlib-ai-move-runtime-ml-1022897155"></a>
### OP_MOVE_TO_GOAL

```ml
const OP_MOVE_TO_GOAL = 549
```

Bot-library syscall identifier for move to goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L16)

<a id="constant-constant-mq3-botlib-ai-move-runtime-op-movement-view-target-const-op-movement-view-target-554-src-mq3-botlib-ai-move-runtime-ml-506498585"></a>
### OP_MOVEMENT_VIEW_TARGET

```ml
const OP_MOVEMENT_VIEW_TARGET = 554
```

Bot-library syscall identifier for movement view target.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L22)

<a id="constant-constant-mq3-botlib-ai-move-runtime-op-reachability-area-const-op-reachability-area-553-src-mq3-botlib-ai-move-runtime-ml-914729588"></a>
### OP_REACHABILITY_AREA

```ml
const OP_REACHABILITY_AREA = 553
```

Bot-library syscall identifier for area reachability area.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L20)

<a id="function-function-mq3-botlib-ai-move-runtime-pointcontents-function-pointcontents-runtime-point-src-mq3-botlib-ai-move-runtime-ml-545864916"></a>
### pointContents

```ml
function pointContents(runtime, point)
```

Use `runtime.services.pointContentsFn` to perform `pointContents`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L839)

<a id="function-function-mq3-botlib-ai-move-runtime-reachabilityarea-function-reachabilityarea-runtime-origin-client-src-mq3-botlib-ai-move-runtime-ml-78405339"></a>
### reachabilityArea

```ml
function reachabilityArea(runtime, origin, client)
```

Resolve the movement area beneath a bot, including elevators, bobbing movers, swimming and a downward-trace fallback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`, `router` and `aas`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `client` | `dynamic` | — | Value passed as argument 6 to `runtime.services.groundTraceFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L334)

<a id="function-function-mq3-botlib-ai-move-runtime-reachabilitytime-function-reachabilitytime-reach-src-mq3-botlib-ai-move-runtime-ml-471805713"></a>
### reachabilityTime

```ml
function reachabilityTime(reach)
```

Choose the movement timeout for the reachability travel type, including special ladder, jump, mover and grapple durations.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reach` | `dynamic` | — | AAS reachability record; accesses `travelType`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L534)

<a id="function-function-mq3-botlib-ai-move-runtime-reachavoided-function-reachavoided-state-reach-origin-src-mq3-botlib-ai-move-runtime-ml-1918995032"></a>
### reachAvoided

```ml
function reachAvoided(state, reach, origin)
```

Apply `mq3.botlib.ai_move_runtime.distanceFromLineSquared` and `mq3.botlib.ai_move_runtime.vectorDistanceSquared` while evaluating `reachAvoided`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI move runtime state; accesses `numAvoidSpots` and `avoidSpots`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `travelType`, `start` and `finish`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L504)

<a id="function-function-mq3-botlib-ai-move-runtime-resetgrapple-function-resetgrapple-runtime-state-src-mq3-botlib-ai-move-runtime-ml-1030653865"></a>
### resetGrapple

```ml
function resetGrapple(runtime, state)
```

Set `state.moveFlags` to `state.moveFlags&(~MFL_ACTIVEGRAPPLE)` and `state.grappleVisibleTime` to `0.0` in `mq3.botlib.ai_move_runtime.resetGrapple`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `router`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `lastReachNum`, `moveFlags` and `grappleVisibleTime`. May update `state.moveFlags` and `state.grappleVisibleTime` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L927)

<a id="constant-constant-mq3-botlib-ai-move-runtime-resulttype-badgrapplepath-const-resulttype-badgrapplepath-publicheaders-resulttype-badgrapplepath-src-mq3-botlib-ai-move-runtime-ml-1795534443"></a>
### RESULTTYPE_BADGRAPPLEPATH

```ml
const RESULTTYPE_BADGRAPPLEPATH = publicHeaders.RESULTTYPE_BADGRAPPLEPATH
```

Grapple path is obstructed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L92)

<a id="constant-constant-mq3-botlib-ai-move-runtime-resulttype-elevatorup-const-resulttype-elevatorup-publicheaders-resulttype-elevatorup-src-mq3-botlib-ai-move-runtime-ml-2142609165"></a>
### RESULTTYPE_ELEVATORUP

```ml
const RESULTTYPE_ELEVATORUP = publicHeaders.RESULTTYPE_ELEVATORUP
```

Elevator is up.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L88)

<a id="constant-constant-mq3-botlib-ai-move-runtime-resulttype-insolidarea-const-resulttype-insolidarea-publicheaders-resulttype-insolidarea-src-mq3-botlib-ai-move-runtime-ml-1451592037"></a>
### RESULTTYPE_INSOLIDAREA

```ml
const RESULTTYPE_INSOLIDAREA = publicHeaders.RESULTTYPE_INSOLIDAREA
```

Stuck in solid area, this is bad.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L94)

<a id="constant-constant-mq3-botlib-ai-move-runtime-resulttype-waitforfuncbobbing-const-resulttype-waitforfuncbobbing-publicheaders-resulttype-waitforfuncbobbing-src-mq3-botlib-ai-move-runtime-ml-279925265"></a>
### RESULTTYPE_WAITFORFUNCBOBBING

```ml
const RESULTTYPE_WAITFORFUNCBOBBING = publicHeaders.RESULTTYPE_WAITFORFUNCBOBBING
```

Waiting for func bobbing to arrive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L90)

- [mq3.botlib.ai_move_runtime.Runtime](Type-mq3-botlib-ai-move-runtime-runtime-945081511.md) — struct
<a id="function-function-mq3-botlib-ai-move-runtime-services-function-services-context-src-mq3-botlib-ai-move-runtime-ml-755952669"></a>
### services

```ml
function services(context)
```

Create a `mq3.botlib.ai_move_runtime.Services` record, initializing `context` from `context`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context forwarded to the configured host callbacks. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L276)

- [mq3.botlib.ai_move_runtime.Services](Type-mq3-botlib-ai-move-runtime-services-49942585.md) — struct
<a id="function-function-mq3-botlib-ai-move-runtime-signedrandom-function-signedrandom-runtime-src-mq3-botlib-ai-move-runtime-ml-467566224"></a>
### signedRandom

```ml
function signedRandom(runtime)
```

Use `runtime.services.randomFn` to perform `signedRandom`. Return paths include `0.0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L835)

<a id="function-function-mq3-botlib-ai-move-runtime-stopgrapple-function-stopgrapple-runtime-state-config-src-mq3-botlib-ai-move-runtime-ml-196550677"></a>
### stopGrapple

```ml
function stopGrapple(runtime, state, config)
```

Set `state.moveFlags` to `(state.moveFlags&(~MFL_ACTIVEGRAPPLE))|MFL_GRAPPLERESET` and `state.reachabilityTime` to `0.0` in `mq3.botlib.ai_move_runtime.stopGrapple`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `moveFlags` and `reachabilityTime`. May update `state.moveFlags` and `state.reachabilityTime` in place. |
| `config` | `dynamic` | — | Configuration record; accesses `offhand` and `offCommand`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L935)

<a id="function-function-mq3-botlib-ai-move-runtime-supportstrap-function-supportstrap-op-src-mq3-botlib-ai-move-runtime-ml-169953587"></a>
### supportsTrap

```ml
function supportsTrap(op)
```

Test `op==OP_MOVE_TO_GOAL or op==OP_MOVE_IN_DIRECTION or op==OP_REACHABILITY_AREA or op==OP_MOVEMENT_VIEW_TARGET or op==OP_INIT_MOVE_STATE` as the condition for `supportsTrap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `op` | `dynamic` | — | Numeric syscall operation identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L1099)

<a id="function-function-mq3-botlib-ai-move-runtime-travelbarrierjump-function-travelbarrierjump-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-751989150"></a>
### travelBarrierJump

```ml
function travelBarrierJump(runtime, state, reach)
```

BotTravel_BarrierJump and its airborne finish path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `origin`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `start`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L643)

<a id="function-function-mq3-botlib-ai-move-runtime-travelcrouch-function-travelcrouch-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-1020778532"></a>
### travelCrouch

```ml
function travelCrouch(runtime, state, reach)
```

BotTravel_Crouch: always crouch and move horizontally towards the reach end.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `origin`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `finish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L558)

<a id="function-function-mq3-botlib-ai-move-runtime-travelelevator-function-travelelevator-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-1692220956"></a>
### travelElevator

```ml
function travelElevator(runtime, state, reach)
```

BotTravel_Elevator depends on live mover bounds/origin and entity tracing. Missing mover state is an explicit failure instead of guessed success.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `moveFlags`, `origin` and `reachabilityTime`. May update `state.reachabilityTime` in place. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `finish` and `start`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L746)

<a id="function-function-mq3-botlib-ai-move-runtime-travelfuncbob-function-travelfuncbob-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-1984710090"></a>
### travelFuncBob

```ml
function travelFuncBob(runtime, state, reach)
```

Set `state.reachabilityTime` to `0.0` in `mq3.botlib.ai_move_runtime.travelFuncBob`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `moveFlags`, `origin` and `reachabilityTime`. May update `state.reachabilityTime` in place. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `finish` and `start`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L878)

<a id="function-function-mq3-botlib-ai-move-runtime-travelgrapple-function-travelgrapple-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-892003882"></a>
### travelGrapple

```ml
function travelGrapple(runtime, state, reach)
```

Update `state.moveFlags`, `state.grappleVisibleTime`, `state.lastGrappleDist` and `state.reachabilityTime` during `travelGrapple`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `aas` and `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `moveFlags`, `origin`, `lastGrappleDist`, `grappleVisibleTime` and `viewOffset` and related fields. May update `state.moveFlags`, `state.grappleVisibleTime` and `state.lastGrappleDist` and additional fields in place. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `finish` and `start`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L942)

<a id="function-function-mq3-botlib-ai-move-runtime-traveljump-function-traveljump-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-2107854028"></a>
### travelJump

```ml
function travelJump(runtime, state, reach)
```

BotTravel_Jump, including its ten-unit gap scan and jump/delayed-jump thresholds.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `aas`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `reachAreaNum`, `origin`, `jumpReach` and `lastReachNum`. May update `state.jumpReach` in place. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `start` and `finish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L596)

<a id="function-function-mq3-botlib-ai-move-runtime-traveljumppad-function-traveljumppad-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-916212670"></a>
### travelJumpPad

```ml
function travelJumpPad(runtime, state, reach)
```

Apply `mq3.botlib.ai_move_runtime.emptyMoveResult`, `mq3.botlib.ai_move_runtime.normalize` and `mq3.botlib.ai_move_runtime.checkBlocked` while evaluating `travelJumpPad`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `origin`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `start`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L820)

<a id="function-function-mq3-botlib-ai-move-runtime-travelladder-function-travelladder-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-323737460"></a>
### travelLadder

```ml
function travelLadder(runtime, state, reach)
```

BotTravel_Ladder: face along the vertically weighted ladder direction and use the forward action; EA_Move intentionally carries zero speed.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `origin`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `finish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L633)

<a id="function-function-mq3-botlib-ai-move-runtime-travelswim-function-travelswim-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-233855088"></a>
### travelSwim

```ml
function travelSwim(runtime, state, reach)
```

BotTravel_Swim is shared by the grounded and airborne switches.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `origin`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `start`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L844)

<a id="function-function-mq3-botlib-ai-move-runtime-travelteleport-function-travelteleport-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-687162316"></a>
### travelTeleport

```ml
function travelTeleport(runtime, state, reach)
```

BotTravel_Teleport. The airborne finish case is an intentional no-op in BotMoveToGoal and is handled in the dispatcher below.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `moveFlags` and `origin`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `start`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L736)

<a id="function-function-mq3-botlib-ai-move-runtime-travelwalk-function-travelwalk-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-261089188"></a>
### travelWalk

```ml
function travelWalk(runtime, state, reach)
```

Apply `mq3.botlib.ai_move_runtime.emptyMoveResult`, `mq3.botlib.ai_move_runtime.normalize` and `mq3.botlib.ai_move_runtime.checkBlocked` while evaluating `travelWalk`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `router`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `origin` and `moveFlags`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `start`, `finish` and `areaNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L541)

<a id="function-function-mq3-botlib-ai-move-runtime-travelwalkoffledge-function-travelwalkoffledge-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-1188212200"></a>
### travelWalkOffLedge

```ml
function travelWalkOffLedge(runtime, state, reach)
```

BotTravel_WalkOffLedge selects a careful vertical drop speed or the ballistic horizontal speed calculated by AAS_HorizontalVelocityForJump.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `origin`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `start` and `finish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L665)

<a id="function-function-mq3-botlib-ai-move-runtime-travelwaterjump-function-travelwaterjump-runtime-state-reach-src-mq3-botlib-ai-move-runtime-ml-1741001034"></a>
### travelWaterJump

```ml
function travelWaterJump(runtime, state, reach)
```

Apply `mq3.botlib.ai_move_runtime.emptyMoveResult`, `mq3.botlib.ai_move_runtime.normalize` and `mq3.botlib.ai_move_runtime.signedRandom` while evaluating `travelWaterJump`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `origin`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `finish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L852)

<a id="function-function-mq3-botlib-ai-move-runtime-travelweaponjump-function-travelweaponjump-runtime-state-reach-weapon-src-mq3-botlib-ai-move-runtime-ml-1390896692"></a>
### travelWeaponJump

```ml
function travelWeaponJump(runtime, state, reach, weapon)
```

Shared source body for BotTravel_RocketJump and BotTravel_BFGJump.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `services`. |
| `state` | `dynamic` | — | AI move runtime state; accesses `origin`, `viewAngles`, `jumpReach` and `lastReachNum`. May update `state.jumpReach` in place. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `start` and `finish`. |
| `weapon` | `dynamic` | — | Weapon identifier used by the action or inventory lookup. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L791)

<a id="function-function-mq3-botlib-ai-move-runtime-unsupportedtravel-function-unsupportedtravel-reach-src-mq3-botlib-ai-move-runtime-ml-1374214695"></a>
### unsupportedTravel

```ml
function unsupportedTravel(reach)
```

Apply `mq3.botlib.ai_move_runtime.emptyMoveResult` while evaluating `unsupportedTravel`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reach` | `dynamic` | — | AAS reachability record; accesses `travelType`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L974)

<a id="function-function-mq3-botlib-ai-move-runtime-vectordistancesquared-function-vectordistancesquared-a-b-src-mq3-botlib-ai-move-runtime-ml-62805857"></a>
### vectorDistanceSquared

```ml
function vectorDistanceSquared(a, b)
```

Calculate squared Euclidean distance between two three-component points for ai move runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `b` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L486)

- [mq3.botlib.ai_move_runtime.ViewTargetResult](Type-mq3-botlib-ai-move-runtime-viewtargetresult-2009883812.md) — struct
<a id="constant-constant-mq3-botlib-ai-move-runtime-weapon-bfg-const-weapon-bfg-9-src-mq3-botlib-ai-move-runtime-ml-1421360106"></a>
### WEAPON_BFG

```ml
const WEAPON_BFG = 9
```

Weapon identifier used when planning a BFG-assisted jump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L124)

<a id="constant-constant-mq3-botlib-ai-move-runtime-weapon-grapple-const-weapon-grapple-10-src-mq3-botlib-ai-move-runtime-ml-1163723134"></a>
### WEAPON_GRAPPLE

```ml
const WEAPON_GRAPPLE = 10
```

Weapon identifier used to fire the grappling hook.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L126)

<a id="constant-constant-mq3-botlib-ai-move-runtime-weapon-rocket-launcher-const-weapon-rocket-launcher-5-src-mq3-botlib-ai-move-runtime-ml-1852194754"></a>
### WEAPON_ROCKET_LAUNCHER

```ml
const WEAPON_ROCKET_LAUNCHER = 5
```

Weapon identifier used when planning a rocket-assisted jump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_runtime.ml#L122)
