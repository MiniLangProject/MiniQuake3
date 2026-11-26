# `src/mq3/renderer/tr_font_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.tr_font_runtime`](Package-mq3-renderer-tr-font-runtime-128241610.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/format/pk3.ml` as `pk3` → [src/mq3/format/pk3.ml](File-src-mq3-format-pk3-ml-2106134675.md)
- `mq3/vm/font_abi.ml` as `fontAbi` → [src/mq3/vm/font_abi.ml](File-src-mq3-vm-font-abi-ml-1952985199.md)
- `std/fs.ml` as `fs` → `../MiniLangCompilerML/std/fs.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-tr-font-runtime-alphaimage-function-alphaimage-atlas-src-mq3-renderer-tr-font-runtime-ml-548579699"></a>
### alphaImage

```ml
function alphaImage(atlas)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `atlas` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L91)

- [mq3.renderer.tr_font_runtime.Bitmap](Type-mq3-renderer-tr-font-runtime-bitmap-422757207.md) — struct
<a id="function-function-mq3-renderer-tr-font-runtime-blankglyph-function-blankglyph-src-mq3-renderer-tr-font-runtime-ml-25125878"></a>
### blankGlyph

```ml
function blankGlyph()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L42)

- [mq3.renderer.tr_font_runtime.Constructed](Type-mq3-renderer-tr-font-runtime-constructed-1568830296.md) — struct
<a id="function-function-mq3-renderer-tr-font-runtime-create-function-create-archive-src-mq3-renderer-tr-font-runtime-ml-1011765828"></a>
### create

```ml
function create(archive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L120)

<a id="function-function-mq3-renderer-tr-font-runtime-createbackend-function-createbackend-context-rasterizefn-createimagefn-savefontdata-outputroot-src-mq3-renderer-tr-font-runtime-ml-111708026"></a>
### createBackend

```ml
function createBackend(context, rasterizeFn, createImageFn, saveFontData, outputRoot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `rasterizeFn` | `dynamic` | — |  |
| `createImageFn` | `dynamic` | — |  |
| `saveFontData` | `dynamic` | — |  |
| `outputRoot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L121)

<a id="function-function-mq3-renderer-tr-font-runtime-createcursor-function-createcursor-data-src-mq3-renderer-tr-font-runtime-ml-1490282202"></a>
### createCursor

```ml
function createCursor(data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L27)

- [mq3.renderer.tr_font_runtime.Cursor](Type-mq3-renderer-tr-font-runtime-cursor-1623801902.md) — struct
<a id="function-function-mq3-renderer-tr-font-runtime-fail-function-fail-message-src-mq3-renderer-tr-font-runtime-ml-212383983"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L26)

- [mq3.renderer.tr_font_runtime.FreeTypeBackend](Type-mq3-renderer-tr-font-runtime-freetypebackend-1921127062.md) — struct
<a id="constant-constant-mq3-renderer-tr-font-runtime-ft-outline-const-ft-outline-1-src-mq3-renderer-tr-font-runtime-ml-1382774818"></a>
### FT_OUTLINE

```ml
const FT_OUTLINE = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L11)

<a id="function-function-mq3-renderer-tr-font-runtime-generatedfont-function-generatedfont-state-fontname-pointsize-src-mq3-renderer-tr-font-runtime-ml-1432570120"></a>
### generatedFont

```ml
function generatedFont(state, fontName, pointSize)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `fontName` | `dynamic` | — |  |
| `pointSize` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L96)

- [mq3.renderer.tr_font_runtime.GlyphBounds](Type-mq3-renderer-tr-font-runtime-glyphbounds-933752019.md) — struct
- [mq3.renderer.tr_font_runtime.GlyphInfo](Type-mq3-renderer-tr-font-runtime-glyphinfo-7683194.md) — struct
- [mq3.renderer.tr_font_runtime.Lifecycle](Type-mq3-renderer-tr-font-runtime-lifecycle-451129368.md) — struct
<a id="constant-constant-mq3-renderer-tr-font-runtime-max-fonts-const-max-fonts-6-src-mq3-renderer-tr-font-runtime-ml-1507826443"></a>
### MAX_FONTS

```ml
const MAX_FONTS = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L10)

- [mq3.renderer.tr_font_runtime.Metrics](Type-mq3-renderer-tr-font-runtime-metrics-2133994369.md) — struct
<a id="constant-constant-mq3-renderer-tr-font-runtime-pixel-mode-gray-const-pixel-mode-gray-2-src-mq3-renderer-tr-font-runtime-ml-1549338643"></a>
### PIXEL_MODE_GRAY

```ml
const PIXEL_MODE_GRAY = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L13)

<a id="constant-constant-mq3-renderer-tr-font-runtime-pixel-mode-mono-const-pixel-mode-mono-1-src-mq3-renderer-tr-font-runtime-ml-651560118"></a>
### PIXEL_MODE_MONO

```ml
const PIXEL_MODE_MONO = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L12)

<a id="function-function-mq3-renderer-tr-font-runtime-r-donefreetype-function-r-donefreetype-state-src-mq3-renderer-tr-font-runtime-ml-1073031333"></a>
### R_DoneFreeType

```ml
function R_DoneFreeType(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L123)

<a id="function-function-mq3-renderer-tr-font-runtime-r-getglyphinfo-function-r-getglyphinfo-metrics-src-mq3-renderer-tr-font-runtime-ml-632808457"></a>
### R_GetGlyphInfo

```ml
function R_GetGlyphInfo(metrics)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `metrics` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L37)

<a id="function-function-mq3-renderer-tr-font-runtime-r-initfreetype-function-r-initfreetype-state-backend-src-mq3-renderer-tr-font-runtime-ml-915320795"></a>
### R_InitFreeType

```ml
function R_InitFreeType(state, backend)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `backend` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L122)

<a id="function-function-mq3-renderer-tr-font-runtime-r-renderglyph-function-r-renderglyph-metrics-format-coverage-pixelmode-src-mq3-renderer-tr-font-runtime-ml-2141651937"></a>
### R_RenderGlyph

```ml
function R_RenderGlyph(metrics, format, coverage, pixelMode)
```

FreeType performs the outline scan conversion. The facade consumes that exact coverage buffer and retains all of tr_font.c's metric/lifetime rules.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `metrics` | `dynamic` | — |  |
| `format` | `dynamic` | — |  |
| `coverage` | `dynamic` | — |  |
| `pixelMode` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L46)

- [mq3.renderer.tr_font_runtime.Raster](Type-mq3-renderer-tr-font-runtime-raster-579893233.md) — struct
<a id="function-function-mq3-renderer-tr-font-runtime-re-constructglyphinfo-function-re-constructglyphinfo-imageout-x-y-maxheight-metrics-format-coverage-pixelmode-calcheight-src-mq3-renderer-tr-font-runtime-ml-921299016"></a>
### RE_ConstructGlyphInfo

```ml
function RE_ConstructGlyphInfo(imageOut, x, y, maxHeight, metrics, format, coverage, pixelMode, calcHeight)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `imageOut` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `maxHeight` | `dynamic` | — |  |
| `metrics` | `dynamic` | — |  |
| `format` | `dynamic` | — |  |
| `coverage` | `dynamic` | — |  |
| `pixelMode` | `dynamic` | — |  |
| `calcHeight` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L54)

<a id="function-function-mq3-renderer-tr-font-runtime-re-registerfont-function-re-registerfont-state-shadercontext-registershaderfn-fontname-pointsize-src-mq3-renderer-tr-font-runtime-ml-1379516078"></a>
### RE_RegisterFont

```ml
function RE_RegisterFont(state, shaderContext, registerShaderFn, fontName, pointSize)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `shaderContext` | `dynamic` | — |  |
| `registerShaderFn` | `dynamic` | — |  |
| `fontName` | `dynamic` | — |  |
| `pointSize` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L124)

<a id="function-function-mq3-renderer-tr-font-runtime-readfloat-function-readfloat-cursor-src-mq3-renderer-tr-font-runtime-ml-2020587728"></a>
### readFloat

```ml
function readFloat(cursor)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cursor` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L32)

<a id="function-function-mq3-renderer-tr-font-runtime-readint-function-readint-cursor-src-mq3-renderer-tr-font-runtime-ml-1689932798"></a>
### readInt

```ml
function readInt(cursor)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cursor` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L28)

- [mq3.renderer.tr_font_runtime.Rendered](Type-mq3-renderer-tr-font-runtime-rendered-1776297965.md) — struct
<a id="function-function-mq3-renderer-tr-font-runtime-tgabytes-function-tgabytes-data-width-height-src-mq3-renderer-tr-font-runtime-ml-1585130399"></a>
### tgaBytes

```ml
function tgaBytes(data, width, height)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L74)

<a id="function-function-mq3-renderer-tr-font-runtime-writecstring-function-writecstring-data-offset-capacity-value-src-mq3-renderer-tr-font-runtime-ml-2041146874"></a>
### writeCString

```ml
function writeCString(data, offset, capacity, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L84)

<a id="function-function-mq3-renderer-tr-font-runtime-writeglyph-function-writeglyph-data-index-glyph-src-mq3-renderer-tr-font-runtime-ml-1448251444"></a>
### writeGlyph

```ml
function writeGlyph(data, index, glyph)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `glyph` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L87)

<a id="function-function-mq3-renderer-tr-font-runtime-writetga-function-writetga-filename-data-width-height-src-mq3-renderer-tr-font-runtime-ml-746173154"></a>
### WriteTGA

```ml
function WriteTGA(filename, data, width, height)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `filename` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `height` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L80)
