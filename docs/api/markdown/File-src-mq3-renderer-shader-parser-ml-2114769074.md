# `src/mq3/renderer/shader_parser.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.renderer.shader_parser`](Package-mq3-renderer-shader-parser-1385260306.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `numbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/renderer/shader_index.ml` as `shaderIndex` → [src/mq3/renderer/shader_index.ml](File-src-mq3-renderer-shader-index-ml-492021135.md)
- `mq3/shared/parser.ml` as `parser` → [src/mq3/shared/parser.ml](File-src-mq3-shared-parser-ml-1977832534.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-renderer-shader-parser-blankstage-function-blankstage-src-mq3-renderer-shader-parser-ml-1164948242"></a>
### blankStage

```ml
function blankStage()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L177)

<a id="function-function-mq3-renderer-shader-parser-blankwave-function-blankwave-src-mq3-renderer-shader-parser-ml-219695804"></a>
### blankWave

```ml
function blankWave()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L45)

- [mq3.renderer.shader_parser.Deform](Type-mq3-renderer-shader-parser-deform-2039441621.md) — struct
<a id="constant-constant-mq3-renderer-shader-parser-gls-atest-ge-80-const-gls-atest-ge-80-1073741824-src-mq3-renderer-shader-parser-ml-185965558"></a>
### GLS_ATEST_GE_80

```ml
const GLS_ATEST_GE_80 = 1073741824
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L32)

<a id="constant-constant-mq3-renderer-shader-parser-gls-atest-gt-0-const-gls-atest-gt-0-268435456-src-mq3-renderer-shader-parser-ml-1738668394"></a>
### GLS_ATEST_GT_0

```ml
const GLS_ATEST_GT_0 = 268435456
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L30)

<a id="constant-constant-mq3-renderer-shader-parser-gls-atest-lt-80-const-gls-atest-lt-80-536870912-src-mq3-renderer-shader-parser-ml-1606578206"></a>
### GLS_ATEST_LT_80

```ml
const GLS_ATEST_LT_80 = 536870912
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L31)

<a id="constant-constant-mq3-renderer-shader-parser-gls-depthfunc-equal-const-gls-depthfunc-equal-131072-src-mq3-renderer-shader-parser-ml-1887530921"></a>
### GLS_DEPTHFUNC_EQUAL

```ml
const GLS_DEPTHFUNC_EQUAL = 131072
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L29)

<a id="constant-constant-mq3-renderer-shader-parser-gls-depthmask-true-const-gls-depthmask-true-256-src-mq3-renderer-shader-parser-ml-350980060"></a>
### GLS_DEPTHMASK_TRUE

```ml
const GLS_DEPTHMASK_TRUE = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L28)

<a id="constant-constant-mq3-renderer-shader-parser-gls-dstblend-dst-alpha-const-gls-dstblend-dst-alpha-112-src-mq3-renderer-shader-parser-ml-814184615"></a>
### GLS_DSTBLEND_DST_ALPHA

```ml
const GLS_DSTBLEND_DST_ALPHA = 112
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L26)

<a id="constant-constant-mq3-renderer-shader-parser-gls-dstblend-one-const-gls-dstblend-one-32-src-mq3-renderer-shader-parser-ml-520684898"></a>
### GLS_DSTBLEND_ONE

```ml
const GLS_DSTBLEND_ONE = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L21)

<a id="constant-constant-mq3-renderer-shader-parser-gls-dstblend-one-minus-dst-alpha-const-gls-dstblend-one-minus-dst-alpha-128-src-mq3-renderer-shader-parser-ml-959593626"></a>
### GLS_DSTBLEND_ONE_MINUS_DST_ALPHA

```ml
const GLS_DSTBLEND_ONE_MINUS_DST_ALPHA = 128
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L27)

<a id="constant-constant-mq3-renderer-shader-parser-gls-dstblend-one-minus-src-alpha-const-gls-dstblend-one-minus-src-alpha-96-src-mq3-renderer-shader-parser-ml-1311403778"></a>
### GLS_DSTBLEND_ONE_MINUS_SRC_ALPHA

```ml
const GLS_DSTBLEND_ONE_MINUS_SRC_ALPHA = 96
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L25)

<a id="constant-constant-mq3-renderer-shader-parser-gls-dstblend-one-minus-src-color-const-gls-dstblend-one-minus-src-color-64-src-mq3-renderer-shader-parser-ml-329790769"></a>
### GLS_DSTBLEND_ONE_MINUS_SRC_COLOR

```ml
const GLS_DSTBLEND_ONE_MINUS_SRC_COLOR = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L23)

<a id="constant-constant-mq3-renderer-shader-parser-gls-dstblend-src-alpha-const-gls-dstblend-src-alpha-80-src-mq3-renderer-shader-parser-ml-881319001"></a>
### GLS_DSTBLEND_SRC_ALPHA

```ml
const GLS_DSTBLEND_SRC_ALPHA = 80
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L24)

<a id="constant-constant-mq3-renderer-shader-parser-gls-dstblend-src-color-const-gls-dstblend-src-color-48-src-mq3-renderer-shader-parser-ml-1146608987"></a>
### GLS_DSTBLEND_SRC_COLOR

```ml
const GLS_DSTBLEND_SRC_COLOR = 48
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L22)

<a id="constant-constant-mq3-renderer-shader-parser-gls-dstblend-zero-const-gls-dstblend-zero-16-src-mq3-renderer-shader-parser-ml-1772656702"></a>
### GLS_DSTBLEND_ZERO

```ml
const GLS_DSTBLEND_ZERO = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L20)

<a id="constant-constant-mq3-renderer-shader-parser-gls-srcblend-alpha-saturate-const-gls-srcblend-alpha-saturate-9-src-mq3-renderer-shader-parser-ml-1449718302"></a>
### GLS_SRCBLEND_ALPHA_SATURATE

```ml
const GLS_SRCBLEND_ALPHA_SATURATE = 9
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L19)

<a id="constant-constant-mq3-renderer-shader-parser-gls-srcblend-dst-alpha-const-gls-srcblend-dst-alpha-7-src-mq3-renderer-shader-parser-ml-620748216"></a>
### GLS_SRCBLEND_DST_ALPHA

```ml
const GLS_SRCBLEND_DST_ALPHA = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L17)

<a id="constant-constant-mq3-renderer-shader-parser-gls-srcblend-dst-color-const-gls-srcblend-dst-color-3-src-mq3-renderer-shader-parser-ml-2096660318"></a>
### GLS_SRCBLEND_DST_COLOR

```ml
const GLS_SRCBLEND_DST_COLOR = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L13)

<a id="constant-constant-mq3-renderer-shader-parser-gls-srcblend-one-const-gls-srcblend-one-2-src-mq3-renderer-shader-parser-ml-1158709115"></a>
### GLS_SRCBLEND_ONE

```ml
const GLS_SRCBLEND_ONE = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L12)

<a id="constant-constant-mq3-renderer-shader-parser-gls-srcblend-one-minus-dst-alpha-const-gls-srcblend-one-minus-dst-alpha-8-src-mq3-renderer-shader-parser-ml-1966487981"></a>
### GLS_SRCBLEND_ONE_MINUS_DST_ALPHA

```ml
const GLS_SRCBLEND_ONE_MINUS_DST_ALPHA = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L18)

<a id="constant-constant-mq3-renderer-shader-parser-gls-srcblend-one-minus-dst-color-const-gls-srcblend-one-minus-dst-color-4-src-mq3-renderer-shader-parser-ml-1374715171"></a>
### GLS_SRCBLEND_ONE_MINUS_DST_COLOR

```ml
const GLS_SRCBLEND_ONE_MINUS_DST_COLOR = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L14)

<a id="constant-constant-mq3-renderer-shader-parser-gls-srcblend-one-minus-src-alpha-const-gls-srcblend-one-minus-src-alpha-6-src-mq3-renderer-shader-parser-ml-65436697"></a>
### GLS_SRCBLEND_ONE_MINUS_SRC_ALPHA

```ml
const GLS_SRCBLEND_ONE_MINUS_SRC_ALPHA = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L16)

<a id="constant-constant-mq3-renderer-shader-parser-gls-srcblend-src-alpha-const-gls-srcblend-src-alpha-5-src-mq3-renderer-shader-parser-ml-1637949540"></a>
### GLS_SRCBLEND_SRC_ALPHA

```ml
const GLS_SRCBLEND_SRC_ALPHA = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L15)

<a id="constant-constant-mq3-renderer-shader-parser-gls-srcblend-zero-const-gls-srcblend-zero-1-src-mq3-renderer-shader-parser-ml-1532706006"></a>
### GLS_SRCBLEND_ZERO

```ml
const GLS_SRCBLEND_ZERO = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L11)

<a id="function-function-mq3-renderer-shader-parser-hasvalue-function-hasvalue-values-wanted-src-mq3-renderer-shader-parser-ml-1414523649"></a>
### hasValue

```ml
function hasValue(values, wanted)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `wanted` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L46)

<a id="function-function-mq3-renderer-shader-parser-lower-function-lower-text-src-mq3-renderer-shader-parser-ml-570270137"></a>
### lower

```ml
function lower(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L43)

<a id="constant-constant-mq3-renderer-shader-parser-max-image-animations-const-max-image-animations-8-src-mq3-renderer-shader-parser-ml-219968291"></a>
### MAX_IMAGE_ANIMATIONS

```ml
const MAX_IMAGE_ANIMATIONS = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L35)

<a id="constant-constant-mq3-renderer-shader-parser-max-shader-stages-const-max-shader-stages-8-src-mq3-renderer-shader-parser-ml-1905106573"></a>
### MAX_SHADER_STAGES

```ml
const MAX_SHADER_STAGES = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L33)

<a id="function-function-mq3-renderer-shader-parser-nametoafunc-function-nametoafunc-name-src-mq3-renderer-shader-parser-ml-1819312013"></a>
### nameToAFunc

```ml
function nameToAFunc(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L48)

<a id="function-function-mq3-renderer-shader-parser-nametodstblendmode-function-nametodstblendmode-name-src-mq3-renderer-shader-parser-ml-739405355"></a>
### nameToDstBlendMode

```ml
function nameToDstBlendMode(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L70)

<a id="function-function-mq3-renderer-shader-parser-nametogenfunc-function-nametogenfunc-name-src-mq3-renderer-shader-parser-ml-1744452087"></a>
### nameToGenFunc

```ml
function nameToGenFunc(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L83)

<a id="function-function-mq3-renderer-shader-parser-nametosrcblendmode-function-nametosrcblendmode-name-src-mq3-renderer-shader-parser-ml-1697780947"></a>
### nameToSrcBlendMode

```ml
function nameToSrcBlendMode(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L56)

<a id="function-function-mq3-renderer-shader-parser-number-function-number-text-src-mq3-renderer-shader-parser-ml-493458139"></a>
### number

```ml
function number(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L44)

<a id="function-function-mq3-renderer-shader-parser-parse-function-parse-state-name-src-mq3-renderer-shader-parser-ml-912717154"></a>
### parse

```ml
function parse(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L250)

<a id="function-function-mq3-renderer-shader-parser-parsedeform-function-parsedeform-state-src-mq3-renderer-shader-parser-ml-708020069"></a>
### parseDeform

```ml
function parseDeform(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L133)

<a id="function-function-mq3-renderer-shader-parser-parseindexed-function-parseindexed-index-name-src-mq3-renderer-shader-parser-ml-1537275215"></a>
### parseIndexed

```ml
function parseIndexed(index, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L284)

<a id="function-function-mq3-renderer-shader-parser-parsestage-function-parsestage-state-src-mq3-renderer-shader-parser-ml-94946657"></a>
### parseStage

```ml
function parseStage(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L181)

<a id="function-function-mq3-renderer-shader-parser-parsetexmod-function-parsetexmod-tokens-src-mq3-renderer-shader-parser-ml-1947215672"></a>
### parseTexMod

```ml
function parseTexMod(tokens)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `tokens` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L157)

<a id="function-function-mq3-renderer-shader-parser-parsetext-function-parsetext-text-name-src-mq3-renderer-shader-parser-ml-475080574"></a>
### parseText

```ml
function parseText(text, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L283)

<a id="function-function-mq3-renderer-shader-parser-parsevector-function-parsevector-state-count-src-mq3-renderer-shader-parser-ml-314142626"></a>
### parseVector

```ml
function parseVector(state, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L114)

<a id="function-function-mq3-renderer-shader-parser-parsewave-function-parsewave-state-src-mq3-renderer-shader-parser-ml-1628150597"></a>
### parseWave

```ml
function parseWave(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L108)

<a id="function-function-mq3-renderer-shader-parser-restofline-function-restofline-state-src-mq3-renderer-shader-parser-ml-1917163149"></a>
### restOfLine

```ml
function restOfLine(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L125)

- [mq3.renderer.shader_parser.Shader](Type-mq3-renderer-shader-parser-shader-1518855685.md) — struct
<a id="function-function-mq3-renderer-shader-parser-skipline-function-skipline-state-src-mq3-renderer-shader-parser-ml-518163397"></a>
### skipLine

```ml
function skipLine(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L248)

<a id="function-function-mq3-renderer-shader-parser-sortvalue-function-sortvalue-name-src-mq3-renderer-shader-parser-ml-480984821"></a>
### sortValue

```ml
function sortValue(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L94)

- [mq3.renderer.shader_parser.Stage](Type-mq3-renderer-shader-parser-stage-1079226850.md) — struct
- [mq3.renderer.shader_parser.TexMod](Type-mq3-renderer-shader-parser-texmod-1184446339.md) — struct
<a id="constant-constant-mq3-renderer-shader-parser-tr-max-texmods-const-tr-max-texmods-4-src-mq3-renderer-shader-parser-ml-1422345111"></a>
### TR_MAX_TEXMODS

```ml
const TR_MAX_TEXMODS = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/renderer/shader_parser.ml#L34)

- [mq3.renderer.shader_parser.Wave](Type-mq3-renderer-shader-parser-wave-1272786189.md) — struct
