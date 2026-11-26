# `src/mq3/client/playable_enemy_projectiles.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_enemy_projectiles`](Package-mq3-client-playable-enemy-projectiles-853119991.md)

Reachable from entry: **no**

## Imports

- `mq3/collision/world.ml` as `collision` → [src/mq3/collision/world.ml](File-src-mq3-collision-world-ml-863162236.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-client-playable-enemy-projectiles-aabbfraction-function-aabbfraction-startpoint-endpoint-center-mins-maxs-radius-src-mq3-client-playable-enemy-projectiles-ml-1533148332"></a>
### aabbFraction

```ml
function aabbFraction(startPoint, endPoint, center, mins, maxs, radius)
```

Slab intersection against player-local bounds expanded by projectile radius.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `startPoint` | `dynamic` | — | Starting world-space point of the segment or trace. |
| `endPoint` | `dynamic` | — | Ending world-space point of the segment or trace. |
| `center` | `dynamic` | — | Sequence read at `center[axis]`. |
| `mins` | `dynamic` | — | Minimum X, Y and Z coordinates of the axis-aligned bounds. |
| `maxs` | `dynamic` | — | Maximum X, Y and Z coordinates of the axis-aligned bounds. |
| `radius` | `dynamic` | — | Radius used by the spatial or visual calculation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L238)

<a id="function-function-mq3-client-playable-enemy-projectiles-activecount-function-activecount-state-src-mq3-client-playable-enemy-projectiles-ml-1153554995"></a>
### activeCount

```ml
function activeCount(state)
```

Evaluates playable enemy projectiles `activeCount` and returns `0`, `len(state.projectiles)` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.projectiles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L367)

<a id="function-function-mq3-client-playable-enemy-projectiles-appendimpact-function-appendimpact-state-projectile-kind-point-normal-damage-now-src-mq3-client-playable-enemy-projectiles-ml-1551299616"></a>
### appendImpact

```ml
function appendImpact(state, projectile, kind, point, normal, damage, now)
```

Updates `state.impacts`, `state.damageThisFrame` during playable enemy projectiles `appendImpact`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable enemy projectiles record/storage; this routine assigns `state.impacts`, `state.damageThisFrame`. |
| `projectile` | `dynamic` | — | Record read through `projectile.id`, `projectile.attacker`, `projectile.side`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `point` | `dynamic` | — | Value used by `state.impacts=state.impacts+[Impact(projectile.id,projectile.attacker,kind,copyPoint(point),copyPoint(normal),damage,projectile.side,now)]`. |
| `normal` | `dynamic` | — | Surface-normal vector used to orient or offset the effect. |
| `damage` | `dynamic` | — | Value used by `state.impacts=state.impacts+[Impact(projectile.id,projectile.attacker,kind,copyPoint(point),copyPoint(normal),damage,projectile.side,now)]`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L303)

<a id="function-function-mq3-client-playable-enemy-projectiles-copypoint-function-copypoint-value-src-mq3-client-playable-enemy-projectiles-ml-1820404403"></a>
### copyPoint

```ml
function copyPoint(value)
```

Copies the X, Y and Z components into a fresh playable enemy projectiles vector.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence read at `value[0]`, `value[1]`, `value[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L131)

<a id="function-function-mq3-client-playable-enemy-projectiles-create-function-create-now-speed-lifetime-radius-playershape-playermins-playermaxs-playerradius-src-mq3-client-playable-enemy-projectiles-ml-1317490981"></a>
### create

```ml
function create(now, speed, lifetime, radius, playerShape, playerMins, playerMaxs, playerRadius)
```

Calls `mq3.client.playable_enemy_projectiles.validVector`, `mq3.client.playable_enemy_projectiles.State`, `mq3.compat.numeric.f32` and additional helpers from playable enemy projectiles `create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |
| `speed` | `dynamic` | — | Value used by `if now<0 or speed<=0.0 or lifetime<=0 or radius<0.0 then return fail("time and projectile dimensions are invalid") end if`. |
| `lifetime` | `dynamic` | — | Value used by `if now<0 or speed<=0.0 or lifetime<=0 or radius<0.0 then return fail("time and projectile dimensions are invalid") end if`. |
| `radius` | `dynamic` | — | Radius used by the spatial or visual calculation. |
| `playerShape` | `dynamic` | — | Value used by `if playerShape!=PLAYER_AABB and playerShape!=PLAYER_SPHERE then return fail("unknown player collision shape") end if`. |
| `playerMins` | `dynamic` | — | Sequence read at `playerMins[axis]`. |
| `playerMaxs` | `dynamic` | — | Sequence read at `playerMaxs[axis]`. |
| `playerRadius` | `dynamic` | — | Value used by `if not validVector(playerMins) or not validVector(playerMaxs) or playerRadius<=0.0 then return fail("player bounds are invalid") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L142)

<a id="function-function-mq3-client-playable-enemy-projectiles-createaabb-function-createaabb-now-src-mq3-client-playable-enemy-projectiles-ml-490045420"></a>
### createAabb

```ml
function createAabb(now)
```

Adapts `mq3.client.playable_enemy_projectiles.create` to playable enemy projectiles `createAabb`, returning its result for `now, DEFAULT_SPEED, DEFAULT_LIFETIME_MILLISECONDS, DEFAULT_RADIUS, PLAYER_AABB, [-15.0,-15.0,-24.0], [15.0,15.0,32.0], 18.0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. Forwarded to `mq3.client.playable_enemy_projectiles.create`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L152)

<a id="function-function-mq3-client-playable-enemy-projectiles-createsphere-function-createsphere-now-radius-src-mq3-client-playable-enemy-projectiles-ml-250640238"></a>
### createSphere

```ml
function createSphere(now, radius)
```

Adapts `mq3.client.playable_enemy_projectiles.create` to playable enemy projectiles `createSphere`, returning its result for `now, DEFAULT_SPEED, DEFAULT_LIFETIME_MILLISECONDS, DEFAULT_RADIUS, PLAYER_SPHERE, [-radius,-radius,-radius], [radius,radius,radius], radius`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. Forwarded to `mq3.client.playable_enemy_projectiles.create`. |
| `radius` | `dynamic` | — | Radius used by the spatial or visual calculation. Forwarded to `mq3.client.playable_enemy_projectiles.create`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L159)

<a id="constant-constant-mq3-client-playable-enemy-projectiles-default-lifetime-milliseconds-const-default-lifetime-milliseconds-2500-src-mq3-client-playable-enemy-projectiles-ml-1698364544"></a>
### DEFAULT_LIFETIME_MILLISECONDS

```ml
const DEFAULT_LIFETIME_MILLISECONDS = 2500
```

Default lifetime duration in milliseconds when the caller supplies no override.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L14)

<a id="constant-constant-mq3-client-playable-enemy-projectiles-default-radius-const-default-radius-3-src-mq3-client-playable-enemy-projectiles-ml-1300086032"></a>
### DEFAULT_RADIUS

```ml
const DEFAULT_RADIUS = 3
```

Fallback radius setting used when constructing the native client simulation or effect configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L16)

<a id="constant-constant-mq3-client-playable-enemy-projectiles-default-speed-const-default-speed-420-src-mq3-client-playable-enemy-projectiles-ml-1538453179"></a>
### DEFAULT_SPEED

```ml
const DEFAULT_SPEED = 420
```

Fallback speed setting used when constructing the native client simulation or effect configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L12)

<a id="function-function-mq3-client-playable-enemy-projectiles-fail-function-fail-message-src-mq3-client-playable-enemy-projectiles-ml-870617967"></a>
### fail

```ml
function fail(message)
```

Creates the playable enemy projectiles error `7560` with diagnostic text `"preview enemy projectiles: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"preview enemy projectiles: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L125)

- [mq3.client.playable_enemy_projectiles.Impact](Type-mq3-client-playable-enemy-projectiles-impact-1402023825.md) — struct
<a id="constant-constant-mq3-client-playable-enemy-projectiles-player-aabb-const-player-aabb-0-src-mq3-client-playable-enemy-projectiles-ml-73291609"></a>
### PLAYER_AABB

```ml
const PLAYER_AABB = 0
```

Player hit-volume kind selecting an axis-aligned bounding box.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L18)

<a id="constant-constant-mq3-client-playable-enemy-projectiles-player-sphere-const-player-sphere-1-src-mq3-client-playable-enemy-projectiles-ml-1500105352"></a>
### PLAYER_SPHERE

```ml
const PLAYER_SPHERE = 1
```

Player hit-volume kind selecting a spherical collision approximation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L20)

<a id="function-function-mq3-client-playable-enemy-projectiles-playerfraction-function-playerfraction-state-projectile-startpoint-endpoint-playerposition-src-mq3-client-playable-enemy-projectiles-ml-1284336855"></a>
### playerFraction

```ml
function playerFraction(state, projectile, startPoint, endPoint, playerPosition)
```

Calls `mq3.client.playable_enemy_projectiles.sphereFraction`, `mq3.client.playable_enemy_projectiles.aabbFraction` from playable enemy projectiles `playerFraction`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.playerShape`, `state.playerRadius`, `state.playerMins`, `state.playerMaxs`. |
| `projectile` | `dynamic` | — | Record read through `projectile.radius`. |
| `startPoint` | `dynamic` | — | Starting world-space point of the segment or trace. |
| `endPoint` | `dynamic` | — | Ending world-space point of the segment or trace. |
| `playerPosition` | `dynamic` | — | Value used by `if state.playerShape==PLAYER_SPHERE then return sphereFraction(startPoint,endPoint,playerPosition,state.playerRadius+projectile.radius) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L282)

<a id="function-function-mq3-client-playable-enemy-projectiles-pointonsegment-function-pointonsegment-startpoint-endpoint-fraction-src-mq3-client-playable-enemy-projectiles-ml-912468539"></a>
### pointOnSegment

```ml
function pointOnSegment(startPoint, endPoint, fraction)
```

Builds the playable enemy projectiles `pointOnSegment` sequence from `[startPoint[0]+(endPoint[0]-startPoint[0])*fraction,startPoint[1]+(endPoint[1]-startPoint[1])*fraction,startPoint[2]+(endPoint[2]-startPoint[2])*fraction]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `startPoint` | `dynamic` | — | Starting world-space point of the segment or trace. |
| `endPoint` | `dynamic` | — | Ending world-space point of the segment or trace. |
| `fraction` | `dynamic` | — | Interpolation or blend fraction between the endpoint values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L291)

- [mq3.client.playable_enemy_projectiles.Projectile](Type-mq3-client-playable-enemy-projectiles-projectile-1757864664.md) — struct
<a id="constant-constant-mq3-client-playable-enemy-projectiles-shot-mask-const-shot-mask-100663297-src-mq3-client-playable-enemy-projectiles-ml-929107223"></a>
### SHOT_MASK

```ml
const SHOT_MASK = 100663297
```

Combined collision-content mask used when tracing a weapon shot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L10)

<a id="function-function-mq3-client-playable-enemy-projectiles-spawnattacks-function-spawnattacks-state-ai-targetstate-playerposition-now-src-mq3-client-playable-enemy-projectiles-ml-697863151"></a>
### spawnAttacks

```ml
function spawnAttacks(state, ai, targetState, playerPosition, now)
```

Adapts `mq3.client.playable_enemy_projectiles.spawnAttacksFromMuzzles` to playable enemy projectiles `spawnAttacks`, returning its result for `state, ai, targetState, playerPosition, void, now`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.playable_enemy_projectiles.spawnAttacksFromMuzzles`. |
| `ai` | `dynamic` | — | Argument 2 of `mq3.client.playable_enemy_projectiles.spawnAttacksFromMuzzles`. |
| `targetState` | `dynamic` | — | Argument 3 of `mq3.client.playable_enemy_projectiles.spawnAttacksFromMuzzles`. |
| `playerPosition` | `dynamic` | — | Argument 4 of `mq3.client.playable_enemy_projectiles.spawnAttacksFromMuzzles`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. Forwarded to `mq3.client.playable_enemy_projectiles.spawnAttacksFromMuzzles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L227)

<a id="function-function-mq3-client-playable-enemy-projectiles-spawnattacksfrommuzzles-function-spawnattacksfrommuzzles-state-ai-targetstate-playerposition-muzzleorigins-now-src-mq3-client-playable-enemy-projectiles-ml-887784835"></a>
### spawnAttacksFromMuzzles

```ml
function spawnAttacksFromMuzzles(state, ai, targetState, playerPosition, muzzleOrigins, now)
```

Consume one AI event batch once. Repeating this call at the same timestamp is idempotent, which prevents duplicate shots if rendering samples a frame twice.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable enemy projectiles record/storage; this routine assigns `state.lastSpawnTime`. |
| `ai` | `dynamic` | — | Record read through `ai.events`. |
| `targetState` | `dynamic` | — | Record read through `targetState.targets`. |
| `playerPosition` | `dynamic` | — | Value used by `if state==void or ai==void or targetState==void or not validVector(playerPosition) then return fail("state, AI, targets and player position ar...`. |
| `muzzleOrigins` | `dynamic` | — | Sequence read at `muzzleOrigins[event.attacker]`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L198)

<a id="function-function-mq3-client-playable-enemy-projectiles-spawnone-function-spawnone-state-attacker-origin-target-damage-side-now-src-mq3-client-playable-enemy-projectiles-ml-1734255047"></a>
### spawnOne

```ml
function spawnOne(state, attacker, origin, target, damage, side, now)
```

Updates `state.nextId`, `state.projectiles` during playable enemy projectiles `spawnOne`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable enemy projectiles record/storage; this routine assigns `state.nextId`, `state.projectiles`. |
| `attacker` | `dynamic` | — | Value used by `projectile=Projectile(state.nextId,attacker,copyPoint(origin),velocity,now,now+state.lifetime,damage,side,state.radius)`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `target` | `dynamic` | — | Sequence read at `target[0]`, `target[1]`, `target[2]`. |
| `damage` | `dynamic` | — | Value used by `projectile=Projectile(state.nextId,attacker,copyPoint(origin),velocity,now,now+state.lifetime,damage,side,state.radius)`. |
| `side` | `dynamic` | — | Value used by `if side<0 then direction[0]=-1.0 end if`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L179)

<a id="function-function-mq3-client-playable-enemy-projectiles-spherefraction-function-spherefraction-startpoint-endpoint-center-radius-src-mq3-client-playable-enemy-projectiles-ml-625253018"></a>
### sphereFraction

```ml
function sphereFraction(startPoint, endPoint, center, radius)
```

Calls `mq3.shared.math.DotProduct`, `mq3.compat.numeric.fsqrt` from playable enemy projectiles `sphereFraction`. The final path returns `fraction`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `startPoint` | `dynamic` | — | Starting world-space point of the segment or trace. |
| `endPoint` | `dynamic` | — | Ending world-space point of the segment or trace. |
| `center` | `dynamic` | — | Sequence read at `center[0]`, `center[1]`, `center[2]`. |
| `radius` | `dynamic` | — | Radius used by the spatial or visual calculation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L263)

- [mq3.client.playable_enemy_projectiles.State](Type-mq3-client-playable-enemy-projectiles-state-1196398108.md) — struct
- [mq3.client.playable_enemy_projectiles.Trail](Type-mq3-client-playable-enemy-projectiles-trail-771065137.md) — struct
<a id="function-function-mq3-client-playable-enemy-projectiles-update-function-update-world-state-playerposition-now-src-mq3-client-playable-enemy-projectiles-ml-797402805"></a>
### update

```ml
function update(world, state, playerPosition, now)
```

Calls `mq3.client.playable_enemy_projectiles.updateWithTrace` from playable enemy projectiles `update`. The final path returns `updateWithTrace(worldPointTrace,world,state,playerPosition,now)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | world record passed to the playable enemy projectiles helper calls. |
| `state` | `dynamic` | — | Shared playable enemy projectiles state passed to the helper calls in `update`. |
| `playerPosition` | `dynamic` | — | Value used by `return updateWithTrace(worldPointTrace,world,state,playerPosition,now)`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L360)

<a id="function-function-mq3-client-playable-enemy-projectiles-updatewithtrace-function-updatewithtrace-tracefn-context-state-playerposition-now-src-mq3-client-playable-enemy-projectiles-ml-618342459"></a>
### updateWithTrace

```ml
function updateWithTrace(traceFn, context, state, playerPosition, now)
```

traceFn must perform a BSP point trace and return { trace.fraction, trace.normal, endpos }. Projectiles disappear immediately on their first hit.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `traceFn` | `dynamic` | — | Collision-trace callback used to test the requested movement or visibility segment. |
| `context` | `dynamic` | — | context record passed to the playable enemy projectiles helper calls. |
| `state` | `dynamic` | — | Mutable playable enemy projectiles record/storage; this routine assigns `state.trails`, `state.impacts`, `state.damageThisFrame`, `state.projectiles` and additional values. |
| `playerPosition` | `dynamic` | — | Value used by `if traceFn==void or state==void or not validVector(playerPosition) then return fail("trace, state and player position are required") end if`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L316)

<a id="function-function-mq3-client-playable-enemy-projectiles-validvector-function-validvector-value-src-mq3-client-playable-enemy-projectiles-ml-1002332359"></a>
### validVector

```ml
function validVector(value)
```

Computes `typeof(value)=="array" and len(value)==3` for playable enemy projectiles `validVector`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence whose length/content is inspected by `validVector`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L128)

<a id="function-function-mq3-client-playable-enemy-projectiles-worldpointtrace-function-worldpointtrace-context-startpoint-endpoint-src-mq3-client-playable-enemy-projectiles-ml-768021682"></a>
### worldPointTrace

```ml
function worldPointTrace(context, startPoint, endPoint)
```

Adapts `mq3.collision.world.boxTrace` to playable enemy projectiles `worldPointTrace`, returning its result for `context, startPoint, endPoint, [0.0,0.0,0.0], [0.0,0.0,0.0], 0, SHOT_MASK, false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Argument 1 of `mq3.collision.world.boxTrace`. |
| `startPoint` | `dynamic` | — | Starting world-space point of the segment or trace. Forwarded to `mq3.collision.world.boxTrace`. |
| `endPoint` | `dynamic` | — | Ending world-space point of the segment or trace. Forwarded to `mq3.collision.world.boxTrace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_enemy_projectiles.ml#L167)
