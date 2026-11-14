# `src/mq3/client/cgame_marks.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cgame_marks`](Package-mq3-client-cgame-marks-1734931497.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/cg_local.ml` as `cgabi` → [src/mq3/client/cg_local.ml](File-src-mq3-client-cg-local-ml-909335699.md)
- `mq3/client/cgame_particles.ml` as `particles` → [src/mq3/client/cgame_particles.ml](File-src-mq3-client-cgame-particles-ml-1614063868.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-client-cgame-marks-addmarks-function-addmarks-state-time-src-mq3-client-cgame-marks-ml-1955960808"></a>
### addMarks

```ml
function addMarks(state, time)
```

CG_AddMarks

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L114)

<a id="function-function-mq3-client-cgame-marks-addparticles-function-addparticles-state-time-vieworg-vforward-vright-vup-src-mq3-client-cgame-marks-ml-1072273167"></a>
### addParticles

```ml
function addParticles(state, time, vieworg, vforward, vright, vup)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `vieworg` | `dynamic` | — |  |
| `vforward` | `dynamic` | — |  |
| `vright` | `dynamic` | — |  |
| `vup` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L131)

<a id="function-function-mq3-client-cgame-marks-addparticleshrapnel-function-addparticleshrapnel-state-localentity-src-mq3-client-cgame-marks-ml-1563252627"></a>
### addParticleShrapnel

```ml
function addParticleShrapnel(state, localEntity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `localEntity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L138)

<a id="function-function-mq3-client-cgame-marks-addparticletoscene-function-addparticletoscene-state-p-origin-alpha-src-mq3-client-cgame-marks-ml-101499437"></a>
### addParticleToScene

```ml
function addParticleToScene(state, p, origin, alpha)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `p` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `alpha` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L130)

<a id="function-function-mq3-client-cgame-marks-allocmark-function-allocmark-state-src-mq3-client-cgame-marks-ml-1527259403"></a>
### allocMark

```ml
function allocMark(state)
```

CG_AllocMark -- just like Baseq3 this always succeeds.  When the pool is full every fragment born in the oldest impact batch is reclaimed together.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L61)

<a id="function-function-mq3-client-cgame-marks-bloodpool-function-bloodpool-state-shader-trace-tracefn-context-src-mq3-client-cgame-marks-ml-1700783901"></a>
### bloodPool

```ml
function bloodPool(state, shader, trace, traceFn, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |
| `traceFn` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L147)

- [mq3.client.cgame_marks.Boundary](Type-mq3-client-cgame-marks-boundary-1491397383.md) — struct
<a id="function-function-mq3-client-cgame-marks-bytecolor-function-bytecolor-value-src-mq3-client-cgame-marks-ml-104551261"></a>
### byteColor

```ml
function byteColor(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L81)

<a id="function-function-mq3-client-cgame-marks-clearparticles-function-clearparticles-state-src-mq3-client-cgame-marks-ml-775067747"></a>
### clearParticles

```ml
function clearParticles(state)
```

The remaining 23 candidates belong to the appended cg_particles.c body. Keep one canonical particle implementation while exposing every original translation-unit entry point from this complete module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L129)

<a id="function-function-mq3-client-cgame-marks-copy3-function-copy3-value-src-mq3-client-cgame-marks-ml-1641606555"></a>
### copy3

```ml
function copy3(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L31)

<a id="function-function-mq3-client-cgame-marks-create-function-create-capacity-retailactive-src-mq3-client-cgame-marks-ml-2039578677"></a>
### create

```ml
function create(capacity, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `capacity` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L33)

- [mq3.client.cgame_marks.Fragment](Type-mq3-client-cgame-marks-fragment-1382444093.md) — struct
<a id="function-function-mq3-client-cgame-marks-freemarkpoly-function-freemarkpoly-state-mark-src-mq3-client-cgame-marks-ml-1714804136"></a>
### freeMarkPoly

```ml
function freeMarkPoly(state, mark)
```

CG_FreeMarkPoly

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `mark` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L54)

<a id="function-function-mq3-client-cgame-marks-freshmark-function-freshmark-id-src-mq3-client-cgame-marks-ml-458698295"></a>
### freshMark

```ml
function freshMark(id)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `id` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L32)

<a id="function-function-mq3-client-cgame-marks-impactmark-function-impactmark-state-shader-origin-direction-orientation-red-green-blue-alpha-alphafade-radius-temporary-fragments-src-mq3-client-cgame-marks-ml-1463865227"></a>
### impactMark

```ml
function impactMark(state, shader, origin, direction, orientation, red, green, blue, alpha, alphaFade, radius, temporary, fragments)
```

CG_ImpactMark.  fragments carries trap_CM_MarkFragments output.  Passing void keeps a usable native fallback by submitting the unclipped source quad; production collision integrations pass clipped Fragment values here.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |
| `orientation` | `dynamic` | — |  |
| `red` | `dynamic` | — |  |
| `green` | `dynamic` | — |  |
| `blue` | `dynamic` | — |  |
| `alpha` | `dynamic` | — |  |
| `alphaFade` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `temporary` | `dynamic` | — |  |
| `fragments` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L97)

<a id="function-function-mq3-client-cgame-marks-initmarkpolys-function-initmarkpolys-state-src-mq3-client-cgame-marks-ml-444193391"></a>
### initMarkPolys

```ml
function initMarkPolys(state)
```

CG_InitMarkPolys

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L40)

<a id="function-function-mq3-client-cgame-marks-makevertex-function-makevertex-point-origin-axis1-axis2-scale-color-src-mq3-client-cgame-marks-ml-1559299856"></a>
### makeVertex

```ml
function makeVertex(point, origin, axis1, axis2, scale, color)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `axis1` | `dynamic` | — |  |
| `axis2` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L82)

- [mq3.client.cgame_marks.Mark](Type-mq3-client-cgame-marks-mark-33007360.md) — struct
<a id="constant-constant-mq3-client-cgame-marks-mark-fade-time-const-mark-fade-time-1000-src-mq3-client-cgame-marks-ml-342881778"></a>
### MARK_FADE_TIME

```ml
const MARK_FADE_TIME = 1000
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L19)

<a id="constant-constant-mq3-client-cgame-marks-mark-total-time-const-mark-total-time-10000-src-mq3-client-cgame-marks-ml-685360688"></a>
### MARK_TOTAL_TIME

```ml
const MARK_TOTAL_TIME = 10000
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L18)

<a id="constant-constant-mq3-client-cgame-marks-max-mark-fragments-const-max-mark-fragments-128-src-mq3-client-cgame-marks-ml-1763756896"></a>
### MAX_MARK_FRAGMENTS

```ml
const MAX_MARK_FRAGMENTS = 128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L15)

<a id="constant-constant-mq3-client-cgame-marks-max-mark-points-const-max-mark-points-384-src-mq3-client-cgame-marks-ml-638936342"></a>
### MAX_MARK_POINTS

```ml
const MAX_MARK_POINTS = 384
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L16)

<a id="constant-constant-mq3-client-cgame-marks-max-mark-polys-const-max-mark-polys-cgabi-max-mark-polys-src-mq3-client-cgame-marks-ml-117461503"></a>
### MAX_MARK_POLYS

```ml
const MAX_MARK_POLYS = cgabi.MAX_MARK_POLYS
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L14)

<a id="constant-constant-mq3-client-cgame-marks-max-verts-on-poly-const-max-verts-on-poly-cgabi-max-verts-on-poly-src-mq3-client-cgame-marks-ml-1960360427"></a>
### MAX_VERTS_ON_POLY

```ml
const MAX_VERTS_ON_POLY = cgabi.MAX_VERTS_ON_POLY
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L17)

<a id="function-function-mq3-client-cgame-marks-newparticlearea-function-newparticlearea-state-text-shader-src-mq3-client-cgame-marks-ml-1125337903"></a>
### newParticleArea

```ml
function newParticleArea(state, text, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L139)

<a id="function-function-mq3-client-cgame-marks-oilslickremove-function-oilslickremove-state-cent-src-mq3-client-cgame-marks-ml-1020912709"></a>
### oilSlickRemove

```ml
function oilSlickRemove(state, cent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L145)

<a id="function-function-mq3-client-cgame-marks-originalquad-function-originalquad-origin-axis1-axis2-radius-src-mq3-client-cgame-marks-ml-1688219129"></a>
### originalQuad

```ml
function originalQuad(origin, axis1, axis2, radius)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `axis1` | `dynamic` | — |  |
| `axis2` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L90)

<a id="function-function-mq3-client-cgame-marks-particlebleed-function-particlebleed-state-shader-start-direction-fleshentitynum-duration-src-mq3-client-cgame-marks-ml-1270466370"></a>
### particleBleed

```ml
function particleBleed(state, shader, start, direction, fleshEntityNum, duration)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |
| `fleshEntityNum` | `dynamic` | — |  |
| `duration` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L142)

<a id="function-function-mq3-client-cgame-marks-particlebloodcloud-function-particlebloodcloud-state-cent-origin-direction-smokeshader-src-mq3-client-cgame-marks-ml-639547170"></a>
### particleBloodCloud

```ml
function particleBloodCloud(state, cent, origin, direction, smokeShader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |
| `smokeShader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L148)

<a id="function-function-mq3-client-cgame-marks-particlebubble-function-particlebubble-state-shader-origin-origin2-turb-range-snum-src-mq3-client-cgame-marks-ml-1418627243"></a>
### particleBubble

```ml
function particleBubble(state, shader, origin, origin2, turb, range, snum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `origin2` | `dynamic` | — |  |
| `turb` | `dynamic` | — |  |
| `range` | `dynamic` | — |  |
| `snum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L134)

<a id="function-function-mq3-client-cgame-marks-particlebulletdebris-function-particlebulletdebris-state-origin-velocity-duration-tracershader-src-mq3-client-cgame-marks-ml-2008561960"></a>
### particleBulletDebris

```ml
function particleBulletDebris(state, origin, velocity, duration, tracerShader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |
| `duration` | `dynamic` | — |  |
| `tracerShader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L136)

<a id="function-function-mq3-client-cgame-marks-particledust-function-particledust-state-cent-origin-direction-smokeshader-src-mq3-client-cgame-marks-ml-1363676746"></a>
### particleDust

```ml
function particleDust(state, cent, origin, direction, smokeShader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |
| `smokeShader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L150)

<a id="function-function-mq3-client-cgame-marks-particleexplosion-function-particleexplosion-state-animname-origin-velocity-duration-sizestart-sizeend-src-mq3-client-cgame-marks-ml-600413485"></a>
### particleExplosion

```ml
function particleExplosion(state, animName, origin, velocity, duration, sizeStart, sizeEnd)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `animName` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |
| `duration` | `dynamic` | — |  |
| `sizeStart` | `dynamic` | — |  |
| `sizeEnd` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L137)

<a id="function-function-mq3-client-cgame-marks-particleimpactsmokepuff-function-particleimpactsmokepuff-state-shader-origin-src-mq3-client-cgame-marks-ml-39665358"></a>
### particleImpactSmokePuff

```ml
function particleImpactSmokePuff(state, shader, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L141)

<a id="function-function-mq3-client-cgame-marks-particlemisc-function-particlemisc-state-shader-origin-size-duration-alpha-src-mq3-client-cgame-marks-ml-601614461"></a>
### particleMisc

```ml
function particleMisc(state, shader, origin, size, duration, alpha)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `duration` | `dynamic` | — |  |
| `alpha` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L151)

<a id="function-function-mq3-client-cgame-marks-particleoilparticle-function-particleoilparticle-state-shader-cent-src-mq3-client-cgame-marks-ml-439724222"></a>
### particleOilParticle

```ml
function particleOilParticle(state, shader, cent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L143)

<a id="function-function-mq3-client-cgame-marks-particleoilslick-function-particleoilslick-state-shader-cent-src-mq3-client-cgame-marks-ml-1770145438"></a>
### particleOilSlick

```ml
function particleOilSlick(state, shader, cent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L144)

<a id="function-function-mq3-client-cgame-marks-particlesmoke-function-particlesmoke-state-shader-cent-src-mq3-client-cgame-marks-ml-24332660"></a>
### particleSmoke

```ml
function particleSmoke(state, shader, cent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L135)

<a id="function-function-mq3-client-cgame-marks-particlesnow-function-particlesnow-state-shader-origin-origin2-turb-range-snum-src-mq3-client-cgame-marks-ml-1384390771"></a>
### particleSnow

```ml
function particleSnow(state, shader, origin, origin2, turb, range, snum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `origin2` | `dynamic` | — |  |
| `turb` | `dynamic` | — |  |
| `range` | `dynamic` | — |  |
| `snum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L133)

<a id="function-function-mq3-client-cgame-marks-particlesnowflurry-function-particlesnowflurry-state-shader-cent-src-mq3-client-cgame-marks-ml-1398724186"></a>
### particleSnowFlurry

```ml
function particleSnowFlurry(state, shader, cent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L132)

<a id="function-function-mq3-client-cgame-marks-particlesparks-function-particlesparks-state-origin-velocity-duration-x-y-speed-tracershader-src-mq3-client-cgame-marks-ml-1074479072"></a>
### particleSparks

```ml
function particleSparks(state, origin, velocity, duration, x, y, speed, tracerShader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |
| `duration` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `speed` | `dynamic` | — |  |
| `tracerShader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L149)

<a id="function-function-mq3-client-cgame-marks-perpendicular-function-perpendicular-normal-src-mq3-client-cgame-marks-ml-2041478783"></a>
### perpendicular

```ml
function perpendicular(normal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L72)

<a id="constant-constant-mq3-client-cgame-marks-pi-const-pi-3-14159265358979-src-mq3-client-cgame-marks-ml-1387992238"></a>
### PI

```ml
const PI = 3.14159265358979
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L20)

<a id="function-function-mq3-client-cgame-marks-pushboundary-function-pushboundary-state-kind-shader-points-projection-vertices-temporary-src-mq3-client-cgame-marks-ml-520064652"></a>
### pushBoundary

```ml
function pushBoundary(state, kind, shader, points, projection, vertices, temporary)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `points` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `vertices` | `dynamic` | — |  |
| `temporary` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L86)

<a id="function-function-mq3-client-cgame-marks-removeid-function-removeid-values-id-src-mq3-client-cgame-marks-ml-962294783"></a>
### removeId

```ml
function removeId(values, id)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L46)

<a id="function-function-mq3-client-cgame-marks-resetmark-function-resetmark-mark-src-mq3-client-cgame-marks-ml-1340764093"></a>
### resetMark

```ml
function resetMark(mark)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mark` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L49)

<a id="function-function-mq3-client-cgame-marks-rotatearound-function-rotatearound-axis-point-degrees-src-mq3-client-cgame-marks-ml-2128439048"></a>
### rotateAround

```ml
function rotateAround(axis, point, degrees)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `axis` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `degrees` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L77)

<a id="function-function-mq3-client-cgame-marks-snowlink-function-snowlink-state-id-particleon-src-mq3-client-cgame-marks-ml-753203685"></a>
### snowLink

```ml
function snowLink(state, id, particleOn)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `particleOn` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L140)

- [mq3.client.cgame_marks.State](Type-mq3-client-cgame-marks-state-2119626966.md) — struct
<a id="function-function-mq3-client-cgame-marks-validbloodpool-function-validbloodpool-start-tracefn-context-src-mq3-client-cgame-marks-ml-1432160332"></a>
### validBloodPool

```ml
function validBloodPool(start, traceFn, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — |  |
| `traceFn` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L146)

- [mq3.client.cgame_marks.Vertex](Type-mq3-client-cgame-marks-vertex-192929799.md) — struct
<a id="function-function-mq3-client-cgame-marks-zero3-function-zero3-src-mq3-client-cgame-marks-ml-427725364"></a>
### zero3

```ml
function zero3()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cgame_marks.ml#L30)
