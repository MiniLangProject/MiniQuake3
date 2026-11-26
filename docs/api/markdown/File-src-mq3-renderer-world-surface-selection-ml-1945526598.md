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
- `std/ds/list.ml` as `lists` → `../../a7594a0c0299/MiniLangCompilerML/std/ds/list.ml` — external dependency
- `std/sort.ml` as `sorting` → `../../a7594a0c0299/MiniLangCompilerML/std/sort.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-world-surface-selection-before-function-before-a-b-src-mq3-renderer-world-surface-selection-ml-1111532007"></a>
### before

```ml
function before(a, b)
```

Returns `a.faceIndex<b.faceIndex` from `mq3.renderer.world_surface_selection.before`; earlier branches return `true`, `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Record providing `a.importance`, `a.faceIndex`. |
| `b` | `dynamic` | — | Record providing `b.importance`, `b.faceIndex`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L347)

<a id="function-function-mq3-renderer-world-surface-selection-buildcache-function-buildcache-map-patcherror-src-mq3-renderer-world-surface-selection-ml-1873613148"></a>
### buildCache

```ml
function buildCache(map, patchError)
```

Calls `mq3.renderer.world_surface_selection.buildCacheForPatches` with `(map,patchError,false)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Value forwarded as `map` to `mq3.renderer.world_surface_selection.buildCacheForPatches`. |
| `patchError` | `dynamic` | — | Value forwarded as `patchError` to `mq3.renderer.world_surface_selection.buildCacheForPatches`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L382)

<a id="function-function-mq3-renderer-world-surface-selection-buildcacheforpatches-function-buildcacheforpatches-map-patcherror-withvariants-src-mq3-renderer-world-surface-selection-ml-1001698622"></a>
### buildCacheForPatches

```ml
function buildCacheForPatches(map, patchError, withVariants)
```

Builds `mq3.renderer.world_surface_selection.WorldCache` after updating `byFace[faceIndex]`, `textureIndexes[faceIndex]`, `kinds[faceIndex]`, `centers[faceIndex]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Initial value for `mq3.renderer.world_surface_selection.WorldCache.map`. |
| `patchError` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.world_patch_lod.read`. |
| `withVariants` | `dynamic` | — | Input tested by `withVariants`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L387)

<a id="function-function-mq3-renderer-world-surface-selection-cachedrenderdata-function-cachedrenderdata-cache-chosen-src-mq3-renderer-world-surface-selection-ml-1032202606"></a>
### cachedRenderData

```ml
function cachedRenderData(cache, chosen)
```

Builds `triangles[offset]` in `mq3.renderer.world_surface_selection.cachedRenderData`; returns `render.RenderData(triangles,chosen.selectedSurfaceCount,len(triangles),0,false,patches)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Record providing `cache.trianglesByFace`, `cache.faceKinds`. |
| `chosen` | `dynamic` | — | Record providing `chosen.faceIndexes`, `chosen.selectedSurfaceCount`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L686)

<a id="function-function-mq3-renderer-world-surface-selection-cachedvisiblefaces-function-cachedvisiblefaces-cache-map-cameracluster-pvsused-areamask-src-mq3-renderer-world-surface-selection-ml-1106354136"></a>
### cachedVisibleFaces

```ml
function cachedVisibleFaces(cache, map, cameraCluster, pvsUsed, areaMask)
```

Updates `cache.areaMask`, `cache.pvsFaces`, `cache.nativeVisible`, `cache.pvsFaces[slot]`, `cache.pvsRejected[slot]` in `mq3.renderer.world_surface_selection.cachedVisibleFaces`; returns `[cache.pvsFaces[slot],cache.pvsRejected[slot]]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Mutable record or buffer; this call updates `cache.areaMask`, `cache.pvsFaces`, `cache.nativeVisible`, `cache.pvsFaces[slot]`, `cache.pvsRejected[slot]`. |
| `map` | `dynamic` | — | Value forwarded as `map` to `mq3.renderer.world_surface_selection.visibleFaces`. |
| `cameraCluster` | `dynamic` | — | Value forwarded as `cameraCluster` to `mq3.renderer.world_surface_selection.visibleFaces`. |
| `pvsUsed` | `dynamic` | — | Value forwarded as `pvsUsed` to `mq3.renderer.world_surface_selection.visibleFaces`. |
| `areaMask` | `dynamic` | — | Value assigned to `cache.areaMask`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L541)

- [mq3.renderer.world_surface_selection.Candidate](Type-mq3-renderer-world-surface-selection-candidate-23504485.md) — struct
<a id="function-function-mq3-renderer-world-surface-selection-choose-function-choose-map-camera-cfg-src-mq3-renderer-world-surface-selection-ml-477805165"></a>
### choose

```ml
function choose(map, camera, cfg)
```

Calls `mq3.renderer.world_surface_selection.chooseCore` with `(map,camera,cfg,void)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Value forwarded as `map` to `mq3.renderer.world_surface_selection.chooseCore`. |
| `camera` | `dynamic` | — | Value forwarded as `camera` to `mq3.renderer.world_surface_selection.chooseCore`. |
| `cfg` | `dynamic` | — | Value forwarded as `cfg` to `mq3.renderer.world_surface_selection.chooseCore`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L640)

<a id="function-function-mq3-renderer-world-surface-selection-choosecached-function-choosecached-cache-camera-cfg-src-mq3-renderer-world-surface-selection-ml-357183457"></a>
### chooseCached

```ml
function chooseCached(cache, camera, cfg)
```

Computes `chooseCached` from `chooseCore(cache.map,camera,cfg,cache)` using `mq3.renderer.world_surface_selection.chooseCore`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Record providing `cache.map`, `cache.patchError`. |
| `camera` | `dynamic` | — | Value forwarded as `camera` to `mq3.renderer.world_surface_selection.chooseCore`. |
| `cfg` | `dynamic` | — | Record providing `cfg.patchError`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L645)

<a id="function-function-mq3-renderer-world-surface-selection-choosecore-function-choosecore-map-camera-cfg-cache-src-mq3-renderer-world-surface-selection-ml-1054402237"></a>
### chooseCore

```ml
function chooseCore(map, camera, cfg, cache)
```

Calls `mq3.renderer.world_surface_selection.chooseCorePvs` with `(map,camera,camera.position,cfg,cache)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Value forwarded as `map` to `mq3.renderer.world_surface_selection.chooseCorePvs`. |
| `camera` | `dynamic` | — | Record providing `camera.position`. |
| `cfg` | `dynamic` | — | Value forwarded as `cfg` to `mq3.renderer.world_surface_selection.chooseCorePvs`. |
| `cache` | `dynamic` | — | Value forwarded as `cache` to `mq3.renderer.world_surface_selection.chooseCorePvs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L635)

<a id="function-function-mq3-renderer-world-surface-selection-choosecorepvs-function-choosecorepvs-map-camera-pvsorigin-cfg-cache-src-mq3-renderer-world-surface-selection-ml-1093313030"></a>
### chooseCorePvs

```ml
function chooseCorePvs(map, camera, pvsOrigin, cfg, cache)
```

Builds `mq3.renderer.world_surface_selection.Selection` after updating `cache.nativeVisible[slot]`, `selected[index]`, `cache.nativeSelected`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.offsets`, `map.lengths`. |
| `camera` | `dynamic` | — | Record providing `camera.position`. |
| `pvsOrigin` | `dynamic` | — | Value forwarded as `point` to `mq3.renderer.world_surface_selection.pointLeaf`. |
| `cfg` | `dynamic` | — | Record providing `cfg.areaMask`, `cfg.runtime`, `cfg.triangleBudget`, `cfg.farDistance`, `cfg.backfaceCull`, `cfg.patchError`. |
| `cache` | `dynamic` | — | Mutable record or buffer; this call updates `cache.nativeVisible[slot]`, `cache.nativeSelected`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L559)

<a id="function-function-mq3-renderer-world-surface-selection-choosepatchlod-function-choosepatchlod-cache-chosen-camera-cfg-src-mq3-renderer-world-surface-selection-ml-1955512591"></a>
### choosePatchLod

```ml
function choosePatchLod(cache, chosen, camera, cfg)
```

Updates `chosen.estimatedTriangleCount`, `chosen.faceIndexes` in `mq3.renderer.world_surface_selection.choosePatchLod`; returns `chosen`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Record providing `cache.patches`, `cache.trianglesByFace`. |
| `chosen` | `dynamic` | — | Mutable record or buffer; this call updates `chosen.estimatedTriangleCount`, `chosen.faceIndexes`. |
| `camera` | `dynamic` | — | Record providing `camera.position`. |
| `cfg` | `dynamic` | — | Record providing `cfg.lodCurveError`, `cfg.runtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L666)

<a id="function-function-mq3-renderer-world-surface-selection-chooseportalcached-function-chooseportalcached-cache-camera-pvsorigin-cfg-src-mq3-renderer-world-surface-selection-ml-1156234062"></a>
### choosePortalCached

```ml
function choosePortalCached(cache, camera, pvsOrigin, cfg)
```

Computes `choosePortalCached` from `chooseCorePvs(cache.map,camera,pvsOrigin,cfg,cache)` using `mq3.renderer.world_surface_selection.chooseCorePvs`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Record providing `cache.map`, `cache.patchError`. |
| `camera` | `dynamic` | — | Value forwarded as `camera` to `mq3.renderer.world_surface_selection.chooseCorePvs`. |
| `pvsOrigin` | `dynamic` | — | Value forwarded as `pvsOrigin` to `mq3.renderer.world_surface_selection.chooseCorePvs`. |
| `cfg` | `dynamic` | — | Record providing `cfg.patchError`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L655)

<a id="function-function-mq3-renderer-world-surface-selection-config-function-config-width-height-horizontalfov-neardistance-fardistance-trianglebudget-backfacecull-patcherror-src-mq3-renderer-world-surface-selection-ml-628827150"></a>
### config

```ml
function config(width, height, horizontalFov, nearDistance, farDistance, triangleBudget, backfaceCull, patchError)
```

Builds `mq3.renderer.world_surface_selection.SelectionConfig` for `mq3.renderer.world_surface_selection.config`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — | Initial value for `mq3.renderer.world_surface_selection.SelectionConfig.width`. |
| `height` | `dynamic` | — | Initial value for `mq3.renderer.world_surface_selection.SelectionConfig.height`. |
| `horizontalFov` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |
| `nearDistance` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |
| `farDistance` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |
| `triangleBudget` | `dynamic` | — | Initial value for `mq3.renderer.world_surface_selection.SelectionConfig.triangleBudget`. |
| `backfaceCull` | `dynamic` | — | Initial value for `mq3.renderer.world_surface_selection.SelectionConfig.backfaceCull`. |
| `patchError` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L211)

<a id="function-function-mq3-renderer-world-surface-selection-contains-function-contains-values-wanted-src-mq3-renderer-world-surface-selection-ml-1220122685"></a>
### contains

```ml
function contains(values, wanted)
```

Returns `false` from `mq3.renderer.world_surface_selection.contains`; earlier branches return `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Sequence traversed as `value` while producing this result. |
| `wanted` | `dynamic` | — | Input used by `for each value in values if value==wanted then return true`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L273)

<a id="constant-constant-mq3-renderer-world-surface-selection-cull-back-const-cull-back-2-src-mq3-renderer-world-surface-selection-ml-214991123"></a>
### CULL_BACK

```ml
const CULL_BACK = 2
```

Culling mode that keeps back-facing surfaces and rejects their front faces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L38)

<a id="constant-constant-mq3-renderer-world-surface-selection-cull-front-const-cull-front-0-src-mq3-renderer-world-surface-selection-ml-1143790259"></a>
### CULL_FRONT

```ml
const CULL_FRONT = 0
```

Culling mode that keeps front-facing surfaces and rejects their back faces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L34)

<a id="constant-constant-mq3-renderer-world-surface-selection-cull-two-sided-const-cull-two-sided-1-src-mq3-renderer-world-surface-selection-ml-128119490"></a>
### CULL_TWO_SIDED

```ml
const CULL_TWO_SIDED = 1
```

Culling mode that accepts both sides of a surface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L36)

<a id="constant-constant-mq3-renderer-world-surface-selection-default-far-distance-const-default-far-distance-8192-src-mq3-renderer-world-surface-selection-ml-1735216101"></a>
### DEFAULT_FAR_DISTANCE

```ml
const DEFAULT_FAR_DISTANCE = 8192
```

Default distance of the camera's far clipping plane.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L30)

<a id="constant-constant-mq3-renderer-world-surface-selection-default-horizontal-fov-const-default-horizontal-fov-100-src-mq3-renderer-world-surface-selection-ml-200237460"></a>
### DEFAULT_HORIZONTAL_FOV

```ml
const DEFAULT_HORIZONTAL_FOV = 100
```

Default horizontal camera field of view, in degrees.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L26)

<a id="constant-constant-mq3-renderer-world-surface-selection-default-near-distance-const-default-near-distance-1-src-mq3-renderer-world-surface-selection-ml-1110468422"></a>
### DEFAULT_NEAR_DISTANCE

```ml
const DEFAULT_NEAR_DISTANCE = 1
```

Default distance of the camera's near clipping plane.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L28)

<a id="constant-constant-mq3-renderer-world-surface-selection-default-triangle-budget-const-default-triangle-budget-12000-src-mq3-renderer-world-surface-selection-ml-1201025384"></a>
### DEFAULT_TRIANGLE_BUDGET

```ml
const DEFAULT_TRIANGLE_BUDGET = 12000
```

Default limit on triangles retained by visible-world surface selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L32)

<a id="function-function-mq3-renderer-world-surface-selection-defaults-function-defaults-width-height-src-mq3-renderer-world-surface-selection-ml-1709826523"></a>
### defaults

```ml
function defaults(width, height)
```

Calls `mq3.renderer.world_surface_selection.config` with `(width,height,DEFAULT_HORIZONTAL_FOV,DEFAULT_NEAR_DISTANCE,DEFAULT_FAR_DISTANCE,DEFAULT_TRIANGLE_BUDGET,true,render.DEFAULT_PATCH_ERROR)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `width` | `dynamic` | — | Value forwarded as `width` to `mq3.renderer.world_surface_selection.config`. |
| `height` | `dynamic` | — | Value forwarded as `height` to `mq3.renderer.world_surface_selection.config`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L222)

<a id="function-function-mq3-renderer-world-surface-selection-equalareamask-function-equalareamask-left-right-src-mq3-renderer-world-surface-selection-ml-990148731"></a>
### equalAreaMask

```ml
function equalAreaMask(left, right)
```

Compares optional area-mask buffers by presence, length, and every byte.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Indexed input read at `index`. |
| `right` | `dynamic` | — | Indexed input read at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L502)

<a id="function-function-mq3-renderer-world-surface-selection-f32-function-f32-map-offset-src-mq3-renderer-world-surface-selection-ml-1567785235"></a>
### f32

```ml
function f32(map, offset)
```

Returns `n.bitsFloat(value)` from `mq3.renderer.world_surface_selection.f32`; earlier branches return `fail("truncated float")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.data`. |
| `offset` | `dynamic` | — | Argument 2 supplied to `mq3.compat.numeric.readU32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L199)

<a id="constant-constant-mq3-renderer-world-surface-selection-face-plane-epsilon-const-face-plane-epsilon-8-src-mq3-renderer-world-surface-selection-ml-1790744445"></a>
### FACE_PLANE_EPSILON

```ml
const FACE_PLANE_EPSILON = 8
```

Tolerance used when classifying the camera against a planar face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L40)

<a id="constant-constant-mq3-renderer-world-surface-selection-face-stride-const-face-stride-104-src-mq3-renderer-world-surface-selection-ml-935261030"></a>
### FACE_STRIDE

```ml
const FACE_STRIDE = 104
```

Byte stride of one face record in the BSP surface lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L24)

<a id="function-function-mq3-renderer-world-surface-selection-facebounds-function-facebounds-map-faceoffset-src-mq3-renderer-world-surface-selection-ml-1591916730"></a>
### faceBounds

```ml
function faceBounds(map, faceOffset)
```

Builds `positions[index]`, `center[axis]` in `mq3.renderer.world_surface_selection.faceBounds`; returns `[center,n.fsqrt(radiusSquared)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.counts`. |
| `faceOffset` | `dynamic` | — | Input used by `first=i32(map,faceOffset+12)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L293)

<a id="function-function-mq3-renderer-world-surface-selection-facetrianglecount-function-facetrianglecount-map-faceoffset-patcherror-src-mq3-renderer-world-surface-selection-ml-815665558"></a>
### faceTriangleCount

```ml
function faceTriangleCount(map, faceOffset, patchError)
```

Builds `control[index]` in `mq3.renderer.world_surface_selection.faceTriangleCount`; returns `(grid[1]-1)*(grid[2]-1)*2`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Value forwarded as `map` to `mq3.renderer.world_surface_selection.i32`. |
| `faceOffset` | `dynamic` | — | Input used by `kind=i32(map,faceOffset+8)`. |
| `patchError` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.bsp_render_data.subdividePatch`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L279)

<a id="function-function-mq3-renderer-world-surface-selection-fail-function-fail-text-src-mq3-renderer-world-surface-selection-ml-582632267"></a>
### fail

```ml
function fail(text)
```

Creates error `7490` with message `"World surface selection: "+text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Input used in the result expression `error(7490,"World surface selection: "+text)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L173)

<a id="function-function-mq3-renderer-world-surface-selection-forview-function-forview-cfg-refdef-src-mq3-renderer-world-surface-selection-ml-1130389828"></a>
### forView

```ml
function forView(cfg, refdef)
```

Constructs `mq3.renderer.world_surface_selection.SelectionConfig` with `width` = `cfg.width`, `height` = `cfg.height`, `horizontalFov` = `refdef.fovX`, `nearDistance` = `cfg.nearDistance` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cfg` | `dynamic` | — | Record providing `cfg.width`, `cfg.height`, `cfg.nearDistance`, `cfg.farDistance`, `cfg.triangleBudget`, `cfg.backfaceCull`. |
| `refdef` | `dynamic` | — | Record providing `refdef.fovX`, `refdef.viewaxis`, `refdef.fovY`, `refdef.areaMask`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L233)

- [mq3.renderer.world_surface_selection.Frustum](Type-mq3-renderer-world-surface-selection-frustum-417074958.md) — struct
<a id="function-function-mq3-renderer-world-surface-selection-i32-function-i32-map-offset-src-mq3-renderer-world-surface-selection-ml-1098214521"></a>
### i32

```ml
function i32(map, offset)
```

Returns `value` from `mq3.renderer.world_surface_selection.i32`; earlier branches return `fail("truncated integer")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.data`. |
| `offset` | `dynamic` | — | Argument 2 supplied to `mq3.compat.numeric.readI32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L193)

<a id="constant-constant-mq3-renderer-world-surface-selection-leaf-stride-const-leaf-stride-48-src-mq3-renderer-world-surface-selection-ml-254689493"></a>
### LEAF_STRIDE

```ml
const LEAF_STRIDE = 48
```

Byte stride of one leaf record in the BSP leaf lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L22)

<a id="constant-constant-mq3-renderer-world-surface-selection-node-stride-const-node-stride-36-src-mq3-renderer-world-surface-selection-ml-507024484"></a>
### NODE_STRIDE

```ml
const NODE_STRIDE = 36
```

Byte stride of one node record in the BSP node lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L18)

<a id="constant-constant-mq3-renderer-world-surface-selection-plane-stride-const-plane-stride-16-src-mq3-renderer-world-surface-selection-ml-57026688"></a>
### PLANE_STRIDE

```ml
const PLANE_STRIDE = 16
```

Byte stride of one plane record in the BSP plane lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L20)

<a id="function-function-mq3-renderer-world-surface-selection-pointleaf-function-pointleaf-map-point-src-mq3-renderer-world-surface-selection-ml-2132743310"></a>
### pointLeaf

```ml
function pointLeaf(map, point)
```

This is CM_PointLeafnum's BSP walk, kept here so selection needs no loaded collision world. Negative children encode leaves as -1-leafIndex.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.counts`, `map.offsets`. |
| `point` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L241)

<a id="function-function-mq3-renderer-world-surface-selection-prepare-function-prepare-map-camera-cfg-src-mq3-renderer-world-surface-selection-ml-1706441687"></a>
### prepare

```ml
function prepare(map, camera, cfg)
```

Builds `mq3.renderer.world_surface_selection.PreparedWorld` using `mq3.renderer.bsp_render_data.extractWithPatchError`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Value forwarded as `map` to `mq3.renderer.world_surface_selection.choose`. |
| `camera` | `dynamic` | — | Value forwarded as `camera` to `mq3.renderer.world_surface_selection.choose`. |
| `cfg` | `dynamic` | — | Record providing `cfg.triangleBudget`, `cfg.patchError`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L754)

<a id="function-function-mq3-renderer-world-surface-selection-preparecached-function-preparecached-cache-camera-cfg-src-mq3-renderer-world-surface-selection-ml-1820073903"></a>
### prepareCached

```ml
function prepareCached(cache, camera, cfg)
```

Builds `mq3.renderer.world_surface_selection.PreparedWorld` for `mq3.renderer.world_surface_selection.prepareCached`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Value forwarded as `cache` to `mq3.renderer.world_surface_selection.chooseCached`. |
| `camera` | `dynamic` | — | Value forwarded as `camera` to `mq3.renderer.world_surface_selection.chooseCached`. |
| `cfg` | `dynamic` | — | Value forwarded as `cfg` to `mq3.renderer.world_surface_selection.chooseCached`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L702)

<a id="function-function-mq3-renderer-world-surface-selection-preparecachedretained-function-preparecachedretained-cache-camera-cfg-previous-src-mq3-renderer-world-surface-selection-ml-40087724"></a>
### prepareCachedRetained

```ml
function prepareCachedRetained(cache, camera, cfg, previous)
```

Keep the already-flattened triangle stream when camera motion does not alter the visible face order. PVS/frustum metadata is still refreshed, while the hot frame path avoids rebuilding an identical immutable array.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Value forwarded as `cache` to `mq3.renderer.world_surface_selection.chooseCached`. |
| `camera` | `dynamic` | — | Value forwarded as `camera` to `mq3.renderer.world_surface_selection.chooseCached`. |
| `cfg` | `dynamic` | — | Value forwarded as `cfg` to `mq3.renderer.world_surface_selection.chooseCached`. |
| `previous` | `dynamic` | — | Record providing `previous.selection`, `previous.renderData`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L714)

- [mq3.renderer.world_surface_selection.PreparedWorld](Type-mq3-renderer-world-surface-selection-preparedworld-1392584475.md) — struct
<a id="function-function-mq3-renderer-world-surface-selection-preparefrustum-function-preparefrustum-cfg-src-mq3-renderer-world-surface-selection-ml-708756000"></a>
### prepareFrustum

```ml
function prepareFrustum(cfg)
```

Builds `mq3.renderer.world_surface_selection.Frustum` using `mq3.client.playable_viewer.focalLength`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cfg` | `dynamic` | — | Record providing `cfg.width`, `cfg.horizontalFov`, `cfg.height`, `cfg.verticalFov`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L306)

<a id="function-function-mq3-renderer-world-surface-selection-preparepatches-function-preparepatches-patches-byface-counts-nativefaces-centers-radii-normals-src-mq3-renderer-world-surface-selection-ml-394386848"></a>
### preparePatches

```ml
function preparePatches(patches, byFace, counts, nativeFaces, centers, radii, normals)
```

Updates `byFace[patch.face]`, `counts[patch.face]` in `mq3.renderer.world_surface_selection.preparePatches`; returns `coarseCount`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `patches` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.world_patch_lod.stitch`. |
| `byFace` | `dynamic` | — | Mutable record or buffer; this call updates `byFace[patch.face]`. |
| `counts` | `dynamic` | — | Mutable record or buffer; this call updates `counts[patch.face]`. |
| `nativeFaces` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.native_world_selection.store`. |
| `centers` | `dynamic` | — | Indexed input read at `patch.face`. |
| `radii` | `dynamic` | — | Indexed input read at `patch.face`. |
| `normals` | `dynamic` | — | Indexed input read at `patch.face`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L360)

<a id="function-function-mq3-renderer-world-surface-selection-prepareportalcached-function-prepareportalcached-cache-camera-pvsorigin-cfg-src-mq3-renderer-world-surface-selection-ml-1316254124"></a>
### preparePortalCached

```ml
function preparePortalCached(cache, camera, pvsOrigin, cfg)
```

Builds `mq3.renderer.world_surface_selection.PreparedWorld` for `mq3.renderer.world_surface_selection.preparePortalCached`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Value forwarded as `cache` to `mq3.renderer.world_surface_selection.selectPortalCached`. |
| `camera` | `dynamic` | — | Value forwarded as `camera` to `mq3.renderer.world_surface_selection.selectPortalCached`. |
| `pvsOrigin` | `dynamic` | — | Value forwarded as `pvsOrigin` to `mq3.renderer.world_surface_selection.selectPortalCached`. |
| `cfg` | `dynamic` | — | Value forwarded as `cfg` to `mq3.renderer.world_surface_selection.selectPortalCached`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L734)

<a id="function-function-mq3-renderer-world-surface-selection-pvscontains-function-pvscontains-map-cluster-other-src-mq3-renderer-world-surface-selection-ml-1341792464"></a>
### pvsContains

```ml
function pvsContains(map, cluster, other)
```

Computes `pvsContains` from `(map.data[at]&(1<<(other&7)))!=0` using `mq3.renderer.world_surface_selection.i32`, `mq3.compat.numeric.quotient`, `return`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.lengths`, `map.offsets`, `map.data`. |
| `cluster` | `dynamic` | — | Input tested by `clusters is error or rowBytes is error or rowBytes<=0 or cluster<0 or cluster>=clusters or other<0 or other>=clusters`. |
| `other` | `dynamic` | — | Input tested by `clusters is error or rowBytes is error or rowBytes<=0 or cluster<0 or cluster>=clusters or other<0 or other>=clusters`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L260)

<a id="function-function-mq3-renderer-world-surface-selection-samefaces-function-samefaces-left-right-src-mq3-renderer-world-surface-selection-ml-1305766669"></a>
### sameFaces

```ml
function sameFaces(left, right)
```

Camera checks run regularly, but rebuilding retained material commands is only necessary when the selected BSP face set actually changes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Indexed input read at `index`. |
| `right` | `dynamic` | — | Indexed input read at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L743)

- [mq3.renderer.world_surface_selection.Selection](Type-mq3-renderer-world-surface-selection-selection-1519185222.md) — struct
- [mq3.renderer.world_surface_selection.SelectionConfig](Type-mq3-renderer-world-surface-selection-selectionconfig-1943524416.md) — struct
<a id="function-function-mq3-renderer-world-surface-selection-selectportalcached-function-selectportalcached-cache-camera-pvsorigin-cfg-src-mq3-renderer-world-surface-selection-ml-1563872038"></a>
### selectPortalCached

```ml
function selectPortalCached(cache, camera, pvsOrigin, cfg)
```

Returns `choosePatchLod(cache,chosen,camera,cfg)` from `mq3.renderer.world_surface_selection.selectPortalCached`; earlier branches return `chosen`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Value forwarded as `cache` to `mq3.renderer.world_surface_selection.choosePortalCached`. |
| `camera` | `dynamic` | — | Value forwarded as `camera` to `mq3.renderer.world_surface_selection.choosePortalCached`. |
| `pvsOrigin` | `dynamic` | — | Value forwarded as `pvsOrigin` to `mq3.renderer.world_surface_selection.choosePortalCached`. |
| `cfg` | `dynamic` | — | Value forwarded as `cfg` to `mq3.renderer.world_surface_selection.choosePortalCached`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L725)

<a id="function-function-mq3-renderer-world-surface-selection-setcullmodes-function-setcullmodes-cache-modes-src-mq3-renderer-world-surface-selection-ml-945539620"></a>
### setCullModes

```ml
function setCullModes(cache, modes)
```

Updates `cache.cullModes` in `mq3.renderer.world_surface_selection.setCullModes`; returns `cache`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Mutable record or buffer; this call updates `cache.cullModes`. |
| `modes` | `dynamic` | — | Value assigned to `cache.cullModes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L462)

<a id="function-function-mq3-renderer-world-surface-selection-setindexedculling-function-setindexedculling-cache-index-src-mq3-renderer-world-surface-selection-ml-887389670"></a>
### setIndexedCulling

```ml
function setIndexedCulling(cache, index)
```

Builds `modes[textureIndex]` in `mq3.renderer.world_surface_selection.setIndexedCulling`; returns `setCullModes(cache,modes)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Record providing `cache.map`. |
| `index` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.shader_parser.parseIndexed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L488)

<a id="function-function-mq3-renderer-world-surface-selection-settwosidedtextures-function-settwosidedtextures-cache-flags-src-mq3-renderer-world-surface-selection-ml-1998847875"></a>
### setTwoSidedTextures

```ml
function setTwoSidedTextures(cache, flags)
```

Builds `modes[index]` in `mq3.renderer.world_surface_selection.setTwoSidedTextures`; returns `setCullModes(cache,modes)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Record providing `cache.map`. |
| `flags` | `dynamic` | — | Indexed input read at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L478)

<a id="function-function-mq3-renderer-world-surface-selection-setview-function-setview-cfg-refdef-src-mq3-renderer-world-surface-selection-ml-1259409694"></a>
### setView

```ml
function setView(cfg, refdef)
```

Updates `cfg.horizontalFov`, `cfg.verticalFov`, `cfg.runtime`, `cfg.areaMask` in `mq3.renderer.world_surface_selection.setView`; returns `cfg`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cfg` | `dynamic` | — | Mutable record or buffer; this call updates `cfg.horizontalFov`, `cfg.verticalFov`, `cfg.runtime`, `cfg.areaMask`. |
| `refdef` | `dynamic` | — | Record providing `refdef.fovX`, `refdef.fovY`, `refdef.viewaxis`, `refdef.areaMask`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L226)

<a id="function-function-mq3-renderer-world-surface-selection-validmap-function-validmap-map-src-mq3-renderer-world-surface-selection-ml-1520801640"></a>
### validMap

```ml
function validMap(map)
```

Computes `map!=void and typeof(map.data)=="bytes" and map.offsets!=void and len(map.offsets)>=17 and map.counts!=void and len(map.counts)>=17` for `mq3.renderer.world_surface_selection.validMap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.data`, `map.offsets`, `map.counts`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L176)

<a id="function-function-mq3-renderer-world-surface-selection-viewpointaxes-function-viewpointaxes-camera-point-axes-src-mq3-renderer-world-surface-selection-ml-1738806488"></a>
### viewPointAxes

```ml
function viewPointAxes(camera, point, axes)
```

Computes `viewPointAxes` from `[qmath.DotProduct(delta,axes[1]),qmath.DotProduct(delta,axes[2]),qmath.DotProduct(delta,axes[0])]` using `mq3.compat.numeric.fsub`, `mq3.shared.math.DotProduct`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — | Record providing `camera.position`. |
| `point` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `axes` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L340)

<a id="function-function-mq3-renderer-world-surface-selection-visiblefaces-function-visiblefaces-map-cameracluster-pvsused-areamask-src-mq3-renderer-world-surface-selection-ml-315361598"></a>
### visibleFaces

```ml
function visibleFaces(map, cameraCluster, pvsUsed, areaMask)
```

Builds `seenFaces[face]` in `mq3.renderer.world_surface_selection.visibleFaces`; returns `[faceList.toArray(),rejectedPvs]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.counts`, `map.offsets`. |
| `cameraCluster` | `dynamic` | — | Value forwarded as `cluster` to `mq3.renderer.world_surface_selection.pvsContains`. |
| `pvsUsed` | `dynamic` | — | Input tested by `pvsUsed`. |
| `areaMask` | `dynamic` | — | Indexed input read at `area>>3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L515)

<a id="function-function-mq3-renderer-world-surface-selection-visibleinfrustum-function-visibleinfrustum-local-radius-cfg-src-mq3-renderer-world-surface-selection-ml-809168897"></a>
### visibleInFrustum

```ml
function visibleInFrustum(local, radius, cfg)
```

Returns `visibleInPreparedFrustum(local,radius,cfg,frustum)` from `mq3.renderer.world_surface_selection.visibleInFrustum`; earlier branches return `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `local` | `dynamic` | — | Value forwarded as `local` to `mq3.renderer.world_surface_selection.visibleInPreparedFrustum`. |
| `radius` | `dynamic` | — | Value forwarded as `radius` to `mq3.renderer.world_surface_selection.visibleInPreparedFrustum`. |
| `cfg` | `dynamic` | — | Value forwarded as `cfg` to `mq3.renderer.world_surface_selection.prepareFrustum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L332)

<a id="function-function-mq3-renderer-world-surface-selection-visibleinpreparedfrustum-function-visibleinpreparedfrustum-local-radius-cfg-frustum-src-mq3-renderer-world-surface-selection-ml-1493210501"></a>
### visibleInPreparedFrustum

```ml
function visibleInPreparedFrustum(local, radius, cfg, frustum)
```

Computes `visibleInPreparedFrustum` from `local[0]>=0.0-horizontal and local[0]<=horizontal and local[1]>=0.0-vertical and local[1]<=vertical`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `local` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `radius` | `dynamic` | — | Input tested by `local[2]+radius<cfg.nearDistance or local[2]-radius>cfg.farDistance`. |
| `cfg` | `dynamic` | — | Record providing `cfg.nearDistance`, `cfg.farDistance`. |
| `frustum` | `dynamic` | — | Record providing `frustum.slopeX`, `frustum.radiusScaleX`, `frustum.slopeY`, `frustum.radiusScaleY`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L320)

- [mq3.renderer.world_surface_selection.WorldCache](Type-mq3-renderer-world-surface-selection-worldcache-2022446870.md) — struct
<a id="function-function-mq3-renderer-world-surface-selection-worldsurfacerange-function-worldsurfacerange-map-src-mq3-renderer-world-surface-selection-ml-280131744"></a>
### worldSurfaceRange

```ml
function worldSurfaceRange(map)
```

tr_bsp.c loads model 0 as the static world. Retail q3dm0 also lists the *12/*13 door faces in leaf marksurfaces; those faces belong to brush models and must be submitted at the mover's current origin, never as static world.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record providing `map.counts`, `map.data`, `map.offsets`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/world_surface_selection.ml#L184)
