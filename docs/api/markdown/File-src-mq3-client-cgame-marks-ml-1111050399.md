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
| `state` | `dynamic` | — | Mutable client game marks record/storage; this routine assigns `state.time`. |
| `time` | `dynamic` | — | Value assigned to `state.time`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L277)

<a id="function-function-mq3-client-cgame-marks-addparticles-function-addparticles-state-time-vieworg-vforward-vright-vup-src-mq3-client-cgame-marks-ml-1072273167"></a>
### addParticles

```ml
function addParticles(state, time, vieworg, vforward, vright, vup)
```

Adapts `mq3.client.cgame_particles.addParticles` to client game marks `addParticles`, returning its result for `state, time, vieworg, vforward, vright, vup`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_particles.addParticles`. |
| `time` | `dynamic` | — | Argument 2 of `mq3.client.cgame_particles.addParticles`. |
| `vieworg` | `dynamic` | — | Argument 3 of `mq3.client.cgame_particles.addParticles`. |
| `vforward` | `dynamic` | — | Argument 4 of `mq3.client.cgame_particles.addParticles`. |
| `vright` | `dynamic` | — | Argument 5 of `mq3.client.cgame_particles.addParticles`. |
| `vup` | `dynamic` | — | Argument 6 of `mq3.client.cgame_particles.addParticles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L307)

<a id="function-function-mq3-client-cgame-marks-addparticleshrapnel-function-addparticleshrapnel-state-localentity-src-mq3-client-cgame-marks-ml-1563252627"></a>
### addParticleShrapnel

```ml
function addParticleShrapnel(state, localEntity)
```

Adapts `mq3.client.cgame_particles.addParticleShrapnel` to client game marks `addParticleShrapnel`, returning its result for `state, localEntity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_particles.addParticleShrapnel`. |
| `localEntity` | `dynamic` | — | Argument 2 of `mq3.client.cgame_particles.addParticleShrapnel`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L355)

<a id="function-function-mq3-client-cgame-marks-addparticletoscene-function-addparticletoscene-state-p-origin-alpha-src-mq3-client-cgame-marks-ml-101499437"></a>
### addParticleToScene

```ml
function addParticleToScene(state, p, origin, alpha)
```

Adapts `mq3.client.cgame_particles.addParticleToScene` to client game marks `addParticleToScene`, returning its result for `state, p, origin, alpha`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_particles.addParticleToScene`. |
| `p` | `dynamic` | — | Argument 2 of `mq3.client.cgame_particles.addParticleToScene`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_particles.addParticleToScene`. |
| `alpha` | `dynamic` | — | Opacity or blend weight used by the visual effect. Forwarded to `mq3.client.cgame_particles.addParticleToScene`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L299)

<a id="function-function-mq3-client-cgame-marks-allocmark-function-allocmark-state-src-mq3-client-cgame-marks-ml-1527259403"></a>
### allocMark

```ml
function allocMark(state)
```

CG_AllocMark -- just like Baseq3 this always succeeds.  When the pool is full every fragment born in the oldest impact batch is reclaimed together.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game marks record/storage; this routine assigns `state.evicted`, `state.free`, `state.active`, `state.allocated`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L181)

<a id="function-function-mq3-client-cgame-marks-bloodpool-function-bloodpool-state-shader-trace-tracefn-context-src-mq3-client-cgame-marks-ml-1700783901"></a>
### bloodPool

```ml
function bloodPool(state, shader, trace, traceFn, context)
```

Adapts `mq3.client.cgame_particles.bloodPool` to client game marks `bloodPool`, returning its result for `state, shader, trace, traceFn, context`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_particles.bloodPool`. |
| `shader` | `dynamic` | — | Argument 2 of `mq3.client.cgame_particles.bloodPool`. |
| `trace` | `dynamic` | — | Argument 3 of `mq3.client.cgame_particles.bloodPool`. |
| `traceFn` | `dynamic` | — | Collision-trace callback used to test the requested movement or visibility segment. Forwarded to `mq3.client.cgame_particles.bloodPool`. |
| `context` | `dynamic` | — | Argument 5 of `mq3.client.cgame_particles.bloodPool`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L404)

- [mq3.client.cgame_marks.Boundary](Type-mq3-client-cgame-marks-boundary-1491397383.md) — struct
<a id="function-function-mq3-client-cgame-marks-bytecolor-function-bytecolor-value-src-mq3-client-cgame-marks-ml-104551261"></a>
### byteColor

```ml
function byteColor(value)
```

Calls `mq3.compat.numeric.trunc32` from client game marks `byteColor`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `result=n.trunc32(value*255.0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L209)

<a id="function-function-mq3-client-cgame-marks-clearparticles-function-clearparticles-state-src-mq3-client-cgame-marks-ml-775067747"></a>
### clearParticles

```ml
function clearParticles(state)
```

The remaining 23 candidates belong to the appended cg_particles.c body. Keep one canonical particle implementation while exposing every original translation-unit entry point from this complete module.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_particles.clearParticles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L293)

<a id="function-function-mq3-client-cgame-marks-copy3-function-copy3-value-src-mq3-client-cgame-marks-ml-1641606555"></a>
### copy3

```ml
function copy3(value)
```

Copies the X, Y and Z components into a fresh client game marks vector.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence read at `value[0]`, `value[1]`, `value[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L137)

<a id="function-function-mq3-client-cgame-marks-create-function-create-capacity-retailactive-src-mq3-client-cgame-marks-ml-2039578677"></a>
### create

```ml
function create(capacity, retailActive)
```

Calls `mq3.client.cgame_marks.State`, `mq3.client.cgame_marks.initMarkPolys` from client game marks `create`. The final path returns `initMarkPolys(state)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `capacity` | `dynamic` | — | Maximum number of entries or bytes accepted by this container. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L144)

- [mq3.client.cgame_marks.Fragment](Type-mq3-client-cgame-marks-fragment-1382444093.md) — struct
<a id="function-function-mq3-client-cgame-marks-freemarkpoly-function-freemarkpoly-state-mark-src-mq3-client-cgame-marks-ml-1714804136"></a>
### freeMarkPoly

```ml
function freeMarkPoly(state, mark)
```

CG_FreeMarkPoly

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game marks record/storage; this routine assigns `state.errors`, `state.active`, `state.free`, `state.freed`. |
| `mark` | `dynamic` | — | Record read through `mark.active`, `mark.id`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L173)

<a id="function-function-mq3-client-cgame-marks-freshmark-function-freshmark-id-src-mq3-client-cgame-marks-ml-458698295"></a>
### freshMark

```ml
function freshMark(id)
```

Creates a `mq3.client.cgame_marks.Mark` record. Assigns `id` from `id`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `id` | `dynamic` | — | Value used to initialize `Mark.id`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L140)

<a id="function-function-mq3-client-cgame-marks-impactmark-function-impactmark-state-shader-origin-direction-orientation-red-green-blue-alpha-alphafade-radius-temporary-fragments-src-mq3-client-cgame-marks-ml-1463865227"></a>
### impactMark

```ml
function impactMark(state, shader, origin, direction, orientation, red, green, blue, alpha, alphaFade, radius, temporary, fragments)
```

CG_ImpactMark.  fragments carries trap_CM_MarkFragments output.  Passing void keeps a usable native fallback by submitting the unclipped source quad; production collision integrations pass clipped Fragment values here.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game marks record/storage; this routine assigns `state.errors`, `state.actions`, `state.projected`, `state.suppressed`. |
| `shader` | `dynamic` | — | Value assigned to `mark.shader`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `direction` | `dynamic` | — | Direction vector used by the spatial calculation. |
| `orientation` | `dynamic` | — | Value used by `axis2=rotateAround(axis0,axisSeed,orientation)`. |
| `red` | `dynamic` | — | Red color component. |
| `green` | `dynamic` | — | Green color component. |
| `blue` | `dynamic` | — | Blue color component. |
| `alpha` | `dynamic` | — | Opacity or blend weight used by the visual effect. |
| `alphaFade` | `dynamic` | — | Value assigned to `mark.alphaFade`. |
| `radius` | `dynamic` | — | Radius used by the spatial or visual calculation. |
| `temporary` | `dynamic` | — | Value used by `if temporary then pushBoundary(state,"poly",shader,[],[],verts,true)`. |
| `fragments` | `dynamic` | — | Sequence read at `fragments[i]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L258)

<a id="function-function-mq3-client-cgame-marks-initmarkpolys-function-initmarkpolys-state-src-mq3-client-cgame-marks-ml-444193391"></a>
### initMarkPolys

```ml
function initMarkPolys(state)
```

CG_InitMarkPolys

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game marks record/storage; this routine assigns `state.marks`, `state.free`, `state.active`, `state.actions` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L152)

<a id="function-function-mq3-client-cgame-marks-makevertex-function-makevertex-point-origin-axis1-axis2-scale-color-src-mq3-client-cgame-marks-ml-1559299856"></a>
### makeVertex

```ml
function makeVertex(point, origin, axis1, axis2, scale, color)
```

Calls `mq3.client.cgame_marks.Vertex`, `mq3.client.cgame_marks.copy3`, `mq3.shared.math.DotProduct` from client game marks `makeVertex`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — | Sequence read at `point[0]`, `point[1]`, `point[2]`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `axis1` | `dynamic` | — | Value used by `return Vertex(copy3(point),[0.5+qmath.DotProduct(delta,axis1)*scale,0.5+qmath.DotProduct(delta,axis2)*scale],[color[0],color[1],color[2],color...`. |
| `axis2` | `dynamic` | — | Value used by `return Vertex(copy3(point),[0.5+qmath.DotProduct(delta,axis1)*scale,0.5+qmath.DotProduct(delta,axis2)*scale],[color[0],color[1],color[2],color...`. |
| `scale` | `dynamic` | — | Value used by `return Vertex(copy3(point),[0.5+qmath.DotProduct(delta,axis1)*scale,0.5+qmath.DotProduct(delta,axis2)*scale],[color[0],color[1],color[2],color...`. |
| `color` | `dynamic` | — | Sequence read at `color[0]`, `color[1]`, `color[2]`, `color[3]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L217)

- [mq3.client.cgame_marks.Mark](Type-mq3-client-cgame-marks-mark-33007360.md) — struct
<a id="constant-constant-mq3-client-cgame-marks-mark-fade-time-const-mark-fade-time-1000-src-mq3-client-cgame-marks-ml-342881778"></a>
### MARK_FADE_TIME

```ml
const MARK_FADE_TIME = 1000
```

Duration in milliseconds of the final impact-mark fade-out phase.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L25)

<a id="constant-constant-mq3-client-cgame-marks-mark-total-time-const-mark-total-time-10000-src-mq3-client-cgame-marks-ml-685360688"></a>
### MARK_TOTAL_TIME

```ml
const MARK_TOTAL_TIME = 10000
```

Total lifetime in milliseconds of a persistent impact mark.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L23)

<a id="constant-constant-mq3-client-cgame-marks-max-mark-fragments-const-max-mark-fragments-128-src-mq3-client-cgame-marks-ml-1763756896"></a>
### MAX_MARK_FRAGMENTS

```ml
const MAX_MARK_FRAGMENTS = 128
```

Capacity limit for the mark fragments collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L17)

<a id="constant-constant-mq3-client-cgame-marks-max-mark-points-const-max-mark-points-384-src-mq3-client-cgame-marks-ml-638936342"></a>
### MAX_MARK_POINTS

```ml
const MAX_MARK_POINTS = 384
```

Capacity limit for the mark points collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L19)

<a id="constant-constant-mq3-client-cgame-marks-max-mark-polys-const-max-mark-polys-cgabi-max-mark-polys-src-mq3-client-cgame-marks-ml-117461503"></a>
### MAX_MARK_POLYS

```ml
const MAX_MARK_POLYS = cgabi.MAX_MARK_POLYS
```

Capacity limit for the mark polys collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L15)

<a id="constant-constant-mq3-client-cgame-marks-max-verts-on-poly-const-max-verts-on-poly-cgabi-max-verts-on-poly-src-mq3-client-cgame-marks-ml-1960360427"></a>
### MAX_VERTS_ON_POLY

```ml
const MAX_VERTS_ON_POLY = cgabi.MAX_VERTS_ON_POLY
```

Capacity limit for the verts on poly collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L21)

<a id="function-function-mq3-client-cgame-marks-newparticlearea-function-newparticlearea-state-text-shader-src-mq3-client-cgame-marks-ml-1125337903"></a>
### newParticleArea

```ml
function newParticleArea(state, text, shader)
```

Adapts `mq3.client.cgame_particles.newParticleArea` to client game marks `newParticleArea`, returning its result for `state, text, shader`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_particles.newParticleArea`. |
| `text` | `dynamic` | — | Argument 2 of `mq3.client.cgame_particles.newParticleArea`. |
| `shader` | `dynamic` | — | Argument 3 of `mq3.client.cgame_particles.newParticleArea`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L360)

<a id="function-function-mq3-client-cgame-marks-oilslickremove-function-oilslickremove-state-cent-src-mq3-client-cgame-marks-ml-1020912709"></a>
### oilSlickRemove

```ml
function oilSlickRemove(state, cent)
```

Adapts `mq3.client.cgame_particles.oilSlickRemove` to client game marks `oilSlickRemove`, returning its result for `state, cent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_particles.oilSlickRemove`. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Forwarded to `mq3.client.cgame_particles.oilSlickRemove`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L392)

<a id="function-function-mq3-client-cgame-marks-originalquad-function-originalquad-origin-axis1-axis2-radius-src-mq3-client-cgame-marks-ml-1688219129"></a>
### originalQuad

```ml
function originalQuad(origin, axis1, axis2, radius)
```

Builds the client game marks `originalQuad` sequence from `[[origin[0]-radius*axis1[0]-radius*axis2[0],origin[1]-radius*axis1[1]-radius*axis2[1],origin[2]-radius*axis1[2]-radius*axis2[2]],[origin[0]+radius*axis1[0]-radius*axis2[0],origin[1]+radius*axis1[1]...`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `axis1` | `dynamic` | — | Sequence read at `axis1[0]`, `axis1[1]`, `axis1[2]`. |
| `axis2` | `dynamic` | — | Sequence read at `axis2[0]`, `axis2[1]`, `axis2[2]`. |
| `radius` | `dynamic` | — | Radius used by the spatial or visual calculation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L238)

<a id="function-function-mq3-client-cgame-marks-particlebleed-function-particlebleed-state-shader-start-direction-fleshentitynum-duration-src-mq3-client-cgame-marks-ml-1270466370"></a>
### particleBleed

```ml
function particleBleed(state, shader, start, direction, fleshEntityNum, duration)
```

Adapts `mq3.client.cgame_particles.particleBleed` to client game marks `particleBleed`, returning its result for `state, shader, start, direction, fleshEntityNum, duration`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_particles.particleBleed`. |
| `shader` | `dynamic` | — | Argument 2 of `mq3.client.cgame_particles.particleBleed`. |
| `start` | `dynamic` | — | Argument 3 of `mq3.client.cgame_particles.particleBleed`. |
| `direction` | `dynamic` | — | Direction vector used by the spatial calculation. Forwarded to `mq3.client.cgame_particles.particleBleed`. |
| `fleshEntityNum` | `dynamic` | — | Argument 5 of `mq3.client.cgame_particles.particleBleed`. |
| `duration` | `dynamic` | — | Lifetime or interval in the same units as this operation's clock. Forwarded to `mq3.client.cgame_particles.particleBleed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L378)

<a id="function-function-mq3-client-cgame-marks-particlebloodcloud-function-particlebloodcloud-state-cent-origin-direction-smokeshader-src-mq3-client-cgame-marks-ml-639547170"></a>
### particleBloodCloud

```ml
function particleBloodCloud(state, cent, origin, direction, smokeShader)
```

Adapts `mq3.client.cgame_particles.particleBloodCloud` to client game marks `particleBloodCloud`, returning its result for `state, cent, origin, direction, smokeShader`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_particles.particleBloodCloud`. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Forwarded to `mq3.client.cgame_particles.particleBloodCloud`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_particles.particleBloodCloud`. |
| `direction` | `dynamic` | — | Direction vector used by the spatial calculation. Forwarded to `mq3.client.cgame_particles.particleBloodCloud`. |
| `smokeShader` | `dynamic` | — | Argument 5 of `mq3.client.cgame_particles.particleBloodCloud`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L411)

<a id="function-function-mq3-client-cgame-marks-particlebubble-function-particlebubble-state-shader-origin-origin2-turb-range-snum-src-mq3-client-cgame-marks-ml-1418627243"></a>
### particleBubble

```ml
function particleBubble(state, shader, origin, origin2, turb, range, snum)
```

Adapts `mq3.client.cgame_particles.particleBubble` to client game marks `particleBubble`, returning its result for `state, shader, origin, origin2, turb, range, snum`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_particles.particleBubble`. |
| `shader` | `dynamic` | — | Argument 2 of `mq3.client.cgame_particles.particleBubble`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_particles.particleBubble`. |
| `origin2` | `dynamic` | — | Second world-space endpoint of the effect. Forwarded to `mq3.client.cgame_particles.particleBubble`. |
| `turb` | `dynamic` | — | Argument 5 of `mq3.client.cgame_particles.particleBubble`. |
| `range` | `dynamic` | — | Argument 6 of `mq3.client.cgame_particles.particleBubble`. |
| `snum` | `dynamic` | — | Argument 7 of `mq3.client.cgame_particles.particleBubble`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L330)

<a id="function-function-mq3-client-cgame-marks-particlebulletdebris-function-particlebulletdebris-state-origin-velocity-duration-tracershader-src-mq3-client-cgame-marks-ml-2008561960"></a>
### particleBulletDebris

```ml
function particleBulletDebris(state, origin, velocity, duration, tracerShader)
```

Adapts `mq3.client.cgame_particles.particleBulletDebris` to client game marks `particleBulletDebris`, returning its result for `state, origin, velocity, duration, tracerShader`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_particles.particleBulletDebris`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_particles.particleBulletDebris`. |
| `velocity` | `dynamic` | — | Velocity vector used to advance or orient the effect. Forwarded to `mq3.client.cgame_particles.particleBulletDebris`. |
| `duration` | `dynamic` | — | Lifetime or interval in the same units as this operation's clock. Forwarded to `mq3.client.cgame_particles.particleBulletDebris`. |
| `tracerShader` | `dynamic` | — | Argument 5 of `mq3.client.cgame_particles.particleBulletDebris`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L342)

<a id="function-function-mq3-client-cgame-marks-particledust-function-particledust-state-cent-origin-direction-smokeshader-src-mq3-client-cgame-marks-ml-1363676746"></a>
### particleDust

```ml
function particleDust(state, cent, origin, direction, smokeShader)
```

Adapts `mq3.client.cgame_particles.particleDust` to client game marks `particleDust`, returning its result for `state, cent, origin, direction, smokeShader`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_particles.particleDust`. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Forwarded to `mq3.client.cgame_particles.particleDust`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_particles.particleDust`. |
| `direction` | `dynamic` | — | Direction vector used by the spatial calculation. Forwarded to `mq3.client.cgame_particles.particleDust`. |
| `smokeShader` | `dynamic` | — | Argument 5 of `mq3.client.cgame_particles.particleDust`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L428)

<a id="function-function-mq3-client-cgame-marks-particleexplosion-function-particleexplosion-state-animname-origin-velocity-duration-sizestart-sizeend-src-mq3-client-cgame-marks-ml-600413485"></a>
### particleExplosion

```ml
function particleExplosion(state, animName, origin, velocity, duration, sizeStart, sizeEnd)
```

Adapts `mq3.client.cgame_particles.particleExplosion` to client game marks `particleExplosion`, returning its result for `state, animName, origin, velocity, duration, sizeStart, sizeEnd`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_particles.particleExplosion`. |
| `animName` | `dynamic` | — | Argument 2 of `mq3.client.cgame_particles.particleExplosion`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_particles.particleExplosion`. |
| `velocity` | `dynamic` | — | Velocity vector used to advance or orient the effect. Forwarded to `mq3.client.cgame_particles.particleExplosion`. |
| `duration` | `dynamic` | — | Lifetime or interval in the same units as this operation's clock. Forwarded to `mq3.client.cgame_particles.particleExplosion`. |
| `sizeStart` | `dynamic` | — | Argument 6 of `mq3.client.cgame_particles.particleExplosion`. |
| `sizeEnd` | `dynamic` | — | Argument 7 of `mq3.client.cgame_particles.particleExplosion`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L351)

<a id="function-function-mq3-client-cgame-marks-particleimpactsmokepuff-function-particleimpactsmokepuff-state-shader-origin-src-mq3-client-cgame-marks-ml-39665358"></a>
### particleImpactSmokePuff

```ml
function particleImpactSmokePuff(state, shader, origin)
```

Adapts `mq3.client.cgame_particles.particleImpactSmokePuff` to client game marks `particleImpactSmokePuff`, returning its result for `state, shader, origin`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_particles.particleImpactSmokePuff`. |
| `shader` | `dynamic` | — | Argument 2 of `mq3.client.cgame_particles.particleImpactSmokePuff`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_particles.particleImpactSmokePuff`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L370)

<a id="function-function-mq3-client-cgame-marks-particlemisc-function-particlemisc-state-shader-origin-size-duration-alpha-src-mq3-client-cgame-marks-ml-601614461"></a>
### particleMisc

```ml
function particleMisc(state, shader, origin, size, duration, alpha)
```

Adapts `mq3.client.cgame_particles.particleMisc` to client game marks `particleMisc`, returning its result for `state, shader, origin, size, duration, alpha`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_particles.particleMisc`. |
| `shader` | `dynamic` | — | Argument 2 of `mq3.client.cgame_particles.particleMisc`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_particles.particleMisc`. |
| `size` | `dynamic` | — | Argument 4 of `mq3.client.cgame_particles.particleMisc`. |
| `duration` | `dynamic` | — | Lifetime or interval in the same units as this operation's clock. Forwarded to `mq3.client.cgame_particles.particleMisc`. |
| `alpha` | `dynamic` | — | Opacity or blend weight used by the visual effect. Forwarded to `mq3.client.cgame_particles.particleMisc`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L436)

<a id="function-function-mq3-client-cgame-marks-particleoilparticle-function-particleoilparticle-state-shader-cent-src-mq3-client-cgame-marks-ml-439724222"></a>
### particleOilParticle

```ml
function particleOilParticle(state, shader, cent)
```

Adapts `mq3.client.cgame_particles.particleOilParticle` to client game marks `particleOilParticle`, returning its result for `state, shader, cent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_particles.particleOilParticle`. |
| `shader` | `dynamic` | — | Argument 2 of `mq3.client.cgame_particles.particleOilParticle`. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Forwarded to `mq3.client.cgame_particles.particleOilParticle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L383)

<a id="function-function-mq3-client-cgame-marks-particleoilslick-function-particleoilslick-state-shader-cent-src-mq3-client-cgame-marks-ml-1770145438"></a>
### particleOilSlick

```ml
function particleOilSlick(state, shader, cent)
```

Adapts `mq3.client.cgame_particles.particleOilSlick` to client game marks `particleOilSlick`, returning its result for `state, shader, cent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_particles.particleOilSlick`. |
| `shader` | `dynamic` | — | Argument 2 of `mq3.client.cgame_particles.particleOilSlick`. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Forwarded to `mq3.client.cgame_particles.particleOilSlick`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L388)

<a id="function-function-mq3-client-cgame-marks-particlesmoke-function-particlesmoke-state-shader-cent-src-mq3-client-cgame-marks-ml-24332660"></a>
### particleSmoke

```ml
function particleSmoke(state, shader, cent)
```

Adapts `mq3.client.cgame_particles.particleSmoke` to client game marks `particleSmoke`, returning its result for `state, shader, cent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_particles.particleSmoke`. |
| `shader` | `dynamic` | — | Argument 2 of `mq3.client.cgame_particles.particleSmoke`. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Forwarded to `mq3.client.cgame_particles.particleSmoke`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L335)

<a id="function-function-mq3-client-cgame-marks-particlesnow-function-particlesnow-state-shader-origin-origin2-turb-range-snum-src-mq3-client-cgame-marks-ml-1384390771"></a>
### particleSnow

```ml
function particleSnow(state, shader, origin, origin2, turb, range, snum)
```

Adapts `mq3.client.cgame_particles.particleSnow` to client game marks `particleSnow`, returning its result for `state, shader, origin, origin2, turb, range, snum`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_particles.particleSnow`. |
| `shader` | `dynamic` | — | Argument 2 of `mq3.client.cgame_particles.particleSnow`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_particles.particleSnow`. |
| `origin2` | `dynamic` | — | Second world-space endpoint of the effect. Forwarded to `mq3.client.cgame_particles.particleSnow`. |
| `turb` | `dynamic` | — | Argument 5 of `mq3.client.cgame_particles.particleSnow`. |
| `range` | `dynamic` | — | Argument 6 of `mq3.client.cgame_particles.particleSnow`. |
| `snum` | `dynamic` | — | Argument 7 of `mq3.client.cgame_particles.particleSnow`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L321)

<a id="function-function-mq3-client-cgame-marks-particlesnowflurry-function-particlesnowflurry-state-shader-cent-src-mq3-client-cgame-marks-ml-1398724186"></a>
### particleSnowFlurry

```ml
function particleSnowFlurry(state, shader, cent)
```

Adapts `mq3.client.cgame_particles.particleSnowFlurry` to client game marks `particleSnowFlurry`, returning its result for `state, shader, cent`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_particles.particleSnowFlurry`. |
| `shader` | `dynamic` | — | Argument 2 of `mq3.client.cgame_particles.particleSnowFlurry`. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Forwarded to `mq3.client.cgame_particles.particleSnowFlurry`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L312)

<a id="function-function-mq3-client-cgame-marks-particlesparks-function-particlesparks-state-origin-velocity-duration-x-y-speed-tracershader-src-mq3-client-cgame-marks-ml-1074479072"></a>
### particleSparks

```ml
function particleSparks(state, origin, velocity, duration, x, y, speed, tracerShader)
```

Adapts `mq3.client.cgame_particles.particleSparks` to client game marks `particleSparks`, returning its result for `state, origin, velocity, duration, x, y, speed, tracerShader`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_particles.particleSparks`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_particles.particleSparks`. |
| `velocity` | `dynamic` | — | Velocity vector used to advance or orient the effect. Forwarded to `mq3.client.cgame_particles.particleSparks`. |
| `duration` | `dynamic` | — | Lifetime or interval in the same units as this operation's clock. Forwarded to `mq3.client.cgame_particles.particleSparks`. |
| `x` | `dynamic` | — | Argument 5 of `mq3.client.cgame_particles.particleSparks`. |
| `y` | `dynamic` | — | Argument 6 of `mq3.client.cgame_particles.particleSparks`. |
| `speed` | `dynamic` | — | Argument 7 of `mq3.client.cgame_particles.particleSparks`. |
| `tracerShader` | `dynamic` | — | Argument 8 of `mq3.client.cgame_particles.particleSparks`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L421)

<a id="function-function-mq3-client-cgame-marks-perpendicular-function-perpendicular-normal-src-mq3-client-cgame-marks-ml-2041478783"></a>
### perpendicular

```ml
function perpendicular(normal)
```

Calls `mq3.shared.math.DotProduct`, `mq3.shared.math.VectorNormalize` from client game marks `perpendicular`. The final path returns `dst`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — | Surface-normal vector used to orient or offset the effect. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L194)

<a id="constant-constant-mq3-client-cgame-marks-pi-const-pi-3-141593-src-mq3-client-cgame-marks-ml-1226751147"></a>
### PI

```ml
const PI = 3.141593
```

Circle constant used to convert or evaluate angles in trigonometric calculations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L27)

<a id="function-function-mq3-client-cgame-marks-pushboundary-function-pushboundary-state-kind-shader-points-projection-vertices-temporary-src-mq3-client-cgame-marks-ml-520064652"></a>
### pushBoundary

```ml
function pushBoundary(state, kind, shader, points, projection, vertices, temporary)
```

Appends a client game marks action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game marks record/storage; this routine assigns `state.actions`, `state.rendered`, `state.suppressed`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |
| `points` | `dynamic` | — | Value used by `value=Boundary("cgame-marks",kind,shader,points,projection,vertices,dispatched,temporary)`. |
| `projection` | `dynamic` | — | Projection parameters used to convert camera-space geometry to screen coordinates. |
| `vertices` | `dynamic` | — | Value used by `value=Boundary("cgame-marks",kind,shader,points,projection,vertices,dispatched,temporary)`. |
| `temporary` | `dynamic` | — | Value used by `value=Boundary("cgame-marks",kind,shader,points,projection,vertices,dispatched,temporary)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L229)

<a id="function-function-mq3-client-cgame-marks-removeid-function-removeid-values-id-src-mq3-client-cgame-marks-ml-962294783"></a>
### removeId

```ml
function removeId(values, id)
```

Evaluates client game marks `removeId` and returns `result` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Value used by `for each value in values if value!=id then result=result+[value] end if end for`. |
| `id` | `dynamic` | — | Value used by `for each value in values if value!=id then result=result+[value] end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L161)

<a id="function-function-mq3-client-cgame-marks-resetmark-function-resetmark-mark-src-mq3-client-cgame-marks-ml-1340764093"></a>
### resetMark

```ml
function resetMark(mark)
```

Updates `mark.active`, `mark.time`, `mark.alphaFade`, `mark.shader` and additional values during client game marks `resetMark`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mark` | `dynamic` | — | Mutable client game marks record/storage; this routine assigns `mark.active`, `mark.time`, `mark.alphaFade`, `mark.shader` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L166)

<a id="function-function-mq3-client-cgame-marks-rotatearound-function-rotatearound-axis-point-degrees-src-mq3-client-cgame-marks-ml-2128439048"></a>
### rotateAround

```ml
function rotateAround(axis, point, degrees)
```

Calls `mq3.compat.transcendental.cos`, `mq3.compat.transcendental.sin`, `mq3.shared.math.CrossProduct` and additional helpers from client game marks `rotateAround`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `axis` | `dynamic` | — | Sequence read at `axis[0]`, `axis[1]`, `axis[2]`. |
| `point` | `dynamic` | — | Sequence read at `point[0]`, `point[1]`, `point[2]`. |
| `degrees` | `dynamic` | — | Value used by `radians=degrees*PI/180.0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L203)

<a id="function-function-mq3-client-cgame-marks-snowlink-function-snowlink-state-id-particleon-src-mq3-client-cgame-marks-ml-753203685"></a>
### snowLink

```ml
function snowLink(state, id, particleOn)
```

Adapts `mq3.client.cgame_particles.snowLink` to client game marks `snowLink`, returning its result for `state, id, particleOn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_particles.snowLink`. |
| `id` | `dynamic` | — | Argument 2 of `mq3.client.cgame_particles.snowLink`. |
| `particleOn` | `dynamic` | — | Argument 3 of `mq3.client.cgame_particles.snowLink`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L365)

- [mq3.client.cgame_marks.State](Type-mq3-client-cgame-marks-state-2119626966.md) — struct
<a id="function-function-mq3-client-cgame-marks-validbloodpool-function-validbloodpool-start-tracefn-context-src-mq3-client-cgame-marks-ml-1432160332"></a>
### validBloodPool

```ml
function validBloodPool(start, traceFn, context)
```

Adapts `mq3.client.cgame_particles.validBloodPool` to client game marks `validBloodPool`, returning its result for `start, traceFn, context`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — | Argument 1 of `mq3.client.cgame_particles.validBloodPool`. |
| `traceFn` | `dynamic` | — | Collision-trace callback used to test the requested movement or visibility segment. Forwarded to `mq3.client.cgame_particles.validBloodPool`. |
| `context` | `dynamic` | — | Argument 3 of `mq3.client.cgame_particles.validBloodPool`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L397)

- [mq3.client.cgame_marks.Vertex](Type-mq3-client-cgame-marks-vertex-192929799.md) — struct
<a id="function-function-mq3-client-cgame-marks-zero3-function-zero3-src-mq3-client-cgame-marks-ml-427725364"></a>
### zero3

```ml
function zero3()
```

Creates a three-component zero vector for client game marks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_marks.ml#L134)
