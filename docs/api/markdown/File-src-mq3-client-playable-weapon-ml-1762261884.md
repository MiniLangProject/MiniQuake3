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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `deltaMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L80)

<a id="function-function-mq3-client-playable-weapon-configure-function-configure-state-classname-src-mq3-client-playable-weapon-ml-898212118"></a>
### configure

```ml
function configure(state, classname)
```

Stock Baseq3 weapon timing and direct-hit damage. The playable app turns Rocket, Plasma and Grenade shots into predicted moving projectiles.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `classname` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L58)

<a id="function-function-mq3-client-playable-weapon-create-function-create-world-src-mq3-client-playable-weapon-ml-17321782"></a>
### create

```ml
function create(world)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L74)

<a id="function-function-mq3-client-playable-weapon-createwithtrace-function-createwithtrace-tracefn-context-ammo-cooldownmilliseconds-range-automatic-src-mq3-client-playable-weapon-ml-1272842135"></a>
### createWithTrace

```ml
function createWithTrace(traceFn, context, ammo, cooldownMilliseconds, range, automatic)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `traceFn` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |
| `ammo` | `dynamic` | — |  |
| `cooldownMilliseconds` | `dynamic` | — |  |
| `range` | `dynamic` | — |  |
| `automatic` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L48)

<a id="constant-constant-mq3-client-playable-weapon-default-ammo-const-default-ammo-10-src-mq3-client-playable-weapon-ml-1842450602"></a>
### DEFAULT_AMMO

```ml
const DEFAULT_AMMO = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L11)

<a id="constant-constant-mq3-client-playable-weapon-default-cooldown-milliseconds-const-default-cooldown-milliseconds-900-src-mq3-client-playable-weapon-ml-474553550"></a>
### DEFAULT_COOLDOWN_MILLISECONDS

```ml
const DEFAULT_COOLDOWN_MILLISECONDS = 900
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L12)

<a id="constant-constant-mq3-client-playable-weapon-default-range-const-default-range-8192-src-mq3-client-playable-weapon-ml-1228929809"></a>
### DEFAULT_RANGE

```ml
const DEFAULT_RANGE = 8192
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L13)

<a id="function-function-mq3-client-playable-weapon-muzzlepoint-function-muzzlepoint-camera-src-mq3-client-playable-weapon-ml-1839715509"></a>
### muzzlePoint

```ml
function muzzlePoint(camera)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L119)

<a id="function-function-mq3-client-playable-weapon-reload-function-reload-state-amount-src-mq3-client-playable-weapon-ml-93681801"></a>
### reload

```ml
function reload(state, amount)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `amount` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L135)

<a id="function-function-mq3-client-playable-weapon-shootray-function-shootray-state-startpoint-direction-src-mq3-client-playable-weapon-ml-550586722"></a>
### shootRay

```ml
function shootRay(state, startPoint, direction)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `startPoint` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L88)

- [mq3.client.playable_weapon.Shot](Type-mq3-client-playable-weapon-shot-1833206318.md) — struct
<a id="constant-constant-mq3-client-playable-weapon-shot-mask-const-shot-mask-100663297-src-mq3-client-playable-weapon-ml-1593232607"></a>
### SHOT_MASK

```ml
const SHOT_MASK = 100663297
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L10)

<a id="function-function-mq3-client-playable-weapon-step-function-step-state-camera-triggerdown-deltamilliseconds-src-mq3-client-playable-weapon-ml-654505108"></a>
### step

```ml
function step(state, camera, triggerDown, deltaMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `camera` | `dynamic` | — |  |
| `triggerDown` | `dynamic` | — |  |
| `deltaMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L129)

<a id="function-function-mq3-client-playable-weapon-stepray-function-stepray-state-startpoint-direction-triggerdown-deltamilliseconds-src-mq3-client-playable-weapon-ml-286465246"></a>
### stepRay

```ml
function stepRay(state, startPoint, direction, triggerDown, deltaMilliseconds)
```

Returns a Shot only when this frame fires. A semi-automatic weapon requires a new trigger edge; an automatic weapon repeats whenever its cooldown expires.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `startPoint` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |
| `triggerDown` | `dynamic` | — |  |
| `deltaMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L104)

<a id="function-function-mq3-client-playable-weapon-validvector-function-validvector-value-src-mq3-client-playable-weapon-ml-1135230035"></a>
### validVector

```ml
function validVector(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L44)

- [mq3.client.playable_weapon.Weapon](Type-mq3-client-playable-weapon-weapon-233817222.md) — struct
<a id="function-function-mq3-client-playable-weapon-worldpointtrace-function-worldpointtrace-state-startpoint-endpoint-src-mq3-client-playable-weapon-ml-444912590"></a>
### worldPointTrace

```ml
function worldPointTrace(state, startPoint, endPoint)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `startPoint` | `dynamic` | — |  |
| `endPoint` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_weapon.ml#L40)
