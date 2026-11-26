# `src/mq3/client/cgame_particles.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cgame_particles`](Package-mq3-client-cgame-particles-1481782820.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-client-cgame-particles-action-function-action-state-kind-p-shader-vertices-origin-width-height-alpha-color-frame-src-mq3-client-cgame-particles-ml-2123518690"></a>
### action

```ml
function action(state, kind, p, shader, vertices, origin, width, height, alpha, color, frame)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `p` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `vertices` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `alpha` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `frame` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L89)

<a id="function-function-mq3-client-cgame-particles-addparticles-function-addparticles-state-time-vieworg-vforward-vright-vup-src-mq3-client-cgame-particles-ml-1111548353"></a>
### addParticles

```ml
function addParticles(state, time, vieworg, vforward, vright, vup)
```

CG_AddParticles

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `vieworg` | `dynamic` | — |  |
| `vforward` | `dynamic` | — |  |
| `vright` | `dynamic` | — |  |
| `vup` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L168)

<a id="function-function-mq3-client-cgame-particles-addparticleshrapnel-function-addparticleshrapnel-state-localentity-src-mq3-client-cgame-particles-ml-313489419"></a>
### addParticleShrapnel

```ml
function addParticleShrapnel(state, localEntity)
```

CG_AddParticleShrapnel is deliberately empty in the original source.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `localEntity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L217)

<a id="function-function-mq3-client-cgame-particles-addparticletoscene-function-addparticletoscene-state-p-origin-alpha-src-mq3-client-cgame-particles-ml-1182825143"></a>
### addParticleToScene

```ml
function addParticleToScene(state, p, origin, alpha)
```

CG_AddParticleToScene

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `p` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `alpha` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L122)

<a id="function-function-mq3-client-cgame-particles-allocparticle-function-allocparticle-state-src-mq3-client-cgame-particles-ml-2120871599"></a>
### allocParticle

```ml
function allocParticle(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L78)

<a id="function-function-mq3-client-cgame-particles-animationframename-function-animationframename-p-ratio-src-mq3-client-cgame-particles-ml-19997595"></a>
### animationFrameName

```ml
function animationFrameName(p, ratio)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |
| `ratio` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L106)

<a id="function-function-mq3-client-cgame-particles-animationindex-function-animationindex-name-src-mq3-client-cgame-particles-ml-1568520515"></a>
### animationIndex

```ml
function animationIndex(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L210)

<a id="function-function-mq3-client-cgame-particles-bloodpool-function-bloodpool-state-shader-trace-tracefn-context-src-mq3-client-cgame-particles-ml-1874841769"></a>
### bloodPool

```ml
function bloodPool(state, shader, trace, traceFn, context)
```

CG_BloodPool

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |
| `traceFn` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L264)

<a id="constant-constant-mq3-client-cgame-particles-bloodred-const-bloodred-2-src-mq3-client-cgame-particles-ml-1899455819"></a>
### BLOODRED

```ml
const BLOODRED = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L13)

<a id="function-function-mq3-client-cgame-particles-clearparticles-function-clearparticles-state-src-mq3-client-cgame-particles-ml-190702261"></a>
### clearParticles

```ml
function clearParticles(state)
```

CG_ClearParticles

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L70)

<a id="constant-constant-mq3-client-cgame-particles-contents-solid-const-contents-solid-1-src-mq3-client-cgame-particles-ml-910144840"></a>
### CONTENTS_SOLID

```ml
const CONTENTS_SOLID = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L35)

<a id="function-function-mq3-client-cgame-particles-copy3-function-copy3-value-src-mq3-client-cgame-particles-ml-586115425"></a>
### copy3

```ml
function copy3(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L43)

<a id="function-function-mq3-client-cgame-particles-crandom-function-crandom-state-src-mq3-client-cgame-particles-ml-113074069"></a>
### crandom

```ml
function crandom(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L63)

<a id="function-function-mq3-client-cgame-particles-create-function-create-capacity-retailactive-src-mq3-client-cgame-particles-ml-407427933"></a>
### create

```ml
function create(capacity, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `capacity` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L52)

<a id="function-function-mq3-client-cgame-particles-directionunit-function-directionunit-direction-src-mq3-client-cgame-particles-ml-1075650551"></a>
### directionUnit

```ml
function directionUnit(direction)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `direction` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L268)

<a id="function-function-mq3-client-cgame-particles-distance-function-distance-a-b-src-mq3-client-cgame-particles-ml-1448647299"></a>
### distance

```ml
function distance(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L105)

<a id="constant-constant-mq3-client-cgame-particles-emisivefade-const-emisivefade-3-src-mq3-client-cgame-particles-ml-1461307648"></a>
### EMISIVEFADE

```ml
const EMISIVEFADE = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L14)

<a id="function-function-mq3-client-cgame-particles-expiresbytime-function-expiresbytime-p-src-mq3-client-cgame-particles-ml-996960326"></a>
### expiresByTime

```ml
function expiresByTime(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L163)

<a id="function-function-mq3-client-cgame-particles-flatquad-function-flatquad-origin-width-height-roll-src-mq3-client-cgame-particles-ml-124995796"></a>
### flatQuad

```ml
function flatQuad(origin, width, height, roll)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `roll` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L101)

<a id="function-function-mq3-client-cgame-particles-freeparticle-function-freeparticle-state-p-src-mq3-client-cgame-particles-ml-75909135"></a>
### freeParticle

```ml
function freeParticle(state, p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L84)

<a id="constant-constant-mq3-client-cgame-particles-grey75-const-grey75-4-src-mq3-client-cgame-particles-ml-564289601"></a>
### GREY75

```ml
const GREY75 = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L15)

<a id="constant-constant-mq3-client-cgame-particles-max-entities-const-max-entities-1024-src-mq3-client-cgame-particles-ml-1629179304"></a>
### MAX_ENTITIES

```ml
const MAX_ENTITIES = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L34)

<a id="constant-constant-mq3-client-cgame-particles-max-particles-const-max-particles-8192-src-mq3-client-cgame-particles-ml-1687593329"></a>
### MAX_PARTICLES

```ml
const MAX_PARTICLES = 8192
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L33)

<a id="function-function-mq3-client-cgame-particles-newparticle-function-newparticle-id-src-mq3-client-cgame-particles-ml-194421421"></a>
### newParticle

```ml
function newParticle(id)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `id` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L48)

<a id="function-function-mq3-client-cgame-particles-newparticlearea-function-newparticlearea-state-text-shader-src-mq3-client-cgame-particles-ml-1547800361"></a>
### newParticleArea

```ml
function newParticleArea(state, text, shader)
```

CG_NewParticleArea

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L220)

<a id="function-function-mq3-client-cgame-particles-oilslickremove-function-oilslickremove-state-cent-src-mq3-client-cgame-particles-ml-1287651795"></a>
### oilSlickRemove

```ml
function oilSlickRemove(state, cent)
```

CG_OilSlickRemove

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L253)

<a id="constant-constant-mq3-client-cgame-particles-p-anim-const-p-anim-6-src-mq3-client-cgame-particles-ml-323807521"></a>
### P_ANIM

```ml
const P_ANIM = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L22)

<a id="constant-constant-mq3-client-cgame-particles-p-bat-const-p-bat-7-src-mq3-client-cgame-particles-ml-290883428"></a>
### P_BAT

```ml
const P_BAT = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L23)

<a id="constant-constant-mq3-client-cgame-particles-p-bleed-const-p-bleed-8-src-mq3-client-cgame-particles-ml-1568018093"></a>
### P_BLEED

```ml
const P_BLEED = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L24)

<a id="constant-constant-mq3-client-cgame-particles-p-bubble-const-p-bubble-13-src-mq3-client-cgame-particles-ml-339603057"></a>
### P_BUBBLE

```ml
const P_BUBBLE = 13
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L29)

<a id="constant-constant-mq3-client-cgame-particles-p-bubble-turbulent-const-p-bubble-turbulent-14-src-mq3-client-cgame-particles-ml-596553264"></a>
### P_BUBBLE_TURBULENT

```ml
const P_BUBBLE_TURBULENT = 14
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L30)

<a id="constant-constant-mq3-client-cgame-particles-p-flat-const-p-flat-2-src-mq3-client-cgame-particles-ml-1221923105"></a>
### P_FLAT

```ml
const P_FLAT = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L18)

<a id="constant-constant-mq3-client-cgame-particles-p-flat-scaleup-const-p-flat-scaleup-9-src-mq3-client-cgame-particles-ml-1358357564"></a>
### P_FLAT_SCALEUP

```ml
const P_FLAT_SCALEUP = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L25)

<a id="constant-constant-mq3-client-cgame-particles-p-flat-scaleup-fade-const-p-flat-scaleup-fade-10-src-mq3-client-cgame-particles-ml-464067216"></a>
### P_FLAT_SCALEUP_FADE

```ml
const P_FLAT_SCALEUP_FADE = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L26)

<a id="constant-constant-mq3-client-cgame-particles-p-none-const-p-none-0-src-mq3-client-cgame-particles-ml-39202481"></a>
### P_NONE

```ml
const P_NONE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L16)

<a id="constant-constant-mq3-client-cgame-particles-p-rotate-const-p-rotate-4-src-mq3-client-cgame-particles-ml-1220006039"></a>
### P_ROTATE

```ml
const P_ROTATE = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L20)

<a id="constant-constant-mq3-client-cgame-particles-p-smoke-const-p-smoke-3-src-mq3-client-cgame-particles-ml-114407600"></a>
### P_SMOKE

```ml
const P_SMOKE = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L19)

<a id="constant-constant-mq3-client-cgame-particles-p-smoke-impact-const-p-smoke-impact-12-src-mq3-client-cgame-particles-ml-1361827350"></a>
### P_SMOKE_IMPACT

```ml
const P_SMOKE_IMPACT = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L28)

<a id="constant-constant-mq3-client-cgame-particles-p-sprite-const-p-sprite-15-src-mq3-client-cgame-particles-ml-977376725"></a>
### P_SPRITE

```ml
const P_SPRITE = 15
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L31)

<a id="constant-constant-mq3-client-cgame-particles-p-weather-const-p-weather-1-src-mq3-client-cgame-particles-ml-1387169122"></a>
### P_WEATHER

```ml
const P_WEATHER = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L17)

<a id="constant-constant-mq3-client-cgame-particles-p-weather-flurry-const-p-weather-flurry-11-src-mq3-client-cgame-particles-ml-1491966633"></a>
### P_WEATHER_FLURRY

```ml
const P_WEATHER_FLURRY = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L27)

<a id="constant-constant-mq3-client-cgame-particles-p-weather-turbulent-const-p-weather-turbulent-5-src-mq3-client-cgame-particles-ml-258556390"></a>
### P_WEATHER_TURBULENT

```ml
const P_WEATHER_TURBULENT = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L21)

- [mq3.client.cgame_particles.Particle](Type-mq3-client-cgame-particles-particle-817852400.md) — struct
<a id="constant-constant-mq3-client-cgame-particles-particle-gravity-const-particle-gravity-40-src-mq3-client-cgame-particles-ml-48242909"></a>
### PARTICLE_GRAVITY

```ml
const PARTICLE_GRAVITY = 40
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L32)

<a id="function-function-mq3-client-cgame-particles-particlebleed-function-particlebleed-state-shader-start-direction-fleshentitynum-duration-src-mq3-client-cgame-particles-ml-1918130028"></a>
### particleBleed

```ml
function particleBleed(state, shader, start, direction, fleshEntityNum, duration)
```

CG_Particle_Bleed

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |
| `fleshEntityNum` | `dynamic` | — |  |
| `duration` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L237)

<a id="function-function-mq3-client-cgame-particles-particlebloodcloud-function-particlebloodcloud-state-cent-origin-direction-smokeshader-src-mq3-client-cgame-particles-ml-2076348444"></a>
### particleBloodCloud

```ml
function particleBloodCloud(state, cent, origin, direction, smokeShader)
```

CG_ParticleBloodCloud

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |
| `smokeShader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L270)

<a id="function-function-mq3-client-cgame-particles-particlebubble-function-particlebubble-state-shader-origin-origin2-turb-range-snum-src-mq3-client-cgame-particles-ml-14752625"></a>
### particleBubble

```ml
function particleBubble(state, shader, origin, origin2, turb, range, snum)
```

CG_ParticleBubble

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `origin2` | `dynamic` | — |  |
| `turb` | `dynamic` | — |  |
| `range` | `dynamic` | — |  |
| `snum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L196)

<a id="function-function-mq3-client-cgame-particles-particlebulletdebris-function-particlebulletdebris-state-origin-velocity-duration-tracershader-src-mq3-client-cgame-particles-ml-737008094"></a>
### particleBulletDebris

```ml
function particleBulletDebris(state, origin, velocity, duration, tracerShader)
```

CG_ParticleBulletDebris

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |
| `duration` | `dynamic` | — |  |
| `tracerShader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L206)

<a id="function-function-mq3-client-cgame-particles-particledust-function-particledust-state-cent-origin-direction-smokeshader-src-mq3-client-cgame-particles-ml-642576508"></a>
### particleDust

```ml
function particleDust(state, cent, origin, direction, smokeShader)
```

CG_ParticleDust; preserves the original VectorClear after gravity setup.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |
| `smokeShader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L280)

<a id="function-function-mq3-client-cgame-particles-particleexplosion-function-particleexplosion-state-animname-origin-velocity-duration-sizestart-sizeend-src-mq3-client-cgame-particles-ml-1414660167"></a>
### particleExplosion

```ml
function particleExplosion(state, animName, origin, velocity, duration, sizeStart, sizeEnd)
```

CG_ParticleExplosion

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `animName` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `velocity` | `dynamic` | — |  |
| `duration` | `dynamic` | — |  |
| `sizeStart` | `dynamic` | — |  |
| `sizeEnd` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L212)

<a id="function-function-mq3-client-cgame-particles-particleimpactsmokepuff-function-particleimpactsmokepuff-state-shader-origin-src-mq3-client-cgame-particles-ml-62465828"></a>
### particleImpactSmokePuff

```ml
function particleImpactSmokePuff(state, shader, origin)
```

CG_ParticleImpactSmokePuff

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L232)

<a id="function-function-mq3-client-cgame-particles-particlemisc-function-particlemisc-state-shader-origin-size-duration-alpha-src-mq3-client-cgame-particles-ml-1475223461"></a>
### particleMisc

```ml
function particleMisc(state, shader, origin, size, duration, alpha)
```

CG_ParticleMisc. The original ignores alpha and only frees negative-duration sprites after one draw.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `duration` | `dynamic` | — |  |
| `alpha` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L286)

<a id="function-function-mq3-client-cgame-particles-particleoilparticle-function-particleoilparticle-state-shader-cent-src-mq3-client-cgame-particles-ml-2098305652"></a>
### particleOilParticle

```ml
function particleOilParticle(state, shader, cent)
```

CG_Particle_OilParticle

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L242)

<a id="function-function-mq3-client-cgame-particles-particleoilslick-function-particleoilslick-state-shader-cent-src-mq3-client-cgame-particles-ml-1957166616"></a>
### particleOilSlick

```ml
function particleOilSlick(state, shader, cent)
```

CG_Particle_OilSlick

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L247)

<a id="function-function-mq3-client-cgame-particles-particlesmoke-function-particlesmoke-state-shader-cent-src-mq3-client-cgame-particles-ml-700507094"></a>
### particleSmoke

```ml
function particleSmoke(state, shader, cent)
```

CG_ParticleSmoke

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L201)

<a id="function-function-mq3-client-cgame-particles-particlesnow-function-particlesnow-state-shader-origin-origin2-turb-range-snum-src-mq3-client-cgame-particles-ml-338778137"></a>
### particleSnow

```ml
function particleSnow(state, shader, origin, origin2, turb, range, snum)
```

CG_ParticleSnow

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `origin2` | `dynamic` | — |  |
| `turb` | `dynamic` | — |  |
| `range` | `dynamic` | — |  |
| `snum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L191)

<a id="function-function-mq3-client-cgame-particles-particlesnowflurry-function-particlesnowflurry-state-shader-cent-src-mq3-client-cgame-particles-ml-960220956"></a>
### particleSnowFlurry

```ml
function particleSnowFlurry(state, shader, cent)
```

CG_ParticleSnowFlurry

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `cent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L185)

<a id="function-function-mq3-client-cgame-particles-particlesparks-function-particlesparks-state-origin-velocity-duration-x-y-speed-tracershader-src-mq3-client-cgame-particles-ml-1593207896"></a>
### particleSparks

```ml
function particleSparks(state, origin, velocity, duration, x, y, speed, tracerShader)
```

CG_ParticleSparks

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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L275)

<a id="constant-constant-mq3-client-cgame-particles-pi-const-pi-3-141593-src-mq3-client-cgame-particles-ml-1050529819"></a>
### PI

```ml
const PI = 3.141593
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L36)

<a id="function-function-mq3-client-cgame-particles-quad-function-quad-origin-width-height-right-up-src-mq3-client-cgame-particles-ml-1137208014"></a>
### quad

```ml
function quad(origin, width, height, right, up)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |
| `up` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L98)

<a id="function-function-mq3-client-cgame-particles-randint-function-randint-state-src-mq3-client-cgame-particles-ml-625493121"></a>
### randInt

```ml
function randInt(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L58)

<a id="function-function-mq3-client-cgame-particles-randomfloat-function-randomfloat-state-src-mq3-client-cgame-particles-ml-272369155"></a>
### randomFloat

```ml
function randomFloat(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L62)

- [mq3.client.cgame_particles.RenderAction](Type-mq3-client-cgame-particles-renderaction-1138860224.md) — struct
<a id="function-function-mq3-client-cgame-particles-renderfamily-function-renderfamily-type-src-mq3-client-cgame-particles-ml-767345878"></a>
### renderFamily

```ml
function renderFamily(type)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `type` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L110)

<a id="function-function-mq3-client-cgame-particles-resetparticle-function-resetparticle-p-src-mq3-client-cgame-particles-ml-1844249096"></a>
### resetParticle

```ml
function resetParticle(p)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L65)

<a id="function-function-mq3-client-cgame-particles-rotatebasis-function-rotatebasis-right-up-degrees-src-mq3-client-cgame-particles-ml-1660385856"></a>
### rotateBasis

```ml
function rotateBasis(right, up, degrees)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `right` | `dynamic` | — |  |
| `up` | `dynamic` | — |  |
| `degrees` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L95)

<a id="function-function-mq3-client-cgame-particles-setrandomints-function-setrandomints-state-values-src-mq3-client-cgame-particles-ml-154608153"></a>
### setRandomInts

```ml
function setRandomInts(state, values)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `values` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L57)

<a id="function-function-mq3-client-cgame-particles-shaderanimcounts-function-shaderanimcounts-src-mq3-client-cgame-particles-ml-1985238202"></a>
### shaderAnimCounts

```ml
function shaderAnimCounts()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L45)

<a id="function-function-mq3-client-cgame-particles-shaderanimnames-function-shaderanimnames-src-mq3-client-cgame-particles-ml-117802246"></a>
### shaderAnimNames

```ml
function shaderAnimNames()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L44)

<a id="function-function-mq3-client-cgame-particles-shaderanimratios-function-shaderanimratios-src-mq3-client-cgame-particles-ml-1814611534"></a>
### shaderAnimRatios

```ml
function shaderAnimRatios()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L46)

<a id="function-function-mq3-client-cgame-particles-snowlink-function-snowlink-state-id-particleon-src-mq3-client-cgame-particles-ml-725948611"></a>
### snowLink

```ml
function snowLink(state, id, particleOn)
```

CG_SnowLink

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `particleOn` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L227)

<a id="function-function-mq3-client-cgame-particles-spawnbase-function-spawnbase-state-shader-src-mq3-client-cgame-particles-ml-1723251518"></a>
### spawnBase

```ml
function spawnBase(state, shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L180)

- [mq3.client.cgame_particles.State](Type-mq3-client-cgame-particles-state-1124640035.md) — struct
<a id="function-function-mq3-client-cgame-particles-validbloodpool-function-validbloodpool-start-tracefn-context-src-mq3-client-cgame-particles-ml-396425298"></a>
### validBloodPool

```ml
function validBloodPool(start, traceFn, context)
```

ValidBloodPool. traceFn(context,start,finish) returns entityNum/startsolid/fraction.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `start` | `dynamic` | — |  |
| `traceFn` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L258)

<a id="function-function-mq3-client-cgame-particles-zero3-function-zero3-src-mq3-client-cgame-particles-ml-565007072"></a>
### zero3

```ml
function zero3()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_particles.ml#L42)
