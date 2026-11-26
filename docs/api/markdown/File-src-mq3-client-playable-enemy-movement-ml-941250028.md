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

Calls `mq3.game.movement.create`, `mq3.compat.numeric.f32` from playable enemy movement `configure`. The final path returns `state`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `traceFn` | `dynamic` | — | Collision-trace callback used to test the requested movement or visibility segment. |
| `context` | `dynamic` | — | context record passed to the playable enemy movement helper calls. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_movement.ml#L39)

<a id="function-function-mq3-client-playable-enemy-movement-establishground-function-establishground-state-src-mq3-client-playable-enemy-movement-ml-39538349"></a>
### establishGround

```ml
function establishGround(state)
```

Updates `state.groundPlane`, `state.walking`, `state.groundNormal`, `state.groundFlags` during playable enemy movement `establishGround`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable enemy movement record/storage; this routine assigns `state.groundPlane`, `state.walking`, `state.groundNormal`, `state.groundFlags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_movement.ml#L49)

<a id="function-function-mq3-client-playable-enemy-movement-fail-function-fail-message-src-mq3-client-playable-enemy-movement-ml-1028072407"></a>
### fail

```ml
function fail(message)
```

Creates the playable enemy movement error `7550` with diagnostic text `"preview enemy movement: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"preview enemy movement: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_movement.ml#L19)

<a id="constant-constant-mq3-client-playable-enemy-movement-ground-normal-const-ground-normal-0-7-src-mq3-client-playable-enemy-movement-ml-11415198"></a>
### GROUND_NORMAL

```ml
const GROUND_NORMAL = 0.7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_movement.ml#L12)

<a id="constant-constant-mq3-client-playable-enemy-movement-ground-probe-const-ground-probe-24-src-mq3-client-playable-enemy-movement-ml-546132805"></a>
### GROUND_PROBE

```ml
const GROUND_PROBE = 24
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_movement.ml#L11)

<a id="function-function-mq3-client-playable-enemy-movement-moveorigin-function-moveorigin-world-origin-desireddelta-src-mq3-client-playable-enemy-movement-ml-718632560"></a>
### moveOrigin

```ml
function moveOrigin(world, origin, desiredDelta)
```

Calls `mq3.client.playable_enemy_movement.moveOriginWithTrace` from playable enemy movement `moveOrigin`. The final path returns `moveOriginWithTrace(worldTrace,world,origin,desiredDelta)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | world record passed to the playable enemy movement helper calls. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `desiredDelta` | `dynamic` | — | Value used by `return moveOriginWithTrace(worldTrace,world,origin,desiredDelta)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_movement.ml#L98)

<a id="function-function-mq3-client-playable-enemy-movement-moveoriginwithtrace-function-moveoriginwithtrace-tracefn-context-origin-desireddelta-src-mq3-client-playable-enemy-movement-ml-109436888"></a>
### moveOriginWithTrace

```ml
function moveOriginWithTrace(traceFn, context, origin, desiredDelta)
```

Move by a desired world-space displacement. The shared movement kernel slides along blocking planes and tries Quake's 18-unit stair step.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `traceFn` | `dynamic` | — | Collision-trace callback used to test the requested movement or visibility segment. |
| `context` | `dynamic` | — | context record passed to the playable enemy movement helper calls. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `desiredDelta` | `dynamic` | — | Sequence read at `desiredDelta[0]`, `desiredDelta[1]`, `desiredDelta[2]`, `desiredDelta[axis]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_movement.ml#L69)

<a id="function-function-mq3-client-playable-enemy-movement-movetarget-function-movetarget-world-target-desireddelta-src-mq3-client-playable-enemy-movement-ml-778281481"></a>
### moveTarget

```ml
function moveTarget(world, target, desiredDelta)
```

Calls `mq3.client.playable_enemy_movement.moveTargetWithTrace` from playable enemy movement `moveTarget`. The final path returns `moveTargetWithTrace(worldTrace,world,target,desiredDelta)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | world record passed to the playable enemy movement helper calls. |
| `target` | `dynamic` | — | Value used by `return moveTargetWithTrace(worldTrace,world,target,desiredDelta)`. |
| `desiredDelta` | `dynamic` | — | Value used by `return moveTargetWithTrace(worldTrace,world,target,desiredDelta)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_movement.ml#L119)

<a id="function-function-mq3-client-playable-enemy-movement-movetargetwithtrace-function-movetargetwithtrace-tracefn-context-target-desireddelta-src-mq3-client-playable-enemy-movement-ml-1718379451"></a>
### moveTargetWithTrace

```ml
function moveTargetWithTrace(traceFn, context, target, desiredDelta)
```

Adapter used by preview code: target only needs a three-component origin.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `traceFn` | `dynamic` | — | Collision-trace callback used to test the requested movement or visibility segment. |
| `context` | `dynamic` | — | context record passed to the playable enemy movement helper calls. |
| `target` | `dynamic` | — | Mutable playable enemy movement record/storage; this routine assigns `target.origin`. |
| `desiredDelta` | `dynamic` | — | Value used by `result=moveOriginWithTrace(traceFn,context,target.origin,desiredDelta)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_movement.ml#L108)

<a id="constant-constant-mq3-client-playable-enemy-movement-player-mask-const-player-mask-33619969-src-mq3-client-playable-enemy-movement-ml-1814085169"></a>
### PLAYER_MASK

```ml
const PLAYER_MASK = 33619969
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_movement.ml#L9)

- [mq3.client.playable_enemy_movement.Result](Type-mq3-client-playable-enemy-movement-result-1182279015.md) — struct
<a id="constant-constant-mq3-client-playable-enemy-movement-step-height-const-step-height-18-src-mq3-client-playable-enemy-movement-ml-706980540"></a>
### STEP_HEIGHT

```ml
const STEP_HEIGHT = 18
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_movement.ml#L10)

<a id="function-function-mq3-client-playable-enemy-movement-validvector-function-validvector-value-src-mq3-client-playable-enemy-movement-ml-346952659"></a>
### validVector

```ml
function validVector(value)
```

Computes `typeof(value)=="array" and len(value)==3` for playable enemy movement `validVector`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence whose length/content is inspected by `validVector`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_movement.ml#L22)

<a id="function-function-mq3-client-playable-enemy-movement-worldtrace-function-worldtrace-state-startpoint-endpoint-src-mq3-client-playable-enemy-movement-ml-371769428"></a>
### worldTrace

```ml
function worldTrace(state, startPoint, endPoint)
```

Calls `mq3.collision.world.boxTrace`, `mq3.game.movement.Collision` from playable enemy movement `worldTrace`. The final path returns `movement.Collision(hit.trace,hit.endpos,entity)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.context`, `state.mins`, `state.maxs`, `state.mask`. |
| `startPoint` | `dynamic` | — | Starting world-space point of the segment or trace. |
| `endPoint` | `dynamic` | — | Ending world-space point of the segment or trace. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_movement.ml#L28)
