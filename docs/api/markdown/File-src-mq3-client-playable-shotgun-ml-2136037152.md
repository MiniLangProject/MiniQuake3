# `src/mq3/client/playable_shotgun.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_shotgun`](Package-mq3-client-playable-shotgun-1103737890.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/playable_targets.ml` as `shotgunTargets` → [src/mq3/client/playable_targets.ml](File-src-mq3-client-playable-targets-ml-87537228.md)
- `mq3/collision/world.ml` as `collision` → [src/mq3/collision/world.ml](File-src-mq3-collision-world-ml-863162236.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/shared/directions.ml` as `directions` → [src/mq3/shared/directions.ml](File-src-mq3-shared-directions-ml-575237557.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

- [mq3.client.playable_shotgun.Blast](Type-mq3-client-playable-shotgun-blast-969882182.md) — struct
<a id="function-function-mq3-client-playable-shotgun-copypoint-function-copypoint-value-src-mq3-client-playable-shotgun-ml-1530015055"></a>
### copyPoint

```ml
function copyPoint(value)
```

Copies three vector components with float32 rounding for playable shotgun.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence read at `value[0]`, `value[1]`, `value[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_shotgun.ml#L78)

<a id="constant-constant-mq3-client-playable-shotgun-default-shotgun-count-const-default-shotgun-count-11-src-mq3-client-playable-shotgun-ml-120540715"></a>
### DEFAULT_SHOTGUN_COUNT

```ml
const DEFAULT_SHOTGUN_COUNT = 11
```

Fallback shotgun count setting used when constructing the native client simulation or effect configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_shotgun.ml#L18)

<a id="constant-constant-mq3-client-playable-shotgun-default-shotgun-damage-const-default-shotgun-damage-10-src-mq3-client-playable-shotgun-ml-1067252832"></a>
### DEFAULT_SHOTGUN_DAMAGE

```ml
const DEFAULT_SHOTGUN_DAMAGE = 10
```

Fallback shotgun damage setting used when constructing the native client simulation or effect configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_shotgun.ml#L21)

<a id="constant-constant-mq3-client-playable-shotgun-default-shotgun-spread-const-default-shotgun-spread-700-src-mq3-client-playable-shotgun-ml-859614816"></a>
### DEFAULT_SHOTGUN_SPREAD

```ml
const DEFAULT_SHOTGUN_SPREAD = 700
```

Fallback shotgun spread setting used when constructing the native client simulation or effect configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_shotgun.ml#L15)

<a id="function-function-mq3-client-playable-shotgun-fail-function-fail-message-src-mq3-client-playable-shotgun-ml-1057269955"></a>
### fail

```ml
function fail(message)
```

Creates the playable shotgun error `7595` with diagnostic text `"playable shotgun: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"playable shotgun: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_shotgun.ml#L72)

<a id="function-function-mq3-client-playable-shotgun-fire-function-fire-world-targetstate-origin-origin2-seed-now-src-mq3-client-playable-shotgun-ml-1165289031"></a>
### fire

```ml
function fire(world, targetState, origin, origin2, seed, now)
```

Calls `mq3.client.playable_shotgun.fireWithTrace` from playable shotgun `fire`. The final path returns `fireWithTrace(worldPointTrace,world,targetState,origin,origin2,seed,now)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | world record passed to the playable shotgun helper calls. |
| `targetState` | `dynamic` | — | targetState record passed to the playable shotgun helper calls. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `origin2` | `dynamic` | — | Second world-space endpoint of the effect. |
| `seed` | `dynamic` | — | Value used by `return fireWithTrace(worldPointTrace,world,targetState,origin,origin2,seed,now)`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_shotgun.ml#L161)

<a id="function-function-mq3-client-playable-shotgun-firewithtrace-function-firewithtrace-tracefn-context-targetstate-origin-origin2-seed-now-src-mq3-client-playable-shotgun-ml-315736729"></a>
### fireWithTrace

```ml
function fireWithTrace(traceFn, context, targetState, origin, origin2, seed, now)
```

The BSP endpoint bounds playableTargets.applyShot, so a wall always shields a target behind it. Damage is applied one pellet at a time like g_weapon.c.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `traceFn` | `dynamic` | — | Collision-trace callback used to test the requested movement or visibility segment. |
| `context` | `dynamic` | — | context record passed to the playable shotgun helper calls. |
| `targetState` | `dynamic` | — | targetState record passed to the playable shotgun helper calls. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `origin2` | `dynamic` | — | Second world-space endpoint of the effect. |
| `seed` | `dynamic` | — | Value used by `pattern=patternEndpoints(origin,origin2,seed)`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_shotgun.ml#L135)

<a id="constant-constant-mq3-client-playable-shotgun-pattern-range-const-pattern-range-131072-src-mq3-client-playable-shotgun-ml-1130570749"></a>
### PATTERN_RANGE

```ml
const PATTERN_RANGE = 131072
```

Forward ray distance used to construct the deterministic shotgun pellet pattern.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_shotgun.ml#L23)

<a id="function-function-mq3-client-playable-shotgun-patternendpoints-function-patternendpoints-origin-origin2-seed-src-mq3-client-playable-shotgun-ml-10554679"></a>
### patternEndpoints

```ml
function patternEndpoints(origin, origin2, seed)
```

This is ShotgunPattern's client/server-shared deterministic spread loop. origin2 is normalized exactly as in g_weapon.c before the basis is derived.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `origin2` | `dynamic` | — | Second world-space endpoint of the effect. |
| `seed` | `dynamic` | — | Value used by `randomState=qmath.RandomState(numeric.i32(seed))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_shotgun.ml#L93)

- [mq3.client.playable_shotgun.Pellet](Type-mq3-client-playable-shotgun-pellet-1813882538.md) — struct
<a id="constant-constant-mq3-client-playable-shotgun-shot-mask-const-shot-mask-100663297-src-mq3-client-playable-shotgun-ml-410773535"></a>
### SHOT_MASK

```ml
const SHOT_MASK = 100663297
```

code/game/bg_public.h and code/game/g_weapon.c.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_shotgun.ml#L12)

<a id="function-function-mq3-client-playable-shotgun-tracepellets-function-tracepellets-tracefn-context-origin-endpoints-src-mq3-client-playable-shotgun-ml-1518935824"></a>
### tracePellets

```ml
function tracePellets(traceFn, context, origin, endpoints)
```

Calls `traceFn`, `mq3.client.playable_shotgun.copyPoint`, `mq3.client.playable_shotgun.Pellet` and additional helpers from playable shotgun `tracePellets`. The final path returns `tracedPellets`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `traceFn` | `dynamic` | — | Collision-trace callback used to test the requested movement or visibility segment. |
| `context` | `dynamic` | — | context record passed to the playable shotgun helper calls. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `endpoints` | `dynamic` | — | Value used by `for each intended in endpoints`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_shotgun.ml#L114)

<a id="function-function-mq3-client-playable-shotgun-validpoint-function-validpoint-value-src-mq3-client-playable-shotgun-ml-1700336745"></a>
### validPoint

```ml
function validPoint(value)
```

Computes `value!=void and typeof(value)=="array" and len(value)==3` for playable shotgun `validPoint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence whose length/content is inspected by `validPoint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_shotgun.ml#L75)

<a id="function-function-mq3-client-playable-shotgun-worldpointtrace-function-worldpointtrace-context-startpoint-endpoint-src-mq3-client-playable-shotgun-ml-1251212770"></a>
### worldPointTrace

```ml
function worldPointTrace(context, startPoint, endPoint)
```

Adapts `mq3.collision.world.boxTrace` to playable shotgun `worldPointTrace`, returning its result for `context, startPoint, endPoint, [0.0,0.0,0.0], [0.0,0.0,0.0], 0, SHOT_MASK, false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Argument 1 of `mq3.collision.world.boxTrace`. |
| `startPoint` | `dynamic` | — | Starting world-space point of the segment or trace. Forwarded to `mq3.collision.world.boxTrace`. |
| `endPoint` | `dynamic` | — | Ending world-space point of the segment or trace. Forwarded to `mq3.collision.world.boxTrace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_shotgun.ml#L84)
