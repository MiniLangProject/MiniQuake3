# `src/mq3/client/playable_enemy_movement.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_enemy_movement`](Package-mq3-client-playable-enemy-movement-1269358324.md)

Reachable from entry: **yes**

## Imports

- `mq3/collision/world.ml` as `collision` → [src/mq3/collision/world.ml](File-src-mq3-collision-world-ml-863162236.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)

## Declarations

<a id="function-function-mq3-client-playable-enemy-movement-configure-function-configure-tracefn-context-origin-src-mq3-client-playable-enemy-movement-ml-1036942716"></a>
### configure

```ml
function configure(traceFn, context, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `traceFn` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_movement.ml#L26)

<a id="function-function-mq3-client-playable-enemy-movement-establishground-function-establishground-state-src-mq3-client-playable-enemy-movement-ml-39538349"></a>
### establishGround

```ml
function establishGround(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_movement.ml#L34)

<a id="function-function-mq3-client-playable-enemy-movement-fail-function-fail-message-src-mq3-client-playable-enemy-movement-ml-1028072407"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_movement.ml#L16)

<a id="constant-constant-mq3-client-playable-enemy-movement-ground-normal-const-ground-normal-0-7-src-mq3-client-playable-enemy-movement-ml-11415198"></a>
### GROUND_NORMAL

```ml
const GROUND_NORMAL = 0.7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_movement.ml#L12)

<a id="constant-constant-mq3-client-playable-enemy-movement-ground-probe-const-ground-probe-24-src-mq3-client-playable-enemy-movement-ml-265290559"></a>
### GROUND_PROBE

```ml
const GROUND_PROBE = 24.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_movement.ml#L11)

<a id="function-function-mq3-client-playable-enemy-movement-moveorigin-function-moveorigin-world-origin-desireddelta-src-mq3-client-playable-enemy-movement-ml-718632560"></a>
### moveOrigin

```ml
function moveOrigin(world, origin, desiredDelta)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `desiredDelta` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_movement.ml#L75)

<a id="function-function-mq3-client-playable-enemy-movement-moveoriginwithtrace-function-moveoriginwithtrace-tracefn-context-origin-desireddelta-src-mq3-client-playable-enemy-movement-ml-109436888"></a>
### moveOriginWithTrace

```ml
function moveOriginWithTrace(traceFn, context, origin, desiredDelta)
```

Move by a desired world-space displacement. The shared movement kernel slides along blocking planes and tries Quake's 18-unit stair step.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `traceFn` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `desiredDelta` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_movement.ml#L50)

<a id="function-function-mq3-client-playable-enemy-movement-movetarget-function-movetarget-world-target-desireddelta-src-mq3-client-playable-enemy-movement-ml-778281481"></a>
### moveTarget

```ml
function moveTarget(world, target, desiredDelta)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |
| `desiredDelta` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_movement.ml#L88)

<a id="function-function-mq3-client-playable-enemy-movement-movetargetwithtrace-function-movetargetwithtrace-tracefn-context-target-desireddelta-src-mq3-client-playable-enemy-movement-ml-1718379451"></a>
### moveTargetWithTrace

```ml
function moveTargetWithTrace(traceFn, context, target, desiredDelta)
```

Adapter used by preview code: target only needs a three-component origin.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `traceFn` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |
| `desiredDelta` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_movement.ml#L81)

<a id="constant-constant-mq3-client-playable-enemy-movement-player-mask-const-player-mask-33619969-src-mq3-client-playable-enemy-movement-ml-1814085169"></a>
### PLAYER_MASK

```ml
const PLAYER_MASK = 33619969
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_movement.ml#L9)

- [mq3.client.playable_enemy_movement.Result](Type-mq3-client-playable-enemy-movement-result-1182279015.md) — struct
<a id="constant-constant-mq3-client-playable-enemy-movement-step-height-const-step-height-18-src-mq3-client-playable-enemy-movement-ml-411374168"></a>
### STEP_HEIGHT

```ml
const STEP_HEIGHT = 18.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_movement.ml#L10)

<a id="function-function-mq3-client-playable-enemy-movement-validvector-function-validvector-value-src-mq3-client-playable-enemy-movement-ml-346952659"></a>
### validVector

```ml
function validVector(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_movement.ml#L17)

<a id="function-function-mq3-client-playable-enemy-movement-worldtrace-function-worldtrace-state-startpoint-endpoint-src-mq3-client-playable-enemy-movement-ml-371769428"></a>
### worldTrace

```ml
function worldTrace(state, startPoint, endPoint)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `startPoint` | `dynamic` | — |  |
| `endPoint` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_movement.ml#L19)
