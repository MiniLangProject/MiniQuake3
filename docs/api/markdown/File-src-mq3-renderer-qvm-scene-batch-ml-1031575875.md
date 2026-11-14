# `src/mq3/renderer/qvm_scene_batch.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.qvm_scene_batch`](Package-mq3-renderer-qvm-scene-batch-2049020833.md)

Reachable from entry: **yes**

## Imports

- `mq3/platform/playable_multitexture.ml` as `multitexture` → [src/mq3/platform/playable_multitexture.ml](File-src-mq3-platform-playable-multitexture-ml-346016672.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/renderer/bsp_render_data.ml` as `renderData` → [src/mq3/renderer/bsp_render_data.ml](File-src-mq3-renderer-bsp-render-data-ml-926244912.md)
- `mq3/renderer/playable_world_batch.ml` as `worldBatch` → [src/mq3/renderer/playable_world_batch.ml](File-src-mq3-renderer-playable-world-batch-ml-1411140007.md)
- `std/ds/list.ml` as `lists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-qvm-scene-batch-attachdynamiclights-function-attachdynamiclights-prepared-catalog-lightcatalog-src-mq3-renderer-qvm-scene-batch-ml-501852047"></a>
### attachDynamicLights

```ml
function attachDynamicLights(prepared, catalog, lightCatalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `prepared` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |
| `lightCatalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L141)

<a id="function-function-mq3-renderer-qvm-scene-batch-attachfog-function-attachfog-prepared-catalog-src-mq3-renderer-qvm-scene-batch-ml-796632042"></a>
### attachFog

```ml
function attachFog(prepared, catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `prepared` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L134)

<a id="function-function-mq3-renderer-qvm-scene-batch-build-function-build-catalog-src-mq3-renderer-qvm-scene-batch-ml-1897744505"></a>
### build

```ml
function build(catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L118)

<a id="function-function-mq3-renderer-qvm-scene-batch-buildshadowbatch-function-buildshadowbatch-catalog-scenegeometry-existing-src-mq3-renderer-qvm-scene-batch-ml-262391222"></a>
### buildShadowBatch

```ml
function buildShadowBatch(catalog, sceneGeometry, existing)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `sceneGeometry` | `dynamic` | — |  |
| `existing` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L48)

<a id="function-function-mq3-renderer-qvm-scene-batch-buildwithgeometry-function-buildwithgeometry-catalog-scenegeometry-src-mq3-renderer-qvm-scene-batch-ml-2077358701"></a>
### buildWithGeometry

```ml
function buildWithGeometry(catalog, sceneGeometry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `sceneGeometry` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L109)

<a id="function-function-mq3-renderer-qvm-scene-batch-convert-function-convert-catalog-src-mq3-renderer-qvm-scene-batch-ml-761945963"></a>
### convert

```ml
function convert(catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L71)

<a id="function-function-mq3-renderer-qvm-scene-batch-convertdynamic-function-convertdynamic-catalog-src-mq3-renderer-qvm-scene-batch-ml-258688425"></a>
### convertDynamic

```ml
function convertDynamic(catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L72)

<a id="function-function-mq3-renderer-qvm-scene-batch-convertedvertex-function-convertedvertex-triangle-corner-sourceindex-src-mq3-renderer-qvm-scene-batch-ml-878015248"></a>
### convertedVertex

```ml
function convertedVertex(triangle, corner, sourceIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `triangle` | `dynamic` | — |  |
| `corner` | `dynamic` | — |  |
| `sourceIndex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L18)

<a id="function-function-mq3-renderer-qvm-scene-batch-convertmode-function-convertmode-catalog-wantdepthhack-src-mq3-renderer-qvm-scene-batch-ml-1262090463"></a>
### convertMode

```ml
function convertMode(catalog, wantDepthHack)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `wantDepthHack` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L60)

<a id="function-function-mq3-renderer-qvm-scene-batch-depthhack-function-depthhack-triangle-src-mq3-renderer-qvm-scene-batch-ml-545584714"></a>
### depthHack

```ml
function depthHack(triangle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `triangle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L21)

<a id="function-function-mq3-renderer-qvm-scene-batch-draw-function-draw-prepared-projection-nowmilliseconds-src-mq3-renderer-qvm-scene-batch-ml-862212894"></a>
### draw

```ml
function draw(prepared, projection, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `prepared` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L150)

<a id="function-function-mq3-renderer-qvm-scene-batch-drawlit-function-drawlit-prepared-projection-nowmilliseconds-lights-src-mq3-renderer-qvm-scene-batch-ml-253185767"></a>
### drawLit

```ml
function drawLit(prepared, projection, nowMilliseconds, lights)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `prepared` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `lights` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L166)

<a id="function-function-mq3-renderer-qvm-scene-batch-drawlitviewport-function-drawlitviewport-prepared-projection-area-nowmilliseconds-lights-src-mq3-renderer-qvm-scene-batch-ml-1712990510"></a>
### drawLitViewport

```ml
function drawLitViewport(prepared, projection, area, nowMilliseconds, lights)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `prepared` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `lights` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L174)

<a id="function-function-mq3-renderer-qvm-scene-batch-drawlitviewportshadows-function-drawlitviewportshadows-prepared-projection-area-nowmilliseconds-lights-mirror-src-mq3-renderer-qvm-scene-batch-ml-476187121"></a>
### drawLitViewportShadows

```ml
function drawLitViewportShadows(prepared, projection, area, nowMilliseconds, lights, mirror)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `prepared` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `lights` | `dynamic` | — |  |
| `mirror` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L201)

<a id="function-function-mq3-renderer-qvm-scene-batch-drawstencilshadows-function-drawstencilshadows-prepared-projection-area-mirror-src-mq3-renderer-qvm-scene-batch-ml-1125882752"></a>
### drawStencilShadows

```ml
function drawStencilShadows(prepared, projection, area, mirror)
```

RB_ShadowTessEnd increments front-facing volume sides and decrements back sides; mirrored portal views reverse those cull passes. RB_ShadowFinish then overlays 60% black wherever the resulting stencil value is non-zero.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `prepared` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |
| `mirror` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L185)

<a id="function-function-mq3-renderer-qvm-scene-batch-drawviewport-function-drawviewport-prepared-projection-area-nowmilliseconds-src-mq3-renderer-qvm-scene-batch-ml-752104675"></a>
### drawViewport

```ml
function drawViewport(prepared, projection, area, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `prepared` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L158)

<a id="function-function-mq3-renderer-qvm-scene-batch-dynamiccount-function-dynamiccount-catalog-src-mq3-renderer-qvm-scene-batch-ml-1527740537"></a>
### dynamicCount

```ml
function dynamicCount(catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L29)

<a id="function-function-mq3-renderer-qvm-scene-batch-dynamicselected-function-dynamicselected-catalog-resolved-src-mq3-renderer-qvm-scene-batch-ml-1000596181"></a>
### dynamicSelected

```ml
function dynamicSelected(catalog, resolved)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `resolved` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L26)

<a id="function-function-mq3-renderer-qvm-scene-batch-fail-function-fail-message-src-mq3-renderer-qvm-scene-batch-ml-313133781"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L17)

<a id="function-function-mq3-renderer-qvm-scene-batch-policyopaque-function-policyopaque-policies-entityindex-surfaceindex-src-mq3-renderer-qvm-scene-batch-ml-1360262994"></a>
### policyOpaque

```ml
function policyOpaque(policies, entityIndex, surfaceIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `policies` | `dynamic` | — |  |
| `entityIndex` | `dynamic` | — |  |
| `surfaceIndex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L45)

- [mq3.renderer.qvm_scene_batch.Prepared](Type-mq3-renderer-qvm-scene-batch-prepared-1944088064.md) — struct
<a id="constant-constant-mq3-renderer-qvm-scene-batch-projection-shadow-shader-const-projection-shadow-shader-mq3-projectionshadow-src-mq3-renderer-qvm-scene-batch-ml-1453794458"></a>
### PROJECTION_SHADOW_SHADER

```ml
const PROJECTION_SHADOW_SHADER = "$mq3/projectionShadow"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L12)

<a id="function-function-mq3-renderer-qvm-scene-batch-refresh-function-refresh-prepared-catalog-src-mq3-renderer-qvm-scene-batch-ml-669271742"></a>
### refresh

```ml
function refresh(prepared, catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `prepared` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L133)

<a id="function-function-mq3-renderer-qvm-scene-batch-refreshdynamicgeometry-function-refreshdynamicgeometry-geometry-catalog-src-mq3-renderer-qvm-scene-batch-ml-583193065"></a>
### refreshDynamicGeometry

```ml
function refreshDynamicGeometry(geometry, catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `geometry` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L98)

<a id="function-function-mq3-renderer-qvm-scene-batch-refreshgeometry-function-refreshgeometry-geometry-catalog-src-mq3-renderer-qvm-scene-batch-ml-954418151"></a>
### refreshGeometry

```ml
function refreshGeometry(geometry, catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `geometry` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L97)

<a id="function-function-mq3-renderer-qvm-scene-batch-refreshgeometrymode-function-refreshgeometrymode-geometry-catalog-wantdepthhack-src-mq3-renderer-qvm-scene-batch-ml-771695711"></a>
### refreshGeometryMode

```ml
function refreshGeometryMode(geometry, catalog, wantDepthHack)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `geometry` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |
| `wantDepthHack` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L84)

<a id="function-function-mq3-renderer-qvm-scene-batch-refreshwithgeometry-function-refreshwithgeometry-prepared-catalog-scenegeometry-src-mq3-renderer-qvm-scene-batch-ml-713365208"></a>
### refreshWithGeometry

```ml
function refreshWithGeometry(prepared, catalog, sceneGeometry)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `prepared` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |
| `sceneGeometry` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L119)

<a id="function-function-mq3-renderer-qvm-scene-batch-release-function-release-catalog-src-mq3-renderer-qvm-scene-batch-ml-1740659479"></a>
### release

```ml
function release(catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L149)

<a id="function-function-mq3-renderer-qvm-scene-batch-renderable-function-renderable-resolved-src-mq3-renderer-qvm-scene-batch-ml-2054613822"></a>
### renderable

```ml
function renderable(resolved)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `resolved` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L22)

<a id="constant-constant-mq3-renderer-qvm-scene-batch-rf-depthhack-const-rf-depthhack-8-src-mq3-renderer-qvm-scene-batch-ml-429110291"></a>
### RF_DEPTHHACK

```ml
const RF_DEPTHHACK = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L11)

<a id="function-function-mq3-renderer-qvm-scene-batch-selectedcount-function-selectedcount-catalog-wantdepthhack-src-mq3-renderer-qvm-scene-batch-ml-2123478215"></a>
### selectedCount

```ml
function selectedCount(catalog, wantDepthHack)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `wantDepthHack` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L23)

<a id="function-function-mq3-renderer-qvm-scene-batch-shadowpolicies-function-shadowpolicies-catalog-src-mq3-renderer-qvm-scene-batch-ml-1650763977"></a>
### shadowPolicies

```ml
function shadowPolicies(catalog)
```

RB_ShadowTessEnd only receives opaque surfaces (SS_OPAQUE) outside fog. Cache that decision once per material-resolved MD3 surface rather than once per generated volume triangle. An unresolved shader is Baseq3's default opaque shader.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L34)

- [mq3.renderer.qvm_scene_batch.ShadowPolicy](Type-mq3-renderer-qvm-scene-batch-shadowpolicy-800601043.md) — struct
<a id="function-function-mq3-renderer-qvm-scene-batch-updateconvertedvertex-function-updateconvertedvertex-target-triangle-corner-sourceindex-src-mq3-renderer-qvm-scene-batch-ml-456761759"></a>
### updateConvertedVertex

```ml
function updateConvertedVertex(target, triangle, corner, sourceIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `target` | `dynamic` | — |  |
| `triangle` | `dynamic` | — |  |
| `corner` | `dynamic` | — |  |
| `sourceIndex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L81)

<a id="function-function-mq3-renderer-qvm-scene-batch-upload-function-upload-catalog-src-mq3-renderer-qvm-scene-batch-ml-2011520225"></a>
### upload

```ml
function upload(catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_scene_batch.ml#L148)
