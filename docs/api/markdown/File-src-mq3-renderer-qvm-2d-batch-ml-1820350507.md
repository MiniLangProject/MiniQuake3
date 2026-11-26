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

Computes `addStageTextures` from `textureList` using `mq3.renderer.qvm_2d_batch.Texture`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `textureList` | `dynamic` | — | Input used by `result=textureList`. |
| `stages` | `dynamic` | — | Sequence traversed as `stage` while producing this result. |
| `noMipMaps` | `dynamic` | — | Value used for `mq3.renderer.qvm_2d_batch.Texture.noMipMaps`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L164)

<a id="function-function-mq3-renderer-qvm-2d-batch-build-function-build-archive-queuecommands-assets-kinds-firsttextureslot-maxtextureslots-sourcewidth-sourceheight-targetwidth-targetheight-shaderremaps-src-mq3-renderer-qvm-2d-batch-ml-1772064625"></a>
### build

```ml
function build(archive, queueCommands, assets, kinds, firstTextureSlot, maxTextureSlots, sourceWidth, sourceHeight, targetWidth, targetHeight, shaderRemaps)
```

Builds a shared shader-script index and creates the scaled QVM 2D draw catalog from queued commands.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_materials.buildScriptIndex`. |
| `queueCommands` | `dynamic` | — | Value forwarded as `queueCommands` to `mq3.renderer.qvm_2d_batch.buildIndexed`. |
| `assets` | `dynamic` | — | Value forwarded as `assets` to `mq3.renderer.qvm_2d_batch.buildIndexed`. |
| `kinds` | `dynamic` | — | Value forwarded as `kinds` to `mq3.renderer.qvm_2d_batch.buildIndexed`. |
| `firstTextureSlot` | `dynamic` | — | Value forwarded as `firstTextureSlot` to `mq3.renderer.qvm_2d_batch.buildIndexed`. |
| `maxTextureSlots` | `dynamic` | — | Value forwarded as `maxTextureSlots` to `mq3.renderer.qvm_2d_batch.buildIndexed`. |
| `sourceWidth` | `dynamic` | — | Value forwarded as `sourceWidth` to `mq3.renderer.qvm_2d_batch.buildIndexed`. |
| `sourceHeight` | `dynamic` | — | Value forwarded as `sourceHeight` to `mq3.renderer.qvm_2d_batch.buildIndexed`. |
| `targetWidth` | `dynamic` | — | Value forwarded as `targetWidth` to `mq3.renderer.qvm_2d_batch.buildIndexed`. |
| `targetHeight` | `dynamic` | — | Value forwarded as `targetHeight` to `mq3.renderer.qvm_2d_batch.buildIndexed`. |
| `shaderRemaps` | `dynamic` | — | Value forwarded as `shaderRemaps` to `mq3.renderer.qvm_2d_batch.buildIndexed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L369)

<a id="function-function-mq3-renderer-qvm-2d-batch-buildindexed-function-buildindexed-archive-queuecommands-assets-kinds-firsttextureslot-maxtextureslots-sourcewidth-sourceheight-targetwidth-targetheight-shaderremaps-scripts-src-mq3-renderer-qvm-2d-batch-ml-260226985"></a>
### buildIndexed

```ml
function buildIndexed(archive, queueCommands, assets, kinds, firstTextureSlot, maxTextureSlots, sourceWidth, sourceHeight, targetWidth, targetHeight, shaderRemaps, scripts)
```

Builds `material.noMipMaps`, `material.timeOffset`, `catalog.nextTextureSlot`, `catalog.materials`, `catalog.textures` in `mq3.renderer.qvm_2d_batch.buildIndexed`; returns `catalog`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Value used for `mq3.renderer.qvm_2d_batch.Catalog.archive`. |
| `queueCommands` | `dynamic` | — | Value forwarded as `queueCommands` to `mq3.renderer.qvm_2d_batch.extract`. |
| `assets` | `dynamic` | — | Value forwarded as `assets` to `mq3.renderer.qvm_2d_batch.extract`. |
| `kinds` | `dynamic` | — | Value forwarded as `kinds` to `mq3.renderer.qvm_2d_batch.extract`. |
| `firstTextureSlot` | `dynamic` | — | Value used for `mq3.renderer.qvm_2d_batch.Catalog.nextTextureSlot`. |
| `maxTextureSlots` | `dynamic` | — | Input tested by `firstTextureSlot<0 or maxTextureSlots<0 or firstTextureSlot+maxTextureSlots>window.NATIVE_TEXTURE_SLOTS`. |
| `sourceWidth` | `dynamic` | — | Value forwarded as `sourceWidth` to `mq3.renderer.qvm_2d_batch.extract`. |
| `sourceHeight` | `dynamic` | — | Value forwarded as `sourceHeight` to `mq3.renderer.qvm_2d_batch.extract`. |
| `targetWidth` | `dynamic` | — | Value forwarded as `targetWidth` to `mq3.renderer.qvm_2d_batch.extract`. |
| `targetHeight` | `dynamic` | — | Value forwarded as `targetHeight` to `mq3.renderer.qvm_2d_batch.extract`. |
| `shaderRemaps` | `dynamic` | — | Record providing `shaderRemaps.revision`. |
| `scripts` | `dynamic` | — | Indexed input read at `0`, `1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L330)

- [mq3.renderer.qvm_2d_batch.Catalog](Type-mq3-renderer-qvm-2d-batch-catalog-105112054.md) — struct
<a id="function-function-mq3-renderer-qvm-2d-batch-checkerimage-function-checkerimage-src-mq3-renderer-qvm-2d-batch-ml-83292098"></a>
### checkerImage

```ml
function checkerImage()
```

Builds `pixels[1]`, `pixels[3]`, `pixels[4]`, `pixels[5]`, `pixels[6]` in `mq3.renderer.qvm_2d_batch.checkerImage`; returns `materials.Image(2,2,pixels)`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L137)

<a id="function-function-mq3-renderer-qvm-2d-batch-colorbytes-function-colorbytes-rgba-src-mq3-renderer-qvm-2d-batch-ml-421155924"></a>
### colorBytes

```ml
function colorBytes(rgba)
```

Returns `[n.trunc32(rgba[0]*255.0),n.trunc32(rgba[1]*255.0),n.trunc32(rgba[2]*255.0),n.trunc32(rgba[3]*255.0)]` for `mq3.renderer.qvm_2d_batch.colorBytes`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rgba` | `dynamic` | — | Indexed input read at `0`, `1`, `2`, `3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L43)

<a id="function-function-mq3-renderer-qvm-2d-batch-createpass-function-createpass-stage-triangles-timeoffset-clamptime-src-mq3-renderer-qvm-2d-batch-ml-380930125"></a>
### createPass

```ml
function createPass(stage, triangles, timeOffset, clampTime)
```

Calls `mq3.renderer.qvm_2d_batch.createPassReusable` with `(stage,triangles,timeOffset,clampTime,void)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Value forwarded as `stage` to `mq3.renderer.qvm_2d_batch.createPassReusable`. |
| `triangles` | `dynamic` | — | Value forwarded as `triangles` to `mq3.renderer.qvm_2d_batch.createPassReusable`. |
| `timeOffset` | `dynamic` | — | Value forwarded as `timeOffset` to `mq3.renderer.qvm_2d_batch.createPassReusable`. |
| `clampTime` | `dynamic` | — | Value forwarded as `clampTime` to `mq3.renderer.qvm_2d_batch.createPassReusable`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L224)

<a id="function-function-mq3-renderer-qvm-2d-batch-createpassreusable-function-createpassreusable-stage-triangles-timeoffset-clamptime-previous-src-mq3-renderer-qvm-2d-batch-ml-976614020"></a>
### createPassReusable

```ml
function createPassReusable(stage, triangles, timeOffset, clampTime, previous)
```

Builds `mq3.renderer.qvm_2d_batch.StagePass` using `mq3.platform.playable_window.resetTriangleBatch`, `mq3.platform.playable_window.createTriangleBatch`, `mq3.platform.playable_window.appendScreenQuad`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Initial value for `mq3.renderer.qvm_2d_batch.StagePass.stage`. |
| `triangles` | `dynamic` | — | Initial value for `mq3.renderer.qvm_2d_batch.StagePass.triangles`. |
| `timeOffset` | `dynamic` | — | Initial value for `mq3.renderer.qvm_2d_batch.StagePass.timeOffset`. |
| `clampTime` | `dynamic` | — | Initial value for `mq3.renderer.qvm_2d_batch.StagePass.clampTime`. |
| `previous` | `dynamic` | — | Record providing `previous.batch`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L203)

<a id="function-function-mq3-renderer-qvm-2d-batch-createrun-function-createrun-materialindexvalue-handle-material-quads-src-mq3-renderer-qvm-2d-batch-ml-1778818427"></a>
### createRun

```ml
function createRun(materialIndexValue, handle, material, quads)
```

Calls `mq3.renderer.qvm_2d_batch.createRunReusable` with `(materialIndexValue,handle,material,quads,void)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `materialIndexValue` | `dynamic` | — | Value forwarded as `materialIndexValue` to `mq3.renderer.qvm_2d_batch.createRunReusable`. |
| `handle` | `dynamic` | — | Value forwarded as `handle` to `mq3.renderer.qvm_2d_batch.createRunReusable`. |
| `material` | `dynamic` | — | Value forwarded as `material` to `mq3.renderer.qvm_2d_batch.createRunReusable`. |
| `quads` | `dynamic` | — | Value forwarded as `quads` to `mq3.renderer.qvm_2d_batch.createRunReusable`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L243)

<a id="function-function-mq3-renderer-qvm-2d-batch-createrunreusable-function-createrunreusable-materialindexvalue-handle-material-quads-previous-src-mq3-renderer-qvm-2d-batch-ml-2136620632"></a>
### createRunReusable

```ml
function createRunReusable(materialIndexValue, handle, material, quads, previous)
```

Builds `mq3.renderer.qvm_2d_batch.Run` using `triangleList.addAll`, `triangleList.toArray`, `passList.add`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `materialIndexValue` | `dynamic` | — | Initial value for `mq3.renderer.qvm_2d_batch.Run.materialIndex`. |
| `handle` | `dynamic` | — | Initial value for `mq3.renderer.qvm_2d_batch.Run.shaderHandle`. |
| `material` | `dynamic` | — | Record providing `material.stages`, `material.timeOffset`, `material.clampTime`. |
| `quads` | `dynamic` | — | Sequence traversed as `quad` while producing this result. |
| `previous` | `dynamic` | — | Record providing `previous.materialIndex`, `previous.shaderHandle`, `previous.triangleCount`, `previous.passes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L231)

<a id="function-function-mq3-renderer-qvm-2d-batch-directstage-function-directstage-imagename-image-slot-src-mq3-renderer-qvm-2d-batch-ml-1487107219"></a>
### directStage

```ml
function directStage(imageName, image, slot)
```

Forwards `directStage` to `mq3.renderer.playable_materials.RuntimeStage` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `imageName` | `dynamic` | — | Name stored in the single-image runtime stage. |
| `image` | `dynamic` | — | Decoded image object stored in the stage. |
| `slot` | `dynamic` | — | Native texture slot assigned to that image. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L145)

<a id="function-function-mq3-renderer-qvm-2d-batch-draw-function-draw-catalog-nowmilliseconds-src-mq3-renderer-qvm-2d-batch-ml-1709221605"></a>
### draw

```ml
function draw(catalog, nowMilliseconds)
```

Updates and draws each 2D shader pass, then restores clamp, alpha-test, and opaque depth-write defaults.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Record providing `catalog.runs`. |
| `nowMilliseconds` | `dynamic` | — | Value forwarded as `nowMilliseconds` to `mq3.renderer.qvm_2d_batch.updatePass`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L412)

<a id="function-function-mq3-renderer-qvm-2d-batch-dynamicstage-function-dynamicstage-stage-src-mq3-renderer-qvm-2d-batch-ml-1505002230"></a>
### dynamicStage

```ml
function dynamicStage(stage)
```

Identifies 2D stages with animation, UV modifiers, nontexture coordinate generation, or waveform color/alpha.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Record providing `stage.slots`, `stage.uvMods`, `stage.tcGen`, `stage.rgbGen`, `stage.alphaGen`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L88)

<a id="function-function-mq3-renderer-qvm-2d-batch-extract-function-extract-queuecommands-assets-kinds-sourcewidth-sourceheight-targetwidth-targetheight-src-mq3-renderer-qvm-2d-batch-ml-669948509"></a>
### extract

```ml
function extract(queueCommands, assets, kinds, sourceWidth, sourceHeight, targetWidth, targetHeight)
```

Builds `mq3.renderer.qvm_2d_batch.Extracted` using `quadList.add`, `quadList.toArray`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `queueCommands` | `dynamic` | — | Sequence traversed as `command` while producing this result. |
| `assets` | `dynamic` | — | Value forwarded as `assets` to `mq3.renderer.qvm_2d_batch.shaderName`. |
| `kinds` | `dynamic` | — | Value forwarded as `kinds` to `mq3.renderer.qvm_2d_batch.shaderName`. |
| `sourceWidth` | `dynamic` | — | Initial value for `mq3.renderer.qvm_2d_batch.Extracted.sourceWidth`. |
| `sourceHeight` | `dynamic` | — | Initial value for `mq3.renderer.qvm_2d_batch.Extracted.sourceHeight`. |
| `targetWidth` | `dynamic` | — | Initial value for `mq3.renderer.qvm_2d_batch.Extracted.targetWidth`. |
| `targetHeight` | `dynamic` | — | Initial value for `mq3.renderer.qvm_2d_batch.Extracted.targetHeight`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L101)

- [mq3.renderer.qvm_2d_batch.Extracted](Type-mq3-renderer-qvm-2d-batch-extracted-1202872729.md) — struct
<a id="function-function-mq3-renderer-qvm-2d-batch-fail-function-fail-message-src-mq3-renderer-qvm-2d-batch-ml-270796047"></a>
### fail

```ml
function fail(message)
```

Creates error `7683` with message `"QVM 2D batch: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7683,"QVM 2D batch: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L40)

<a id="function-function-mq3-renderer-qvm-2d-batch-loadmaterial-function-loadmaterial-archive-index-quad-nextslot-endslot-src-mq3-renderer-qvm-2d-batch-ml-619237997"></a>
### loadMaterial

```ml
function loadMaterial(archive, index, quad, nextSlot, endSlot)
```

Computes `loadMaterial` from `[Material(quad.shaderHandle,name,stages,noMip,0.0,clampTime),nextSlot]` using `mq3.renderer.shader_index.find`, `mq3.renderer.playable_materials.runtimeStages`, `mq3.renderer.playable_materials.loadImage`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_materials.runtimeStages`. |
| `index` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.shader_index.find`. |
| `quad` | `dynamic` | — | Record providing `quad.shaderName`, `quad.shaderHandle`. |
| `nextSlot` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.playable_materials.runtimeStages`. |
| `endSlot` | `dynamic` | — | Argument 5 supplied to `mq3.renderer.playable_materials.runtimeStages`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L178)

- [mq3.renderer.qvm_2d_batch.Material](Type-mq3-renderer-qvm-2d-batch-material-1663811394.md) — struct
<a id="function-function-mq3-renderer-qvm-2d-batch-materialindex-function-materialindex-materiallist-handle-src-mq3-renderer-qvm-2d-batch-ml-321835775"></a>
### materialIndex

```ml
function materialIndex(materialList, handle)
```

Returns `-1` from `mq3.renderer.qvm_2d_batch.materialIndex`; earlier branches return `-1`, `index`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `materialList` | `dynamic` | — | Indexed input read at `index`. |
| `handle` | `dynamic` | — | Input used by `for index=0 to len(materialList)-1 if materialList[index].shaderHandle==handle then return index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L151)

<a id="function-function-mq3-renderer-qvm-2d-batch-materialmatches-function-materialmatches-material-name-src-mq3-renderer-qvm-2d-batch-ml-126189980"></a>
### materialMatches

```ml
function materialMatches(material, name)
```

Computes `material!=void and stringEqualsIgnoreCaseAscii(material.shaderName,name)` for `mq3.renderer.qvm_2d_batch.materialMatches`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `material` | `dynamic` | — | Record providing `material.shaderName`. |
| `name` | `dynamic` | — | Argument 2 supplied to `stringEqualsIgnoreCaseAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L159)

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
| `catalog` | `dynamic` | — | Mutable record or buffer; this call updates `catalog.runs`, `catalog.sourceQuads`, `catalog.emittedTriangles`, `catalog.resolvedQuads`, `catalog.unresolvedQuads`. |
| `queueCommands` | `dynamic` | — | Value assigned to `catalog.lastCommands`. |
| `assets` | `dynamic` | — | Value forwarded as `assets` to `mq3.renderer.qvm_2d_batch.extract`. |
| `kinds` | `dynamic` | — | Value forwarded as `kinds` to `mq3.renderer.qvm_2d_batch.extract`. |
| `sourceWidth` | `dynamic` | — | Value assigned to `catalog.sourceWidth`. |
| `sourceHeight` | `dynamic` | — | Value assigned to `catalog.sourceHeight`. |
| `targetWidth` | `dynamic` | — | Value assigned to `catalog.targetWidth`. |
| `targetHeight` | `dynamic` | — | Value assigned to `catalog.targetHeight`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L286)

<a id="function-function-mq3-renderer-qvm-2d-batch-refreshstatictopology-function-refreshstatictopology-catalog-queuecommands-sourcewidth-sourceheight-targetwidth-targetheight-src-mq3-renderer-qvm-2d-batch-ml-1313836848"></a>
### refreshStaticTopology

```ml
function refreshStaticTopology(catalog, queueCommands, sourceWidth, sourceHeight, targetWidth, targetHeight)
```

Updates `catalog.lastCommands`, `catalog.sourceWidth`, `catalog.sourceHeight`, `catalog.targetWidth`, `catalog.targetHeight` in `mq3.renderer.qvm_2d_batch.refreshStaticTopology`; returns `catalog`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Mutable record or buffer; this call updates `catalog.lastCommands`, `catalog.sourceWidth`, `catalog.sourceHeight`, `catalog.targetWidth`, `catalog.targetHeight`. |
| `queueCommands` | `dynamic` | — | Value assigned to `catalog.lastCommands`. |
| `sourceWidth` | `dynamic` | — | Value assigned to `catalog.sourceWidth`. |
| `sourceHeight` | `dynamic` | — | Value assigned to `catalog.sourceHeight`. |
| `targetWidth` | `dynamic` | — | Value assigned to `catalog.targetWidth`. |
| `targetHeight` | `dynamic` | — | Value assigned to `catalog.targetHeight`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L252)

<a id="function-function-mq3-renderer-qvm-2d-batch-release-function-release-catalog-src-mq3-renderer-qvm-2d-batch-ml-309093829"></a>
### release

```ml
function release(catalog)
```

Returns `void` from `mq3.renderer.qvm_2d_batch.release`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Record providing `catalog.textures`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L392)

- [mq3.renderer.qvm_2d_batch.Run](Type-mq3-renderer-qvm-2d-batch-run-1128412860.md) — struct
<a id="function-function-mq3-renderer-qvm-2d-batch-samecommands-function-samecommands-left-right-src-mq3-renderer-qvm-2d-batch-ml-541404109"></a>
### sameCommands

```ml
function sameCommands(left, right)
```

Compares command count, command IDs, shaders, and all associated command values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Indexed input read at `index`. |
| `right` | `dynamic` | — | Indexed input read at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L75)

<a id="function-function-mq3-renderer-qvm-2d-batch-sametopology-function-sametopology-left-right-src-mq3-renderer-qvm-2d-batch-ml-367066377"></a>
### sameTopology

```ml
function sameTopology(left, right)
```

Compares only command count, IDs, and shaders to determine whether 2D batch topology can be reused.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Indexed input read at `index`. |
| `right` | `dynamic` | — | Indexed input read at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L82)

<a id="function-function-mq3-renderer-qvm-2d-batch-samevalues-function-samevalues-left-right-src-mq3-renderer-qvm-2d-batch-ml-206195597"></a>
### sameValues

```ml
function sameValues(left, right)
```

Returns `true` from `mq3.renderer.qvm_2d_batch.sameValues`; earlier branches return `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Indexed input read at `index`. |
| `right` | `dynamic` | — | Indexed input read at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L68)

<a id="function-function-mq3-renderer-qvm-2d-batch-scaledpoint-function-scaledpoint-x-y-scalex-scaley-src-mq3-renderer-qvm-2d-batch-ml-1015396554"></a>
### scaledPoint

```ml
function scaledPoint(x, y, scaleX, scaleY)
```

Constructs `mq3.renderer.qvm_2d_batch.Point` with `x` = `x*scaleX`, `y` = `y*scaleY`, `depth` = `SCREEN_DEPTH`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — | Input used in the result expression `Point(x*scaleX,y*scaleY,SCREEN_DEPTH)`. |
| `y` | `dynamic` | — | Input used in the result expression `Point(x*scaleX,y*scaleY,SCREEN_DEPTH)`. |
| `scaleX` | `dynamic` | — | Input used in the result expression `Point(x*scaleX,y*scaleY,SCREEN_DEPTH)`. |
| `scaleY` | `dynamic` | — | Input used in the result expression `Point(x*scaleX,y*scaleY,SCREEN_DEPTH)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L64)

<a id="constant-constant-mq3-renderer-qvm-2d-batch-screen-depth-const-screen-depth-0-001-src-mq3-renderer-qvm-2d-batch-ml-1326404104"></a>
### SCREEN_DEPTH

```ml
const SCREEN_DEPTH = 0.001
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L17)

<a id="function-function-mq3-renderer-qvm-2d-batch-shadername-function-shadername-assets-kinds-handle-src-mq3-renderer-qvm-2d-batch-ml-300246634"></a>
### shaderName

```ml
function shaderName(assets, kinds, handle)
```

Returns `assets[handle-1]` from `mq3.renderer.qvm_2d_batch.shaderName`; earlier branches return `""`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `assets` | `dynamic` | — | Indexed input read at `handle-1`. |
| `kinds` | `dynamic` | — | Indexed input read at `handle-1`. |
| `handle` | `dynamic` | — | Input tested by `handle<=0 or handle>len(assets) or handle>len(kinds)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L50)

<a id="function-function-mq3-renderer-qvm-2d-batch-shadernomip-function-shadernomip-kinds-handle-src-mq3-renderer-qvm-2d-batch-ml-362552093"></a>
### shaderNoMip

```ml
function shaderNoMip(kinds, handle)
```

Computes `handle>0 and handle<=len(kinds) and kinds[handle-1]=="shaderNoMip"` for `mq3.renderer.qvm_2d_batch.shaderNoMip`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `kinds` | `dynamic` | — | Indexed input read at `handle-1`. |
| `handle` | `dynamic` | — | Input used in the result expression `handle>0 and handle<=len(kinds) and kinds[handle-1]=="shaderNoMip"`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L58)

- [mq3.renderer.qvm_2d_batch.StagePass](Type-mq3-renderer-qvm-2d-batch-stagepass-1079493082.md) — struct
- [mq3.renderer.qvm_2d_batch.Texture](Type-mq3-renderer-qvm-2d-batch-texture-689632650.md) — struct
- [mq3.renderer.qvm_2d_batch.Triangle](Type-mq3-renderer-qvm-2d-batch-triangle-1848591687.md) — struct
<a id="function-function-mq3-renderer-qvm-2d-batch-trianglesfor-function-trianglesfor-quad-materialindex-src-mq3-renderer-qvm-2d-batch-ml-82575982"></a>
### trianglesFor

```ml
function trianglesFor(quad, materialIndex)
```

Splits a HUD quad into two triangles while preserving UVs, RGBA modulation, and the source command index.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `quad` | `dynamic` | — | Record providing `quad.positions`, `quad.texCoords`, `quad.color`, `quad.commandIndex`. |
| `materialIndex` | `dynamic` | — | Unused compatibility argument retained by this entry point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L126)

<a id="function-function-mq3-renderer-qvm-2d-batch-updatepass-function-updatepass-pass-nowmilliseconds-src-mq3-renderer-qvm-2d-batch-ml-1338294385"></a>
### updatePass

```ml
function updatePass(pass, nowMilliseconds)
```

Updates `pass.initialized` in `mq3.renderer.qvm_2d_batch.updatePass`; returns `slot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pass` | `dynamic` | — | Mutable record or buffer; this call updates `pass.initialized`. |
| `nowMilliseconds` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.playable_materials.shaderMilliseconds`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L397)

<a id="function-function-mq3-renderer-qvm-2d-batch-upload-function-upload-catalog-src-mq3-renderer-qvm-2d-batch-ml-1964842803"></a>
### upload

```ml
function upload(catalog)
```

Calls `mq3.renderer.qvm_2d_batch.uploadFrom` with `(catalog,0)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Value forwarded as `catalog` to `mq3.renderer.qvm_2d_batch.uploadFrom`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L389)

<a id="function-function-mq3-renderer-qvm-2d-batch-uploadfrom-function-uploadfrom-catalog-first-src-mq3-renderer-qvm-2d-batch-ml-2060906149"></a>
### uploadFrom

```ml
function uploadFrom(catalog, first)
```

Computes `uploadFrom` from `len(catalog.textures)` using `mq3.platform.playable_window.uploadTextureMipmapped`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `catalog` | `dynamic` | — | Record providing `catalog.textures`. |
| `first` | `dynamic` | — | Input tested by `first<0 or first>len(catalog.textures)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L377)

<a id="function-function-mq3-renderer-qvm-2d-batch-whiteimage-function-whiteimage-src-mq3-renderer-qvm-2d-batch-ml-340282714"></a>
### whiteImage

```ml
function whiteImage()
```

Calls `mq3.renderer.playable_materials.Image` with `(1,1,bytes(4,255))` and returns its result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/qvm_2d_batch.ml#L133)
