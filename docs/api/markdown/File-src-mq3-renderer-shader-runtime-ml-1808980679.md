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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L73)

<a id="function-function-mq3-renderer-shader-runtime-collapsemultitexture-function-collapsemultitexture-shader-multitextureavailable-addavailable-src-mq3-renderer-shader-runtime-ml-649494806"></a>
### collapseMultitexture

```ml
function collapseMultitexture(shader, multitextureAvailable, addAvailable)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shader` | `dynamic` | — |  |
| `multitextureAvailable` | `dynamic` | — |  |
| `addAvailable` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L79)

- [mq3.renderer.shader_runtime.CollapseResult](Type-mq3-renderer-shader-runtime-collapseresult-2142915461.md) — struct
<a id="function-function-mq3-renderer-shader-runtime-computestageiteratorfunc-function-computestageiteratorfunc-shader-collapse-ignorefastpath-src-mq3-renderer-shader-runtime-ml-1105009575"></a>
### computeStageIteratorFunc

```ml
function computeStageIteratorFunc(shader, collapse, ignoreFastPath)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shader` | `dynamic` | — |  |
| `collapse` | `dynamic` | — |  |
| `ignoreFastPath` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L107)

<a id="function-function-mq3-renderer-shader-runtime-create-function-create-context-loadimagefn-commandfixfn-src-mq3-renderer-shader-runtime-ml-214614938"></a>
### create

```ml
function create(context, loadImageFn, commandFixFn)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `loadImageFn` | `dynamic` | — |  |
| `commandFixFn` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L40)

<a id="function-function-mq3-renderer-shader-runtime-createexternalshaders-function-createexternalshaders-state-src-mq3-renderer-shader-runtime-ml-1362104259"></a>
### createExternalShaders

```ml
function createExternalShaders(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L199)

<a id="function-function-mq3-renderer-shader-runtime-createinternalshaders-function-createinternalshaders-state-defaultimage-src-mq3-renderer-shader-runtime-ml-642593697"></a>
### createInternalShaders

```ml
function createInternalShaders(state, defaultImage)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `defaultImage` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L192)

<a id="function-function-mq3-renderer-shader-runtime-findloaded-function-findloaded-state-name-lightmapindex-src-mq3-renderer-shader-runtime-ml-678328306"></a>
### findLoaded

```ml
function findLoaded(state, name, lightmapIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `lightmapIndex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L148)

<a id="function-function-mq3-renderer-shader-runtime-findshaderinshadertext-function-findshaderinshadertext-state-name-src-mq3-renderer-shader-runtime-ml-873939046"></a>
### findShaderInShaderText

```ml
function findShaderInShaderText(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L47)

<a id="function-function-mq3-renderer-shader-runtime-finishshader-function-finishshader-state-shader-lightmapindex-miprawimage-image-explicit-src-mq3-renderer-shader-runtime-ml-1892756666"></a>
### finishShader

```ml
function finishShader(state, shader, lightmapIndex, mipRawImage, image, explicit)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `shader` | `dynamic` | — |  |
| `lightmapIndex` | `dynamic` | — |  |
| `mipRawImage` | `dynamic` | — |  |
| `image` | `dynamic` | — |  |
| `explicit` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L115)

<a id="function-function-mq3-renderer-shader-runtime-fixrendercommandlist-function-fixrendercommandlist-state-newshader-src-mq3-renderer-shader-runtime-ml-879017634"></a>
### fixRenderCommandList

```ml
function fixRenderCommandList(state, newShader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `newShader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L138)

<a id="function-function-mq3-renderer-shader-runtime-generatehashvalue-function-generatehashvalue-name-size-src-mq3-renderer-shader-runtime-ml-1801932876"></a>
### generateHashValue

```ml
function generateHashValue(name, size)
```

Parser and shader-text entry points -----------------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L46)

<a id="function-function-mq3-renderer-shader-runtime-generatepermanentshader-function-generatepermanentshader-state-record-src-mq3-renderer-shader-runtime-ml-1459351724"></a>
### generatePermanentShader

```ml
function generatePermanentShader(state, record)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `record` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L144)

<a id="function-function-mq3-renderer-shader-runtime-has-function-has-values-value-src-mq3-renderer-shader-runtime-ml-717555831"></a>
### has

```ml
function has(values, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L37)

<a id="function-function-mq3-renderer-shader-runtime-implicitshader-function-implicitshader-name-lightmapindex-image-src-mq3-renderer-shader-runtime-ml-2124410682"></a>
### implicitShader

```ml
function implicitShader(name, lightmapIndex, image)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `lightmapIndex` | `dynamic` | — |  |
| `image` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L152)

<a id="constant-constant-mq3-renderer-shader-runtime-lightmap-2d-const-lightmap-2d-3-src-mq3-renderer-shader-runtime-ml-2020322995"></a>
### LIGHTMAP_2D

```ml
const LIGHTMAP_2D = -3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L14)

<a id="constant-constant-mq3-renderer-shader-runtime-lightmap-by-vertex-const-lightmap-by-vertex-2-src-mq3-renderer-shader-runtime-ml-109322994"></a>
### LIGHTMAP_BY_VERTEX

```ml
const LIGHTMAP_BY_VERTEX = -2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L13)

<a id="constant-constant-mq3-renderer-shader-runtime-lightmap-none-const-lightmap-none-1-src-mq3-renderer-shader-runtime-ml-494735809"></a>
### LIGHTMAP_NONE

```ml
const LIGHTMAP_NONE = -1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L12)

<a id="constant-constant-mq3-renderer-shader-runtime-lightmap-whiteimage-const-lightmap-whiteimage-4-src-mq3-renderer-shader-runtime-ml-1753623624"></a>
### LIGHTMAP_WHITEIMAGE

```ml
const LIGHTMAP_WHITEIMAGE = -4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L15)

<a id="function-function-mq3-renderer-shader-runtime-loadimage-function-loadimage-state-name-miprawimage-src-mq3-renderer-shader-runtime-ml-595709983"></a>
### loadImage

```ml
function loadImage(state, name, mipRawImage)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `mipRawImage` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L151)

<a id="function-function-mq3-renderer-shader-runtime-lower-function-lower-value-src-mq3-renderer-shader-runtime-ml-2122659127"></a>
### lower

```ml
function lower(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L30)

<a id="function-function-mq3-renderer-shader-runtime-modes-function-modes-src-mq3-renderer-shader-runtime-ml-1191274866"></a>
### modes

```ml
function modes()
```

Original static tables exposed as deterministic native contracts.


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L63)

<a id="function-function-mq3-renderer-shader-runtime-nametoafunc-function-nametoafunc-name-src-mq3-renderer-shader-runtime-ml-2100071219"></a>
### nameToAFunc

```ml
function nameToAFunc(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L48)

<a id="function-function-mq3-renderer-shader-runtime-nametodstblendmode-function-nametodstblendmode-name-src-mq3-renderer-shader-runtime-ml-307525785"></a>
### nameToDstBlendMode

```ml
function nameToDstBlendMode(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L50)

<a id="function-function-mq3-renderer-shader-runtime-nametogenfunc-function-nametogenfunc-name-src-mq3-renderer-shader-runtime-ml-1950796865"></a>
### nameToGenFunc

```ml
function nameToGenFunc(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L51)

<a id="function-function-mq3-renderer-shader-runtime-nametosrcblendmode-function-nametosrcblendmode-name-src-mq3-renderer-shader-runtime-ml-425446657"></a>
### nameToSrcBlendMode

```ml
function nameToSrcBlendMode(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L49)

<a id="function-function-mq3-renderer-shader-runtime-parsedeform-function-parsedeform-state-src-mq3-renderer-shader-runtime-ml-671672661"></a>
### parseDeform

```ml
function parseDeform(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L56)

<a id="function-function-mq3-renderer-shader-runtime-parseshader-function-parseshader-text-name-src-mq3-renderer-shader-runtime-ml-1005028498"></a>
### parseShader

```ml
function parseShader(text, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L60)

<a id="function-function-mq3-renderer-shader-runtime-parseskyparms-function-parseskyparms-outerbox-cloudheight-innerbox-src-mq3-renderer-shader-runtime-ml-170868057"></a>
### parseSkyParms

```ml
function parseSkyParms(outerBox, cloudHeight, innerBox)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `outerBox` | `dynamic` | — |  |
| `cloudHeight` | `dynamic` | — |  |
| `innerBox` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L57)

<a id="function-function-mq3-renderer-shader-runtime-parsesort-function-parsesort-shader-value-src-mq3-renderer-shader-runtime-ml-758167748"></a>
### parseSort

```ml
function parseSort(shader, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shader` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L58)

<a id="function-function-mq3-renderer-shader-runtime-parsestage-function-parsestage-state-src-mq3-renderer-shader-runtime-ml-179937941"></a>
### parseStage

```ml
function parseStage(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L55)

<a id="function-function-mq3-renderer-shader-runtime-parsesurfaceparm-function-parsesurfaceparm-shader-value-src-mq3-renderer-shader-runtime-ml-68614146"></a>
### parseSurfaceParm

```ml
function parseSurfaceParm(shader, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shader` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L59)

<a id="function-function-mq3-renderer-shader-runtime-parsetexmod-function-parsetexmod-tokens-src-mq3-renderer-shader-runtime-ml-1620050320"></a>
### parseTexMod

```ml
function parseTexMod(tokens)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `tokens` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L54)

<a id="function-function-mq3-renderer-shader-runtime-parsevector-function-parsevector-state-count-src-mq3-renderer-shader-runtime-ml-907546982"></a>
### parseVector

```ml
function parseVector(state, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L52)

<a id="function-function-mq3-renderer-shader-runtime-parsewaveform-function-parsewaveform-state-src-mq3-renderer-shader-runtime-ml-462639601"></a>
### parseWaveForm

```ml
function parseWaveForm(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L53)

- [mq3.renderer.shader_runtime.PermanentShader](Type-mq3-renderer-shader-runtime-permanentshader-1958080594.md) — struct
<a id="function-function-mq3-renderer-shader-runtime-r-findshader-function-r-findshader-state-name-lightmapindex-miprawimage-src-mq3-renderer-shader-runtime-ml-1122039445"></a>
### r_FindShader

```ml
function r_FindShader(state, name, lightmapIndex, mipRawImage)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `lightmapIndex` | `dynamic` | — |  |
| `mipRawImage` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L160)

<a id="function-function-mq3-renderer-shader-runtime-r-findshaderbyname-function-r-findshaderbyname-state-name-src-mq3-renderer-shader-runtime-ml-1637148206"></a>
### r_FindShaderByName

```ml
function r_FindShaderByName(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L172)

<a id="function-function-mq3-renderer-shader-runtime-r-initshaders-function-r-initshaders-state-sources-defaultimage-src-mq3-renderer-shader-runtime-ml-766697883"></a>
### r_InitShaders

```ml
function r_InitShaders(state, sources, defaultImage)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `sources` | `dynamic` | — |  |
| `defaultImage` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L200)

<a id="function-function-mq3-renderer-shader-runtime-r-remapshader-function-r-remapshader-state-oldname-newname-timeoffset-src-mq3-renderer-shader-runtime-ml-1872593126"></a>
### r_RemapShader

```ml
function r_RemapShader(state, oldName, newName, timeOffset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `oldName` | `dynamic` | — |  |
| `newName` | `dynamic` | — |  |
| `timeOffset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L180)

<a id="function-function-mq3-renderer-shader-runtime-r-shaderlist-f-function-r-shaderlist-f-state-sorted-src-mq3-renderer-shader-runtime-ml-1310205376"></a>
### r_ShaderList_f

```ml
function r_ShaderList_f(state, sorted)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `sorted` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L184)

<a id="function-function-mq3-renderer-shader-runtime-re-registershaderfromimage-function-re-registershaderfromimage-state-name-lightmapindex-image-miprawimage-src-mq3-renderer-shader-runtime-ml-1452815120"></a>
### re_RegisterShaderFromImage

```ml
function re_RegisterShaderFromImage(state, name, lightmapIndex, image, mipRawImage)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `lightmapIndex` | `dynamic` | — |  |
| `image` | `dynamic` | — |  |
| `mipRawImage` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L175)

<a id="function-function-mq3-renderer-shader-runtime-re-registershadernomip-function-re-registershadernomip-state-name-src-mq3-renderer-shader-runtime-ml-1776083258"></a>
### re_RegisterShaderNoMip

```ml
function re_RegisterShaderNoMip(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L178)

<a id="function-function-mq3-renderer-shader-runtime-samename-function-samename-a-b-src-mq3-renderer-shader-runtime-ml-555744137"></a>
### sameName

```ml
function sameName(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L31)

<a id="function-function-mq3-renderer-shader-runtime-scanandloadshaderfiles-function-scanandloadshaderfiles-state-sources-src-mq3-renderer-shader-runtime-ml-1901993287"></a>
### scanAndLoadShaderFiles

```ml
function scanAndLoadShaderFiles(state, sources)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `sources` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L189)

- [mq3.renderer.shader_runtime.ShaderSource](Type-mq3-renderer-shader-runtime-shadersource-898785343.md) — struct
- [mq3.renderer.shader_runtime.SkyParms](Type-mq3-renderer-shader-runtime-skyparms-1273089407.md) — struct
<a id="function-function-mq3-renderer-shader-runtime-sortnewshader-function-sortnewshader-state-record-src-mq3-renderer-shader-runtime-ml-1701435922"></a>
### sortNewShader

```ml
function sortNewShader(state, record)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `record` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L139)

<a id="constant-constant-mq3-renderer-shader-runtime-ss-blend0-const-ss-blend0-9-src-mq3-renderer-shader-runtime-ml-871291794"></a>
### SS_BLEND0

```ml
const SS_BLEND0 = 9.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L21)

<a id="constant-constant-mq3-renderer-shader-runtime-ss-decal-const-ss-decal-4-src-mq3-renderer-shader-runtime-ml-2118608919"></a>
### SS_DECAL

```ml
const SS_DECAL = 4.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L19)

<a id="constant-constant-mq3-renderer-shader-runtime-ss-environment-const-ss-environment-2-src-mq3-renderer-shader-runtime-ml-1962952757"></a>
### SS_ENVIRONMENT

```ml
const SS_ENVIRONMENT = 2.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L17)

<a id="constant-constant-mq3-renderer-shader-runtime-ss-fog-const-ss-fog-7-src-mq3-renderer-shader-runtime-ml-1046966416"></a>
### SS_FOG

```ml
const SS_FOG = 7.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L22)

<a id="constant-constant-mq3-renderer-shader-runtime-ss-opaque-const-ss-opaque-3-src-mq3-renderer-shader-runtime-ml-1781214588"></a>
### SS_OPAQUE

```ml
const SS_OPAQUE = 3.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L18)

<a id="constant-constant-mq3-renderer-shader-runtime-ss-portal-const-ss-portal-1-src-mq3-renderer-shader-runtime-ml-1595675462"></a>
### SS_PORTAL

```ml
const SS_PORTAL = 1.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L16)

<a id="constant-constant-mq3-renderer-shader-runtime-ss-see-through-const-ss-see-through-5-src-mq3-renderer-shader-runtime-ml-1376778056"></a>
### SS_SEE_THROUGH

```ml
const SS_SEE_THROUGH = 5.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L20)

<a id="function-function-mq3-renderer-shader-runtime-stageblend-function-stageblend-stage-src-mq3-renderer-shader-runtime-ml-919125130"></a>
### stageBlend

```ml
function stageBlend(stage)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L72)

<a id="function-function-mq3-renderer-shader-runtime-stagerank-function-stagerank-stage-src-mq3-renderer-shader-runtime-ml-944313774"></a>
### stageRank

```ml
function stageRank(stage)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stage` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L93)

- [mq3.renderer.shader_runtime.State](Type-mq3-renderer-shader-runtime-state-1190495544.md) — struct
<a id="function-function-mq3-renderer-shader-runtime-stripextension-function-stripextension-name-src-mq3-renderer-shader-runtime-ml-1497590505"></a>
### stripExtension

```ml
function stripExtension(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L32)

<a id="function-function-mq3-renderer-shader-runtime-valid-function-valid-shader-src-mq3-renderer-shader-runtime-ml-215419631"></a>
### valid

```ml
function valid(shader)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shader` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L70)

<a id="function-function-mq3-renderer-shader-runtime-vertexlightingcollapse-function-vertexlightingcollapse-shader-lightmapindex-src-mq3-renderer-shader-runtime-ml-183698253"></a>
### vertexLightingCollapse

```ml
function vertexLightingCollapse(shader, lightmapIndex)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shader` | `dynamic` | — |  |
| `lightmapIndex` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L97)

<a id="function-function-mq3-renderer-shader-runtime-waveequal-function-waveequal-a-b-src-mq3-renderer-shader-runtime-ml-1118333711"></a>
### waveEqual

```ml
function waveEqual(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_runtime.ml#L38)
