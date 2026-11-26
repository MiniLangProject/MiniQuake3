# `src/mq3/client/playable_player_projectiles.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_player_projectiles`](Package-mq3-client-playable-player-projectiles-1705535106.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/playable_projectile_view.ml` as `view` → [src/mq3/client/playable_projectile_view.ml](File-src-mq3-client-playable-projectile-view-ml-1417864517.md)
- `mq3/client/playable_targets.ml` as `projectileTargets` → [src/mq3/client/playable_targets.ml](File-src-mq3-client-playable-targets-ml-87537228.md)
- `mq3/collision/world.ml` as `collision` → [src/mq3/collision/world.ml](File-src-mq3-collision-world-ml-863162236.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-client-playable-player-projectiles-activecount-function-activecount-state-src-mq3-client-playable-player-projectiles-ml-346570467"></a>
### activeCount

```ml
function activeCount(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L207)

<a id="function-function-mq3-client-playable-player-projectiles-addimpact-function-addimpact-state-shot-kind-point-normal-targetindex-targetstate-now-src-mq3-client-playable-player-projectiles-ml-1791425783"></a>
### addImpact

```ml
function addImpact(state, shot, kind, point, normal, targetIndex, targetState, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `shot` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `targetIndex` | `dynamic` | — |  |
| `targetState` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L128)

<a id="function-function-mq3-client-playable-player-projectiles-applydamage-function-applydamage-targetstate-index-requested-direct-now-src-mq3-client-playable-player-projectiles-ml-766640443"></a>
### applyDamage

```ml
function applyDamage(targetState, index, requested, direct, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `targetState` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `requested` | `dynamic` | — |  |
| `direct` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L84)

<a id="constant-constant-mq3-client-playable-player-projectiles-bfg-const-bfg-weapon-bfg-src-mq3-client-playable-player-projectiles-ml-29866283"></a>
### BFG

```ml
const BFG = "weapon_bfg"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L19)

<a id="constant-constant-mq3-client-playable-player-projectiles-bounce-scale-const-bounce-scale-0-65-src-mq3-client-playable-player-projectiles-ml-2147379974"></a>
### BOUNCE_SCALE

```ml
const BOUNCE_SCALE = 0.65
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L14)

<a id="function-function-mq3-client-playable-player-projectiles-bouncehalf-function-bouncehalf-shot-point-normal-impactvelocity-src-mq3-client-playable-player-projectiles-ml-825145450"></a>
### bounceHalf

```ml
function bounceHalf(shot, point, normal, impactVelocity)
```

Mirrors G_BounceMissile for grenades carrying EF_BOUNCE_HALF: reflect the trajectory delta around the collision plane, then retain 65 percent speed.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shot` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `impactVelocity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L150)

<a id="function-function-mq3-client-playable-player-projectiles-copypoint-function-copypoint-value-src-mq3-client-playable-player-projectiles-ml-1164020671"></a>
### copyPoint

```ml
function copyPoint(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L30)

<a id="function-function-mq3-client-playable-player-projectiles-create-function-create-now-src-mq3-client-playable-player-projectiles-ml-709642858"></a>
### create

```ml
function create(now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L41)

- [mq3.client.playable_player_projectiles.Damage](Type-mq3-client-playable-player-projectiles-damage-2054670037.md) — struct
<a id="function-function-mq3-client-playable-player-projectiles-damageatimpact-function-damageatimpact-targetstate-shot-point-directtarget-now-src-mq3-client-playable-player-projectiles-ml-1510796506"></a>
### damageAtImpact

```ml
function damageAtImpact(targetState, shot, point, directTarget, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `targetState` | `dynamic` | — |  |
| `shot` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `directTarget` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L109)

<a id="function-function-mq3-client-playable-player-projectiles-distancetobounds-function-distancetobounds-targetstate-target-point-src-mq3-client-playable-player-projectiles-ml-466050491"></a>
### distanceToBounds

```ml
function distanceToBounds(targetState, target, point)
```

Quake 3 measures splash distance from the nearest point of the target box.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `targetState` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L95)

<a id="constant-constant-mq3-client-playable-player-projectiles-ef-bounce-half-const-ef-bounce-half-16-src-mq3-client-playable-player-projectiles-ml-24867104"></a>
### EF_BOUNCE_HALF

```ml
const EF_BOUNCE_HALF = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L13)

<a id="function-function-mq3-client-playable-player-projectiles-fail-function-fail-message-src-mq3-client-playable-player-projectiles-ml-1241521379"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L28)

<a id="constant-constant-mq3-client-playable-player-projectiles-gravity-const-gravity-800-src-mq3-client-playable-player-projectiles-ml-2128710305"></a>
### GRAVITY

```ml
const GRAVITY = 800
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L12)

<a id="constant-constant-mq3-client-playable-player-projectiles-grenade-const-grenade-weapon-grenadelauncher-src-mq3-client-playable-player-projectiles-ml-2048373786"></a>
### GRENADE

```ml
const GRENADE = "weapon_grenadelauncher"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L18)

- [mq3.client.playable_player_projectiles.Impact](Type-mq3-client-playable-player-projectiles-impact-914252022.md) — struct
<a id="constant-constant-mq3-client-playable-player-projectiles-max-bounces-per-frame-const-max-bounces-per-frame-8-src-mq3-client-playable-player-projectiles-ml-548165281"></a>
### MAX_BOUNCES_PER_FRAME

```ml
const MAX_BOUNCES_PER_FRAME = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L15)

<a id="constant-constant-mq3-client-playable-player-projectiles-plasma-const-plasma-weapon-plasmagun-src-mq3-client-playable-player-projectiles-ml-1783967806"></a>
### PLASMA

```ml
const PLASMA = "weapon_plasmagun"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L17)

<a id="function-function-mq3-client-playable-player-projectiles-pointonsegment-function-pointonsegment-startpoint-endpoint-fraction-src-mq3-client-playable-player-projectiles-ml-1699017529"></a>
### pointOnSegment

```ml
function pointOnSegment(startPoint, endPoint, fraction)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `startPoint` | `dynamic` | — |  |
| `endPoint` | `dynamic` | — |  |
| `fraction` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L66)

<a id="function-function-mq3-client-playable-player-projectiles-profile-function-profile-classname-src-mq3-client-playable-player-projectiles-ml-1421539561"></a>
### profile

```ml
function profile(classname)
```

Values mirror baseq3's fire_rocket, fire_plasma and fire_grenade.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `classname` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L33)

- [mq3.client.playable_player_projectiles.Profile](Type-mq3-client-playable-player-projectiles-profile-1296376593.md) — struct
- [mq3.client.playable_player_projectiles.Projectile](Type-mq3-client-playable-player-projectiles-projectile-493868627.md) — struct
<a id="constant-constant-mq3-client-playable-player-projectiles-rocket-const-rocket-weapon-rocketlauncher-src-mq3-client-playable-player-projectiles-ml-802016480"></a>
### ROCKET

```ml
const ROCKET = "weapon_rocketlauncher"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L16)

<a id="constant-constant-mq3-client-playable-player-projectiles-shot-mask-const-shot-mask-100663297-src-mq3-client-playable-player-projectiles-ml-212960831"></a>
### SHOT_MASK

```ml
const SHOT_MASK = 100663297
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L11)

<a id="function-function-mq3-client-playable-player-projectiles-spawn-function-spawn-state-classname-muzzle-direction-now-src-mq3-client-playable-player-projectiles-ml-146039942"></a>
### spawn

```ml
function spawn(state, classname, muzzle, direction, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `classname` | `dynamic` | — |  |
| `muzzle` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L57)

<a id="function-function-mq3-client-playable-player-projectiles-spawnprofile-function-spawnprofile-state-weaponprofile-muzzle-direction-now-src-mq3-client-playable-player-projectiles-ml-1542565762"></a>
### spawnProfile

```ml
function spawnProfile(state, weaponProfile, muzzle, direction, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `weaponProfile` | `dynamic` | — |  |
| `muzzle` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L46)

- [mq3.client.playable_player_projectiles.State](Type-mq3-client-playable-player-projectiles-state-1661152569.md) — struct
<a id="function-function-mq3-client-playable-player-projectiles-stependpoint-function-stependpoint-shot-milliseconds-src-mq3-client-playable-player-projectiles-ml-1381455440"></a>
### stepEndpoint

```ml
function stepEndpoint(shot, milliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shot` | `dynamic` | — |  |
| `milliseconds` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L135)

<a id="function-function-mq3-client-playable-player-projectiles-targetfraction-function-targetfraction-targetstate-startpoint-endpoint-src-mq3-client-playable-player-projectiles-ml-932746873"></a>
### targetFraction

```ml
function targetFraction(targetState, startPoint, endPoint)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `targetState` | `dynamic` | — |  |
| `startPoint` | `dynamic` | — |  |
| `endPoint` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L70)

- [mq3.client.playable_player_projectiles.Trail](Type-mq3-client-playable-player-projectiles-trail-1669136824.md) — struct
<a id="function-function-mq3-client-playable-player-projectiles-update-function-update-world-state-targetstate-now-src-mq3-client-playable-player-projectiles-ml-1709731623"></a>
### update

```ml
function update(world, state, targetState, now)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `targetState` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L202)

<a id="function-function-mq3-client-playable-player-projectiles-updatewithtrace-function-updatewithtrace-tracefn-context-state-targetstate-now-src-mq3-client-playable-player-projectiles-ml-2064425719"></a>
### updateWithTrace

```ml
function updateWithTrace(traceFn, context, state, targetState, now)
```

traceFn(context,start,end) returns the normal baseq3 trace wrapper. A BSP hit wins ties so walls shield targets. Every removed projectile emits one impact.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `traceFn` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `targetState` | `dynamic` | — |  |
| `now` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L162)

<a id="function-function-mq3-client-playable-player-projectiles-validpoint-function-validpoint-value-src-mq3-client-playable-player-projectiles-ml-1959441945"></a>
### validPoint

```ml
function validPoint(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L29)

<a id="function-function-mq3-client-playable-player-projectiles-velocityafter-function-velocityafter-shot-milliseconds-src-mq3-client-playable-player-projectiles-ml-2049827958"></a>
### velocityAfter

```ml
function velocityAfter(shot, milliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shot` | `dynamic` | — |  |
| `milliseconds` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L142)

<a id="function-function-mq3-client-playable-player-projectiles-worldpointtrace-function-worldpointtrace-context-startpoint-endpoint-src-mq3-client-playable-player-projectiles-ml-49988592"></a>
### worldPointTrace

```ml
function worldPointTrace(context, startPoint, endPoint)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `startPoint` | `dynamic` | — |  |
| `endPoint` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_player_projectiles.ml#L62)
