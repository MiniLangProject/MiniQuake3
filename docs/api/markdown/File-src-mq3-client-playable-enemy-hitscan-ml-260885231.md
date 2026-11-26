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

Creates the playable enemy hitscan error `7630` with diagnostic text `"preview enemy hitscan: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"preview enemy hitscan: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_hitscan.ml#L35)

<a id="function-function-mq3-client-playable-enemy-hitscan-fire-function-fire-world-ai-targetstate-playerposition-muzzleorigins-now-src-mq3-client-playable-enemy-hitscan-ml-584943640"></a>
### fire

```ml
function fire(world, ai, targetState, playerPosition, muzzleOrigins, now)
```

Calls `mq3.client.playable_enemy_hitscan.fireWithTrace` from playable enemy hitscan `fire`. The final path returns `fireWithTrace(worldPointTrace,world,ai,targetState,playerPosition,muzzleOrigins,now)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | world record passed to the playable enemy hitscan helper calls. |
| `ai` | `dynamic` | — | Value used by `return fireWithTrace(worldPointTrace,world,ai,targetState,playerPosition,muzzleOrigins,now)`. |
| `targetState` | `dynamic` | — | targetState record passed to the playable enemy hitscan helper calls. |
| `playerPosition` | `dynamic` | — | Value used by `return fireWithTrace(worldPointTrace,world,ai,targetState,playerPosition,muzzleOrigins,now)`. |
| `muzzleOrigins` | `dynamic` | — | Value used by `return fireWithTrace(worldPointTrace,world,ai,targetState,playerPosition,muzzleOrigins,now)`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_hitscan.ml#L91)

<a id="function-function-mq3-client-playable-enemy-hitscan-firewithtrace-function-firewithtrace-tracefn-context-ai-targetstate-playerposition-muzzleorigins-now-src-mq3-client-playable-enemy-hitscan-ml-2082619288"></a>
### fireWithTrace

```ml
function fireWithTrace(traceFn, context, ai, targetState, playerPosition, muzzleOrigins, now)
```

The AI has already selected its target. This final muzzle-to-player trace is repeated after movement so a wall still wins before instantaneous damage.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `traceFn` | `dynamic` | — | Collision-trace callback used to test the requested movement or visibility segment. |
| `context` | `dynamic` | — | context record passed to the playable enemy hitscan helper calls. |
| `ai` | `dynamic` | — | Record read through `ai.events`. |
| `targetState` | `dynamic` | — | Record read through `targetState.targets`. |
| `playerPosition` | `dynamic` | — | Value used by `if traceFn==void or ai==void or targetState==void or not validPoint(playerPosition) then return fail("trace, AI, targets and player position a...`. |
| `muzzleOrigins` | `dynamic` | — | Sequence read at `muzzleOrigins[event.attacker]`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_hitscan.ml#L60)

<a id="function-function-mq3-client-playable-enemy-hitscan-point-function-point-value-src-mq3-client-playable-enemy-hitscan-ml-1155821765"></a>
### point

```ml
function point(value)
```

Copies three vector components with float32 rounding for playable enemy hitscan.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence read at `value[0]`, `value[1]`, `value[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_hitscan.ml#L41)

- [mq3.client.playable_enemy_hitscan.Shot](Type-mq3-client-playable-enemy-hitscan-shot-2051138919.md) — struct
<a id="constant-constant-mq3-client-playable-enemy-hitscan-shot-mask-const-shot-mask-100663297-src-mq3-client-playable-enemy-hitscan-ml-748115703"></a>
### SHOT_MASK

```ml
const SHOT_MASK = 100663297
```

Combined collision-content mask used when tracing a weapon shot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_hitscan.ml#L9)

<a id="function-function-mq3-client-playable-enemy-hitscan-validpoint-function-validpoint-value-src-mq3-client-playable-enemy-hitscan-ml-457868573"></a>
### validPoint

```ml
function validPoint(value)
```

Computes `value!=void and typeof(value)=="array" and len(value)==3` for playable enemy hitscan `validPoint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence whose length/content is inspected by `validPoint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_hitscan.ml#L38)

<a id="function-function-mq3-client-playable-enemy-hitscan-worldpointtrace-function-worldpointtrace-context-startpoint-endpoint-src-mq3-client-playable-enemy-hitscan-ml-700371026"></a>
### worldPointTrace

```ml
function worldPointTrace(context, startPoint, endPoint)
```

Adapts `mq3.collision.world.boxTrace` to playable enemy hitscan `worldPointTrace`, returning its result for `context, startPoint, endPoint, [0.0,0.0,0.0], [0.0,0.0,0.0], 0, SHOT_MASK, false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Argument 1 of `mq3.collision.world.boxTrace`. |
| `startPoint` | `dynamic` | — | Starting world-space point of the segment or trace. Forwarded to `mq3.collision.world.boxTrace`. |
| `endPoint` | `dynamic` | — | Ending world-space point of the segment or trace. Forwarded to `mq3.collision.world.boxTrace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_hitscan.ml#L47)
