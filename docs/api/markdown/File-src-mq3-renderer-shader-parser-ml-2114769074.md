# `src/mq3/renderer/shader_parser.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.shader_parser`](Package-mq3-renderer-shader-parser-1385260306.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `numbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/renderer/shader_index.ml` as `shaderIndex` → [src/mq3/renderer/shader_index.ml](File-src-mq3-renderer-shader-index-ml-492021135.md)
- `mq3/shared/parser.ml` as `parser` → [src/mq3/shared/parser.ml](File-src-mq3-shared-parser-ml-1977832534.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-shader-parser-blankstage-function-blankstage-src-mq3-renderer-shader-parser-ml-1164948242"></a>
### blankStage

```ml
function blankStage()
```

Constructs `mq3.renderer.shader_parser.Stage` with `active` = `true`, `mapMode` = `""`, `images` = `[]`, `animationSpeed` = `0.0` and the supplied remaining values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L352)

<a id="function-function-mq3-renderer-shader-parser-blankwave-function-blankwave-src-mq3-renderer-shader-parser-ml-219695804"></a>
### blankWave

```ml
function blankWave()
```

Constructs `mq3.renderer.shader_parser.Wave` with `func` = `0`, `base` = `0.0`, `amplitude` = `0.0`, `phase` = `0.0` and the supplied remaining values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L195)

- [mq3.renderer.shader_parser.Deform](Type-mq3-renderer-shader-parser-deform-2039441621.md) — struct
<a id="constant-constant-mq3-renderer-shader-parser-gls-atest-ge-80-const-gls-atest-ge-80-1073741824-src-mq3-renderer-shader-parser-ml-185965558"></a>
### GLS_ATEST_GE_80

```ml
const GLS_ATEST_GE_80 = 1073741824
```

Packed alpha-test mode accepting fragments whose alpha is at least one half.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L56)

<a id="constant-constant-mq3-renderer-shader-parser-gls-atest-gt-0-const-gls-atest-gt-0-268435456-src-mq3-renderer-shader-parser-ml-1738668394"></a>
### GLS_ATEST_GT_0

```ml
const GLS_ATEST_GT_0 = 268435456
```

Packed alpha-test mode accepting fragments whose alpha is greater than zero.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L52)

<a id="constant-constant-mq3-renderer-shader-parser-gls-atest-lt-80-const-gls-atest-lt-80-536870912-src-mq3-renderer-shader-parser-ml-1606578206"></a>
### GLS_ATEST_LT_80

```ml
const GLS_ATEST_LT_80 = 536870912
```

Packed alpha-test mode accepting fragments whose alpha is below one half.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L54)

<a id="constant-constant-mq3-renderer-shader-parser-gls-depthfunc-equal-const-gls-depthfunc-equal-131072-src-mq3-renderer-shader-parser-ml-1887530921"></a>
### GLS_DEPTHFUNC_EQUAL

```ml
const GLS_DEPTHFUNC_EQUAL = 131072
```

Packed-state flag requiring equality with the existing depth value.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L50)

<a id="constant-constant-mq3-renderer-shader-parser-gls-depthmask-true-const-gls-depthmask-true-256-src-mq3-renderer-shader-parser-ml-350980060"></a>
### GLS_DEPTHMASK_TRUE

```ml
const GLS_DEPTHMASK_TRUE = 256
```

Packed-state flag enabling writes to the depth buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L48)

<a id="constant-constant-mq3-renderer-shader-parser-gls-dstblend-dst-alpha-const-gls-dstblend-dst-alpha-112-src-mq3-renderer-shader-parser-ml-814184615"></a>
### GLS_DSTBLEND_DST_ALPHA

```ml
const GLS_DSTBLEND_DST_ALPHA = 112
```

Packed renderer-state value selecting the destination alpha as the destination blend factor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L43)

<a id="constant-constant-mq3-renderer-shader-parser-gls-dstblend-one-const-gls-dstblend-one-32-src-mq3-renderer-shader-parser-ml-520684898"></a>
### GLS_DSTBLEND_ONE

```ml
const GLS_DSTBLEND_ONE = 32
```

Packed renderer-state value selecting one as the destination blend factor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L33)

<a id="constant-constant-mq3-renderer-shader-parser-gls-dstblend-one-minus-dst-alpha-const-gls-dstblend-one-minus-dst-alpha-128-src-mq3-renderer-shader-parser-ml-959593626"></a>
### GLS_DSTBLEND_ONE_MINUS_DST_ALPHA

```ml
const GLS_DSTBLEND_ONE_MINUS_DST_ALPHA = 128
```

Packed renderer-state value selecting one minus the destination alpha as the destination blend factor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L46)

<a id="constant-constant-mq3-renderer-shader-parser-gls-dstblend-one-minus-src-alpha-const-gls-dstblend-one-minus-src-alpha-96-src-mq3-renderer-shader-parser-ml-1311403778"></a>
### GLS_DSTBLEND_ONE_MINUS_SRC_ALPHA

```ml
const GLS_DSTBLEND_ONE_MINUS_SRC_ALPHA = 96
```

Packed renderer-state value selecting one minus the source alpha as the destination blend factor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L41)

<a id="constant-constant-mq3-renderer-shader-parser-gls-dstblend-one-minus-src-color-const-gls-dstblend-one-minus-src-color-64-src-mq3-renderer-shader-parser-ml-329790769"></a>
### GLS_DSTBLEND_ONE_MINUS_SRC_COLOR

```ml
const GLS_DSTBLEND_ONE_MINUS_SRC_COLOR = 64
```

Packed renderer-state value selecting one minus the source color as the destination blend factor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L37)

<a id="constant-constant-mq3-renderer-shader-parser-gls-dstblend-src-alpha-const-gls-dstblend-src-alpha-80-src-mq3-renderer-shader-parser-ml-881319001"></a>
### GLS_DSTBLEND_SRC_ALPHA

```ml
const GLS_DSTBLEND_SRC_ALPHA = 80
```

Packed renderer-state value selecting the source alpha as the destination blend factor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L39)

<a id="constant-constant-mq3-renderer-shader-parser-gls-dstblend-src-color-const-gls-dstblend-src-color-48-src-mq3-renderer-shader-parser-ml-1146608987"></a>
### GLS_DSTBLEND_SRC_COLOR

```ml
const GLS_DSTBLEND_SRC_COLOR = 48
```

Packed renderer-state value selecting the source color as the destination blend factor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L35)

<a id="constant-constant-mq3-renderer-shader-parser-gls-dstblend-zero-const-gls-dstblend-zero-16-src-mq3-renderer-shader-parser-ml-1772656702"></a>
### GLS_DSTBLEND_ZERO

```ml
const GLS_DSTBLEND_ZERO = 16
```

Packed renderer-state value selecting zero as the destination blend factor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L31)

<a id="constant-constant-mq3-renderer-shader-parser-gls-srcblend-alpha-saturate-const-gls-srcblend-alpha-saturate-9-src-mq3-renderer-shader-parser-ml-1449718302"></a>
### GLS_SRCBLEND_ALPHA_SATURATE

```ml
const GLS_SRCBLEND_ALPHA_SATURATE = 9
```

Packed renderer-state value selecting the smaller of source alpha and one minus destination alpha as the source blend factor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L29)

<a id="constant-constant-mq3-renderer-shader-parser-gls-srcblend-dst-alpha-const-gls-srcblend-dst-alpha-7-src-mq3-renderer-shader-parser-ml-620748216"></a>
### GLS_SRCBLEND_DST_ALPHA

```ml
const GLS_SRCBLEND_DST_ALPHA = 7
```

Packed renderer-state value selecting the destination alpha as the source blend factor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L24)

<a id="constant-constant-mq3-renderer-shader-parser-gls-srcblend-dst-color-const-gls-srcblend-dst-color-3-src-mq3-renderer-shader-parser-ml-2096660318"></a>
### GLS_SRCBLEND_DST_COLOR

```ml
const GLS_SRCBLEND_DST_COLOR = 3
```

Packed renderer-state value selecting the destination color as the source blend factor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L16)

<a id="constant-constant-mq3-renderer-shader-parser-gls-srcblend-one-const-gls-srcblend-one-2-src-mq3-renderer-shader-parser-ml-1158709115"></a>
### GLS_SRCBLEND_ONE

```ml
const GLS_SRCBLEND_ONE = 2
```

Packed renderer-state value selecting one as the source blend factor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L14)

<a id="constant-constant-mq3-renderer-shader-parser-gls-srcblend-one-minus-dst-alpha-const-gls-srcblend-one-minus-dst-alpha-8-src-mq3-renderer-shader-parser-ml-1966487981"></a>
### GLS_SRCBLEND_ONE_MINUS_DST_ALPHA

```ml
const GLS_SRCBLEND_ONE_MINUS_DST_ALPHA = 8
```

Packed renderer-state value selecting one minus the destination alpha as the source blend factor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L26)

<a id="constant-constant-mq3-renderer-shader-parser-gls-srcblend-one-minus-dst-color-const-gls-srcblend-one-minus-dst-color-4-src-mq3-renderer-shader-parser-ml-1374715171"></a>
### GLS_SRCBLEND_ONE_MINUS_DST_COLOR

```ml
const GLS_SRCBLEND_ONE_MINUS_DST_COLOR = 4
```

Packed renderer-state value selecting one minus the destination color as the source blend factor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L18)

<a id="constant-constant-mq3-renderer-shader-parser-gls-srcblend-one-minus-src-alpha-const-gls-srcblend-one-minus-src-alpha-6-src-mq3-renderer-shader-parser-ml-65436697"></a>
### GLS_SRCBLEND_ONE_MINUS_SRC_ALPHA

```ml
const GLS_SRCBLEND_ONE_MINUS_SRC_ALPHA = 6
```

Packed renderer-state value selecting one minus the source alpha as the source blend factor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L22)

<a id="constant-constant-mq3-renderer-shader-parser-gls-srcblend-src-alpha-const-gls-srcblend-src-alpha-5-src-mq3-renderer-shader-parser-ml-1637949540"></a>
### GLS_SRCBLEND_SRC_ALPHA

```ml
const GLS_SRCBLEND_SRC_ALPHA = 5
```

Packed renderer-state value selecting the source alpha as the source blend factor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L20)

<a id="constant-constant-mq3-renderer-shader-parser-gls-srcblend-zero-const-gls-srcblend-zero-1-src-mq3-renderer-shader-parser-ml-1532706006"></a>
### GLS_SRCBLEND_ZERO

```ml
const GLS_SRCBLEND_ZERO = 1
```

Packed renderer-state value selecting zero as the source blend factor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L12)

<a id="function-function-mq3-renderer-shader-parser-hasvalue-function-hasvalue-values-wanted-src-mq3-renderer-shader-parser-ml-1414523649"></a>
### hasValue

```ml
function hasValue(values, wanted)
```

Returns `false` from `mq3.renderer.shader_parser.hasValue`; earlier branches return `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Sequence traversed as `value` while producing this result. |
| `wanted` | `dynamic` | — | Input used by `for each value in values if value==wanted then return true`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L199)

<a id="function-function-mq3-renderer-shader-parser-lower-function-lower-text-src-mq3-renderer-shader-parser-ml-570270137"></a>
### lower

```ml
function lower(text)
```

Calls `std.string.toLowerAscii` with `(text)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Argument 1 supplied to `std.string.toLowerAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L190)

<a id="constant-constant-mq3-renderer-shader-parser-max-image-animations-const-max-image-animations-8-src-mq3-renderer-shader-parser-ml-219968291"></a>
### MAX_IMAGE_ANIMATIONS

```ml
const MAX_IMAGE_ANIMATIONS = 8
```

Maximum number of images in an animated shader map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L62)

<a id="constant-constant-mq3-renderer-shader-parser-max-shader-stages-const-max-shader-stages-8-src-mq3-renderer-shader-parser-ml-1905106573"></a>
### MAX_SHADER_STAGES

```ml
const MAX_SHADER_STAGES = 8
```

Maximum number of texture and color stages retained in one shader.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L58)

<a id="function-function-mq3-renderer-shader-parser-nametoafunc-function-nametoafunc-name-src-mq3-renderer-shader-parser-ml-1819312013"></a>
### nameToAFunc

```ml
function nameToAFunc(name)
```

Returns `0` from `mq3.renderer.shader_parser.nameToAFunc`; earlier branches return `GLS_ATEST_GT_0`, `GLS_ATEST_LT_80`, `GLS_ATEST_GE_80`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Value forwarded as `text` to `mq3.renderer.shader_parser.lower`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L203)

<a id="function-function-mq3-renderer-shader-parser-nametodstblendmode-function-nametodstblendmode-name-src-mq3-renderer-shader-parser-ml-739405355"></a>
### nameToDstBlendMode

```ml
function nameToDstBlendMode(name)
```

Maps a case-insensitive OpenGL destination-blend token to packed shader state, defaulting to GL_ONE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Value forwarded as `text` to `mq3.renderer.shader_parser.lower`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L229)

<a id="function-function-mq3-renderer-shader-parser-nametogenfunc-function-nametogenfunc-name-src-mq3-renderer-shader-parser-ml-1744452087"></a>
### nameToGenFunc

```ml
function nameToGenFunc(name)
```

Maps sine, square, triangle, sawtooth, inverse-sawtooth, or noise names to waveform IDs, defaulting to sine.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Value forwarded as `text` to `mq3.renderer.shader_parser.lower`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L244)

<a id="function-function-mq3-renderer-shader-parser-nametosrcblendmode-function-nametosrcblendmode-name-src-mq3-renderer-shader-parser-ml-1697780947"></a>
### nameToSrcBlendMode

```ml
function nameToSrcBlendMode(name)
```

Maps a case-insensitive OpenGL source-blend token to packed shader state, defaulting to GL_ONE.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Value forwarded as `text` to `mq3.renderer.shader_parser.lower`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L213)

<a id="function-function-mq3-renderer-shader-parser-number-function-number-text-src-mq3-renderer-shader-parser-ml-493458139"></a>
### number

```ml
function number(text)
```

Calls `mq3.compat.numeric.f32` with `(numbers.atof(text))` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Argument 1 supplied to `mq3.compat.textnumbers.atof`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L193)

<a id="function-function-mq3-renderer-shader-parser-parse-function-parse-state-name-src-mq3-renderer-shader-parser-ml-912717154"></a>
### parse

```ml
function parse(state, name)
```

Builds `shader.stages`, `shader.portalRange`, `shader.cloudHeight`, `shader.surfaceParms`, `shader.noMipMaps` in `mq3.renderer.shader_parser.parse`; returns `shader`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 supplied to `mq3.shared.parser.parseExt`. |
| `name` | `dynamic` | — | Value used for `mq3.renderer.shader_parser.Shader.name`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L432)

<a id="function-function-mq3-renderer-shader-parser-parsedeform-function-parsedeform-state-src-mq3-renderer-shader-parser-ml-708020069"></a>
### parseDeform

```ml
function parseDeform(state)
```

Builds `mq3.renderer.shader_parser.Deform` using `mq3.shared.parser.parseExt`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 supplied to `mq3.shared.parser.parseExt`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L305)

<a id="function-function-mq3-renderer-shader-parser-parseindexed-function-parseindexed-index-name-src-mq3-renderer-shader-parser-ml-1537275215"></a>
### parseIndexed

```ml
function parseIndexed(index, name)
```

Builds `state.offset` in `mq3.renderer.shader_parser.parseIndexed`; returns `parse(state,entry.name)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Record providing `index.text`. |
| `name` | `dynamic` | — | Argument 2 supplied to `mq3.renderer.shader_index.find`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L475)

<a id="function-function-mq3-renderer-shader-parser-parsestage-function-parsestage-state-src-mq3-renderer-shader-parser-ml-94946657"></a>
### parseStage

```ml
function parseStage(state)
```

Builds `stage.mapMode`, `stage.images`, `stage.isLightmap`, `stage.animationSpeed`, `stage.alphaFunc` in `mq3.renderer.shader_parser.parseStage`; returns `stage`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 supplied to `mq3.shared.parser.parseExt`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L358)

<a id="function-function-mq3-renderer-shader-parser-parsetexmod-function-parsetexmod-tokens-src-mq3-renderer-shader-parser-ml-1947215672"></a>
### parseTexMod

```ml
function parseTexMod(tokens)
```

Builds `mq3.renderer.shader_parser.TexMod` for `mq3.renderer.shader_parser.parseTexMod`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `tokens` | `dynamic` | — | Indexed input read at `0`, `1`, `2`, `3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L331)

<a id="function-function-mq3-renderer-shader-parser-parsetext-function-parsetext-text-name-src-mq3-renderer-shader-parser-ml-475080574"></a>
### parseText

```ml
function parseText(text, name)
```

Calls `mq3.renderer.shader_parser.parse` with `(parser.create(text),name)` and returns its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Argument 1 supplied to `mq3.shared.parser.create`. |
| `name` | `dynamic` | — | Value forwarded as `name` to `mq3.renderer.shader_parser.parse`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L471)

<a id="function-function-mq3-renderer-shader-parser-parsevector-function-parsevector-state-count-src-mq3-renderer-shader-parser-ml-314142626"></a>
### parseVector

```ml
function parseVector(state, count)
```

Parses a parenthesized vector with the requested component count and reports missing tokens or delimiters.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 supplied to `mq3.shared.parser.parseExt`. |
| `count` | `dynamic` | — | Input used by `for index=0 to count-1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L282)

<a id="function-function-mq3-renderer-shader-parser-parsewave-function-parsewave-state-src-mq3-renderer-shader-parser-ml-1628150597"></a>
### parseWave

```ml
function parseWave(state)
```

Builds `mq3.renderer.shader_parser.Wave` using `mq3.shared.parser.parseExt`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 supplied to `mq3.shared.parser.parseExt`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L273)

<a id="function-function-mq3-renderer-shader-parser-restofline-function-restofline-state-src-mq3-renderer-shader-parser-ml-1917163149"></a>
### restOfLine

```ml
function restOfLine(state)
```

Returns `values` from `mq3.renderer.shader_parser.restOfLine`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 supplied to `mq3.shared.parser.parseExt`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L295)

- [mq3.renderer.shader_parser.Shader](Type-mq3-renderer-shader-parser-shader-1518855685.md) — struct
<a id="function-function-mq3-renderer-shader-parser-skipline-function-skipline-state-src-mq3-renderer-shader-parser-ml-518163397"></a>
### skipLine

```ml
function skipLine(state)
```

Returns `1` from `mq3.renderer.shader_parser.skipLine`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value forwarded as `state` to `mq3.renderer.shader_parser.restOfLine`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L427)

<a id="function-function-mq3-renderer-shader-parser-sortvalue-function-sortvalue-name-src-mq3-renderer-shader-parser-ml-480984821"></a>
### sortValue

```ml
function sortValue(name)
```

Computes `sortValue` from `number(name)` using `mq3.renderer.shader_parser.lower`, `mq3.renderer.shader_parser.number`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Value forwarded as `text` to `mq3.renderer.shader_parser.lower`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L257)

- [mq3.renderer.shader_parser.Stage](Type-mq3-renderer-shader-parser-stage-1079226850.md) — struct
- [mq3.renderer.shader_parser.TexMod](Type-mq3-renderer-shader-parser-texmod-1184446339.md) — struct
<a id="constant-constant-mq3-renderer-shader-parser-tr-max-texmods-const-tr-max-texmods-4-src-mq3-renderer-shader-parser-ml-1422345111"></a>
### TR_MAX_TEXMODS

```ml
const TR_MAX_TEXMODS = 4
```

Maximum number of texture-coordinate modifiers accepted by one shader stage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L60)

- [mq3.renderer.shader_parser.Wave](Type-mq3-renderer-shader-parser-wave-1272786189.md) — struct
