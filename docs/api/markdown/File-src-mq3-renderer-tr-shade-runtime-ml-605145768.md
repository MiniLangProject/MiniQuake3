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

Evaluates per-vertex shader/entity color and optionally modulates it by the matching fog density.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_materials.stageColorAtEntity`. |
| `vertexColors` | `dynamic` | — | Indexed input read at `index`. |
| `entityColor` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.playable_materials.stageColorAtEntity`. |
| `positions` | `dynamic` | — | Indexed input read at `index`. |
| `viewOrigin` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.playable_materials.stageColorAtEntity`. |
| `nowMilliseconds` | `dynamic` | — | Argument 6 supplied to `mq3.renderer.playable_materials.stageColorAtEntity`. |
| `fogDensities` | `dynamic` | — | Indexed input read at `index`. |
| `fogAdjustment` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.playable_materials.modulateForFog`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L317)

<a id="function-function-mq3-renderer-tr-shade-runtime-computetexcoords-function-computetexcoords-stage-basecoords-lightmapcoords-positions-normals-vieworigin-entitytranslate-nowmilliseconds-fog-forward-src-mq3-renderer-tr-shade-runtime-ml-732385324"></a>
### ComputeTexCoords

```ml
function ComputeTexCoords(stage, baseCoords, lightmapCoords, positions, normals, viewOrigin, entityTranslate, nowMilliseconds, fog, forward)
```

Generates stage coordinates from texture, lightmap, vector, environment, or fog inputs and applies UV modifiers.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Record providing `stage.tcGen`. |
| `baseCoords` | `dynamic` | — | Indexed input read at `index`. |
| `lightmapCoords` | `dynamic` | — | Indexed input read at `index`. |
| `positions` | `dynamic` | — | Indexed input read at `index`. |
| `normals` | `dynamic` | — | Indexed input read at `index`. |
| `viewOrigin` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.playable_materials.environmentUV`. |
| `entityTranslate` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.playable_materials.transformUVEntityAt`. |
| `nowMilliseconds` | `dynamic` | — | Argument 6 supplied to `mq3.renderer.playable_materials.transformUVEntityAt`. |
| `fog` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_fog.coordinates`. |
| `forward` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.playable_fog.coordinates`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L338)

- [mq3.renderer.tr_shade_runtime.DebugPlan](Type-mq3-renderer-tr-shade-runtime-debugplan-116266896.md) — struct
- [mq3.renderer.tr_shade_runtime.DlightPass](Type-mq3-renderer-tr-shade-runtime-dlightpass-334056377.md) — struct
<a id="function-function-mq3-renderer-tr-shade-runtime-drawmultitextured-function-drawmultitextured-input-stage-lightmaponly-portal-src-mq3-renderer-tr-shade-runtime-ml-241927600"></a>
### DrawMultitextured

```ml
function DrawMultitextured(input, stage, lightmapOnly, portal)
```

Builds `mq3.renderer.tr_shade_runtime.MultiPlan` for `mq3.renderer.tr_shade_runtime.DrawMultitextured`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — | Record providing `input.shaderTime`, `input.numIndexes`. |
| `stage` | `dynamic` | — | Indexed input read at `0`, `1`. |
| `lightmapOnly` | `dynamic` | — | Input tested by `lightmapOnly`. |
| `portal` | `dynamic` | — | Initial value for `mq3.renderer.tr_shade_runtime.MultiPlan.portalFill`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L258)

<a id="function-function-mq3-renderer-tr-shade-runtime-drawnormals-function-drawnormals-positions-normals-src-mq3-renderer-tr-shade-runtime-ml-925628900"></a>
### DrawNormals

```ml
function DrawNormals(positions, normals)
```

Builds `mq3.renderer.tr_shade_runtime.DebugPlan` for `mq3.renderer.tr_shade_runtime.DrawNormals`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `positions` | `dynamic` | — | Indexed input read at `index`. |
| `normals` | `dynamic` | — | Indexed input read at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L236)

<a id="function-function-mq3-renderer-tr-shade-runtime-drawtris-function-drawtris-indexes-src-mq3-renderer-tr-shade-runtime-ml-1535947316"></a>
### DrawTris

```ml
function DrawTris(indexes)
```

Constructs `mq3.renderer.tr_shade_runtime.DebugPlan` with `mode` = `"triangles"`, `vertices` = `[]`, `depthNear` = `0.0`, `depthFar` = `0.0` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `indexes` | `dynamic` | — | Initial value for `mq3.renderer.tr_shade_runtime.DebugPlan.indexes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L232)

- [mq3.renderer.tr_shade_runtime.ElementPlan](Type-mq3-renderer-tr-shade-runtime-elementplan-2106441323.md) — struct
- [mq3.renderer.tr_shade_runtime.EndCounters](Type-mq3-renderer-tr-shade-runtime-endcounters-1607153664.md) — struct
- [mq3.renderer.tr_shade_runtime.EndResult](Type-mq3-renderer-tr-shade-runtime-endresult-338527604.md) — struct
<a id="function-function-mq3-renderer-tr-shade-runtime-fail-function-fail-message-src-mq3-renderer-tr-shade-runtime-ml-429312363"></a>
### fail

```ml
function fail(message)
```

Creates error `7791` with message `"tr_shade: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7791,"tr_shade: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L169)

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
| `positions` | `dynamic` | — | Sequence traversed as `position` while producing this result. |
| `indexes` | `dynamic` | — | Indexed input read at `i`, `i+1`, `i+2`. |
| `dlightBits` | `dynamic` | — | Input tested by `(dlightBits&(1<<lightIndex))==0`. |
| `lights` | `dynamic` | — | Indexed input read at `lightIndex`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L272)

<a id="function-function-mq3-renderer-tr-shade-runtime-projectdlighttexturedraw-function-projectdlighttexturedraw-batch-catalog-lights-projection-src-mq3-renderer-tr-shade-runtime-ml-1263201959"></a>
### ProjectDlightTextureDraw

```ml
function ProjectDlightTextureDraw(batch, catalog, lights, projection)
```

Calls `mq3.renderer.playable_dynamic_lights.draw` with `(batch,catalog,lights,projection)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_dynamic_lights.draw`. |
| `catalog` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.playable_dynamic_lights.draw`. |
| `lights` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.playable_dynamic_lights.draw`. |
| `projection` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.playable_dynamic_lights.draw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L288)

<a id="function-function-mq3-renderer-tr-shade-runtime-r-arrayelementdiscrete-function-r-arrayelementdiscrete-index-positions-colors-texture0-texture1-currenttmu-src-mq3-renderer-tr-shade-runtime-ml-1917650694"></a>
### R_ArrayElementDiscrete

```ml
function R_ArrayElementDiscrete(index, positions, colors, texture0, texture1, currentTmu)
```

R_ArrayElementDiscrete emits the currently selected texture-coordinate set, packed color and position for one array element.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Input tested by `index<0 or index>=len(positions) or index>=len(colors) or index>=len(texture0)`. |
| `positions` | `dynamic` | — | Indexed input read at `index`. |
| `colors` | `dynamic` | — | Indexed input read at `index`. |
| `texture0` | `dynamic` | — | Indexed input read at `index`. |
| `texture1` | `dynamic` | — | Indexed input read at `index`. |
| `currentTmu` | `dynamic` | — | Input tested by `currentTmu!=0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L179)

<a id="function-function-mq3-renderer-tr-shade-runtime-r-bindanimatedimage-function-r-bindanimatedimage-isvideo-slots-animationspeed-shadertime-src-mq3-renderer-tr-shade-runtime-ml-1126322477"></a>
### R_BindAnimatedImage

```ml
function R_BindAnimatedImage(isVideo, slots, animationSpeed, shaderTime)
```

Computes `R_BindAnimatedImage` from `slots[index%len(slots)]` using `mq3.compat.numeric.trunc32`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `isVideo` | `dynamic` | — | Input tested by `isVideo`. |
| `slots` | `dynamic` | — | Indexed input read at `0`, `index%len(slots)`. |
| `animationSpeed` | `dynamic` | — | Input used by `index=n.trunc32(shaderTime*animationSpeed*1024.0)`. |
| `shaderTime` | `dynamic` | — | Input used by `index=n.trunc32(shaderTime*animationSpeed*1024.0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L223)

<a id="function-function-mq3-renderer-tr-shade-runtime-r-drawelements-function-r-drawelements-indexes-primitives-compiledarrays-src-mq3-renderer-tr-shade-runtime-ml-1848368063"></a>
### R_DrawElements

```ml
function R_DrawElements(indexes, primitives, compiledArrays)
```

Builds `mq3.renderer.tr_shade_runtime.ElementPlan` for `mq3.renderer.tr_shade_runtime.R_DrawElements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `indexes` | `dynamic` | — | Value forwarded as `indexes` to `mq3.renderer.tr_shade_runtime.R_DrawStripElements`. |
| `primitives` | `dynamic` | — | Input used by `mode=primitives`. |
| `compiledArrays` | `dynamic` | — | Input tested by `mode==0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L211)

<a id="function-function-mq3-renderer-tr-shade-runtime-r-drawstripelements-function-r-drawstripelements-indexes-src-mq3-renderer-tr-shade-runtime-ml-1432368720"></a>
### R_DrawStripElements

```ml
function R_DrawStripElements(indexes)
```

Preserve the original alternating winding test. Each returned list is one GL_TRIANGLE_STRIP and repeats three indexes when a new strip is required.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `indexes` | `dynamic` | — | Indexed input read at `0`, `1`, `2`, `i`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L188)

<a id="function-function-mq3-renderer-tr-shade-runtime-rb-beginsurface-function-rb-beginsurface-shader-fognum-floattime-src-mq3-renderer-tr-shade-runtime-ml-151994110"></a>
### RB_BeginSurface

```ml
function RB_BeginSurface(shader, fogNum, floatTime)
```

Builds `mq3.renderer.tr_shade_runtime.SurfaceState` for `mq3.renderer.tr_shade_runtime.RB_BeginSurface`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shader` | `dynamic` | — | Record providing `shader.remappedShader`. |
| `fogNum` | `dynamic` | — | Initial value for `mq3.renderer.tr_shade_runtime.SurfaceState.fogNum`. |
| `floatTime` | `dynamic` | — | Input used by `shaderTime=floatTime-state.timeOffset`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L246)

<a id="function-function-mq3-renderer-tr-shade-runtime-rb-endsurface-function-rb-endsurface-surface-indexes-positions-normals-counters-debugsort-shadow-iteratorresult-showtris-shownormals-src-mq3-renderer-tr-shade-runtime-ml-849655512"></a>
### RB_EndSurface

```ml
function RB_EndSurface(surface, indexes, positions, normals, counters, debugSort, shadow, iteratorResult, showTris, showNormals)
```

Builds `mq3.renderer.tr_shade_runtime.EndResult` after updating `surface.numIndexes`, `surface.numVertexes`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `surface` | `dynamic` | — | Mutable record or buffer; this call updates `surface.numIndexes`, `surface.numVertexes`. |
| `indexes` | `dynamic` | — | Value forwarded as `indexes` to `mq3.renderer.tr_shade_runtime.DrawTris`. |
| `positions` | `dynamic` | — | Value forwarded as `positions` to `mq3.renderer.tr_shade_runtime.DrawNormals`. |
| `normals` | `dynamic` | — | Value forwarded as `normals` to `mq3.renderer.tr_shade_runtime.DrawNormals`. |
| `counters` | `dynamic` | — | Initial value for `mq3.renderer.tr_shade_runtime.EndResult.counters`. |
| `debugSort` | `dynamic` | — | Input tested by `debugSort!=0 and debugSort<surface.shader.sort`. |
| `shadow` | `dynamic` | — | Input tested by `shadow`. |
| `iteratorResult` | `dynamic` | — | Initial value for `mq3.renderer.tr_shade_runtime.EndResult.iteratorResult`. |
| `showTris` | `dynamic` | — | Input tested by `showTris`. |
| `showNormals` | `dynamic` | — | Input tested by `showNormals`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L392)

<a id="function-function-mq3-renderer-tr-shade-runtime-rb-fogpass-function-rb-fogpass-positions-indexes-fog-vieworigin-forward-depthequal-src-mq3-renderer-tr-shade-runtime-ml-1690216243"></a>
### RB_FogPass

```ml
function RB_FogPass(positions, indexes, fog, viewOrigin, forward, depthEqual)
```

Builds `mq3.renderer.tr_shade_runtime.FogPlan` using `mq3.renderer.playable_fog.coordinates`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `positions` | `dynamic` | — | Sequence traversed as `position` while producing this result. |
| `indexes` | `dynamic` | — | Initial value for `mq3.renderer.tr_shade_runtime.FogPlan.indexes`. |
| `fog` | `dynamic` | — | Record providing `fog.color`. |
| `viewOrigin` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.playable_fog.coordinates`. |
| `forward` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.playable_fog.coordinates`. |
| `depthEqual` | `dynamic` | — | Initial value for `mq3.renderer.tr_shade_runtime.FogPlan.depthEqual`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L297)

<a id="function-function-mq3-renderer-tr-shade-runtime-rb-fogpassdraw-function-rb-fogpassdraw-batch-catalog-projection-src-mq3-renderer-tr-shade-runtime-ml-1434804018"></a>
### RB_FogPassDraw

```ml
function RB_FogPassDraw(batch, catalog, projection)
```

Calls `mq3.renderer.playable_fog.draw` with `(batch,catalog,projection)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_fog.draw`. |
| `catalog` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.playable_fog.draw`. |
| `projection` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.playable_fog.draw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L306)

<a id="function-function-mq3-renderer-tr-shade-runtime-rb-iteratestagesgeneric-function-rb-iteratestagesgeneric-batch-projection-nowmilliseconds-lights-src-mq3-renderer-tr-shade-runtime-ml-670483398"></a>
### RB_IterateStagesGeneric

```ml
function RB_IterateStagesGeneric(batch, projection, nowMilliseconds, lights)
```

The retained renderer creates one StagePass per original shader stage. These entry points all submit those passes, dynamic lights and fog in original order through the productive rasterizer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`. |
| `projection` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`. |
| `nowMilliseconds` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`. |
| `lights` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L361)

<a id="function-function-mq3-renderer-tr-shade-runtime-rb-stageiteratorgeneric-function-rb-stageiteratorgeneric-batch-projection-nowmilliseconds-lights-src-mq3-renderer-tr-shade-runtime-ml-848612208"></a>
### RB_StageIteratorGeneric

```ml
function RB_StageIteratorGeneric(batch, projection, nowMilliseconds, lights)
```

Calls `mq3.renderer.playable_world_batch.drawMaterialsLit` with `(batch,projection,nowMilliseconds,lights)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`. |
| `projection` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`. |
| `nowMilliseconds` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`. |
| `lights` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L367)

<a id="function-function-mq3-renderer-tr-shade-runtime-rb-stageiteratorlightmappedmultitexture-function-rb-stageiteratorlightmappedmultitexture-batch-projection-nowmilliseconds-lights-src-mq3-renderer-tr-shade-runtime-ml-735482312"></a>
### RB_StageIteratorLightmappedMultitexture

```ml
function RB_StageIteratorLightmappedMultitexture(batch, projection, nowMilliseconds, lights)
```

Calls `mq3.renderer.playable_world_batch.drawMaterialsLit` with `(batch,projection,nowMilliseconds,lights)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`. |
| `projection` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`. |
| `nowMilliseconds` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`. |
| `lights` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L379)

<a id="function-function-mq3-renderer-tr-shade-runtime-rb-stageiteratorvertexlittexture-function-rb-stageiteratorvertexlittexture-batch-projection-nowmilliseconds-lights-src-mq3-renderer-tr-shade-runtime-ml-55882452"></a>
### RB_StageIteratorVertexLitTexture

```ml
function RB_StageIteratorVertexLitTexture(batch, projection, nowMilliseconds, lights)
```

Calls `mq3.renderer.playable_world_batch.drawMaterialsLit` with `(batch,projection,nowMilliseconds,lights)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`. |
| `projection` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`. |
| `nowMilliseconds` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`. |
| `lights` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.playable_world_batch.drawMaterialsLit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L373)

- [mq3.renderer.tr_shade_runtime.ShaderState](Type-mq3-renderer-tr-shade-runtime-shaderstate-448111234.md) — struct
<a id="constant-constant-mq3-renderer-tr-shade-runtime-ss-opaque-const-ss-opaque-3-src-mq3-renderer-tr-shade-runtime-ml-1877026478"></a>
### SS_OPAQUE

```ml
const SS_OPAQUE = 3
```

Shader sort order for opaque surfaces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L17)

- [mq3.renderer.tr_shade_runtime.StripResult](Type-mq3-renderer-tr-shade-runtime-stripresult-1980259551.md) — struct
<a id="constant-constant-mq3-renderer-tr-shade-runtime-surf-nodlight-const-surf-nodlight-1024-src-mq3-renderer-tr-shade-runtime-ml-1337237680"></a>
### SURF_NODLIGHT

```ml
const SURF_NODLIGHT = 1024
```

Surface flag preventing dynamic-light contributions on the material.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L15)

<a id="constant-constant-mq3-renderer-tr-shade-runtime-surf-sky-const-surf-sky-4-src-mq3-renderer-tr-shade-runtime-ml-761462231"></a>
### SURF_SKY

```ml
const SURF_SKY = 4
```

Surface flag identifying geometry handled by the sky renderer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_shade_runtime.ml#L13)

- [mq3.renderer.tr_shade_runtime.SurfaceState](Type-mq3-renderer-tr-shade-runtime-surfacestate-118560060.md) — struct
