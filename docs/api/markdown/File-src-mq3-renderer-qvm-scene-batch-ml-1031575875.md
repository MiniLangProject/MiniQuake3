# `src/mq3/renderer/qvm_scene_batch.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.qvm_scene_batch`](Package-mq3-renderer-qvm-scene-batch-2049020833.md)

Reachable from entry: **yes**

## Imports

- `mq3/platform/playable_multitexture.ml` as `multitexture` → [src/mq3/platform/playable_multitexture.ml](File-src-mq3-platform-playable-multitexture-ml-346016672.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/renderer/bsp_render_data.ml` as `renderData` → [src/mq3/renderer/bsp_render_data.ml](File-src-mq3-renderer-bsp-render-data-ml-926244912.md)
- `mq3/renderer/playable_world_batch.ml` as `worldBatch` → [src/mq3/renderer/playable_world_batch.ml](File-src-mq3-renderer-playable-world-batch-ml-1411140007.md)
- `std/ds/hashmap.ml` as `maps` → `../MiniLangCompilerML/std/ds/hashmap.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-qvm-scene-batch-attachdynamiclights-function-attachdynamiclights-prepared-catalog-lightcatalog-src-mq3-renderer-qvm-scene-batch-ml-501852047"></a>
### attachDynamicLights

```ml
function attachDynamicLights(prepared, catalog, lightCatalog)
```

Builds `origins[index]`, `axes[index]`, `bounds[index]` in `mq3.renderer.qvm_scene_batch.attachDynamicLights`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `prepared` | `dynamic` | — | Record providing `prepared.batch`, `prepared.dynamicGeometry`. |
| `catalog` | `dynamic` | — | Record providing `catalog.triangles`, `catalog.materials`. |
| `lightCatalog` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.playable_world_batch.attachDynamicLightsOriented`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L251)

<a id="function-function-mq3-renderer-qvm-scene-batch-attachfog-function-attachfog-prepared-catalog-src-mq3-renderer-qvm-scene-batch-ml-796632042"></a>
### attachFog

```ml
function attachFog(prepared, catalog)
```

Computes `attachFog` from `attached+depthAttached` using `mq3.renderer.playable_world_batch.attachFog`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `prepared` | `dynamic` | — | Record providing `prepared.batch`, `prepared.geometry`, `prepared.depthHackBatch`, `prepared.depthHackGeometry`. |
| `catalog` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.playable_world_batch.attachFog`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L240)

<a id="function-function-mq3-renderer-qvm-scene-batch-build-function-build-catalog-src-mq3-renderer-qvm-scene-batch-ml-1897744505"></a>
### build

```ml
function build(catalog)
```

Calls `mq3.renderer.qvm_scene_batch.buildWithGeometry` with `(catalog,void)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Value forwarded as `catalog` to `mq3.renderer.qvm_scene_batch.buildWithGeometry`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L232)

<a id="function-function-mq3-renderer-qvm-scene-batch-buildshadowbatch-function-buildshadowbatch-catalog-scenegeometry-existing-src-mq3-renderer-qvm-scene-batch-ml-262391222"></a>
### buildShadowBatch

```ml
function buildShadowBatch(catalog, sceneGeometry, existing)
```

Computes `buildShadowBatch` from `existing` using `mq3.renderer.qvm_scene_batch.shadowPolicies`, `mq3.renderer.qvm_scene_batch.policyOpaque`, `mq3.platform.playable_window.createTriangleBatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Value forwarded as `catalog` to `mq3.renderer.qvm_scene_batch.shadowPolicies`. |
| `sceneGeometry` | `dynamic` | — | Record providing `sceneGeometry.shadowTriangles`, `sceneGeometry.shadowTriangleCount`. |
| `existing` | `dynamic` | — | Input used by `batch=existing`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L101)

<a id="function-function-mq3-renderer-qvm-scene-batch-buildwithgeometry-function-buildwithgeometry-catalog-scenegeometry-src-mq3-renderer-qvm-scene-batch-ml-2077358701"></a>
### buildWithGeometry

```ml
function buildWithGeometry(catalog, sceneGeometry)
```

Calls `mq3.renderer.qvm_scene_batch.refreshWithGeometry` with `(Prepared(void,void,void,void,void,void,0),catalog,sceneGeometry)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Value forwarded as `catalog` to `mq3.renderer.qvm_scene_batch.refreshWithGeometry`. |
| `sceneGeometry` | `dynamic` | — | Value forwarded as `sceneGeometry` to `mq3.renderer.qvm_scene_batch.refreshWithGeometry`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L227)

<a id="function-function-mq3-renderer-qvm-scene-batch-convert-function-convert-catalog-src-mq3-renderer-qvm-scene-batch-ml-761945963"></a>
### convert

```ml
function convert(catalog)
```

Returns `prepared.geometry` from `mq3.renderer.qvm_scene_batch.convert`; earlier branches return `fail("material catalog is required")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Record providing `catalog.triangles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L190)

<a id="function-function-mq3-renderer-qvm-scene-batch-convertedvertex-function-convertedvertex-triangle-corner-sourceindex-src-mq3-renderer-qvm-scene-batch-ml-878015248"></a>
### convertedVertex

```ml
function convertedVertex(triangle, corner, sourceIndex)
```

Forwards `convertedVertex` to `mq3.renderer.bsp_render_data.RenderVertex` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `triangle` | `dynamic` | — | Record providing `triangle.positions`, `triangle.texCoords`, `triangle.lightmapCoords`, `triangle.normals`, `triangle.colors`, `triangle.entityColor`. |
| `corner` | `dynamic` | — | Vertex index used consistently across source triangle attribute arrays. |
| `sourceIndex` | `dynamic` | — | Argument 9 supplied to `mq3.renderer.bsp_render_data.RenderVertex`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L41)

<a id="function-function-mq3-renderer-qvm-scene-batch-depthhack-inline-function-depthhack-triangle-returns-bool-src-mq3-renderer-qvm-scene-batch-ml-1905490860"></a>
### depthHack

```ml
inline function depthHack(triangle) returns bool
```

Tests the RF_DEPTHHACK render flag on a source triangle.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `triangle` | `dynamic` | — | Source triangle carrying entity rendering flags. |


**Returns:** True when RF_DEPTHHACK is set.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L56)

<a id="function-function-mq3-renderer-qvm-scene-batch-draw-function-draw-prepared-projection-nowmilliseconds-src-mq3-renderer-qvm-scene-batch-ml-862212894"></a>
### draw

```ml
function draw(prepared, projection, nowMilliseconds)
```

Computes `draw` from `drawn+depthDrawn` using `mq3.renderer.playable_world_batch.drawMaterials`, `mq3.platform.playable_window.setDepthRange`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `prepared` | `dynamic` | — | Record providing `prepared.batch`, `prepared.depthHackGeometry`, `prepared.depthHackBatch`. |
| `projection` | `dynamic` | — | Record providing `projection.nearDistance`. |
| `nowMilliseconds` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.playable_world_batch.drawMaterials`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L268)

<a id="function-function-mq3-renderer-qvm-scene-batch-drawlit-function-drawlit-prepared-projection-nowmilliseconds-lights-src-mq3-renderer-qvm-scene-batch-ml-253185767"></a>
### drawLit

```ml
function drawLit(prepared, projection, nowMilliseconds, lights)
```

Computes `drawLit` from `drawn+depthDrawn` using `mq3.renderer.playable_world_batch.drawMaterialsLit`, `mq3.platform.playable_window.setDepthRange`, `mq3.renderer.playable_world_batch.drawMaterials`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `prepared` | `dynamic` | — | Record providing `prepared.batch`, `prepared.depthHackGeometry`, `prepared.depthHackBatch`. |
| `projection` | `dynamic` | — | Record providing `projection.nearDistance`. |
| `nowMilliseconds` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`. |
| `lights` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L294)

<a id="function-function-mq3-renderer-qvm-scene-batch-drawlitviewport-function-drawlitviewport-prepared-projection-area-nowmilliseconds-lights-src-mq3-renderer-qvm-scene-batch-ml-1712990510"></a>
### drawLitViewport

```ml
function drawLitViewport(prepared, projection, area, nowMilliseconds, lights)
```

Computes `drawLitViewport` from `drawn+depthDrawn` using `mq3.renderer.playable_world_batch.drawMaterialsLitViewport`, `mq3.platform.playable_window.setDepthRange`, `mq3.renderer.playable_world_batch.drawMaterialsViewport`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `prepared` | `dynamic` | — | Record providing `prepared.batch`, `prepared.depthHackGeometry`, `prepared.depthHackBatch`. |
| `projection` | `dynamic` | — | Record providing `projection.nearDistance`. |
| `area` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLitViewport`. |
| `nowMilliseconds` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLitViewport`. |
| `lights` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLitViewport`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L308)

<a id="function-function-mq3-renderer-qvm-scene-batch-drawlitviewportshadows-function-drawlitviewportshadows-prepared-projection-area-nowmilliseconds-lights-mirror-src-mq3-renderer-qvm-scene-batch-ml-476187121"></a>
### drawLitViewportShadows

```ml
function drawLitViewportShadows(prepared, projection, area, nowMilliseconds, lights, mirror)
```

Computes `drawLitViewportShadows` from `drawn+shadows` using `mq3.renderer.qvm_scene_batch.drawLitViewport`, `mq3.renderer.qvm_scene_batch.drawStencilShadows`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `prepared` | `dynamic` | — | Value forwarded as `prepared` to `mq3.renderer.qvm_scene_batch.drawLitViewport`. |
| `projection` | `dynamic` | — | Value forwarded as `projection` to `mq3.renderer.qvm_scene_batch.drawLitViewport`. |
| `area` | `dynamic` | — | Value forwarded as `area` to `mq3.renderer.qvm_scene_batch.drawLitViewport`. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.qvm_scene_batch.drawLitViewport`. |
| `lights` | `dynamic` | — | Value forwarded as `lights` to `mq3.renderer.qvm_scene_batch.drawLitViewport`. |
| `mirror` | `dynamic` | — | Value forwarded as `mirror` to `mq3.renderer.qvm_scene_batch.drawStencilShadows`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L346)

<a id="function-function-mq3-renderer-qvm-scene-batch-drawstencilshadows-function-drawstencilshadows-prepared-projection-area-mirror-src-mq3-renderer-qvm-scene-batch-ml-1125882752"></a>
### drawStencilShadows

```ml
function drawStencilShadows(prepared, projection, area, mirror)
```

RB_ShadowTessEnd increments front-facing volume sides and decrements back sides; mirrored portal views reverse those cull passes. RB_ShadowFinish then overlays 60% black wherever the resulting stencil value is non-zero.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `prepared` | `dynamic` | — | Record providing `prepared.shadowBatch`, `prepared.shadowCount`. |
| `projection` | `dynamic` | — | Argument 2 supplied to `mq3.platform.playable_window.submitWorldTriangleBatchViewport`. |
| `area` | `dynamic` | — | Argument 1 supplied to `mq3.platform.playable_window.clearStencil`. |
| `mirror` | `dynamic` | — | Input tested by `mirror`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L323)

<a id="function-function-mq3-renderer-qvm-scene-batch-drawviewport-function-drawviewport-prepared-projection-area-nowmilliseconds-src-mq3-renderer-qvm-scene-batch-ml-752104675"></a>
### drawViewport

```ml
function drawViewport(prepared, projection, area, nowMilliseconds)
```

Computes `drawViewport` from `drawn+depthDrawn` using `mq3.renderer.playable_world_batch.drawMaterialsViewport`, `mq3.platform.playable_window.setDepthRange`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `prepared` | `dynamic` | — | Record providing `prepared.batch`, `prepared.depthHackGeometry`, `prepared.depthHackBatch`. |
| `projection` | `dynamic` | — | Record providing `projection.nearDistance`. |
| `area` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.playable_world_batch.drawMaterialsViewport`. |
| `nowMilliseconds` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.playable_world_batch.drawMaterialsViewport`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L281)

<a id="function-function-mq3-renderer-qvm-scene-batch-fail-function-fail-message-src-mq3-renderer-qvm-scene-batch-ml-313133781"></a>
### fail

```ml
function fail(message)
```

Creates error `7681` with message `"QVM scene batch: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7681,"QVM scene batch: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L36)

<a id="function-function-mq3-renderer-qvm-scene-batch-policyopaque-function-policyopaque-policies-entityindex-surfaceindex-src-mq3-renderer-qvm-scene-batch-ml-1360262994"></a>
### policyOpaque

```ml
function policyOpaque(policies, entityIndex, surfaceIndex)
```

Computes `policies.get(shadowPolicyKey(entityIndex,surfaceIndex))==true` for `mq3.renderer.qvm_scene_batch.policyOpaque`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `policies` | `dynamic` | — | Record providing `policies.get`. |
| `entityIndex` | `dynamic` | — | Value forwarded as `entityIndex` to `mq3.renderer.qvm_scene_batch.shadowPolicyKey`. |
| `surfaceIndex` | `dynamic` | — | Value forwarded as `surfaceIndex` to `mq3.renderer.qvm_scene_batch.shadowPolicyKey`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L94)

- [mq3.renderer.qvm_scene_batch.Prepared](Type-mq3-renderer-qvm-scene-batch-prepared-1944088064.md) — struct
<a id="function-function-mq3-renderer-qvm-scene-batch-preparegeometry-function-preparegeometry-prepared-catalog-src-mq3-renderer-qvm-scene-batch-ml-528132954"></a>
### prepareGeometry

```ml
function prepareGeometry(prepared, catalog)
```

Each view owns its vertex records. Preserve catalog order within each pass and allocate fallback IDs above every source ID, including filtered surfaces.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `prepared` | `dynamic` | — | Mutable record or buffer; this call updates `prepared.geometry`, `prepared.depthHackGeometry`, `prepared.dynamicGeometry`. |
| `catalog` | `dynamic` | — | Record providing `catalog.triangles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L158)

<a id="function-function-mq3-renderer-qvm-scene-batch-preparematerials-function-preparematerials-previous-geometry-catalog-skyflags-src-mq3-renderer-qvm-scene-batch-ml-1292875292"></a>
### prepareMaterials

```ml
function prepareMaterials(previous, geometry, catalog, skyFlags)
```

Computes `prepareMaterials` from `worldBatch.buildMaterials(geometry,catalog,skyFlags)` using `mq3.renderer.playable_world_batch.refreshMaterials`, `mq3.renderer.playable_world_batch.buildMaterials`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `previous` | `dynamic` | — | Record providing `previous.sourceTriangles`. |
| `geometry` | `dynamic` | — | Record providing `geometry.triangleCount`. |
| `catalog` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.playable_world_batch.refreshMaterials`. |
| `skyFlags` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.playable_world_batch.refreshMaterials`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L200)

<a id="constant-constant-mq3-renderer-qvm-scene-batch-projection-shadow-shader-const-projection-shadow-shader-mq3-projectionshadow-src-mq3-renderer-qvm-scene-batch-ml-1453794458"></a>
### PROJECTION_SHADOW_SHADER

```ml
const PROJECTION_SHADOW_SHADER = "$mq3/projectionShadow"
```

Builtin shader name used for projected entity shadows.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L14)

<a id="function-function-mq3-renderer-qvm-scene-batch-receivesdynamiclight-inline-function-receivesdynamiclight-catalog-resolved-returns-bool-src-mq3-renderer-qvm-scene-batch-ml-127327499"></a>
### receivesDynamicLight

```ml
inline function receivesDynamicLight(catalog, resolved) returns bool
```

Tests whether a resolved triangle requests dynamic lighting and references an opaque-enough catalog material.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Record providing `catalog.materials`. |
| `resolved` | `dynamic` | — | Record providing `resolved.materialIndex`, `resolved.triangle`. |


**Returns:** True when the source requests dynamic lighting and its valid material has sort <= 3.0.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L65)

<a id="function-function-mq3-renderer-qvm-scene-batch-refresh-function-refresh-prepared-catalog-src-mq3-renderer-qvm-scene-batch-ml-669271742"></a>
### refresh

```ml
function refresh(prepared, catalog)
```

Calls `mq3.renderer.qvm_scene_batch.refreshWithGeometry` with `(prepared,catalog,void)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `prepared` | `dynamic` | — | Value forwarded as `prepared` to `mq3.renderer.qvm_scene_batch.refreshWithGeometry`. |
| `catalog` | `dynamic` | — | Value forwarded as `catalog` to `mq3.renderer.qvm_scene_batch.refreshWithGeometry`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L236)

<a id="function-function-mq3-renderer-qvm-scene-batch-refreshwithgeometry-function-refreshwithgeometry-prepared-catalog-scenegeometry-src-mq3-renderer-qvm-scene-batch-ml-713365208"></a>
### refreshWithGeometry

```ml
function refreshWithGeometry(prepared, catalog, sceneGeometry)
```

Updates `prepared.batch`, `prepared.depthHackBatch`, `prepared.shadowBatch`, `prepared.shadowCount` in `mq3.renderer.qvm_scene_batch.refreshWithGeometry`; returns `prepared`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `prepared` | `dynamic` | — | Mutable record or buffer; this call updates `prepared.batch`, `prepared.depthHackBatch`, `prepared.shadowBatch`, `prepared.shadowCount`. |
| `catalog` | `dynamic` | — | Record providing `catalog.triangles`, `catalog.materials`. |
| `sceneGeometry` | `dynamic` | — | Value forwarded as `sceneGeometry` to `mq3.renderer.qvm_scene_batch.buildShadowBatch`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L213)

<a id="function-function-mq3-renderer-qvm-scene-batch-release-function-release-catalog-src-mq3-renderer-qvm-scene-batch-ml-1740659479"></a>
### release

```ml
function release(catalog)
```

Calls `mq3.renderer.playable_world_batch.releaseMaterials` with `(catalog)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_world_batch.releaseMaterials`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L263)

<a id="function-function-mq3-renderer-qvm-scene-batch-renderable-function-renderable-resolved-returns-bool-src-mq3-renderer-qvm-scene-batch-ml-2006936455"></a>
### renderable

```ml
function renderable(resolved) returns bool
```

Rejects unresolved projection-shadow triangles while retaining ordinary unresolved geometry.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `resolved` | `dynamic` | — | Material-resolution record with materialIndex and source triangle. |


**Returns:** True for a resolved material or a non-projection-shadow triangle.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L60)

<a id="constant-constant-mq3-renderer-qvm-scene-batch-rf-depthhack-const-rf-depthhack-8-src-mq3-renderer-qvm-scene-batch-ml-429110291"></a>
### RF_DEPTHHACK

```ml
const RF_DEPTHHACK = 8
```

Entity-rendering flag that uses the shortened depth range for first-person weapons.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L12)

<a id="function-function-mq3-renderer-qvm-scene-batch-shadowpolicies-function-shadowpolicies-catalog-src-mq3-renderer-qvm-scene-batch-ml-1650763977"></a>
### shadowPolicies

```ml
function shadowPolicies(catalog)
```

RB_ShadowTessEnd only receives opaque surfaces (SS_OPAQUE) outside fog. Cache that decision once per material-resolved MD3 surface rather than once per generated volume triangle. An unresolved shader is Baseq3's default opaque shader.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Record providing `catalog.triangles`, `catalog.materials`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L78)

<a id="function-function-mq3-renderer-qvm-scene-batch-shadowpolicykey-function-shadowpolicykey-entityindex-surfaceindex-src-mq3-renderer-qvm-scene-batch-ml-1338077182"></a>
### shadowPolicyKey

```ml
function shadowPolicyKey(entityIndex, surfaceIndex)
```

Computes `entityIndex*1048576+surfaceIndex` for `mq3.renderer.qvm_scene_batch.shadowPolicyKey`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entityIndex` | `dynamic` | — | Input used in the result expression `entityIndex*1048576+surfaceIndex`. |
| `surfaceIndex` | `dynamic` | — | Input used in the result expression `entityIndex*1048576+surfaceIndex`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L72)

<a id="function-function-mq3-renderer-qvm-scene-batch-sizegeometry-function-sizegeometry-previous-count-as-int-src-mq3-renderer-qvm-scene-batch-ml-147975257"></a>
### sizeGeometry

```ml
function sizeGeometry(previous, count as int)
```

Builds `triangles[i]` in `mq3.renderer.qvm_scene_batch.sizeGeometry`; returns `renderData.RenderData(triangles,0,count,0,false,0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `previous` | `dynamic` | — | Record providing `previous.triangles`, `previous.triangleCount`. |
| `count` | `int` | — | Argument 1 supplied to `array`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L116)

<a id="function-function-mq3-renderer-qvm-scene-batch-sourcevertexid-function-sourcevertexid-triangle-corner-as-int-fallback-as-int-returns-int-src-mq3-renderer-qvm-scene-batch-ml-747956651"></a>
### sourceVertexId

```ml
function sourceVertexId(triangle, corner as int, fallback as int) returns int
```

Uses a valid nonnegative source vertex ID when available, otherwise preserving the supplied fallback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `triangle` | `dynamic` | — | Source triangle with an optional three-entry vertexIds array. |
| `corner` | `int` | — | Triangle-local corner index. |
| `fallback` | `int` | — | Vertex ID used when source identities are absent or invalid. |


**Returns:** The stored nonnegative vertex ID, or fallback.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L49)

<a id="function-function-mq3-renderer-qvm-scene-batch-updateconvertedvertex-function-updateconvertedvertex-target-triangle-corner-as-int-sourceindex-as-int-src-mq3-renderer-qvm-scene-batch-ml-433793717"></a>
### updateConvertedVertex

```ml
function updateConvertedVertex(target, triangle, corner as int, sourceIndex as int)
```

Updates `target.position`, `target.baseUV`, `target.lightmapUV`, `target.normal`, `target.color` in `mq3.renderer.qvm_scene_batch.updateConvertedVertex`; returns `target`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `target` | `dynamic` | — | Mutable record or buffer; this call updates `target.position`, `target.baseUV`, `target.lightmapUV`, `target.normal`, `target.color`. |
| `triangle` | `dynamic` | — | Record providing `triangle.positions`, `triangle.texCoords`, `triangle.lightmapCoords`, `triangle.normals`, `triangle.colors`, `triangle.entityColor`. |
| `corner` | `int` | — | Input used by `target.position=triangle.positions[corner]`. |
| `sourceIndex` | `int` | — | Value assigned to `target.sourceIndex`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L133)

<a id="function-function-mq3-renderer-qvm-scene-batch-upload-function-upload-catalog-src-mq3-renderer-qvm-scene-batch-ml-2011520225"></a>
### upload

```ml
function upload(catalog)
```

Calls `mq3.renderer.playable_world_batch.uploadMaterials` with `(catalog)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_world_batch.uploadMaterials`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L260)

<a id="function-function-mq3-renderer-qvm-scene-batch-writetriangle-function-writetriangle-geometry-index-as-int-resolved-fallbackbase-as-int-src-mq3-renderer-qvm-scene-batch-ml-1594069203"></a>
### writeTriangle

```ml
function writeTriangle(geometry, index as int, resolved, fallbackBase as int)
```

Updates `geometry.triangles[index]` in `mq3.renderer.qvm_scene_batch.writeTriangle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `geometry` | `dynamic` | — | Mutable record or buffer; this call updates `geometry.triangles[index]`. |
| `index` | `int` | — | Argument 6 supplied to `mq3.renderer.bsp_render_data.RenderTriangle`. |
| `resolved` | `dynamic` | — | Record providing `resolved.triangle`, `resolved.materialIndex`. |
| `fallbackBase` | `int` | — | Input used by `fallback=fallbackBase+index*3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_scene_batch.ml#L142)
