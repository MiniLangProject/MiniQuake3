# `src/mq3/renderer/tr_shade_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.tr_shade_runtime`](Package-mq3-renderer-tr-shade-runtime-355561374.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/renderer/playable_dynamic_lights.ml` as `dlights` → [src/mq3/renderer/playable_dynamic_lights.ml](File-src-mq3-renderer-playable-dynamic-lights-ml-229722941.md)
- `mq3/renderer/playable_fog.ml` as `fogRuntime` → [src/mq3/renderer/playable_fog.ml](File-src-mq3-renderer-playable-fog-ml-140703890.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)
- `mq3/renderer/playable_world_batch.ml` as `worldBatch` → [src/mq3/renderer/playable_world_batch.ml](File-src-mq3-renderer-playable-world-batch-ml-1411140007.md)
- `mq3/renderer/tr_shade_calc_runtime.ml` as `calc` → [src/mq3/renderer/tr_shade_calc_runtime.ml](File-src-mq3-renderer-tr-shade-calc-runtime-ml-768081332.md)

## Declarations

- [mq3.renderer.tr_shade_runtime.ArrayVertex](Type-mq3-renderer-tr-shade-runtime-arrayvertex-241547199.md) — struct
<a id="function-function-mq3-renderer-tr-shade-runtime-computecolors-function-computecolors-stage-vertexcolors-entitycolor-positions-vieworigin-nowmilliseconds-fogdensities-fogadjustment-src-mq3-renderer-tr-shade-runtime-ml-1766333182"></a>
### ComputeColors

```ml
function ComputeColors(stage, vertexColors, entityColor, positions, viewOrigin, nowMilliseconds, fogDensities, fogAdjustment)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |
| `vertexColors` | `dynamic` | — |  |
| `entityColor` | `dynamic` | — |  |
| `positions` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `fogDensities` | `dynamic` | — |  |
| `fogAdjustment` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L117)

<a id="function-function-mq3-renderer-tr-shade-runtime-computetexcoords-function-computetexcoords-stage-basecoords-lightmapcoords-positions-normals-vieworigin-entitytranslate-nowmilliseconds-fog-forward-src-mq3-renderer-tr-shade-runtime-ml-732385324"></a>
### ComputeTexCoords

```ml
function ComputeTexCoords(stage, baseCoords, lightmapCoords, positions, normals, viewOrigin, entityTranslate, nowMilliseconds, fog, forward)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |
| `baseCoords` | `dynamic` | — |  |
| `lightmapCoords` | `dynamic` | — |  |
| `positions` | `dynamic` | — |  |
| `normals` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |
| `entityTranslate` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `fog` | `dynamic` | — |  |
| `forward` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L127)

- [mq3.renderer.tr_shade_runtime.DebugPlan](Type-mq3-renderer-tr-shade-runtime-debugplan-116266896.md) — struct
- [mq3.renderer.tr_shade_runtime.DlightPass](Type-mq3-renderer-tr-shade-runtime-dlightpass-334056377.md) — struct
<a id="function-function-mq3-renderer-tr-shade-runtime-drawmultitextured-function-drawmultitextured-input-stage-lightmaponly-portal-src-mq3-renderer-tr-shade-runtime-ml-241927600"></a>
### DrawMultitextured

```ml
function DrawMultitextured(input, stage, lightmapOnly, portal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — |  |
| `stage` | `dynamic` | — |  |
| `lightmapOnly` | `dynamic` | — |  |
| `portal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L87)

<a id="function-function-mq3-renderer-tr-shade-runtime-drawnormals-function-drawnormals-positions-normals-src-mq3-renderer-tr-shade-runtime-ml-925628900"></a>
### DrawNormals

```ml
function DrawNormals(positions, normals)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `positions` | `dynamic` | — |  |
| `normals` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L74)

<a id="function-function-mq3-renderer-tr-shade-runtime-drawtris-function-drawtris-indexes-src-mq3-renderer-tr-shade-runtime-ml-1535947316"></a>
### DrawTris

```ml
function DrawTris(indexes)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `indexes` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L73)

- [mq3.renderer.tr_shade_runtime.ElementPlan](Type-mq3-renderer-tr-shade-runtime-elementplan-2106441323.md) — struct
- [mq3.renderer.tr_shade_runtime.EndCounters](Type-mq3-renderer-tr-shade-runtime-endcounters-1607153664.md) — struct
- [mq3.renderer.tr_shade_runtime.EndResult](Type-mq3-renderer-tr-shade-runtime-endresult-338527604.md) — struct
<a id="function-function-mq3-renderer-tr-shade-runtime-fail-function-fail-message-src-mq3-renderer-tr-shade-runtime-ml-429312363"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L28)

- [mq3.renderer.tr_shade_runtime.FogPlan](Type-mq3-renderer-tr-shade-runtime-fogplan-2135218659.md) — struct
- [mq3.renderer.tr_shade_runtime.MultiPlan](Type-mq3-renderer-tr-shade-runtime-multiplan-584797842.md) — struct
<a id="function-function-mq3-renderer-tr-shade-runtime-projectdlighttexture-function-projectdlighttexture-positions-indexes-dlightbits-lights-src-mq3-renderer-tr-shade-runtime-ml-413385781"></a>
### ProjectDlightTexture

```ml
function ProjectDlightTexture(positions, indexes, dlightBits, lights)
```

Exact CPU half of ProjectDlightTexture. The productive draw path below uses playable_dynamic_lights for the same projection and blend submission.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `positions` | `dynamic` | — |  |
| `indexes` | `dynamic` | — |  |
| `dlightBits` | `dynamic` | — |  |
| `lights` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L97)

<a id="function-function-mq3-renderer-tr-shade-runtime-projectdlighttexturedraw-function-projectdlighttexturedraw-batch-catalog-lights-projection-src-mq3-renderer-tr-shade-runtime-ml-1263201959"></a>
### ProjectDlightTextureDraw

```ml
function ProjectDlightTextureDraw(batch, catalog, lights, projection)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |
| `lights` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L108)

<a id="function-function-mq3-renderer-tr-shade-runtime-r-arrayelementdiscrete-function-r-arrayelementdiscrete-index-positions-colors-texture0-texture1-currenttmu-src-mq3-renderer-tr-shade-runtime-ml-1917650694"></a>
### R_ArrayElementDiscrete

```ml
function R_ArrayElementDiscrete(index, positions, colors, texture0, texture1, currentTmu)
```

R_ArrayElementDiscrete emits the currently selected texture-coordinate set, packed color and position for one array element.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |
| `positions` | `dynamic` | — |  |
| `colors` | `dynamic` | — |  |
| `texture0` | `dynamic` | — |  |
| `texture1` | `dynamic` | — |  |
| `currentTmu` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L32)

<a id="function-function-mq3-renderer-tr-shade-runtime-r-bindanimatedimage-function-r-bindanimatedimage-isvideo-slots-animationspeed-shadertime-src-mq3-renderer-tr-shade-runtime-ml-1126322477"></a>
### R_BindAnimatedImage

```ml
function R_BindAnimatedImage(isVideo, slots, animationSpeed, shaderTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `isVideo` | `dynamic` | — |  |
| `slots` | `dynamic` | — |  |
| `animationSpeed` | `dynamic` | — |  |
| `shaderTime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L66)

<a id="function-function-mq3-renderer-tr-shade-runtime-r-drawelements-function-r-drawelements-indexes-primitives-compiledarrays-src-mq3-renderer-tr-shade-runtime-ml-1848368063"></a>
### R_DrawElements

```ml
function R_DrawElements(indexes, primitives, compiledArrays)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `indexes` | `dynamic` | — |  |
| `primitives` | `dynamic` | — |  |
| `compiledArrays` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L59)

<a id="function-function-mq3-renderer-tr-shade-runtime-r-drawstripelements-function-r-drawstripelements-indexes-src-mq3-renderer-tr-shade-runtime-ml-1432368720"></a>
### R_DrawStripElements

```ml
function R_DrawStripElements(indexes)
```

Preserve the original alternating winding test. Each returned list is one GL_TRIANGLE_STRIP and repeats three indexes when a new strip is required.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `indexes` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L40)

<a id="function-function-mq3-renderer-tr-shade-runtime-rb-beginsurface-function-rb-beginsurface-shader-fognum-floattime-src-mq3-renderer-tr-shade-runtime-ml-151994110"></a>
### RB_BeginSurface

```ml
function RB_BeginSurface(shader, fogNum, floatTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shader` | `dynamic` | — |  |
| `fogNum` | `dynamic` | — |  |
| `floatTime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L80)

<a id="function-function-mq3-renderer-tr-shade-runtime-rb-endsurface-function-rb-endsurface-surface-indexes-positions-normals-counters-debugsort-shadow-iteratorresult-showtris-shownormals-src-mq3-renderer-tr-shade-runtime-ml-849655512"></a>
### RB_EndSurface

```ml
function RB_EndSurface(surface, indexes, positions, normals, counters, debugSort, shadow, iteratorResult, showTris, showNormals)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — |  |
| `indexes` | `dynamic` | — |  |
| `positions` | `dynamic` | — |  |
| `normals` | `dynamic` | — |  |
| `counters` | `dynamic` | — |  |
| `debugSort` | `dynamic` | — |  |
| `shadow` | `dynamic` | — |  |
| `iteratorResult` | `dynamic` | — |  |
| `showTris` | `dynamic` | — |  |
| `showNormals` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L151)

<a id="function-function-mq3-renderer-tr-shade-runtime-rb-fogpass-function-rb-fogpass-positions-indexes-fog-vieworigin-forward-depthequal-src-mq3-renderer-tr-shade-runtime-ml-1690216243"></a>
### RB_FogPass

```ml
function RB_FogPass(positions, indexes, fog, viewOrigin, forward, depthEqual)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `positions` | `dynamic` | — |  |
| `indexes` | `dynamic` | — |  |
| `fog` | `dynamic` | — |  |
| `viewOrigin` | `dynamic` | — |  |
| `forward` | `dynamic` | — |  |
| `depthEqual` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L110)

<a id="function-function-mq3-renderer-tr-shade-runtime-rb-fogpassdraw-function-rb-fogpassdraw-batch-catalog-projection-src-mq3-renderer-tr-shade-runtime-ml-1434804018"></a>
### RB_FogPassDraw

```ml
function RB_FogPassDraw(batch, catalog, projection)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `catalog` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L115)

<a id="function-function-mq3-renderer-tr-shade-runtime-rb-iteratestagesgeneric-function-rb-iteratestagesgeneric-batch-projection-nowmilliseconds-lights-src-mq3-renderer-tr-shade-runtime-ml-670483398"></a>
### RB_IterateStagesGeneric

```ml
function RB_IterateStagesGeneric(batch, projection, nowMilliseconds, lights)
```

The retained renderer creates one StagePass per original shader stage. These entry points all submit those passes, dynamic lights and fog in original order through the productive rasterizer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `lights` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L146)

<a id="function-function-mq3-renderer-tr-shade-runtime-rb-stageiteratorgeneric-function-rb-stageiteratorgeneric-batch-projection-nowmilliseconds-lights-src-mq3-renderer-tr-shade-runtime-ml-848612208"></a>
### RB_StageIteratorGeneric

```ml
function RB_StageIteratorGeneric(batch, projection, nowMilliseconds, lights)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `lights` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L147)

<a id="function-function-mq3-renderer-tr-shade-runtime-rb-stageiteratorlightmappedmultitexture-function-rb-stageiteratorlightmappedmultitexture-batch-projection-nowmilliseconds-lights-src-mq3-renderer-tr-shade-runtime-ml-735482312"></a>
### RB_StageIteratorLightmappedMultitexture

```ml
function RB_StageIteratorLightmappedMultitexture(batch, projection, nowMilliseconds, lights)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `lights` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L149)

<a id="function-function-mq3-renderer-tr-shade-runtime-rb-stageiteratorvertexlittexture-function-rb-stageiteratorvertexlittexture-batch-projection-nowmilliseconds-lights-src-mq3-renderer-tr-shade-runtime-ml-55882452"></a>
### RB_StageIteratorVertexLitTexture

```ml
function RB_StageIteratorVertexLitTexture(batch, projection, nowMilliseconds, lights)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `projection` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `lights` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L148)

- [mq3.renderer.tr_shade_runtime.ShaderState](Type-mq3-renderer-tr-shade-runtime-shaderstate-448111234.md) — struct
<a id="constant-constant-mq3-renderer-tr-shade-runtime-ss-opaque-const-ss-opaque-3-src-mq3-renderer-tr-shade-runtime-ml-1877026478"></a>
### SS_OPAQUE

```ml
const SS_OPAQUE = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L14)

- [mq3.renderer.tr_shade_runtime.StripResult](Type-mq3-renderer-tr-shade-runtime-stripresult-1980259551.md) — struct
<a id="constant-constant-mq3-renderer-tr-shade-runtime-surf-nodlight-const-surf-nodlight-1024-src-mq3-renderer-tr-shade-runtime-ml-1337237680"></a>
### SURF_NODLIGHT

```ml
const SURF_NODLIGHT = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L13)

<a id="constant-constant-mq3-renderer-tr-shade-runtime-surf-sky-const-surf-sky-4-src-mq3-renderer-tr-shade-runtime-ml-761462231"></a>
### SURF_SKY

```ml
const SURF_SKY = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L12)

- [mq3.renderer.tr_shade_runtime.SurfaceState](Type-mq3-renderer-tr-shade-runtime-surfacestate-118560060.md) — struct
