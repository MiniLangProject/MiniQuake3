# `src/mq3/renderer/world_surface_selection.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.world_surface_selection`](Package-mq3-renderer-world-surface-selection-946115446.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/playable_viewer.ml` as `viewer` → [src/mq3/client/playable_viewer.ml](File-src-mq3-client-playable-viewer-ml-2126962810.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/renderer/bsp_render_data.ml` as `render` → [src/mq3/renderer/bsp_render_data.ml](File-src-mq3-renderer-bsp-render-data-ml-926244912.md)
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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L100)

<a id="function-function-mq3-renderer-world-surface-selection-buildcache-function-buildcache-map-patcherror-src-mq3-renderer-world-surface-selection-ml-1873613148"></a>
### buildCache

```ml
function buildCache(map, patchError)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `patchError` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L105)

<a id="function-function-mq3-renderer-world-surface-selection-cachedrenderdata-function-cachedrenderdata-cache-chosen-src-mq3-renderer-world-surface-selection-ml-1032202606"></a>
### cachedRenderData

```ml
function cachedRenderData(cache, chosen)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `chosen` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L218)

<a id="function-function-mq3-renderer-world-surface-selection-cachedvisiblefaces-function-cachedvisiblefaces-cache-map-cameracluster-pvsused-src-mq3-renderer-world-surface-selection-ml-2008993803"></a>
### cachedVisibleFaces

```ml
function cachedVisibleFaces(cache, map, cameraCluster, pvsUsed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `cameraCluster` | `dynamic` | — |  |
| `pvsUsed` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L148)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L206)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L207)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L205)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L156)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L212)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L36)

<a id="function-function-mq3-renderer-world-surface-selection-contains-function-contains-values-wanted-src-mq3-renderer-world-surface-selection-ml-1220122685"></a>
### contains

```ml
function contains(values, wanted)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `wanted` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L69)

<a id="constant-constant-mq3-renderer-world-surface-selection-default-far-distance-const-default-far-distance-8192-src-mq3-renderer-world-surface-selection-ml-2143771439"></a>
### DEFAULT_FAR_DISTANCE

```ml
const DEFAULT_FAR_DISTANCE = 8192.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L17)

<a id="constant-constant-mq3-renderer-world-surface-selection-default-horizontal-fov-const-default-horizontal-fov-100-src-mq3-renderer-world-surface-selection-ml-1546803728"></a>
### DEFAULT_HORIZONTAL_FOV

```ml
const DEFAULT_HORIZONTAL_FOV = 100.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L15)

<a id="constant-constant-mq3-renderer-world-surface-selection-default-near-distance-const-default-near-distance-1-src-mq3-renderer-world-surface-selection-ml-296010730"></a>
### DEFAULT_NEAR_DISTANCE

```ml
const DEFAULT_NEAR_DISTANCE = 1.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L16)

<a id="constant-constant-mq3-renderer-world-surface-selection-default-triangle-budget-const-default-triangle-budget-12000-src-mq3-renderer-world-surface-selection-ml-1201025384"></a>
### DEFAULT_TRIANGLE_BUDGET

```ml
const DEFAULT_TRIANGLE_BUDGET = 12000
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L18)

<a id="function-function-mq3-renderer-world-surface-selection-defaults-function-defaults-width-height-src-mq3-renderer-world-surface-selection-ml-1709826523"></a>
### defaults

```ml
function defaults(width, height)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L44)

<a id="function-function-mq3-renderer-world-surface-selection-f32-function-f32-map-offset-src-mq3-renderer-world-surface-selection-ml-1567785235"></a>
### f32

```ml
function f32(map, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L33)

<a id="constant-constant-mq3-renderer-world-surface-selection-face-stride-const-face-stride-104-src-mq3-renderer-world-surface-selection-ml-935261030"></a>
### FACE_STRIDE

```ml
const FACE_STRIDE = 104
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L14)

<a id="function-function-mq3-renderer-world-surface-selection-facebounds-function-facebounds-map-faceoffset-src-mq3-renderer-world-surface-selection-ml-1591916730"></a>
### faceBounds

```ml
function faceBounds(map, faceOffset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `faceOffset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L82)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L71)

<a id="function-function-mq3-renderer-world-surface-selection-fail-function-fail-text-src-mq3-renderer-world-surface-selection-ml-582632267"></a>
### fail

```ml
function fail(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L26)

<a id="function-function-mq3-renderer-world-surface-selection-i32-function-i32-map-offset-src-mq3-renderer-world-surface-selection-ml-1098214521"></a>
### i32

```ml
function i32(map, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L30)

<a id="constant-constant-mq3-renderer-world-surface-selection-leaf-stride-const-leaf-stride-48-src-mq3-renderer-world-surface-selection-ml-254689493"></a>
### LEAF_STRIDE

```ml
const LEAF_STRIDE = 48
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L13)

<a id="constant-constant-mq3-renderer-world-surface-selection-node-stride-const-node-stride-36-src-mq3-renderer-world-surface-selection-ml-507024484"></a>
### NODE_STRIDE

```ml
const NODE_STRIDE = 36
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L11)

<a id="constant-constant-mq3-renderer-world-surface-selection-plane-stride-const-plane-stride-16-src-mq3-renderer-world-surface-selection-ml-57026688"></a>
### PLANE_STRIDE

```ml
const PLANE_STRIDE = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L12)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L48)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L255)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L230)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L237)

- [mq3.renderer.world_surface_selection.PreparedWorld](Type-mq3-renderer-world-surface-selection-preparedworld-1392584475.md) — struct
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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L242)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L63)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L249)

- [mq3.renderer.world_surface_selection.Selection](Type-mq3-renderer-world-surface-selection-selection-1519185222.md) — struct
- [mq3.renderer.world_surface_selection.SelectionConfig](Type-mq3-renderer-world-surface-selection-selectionconfig-1943524416.md) — struct
<a id="function-function-mq3-renderer-world-surface-selection-settwosidedtextures-function-settwosidedtextures-cache-flags-src-mq3-renderer-world-surface-selection-ml-1998847875"></a>
### setTwoSidedTextures

```ml
function setTwoSidedTextures(cache, flags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L128)

<a id="function-function-mq3-renderer-world-surface-selection-validmap-function-validmap-map-src-mq3-renderer-world-surface-selection-ml-1520801640"></a>
### validMap

```ml
function validMap(map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L27)

<a id="function-function-mq3-renderer-world-surface-selection-visiblefaces-function-visiblefaces-map-cameracluster-pvsused-src-mq3-renderer-world-surface-selection-ml-131592837"></a>
### visibleFaces

```ml
function visibleFaces(map, cameraCluster, pvsUsed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `cameraCluster` | `dynamic` | — |  |
| `pvsUsed` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L133)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L93)

- [mq3.renderer.world_surface_selection.WorldCache](Type-mq3-renderer-world-surface-selection-worldcache-2022446870.md) — struct
