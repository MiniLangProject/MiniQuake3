# `src/mq3/shared/q_shared_header.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.shared.q_shared_header`](Package-mq3-shared-q-shared-header-2067110.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `mq3/shared/q_shared_runtime.ml` as `shared` → [src/mq3/shared/q_shared_runtime.ml](File-src-mq3-shared-q-shared-runtime-ml-1830953505.md)

## Declarations

<a id="function-function-mq3-shared-q-shared-header-fctiw-function-fctiw-value-src-mq3-shared-q-shared-header-ml-240111203"></a>
### __fctiw

```ml
function __fctiw(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L60)

<a id="function-function-mq3-shared-q-shared-header-lhbrx-function-lhbrx-data-offset-src-mq3-shared-q-shared-header-ml-30167091"></a>
### __lhbrx

```ml
function __lhbrx(data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L56)

<a id="function-function-mq3-shared-q-shared-header-lwbrx-function-lwbrx-data-offset-src-mq3-shared-q-shared-header-ml-730577953"></a>
### __lwbrx

```ml
function __lwbrx(data, offset)
```

The three names below are PowerPC compiler intrinsics in the original header. Keeping managed equivalents makes the header surface complete while the Win32 target naturally uses the Big/Little helpers above.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L52)

<a id="constant-constant-mq3-shared-q-shared-header-big-info-string-const-big-info-string-8192-src-mq3-shared-q-shared-header-ml-1786239593"></a>
### BIG_INFO_STRING

```ml
const BIG_INFO_STRING = 8192
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L15)

<a id="function-function-mq3-shared-q-shared-header-bigfloat-function-bigfloat-value-src-mq3-shared-q-shared-header-ml-1520386413"></a>
### BigFloat

```ml
function BigFloat(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L35)

<a id="function-function-mq3-shared-q-shared-header-biglong-function-biglong-value-src-mq3-shared-q-shared-header-ml-1903357709"></a>
### BigLong

```ml
function BigLong(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L33)

<a id="function-function-mq3-shared-q-shared-header-bigshort-function-bigshort-value-src-mq3-shared-q-shared-header-ml-889830729"></a>
### BigShort

```ml
function BigShort(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L31)

<a id="function-function-mq3-shared-q-shared-header-crossproduct-function-crossproduct-a-b-src-mq3-shared-q-shared-header-ml-11808991"></a>
### CrossProduct

```ml
function CrossProduct(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L38)

<a id="function-function-mq3-shared-q-shared-header-distance-function-distance-a-b-src-mq3-shared-q-shared-header-ml-702567099"></a>
### Distance

```ml
function Distance(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L39)

<a id="function-function-mq3-shared-q-shared-header-distancesquared-function-distancesquared-a-b-src-mq3-shared-q-shared-header-ml-1155531939"></a>
### DistanceSquared

```ml
function DistanceSquared(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L40)

<a id="constant-constant-mq3-shared-q-shared-header-entitynum-max-normal-const-entitynum-max-normal-1022-src-mq3-shared-q-shared-header-ml-1449725282"></a>
### ENTITYNUM_MAX_NORMAL

```ml
const ENTITYNUM_MAX_NORMAL = 1022
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L23)

<a id="constant-constant-mq3-shared-q-shared-header-entitynum-none-const-entitynum-none-1023-src-mq3-shared-q-shared-header-ml-1555129949"></a>
### ENTITYNUM_NONE

```ml
const ENTITYNUM_NONE = 1023
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L21)

<a id="constant-constant-mq3-shared-q-shared-header-entitynum-world-const-entitynum-world-1022-src-mq3-shared-q-shared-header-ml-771138192"></a>
### ENTITYNUM_WORLD

```ml
const ENTITYNUM_WORLD = 1022
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L22)

<a id="constant-constant-mq3-shared-q-shared-header-gentitynum-bits-const-gentitynum-bits-10-src-mq3-shared-q-shared-header-ml-115922956"></a>
### GENTITYNUM_BITS

```ml
const GENTITYNUM_BITS = 10
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L24)

<a id="function-function-mq3-shared-q-shared-header-littlefloat-function-littlefloat-value-src-mq3-shared-q-shared-header-ml-428414481"></a>
### LittleFloat

```ml
function LittleFloat(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L36)

<a id="function-function-mq3-shared-q-shared-header-littlelong-function-littlelong-value-src-mq3-shared-q-shared-header-ml-899209177"></a>
### LittleLong

```ml
function LittleLong(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L34)

<a id="function-function-mq3-shared-q-shared-header-littleshort-function-littleshort-value-src-mq3-shared-q-shared-header-ml-633933025"></a>
### LittleShort

```ml
function LittleShort(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L32)

<a id="constant-constant-mq3-shared-q-shared-header-max-clients-const-max-clients-64-src-mq3-shared-q-shared-header-ml-2009160631"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L19)

<a id="constant-constant-mq3-shared-q-shared-header-max-configstrings-const-max-configstrings-1024-src-mq3-shared-q-shared-header-ml-1558626790"></a>
### MAX_CONFIGSTRINGS

```ml
const MAX_CONFIGSTRINGS = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L27)

<a id="constant-constant-mq3-shared-q-shared-header-max-gamestate-chars-const-max-gamestate-chars-16000-src-mq3-shared-q-shared-header-ml-1690874328"></a>
### MAX_GAMESTATE_CHARS

```ml
const MAX_GAMESTATE_CHARS = 16000
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L28)

<a id="constant-constant-mq3-shared-q-shared-header-max-gentities-const-max-gentities-1024-src-mq3-shared-q-shared-header-ml-288351230"></a>
### MAX_GENTITIES

```ml
const MAX_GENTITIES = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L20)

<a id="constant-constant-mq3-shared-q-shared-header-max-info-string-const-max-info-string-1024-src-mq3-shared-q-shared-header-ml-1932832094"></a>
### MAX_INFO_STRING

```ml
const MAX_INFO_STRING = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L14)

<a id="constant-constant-mq3-shared-q-shared-header-max-models-const-max-models-256-src-mq3-shared-q-shared-header-ml-1563059964"></a>
### MAX_MODELS

```ml
const MAX_MODELS = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L25)

<a id="constant-constant-mq3-shared-q-shared-header-max-name-length-const-max-name-length-32-src-mq3-shared-q-shared-header-ml-1958297220"></a>
### MAX_NAME_LENGTH

```ml
const MAX_NAME_LENGTH = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L17)

<a id="constant-constant-mq3-shared-q-shared-header-max-qpath-const-max-qpath-64-src-mq3-shared-q-shared-header-ml-1686480079"></a>
### MAX_QPATH

```ml
const MAX_QPATH = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L16)

<a id="constant-constant-mq3-shared-q-shared-header-max-say-text-const-max-say-text-150-src-mq3-shared-q-shared-header-ml-1445185001"></a>
### MAX_SAY_TEXT

```ml
const MAX_SAY_TEXT = 150
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L18)

<a id="constant-constant-mq3-shared-q-shared-header-max-sounds-const-max-sounds-256-src-mq3-shared-q-shared-header-ml-949005292"></a>
### MAX_SOUNDS

```ml
const MAX_SOUNDS = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L26)

<a id="constant-constant-mq3-shared-q-shared-header-max-string-chars-const-max-string-chars-1024-src-mq3-shared-q-shared-header-ml-608118484"></a>
### MAX_STRING_CHARS

```ml
const MAX_STRING_CHARS = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L12)

<a id="constant-constant-mq3-shared-q-shared-header-max-token-chars-const-max-token-chars-1024-src-mq3-shared-q-shared-header-ml-1782791054"></a>
### MAX_TOKEN_CHARS

```ml
const MAX_TOKEN_CHARS = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L13)

<a id="constant-constant-mq3-shared-q-shared-header-path-sep-const-path-sep-92-src-mq3-shared-q-shared-header-ml-1004489028"></a>
### PATH_SEP

```ml
const PATH_SEP = 92
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L29)

<a id="function-function-mq3-shared-q-shared-header-ppcfctiw-function-ppcfctiw-value-src-mq3-shared-q-shared-header-ml-1394906969"></a>
### ppcFctiw

```ml
function ppcFctiw(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L69)

<a id="function-function-mq3-shared-q-shared-header-ppclhbrx-function-ppclhbrx-data-offset-src-mq3-shared-q-shared-header-ml-1664689039"></a>
### ppcLhbrx

```ml
function ppcLhbrx(data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L68)

<a id="function-function-mq3-shared-q-shared-header-ppclwbrx-function-ppclwbrx-data-offset-src-mq3-shared-q-shared-header-ml-1561260023"></a>
### ppcLwbrx

```ml
function ppcLwbrx(data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L67)

<a id="function-function-mq3-shared-q-shared-header-q-fabs-function-q-fabs-value-src-mq3-shared-q-shared-header-ml-826381081"></a>
### Q_fabs

```ml
function Q_fabs(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L41)

<a id="function-function-mq3-shared-q-shared-header-q-rsqrt-function-q-rsqrt-value-src-mq3-shared-q-shared-header-ml-382548969"></a>
### Q_rsqrt

```ml
function Q_rsqrt(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L42)

<a id="constant-constant-mq3-shared-q-shared-header-qfalse-const-qfalse-0-src-mq3-shared-q-shared-header-ml-1352866927"></a>
### qfalse

```ml
const qfalse = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L10)

<a id="constant-constant-mq3-shared-q-shared-header-qtrue-const-qtrue-1-src-mq3-shared-q-shared-header-ml-1918161310"></a>
### qtrue

```ml
const qtrue = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L11)

<a id="function-function-mq3-shared-q-shared-header-vectorcompare-function-vectorcompare-a-b-src-mq3-shared-q-shared-header-ml-1396108279"></a>
### VectorCompare

```ml
function VectorCompare(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L43)

<a id="function-function-mq3-shared-q-shared-header-vectorinverse-function-vectorinverse-value-src-mq3-shared-q-shared-header-ml-1557601583"></a>
### VectorInverse

```ml
function VectorInverse(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L44)

<a id="function-function-mq3-shared-q-shared-header-vectorlength-function-vectorlength-value-src-mq3-shared-q-shared-header-ml-1033480861"></a>
### VectorLength

```ml
function VectorLength(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L45)

<a id="function-function-mq3-shared-q-shared-header-vectorlengthsquared-function-vectorlengthsquared-value-src-mq3-shared-q-shared-header-ml-1666511553"></a>
### VectorLengthSquared

```ml
function VectorLengthSquared(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L46)

<a id="function-function-mq3-shared-q-shared-header-vectornormalizefast-function-vectornormalizefast-value-src-mq3-shared-q-shared-header-ml-540905673"></a>
### VectorNormalizeFast

```ml
function VectorNormalizeFast(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/q_shared_header.ml#L47)
