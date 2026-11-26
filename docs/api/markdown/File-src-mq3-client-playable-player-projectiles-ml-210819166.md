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

Evaluates playable player projectiles `activeCount` and returns `0`, `len(state.projectiles)` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.projectiles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L408)

<a id="function-function-mq3-client-playable-player-projectiles-addimpact-function-addimpact-state-shot-kind-point-normal-targetindex-targetstate-now-src-mq3-client-playable-player-projectiles-ml-1791425783"></a>
### addImpact

```ml
function addImpact(state, shot, kind, point, normal, targetIndex, targetState, now)
```

Updates `state.nextImpactId`, `state.impacts` during playable player projectiles `addImpact`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable player projectiles record/storage; this routine assigns `state.nextImpactId`, `state.impacts`. |
| `shot` | `dynamic` | — | Record read through `shot.id`, `shot.profile.classname`, `shot.profile.style`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `point` | `dynamic` | — | Value used by `damages=damageAtImpact(targetState,shot,point,targetIndex,now)`. |
| `normal` | `dynamic` | — | Surface-normal vector used to orient or offset the effect. |
| `targetIndex` | `dynamic` | — | Value used by `damages=damageAtImpact(targetState,shot,point,targetIndex,now)`. |
| `targetState` | `dynamic` | — | targetState record passed to the playable player projectiles helper calls. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L307)

<a id="function-function-mq3-client-playable-player-projectiles-applydamage-function-applydamage-targetstate-index-requested-direct-now-src-mq3-client-playable-player-projectiles-ml-766640443"></a>
### applyDamage

```ml
function applyDamage(targetState, index, requested, direct, now)
```

Updates `targetState.score` during playable player projectiles `applyDamage`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `targetState` | `dynamic` | — | Mutable playable player projectiles record/storage; this routine assigns `targetState.score`. |
| `index` | `dynamic` | — | Value used by `target=targetState.targets[index]`. |
| `requested` | `dynamic` | — | Value used by `amount=requested`. |
| `direct` | `dynamic` | — | Value used by `return Damage(index,amount,direct,killed,awarded)`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L245)

<a id="constant-constant-mq3-client-playable-player-projectiles-bfg-const-bfg-weapon-bfg-src-mq3-client-playable-player-projectiles-ml-29866283"></a>
### BFG

```ml
const BFG = "weapon_bfg"
```

Weapon classname used to select the BFG projectile profile.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L28)

<a id="constant-constant-mq3-client-playable-player-projectiles-bounce-scale-const-bounce-scale-0-65-src-mq3-client-playable-player-projectiles-ml-2147379974"></a>
### BOUNCE_SCALE

```ml
const BOUNCE_SCALE = 0.65
```

Velocity-retention multiplier applied when a native projectile bounces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L18)

<a id="function-function-mq3-client-playable-player-projectiles-bouncehalf-function-bouncehalf-shot-point-normal-impactvelocity-src-mq3-client-playable-player-projectiles-ml-825145450"></a>
### bounceHalf

```ml
function bounceHalf(shot, point, normal, impactVelocity)
```

Mirrors G_BounceMissile for grenades carrying EF_BOUNCE_HALF: reflect the trajectory delta around the collision plane, then retain 65 percent speed.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shot` | `dynamic` | — | Mutable playable player projectiles record/storage; this routine assigns `shot.velocity[axis]`, `shot.origin`, `shot.velocity`, `shot.stopped`. |
| `point` | `dynamic` | — | Sequence read at `point[0]`, `point[1]`, `point[2]`. |
| `normal` | `dynamic` | — | Surface-normal vector used to orient or offset the effect. |
| `impactVelocity` | `dynamic` | — | Sequence read at `impactVelocity[0]`, `impactVelocity[1]`, `impactVelocity[2]`, `impactVelocity[axis]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L339)

<a id="function-function-mq3-client-playable-player-projectiles-copypoint-function-copypoint-value-src-mq3-client-playable-player-projectiles-ml-1164020671"></a>
### copyPoint

```ml
function copyPoint(value)
```

Copies three vector components with float32 rounding for playable player projectiles.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence read at `value[0]`, `value[1]`, `value[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L158)

<a id="function-function-mq3-client-playable-player-projectiles-create-function-create-now-src-mq3-client-playable-player-projectiles-ml-709642858"></a>
### create

```ml
function create(now)
```

Calls `mq3.client.playable_player_projectiles.State` from playable player projectiles `create`. The final path returns `State([],[],[],0,0,now)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L172)

- [mq3.client.playable_player_projectiles.Damage](Type-mq3-client-playable-player-projectiles-damage-2054670037.md) — struct
<a id="function-function-mq3-client-playable-player-projectiles-damageatimpact-function-damageatimpact-targetstate-shot-point-directtarget-now-src-mq3-client-playable-player-projectiles-ml-1510796506"></a>
### damageAtImpact

```ml
function damageAtImpact(targetState, shot, point, directTarget, now)
```

Calls `mq3.client.playable_player_projectiles.applyDamage`, `mq3.client.playable_player_projectiles.distanceToBounds`, `mq3.compat.numeric.trunc32` from playable player projectiles `damageAtImpact`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `targetState` | `dynamic` | — | Record read through `targetState.targets`. |
| `shot` | `dynamic` | — | Record read through `shot.profile.directDamage`, `shot.profile.splashRadius`, `shot.profile.splashDamage`. |
| `point` | `dynamic` | — | Value used by `distance=distanceToBounds(targetState,target,point)`. |
| `directTarget` | `dynamic` | — | Value used by `if directTarget>=0 and targetState.targets[directTarget].alive then result=result+[applyDamage(targetState,directTarget,shot.profile.directDam...`. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L279)

<a id="function-function-mq3-client-playable-player-projectiles-distancetobounds-function-distancetobounds-targetstate-target-point-src-mq3-client-playable-player-projectiles-ml-466050491"></a>
### distanceToBounds

```ml
function distanceToBounds(targetState, target, point)
```

Quake 3 measures splash distance from the nearest point of the target box.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `targetState` | `dynamic` | — | Record read through `targetState.radius`, `targetState.minZ`, `targetState.maxZ`. |
| `target` | `dynamic` | — | Record read through `target.origin`. |
| `point` | `dynamic` | — | Sequence read at `point[axis]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L259)

<a id="constant-constant-mq3-client-playable-player-projectiles-ef-bounce-half-const-ef-bounce-half-16-src-mq3-client-playable-player-projectiles-ml-24867104"></a>
### EF_BOUNCE_HALF

```ml
const EF_BOUNCE_HALF = 16
```

Entity-state flag selecting bounce half behavior in client presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L16)

<a id="function-function-mq3-client-playable-player-projectiles-fail-function-fail-message-src-mq3-client-playable-player-projectiles-ml-1241521379"></a>
### fail

```ml
function fail(message)
```

Creates the playable player projectiles error `7590` with diagnostic text `"player projectiles: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Argument 2 of `error`; passed as `"player projectiles: "+message`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L152)

<a id="constant-constant-mq3-client-playable-player-projectiles-gravity-const-gravity-800-src-mq3-client-playable-player-projectiles-ml-2128710305"></a>
### GRAVITY

```ml
const GRAVITY = 800
```

Downward acceleration used by the module's ballistic or movement integration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L14)

<a id="constant-constant-mq3-client-playable-player-projectiles-grenade-const-grenade-weapon-grenadelauncher-src-mq3-client-playable-player-projectiles-ml-2048373786"></a>
### GRENADE

```ml
const GRENADE = "weapon_grenadelauncher"
```

Weapon classname used to select the grenade projectile profile.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L26)

- [mq3.client.playable_player_projectiles.Impact](Type-mq3-client-playable-player-projectiles-impact-914252022.md) — struct
<a id="constant-constant-mq3-client-playable-player-projectiles-max-bounces-per-frame-const-max-bounces-per-frame-8-src-mq3-client-playable-player-projectiles-ml-548165281"></a>
### MAX_BOUNCES_PER_FRAME

```ml
const MAX_BOUNCES_PER_FRAME = 8
```

Capacity limit for the bounces per frame collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L20)

<a id="constant-constant-mq3-client-playable-player-projectiles-plasma-const-plasma-weapon-plasmagun-src-mq3-client-playable-player-projectiles-ml-1783967806"></a>
### PLASMA

```ml
const PLASMA = "weapon_plasmagun"
```

Weapon classname used to select the plasma projectile profile.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L24)

<a id="function-function-mq3-client-playable-player-projectiles-pointonsegment-function-pointonsegment-startpoint-endpoint-fraction-src-mq3-client-playable-player-projectiles-ml-1699017529"></a>
### pointOnSegment

```ml
function pointOnSegment(startPoint, endPoint, fraction)
```

Builds the playable player projectiles `pointOnSegment` sequence from `[startPoint[0]+(endPoint[0]-startPoint[0])*fraction,startPoint[1]+(endPoint[1]-startPoint[1])*fraction,startPoint[2]+(endPoint[2]-startPoint[2])*fraction]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `startPoint` | `dynamic` | — | Starting world-space point of the segment or trace. |
| `endPoint` | `dynamic` | — | Ending world-space point of the segment or trace. |
| `fraction` | `dynamic` | — | Interpolation or blend fraction between the endpoint values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L217)

<a id="function-function-mq3-client-playable-player-projectiles-profile-function-profile-classname-src-mq3-client-playable-player-projectiles-ml-1421539561"></a>
### profile

```ml
function profile(classname)
```

Values mirror baseq3's fire_rocket, fire_plasma and fire_grenade.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `classname` | `dynamic` | — | Value used by `if classname==ROCKET then return Profile(classname,view.STYLE_ROCKET,900.0,15000,100,100,120.0,false,0) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L162)

- [mq3.client.playable_player_projectiles.Profile](Type-mq3-client-playable-player-projectiles-profile-1296376593.md) — struct
- [mq3.client.playable_player_projectiles.Projectile](Type-mq3-client-playable-player-projectiles-projectile-493868627.md) — struct
<a id="constant-constant-mq3-client-playable-player-projectiles-rocket-const-rocket-weapon-rocketlauncher-src-mq3-client-playable-player-projectiles-ml-802016480"></a>
### ROCKET

```ml
const ROCKET = "weapon_rocketlauncher"
```

Weapon classname used to select the rocket projectile profile.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L22)

<a id="constant-constant-mq3-client-playable-player-projectiles-shot-mask-const-shot-mask-100663297-src-mq3-client-playable-player-projectiles-ml-212960831"></a>
### SHOT_MASK

```ml
const SHOT_MASK = 100663297
```

Combined collision-content mask used when tracing a weapon shot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L12)

<a id="function-function-mq3-client-playable-player-projectiles-spawn-function-spawn-state-classname-muzzle-direction-now-src-mq3-client-playable-player-projectiles-ml-146039942"></a>
### spawn

```ml
function spawn(state, classname, muzzle, direction, now)
```

Calls `mq3.client.playable_player_projectiles.profile`, `mq3.client.playable_player_projectiles.spawnProfile` from playable player projectiles `spawn`. The final path returns `spawnProfile(state,weaponProfile,muzzle,direction,now)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared playable player projectiles state passed to the helper calls in `spawn`. |
| `classname` | `dynamic` | — | Value used by `weaponProfile=profile(classname)`. |
| `muzzle` | `dynamic` | — | Value used by `return spawnProfile(state,weaponProfile,muzzle,direction,now)`. |
| `direction` | `dynamic` | — | Direction vector used by the spatial calculation. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L200)

<a id="function-function-mq3-client-playable-player-projectiles-spawnprofile-function-spawnprofile-state-weaponprofile-muzzle-direction-now-src-mq3-client-playable-player-projectiles-ml-1542565762"></a>
### spawnProfile

```ml
function spawnProfile(state, weaponProfile, muzzle, direction, now)
```

Updates `state.nextProjectileId`, `state.projectiles` during playable player projectiles `spawnProfile`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable player projectiles record/storage; this routine assigns `state.nextProjectileId`, `state.projectiles`. |
| `weaponProfile` | `dynamic` | — | Record read through `weaponProfile.speed`, `weaponProfile.lifetime`. |
| `muzzle` | `dynamic` | — | Value used by `if state==void or weaponProfile==void or not validPoint(muzzle) or not validPoint(direction) then return fail("state, profile, muzzle and dire...`. |
| `direction` | `dynamic` | — | Direction vector used by the spatial calculation. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L183)

- [mq3.client.playable_player_projectiles.State](Type-mq3-client-playable-player-projectiles-state-1661152569.md) — struct
<a id="function-function-mq3-client-playable-player-projectiles-stependpoint-function-stependpoint-shot-milliseconds-src-mq3-client-playable-player-projectiles-ml-1381455440"></a>
### stepEndpoint

```ml
function stepEndpoint(shot, milliseconds)
```

Evaluates playable player projectiles `stepEndpoint` and returns `[shot.origin[0]+shot.velocity[0]*seconds,shot.origin[1]+shot.velocity[1]*seconds,z]` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shot` | `dynamic` | — | Record read through `shot.origin`, `shot.velocity`, `shot.profile.gravity`. |
| `milliseconds` | `dynamic` | — | Time interval in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L317)

<a id="function-function-mq3-client-playable-player-projectiles-targetfraction-function-targetfraction-targetstate-startpoint-endpoint-src-mq3-client-playable-player-projectiles-ml-932746873"></a>
### targetFraction

```ml
function targetFraction(targetState, startPoint, endPoint)
```

Calls `mq3.client.playable_targets.segmentFraction` from playable player projectiles `targetFraction`. The final path returns `[best,fraction]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `targetState` | `dynamic` | — | Record read through `targetState.targets`, `targetState.radius`, `targetState.minZ`, `targetState.maxZ`. |
| `startPoint` | `dynamic` | — | Starting world-space point of the segment or trace. |
| `endPoint` | `dynamic` | — | Ending world-space point of the segment or trace. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L225)

- [mq3.client.playable_player_projectiles.Trail](Type-mq3-client-playable-player-projectiles-trail-1669136824.md) — struct
<a id="function-function-mq3-client-playable-player-projectiles-update-function-update-world-state-targetstate-now-src-mq3-client-playable-player-projectiles-ml-1709731623"></a>
### update

```ml
function update(world, state, targetState, now)
```

Calls `mq3.client.playable_player_projectiles.updateWithTrace` from playable player projectiles `update`. The final path returns `updateWithTrace(worldPointTrace,world,state,targetState,now)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | world record passed to the playable player projectiles helper calls. |
| `state` | `dynamic` | — | Shared playable player projectiles state passed to the helper calls in `update`. |
| `targetState` | `dynamic` | — | targetState record passed to the playable player projectiles helper calls. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L401)

<a id="function-function-mq3-client-playable-player-projectiles-updatewithtrace-function-updatewithtrace-tracefn-context-state-targetstate-now-src-mq3-client-playable-player-projectiles-ml-2064425719"></a>
### updateWithTrace

```ml
function updateWithTrace(traceFn, context, state, targetState, now)
```

traceFn(context,start,end) returns the normal baseq3 trace wrapper. A BSP hit wins ties so walls shield targets. Every removed projectile emits one impact.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `traceFn` | `dynamic` | — | Collision-trace callback used to test the requested movement or visibility segment. |
| `context` | `dynamic` | — | context record passed to the playable player projectiles helper calls. |
| `state` | `dynamic` | — | Mutable playable player projectiles record/storage; this routine assigns `state.trails`, `state.impacts`, `state.projectiles`, `state.lastTime`. |
| `targetState` | `dynamic` | — | targetState record passed to the playable player projectiles helper calls. |
| `now` | `dynamic` | — | Current time used by this operation; it shares the clock domain of the compared timestamps. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L356)

<a id="function-function-mq3-client-playable-player-projectiles-validpoint-function-validpoint-value-src-mq3-client-playable-player-projectiles-ml-1959441945"></a>
### validPoint

```ml
function validPoint(value)
```

Computes `value!=void and typeof(value)=="array" and len(value)==3` for playable player projectiles `validPoint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence whose length/content is inspected by `validPoint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L155)

<a id="function-function-mq3-client-playable-player-projectiles-velocityafter-function-velocityafter-shot-milliseconds-src-mq3-client-playable-player-projectiles-ml-2049827958"></a>
### velocityAfter

```ml
function velocityAfter(shot, milliseconds)
```

Calls `mq3.client.playable_player_projectiles.copyPoint` from playable player projectiles `velocityAfter`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shot` | `dynamic` | — | Record read through `shot.velocity`, `shot.profile.gravity`. |
| `milliseconds` | `dynamic` | — | Time interval in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L327)

<a id="function-function-mq3-client-playable-player-projectiles-worldpointtrace-function-worldpointtrace-context-startpoint-endpoint-src-mq3-client-playable-player-projectiles-ml-49988592"></a>
### worldPointTrace

```ml
function worldPointTrace(context, startPoint, endPoint)
```

Adapts `mq3.collision.world.boxTrace` to playable player projectiles `worldPointTrace`, returning its result for `context, startPoint, endPoint, [0.0,0.0,0.0], [0.0,0.0,0.0], 0, SHOT_MASK, false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Argument 1 of `mq3.collision.world.boxTrace`. |
| `startPoint` | `dynamic` | — | Starting world-space point of the segment or trace. Forwarded to `mq3.collision.world.boxTrace`. |
| `endPoint` | `dynamic` | — | Ending world-space point of the segment or trace. Forwarded to `mq3.collision.world.boxTrace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/playable_player_projectiles.ml#L209)
