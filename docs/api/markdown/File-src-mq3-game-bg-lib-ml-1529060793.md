# `src/mq3/game/bg_lib.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.bg_lib`](Package-mq3-game-bg-lib-1277631077.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `textnumbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/compat/transcendental.ml` as `transcendental` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)

## Declarations

<a id="function-function-mq3-game-bg-lib-atof-function-atof-string-start-src-mq3-game-bg-lib-ml-64607153"></a>
### _atof

```ml
function _atof(string, start)
```

_atof

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `string` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L69)

<a id="function-function-mq3-game-bg-lib-atoi-function-atoi-string-start-src-mq3-game-bg-lib-ml-1631861051"></a>
### _atoi

```ml
function _atoi(string, start)
```

_atoi

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `string` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L77)

<a id="function-function-mq3-game-bg-lib-abs-function-abs-value-src-mq3-game-bg-lib-ml-1872703981"></a>
### abs

```ml
function abs(value)
```

abs

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L81)

<a id="function-function-mq3-game-bg-lib-acos-function-acos-value-src-mq3-game-bg-lib-ml-1575332957"></a>
### acos

```ml
function acos(value)
```

acos (#if 0)

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L139)

<a id="function-function-mq3-game-bg-lib-addfloat-function-addfloat-value-width-precision-src-mq3-game-bg-lib-ml-1748049809"></a>
### AddFloat

```ml
function AddFloat(value, width, precision)
```

AddFloat

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `precision` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L106)

<a id="function-function-mq3-game-bg-lib-addint-function-addint-value-width-flags-src-mq3-game-bg-lib-ml-1188426714"></a>
### AddInt

```ml
function AddInt(value, width, flags)
```

AddInt

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L102)

<a id="function-function-mq3-game-bg-lib-addstring-function-addstring-value-width-precision-src-mq3-game-bg-lib-ml-790898869"></a>
### AddString

```ml
function AddString(value, width, precision)
```

AddString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |
| `precision` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L110)

<a id="constant-constant-mq3-game-bg-lib-alt-const-alt-1-src-mq3-game-bg-lib-ml-657902556"></a>
### ALT

```ml
const ALT = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L10)

<a id="function-function-mq3-game-bg-lib-atan2-function-atan2-y-x-src-mq3-game-bg-lib-ml-607065923"></a>
### atan2

```ml
function atan2(y, x)
```

atan2 (#if 0)

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `y` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L141)

<a id="function-function-mq3-game-bg-lib-atof-function-atof-string-src-mq3-game-bg-lib-ml-1198863647"></a>
### atof

```ml
function atof(string)
```

atof

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `string` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L63)

<a id="function-function-mq3-game-bg-lib-atoi-function-atoi-string-src-mq3-game-bg-lib-ml-2122508375"></a>
### atoi

```ml
function atoi(string)
```

atoi

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `string` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L75)

<a id="function-function-mq3-game-bg-lib-bytestring-function-bytestring-value-src-mq3-game-bg-lib-ml-1164141689"></a>
### byteString

```ml
function byteString(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L34)

<a id="function-function-mq3-game-bg-lib-character-function-character-code-src-mq3-game-bg-lib-ml-2429021"></a>
### character

```ml
function character(code)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `code` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L35)

<a id="function-function-mq3-game-bg-lib-clength-function-clength-value-src-mq3-game-bg-lib-ml-1438328399"></a>
### cLength

```ml
function cLength(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L32)

<a id="function-function-mq3-game-bg-lib-clonebytes-function-clonebytes-value-src-mq3-game-bg-lib-ml-711832757"></a>
### cloneBytes

```ml
function cloneBytes(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L33)

<a id="function-function-mq3-game-bg-lib-cos-function-cos-value-src-mq3-game-bg-lib-ml-564942783"></a>
### cos

```ml
function cos(value)
```

cos (#if 0)

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L135)

<a id="function-function-mq3-game-bg-lib-create-acostable-function-create-acostable-src-mq3-game-bg-lib-ml-486439470"></a>
### create_acostable

```ml
function create_acostable()
```

create_acostable (#if 0 and additionally block-commented in the original)


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L137)

<a id="function-function-mq3-game-bg-lib-digit-function-digit-code-src-mq3-game-bg-lib-ml-1432819285"></a>
### digit

```ml
function digit(code)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `code` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L61)

<a id="function-function-mq3-game-bg-lib-disabledif0symbols-function-disabledif0symbols-src-mq3-game-bg-lib-ml-543217150"></a>
### disabledIf0Symbols

```ml
function disabledIf0Symbols()
```

These original symbols are compiled out by #if 0 in bg_lib.c.  They are retained below for source completeness, but are never selected by Q3_VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L23)

<a id="function-function-mq3-game-bg-lib-exchange-function-exchange-values-left-right-src-mq3-game-bg-lib-ml-1705206955"></a>
### exchange

```ml
function exchange(values, left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L89)

<a id="function-function-mq3-game-bg-lib-fabs-function-fabs-value-src-mq3-game-bg-lib-ml-1924977677"></a>
### fabs

```ml
function fabs(value)
```

fabs

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L83)

<a id="function-function-mq3-game-bg-lib-floor-function-floor-value-src-mq3-game-bg-lib-ml-276490525"></a>
### floor

```ml
function floor(value)
```

The following are complete callable translations of the original #if 0 block. floor (#if 0)

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L123)

- [mq3.game.bg_lib.FormatResult](Type-mq3-game-bg-lib-formatresult-502298023.md) — struct
<a id="constant-constant-mq3-game-bg-lib-fpt-const-fpt-256-src-mq3-game-bg-lib-ml-1411498314"></a>
### FPT

```ml
const FPT = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L18)

<a id="constant-constant-mq3-game-bg-lib-hexprefix-const-hexprefix-2-src-mq3-game-bg-lib-ml-1473124395"></a>
### HEXPREFIX

```ml
const HEXPREFIX = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L11)

<a id="function-function-mq3-game-bg-lib-insertionsort-function-insertionsort-values-low-count-compare-src-mq3-game-bg-lib-ml-1783675180"></a>
### insertionSort

```ml
function insertionSort(values, low, count, compare)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `low` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `compare` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L91)

<a id="constant-constant-mq3-game-bg-lib-ladjust-const-ladjust-4-src-mq3-game-bg-lib-ml-1603511945"></a>
### LADJUST

```ml
const LADJUST = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L12)

<a id="constant-constant-mq3-game-bg-lib-longdbl-const-longdbl-8-src-mq3-game-bg-lib-ml-693181309"></a>
### LONGDBL

```ml
const LONGDBL = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L13)

<a id="constant-constant-mq3-game-bg-lib-longint-const-longint-16-src-mq3-game-bg-lib-ml-363235706"></a>
### LONGINT

```ml
const LONGINT = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L14)

<a id="function-function-mq3-game-bg-lib-medianindex-function-medianindex-values-a-b-c-compare-src-mq3-game-bg-lib-ml-1980510831"></a>
### medianIndex

```ml
function medianIndex(values, a, b, c, compare)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |
| `compare` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L90)

<a id="function-function-mq3-game-bg-lib-memcpy-function-memcpy-destination-destinationoffset-source-sourceoffset-count-src-mq3-game-bg-lib-ml-1491972983"></a>
### memcpy

```ml
function memcpy(destination, destinationOffset, source, sourceOffset, count)
```

memcpy (#if 0; original copies backwards)

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — |  |
| `destinationOffset` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `sourceOffset` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L127)

<a id="function-function-mq3-game-bg-lib-memmove-function-memmove-destination-destinationoffset-source-sourceoffset-count-src-mq3-game-bg-lib-ml-418617295"></a>
### memmove

```ml
function memmove(destination, destinationOffset, source, sourceOffset, count)
```

memmove; offsets make pointer aliasing explicit in the safe runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — |  |
| `destinationOffset` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `sourceOffset` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L55)

<a id="function-function-mq3-game-bg-lib-memset-function-memset-destination-offset-code-count-src-mq3-game-bg-lib-ml-1440411403"></a>
### memset

```ml
function memset(destination, offset, code, count)
```

memset (#if 0)

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `code` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L125)

- [mq3.game.bg_lib.ParseResult](Type-mq3-game-bg-lib-parseresult-66941153.md) — struct
<a id="constant-constant-mq3-game-bg-lib-pi-const-pi-3-141593-src-mq3-game-bg-lib-ml-1789542649"></a>
### PI

```ml
const PI = 3.141593
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L19)

<a id="function-function-mq3-game-bg-lib-qsort-function-qsort-values-count-compare-src-mq3-game-bg-lib-ml-1939276320"></a>
### qsort

```ml
function qsort(values, count, compare)
```

qsort -- native typed-array equivalent of the original byte/element API.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `compare` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L98)

<a id="constant-constant-mq3-game-bg-lib-quadint-const-quadint-32-src-mq3-game-bg-lib-ml-534716956"></a>
### QUADINT

```ml
const QUADINT = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L15)

<a id="function-function-mq3-game-bg-lib-quicksortrange-function-quicksortrange-values-low-count-compare-src-mq3-game-bg-lib-ml-1969136386"></a>
### quickSortRange

```ml
function quickSortRange(values, low, count, compare)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `low` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `compare` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L92)

<a id="function-function-mq3-game-bg-lib-rand-function-rand-state-src-mq3-game-bg-lib-ml-316222029"></a>
### rand

```ml
function rand(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L87)

<a id="function-function-mq3-game-bg-lib-randomstate-function-randomstate-seed-src-mq3-game-bg-lib-ml-619777079"></a>
### randomState

```ml
function randomState(seed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `seed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L30)

- [mq3.game.bg_lib.RandomState](Type-mq3-game-bg-lib-randomstate-910087475.md) — struct
<a id="function-function-mq3-game-bg-lib-rawbytes-function-rawbytes-value-src-mq3-game-bg-lib-ml-1460956097"></a>
### rawBytes

```ml
function rawBytes(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L31)

<a id="function-function-mq3-game-bg-lib-repeat-function-repeat-code-count-src-mq3-game-bg-lib-ml-1555632704"></a>
### repeat

```ml
function repeat(code, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `code` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L100)

- [mq3.game.bg_lib.ScanResult](Type-mq3-game-bg-lib-scanresult-1906985509.md) — struct
<a id="constant-constant-mq3-game-bg-lib-shortint-const-shortint-64-src-mq3-game-bg-lib-ml-420995253"></a>
### SHORTINT

```ml
const SHORTINT = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L16)

<a id="function-function-mq3-game-bg-lib-sin-function-sin-value-src-mq3-game-bg-lib-ml-1652571389"></a>
### sin

```ml
function sin(value)
```

sin (#if 0)

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L133)

<a id="function-function-mq3-game-bg-lib-skipspace-function-skipspace-data-index-src-mq3-game-bg-lib-ml-319558238"></a>
### skipSpace

```ml
function skipSpace(data, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L60)

<a id="function-function-mq3-game-bg-lib-sqrt-function-sqrt-value-src-mq3-game-bg-lib-ml-2007968365"></a>
### sqrt

```ml
function sqrt(value)
```

sqrt (#if 0)

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L131)

<a id="function-function-mq3-game-bg-lib-srand-function-srand-state-seed-src-mq3-game-bg-lib-ml-1993693056"></a>
### srand

```ml
function srand(state, seed)
```

srand / rand use the original 32-bit LCG.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `seed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L86)

<a id="function-function-mq3-game-bg-lib-sscanf-function-sscanf-buffer-format-src-mq3-game-bg-lib-ml-1370913923"></a>
### sscanf

```ml
function sscanf(buffer, format)
```

sscanf preserves the original implementation's count bug (always zero).

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buffer` | `dynamic` | — |  |
| `format` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L117)

<a id="function-function-mq3-game-bg-lib-strcat-function-strcat-destination-source-src-mq3-game-bg-lib-ml-2125590225"></a>
### strcat

```ml
function strcat(destination, source)
```

strcat

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L40)

<a id="function-function-mq3-game-bg-lib-strchr-function-strchr-string-code-src-mq3-game-bg-lib-ml-735218474"></a>
### strchr

```ml
function strchr(string, code)
```

strchr -- a C pointer result is represented by its byte offset, or -1.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `string` | `dynamic` | — |  |
| `code` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L46)

<a id="function-function-mq3-game-bg-lib-strcmp-function-strcmp-left-right-src-mq3-game-bg-lib-ml-693601433"></a>
### strcmp

```ml
function strcmp(left, right)
```

strcmp

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L44)

<a id="function-function-mq3-game-bg-lib-strcpy-function-strcpy-destination-source-src-mq3-game-bg-lib-ml-441109805"></a>
### strcpy

```ml
function strcpy(destination, source)
```

strcpy

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L42)

<a id="function-function-mq3-game-bg-lib-strlen-function-strlen-string-src-mq3-game-bg-lib-ml-316385435"></a>
### strlen

```ml
function strlen(string)
```

strlen

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `string` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L38)

<a id="function-function-mq3-game-bg-lib-strncpy-function-strncpy-destination-offset-source-count-src-mq3-game-bg-lib-ml-1581703933"></a>
### strncpy

```ml
function strncpy(destination, offset, source, count)
```

strncpy (#if 0)

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L129)

<a id="function-function-mq3-game-bg-lib-strstr-function-strstr-string-needle-src-mq3-game-bg-lib-ml-1209791564"></a>
### strstr

```ml
function strstr(string, needle)
```

strstr -- a C pointer result is represented by its byte offset, or -1.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `string` | `dynamic` | — |  |
| `needle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L48)

<a id="function-function-mq3-game-bg-lib-tan-function-tan-value-src-mq3-game-bg-lib-ml-1058256667"></a>
### tan

```ml
function tan(value)
```

tan is active in Q3_VM and uses the active sine/cosine intrinsics.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L143)

<a id="function-function-mq3-game-bg-lib-tolower-function-tolower-code-src-mq3-game-bg-lib-ml-288371263"></a>
### tolower

```ml
function tolower(code)
```

tolower

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `code` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L50)

<a id="function-function-mq3-game-bg-lib-toupper-function-toupper-code-src-mq3-game-bg-lib-ml-403715033"></a>
### toupper

```ml
function toupper(code)
```

toupper

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `code` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L52)

<a id="function-function-mq3-game-bg-lib-vsprintf-function-vsprintf-format-arguments-src-mq3-game-bg-lib-ml-138561993"></a>
### vsprintf

```ml
function vsprintf(format, arguments)
```

vsprintf uses an array as the typed va_list boundary.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `format` | `dynamic` | — |  |
| `arguments` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L113)

<a id="constant-constant-mq3-game-bg-lib-zeropad-const-zeropad-128-src-mq3-game-bg-lib-ml-467259274"></a>
### ZEROPAD

```ml
const ZEROPAD = 128
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L17)
