# `src/mq3/renderer/player_render_cache.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.player_render_cache`](Package-mq3-renderer-player-render-cache-4956148.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/renderer/player_model_assembly.ml` as `player` → [src/mq3/renderer/player_model_assembly.ml](File-src-mq3-renderer-player-model-assembly-ml-170504265.md)
- `mq3/renderer/player_skins.ml` as `skins` → [src/mq3/renderer/player_skins.ml](File-src-mq3-renderer-player-skins-ml-163797353.md)
- `mq3/renderer/view_math.ml` as `viewMath` → [src/mq3/renderer/view_math.ml](File-src-mq3-renderer-view-math-ml-126526929.md)
- `std/array.ml` as `arrays` → `../MiniLangCompilerML/std/array.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-player-render-cache-beginframe-function-beginframe-cache-src-mq3-renderer-player-render-cache-ml-1730739056"></a>
### beginFrame

```ml
function beginFrame(cache)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L63)

<a id="function-function-mq3-renderer-player-render-cache-bindingforsurface-function-bindingforsurface-cache-part-surfaceindex-src-mq3-renderer-player-render-cache-ml-449598302"></a>
### bindingForSurface

```ml
function bindingForSurface(cache, part, surfaceIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `part` | `dynamic` | — |  |
| `surfaceIndex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L234)

<a id="function-function-mq3-renderer-player-render-cache-build-function-build-cache-key-src-mq3-renderer-player-render-cache-ml-353843161"></a>
### build

```ml
function build(cache, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L123)

- [mq3.renderer.player_render_cache.Cache](Type-mq3-renderer-player-render-cache-cache-1177242732.md) — struct
<a id="function-function-mq3-renderer-player-render-cache-create-function-create-models-phasecount-maxentries-maxtrianglespertarget-maxtargetsperframe-src-mq3-renderer-player-render-cache-ml-1577631981"></a>
### create

```ml
function create(models, phaseCount, maxEntries, maxTrianglesPerTarget, maxTargetsPerFrame)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `models` | `dynamic` | — |  |
| `phaseCount` | `dynamic` | — |  |
| `maxEntries` | `dynamic` | — |  |
| `maxTrianglesPerTarget` | `dynamic` | — |  |
| `maxTargetsPerFrame` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L28)

<a id="function-function-mq3-renderer-player-render-cache-createdetailed-function-createdetailed-models-skinset-phasecount-maxentries-maxtargetsperframe-policy-light-src-mq3-renderer-player-render-cache-ml-759014161"></a>
### createDetailed

```ml
function createDetailed(models, skinSet, phaseCount, maxEntries, maxTargetsPerFrame, policy, light)
```

Detailed caches retain every triangle at build time. LOD selection happens after lookup, so all targets sharing an animation pose share one interpolation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `models` | `dynamic` | — |  |
| `skinSet` | `dynamic` | — |  |
| `phaseCount` | `dynamic` | — |  |
| `maxEntries` | `dynamic` | — |  |
| `maxTargetsPerFrame` | `dynamic` | — |  |
| `policy` | `dynamic` | — |  |
| `light` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L55)

<a id="function-function-mq3-renderer-player-render-cache-decoratetriangle-function-decoratetriangle-cache-triangle-lod-src-mq3-renderer-player-render-cache-ml-1928259113"></a>
### decorateTriangle

```ml
function decorateTriangle(cache, triangle, lod)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `triangle` | `dynamic` | — |  |
| `lod` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L252)

<a id="function-function-mq3-renderer-player-render-cache-distance-function-distance-a-b-src-mq3-renderer-player-render-cache-ml-34275043"></a>
### distance

```ml
function distance(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L183)

- [mq3.renderer.player_render_cache.DrawTriangle](Type-mq3-renderer-player-render-cache-drawtriangle-1503976252.md) — struct
- [mq3.renderer.player_render_cache.Entry](Type-mq3-renderer-player-render-cache-entry-1693965014.md) — struct
<a id="function-function-mq3-renderer-player-render-cache-fail-function-fail-message-src-mq3-renderer-player-render-cache-ml-741151455"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L26)

<a id="function-function-mq3-renderer-player-render-cache-find-function-find-cache-key-src-mq3-renderer-player-render-cache-ml-351563649"></a>
### find

```ml
function find(cache, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L102)

<a id="constant-constant-mq3-renderer-player-render-cache-full-surface-triangle-limit-const-full-surface-triangle-limit-8192-src-mq3-renderer-player-render-cache-ml-259966397"></a>
### FULL_SURFACE_TRIANGLE_LIMIT

```ml
const FULL_SURFACE_TRIANGLE_LIMIT = 8192
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L16)

- [mq3.renderer.player_render_cache.Key](Type-mq3-renderer-player-render-cache-key-1751774261.md) — struct
<a id="function-function-mq3-renderer-player-render-cache-keyfor-function-keyfor-cache-lowersample-uppersample-src-mq3-renderer-player-render-cache-ml-465354061"></a>
### keyFor

```ml
function keyFor(cache, lowerSample, upperSample)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `lowerSample` | `dynamic` | — |  |
| `upperSample` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L92)

<a id="function-function-mq3-renderer-player-render-cache-lighting-function-lighting-direction-ambient-directed-src-mq3-renderer-player-render-cache-ml-716791615"></a>
### lighting

```ml
function lighting(direction, ambient, directed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `direction` | `dynamic` | — |  |
| `ambient` | `dynamic` | — |  |
| `directed` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L43)

- [mq3.renderer.player_render_cache.Lighting](Type-mq3-renderer-player-render-cache-lighting-1222861998.md) — struct
<a id="function-function-mq3-renderer-player-render-cache-limittriangles-function-limittriangles-triangles-budget-src-mq3-renderer-player-render-cache-ml-1448515294"></a>
### limitTriangles

```ml
function limitTriangles(triangles, budget)
```

Evenly retain triangles across the stable lower/upper/head stream. This avoids starving later model pieces when the target budget is small.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `triangles` | `dynamic` | — |  |
| `budget` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L113)

<a id="function-function-mq3-renderer-player-render-cache-localtriangletotarget-function-localtriangletotarget-source-target-src-mq3-renderer-player-render-cache-ml-1364180696"></a>
### localTriangleToTarget

```ml
function localTriangleToTarget(source, target)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L140)

<a id="constant-constant-mq3-renderer-player-render-cache-lod-culled-const-lod-culled-0-src-mq3-renderer-player-render-cache-ml-635264133"></a>
### LOD_CULLED

```ml
const LOD_CULLED = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L12)

<a id="constant-constant-mq3-renderer-player-render-cache-lod-far-const-lod-far-1-src-mq3-renderer-player-render-cache-ml-774643834"></a>
### LOD_FAR

```ml
const LOD_FAR = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L13)

<a id="constant-constant-mq3-renderer-player-render-cache-lod-full-const-lod-full-3-src-mq3-renderer-player-render-cache-ml-27694836"></a>
### LOD_FULL

```ml
const LOD_FULL = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L15)

<a id="constant-constant-mq3-renderer-player-render-cache-lod-medium-const-lod-medium-2-src-mq3-renderer-player-render-cache-ml-817785835"></a>
### LOD_MEDIUM

```ml
const LOD_MEDIUM = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L14)

<a id="function-function-mq3-renderer-player-render-cache-lodfor-function-lodfor-cache-viewerorigin-visible-target-src-mq3-renderer-player-render-cache-ml-1962275473"></a>
### lodFor

```ml
function lodFor(cache, viewerOrigin, visible, target)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `viewerOrigin` | `dynamic` | — |  |
| `visible` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L189)

<a id="function-function-mq3-renderer-player-render-cache-lodpolicy-function-lodpolicy-fulldistance-mediumdistance-fardistance-mediumstride-farstride-src-mq3-renderer-player-render-cache-ml-669046802"></a>
### lodPolicy

```ml
function lodPolicy(fullDistance, mediumDistance, farDistance, mediumStride, farStride)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fullDistance` | `dynamic` | — |  |
| `mediumDistance` | `dynamic` | — |  |
| `farDistance` | `dynamic` | — |  |
| `mediumStride` | `dynamic` | — |  |
| `farStride` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L37)

- [mq3.renderer.player_render_cache.LodPolicy](Type-mq3-renderer-player-render-cache-lodpolicy-2072277335.md) — struct
<a id="function-function-mq3-renderer-player-render-cache-modelforpart-function-modelforpart-cache-part-src-mq3-renderer-player-render-cache-ml-145590895"></a>
### modelForPart

```ml
function modelForPart(cache, part)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `part` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L220)

<a id="function-function-mq3-renderer-player-render-cache-phasebacklerp-function-phasebacklerp-cache-phase-src-mq3-renderer-player-render-cache-ml-2050328031"></a>
### phaseBacklerp

```ml
function phaseBacklerp(cache, phase)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `phase` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L87)

<a id="function-function-mq3-renderer-player-render-cache-phasefor-function-phasefor-cache-value-src-mq3-renderer-player-render-cache-ml-2002310559"></a>
### phaseFor

```ml
function phaseFor(cache, value)
```

Round to the nearest one of phaseCount evenly spaced backlerp values. phaseCount=1 deliberately selects the current frame without interpolation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L78)

<a id="function-function-mq3-renderer-player-render-cache-rendertarget-function-rendertarget-cache-lowersample-uppersample-target-src-mq3-renderer-player-render-cache-ml-1814437606"></a>
### renderTarget

```ml
function renderTarget(cache, lowerSample, upperSample, target)
```

One call consumes one target from the current frame budget. Cache misses assemble/interpolate in identity space; hits only apply the target transform.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `lowerSample` | `dynamic` | — |  |
| `upperSample` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L167)

<a id="function-function-mq3-renderer-player-render-cache-rendertargetdetailed-function-rendertargetdetailed-cache-lowersample-uppersample-target-viewerorigin-visible-src-mq3-renderer-player-render-cache-ml-1735482132"></a>
### renderTargetDetailed

```ml
function renderTargetDetailed(cache, lowerSample, upperSample, target, viewerOrigin, visible)
```

Visibility and distance are evaluated before consuming the per-frame target budget. Visible targets use the complete cached mesh at close range.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `lowerSample` | `dynamic` | — |  |
| `upperSample` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |
| `viewerOrigin` | `dynamic` | — |  |
| `visible` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L261)

<a id="function-function-mq3-renderer-player-render-cache-samekey-function-samekey-a-b-src-mq3-renderer-player-render-cache-ml-31161249"></a>
### sameKey

```ml
function sameKey(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L98)

<a id="function-function-mq3-renderer-player-render-cache-selectlodtriangles-function-selectlodtriangles-cache-triangles-lod-src-mq3-renderer-player-render-cache-ml-63217140"></a>
### selectLodTriangles

```ml
function selectLodTriangles(cache, triangles, lod)
```

The source stream is grouped by part and surface. Resetting the stride at every boundary guarantees that even a tiny face/gear surface stays present.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `triangles` | `dynamic` | — |  |
| `lod` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L208)

<a id="function-function-mq3-renderer-player-render-cache-skinforpart-function-skinforpart-cache-part-src-mq3-renderer-player-render-cache-ml-1579082117"></a>
### skinForPart

```ml
function skinForPart(cache, part)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `part` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L227)

<a id="function-function-mq3-renderer-player-render-cache-stats-function-stats-cache-src-mq3-renderer-player-render-cache-ml-723614630"></a>
### stats

```ml
function stats(cache)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L285)

- [mq3.renderer.player_render_cache.Stats](Type-mq3-renderer-player-render-cache-stats-76336821.md) — struct
<a id="function-function-mq3-renderer-player-render-cache-stridefor-function-stridefor-cache-lod-src-mq3-renderer-player-render-cache-ml-1362544337"></a>
### strideFor

```ml
function strideFor(cache, lod)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `lod` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L199)

<a id="function-function-mq3-renderer-player-render-cache-transformtriangles-function-transformtriangles-triangles-target-src-mq3-renderer-player-render-cache-ml-437571454"></a>
### transformTriangles

```ml
function transformTriangles(triangles, target)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `triangles` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L152)

<a id="function-function-mq3-renderer-player-render-cache-validatesample-function-validatesample-value-src-mq3-renderer-player-render-cache-ml-825117869"></a>
### validateSample

```ml
function validateSample(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L69)

<a id="function-function-mq3-renderer-player-render-cache-validpoint-function-validpoint-value-src-mq3-renderer-player-render-cache-ml-1493447297"></a>
### validPoint

```ml
function validPoint(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L181)

<a id="function-function-mq3-renderer-player-render-cache-vertexlight-function-vertexlight-cache-normal-src-mq3-renderer-player-render-cache-ml-504386421"></a>
### vertexLight

```ml
function vertexLight(cache, normal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/player_render_cache.ml#L244)
