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
| `startPoint` | `dynamic` | — |  |
| `endPoint` | `dynamic` | — |  |
| `center` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L86)

<a id="function-function-mq3-client-playable-enemy-projectiles-activecount-function-activecount-state-src-mq3-client-playable-enemy-projectiles-ml-1153554995"></a>
### activeCount

```ml
function activeCount(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L180)

<a id="function-function-mq3-client-playable-enemy-projectiles-appendimpact-function-appendimpact-state-projectile-kind-point-normal-damage-now-src-mq3-client-playable-enemy-projectiles-ml-1551299616"></a>
### appendImpact

```ml
function appendImpact(state, projectile, kind, point, normal, damage, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `projectile` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `damage` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L128)

<a id="function-function-mq3-client-playable-enemy-projectiles-copypoint-function-copypoint-value-src-mq3-client-playable-enemy-projectiles-ml-1820404403"></a>
### copyPoint

```ml
function copyPoint(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L23)

<a id="function-function-mq3-client-playable-enemy-projectiles-create-function-create-now-speed-lifetime-radius-playershape-playermins-playermaxs-playerradius-src-mq3-client-playable-enemy-projectiles-ml-1317490981"></a>
### create

```ml
function create(now, speed, lifetime, radius, playerShape, playerMins, playerMaxs, playerRadius)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `now` | `dynamic` | — |  |
| `speed` | `dynamic` | — |  |
| `lifetime` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `playerShape` | `dynamic` | — |  |
| `playerMins` | `dynamic` | — |  |
| `playerMaxs` | `dynamic` | — |  |
| `playerRadius` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L25)

<a id="function-function-mq3-client-playable-enemy-projectiles-createaabb-function-createaabb-now-src-mq3-client-playable-enemy-projectiles-ml-490045420"></a>
### createAabb

```ml
function createAabb(now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L33)

<a id="function-function-mq3-client-playable-enemy-projectiles-createsphere-function-createsphere-now-radius-src-mq3-client-playable-enemy-projectiles-ml-250640238"></a>
### createSphere

```ml
function createSphere(now, radius)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `now` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L37)

<a id="constant-constant-mq3-client-playable-enemy-projectiles-default-lifetime-milliseconds-const-default-lifetime-milliseconds-2500-src-mq3-client-playable-enemy-projectiles-ml-1698364544"></a>
### DEFAULT_LIFETIME_MILLISECONDS

```ml
const DEFAULT_LIFETIME_MILLISECONDS = 2500
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L11)

<a id="constant-constant-mq3-client-playable-enemy-projectiles-default-radius-const-default-radius-3-src-mq3-client-playable-enemy-projectiles-ml-1300086032"></a>
### DEFAULT_RADIUS

```ml
const DEFAULT_RADIUS = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L12)

<a id="constant-constant-mq3-client-playable-enemy-projectiles-default-speed-const-default-speed-420-src-mq3-client-playable-enemy-projectiles-ml-1538453179"></a>
### DEFAULT_SPEED

```ml
const DEFAULT_SPEED = 420
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L10)

<a id="function-function-mq3-client-playable-enemy-projectiles-fail-function-fail-message-src-mq3-client-playable-enemy-projectiles-ml-870617967"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L21)

- [mq3.client.playable_enemy_projectiles.Impact](Type-mq3-client-playable-enemy-projectiles-impact-1402023825.md) — struct
<a id="constant-constant-mq3-client-playable-enemy-projectiles-player-aabb-const-player-aabb-0-src-mq3-client-playable-enemy-projectiles-ml-73291609"></a>
### PLAYER_AABB

```ml
const PLAYER_AABB = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L13)

<a id="constant-constant-mq3-client-playable-enemy-projectiles-player-sphere-const-player-sphere-1-src-mq3-client-playable-enemy-projectiles-ml-1500105352"></a>
### PLAYER_SPHERE

```ml
const PLAYER_SPHERE = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L14)

<a id="function-function-mq3-client-playable-enemy-projectiles-playerfraction-function-playerfraction-state-projectile-startpoint-endpoint-playerposition-src-mq3-client-playable-enemy-projectiles-ml-1284336855"></a>
### playerFraction

```ml
function playerFraction(state, projectile, startPoint, endPoint, playerPosition)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `projectile` | `dynamic` | — |  |
| `startPoint` | `dynamic` | — |  |
| `endPoint` | `dynamic` | — |  |
| `playerPosition` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L119)

<a id="function-function-mq3-client-playable-enemy-projectiles-pointonsegment-function-pointonsegment-startpoint-endpoint-fraction-src-mq3-client-playable-enemy-projectiles-ml-912468539"></a>
### pointOnSegment

```ml
function pointOnSegment(startPoint, endPoint, fraction)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `startPoint` | `dynamic` | — |  |
| `endPoint` | `dynamic` | — |  |
| `fraction` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L124)

- [mq3.client.playable_enemy_projectiles.Projectile](Type-mq3-client-playable-enemy-projectiles-projectile-1757864664.md) — struct
<a id="constant-constant-mq3-client-playable-enemy-projectiles-shot-mask-const-shot-mask-100663297-src-mq3-client-playable-enemy-projectiles-ml-929107223"></a>
### SHOT_MASK

```ml
const SHOT_MASK = 100663297
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L9)

<a id="function-function-mq3-client-playable-enemy-projectiles-spawnattacks-function-spawnattacks-state-ai-targetstate-playerposition-now-src-mq3-client-playable-enemy-projectiles-ml-697863151"></a>
### spawnAttacks

```ml
function spawnAttacks(state, ai, targetState, playerPosition, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `ai` | `dynamic` | — |  |
| `targetState` | `dynamic` | — |  |
| `playerPosition` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L81)

<a id="function-function-mq3-client-playable-enemy-projectiles-spawnattacksfrommuzzles-function-spawnattacksfrommuzzles-state-ai-targetstate-playerposition-muzzleorigins-now-src-mq3-client-playable-enemy-projectiles-ml-887784835"></a>
### spawnAttacksFromMuzzles

```ml
function spawnAttacksFromMuzzles(state, ai, targetState, playerPosition, muzzleOrigins, now)
```

Consume one AI event batch once. Repeating this call at the same timestamp is idempotent, which prevents duplicate shots if rendering samples a frame twice.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `ai` | `dynamic` | — |  |
| `targetState` | `dynamic` | — |  |
| `playerPosition` | `dynamic` | — |  |
| `muzzleOrigins` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L58)

<a id="function-function-mq3-client-playable-enemy-projectiles-spawnone-function-spawnone-state-attacker-origin-target-damage-side-now-src-mq3-client-playable-enemy-projectiles-ml-1734255047"></a>
### spawnOne

```ml
function spawnOne(state, attacker, origin, target, damage, side, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `attacker` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |
| `damage` | `dynamic` | — |  |
| `side` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L45)

<a id="function-function-mq3-client-playable-enemy-projectiles-spherefraction-function-spherefraction-startpoint-endpoint-center-radius-src-mq3-client-playable-enemy-projectiles-ml-625253018"></a>
### sphereFraction

```ml
function sphereFraction(startPoint, endPoint, center, radius)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `startPoint` | `dynamic` | — |  |
| `endPoint` | `dynamic` | — |  |
| `center` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L106)

- [mq3.client.playable_enemy_projectiles.State](Type-mq3-client-playable-enemy-projectiles-state-1196398108.md) — struct
- [mq3.client.playable_enemy_projectiles.Trail](Type-mq3-client-playable-enemy-projectiles-trail-771065137.md) — struct
<a id="function-function-mq3-client-playable-enemy-projectiles-update-function-update-world-state-playerposition-now-src-mq3-client-playable-enemy-projectiles-ml-797402805"></a>
### update

```ml
function update(world, state, playerPosition, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `playerPosition` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L175)

<a id="function-function-mq3-client-playable-enemy-projectiles-updatewithtrace-function-updatewithtrace-tracefn-context-state-playerposition-now-src-mq3-client-playable-enemy-projectiles-ml-618342459"></a>
### updateWithTrace

```ml
function updateWithTrace(traceFn, context, state, playerPosition, now)
```

traceFn must perform a BSP point trace and return { trace.fraction, trace.normal, endpos }. Projectiles disappear immediately on their first hit.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `traceFn` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `playerPosition` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L136)

<a id="function-function-mq3-client-playable-enemy-projectiles-validvector-function-validvector-value-src-mq3-client-playable-enemy-projectiles-ml-1002332359"></a>
### validVector

```ml
function validVector(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L22)

<a id="function-function-mq3-client-playable-enemy-projectiles-worldpointtrace-function-worldpointtrace-context-startpoint-endpoint-src-mq3-client-playable-enemy-projectiles-ml-768021682"></a>
### worldPointTrace

```ml
function worldPointTrace(context, startPoint, endPoint)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `startPoint` | `dynamic` | — |  |
| `endPoint` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_enemy_projectiles.ml#L41)
