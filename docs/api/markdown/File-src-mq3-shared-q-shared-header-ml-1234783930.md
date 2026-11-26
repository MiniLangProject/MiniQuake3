# `src/mq3/shared/q_shared_header.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.shared.q_shared_header`](Package-mq3-shared-q-shared-header-2067110.md)

Reachable from entry: **yes**

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

Compute fctiw in shared.q_shared_header; the normal completion returns `integer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Floating-point value to narrow and reinterpret. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L125)

<a id="function-function-mq3-shared-q-shared-header-lhbrx-function-lhbrx-data-offset-src-mq3-shared-q-shared-header-ml-30167091"></a>
### __lhbrx

```ml
function __lhbrx(data, offset)
```

Compute lhbrx in shared.q_shared_header; the normal completion returns `(((data[offset] << 8) | data[(offset + 1)]) & 65535)`.

Validation failures include `__lhbrx outside buffer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `len(data)` and `data[offset]`. |
| `offset` | `dynamic` | — | Zero-based index into `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L119)

<a id="function-function-mq3-shared-q-shared-header-lwbrx-function-lwbrx-data-offset-src-mq3-shared-q-shared-header-ml-730577953"></a>
### __lwbrx

```ml
function __lwbrx(data, offset)
```

The three names below are PowerPC compiler intrinsics in the original header. Keeping managed equivalents makes the header surface complete while the Win32 target naturally uses the Big/Little helpers above.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data used in `len(data)` and `data[offset]`. |
| `offset` | `dynamic` | — | Zero-based index into `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L110)

<a id="constant-constant-mq3-shared-q-shared-header-big-info-string-const-big-info-string-8192-src-mq3-shared-q-shared-header-ml-1786239593"></a>
### BIG_INFO_STRING

```ml
const BIG_INFO_STRING = 8192
```

Byte limit for an extended backslash-delimited information string.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L21)

<a id="function-function-mq3-shared-q-shared-header-bigfloat-function-bigfloat-value-src-mq3-shared-q-shared-header-ml-1520386413"></a>
### BigFloat

```ml
function BigFloat(value)
```

Return `mq3.shared.q_shared_runtime.bigFloat(value)` from `shared.q_shared_header.BigFloat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.shared.q_shared_runtime.bigFloat`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L65)

<a id="function-function-mq3-shared-q-shared-header-biglong-function-biglong-value-src-mq3-shared-q-shared-header-ml-1903357709"></a>
### BigLong

```ml
function BigLong(value)
```

Return `mq3.shared.q_shared_runtime.bigLong(value)` from `shared.q_shared_header.BigLong`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.shared.q_shared_runtime.bigLong`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L59)

<a id="function-function-mq3-shared-q-shared-header-bigshort-function-bigshort-value-src-mq3-shared-q-shared-header-ml-889830729"></a>
### BigShort

```ml
function BigShort(value)
```

Return `mq3.shared.q_shared_runtime.bigShort(value)` from `shared.q_shared_header.BigShort`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.shared.q_shared_runtime.bigShort`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L53)

<a id="function-function-mq3-shared-q-shared-header-crossproduct-function-crossproduct-a-b-src-mq3-shared-q-shared-header-ml-11808991"></a>
### CrossProduct

```ml
function CrossProduct(a, b)
```

Return `mq3.shared.math.CrossProduct(a, b)` from `shared.q_shared_header.CrossProduct`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A passed as `a` to `mq3.shared.math.CrossProduct`. |
| `b` | `dynamic` | — | B passed as `b` to `mq3.shared.math.CrossProduct`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L73)

<a id="function-function-mq3-shared-q-shared-header-distance-function-distance-a-b-src-mq3-shared-q-shared-header-ml-702567099"></a>
### Distance

```ml
function Distance(a, b)
```

Return `mq3.shared.math.Distance(a, b)` from `shared.q_shared_header.Distance`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A passed as `a` to `mq3.shared.math.Distance`. |
| `b` | `dynamic` | — | B passed as `b` to `mq3.shared.math.Distance`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L77)

<a id="function-function-mq3-shared-q-shared-header-distancesquared-function-distancesquared-a-b-src-mq3-shared-q-shared-header-ml-1155531939"></a>
### DistanceSquared

```ml
function DistanceSquared(a, b)
```

Return `mq3.shared.math.DistanceSquared(a, b)` from `shared.q_shared_header.DistanceSquared`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A passed as `a` to `mq3.shared.math.DistanceSquared`. |
| `b` | `dynamic` | — | B passed as `b` to `mq3.shared.math.DistanceSquared`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L81)

<a id="constant-constant-mq3-shared-q-shared-header-entitynum-max-normal-const-entitynum-max-normal-1022-src-mq3-shared-q-shared-header-ml-1449725282"></a>
### ENTITYNUM_MAX_NORMAL

```ml
const ENTITYNUM_MAX_NORMAL = 1022
```

First reserved entity number; normal entity slots must remain below it.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L37)

<a id="constant-constant-mq3-shared-q-shared-header-entitynum-none-const-entitynum-none-1023-src-mq3-shared-q-shared-header-ml-1555129949"></a>
### ENTITYNUM_NONE

```ml
const ENTITYNUM_NONE = 1023
```

Entity-number sentinel meaning that no entity was hit or referenced.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L33)

<a id="constant-constant-mq3-shared-q-shared-header-entitynum-world-const-entitynum-world-1022-src-mq3-shared-q-shared-header-ml-771138192"></a>
### ENTITYNUM_WORLD

```ml
const ENTITYNUM_WORLD = 1022
```

Reserved entity number representing the BSP world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L35)

<a id="constant-constant-mq3-shared-q-shared-header-gentitynum-bits-const-gentitynum-bits-10-src-mq3-shared-q-shared-header-ml-115922956"></a>
### GENTITYNUM_BITS

```ml
const GENTITYNUM_BITS = 10
```

Number of bits used to encode an entity number in the network protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L39)

<a id="function-function-mq3-shared-q-shared-header-littlefloat-function-littlefloat-value-src-mq3-shared-q-shared-header-ml-428414481"></a>
### LittleFloat

```ml
function LittleFloat(value)
```

Return `mq3.shared.q_shared_runtime.littleFloat(value)` from `shared.q_shared_header.LittleFloat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.shared.q_shared_runtime.littleFloat`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L68)

<a id="function-function-mq3-shared-q-shared-header-littlelong-function-littlelong-value-src-mq3-shared-q-shared-header-ml-899209177"></a>
### LittleLong

```ml
function LittleLong(value)
```

Return `mq3.shared.q_shared_runtime.littleLong(value)` from `shared.q_shared_header.LittleLong`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.shared.q_shared_runtime.littleLong`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L62)

<a id="function-function-mq3-shared-q-shared-header-littleshort-function-littleshort-value-src-mq3-shared-q-shared-header-ml-633933025"></a>
### LittleShort

```ml
function LittleShort(value)
```

Return `mq3.shared.q_shared_runtime.littleShort(value)` from `shared.q_shared_header.LittleShort`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.shared.q_shared_runtime.littleShort`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L56)

<a id="constant-constant-mq3-shared-q-shared-header-max-clients-const-max-clients-64-src-mq3-shared-q-shared-header-ml-2009160631"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```

Maximum number of client slots represented by the original game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L29)

<a id="constant-constant-mq3-shared-q-shared-header-max-configstrings-const-max-configstrings-1024-src-mq3-shared-q-shared-header-ml-1558626790"></a>
### MAX_CONFIGSTRINGS

```ml
const MAX_CONFIGSTRINGS = 1024
```

Maximum number of indexed configuration strings in a game state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L45)

<a id="constant-constant-mq3-shared-q-shared-header-max-gamestate-chars-const-max-gamestate-chars-16000-src-mq3-shared-q-shared-header-ml-1690874328"></a>
### MAX_GAMESTATE_CHARS

```ml
const MAX_GAMESTATE_CHARS = 16000
```

Total character capacity for the packed game-state configuration strings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L47)

<a id="constant-constant-mq3-shared-q-shared-header-max-gentities-const-max-gentities-1024-src-mq3-shared-q-shared-header-ml-288351230"></a>
### MAX_GENTITIES

```ml
const MAX_GENTITIES = 1024
```

Maximum number of entity slots represented by the original game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L31)

<a id="constant-constant-mq3-shared-q-shared-header-max-info-string-const-max-info-string-1024-src-mq3-shared-q-shared-header-ml-1932832094"></a>
### MAX_INFO_STRING

```ml
const MAX_INFO_STRING = 1024
```

Byte limit for a normal backslash-delimited information string.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L19)

<a id="constant-constant-mq3-shared-q-shared-header-max-models-const-max-models-256-src-mq3-shared-q-shared-header-ml-1563059964"></a>
### MAX_MODELS

```ml
const MAX_MODELS = 256
```

Number of entries reserved for model configuration strings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L41)

<a id="constant-constant-mq3-shared-q-shared-header-max-name-length-const-max-name-length-32-src-mq3-shared-q-shared-header-ml-1958297220"></a>
### MAX_NAME_LENGTH

```ml
const MAX_NAME_LENGTH = 32
```

Maximum storage length for a player name.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L25)

<a id="constant-constant-mq3-shared-q-shared-header-max-qpath-const-max-qpath-64-src-mq3-shared-q-shared-header-ml-1686480079"></a>
### MAX_QPATH

```ml
const MAX_QPATH = 64
```

Maximum engine-relative path length, including its terminator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L23)

<a id="constant-constant-mq3-shared-q-shared-header-max-say-text-const-max-say-text-150-src-mq3-shared-q-shared-header-ml-1445185001"></a>
### MAX_SAY_TEXT

```ml
const MAX_SAY_TEXT = 150
```

Maximum storage length for a chat message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L27)

<a id="constant-constant-mq3-shared-q-shared-header-max-sounds-const-max-sounds-256-src-mq3-shared-q-shared-header-ml-949005292"></a>
### MAX_SOUNDS

```ml
const MAX_SOUNDS = 256
```

Number of entries reserved for sound configuration strings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L43)

<a id="constant-constant-mq3-shared-q-shared-header-max-string-chars-const-max-string-chars-1024-src-mq3-shared-q-shared-header-ml-608118484"></a>
### MAX_STRING_CHARS

```ml
const MAX_STRING_CHARS = 1024
```

Maximum character-buffer size for an engine command or protocol string.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L15)

<a id="constant-constant-mq3-shared-q-shared-header-max-token-chars-const-max-token-chars-1024-src-mq3-shared-q-shared-header-ml-1782791054"></a>
### MAX_TOKEN_CHARS

```ml
const MAX_TOKEN_CHARS = 1024
```

Maximum character-buffer size for one parsed token.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L17)

<a id="constant-constant-mq3-shared-q-shared-header-path-sep-const-path-sep-92-src-mq3-shared-q-shared-header-ml-1004489028"></a>
### PATH_SEP

```ml
const PATH_SEP = 92
```

Backslash character code used by the original Windows path ABI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L49)

<a id="function-function-mq3-shared-q-shared-header-ppcfctiw-function-ppcfctiw-value-src-mq3-shared-q-shared-header-ml-1394906969"></a>
### ppcFctiw

```ml
function ppcFctiw(value)
```

Return `mq3.shared.q_shared_header.__fctiw(value)` from `shared.q_shared_header.ppcFctiw`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.shared.q_shared_header.__fctiw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L142)

<a id="function-function-mq3-shared-q-shared-header-ppclhbrx-function-ppclhbrx-data-offset-src-mq3-shared-q-shared-header-ml-1664689039"></a>
### ppcLhbrx

```ml
function ppcLhbrx(data, offset)
```

Return `mq3.shared.q_shared_header.__lhbrx(data, offset)` from `shared.q_shared_header.ppcLhbrx`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.shared.q_shared_header.__lhbrx`. |
| `offset` | `dynamic` | — | Offset passed as `offset` to `mq3.shared.q_shared_header.__lhbrx`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L139)

<a id="function-function-mq3-shared-q-shared-header-ppclwbrx-function-ppclwbrx-data-offset-src-mq3-shared-q-shared-header-ml-1561260023"></a>
### ppcLwbrx

```ml
function ppcLwbrx(data, offset)
```

Return `mq3.shared.q_shared_header.__lwbrx(data, offset)` from `shared.q_shared_header.ppcLwbrx`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.shared.q_shared_header.__lwbrx`. |
| `offset` | `dynamic` | — | Offset passed as `offset` to `mq3.shared.q_shared_header.__lwbrx`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L135)

<a id="function-function-mq3-shared-q-shared-header-q-fabs-function-q-fabs-value-src-mq3-shared-q-shared-header-ml-826381081"></a>
### Q_fabs

```ml
function Q_fabs(value)
```

Return `mq3.shared.math.Q_fabs(value)` from `shared.q_shared_header.Q_fabs`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.shared.math.Q_fabs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L84)

<a id="function-function-mq3-shared-q-shared-header-q-rsqrt-function-q-rsqrt-value-src-mq3-shared-q-shared-header-ml-382548969"></a>
### Q_rsqrt

```ml
function Q_rsqrt(value)
```

Return `mq3.shared.math.Q_rsqrt(value)` from `shared.q_shared_header.Q_rsqrt`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Number passed as `number` to `mq3.shared.math.Q_rsqrt`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L87)

<a id="constant-constant-mq3-shared-q-shared-header-qfalse-const-qfalse-0-src-mq3-shared-q-shared-header-ml-1352866927"></a>
### qfalse

```ml
const qfalse = 0
```

Integer representation of false in the original Quake ABI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L11)

<a id="constant-constant-mq3-shared-q-shared-header-qtrue-const-qtrue-1-src-mq3-shared-q-shared-header-ml-1918161310"></a>
### qtrue

```ml
const qtrue = 1
```

Integer representation of true in the original Quake ABI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L13)

<a id="function-function-mq3-shared-q-shared-header-vectorcompare-function-vectorcompare-a-b-src-mq3-shared-q-shared-header-ml-1396108279"></a>
### VectorCompare

```ml
function VectorCompare(a, b)
```

Return `mq3.shared.math.VectorCompare(a, b)` from `shared.q_shared_header.VectorCompare`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A passed as `a` to `mq3.shared.math.VectorCompare`. |
| `b` | `dynamic` | — | B passed as `b` to `mq3.shared.math.VectorCompare`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L91)

<a id="function-function-mq3-shared-q-shared-header-vectorinverse-function-vectorinverse-value-src-mq3-shared-q-shared-header-ml-1557601583"></a>
### VectorInverse

```ml
function VectorInverse(value)
```

Return `mq3.shared.math.VectorInverse(value)` from `shared.q_shared_header.VectorInverse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | V passed as `v` to `mq3.shared.math.VectorInverse`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L94)

<a id="function-function-mq3-shared-q-shared-header-vectorlength-function-vectorlength-value-src-mq3-shared-q-shared-header-ml-1033480861"></a>
### VectorLength

```ml
function VectorLength(value)
```

Return `mq3.shared.math.VectorLength(value)` from `shared.q_shared_header.VectorLength`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | A passed as `a` to `mq3.shared.math.VectorLength`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L97)

<a id="function-function-mq3-shared-q-shared-header-vectorlengthsquared-function-vectorlengthsquared-value-src-mq3-shared-q-shared-header-ml-1666511553"></a>
### VectorLengthSquared

```ml
function VectorLengthSquared(value)
```

Return `mq3.shared.math.VectorLengthSquared(value)` from `shared.q_shared_header.VectorLengthSquared`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | A passed as `a` to `mq3.shared.math.VectorLengthSquared`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L100)

<a id="function-function-mq3-shared-q-shared-header-vectornormalizefast-function-vectornormalizefast-value-src-mq3-shared-q-shared-header-ml-540905673"></a>
### VectorNormalizeFast

```ml
function VectorNormalizeFast(value)
```

Return `mq3.shared.math.VectorNormalizeFast(value)` from `shared.q_shared_header.VectorNormalizeFast`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | V passed as `v` to `mq3.shared.math.VectorNormalizeFast`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/q_shared_header.ml#L103)
