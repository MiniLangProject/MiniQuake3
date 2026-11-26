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
| `state` | `dynamic` | — | Record read through `state.time`. |
| `le` | `dynamic` | — | Local effect entity whose lifetime and rendering state are maintained client-side. Record read through `le.refEntity.origin`, `le.refEntity.radius`, `le.refEntity.shaderRGBA`, `le.startTime` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L452)

<a id="function-function-mq3-client-cgame-localents-addfadergb-function-addfadergb-state-le-src-mq3-client-cgame-localents-ml-990725916"></a>
### addFadeRGB

```ml
function addFadeRGB(state, le)
```

CG_AddFadeRGB

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game localents state passed to the helper calls in `addFadeRGB`. |
| `le` | `dynamic` | — | Mutable client game localents record/storage; this routine assigns `le.refEntity.shaderRGBA`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L418)

<a id="function-function-mq3-client-cgame-localents-addfallscalefade-function-addfallscalefade-state-le-src-mq3-client-cgame-localents-ml-275019336"></a>
### addFallScaleFade

```ml
function addFallScaleFade(state, le)
```

CG_AddFallScaleFade

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game localents state passed to the helper calls in `addFallScaleFade`. |
| `le` | `dynamic` | — | Mutable client game localents record/storage; this routine assigns `le.refEntity.shaderRGBA[3]`, `le.refEntity.origin[2]`, `le.refEntity.radius`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L438)

<a id="function-function-mq3-client-cgame-localents-addfragment-function-addfragment-state-le-src-mq3-client-cgame-localents-ml-2013722758"></a>
### addFragment

```ml
function addFragment(state, le)
```

CG_AddFragment

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`, `state.services.traceFn`, `state.services.context`, `state.services.pointContentsFn`. |
| `le` | `dynamic` | — | Mutable client game localents record/storage; this routine assigns `le.refEntity.lightingOrigin`, `le.refEntity.renderfx`, `le.refEntity.origin`, `le.refEntity.axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L392)

<a id="function-function-mq3-client-cgame-localents-addinvulnerabilityimpact-function-addinvulnerabilityimpact-state-le-src-mq3-client-cgame-localents-ml-212222948"></a>
### addInvulnerabilityImpact

```ml
function addInvulnerabilityImpact(state, le)
```

CG_AddInvulnerabilityImpact

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_localents.render`. |
| `le` | `dynamic` | — | Local effect entity whose lifetime and rendering state are maintained client-side. Record read through `le.refEntity.origin`, `le.refEntity.radius`, `le.refEntity.shaderRGBA`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L496)

<a id="function-function-mq3-client-cgame-localents-addinvulnerabilityjuiced-function-addinvulnerabilityjuiced-state-le-src-mq3-client-cgame-localents-ml-1691652928"></a>
### addInvulnerabilityJuiced

```ml
function addInvulnerabilityJuiced(state, le)
```

CG_AddInvulnerabilityJuiced

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `le` | `dynamic` | — | Mutable client game localents record/storage; this routine assigns `le.refEntity.axis[0][0]`, `le.refEntity.axis[1][1]`, `le.refEntity.axis[2][2]`, `le.endTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L501)

<a id="function-function-mq3-client-cgame-localents-addkamikaze-function-addkamikaze-state-le-src-mq3-client-cgame-localents-ml-1907390316"></a>
### addKamikaze

```ml
function addKamikaze(state, le)
```

CG_AddKamikaze

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`, `state.services.randomFn`, `state.services.context`. |
| `le` | `dynamic` | — | Mutable client game localents record/storage; this routine assigns `le.leFlags`, `le.refEntity.shaderRGBA`, `le.angles.trBase`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L478)

<a id="function-function-mq3-client-cgame-localents-addlocalentities-function-addlocalentities-state-time-frametime-vieworg-src-mq3-client-cgame-localents-ml-578118357"></a>
### addLocalEntities

```ml
function addLocalEntities(state, time, frametime, vieworg)
```

CG_AddLocalEntities

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game localents record/storage; this routine assigns `state.time`, `state.frametime`, `state.vieworg`. |
| `time` | `dynamic` | — | Value assigned to `state.time`. |
| `frametime` | `dynamic` | — | Value assigned to `state.frametime`. |
| `vieworg` | `dynamic` | — | Value assigned to `state.vieworg`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L554)

<a id="function-function-mq3-client-cgame-localents-addmovescalefade-function-addmovescalefade-state-le-src-mq3-client-cgame-localents-ml-529168064"></a>
### addMoveScaleFade

```ml
function addMoveScaleFade(state, le)
```

CG_AddMoveScaleFade

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `le` | `dynamic` | — | Mutable client game localents record/storage; this routine assigns `le.refEntity.shaderRGBA[3]`, `le.refEntity.radius`, `le.refEntity.origin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L423)

<a id="function-function-mq3-client-cgame-localents-addrefentity-function-addrefentity-state-le-src-mq3-client-cgame-localents-ml-1238481932"></a>
### addRefEntity

```ml
function addRefEntity(state, le)
```

CG_AddRefEntity

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `le` | `dynamic` | — | Local effect entity whose lifetime and rendering state are maintained client-side. Record read through `le.endTime`, `le.refEntity.origin`, `le.refEntity.radius`, `le.refEntity.shaderRGBA`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L509)

<a id="function-function-mq3-client-cgame-localents-addscalefade-function-addscalefade-state-le-src-mq3-client-cgame-localents-ml-488364176"></a>
### addScaleFade

```ml
function addScaleFade(state, le)
```

CG_AddScaleFade

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game localents state passed to the helper calls in `addScaleFade`. |
| `le` | `dynamic` | — | Mutable client game localents record/storage; this routine assigns `le.refEntity.shaderRGBA[3]`, `le.refEntity.radius`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L433)

<a id="function-function-mq3-client-cgame-localents-addscoreplum-function-addscoreplum-state-le-src-mq3-client-cgame-localents-ml-579877612"></a>
### addScorePlum

```ml
function addScorePlum(state, le)
```

CG_AddScorePlum

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.vieworg`. |
| `le` | `dynamic` | — | Mutable client game localents record/storage; this routine assigns `le.refEntity.radius`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L521)

<a id="function-function-mq3-client-cgame-localents-addspriteexplosion-function-addspriteexplosion-state-le-src-mq3-client-cgame-localents-ml-1839238052"></a>
### addSpriteExplosion

```ml
function addSpriteExplosion(state, le)
```

CG_AddSpriteExplosion

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `le` | `dynamic` | — | Local effect entity whose lifetime and rendering state are maintained client-side. Record read through `le.endTime`, `le.startTime`, `le.refEntity.origin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L457)

<a id="function-function-mq3-client-cgame-localents-alloclocalentity-function-alloclocalentity-state-src-mq3-client-cgame-localents-ml-233729137"></a>
### allocLocalEntity

```ml
function allocLocalEntity(state)
```

CG_AllocLocalEntity

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game localents record/storage; this routine assigns `state.free`, `state.active`, `state.spawned`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L301)

<a id="function-function-mq3-client-cgame-localents-anglestoaxis-function-anglestoaxis-angles-src-mq3-client-cgame-localents-ml-833977074"></a>
### anglesToAxis

```ml
function anglesToAxis(angles)
```

Calls `mq3.shared.math.AngleVectors`, `mq3.shared.math.VectorScale` from client game localents `anglesToAxis`. The final path returns `[basis[0],qmath.VectorScale(basis[1],-1.0),basis[2]]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angles` | `dynamic` | — | Value used by `basis=qmath.AngleVectors(angles)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L387)

<a id="function-function-mq3-client-cgame-localents-bloodtrail-function-bloodtrail-state-le-src-mq3-client-cgame-localents-ml-279841580"></a>
### bloodTrail

```ml
function bloodTrail(state, le)
```

CG_BloodTrail (the ledger's spurious `way` candidate comes from this routine's prose).

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`, `state.frametime`. |
| `le` | `dynamic` | — | Local effect entity whose lifetime and rendering state are maintained client-side. Record read through `le.pos`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L350)

<a id="function-function-mq3-client-cgame-localents-boundary-function-boundary-state-boundaryname-kind-le-origin-normal-scalar-color-data-src-mq3-client-cgame-localents-ml-259384491"></a>
### boundary

```ml
function boundary(state, boundaryName, kind, le, origin, normal, scalar, color, data)
```

Updates `state.actions`, `state.rendered`, `state.audio`, `state.marks` during client game localents `boundary`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game localents record/storage; this routine assigns `state.actions`, `state.rendered`, `state.audio`, `state.marks`. |
| `boundaryName` | `dynamic` | — | Value used by `item=Action(boundaryName,kind,le.id,origin,normal,scalar,color,data,not state.retailActive)`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `le` | `dynamic` | — | Local effect entity whose lifetime and rendering state are maintained client-side. Record read through `le.id`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `normal` | `dynamic` | — | Surface-normal vector used to orient or offset the effect. |
| `scalar` | `dynamic` | — | Value used by `item=Action(boundaryName,kind,le.id,origin,normal,scalar,color,data,not state.retailActive)`. |
| `color` | `dynamic` | — | Color value used by the client game localents drawing or interpolation operation. |
| `data` | `dynamic` | — | Value used by `item=Action(boundaryName,kind,le.id,origin,normal,scalar,color,data,not state.retailActive)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L317)

<a id="function-function-mq3-client-cgame-localents-clearboundaryactions-function-clearboundaryactions-state-src-mq3-client-cgame-localents-ml-257064493"></a>
### clearBoundaryActions

```ml
function clearBoundaryActions(state)
```

Updates `state.actions`, `state.rendered`, `state.audio`, `state.marks` during client game localents `clearBoundaryActions`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game localents record/storage; this routine assigns `state.actions`, `state.rendered`, `state.audio`, `state.marks`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L561)

<a id="constant-constant-mq3-client-cgame-localents-contents-nodrop-const-contents-nodrop-2147483648-src-mq3-client-cgame-localents-ml-1890346980"></a>
### CONTENTS_NODROP

```ml
const CONTENTS_NODROP = 2147483648
```

Collision-content bit identifying nodrop volumes or surfaces during client traces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L18)

<a id="function-function-mq3-client-cgame-localents-defaultpointcontents-function-defaultpointcontents-context-point-src-mq3-client-cgame-localents-ml-306595575"></a>
### defaultPointContents

```ml
function defaultPointContents(context, point)
```

Returns the fixed `0` value for client game localents `defaultPointContents`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Accepted for compatibility with `defaultPointContents`; the current implementation does not read it. |
| `point` | `dynamic` | — | Accepted for compatibility with `defaultPointContents`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L269)

<a id="function-function-mq3-client-cgame-localents-defaultrandom-function-defaultrandom-context-src-mq3-client-cgame-localents-ml-1139764423"></a>
### defaultRandom

```ml
function defaultRandom(context)
```

Returns the fixed `0` value for client game localents `defaultRandom`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Accepted for compatibility with `defaultRandom`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L272)

<a id="function-function-mq3-client-cgame-localents-defaultservices-function-defaultservices-src-mq3-client-cgame-localents-ml-2041069256"></a>
### defaultServices

```ml
function defaultServices()
```

Creates a `mq3.client.cgame_localents.Services` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L274)

<a id="function-function-mq3-client-cgame-localents-defaulttrace-function-defaulttrace-context-start-finish-src-mq3-client-cgame-localents-ml-1830361736"></a>
### defaultTrace

```ml
function defaultTrace(context, start, finish)
```

Reads `void` for client game localents `defaultTrace`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Accepted for compatibility with `defaultTrace`; the current implementation does not read it. |
| `start` | `dynamic` | — | Accepted for compatibility with `defaultTrace`; the current implementation does not read it. |
| `finish` | `dynamic` | — | Accepted for compatibility with `defaultTrace`; the current implementation does not read it. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L265)

<a id="function-function-mq3-client-cgame-localents-dispatchlocalentity-function-dispatchlocalentity-state-le-src-mq3-client-cgame-localents-ml-323062168"></a>
### dispatchLocalEntity

```ml
function dispatchLocalEntity(state, le)
```

Updates `state.errors` during client game localents `dispatchLocalEntity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game localents record/storage; this routine assigns `state.errors`. |
| `le` | `dynamic` | — | Local effect entity whose lifetime and rendering state are maintained client-side. Record read through `le.leType`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L530)

<a id="function-function-mq3-client-cgame-localents-dynamiclight-function-dynamiclight-state-le-origin-progress-src-mq3-client-cgame-localents-ml-211956979"></a>
### dynamicLight

```ml
function dynamicLight(state, le, origin, progress)
```

Calls `mq3.client.cgame_localents.render` from client game localents `dynamicLight`. The final path returns `render(state,"dynamic-light",le,origin,intensity,le.lightColor,void)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game localents state passed to the helper calls in `dynamicLight`. |
| `le` | `dynamic` | — | Local effect entity whose lifetime and rendering state are maintained client-side. Record read through `le.light`, `le.lightColor`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `progress` | `dynamic` | — | Value used by `if progress<0.5 then intensity=le.light else intensity=le.light*(1.0-(progress-0.5)*2.0) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L445)

<a id="function-function-mq3-client-cgame-localents-fragmentbouncemark-function-fragmentbouncemark-state-le-trace-src-mq3-client-cgame-localents-ml-1308133871"></a>
### fragmentBounceMark

```ml
function fragmentBounceMark(state, le, trace)
```

CG_FragmentBounceMark

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.services.randomFn`, `state.services.context`. |
| `le` | `dynamic` | — | Mutable client game localents record/storage; this routine assigns `le.leMarkType`. |
| `trace` | `dynamic` | — | Record read through `trace.endpos`, `trace.normal`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L361)

<a id="function-function-mq3-client-cgame-localents-fragmentbouncesound-function-fragmentbouncesound-state-le-trace-src-mq3-client-cgame-localents-ml-1466933533"></a>
### fragmentBounceSound

```ml
function fragmentBounceSound(state, le, trace)
```

CG_FragmentBounceSound

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.services.randomFn`, `state.services.context`. |
| `le` | `dynamic` | — | Mutable client game localents record/storage; this routine assigns `le.leBounceSoundType`. |
| `trace` | `dynamic` | — | Record read through `trace.endpos`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L371)

<a id="function-function-mq3-client-cgame-localents-freelocalentity-function-freelocalentity-state-le-src-mq3-client-cgame-localents-ml-1431557008"></a>
### freeLocalEntity

```ml
function freeLocalEntity(state, le)
```

CG_FreeLocalEntity

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable client game localents record/storage; this routine assigns `state.errors`, `state.active`, `state.free`, `state.freed`. |
| `le` | `dynamic` | — | Mutable client game localents record/storage; this routine assigns `le.active`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L294)

<a id="function-function-mq3-client-cgame-localents-identityaxis-function-identityaxis-src-mq3-client-cgame-localents-ml-1665086826"></a>
### identityAxis

```ml
function identityAxis()
```

Creates the three orthonormal unit axes used as the identity orientation in client game localents.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L253)

<a id="function-function-mq3-client-cgame-localents-initlocalentities-function-initlocalentities-services-retailactive-src-mq3-client-cgame-localents-ml-668560581"></a>
### initLocalEntities

```ml
function initLocalEntities(services, retailActive)
```

CG_InitLocalEntities

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | services record passed to the client game localents helper calls. |
| `retailActive` | `dynamic` | — | Whether the retail QVM owns dispatch; action records use the inverse for their dispatched flag. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L279)

<a id="constant-constant-mq3-client-cgame-localents-kami-boomsphere-maxradius-const-kami-boomsphere-maxradius-720-src-mq3-client-cgame-localents-ml-1637825726"></a>
### KAMI_BOOMSPHERE_MAXRADIUS

```ml
const KAMI_BOOMSPHERE_MAXRADIUS = 720
```

Kamikaze-effect radius parameter for boomsphere ma geometry, in world units.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L101)

<a id="constant-constant-mq3-client-cgame-localents-kami-boomspheremodel-radius-const-kami-boomspheremodel-radius-72-src-mq3-client-cgame-localents-ml-371014216"></a>
### KAMI_BOOMSPHEREMODEL_RADIUS

```ml
const KAMI_BOOMSPHEREMODEL_RADIUS = 72
```

Kamikaze-effect radius parameter for boomspheremodel geometry, in world units.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L97)

<a id="constant-constant-mq3-client-cgame-localents-kami-explode-starttime-const-kami-explode-starttime-250-src-mq3-client-cgame-localents-ml-254203576"></a>
### KAMI_EXPLODE_STARTTIME

```ml
const KAMI_EXPLODE_STARTTIME = 250
```

Kamikaze-effect phase timing for explode starttime, measured from effect start in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L82)

<a id="constant-constant-mq3-client-cgame-localents-kami-implode-endtime-const-kami-implode-endtime-2250-src-mq3-client-cgame-localents-ml-531334974"></a>
### KAMI_IMPLODE_ENDTIME

```ml
const KAMI_IMPLODE_ENDTIME = 2250
```

Kamikaze-effect phase timing for implode endtime, measured from effect start in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L86)

<a id="constant-constant-mq3-client-cgame-localents-kami-implode-starttime-const-kami-implode-starttime-2000-src-mq3-client-cgame-localents-ml-1648443139"></a>
### KAMI_IMPLODE_STARTTIME

```ml
const KAMI_IMPLODE_STARTTIME = 2000
```

Kamikaze-effect phase timing for implode starttime, measured from effect start in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L84)

<a id="constant-constant-mq3-client-cgame-localents-kami-shockwave2-endtime-const-kami-shockwave2-endtime-3000-src-mq3-client-cgame-localents-ml-394094270"></a>
### KAMI_SHOCKWAVE2_ENDTIME

```ml
const KAMI_SHOCKWAVE2_ENDTIME = 3000
```

Kamikaze-effect phase timing for shockwave2 endtime, measured from effect start in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L93)

<a id="constant-constant-mq3-client-cgame-localents-kami-shockwave2-maxradius-const-kami-shockwave2-maxradius-704-src-mq3-client-cgame-localents-ml-598298268"></a>
### KAMI_SHOCKWAVE2_MAXRADIUS

```ml
const KAMI_SHOCKWAVE2_MAXRADIUS = 704
```

Kamikaze-effect radius parameter for shockwave2 ma geometry, in world units.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L103)

<a id="constant-constant-mq3-client-cgame-localents-kami-shockwave2-starttime-const-kami-shockwave2-starttime-2000-src-mq3-client-cgame-localents-ml-1186654803"></a>
### KAMI_SHOCKWAVE2_STARTTIME

```ml
const KAMI_SHOCKWAVE2_STARTTIME = 2000
```

Kamikaze-effect phase timing for shockwave2 starttime, measured from effect start in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L88)

<a id="constant-constant-mq3-client-cgame-localents-kami-shockwave2fade-starttime-const-kami-shockwave2fade-starttime-2500-src-mq3-client-cgame-localents-ml-464888172"></a>
### KAMI_SHOCKWAVE2FADE_STARTTIME

```ml
const KAMI_SHOCKWAVE2FADE_STARTTIME = 2500
```

Kamikaze-effect phase timing for shockwave2 fade starttime, measured from effect start in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L91)

<a id="constant-constant-mq3-client-cgame-localents-kami-shockwave-endtime-const-kami-shockwave-endtime-2000-src-mq3-client-cgame-localents-ml-1193684111"></a>
### KAMI_SHOCKWAVE_ENDTIME

```ml
const KAMI_SHOCKWAVE_ENDTIME = 2000
```

Kamikaze-effect phase timing for shockwave endtime, measured from effect start in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L80)

<a id="constant-constant-mq3-client-cgame-localents-kami-shockwave-maxradius-const-kami-shockwave-maxradius-1320-src-mq3-client-cgame-localents-ml-2090924771"></a>
### KAMI_SHOCKWAVE_MAXRADIUS

```ml
const KAMI_SHOCKWAVE_MAXRADIUS = 1320
```

Kamikaze-effect radius parameter for shockwave ma geometry, in world units.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L99)

<a id="constant-constant-mq3-client-cgame-localents-kami-shockwave-starttime-const-kami-shockwave-starttime-0-src-mq3-client-cgame-localents-ml-2118728899"></a>
### KAMI_SHOCKWAVE_STARTTIME

```ml
const KAMI_SHOCKWAVE_STARTTIME = 0
```

Kamikaze-effect phase timing for shockwave starttime, measured from effect start in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L75)

<a id="constant-constant-mq3-client-cgame-localents-kami-shockwavefade-starttime-const-kami-shockwavefade-starttime-1500-src-mq3-client-cgame-localents-ml-344017021"></a>
### KAMI_SHOCKWAVEFADE_STARTTIME

```ml
const KAMI_SHOCKWAVEFADE_STARTTIME = 1500
```

Kamikaze-effect phase timing for shockwavefade starttime, measured from effect start in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L78)

<a id="constant-constant-mq3-client-cgame-localents-kami-shockwavemodel-radius-const-kami-shockwavemodel-radius-88-src-mq3-client-cgame-localents-ml-1976883395"></a>
### KAMI_SHOCKWAVEMODEL_RADIUS

```ml
const KAMI_SHOCKWAVEMODEL_RADIUS = 88
```

Kamikaze-effect radius parameter for shockwavemodel geometry, in world units.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L95)

<a id="function-function-mq3-client-cgame-localents-kamiwave-function-kamiwave-state-le-kind-t-starttime-fadetime-endtime-maxradius-angles-src-mq3-client-cgame-localents-ml-232731464"></a>
### kamiWave

```ml
function kamiWave(state, le, kind, t, startTime, fadeTime, endTime, maxRadius, angles)
```

Calls `mq3.client.cgame_localents.anglesToAxis`, `mq3.client.cgame_localents.render` from client game localents `kamiWave`. The final path returns `render(state,kind,le,le.refEntity.origin,scale,[color,color,color,color],axis)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared client game localents state passed to the helper calls in `kamiWave`. |
| `le` | `dynamic` | — | Local effect entity whose lifetime and rendering state are maintained client-side. Record read through `le.refEntity.origin`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. |
| `t` | `dynamic` | — | Value tested by `t>fadeTime` before the calculation continues. |
| `startTime` | `dynamic` | — | Value used by `c=(t-startTime)/(endTime-startTime)`. |
| `fadeTime` | `dynamic` | — | Value used by `if t>fadeTime then color=255.0*(1.0-(t-fadeTime)/(endTime-fadeTime)) end if`. |
| `endTime` | `dynamic` | — | Value used by `c=(t-startTime)/(endTime-startTime)`. |
| `maxRadius` | `dynamic` | — | Value used by `scale=c*maxRadius/KAMI_SHOCKWAVEMODEL_RADIUS`. |
| `angles` | `dynamic` | — | Value used by `axis=anglesToAxis(angles)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L471)

<a id="constant-constant-mq3-client-cgame-localents-le-explosion-const-le-explosion-cgabi-le-explosion-src-mq3-client-cgame-localents-ml-2145192488"></a>
### LE_EXPLOSION

```ml
const LE_EXPLOSION = cgabi.LE_EXPLOSION
```

Local-effect entity kind selecting a model-based explosion.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L28)

<a id="constant-constant-mq3-client-cgame-localents-le-fade-rgb-const-le-fade-rgb-cgabi-le-fade-rgb-src-mq3-client-cgame-localents-ml-446092221"></a>
### LE_FADE_RGB

```ml
const LE_FADE_RGB = cgabi.LE_FADE_RGB
```

Local-effect entity kind selecting an effect that fades its RGB color components.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L38)

<a id="constant-constant-mq3-client-cgame-localents-le-fall-scale-fade-const-le-fall-scale-fade-cgabi-le-fall-scale-fade-src-mq3-client-cgame-localents-ml-62957340"></a>
### LE_FALL_SCALE_FADE

```ml
const LE_FALL_SCALE_FADE = cgabi.LE_FALL_SCALE_FADE
```

Local-effect entity kind selecting an effect that falls while scaling and fading.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L36)

<a id="constant-constant-mq3-client-cgame-localents-le-fragment-const-le-fragment-cgabi-le-fragment-src-mq3-client-cgame-localents-ml-321371131"></a>
### LE_FRAGMENT

```ml
const LE_FRAGMENT = cgabi.LE_FRAGMENT
```

Local-effect entity kind selecting a moving fragment with collision and bounce handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L32)

<a id="constant-constant-mq3-client-cgame-localents-le-invulimpact-const-le-invulimpact-cgabi-le-invulimpact-src-mq3-client-cgame-localents-ml-895831813"></a>
### LE_INVULIMPACT

```ml
const LE_INVULIMPACT = cgabi.LE_INVULIMPACT
```

Local-effect entity kind selecting an impact against the invulnerability shield.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L46)

<a id="constant-constant-mq3-client-cgame-localents-le-invuljuiced-const-le-invuljuiced-cgabi-le-invuljuiced-src-mq3-client-cgame-localents-ml-133666619"></a>
### LE_INVULJUICED

```ml
const LE_INVULJUICED = cgabi.LE_INVULJUICED
```

Local-effect entity kind selecting the invulnerability elimination effect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L48)

<a id="constant-constant-mq3-client-cgame-localents-le-kamikaze-const-le-kamikaze-cgabi-le-kamikaze-src-mq3-client-cgame-localents-ml-956882932"></a>
### LE_KAMIKAZE

```ml
const LE_KAMIKAZE = cgabi.LE_KAMIKAZE
```

Local-effect entity kind selecting the Missionpack kamikaze explosion sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L44)

<a id="constant-constant-mq3-client-cgame-localents-le-mark-const-le-mark-cgabi-le-mark-src-mq3-client-cgame-localents-ml-1549313890"></a>
### LE_MARK

```ml
const LE_MARK = cgabi.LE_MARK
```

Local-effect entity kind selecting a persistent impact decal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L26)

<a id="constant-constant-mq3-client-cgame-localents-le-move-scale-fade-const-le-move-scale-fade-cgabi-le-move-scale-fade-src-mq3-client-cgame-localents-ml-1408062356"></a>
### LE_MOVE_SCALE_FADE

```ml
const LE_MOVE_SCALE_FADE = cgabi.LE_MOVE_SCALE_FADE
```

Local-effect entity kind selecting an effect that moves, scales, and fades over its lifetime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L34)

<a id="constant-constant-mq3-client-cgame-localents-le-scale-fade-const-le-scale-fade-cgabi-le-scale-fade-src-mq3-client-cgame-localents-ml-855992050"></a>
### LE_SCALE_FADE

```ml
const LE_SCALE_FADE = cgabi.LE_SCALE_FADE
```

Local-effect entity kind selecting an effect that scales and fades in place.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L40)

<a id="constant-constant-mq3-client-cgame-localents-le-scoreplum-const-le-scoreplum-cgabi-le-scoreplum-src-mq3-client-cgame-localents-ml-2032573441"></a>
### LE_SCOREPLUM

```ml
const LE_SCOREPLUM = cgabi.LE_SCOREPLUM
```

Local-effect entity kind selecting a floating score indicator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L42)

<a id="constant-constant-mq3-client-cgame-localents-le-showrefentity-const-le-showrefentity-cgabi-le-showrefentity-src-mq3-client-cgame-localents-ml-1809708358"></a>
### LE_SHOWREFENTITY

```ml
const LE_SHOWREFENTITY = cgabi.LE_SHOWREFENTITY
```

Local-effect entity kind selecting a renderer entity displayed without another local-effect update mode.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L51)

<a id="constant-constant-mq3-client-cgame-localents-le-sprite-explosion-const-le-sprite-explosion-cgabi-le-sprite-explosion-src-mq3-client-cgame-localents-ml-924519374"></a>
### LE_SPRITE_EXPLOSION

```ml
const LE_SPRITE_EXPLOSION = cgabi.LE_SPRITE_EXPLOSION
```

Local-effect entity kind selecting a sprite-based explosion.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L30)

<a id="constant-constant-mq3-client-cgame-localents-lebs-blood-const-lebs-blood-cgabi-lebs-blood-src-mq3-client-cgame-localents-ml-2048362992"></a>
### LEBS_BLOOD

```ml
const LEBS_BLOOD = cgabi.LEBS_BLOOD
```

Local-fragment bounce-sound kind selecting blood impact feedback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L69)

<a id="constant-constant-mq3-client-cgame-localents-lebs-brass-const-lebs-brass-cgabi-lebs-brass-src-mq3-client-cgame-localents-ml-70511571"></a>
### LEBS_BRASS

```ml
const LEBS_BRASS = cgabi.LEBS_BRASS
```

Local-fragment bounce-sound kind selecting brass impact feedback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L71)

<a id="constant-constant-mq3-client-cgame-localents-lebs-none-const-lebs-none-cgabi-lebs-none-src-mq3-client-cgame-localents-ml-1572049184"></a>
### LEBS_NONE

```ml
const LEBS_NONE = cgabi.LEBS_NONE
```

Local-fragment bounce-sound kind selecting none impact feedback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L67)

<a id="constant-constant-mq3-client-cgame-localents-lef-puff-dont-scale-const-lef-puff-dont-scale-cgabi-lef-puff-dont-scale-src-mq3-client-cgame-localents-ml-2014183453"></a>
### LEF_PUFF_DONT_SCALE

```ml
const LEF_PUFF_DONT_SCALE = cgabi.LEF_PUFF_DONT_SCALE
```

Local-effect flag controlling the puff dont scale behavior of the temporary entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L53)

<a id="constant-constant-mq3-client-cgame-localents-lef-sound1-const-lef-sound1-cgabi-lef-sound1-src-mq3-client-cgame-localents-ml-1009701267"></a>
### LEF_SOUND1

```ml
const LEF_SOUND1 = cgabi.LEF_SOUND1
```

Local-effect flag controlling the sound1 behavior of the temporary entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L57)

<a id="constant-constant-mq3-client-cgame-localents-lef-sound2-const-lef-sound2-cgabi-lef-sound2-src-mq3-client-cgame-localents-ml-882660800"></a>
### LEF_SOUND2

```ml
const LEF_SOUND2 = cgabi.LEF_SOUND2
```

Local-effect flag controlling the sound2 behavior of the temporary entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L59)

<a id="constant-constant-mq3-client-cgame-localents-lef-tumble-const-lef-tumble-cgabi-lef-tumble-src-mq3-client-cgame-localents-ml-589064840"></a>
### LEF_TUMBLE

```ml
const LEF_TUMBLE = cgabi.LEF_TUMBLE
```

Local-effect flag controlling the tumble behavior of the temporary entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L55)

<a id="constant-constant-mq3-client-cgame-localents-lemt-blood-const-lemt-blood-cgabi-lemt-blood-src-mq3-client-cgame-localents-ml-89045566"></a>
### LEMT_BLOOD

```ml
const LEMT_BLOOD = cgabi.LEMT_BLOOD
```

Local-fragment impact-decal kind selecting blood marks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L65)

<a id="constant-constant-mq3-client-cgame-localents-lemt-burn-const-lemt-burn-cgabi-lemt-burn-src-mq3-client-cgame-localents-ml-617040617"></a>
### LEMT_BURN

```ml
const LEMT_BURN = cgabi.LEMT_BURN
```

Local-fragment impact-decal kind selecting burn marks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L63)

<a id="constant-constant-mq3-client-cgame-localents-lemt-none-const-lemt-none-cgabi-lemt-none-src-mq3-client-cgame-localents-ml-1633546102"></a>
### LEMT_NONE

```ml
const LEMT_NONE = cgabi.LEMT_NONE
```

Local-fragment impact-decal kind selecting none marks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L61)

- [mq3.client.cgame_localents.LocalEntity](Type-mq3-client-cgame-localents-localentity-257810064.md) — struct
<a id="function-function-mq3-client-cgame-localents-mark-function-mark-state-kind-le-origin-normal-scalar-orientation-src-mq3-client-cgame-localents-ml-1584595213"></a>
### mark

```ml
function mark(state, kind, le, origin, normal, scalar, orientation)
```

Adapts `mq3.client.cgame_localents.boundary` to client game localents `mark`, returning its result for `state, "mark", kind, le, origin, normal, scalar, void, orientation`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_localents.boundary`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. Forwarded to `mq3.client.cgame_localents.boundary`. |
| `le` | `dynamic` | — | Local effect entity whose lifetime and rendering state are maintained client-side. Forwarded to `mq3.client.cgame_localents.boundary`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_localents.boundary`. |
| `normal` | `dynamic` | — | Surface-normal vector used to orient or offset the effect. Forwarded to `mq3.client.cgame_localents.boundary`. |
| `scalar` | `dynamic` | — | Argument 7 of `mq3.client.cgame_localents.boundary`. |
| `orientation` | `dynamic` | — | Argument 9 of `mq3.client.cgame_localents.boundary`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L345)

<a id="constant-constant-mq3-client-cgame-localents-max-local-entities-const-max-local-entities-512-src-mq3-client-cgame-localents-ml-399103215"></a>
### MAX_LOCAL_ENTITIES

```ml
const MAX_LOCAL_ENTITIES = 512
```

Capacity limit for the local entities collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L14)

<a id="function-function-mq3-client-cgame-localents-nearview-function-nearview-state-origin-radius-src-mq3-client-cgame-localents-ml-1120081737"></a>
### nearView

```ml
function nearView(state, origin, radius)
```

Calls `mq3.shared.math.VectorLength` from client game localents `nearView`. The final path returns `qmath.VectorLength(delta)<radius`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.vieworg`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. |
| `radius` | `dynamic` | — | Radius used by the spatial or visual calculation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L413)

<a id="function-function-mq3-client-cgame-localents-newlocalentity-function-newlocalentity-id-src-mq3-client-cgame-localents-ml-969776797"></a>
### newLocalEntity

```ml
function newLocalEntity(id)
```

Creates a `mq3.client.cgame_localents.LocalEntity` record. Assigns `id` from `id`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `id` | `dynamic` | — | Value used to initialize `LocalEntity.id`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L260)

<a id="function-function-mq3-client-cgame-localents-newrefentity-function-newrefentity-src-mq3-client-cgame-localents-ml-2093013094"></a>
### newRefEntity

```ml
function newRefEntity()
```

Creates a `mq3.client.cgame_localents.RefEntity` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L255)

<a id="function-function-mq3-client-cgame-localents-newtrajectory-function-newtrajectory-src-mq3-client-cgame-localents-ml-1630612868"></a>
### newTrajectory

```ml
function newTrajectory()
```

Adapts `mq3.game.trajectory.Trajectory` to client game localents `newTrajectory`, returning its result for `TR_STATIONARY, 0, 0, [0.0,0.0,0.0], [0.0,0.0,0.0]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L257)

<a id="constant-constant-mq3-client-cgame-localents-number-size-const-number-size-8-src-mq3-client-cgame-localents-ml-1177058693"></a>
### NUMBER_SIZE

```ml
const NUMBER_SIZE = 8
```

World-space digit size used by floating score indicators.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L73)

- [mq3.client.cgame_localents.RefEntity](Type-mq3-client-cgame-localents-refentity-663752502.md) — struct
<a id="function-function-mq3-client-cgame-localents-reflectvelocity-function-reflectvelocity-state-le-trace-src-mq3-client-cgame-localents-ml-800018583"></a>
### reflectVelocity

```ml
function reflectVelocity(state, le, trace)
```

CG_ReflectVelocity

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`, `state.frametime`. |
| `le` | `dynamic` | — | Mutable client game localents record/storage; this routine assigns `le.pos.trDelta`, `le.pos.trBase`, `le.pos.trTime`, `le.pos.trType`. |
| `trace` | `dynamic` | — | Record read through `trace.fraction`, `trace.normal`, `trace.endpos`, `trace.allsolid`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L380)

<a id="function-function-mq3-client-cgame-localents-remainingfraction-function-remainingfraction-state-le-src-mq3-client-cgame-localents-ml-796774952"></a>
### remainingFraction

```ml
function remainingFraction(state, le)
```

Computes `(le.endTime-state.time)*le.lifeRate` for client game localents `remainingFraction`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record read through `state.time`. |
| `le` | `dynamic` | — | Local effect entity whose lifetime and rendering state are maintained client-side. Record read through `le.endTime`, `le.lifeRate`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L408)

<a id="function-function-mq3-client-cgame-localents-render-function-render-state-kind-le-origin-scalar-color-data-src-mq3-client-cgame-localents-ml-1156437461"></a>
### render

```ml
function render(state, kind, le, origin, scalar, color, data)
```

Adapts `mq3.client.cgame_localents.boundary` to client game localents `render`, returning its result for `state, "render", kind, le, origin, void, scalar, color, data`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_localents.boundary`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. Forwarded to `mq3.client.cgame_localents.boundary`. |
| `le` | `dynamic` | — | Local effect entity whose lifetime and rendering state are maintained client-side. Forwarded to `mq3.client.cgame_localents.boundary`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_localents.boundary`. |
| `scalar` | `dynamic` | — | Argument 7 of `mq3.client.cgame_localents.boundary`. |
| `color` | `dynamic` | — | Argument 8 of `mq3.client.cgame_localents.boundary`. |
| `data` | `dynamic` | — | Argument 9 of `mq3.client.cgame_localents.boundary`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L329)

<a id="function-function-mq3-client-cgame-localents-resetlocalentity-function-resetlocalentity-le-src-mq3-client-cgame-localents-ml-1003827443"></a>
### resetLocalEntity

```ml
function resetLocalEntity(le)
```

Updates `le.active`, `le.leType`, `le.leFlags`, `le.startTime` and additional values during client game localents `resetLocalEntity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `le` | `dynamic` | — | Mutable client game localents record/storage; this routine assigns `le.active`, `le.leType`, `le.leFlags`, `le.startTime` and additional values. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L287)

<a id="constant-constant-mq3-client-cgame-localents-rf-lighting-origin-const-rf-lighting-origin-128-src-mq3-client-cgame-localents-ml-2136918682"></a>
### RF_LIGHTING_ORIGIN

```ml
const RF_LIGHTING_ORIGIN = 128
```

Renderer flag that samples lighting at the entity's explicit lighting-origin position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L24)

<a id="constant-constant-mq3-client-cgame-localents-rt-sprite-const-rt-sprite-2-src-mq3-client-cgame-localents-ml-117418831"></a>
### RT_SPRITE

```ml
const RT_SPRITE = 2
```

Renderer-entity type selecting the sprite primitive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L22)

<a id="function-function-mq3-client-cgame-localents-scorecolor-function-scorecolor-score-src-mq3-client-cgame-localents-ml-314980268"></a>
### scoreColor

```ml
function scoreColor(score)
```

Evaluates client game localents `scoreColor` and returns `[255,17,17]`, `[255,0,255]`, `[0,0,255]` and additional values according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `score` | `dynamic` | — | Value used by `if score<0 then return [255,17,17] end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L513)

<a id="function-function-mq3-client-cgame-localents-scoredigits-function-scoredigits-score-src-mq3-client-cgame-localents-ml-1294611456"></a>
### scoreDigits

```ml
function scoreDigits(score)
```

Calls `mq3.compat.numeric.trunc32` from client game localents `scoreDigits`. The final path returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `score` | `dynamic` | — | Value used by `score=n.trunc32(score)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L516)

- [mq3.client.cgame_localents.Services](Type-mq3-client-cgame-localents-services-858672036.md) — struct
<a id="constant-constant-mq3-client-cgame-localents-sink-time-const-sink-time-cgabi-sink-time-src-mq3-client-cgame-localents-ml-1178244138"></a>
### SINK_TIME

```ml
const SINK_TIME = cgabi.SINK_TIME
```

Duration in milliseconds over which an expiring local entity sinks away.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L16)

<a id="function-function-mq3-client-cgame-localents-sound-function-sound-state-kind-le-origin-data-src-mq3-client-cgame-localents-ml-2137917742"></a>
### sound

```ml
function sound(state, kind, le, origin, data)
```

Adapts `mq3.client.cgame_localents.boundary` to client game localents `sound`, returning its result for `state, "audio", kind, le, origin, void, 0.0, void, data`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.cgame_localents.boundary`. |
| `kind` | `dynamic` | — | Action/operation identifier used to select the engine service request. Forwarded to `mq3.client.cgame_localents.boundary`. |
| `le` | `dynamic` | — | Local effect entity whose lifetime and rendering state are maintained client-side. Forwarded to `mq3.client.cgame_localents.boundary`. |
| `origin` | `dynamic` | — | World-space origin of the entity, sound or rendered effect. Forwarded to `mq3.client.cgame_localents.boundary`. |
| `data` | `dynamic` | — | Argument 9 of `mq3.client.cgame_localents.boundary`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L336)

- [mq3.client.cgame_localents.State](Type-mq3-client-cgame-localents-state-1933874705.md) — struct
<a id="constant-constant-mq3-client-cgame-localents-tr-stationary-const-tr-stationary-0-src-mq3-client-cgame-localents-ml-1511339213"></a>
### TR_STATIONARY

```ml
const TR_STATIONARY = 0
```

Trajectory kind whose position remains at its stored base value.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_localents.ml#L20)
