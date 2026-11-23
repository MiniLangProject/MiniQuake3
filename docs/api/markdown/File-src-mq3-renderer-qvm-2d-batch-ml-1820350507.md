# `src/mq3/renderer/qvm_2d_batch.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.qvm_2d_batch`](Package-mq3-renderer-qvm-2d-batch-1998916471.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/platform/playable_multitexture.ml` as `multitexture` → [src/mq3/platform/playable_multitexture.ml](File-src-mq3-platform-playable-multitexture-ml-346016672.md)
- `mq3/platform/playable_window.ml` as `window` → [src/mq3/platform/playable_window.ml](File-src-mq3-platform-playable-window-ml-933960264.md)
- `mq3/renderer/command_queue.ml` as `q2commands` → [src/mq3/renderer/command_queue.ml](File-src-mq3-renderer-command-queue-ml-1425855282.md)
- `mq3/renderer/playable_materials.ml` as `materials` → [src/mq3/renderer/playable_materials.ml](File-src-mq3-renderer-playable-materials-ml-320329628.md)
- `mq3/renderer/shader_index.ml` as `shaderIndex` → [src/mq3/renderer/shader_index.ml](File-src-mq3-renderer-shader-index-ml-492021135.md)
- `mq3/renderer/shader_parser.ml` as `shaderParser` → [src/mq3/renderer/shader_parser.ml](File-src-mq3-renderer-shader-parser-ml-2114769074.md)
- `mq3/renderer/shader_remap.ml` as `shaderRemap` → [src/mq3/renderer/shader_remap.ml](File-src-mq3-renderer-shader-remap-ml-1685814656.md)
- `std/ds/list.ml` as `lists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-qvm-2d-batch-addstagetextures-function-addstagetextures-texturelist-stages-nomipmaps-src-mq3-renderer-qvm-2d-batch-ml-476951022"></a>
### addStageTextures

```ml
function addStageTextures(textureList, stages, noMipMaps)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `textureList` | `dynamic` | — |  |
| `stages` | `dynamic` | — |  |
| `noMipMaps` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L101)

<a id="function-function-mq3-renderer-qvm-2d-batch-build-function-build-archive-queuecommands-assets-kinds-firsttextureslot-maxtextureslots-sourcewidth-sourceheight-targetwidth-targetheight-shaderremaps-src-mq3-renderer-qvm-2d-batch-ml-1772064625"></a>
### build

```ml
function build(archive, queueCommands, assets, kinds, firstTextureSlot, maxTextureSlots, sourceWidth, sourceHeight, targetWidth, targetHeight, shaderRemaps)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `queueCommands` | `dynamic` | — |  |
| `assets` | `dynamic` | — |  |
| `kinds` | `dynamic` | — |  |
| `firstTextureSlot` | `dynamic` | — |  |
| `maxTextureSlots` | `dynamic` | — |  |
| `sourceWidth` | `dynamic` | — |  |
| `sourceHeight` | `dynamic` | — |  |
| `targetWidth` | `dynamic` | — |  |
| `targetHeight` | `dynamic` | — |  |
| `shaderRemaps` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L238)

<a id="function-function-mq3-renderer-qvm-2d-batch-buildindexed-function-buildindexed-archive-queuecommands-assets-kinds-firsttextureslot-maxtextureslots-sourcewidth-sourceheight-targetwidth-targetheight-shaderremaps-scripts-src-mq3-renderer-qvm-2d-batch-ml-260226985"></a>
### buildIndexed

```ml
function buildIndexed(archive, queueCommands, assets, kinds, firstTextureSlot, maxTextureSlots, sourceWidth, sourceHeight, targetWidth, targetHeight, shaderRemaps, scripts)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `queueCommands` | `dynamic` | — |  |
| `assets` | `dynamic` | — |  |
| `kinds` | `dynamic` | — |  |
| `firstTextureSlot` | `dynamic` | — |  |
| `maxTextureSlots` | `dynamic` | — |  |
| `sourceWidth` | `dynamic` | — |  |
| `sourceHeight` | `dynamic` | — |  |
| `targetWidth` | `dynamic` | — |  |
| `targetHeight` | `dynamic` | — |  |
| `shaderRemaps` | `dynamic` | — |  |
| `scripts` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L211)

- [mq3.renderer.qvm_2d_batch.Catalog](Type-mq3-renderer-qvm-2d-batch-catalog-105112054.md) — struct
<a id="function-function-mq3-renderer-qvm-2d-batch-checkerimage-function-checkerimage-src-mq3-renderer-qvm-2d-batch-ml-83292098"></a>
### checkerImage

```ml
function checkerImage()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L88)

<a id="function-function-mq3-renderer-qvm-2d-batch-colorbytes-function-colorbytes-rgba-src-mq3-renderer-qvm-2d-batch-ml-421155924"></a>
### colorBytes

```ml
function colorBytes(rgba)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rgba` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L30)

<a id="function-function-mq3-renderer-qvm-2d-batch-createpass-function-createpass-stage-triangles-timeoffset-clamptime-src-mq3-renderer-qvm-2d-batch-ml-380930125"></a>
### createPass

```ml
function createPass(stage, triangles, timeOffset, clampTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |
| `triangles` | `dynamic` | — |  |
| `timeOffset` | `dynamic` | — |  |
| `clampTime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L144)

<a id="function-function-mq3-renderer-qvm-2d-batch-createpassreusable-function-createpassreusable-stage-triangles-timeoffset-clamptime-previous-src-mq3-renderer-qvm-2d-batch-ml-976614020"></a>
### createPassReusable

```ml
function createPassReusable(stage, triangles, timeOffset, clampTime, previous)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |
| `triangles` | `dynamic` | — |  |
| `timeOffset` | `dynamic` | — |  |
| `clampTime` | `dynamic` | — |  |
| `previous` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L128)

<a id="function-function-mq3-renderer-qvm-2d-batch-createrun-function-createrun-materialindexvalue-handle-material-quads-src-mq3-renderer-qvm-2d-batch-ml-1778818427"></a>
### createRun

```ml
function createRun(materialIndexValue, handle, material, quads)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `materialIndexValue` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `material` | `dynamic` | — |  |
| `quads` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L152)

<a id="function-function-mq3-renderer-qvm-2d-batch-createrunreusable-function-createrunreusable-materialindexvalue-handle-material-quads-previous-src-mq3-renderer-qvm-2d-batch-ml-2136620632"></a>
### createRunReusable

```ml
function createRunReusable(materialIndexValue, handle, material, quads, previous)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `materialIndexValue` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `material` | `dynamic` | — |  |
| `quads` | `dynamic` | — |  |
| `previous` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L145)

<a id="function-function-mq3-renderer-qvm-2d-batch-directstage-function-directstage-imagename-image-slot-src-mq3-renderer-qvm-2d-batch-ml-1487107219"></a>
### directStage

```ml
function directStage(imageName, image, slot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `imageName` | `dynamic` | — |  |
| `image` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L92)

<a id="function-function-mq3-renderer-qvm-2d-batch-draw-function-draw-catalog-nowmilliseconds-src-mq3-renderer-qvm-2d-batch-ml-1709221605"></a>
### draw

```ml
function draw(catalog, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L268)

<a id="function-function-mq3-renderer-qvm-2d-batch-dynamicstage-function-dynamicstage-stage-src-mq3-renderer-qvm-2d-batch-ml-1505002230"></a>
### dynamicStage

```ml
function dynamicStage(stage)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L52)

<a id="function-function-mq3-renderer-qvm-2d-batch-extract-function-extract-queuecommands-assets-kinds-sourcewidth-sourceheight-targetwidth-targetheight-src-mq3-renderer-qvm-2d-batch-ml-669948509"></a>
### extract

```ml
function extract(queueCommands, assets, kinds, sourceWidth, sourceHeight, targetWidth, targetHeight)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queueCommands` | `dynamic` | — |  |
| `assets` | `dynamic` | — |  |
| `kinds` | `dynamic` | — |  |
| `sourceWidth` | `dynamic` | — |  |
| `sourceHeight` | `dynamic` | — |  |
| `targetWidth` | `dynamic` | — |  |
| `targetHeight` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L57)

- [mq3.renderer.qvm_2d_batch.Extracted](Type-mq3-renderer-qvm-2d-batch-extracted-1202872729.md) — struct
<a id="function-function-mq3-renderer-qvm-2d-batch-fail-function-fail-message-src-mq3-renderer-qvm-2d-batch-ml-270796047"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L29)

<a id="function-function-mq3-renderer-qvm-2d-batch-loadmaterial-function-loadmaterial-archive-index-quad-nextslot-endslot-src-mq3-renderer-qvm-2d-batch-ml-619237997"></a>
### loadMaterial

```ml
function loadMaterial(archive, index, quad, nextSlot, endSlot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `quad` | `dynamic` | — |  |
| `nextSlot` | `dynamic` | — |  |
| `endSlot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L109)

- [mq3.renderer.qvm_2d_batch.Material](Type-mq3-renderer-qvm-2d-batch-material-1663811394.md) — struct
<a id="function-function-mq3-renderer-qvm-2d-batch-materialindex-function-materialindex-materiallist-handle-src-mq3-renderer-qvm-2d-batch-ml-321835775"></a>
### materialIndex

```ml
function materialIndex(materialList, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `materialList` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L95)

<a id="function-function-mq3-renderer-qvm-2d-batch-materialmatches-function-materialmatches-material-name-src-mq3-renderer-qvm-2d-batch-ml-126189980"></a>
### materialMatches

```ml
function materialMatches(material, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `material` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L100)

- [mq3.renderer.qvm_2d_batch.Point](Type-mq3-renderer-qvm-2d-batch-point-1849827523.md) — struct
- [mq3.renderer.qvm_2d_batch.Quad](Type-mq3-renderer-qvm-2d-batch-quad-949498652.md) — struct
<a id="function-function-mq3-renderer-qvm-2d-batch-refresh-function-refresh-catalog-queuecommands-assets-kinds-sourcewidth-sourceheight-targetwidth-targetheight-src-mq3-renderer-qvm-2d-batch-ml-925554328"></a>
### refresh

```ml
function refresh(catalog, queueCommands, assets, kinds, sourceWidth, sourceHeight, targetWidth, targetHeight)
```

Rebuild only the changing quad/run buffers.  Shader parsing, PK3 image decoding and texture-slot assignment remain cached in the catalog.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `queueCommands` | `dynamic` | — |  |
| `assets` | `dynamic` | — |  |
| `kinds` | `dynamic` | — |  |
| `sourceWidth` | `dynamic` | — |  |
| `sourceHeight` | `dynamic` | — |  |
| `targetWidth` | `dynamic` | — |  |
| `targetHeight` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L180)

<a id="function-function-mq3-renderer-qvm-2d-batch-refreshstatictopology-function-refreshstatictopology-catalog-queuecommands-sourcewidth-sourceheight-targetwidth-targetheight-src-mq3-renderer-qvm-2d-batch-ml-1313836848"></a>
### refreshStaticTopology

```ml
function refreshStaticTopology(catalog, queueCommands, sourceWidth, sourceHeight, targetWidth, targetHeight)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `queueCommands` | `dynamic` | — |  |
| `sourceWidth` | `dynamic` | — |  |
| `sourceHeight` | `dynamic` | — |  |
| `targetWidth` | `dynamic` | — |  |
| `targetHeight` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L154)

<a id="function-function-mq3-renderer-qvm-2d-batch-release-function-release-catalog-src-mq3-renderer-qvm-2d-batch-ml-309093829"></a>
### release

```ml
function release(catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L254)

- [mq3.renderer.qvm_2d_batch.Run](Type-mq3-renderer-qvm-2d-batch-run-1128412860.md) — struct
<a id="function-function-mq3-renderer-qvm-2d-batch-samecommands-function-samecommands-left-right-src-mq3-renderer-qvm-2d-batch-ml-541404109"></a>
### sameCommands

```ml
function sameCommands(left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L44)

<a id="function-function-mq3-renderer-qvm-2d-batch-sametopology-function-sametopology-left-right-src-mq3-renderer-qvm-2d-batch-ml-367066377"></a>
### sameTopology

```ml
function sameTopology(left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L48)

<a id="function-function-mq3-renderer-qvm-2d-batch-samevalues-function-samevalues-left-right-src-mq3-renderer-qvm-2d-batch-ml-206195597"></a>
### sameValues

```ml
function sameValues(left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L40)

<a id="function-function-mq3-renderer-qvm-2d-batch-scaledpoint-function-scaledpoint-x-y-scalex-scaley-src-mq3-renderer-qvm-2d-batch-ml-1015396554"></a>
### scaledPoint

```ml
function scaledPoint(x, y, scaleX, scaleY)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `scaleX` | `dynamic` | — |  |
| `scaleY` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L39)

<a id="constant-constant-mq3-renderer-qvm-2d-batch-screen-depth-const-screen-depth-1-e-003-src-mq3-renderer-qvm-2d-batch-ml-1065693501"></a>
### SCREEN_DEPTH

```ml
const SCREEN_DEPTH = 1.e-003
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L17)

<a id="function-function-mq3-renderer-qvm-2d-batch-shadername-function-shadername-assets-kinds-handle-src-mq3-renderer-qvm-2d-batch-ml-300246634"></a>
### shaderName

```ml
function shaderName(assets, kinds, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `assets` | `dynamic` | — |  |
| `kinds` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L33)

<a id="function-function-mq3-renderer-qvm-2d-batch-shadernomip-function-shadernomip-kinds-handle-src-mq3-renderer-qvm-2d-batch-ml-362552093"></a>
### shaderNoMip

```ml
function shaderNoMip(kinds, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `kinds` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L38)

- [mq3.renderer.qvm_2d_batch.StagePass](Type-mq3-renderer-qvm-2d-batch-stagepass-1079493082.md) — struct
- [mq3.renderer.qvm_2d_batch.Texture](Type-mq3-renderer-qvm-2d-batch-texture-689632650.md) — struct
- [mq3.renderer.qvm_2d_batch.Triangle](Type-mq3-renderer-qvm-2d-batch-triangle-1848591687.md) — struct
<a id="function-function-mq3-renderer-qvm-2d-batch-trianglesfor-function-trianglesfor-quad-materialindex-src-mq3-renderer-qvm-2d-batch-ml-82575982"></a>
### trianglesFor

```ml
function trianglesFor(quad, materialIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `quad` | `dynamic` | — |  |
| `materialIndex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L79)

<a id="function-function-mq3-renderer-qvm-2d-batch-updatepass-function-updatepass-pass-nowmilliseconds-src-mq3-renderer-qvm-2d-batch-ml-1338294385"></a>
### updatePass

```ml
function updatePass(pass, nowMilliseconds)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pass` | `dynamic` | — |  |
| `nowMilliseconds` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L256)

<a id="function-function-mq3-renderer-qvm-2d-batch-upload-function-upload-catalog-src-mq3-renderer-qvm-2d-batch-ml-1964842803"></a>
### upload

```ml
function upload(catalog)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L253)

<a id="function-function-mq3-renderer-qvm-2d-batch-uploadfrom-function-uploadfrom-catalog-first-src-mq3-renderer-qvm-2d-batch-ml-2060906149"></a>
### uploadFrom

```ml
function uploadFrom(catalog, first)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — |  |
| `first` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L243)

<a id="function-function-mq3-renderer-qvm-2d-batch-whiteimage-function-whiteimage-src-mq3-renderer-qvm-2d-batch-ml-340282714"></a>
### whiteImage

```ml
function whiteImage()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/qvm_2d_batch.ml#L85)
