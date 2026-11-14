# `src/mq3/client/playable_enemy_hitscan.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_enemy_hitscan`](Package-mq3-client-playable-enemy-hitscan-805881491.md)

Reachable from entry: **yes**

## Imports

- `mq3/collision/world.ml` as `collision` → [src/mq3/collision/world.ml](File-src-mq3-collision-world-ml-863162236.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-client-playable-enemy-hitscan-fail-function-fail-message-src-mq3-client-playable-enemy-hitscan-ml-255131359"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_hitscan.ml#L12)

<a id="function-function-mq3-client-playable-enemy-hitscan-fire-function-fire-world-ai-targetstate-playerposition-muzzleorigins-now-src-mq3-client-playable-enemy-hitscan-ml-584943640"></a>
### fire

```ml
function fire(world, ai, targetState, playerPosition, muzzleOrigins, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `ai` | `dynamic` | — |  |
| `targetState` | `dynamic` | — |  |
| `playerPosition` | `dynamic` | — |  |
| `muzzleOrigins` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_hitscan.ml#L46)

<a id="function-function-mq3-client-playable-enemy-hitscan-firewithtrace-function-firewithtrace-tracefn-context-ai-targetstate-playerposition-muzzleorigins-now-src-mq3-client-playable-enemy-hitscan-ml-2082619288"></a>
### fireWithTrace

```ml
function fireWithTrace(traceFn, context, ai, targetState, playerPosition, muzzleOrigins, now)
```

The AI has already selected its target. This final muzzle-to-player trace is repeated after movement so a wall still wins before instantaneous damage.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `traceFn` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |
| `ai` | `dynamic` | — |  |
| `targetState` | `dynamic` | — |  |
| `playerPosition` | `dynamic` | — |  |
| `muzzleOrigins` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_hitscan.ml#L22)

<a id="function-function-mq3-client-playable-enemy-hitscan-point-function-point-value-src-mq3-client-playable-enemy-hitscan-ml-1155821765"></a>
### point

```ml
function point(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_hitscan.ml#L14)

- [mq3.client.playable_enemy_hitscan.Shot](Type-mq3-client-playable-enemy-hitscan-shot-2051138919.md) — struct
<a id="constant-constant-mq3-client-playable-enemy-hitscan-shot-mask-const-shot-mask-100663297-src-mq3-client-playable-enemy-hitscan-ml-748115703"></a>
### SHOT_MASK

```ml
const SHOT_MASK = 100663297
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_hitscan.ml#L8)

<a id="function-function-mq3-client-playable-enemy-hitscan-validpoint-function-validpoint-value-src-mq3-client-playable-enemy-hitscan-ml-457868573"></a>
### validPoint

```ml
function validPoint(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_hitscan.ml#L13)

<a id="function-function-mq3-client-playable-enemy-hitscan-worldpointtrace-function-worldpointtrace-context-startpoint-endpoint-src-mq3-client-playable-enemy-hitscan-ml-700371026"></a>
### worldPointTrace

```ml
function worldPointTrace(context, startPoint, endPoint)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `startPoint` | `dynamic` | — |  |
| `endPoint` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_enemy_hitscan.ml#L16)
