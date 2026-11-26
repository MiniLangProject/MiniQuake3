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
| `string` | `dynamic` | — | Value passed as argument 1 to `typeof`. |
| `start` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L111)

<a id="function-function-mq3-game-bg-lib-atoi-function-atoi-string-start-src-mq3-game-bg-lib-ml-1631861051"></a>
### _atoi

```ml
function _atoi(string, start)
```

_atoi

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `string` | `dynamic` | — | Value passed as argument 1 to `typeof`. |
| `start` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L122)

<a id="function-function-mq3-game-bg-lib-abs-function-abs-value-src-mq3-game-bg-lib-ml-1872703981"></a>
### abs

```ml
function abs(value)
```

abs

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `numeric.i32(0-value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L127)

<a id="function-function-mq3-game-bg-lib-acos-function-acos-value-src-mq3-game-bg-lib-ml-1575332957"></a>
### acos

```ml
function acos(value)
```

acos (#if 0)

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.transcendental.atan2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L247)

<a id="function-function-mq3-game-bg-lib-addfloat-function-addfloat-value-width-precision-src-mq3-game-bg-lib-ml-1748049809"></a>
### AddFloat

```ml
function AddFloat(value, width, precision)
```

AddFloat

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.f32`. |
| `width` | `dynamic` | — | Value used by `AddFloat` in `padding=width-len(bytes(digits))`. |
| `precision` | `dynamic` | — | Value used by `AddFloat` in `if precision<0 then precision=6 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L189)

<a id="function-function-mq3-game-bg-lib-addint-function-addint-value-width-flags-src-mq3-game-bg-lib-ml-1188426714"></a>
### AddInt

```ml
function AddInt(value, width, flags)
```

AddInt

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `AddInt` in `negative=value<0`. |
| `width` | `dynamic` | — | Value used by `AddInt` in `padding=width-len(bytes(digits))`. |
| `flags` | `dynamic` | — | Value used by `AddInt` in `if (flags&ZEROPAD)!=0 then pad=48 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L182)

<a id="function-function-mq3-game-bg-lib-addstring-function-addstring-value-width-precision-src-mq3-game-bg-lib-ml-790898869"></a>
### AddString

```ml
function AddString(value, width, precision)
```

AddString

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `str`. |
| `width` | `dynamic` | — | Operand used to evaluate the returned expression `text+repeat(32,width-length)`. |
| `precision` | `dynamic` | — | Value passed as argument 3 to `slice`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L196)

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
| `y` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.transcendental.atan2`. |
| `x` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.transcendental.atan2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L251)

<a id="function-function-mq3-game-bg-lib-atof-function-atof-string-src-mq3-game-bg-lib-ml-1198863647"></a>
### atof

```ml
function atof(string)
```

atof

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `string` | `dynamic` | — | Value passed as argument 1 to `typeof`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L103)

<a id="function-function-mq3-game-bg-lib-atoi-function-atoi-string-src-mq3-game-bg-lib-ml-2122508375"></a>
### atoi

```ml
function atoi(string)
```

atoi

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `string` | `dynamic` | — | Value passed as argument 1 to `typeof`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L118)

<a id="function-function-mq3-game-bg-lib-bytestring-function-bytestring-value-src-mq3-game-bg-lib-ml-1164141689"></a>
### byteString

```ml
function byteString(value)
```

Return the result of `decode(value)` for `byteString`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `decode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L48)

<a id="function-function-mq3-game-bg-lib-character-function-character-code-src-mq3-game-bg-lib-ml-2429021"></a>
### character

```ml
function character(code)
```

Encode the low eight bits of a character code as one byte of text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `code` | `dynamic` | — | Value used by `character` in `value[0]=code&255`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L51)

<a id="function-function-mq3-game-bg-lib-clength-function-clength-value-src-mq3-game-bg-lib-ml-1438328399"></a>
### cLength

```ml
function cLength(value)
```

Apply `mq3.game.bg_lib.rawBytes` while evaluating `cLength`. Return paths include `index`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `typeof`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L42)

<a id="function-function-mq3-game-bg-lib-clonebytes-function-clonebytes-value-src-mq3-game-bg-lib-ml-711832757"></a>
### cloneBytes

```ml
function cloneBytes(value)
```

Copy every byte into a newly allocated buffer of the same length.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Array or byte sequence accessed at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L45)

<a id="function-function-mq3-game-bg-lib-cos-function-cos-value-src-mq3-game-bg-lib-ml-564942783"></a>
### cos

```ml
function cos(value)
```

cos (#if 0)

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.transcendental.cos`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L242)

<a id="function-function-mq3-game-bg-lib-create-acostable-function-create-acostable-src-mq3-game-bg-lib-ml-486439470"></a>
### create_acostable

```ml
function create_acostable()
```

create_acostable (#if 0 and additionally block-commented in the original)


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L244)

<a id="function-function-mq3-game-bg-lib-digit-function-digit-code-src-mq3-game-bg-lib-ml-1432819285"></a>
### digit

```ml
function digit(code)
```

Test `code>=48 and code<=57` as the condition for `digit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `code` | `dynamic` | — | Operand used to evaluate the returned expression `code>=48 and code<=57`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L100)

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

Set `values[left]` to `values[right]` and `values[right]` to `saved` in `mq3.game.bg_lib.exchange`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Array or byte sequence accessed at `left` and `right`. Entries are written in place. |
| `left` | `dynamic` | — | Value used by `exchange` in `saved=values[left]`. |
| `right` | `dynamic` | — | Value used by `exchange` in `values[left]=values[right]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L144)

<a id="function-function-mq3-game-bg-lib-fabs-function-fabs-value-src-mq3-game-bg-lib-ml-1924977677"></a>
### fabs

```ml
function fabs(value)
```

fabs

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `0.0-value`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L130)

<a id="function-function-mq3-game-bg-lib-floor-function-floor-value-src-mq3-game-bg-lib-ml-276490525"></a>
### floor

```ml
function floor(value)
```

The following are complete callable translations of the original #if 0 block. floor (#if 0)

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `textnumbers.truncDouble32(value+1073741824.0)-1073741824`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L214)

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

Apply `mq3.game.bg_lib.exchange` while evaluating `insertionSort`. Return paths include `values`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Array or byte sequence accessed at `left` and `right`. Entries are written in place. |
| `low` | `dynamic` | — | Value used by `insertionSort` in `if count>1 then for current=low+1 to low+count-1 position=current`. |
| `count` | `dynamic` | — | Number of entries or bytes processed by this call. |
| `compare` | `dynamic` | — | Value used by `insertionSort` in `while position>low and compare(values[position-1],values[position])>0 exchange(values,position,position-1)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L157)

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

Choose the median of three array indices using the supplied comparison callback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Array or byte sequence accessed at `a`, `b` and `c`. |
| `a` | `dynamic` | — | Operand used to evaluate the returned expression `a`. |
| `b` | `dynamic` | — | Operand used to evaluate the returned expression `b`. |
| `c` | `dynamic` | — | Operand used to evaluate the returned expression `c`. |
| `compare` | `dynamic` | — | Value used by `medianIndex` in `if compare(values[a],values[b])<0 then if compare(values[b],values[c])<0 then return b end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L151)

<a id="function-function-mq3-game-bg-lib-memcpy-function-memcpy-destination-destinationoffset-source-sourceoffset-count-src-mq3-game-bg-lib-ml-1491972983"></a>
### memcpy

```ml
function memcpy(destination, destinationOffset, source, sourceOffset, count)
```

memcpy (#if 0; original copies backwards)

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — | Array or byte sequence accessed at `destinationOffset+i`. Entries are written in place. |
| `destinationOffset` | `dynamic` | — | Value used by `memcpy` in `if destinationOffset<0 or sourceOffset<0 or count<0 or destinationOffset+count>len(destination) or sourceOffset+...`. |
| `source` | `dynamic` | — | Array or byte sequence accessed at `sourceOffset+i`. |
| `sourceOffset` | `dynamic` | — | Value used by `memcpy` in `if destinationOffset<0 or sourceOffset<0 or count<0 or destinationOffset+count>len(destination) or sourceOffset+...`. |
| `count` | `dynamic` | — | Number of entries or bytes processed by this call. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L227)

<a id="function-function-mq3-game-bg-lib-memmove-function-memmove-destination-destinationoffset-source-sourceoffset-count-src-mq3-game-bg-lib-ml-418617295"></a>
### memmove

```ml
function memmove(destination, destinationOffset, source, sourceOffset, count)
```

memmove; offsets make pointer aliasing explicit in the safe runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — | Array or byte sequence accessed at `destinationOffset+i`. Entries are written in place. |
| `destinationOffset` | `dynamic` | — | Value used by `memmove` in `if destinationOffset<0 or sourceOffset<0 or count<0 or destinationOffset+count>len(destination) or sourceOffset+...`. |
| `source` | `dynamic` | — | Array or byte sequence accessed at `sourceOffset+i`. |
| `sourceOffset` | `dynamic` | — | Value used by `memmove` in `if destinationOffset<0 or sourceOffset<0 or count<0 or destinationOffset+count>len(destination) or sourceOffset+...`. |
| `count` | `dynamic` | — | Number of entries or bytes processed by this call. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L89)

<a id="function-function-mq3-game-bg-lib-memset-function-memset-destination-offset-code-count-src-mq3-game-bg-lib-ml-1440411403"></a>
### memset

```ml
function memset(destination, offset, code, count)
```

memset (#if 0)

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — | Array or byte sequence accessed at `offset+index`. Entries are written in place. |
| `offset` | `dynamic` | — | Offset into the buffer or sequence used by this operation. |
| `code` | `dynamic` | — | Value used by `memset` in `if count>0 then for index=0 to count-1 destination[offset+index]=code&255 end for end if`. |
| `count` | `dynamic` | — | Number of entries or bytes processed by this call. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L220)

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
| `values` | `dynamic` | — | Array or byte sequence accessed at `left` and `right`. Entries are written in place. |
| `count` | `dynamic` | — | Number of entries or bytes processed by this call. |
| `compare` | `dynamic` | — | Value used by `insertionSort` in `while position>low and compare(values[position-1],values[position])>0 exchange(values,position,position-1)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L172)

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

Set `values[position]` to `item` in `mq3.game.bg_lib.quickSortRange`. Return paths include `values`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Array or byte sequence accessed at `left` and `right`. Entries are written in place. |
| `low` | `dynamic` | — | Value used by `insertionSort` in `if count>1 then for current=low+1 to low+count-1 position=current`. |
| `count` | `dynamic` | — | Number of entries or bytes processed by this call. |
| `compare` | `dynamic` | — | Value used by `insertionSort` in `while position>low and compare(values[position-1],values[position])>0 exchange(values,position,position-1)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L163)

<a id="function-function-mq3-game-bg-lib-rand-function-rand-state-src-mq3-game-bg-lib-ml-316222029"></a>
### rand

```ml
function rand(state)
```

Set `state.seed` to `numeric.add32(numeric.mul32(69069,state.seed),1)` in `mq3.game.bg_lib.rand`. Return paths include `state.seed&0x7fff`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bg lib state; accesses `seed`. May update `state.seed` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L138)

<a id="function-function-mq3-game-bg-lib-randomstate-function-randomstate-seed-src-mq3-game-bg-lib-ml-619777079"></a>
### randomState

```ml
function randomState(seed)
```

Create a `mq3.game.bg_lib.RandomState` record, initializing `seed` as `numeric.i32(seed)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `seed` | `dynamic` | — | State used to initialize the deterministic random sequence. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L36)

- [mq3.game.bg_lib.RandomState](Type-mq3-game-bg-lib-randomstate-910087475.md) — struct
<a id="function-function-mq3-game-bg-lib-rawbytes-function-rawbytes-value-src-mq3-game-bg-lib-ml-1460956097"></a>
### rawBytes

```ml
function rawBytes(value)
```

Retain an existing byte buffer or encode the string representation of another value as bytes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `typeof`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L39)

<a id="function-function-mq3-game-bg-lib-repeat-function-repeat-code-count-src-mq3-game-bg-lib-ml-1555632704"></a>
### repeat

```ml
function repeat(code, count)
```

Build text containing the requested number of copies of one byte-valued character.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `code` | `dynamic` | — | Value used by `repeat` in `data=bytes(count,code&255)`. |
| `count` | `dynamic` | — | Number of entries or bytes processed by this call. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L177)

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
| `value` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.transcendental.sin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L239)

<a id="function-function-mq3-game-bg-lib-skipspace-function-skipspace-data-index-src-mq3-game-bg-lib-ml-319558238"></a>
### skipSpace

```ml
function skipSpace(data, index)
```

Advance past consecutive character codes at or below ASCII space.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Array or byte sequence accessed at `index`. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L97)

<a id="function-function-mq3-game-bg-lib-sqrt-function-sqrt-value-src-mq3-game-bg-lib-ml-2007968365"></a>
### sqrt

```ml
function sqrt(value)
```

sqrt (#if 0)

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `sqrt` in `if value<=0.0 then return 0.0 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L236)

<a id="function-function-mq3-game-bg-lib-srand-function-srand-state-seed-src-mq3-game-bg-lib-ml-1993693056"></a>
### srand

```ml
function srand(state, seed)
```

srand / rand use the original 32-bit LCG.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bg lib state; accesses `seed`. May update `state.seed` in place. |
| `seed` | `dynamic` | — | State used to initialize the deterministic random sequence. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L135)

<a id="function-function-mq3-game-bg-lib-sscanf-function-sscanf-buffer-format-src-mq3-game-bg-lib-ml-1370913923"></a>
### sscanf

```ml
function sscanf(buffer, format)
```

sscanf preserves the original implementation's count bug (always zero).

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `buffer` | `dynamic` | — | Value passed as argument 1 to `typeof`. |
| `format` | `dynamic` | — | C-style format string. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L207)

<a id="function-function-mq3-game-bg-lib-strcat-function-strcat-destination-source-src-mq3-game-bg-lib-ml-2125590225"></a>
### strcat

```ml
function strcat(destination, source)
```

strcat

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — | Array or byte sequence accessed at `index`. |
| `source` | `dynamic` | — | Value passed as argument 1 to `typeof`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L59)

<a id="function-function-mq3-game-bg-lib-strchr-function-strchr-string-code-src-mq3-game-bg-lib-ml-735218474"></a>
### strchr

```ml
function strchr(string, code)
```

strchr -- a C pointer result is represented by its byte offset, or -1.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `string` | `dynamic` | — | Value passed as argument 1 to `typeof`. |
| `code` | `dynamic` | — | Value used by `strchr` in `while index<len(data) and data[index]!=0 if data[index]==(code&255) then return index end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L71)

<a id="function-function-mq3-game-bg-lib-strcmp-function-strcmp-left-right-src-mq3-game-bg-lib-ml-693601433"></a>
### strcmp

```ml
function strcmp(left, right)
```

strcmp

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Value passed as argument 1 to `typeof`. |
| `right` | `dynamic` | — | Value passed as argument 1 to `typeof`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L67)

<a id="function-function-mq3-game-bg-lib-strcpy-function-strcpy-destination-source-src-mq3-game-bg-lib-ml-441109805"></a>
### strcpy

```ml
function strcpy(destination, source)
```

strcpy

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — | Array or byte sequence accessed at `index`. |
| `source` | `dynamic` | — | Value passed as argument 1 to `typeof`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L63)

<a id="function-function-mq3-game-bg-lib-strlen-function-strlen-string-src-mq3-game-bg-lib-ml-316385435"></a>
### strlen

```ml
function strlen(string)
```

strlen

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `string` | `dynamic` | — | Value passed as argument 1 to `typeof`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L55)

<a id="function-function-mq3-game-bg-lib-strncpy-function-strncpy-destination-offset-source-count-src-mq3-game-bg-lib-ml-1581703933"></a>
### strncpy

```ml
function strncpy(destination, offset, source, count)
```

strncpy (#if 0)

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `destination` | `dynamic` | — | Array or byte sequence accessed at `offset+index`. Entries are written in place. |
| `offset` | `dynamic` | — | Offset into the buffer or sequence used by this operation. |
| `source` | `dynamic` | — | Value passed as argument 1 to `typeof`. |
| `count` | `dynamic` | — | Number of entries or bytes processed by this call. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L233)

<a id="function-function-mq3-game-bg-lib-strstr-function-strstr-string-needle-src-mq3-game-bg-lib-ml-1209791564"></a>
### strstr

```ml
function strstr(string, needle)
```

strstr -- a C pointer result is represented by its byte offset, or -1.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `string` | `dynamic` | — | Value passed as argument 1 to `typeof`. |
| `needle` | `dynamic` | — | Text or value to search for. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L75)

<a id="function-function-mq3-game-bg-lib-tan-function-tan-value-src-mq3-game-bg-lib-ml-1058256667"></a>
### tan

```ml
function tan(value)
```

tan is active in Q3_VM and uses the active sine/cosine intrinsics.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.transcendental.sin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L254)

<a id="function-function-mq3-game-bg-lib-tolower-function-tolower-code-src-mq3-game-bg-lib-ml-288371263"></a>
### tolower

```ml
function tolower(code)
```

tolower

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `code` | `dynamic` | — | Operand used to evaluate the returned expression `code+32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L78)

<a id="function-function-mq3-game-bg-lib-toupper-function-toupper-code-src-mq3-game-bg-lib-ml-403715033"></a>
### toupper

```ml
function toupper(code)
```

toupper

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `code` | `dynamic` | — | Operand used to evaluate the returned expression `code-32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L81)

<a id="function-function-mq3-game-bg-lib-vsprintf-function-vsprintf-format-arguments-src-mq3-game-bg-lib-ml-138561993"></a>
### vsprintf

```ml
function vsprintf(format, arguments)
```

vsprintf uses an array as the typed va_list boundary.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `format` | `dynamic` | — | C-style format string. |
| `arguments` | `dynamic` | — | Ordered arguments consumed by the call or formatter. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L201)

<a id="constant-constant-mq3-game-bg-lib-zeropad-const-zeropad-128-src-mq3-game-bg-lib-ml-467259274"></a>
### ZEROPAD

```ml
const ZEROPAD = 128
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bg_lib.ml#L17)
