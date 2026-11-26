# `src/mq3/renderer/shader_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.shader_runtime`](Package-mq3-renderer-shader-runtime-1610576963.md)

Reachable from entry: **no**

## Imports

- `mq3/renderer/shader_index.ml` as `shaderIndex` → [src/mq3/renderer/shader_index.ml](File-src-mq3-renderer-shader-index-ml-492021135.md)
- `mq3/renderer/shader_parser.ml` as `shaderParser` → [src/mq3/renderer/shader_parser.ml](File-src-mq3-renderer-shader-parser-ml-2114769074.md)
- `mq3/renderer/shader_remap.ml` as `shaderRemap` → [src/mq3/renderer/shader_remap.ml](File-src-mq3-renderer-shader-remap-ml-1685814656.md)
- `mq3/shared/parser.ml` as `parser` → [src/mq3/shared/parser.ml](File-src-mq3-shared-parser-ml-1977832534.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-shader-runtime-collapsemode-function-collapsemode-first-second-src-mq3-renderer-shader-runtime-ml-2111485574"></a>
### collapseMode

```ml
function collapseMode(first, second)
```

Computes `collapseMode` from `""` using `mq3.renderer.shader_runtime.stageBlend`, `if`, `and`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — | Value forwarded as `stage` to `mq3.renderer.shader_runtime.stageBlend`. |
| `second` | `dynamic` | — | Value forwarded as `stage` to `mq3.renderer.shader_runtime.stageBlend`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L139)

<a id="function-function-mq3-renderer-shader-runtime-collapsemultitexture-function-collapsemultitexture-shader-multitextureavailable-addavailable-src-mq3-renderer-shader-runtime-ml-649494806"></a>
### collapseMultitexture

```ml
function collapseMultitexture(shader, multitextureAvailable, addAvailable)
```

Builds `mq3.renderer.shader_runtime.CollapseResult` for `mq3.renderer.shader_runtime.collapseMultitexture`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shader` | `dynamic` | — | Record providing `shader.stages`. |
| `multitextureAvailable` | `dynamic` | — | Input tested by `shader==void or not multitextureAvailable or len(shader.stages)<2`. |
| `addAvailable` | `dynamic` | — | Input tested by `environment=="" or (environment=="add" and not addAvailable)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L149)

- [mq3.renderer.shader_runtime.CollapseResult](Type-mq3-renderer-shader-runtime-collapseresult-2142915461.md) — struct
<a id="function-function-mq3-renderer-shader-runtime-computestageiteratorfunc-function-computestageiteratorfunc-shader-collapse-ignorefastpath-src-mq3-renderer-shader-runtime-ml-1105009575"></a>
### computeStageIteratorFunc

```ml
function computeStageIteratorFunc(shader, collapse, ignoreFastPath)
```

Computes `computeStageIteratorFunc` from `"generic"` using `mq3.renderer.shader_runtime.has`, `and`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shader` | `dynamic` | — | Record providing `shader.surfaceParms`, `shader.stages`, `shader.polygonOffset`, `shader.deforms`. |
| `collapse` | `dynamic` | — | Record providing `collapse.collapsed`, `collapse.environment`. |
| `ignoreFastPath` | `dynamic` | — | Input tested by `ignoreFastPath`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L186)

<a id="function-function-mq3-renderer-shader-runtime-create-function-create-context-loadimagefn-commandfixfn-src-mq3-renderer-shader-runtime-ml-214614938"></a>
### create

```ml
function create(context, loadImageFn, commandFixFn)
```

Builds `mq3.renderer.shader_runtime.State` using `mq3.renderer.shader_index.build`, `mq3.renderer.shader_remap.create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Initial value for `mq3.renderer.shader_runtime.State.context`. |
| `loadImageFn` | `dynamic` | — | Initial value for `mq3.renderer.shader_runtime.State.loadImageFn`. |
| `commandFixFn` | `dynamic` | — | Initial value for `mq3.renderer.shader_runtime.State.commandFixFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L62)

<a id="function-function-mq3-renderer-shader-runtime-createexternalshaders-function-createexternalshaders-state-src-mq3-renderer-shader-runtime-ml-1362104259"></a>
### createExternalShaders

```ml
function createExternalShaders(state)
```

Returns `3` from `mq3.renderer.shader_runtime.createExternalShaders`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.shader_runtime.r_FindShader`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L339)

<a id="function-function-mq3-renderer-shader-runtime-createinternalshaders-function-createinternalshaders-state-defaultimage-src-mq3-renderer-shader-runtime-ml-642593697"></a>
### createInternalShaders

```ml
function createInternalShaders(state, defaultImage)
```

Updates `state.shaders`, `state.sorted`, `state.assets`, `state.kinds` in `mq3.renderer.shader_runtime.createInternalShaders`; returns `2`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.shaders`, `state.sorted`, `state.assets`, `state.kinds`. |
| `defaultImage` | `dynamic` | — | Value forwarded as `image` to `mq3.renderer.shader_runtime.implicitShader`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L330)

<a id="function-function-mq3-renderer-shader-runtime-findloaded-function-findloaded-state-name-lightmapindex-src-mq3-renderer-shader-runtime-ml-678328306"></a>
### findLoaded

```ml
function findLoaded(state, name, lightmapIndex)
```

Returns `void` from `mq3.renderer.shader_runtime.findLoaded`; earlier branches return `void`, `item`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.shaders`. |
| `name` | `dynamic` | — | Value forwarded as `b` to `mq3.renderer.shader_runtime.sameName`. |
| `lightmapIndex` | `dynamic` | — | Input used by `for each item in state.shaders if sameName(item.name,name) and (item.lightmapIndex==lightmapIndex or item.defaultShader) then return item`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L247)

<a id="function-function-mq3-renderer-shader-runtime-findshaderinshadertext-function-findshaderinshadertext-state-name-src-mq3-renderer-shader-runtime-ml-873939046"></a>
### findShaderInShaderText

```ml
function findShaderInShaderText(state, name)
```

Returns `shaderIndex.find(state.index,name)` from `mq3.renderer.shader_runtime.findShaderInShaderText`; earlier branches return `void`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.index`. |
| `name` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.shader_index.find`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L74)

<a id="function-function-mq3-renderer-shader-runtime-finishshader-function-finishshader-state-shader-lightmapindex-miprawimage-image-explicit-src-mq3-renderer-shader-runtime-ml-1892756666"></a>
### finishShader

```ml
function finishShader(state, shader, lightmapIndex, mipRawImage, image, explicit)
```

Builds `mq3.renderer.shader_runtime.PermanentShader` after updating `shader.sort`, `stage.tcGen`, `shader.stages`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.detailTextures`, `state.vertexLight`, `state.multitexture`, `state.textureEnvAdd`, `state.ignoreFastPath`. |
| `shader` | `dynamic` | — | Initial value for `mq3.renderer.shader_runtime.PermanentShader.shader`. |
| `lightmapIndex` | `dynamic` | — | Value forwarded as `lightmapIndex` to `mq3.renderer.shader_runtime.vertexLightingCollapse`. |
| `mipRawImage` | `dynamic` | — | Initial value for `mq3.renderer.shader_runtime.PermanentShader.mipRawImage`. |
| `image` | `dynamic` | — | Initial value for `mq3.renderer.shader_runtime.PermanentShader.image`. |
| `explicit` | `dynamic` | — | Initial value for `mq3.renderer.shader_runtime.PermanentShader.explicitlyDefined`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L201)

<a id="function-function-mq3-renderer-shader-runtime-fixrendercommandlist-function-fixrendercommandlist-state-newshader-src-mq3-renderer-shader-runtime-ml-879017634"></a>
### fixRenderCommandList

```ml
function fixRenderCommandList(state, newShader)
```

Returns `0` from `mq3.renderer.shader_runtime.fixRenderCommandList`; earlier branches return `state.commandFixFn(state.context,newShader)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.commandFixFn`, `state.context`. |
| `newShader` | `dynamic` | — | Argument 2 supplied to `state.commandFixFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L227)

<a id="function-function-mq3-renderer-shader-runtime-generatehashvalue-function-generatehashvalue-name-size-src-mq3-renderer-shader-runtime-ml-1801932876"></a>
### generateHashValue

```ml
function generateHashValue(name, size)
```

Parser and shader-text entry points -----------------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.shader_index.hashValue`. |
| `size` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.shader_index.hashValue`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L70)

<a id="function-function-mq3-renderer-shader-runtime-generatepermanentshader-function-generatepermanentshader-state-record-src-mq3-renderer-shader-runtime-ml-1459351724"></a>
### generatePermanentShader

```ml
function generatePermanentShader(state, record)
```

Updates `record.handle`, `state.shaders`, `state.assets`, `state.kinds` in `mq3.renderer.shader_runtime.generatePermanentShader`; returns `record`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.shaders`, `state.assets`, `state.kinds`. |
| `record` | `dynamic` | — | Mutable record or buffer; this call updates `record.handle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L239)

<a id="function-function-mq3-renderer-shader-runtime-has-function-has-values-value-src-mq3-renderer-shader-runtime-ml-717555831"></a>
### has

```ml
function has(values, value)
```

Returns `false` from `mq3.renderer.shader_runtime.has`; earlier branches return `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Sequence traversed as `item` while producing this result. |
| `value` | `dynamic` | — | Input used by `for each item in values if item==value then return true`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L52)

<a id="function-function-mq3-renderer-shader-runtime-implicitshader-function-implicitshader-name-lightmapindex-image-src-mq3-renderer-shader-runtime-ml-2124410682"></a>
### implicitShader

```ml
function implicitShader(name, lightmapIndex, image)
```

Builds `stage.images`, `stage.rgbGen`, `stage.alphaGen`, `stage.depthWrite`, `stage.blendSrc` in `mq3.renderer.shader_runtime.implicitShader`; returns `shader`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Value forwarded as `name` to `mq3.renderer.shader_runtime.stripExtension`. |
| `lightmapIndex` | `dynamic` | — | Input tested by `lightmapIndex==LIGHTMAP_NONE`. |
| `image` | `dynamic` | — | Input used by `stage.images=[image]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L259)

<a id="constant-constant-mq3-renderer-shader-runtime-lightmap-2d-const-lightmap-2d-3-src-mq3-renderer-shader-runtime-ml-2020322995"></a>
### LIGHTMAP_2D

```ml
const LIGHTMAP_2D = -3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L14)

<a id="constant-constant-mq3-renderer-shader-runtime-lightmap-by-vertex-const-lightmap-by-vertex-2-src-mq3-renderer-shader-runtime-ml-109322994"></a>
### LIGHTMAP_BY_VERTEX

```ml
const LIGHTMAP_BY_VERTEX = -2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L13)

<a id="constant-constant-mq3-renderer-shader-runtime-lightmap-none-const-lightmap-none-1-src-mq3-renderer-shader-runtime-ml-494735809"></a>
### LIGHTMAP_NONE

```ml
const LIGHTMAP_NONE = -1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L12)

<a id="constant-constant-mq3-renderer-shader-runtime-lightmap-whiteimage-const-lightmap-whiteimage-4-src-mq3-renderer-shader-runtime-ml-1753623624"></a>
### LIGHTMAP_WHITEIMAGE

```ml
const LIGHTMAP_WHITEIMAGE = -4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L15)

<a id="function-function-mq3-renderer-shader-runtime-loadimage-function-loadimage-state-name-miprawimage-src-mq3-renderer-shader-runtime-ml-595709983"></a>
### loadImage

```ml
function loadImage(state, name, mipRawImage)
```

Returns `state.loadImageFn(state.context,name,mipRawImage)` from `mq3.renderer.shader_runtime.loadImage`; earlier branches return `void`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.loadImageFn`, `state.context`. |
| `name` | `dynamic` | — | Argument 2 supplied to `state.loadImageFn`. |
| `mipRawImage` | `dynamic` | — | Argument 3 supplied to `state.loadImageFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L254)

<a id="function-function-mq3-renderer-shader-runtime-lower-function-lower-value-src-mq3-renderer-shader-runtime-ml-2122659127"></a>
### lower

```ml
function lower(value)
```

Returns `strings.toLowerAscii(value)` from `mq3.renderer.shader_runtime.lower`; earlier branches return `""`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Argument 1 supplied to `std.string.toLowerAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L37)

<a id="function-function-mq3-renderer-shader-runtime-modes-function-modes-src-mq3-renderer-shader-runtime-ml-1191274866"></a>
### modes

```ml
function modes()
```

Original static tables exposed as deterministic native contracts.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L122)

<a id="function-function-mq3-renderer-shader-runtime-nametoafunc-function-nametoafunc-name-src-mq3-renderer-shader-runtime-ml-2100071219"></a>
### nameToAFunc

```ml
function nameToAFunc(name)
```

Calls `mq3.renderer.shader_parser.nameToAFunc` with `(name)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.shader_parser.nameToAFunc`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L77)

<a id="function-function-mq3-renderer-shader-runtime-nametodstblendmode-function-nametodstblendmode-name-src-mq3-renderer-shader-runtime-ml-307525785"></a>
### nameToDstBlendMode

```ml
function nameToDstBlendMode(name)
```

Calls `mq3.renderer.shader_parser.nameToDstBlendMode` with `(name)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.shader_parser.nameToDstBlendMode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L83)

<a id="function-function-mq3-renderer-shader-runtime-nametogenfunc-function-nametogenfunc-name-src-mq3-renderer-shader-runtime-ml-1950796865"></a>
### nameToGenFunc

```ml
function nameToGenFunc(name)
```

Calls `mq3.renderer.shader_parser.nameToGenFunc` with `(name)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.shader_parser.nameToGenFunc`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L86)

<a id="function-function-mq3-renderer-shader-runtime-nametosrcblendmode-function-nametosrcblendmode-name-src-mq3-renderer-shader-runtime-ml-425446657"></a>
### nameToSrcBlendMode

```ml
function nameToSrcBlendMode(name)
```

Calls `mq3.renderer.shader_parser.nameToSrcBlendMode` with `(name)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.shader_parser.nameToSrcBlendMode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L80)

<a id="function-function-mq3-renderer-shader-runtime-parsedeform-function-parsedeform-state-src-mq3-renderer-shader-runtime-ml-671672661"></a>
### parseDeform

```ml
function parseDeform(state)
```

Calls `mq3.renderer.shader_parser.parseDeform` with `(state)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.shader_parser.parseDeform`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L102)

<a id="function-function-mq3-renderer-shader-runtime-parseshader-function-parseshader-text-name-src-mq3-renderer-shader-runtime-ml-1005028498"></a>
### parseShader

```ml
function parseShader(text, name)
```

Calls `mq3.renderer.shader_parser.parseText` with `(text,name)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.shader_parser.parseText`. |
| `name` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.shader_parser.parseText`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L119)

<a id="function-function-mq3-renderer-shader-runtime-parseskyparms-function-parseskyparms-outerbox-cloudheight-innerbox-src-mq3-renderer-shader-runtime-ml-170868057"></a>
### parseSkyParms

```ml
function parseSkyParms(outerBox, cloudHeight, innerBox)
```

Constructs `mq3.renderer.shader_runtime.SkyParms` from `outerBox`, `cloudHeight`, `innerBox`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `outerBox` | `dynamic` | — | Initial value for `mq3.renderer.shader_runtime.SkyParms.outerBox`. |
| `cloudHeight` | `dynamic` | — | Initial value for `mq3.renderer.shader_runtime.SkyParms.cloudHeight`. |
| `innerBox` | `dynamic` | — | Initial value for `mq3.renderer.shader_runtime.SkyParms.innerBox`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L107)

<a id="function-function-mq3-renderer-shader-runtime-parsesort-function-parsesort-shader-value-src-mq3-renderer-shader-runtime-ml-758167748"></a>
### parseSort

```ml
function parseSort(shader, value)
```

Updates `shader.sort` in `mq3.renderer.shader_runtime.parseSort`; returns `shader.sort`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shader` | `dynamic` | — | Mutable record or buffer; this call updates `shader.sort`. |
| `value` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.shader_parser.sortValue`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L111)

<a id="function-function-mq3-renderer-shader-runtime-parsestage-function-parsestage-state-src-mq3-renderer-shader-runtime-ml-179937941"></a>
### parseStage

```ml
function parseStage(state)
```

Calls `mq3.renderer.shader_parser.parseStage` with `(state)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.shader_parser.parseStage`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L99)

<a id="function-function-mq3-renderer-shader-runtime-parsesurfaceparm-function-parsesurfaceparm-shader-value-src-mq3-renderer-shader-runtime-ml-68614146"></a>
### parseSurfaceParm

```ml
function parseSurfaceParm(shader, value)
```

Updates `shader.surfaceParms` in `mq3.renderer.shader_runtime.parseSurfaceParm`; returns `name`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shader` | `dynamic` | — | Mutable record or buffer; this call updates `shader.surfaceParms`. |
| `value` | `dynamic` | — | Value forwarded as `value` to `mq3.renderer.shader_runtime.lower`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L115)

<a id="function-function-mq3-renderer-shader-runtime-parsetexmod-function-parsetexmod-tokens-src-mq3-renderer-shader-runtime-ml-1620050320"></a>
### parseTexMod

```ml
function parseTexMod(tokens)
```

Calls `mq3.renderer.shader_parser.parseTexMod` with `(tokens)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `tokens` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.shader_parser.parseTexMod`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L96)

<a id="function-function-mq3-renderer-shader-runtime-parsevector-function-parsevector-state-count-src-mq3-renderer-shader-runtime-ml-907546982"></a>
### parseVector

```ml
function parseVector(state, count)
```

Calls `mq3.renderer.shader_parser.parseVector` with `(state,count)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.shader_parser.parseVector`. |
| `count` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.shader_parser.parseVector`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L90)

<a id="function-function-mq3-renderer-shader-runtime-parsewaveform-function-parsewaveform-state-src-mq3-renderer-shader-runtime-ml-462639601"></a>
### parseWaveForm

```ml
function parseWaveForm(state)
```

Calls `mq3.renderer.shader_parser.parseWave` with `(state)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 supplied to `mq3.renderer.shader_parser.parseWave`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L93)

- [mq3.renderer.shader_runtime.PermanentShader](Type-mq3-renderer-shader-runtime-permanentshader-1958080594.md) — struct
<a id="function-function-mq3-renderer-shader-runtime-r-findshader-function-r-findshader-state-name-lightmapindex-miprawimage-src-mq3-renderer-shader-runtime-ml-1122039445"></a>
### r_FindShader

```ml
function r_FindShader(state, name, lightmapIndex, mipRawImage)
```

Builds `record.defaultShader` in `mq3.renderer.shader_runtime.r_FindShader`; returns `generatePermanentShader(state,record)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.numLightmaps`, `state.index`. |
| `name` | `dynamic` | — | Value forwarded as `name` to `mq3.renderer.shader_runtime.stripExtension`. |
| `lightmapIndex` | `dynamic` | — | Value forwarded as `lightmapIndex` to `mq3.renderer.shader_runtime.findLoaded`. |
| `mipRawImage` | `dynamic` | — | Value forwarded as `mipRawImage` to `mq3.renderer.shader_runtime.finishShader`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L272)

<a id="function-function-mq3-renderer-shader-runtime-r-findshaderbyname-function-r-findshaderbyname-state-name-src-mq3-renderer-shader-runtime-ml-1637148206"></a>
### r_FindShaderByName

```ml
function r_FindShaderByName(state, name)
```

Returns `void` from `mq3.renderer.shader_runtime.r_FindShaderByName`; earlier branches return `void`, `item`, `state.shaders[0]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.shaders`. |
| `name` | `dynamic` | — | Value forwarded as `b` to `mq3.renderer.shader_runtime.sameName`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L287)

<a id="function-function-mq3-renderer-shader-runtime-r-initshaders-function-r-initshaders-state-sources-defaultimage-src-mq3-renderer-shader-runtime-ml-766697883"></a>
### r_InitShaders

```ml
function r_InitShaders(state, sources, defaultImage)
```

Updates `state.initialized` in `mq3.renderer.shader_runtime.r_InitShaders`; returns `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.initialized`. |
| `sources` | `dynamic` | — | Value forwarded as `sources` to `mq3.renderer.shader_runtime.scanAndLoadShaderFiles`. |
| `defaultImage` | `dynamic` | — | Value forwarded as `defaultImage` to `mq3.renderer.shader_runtime.createInternalShaders`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L344)

<a id="function-function-mq3-renderer-shader-runtime-r-remapshader-function-r-remapshader-state-oldname-newname-timeoffset-src-mq3-renderer-shader-runtime-ml-1872593126"></a>
### r_RemapShader

```ml
function r_RemapShader(state, oldName, newName, timeOffset)
```

Builds `record.remappedName`, `record.timeOffset` in `mq3.renderer.shader_runtime.r_RemapShader`; returns `changed`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.remaps`, `state.assets`, `state.kinds`, `state.shaders`. |
| `oldName` | `dynamic` | — | Argument 4 supplied to `mq3.renderer.shader_remap.apply`. |
| `newName` | `dynamic` | — | Value assigned to `record.remappedName`. |
| `timeOffset` | `dynamic` | — | Value assigned to `record.timeOffset`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L309)

<a id="function-function-mq3-renderer-shader-runtime-r-shaderlist-f-function-r-shaderlist-f-state-sorted-src-mq3-renderer-shader-runtime-ml-1310205376"></a>
### r_ShaderList_f

```ml
function r_ShaderList_f(state, sorted)
```

Formats registered shaders with lightmap, multitexture, explicit-definition, iterator, and fallback markers.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record providing `state.shaders`, `state.sorted`. |
| `sorted` | `dynamic` | — | Input tested by `sorted`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L316)

<a id="function-function-mq3-renderer-shader-runtime-re-registershaderfromimage-function-re-registershaderfromimage-state-name-lightmapindex-image-miprawimage-src-mq3-renderer-shader-runtime-ml-1452815120"></a>
### re_RegisterShaderFromImage

```ml
function re_RegisterShaderFromImage(state, name, lightmapIndex, image, mipRawImage)
```

Builds `record.defaultShader` in `mq3.renderer.shader_runtime.re_RegisterShaderFromImage`; returns `record.handle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.shader_runtime.findLoaded`. |
| `name` | `dynamic` | — | Value forwarded as `name` to `mq3.renderer.shader_runtime.findLoaded`. |
| `lightmapIndex` | `dynamic` | — | Value forwarded as `lightmapIndex` to `mq3.renderer.shader_runtime.findLoaded`. |
| `image` | `dynamic` | — | Value forwarded as `image` to `mq3.renderer.shader_runtime.implicitShader`. |
| `mipRawImage` | `dynamic` | — | Value forwarded as `mipRawImage` to `mq3.renderer.shader_runtime.finishShader`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L296)

<a id="function-function-mq3-renderer-shader-runtime-re-registershadernomip-function-re-registershadernomip-state-name-src-mq3-renderer-shader-runtime-ml-1776083258"></a>
### re_RegisterShaderNoMip

```ml
function re_RegisterShaderNoMip(state, name)
```

Returns `record.handle` from `mq3.renderer.shader_runtime.re_RegisterShaderNoMip`; earlier branches return `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.shader_runtime.r_FindShader`. |
| `name` | `dynamic` | — | Value forwarded as `name` to `mq3.renderer.shader_runtime.r_FindShader`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L302)

<a id="function-function-mq3-renderer-shader-runtime-samename-function-samename-a-b-src-mq3-renderer-shader-runtime-ml-555744137"></a>
### sameName

```ml
function sameName(a, b)
```

Calls `stringEqualsIgnoreCaseAscii` with `(stripExtension(a),stripExtension(b))` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Value forwarded as `name` to `mq3.renderer.shader_runtime.stripExtension`. |
| `b` | `dynamic` | — | Value forwarded as `name` to `mq3.renderer.shader_runtime.stripExtension`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L41)

<a id="function-function-mq3-renderer-shader-runtime-scanandloadshaderfiles-function-scanandloadshaderfiles-state-sources-src-mq3-renderer-shader-runtime-ml-1901993287"></a>
### scanAndLoadShaderFiles

```ml
function scanAndLoadShaderFiles(state, sources)
```

Updates `state.text`, `state.index` in `mq3.renderer.shader_runtime.scanAndLoadShaderFiles`; returns `len(state.index.entries)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.text`, `state.index`. |
| `sources` | `dynamic` | — | Indexed input read at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L324)

- [mq3.renderer.shader_runtime.ShaderSource](Type-mq3-renderer-shader-runtime-shadersource-898785343.md) — struct
- [mq3.renderer.shader_runtime.SkyParms](Type-mq3-renderer-shader-runtime-skyparms-1273089407.md) — struct
<a id="function-function-mq3-renderer-shader-runtime-sortnewshader-function-sortnewshader-state-record-src-mq3-renderer-shader-runtime-ml-1701435922"></a>
### sortNewShader

```ml
function sortNewShader(state, record)
```

Updates `state.sorted`, `state.sorted[position].sortedIndex` in `mq3.renderer.shader_runtime.sortNewShader`; returns `index`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.sorted`, `state.sorted[position].sortedIndex`. |
| `record` | `dynamic` | — | Record providing `record.shader`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L231)

<a id="constant-constant-mq3-renderer-shader-runtime-ss-blend0-const-ss-blend0-9-src-mq3-renderer-shader-runtime-ml-1466936588"></a>
### SS_BLEND0

```ml
const SS_BLEND0 = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L21)

<a id="constant-constant-mq3-renderer-shader-runtime-ss-decal-const-ss-decal-4-src-mq3-renderer-shader-runtime-ml-28407443"></a>
### SS_DECAL

```ml
const SS_DECAL = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L19)

<a id="constant-constant-mq3-renderer-shader-runtime-ss-environment-const-ss-environment-2-src-mq3-renderer-shader-runtime-ml-700699353"></a>
### SS_ENVIRONMENT

```ml
const SS_ENVIRONMENT = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L17)

<a id="constant-constant-mq3-renderer-shader-runtime-ss-fog-const-ss-fog-7-src-mq3-renderer-shader-runtime-ml-1115761410"></a>
### SS_FOG

```ml
const SS_FOG = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L22)

<a id="constant-constant-mq3-renderer-shader-runtime-ss-opaque-const-ss-opaque-3-src-mq3-renderer-shader-runtime-ml-2141143086"></a>
### SS_OPAQUE

```ml
const SS_OPAQUE = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L18)

<a id="constant-constant-mq3-renderer-shader-runtime-ss-portal-const-ss-portal-1-src-mq3-renderer-shader-runtime-ml-629210272"></a>
### SS_PORTAL

```ml
const SS_PORTAL = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L16)

<a id="constant-constant-mq3-renderer-shader-runtime-ss-see-through-const-ss-see-through-5-src-mq3-renderer-shader-runtime-ml-550736762"></a>
### SS_SEE_THROUGH

```ml
const SS_SEE_THROUGH = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L20)

<a id="function-function-mq3-renderer-shader-runtime-stageblend-function-stageblend-stage-src-mq3-renderer-shader-runtime-ml-919125130"></a>
### stageBlend

```ml
function stageBlend(stage)
```

Computes `stage.blendSrc|stage.blendDst` for `mq3.renderer.shader_runtime.stageBlend`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Record providing `stage.blendSrc`, `stage.blendDst`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L135)

<a id="function-function-mq3-renderer-shader-runtime-stagerank-function-stagerank-stage-src-mq3-renderer-shader-runtime-ml-944313774"></a>
### stageRank

```ml
function stageRank(stage)
```

Scores lightmaps and nontrivial coordinate/color generation with negative weights for stage ordering.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — | Record providing `stage.isLightmap`, `stage.tcGen`, `stage.texMods`, `stage.rgbGen`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L165)

- [mq3.renderer.shader_runtime.State](Type-mq3-renderer-shader-runtime-state-1190495544.md) — struct
<a id="function-function-mq3-renderer-shader-runtime-stripextension-function-stripextension-name-src-mq3-renderer-shader-runtime-ml-1497590505"></a>
### stripExtension

```ml
function stripExtension(name)
```

Computes `stripExtension` from `decode(slice(data,0,last))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Argument 1 supplied to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L44)

<a id="function-function-mq3-renderer-shader-runtime-valid-function-valid-shader-src-mq3-renderer-shader-runtime-ml-215419631"></a>
### valid

```ml
function valid(shader)
```

Computes `shader!=void and shader.name!="" and (len(shader.stages)>0 or has(shader.surfaceParms,"fog"))` for `mq3.renderer.shader_runtime.valid`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shader` | `dynamic` | — | Record providing `shader.name`, `shader.stages`, `shader.surfaceParms`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L131)

<a id="function-function-mq3-renderer-shader-runtime-vertexlightingcollapse-function-vertexlightingcollapse-shader-lightmapindex-src-mq3-renderer-shader-runtime-ml-183698253"></a>
### vertexLightingCollapse

```ml
function vertexLightingCollapse(shader, lightmapIndex)
```

Updates `shader.stages` in `mq3.renderer.shader_runtime.vertexLightingCollapse`; returns `best`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shader` | `dynamic` | — | Mutable record or buffer; this call updates `shader.stages`. |
| `lightmapIndex` | `dynamic` | — | Input tested by `lightmapIndex==LIGHTMAP_NONE`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L172)

<a id="function-function-mq3-renderer-shader-runtime-waveequal-function-waveequal-a-b-src-mq3-renderer-shader-runtime-ml-1118333711"></a>
### waveEqual

```ml
function waveEqual(a, b)
```

Computes `a.func==b.func and a.base==b.base and a.amplitude==b.amplitude and a.phase==b.phase and a.frequency==b.frequency` for `mq3.renderer.shader_runtime.waveEqual`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Record providing `a.func`, `a.base`, `a.amplitude`, `a.phase`, `a.frequency`. |
| `b` | `dynamic` | — | Record providing `b.func`, `b.base`, `b.amplitude`, `b.phase`, `b.frequency`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/shader_runtime.ml#L56)
