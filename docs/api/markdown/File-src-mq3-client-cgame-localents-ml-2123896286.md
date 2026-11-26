# `src/mq3/client/cgame_localents.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cgame_localents`](Package-mq3-client-cgame-localents-592554794.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/cg_local.ml` as `cgabi` → [src/mq3/client/cg_local.ml](File-src-mq3-client-cg-local-ml-909335699.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/game/trajectory.ml` as `trajectory` → [src/mq3/game/trajectory.ml](File-src-mq3-game-trajectory-ml-1278285327.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

- [mq3.client.cgame_localents.Action](Type-mq3-client-cgame-localents-action-1817374782.md) — struct
<a id="function-function-mq3-client-cgame-localents-addexplosion-function-addexplosion-state-le-src-mq3-client-cgame-localents-ml-625884224"></a>
### addExplosion

```ml
function addExplosion(state, le)
```

CG_AddExplosion

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `le` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L173)

<a id="function-function-mq3-client-cgame-localents-addfadergb-function-addfadergb-state-le-src-mq3-client-cgame-localents-ml-990725916"></a>
### addFadeRGB

```ml
function addFadeRGB(state, le)
```

CG_AddFadeRGB

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `le` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L152)

<a id="function-function-mq3-client-cgame-localents-addfallscalefade-function-addfallscalefade-state-le-src-mq3-client-cgame-localents-ml-275019336"></a>
### addFallScaleFade

```ml
function addFallScaleFade(state, le)
```

CG_AddFallScaleFade

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `le` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L166)

<a id="function-function-mq3-client-cgame-localents-addfragment-function-addfragment-state-le-src-mq3-client-cgame-localents-ml-2013722758"></a>
### addFragment

```ml
function addFragment(state, le)
```

CG_AddFragment

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `le` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L135)

<a id="function-function-mq3-client-cgame-localents-addinvulnerabilityimpact-function-addinvulnerabilityimpact-state-le-src-mq3-client-cgame-localents-ml-212222948"></a>
### addInvulnerabilityImpact

```ml
function addInvulnerabilityImpact(state, le)
```

CG_AddInvulnerabilityImpact

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `le` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L201)

<a id="function-function-mq3-client-cgame-localents-addinvulnerabilityjuiced-function-addinvulnerabilityjuiced-state-le-src-mq3-client-cgame-localents-ml-1691652928"></a>
### addInvulnerabilityJuiced

```ml
function addInvulnerabilityJuiced(state, le)
```

CG_AddInvulnerabilityJuiced

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `le` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L204)

<a id="function-function-mq3-client-cgame-localents-addkamikaze-function-addkamikaze-state-le-src-mq3-client-cgame-localents-ml-1907390316"></a>
### addKamikaze

```ml
function addKamikaze(state, le)
```

CG_AddKamikaze

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `le` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L185)

<a id="function-function-mq3-client-cgame-localents-addlocalentities-function-addlocalentities-state-time-frametime-vieworg-src-mq3-client-cgame-localents-ml-578118357"></a>
### addLocalEntities

```ml
function addLocalEntities(state, time, frametime, vieworg)
```

CG_AddLocalEntities

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `frametime` | `dynamic` | — |  |
| `vieworg` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L242)

<a id="function-function-mq3-client-cgame-localents-addmovescalefade-function-addmovescalefade-state-le-src-mq3-client-cgame-localents-ml-529168064"></a>
### addMoveScaleFade

```ml
function addMoveScaleFade(state, le)
```

CG_AddMoveScaleFade

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `le` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L155)

<a id="function-function-mq3-client-cgame-localents-addrefentity-function-addrefentity-state-le-src-mq3-client-cgame-localents-ml-1238481932"></a>
### addRefEntity

```ml
function addRefEntity(state, le)
```

CG_AddRefEntity

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `le` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L210)

<a id="function-function-mq3-client-cgame-localents-addscalefade-function-addscalefade-state-le-src-mq3-client-cgame-localents-ml-488364176"></a>
### addScaleFade

```ml
function addScaleFade(state, le)
```

CG_AddScaleFade

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `le` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L163)

<a id="function-function-mq3-client-cgame-localents-addscoreplum-function-addscoreplum-state-le-src-mq3-client-cgame-localents-ml-579877612"></a>
### addScorePlum

```ml
function addScorePlum(state, le)
```

CG_AddScorePlum

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `le` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L216)

<a id="function-function-mq3-client-cgame-localents-addspriteexplosion-function-addspriteexplosion-state-le-src-mq3-client-cgame-localents-ml-1839238052"></a>
### addSpriteExplosion

```ml
function addSpriteExplosion(state, le)
```

CG_AddSpriteExplosion

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `le` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L176)

<a id="function-function-mq3-client-cgame-localents-alloclocalentity-function-alloclocalentity-state-src-mq3-client-cgame-localents-ml-233729137"></a>
### allocLocalEntity

```ml
function allocLocalEntity(state)
```

CG_AllocLocalEntity

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L91)

<a id="function-function-mq3-client-cgame-localents-anglestoaxis-function-anglestoaxis-angles-src-mq3-client-cgame-localents-ml-833977074"></a>
### anglesToAxis

```ml
function anglesToAxis(angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L132)

<a id="function-function-mq3-client-cgame-localents-bloodtrail-function-bloodtrail-state-le-src-mq3-client-cgame-localents-ml-279841580"></a>
### bloodTrail

```ml
function bloodTrail(state, le)
```

CG_BloodTrail (the ledger's spurious `way` candidate comes from this routine's prose).

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `le` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L106)

<a id="function-function-mq3-client-cgame-localents-boundary-function-boundary-state-boundaryname-kind-le-origin-normal-scalar-color-data-src-mq3-client-cgame-localents-ml-259384491"></a>
### boundary

```ml
function boundary(state, boundaryName, kind, le, origin, normal, scalar, color, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `boundaryName` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `le` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `scalar` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L97)

<a id="function-function-mq3-client-cgame-localents-clearboundaryactions-function-clearboundaryactions-state-src-mq3-client-cgame-localents-ml-257064493"></a>
### clearBoundaryActions

```ml
function clearBoundaryActions(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L247)

<a id="constant-constant-mq3-client-cgame-localents-contents-nodrop-const-contents-nodrop-2147483648-src-mq3-client-cgame-localents-ml-1890346980"></a>
### CONTENTS_NODROP

```ml
const CONTENTS_NODROP = 2147483648
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L15)

<a id="function-function-mq3-client-cgame-localents-defaultpointcontents-function-defaultpointcontents-context-point-src-mq3-client-cgame-localents-ml-306595575"></a>
### defaultPointContents

```ml
function defaultPointContents(context, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L69)

<a id="function-function-mq3-client-cgame-localents-defaultrandom-function-defaultrandom-context-src-mq3-client-cgame-localents-ml-1139764423"></a>
### defaultRandom

```ml
function defaultRandom(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L70)

<a id="function-function-mq3-client-cgame-localents-defaultservices-function-defaultservices-src-mq3-client-cgame-localents-ml-2041069256"></a>
### defaultServices

```ml
function defaultServices()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L71)

<a id="function-function-mq3-client-cgame-localents-defaulttrace-function-defaulttrace-context-start-finish-src-mq3-client-cgame-localents-ml-1830361736"></a>
### defaultTrace

```ml
function defaultTrace(context, start, finish)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L68)

<a id="function-function-mq3-client-cgame-localents-dispatchlocalentity-function-dispatchlocalentity-state-le-src-mq3-client-cgame-localents-ml-323062168"></a>
### dispatchLocalEntity

```ml
function dispatchLocalEntity(state, le)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `le` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L222)

<a id="function-function-mq3-client-cgame-localents-dynamiclight-function-dynamiclight-state-le-origin-progress-src-mq3-client-cgame-localents-ml-211956979"></a>
### dynamicLight

```ml
function dynamicLight(state, le, origin, progress)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `le` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `progress` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L168)

<a id="function-function-mq3-client-cgame-localents-fragmentbouncemark-function-fragmentbouncemark-state-le-trace-src-mq3-client-cgame-localents-ml-1308133871"></a>
### fragmentBounceMark

```ml
function fragmentBounceMark(state, le, trace)
```

CG_FragmentBounceMark

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `le` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L114)

<a id="function-function-mq3-client-cgame-localents-fragmentbouncesound-function-fragmentbouncesound-state-le-trace-src-mq3-client-cgame-localents-ml-1466933533"></a>
### fragmentBounceSound

```ml
function fragmentBounceSound(state, le, trace)
```

CG_FragmentBounceSound

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `le` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L121)

<a id="function-function-mq3-client-cgame-localents-freelocalentity-function-freelocalentity-state-le-src-mq3-client-cgame-localents-ml-1431557008"></a>
### freeLocalEntity

```ml
function freeLocalEntity(state, le)
```

CG_FreeLocalEntity

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `le` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L85)

<a id="function-function-mq3-client-cgame-localents-identityaxis-function-identityaxis-src-mq3-client-cgame-localents-ml-1665086826"></a>
### identityAxis

```ml
function identityAxis()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L64)

<a id="function-function-mq3-client-cgame-localents-initlocalentities-function-initlocalentities-services-retailactive-src-mq3-client-cgame-localents-ml-668560581"></a>
### initLocalEntities

```ml
function initLocalEntities(services, retailActive)
```

CG_InitLocalEntities

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L74)

<a id="constant-constant-mq3-client-cgame-localents-kami-boomsphere-maxradius-const-kami-boomsphere-maxradius-720-src-mq3-client-cgame-localents-ml-1637825726"></a>
### KAMI_BOOMSPHERE_MAXRADIUS

```ml
const KAMI_BOOMSPHERE_MAXRADIUS = 720
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L55)

<a id="constant-constant-mq3-client-cgame-localents-kami-boomspheremodel-radius-const-kami-boomspheremodel-radius-72-src-mq3-client-cgame-localents-ml-371014216"></a>
### KAMI_BOOMSPHEREMODEL_RADIUS

```ml
const KAMI_BOOMSPHEREMODEL_RADIUS = 72
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L53)

<a id="constant-constant-mq3-client-cgame-localents-kami-explode-starttime-const-kami-explode-starttime-250-src-mq3-client-cgame-localents-ml-254203576"></a>
### KAMI_EXPLODE_STARTTIME

```ml
const KAMI_EXPLODE_STARTTIME = 250
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L46)

<a id="constant-constant-mq3-client-cgame-localents-kami-implode-endtime-const-kami-implode-endtime-2250-src-mq3-client-cgame-localents-ml-531334974"></a>
### KAMI_IMPLODE_ENDTIME

```ml
const KAMI_IMPLODE_ENDTIME = 2250
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L48)

<a id="constant-constant-mq3-client-cgame-localents-kami-implode-starttime-const-kami-implode-starttime-2000-src-mq3-client-cgame-localents-ml-1648443139"></a>
### KAMI_IMPLODE_STARTTIME

```ml
const KAMI_IMPLODE_STARTTIME = 2000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L47)

<a id="constant-constant-mq3-client-cgame-localents-kami-shockwave2-endtime-const-kami-shockwave2-endtime-3000-src-mq3-client-cgame-localents-ml-394094270"></a>
### KAMI_SHOCKWAVE2_ENDTIME

```ml
const KAMI_SHOCKWAVE2_ENDTIME = 3000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L51)

<a id="constant-constant-mq3-client-cgame-localents-kami-shockwave2-maxradius-const-kami-shockwave2-maxradius-704-src-mq3-client-cgame-localents-ml-598298268"></a>
### KAMI_SHOCKWAVE2_MAXRADIUS

```ml
const KAMI_SHOCKWAVE2_MAXRADIUS = 704
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L56)

<a id="constant-constant-mq3-client-cgame-localents-kami-shockwave2-starttime-const-kami-shockwave2-starttime-2000-src-mq3-client-cgame-localents-ml-1186654803"></a>
### KAMI_SHOCKWAVE2_STARTTIME

```ml
const KAMI_SHOCKWAVE2_STARTTIME = 2000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L49)

<a id="constant-constant-mq3-client-cgame-localents-kami-shockwave2fade-starttime-const-kami-shockwave2fade-starttime-2500-src-mq3-client-cgame-localents-ml-464888172"></a>
### KAMI_SHOCKWAVE2FADE_STARTTIME

```ml
const KAMI_SHOCKWAVE2FADE_STARTTIME = 2500
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L50)

<a id="constant-constant-mq3-client-cgame-localents-kami-shockwave-endtime-const-kami-shockwave-endtime-2000-src-mq3-client-cgame-localents-ml-1193684111"></a>
### KAMI_SHOCKWAVE_ENDTIME

```ml
const KAMI_SHOCKWAVE_ENDTIME = 2000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L45)

<a id="constant-constant-mq3-client-cgame-localents-kami-shockwave-maxradius-const-kami-shockwave-maxradius-1320-src-mq3-client-cgame-localents-ml-2090924771"></a>
### KAMI_SHOCKWAVE_MAXRADIUS

```ml
const KAMI_SHOCKWAVE_MAXRADIUS = 1320
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L54)

<a id="constant-constant-mq3-client-cgame-localents-kami-shockwave-starttime-const-kami-shockwave-starttime-0-src-mq3-client-cgame-localents-ml-2118728899"></a>
### KAMI_SHOCKWAVE_STARTTIME

```ml
const KAMI_SHOCKWAVE_STARTTIME = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L43)

<a id="constant-constant-mq3-client-cgame-localents-kami-shockwavefade-starttime-const-kami-shockwavefade-starttime-1500-src-mq3-client-cgame-localents-ml-344017021"></a>
### KAMI_SHOCKWAVEFADE_STARTTIME

```ml
const KAMI_SHOCKWAVEFADE_STARTTIME = 1500
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L44)

<a id="constant-constant-mq3-client-cgame-localents-kami-shockwavemodel-radius-const-kami-shockwavemodel-radius-88-src-mq3-client-cgame-localents-ml-1976883395"></a>
### KAMI_SHOCKWAVEMODEL_RADIUS

```ml
const KAMI_SHOCKWAVEMODEL_RADIUS = 88
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L52)

<a id="function-function-mq3-client-cgame-localents-kamiwave-function-kamiwave-state-le-kind-t-starttime-fadetime-endtime-maxradius-angles-src-mq3-client-cgame-localents-ml-232731464"></a>
### kamiWave

```ml
function kamiWave(state, le, kind, t, startTime, fadeTime, endTime, maxRadius, angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `le` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `t` | `dynamic` | — |  |
| `startTime` | `dynamic` | — |  |
| `fadeTime` | `dynamic` | — |  |
| `endTime` | `dynamic` | — |  |
| `maxRadius` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L180)

<a id="constant-constant-mq3-client-cgame-localents-le-explosion-const-le-explosion-cgabi-le-explosion-src-mq3-client-cgame-localents-ml-2145192488"></a>
### LE_EXPLOSION

```ml
const LE_EXPLOSION = cgabi.LE_EXPLOSION
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L20)

<a id="constant-constant-mq3-client-cgame-localents-le-fade-rgb-const-le-fade-rgb-cgabi-le-fade-rgb-src-mq3-client-cgame-localents-ml-446092221"></a>
### LE_FADE_RGB

```ml
const LE_FADE_RGB = cgabi.LE_FADE_RGB
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L25)

<a id="constant-constant-mq3-client-cgame-localents-le-fall-scale-fade-const-le-fall-scale-fade-cgabi-le-fall-scale-fade-src-mq3-client-cgame-localents-ml-62957340"></a>
### LE_FALL_SCALE_FADE

```ml
const LE_FALL_SCALE_FADE = cgabi.LE_FALL_SCALE_FADE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L24)

<a id="constant-constant-mq3-client-cgame-localents-le-fragment-const-le-fragment-cgabi-le-fragment-src-mq3-client-cgame-localents-ml-321371131"></a>
### LE_FRAGMENT

```ml
const LE_FRAGMENT = cgabi.LE_FRAGMENT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L22)

<a id="constant-constant-mq3-client-cgame-localents-le-invulimpact-const-le-invulimpact-cgabi-le-invulimpact-src-mq3-client-cgame-localents-ml-895831813"></a>
### LE_INVULIMPACT

```ml
const LE_INVULIMPACT = cgabi.LE_INVULIMPACT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L29)

<a id="constant-constant-mq3-client-cgame-localents-le-invuljuiced-const-le-invuljuiced-cgabi-le-invuljuiced-src-mq3-client-cgame-localents-ml-133666619"></a>
### LE_INVULJUICED

```ml
const LE_INVULJUICED = cgabi.LE_INVULJUICED
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L30)

<a id="constant-constant-mq3-client-cgame-localents-le-kamikaze-const-le-kamikaze-cgabi-le-kamikaze-src-mq3-client-cgame-localents-ml-956882932"></a>
### LE_KAMIKAZE

```ml
const LE_KAMIKAZE = cgabi.LE_KAMIKAZE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L28)

<a id="constant-constant-mq3-client-cgame-localents-le-mark-const-le-mark-cgabi-le-mark-src-mq3-client-cgame-localents-ml-1549313890"></a>
### LE_MARK

```ml
const LE_MARK = cgabi.LE_MARK
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L19)

<a id="constant-constant-mq3-client-cgame-localents-le-move-scale-fade-const-le-move-scale-fade-cgabi-le-move-scale-fade-src-mq3-client-cgame-localents-ml-1408062356"></a>
### LE_MOVE_SCALE_FADE

```ml
const LE_MOVE_SCALE_FADE = cgabi.LE_MOVE_SCALE_FADE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L23)

<a id="constant-constant-mq3-client-cgame-localents-le-scale-fade-const-le-scale-fade-cgabi-le-scale-fade-src-mq3-client-cgame-localents-ml-855992050"></a>
### LE_SCALE_FADE

```ml
const LE_SCALE_FADE = cgabi.LE_SCALE_FADE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L26)

<a id="constant-constant-mq3-client-cgame-localents-le-scoreplum-const-le-scoreplum-cgabi-le-scoreplum-src-mq3-client-cgame-localents-ml-2032573441"></a>
### LE_SCOREPLUM

```ml
const LE_SCOREPLUM = cgabi.LE_SCOREPLUM
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L27)

<a id="constant-constant-mq3-client-cgame-localents-le-showrefentity-const-le-showrefentity-cgabi-le-showrefentity-src-mq3-client-cgame-localents-ml-1809708358"></a>
### LE_SHOWREFENTITY

```ml
const LE_SHOWREFENTITY = cgabi.LE_SHOWREFENTITY
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L31)

<a id="constant-constant-mq3-client-cgame-localents-le-sprite-explosion-const-le-sprite-explosion-cgabi-le-sprite-explosion-src-mq3-client-cgame-localents-ml-924519374"></a>
### LE_SPRITE_EXPLOSION

```ml
const LE_SPRITE_EXPLOSION = cgabi.LE_SPRITE_EXPLOSION
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L21)

<a id="constant-constant-mq3-client-cgame-localents-lebs-blood-const-lebs-blood-cgabi-lebs-blood-src-mq3-client-cgame-localents-ml-2048362992"></a>
### LEBS_BLOOD

```ml
const LEBS_BLOOD = cgabi.LEBS_BLOOD
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L40)

<a id="constant-constant-mq3-client-cgame-localents-lebs-brass-const-lebs-brass-cgabi-lebs-brass-src-mq3-client-cgame-localents-ml-70511571"></a>
### LEBS_BRASS

```ml
const LEBS_BRASS = cgabi.LEBS_BRASS
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L41)

<a id="constant-constant-mq3-client-cgame-localents-lebs-none-const-lebs-none-cgabi-lebs-none-src-mq3-client-cgame-localents-ml-1572049184"></a>
### LEBS_NONE

```ml
const LEBS_NONE = cgabi.LEBS_NONE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L39)

<a id="constant-constant-mq3-client-cgame-localents-lef-puff-dont-scale-const-lef-puff-dont-scale-cgabi-lef-puff-dont-scale-src-mq3-client-cgame-localents-ml-2014183453"></a>
### LEF_PUFF_DONT_SCALE

```ml
const LEF_PUFF_DONT_SCALE = cgabi.LEF_PUFF_DONT_SCALE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L32)

<a id="constant-constant-mq3-client-cgame-localents-lef-sound1-const-lef-sound1-cgabi-lef-sound1-src-mq3-client-cgame-localents-ml-1009701267"></a>
### LEF_SOUND1

```ml
const LEF_SOUND1 = cgabi.LEF_SOUND1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L34)

<a id="constant-constant-mq3-client-cgame-localents-lef-sound2-const-lef-sound2-cgabi-lef-sound2-src-mq3-client-cgame-localents-ml-882660800"></a>
### LEF_SOUND2

```ml
const LEF_SOUND2 = cgabi.LEF_SOUND2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L35)

<a id="constant-constant-mq3-client-cgame-localents-lef-tumble-const-lef-tumble-cgabi-lef-tumble-src-mq3-client-cgame-localents-ml-589064840"></a>
### LEF_TUMBLE

```ml
const LEF_TUMBLE = cgabi.LEF_TUMBLE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L33)

<a id="constant-constant-mq3-client-cgame-localents-lemt-blood-const-lemt-blood-cgabi-lemt-blood-src-mq3-client-cgame-localents-ml-89045566"></a>
### LEMT_BLOOD

```ml
const LEMT_BLOOD = cgabi.LEMT_BLOOD
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L38)

<a id="constant-constant-mq3-client-cgame-localents-lemt-burn-const-lemt-burn-cgabi-lemt-burn-src-mq3-client-cgame-localents-ml-617040617"></a>
### LEMT_BURN

```ml
const LEMT_BURN = cgabi.LEMT_BURN
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L37)

<a id="constant-constant-mq3-client-cgame-localents-lemt-none-const-lemt-none-cgabi-lemt-none-src-mq3-client-cgame-localents-ml-1633546102"></a>
### LEMT_NONE

```ml
const LEMT_NONE = cgabi.LEMT_NONE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L36)

- [mq3.client.cgame_localents.LocalEntity](Type-mq3-client-cgame-localents-localentity-257810064.md) — struct
<a id="function-function-mq3-client-cgame-localents-mark-function-mark-state-kind-le-origin-normal-scalar-orientation-src-mq3-client-cgame-localents-ml-1584595213"></a>
### mark

```ml
function mark(state, kind, le, origin, normal, scalar, orientation)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `le` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `scalar` | `dynamic` | — |  |
| `orientation` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L103)

<a id="constant-constant-mq3-client-cgame-localents-max-local-entities-const-max-local-entities-512-src-mq3-client-cgame-localents-ml-399103215"></a>
### MAX_LOCAL_ENTITIES

```ml
const MAX_LOCAL_ENTITIES = 512
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L13)

<a id="function-function-mq3-client-cgame-localents-nearview-function-nearview-state-origin-radius-src-mq3-client-cgame-localents-ml-1120081737"></a>
### nearView

```ml
function nearView(state, origin, radius)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L149)

<a id="function-function-mq3-client-cgame-localents-newlocalentity-function-newlocalentity-id-src-mq3-client-cgame-localents-ml-969776797"></a>
### newLocalEntity

```ml
function newLocalEntity(id)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `id` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L67)

<a id="function-function-mq3-client-cgame-localents-newrefentity-function-newrefentity-src-mq3-client-cgame-localents-ml-2093013094"></a>
### newRefEntity

```ml
function newRefEntity()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L65)

<a id="function-function-mq3-client-cgame-localents-newtrajectory-function-newtrajectory-src-mq3-client-cgame-localents-ml-1630612868"></a>
### newTrajectory

```ml
function newTrajectory()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L66)

<a id="constant-constant-mq3-client-cgame-localents-number-size-const-number-size-8-src-mq3-client-cgame-localents-ml-1177058693"></a>
### NUMBER_SIZE

```ml
const NUMBER_SIZE = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L42)

- [mq3.client.cgame_localents.RefEntity](Type-mq3-client-cgame-localents-refentity-663752502.md) — struct
<a id="function-function-mq3-client-cgame-localents-reflectvelocity-function-reflectvelocity-state-le-trace-src-mq3-client-cgame-localents-ml-800018583"></a>
### reflectVelocity

```ml
function reflectVelocity(state, le, trace)
```

CG_ReflectVelocity

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `le` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L127)

<a id="function-function-mq3-client-cgame-localents-remainingfraction-function-remainingfraction-state-le-src-mq3-client-cgame-localents-ml-796774952"></a>
### remainingFraction

```ml
function remainingFraction(state, le)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `le` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L148)

<a id="function-function-mq3-client-cgame-localents-render-function-render-state-kind-le-origin-scalar-color-data-src-mq3-client-cgame-localents-ml-1156437461"></a>
### render

```ml
function render(state, kind, le, origin, scalar, color, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `le` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `scalar` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L101)

<a id="function-function-mq3-client-cgame-localents-resetlocalentity-function-resetlocalentity-le-src-mq3-client-cgame-localents-ml-1003827443"></a>
### resetLocalEntity

```ml
function resetLocalEntity(le)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `le` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L80)

<a id="constant-constant-mq3-client-cgame-localents-rf-lighting-origin-const-rf-lighting-origin-128-src-mq3-client-cgame-localents-ml-2136918682"></a>
### RF_LIGHTING_ORIGIN

```ml
const RF_LIGHTING_ORIGIN = 128
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L18)

<a id="constant-constant-mq3-client-cgame-localents-rt-sprite-const-rt-sprite-2-src-mq3-client-cgame-localents-ml-117418831"></a>
### RT_SPRITE

```ml
const RT_SPRITE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L17)

<a id="function-function-mq3-client-cgame-localents-scorecolor-function-scorecolor-score-src-mq3-client-cgame-localents-ml-314980268"></a>
### scoreColor

```ml
function scoreColor(score)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `score` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L212)

<a id="function-function-mq3-client-cgame-localents-scoredigits-function-scoredigits-score-src-mq3-client-cgame-localents-ml-1294611456"></a>
### scoreDigits

```ml
function scoreDigits(score)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `score` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L213)

- [mq3.client.cgame_localents.Services](Type-mq3-client-cgame-localents-services-858672036.md) — struct
<a id="constant-constant-mq3-client-cgame-localents-sink-time-const-sink-time-cgabi-sink-time-src-mq3-client-cgame-localents-ml-1178244138"></a>
### SINK_TIME

```ml
const SINK_TIME = cgabi.SINK_TIME
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L14)

<a id="function-function-mq3-client-cgame-localents-sound-function-sound-state-kind-le-origin-data-src-mq3-client-cgame-localents-ml-2137917742"></a>
### sound

```ml
function sound(state, kind, le, origin, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `le` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L102)

- [mq3.client.cgame_localents.State](Type-mq3-client-cgame-localents-state-1933874705.md) — struct
<a id="constant-constant-mq3-client-cgame-localents-tr-stationary-const-tr-stationary-0-src-mq3-client-cgame-localents-ml-1511339213"></a>
### TR_STATIONARY

```ml
const TR_STATIONARY = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_localents.ml#L16)
