# `src/mq3/renderer/playable_world_batch.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.playable_world_batch`](Package-mq3-renderer-playable-world-batch-671626911.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/platform/playable_multitexture.ml` as `multitexture` → [src/mq3/platform/playable_multitexture.ml](File-src-mq3-platform-playable-multitexture-ml-346016672.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/renderer/noise.ml` as `rendererNoise` → [src/mq3/renderer/noise.ml](File-src-mq3-renderer-noise-ml-139152771.md)
- `mq3/renderer/playable_dynamic_lights.ml` as `dynamicLights` → [src/mq3/renderer/playable_dynamic_lights.ml](File-src-mq3-renderer-playable-dynamic-lights-ml-229722941.md)
- `mq3/renderer/playable_fog.ml` as `playableFog` → [src/mq3/renderer/playable_fog.ml](File-src-mq3-renderer-playable-fog-ml-140703890.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)
- `mq3/renderer/shader_parser.ml` as `shaderParser` → [src/mq3/renderer/shader_parser.ml](File-src-mq3-renderer-shader-parser-ml-2114769074.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `std/ds/hashmap.ml` as `maps` → `../MiniLangCompilerML/std/ds/hashmap.ml` — external dependency
- `std/ds/list.ml` as `lists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency
- `std/sort.ml` as `sorting` → `../MiniLangCompilerML/std/sort.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-playable-world-batch-affinefor-function-affinefor-stage-nowmilliseconds-src-mq3-renderer-playable-world-batch-ml-1378956146"></a>
### affineFor

```ml
function affineFor(stage, nowMilliseconds)
```

Builds `result.tx`, `result.ty` in `mq3.renderer.playable_world_batch.affineFor`; returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Record providing `stage.uvMods`. |
| `nowMilliseconds` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.playable_materials.waveSample`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L598)

<a id="function-function-mq3-renderer-playable-world-batch-appendresolved-function-appendresolved-commands-triangle-baseslot-uselightmap-src-mq3-renderer-playable-world-batch-ml-925146760"></a>
### appendResolved

```ml
function appendResolved(commands, triangle, baseSlot, useLightmap)
```

Chooses base/lightmap slots and appends a resolved world triangle with appropriate vertex modulation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commands` | `dynamic` | — | Argument 1 supplied to `mq3.platform.playable_window.appendTriangleBatchPositionColored`. |
| `triangle` | `dynamic` | — | Record providing `triangle.vertices`. |
| `baseSlot` | `dynamic` | — | Argument 2 supplied to `mq3.platform.playable_window.appendTriangleBatchPositionColored`. |
| `useLightmap` | `dynamic` | — | Input tested by `useLightmap`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L192)

<a id="function-function-mq3-renderer-playable-world-batch-applyaffine-function-applyaffine-transform-as-uvaffine-uv-as-array-returns-array-src-mq3-renderer-playable-world-batch-ml-1875383722"></a>
### applyAffine

```ml
function applyAffine(transform as UvAffine, uv as array) returns array
```

Applies a 2-by-2 UV transform and translation to one texture-coordinate pair.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `transform` | `UvAffine` | — | Affine UV matrix and translation. |
| `uv` | `array` | — | Input U/V coordinate pair. |


**Returns:** The transformed [u, v] coordinate pair.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L618)

<a id="function-function-mq3-renderer-playable-world-batch-attachdynamiclights-function-attachdynamiclights-batch-renderdata-receiveflags-catalog-src-mq3-renderer-playable-world-batch-ml-142044639"></a>
### attachDynamicLights

```ml
function attachDynamicLights(batch, renderData, receiveFlags, catalog)
```

Updates `batch.dlightBatch`, `batch.dlightCatalog` in `mq3.renderer.playable_world_batch.attachDynamicLights`; returns `len(lightBatch.triangles)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Mutable record or buffer; this call updates `batch.dlightBatch`, `batch.dlightCatalog`. |
| `renderData` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_dynamic_lights.build`. |
| `receiveFlags` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.playable_dynamic_lights.build`. |
| `catalog` | `dynamic` | — | Value assigned to `batch.dlightCatalog`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L575)

<a id="function-function-mq3-renderer-playable-world-batch-attachdynamiclightsoriented-function-attachdynamiclightsoriented-batch-renderdata-receiveflags-catalog-origins-axes-bounds-src-mq3-renderer-playable-world-batch-ml-1774947484"></a>
### attachDynamicLightsOriented

```ml
function attachDynamicLightsOriented(batch, renderData, receiveFlags, catalog, origins, axes, bounds)
```

Updates `batch.dlightBatch`, `batch.dlightCatalog` in `mq3.renderer.playable_world_batch.attachDynamicLightsOriented`; returns `len(lightBatch.triangles)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Mutable record or buffer; this call updates `batch.dlightBatch`, `batch.dlightCatalog`. |
| `renderData` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_dynamic_lights.buildOriented`. |
| `receiveFlags` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.playable_dynamic_lights.buildOriented`. |
| `catalog` | `dynamic` | — | Value assigned to `batch.dlightCatalog`. |
| `origins` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.playable_dynamic_lights.buildOriented`. |
| `axes` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.playable_dynamic_lights.buildOriented`. |
| `bounds` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.playable_dynamic_lights.buildOriented`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L587)

<a id="function-function-mq3-renderer-playable-world-batch-attachfog-function-attachfog-batch-renderdata-catalog-src-mq3-renderer-playable-world-batch-ml-1408784339"></a>
### attachFog

```ml
function attachFog(batch, renderData, catalog)
```

Updates `batch.fogBatch`, `batch.fogCatalog` in `mq3.renderer.playable_world_batch.attachFog`; returns `fogBatch.commands.count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Mutable record or buffer; this call updates `batch.fogBatch`, `batch.fogCatalog`. |
| `renderData` | `dynamic` | — | Record providing `renderData.triangles`. |
| `catalog` | `dynamic` | — | Value assigned to `batch.fogCatalog`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L561)

<a id="function-function-mq3-renderer-playable-world-batch-autosprite2quad-function-autosprite2quad-pass-triangleindex-forward-src-mq3-renderer-playable-world-batch-ml-1887203224"></a>
### autosprite2Quad

```ml
function autosprite2Quad(pass, triangleIndex, forward)
```

Autosprite2Deform keeps the long axis fixed and rotates only the two short edges toward the view. Source indexes preserve Quake's directed-edge test.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pass` | `dynamic` | — | Record providing `pass.commands`, `pass.sourceIndexes`, `pass.sourcePositions`. |
| `triangleIndex` | `dynamic` | — | Input used by `first=triangleIndex-triangleIndex%2`. |
| `forward` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L702)

<a id="function-function-mq3-renderer-playable-world-batch-autospritecorner-function-autospritecorner-triangleindex-as-int-vertex-as-int-returns-int-src-mq3-renderer-playable-world-batch-ml-803813818"></a>
### autospriteCorner

```ml
function autospriteCorner(triangleIndex as int, vertex as int) returns int
```

Maps a triangle-local vertex onto one of four autosprite quad corners using triangle parity.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `triangleIndex` | `int` | — | Triangle index; parity selects the first or second quad triangle. |
| `vertex` | `int` | — | Triangle-local vertex selector, normally 0, 1, or 2. |


**Returns:** Quad corner from [0,1,3] for even triangles or [3,1,2] for odd triangles.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L683)

<a id="function-function-mq3-renderer-playable-world-batch-autospritequad-function-autospritequad-pass-triangleindex-leftdir-updir-src-mq3-renderer-playable-world-batch-ml-1377053455"></a>
### autospriteQuad

```ml
function autospriteQuad(pass, triangleIndex, leftDir, upDir)
```

AutospriteDeform rebuilds each independent pair of triangles as one square whose left/up axes follow the view. BSP extraction expands indexes, so the four original corners are recovered from each consecutive triangle pair.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pass` | `dynamic` | — | Record providing `pass.commands`, `pass.sourcePositions`. |
| `triangleIndex` | `dynamic` | — | Input used by `first=triangleIndex-triangleIndex%2`. |
| `leftDir` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `upDir` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L667)

<a id="function-function-mq3-renderer-playable-world-batch-autospriteuv-function-autospriteuv-triangleindex-vertex-src-mq3-renderer-playable-world-batch-ml-1964574270"></a>
### autospriteUV

```ml
function autospriteUV(triangleIndex, vertex)
```

Returns `[[0.0,1.0],[1.0,0.0],[1.0,1.0]][vertex]` from `mq3.renderer.playable_world_batch.autospriteUV`; earlier branches return `[[0.0,0.0],[1.0,0.0],[0.0,1.0]][vertex]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `triangleIndex` | `dynamic` | — | Input tested by `triangleIndex%2==0`. |
| `vertex` | `dynamic` | — | Input tested by `triangleIndex%2==0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L690)

- [mq3.renderer.playable_world_batch.Batch](Type-mq3-renderer-playable-world-batch-batch-1905366517.md) — struct
<a id="function-function-mq3-renderer-playable-world-batch-build-function-build-renderdata-materialslots-skytextureflags-src-mq3-renderer-playable-world-batch-ml-13370115"></a>
### build

```ml
function build(renderData, materialSlots, skyTextureFlags)
```

Compatibility builder: byte layout and single submission remain unchanged.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `renderData` | `dynamic` | — | Record providing `renderData.triangles`. |
| `materialSlots` | `dynamic` | — | Indexed input read at `triangle.textureIndex`. |
| `skyTextureFlags` | `dynamic` | — | Value forwarded as `flags` to `mq3.renderer.playable_world_batch.isSky`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L203)

<a id="function-function-mq3-renderer-playable-world-batch-buildmaterials-function-buildmaterials-renderdata-catalog-skytextureflags-src-mq3-renderer-playable-world-batch-ml-930560880"></a>
### buildMaterials

```ml
function buildMaterials(renderData, catalog, skyTextureFlags)
```

Static opaque primaries stay in the bit-identical base stream. Dynamic and supported blended stages become retained passes with their source UVs.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `renderData` | `dynamic` | — | Record providing `renderData.triangles`. |
| `catalog` | `dynamic` | — | Record providing `catalog.materials`. |
| `skyTextureFlags` | `dynamic` | — | Value forwarded as `flags` to `mq3.renderer.playable_world_batch.groupedTriangles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L457)

<a id="function-function-mq3-renderer-playable-world-batch-buildstagepass-function-buildstagepass-renderdata-material-stage-primary-depthequal-flags-src-mq3-renderer-playable-world-batch-ml-395295605"></a>
### buildStagePass

```ml
function buildStagePass(renderData, material, stage, primary, depthEqual, flags)
```

Computes `buildStagePass` from `buildStagePassTriangles(triangles,material,stage,primary,depthEqual,vertexIndexScratch())` using `mq3.renderer.playable_world_batch.isSky`, `mq3.renderer.playable_world_batch.buildStagePassTriangles`, `mq3.renderer.playable_world_batch.vertexIndexScratch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `renderData` | `dynamic` | — | Record providing `renderData.triangles`. |
| `material` | `dynamic` | — | Record providing `material.textureIndex`. |
| `stage` | `dynamic` | — | Value forwarded as `stage` to `mq3.renderer.playable_world_batch.buildStagePassTriangles`. |
| `primary` | `dynamic` | — | Value forwarded as `primary` to `mq3.renderer.playable_world_batch.buildStagePassTriangles`. |
| `depthEqual` | `dynamic` | — | Value forwarded as `depthEqual` to `mq3.renderer.playable_world_batch.buildStagePassTriangles`. |
| `flags` | `dynamic` | — | Value forwarded as `flags` to `mq3.renderer.playable_world_batch.isSky`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L423)

<a id="function-function-mq3-renderer-playable-world-batch-buildstagepasstriangles-function-buildstagepasstriangles-triangles-material-stage-primary-depthequal-indexscratch-src-mq3-renderer-playable-world-batch-ml-1988558213"></a>
### buildStagePassTriangles

```ml
function buildStagePassTriangles(triangles, material, stage, primary, depthEqual, indexScratch)
```

Builds `mq3.renderer.playable_world_batch.StagePass` after updating `sourceUvs[outputIndex]`, `sourcePositions[outputIndex]`, `sourceIndexes[outputIndex]`, `sourceDeformUvs[outputIndex]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `triangles` | `dynamic` | — | Sequence traversed as `triangle` while producing this result. |
| `material` | `dynamic` | — | Record providing `material.deforms`, `material.stages`, `material.textureIndex`, `material.sort`, `material.polygonOffset`, `material.timeOffset`. |
| `stage` | `dynamic` | — | Initial value for `mq3.renderer.playable_world_batch.StagePass.stage`. |
| `primary` | `dynamic` | — | Initial value for `mq3.renderer.playable_world_batch.StagePass.primary`. |
| `depthEqual` | `dynamic` | — | Initial value for `mq3.renderer.playable_world_batch.StagePass.depthEqual`. |
| `indexScratch` | `dynamic` | — | Value forwarded as `scratch` to `mq3.renderer.playable_world_batch.createVertexCacheWithScratch`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L384)

<a id="function-function-mq3-renderer-playable-world-batch-contains-function-contains-values-as-array-wanted-as-int-returns-bool-src-mq3-renderer-playable-world-batch-ml-1927507642"></a>
### contains

```ml
function contains(values as array, wanted as int) returns bool
```

Tests whether an integer occurs in the supplied array.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `array` | — | Integer array to search in iteration order. |
| `wanted` | `int` | — | Integer value to find. |


**Returns:** True when any array element equals wanted; false otherwise.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L237)

<a id="function-function-mq3-renderer-playable-world-batch-containsposition-function-containsposition-values-wanted-src-mq3-renderer-playable-world-batch-ml-679283887"></a>
### containsPosition

```ml
function containsPosition(values, wanted)
```

Returns `false` from `mq3.renderer.playable_world_batch.containsPosition`; earlier branches return `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Sequence traversed as `value` while producing this result. |
| `wanted` | `dynamic` | — | Input used by `for each value in values if value==wanted then return true`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L633)

<a id="function-function-mq3-renderer-playable-world-batch-countstagetriangles-function-countstagetriangles-renderdata-textureindex-flags-src-mq3-renderer-playable-world-batch-ml-52229624"></a>
### countStageTriangles

```ml
function countStageTriangles(renderData, textureIndex, flags)
```

Returns `count` from `mq3.renderer.playable_world_batch.countStageTriangles`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `renderData` | `dynamic` | — | Record providing `renderData.triangles`. |
| `textureIndex` | `dynamic` | — | Input used by `for each triangle in renderData.triangles if triangle.textureIndex==textureIndex and not isSky(triangle,flags) then count=count+1`. |
| `flags` | `dynamic` | — | Value forwarded as `flags` to `mq3.renderer.playable_world_batch.isSky`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L292)

<a id="function-function-mq3-renderer-playable-world-batch-createvertexcache-function-createvertexcache-sourceindexes-src-mq3-renderer-playable-world-batch-ml-148825539"></a>
### createVertexCache

```ml
function createVertexCache(sourceIndexes)
```

Calls `mq3.renderer.playable_world_batch.createVertexCacheWithScratch` with `(sourceIndexes,vertexIndexScratch())` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sourceIndexes` | `dynamic` | — | Value forwarded as `sourceIndexes` to `mq3.renderer.playable_world_batch.createVertexCacheWithScratch`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L361)

<a id="function-function-mq3-renderer-playable-world-batch-createvertexcachewithscratch-function-createvertexcachewithscratch-sourceindexes-scratch-src-mq3-renderer-playable-world-batch-ml-553697777"></a>
### createVertexCacheWithScratch

```ml
function createVertexCacheWithScratch(sourceIndexes, scratch)
```

Builds `mq3.renderer.playable_world_batch.VertexCache` after updating `scratch.visited`, `scratch.slots`, `scratch.serial`, `scratch.visited[sourceIndex]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sourceIndexes` | `dynamic` | — | Sequence traversed as `triangle` while producing this result. |
| `scratch` | `dynamic` | — | Mutable record or buffer; this call updates `scratch.visited`, `scratch.slots`, `scratch.serial`, `scratch.visited[sourceIndex]`, `scratch.slots[sourceIndex]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L318)

<a id="function-function-mq3-renderer-playable-world-batch-deformednormal-function-deformednormal-position-normal-deforms-nowmilliseconds-noise-src-mq3-renderer-playable-world-batch-ml-564800094"></a>
### deformedNormal

```ml
function deformedNormal(position, normal, deforms, nowMilliseconds, noise)
```

Builds `result[0]`, `result[1]`, `result[2]` in `mq3.renderer.playable_world_batch.deformedNormal`; returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `normal` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `deforms` | `dynamic` | — | Sequence traversed as `deform` while producing this result. |
| `nowMilliseconds` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.f32`. |
| `noise` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.noise.get4f`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L762)

<a id="function-function-mq3-renderer-playable-world-batch-deformedposition-function-deformedposition-position-normal-uv-deforms-nowmilliseconds-src-mq3-renderer-playable-world-batch-ml-1390023845"></a>
### deformedPosition

```ml
function deformedPosition(position, normal, uv, deforms, nowMilliseconds)
```

Computes `deformedPosition` from `[position[0],position[1],position[2]]` using `mq3.renderer.playable_materials.waveSampleOffset`, `mq3.renderer.playable_materials.waveSample`, `mq3.renderer.shader_parser.Wave`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `normal` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `uv` | `dynamic` | — | Indexed input read at `0`. |
| `deforms` | `dynamic` | — | Sequence traversed as `deform` while producing this result. |
| `nowMilliseconds` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.playable_materials.waveSampleOffset`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L740)

<a id="function-function-mq3-renderer-playable-world-batch-draw-function-draw-batch-projection-src-mq3-renderer-playable-world-batch-ml-1848115505"></a>
### draw

```ml
function draw(batch, projection)
```

Returns `window.submitWorldTriangleBatch(batch.commands,projection)` from `mq3.renderer.playable_world_batch.draw`; earlier branches return `fail("missing batch")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Record providing `batch.commands`. |
| `projection` | `dynamic` | — | Argument 2 supplied to `mq3.platform.playable_window.submitWorldTriangleBatch`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L217)

<a id="function-function-mq3-renderer-playable-world-batch-drawmaterials-function-drawmaterials-batch-projection-nowmilliseconds-src-mq3-renderer-playable-world-batch-ml-1192077807"></a>
### drawMaterials

```ml
function drawMaterials(batch, projection, nowMilliseconds)
```

Calls `mq3.renderer.playable_world_batch.drawMaterialsLitTarget` with `(batch,projection,nowMilliseconds,[],void)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Value forwarded as `batch` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`. |
| `projection` | `dynamic` | — | Value forwarded as `projection` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L933)

<a id="function-function-mq3-renderer-playable-world-batch-drawmaterialslit-function-drawmaterialslit-batch-projection-nowmilliseconds-lights-src-mq3-renderer-playable-world-batch-ml-1546989170"></a>
### drawMaterialsLit

```ml
function drawMaterialsLit(batch, projection, nowMilliseconds, lights)
```

Calls `mq3.renderer.playable_world_batch.drawMaterialsLitTarget` with `(batch,projection,nowMilliseconds,lights,void)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Value forwarded as `batch` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`. |
| `projection` | `dynamic` | — | Value forwarded as `projection` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`. |
| `lights` | `dynamic` | — | Value forwarded as `lights` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L928)

<a id="function-function-mq3-renderer-playable-world-batch-drawmaterialslittarget-function-drawmaterialslittarget-batch-projection-nowmilliseconds-lights-area-src-mq3-renderer-playable-world-batch-ml-776668523"></a>
### drawMaterialsLitTarget

```ml
function drawMaterialsLitTarget(batch, projection, nowMilliseconds, lights, area)
```

Draws opaque base geometry and ordered shader passes, inserting dynamic lighting and applying view-dependent fog.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Record providing `batch.base`, `batch.passes`, `batch.dlightBatch`, `batch.dlightCatalog`, `batch.fogCatalog`, `batch.fogBatch`. |
| `projection` | `dynamic` | — | Record providing `projection.position`, `projection.right`, `projection.up`. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_world_batch.updatePassAxesFog`. |
| `lights` | `dynamic` | — | Argument 3 supplied to `mq3.renderer.playable_dynamic_lights.draw`. |
| `area` | `dynamic` | — | Argument 3 supplied to `mq3.platform.playable_window.submitWorldTriangleBatchViewport`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L909)

<a id="function-function-mq3-renderer-playable-world-batch-drawmaterialslitviewport-function-drawmaterialslitviewport-batch-projection-nowmilliseconds-lights-area-src-mq3-renderer-playable-world-batch-ml-1054479403"></a>
### drawMaterialsLitViewport

```ml
function drawMaterialsLitViewport(batch, projection, nowMilliseconds, lights, area)
```

Calls `mq3.renderer.playable_world_batch.drawMaterialsLitTarget` with `(batch,projection,nowMilliseconds,lights,area)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Value forwarded as `batch` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`. |
| `projection` | `dynamic` | — | Value forwarded as `projection` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`. |
| `lights` | `dynamic` | — | Value forwarded as `lights` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`. |
| `area` | `dynamic` | — | Value forwarded as `area` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L940)

<a id="function-function-mq3-renderer-playable-world-batch-drawmaterialsviewport-function-drawmaterialsviewport-batch-projection-nowmilliseconds-area-src-mq3-renderer-playable-world-batch-ml-1463560006"></a>
### drawMaterialsViewport

```ml
function drawMaterialsViewport(batch, projection, nowMilliseconds, area)
```

Calls `mq3.renderer.playable_world_batch.drawMaterialsLitTarget` with `(batch,projection,nowMilliseconds,[],area)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Value forwarded as `batch` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`. |
| `projection` | `dynamic` | — | Value forwarded as `projection` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`. |
| `area` | `dynamic` | — | Value forwarded as `area` to `mq3.renderer.playable_world_batch.drawMaterialsLitTarget`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L946)

<a id="function-function-mq3-renderer-playable-world-batch-dynamicmaterialstage-function-dynamicmaterialstage-material-stage-src-mq3-renderer-playable-world-batch-ml-1912916429"></a>
### dynamicMaterialStage

```ml
function dynamicMaterialStage(material, stage)
```

Computes `material.polygonOffset or len(material.deforms)>0 or dynamicStage(stage)` for `mq3.renderer.playable_world_batch.dynamicMaterialStage`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `material` | `dynamic` | — | Record providing `material.polygonOffset`, `material.deforms`. |
| `stage` | `dynamic` | — | Value forwarded as `stage` to `mq3.renderer.playable_world_batch.dynamicStage`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L229)

<a id="function-function-mq3-renderer-playable-world-batch-dynamicstage-function-dynamicstage-stage-src-mq3-renderer-playable-world-batch-ml-1065626246"></a>
### dynamicStage

```ml
function dynamicStage(stage)
```

Detects shader stages that require dynamic handling because of lightmaps, animation, UV/color generation, or render state.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Record providing `stage.bspLightmap`, `stage.clampTexture`, `stage.depthWrite`, `stage.depthEqual`, `stage.slots`, `stage.uvMods`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L225)

<a id="function-function-mq3-renderer-playable-world-batch-edgevertices-function-edgevertices-index-src-mq3-renderer-playable-world-batch-ml-1571333844"></a>
### edgeVertices

```ml
function edgeVertices(index)
```

Returns `[2,3]` from `mq3.renderer.playable_world_batch.edgeVertices`; earlier branches return `[0,1]`, `[0,2]`, `[0,3]`, and 2 further fields.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Tetrahedron-edge selector: 0..4 select the first five pairs; other values select [2,3]. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L693)

<a id="function-function-mq3-renderer-playable-world-batch-fail-function-fail-text-src-mq3-renderer-playable-world-batch-ml-1564841641"></a>
### fail

```ml
function fail(text)
```

Creates error `7490` with message `"playable world batch: "+text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Input used in the result expression `error(7490,"playable world batch: "+text)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L173)

<a id="function-function-mq3-renderer-playable-world-batch-fillmaterialbase-function-fillmaterialbase-base-renderdata-lookup-skytextureflags-src-mq3-renderer-playable-world-batch-ml-125989610"></a>
### fillMaterialBase

```ml
function fillMaterialBase(base, renderData, lookup, skyTextureFlags)
```

BSP and MD3 triangles typically arrive in material runs. Resolve the opaque primary once per run and keep the original submission order.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `base` | `dynamic` | — | Value forwarded as `commands` to `mq3.renderer.playable_world_batch.appendResolved`. |
| `renderData` | `dynamic` | — | Record providing `renderData.triangles`. |
| `lookup` | `dynamic` | — | Indexed input read at `texture`. |
| `skyTextureFlags` | `dynamic` | — | Value forwarded as `flags` to `mq3.renderer.playable_world_batch.isSky`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L434)

<a id="function-function-mq3-renderer-playable-world-batch-groupedtriangles-function-groupedtriangles-renderdata-flags-count-src-mq3-renderer-playable-world-batch-ml-1779176292"></a>
### groupedTriangles

```ml
function groupedTriangles(renderData, flags, count)
```

Builds `sizes[triangle.textureIndex]`, `result[index]`, `offsets[index]` in `mq3.renderer.playable_world_batch.groupedTriangles`; returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `renderData` | `dynamic` | — | Record providing `renderData.triangles`. |
| `flags` | `dynamic` | — | Value forwarded as `flags` to `mq3.renderer.playable_world_batch.isSky`. |
| `count` | `dynamic` | — | Argument 1 supplied to `array`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L305)

<a id="function-function-mq3-renderer-playable-world-batch-hasdeform-function-hasdeform-deforms-as-array-kind-as-string-returns-bool-src-mq3-renderer-playable-world-batch-ml-705133687"></a>
### hasDeform

```ml
function hasDeform(deforms as array, kind as string) returns bool
```

Tests whether any deformation in the sequence has the requested kind.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `deforms` | `array` | — | Deformation records to inspect. |
| `kind` | `string` | — | Exact deformation kind to match. |


**Returns:** True when a matching deformation exists; false otherwise.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L629)

<a id="function-function-mq3-renderer-playable-world-batch-hasentitytranslate-function-hasentitytranslate-stage-src-mq3-renderer-playable-world-batch-ml-1921778762"></a>
### hasEntityTranslate

```ml
function hasEntityTranslate(stage)
```

Returns `false` from `mq3.renderer.playable_world_batch.hasEntityTranslate`; earlier branches return `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Record providing `stage.uvMods`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L624)

<a id="function-function-mq3-renderer-playable-world-batch-hasturbulence-function-hasturbulence-stage-src-mq3-renderer-playable-world-batch-ml-1090867404"></a>
### hasTurbulence

```ml
function hasTurbulence(stage)
```

Returns `false` from `mq3.renderer.playable_world_batch.hasTurbulence`; earlier branches return `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Record providing `stage.uvMods`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L621)

<a id="function-function-mq3-renderer-playable-world-batch-identityaffine-function-identityaffine-returns-uvaffine-src-mq3-renderer-playable-world-batch-ml-500823941"></a>
### identityAffine

```ml
function identityAffine() returns UvAffine
```

Constructs `mq3.renderer.playable_world_batch.UvAffine` with `m00` = `1.0`, `m01` = `0.0`, `m10` = `0.0`, `m11` = `1.0` and the supplied remaining values.


**Returns:** The value `UvAffine(1.0,0.0,0.0,1.0,0.0,0.0)`.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L594)

<a id="function-function-mq3-renderer-playable-world-batch-issky-inline-function-issky-triangle-flags-as-array-returns-bool-src-mq3-renderer-playable-world-batch-ml-2043046492"></a>
### isSky

```ml
inline function isSky(triangle, flags as array) returns bool
```

Checks that a triangle texture index is in range and marked as sky in the texture-flag table.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `triangle` | `dynamic` | — | Triangle carrying the texture index to classify. |
| `flags` | `array` | — | Boolean sky flags indexed by texture number. |


**Returns:** True only for an in-range texture index whose sky flag is set.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L181)

- [mq3.renderer.playable_world_batch.MaterialBatch](Type-mq3-renderer-playable-world-batch-materialbatch-2042443654.md) — struct
<a id="function-function-mq3-renderer-playable-world-batch-materialbefore-function-materialbefore-left-right-src-mq3-renderer-playable-world-batch-ml-1805883409"></a>
### materialBefore

```ml
function materialBefore(left, right)
```

Computes `left.sort<right.sort or (left.sort==right.sort and left.textureIndex<right.textureIndex)` for `mq3.renderer.playable_world_batch.materialBefore`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Record providing `left.sort`, `left.textureIndex`. |
| `right` | `dynamic` | — | Record providing `right.sort`, `right.textureIndex`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L241)

<a id="function-function-mq3-renderer-playable-world-batch-materialfor-function-materialfor-catalog-textureindex-src-mq3-renderer-playable-world-batch-ml-1077792682"></a>
### materialFor

```ml
function materialFor(catalog, textureIndex)
```

Returns `void` from `mq3.renderer.playable_world_batch.materialFor`; earlier branches return `void`, `material`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Record providing `catalog.materials`. |
| `textureIndex` | `dynamic` | — | Input used by `for each material in catalog.materials if material.textureIndex==textureIndex then return material`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L222)

<a id="function-function-mq3-renderer-playable-world-batch-materialtable-function-materialtable-renderdata-catalog-src-mq3-renderer-playable-world-batch-ml-53648789"></a>
### materialTable

```ml
function materialTable(renderData, catalog)
```

Builds `result[material.textureIndex]` in `mq3.renderer.playable_world_batch.materialTable`; returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `renderData` | `dynamic` | — | Record providing `renderData.triangles`. |
| `catalog` | `dynamic` | — | Record providing `catalog.materials`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L296)

<a id="function-function-mq3-renderer-playable-world-batch-materialusesbsplightmap-function-materialusesbsplightmap-material-src-mq3-renderer-playable-world-batch-ml-2086389251"></a>
### materialUsesBspLightmap

```ml
function materialUsesBspLightmap(material)
```

Returns `false` from `mq3.renderer.playable_world_batch.materialUsesBspLightmap`; earlier branches return `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `material` | `dynamic` | — | Record providing `material.stages`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L232)

<a id="constant-constant-mq3-renderer-playable-world-batch-max-bsp-lightmaps-const-max-bsp-lightmaps-256-src-mq3-renderer-playable-world-batch-ml-508877450"></a>
### MAX_BSP_LIGHTMAPS

```ml
const MAX_BSP_LIGHTMAPS = 256
```

Maximum number of BSP lightmaps retained for material preparation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L183)

<a id="function-function-mq3-renderer-playable-world-batch-packedspecularnormals-function-packedspecularnormals-sourcenormals-src-mq3-renderer-playable-world-batch-ml-1331244169"></a>
### packedSpecularNormals

```ml
function packedSpecularNormals(sourceNormals)
```

Calls `mq3.renderer.playable_world_batch.packSpecularNormalsInto` with `(sourceNormals,bytes(len(sourceNormals)*36,0))` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sourceNormals` | `dynamic` | — | Value forwarded as `sourceNormals` to `mq3.renderer.playable_world_batch.packSpecularNormalsInto`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L376)

<a id="function-function-mq3-renderer-playable-world-batch-packspecularnormalsinto-function-packspecularnormalsinto-sourcenormals-packed-src-mq3-renderer-playable-world-batch-ml-843896211"></a>
### packSpecularNormalsInto

```ml
function packSpecularNormalsInto(sourceNormals, packed)
```

Packs three float32 normals per triangle into 36-byte records for native specular updates.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `sourceNormals` | `dynamic` | — | Nested indexed data; outer entries read at `triangle`. |
| `packed` | `dynamic` | — | Argument 1 supplied to `mq3.platform.playable_window.writeBatchF32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L365)

<a id="function-function-mq3-renderer-playable-world-batch-passchanges-function-passchanges-pass-fogcatalog-src-mq3-renderer-playable-world-batch-ml-1493992092"></a>
### passChanges

```ml
function passChanges(pass, fogCatalog)
```

A retained pass exists for render-state reasons as well as for changing vertex data.  Blend, alpha-test, clamp, depth and polygon-offset state do not require MiniLang to rewrite every vertex every frame.  Keep those command bytes until topology/source data changes; animated, view-dependent and fog-modulated passes continue through the exact Quake update path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pass` | `dynamic` | — | Record providing `pass.stage`, `pass.deforms`. |
| `fogCatalog` | `dynamic` | — | Input used in the result expression `fogCatalog!=void and passHasFog(pass)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L648)

<a id="function-function-mq3-renderer-playable-world-batch-passhasfog-function-passhasfog-pass-src-mq3-renderer-playable-world-batch-ml-516851215"></a>
### passHasFog

```ml
function passHasFog(pass)
```

Returns `false` from `mq3.renderer.playable_world_batch.passHasFog`; earlier branches return `false`, `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pass` | `dynamic` | — | Record providing `pass.fogAdjustment`, `pass.fogIndexes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L636)

<a id="function-function-mq3-renderer-playable-world-batch-refreshmaterials-function-refreshmaterials-batch-renderdata-catalog-skytextureflags-src-mq3-renderer-playable-world-batch-ml-1495440422"></a>
### refreshMaterials

```ml
function refreshMaterials(batch, renderData, catalog, skyTextureFlags)
```

Updates `batch.base`, `batch.sourceTriangles`, `batch.drawableTriangles`, `batch.emittedTriangles`, `batch.skippedSky` in `mq3.renderer.playable_world_batch.refreshMaterials`; returns `batch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — | Mutable record or buffer; this call updates `batch.base`, `batch.sourceTriangles`, `batch.drawableTriangles`, `batch.emittedTriangles`, `batch.skippedSky`. |
| `renderData` | `dynamic` | — | Record providing `renderData.triangles`. |
| `catalog` | `dynamic` | — | Record providing `catalog.materials`. |
| `skyTextureFlags` | `dynamic` | — | Value forwarded as `flags` to `mq3.renderer.playable_world_batch.isSky`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L528)

<a id="function-function-mq3-renderer-playable-world-batch-refreshstagepass-function-refreshstagepass-pass-renderdata-src-mq3-renderer-playable-world-batch-ml-2061349663"></a>
### refreshStagePass

```ml
function refreshStagePass(pass, renderData)
```

Refreshes a retained material batch when triangle/material topology is unchanged.  The byte buffers and nested source arrays keep their storage; callers fall back to buildMaterials when this returns false.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pass` | `dynamic` | — | Mutable record or buffer; this call updates `pass.commands`, `pass.initialized`, `pass.sourceUvs[outputIndex][0]`, `pass.sourceUvs[outputIndex][1]`, `pass.sourceUvs[outputIndex][2]`. |
| `renderData` | `dynamic` | — | Record providing `renderData.triangles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L496)

<a id="function-function-mq3-renderer-playable-world-batch-releasematerials-function-releasematerials-catalog-src-mq3-renderer-playable-world-batch-ml-1958158671"></a>
### releaseMaterials

```ml
function releaseMaterials(catalog)
```

Computes `releaseMaterials` from `len(released)` using `mq3.renderer.playable_world_batch.contains`, `mq3.platform.playable_window.releaseTexture`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Record providing `catalog.materials`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L276)

<a id="function-function-mq3-renderer-playable-world-batch-resolvedlightmapslot-function-resolvedlightmapslot-triangle-src-mq3-renderer-playable-world-batch-ml-52268542"></a>
### resolvedLightmapSlot

```ml
function resolvedLightmapSlot(triangle)
```

Returns `slot` from `mq3.renderer.playable_world_batch.resolvedLightmapSlot`; earlier branches return `-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `triangle` | `dynamic` | — | Record providing `triangle.lightmapIndex`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L186)

<a id="function-function-mq3-renderer-playable-world-batch-sortedmaterials-function-sortedmaterials-values-src-mq3-renderer-playable-world-batch-ml-1548489570"></a>
### sortedMaterials

```ml
function sortedMaterials(values)
```

Returns `result` from `mq3.renderer.playable_world_batch.sortedMaterials`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Argument 3 supplied to `copyArray`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L244)

<a id="function-function-mq3-renderer-playable-world-batch-specularalpha-function-specularalpha-position-normal-vieworigin-src-mq3-renderer-playable-world-batch-ml-514220667"></a>
### specularAlpha

```ml
function specularAlpha(position, normal, viewOrigin)
```

RB_CalcSpecularAlpha keeps this hard-coded light origin in the original renderer and raises the reflected view coefficient to the fourth power.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |
| `normal` | `dynamic` | — | Argument 1 supplied to `mq3.shared.math.DotProduct`. |
| `viewOrigin` | `dynamic` | — | Three-component vector read at indices 0, 1, and 2. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L781)

- [mq3.renderer.playable_world_batch.StagePass](Type-mq3-renderer-playable-world-batch-stagepass-972420306.md) — struct
<a id="function-function-mq3-renderer-playable-world-batch-updatepass-function-updatepass-pass-nowmilliseconds-src-mq3-renderer-playable-world-batch-ml-1332761149"></a>
### updatePass

```ml
function updatePass(pass, nowMilliseconds)
```

Calls `mq3.renderer.playable_world_batch.updatePassView` with `(pass,[0.0,0.0,0.0],nowMilliseconds)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pass` | `dynamic` | — | Value forwarded as `pass` to `mq3.renderer.playable_world_batch.updatePassView`. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_world_batch.updatePassView`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L902)

<a id="function-function-mq3-renderer-playable-world-batch-updatepassaxes-function-updatepassaxes-pass-vieworigin-leftdir-updir-nowmilliseconds-src-mq3-renderer-playable-world-batch-ml-609918520"></a>
### updatePassAxes

```ml
function updatePassAxes(pass, viewOrigin, leftDir, upDir, nowMilliseconds)
```

Calls `mq3.renderer.playable_world_batch.updatePassAxesFog` with `(pass,viewOrigin,leftDir,upDir,nowMilliseconds,void)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pass` | `dynamic` | — | Value forwarded as `pass` to `mq3.renderer.playable_world_batch.updatePassAxesFog`. |
| `viewOrigin` | `dynamic` | — | Value forwarded as `viewOrigin` to `mq3.renderer.playable_world_batch.updatePassAxesFog`. |
| `leftDir` | `dynamic` | — | Value forwarded as `leftDir` to `mq3.renderer.playable_world_batch.updatePassAxesFog`. |
| `upDir` | `dynamic` | — | Value forwarded as `upDir` to `mq3.renderer.playable_world_batch.updatePassAxesFog`. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_world_batch.updatePassAxesFog`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L893)

<a id="function-function-mq3-renderer-playable-world-batch-updatepassaxesfog-function-updatepassaxesfog-pass-vieworigin-leftdir-updir-nowmilliseconds-fogcatalog-src-mq3-renderer-playable-world-batch-ml-2048888017"></a>
### updatePassAxesFog

```ml
function updatePassAxesFog(pass, viewOrigin, leftDir, upDir, nowMilliseconds, fogCatalog)
```

Updates `pass.initialized`, `pass.cacheSerial` in `mq3.renderer.playable_world_batch.updatePassAxesFog`; returns `slot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pass` | `dynamic` | — | Mutable record or buffer; this call updates `pass.initialized`, `pass.cacheSerial`. |
| `viewOrigin` | `dynamic` | — | Argument 3 supplied to `mq3.platform.playable_window.updateSpecularPass`. |
| `leftDir` | `dynamic` | — | Value forwarded as `leftDir` to `mq3.renderer.playable_world_batch.autospriteQuad`. |
| `upDir` | `dynamic` | — | Value forwarded as `upDir` to `mq3.renderer.playable_world_batch.autospriteQuad`. |
| `nowMilliseconds` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.playable_materials.slotAt`. |
| `fogCatalog` | `dynamic` | — | Record providing `fogCatalog.fogs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L794)

<a id="function-function-mq3-renderer-playable-world-batch-updatepassview-function-updatepassview-pass-vieworigin-nowmilliseconds-src-mq3-renderer-playable-world-batch-ml-64007940"></a>
### updatePassView

```ml
function updatePassView(pass, viewOrigin, nowMilliseconds)
```

Calls `mq3.renderer.playable_world_batch.updatePassAxes` with `(pass,viewOrigin,[0.0,1.0,0.0],[0.0,0.0,1.0],nowMilliseconds)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pass` | `dynamic` | — | Value forwarded as `pass` to `mq3.renderer.playable_world_batch.updatePassAxes`. |
| `viewOrigin` | `dynamic` | — | Value forwarded as `viewOrigin` to `mq3.renderer.playable_world_batch.updatePassAxes`. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.playable_world_batch.updatePassAxes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L898)

<a id="function-function-mq3-renderer-playable-world-batch-uploadmaterials-function-uploadmaterials-catalog-src-mq3-renderer-playable-world-batch-ml-1474389197"></a>
### uploadMaterials

```ml
function uploadMaterials(catalog)
```

Calls `mq3.renderer.playable_world_batch.uploadMaterialsFrom` with `(catalog,0)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Value forwarded as `catalog` to `mq3.renderer.playable_world_batch.uploadMaterialsFrom`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L273)

<a id="function-function-mq3-renderer-playable-world-batch-uploadmaterialsfrom-function-uploadmaterialsfrom-catalog-firstslot-src-mq3-renderer-playable-world-batch-ml-1062060427"></a>
### uploadMaterialsFrom

```ml
function uploadMaterialsFrom(catalog, firstSlot)
```

Builds `uploaded[slot]` in `mq3.renderer.playable_world_batch.uploadMaterialsFrom`; returns `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Record providing `catalog.materials`. |
| `firstSlot` | `dynamic` | — | Input tested by `slot>=firstSlot and not uploaded[slot]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L251)

- [mq3.renderer.playable_world_batch.UvAffine](Type-mq3-renderer-playable-world-batch-uvaffine-1068578019.md) — struct
- [mq3.renderer.playable_world_batch.VertexCache](Type-mq3-renderer-playable-world-batch-vertexcache-993990901.md) — struct
<a id="function-function-mq3-renderer-playable-world-batch-vertexindexscratch-function-vertexindexscratch-src-mq3-renderer-playable-world-batch-ml-746454538"></a>
### vertexIndexScratch

```ml
function vertexIndexScratch()
```

Constructs `mq3.renderer.playable_world_batch.VertexIndexScratch` with `visited` = `[]`, `slots` = `[]`, `serial` = `0`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L314)

- [mq3.renderer.playable_world_batch.VertexIndexScratch](Type-mq3-renderer-playable-world-batch-vertexindexscratch-849012407.md) — struct
<a id="function-function-mq3-renderer-playable-world-batch-vertexlight-function-vertexlight-vertex-src-mq3-renderer-playable-world-batch-ml-21699612"></a>
### vertexLight

```ml
function vertexLight(vertex)
```

Computes `(vertex.color[0]+vertex.color[1]+vertex.color[2])/(255.0*3.0)` for `mq3.renderer.playable_world_batch.vertexLight`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vertex` | `dynamic` | — | Record providing `vertex.color`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/playable_world_batch.ml#L176)
