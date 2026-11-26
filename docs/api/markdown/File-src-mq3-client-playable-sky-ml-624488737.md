# `src/mq3/client/playable_sky.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.playable_sky`](Package-mq3-client-playable-sky-1686653829.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/playable_viewer.ml` as `viewer` → [src/mq3/client/playable_viewer.ml](File-src-mq3-client-playable-viewer-ml-2126962810.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)
- `mq3/renderer/shader_parser.ml` as `shaderParser` → [src/mq3/renderer/shader_parser.ml](File-src-mq3-renderer-shader-parser-ml-2114769074.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="extern_function-extern-function-mq3-client-playable-sky-acos-extern-function-acos-value-as-double-from-ucrtbase-dll-returns-double-src-mq3-client-playable-sky-ml-1211113756"></a>
### acos

```ml
extern function acos(value as double) from "ucrtbase.dll" returns double
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L16)

<a id="function-function-mq3-client-playable-sky-additiveimage-function-additiveimage-source-src-mq3-client-playable-sky-ml-2137856641"></a>
### additiveImage

```ml
function additiveImage(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L44)

<a id="function-function-mq3-client-playable-sky-appendtriangle-function-appendtriangle-batch-layer-a-b-c-src-mq3-client-playable-sky-ml-173698599"></a>
### appendTriangle

```ml
function appendTriangle(batch, layer, a, b, c)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `batch` | `dynamic` | — |  |
| `layer` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L171)

<a id="function-function-mq3-client-playable-sky-basegrid-function-basegrid-camera-width-height-src-mq3-client-playable-sky-ml-1852744162"></a>
### baseGrid

```ml
function baseGrid(camera, width, height)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L160)

<a id="function-function-mq3-client-playable-sky-basegridprepared-function-basegridprepared-basis-left-top-width-height-src-mq3-client-playable-sky-ml-1629450305"></a>
### baseGridPrepared

```ml
function baseGridPrepared(basis, left, top, width, height)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `basis` | `dynamic` | — |  |
| `left` | `dynamic` | — |  |
| `top` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L159)

<a id="function-function-mq3-client-playable-sky-baseuv-function-baseuv-camera-width-height-x-y-src-mq3-client-playable-sky-ml-299950465"></a>
### baseUv

```ml
function baseUv(camera, width, height, x, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L134)

<a id="function-function-mq3-client-playable-sky-baseuvprepared-function-baseuvprepared-basis-focal-width-height-x-y-src-mq3-client-playable-sky-ml-1075941345"></a>
### baseUvPrepared

```ml
function baseUvPrepared(basis, focal, width, height, x, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `basis` | `dynamic` | — |  |
| `focal` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L132)

<a id="function-function-mq3-client-playable-sky-buildbatch-function-buildbatch-catalog-camera-width-height-nowmilliseconds-src-mq3-client-playable-sky-ml-1611899343"></a>
### buildBatch

```ml
function buildBatch(catalog, camera, width, height, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `camera` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L196)

<a id="function-function-mq3-client-playable-sky-buildbatchprepared-function-buildbatchprepared-catalog-basis-left-top-width-height-nowmilliseconds-src-mq3-client-playable-sky-ml-383625834"></a>
### buildBatchPrepared

```ml
function buildBatchPrepared(catalog, basis, left, top, width, height, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `basis` | `dynamic` | — |  |
| `left` | `dynamic` | — |  |
| `top` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L176)

- [mq3.client.playable_sky.CachedView](Type-mq3-client-playable-sky-cachedview-1579855338.md) — struct
- [mq3.client.playable_sky.Catalog](Type-mq3-client-playable-sky-catalog-2147099612.md) — struct
<a id="function-function-mq3-client-playable-sky-cloudgridprepared-function-cloudgridprepared-basis-left-top-width-height-cloudheight-src-mq3-client-playable-sky-ml-335020307"></a>
### cloudGridPrepared

```ml
function cloudGridPrepared(basis, left, top, width, height, cloudHeight)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `basis` | `dynamic` | — |  |
| `left` | `dynamic` | — |  |
| `top` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `cloudHeight` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L146)

<a id="function-function-mq3-client-playable-sky-clouduvprepared-function-clouduvprepared-basis-focal-width-height-x-y-cloudheight-src-mq3-client-playable-sky-ml-19416289"></a>
### cloudUvPrepared

```ml
function cloudUvPrepared(basis, focal, width, height, x, y, cloudHeight)
```

Quake III's R_InitSkyTexCoords intersects each ray with a cloud sphere centered 4096 units below the viewer, then uses acos of its X/Y normal. Unlike yaw/pitch, this is continuous at the zenith.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `basis` | `dynamic` | — |  |
| `focal` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `cloudHeight` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L125)

<a id="function-function-mq3-client-playable-sky-copybasis-function-copybasis-value-src-mq3-client-playable-sky-ml-1451784339"></a>
### copyBasis

```ml
function copyBasis(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L202)

<a id="function-function-mq3-client-playable-sky-direction-function-direction-camera-width-height-x-y-src-mq3-client-playable-sky-ml-1458572975"></a>
### direction

```ml
function direction(camera, width, height, x, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L117)

<a id="function-function-mq3-client-playable-sky-directionprepared-function-directionprepared-basis-focal-width-height-x-y-src-mq3-client-playable-sky-ml-2087014917"></a>
### directionPrepared

```ml
function directionPrepared(basis, focal, width, height, x, y)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `basis` | `dynamic` | — |  |
| `focal` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L111)

<a id="function-function-mq3-client-playable-sky-draw-function-draw-catalog-camera-width-height-nowmilliseconds-src-mq3-client-playable-sky-ml-1875670287"></a>
### draw

```ml
function draw(catalog, camera, width, height, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `camera` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L257)

<a id="function-function-mq3-client-playable-sky-drawlayer-function-drawlayer-layer-camera-width-height-nowmilliseconds-layerindex-src-mq3-client-playable-sky-ml-220321872"></a>
### drawLayer

```ml
function drawLayer(layer, camera, width, height, nowMilliseconds, layerIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `layer` | `dynamic` | — |  |
| `camera` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `layerIndex` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L240)

<a id="extern_function-extern-function-mq3-client-playable-sky-drawskylayernative-extern-function-drawskylayernative-records-as-ptr-capacity-as-i32-firsttriangle-as-i32-trianglecount-as-i32-additive-as-i32-from-playable-window-dll-symbol-playable-window-draw-sky-layer-returns-i32-src-mq3-client-playable-sky-ml-1132978482"></a>
### drawSkyLayerNative

```ml
extern function drawSkyLayerNative(records as ptr, capacity as i32, firstTriangle as i32, triangleCount as i32, additive as i32) from "playable_window.dll" symbol "playable_window_draw_sky_layer" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `records` | `ptr` | — |  |
| `capacity` | `i32` | — |  |
| `firstTriangle` | `i32` | — |  |
| `triangleCount` | `i32` | — |  |
| `additive` | `i32` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L15)

<a id="function-function-mq3-client-playable-sky-drawtriangle-function-drawtriangle-layer-a-b-c-src-mq3-client-playable-sky-ml-456704905"></a>
### drawTriangle

```ml
function drawTriangle(layer, a, b, c)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `layer` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L167)

<a id="function-function-mq3-client-playable-sky-drawviewport-function-drawviewport-catalog-basis-area-nowmilliseconds-src-mq3-client-playable-sky-ml-927603488"></a>
### drawViewport

```ml
function drawViewport(catalog, basis, area, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `basis` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L276)

<a id="function-function-mq3-client-playable-sky-fail-function-fail-message-src-mq3-client-playable-sky-ml-264272003"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L32)

<a id="constant-constant-mq3-client-playable-sky-grid-columns-const-grid-columns-12-src-mq3-client-playable-sky-ml-236733188"></a>
### GRID_COLUMNS

```ml
const GRID_COLUMNS = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L20)

<a id="constant-constant-mq3-client-playable-sky-grid-rows-const-grid-rows-8-src-mq3-client-playable-sky-ml-661725661"></a>
### GRID_ROWS

```ml
const GRID_ROWS = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L21)

<a id="function-function-mq3-client-playable-sky-hassurfaceparm-function-hassurfaceparm-shader-wanted-src-mq3-client-playable-sky-ml-2015224748"></a>
### hasSurfaceParm

```ml
function hasSurfaceParm(shader, wanted)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shader` | `dynamic` | — |  |
| `wanted` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L34)

<a id="function-function-mq3-client-playable-sky-isskyshader-function-isskyshader-name-src-mq3-client-playable-sky-ml-339427785"></a>
### isSkyShader

```ml
function isSkyShader(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L33)

<a id="function-function-mq3-client-playable-sky-isskyshaderindexed-function-isskyshaderindexed-index-name-src-mq3-client-playable-sky-ml-604029587"></a>
### isSkyShaderIndexed

```ml
function isSkyShaderIndexed(index, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L39)

- [mq3.client.playable_sky.Layer](Type-mq3-client-playable-sky-layer-276908874.md) — struct
<a id="function-function-mq3-client-playable-sky-layerfromstage-function-layerfromstage-archive-stage-slot-src-mq3-client-playable-sky-ml-1532831010"></a>
### layerFromStage

```ml
function layerFromStage(archive, stage, slot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `stage` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L54)

<a id="function-function-mq3-client-playable-sky-load-function-load-archive-firsttextureslot-maxtextureslots-src-mq3-client-playable-sky-ml-1207551233"></a>
### load

```ml
function load(archive, firstTextureSlot, maxTextureSlots)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `firstTextureSlot` | `dynamic` | — |  |
| `maxTextureSlots` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L93)

<a id="function-function-mq3-client-playable-sky-loadindexed-function-loadindexed-archive-index-shadername-firsttextureslot-maxtextureslots-src-mq3-client-playable-sky-ml-1968758591"></a>
### loadIndexed

```ml
function loadIndexed(archive, index, shaderName, firstTextureSlot, maxTextureSlots)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `shaderName` | `dynamic` | — |  |
| `firstTextureSlot` | `dynamic` | — |  |
| `maxTextureSlots` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L71)

<a id="function-function-mq3-client-playable-sky-loadmap-function-loadmap-archive-map-index-firsttextureslot-maxtextureslots-src-mq3-client-playable-sky-ml-1890559575"></a>
### loadMap

```ml
function loadMap(archive, map, index, firstTextureSlot, maxTextureSlots)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `map` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `firstTextureSlot` | `dynamic` | — |  |
| `maxTextureSlots` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L85)

<a id="function-function-mq3-client-playable-sky-mappedvertex-function-mappedvertex-source-layer-seconds-depth-src-mq3-client-playable-sky-ml-1489163800"></a>
### mappedVertex

```ml
function mappedVertex(source, layer, seconds, depth)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `layer` | `dynamic` | — |  |
| `seconds` | `dynamic` | — |  |
| `depth` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L162)

<a id="constant-constant-mq3-client-playable-sky-max-cached-views-const-max-cached-views-8-src-mq3-client-playable-sky-ml-1183835771"></a>
### MAX_CACHED_VIEWS

```ml
const MAX_CACHED_VIEWS = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L23)

<a id="function-function-mq3-client-playable-sky-release-function-release-catalog-src-mq3-client-playable-sky-ml-1896610609"></a>
### release

```ml
function release(catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L106)

<a id="constant-constant-mq3-client-playable-sky-required-textures-const-required-textures-2-src-mq3-client-playable-sky-ml-1243639279"></a>
### REQUIRED_TEXTURES

```ml
const REQUIRED_TEXTURES = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L19)

<a id="function-function-mq3-client-playable-sky-retainedbatchprepared-function-retainedbatchprepared-catalog-basis-left-top-width-height-nowmilliseconds-src-mq3-client-playable-sky-ml-275249644"></a>
### retainedBatchPrepared

```ml
function retainedBatchPrepared(catalog, basis, left, top, width, height, nowMilliseconds)
```

Preserve MiniLang's camera/ray math exactly, retaining its double UVs until the final native binary32 batch stores. Time changes only the two uniforms per layer; an unchanged camera therefore performs no grid allocation/math. A bounded ring handles alternating main/portal/refdef views without growth.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `basis` | `dynamic` | — |  |
| `left` | `dynamic` | — |  |
| `top` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L208)

<a id="function-function-mq3-client-playable-sky-retainedbatchrefdef-function-retainedbatchrefdef-catalog-axes-left-top-width-height-nowmilliseconds-src-mq3-client-playable-sky-ml-510302867"></a>
### retainedBatchRefdef

```ml
function retainedBatchRefdef(catalog, axes, left, top, width, height, nowMilliseconds)
```

Only refdef callers carry a LEFT vector. Standalone camera/prepared APIs already carry RIGHT and must retain their existing ray/batch semantics.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `axes` | `dynamic` | — |  |
| `left` | `dynamic` | — |  |
| `top` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L273)

<a id="function-function-mq3-client-playable-sky-samebasis-function-samebasis-left-right-src-mq3-client-playable-sky-ml-707949049"></a>
### sameBasis

```ml
function sameBasis(left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L198)

<a id="constant-constant-mq3-client-playable-sky-shader-name-const-shader-name-textures-skies-tim-hell-src-mq3-client-playable-sky-ml-628692390"></a>
### SHADER_NAME

```ml
const SHADER_NAME = "textures/skies/tim_hell"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L18)

<a id="constant-constant-mq3-client-playable-sky-sky-depth-const-sky-depth-1000000-src-mq3-client-playable-sky-ml-654785292"></a>
### SKY_DEPTH

```ml
const SKY_DEPTH = 1000000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L22)

<a id="constant-constant-mq3-client-playable-sky-source-vertex-bytes-const-source-vertex-bytes-32-src-mq3-client-playable-sky-ml-2067220048"></a>
### SOURCE_VERTEX_BYTES

```ml
const SOURCE_VERTEX_BYTES = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L24)

<a id="extern_function-extern-function-mq3-client-playable-sky-storeskyvertexnative-extern-function-storeskyvertexnative-source-as-ptr-capacity-as-i32-index-as-i32-x-as-double-y-as-double-u-as-double-v-as-double-from-playable-window-dll-symbol-playable-window-store-sky-vertex-returns-i32-src-mq3-client-playable-sky-ml-647891068"></a>
### storeSkyVertexNative

```ml
extern function storeSkyVertexNative(source as ptr, capacity as i32, index as i32, x as double, y as double, u as double, v as double) from "playable_window.dll" symbol "playable_window_store_sky_vertex" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `ptr` | — |  |
| `capacity` | `i32` | — |  |
| `index` | `i32` | — |  |
| `x` | `double` | — |  |
| `y` | `double` | — |  |
| `u` | `double` | — |  |
| `v` | `double` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L13)

<a id="function-function-mq3-client-playable-sky-submitlayers-function-submitlayers-catalog-batch-src-mq3-client-playable-sky-ml-985914795"></a>
### submitLayers

```ml
function submitLayers(catalog, batch)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `batch` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L262)

<a id="extern_function-extern-function-mq3-client-playable-sky-updateskylayernative-extern-function-updateskylayernative-records-as-ptr-capacity-as-i32-firsttriangle-as-i32-source-as-ptr-sourcebytes-as-i32-columns-as-i32-rows-as-i32-slot-as-i32-scaleu-as-double-scalev-as-double-scrollu-as-double-scrollv-as-double-nowmilliseconds-as-double-depth-as-double-from-playable-window-dll-symbol-playable-window-update-sky-layer-returns-i32-src-mq3-client-playable-sky-ml-1282041420"></a>
### updateSkyLayerNative

```ml
extern function updateSkyLayerNative(records as ptr, capacity as i32, firstTriangle as i32, source as ptr, sourceBytes as i32, columns as i32, rows as i32, slot as i32, scaleU as double, scaleV as double, scrollU as double, scrollV as double, nowMilliseconds as double, depth as double) from "playable_window.dll" symbol "playable_window_update_sky_layer" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `records` | `ptr` | — |  |
| `capacity` | `i32` | — |  |
| `firstTriangle` | `i32` | — |  |
| `source` | `ptr` | — |  |
| `sourceBytes` | `i32` | — |  |
| `columns` | `i32` | — |  |
| `rows` | `i32` | — |  |
| `slot` | `i32` | — |  |
| `scaleU` | `double` | — |  |
| `scaleV` | `double` | — |  |
| `scrollU` | `double` | — |  |
| `scrollV` | `double` | — |  |
| `nowMilliseconds` | `double` | — |  |
| `depth` | `double` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L14)

<a id="function-function-mq3-client-playable-sky-upload-function-upload-catalog-src-mq3-client-playable-sky-ml-1025607951"></a>
### upload

```ml
function upload(catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L98)

<a id="function-function-mq3-client-playable-sky-vertex-function-vertex-camera-width-height-x-y-layer-nowmilliseconds-depth-src-mq3-client-playable-sky-ml-894823759"></a>
### vertex

```ml
function vertex(camera, width, height, x, y, layer, nowMilliseconds, depth)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `camera` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `layer` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |
| `depth` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/playable_sky.ml#L139)

- [mq3.client.playable_sky.Vertex](Type-mq3-client-playable-sky-vertex-2077306707.md) — struct
- [mq3.client.playable_sky.ViewCache](Type-mq3-client-playable-sky-viewcache-1549416326.md) — struct
