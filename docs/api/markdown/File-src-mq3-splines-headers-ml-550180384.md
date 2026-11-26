# `src/mq3/splines/headers.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.splines.headers`](Package-mq3-splines-headers-1801944560.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trig` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-splines-headers-addbounds-function-addbounds-value-other-src-mq3-splines-headers-ml-1458176871"></a>
### AddBounds

```ml
function AddBounds(value, other)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L111)

<a id="function-function-mq3-splines-headers-addpoint-function-addpoint-value-point-src-mq3-splines-headers-ml-823491591"></a>
### AddPoint

```ml
function AddPoint(value, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L104)

<a id="function-function-mq3-splines-headers-addunique-function-addunique-list-value-src-mq3-splines-headers-ml-340075739"></a>
### AddUnique

```ml
function AddUnique(list, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L131)

<a id="function-function-mq3-splines-headers-angles-function-angles-pitch-yaw-roll-src-mq3-splines-headers-ml-660442356"></a>
### angles

```ml
function angles(pitch, yaw, roll)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pitch` | `dynamic` | — |  |
| `yaw` | `dynamic` | — |  |
| `roll` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L31)

- [mq3.splines.headers.Angles](Type-mq3-splines-headers-angles-169651934.md) — struct
<a id="function-function-mq3-splines-headers-angles-t-function-angles-t-pitch-yaw-roll-src-mq3-splines-headers-ml-1077658176"></a>
### angles_t

```ml
function angles_t(pitch, yaw, roll)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pitch` | `dynamic` | — |  |
| `yaw` | `dynamic` | — |  |
| `roll` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L35)

<a id="function-function-mq3-splines-headers-append-function-append-left-right-src-mq3-splines-headers-ml-424941295"></a>
### append

```ml
function append(left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L154)

<a id="function-function-mq3-splines-headers-append-function-append-list-value-src-mq3-splines-headers-ml-1240408647"></a>
### Append

```ml
function Append(list, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L129)

<a id="function-function-mq3-splines-headers-bounds-function-bounds-src-mq3-splines-headers-ml-2146052874"></a>
### bounds

```ml
function bounds()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L102)

- [mq3.splines.headers.Bounds](Type-mq3-splines-headers-bounds-2092755403.md) — struct
<a id="function-function-mq3-splines-headers-center-function-center-value-src-mq3-splines-headers-ml-1728259971"></a>
### Center

```ml
function Center(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L112)

<a id="function-function-mq3-splines-headers-clear-function-clear-src-mq3-splines-headers-ml-1614368656"></a>
### Clear

```ml
function Clear()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L88)

<a id="function-function-mq3-splines-headers-condense-function-condense-list-src-mq3-splines-headers-ml-679216258"></a>
### Condense

```ml
function Condense(list)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L138)

<a id="function-function-mq3-splines-headers-containspoint-function-containspoint-value-point-src-mq3-splines-headers-ml-1648258941"></a>
### ContainsPoint

```ml
function ContainsPoint(value, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L114)

<a id="function-function-mq3-splines-headers-cross-function-cross-a-b-src-mq3-splines-headers-ml-451105677"></a>
### Cross

```ml
function Cross(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L45)

<a id="constant-constant-mq3-splines-headers-deg2rad-const-deg2rad-0-017453-src-mq3-splines-headers-ml-383803905"></a>
### DEG2RAD

```ml
const DEG2RAD = 0.017453
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L11)

<a id="function-function-mq3-splines-headers-dot-function-dot-a-b-src-mq3-splines-headers-ml-1336791551"></a>
### dot

```ml
function dot(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L44)

<a id="constant-constant-mq3-splines-headers-equal-epsilon-const-equal-epsilon-0-001-src-mq3-splines-headers-ml-59653128"></a>
### EQUAL_EPSILON

```ml
const EQUAL_EPSILON = 0.001
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L10)

<a id="function-function-mq3-splines-headers-find-function-find-list-value-src-mq3-splines-headers-ml-58990371"></a>
### Find

```ml
function Find(list, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L130)

<a id="function-function-mq3-splines-headers-identity-function-identity-src-mq3-splines-headers-ml-1890231058"></a>
### Identity

```ml
function Identity()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L87)

<a id="function-function-mq3-splines-headers-idlist-function-idlist-granularity-src-mq3-splines-headers-ml-1650056778"></a>
### idList

```ml
function idList(granularity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `granularity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L118)

<a id="function-function-mq3-splines-headers-idsqrt-function-idsqrt-value-src-mq3-splines-headers-ml-359900391"></a>
### idSqrt

```ml
function idSqrt(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L39)

<a id="function-function-mq3-splines-headers-idstr-function-idstr-value-src-mq3-splines-headers-ml-908681843"></a>
### idStr

```ml
function idStr(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L153)

<a id="function-function-mq3-splines-headers-idvec3-t-function-idvec3-t-x-y-z-src-mq3-splines-headers-ml-130667621"></a>
### idVec3_t

```ml
function idVec3_t(x, y, z)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `z` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L34)

<a id="function-function-mq3-splines-headers-intersectsbounds-function-intersectsbounds-a-b-src-mq3-splines-headers-ml-1526263877"></a>
### IntersectsBounds

```ml
function IntersectsBounds(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L115)

<a id="function-function-mq3-splines-headers-inversemultiply-function-inversemultiply-inverse-b-src-mq3-splines-headers-ml-1602284576"></a>
### InverseMultiply

```ml
function InverseMultiply(inverse, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `inverse` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L99)

<a id="function-function-mq3-splines-headers-iscleared-function-iscleared-value-src-mq3-splines-headers-ml-192916687"></a>
### IsCleared

```ml
function IsCleared(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L116)

<a id="function-function-mq3-splines-headers-length-function-length-value-src-mq3-splines-headers-ml-769976047"></a>
### Length

```ml
function Length(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L46)

<a id="function-function-mq3-splines-headers-lerpvector-function-lerpvector-a-b-fraction-src-mq3-splines-headers-ml-1879149239"></a>
### LerpVector

```ml
function LerpVector(a, b, fraction)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `fraction` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L55)

<a id="function-function-mq3-splines-headers-listclear-function-listclear-list-src-mq3-splines-headers-ml-1838611908"></a>
### listClear

```ml
function listClear(list)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L139)

- [mq3.splines.headers.ListState](Type-mq3-splines-headers-liststate-1658866379.md) — struct
<a id="function-function-mq3-splines-headers-mat3-function-mat3-a-b-c-src-mq3-splines-headers-ml-1711671758"></a>
### mat3

```ml
function mat3(a, b, c)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L33)

- [mq3.splines.headers.Mat3](Type-mq3-splines-headers-mat3-1263765969.md) — struct
<a id="function-function-mq3-splines-headers-mat3-t-function-mat3-t-a-b-c-src-mq3-splines-headers-ml-394888950"></a>
### mat3_t

```ml
function mat3_t(a, b, c)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L37)

<a id="function-function-mq3-splines-headers-mathanglessymbols-function-mathanglessymbols-src-mq3-splines-headers-ml-436544284"></a>
### mathAnglesSymbols

```ml
function mathAnglesSymbols()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L21)

<a id="function-function-mq3-splines-headers-mathmatrixsymbols-function-mathmatrixsymbols-src-mq3-splines-headers-ml-1700226862"></a>
### mathMatrixSymbols

```ml
function mathMatrixSymbols()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L22)

<a id="function-function-mq3-splines-headers-mathquaternionsymbols-function-mathquaternionsymbols-src-mq3-splines-headers-ml-270081312"></a>
### mathQuaternionSymbols

```ml
function mathQuaternionSymbols()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L23)

<a id="function-function-mq3-splines-headers-mathvectorsymbols-function-mathvectorsymbols-src-mq3-splines-headers-ml-853352498"></a>
### mathVectorSymbols

```ml
function mathVectorSymbols()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L24)

<a id="function-function-mq3-splines-headers-matrixmultiply-function-matrixmultiply-a-b-src-mq3-splines-headers-ml-407598345"></a>
### matrixMultiply

```ml
function matrixMultiply(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L93)

<a id="function-function-mq3-splines-headers-matvec-function-matvec-matrix-value-src-mq3-splines-headers-ml-686377808"></a>
### matVec

```ml
function matVec(matrix, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `matrix` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L89)

<a id="function-function-mq3-splines-headers-newbounds-function-newbounds-src-mq3-splines-headers-ml-1683247480"></a>
### newBounds

```ml
function newBounds()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L103)

<a id="function-function-mq3-splines-headers-normalize-function-normalize-value-src-mq3-splines-headers-ml-521558269"></a>
### Normalize

```ml
function Normalize(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L47)

<a id="function-function-mq3-splines-headers-normalize180-function-normalize180-value-src-mq3-splines-headers-ml-2146473691"></a>
### Normalize180

```ml
function Normalize180(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L72)

<a id="function-function-mq3-splines-headers-normalize360-function-normalize360-value-src-mq3-splines-headers-ml-436122003"></a>
### Normalize360

```ml
function Normalize360(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L71)

<a id="function-function-mq3-splines-headers-normalizeangle180-function-normalizeangle180-value-src-mq3-splines-headers-ml-619133181"></a>
### normalizeAngle180

```ml
function normalizeAngle180(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L70)

<a id="function-function-mq3-splines-headers-normalizeangle360-function-normalizeangle360-value-src-mq3-splines-headers-ml-302685897"></a>
### normalizeAngle360

```ml
function normalizeAngle360(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L67)

<a id="function-function-mq3-splines-headers-num-function-num-list-src-mq3-splines-headers-ml-387780150"></a>
### Num

```ml
function Num(list)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L119)

<a id="function-function-mq3-splines-headers-orthonormalize-function-orthonormalize-matrix-src-mq3-splines-headers-ml-476242035"></a>
### OrthoNormalize

```ml
function OrthoNormalize(matrix)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `matrix` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L96)

<a id="function-function-mq3-splines-headers-q-fabs-function-q-fabs-value-src-mq3-splines-headers-ml-28014795"></a>
### Q_fabs

```ml
function Q_fabs(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L40)

<a id="function-function-mq3-splines-headers-qsharedsymbols-function-qsharedsymbols-src-mq3-splines-headers-ml-1441709814"></a>
### qSharedSymbols

```ml
function qSharedSymbols()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L25)

<a id="function-function-mq3-splines-headers-quat-function-quat-x-y-z-w-src-mq3-splines-headers-ml-1938556974"></a>
### quat

```ml
function quat(x, y, z, w)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `z` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L32)

- [mq3.splines.headers.Quat](Type-mq3-splines-headers-quat-1945641945.md) — struct
<a id="function-function-mq3-splines-headers-quat-t-function-quat-t-x-y-z-w-src-mq3-splines-headers-ml-1526001338"></a>
### quat_t

```ml
function quat_t(x, y, z, w)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `z` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L36)

<a id="function-function-mq3-splines-headers-quatlength-function-quatlength-value-src-mq3-splines-headers-ml-625237203"></a>
### quatLength

```ml
function quatLength(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L83)

<a id="function-function-mq3-splines-headers-quatnormalize-function-quatnormalize-value-src-mq3-splines-headers-ml-677511459"></a>
### quatNormalize

```ml
function quatNormalize(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L84)

<a id="constant-constant-mq3-splines-headers-rad2deg-const-rad2deg-57-29578-src-mq3-splines-headers-ml-1978442748"></a>
### RAD2DEG

```ml
const RAD2DEG = 57.29578
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L12)

<a id="function-function-mq3-splines-headers-radius-function-radius-value-src-mq3-splines-headers-ml-755852979"></a>
### Radius

```ml
function Radius(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L113)

<a id="function-function-mq3-splines-headers-remove-function-remove-list-value-src-mq3-splines-headers-ml-632185735"></a>
### Remove

```ml
function Remove(list, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L137)

<a id="function-function-mq3-splines-headers-removeindex-function-removeindex-list-index-src-mq3-splines-headers-ml-1981805090"></a>
### RemoveIndex

```ml
function RemoveIndex(list, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L132)

<a id="function-function-mq3-splines-headers-resize-function-resize-list-size-src-mq3-splines-headers-ml-1381724127"></a>
### Resize

```ml
function Resize(list, size)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L121)

<a id="function-function-mq3-splines-headers-setgranularity-function-setgranularity-list-granularity-src-mq3-splines-headers-ml-458846002"></a>
### SetGranularity

```ml
function SetGranularity(list, granularity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — |  |
| `granularity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L128)

<a id="function-function-mq3-splines-headers-setnum-function-setnum-list-count-src-mq3-splines-headers-ml-123657449"></a>
### SetNum

```ml
function SetNum(list, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L122)

<a id="function-function-mq3-splines-headers-size-function-size-list-src-mq3-splines-headers-ml-974769126"></a>
### Size

```ml
function Size(list)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L120)

<a id="function-function-mq3-splines-headers-skewsymmetric-function-skewsymmetric-value-src-mq3-splines-headers-ml-1726996401"></a>
### SkewSymmetric

```ml
function SkewSymmetric(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L100)

<a id="function-function-mq3-splines-headers-snap-function-snap-value-src-mq3-splines-headers-ml-504230423"></a>
### Snap

```ml
function Snap(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L52)

<a id="function-function-mq3-splines-headers-snapcomponent-function-snapcomponent-value-toward-src-mq3-splines-headers-ml-809983698"></a>
### snapComponent

```ml
function snapComponent(value, toward)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `toward` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L53)

<a id="function-function-mq3-splines-headers-snaptowards-function-snaptowards-value-toward-src-mq3-splines-headers-ml-1298789888"></a>
### SnapTowards

```ml
function SnapTowards(value, toward)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `toward` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L54)

<a id="function-function-mq3-splines-headers-sort-function-sort-list-compare-context-src-mq3-splines-headers-ml-955760552"></a>
### Sort

```ml
function Sort(list, compare, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — |  |
| `compare` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L140)

<a id="function-function-mq3-splines-headers-splinessymbols-function-splinessymbols-src-mq3-splines-headers-ml-846921806"></a>
### splinesSymbols

```ml
function splinesSymbols()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L26)

<a id="function-function-mq3-splines-headers-toforward-function-toforward-value-src-mq3-splines-headers-ml-1867508667"></a>
### toForward

```ml
function toForward(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L81)

<a id="function-function-mq3-splines-headers-tolower-function-tolower-value-src-mq3-splines-headers-ml-1066838843"></a>
### tolower

```ml
function tolower(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L155)

<a id="function-function-mq3-splines-headers-topitch-function-topitch-value-src-mq3-splines-headers-ml-1697850457"></a>
### toPitch

```ml
function toPitch(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L62)

<a id="function-function-mq3-splines-headers-toupper-function-toupper-value-src-mq3-splines-headers-ml-502935433"></a>
### toupper

```ml
function toupper(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L156)

<a id="function-function-mq3-splines-headers-tovectors-function-tovectors-value-src-mq3-splines-headers-ml-185490557"></a>
### toVectors

```ml
function toVectors(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L73)

<a id="function-function-mq3-splines-headers-toyaw-function-toyaw-value-src-mq3-splines-headers-ml-572182379"></a>
### toYaw

```ml
function toYaw(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L58)

<a id="function-function-mq3-splines-headers-transpose-function-transpose-matrix-src-mq3-splines-headers-ml-1312540753"></a>
### Transpose

```ml
function Transpose(matrix)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `matrix` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L92)

<a id="function-function-mq3-splines-headers-utillistsymbols-function-utillistsymbols-src-mq3-splines-headers-ml-2109216284"></a>
### utilListSymbols

```ml
function utilListSymbols()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L27)

<a id="function-function-mq3-splines-headers-utilstrsymbols-function-utilstrsymbols-src-mq3-splines-headers-ml-1855036358"></a>
### utilStrSymbols

```ml
function utilStrSymbols()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L28)

<a id="function-function-mq3-splines-headers-vec3-function-vec3-x-y-z-src-mq3-splines-headers-ml-1352988225"></a>
### vec3

```ml
function vec3(x, y, z)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `z` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L30)

- [mq3.splines.headers.Vec3](Type-mq3-splines-headers-vec3-1821645369.md) — struct
<a id="function-function-mq3-splines-headers-vec4-function-vec4-value-src-mq3-splines-headers-ml-996977211"></a>
### vec4

```ml
function vec4(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L85)

<a id="function-function-mq3-splines-headers-vec4-t-function-vec4-t-x-y-z-w-src-mq3-splines-headers-ml-797039878"></a>
### vec4_t

```ml
function vec4_t(x, y, z, w)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — |  |
| `y` | `dynamic` | — |  |
| `z` | `dynamic` | — |  |
| `w` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L38)

<a id="function-function-mq3-splines-headers-vecadd-function-vecadd-a-b-src-mq3-splines-headers-ml-1484252301"></a>
### vecAdd

```ml
function vecAdd(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L41)

<a id="function-function-mq3-splines-headers-vecscale-function-vecscale-a-value-src-mq3-splines-headers-ml-1142699330"></a>
### vecScale

```ml
function vecScale(a, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L43)

<a id="function-function-mq3-splines-headers-vecsub-function-vecsub-a-b-src-mq3-splines-headers-ml-373001197"></a>
### vecSub

```ml
function vecSub(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L42)

<a id="function-function-mq3-splines-headers-vectorequal-function-vectorequal-a-b-src-mq3-splines-headers-ml-541684591"></a>
### vectorEqual

```ml
function vectorEqual(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L56)

<a id="function-function-mq3-splines-headers-vectortoangles-function-vectortoangles-value-src-mq3-splines-headers-ml-2084899283"></a>
### vectorToAngles

```ml
function vectorToAngles(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L66)

<a id="function-function-mq3-splines-headers-zero-function-zero-src-mq3-splines-headers-ml-1736498906"></a>
### Zero

```ml
function Zero()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L51)
