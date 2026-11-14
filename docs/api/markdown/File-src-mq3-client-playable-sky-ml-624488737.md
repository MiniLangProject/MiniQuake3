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

<a id="function-function-mq3-client-playable-sky-additiveimage-function-additiveimage-source-src-mq3-client-playable-sky-ml-2137856641"></a>
### additiveImage

```ml
function additiveImage(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L35)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L160)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L144)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L131)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L119)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L113)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L185)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L165)

- [mq3.client.playable_sky.Catalog](Type-mq3-client-playable-sky-catalog-2147099612.md) — struct
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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L108)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L102)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L204)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L187)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L155)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L209)

<a id="function-function-mq3-client-playable-sky-fail-function-fail-message-src-mq3-client-playable-sky-ml-264272003"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L23)

<a id="constant-constant-mq3-client-playable-sky-grid-columns-const-grid-columns-12-src-mq3-client-playable-sky-ml-236733188"></a>
### GRID_COLUMNS

```ml
const GRID_COLUMNS = 12
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L15)

<a id="constant-constant-mq3-client-playable-sky-grid-rows-const-grid-rows-8-src-mq3-client-playable-sky-ml-661725661"></a>
### GRID_ROWS

```ml
const GRID_ROWS = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L16)

<a id="function-function-mq3-client-playable-sky-hassurfaceparm-function-hassurfaceparm-shader-wanted-src-mq3-client-playable-sky-ml-2015224748"></a>
### hasSurfaceParm

```ml
function hasSurfaceParm(shader, wanted)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shader` | `dynamic` | — |  |
| `wanted` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L25)

<a id="function-function-mq3-client-playable-sky-isskyshader-function-isskyshader-name-src-mq3-client-playable-sky-ml-339427785"></a>
### isSkyShader

```ml
function isSkyShader(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L24)

<a id="function-function-mq3-client-playable-sky-isskyshaderindexed-function-isskyshaderindexed-index-name-src-mq3-client-playable-sky-ml-604029587"></a>
### isSkyShaderIndexed

```ml
function isSkyShaderIndexed(index, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L30)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L45)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L84)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L62)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L76)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L146)

<a id="function-function-mq3-client-playable-sky-release-function-release-catalog-src-mq3-client-playable-sky-ml-1896610609"></a>
### release

```ml
function release(catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L97)

<a id="constant-constant-mq3-client-playable-sky-required-textures-const-required-textures-2-src-mq3-client-playable-sky-ml-1243639279"></a>
### REQUIRED_TEXTURES

```ml
const REQUIRED_TEXTURES = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L14)

<a id="constant-constant-mq3-client-playable-sky-shader-name-const-shader-name-textures-skies-tim-hell-src-mq3-client-playable-sky-ml-628692390"></a>
### SHADER_NAME

```ml
const SHADER_NAME = "textures/skies/tim_hell"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L13)

<a id="constant-constant-mq3-client-playable-sky-sky-depth-const-sky-depth-1000000-src-mq3-client-playable-sky-ml-2067028878"></a>
### SKY_DEPTH

```ml
const SKY_DEPTH = 1000000.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L17)

<a id="function-function-mq3-client-playable-sky-unwrap-function-unwrap-reference-value-src-mq3-client-playable-sky-ml-871794340"></a>
### unwrap

```ml
function unwrap(reference, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `reference` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L151)

<a id="function-function-mq3-client-playable-sky-upload-function-upload-catalog-src-mq3-client-playable-sky-ml-1025607951"></a>
### upload

```ml
function upload(catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L89)

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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/playable_sky.ml#L124)

- [mq3.client.playable_sky.Vertex](Type-mq3-client-playable-sky-vertex-2077306707.md) — struct
