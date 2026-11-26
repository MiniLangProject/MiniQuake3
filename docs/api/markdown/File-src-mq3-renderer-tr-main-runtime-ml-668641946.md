# `src/mq3/renderer/tr_main_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.tr_main_runtime`](Package-mq3-renderer-tr-main-runtime-1708183690.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/renderer/draw_surfs.ml` as `draw` → [src/mq3/renderer/draw_surfs.ml](File-src-mq3-renderer-draw-surfs-ml-75092385.md)
- `mq3/renderer/entity_surface_policy.ml` as `policy` → [src/mq3/renderer/entity_surface_policy.ml](File-src-mq3-renderer-entity-surface-policy-ml-628328091.md)
- `mq3/renderer/portal_view.ml` as `portals` → [src/mq3/renderer/portal_view.ml](File-src-mq3-renderer-portal-view-ml-1859210863.md)
- `mq3/renderer/view_math.ml` as `viewmath` → [src/mq3/renderer/view_math.ml](File-src-mq3-renderer-view-math-ml-126526929.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

- [mq3.renderer.tr_main_runtime.DebugPass](Type-mq3-renderer-tr-main-runtime-debugpass-1933568254.md) — struct
- [mq3.renderer.tr_main_runtime.DebugPolygonResult](Type-mq3-renderer-tr-main-runtime-debugpolygonresult-1494235010.md) — struct
- [mq3.renderer.tr_main_runtime.EntitySurface](Type-mq3-renderer-tr-main-runtime-entitysurface-1642426946.md) — struct
<a id="function-function-mq3-renderer-tr-main-runtime-fail-function-fail-message-src-mq3-renderer-tr-main-runtime-ml-2075727847"></a>
### fail

```ml
function fail(message)
```

Creates error `7760` with message `"tr_main: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7760,"tr_main: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L127)

<a id="function-function-mq3-renderer-tr-main-runtime-identityaxis-function-identityaxis-src-mq3-renderer-tr-main-runtime-ml-1597661830"></a>
### identityAxis

```ml
function identityAxis()
```

Returns `[[1.0,0.0,0.0],[0.0,1.0,0.0],[0.0,0.0,1.0]]` for `mq3.renderer.tr_main_runtime.identityAxis`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L129)

<a id="function-function-mq3-renderer-tr-main-runtime-identitymatrix-function-identitymatrix-src-mq3-renderer-tr-main-runtime-ml-575293590"></a>
### identityMatrix

```ml
function identityMatrix()
```

Returns `[1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0]` for `mq3.renderer.tr_main_runtime.identityMatrix`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L131)

<a id="function-function-mq3-renderer-tr-main-runtime-ismirror-function-ismirror-surface-entities-timemilliseconds-src-mq3-renderer-tr-main-runtime-ml-1111534963"></a>
### IsMirror

```ml
function IsMirror(surface, entities, timeMilliseconds)
```

Returns `found!=void and not (found is error) and found[3]` from `mq3.renderer.tr_main_runtime.IsMirror`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — | Value forwarded as `surface` to `mq3.renderer.tr_main_runtime.R_GetPortalOrientations`. |
| `entities` | `dynamic` | — | Value forwarded as `entities` to `mq3.renderer.tr_main_runtime.R_GetPortalOrientations`. |
| `timeMilliseconds` | `dynamic` | — | Value forwarded as `timeMilliseconds` to `mq3.renderer.tr_main_runtime.R_GetPortalOrientations`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L290)

<a id="function-function-mq3-renderer-tr-main-runtime-myglmultmatrix-function-myglmultmatrix-a-b-src-mq3-renderer-tr-main-runtime-ml-542909355"></a>
### myGlMultMatrix

```ml
function myGlMultMatrix(a, b)
```

Builds `result[i*4+j]` in `mq3.renderer.tr_main_runtime.myGlMultMatrix`; returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Indexed input read at `i*4`, `i*4+1`, `i*4+2`, `i*4+3`. |
| `b` | `dynamic` | — | Indexed input read at `j`, `4+j`, `8+j`, `12+j`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L184)

<a id="function-function-mq3-renderer-tr-main-runtime-orientation-function-orientation-origin-axis-vieworigin-modelmatrix-src-mq3-renderer-tr-main-runtime-ml-2140598502"></a>
### orientation

```ml
function orientation(origin, axis, viewOrigin, modelMatrix)
```

Constructs `mq3.renderer.tr_main_runtime.Orientation` from `origin`, `axis`, `viewOrigin`, `modelMatrix`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | Initial value for `mq3.renderer.tr_main_runtime.Orientation.origin`. |
| `axis` | `dynamic` | — | Initial value for `mq3.renderer.tr_main_runtime.Orientation.axis`. |
| `viewOrigin` | `dynamic` | — | Initial value for `mq3.renderer.tr_main_runtime.Orientation.viewOrigin`. |
| `modelMatrix` | `dynamic` | — | Initial value for `mq3.renderer.tr_main_runtime.Orientation.modelMatrix`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L137)

- [mq3.renderer.tr_main_runtime.Orientation](Type-mq3-renderer-tr-main-runtime-orientation-1673570470.md) — struct
- [mq3.renderer.tr_main_runtime.Plane](Type-mq3-renderer-tr-main-runtime-plane-1583899950.md) — struct
<a id="function-function-mq3-renderer-tr-main-runtime-qsortfast-function-qsortfast-drawsurfs-src-mq3-renderer-tr-main-runtime-ml-879427505"></a>
### qsortFast

```ml
function qsortFast(drawSurfs)
```

Calls `mq3.renderer.draw_surfs.sortStable` with `(drawSurfs)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `drawSurfs` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.draw_surfs.sortStable`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L356)

<a id="function-function-mq3-renderer-tr-main-runtime-r-adddrawsurf-function-r-adddrawsurf-queue-surface-shaderindex-entitynum-fogindex-dlightmap-src-mq3-renderer-tr-main-runtime-ml-77695670"></a>
### R_AddDrawSurf

```ml
function R_AddDrawSurf(queue, surface, shaderIndex, entityNum, fogIndex, dlightMap)
```

Calls `mq3.renderer.draw_surfs.add` with `(queue,surface,shaderIndex,entityNum,fogIndex,dlightMap)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.draw_surfs.add`. |
| `surface` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.draw_surfs.add`. |
| `shaderIndex` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.draw_surfs.add`. |
| `entityNum` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.draw_surfs.add`. |
| `fogIndex` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.draw_surfs.add`. |
| `dlightMap` | `dynamic` | — | Argument 6 supplied to `mq3.renderer.draw_surfs.add`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L364)

<a id="function-function-mq3-renderer-tr-main-runtime-r-addentitysurfaces-function-r-addentitysurfaces-entities-isportal-fogbounds-noworld-drawentities-src-mq3-renderer-tr-main-runtime-ml-471097422"></a>
### R_AddEntitySurfaces

```ml
function R_AddEntitySurfaces(entities, isPortal, fogBounds, noworld, drawEntities)
```

Applies entity visibility/type policy and assigns fog indices before creating drawable entity-surface records.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — | Indexed input read at `index`. |
| `isPortal` | `dynamic` | — | Input tested by `(entity.renderfx&policy.RF_FIRST_PERSON)!=0 and isPortal`. |
| `fogBounds` | `dynamic` | — | Value forwarded as `fogBounds` to `mq3.renderer.tr_main_runtime.R_SpriteFogNum`. |
| `noworld` | `dynamic` | — | Value forwarded as `noworld` to `mq3.renderer.tr_main_runtime.R_SpriteFogNum`. |
| `drawEntities` | `dynamic` | — | Input tested by `not drawEntities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L378)

<a id="function-function-mq3-renderer-tr-main-runtime-r-culllocalbox-function-r-culllocalbox-bounds-current-frustum-nocull-src-mq3-renderer-tr-main-runtime-ml-1283835151"></a>
### R_CullLocalBox

```ml
function R_CullLocalBox(bounds, current, frustum, noCull)
```

Calls `mq3.renderer.view_math.cullLocalBox` with `(bounds,current,frustum,noCull)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bounds` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.view_math.cullLocalBox`. |
| `current` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.view_math.cullLocalBox`. |
| `frustum` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.view_math.cullLocalBox`. |
| `noCull` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.view_math.cullLocalBox`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L144)

<a id="function-function-mq3-renderer-tr-main-runtime-r-culllocalpointandradius-function-r-culllocalpointandradius-point-radius-current-frustum-nocull-src-mq3-renderer-tr-main-runtime-ml-1958331682"></a>
### R_CullLocalPointAndRadius

```ml
function R_CullLocalPointAndRadius(point, radius, current, frustum, noCull)
```

Calls `mq3.renderer.view_math.cullLocalPointAndRadius` with `(point,radius,current,frustum,noCull)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.view_math.cullLocalPointAndRadius`. |
| `radius` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.view_math.cullLocalPointAndRadius`. |
| `current` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.view_math.cullLocalPointAndRadius`. |
| `frustum` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.view_math.cullLocalPointAndRadius`. |
| `noCull` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.view_math.cullLocalPointAndRadius`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L151)

<a id="function-function-mq3-renderer-tr-main-runtime-r-cullpointandradius-function-r-cullpointandradius-point-radius-frustum-nocull-src-mq3-renderer-tr-main-runtime-ml-101377541"></a>
### R_CullPointAndRadius

```ml
function R_CullPointAndRadius(point, radius, frustum, noCull)
```

Calls `mq3.renderer.view_math.cullPointAndRadius` with `(point,radius,frustum,noCull)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.view_math.cullPointAndRadius`. |
| `radius` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.view_math.cullPointAndRadius`. |
| `frustum` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.view_math.cullPointAndRadius`. |
| `noCull` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.view_math.cullPointAndRadius`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L157)

<a id="function-function-mq3-renderer-tr-main-runtime-r-debuggraphics-function-r-debuggraphics-state-enabled-src-mq3-renderer-tr-main-runtime-ml-1239787866"></a>
### R_DebugGraphics

```ml
function R_DebugGraphics(state, enabled)
```

Computes `R_DebugGraphics` from `state.services.debugFn(state.services.context,state)` using `state.services.debugFn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.services`. |
| `enabled` | `dynamic` | — | Input tested by `not enabled`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L416)

<a id="function-function-mq3-renderer-tr-main-runtime-r-debugpolygon-function-r-debugpolygon-color-points-src-mq3-renderer-tr-main-runtime-ml-1383858694"></a>
### R_DebugPolygon

```ml
function R_DebugPolygon(color, points)
```

Builds `mq3.renderer.tr_main_runtime.DebugPolygonResult` for `mq3.renderer.tr_main_runtime.R_DebugPolygon`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `color` | `dynamic` | — | Input used by `rgb=[color&1,(color>>1)&1,(color>>2)&1]`. |
| `points` | `dynamic` | — | Value used for `mq3.renderer.tr_main_runtime.DebugPass.points`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L407)

<a id="function-function-mq3-renderer-tr-main-runtime-r-decomposesort-function-r-decomposesort-sortkey-src-mq3-renderer-tr-main-runtime-ml-692729515"></a>
### R_DecomposeSort

```ml
function R_DecomposeSort(sortKey)
```

Calls `mq3.renderer.draw_surfs.decompose` with `(sortKey)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sortKey` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.draw_surfs.decompose`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L367)

<a id="function-function-mq3-renderer-tr-main-runtime-r-generatedrawsurfs-function-r-generatedrawsurfs-state-src-mq3-renderer-tr-main-runtime-ml-1392304603"></a>
### R_GenerateDrawSurfs

```ml
function R_GenerateDrawSurfs(state)
```

Computes `R_GenerateDrawSurfs` from `state.numDrawSurfs` using `s.addWorldFn`, `s.addPolygonsFn`, `s.setupProjectionFn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.services`, `state.numDrawSurfs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L395)

<a id="function-function-mq3-renderer-tr-main-runtime-r-getportalorientations-function-r-getportalorientations-surface-entities-timemilliseconds-src-mq3-renderer-tr-main-runtime-ml-61931259"></a>
### R_GetPortalOrientations

```ml
function R_GetPortalOrientations(surface, entities, timeMilliseconds)
```

Calls `mq3.renderer.portal_view.portalOrientation` with `(surface.normal,surface.dist,entities,timeMilliseconds)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — | Record providing `surface.normal`, `surface.dist`. |
| `entities` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.portal_view.portalOrientation`. |
| `timeMilliseconds` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.portal_view.portalOrientation`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L285)

<a id="function-function-mq3-renderer-tr-main-runtime-r-localnormaltoworld-function-r-localnormaltoworld-local-current-src-mq3-renderer-tr-main-runtime-ml-1034692002"></a>
### R_LocalNormalToWorld

```ml
function R_LocalNormalToWorld(local, current)
```

Calls `mq3.renderer.view_math.localNormalToWorld` with `(local,current)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `local` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.view_math.localNormalToWorld`. |
| `current` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.view_math.localNormalToWorld`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L161)

<a id="function-function-mq3-renderer-tr-main-runtime-r-localpointtoworld-function-r-localpointtoworld-local-current-src-mq3-renderer-tr-main-runtime-ml-662087452"></a>
### R_LocalPointToWorld

```ml
function R_LocalPointToWorld(local, current)
```

Calls `mq3.renderer.view_math.localPointToWorld` with `(local,current)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `local` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.view_math.localPointToWorld`. |
| `current` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.view_math.localPointToWorld`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L165)

<a id="function-function-mq3-renderer-tr-main-runtime-r-mirrorpoint-function-r-mirrorpoint-input-surface-camera-src-mq3-renderer-tr-main-runtime-ml-620356590"></a>
### R_MirrorPoint

```ml
function R_MirrorPoint(input, surface, camera)
```

Calls `mq3.renderer.portal_view.mirrorPoint` with `(input,surface,camera)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.portal_view.mirrorPoint`. |
| `surface` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.portal_view.mirrorPoint`. |
| `camera` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.portal_view.mirrorPoint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L262)

<a id="function-function-mq3-renderer-tr-main-runtime-r-mirrorvector-function-r-mirrorvector-input-surface-camera-src-mq3-renderer-tr-main-runtime-ml-388947978"></a>
### R_MirrorVector

```ml
function R_MirrorVector(input, surface, camera)
```

Calls `mq3.renderer.portal_view.mirrorVector` with `(input,surface,camera)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.portal_view.mirrorVector`. |
| `surface` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.portal_view.mirrorVector`. |
| `camera` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.portal_view.mirrorVector`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L267)

<a id="function-function-mq3-renderer-tr-main-runtime-r-mirrorviewbysurface-function-r-mirrorviewbysurface-surface-entities-timemilliseconds-vieworigin-viewaxis-isportal-noportals-fastsky-src-mq3-renderer-tr-main-runtime-ml-386655165"></a>
### R_MirrorViewBySurface

```ml
function R_MirrorViewBySurface(surface, entities, timeMilliseconds, viewOrigin, viewAxis, isPortal, noPortals, fastSky)
```

Returns `portals.prepare(surface.normal,surface.dist,entities,timeMilliseconds,viewOrigin,viewAxis)` from `mq3.renderer.tr_main_runtime.R_MirrorViewBySurface`; earlier branches return `void`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — | Record providing `surface.normal`, `surface.dist`. |
| `entities` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.portal_view.prepare`. |
| `timeMilliseconds` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.portal_view.prepare`. |
| `viewOrigin` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.portal_view.prepare`. |
| `viewAxis` | `dynamic` | — | Argument 6 supplied to `mq3.renderer.portal_view.prepare`. |
| `isPortal` | `dynamic` | — | Input tested by `isPortal or noPortals or fastSky`. |
| `noPortals` | `dynamic` | — | Input tested by `isPortal or noPortals or fastSky`. |
| `fastSky` | `dynamic` | — | Input tested by `isPortal or noPortals or fastSky`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L331)

<a id="function-function-mq3-renderer-tr-main-runtime-r-planeforsurface-function-r-planeforsurface-surface-src-mq3-renderer-tr-main-runtime-ml-1913967929"></a>
### R_PlaneForSurface

```ml
function R_PlaneForSurface(surface)
```

Surface is {kind, plane} for faces or {kind, vertices, indexes} for meshes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — | Record providing `surface.kind`, `surface.plane`, `surface.vertices`, `surface.indexes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L271)

<a id="function-function-mq3-renderer-tr-main-runtime-r-renderview-function-r-renderview-state-parms-src-mq3-renderer-tr-main-runtime-ml-298740398"></a>
### R_RenderView

```ml
function R_RenderView(state, parms)
```

Updates `state.viewCount`, `state.viewParms`, `state.viewParms.frameSceneNum`, `state.viewParms.frameCount`, `state.viewParms.world` in `mq3.renderer.tr_main_runtime.R_RenderView`; returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.viewCount`, `state.viewParms`, `state.viewParms.frameSceneNum`, `state.viewParms.frameCount`, `state.viewParms.world`. |
| `parms` | `dynamic` | — | Record providing `parms.viewportWidth`, `parms.viewportHeight`, `parms.origin`, `parms.axis`, `parms.fovX`, `parms.fovY`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L425)

<a id="function-function-mq3-renderer-tr-main-runtime-r-rotateforentity-function-r-rotateforentity-entity-viewparms-src-mq3-renderer-tr-main-runtime-ml-1755282305"></a>
### R_RotateForEntity

```ml
function R_RotateForEntity(entity, viewParms)
```

Computes `R_RotateForEntity` from `orientation([origin[0],origin[1],origin[2]],axis,localView,model)` using `mq3.renderer.tr_main_runtime.myGlMultMatrix`, `mq3.shared.math.VectorLength`, `mq3.compat.numeric.fdiv`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — | Record providing `entity.reType`, `entity.axis`, `entity.origin`, `entity.nonNormalizedAxes`. |
| `viewParms` | `dynamic` | — | Record providing `viewParms.world`, `viewParms.origin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L198)

<a id="function-function-mq3-renderer-tr-main-runtime-r-rotateforviewer-function-r-rotateforviewer-vieworigin-viewaxis-src-mq3-renderer-tr-main-runtime-ml-140020069"></a>
### R_RotateForViewer

```ml
function R_RotateForViewer(viewOrigin, viewAxis)
```

Builds `matrix[0]`, `matrix[4]`, `matrix[8]`, `matrix[12]`, `matrix[1]` in `mq3.renderer.tr_main_runtime.R_RotateForViewer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `viewOrigin` | `dynamic` | — | Argument 1 supplied to `mq3.shared.math.DotProduct`. |
| `viewAxis` | `dynamic` | — | Nested indexed data; outer entries read at `0`, `1`, `2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L214)

<a id="function-function-mq3-renderer-tr-main-runtime-r-setupfrustum-function-r-setupfrustum-origin-axis-fovx-fovy-src-mq3-renderer-tr-main-runtime-ml-1830639646"></a>
### R_SetupFrustum

```ml
function R_SetupFrustum(origin, axis, fovX, fovY)
```

Calls `mq3.renderer.view_math.setupFrustum` with `(origin,axis,fovX,fovY)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.view_math.setupFrustum`. |
| `axis` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.view_math.setupFrustum`. |
| `fovX` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.view_math.setupFrustum`. |
| `fovY` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.view_math.setupFrustum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L257)

<a id="function-function-mq3-renderer-tr-main-runtime-r-setupprojection-function-r-setupprojection-fovx-fovy-znear-zfar-src-mq3-renderer-tr-main-runtime-ml-356122686"></a>
### R_SetupProjection

```ml
function R_SetupProjection(fovX, fovY, zNear, zFar)
```

Builds `m[0]`, `m[5]`, `m[10]`, `m[14]`, `m[11]` in `mq3.renderer.tr_main_runtime.R_SetupProjection`; returns `m`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fovX` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.fmul`. |
| `fovY` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.fmul`. |
| `zNear` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.fmul`. |
| `zFar` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.fsub`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L243)

<a id="function-function-mq3-renderer-tr-main-runtime-r-sortdrawsurfs-function-r-sortdrawsurfs-queue-src-mq3-renderer-tr-main-runtime-ml-1202690451"></a>
### R_SortDrawSurfs

```ml
function R_SortDrawSurfs(queue)
```

Calls `mq3.renderer.draw_surfs.sortQueue` with `(queue)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.draw_surfs.sortQueue`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L370)

<a id="function-function-mq3-renderer-tr-main-runtime-r-spritefognum-function-r-spritefognum-origin-radius-fogbounds-noworld-src-mq3-renderer-tr-main-runtime-ml-309997040"></a>
### R_SpriteFogNum

```ml
function R_SpriteFogNum(origin, radius, fogBounds, noworld)
```

Returns the first fog volume overlapping a sprite's radius, or zero when none applies or world rendering is disabled.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | Indexed input read at `j`. |
| `radius` | `dynamic` | — | Input used by `for j=0 to 2 if origin[j]-radius>=fog[1][j] or origin[j]+radius<=fog[0][j] then inside=false`. |
| `fogBounds` | `dynamic` | — | Indexed input read at `i`. |
| `noworld` | `dynamic` | — | Input tested by `noworld or fogBounds==void`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L341)

<a id="function-function-mq3-renderer-tr-main-runtime-r-transformcliptowindow-function-r-transformcliptowindow-clip-viewportwidth-viewportheight-src-mq3-renderer-tr-main-runtime-ml-1006570685"></a>
### R_TransformClipToWindow

```ml
function R_TransformClipToWindow(clip, viewportWidth, viewportHeight)
```

Calls `mq3.renderer.view_math.transformClipToWindow` with `(clip,viewportWidth,viewportHeight)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clip` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.view_math.transformClipToWindow`. |
| `viewportWidth` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.view_math.transformClipToWindow`. |
| `viewportHeight` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.view_math.transformClipToWindow`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L179)

<a id="function-function-mq3-renderer-tr-main-runtime-r-transformmodeltoclip-function-r-transformmodeltoclip-source-modelmatrix-projectionmatrix-src-mq3-renderer-tr-main-runtime-ml-195723387"></a>
### R_TransformModelToClip

```ml
function R_TransformModelToClip(source, modelMatrix, projectionMatrix)
```

Calls `mq3.renderer.view_math.transformModelToClip` with `(source,modelMatrix,projectionMatrix)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.view_math.transformModelToClip`. |
| `modelMatrix` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.view_math.transformModelToClip`. |
| `projectionMatrix` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.view_math.transformModelToClip`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L174)

<a id="function-function-mq3-renderer-tr-main-runtime-r-worldtolocal-function-r-worldtolocal-world-current-src-mq3-renderer-tr-main-runtime-ml-1244129433"></a>
### R_WorldToLocal

```ml
function R_WorldToLocal(world, current)
```

Calls `mq3.renderer.view_math.worldToLocal` with `(world,current)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.view_math.worldToLocal`. |
| `current` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.view_math.worldToLocal`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L169)

<a id="constant-constant-mq3-renderer-tr-main-runtime-rdf-noworldmodel-const-rdf-noworldmodel-1-src-mq3-renderer-tr-main-runtime-ml-179929702"></a>
### RDF_NOWORLDMODEL

```ml
const RDF_NOWORLDMODEL = 1
```

View flag that renders submitted entities without the BSP world model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L39)

- [mq3.renderer.tr_main_runtime.RenderServices](Type-mq3-renderer-tr-main-runtime-renderservices-1840260692.md) — struct
- [mq3.renderer.tr_main_runtime.RenderState](Type-mq3-renderer-tr-main-runtime-renderstate-410585153.md) — struct
<a id="constant-constant-mq3-renderer-tr-main-runtime-rt-beam-const-rt-beam-3-src-mq3-renderer-tr-main-runtime-ml-43189420"></a>
### RT_BEAM

```ml
const RT_BEAM = 3
```

Renderer entity type for a beam between two endpoints.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L23)

<a id="constant-constant-mq3-renderer-tr-main-runtime-rt-lightning-const-rt-lightning-6-src-mq3-renderer-tr-main-runtime-ml-248950203"></a>
### RT_LIGHTNING

```ml
const RT_LIGHTNING = 6
```

Renderer entity type for the lightning-gun beam.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L29)

<a id="constant-constant-mq3-renderer-tr-main-runtime-rt-model-const-rt-model-0-src-mq3-renderer-tr-main-runtime-ml-408379127"></a>
### RT_MODEL

```ml
const RT_MODEL = 0
```

Renderer entity type for an animated or inline model.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L17)

<a id="constant-constant-mq3-renderer-tr-main-runtime-rt-poly-const-rt-poly-1-src-mq3-renderer-tr-main-runtime-ml-142706086"></a>
### RT_POLY

```ml
const RT_POLY = 1
```

Renderer entity type for submitted polygon geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L19)

<a id="constant-constant-mq3-renderer-tr-main-runtime-rt-portalsurface-const-rt-portalsurface-7-src-mq3-renderer-tr-main-runtime-ml-315874154"></a>
### RT_PORTALSURFACE

```ml
const RT_PORTALSURFACE = 7
```

Renderer entity type carrying portal-view information without directly drawing geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L31)

<a id="constant-constant-mq3-renderer-tr-main-runtime-rt-rail-core-const-rt-rail-core-4-src-mq3-renderer-tr-main-runtime-ml-1435003441"></a>
### RT_RAIL_CORE

```ml
const RT_RAIL_CORE = 4
```

Renderer entity type for the core of a railgun trail.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L25)

<a id="constant-constant-mq3-renderer-tr-main-runtime-rt-rail-rings-const-rt-rail-rings-5-src-mq3-renderer-tr-main-runtime-ml-1940179002"></a>
### RT_RAIL_RINGS

```ml
const RT_RAIL_RINGS = 5
```

Renderer entity type for rings around a railgun trail.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L27)

<a id="constant-constant-mq3-renderer-tr-main-runtime-rt-sprite-const-rt-sprite-2-src-mq3-renderer-tr-main-runtime-ml-380671699"></a>
### RT_SPRITE

```ml
const RT_SPRITE = 2
```

Renderer entity type for a camera-facing sprite.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L21)

<a id="function-function-mq3-renderer-tr-main-runtime-setfarclip-function-setfarclip-noworld-visbounds-vieworigin-src-mq3-renderer-tr-main-runtime-ml-91190479"></a>
### SetFarClip

```ml
function SetFarClip(noworld, visBounds, viewOrigin)
```

Computes `SetFarClip` from `n.fsqrt(farthest)` using `mq3.shared.math.DotProduct`, `mq3.compat.numeric.fsqrt`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `noworld` | `dynamic` | — | Input tested by `noworld`. |
| `visBounds` | `dynamic` | — | Nested indexed data; outer entries read at `1-(i&1)`, `1-((i>>1)&1)`, `1-((i>>2)&1)`. |
| `viewOrigin` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L227)

<a id="constant-constant-mq3-renderer-tr-main-runtime-sf-face-const-sf-face-2-src-mq3-renderer-tr-main-runtime-ml-582226751"></a>
### SF_FACE

```ml
const SF_FACE = 2
```

Surface-dispatch tag identifying a planar BSP face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L33)

<a id="constant-constant-mq3-renderer-tr-main-runtime-sf-poly-const-sf-poly-5-src-mq3-renderer-tr-main-runtime-ml-1488384074"></a>
### SF_POLY

```ml
const SF_POLY = 5
```

Surface-dispatch tag identifying a submitted polygon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L37)

<a id="constant-constant-mq3-renderer-tr-main-runtime-sf-triangles-const-sf-triangles-4-src-mq3-renderer-tr-main-runtime-ml-320152721"></a>
### SF_TRIANGLES

```ml
const SF_TRIANGLES = 4
```

Surface-dispatch tag identifying indexed triangle geometry.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L35)

<a id="function-function-mq3-renderer-tr-main-runtime-shortsort-function-shortsort-drawsurfs-src-mq3-renderer-tr-main-runtime-ml-49679015"></a>
### shortsort

```ml
function shortsort(drawSurfs)
```

Calls `mq3.renderer.draw_surfs.sortStable` with `(drawSurfs)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `drawSurfs` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.draw_surfs.sortStable`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L353)

<a id="function-function-mq3-renderer-tr-main-runtime-surfisoffscreen-function-surfisoffscreen-vertices-normals-indexes-modelmatrix-projectionmatrix-vieworigin-portalrange-mirror-smpactive-src-mq3-renderer-tr-main-runtime-ml-1241432312"></a>
### SurfIsOffscreen

```ml
function SurfIsOffscreen(vertices, normals, indexes, modelMatrix, projectionMatrix, viewOrigin, portalRange, mirror, smpActive)
```

Computes `SurfIsOffscreen` from `shortest>portalRange*portalRange` using `mq3.renderer.view_math.transformModelToClip`, `mq3.shared.math.DotProduct`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vertices` | `dynamic` | — | Nested indexed data; outer entries read at `index`. |
| `normals` | `dynamic` | — | Indexed input read at `index`. |
| `indexes` | `dynamic` | — | Indexed input read at `i`. |
| `modelMatrix` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.view_math.transformModelToClip`. |
| `projectionMatrix` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.view_math.transformModelToClip`. |
| `viewOrigin` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `portalRange` | `dynamic` | — | Input used in the result expression `shortest>portalRange*portalRange`. |
| `mirror` | `dynamic` | — | Input tested by `mirror`. |
| `smpActive` | `dynamic` | — | Input tested by `smpActive`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L302)
