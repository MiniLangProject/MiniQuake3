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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L37)

<a id="function-function-mq3-renderer-tr-main-runtime-identityaxis-function-identityaxis-src-mq3-renderer-tr-main-runtime-ml-1597661830"></a>
### identityAxis

```ml
function identityAxis()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L38)

<a id="function-function-mq3-renderer-tr-main-runtime-identitymatrix-function-identitymatrix-src-mq3-renderer-tr-main-runtime-ml-575293590"></a>
### identityMatrix

```ml
function identityMatrix()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L39)

<a id="function-function-mq3-renderer-tr-main-runtime-ismirror-function-ismirror-surface-entities-timemilliseconds-src-mq3-renderer-tr-main-runtime-ml-1111534963"></a>
### IsMirror

```ml
function IsMirror(surface, entities, timeMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — |  |
| `entities` | `dynamic` | — |  |
| `timeMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L120)

<a id="function-function-mq3-renderer-tr-main-runtime-myglmultmatrix-function-myglmultmatrix-a-b-src-mq3-renderer-tr-main-runtime-ml-542909355"></a>
### myGlMultMatrix

```ml
function myGlMultMatrix(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L51)

<a id="function-function-mq3-renderer-tr-main-runtime-orientation-function-orientation-origin-axis-vieworigin-modelmatrix-src-mq3-renderer-tr-main-runtime-ml-2140598502"></a>
### orientation

```ml
function orientation(origin, axis, viewOrigin, modelMatrix)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `axis` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |
| `modelMatrix` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L40)

- [mq3.renderer.tr_main_runtime.Orientation](Type-mq3-renderer-tr-main-runtime-orientation-1673570470.md) — struct
- [mq3.renderer.tr_main_runtime.Plane](Type-mq3-renderer-tr-main-runtime-plane-1583899950.md) — struct
<a id="function-function-mq3-renderer-tr-main-runtime-qsortfast-function-qsortfast-drawsurfs-src-mq3-renderer-tr-main-runtime-ml-879427505"></a>
### qsortFast

```ml
function qsortFast(drawSurfs)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `drawSurfs` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L158)

<a id="function-function-mq3-renderer-tr-main-runtime-r-adddrawsurf-function-r-adddrawsurf-queue-surface-shaderindex-entitynum-fogindex-dlightmap-src-mq3-renderer-tr-main-runtime-ml-77695670"></a>
### R_AddDrawSurf

```ml
function R_AddDrawSurf(queue, surface, shaderIndex, entityNum, fogIndex, dlightMap)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — |  |
| `surface` | `dynamic` | — |  |
| `shaderIndex` | `dynamic` | — |  |
| `entityNum` | `dynamic` | — |  |
| `fogIndex` | `dynamic` | — |  |
| `dlightMap` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L159)

<a id="function-function-mq3-renderer-tr-main-runtime-r-addentitysurfaces-function-r-addentitysurfaces-entities-isportal-fogbounds-noworld-drawentities-src-mq3-renderer-tr-main-runtime-ml-471097422"></a>
### R_AddEntitySurfaces

```ml
function R_AddEntitySurfaces(entities, isPortal, fogBounds, noworld, drawEntities)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entities` | `dynamic` | — |  |
| `isPortal` | `dynamic` | — |  |
| `fogBounds` | `dynamic` | — |  |
| `noworld` | `dynamic` | — |  |
| `drawEntities` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L163)

<a id="function-function-mq3-renderer-tr-main-runtime-r-culllocalbox-function-r-culllocalbox-bounds-current-frustum-nocull-src-mq3-renderer-tr-main-runtime-ml-1283835151"></a>
### R_CullLocalBox

```ml
function R_CullLocalBox(bounds, current, frustum, noCull)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bounds` | `dynamic` | — |  |
| `current` | `dynamic` | — |  |
| `frustum` | `dynamic` | — |  |
| `noCull` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L42)

<a id="function-function-mq3-renderer-tr-main-runtime-r-culllocalpointandradius-function-r-culllocalpointandradius-point-radius-current-frustum-nocull-src-mq3-renderer-tr-main-runtime-ml-1958331682"></a>
### R_CullLocalPointAndRadius

```ml
function R_CullLocalPointAndRadius(point, radius, current, frustum, noCull)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `current` | `dynamic` | — |  |
| `frustum` | `dynamic` | — |  |
| `noCull` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L43)

<a id="function-function-mq3-renderer-tr-main-runtime-r-cullpointandradius-function-r-cullpointandradius-point-radius-frustum-nocull-src-mq3-renderer-tr-main-runtime-ml-101377541"></a>
### R_CullPointAndRadius

```ml
function R_CullPointAndRadius(point, radius, frustum, noCull)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `frustum` | `dynamic` | — |  |
| `noCull` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L44)

<a id="function-function-mq3-renderer-tr-main-runtime-r-debuggraphics-function-r-debuggraphics-state-enabled-src-mq3-renderer-tr-main-runtime-ml-1239787866"></a>
### R_DebugGraphics

```ml
function R_DebugGraphics(state, enabled)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `enabled` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L193)

<a id="function-function-mq3-renderer-tr-main-runtime-r-debugpolygon-function-r-debugpolygon-color-points-src-mq3-renderer-tr-main-runtime-ml-1383858694"></a>
### R_DebugPolygon

```ml
function R_DebugPolygon(color, points)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `color` | `dynamic` | — |  |
| `points` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L187)

<a id="function-function-mq3-renderer-tr-main-runtime-r-decomposesort-function-r-decomposesort-sortkey-src-mq3-renderer-tr-main-runtime-ml-692729515"></a>
### R_DecomposeSort

```ml
function R_DecomposeSort(sortKey)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sortKey` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L160)

<a id="function-function-mq3-renderer-tr-main-runtime-r-generatedrawsurfs-function-r-generatedrawsurfs-state-src-mq3-renderer-tr-main-runtime-ml-1392304603"></a>
### R_GenerateDrawSurfs

```ml
function R_GenerateDrawSurfs(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L178)

<a id="function-function-mq3-renderer-tr-main-runtime-r-getportalorientations-function-r-getportalorientations-surface-entities-timemilliseconds-src-mq3-renderer-tr-main-runtime-ml-61931259"></a>
### R_GetPortalOrientations

```ml
function R_GetPortalOrientations(surface, entities, timeMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — |  |
| `entities` | `dynamic` | — |  |
| `timeMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L119)

<a id="function-function-mq3-renderer-tr-main-runtime-r-localnormaltoworld-function-r-localnormaltoworld-local-current-src-mq3-renderer-tr-main-runtime-ml-1034692002"></a>
### R_LocalNormalToWorld

```ml
function R_LocalNormalToWorld(local, current)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `local` | `dynamic` | — |  |
| `current` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L45)

<a id="function-function-mq3-renderer-tr-main-runtime-r-localpointtoworld-function-r-localpointtoworld-local-current-src-mq3-renderer-tr-main-runtime-ml-662087452"></a>
### R_LocalPointToWorld

```ml
function R_LocalPointToWorld(local, current)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `local` | `dynamic` | — |  |
| `current` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L46)

<a id="function-function-mq3-renderer-tr-main-runtime-r-mirrorpoint-function-r-mirrorpoint-input-surface-camera-src-mq3-renderer-tr-main-runtime-ml-620356590"></a>
### R_MirrorPoint

```ml
function R_MirrorPoint(input, surface, camera)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — |  |
| `surface` | `dynamic` | — |  |
| `camera` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L105)

<a id="function-function-mq3-renderer-tr-main-runtime-r-mirrorvector-function-r-mirrorvector-input-surface-camera-src-mq3-renderer-tr-main-runtime-ml-388947978"></a>
### R_MirrorVector

```ml
function R_MirrorVector(input, surface, camera)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — |  |
| `surface` | `dynamic` | — |  |
| `camera` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L106)

<a id="function-function-mq3-renderer-tr-main-runtime-r-mirrorviewbysurface-function-r-mirrorviewbysurface-surface-entities-timemilliseconds-vieworigin-viewaxis-isportal-noportals-fastsky-src-mq3-renderer-tr-main-runtime-ml-386655165"></a>
### R_MirrorViewBySurface

```ml
function R_MirrorViewBySurface(surface, entities, timeMilliseconds, viewOrigin, viewAxis, isPortal, noPortals, fastSky)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — |  |
| `entities` | `dynamic` | — |  |
| `timeMilliseconds` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |
| `viewAxis` | `dynamic` | — |  |
| `isPortal` | `dynamic` | — |  |
| `noPortals` | `dynamic` | — |  |
| `fastSky` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L142)

<a id="function-function-mq3-renderer-tr-main-runtime-r-planeforsurface-function-r-planeforsurface-surface-src-mq3-renderer-tr-main-runtime-ml-1913967929"></a>
### R_PlaneForSurface

```ml
function R_PlaneForSurface(surface)
```

Surface is {kind, plane} for faces or {kind, vertices, indexes} for meshes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L109)

<a id="function-function-mq3-renderer-tr-main-runtime-r-renderview-function-r-renderview-state-parms-src-mq3-renderer-tr-main-runtime-ml-298740398"></a>
### R_RenderView

```ml
function R_RenderView(state, parms)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `parms` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L199)

<a id="function-function-mq3-renderer-tr-main-runtime-r-rotateforentity-function-r-rotateforentity-entity-viewparms-src-mq3-renderer-tr-main-runtime-ml-1755282305"></a>
### R_RotateForEntity

```ml
function R_RotateForEntity(entity, viewParms)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — |  |
| `viewParms` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L62)

<a id="function-function-mq3-renderer-tr-main-runtime-r-rotateforviewer-function-r-rotateforviewer-vieworigin-viewaxis-src-mq3-renderer-tr-main-runtime-ml-140020069"></a>
### R_RotateForViewer

```ml
function R_RotateForViewer(viewOrigin, viewAxis)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `viewOrigin` | `dynamic` | — |  |
| `viewAxis` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L75)

<a id="function-function-mq3-renderer-tr-main-runtime-r-setupfrustum-function-r-setupfrustum-origin-axis-fovx-fovy-src-mq3-renderer-tr-main-runtime-ml-1830639646"></a>
### R_SetupFrustum

```ml
function R_SetupFrustum(origin, axis, fovX, fovY)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `axis` | `dynamic` | — |  |
| `fovX` | `dynamic` | — |  |
| `fovY` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L104)

<a id="function-function-mq3-renderer-tr-main-runtime-r-setupprojection-function-r-setupprojection-fovx-fovy-znear-zfar-src-mq3-renderer-tr-main-runtime-ml-356122686"></a>
### R_SetupProjection

```ml
function R_SetupProjection(fovX, fovY, zNear, zFar)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fovX` | `dynamic` | — |  |
| `fovY` | `dynamic` | — |  |
| `zNear` | `dynamic` | — |  |
| `zFar` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L95)

<a id="function-function-mq3-renderer-tr-main-runtime-r-sortdrawsurfs-function-r-sortdrawsurfs-queue-src-mq3-renderer-tr-main-runtime-ml-1202690451"></a>
### R_SortDrawSurfs

```ml
function R_SortDrawSurfs(queue)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queue` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L161)

<a id="function-function-mq3-renderer-tr-main-runtime-r-spritefognum-function-r-spritefognum-origin-radius-fogbounds-noworld-src-mq3-renderer-tr-main-runtime-ml-309997040"></a>
### R_SpriteFogNum

```ml
function R_SpriteFogNum(origin, radius, fogBounds, noworld)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `fogBounds` | `dynamic` | — |  |
| `noworld` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L147)

<a id="function-function-mq3-renderer-tr-main-runtime-r-transformcliptowindow-function-r-transformcliptowindow-clip-viewportwidth-viewportheight-src-mq3-renderer-tr-main-runtime-ml-1006570685"></a>
### R_TransformClipToWindow

```ml
function R_TransformClipToWindow(clip, viewportWidth, viewportHeight)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clip` | `dynamic` | — |  |
| `viewportWidth` | `dynamic` | — |  |
| `viewportHeight` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L49)

<a id="function-function-mq3-renderer-tr-main-runtime-r-transformmodeltoclip-function-r-transformmodeltoclip-source-modelmatrix-projectionmatrix-src-mq3-renderer-tr-main-runtime-ml-195723387"></a>
### R_TransformModelToClip

```ml
function R_TransformModelToClip(source, modelMatrix, projectionMatrix)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `modelMatrix` | `dynamic` | — |  |
| `projectionMatrix` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L48)

<a id="function-function-mq3-renderer-tr-main-runtime-r-worldtolocal-function-r-worldtolocal-world-current-src-mq3-renderer-tr-main-runtime-ml-1244129433"></a>
### R_WorldToLocal

```ml
function R_WorldToLocal(world, current)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `current` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L47)

<a id="constant-constant-mq3-renderer-tr-main-runtime-rdf-noworldmodel-const-rdf-noworldmodel-1-src-mq3-renderer-tr-main-runtime-ml-179929702"></a>
### RDF_NOWORLDMODEL

```ml
const RDF_NOWORLDMODEL = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L27)

- [mq3.renderer.tr_main_runtime.RenderServices](Type-mq3-renderer-tr-main-runtime-renderservices-1840260692.md) — struct
- [mq3.renderer.tr_main_runtime.RenderState](Type-mq3-renderer-tr-main-runtime-renderstate-410585153.md) — struct
<a id="constant-constant-mq3-renderer-tr-main-runtime-rt-beam-const-rt-beam-3-src-mq3-renderer-tr-main-runtime-ml-43189420"></a>
### RT_BEAM

```ml
const RT_BEAM = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L19)

<a id="constant-constant-mq3-renderer-tr-main-runtime-rt-lightning-const-rt-lightning-6-src-mq3-renderer-tr-main-runtime-ml-248950203"></a>
### RT_LIGHTNING

```ml
const RT_LIGHTNING = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L22)

<a id="constant-constant-mq3-renderer-tr-main-runtime-rt-model-const-rt-model-0-src-mq3-renderer-tr-main-runtime-ml-408379127"></a>
### RT_MODEL

```ml
const RT_MODEL = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L16)

<a id="constant-constant-mq3-renderer-tr-main-runtime-rt-poly-const-rt-poly-1-src-mq3-renderer-tr-main-runtime-ml-142706086"></a>
### RT_POLY

```ml
const RT_POLY = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L17)

<a id="constant-constant-mq3-renderer-tr-main-runtime-rt-portalsurface-const-rt-portalsurface-7-src-mq3-renderer-tr-main-runtime-ml-315874154"></a>
### RT_PORTALSURFACE

```ml
const RT_PORTALSURFACE = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L23)

<a id="constant-constant-mq3-renderer-tr-main-runtime-rt-rail-core-const-rt-rail-core-4-src-mq3-renderer-tr-main-runtime-ml-1435003441"></a>
### RT_RAIL_CORE

```ml
const RT_RAIL_CORE = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L20)

<a id="constant-constant-mq3-renderer-tr-main-runtime-rt-rail-rings-const-rt-rail-rings-5-src-mq3-renderer-tr-main-runtime-ml-1940179002"></a>
### RT_RAIL_RINGS

```ml
const RT_RAIL_RINGS = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L21)

<a id="constant-constant-mq3-renderer-tr-main-runtime-rt-sprite-const-rt-sprite-2-src-mq3-renderer-tr-main-runtime-ml-380671699"></a>
### RT_SPRITE

```ml
const RT_SPRITE = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L18)

<a id="function-function-mq3-renderer-tr-main-runtime-setfarclip-function-setfarclip-noworld-visbounds-vieworigin-src-mq3-renderer-tr-main-runtime-ml-91190479"></a>
### SetFarClip

```ml
function SetFarClip(noworld, visBounds, viewOrigin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `noworld` | `dynamic` | — |  |
| `visBounds` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L84)

<a id="constant-constant-mq3-renderer-tr-main-runtime-sf-face-const-sf-face-2-src-mq3-renderer-tr-main-runtime-ml-582226751"></a>
### SF_FACE

```ml
const SF_FACE = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L24)

<a id="constant-constant-mq3-renderer-tr-main-runtime-sf-poly-const-sf-poly-5-src-mq3-renderer-tr-main-runtime-ml-1488384074"></a>
### SF_POLY

```ml
const SF_POLY = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L26)

<a id="constant-constant-mq3-renderer-tr-main-runtime-sf-triangles-const-sf-triangles-4-src-mq3-renderer-tr-main-runtime-ml-320152721"></a>
### SF_TRIANGLES

```ml
const SF_TRIANGLES = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L25)

<a id="function-function-mq3-renderer-tr-main-runtime-shortsort-function-shortsort-drawsurfs-src-mq3-renderer-tr-main-runtime-ml-49679015"></a>
### shortsort

```ml
function shortsort(drawSurfs)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `drawSurfs` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L157)

<a id="function-function-mq3-renderer-tr-main-runtime-surfisoffscreen-function-surfisoffscreen-vertices-normals-indexes-modelmatrix-projectionmatrix-vieworigin-portalrange-mirror-smpactive-src-mq3-renderer-tr-main-runtime-ml-1241432312"></a>
### SurfIsOffscreen

```ml
function SurfIsOffscreen(vertices, normals, indexes, modelMatrix, projectionMatrix, viewOrigin, portalRange, mirror, smpActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vertices` | `dynamic` | — |  |
| `normals` | `dynamic` | — |  |
| `indexes` | `dynamic` | — |  |
| `modelMatrix` | `dynamic` | — |  |
| `projectionMatrix` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |
| `portalRange` | `dynamic` | — |  |
| `mirror` | `dynamic` | — |  |
| `smpActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/tr_main_runtime.ml#L122)
