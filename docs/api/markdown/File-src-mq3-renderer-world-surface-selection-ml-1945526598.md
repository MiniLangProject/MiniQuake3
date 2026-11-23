# `src/mq3/renderer/world_surface_selection.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.world_surface_selection`](Package-mq3-renderer-world-surface-selection-946115446.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/playable_viewer.ml` as `viewer` → [src/mq3/client/playable_viewer.ml](File-src-mq3-client-playable-viewer-ml-2126962810.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/renderer/bsp_render_data.ml` as `render` → [src/mq3/renderer/bsp_render_data.ml](File-src-mq3-renderer-bsp-render-data-ml-926244912.md)
- `mq3/renderer/native_world_selection.ml` as `nativeWorld` → [src/mq3/renderer/native_world_selection.ml](File-src-mq3-renderer-native-world-selection-ml-472887706.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)
- `mq3/renderer/shader_parser.ml` as `shaderParser` → [src/mq3/renderer/shader_parser.ml](File-src-mq3-renderer-shader-parser-ml-2114769074.md)
- `mq3/renderer/world_patch_lod.ml` as `patchLod` → [src/mq3/renderer/world_patch_lod.ml](File-src-mq3-renderer-world-patch-lod-ml-389439102.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `std/ds/list.ml` as `lists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency
- `std/sort.ml` as `sorting` → `../MiniLangCompilerML/std/sort.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-world-surface-selection-before-function-before-a-b-src-mq3-renderer-world-surface-selection-ml-1111532007"></a>
### before

```ml
function before(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L150)

<a id="function-function-mq3-renderer-world-surface-selection-buildcache-function-buildcache-map-patcherror-src-mq3-renderer-world-surface-selection-ml-1873613148"></a>
### buildCache

```ml
function buildCache(map, patchError)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `patchError` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L174)

<a id="function-function-mq3-renderer-world-surface-selection-buildcacheforpatches-function-buildcacheforpatches-map-patcherror-withvariants-src-mq3-renderer-world-surface-selection-ml-1001698622"></a>
### buildCacheForPatches

```ml
function buildCacheForPatches(map, patchError, withVariants)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `patchError` | `dynamic` | — |  |
| `withVariants` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L175)

<a id="function-function-mq3-renderer-world-surface-selection-cachedrenderdata-function-cachedrenderdata-cache-chosen-src-mq3-renderer-world-surface-selection-ml-1032202606"></a>
### cachedRenderData

```ml
function cachedRenderData(cache, chosen)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `chosen` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L419)

<a id="function-function-mq3-renderer-world-surface-selection-cachedvisiblefaces-function-cachedvisiblefaces-cache-map-cameracluster-pvsused-areamask-src-mq3-renderer-world-surface-selection-ml-1106354136"></a>
### cachedVisibleFaces

```ml
function cachedVisibleFaces(cache, map, cameraCluster, pvsUsed, areaMask)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `cameraCluster` | `dynamic` | — |  |
| `pvsUsed` | `dynamic` | — |  |
| `areaMask` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L306)

- [mq3.renderer.world_surface_selection.Candidate](Type-mq3-renderer-world-surface-selection-candidate-23504485.md) — struct
<a id="function-function-mq3-renderer-world-surface-selection-choose-function-choose-map-camera-cfg-src-mq3-renderer-world-surface-selection-ml-477805165"></a>
### choose

```ml
function choose(map, camera, cfg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `camera` | `dynamic` | — |  |
| `cfg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L390)

<a id="function-function-mq3-renderer-world-surface-selection-choosecached-function-choosecached-cache-camera-cfg-src-mq3-renderer-world-surface-selection-ml-357183457"></a>
### chooseCached

```ml
function chooseCached(cache, camera, cfg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `camera` | `dynamic` | — |  |
| `cfg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L391)

<a id="function-function-mq3-renderer-world-surface-selection-choosecore-function-choosecore-map-camera-cfg-cache-src-mq3-renderer-world-surface-selection-ml-1054402237"></a>
### chooseCore

```ml
function chooseCore(map, camera, cfg, cache)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `camera` | `dynamic` | — |  |
| `cfg` | `dynamic` | — |  |
| `cache` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L389)

<a id="function-function-mq3-renderer-world-surface-selection-choosecorepvs-function-choosecorepvs-map-camera-pvsorigin-cfg-cache-src-mq3-renderer-world-surface-selection-ml-1093313030"></a>
### chooseCorePvs

```ml
function chooseCorePvs(map, camera, pvsOrigin, cfg, cache)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `camera` | `dynamic` | — |  |
| `pvsOrigin` | `dynamic` | — |  |
| `cfg` | `dynamic` | — |  |
| `cache` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L318)

<a id="function-function-mq3-renderer-world-surface-selection-choosepatchlod-function-choosepatchlod-cache-chosen-camera-cfg-src-mq3-renderer-world-surface-selection-ml-1955512591"></a>
### choosePatchLod

```ml
function choosePatchLod(cache, chosen, camera, cfg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `chosen` | `dynamic` | — |  |
| `camera` | `dynamic` | — |  |
| `cfg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L402)

<a id="function-function-mq3-renderer-world-surface-selection-chooseportalcached-function-chooseportalcached-cache-camera-pvsorigin-cfg-src-mq3-renderer-world-surface-selection-ml-1156234062"></a>
### choosePortalCached

```ml
function choosePortalCached(cache, camera, pvsOrigin, cfg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `camera` | `dynamic` | — |  |
| `pvsOrigin` | `dynamic` | — |  |
| `cfg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L396)

<a id="function-function-mq3-renderer-world-surface-selection-config-function-config-width-height-horizontalfov-neardistance-fardistance-trianglebudget-backfacecull-patcherror-src-mq3-renderer-world-surface-selection-ml-628827150"></a>
### config

```ml
function config(width, height, horizontalFov, nearDistance, farDistance, triangleBudget, backfaceCull, patchError)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `horizontalFov` | `dynamic` | — |  |
| `nearDistance` | `dynamic` | — |  |
| `farDistance` | `dynamic` | — |  |
| `triangleBudget` | `dynamic` | — |  |
| `backfaceCull` | `dynamic` | — |  |
| `patchError` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L57)

<a id="function-function-mq3-renderer-world-surface-selection-contains-function-contains-values-wanted-src-mq3-renderer-world-surface-selection-ml-1220122685"></a>
### contains

```ml
function contains(values, wanted)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `wanted` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L101)

<a id="constant-constant-mq3-renderer-world-surface-selection-cull-back-const-cull-back-2-src-mq3-renderer-world-surface-selection-ml-214991123"></a>
### CULL_BACK

```ml
const CULL_BACK = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L27)

<a id="constant-constant-mq3-renderer-world-surface-selection-cull-front-const-cull-front-0-src-mq3-renderer-world-surface-selection-ml-1143790259"></a>
### CULL_FRONT

```ml
const CULL_FRONT = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L25)

<a id="constant-constant-mq3-renderer-world-surface-selection-cull-two-sided-const-cull-two-sided-1-src-mq3-renderer-world-surface-selection-ml-128119490"></a>
### CULL_TWO_SIDED

```ml
const CULL_TWO_SIDED = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L26)

<a id="constant-constant-mq3-renderer-world-surface-selection-default-far-distance-const-default-far-distance-8192-src-mq3-renderer-world-surface-selection-ml-2143771439"></a>
### DEFAULT_FAR_DISTANCE

```ml
const DEFAULT_FAR_DISTANCE = 8192.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L23)

<a id="constant-constant-mq3-renderer-world-surface-selection-default-horizontal-fov-const-default-horizontal-fov-100-src-mq3-renderer-world-surface-selection-ml-1546803728"></a>
### DEFAULT_HORIZONTAL_FOV

```ml
const DEFAULT_HORIZONTAL_FOV = 100.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L21)

<a id="constant-constant-mq3-renderer-world-surface-selection-default-near-distance-const-default-near-distance-1-src-mq3-renderer-world-surface-selection-ml-296010730"></a>
### DEFAULT_NEAR_DISTANCE

```ml
const DEFAULT_NEAR_DISTANCE = 1.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L22)

<a id="constant-constant-mq3-renderer-world-surface-selection-default-triangle-budget-const-default-triangle-budget-12000-src-mq3-renderer-world-surface-selection-ml-1201025384"></a>
### DEFAULT_TRIANGLE_BUDGET

```ml
const DEFAULT_TRIANGLE_BUDGET = 12000
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L24)

<a id="function-function-mq3-renderer-world-surface-selection-defaults-function-defaults-width-height-src-mq3-renderer-world-surface-selection-ml-1709826523"></a>
### defaults

```ml
function defaults(width, height)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L65)

<a id="function-function-mq3-renderer-world-surface-selection-equalareamask-function-equalareamask-left-right-src-mq3-renderer-world-surface-selection-ml-990148731"></a>
### equalAreaMask

```ml
function equalAreaMask(left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L278)

<a id="function-function-mq3-renderer-world-surface-selection-f32-function-f32-map-offset-src-mq3-renderer-world-surface-selection-ml-1567785235"></a>
### f32

```ml
function f32(map, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L54)

<a id="constant-constant-mq3-renderer-world-surface-selection-face-plane-epsilon-const-face-plane-epsilon-8-src-mq3-renderer-world-surface-selection-ml-674819911"></a>
### FACE_PLANE_EPSILON

```ml
const FACE_PLANE_EPSILON = 8.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L28)

<a id="constant-constant-mq3-renderer-world-surface-selection-face-stride-const-face-stride-104-src-mq3-renderer-world-surface-selection-ml-935261030"></a>
### FACE_STRIDE

```ml
const FACE_STRIDE = 104
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L20)

<a id="function-function-mq3-renderer-world-surface-selection-facebounds-function-facebounds-map-faceoffset-src-mq3-renderer-world-surface-selection-ml-1591916730"></a>
### faceBounds

```ml
function faceBounds(map, faceOffset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `faceOffset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L114)

<a id="function-function-mq3-renderer-world-surface-selection-facetrianglecount-function-facetrianglecount-map-faceoffset-patcherror-src-mq3-renderer-world-surface-selection-ml-815665558"></a>
### faceTriangleCount

```ml
function faceTriangleCount(map, faceOffset, patchError)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `faceOffset` | `dynamic` | — |  |
| `patchError` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L103)

<a id="function-function-mq3-renderer-world-surface-selection-fail-function-fail-text-src-mq3-renderer-world-surface-selection-ml-582632267"></a>
### fail

```ml
function fail(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L37)

<a id="function-function-mq3-renderer-world-surface-selection-forview-function-forview-cfg-refdef-src-mq3-renderer-world-surface-selection-ml-1130389828"></a>
### forView

```ml
function forView(cfg, refdef)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cfg` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L70)

- [mq3.renderer.world_surface_selection.Frustum](Type-mq3-renderer-world-surface-selection-frustum-417074958.md) — struct
<a id="function-function-mq3-renderer-world-surface-selection-i32-function-i32-map-offset-src-mq3-renderer-world-surface-selection-ml-1098214521"></a>
### i32

```ml
function i32(map, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L51)

<a id="constant-constant-mq3-renderer-world-surface-selection-leaf-stride-const-leaf-stride-48-src-mq3-renderer-world-surface-selection-ml-254689493"></a>
### LEAF_STRIDE

```ml
const LEAF_STRIDE = 48
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L19)

<a id="constant-constant-mq3-renderer-world-surface-selection-node-stride-const-node-stride-36-src-mq3-renderer-world-surface-selection-ml-507024484"></a>
### NODE_STRIDE

```ml
const NODE_STRIDE = 36
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L17)

<a id="constant-constant-mq3-renderer-world-surface-selection-plane-stride-const-plane-stride-16-src-mq3-renderer-world-surface-selection-ml-57026688"></a>
### PLANE_STRIDE

```ml
const PLANE_STRIDE = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L18)

<a id="function-function-mq3-renderer-world-surface-selection-pointleaf-function-pointleaf-map-point-src-mq3-renderer-world-surface-selection-ml-2132743310"></a>
### pointLeaf

```ml
function pointLeaf(map, point)
```

This is CM_PointLeafnum's BSP walk, kept here so selection needs no loaded collision world. Negative children encode leaves as -1-leafIndex.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L76)

<a id="function-function-mq3-renderer-world-surface-selection-prepare-function-prepare-map-camera-cfg-src-mq3-renderer-world-surface-selection-ml-1706441687"></a>
### prepare

```ml
function prepare(map, camera, cfg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `camera` | `dynamic` | — |  |
| `cfg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L463)

<a id="function-function-mq3-renderer-world-surface-selection-preparecached-function-preparecached-cache-camera-cfg-src-mq3-renderer-world-surface-selection-ml-1820073903"></a>
### prepareCached

```ml
function prepareCached(cache, camera, cfg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `camera` | `dynamic` | — |  |
| `cfg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L431)

<a id="function-function-mq3-renderer-world-surface-selection-preparecachedretained-function-preparecachedretained-cache-camera-cfg-previous-src-mq3-renderer-world-surface-selection-ml-40087724"></a>
### prepareCachedRetained

```ml
function prepareCachedRetained(cache, camera, cfg, previous)
```

Keep the already-flattened triangle stream when camera motion does not alter the visible face order. PVS/frustum metadata is still refreshed, while the hot frame path avoids rebuilding an identical immutable array.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `camera` | `dynamic` | — |  |
| `cfg` | `dynamic` | — |  |
| `previous` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L439)

- [mq3.renderer.world_surface_selection.PreparedWorld](Type-mq3-renderer-world-surface-selection-preparedworld-1392584475.md) — struct
<a id="function-function-mq3-renderer-world-surface-selection-preparefrustum-function-preparefrustum-cfg-src-mq3-renderer-world-surface-selection-ml-708756000"></a>
### prepareFrustum

```ml
function prepareFrustum(cfg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cfg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L125)

<a id="function-function-mq3-renderer-world-surface-selection-preparepatches-function-preparepatches-patches-byface-counts-nativefaces-centers-radii-normals-src-mq3-renderer-world-surface-selection-ml-394386848"></a>
### preparePatches

```ml
function preparePatches(patches, byFace, counts, nativeFaces, centers, radii, normals)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patches` | `dynamic` | — |  |
| `byFace` | `dynamic` | — |  |
| `counts` | `dynamic` | — |  |
| `nativeFaces` | `dynamic` | — |  |
| `centers` | `dynamic` | — |  |
| `radii` | `dynamic` | — |  |
| `normals` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L155)

<a id="function-function-mq3-renderer-world-surface-selection-prepareportalcached-function-prepareportalcached-cache-camera-pvsorigin-cfg-src-mq3-renderer-world-surface-selection-ml-1316254124"></a>
### preparePortalCached

```ml
function preparePortalCached(cache, camera, pvsOrigin, cfg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `camera` | `dynamic` | — |  |
| `pvsOrigin` | `dynamic` | — |  |
| `cfg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L449)

<a id="function-function-mq3-renderer-world-surface-selection-pvscontains-function-pvscontains-map-cluster-other-src-mq3-renderer-world-surface-selection-ml-1341792464"></a>
### pvsContains

```ml
function pvsContains(map, cluster, other)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `cluster` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L91)

<a id="function-function-mq3-renderer-world-surface-selection-samefaces-function-samefaces-left-right-src-mq3-renderer-world-surface-selection-ml-1305766669"></a>
### sameFaces

```ml
function sameFaces(left, right)
```

Camera checks run regularly, but rebuilding retained material commands is only necessary when the selected BSP face set actually changes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L456)

- [mq3.renderer.world_surface_selection.Selection](Type-mq3-renderer-world-surface-selection-selection-1519185222.md) — struct
- [mq3.renderer.world_surface_selection.SelectionConfig](Type-mq3-renderer-world-surface-selection-selectionconfig-1943524416.md) — struct
<a id="function-function-mq3-renderer-world-surface-selection-selectportalcached-function-selectportalcached-cache-camera-pvsorigin-cfg-src-mq3-renderer-world-surface-selection-ml-1563872038"></a>
### selectPortalCached

```ml
function selectPortalCached(cache, camera, pvsOrigin, cfg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `camera` | `dynamic` | — |  |
| `pvsOrigin` | `dynamic` | — |  |
| `cfg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L445)

<a id="function-function-mq3-renderer-world-surface-selection-setcullmodes-function-setcullmodes-cache-modes-src-mq3-renderer-world-surface-selection-ml-945539620"></a>
### setCullModes

```ml
function setCullModes(cache, modes)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `modes` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L247)

<a id="function-function-mq3-renderer-world-surface-selection-setindexedculling-function-setindexedculling-cache-index-src-mq3-renderer-world-surface-selection-ml-887389670"></a>
### setIndexedCulling

```ml
function setIndexedCulling(cache, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L267)

<a id="function-function-mq3-renderer-world-surface-selection-settwosidedtextures-function-settwosidedtextures-cache-flags-src-mq3-renderer-world-surface-selection-ml-1998847875"></a>
### setTwoSidedTextures

```ml
function setTwoSidedTextures(cache, flags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L260)

<a id="function-function-mq3-renderer-world-surface-selection-setview-function-setview-cfg-refdef-src-mq3-renderer-world-surface-selection-ml-1259409694"></a>
### setView

```ml
function setView(cfg, refdef)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cfg` | `dynamic` | — |  |
| `refdef` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L66)

<a id="function-function-mq3-renderer-world-surface-selection-validmap-function-validmap-map-src-mq3-renderer-world-surface-selection-ml-1520801640"></a>
### validMap

```ml
function validMap(map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L38)

<a id="function-function-mq3-renderer-world-surface-selection-viewpointaxes-function-viewpointaxes-camera-point-axes-src-mq3-renderer-world-surface-selection-ml-1738806488"></a>
### viewPointAxes

```ml
function viewPointAxes(camera, point, axes)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `axes` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L146)

<a id="function-function-mq3-renderer-world-surface-selection-visiblefaces-function-visiblefaces-map-cameracluster-pvsused-areamask-src-mq3-renderer-world-surface-selection-ml-315361598"></a>
### visibleFaces

```ml
function visibleFaces(map, cameraCluster, pvsUsed, areaMask)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `cameraCluster` | `dynamic` | — |  |
| `pvsUsed` | `dynamic` | — |  |
| `areaMask` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L286)

<a id="function-function-mq3-renderer-world-surface-selection-visibleinfrustum-function-visibleinfrustum-local-radius-cfg-src-mq3-renderer-world-surface-selection-ml-809168897"></a>
### visibleInFrustum

```ml
function visibleInFrustum(local, radius, cfg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `local` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `cfg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L142)

<a id="function-function-mq3-renderer-world-surface-selection-visibleinpreparedfrustum-function-visibleinpreparedfrustum-local-radius-cfg-frustum-src-mq3-renderer-world-surface-selection-ml-1493210501"></a>
### visibleInPreparedFrustum

```ml
function visibleInPreparedFrustum(local, radius, cfg, frustum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `local` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `cfg` | `dynamic` | — |  |
| `frustum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L134)

- [mq3.renderer.world_surface_selection.WorldCache](Type-mq3-renderer-world-surface-selection-worldcache-2022446870.md) — struct
<a id="function-function-mq3-renderer-world-surface-selection-worldsurfacerange-function-worldsurfacerange-map-src-mq3-renderer-world-surface-selection-ml-280131744"></a>
### worldSurfaceRange

```ml
function worldSurfaceRange(map)
```

tr_bsp.c loads model 0 as the static world. Retail q3dm0 also lists the *12/*13 door faces in leaf marksurfaces; those faces belong to brush models and must be submitted at the mover's current origin, never as static world.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L45)
