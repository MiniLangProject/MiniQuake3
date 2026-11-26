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

Updates `cache.frameTargets`, `cache.frameTriangles`, `cache.frameCulled`, `cache.frameFull`, `cache.frameMedium` in `mq3.renderer.player_render_cache.beginFrame`; returns `cache`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Mutable record or buffer; this call updates `cache.frameTargets`, `cache.frameTriangles`, `cache.frameCulled`, `cache.frameFull`, `cache.frameMedium`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L97)

<a id="function-function-mq3-renderer-player-render-cache-bindingforsurface-function-bindingforsurface-cache-part-surfaceindex-src-mq3-renderer-player-render-cache-ml-449598302"></a>
### bindingForSurface

```ml
function bindingForSurface(cache, part, surfaceIndex)
```

Computes `bindingForSurface` from `fail("skin has no binding for "+surfaceName)` using `mq3.renderer.player_render_cache.modelForPart`, `mq3.renderer.player_render_cache.skinForPart`, `stringEqualsIgnoreCaseAscii`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Value forwarded as `cache` to `mq3.renderer.player_render_cache.modelForPart`. |
| `part` | `dynamic` | — | Value forwarded as `part` to `mq3.renderer.player_render_cache.modelForPart`. |
| `surfaceIndex` | `dynamic` | — | Input tested by `surfaceIndex<0 or surfaceIndex>=len(model.surfaces)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L326)

<a id="function-function-mq3-renderer-player-render-cache-build-function-build-cache-key-src-mq3-renderer-player-render-cache-ml-353843161"></a>
### build

```ml
function build(cache, key)
```

Updates `cache.entries`, `cache.evictions`, `cache.builds`, `cache.sourceTriangles` in `mq3.renderer.player_render_cache.build`; returns `entry`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Mutable record or buffer; this call updates `cache.entries`, `cache.evictions`, `cache.builds`, `cache.sourceTriangles`. |
| `key` | `dynamic` | — | Record providing `key.lowerFrame`, `key.lowerOldFrame`, `key.lowerPhase`, `key.upperFrame`, `key.upperOldFrame`, `key.upperPhase`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L179)

- [mq3.renderer.player_render_cache.Cache](Type-mq3-renderer-player-render-cache-cache-1177242732.md) — struct
<a id="function-function-mq3-renderer-player-render-cache-create-function-create-models-phasecount-maxentries-maxtrianglespertarget-maxtargetsperframe-src-mq3-renderer-player-render-cache-ml-1577631981"></a>
### create

```ml
function create(models, phaseCount, maxEntries, maxTrianglesPerTarget, maxTargetsPerFrame)
```

Builds `mq3.renderer.player_render_cache.Cache` for `mq3.renderer.player_render_cache.create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `models` | `dynamic` | — | Initial value for `mq3.renderer.player_render_cache.Cache.models`. |
| `phaseCount` | `dynamic` | — | Initial value for `mq3.renderer.player_render_cache.Cache.phaseCount`. |
| `maxEntries` | `dynamic` | — | Initial value for `mq3.renderer.player_render_cache.Cache.maxEntries`. |
| `maxTrianglesPerTarget` | `dynamic` | — | Initial value for `mq3.renderer.player_render_cache.Cache.maxTrianglesPerTarget`. |
| `maxTargetsPerFrame` | `dynamic` | — | Initial value for `mq3.renderer.player_render_cache.Cache.maxTargetsPerFrame`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L43)

<a id="function-function-mq3-renderer-player-render-cache-createdetailed-function-createdetailed-models-skinset-phasecount-maxentries-maxtargetsperframe-policy-light-src-mq3-renderer-player-render-cache-ml-759014161"></a>
### createDetailed

```ml
function createDetailed(models, skinSet, phaseCount, maxEntries, maxTargetsPerFrame, policy, light)
```

Detailed caches retain every triangle at build time. LOD selection happens after lookup, so all targets sharing an animation pose share one interpolation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `models` | `dynamic` | — | Value forwarded as `models` to `mq3.renderer.player_render_cache.create`. |
| `skinSet` | `dynamic` | — | Record providing `skinSet.lower`, `skinSet.upper`, `skinSet.head`. |
| `phaseCount` | `dynamic` | — | Value forwarded as `phaseCount` to `mq3.renderer.player_render_cache.create`. |
| `maxEntries` | `dynamic` | — | Value forwarded as `maxEntries` to `mq3.renderer.player_render_cache.create`. |
| `maxTargetsPerFrame` | `dynamic` | — | Value forwarded as `maxTargetsPerFrame` to `mq3.renderer.player_render_cache.create`. |
| `policy` | `dynamic` | — | Value assigned to `value.lodPolicy`. |
| `light` | `dynamic` | — | Value assigned to `value.lighting`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L87)

<a id="function-function-mq3-renderer-player-render-cache-decoratetriangle-function-decoratetriangle-cache-triangle-lod-src-mq3-renderer-player-render-cache-ml-1928259113"></a>
### decorateTriangle

```ml
function decorateTriangle(cache, triangle, lod)
```

Builds `mq3.renderer.player_render_cache.DrawTriangle` for `mq3.renderer.player_render_cache.decorateTriangle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Value forwarded as `cache` to `mq3.renderer.player_render_cache.bindingForSurface`. |
| `triangle` | `dynamic` | — | Record providing `triangle.part`, `triangle.surfaceIndex`, `triangle.normals`, `triangle.positions`, `triangle.texCoords`. |
| `lod` | `dynamic` | — | Initial value for `mq3.renderer.player_render_cache.DrawTriangle.lod`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L351)

<a id="function-function-mq3-renderer-player-render-cache-distance-function-distance-a-b-src-mq3-renderer-player-render-cache-ml-34275043"></a>
### distance

```ml
function distance(a, b)
```

Computes `distance` from `numeric.fsqrt(numeric.fadd(numeric.fadd(numeric.fmul(dx,dx),numeric.fmul(dy,dy)),numeric.fmul(dz,dz)))` using `mq3.renderer.player_render_cache.validPoint`, `mq3.compat.numeric.fsub`, `mq3.compat.numeric.fsqrt`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.player_render_cache.validPoint`. |
| `b` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.player_render_cache.validPoint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L254)

- [mq3.renderer.player_render_cache.DrawTriangle](Type-mq3-renderer-player-render-cache-drawtriangle-1503976252.md) — struct
- [mq3.renderer.player_render_cache.Entry](Type-mq3-renderer-player-render-cache-entry-1693965014.md) — struct
<a id="function-function-mq3-renderer-player-render-cache-fail-function-fail-message-src-mq3-renderer-player-render-cache-ml-741151455"></a>
### fail

```ml
function fail(message)
```

Creates error `7540` with message `"player render cache: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7540,"player render cache: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L35)

<a id="function-function-mq3-renderer-player-render-cache-find-function-find-cache-key-src-mq3-renderer-player-render-cache-ml-351563649"></a>
### find

```ml
function find(cache, key)
```

Returns `void` from `mq3.renderer.player_render_cache.find`; earlier branches return `cache.entries[index]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Record providing `cache.entries`. |
| `key` | `dynamic` | — | Value forwarded as `b` to `mq3.renderer.player_render_cache.sameKey`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L153)

<a id="constant-constant-mq3-renderer-player-render-cache-full-surface-triangle-limit-const-full-surface-triangle-limit-8192-src-mq3-renderer-player-render-cache-ml-259966397"></a>
### FULL_SURFACE_TRIANGLE_LIMIT

```ml
const FULL_SURFACE_TRIANGLE_LIMIT = 8192
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L16)

- [mq3.renderer.player_render_cache.Key](Type-mq3-renderer-player-render-cache-key-1751774261.md) — struct
<a id="function-function-mq3-renderer-player-render-cache-keyfor-function-keyfor-cache-lowersample-uppersample-src-mq3-renderer-player-render-cache-ml-465354061"></a>
### keyFor

```ml
function keyFor(cache, lowerSample, upperSample)
```

Builds `mq3.renderer.player_render_cache.Key` for `mq3.renderer.player_render_cache.keyFor`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Value forwarded as `cache` to `mq3.renderer.player_render_cache.phaseFor`. |
| `lowerSample` | `dynamic` | — | Record providing `lowerSample.oldFrame`, `lowerSample.frame`. |
| `upperSample` | `dynamic` | — | Record providing `upperSample.oldFrame`, `upperSample.frame`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L137)

<a id="function-function-mq3-renderer-player-render-cache-lighting-function-lighting-direction-ambient-directed-src-mq3-renderer-player-render-cache-ml-716791615"></a>
### lighting

```ml
function lighting(direction, ambient, directed)
```

Builds `mq3.renderer.player_render_cache.Lighting` for `mq3.renderer.player_render_cache.lighting`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `direction` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `ambient` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |
| `directed` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L68)

- [mq3.renderer.player_render_cache.Lighting](Type-mq3-renderer-player-render-cache-lighting-1222861998.md) — struct
<a id="function-function-mq3-renderer-player-render-cache-limittriangles-function-limittriangles-triangles-budget-src-mq3-renderer-player-render-cache-ml-1448515294"></a>
### limitTriangles

```ml
function limitTriangles(triangles, budget)
```

Evenly retain triangles across the stable lower/upper/head stream. This avoids starving later model pieces when the target budget is small.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `triangles` | `dynamic` | — | Indexed input read at `source`. |
| `budget` | `dynamic` | — | Argument 2 supplied to `mq3.compat.numeric.quotient`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L166)

<a id="function-function-mq3-renderer-player-render-cache-localtriangletotarget-function-localtriangletotarget-source-target-src-mq3-renderer-player-render-cache-ml-1364180696"></a>
### localTriangleToTarget

```ml
function localTriangleToTarget(source, target)
```

Builds `positions[corner]`, `normals[corner]` in `mq3.renderer.player_render_cache.localTriangleToTarget`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Record providing `source.positions`, `source.normals`, `source.texCoords`, `source.part`, `source.surfaceIndex`, `source.shaderName`. |
| `target` | `dynamic` | — | Record providing `target.axis`, `target.origin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L199)

<a id="constant-constant-mq3-renderer-player-render-cache-lod-culled-const-lod-culled-0-src-mq3-renderer-player-render-cache-ml-635264133"></a>
### LOD_CULLED

```ml
const LOD_CULLED = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L12)

<a id="constant-constant-mq3-renderer-player-render-cache-lod-far-const-lod-far-1-src-mq3-renderer-player-render-cache-ml-774643834"></a>
### LOD_FAR

```ml
const LOD_FAR = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L13)

<a id="constant-constant-mq3-renderer-player-render-cache-lod-full-const-lod-full-3-src-mq3-renderer-player-render-cache-ml-27694836"></a>
### LOD_FULL

```ml
const LOD_FULL = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L15)

<a id="constant-constant-mq3-renderer-player-render-cache-lod-medium-const-lod-medium-2-src-mq3-renderer-player-render-cache-ml-817785835"></a>
### LOD_MEDIUM

```ml
const LOD_MEDIUM = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L14)

<a id="function-function-mq3-renderer-player-render-cache-lodfor-function-lodfor-cache-viewerorigin-visible-target-src-mq3-renderer-player-render-cache-ml-1962275473"></a>
### lodFor

```ml
function lodFor(cache, viewerOrigin, visible, target)
```

Selects full, medium, far, or culled detail from visibility and the cache's distance thresholds.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Record providing `cache.detailed`, `cache.lodPolicy`. |
| `viewerOrigin` | `dynamic` | — | Value forwarded as `a` to `mq3.renderer.player_render_cache.distance`. |
| `visible` | `dynamic` | — | Input tested by `not visible`. |
| `target` | `dynamic` | — | Record providing `target.origin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L265)

<a id="function-function-mq3-renderer-player-render-cache-lodpolicy-function-lodpolicy-fulldistance-mediumdistance-fardistance-mediumstride-farstride-src-mq3-renderer-player-render-cache-ml-669046802"></a>
### lodPolicy

```ml
function lodPolicy(fullDistance, mediumDistance, farDistance, mediumStride, farStride)
```

Builds `mq3.renderer.player_render_cache.LodPolicy` for `mq3.renderer.player_render_cache.lodPolicy`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fullDistance` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |
| `mediumDistance` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |
| `farDistance` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |
| `mediumStride` | `dynamic` | — | Initial value for `mq3.renderer.player_render_cache.LodPolicy.mediumStride`. |
| `farStride` | `dynamic` | — | Initial value for `mq3.renderer.player_render_cache.LodPolicy.farStride`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L58)

- [mq3.renderer.player_render_cache.LodPolicy](Type-mq3-renderer-player-render-cache-lodpolicy-2072277335.md) — struct
<a id="function-function-mq3-renderer-player-render-cache-modelforpart-function-modelforpart-cache-part-src-mq3-renderer-player-render-cache-ml-145590895"></a>
### modelForPart

```ml
function modelForPart(cache, part)
```

Computes `modelForPart` from `fail("unknown player part")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Record providing `cache.models`. |
| `part` | `dynamic` | — | Input tested by `part==player.LOWER_PART`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L305)

<a id="function-function-mq3-renderer-player-render-cache-phasebacklerp-function-phasebacklerp-cache-phase-src-mq3-renderer-player-render-cache-ml-2050328031"></a>
### phaseBacklerp

```ml
function phaseBacklerp(cache, phase)
```

Returns `numeric.f32((phase*1.0)/(cache.phaseCount-1))` from `mq3.renderer.player_render_cache.phaseBacklerp`; earlier branches return `0.0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Record providing `cache.phaseCount`. |
| `phase` | `dynamic` | — | Input used in the result expression `numeric.f32((phase*1.0)/(cache.phaseCount-1))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L128)

<a id="function-function-mq3-renderer-player-render-cache-phasefor-function-phasefor-cache-value-src-mq3-renderer-player-render-cache-ml-2002310559"></a>
### phaseFor

```ml
function phaseFor(cache, value)
```

Round to the nearest one of phaseCount evenly spaced backlerp values. phaseCount=1 deliberately selects the current frame without interpolation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Record providing `cache.phaseCount`. |
| `value` | `dynamic` | — | Record providing `value.backlerp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L116)

<a id="function-function-mq3-renderer-player-render-cache-rendertarget-function-rendertarget-cache-lowersample-uppersample-target-src-mq3-renderer-player-render-cache-ml-1814437606"></a>
### renderTarget

```ml
function renderTarget(cache, lowerSample, upperSample, target)
```

One call consumes one target from the current frame budget. Cache misses assemble/interpolate in identity space; hits only apply the target transform.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Mutable record or buffer; this call updates `cache.misses`, `cache.hits`, `cache.frameTargets`, `cache.frameTriangles`. |
| `lowerSample` | `dynamic` | — | Value forwarded as `lowerSample` to `mq3.renderer.player_render_cache.keyFor`. |
| `upperSample` | `dynamic` | — | Value forwarded as `upperSample` to `mq3.renderer.player_render_cache.keyFor`. |
| `target` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.player_model_assembly.validateTransform`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L233)

<a id="function-function-mq3-renderer-player-render-cache-rendertargetdetailed-function-rendertargetdetailed-cache-lowersample-uppersample-target-viewerorigin-visible-src-mq3-renderer-player-render-cache-ml-1735482132"></a>
### renderTargetDetailed

```ml
function renderTargetDetailed(cache, lowerSample, upperSample, target, viewerOrigin, visible)
```

Visibility and distance are evaluated before consuming the per-frame target budget. Visible targets use the complete cached mesh at close range.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Mutable record or buffer; this call updates `cache.frameCulled`, `cache.misses`, `cache.hits`, `cache.frameTargets`, `cache.frameTriangles`. |
| `lowerSample` | `dynamic` | — | Value forwarded as `lowerSample` to `mq3.renderer.player_render_cache.keyFor`. |
| `upperSample` | `dynamic` | — | Value forwarded as `upperSample` to `mq3.renderer.player_render_cache.keyFor`. |
| `target` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.player_model_assembly.validateTransform`. |
| `viewerOrigin` | `dynamic` | — | Value forwarded as `viewerOrigin` to `mq3.renderer.player_render_cache.lodFor`. |
| `visible` | `dynamic` | — | Value forwarded as `visible` to `mq3.renderer.player_render_cache.lodFor`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L366)

<a id="function-function-mq3-renderer-player-render-cache-samekey-function-samekey-a-b-src-mq3-renderer-player-render-cache-ml-31161249"></a>
### sameKey

```ml
function sameKey(a, b)
```

Compares lower/upper current frames, previous frames, and quantized interpolation phases for cache identity.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Record providing `a.lowerOldFrame`, `a.lowerFrame`, `a.lowerPhase`, `a.upperOldFrame`, `a.upperFrame`, `a.upperPhase`. |
| `b` | `dynamic` | — | Record providing `b.lowerOldFrame`, `b.lowerFrame`, `b.lowerPhase`, `b.upperOldFrame`, `b.upperFrame`, `b.upperPhase`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L146)

<a id="function-function-mq3-renderer-player-render-cache-selectlodtriangles-function-selectlodtriangles-cache-triangles-lod-src-mq3-renderer-player-render-cache-ml-63217140"></a>
### selectLodTriangles

```ml
function selectLodTriangles(cache, triangles, lod)
```

The source stream is grouped by part and surface. Resetting the stride at every boundary guarantees that even a tiny face/gear surface stays present.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Value forwarded as `cache` to `mq3.renderer.player_render_cache.strideFor`. |
| `triangles` | `dynamic` | — | Sequence traversed as `triangle` while producing this result. |
| `lod` | `dynamic` | — | Value forwarded as `lod` to `mq3.renderer.player_render_cache.strideFor`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L290)

<a id="function-function-mq3-renderer-player-render-cache-skinforpart-function-skinforpart-cache-part-src-mq3-renderer-player-render-cache-ml-1579082117"></a>
### skinForPart

```ml
function skinForPart(cache, part)
```

Computes `skinForPart` from `fail("unknown player part")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Record providing `cache.skinSet`. |
| `part` | `dynamic` | — | Input tested by `part==player.LOWER_PART`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L315)

<a id="function-function-mq3-renderer-player-render-cache-stats-function-stats-cache-src-mq3-renderer-player-render-cache-ml-723614630"></a>
### stats

```ml
function stats(cache)
```

Builds `mq3.renderer.player_render_cache.Stats` for `mq3.renderer.player_render_cache.stats`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Record providing `cache.entries`, `cache.hits`, `cache.misses`, `cache.builds`, `cache.evictions`, `cache.frameTargets`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L392)

- [mq3.renderer.player_render_cache.Stats](Type-mq3-renderer-player-render-cache-stats-76336821.md) — struct
<a id="function-function-mq3-renderer-player-render-cache-stridefor-function-stridefor-cache-lod-src-mq3-renderer-player-render-cache-ml-1362544337"></a>
### strideFor

```ml
function strideFor(cache, lod)
```

Returns `0` from `mq3.renderer.player_render_cache.strideFor`; earlier branches return `1`, `cache.lodPolicy.mediumStride`, `cache.lodPolicy.farStride`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Record providing `cache.lodPolicy`. |
| `lod` | `dynamic` | — | Input tested by `lod==LOD_FULL`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L278)

<a id="function-function-mq3-renderer-player-render-cache-transformtriangles-function-transformtriangles-triangles-target-src-mq3-renderer-player-render-cache-ml-437571454"></a>
### transformTriangles

```ml
function transformTriangles(triangles, target)
```

Builds `result[index]` in `mq3.renderer.player_render_cache.transformTriangles`; returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `triangles` | `dynamic` | — | Indexed input read at `index`. |
| `target` | `dynamic` | — | Value forwarded as `target` to `mq3.renderer.player_render_cache.localTriangleToTarget`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L214)

<a id="function-function-mq3-renderer-player-render-cache-validatesample-function-validatesample-value-src-mq3-renderer-player-render-cache-ml-825117869"></a>
### validateSample

```ml
function validateSample(value)
```

Rejects missing animation samples, negative frame indices, and backlerp outside zero through one.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record providing `value.oldFrame`, `value.frame`, `value.backlerp`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L105)

<a id="function-function-mq3-renderer-player-render-cache-validpoint-function-validpoint-value-src-mq3-renderer-player-render-cache-ml-1493447297"></a>
### validPoint

```ml
function validPoint(value)
```

Computes `value!=void and len(value)==3` for `mq3.renderer.player_render_cache.validPoint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Input used in the result expression `value!=void and len(value)==3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L249)

<a id="function-function-mq3-renderer-player-render-cache-vertexlight-function-vertexlight-cache-normal-src-mq3-renderer-player-render-cache-ml-504386421"></a>
### vertexLight

```ml
function vertexLight(cache, normal)
```

Computes `vertexLight` from `numeric.f32(value)` using `mq3.compat.numeric.fadd`, `mq3.compat.numeric.fmul`, `mq3.compat.numeric.f32`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Record providing `cache.lighting`. |
| `normal` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/player_render_cache.ml#L339)
