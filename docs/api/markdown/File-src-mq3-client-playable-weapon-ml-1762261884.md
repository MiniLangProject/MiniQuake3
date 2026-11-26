# `src/mq3/client/playable_weapon.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_weapon`](Package-mq3-client-playable-weapon-956329500.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/playable_viewer.ml` as `viewer` → [src/mq3/client/playable_viewer.ml](File-src-mq3-client-playable-viewer-ml-2126962810.md)
- `mq3/collision/world.ml` as `collision` → [src/mq3/collision/world.ml](File-src-mq3-collision-world-ml-863162236.md)
- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-client-playable-weapon-advance-function-advance-state-deltamilliseconds-src-mq3-client-playable-weapon-ml-1891270811"></a>
### advance

```ml
function advance(state, deltaMilliseconds)
```

Updates `state.cooldownRemaining` during playable weapon `advance`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable weapon record/storage; this routine assigns `state.cooldownRemaining`. |
| `deltaMilliseconds` | `dynamic` | — | Elapsed simulation interval in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L126)

<a id="function-function-mq3-client-playable-weapon-configure-function-configure-state-classname-src-mq3-client-playable-weapon-ml-898212118"></a>
### configure

```ml
function configure(state, classname)
```

Stock Baseq3 weapon timing and direct-hit damage. The playable app turns Rocket, Plasma and Grenade shots into predicted moving projectiles.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable weapon record/storage; this routine assigns `state.cooldownMilliseconds`, `state.automatic`, `state.damage`, `state.range` and additional values. |
| `classname` | `dynamic` | — | Value assigned to `state.classname`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L99)

<a id="function-function-mq3-client-playable-weapon-create-function-create-world-src-mq3-client-playable-weapon-ml-17321782"></a>
### create

```ml
function create(world)
```

Calls `mq3.client.playable_weapon.createWithTrace`, `mq3.client.playable_weapon.configure` from playable weapon `create`. The final path returns `configure(state,"weapon_machinegun")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | world record passed to the playable weapon helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L117)

<a id="function-function-mq3-client-playable-weapon-createwithtrace-function-createwithtrace-tracefn-context-ammo-cooldownmilliseconds-range-automatic-src-mq3-client-playable-weapon-ml-1272842135"></a>
### createWithTrace

```ml
function createWithTrace(traceFn, context, ammo, cooldownMilliseconds, range, automatic)
```

Calls `mq3.client.playable_weapon.Weapon`, `mq3.compat.numeric.f32` from playable weapon `createWithTrace`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `traceFn` | `dynamic` | — | Collision-trace callback used to test the requested movement or visibility segment. |
| `context` | `dynamic` | — | context record passed to the playable weapon helper calls. |
| `ammo` | `dynamic` | — | Value used by `if ammo<0 then return error(7501,"playable weapon ammo cannot be negative") end if`. |
| `cooldownMilliseconds` | `dynamic` | — | Value used by `if cooldownMilliseconds<0 then return error(7502,"playable weapon cooldown cannot be negative") end if`. |
| `range` | `dynamic` | — | Value used by `if range<=0.0 then return error(7503,"playable weapon range must be positive") end if`. |
| `automatic` | `dynamic` | — | Value used by `return Weapon(traceFn,context,ammo,ammo,cooldownMilliseconds,0,numeric.f32(range),automatic,false,0,"weapon_machinegun",34,false)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L87)

<a id="constant-constant-mq3-client-playable-weapon-default-ammo-const-default-ammo-10-src-mq3-client-playable-weapon-ml-1842450602"></a>
### DEFAULT_AMMO

```ml
const DEFAULT_AMMO = 10
```

Fallback ammo setting used when constructing the native client simulation or effect configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L13)

<a id="constant-constant-mq3-client-playable-weapon-default-cooldown-milliseconds-const-default-cooldown-milliseconds-900-src-mq3-client-playable-weapon-ml-474553550"></a>
### DEFAULT_COOLDOWN_MILLISECONDS

```ml
const DEFAULT_COOLDOWN_MILLISECONDS = 900
```

Default cooldown duration in milliseconds when the caller supplies no override.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L15)

<a id="constant-constant-mq3-client-playable-weapon-default-range-const-default-range-8192-src-mq3-client-playable-weapon-ml-1228929809"></a>
### DEFAULT_RANGE

```ml
const DEFAULT_RANGE = 8192
```

Fallback range setting used when constructing the native client simulation or effect configuration.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L17)

<a id="function-function-mq3-client-playable-weapon-muzzlepoint-function-muzzlepoint-camera-src-mq3-client-playable-weapon-ml-1839715509"></a>
### muzzlePoint

```ml
function muzzlePoint(camera)
```

Calls `mq3.client.playable_viewer.cameraBasis`, `mq3.shared.math.VectorMA`, `mq3.compat.numeric.trunc32` from playable weapon `muzzlePoint`. The final path returns `muzzle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. Record read through `camera.position`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L176)

<a id="function-function-mq3-client-playable-weapon-reload-function-reload-state-amount-src-mq3-client-playable-weapon-ml-93681801"></a>
### reload

```ml
function reload(state, amount)
```

Updates `state.ammo` during playable weapon `reload`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable weapon record/storage; this routine assigns `state.ammo`. |
| `amount` | `dynamic` | — | Value tested by `state==void or amount<0` before the calculation continues. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L200)

<a id="function-function-mq3-client-playable-weapon-shootray-function-shootray-state-startpoint-direction-src-mq3-client-playable-weapon-ml-550586722"></a>
### shootRay

```ml
function shootRay(state, startPoint, direction)
```

Calls `mq3.client.playable_weapon.validVector`, `mq3.compat.numeric.f32`, `mq3.shared.math.VectorNormalize` and additional helpers from playable weapon `shootRay`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.range`, `state.traceFn`. |
| `startPoint` | `dynamic` | — | Starting world-space point of the segment or trace. |
| `direction` | `dynamic` | — | Direction vector used by the spatial calculation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L138)

- [mq3.client.playable_weapon.Shot](Type-mq3-client-playable-weapon-shot-1833206318.md) — struct
<a id="constant-constant-mq3-client-playable-weapon-shot-mask-const-shot-mask-100663297-src-mq3-client-playable-weapon-ml-1593232607"></a>
### SHOT_MASK

```ml
const SHOT_MASK = 100663297
```

Combined collision-content mask used when tracing a weapon shot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L11)

<a id="function-function-mq3-client-playable-weapon-step-function-step-state-camera-triggerdown-deltamilliseconds-src-mq3-client-playable-weapon-ml-654505108"></a>
### step

```ml
function step(state, camera, triggerDown, deltaMilliseconds)
```

Calls `mq3.client.playable_weapon.muzzlePoint`, `mq3.client.playable_viewer.cameraBasis`, `mq3.client.playable_weapon.stepRay` from playable weapon `step`. The final path returns `stepRay(state,muzzle,basis[0],triggerDown,deltaMilliseconds)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared playable weapon state passed to the helper calls in `step`. |
| `camera` | `dynamic` | — | Camera state used to transform/project the scene. |
| `triggerDown` | `dynamic` | — | Value used by `return stepRay(state,muzzle,basis[0],triggerDown,deltaMilliseconds)`. |
| `deltaMilliseconds` | `dynamic` | — | Elapsed simulation interval in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L191)

<a id="function-function-mq3-client-playable-weapon-stepray-function-stepray-state-startpoint-direction-triggerdown-deltamilliseconds-src-mq3-client-playable-weapon-ml-286465246"></a>
### stepRay

```ml
function stepRay(state, startPoint, direction, triggerDown, deltaMilliseconds)
```

Returns a Shot only when this frame fires. A semi-automatic weapon requires a new trigger edge; an automatic weapon repeats whenever its cooldown expires.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable playable weapon record/storage; this routine assigns `state.noAmmoEvent`, `state.triggerHeld`, `state.cooldownRemaining`, `state.ammo` and additional values. |
| `startPoint` | `dynamic` | — | Starting world-space point of the segment or trace. |
| `direction` | `dynamic` | — | Direction vector used by the spatial calculation. |
| `triggerDown` | `dynamic` | — | Value assigned to `state.triggerHeld`. |
| `deltaMilliseconds` | `dynamic` | — | Elapsed simulation interval in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L159)

<a id="function-function-mq3-client-playable-weapon-validvector-function-validvector-value-src-mq3-client-playable-weapon-ml-1135230035"></a>
### validVector

```ml
function validVector(value)
```

Computes `typeof(value)=="array" and len(value)==3` for playable weapon `validVector`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence whose length/content is inspected by `validVector`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L76)

- [mq3.client.playable_weapon.Weapon](Type-mq3-client-playable-weapon-weapon-233817222.md) — struct
<a id="function-function-mq3-client-playable-weapon-worldpointtrace-function-worldpointtrace-state-startpoint-endpoint-src-mq3-client-playable-weapon-ml-444912590"></a>
### worldPointTrace

```ml
function worldPointTrace(state, startPoint, endPoint)
```

Adapts `mq3.collision.world.boxTrace` to playable weapon `worldPointTrace`, returning its result for `state.context, startPoint, endPoint, [0.0,0.0,0.0], [0.0,0.0,0.0], 0, SHOT_MASK, false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.context`. |
| `startPoint` | `dynamic` | — | Starting world-space point of the segment or trace. Forwarded to `mq3.collision.world.boxTrace`. |
| `endPoint` | `dynamic` | — | Ending world-space point of the segment or trace. Forwarded to `mq3.collision.world.boxTrace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L70)
