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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_ai.ml#L12)

<a id="constant-constant-mq3-client-playable-enemy-ai-attack-range-const-attack-range-900-src-mq3-client-playable-enemy-ai-ml-819212148"></a>
### ATTACK_RANGE

```ml
const ATTACK_RANGE = 900.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_ai.ml#L13)

- [mq3.client.playable_enemy_ai.Brain](Type-mq3-client-playable-enemy-ai-brain-1780529749.md) — struct
<a id="constant-constant-mq3-client-playable-enemy-ai-chase-distance-const-chase-distance-280-src-mq3-client-playable-enemy-ai-ml-1733332579"></a>
### CHASE_DISTANCE

```ml
const CHASE_DISTANCE = 280.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_ai.ml#L14)

<a id="constant-constant-mq3-client-playable-enemy-ai-default-damage-const-default-damage-7-src-mq3-client-playable-enemy-ai-ml-380889318"></a>
### DEFAULT_DAMAGE

```ml
const DEFAULT_DAMAGE = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_ai.ml#L18)

- [mq3.client.playable_enemy_ai.Event](Type-mq3-client-playable-enemy-ai-event-91712061.md) — struct
<a id="function-function-mq3-client-playable-enemy-ai-fail-function-fail-message-src-mq3-client-playable-enemy-ai-ml-1183821461"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_ai.ml#L24)

<a id="function-function-mq3-client-playable-enemy-ai-horizontaldirection-function-horizontaldirection-frompoint-topoint-src-mq3-client-playable-enemy-ai-ml-750622701"></a>
### horizontalDirection

```ml
function horizontalDirection(fromPoint, toPoint)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fromPoint` | `dynamic` | — |  |
| `toPoint` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_ai.ml#L47)

<a id="function-function-mq3-client-playable-enemy-ai-linevisible-function-linevisible-tracefn-context-startpoint-endpoint-src-mq3-client-playable-enemy-ai-ml-1187773159"></a>
### lineVisible

```ml
function lineVisible(traceFn, context, startPoint, endPoint)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `traceFn` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |
| `startPoint` | `dynamic` | — |  |
| `endPoint` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_ai.ml#L42)

<a id="constant-constant-mq3-client-playable-enemy-ai-move-speed-const-move-speed-105-src-mq3-client-playable-enemy-ai-ml-494080711"></a>
### MOVE_SPEED

```ml
const MOVE_SPEED = 105.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_ai.ml#L15)

<a id="function-function-mq3-client-playable-enemy-ai-movetarget-function-movetarget-target-brain-playerposition-now-deltamilliseconds-src-mq3-client-playable-enemy-ai-ml-274391639"></a>
### moveTarget

```ml
function moveTarget(target, brain, playerPosition, now, deltaMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `target` | `dynamic` | — |  |
| `brain` | `dynamic` | — |  |
| `playerPosition` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `deltaMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_ai.ml#L54)

<a id="constant-constant-mq3-client-playable-enemy-ai-patrol-radius-const-patrol-radius-30-src-mq3-client-playable-enemy-ai-ml-976783916"></a>
### PATROL_RADIUS

```ml
const PATROL_RADIUS = 30.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_ai.ml#L17)

<a id="constant-constant-mq3-client-playable-enemy-ai-sight-mask-const-sight-mask-100663297-src-mq3-client-playable-enemy-ai-ml-753285539"></a>
### SIGHT_MASK

```ml
const SIGHT_MASK = 100663297
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_ai.ml#L10)

<a id="function-function-mq3-client-playable-enemy-ai-state-function-state-targetstate-now-src-mq3-client-playable-enemy-ai-ml-1284813214"></a>
### state

```ml
function state(targetState, now)
```

A separate state object keeps AI timing out of playable_targets' combat data.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `targetState` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_ai.ml#L28)

- [mq3.client.playable_enemy_ai.State](Type-mq3-client-playable-enemy-ai-state-2024476272.md) — struct
<a id="function-function-mq3-client-playable-enemy-ai-step-function-step-world-ai-targetstate-playerposition-now-deltamilliseconds-src-mq3-client-playable-enemy-ai-ml-863388020"></a>
### step

```ml
function step(world, ai, targetState, playerPosition, now, deltaMilliseconds)
```

Public BSP-world entry point: sight is a zero-sized CM_BoxTrace.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `ai` | `dynamic` | — |  |
| `targetState` | `dynamic` | — |  |
| `playerPosition` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `deltaMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_ai.ml#L107)

<a id="function-function-mq3-client-playable-enemy-ai-stepwithtrace-function-stepwithtrace-tracefn-context-ai-targetstate-playerposition-now-deltamilliseconds-src-mq3-client-playable-enemy-ai-ml-2088443336"></a>
### stepWithTrace

```ml
function stepWithTrace(traceFn, context, ai, targetState, playerPosition, now, deltaMilliseconds)
```

Injectable trace entry point used by contracts. Events are rebuilt per frame.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `traceFn` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |
| `ai` | `dynamic` | — |  |
| `targetState` | `dynamic` | — |  |
| `playerPosition` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |
| `deltaMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_ai.ml#L74)

<a id="constant-constant-mq3-client-playable-enemy-ai-strafe-speed-const-strafe-speed-72-src-mq3-client-playable-enemy-ai-ml-68549014"></a>
### STRAFE_SPEED

```ml
const STRAFE_SPEED = 72.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_ai.ml#L16)

<a id="constant-constant-mq3-client-playable-enemy-ai-think-milliseconds-const-think-milliseconds-100-src-mq3-client-playable-enemy-ai-ml-2049696872"></a>
### THINK_MILLISECONDS

```ml
const THINK_MILLISECONDS = 100
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_ai.ml#L11)

<a id="function-function-mq3-client-playable-enemy-ai-validvector-function-validvector-value-src-mq3-client-playable-enemy-ai-ml-915887837"></a>
### validVector

```ml
function validVector(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_ai.ml#L25)

<a id="function-function-mq3-client-playable-enemy-ai-worldpointtrace-function-worldpointtrace-context-startpoint-endpoint-src-mq3-client-playable-enemy-ai-ml-395437554"></a>
### worldPointTrace

```ml
function worldPointTrace(context, startPoint, endPoint)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `startPoint` | `dynamic` | — |  |
| `endPoint` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_ai.ml#L38)
