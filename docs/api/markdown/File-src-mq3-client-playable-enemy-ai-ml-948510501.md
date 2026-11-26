# `src/mq3/client/playable_enemy_ai.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_enemy_ai`](Package-mq3-client-playable-enemy-ai-1020979275.md)

Reachable from entry: **yes**

## Imports

- `mq3/collision/world.ml` as `collision` → [src/mq3/collision/world.ml](File-src-mq3-collision-world-ml-863162236.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="constant-constant-mq3-client-playable-enemy-ai-attack-cooldown-milliseconds-const-attack-cooldown-milliseconds-100-src-mq3-client-playable-enemy-ai-ml-1700472936"></a>
### ATTACK_COOLDOWN_MILLISECONDS

```ml
const ATTACK_COOLDOWN_MILLISECONDS = 100
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_ai.ml#L12)

<a id="constant-constant-mq3-client-playable-enemy-ai-attack-range-const-attack-range-900-src-mq3-client-playable-enemy-ai-ml-166177134"></a>
### ATTACK_RANGE

```ml
const ATTACK_RANGE = 900
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_ai.ml#L13)

- [mq3.client.playable_enemy_ai.Brain](Type-mq3-client-playable-enemy-ai-brain-1780529749.md) — struct
<a id="constant-constant-mq3-client-playable-enemy-ai-chase-distance-const-chase-distance-280-src-mq3-client-playable-enemy-ai-ml-41389183"></a>
### CHASE_DISTANCE

```ml
const CHASE_DISTANCE = 280
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_ai.ml#L14)

<a id="constant-constant-mq3-client-playable-enemy-ai-default-damage-const-default-damage-7-src-mq3-client-playable-enemy-ai-ml-380889318"></a>
### DEFAULT_DAMAGE

```ml
const DEFAULT_DAMAGE = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_ai.ml#L18)

- [mq3.client.playable_enemy_ai.Event](Type-mq3-client-playable-enemy-ai-event-91712061.md) — struct
<a id="function-function-mq3-client-playable-enemy-ai-fail-function-fail-message-src-mq3-client-playable-enemy-ai-ml-1183821461"></a>
### fail

```ml
function fail(message)
```

Creates the playable enemy ai error `7540` with diagnostic text `"preview enemy AI: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"preview enemy AI: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_ai.ml#L29)

<a id="function-function-mq3-client-playable-enemy-ai-horizontaldirection-function-horizontaldirection-frompoint-topoint-src-mq3-client-playable-enemy-ai-ml-750622701"></a>
### horizontalDirection

```ml
function horizontalDirection(fromPoint, toPoint)
```

Calls `mq3.compat.numeric.fsub`, `mq3.shared.math.VectorLength`, `mq3.shared.math.VectorNormalize` from playable enemy ai `horizontalDirection`. The final path returns `[value,length]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fromPoint` | `dynamic` | — | Sequence read at `fromPoint[0]`, `fromPoint[1]`. |
| `toPoint` | `dynamic` | — | Sequence read at `toPoint[0]`, `toPoint[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_ai.ml#L68)

<a id="function-function-mq3-client-playable-enemy-ai-linevisible-function-linevisible-tracefn-context-startpoint-endpoint-src-mq3-client-playable-enemy-ai-ml-1187773159"></a>
### lineVisible

```ml
function lineVisible(traceFn, context, startPoint, endPoint)
```

Calls `traceFn` from playable enemy ai `lineVisible`. The final path returns `result.trace.fraction>=0.9999`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `traceFn` | `dynamic` | — | Collision-trace callback used to test the requested movement or visibility segment. |
| `context` | `dynamic` | — | context record passed to the playable enemy ai helper calls. |
| `startPoint` | `dynamic` | — | Starting world-space point of the segment or trace. |
| `endPoint` | `dynamic` | — | Ending world-space point of the segment or trace. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_ai.ml#L60)

<a id="constant-constant-mq3-client-playable-enemy-ai-move-speed-const-move-speed-105-src-mq3-client-playable-enemy-ai-ml-732794515"></a>
### MOVE_SPEED

```ml
const MOVE_SPEED = 105
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_ai.ml#L15)

<a id="function-function-mq3-client-playable-enemy-ai-movetarget-function-movetarget-target-brain-playerposition-now-deltamilliseconds-src-mq3-client-playable-enemy-ai-ml-274391639"></a>
### moveTarget

```ml
function moveTarget(target, brain, playerPosition, now, deltaMilliseconds)
```

Updates `target.origin[0]`, `target.origin[1]`, `target.origin[2]` during playable enemy ai `moveTarget`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `target` | `dynamic` | — | Mutable playable enemy ai record/storage; this routine assigns `target.origin[0]`, `target.origin[1]`, `target.origin[2]`. |
| `brain` | `dynamic` | — | Record read through `brain.mode`, `brain.strafeSide`. |
| `playerPosition` | `dynamic` | — | Value used by `direction=horizontalDirection(target.origin,playerPosition)[0]`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `deltaMilliseconds` | `dynamic` | — | Elapsed simulation interval in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_ai.ml#L81)

<a id="constant-constant-mq3-client-playable-enemy-ai-patrol-radius-const-patrol-radius-30-src-mq3-client-playable-enemy-ai-ml-424119334"></a>
### PATROL_RADIUS

```ml
const PATROL_RADIUS = 30
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_ai.ml#L17)

<a id="constant-constant-mq3-client-playable-enemy-ai-sight-mask-const-sight-mask-100663297-src-mq3-client-playable-enemy-ai-ml-753285539"></a>
### SIGHT_MASK

```ml
const SIGHT_MASK = 100663297
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_ai.ml#L10)

<a id="function-function-mq3-client-playable-enemy-ai-state-function-state-targetstate-now-src-mq3-client-playable-enemy-ai-ml-1284813214"></a>
### state

```ml
function state(targetState, now)
```

A separate state object keeps AI timing out of playable_targets' combat data.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `targetState` | `dynamic` | — | Record read through `targetState.targets`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_ai.ml#L37)

- [mq3.client.playable_enemy_ai.State](Type-mq3-client-playable-enemy-ai-state-2024476272.md) — struct
<a id="function-function-mq3-client-playable-enemy-ai-step-function-step-world-ai-targetstate-playerposition-now-deltamilliseconds-src-mq3-client-playable-enemy-ai-ml-863388020"></a>
### step

```ml
function step(world, ai, targetState, playerPosition, now, deltaMilliseconds)
```

Public BSP-world entry point: sight is a zero-sized CM_BoxTrace.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | world record passed to the playable enemy ai helper calls. |
| `ai` | `dynamic` | — | Value used by `return stepWithTrace(worldPointTrace,world,ai,targetState,playerPosition,now,deltaMilliseconds)`. |
| `targetState` | `dynamic` | — | targetState record passed to the playable enemy ai helper calls. |
| `playerPosition` | `dynamic` | — | Value used by `return stepWithTrace(worldPointTrace,world,ai,targetState,playerPosition,now,deltaMilliseconds)`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `deltaMilliseconds` | `dynamic` | — | Elapsed simulation interval in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_ai.ml#L147)

<a id="function-function-mq3-client-playable-enemy-ai-stepwithtrace-function-stepwithtrace-tracefn-context-ai-targetstate-playerposition-now-deltamilliseconds-src-mq3-client-playable-enemy-ai-ml-2088443336"></a>
### stepWithTrace

```ml
function stepWithTrace(traceFn, context, ai, targetState, playerPosition, now, deltaMilliseconds)
```

Injectable trace entry point used by contracts. Events are rebuilt per frame.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `traceFn` | `dynamic` | — | Collision-trace callback used to test the requested movement or visibility segment. |
| `context` | `dynamic` | — | context record passed to the playable enemy ai helper calls. |
| `ai` | `dynamic` | — | Mutable playable enemy ai record/storage; this routine assigns `ai.events`, `ai.visibleCount`, `ai.lastTime`. |
| `targetState` | `dynamic` | — | Record read through `targetState.targets`. |
| `playerPosition` | `dynamic` | — | Sequence read at `playerPosition[0]`, `playerPosition[1]`, `playerPosition[2]`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `deltaMilliseconds` | `dynamic` | — | Elapsed simulation interval in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_ai.ml#L108)

<a id="constant-constant-mq3-client-playable-enemy-ai-strafe-speed-const-strafe-speed-72-src-mq3-client-playable-enemy-ai-ml-722084112"></a>
### STRAFE_SPEED

```ml
const STRAFE_SPEED = 72
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_ai.ml#L16)

<a id="constant-constant-mq3-client-playable-enemy-ai-think-milliseconds-const-think-milliseconds-100-src-mq3-client-playable-enemy-ai-ml-2049696872"></a>
### THINK_MILLISECONDS

```ml
const THINK_MILLISECONDS = 100
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_ai.ml#L11)

<a id="function-function-mq3-client-playable-enemy-ai-validvector-function-validvector-value-src-mq3-client-playable-enemy-ai-ml-915887837"></a>
### validVector

```ml
function validVector(value)
```

Computes `typeof(value)=="array" and len(value)==3` for playable enemy ai `validVector`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence whose length/content is inspected by `validVector`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_ai.ml#L32)

<a id="function-function-mq3-client-playable-enemy-ai-worldpointtrace-function-worldpointtrace-context-startpoint-endpoint-src-mq3-client-playable-enemy-ai-ml-395437554"></a>
### worldPointTrace

```ml
function worldPointTrace(context, startPoint, endPoint)
```

Adapts `mq3.collision.world.boxTrace` to playable enemy ai `worldPointTrace`, returning its result for `context, startPoint, endPoint, [0.0,0.0,0.0], [0.0,0.0,0.0], 0, SIGHT_MASK, false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Argument 1 of `mq3.collision.world.boxTrace`. |
| `startPoint` | `dynamic` | — | Starting world-space point of the segment or trace. Forwarded to `mq3.collision.world.boxTrace`. |
| `endPoint` | `dynamic` | — | Ending world-space point of the segment or trace. Forwarded to `mq3.collision.world.boxTrace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_ai.ml#L51)
