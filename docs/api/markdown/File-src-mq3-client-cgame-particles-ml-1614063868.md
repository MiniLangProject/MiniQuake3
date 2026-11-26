# `src/mq3/client/cgame_particles.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cgame_particles`](Package-mq3-client-cgame-particles-1481782820.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-cgame-particles-action-function-action-state-kind-p-shader-vertices-origin-width-height-alpha-color-frame-src-mq3-client-cgame-particles-ml-2123518690"></a>
### action

```ml
function action(state, kind, p, shader, vertices, origin, width, height, alpha, color, frame)
```

Appends a client game particles action record to the queued engine requests. Retail-QVM ownership suppresses its dispatch flag.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game particles record/storage; this routine assigns `state.actions`, `state.rendered`, `state.suppressed`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `p` | `dynamic` | — | Record read through `p.id`. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |
| `vertices` | `dynamic` | — | Sequence whose length/content is inspected by `action`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `width` | `dynamic` | — | Width in the coordinate space used by `action`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `action`. |
| `alpha` | `dynamic` | — | Opacity or blend weight used by the visual effect. |
| `color` | `dynamic` | — | Color value used by the client game particles drawing or interpolation operation. |
| `frame` | `dynamic` | — | Value used by `value=RenderAction("render",kind,p.id,shader,len(vertices),vertices,texcoords,copy3(origin),width,height,alpha,color,frame,not state.retailAct...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L308)

<a id="function-function-mq3-client-cgame-particles-addparticles-function-addparticles-state-time-vieworg-vforward-vright-vup-src-mq3-client-cgame-particles-ml-1111548353"></a>
### addParticles

```ml
function addParticles(state, time, vieworg, vforward, vright, vup)
```

CG_AddParticles

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game particles record/storage; this routine assigns `state.time`, `state.vieworg`, `state.vforward`, `state.vright` and additional values. |
| `time` | `dynamic` | — | Value assigned to `state.time`. |
| `vieworg` | `dynamic` | — | Value used by `state.vieworg=copy3(vieworg)`. |
| `vforward` | `dynamic` | — | Value used by `state.vforward=copy3(vforward)`. |
| `vright` | `dynamic` | — | Value used by `state.vright=copy3(vright)`. |
| `vup` | `dynamic` | — | Value used by `state.vup=copy3(vup)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L422)

<a id="function-function-mq3-client-cgame-particles-addparticleshrapnel-function-addparticleshrapnel-state-localentity-src-mq3-client-cgame-particles-ml-313489419"></a>
### addParticleShrapnel

```ml
function addParticleShrapnel(state, localEntity)
```

CG_AddParticleShrapnel is deliberately empty in the original source.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Accepted for compatibility with `addParticleShrapnel`; the current implementation does not read it. |
| `localEntity` | `dynamic` | — | Accepted for compatibility with `addParticleShrapnel`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L510)

<a id="function-function-mq3-client-cgame-particles-addparticletoscene-function-addparticletoscene-state-p-origin-alpha-src-mq3-client-cgame-particles-ml-1182825143"></a>
### addParticleToScene

```ml
function addParticleToScene(state, p, origin, alpha)
```

CG_AddParticleToScene

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`, `state.vieworg`, `state.vright`, `state.vup` and additional values. |
| `p` | `dynamic` | — | Mutable client game particles record/storage; this routine assigns `p.time`, `p.org`, `p.org[2]`, `p.vel[0]` and additional values. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `alpha` | `dynamic` | — | Opacity or blend weight used by the visual effect. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L368)

<a id="function-function-mq3-client-cgame-particles-allocparticle-function-allocparticle-state-src-mq3-client-cgame-particles-ml-2120871599"></a>
### allocParticle

```ml
function allocParticle(state)
```

Updates `state.dropped`, `state.free`, `state.active` during client game particles `allocParticle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game particles record/storage; this routine assigns `state.dropped`, `state.free`, `state.active`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L282)

<a id="function-function-mq3-client-cgame-particles-animationframename-function-animationframename-p-ratio-src-mq3-client-cgame-particles-ml-19997595"></a>
### animationFrameName

```ml
function animationFrameName(p, ratio)
```

Calls `mq3.client.cgame_particles.shaderAnimCounts`, `mq3.client.cgame_particles.shaderAnimNames`, `mq3.compat.numeric.trunc32` from client game particles `animationFrameName`. The final path returns `[names[p.shaderAnim]+str(frame+1),frame]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Record read through `p.shaderAnim`. |
| `ratio` | `dynamic` | — | Value used by `frame=n.trunc32(ratio*counts[p.shaderAnim])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L346)

<a id="function-function-mq3-client-cgame-particles-animationindex-function-animationindex-name-src-mq3-client-cgame-particles-ml-1568520515"></a>
### animationIndex

```ml
function animationIndex(name)
```

Calls `mq3.client.cgame_particles.shaderAnimNames` from client game particles `animationIndex`. The final path returns `-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used to select or register the corresponding client game particles resource. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L494)

<a id="function-function-mq3-client-cgame-particles-bloodpool-function-bloodpool-state-shader-trace-tracefn-context-src-mq3-client-cgame-particles-ml-1874841769"></a>
### bloodPool

```ml
function bloodPool(state, shader, trace, traceFn, context)
```

CG_BloodPool

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |
| `trace` | `dynamic` | — | Record read through `trace.endpos`. |
| `traceFn` | `dynamic` | — | Collision-trace callback used to test the requested movement or visibility segment. |
| `context` | `dynamic` | — | context record passed to the client game particles helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L588)

<a id="constant-constant-mq3-client-cgame-particles-bloodred-const-bloodred-2-src-mq3-client-cgame-particles-ml-1899455819"></a>
### BLOODRED

```ml
const BLOODRED = 2
```

Particle color selector used by blood effects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L14)

<a id="function-function-mq3-client-cgame-particles-clearparticles-function-clearparticles-state-src-mq3-client-cgame-particles-ml-190702261"></a>
### clearParticles

```ml
function clearParticles(state)
```

CG_ClearParticles

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game particles record/storage; this routine assigns `state.particles`, `state.free`, `state.active`, `state.actions` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L272)

<a id="constant-constant-mq3-client-cgame-particles-contents-solid-const-contents-solid-1-src-mq3-client-cgame-particles-ml-910144840"></a>
### CONTENTS_SOLID

```ml
const CONTENTS_SOLID = 1
```

Collision-content bit identifying solid volumes or surfaces during client traces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L58)

<a id="function-function-mq3-client-cgame-particles-copy3-function-copy3-value-src-mq3-client-cgame-particles-ml-586115425"></a>
### copy3

```ml
function copy3(value)
```

Copies the X, Y and Z components into a fresh client game particles vector.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Sequence read at `value[0]`, `value[1]`, `value[2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L225)

<a id="function-function-mq3-client-cgame-particles-crandom-function-crandom-state-src-mq3-client-cgame-particles-ml-113074069"></a>
### crandom

```ml
function crandom(state)
```

Computes `2.0*(randomFloat(state)-0.5)` for client game particles `crandom`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game particles state passed to the helper calls in `crandom`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L262)

<a id="function-function-mq3-client-cgame-particles-create-function-create-capacity-retailactive-src-mq3-client-cgame-particles-ml-407427933"></a>
### create

```ml
function create(capacity, retailActive)
```

Calls `mq3.client.cgame_particles.State`, `mq3.client.cgame_particles.zero3` from client game particles `create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `capacity` | `dynamic` | — | Maximum number of entries or bytes accepted by this container. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L242)

<a id="function-function-mq3-client-cgame-particles-directionunit-function-directionunit-direction-src-mq3-client-cgame-particles-ml-1075650551"></a>
### directionUnit

```ml
function directionUnit(direction)
```

Calls `mq3.client.cgame_particles.copy3`, `mq3.shared.math.VectorNormalize` from client game particles `directionUnit`. The final path returns `[result,length]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `direction` | `dynamic` | — | Direction vector used by the spatial calculation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L594)

<a id="function-function-mq3-client-cgame-particles-distance-function-distance-a-b-src-mq3-client-cgame-particles-ml-1448647299"></a>
### distance

```ml
function distance(a, b)
```

Adapts `mq3.shared.math.VectorLength` to client game particles `distance`, returning its result for `[a[0]-b[0],a[1]-b[1],a[2]-b[2]]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Argument 1 of `mq3.shared.math.VectorLength`; passed as `[a[0]-b[0],a[1]-b[1],a[2]-b[2]]`. |
| `b` | `dynamic` | — | Argument 1 of `mq3.shared.math.VectorLength`; passed as `[a[0]-b[0],a[1]-b[1],a[2]-b[2]]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L342)

<a id="constant-constant-mq3-client-cgame-particles-emisivefade-const-emisivefade-3-src-mq3-client-cgame-particles-ml-1461307648"></a>
### EMISIVEFADE

```ml
const EMISIVEFADE = 3
```

Particle presentation flag selecting emissive color fading.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L16)

<a id="function-function-mq3-client-cgame-particles-expiresbytime-function-expiresbytime-p-src-mq3-client-cgame-particles-ml-996960326"></a>
### expiresByTime

```ml
function expiresByTime(p)
```

Computes `p.type==P_SMOKE or p.type==P_ANIM or p.type==P_BLEED or p.type==P_SMOKE_IMPACT or p.type==P_WEATHER_FLURRY or p.type==P_FLAT_SCALEUP_FADE` for client game particles `expiresByTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Record read through `p.type`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L411)

<a id="function-function-mq3-client-cgame-particles-flatquad-function-flatquad-origin-width-height-roll-src-mq3-client-cgame-particles-ml-124995796"></a>
### flatQuad

```ml
function flatQuad(origin, width, height, roll)
```

Calls `mq3.compat.transcendental.sin`, `mq3.compat.transcendental.sqrt`, `mq3.compat.transcendental.cos` from client game particles `flatQuad`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `width` | `dynamic` | — | Width in the coordinate space used by `flatQuad`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `flatQuad`. |
| `roll` | `dynamic` | — | Value used by `radians=roll*PI/180.0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L335)

<a id="function-function-mq3-client-cgame-particles-freeparticle-function-freeparticle-state-p-src-mq3-client-cgame-particles-ml-75909135"></a>
### freeParticle

```ml
function freeParticle(state, p)
```

Updates `state.active`, `p.active`, `p.type`, `p.color` and additional values during client game particles `freeParticle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game particles record/storage; this routine assigns `state.active`, `state.free`, `state.freed`. |
| `p` | `dynamic` | — | Mutable client game particles record/storage; this routine assigns `p.active`, `p.type`, `p.color`, `p.alpha`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L291)

<a id="constant-constant-mq3-client-cgame-particles-grey75-const-grey75-4-src-mq3-client-cgame-particles-ml-564289601"></a>
### GREY75

```ml
const GREY75 = 4
```

Particle color selector used by the gray smoke presentation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L18)

<a id="constant-constant-mq3-client-cgame-particles-max-entities-const-max-entities-1024-src-mq3-client-cgame-particles-ml-1629179304"></a>
### MAX_ENTITIES

```ml
const MAX_ENTITIES = 1024
```

Capacity limit for the entities collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L56)

<a id="constant-constant-mq3-client-cgame-particles-max-particles-const-max-particles-8192-src-mq3-client-cgame-particles-ml-1687593329"></a>
### MAX_PARTICLES

```ml
const MAX_PARTICLES = 8192
```

Capacity limit for the particles collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L54)

<a id="function-function-mq3-client-cgame-particles-newparticle-function-newparticle-id-src-mq3-client-cgame-particles-ml-194421421"></a>
### newParticle

```ml
function newParticle(id)
```

Creates a `mq3.client.cgame_particles.Particle` record. Assigns `id` from `id`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `id` | `dynamic` | — | Value used to initialize `Particle.id`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L235)

<a id="function-function-mq3-client-cgame-particles-newparticlearea-function-newparticlearea-state-text-shader-src-mq3-client-cgame-particles-ml-1547800361"></a>
### newParticleArea

```ml
function newParticleArea(state, text, shader)
```

CG_NewParticleArea

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game particles record/storage; this routine assigns `state.errors`. |
| `text` | `dynamic` | — | Text consumed or emitted by `newParticleArea` in the client game particles path. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L516)

<a id="function-function-mq3-client-cgame-particles-oilslickremove-function-oilslickremove-state-cent-src-mq3-client-cgame-particles-ml-1287651795"></a>
### oilSlickRemove

```ml
function oilSlickRemove(state, cent)
```

CG_OilSlickRemove

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.active`, `state.particles`, `state.time`. |
| `cent` | `dynamic` | — | Accepted for compatibility with `oilSlickRemove`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L569)

<a id="constant-constant-mq3-client-cgame-particles-p-anim-const-p-anim-6-src-mq3-client-cgame-particles-ml-323807521"></a>
### P_ANIM

```ml
const P_ANIM = 6
```

Particle update/rendering kind selecting the anim effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L32)

<a id="constant-constant-mq3-client-cgame-particles-p-bat-const-p-bat-7-src-mq3-client-cgame-particles-ml-290883428"></a>
### P_BAT

```ml
const P_BAT = 7
```

Particle update/rendering kind selecting the bat effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L34)

<a id="constant-constant-mq3-client-cgame-particles-p-bleed-const-p-bleed-8-src-mq3-client-cgame-particles-ml-1568018093"></a>
### P_BLEED

```ml
const P_BLEED = 8
```

Particle update/rendering kind selecting the bleed effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L36)

<a id="constant-constant-mq3-client-cgame-particles-p-bubble-const-p-bubble-13-src-mq3-client-cgame-particles-ml-339603057"></a>
### P_BUBBLE

```ml
const P_BUBBLE = 13
```

Particle update/rendering kind selecting the bubble effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L46)

<a id="constant-constant-mq3-client-cgame-particles-p-bubble-turbulent-const-p-bubble-turbulent-14-src-mq3-client-cgame-particles-ml-596553264"></a>
### P_BUBBLE_TURBULENT

```ml
const P_BUBBLE_TURBULENT = 14
```

Particle update/rendering kind selecting the bubble turbulent effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L48)

<a id="constant-constant-mq3-client-cgame-particles-p-flat-const-p-flat-2-src-mq3-client-cgame-particles-ml-1221923105"></a>
### P_FLAT

```ml
const P_FLAT = 2
```

Particle update/rendering kind selecting the flat effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L24)

<a id="constant-constant-mq3-client-cgame-particles-p-flat-scaleup-const-p-flat-scaleup-9-src-mq3-client-cgame-particles-ml-1358357564"></a>
### P_FLAT_SCALEUP

```ml
const P_FLAT_SCALEUP = 9
```

Particle update/rendering kind selecting the flat scaleup effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L38)

<a id="constant-constant-mq3-client-cgame-particles-p-flat-scaleup-fade-const-p-flat-scaleup-fade-10-src-mq3-client-cgame-particles-ml-464067216"></a>
### P_FLAT_SCALEUP_FADE

```ml
const P_FLAT_SCALEUP_FADE = 10
```

Particle update/rendering kind selecting the flat scaleup fade effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L40)

<a id="constant-constant-mq3-client-cgame-particles-p-none-const-p-none-0-src-mq3-client-cgame-particles-ml-39202481"></a>
### P_NONE

```ml
const P_NONE = 0
```

Particle update/rendering kind selecting the none effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L20)

<a id="constant-constant-mq3-client-cgame-particles-p-rotate-const-p-rotate-4-src-mq3-client-cgame-particles-ml-1220006039"></a>
### P_ROTATE

```ml
const P_ROTATE = 4
```

Particle update/rendering kind selecting the rotate effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L28)

<a id="constant-constant-mq3-client-cgame-particles-p-smoke-const-p-smoke-3-src-mq3-client-cgame-particles-ml-114407600"></a>
### P_SMOKE

```ml
const P_SMOKE = 3
```

Particle update/rendering kind selecting the smoke effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L26)

<a id="constant-constant-mq3-client-cgame-particles-p-smoke-impact-const-p-smoke-impact-12-src-mq3-client-cgame-particles-ml-1361827350"></a>
### P_SMOKE_IMPACT

```ml
const P_SMOKE_IMPACT = 12
```

Particle update/rendering kind selecting the smoke impact effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L44)

<a id="constant-constant-mq3-client-cgame-particles-p-sprite-const-p-sprite-15-src-mq3-client-cgame-particles-ml-977376725"></a>
### P_SPRITE

```ml
const P_SPRITE = 15
```

Particle update/rendering kind selecting the sprite effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L50)

<a id="constant-constant-mq3-client-cgame-particles-p-weather-const-p-weather-1-src-mq3-client-cgame-particles-ml-1387169122"></a>
### P_WEATHER

```ml
const P_WEATHER = 1
```

Particle update/rendering kind selecting the weather effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L22)

<a id="constant-constant-mq3-client-cgame-particles-p-weather-flurry-const-p-weather-flurry-11-src-mq3-client-cgame-particles-ml-1491966633"></a>
### P_WEATHER_FLURRY

```ml
const P_WEATHER_FLURRY = 11
```

Particle update/rendering kind selecting the weather flurry effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L42)

<a id="constant-constant-mq3-client-cgame-particles-p-weather-turbulent-const-p-weather-turbulent-5-src-mq3-client-cgame-particles-ml-258556390"></a>
### P_WEATHER_TURBULENT

```ml
const P_WEATHER_TURBULENT = 5
```

Particle update/rendering kind selecting the weather turbulent effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L30)

- [mq3.client.cgame_particles.Particle](Type-mq3-client-cgame-particles-particle-817852400.md) — struct
<a id="constant-constant-mq3-client-cgame-particles-particle-gravity-const-particle-gravity-40-src-mq3-client-cgame-particles-ml-48242909"></a>
### PARTICLE_GRAVITY

```ml
const PARTICLE_GRAVITY = 40
```

Downward acceleration applied when integrating gravity-affected particles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L52)

<a id="function-function-mq3-client-cgame-particles-particlebleed-function-particlebleed-state-shader-start-direction-fleshentitynum-duration-src-mq3-client-cgame-particles-ml-1918130028"></a>
### particleBleed

```ml
function particleBleed(state, shader, start, direction, fleshEntityNum, duration)
```

CG_Particle_Bleed

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |
| `start` | `dynamic` | — | Value used by `p.org=copy3(start)`. |
| `direction` | `dynamic` | — | Accepted for compatibility with `particleBleed`; the current implementation does not read it. |
| `fleshEntityNum` | `dynamic` | — | Value used by `if fleshEntityNum!=0 then p.startfade=state.time end if`. |
| `duration` | `dynamic` | — | Lifetime or interval in the same units as this operation's clock. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L545)

<a id="function-function-mq3-client-cgame-particles-particlebloodcloud-function-particlebloodcloud-state-cent-origin-direction-smokeshader-src-mq3-client-cgame-particles-ml-2076348444"></a>
### particleBloodCloud

```ml
function particleBloodCloud(state, cent, origin, direction, smokeShader)
```

CG_ParticleBloodCloud

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `cent` | `dynamic` | — | Accepted for compatibility with `particleBloodCloud`; the current implementation does not read it. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `direction` | `dynamic` | — | Direction vector used by the spatial calculation. |
| `smokeShader` | `dynamic` | — | Value used by `p=spawnBase(state,smokeShader)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L601)

<a id="function-function-mq3-client-cgame-particles-particlebubble-function-particlebubble-state-shader-origin-origin2-turb-range-snum-src-mq3-client-cgame-particles-ml-14752625"></a>
### particleBubble

```ml
function particleBubble(state, shader, origin, origin2, turb, range, snum)
```

CG_ParticleBubble

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game particles state passed to the helper calls in `particleBubble`. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `origin2` | `dynamic` | — | Second world-space endpoint of the effect. |
| `turb` | `dynamic` | — | Value used by `if turb!=0 then p.type=P_BUBBLE_TURBULENT`. |
| `range` | `dynamic` | — | Value used by `p.org=[origin[0]+crandom(state)*range,origin[1]+crandom(state)*range,origin[2]+crandom(state)*(p.start-p.finish)]`. |
| `snum` | `dynamic` | — | Value assigned to `p.snum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L470)

<a id="function-function-mq3-client-cgame-particles-particlebulletdebris-function-particlebulletdebris-state-origin-velocity-duration-tracershader-src-mq3-client-cgame-particles-ml-737008094"></a>
### particleBulletDebris

```ml
function particleBulletDebris(state, origin, velocity, duration, tracerShader)
```

CG_ParticleBulletDebris

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `velocity` | `dynamic` | — | Velocity vector used to advance or orient the effect. |
| `duration` | `dynamic` | — | Lifetime or interval in the same units as this operation's clock. |
| `tracerShader` | `dynamic` | — | Value used by `p=spawnBase(state,tracerShader)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L488)

<a id="function-function-mq3-client-cgame-particles-particledust-function-particledust-state-cent-origin-direction-smokeshader-src-mq3-client-cgame-particles-ml-642576508"></a>
### particleDust

```ml
function particleDust(state, cent, origin, direction, smokeShader)
```

CG_ParticleDust; preserves the original VectorClear after gravity setup.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `cent` | `dynamic` | — | Accepted for compatibility with `particleDust`; the current implementation does not read it. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `direction` | `dynamic` | — | Direction vector used by the spatial calculation. |
| `smokeShader` | `dynamic` | — | Value used by `p=spawnBase(state,smokeShader)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L624)

<a id="function-function-mq3-client-cgame-particles-particleexplosion-function-particleexplosion-state-animname-origin-velocity-duration-sizestart-sizeend-src-mq3-client-cgame-particles-ml-1414660167"></a>
### particleExplosion

```ml
function particleExplosion(state, animName, origin, velocity, duration, sizeStart, sizeEnd)
```

CG_ParticleExplosion

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game particles record/storage; this routine assigns `state.errors`. |
| `animName` | `dynamic` | — | Value used by `anim=animationIndex(animName)`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `velocity` | `dynamic` | — | Velocity vector used to advance or orient the effect. |
| `duration` | `dynamic` | — | Lifetime or interval in the same units as this operation's clock. |
| `sizeStart` | `dynamic` | — | Value assigned to `p.width`. |
| `sizeEnd` | `dynamic` | — | Value assigned to `p.endheight`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L503)

<a id="function-function-mq3-client-cgame-particles-particleimpactsmokepuff-function-particleimpactsmokepuff-state-shader-origin-src-mq3-client-cgame-particles-ml-62465828"></a>
### particleImpactSmokePuff

```ml
function particleImpactSmokePuff(state, shader, origin)
```

CG_ParticleImpactSmokePuff

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L534)

<a id="function-function-mq3-client-cgame-particles-particlemisc-function-particlemisc-state-shader-origin-size-duration-alpha-src-mq3-client-cgame-particles-ml-1475223461"></a>
### particleMisc

```ml
function particleMisc(state, shader, origin, size, duration, alpha)
```

CG_ParticleMisc. The original ignores alpha and only frees negative-duration sprites after one draw.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `size` | `dynamic` | — | Value assigned to `p.width`, `p.height`, `p.endheight`, `p.endwidth`. |
| `duration` | `dynamic` | — | Lifetime or interval in the same units as this operation's clock. |
| `alpha` | `dynamic` | — | Opacity or blend weight used by the visual effect. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L636)

<a id="function-function-mq3-client-cgame-particles-particleoilparticle-function-particleoilparticle-state-shader-cent-src-mq3-client-cgame-particles-ml-2098305652"></a>
### particleOilParticle

```ml
function particleOilParticle(state, shader, cent)
```

CG_Particle_OilParticle

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Record read through `cent.time`, `cent.origin`, `cent.origin2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L553)

<a id="function-function-mq3-client-cgame-particles-particleoilslick-function-particleoilslick-state-shader-cent-src-mq3-client-cgame-particles-ml-1957166616"></a>
### particleOilSlick

```ml
function particleOilSlick(state, shader, cent)
```

CG_Particle_OilSlick

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Record read through `cent.angles2`, `cent.origin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L561)

<a id="function-function-mq3-client-cgame-particles-particlesmoke-function-particlesmoke-state-shader-cent-src-mq3-client-cgame-particles-ml-700507094"></a>
### particleSmoke

```ml
function particleSmoke(state, shader, cent)
```

CG_ParticleSmoke

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Record read through `cent.time`, `cent.time2`, `cent.origin`, `cent.origin2` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L478)

<a id="function-function-mq3-client-cgame-particles-particlesnow-function-particlesnow-state-shader-origin-origin2-turb-range-snum-src-mq3-client-cgame-particles-ml-338778137"></a>
### particleSnow

```ml
function particleSnow(state, shader, origin, origin2, turb, range, snum)
```

CG_ParticleSnow

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game particles state passed to the helper calls in `particleSnow`. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `origin2` | `dynamic` | — | Second world-space endpoint of the effect. |
| `turb` | `dynamic` | — | Value used by `if turb!=0 then p.type=P_WEATHER_TURBULENT`. |
| `range` | `dynamic` | — | Value used by `p.org=[origin[0]+crandom(state)*range,origin[1]+crandom(state)*range,origin[2]+crandom(state)*(p.start-p.finish)]`. |
| `snum` | `dynamic` | — | Value assigned to `p.snum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L458)

<a id="function-function-mq3-client-cgame-particles-particlesnowflurry-function-particlesnowflurry-state-shader-cent-src-mq3-client-cgame-particles-ml-960220956"></a>
### particleSnowFlurry

```ml
function particleSnowFlurry(state, shader, cent)
```

CG_ParticleSnowFlurry

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `shader` | `dynamic` | — | Shader handle or asset name selected for this draw operation. |
| `cent` | `dynamic` | — | Client entity holding current/next state and interpolated presentation data. Record read through `cent.origin2`, `cent.time`, `cent.time2`, `cent.origin` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L445)

<a id="function-function-mq3-client-cgame-particles-particlesparks-function-particlesparks-state-origin-velocity-duration-x-y-speed-tracershader-src-mq3-client-cgame-particles-ml-1593207896"></a>
### particleSparks

```ml
function particleSparks(state, origin, velocity, duration, x, y, speed, tracerShader)
```

CG_ParticleSparks

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `velocity` | `dynamic` | — | Velocity vector used to advance or orient the effect. |
| `duration` | `dynamic` | — | Lifetime or interval in the same units as this operation's clock. |
| `x` | `dynamic` | — | Horizontal coordinate in the coordinate space used by `particleSparks`. |
| `y` | `dynamic` | — | Vertical coordinate in the coordinate space used by `particleSparks`. |
| `speed` | `dynamic` | — | Value used by `p.vel=[velocity[0]+crandom(state)*4.0,velocity[1]+crandom(state)*4.0,velocity[2]+(20.0+crandom(state)*10.0)*speed]`. |
| `tracerShader` | `dynamic` | — | Value used by `p=spawnBase(state,tracerShader)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L614)

<a id="constant-constant-mq3-client-cgame-particles-pi-const-pi-3-141593-src-mq3-client-cgame-particles-ml-1050529819"></a>
### PI

```ml
const PI = 3.141593
```

Circle constant used to convert or evaluate angles in trigonometric calculations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L60)

<a id="function-function-mq3-client-cgame-particles-quad-function-quad-origin-width-height-right-up-src-mq3-client-cgame-particles-ml-1137208014"></a>
### quad

```ml
function quad(origin, width, height, right, up)
```

Builds the client game particles `quad` sequence from `[qmath.VectorMA(qmath.VectorMA(origin,-height,up),-width,right),qmath.VectorMA(qmath.VectorMA(origin,-height,up),width,right),qmath.VectorMA(qmath.VectorMA(origin,height,up),width,right),qmath.Vect...`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `width` | `dynamic` | — | Width in the coordinate space used by `quad`. |
| `height` | `dynamic` | — | Height in the coordinate space used by `quad`. |
| `right` | `dynamic` | — | Value used by `return [qmath.VectorMA(qmath.VectorMA(origin,-height,up),-width,right),qmath.VectorMA(qmath.VectorMA(origin,-height,up),width,right),qmath.Vec...`. |
| `up` | `dynamic` | — | Value used by `return [qmath.VectorMA(qmath.VectorMA(origin,-height,up),-width,right),qmath.VectorMA(qmath.VectorMA(origin,-height,up),width,right),qmath.Vec...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L327)

<a id="function-function-mq3-client-cgame-particles-randint-function-randint-state-src-mq3-client-cgame-particles-ml-625493121"></a>
### randInt

```ml
function randInt(state)
```

Updates `state.randomAt`, `state.randomSeed` during client game particles `randInt`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game particles record/storage; this routine assigns `state.randomAt`, `state.randomSeed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L253)

<a id="function-function-mq3-client-cgame-particles-randomfloat-function-randomfloat-state-src-mq3-client-cgame-particles-ml-272369155"></a>
### randomFloat

```ml
function randomFloat(state)
```

Adapts `mq3.compat.numeric.fdiv` to client game particles `randomFloat`, returning its result for `randInt(state), 32767.0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.compat.numeric.fdiv`; passed as `randInt(state)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L259)

- [mq3.client.cgame_particles.RenderAction](Type-mq3-client-cgame-particles-renderaction-1138860224.md) — struct
<a id="function-function-mq3-client-cgame-particles-renderfamily-function-renderfamily-type-src-mq3-client-cgame-particles-ml-767345878"></a>
### renderFamily

```ml
function renderFamily(type)
```

Evaluates client game particles `renderFamily` and returns `1`, `2`, `3` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `type` | `dynamic` | — | Value used by `if type==P_WEATHER or type==P_WEATHER_TURBULENT or type==P_WEATHER_FLURRY or type==P_BUBBLE or type==P_BUBBLE_TURBULENT then return 1 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L352)

<a id="function-function-mq3-client-cgame-particles-resetparticle-function-resetparticle-p-src-mq3-client-cgame-particles-ml-1844249096"></a>
### resetParticle

```ml
function resetParticle(p)
```

Updates `p.active`, `p.time`, `p.endtime`, `p.org` and additional values during client game particles `resetParticle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — | Mutable client game particles record/storage; this routine assigns `p.active`, `p.time`, `p.endtime`, `p.org` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L266)

<a id="function-function-mq3-client-cgame-particles-rotatebasis-function-rotatebasis-right-up-degrees-src-mq3-client-cgame-particles-ml-1660385856"></a>
### rotateBasis

```ml
function rotateBasis(right, up, degrees)
```

Calls `mq3.compat.transcendental.sin`, `mq3.compat.transcendental.cos`, `mq3.shared.math.VectorMA` and additional helpers from client game particles `rotateBasis`. The final path returns `[qmath.VectorMA(qmath.VectorScale(right,c),s,up),qmath.VectorMA(qmath.VectorScale(up,c),-s,right)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `right` | `dynamic` | — | Value used by `return [qmath.VectorMA(qmath.VectorScale(right,c),s,up),qmath.VectorMA(qmath.VectorScale(up,c),-s,right)]`. |
| `up` | `dynamic` | — | Value used by `return [qmath.VectorMA(qmath.VectorScale(right,c),s,up),qmath.VectorMA(qmath.VectorScale(up,c),-s,right)]`. |
| `degrees` | `dynamic` | — | Value used by `radians=degrees*PI/180.0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L318)

<a id="function-function-mq3-client-cgame-particles-setrandomints-function-setrandomints-state-values-src-mq3-client-cgame-particles-ml-154608153"></a>
### setRandomInts

```ml
function setRandomInts(state, values)
```

Updates `state.randomInts`, `state.randomAt` during client game particles `setRandomInts`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game particles record/storage; this routine assigns `state.randomInts`, `state.randomAt`. |
| `values` | `dynamic` | — | Value assigned to `state.randomInts`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L250)

<a id="function-function-mq3-client-cgame-particles-shaderanimcounts-function-shaderanimcounts-src-mq3-client-cgame-particles-ml-1985238202"></a>
### shaderAnimCounts

```ml
function shaderAnimCounts()
```

Builds the client game particles `shaderAnimCounts` sequence from `[23,25,45,25,23,5]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L229)

<a id="function-function-mq3-client-cgame-particles-shaderanimnames-function-shaderanimnames-src-mq3-client-cgame-particles-ml-117802246"></a>
### shaderAnimNames

```ml
function shaderAnimNames()
```

Lists the shader anim names catalog for client game particles in its declared source order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L227)

<a id="function-function-mq3-client-cgame-particles-shaderanimratios-function-shaderanimratios-src-mq3-client-cgame-particles-ml-1814611534"></a>
### shaderAnimRatios

```ml
function shaderAnimRatios()
```

Builds the client game particles `shaderAnimRatios` sequence from `[n.f32(1.405),1.0,1.0,1.0,1.0,1.0]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L231)

<a id="function-function-mq3-client-cgame-particles-snowlink-function-snowlink-state-id-particleon-src-mq3-client-cgame-particles-ml-725948611"></a>
### snowLink

```ml
function snowLink(state, id, particleOn)
```

CG_SnowLink

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.active`, `state.particles`. |
| `id` | `dynamic` | — | Value used by `if (p.type==P_WEATHER or p.type==P_WEATHER_TURBULENT) and p.snum==id then p.link=particleOn`. |
| `particleOn` | `dynamic` | — | Value assigned to `p.link`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L526)

<a id="function-function-mq3-client-cgame-particles-spawnbase-function-spawnbase-state-shader-src-mq3-client-cgame-particles-ml-1723251518"></a>
### spawnBase

```ml
function spawnBase(state, shader)
```

Calls `mq3.client.cgame_particles.allocParticle` from client game particles `spawnBase`. The final path returns `p`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `shader` | `dynamic` | — | Value assigned to `p.shader`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L437)

- [mq3.client.cgame_particles.State](Type-mq3-client-cgame-particles-state-1124640035.md) — struct
<a id="function-function-mq3-client-cgame-particles-validbloodpool-function-validbloodpool-start-tracefn-context-src-mq3-client-cgame-particles-ml-396425298"></a>
### validBloodPool

```ml
function validBloodPool(start, traceFn, context)
```

ValidBloodPool. traceFn(context,start,finish) returns entityNum/startsolid/fraction.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — | Value used by `center=qmath.VectorMA(start,0.5,normal)`. |
| `traceFn` | `dynamic` | — | Collision-trace callback used to test the requested movement or visibility segment. |
| `context` | `dynamic` | — | context record passed to the client game particles helper calls. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L577)

<a id="function-function-mq3-client-cgame-particles-zero3-function-zero3-src-mq3-client-cgame-particles-ml-565007072"></a>
### zero3

```ml
function zero3()
```

Creates a three-component zero vector for client game particles.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_particles.ml#L222)
