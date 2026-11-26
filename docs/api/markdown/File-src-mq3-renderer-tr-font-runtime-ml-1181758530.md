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

Builds `rgba[index*4+3]` in `mq3.renderer.tr_font_runtime.alphaImage`; returns `rgba`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `atlas` | `dynamic` | — | Indexed input read at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L266)

- [mq3.renderer.tr_font_runtime.Bitmap](Type-mq3-renderer-tr-font-runtime-bitmap-422757207.md) — struct
<a id="function-function-mq3-renderer-tr-font-runtime-blankglyph-function-blankglyph-src-mq3-renderer-tr-font-runtime-ml-25125878"></a>
### blankGlyph

```ml
function blankGlyph()
```

Constructs `mq3.renderer.tr_font_runtime.GlyphInfo` with `height` = `0`, `top` = `0`, `bottom` = `0`, `pitch` = `0` and the supplied remaining values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L183)

- [mq3.renderer.tr_font_runtime.Constructed](Type-mq3-renderer-tr-font-runtime-constructed-1568830296.md) — struct
<a id="function-function-mq3-renderer-tr-font-runtime-create-function-create-archive-src-mq3-renderer-tr-font-runtime-ml-1011765828"></a>
### create

```ml
function create(archive)
```

Constructs `mq3.renderer.tr_font_runtime.Lifecycle` with `registry` = `fontAbi.create(archive)`, `registeredFontCount` = `0`, `freeTypeInitialized` = `false`, `backend` = `void`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `archive` | `dynamic` | — | Argument 1 supplied to `mq3.vm.font_abi.create`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L301)

<a id="function-function-mq3-renderer-tr-font-runtime-createbackend-function-createbackend-context-rasterizefn-createimagefn-savefontdata-outputroot-src-mq3-renderer-tr-font-runtime-ml-111708026"></a>
### createBackend

```ml
function createBackend(context, rasterizeFn, createImageFn, saveFontData, outputRoot)
```

Constructs `mq3.renderer.tr_font_runtime.FreeTypeBackend` from `context`, `rasterizeFn`, `createImageFn`, `saveFontData`, `outputRoot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Value used for `mq3.renderer.tr_font_runtime.FreeTypeBackend.context`. |
| `rasterizeFn` | `dynamic` | — | Value used for `mq3.renderer.tr_font_runtime.FreeTypeBackend.rasterizeFn`. |
| `createImageFn` | `dynamic` | — | Value used for `mq3.renderer.tr_font_runtime.FreeTypeBackend.createImageFn`. |
| `saveFontData` | `dynamic` | — | Value used for `mq3.renderer.tr_font_runtime.FreeTypeBackend.saveFontData`. |
| `outputRoot` | `dynamic` | — | Value used for `mq3.renderer.tr_font_runtime.FreeTypeBackend.outputRoot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L308)

<a id="function-function-mq3-renderer-tr-font-runtime-createcursor-function-createcursor-data-src-mq3-renderer-tr-font-runtime-ml-1490282202"></a>
### createCursor

```ml
function createCursor(data)
```

Constructs `mq3.renderer.tr_font_runtime.Cursor` with `offset` = `0` and the supplied remaining values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Initial value for `mq3.renderer.tr_font_runtime.Cursor.data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L161)

- [mq3.renderer.tr_font_runtime.Cursor](Type-mq3-renderer-tr-font-runtime-cursor-1623801902.md) — struct
<a id="function-function-mq3-renderer-tr-font-runtime-fail-function-fail-message-src-mq3-renderer-tr-font-runtime-ml-212383983"></a>
### fail

```ml
function fail(message)
```

Creates error `7798` with message `"tr_font: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Input used in the result expression `error(7798,"tr_font: "+message)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L158)

- [mq3.renderer.tr_font_runtime.FreeTypeBackend](Type-mq3-renderer-tr-font-runtime-freetypebackend-1921127062.md) — struct
<a id="constant-constant-mq3-renderer-tr-font-runtime-ft-outline-const-ft-outline-1-src-mq3-renderer-tr-font-runtime-ml-1382774818"></a>
### FT_OUTLINE

```ml
const FT_OUTLINE = 1
```

Rasterizer format tag indicating an outline glyph rather than an existing bitmap.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L13)

<a id="function-function-mq3-renderer-tr-font-runtime-generatedfont-function-generatedfont-state-fontname-pointsize-src-mq3-renderer-tr-font-runtime-ml-1432570120"></a>
### generatedFont

```ml
function generatedFont(state, fontName, pointSize)
```

Updates `state.registry.fonts` in `mq3.renderer.tr_font_runtime.generatedFont`; returns `fontAbi.Result(true,data,fontAbi.GLYPHS_PER_FONT-1,path)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.registry.fonts`. |
| `fontName` | `dynamic` | — | Argument 2 supplied to `mq3.format.pk3.read`. |
| `pointSize` | `dynamic` | — | Argument 1 supplied to `mq3.vm.font_abi.pathFor`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L275)

- [mq3.renderer.tr_font_runtime.GlyphBounds](Type-mq3-renderer-tr-font-runtime-glyphbounds-933752019.md) — struct
- [mq3.renderer.tr_font_runtime.GlyphInfo](Type-mq3-renderer-tr-font-runtime-glyphinfo-7683194.md) — struct
- [mq3.renderer.tr_font_runtime.Lifecycle](Type-mq3-renderer-tr-font-runtime-lifecycle-451129368.md) — struct
<a id="constant-constant-mq3-renderer-tr-font-runtime-max-fonts-const-max-fonts-6-src-mq3-renderer-tr-font-runtime-ml-1507826443"></a>
### MAX_FONTS

```ml
const MAX_FONTS = 6
```

Maximum number of registered font definitions retained by the renderer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L11)

- [mq3.renderer.tr_font_runtime.Metrics](Type-mq3-renderer-tr-font-runtime-metrics-2133994369.md) — struct
<a id="constant-constant-mq3-renderer-tr-font-runtime-pixel-mode-gray-const-pixel-mode-gray-2-src-mq3-renderer-tr-font-runtime-ml-1549338643"></a>
### PIXEL_MODE_GRAY

```ml
const PIXEL_MODE_GRAY = 2
```

Glyph bitmap format with grayscale coverage samples.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L17)

<a id="constant-constant-mq3-renderer-tr-font-runtime-pixel-mode-mono-const-pixel-mode-mono-1-src-mq3-renderer-tr-font-runtime-ml-651560118"></a>
### PIXEL_MODE_MONO

```ml
const PIXEL_MODE_MONO = 1
```

Glyph bitmap format with one coverage bit per pixel.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L15)

<a id="function-function-mq3-renderer-tr-font-runtime-r-donefreetype-function-r-donefreetype-state-src-mq3-renderer-tr-font-runtime-ml-1073031333"></a>
### R_DoneFreeType

```ml
function R_DoneFreeType(state)
```

Updates `state.freeTypeInitialized`, `state.backend`, `state.registeredFontCount`, `state.registry.fonts` in `mq3.renderer.tr_font_runtime.R_DoneFreeType`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.freeTypeInitialized`, `state.backend`, `state.registeredFontCount`, `state.registry.fonts`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L315)

<a id="function-function-mq3-renderer-tr-font-runtime-r-getglyphinfo-function-r-getglyphinfo-metrics-src-mq3-renderer-tr-font-runtime-ml-632808457"></a>
### R_GetGlyphInfo

```ml
function R_GetGlyphInfo(metrics)
```

Builds `mq3.renderer.tr_font_runtime.GlyphBounds` for `mq3.renderer.tr_font_runtime.R_GetGlyphInfo`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `metrics` | `dynamic` | — | Record providing `metrics.horiBearingX`, `metrics.width`, `metrics.horiBearingY`, `metrics.height`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L177)

<a id="function-function-mq3-renderer-tr-font-runtime-r-initfreetype-function-r-initfreetype-state-backend-src-mq3-renderer-tr-font-runtime-ml-915320795"></a>
### R_InitFreeType

```ml
function R_InitFreeType(state, backend)
```

Updates `state.backend`, `state.freeTypeInitialized`, `state.registeredFontCount`, `state.registry.fonts` in `mq3.renderer.tr_font_runtime.R_InitFreeType`; returns `state.freeTypeInitialized`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.backend`, `state.freeTypeInitialized`, `state.registeredFontCount`, `state.registry.fonts`. |
| `backend` | `dynamic` | — | Value assigned to `state.backend`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L312)

<a id="function-function-mq3-renderer-tr-font-runtime-r-renderglyph-function-r-renderglyph-metrics-format-coverage-pixelmode-src-mq3-renderer-tr-font-runtime-ml-2141651937"></a>
### R_RenderGlyph

```ml
function R_RenderGlyph(metrics, format, coverage, pixelMode)
```

FreeType performs the outline scan conversion. The facade consumes that exact coverage buffer and retains all of tr_font.c's metric/lifetime rules.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `metrics` | `dynamic` | — | Record providing `metrics.horiBearingY`. |
| `format` | `dynamic` | — | Input tested by `format!=FT_OUTLINE`. |
| `coverage` | `dynamic` | — | Argument 1 supplied to `slice`. |
| `pixelMode` | `dynamic` | — | Value used for `mq3.renderer.tr_font_runtime.Bitmap.pixelMode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L191)

- [mq3.renderer.tr_font_runtime.Raster](Type-mq3-renderer-tr-font-runtime-raster-579893233.md) — struct
<a id="function-function-mq3-renderer-tr-font-runtime-re-constructglyphinfo-function-re-constructglyphinfo-imageout-x-y-maxheight-metrics-format-coverage-pixelmode-calcheight-src-mq3-renderer-tr-font-runtime-ml-921299016"></a>
### RE_ConstructGlyphInfo

```ml
function RE_ConstructGlyphInfo(imageOut, x, y, maxHeight, metrics, format, coverage, pixelMode, calcHeight)
```

Builds `mq3.renderer.tr_font_runtime.Constructed` after updating `glyph.xSkip`, `imageOut[destination+column]`, `glyph.imageHeight`, `glyph.imageWidth`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `imageOut` | `dynamic` | — | Mutable record or buffer; this call updates `imageOut[destination+column]`. |
| `x` | `dynamic` | — | Initial value for `mq3.renderer.tr_font_runtime.Constructed.x`. |
| `y` | `dynamic` | — | Initial value for `mq3.renderer.tr_font_runtime.Constructed.y`. |
| `maxHeight` | `dynamic` | — | Initial value for `mq3.renderer.tr_font_runtime.Constructed.maxHeight`. |
| `metrics` | `dynamic` | — | Record providing `metrics.horiAdvance`. |
| `format` | `dynamic` | — | Value forwarded as `format` to `mq3.renderer.tr_font_runtime.R_RenderGlyph`. |
| `coverage` | `dynamic` | — | Value forwarded as `coverage` to `mq3.renderer.tr_font_runtime.R_RenderGlyph`. |
| `pixelMode` | `dynamic` | — | Value forwarded as `pixelMode` to `mq3.renderer.tr_font_runtime.R_RenderGlyph`. |
| `calcHeight` | `dynamic` | — | Input tested by `calcHeight`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L209)

<a id="function-function-mq3-renderer-tr-font-runtime-re-registerfont-function-re-registerfont-state-shadercontext-registershaderfn-fontname-pointsize-src-mq3-renderer-tr-font-runtime-ml-1379516078"></a>
### RE_RegisterFont

```ml
function RE_RegisterFont(state, shaderContext, registerShaderFn, fontName, pointSize)
```

Updates `state.registeredFontCount` in `mq3.renderer.tr_font_runtime.RE_RegisterFont`; returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable record or buffer; this call updates `state.registeredFontCount`. |
| `shaderContext` | `dynamic` | — | Argument 2 supplied to `mq3.vm.font_abi.load`. |
| `registerShaderFn` | `dynamic` | — | Argument 3 supplied to `mq3.vm.font_abi.load`. |
| `fontName` | `dynamic` | — | Argument 4 supplied to `mq3.vm.font_abi.load`. |
| `pointSize` | `dynamic` | — | Argument 1 supplied to `mq3.vm.font_abi.pathFor`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L322)

<a id="function-function-mq3-renderer-tr-font-runtime-readfloat-function-readfloat-cursor-src-mq3-renderer-tr-font-runtime-ml-2020587728"></a>
### readFloat

```ml
function readFloat(cursor)
```

Updates `cursor.offset` in `mq3.renderer.tr_font_runtime.readFloat`; returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cursor` | `dynamic` | — | Mutable record or buffer; this call updates `cursor.offset`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L170)

<a id="function-function-mq3-renderer-tr-font-runtime-readint-function-readint-cursor-src-mq3-renderer-tr-font-runtime-ml-1689932798"></a>
### readInt

```ml
function readInt(cursor)
```

Updates `cursor.offset` in `mq3.renderer.tr_font_runtime.readInt`; returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cursor` | `dynamic` | — | Mutable record or buffer; this call updates `cursor.offset`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L164)

- [mq3.renderer.tr_font_runtime.Rendered](Type-mq3-renderer-tr-font-runtime-rendered-1776297965.md) — struct
<a id="function-function-mq3-renderer-tr-font-runtime-tgabytes-function-tgabytes-data-width-height-src-mq3-renderer-tr-font-runtime-ml-1585130399"></a>
### tgaBytes

```ml
function tgaBytes(data, width, height)
```

Builds `output[2]`, `output[12]`, `output[13]`, `output[14]`, `output[15]` in `mq3.renderer.tr_font_runtime.tgaBytes`; returns `output`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Indexed input read at `source+2`, `source+1`, `source`, `source+3`. |
| `width` | `dynamic` | — | Input tested by `width<=0 or height<=0 or data==void or len(data)!=width*height*4`. |
| `height` | `dynamic` | — | Input tested by `width<=0 or height<=0 or data==void or len(data)!=width*height*4`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L233)

<a id="function-function-mq3-renderer-tr-font-runtime-writecstring-function-writecstring-data-offset-capacity-value-src-mq3-renderer-tr-font-runtime-ml-2041146874"></a>
### writeCString

```ml
function writeCString(data, offset, capacity, value)
```

Updates `data[offset+index]` in `mq3.renderer.tr_font_runtime.writeCString`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Mutable record or buffer; this call updates `data[offset+index]`. |
| `offset` | `dynamic` | — | Argument 2 supplied to `copyBytes`. |
| `capacity` | `dynamic` | — | Input tested by `count>=capacity`. |
| `value` | `dynamic` | — | Argument 1 supplied to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L253)

<a id="function-function-mq3-renderer-tr-font-runtime-writeglyph-function-writeglyph-data-index-glyph-src-mq3-renderer-tr-font-runtime-ml-1448251444"></a>
### writeGlyph

```ml
function writeGlyph(data, index, glyph)
```

Validates glyph metadata and writes one fixed-layout QVM font glyph record into the byte buffer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Argument 1 supplied to `mq3.compat.numeric.writeU32`. |
| `index` | `dynamic` | — | Input used by `offset=index*fontAbi.GLYPH_SIZE`. |
| `glyph` | `dynamic` | — | Record providing `glyph.height`, `glyph.top`, `glyph.bottom`, `glyph.pitch`, `glyph.xSkip`, `glyph.imageWidth`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L260)

<a id="function-function-mq3-renderer-tr-font-runtime-writetga-function-writetga-filename-data-width-height-src-mq3-renderer-tr-font-runtime-ml-746173154"></a>
### WriteTGA

```ml
function WriteTGA(filename, data, width, height)
```

Returns `len(encoded)` from `mq3.renderer.tr_font_runtime.WriteTGA`; earlier branches return `encoded`, `written`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `filename` | `dynamic` | — | Argument 1 supplied to `std.fs.writeAllBytes`. |
| `data` | `dynamic` | — | Value forwarded as `data` to `mq3.renderer.tr_font_runtime.tgaBytes`. |
| `width` | `dynamic` | — | Value forwarded as `width` to `mq3.renderer.tr_font_runtime.tgaBytes`. |
| `height` | `dynamic` | — | Value forwarded as `height` to `mq3.renderer.tr_font_runtime.tgaBytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/renderer/tr_font_runtime.ml#L244)
