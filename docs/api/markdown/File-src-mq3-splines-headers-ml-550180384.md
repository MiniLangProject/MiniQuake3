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

Add bounds in splines.headers; the normal completion returns `(first or second)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.splines.headers.AddPoint`. |
| `other` | `dynamic` | — | Record exposing `cleared`, `mins`, `maxs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L254)

<a id="function-function-mq3-splines-headers-addpoint-function-addpoint-value-point-src-mq3-splines-headers-ml-823491591"></a>
### AddPoint

```ml
function AddPoint(value, point)
```

Add point in splines.headers; the normal completion returns `expanded`.

Direct state writes: `value.mins`, `value.maxs`, `value.cleared`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `cleared`, `mins`, `maxs`. Updated in place: `mins`, `maxs`, `cleared`. |
| `point` | `dynamic` | — | Record exposing `x`, `y`, `z`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L244)

<a id="function-function-mq3-splines-headers-addunique-function-addunique-list-value-src-mq3-splines-headers-ml-340075739"></a>
### AddUnique

```ml
function AddUnique(list, value)
```

Add unique in splines.headers; the normal completion returns `Append(list, value)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — | List passed as `list` to `mq3.splines.headers.Find`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.splines.headers.Find`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L323)

<a id="function-function-mq3-splines-headers-angles-function-angles-pitch-yaw-roll-src-mq3-splines-headers-ml-660442356"></a>
### angles

```ml
function angles(pitch, yaw, roll)
```

Create `mq3.splines.headers.Angles` with pitch=n.f32(pitch); yaw=n.f32(yaw); roll=n.f32(roll).

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pitch` | `dynamic` | — | Floating-point value to narrow to binary32. |
| `yaw` | `dynamic` | — | Floating-point value to narrow to binary32. |
| `roll` | `dynamic` | — | Floating-point value to narrow to binary32. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L53)

- [mq3.splines.headers.Angles](Type-mq3-splines-headers-angles-169651934.md) — struct
<a id="function-function-mq3-splines-headers-angles-t-function-angles-t-pitch-yaw-roll-src-mq3-splines-headers-ml-1077658176"></a>
### angles_t

```ml
function angles_t(pitch, yaw, roll)
```

Return `mq3.splines.headers.angles(pitch, yaw, roll)` from `splines.headers.angles_t`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pitch` | `dynamic` | — | Pitch passed as `pitch` to `mq3.splines.headers.angles`. |
| `yaw` | `dynamic` | — | Yaw passed as `yaw` to `mq3.splines.headers.angles`. |
| `roll` | `dynamic` | — | Roll passed as `roll` to `mq3.splines.headers.angles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L74)

<a id="function-function-mq3-splines-headers-append-function-append-left-right-src-mq3-splines-headers-ml-424941295"></a>
### append

```ml
function append(left, right)
```

Compute splines.headers.append as `(idStr(left) + idStr(right))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Value passed as `value` to `mq3.splines.headers.idStr`. |
| `right` | `dynamic` | — | Value passed as `value` to `mq3.splines.headers.idStr`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L373)

<a id="function-function-mq3-splines-headers-append-function-append-list-value-src-mq3-splines-headers-ml-1240408647"></a>
### Append

```ml
function Append(list, value)
```

Append headers in splines.headers; the normal completion returns `(len(list.values) - 1)`.

Direct state writes: `list.values`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — | Record exposing `values`, `size`, `granularity`. Updated in place: `values`. |
| `value` | `dynamic` | — | Value used in `(list.values + [value])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L315)

<a id="function-function-mq3-splines-headers-bounds-function-bounds-src-mq3-splines-headers-ml-2146052874"></a>
### bounds

```ml
function bounds()
```

Create `mq3.splines.headers.Bounds` with mins=vec3(1000000000.0, 1000000000.0, 1000000000.0); maxs=vec3(- 1000000000.0, - 1000000000.0, - 1000000000.0); cleared=true.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L236)

- [mq3.splines.headers.Bounds](Type-mq3-splines-headers-bounds-2092755403.md) — struct
<a id="function-function-mq3-splines-headers-center-function-center-value-src-mq3-splines-headers-ml-1728259971"></a>
### Center

```ml
function Center(value)
```

Compute center in splines.headers; the normal completion returns `vecScale(vecAdd(value.mins, value.maxs), 0.5)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `cleared`, `mins`, `maxs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L257)

<a id="function-function-mq3-splines-headers-clear-function-clear-src-mq3-splines-headers-ml-1614368656"></a>
### Clear

```ml
function Clear()
```

Return `mq3.splines.headers.mat3(Zero(), Zero(), Zero())` from `splines.headers.Clear`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L206)

<a id="function-function-mq3-splines-headers-condense-function-condense-list-src-mq3-splines-headers-ml-679216258"></a>
### Condense

```ml
function Condense(list)
```

Update `list.size` in splines.headers; the normal completion returns `list.size`.

Direct state writes: `list.size`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — | Record exposing `values`, `size`. Updated in place: `size`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L342)

<a id="function-function-mq3-splines-headers-containspoint-function-containspoint-value-point-src-mq3-splines-headers-ml-1648258941"></a>
### ContainsPoint

```ml
function ContainsPoint(value, point)
```

Compute splines.headers.ContainsPoint as `((((((not value.cleared and (point.x >= value.mins.x)) and (point.y >= value.mins.y)) and (point.z >= value.mins.z)) and (point.x <= value.maxs.x)) and (point.y <= value.maxs.y)) and (point.z <= value.maxs.z))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `cleared`, `mins`, `maxs`. |
| `point` | `dynamic` | — | Record exposing `x`, `y`, `z`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L264)

<a id="function-function-mq3-splines-headers-cross-function-cross-a-b-src-mq3-splines-headers-ml-451105677"></a>
### Cross

```ml
function Cross(a, b)
```

Return `mq3.splines.headers.vec3(((a.y * b.z) - (a.z * b.y)), ((a.z * b.x) - (a.x * b.z)), ((a.x * b.y) - (a.y * b.x)))` from `splines.headers.Cross`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Record exposing `y`, `z`, `x`. |
| `b` | `dynamic` | — | Record exposing `z`, `y`, `x`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L117)

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

Return `mq3.compat.numeric.f32((((a.x * b.x) + (a.y * b.y)) + (a.z * b.z)))` from `splines.headers.dot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Record exposing `x`, `y`, `z`. |
| `b` | `dynamic` | — | Record exposing `x`, `y`, `z`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L113)

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

Find headers in splines.headers; the normal completion returns `- 1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — | Record exposing `values`. |
| `value` | `dynamic` | — | Value used in `(list.values[index] == value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L319)

<a id="function-function-mq3-splines-headers-identity-function-identity-src-mq3-splines-headers-ml-1890231058"></a>
### Identity

```ml
function Identity()
```

Return `mq3.splines.headers.mat3(vec3(1, 0, 0), vec3(0, 1, 0), vec3(0, 0, 1))` from `splines.headers.Identity`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L204)

<a id="function-function-mq3-splines-headers-idlist-function-idlist-granularity-src-mq3-splines-headers-ml-1650056778"></a>
### idList

```ml
function idList(granularity)
```

Compute id list in splines.headers; the normal completion returns `ListState([], 0, granularity)`.

Validation failures include `list granularity must be positive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `granularity` | `dynamic` | — | Initial `granularity` field stored in the returned or constructed `mq3.splines.headers.ListState` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L277)

<a id="function-function-mq3-splines-headers-idsqrt-function-idsqrt-value-src-mq3-splines-headers-ml-359900391"></a>
### idSqrt

```ml
function idSqrt(value)
```

Return `mq3.compat.transcendental.sqrt(value)` from `splines.headers.idSqrt`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Floating-point operand. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L94)

<a id="function-function-mq3-splines-headers-idstr-function-idstr-value-src-mq3-splines-headers-ml-908681843"></a>
### idStr

```ml
function idStr(value)
```

Compute id str in splines.headers; the normal completion returns `str(value)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `str(value)` and `(value == void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L369)

<a id="function-function-mq3-splines-headers-idvec3-t-function-idvec3-t-x-y-z-src-mq3-splines-headers-ml-130667621"></a>
### idVec3_t

```ml
function idVec3_t(x, y, z)
```

Return `mq3.splines.headers.vec3(x, y, z)` from `splines.headers.idVec3_t`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — | X passed as `x` to `mq3.splines.headers.vec3`. |
| `y` | `dynamic` | — | Y passed as `y` to `mq3.splines.headers.vec3`. |
| `z` | `dynamic` | — | Z passed as `z` to `mq3.splines.headers.vec3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L69)

<a id="function-function-mq3-splines-headers-intersectsbounds-function-intersectsbounds-a-b-src-mq3-splines-headers-ml-1526263877"></a>
### IntersectsBounds

```ml
function IntersectsBounds(a, b)
```

Compute splines.headers.IntersectsBounds as `(((((((not a.cleared and not b.cleared) and (a.maxs.x >= b.mins.x)) and (a.mins.x <= b.maxs.x)) and (a.maxs.y >= b.mins.y)) and (a.mins.y <= b.maxs.y)) and (a.maxs.z >= b.mins.z)) and (a.mins.z <= b.maxs.z))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Record exposing `cleared`, `maxs`, `mins`. |
| `b` | `dynamic` | — | Record exposing `cleared`, `mins`, `maxs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L268)

<a id="function-function-mq3-splines-headers-inversemultiply-function-inversemultiply-inverse-b-src-mq3-splines-headers-ml-1602284576"></a>
### InverseMultiply

```ml
function InverseMultiply(inverse, b)
```

Return `mq3.splines.headers.matrixMultiply(Transpose(inverse), b)` from `splines.headers.InverseMultiply`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `inverse` | `dynamic` | — | Matrix passed as `matrix` to `mq3.splines.headers.Transpose`. |
| `b` | `dynamic` | — | B passed as `b` to `mq3.splines.headers.matrixMultiply`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L230)

<a id="function-function-mq3-splines-headers-iscleared-function-iscleared-value-src-mq3-splines-headers-ml-192916687"></a>
### IsCleared

```ml
function IsCleared(value)
```

Compute splines.headers.IsCleared as `value.cleared`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `cleared`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L271)

<a id="function-function-mq3-splines-headers-length-function-length-value-src-mq3-splines-headers-ml-769976047"></a>
### Length

```ml
function Length(value)
```

Return `mq3.compat.numeric.f32(idSqrt((((value.x * value.x) + (value.y * value.y)) + (value.z * value.z))))` from `splines.headers.Length`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `x`, `y`, `z`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L120)

<a id="function-function-mq3-splines-headers-lerpvector-function-lerpvector-a-b-fraction-src-mq3-splines-headers-ml-1879149239"></a>
### LerpVector

```ml
function LerpVector(a, b, fraction)
```

Return `mq3.splines.headers.vecAdd(a, vecScale(vecSub(b, a), fraction))` from `splines.headers.LerpVector`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A passed as `a` to `mq3.splines.headers.vecAdd`. |
| `b` | `dynamic` | — | A passed as `a` to `mq3.splines.headers.vecSub`. |
| `fraction` | `dynamic` | — | Value passed as `value` to `mq3.splines.headers.vecScale`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L144)

<a id="function-function-mq3-splines-headers-listclear-function-listclear-list-src-mq3-splines-headers-ml-1838611908"></a>
### listClear

```ml
function listClear(list)
```

Update `list.values`, `list.size` in splines.headers.

Direct state writes: `list.values`, `list.size`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — | Updated in place: `values`, `size`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L347)

- [mq3.splines.headers.ListState](Type-mq3-splines-headers-liststate-1658866379.md) — struct
<a id="function-function-mq3-splines-headers-mat3-function-mat3-a-b-c-src-mq3-splines-headers-ml-1711671758"></a>
### mat3

```ml
function mat3(a, b, c)
```

Create `mq3.splines.headers.Mat3` with rows=[a, b, c].

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A used in `Mat3([a, b, c])`. |
| `b` | `dynamic` | — | B used in `Mat3([a, b, c])`. |
| `c` | `dynamic` | — | C used in `Mat3([a, b, c])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L64)

- [mq3.splines.headers.Mat3](Type-mq3-splines-headers-mat3-1263765969.md) — struct
<a id="function-function-mq3-splines-headers-mat3-t-function-mat3-t-a-b-c-src-mq3-splines-headers-ml-394888950"></a>
### mat3_t

```ml
function mat3_t(a, b, c)
```

Return `mq3.splines.headers.mat3(a, b, c)` from `splines.headers.mat3_t`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A passed as `a` to `mq3.splines.headers.mat3`. |
| `b` | `dynamic` | — | B passed as `b` to `mq3.splines.headers.mat3`. |
| `c` | `dynamic` | — | C passed as `c` to `mq3.splines.headers.mat3`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L85)

<a id="function-function-mq3-splines-headers-mathanglessymbols-function-mathanglessymbols-src-mq3-splines-headers-ml-436544284"></a>
### mathAnglesSymbols

```ml
function mathAnglesSymbols()
```

List the 4 names in splines.headers.mathAnglesSymbols, beginning with `Zero`, `angles_t`, `set`, `vec3_p`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L28)

<a id="function-function-mq3-splines-headers-mathmatrixsymbols-function-mathmatrixsymbols-src-mq3-splines-headers-ml-1700226862"></a>
### mathMatrixSymbols

```ml
function mathMatrixSymbols()
```

List the 5 names in splines.headers.mathMatrixSymbols, beginning with `Identity`, `InverseMultiply`, `OrthoNormalize`, `SkewSymmetric`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L30)

<a id="function-function-mq3-splines-headers-mathquaternionsymbols-function-mathquaternionsymbols-src-mq3-splines-headers-ml-270081312"></a>
### mathQuaternionSymbols

```ml
function mathQuaternionSymbols()
```

List the 5 names in splines.headers.mathQuaternionSymbols, beginning with `Length`, `Normalize`, `quat_t`, `set`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L32)

<a id="function-function-mq3-splines-headers-mathvectorsymbols-function-mathvectorsymbols-src-mq3-splines-headers-ml-853352498"></a>
### mathVectorSymbols

```ml
function mathVectorSymbols()
```

List the 18 names in splines.headers.mathVectorSymbols, beginning with `AddBounds`, `AddPoint`, `Bounds`, `Center`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L34)

<a id="function-function-mq3-splines-headers-matrixmultiply-function-matrixmultiply-a-b-src-mq3-splines-headers-ml-407598345"></a>
### matrixMultiply

```ml
function matrixMultiply(a, b)
```

Apply `mq3.splines.headers.Transpose`, `mq3.splines.headers.mat3`, `mq3.splines.headers.vec3` for matrix multiply in splines.headers.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Record exposing `rows`. |
| `b` | `dynamic` | — | Matrix passed as `matrix` to `mq3.splines.headers.Transpose`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L219)

<a id="function-function-mq3-splines-headers-matvec-function-matvec-matrix-value-src-mq3-splines-headers-ml-686377808"></a>
### matVec

```ml
function matVec(matrix, value)
```

Delegate `matVec` to `mq3.splines.headers.vec3` and return its result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `matrix` | `dynamic` | — | Record exposing `rows`. |
| `value` | `dynamic` | — | Record exposing `x`, `y`, `z`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L210)

<a id="function-function-mq3-splines-headers-newbounds-function-newbounds-src-mq3-splines-headers-ml-1683247480"></a>
### newBounds

```ml
function newBounds()
```

Return `mq3.splines.headers.bounds()` from `splines.headers.newBounds`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L238)

<a id="function-function-mq3-splines-headers-normalize-function-normalize-value-src-mq3-splines-headers-ml-521558269"></a>
### Normalize

```ml
function Normalize(value)
```

Normalize headers in splines.headers; the normal completion returns `vecScale(value, (1.0 / length))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `x`, `y`, `z`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L123)

<a id="function-function-mq3-splines-headers-normalize180-function-normalize180-value-src-mq3-splines-headers-ml-2146473691"></a>
### Normalize180

```ml
function Normalize180(value)
```

Return `mq3.splines.headers.angles(normalizeAngle180(value.pitch), normalizeAngle180(value.yaw), normalizeAngle180(value.roll))` from `splines.headers.Normalize180`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `pitch`, `yaw`, `roll`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L178)

<a id="function-function-mq3-splines-headers-normalize360-function-normalize360-value-src-mq3-splines-headers-ml-436122003"></a>
### Normalize360

```ml
function Normalize360(value)
```

Return `mq3.splines.headers.angles(normalizeAngle360(value.pitch), normalizeAngle360(value.yaw), normalizeAngle360(value.roll))` from `splines.headers.Normalize360`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `pitch`, `yaw`, `roll`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L175)

<a id="function-function-mq3-splines-headers-normalizeangle180-function-normalizeangle180-value-src-mq3-splines-headers-ml-619133181"></a>
### normalizeAngle180

```ml
function normalizeAngle180(value)
```

Normalize angle 180 in splines.headers; the normal completion returns `n.f32(result)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.splines.headers.normalizeAngle360`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L172)

<a id="function-function-mq3-splines-headers-normalizeangle360-function-normalizeangle360-value-src-mq3-splines-headers-ml-302685897"></a>
### normalizeAngle360

```ml
function normalizeAngle360(value)
```

Normalize angle 360 in splines.headers; the normal completion returns `n.f32(result)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value / 360.0)` and `n.trunc32((value / 360.0))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L167)

<a id="function-function-mq3-splines-headers-num-function-num-list-src-mq3-splines-headers-ml-387780150"></a>
### Num

```ml
function Num(list)
```

Return `len(list.values)` from `splines.headers.Num`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — | Record exposing `values`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L280)

<a id="function-function-mq3-splines-headers-orthonormalize-function-orthonormalize-matrix-src-mq3-splines-headers-ml-476242035"></a>
### OrthoNormalize

```ml
function OrthoNormalize(matrix)
```

Compute ortho normalize in splines.headers; the normal completion returns `mat3(first, second, third)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `matrix` | `dynamic` | — | Record exposing `rows`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L224)

<a id="function-function-mq3-splines-headers-q-fabs-function-q-fabs-value-src-mq3-splines-headers-ml-28014795"></a>
### Q_fabs

```ml
function Q_fabs(value)
```

Compute fabs in splines.headers; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value < 0.0)` and `(0.0 - value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L97)

<a id="function-function-mq3-splines-headers-qsharedsymbols-function-qsharedsymbols-src-mq3-splines-headers-ml-1441709814"></a>
### qSharedSymbols

```ml
function qSharedSymbols()
```

List the 0 names in splines.headers.qSharedSymbols.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L36)

<a id="function-function-mq3-splines-headers-quat-function-quat-x-y-z-w-src-mq3-splines-headers-ml-1938556974"></a>
### quat

```ml
function quat(x, y, z, w)
```

Create `mq3.splines.headers.Quat` with x=n.f32(x); y=n.f32(y); z=n.f32(z); w=n.f32(w).

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — | Floating-point value to narrow to binary32. |
| `y` | `dynamic` | — | Floating-point value to narrow to binary32. |
| `z` | `dynamic` | — | Floating-point value to narrow to binary32. |
| `w` | `dynamic` | — | Floating-point value to narrow to binary32. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L59)

- [mq3.splines.headers.Quat](Type-mq3-splines-headers-quat-1945641945.md) — struct
<a id="function-function-mq3-splines-headers-quat-t-function-quat-t-x-y-z-w-src-mq3-splines-headers-ml-1526001338"></a>
### quat_t

```ml
function quat_t(x, y, z, w)
```

Return `mq3.splines.headers.quat(x, y, z, w)` from `splines.headers.quat_t`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — | X passed as `x` to `mq3.splines.headers.quat`. |
| `y` | `dynamic` | — | Y passed as `y` to `mq3.splines.headers.quat`. |
| `z` | `dynamic` | — | Z passed as `z` to `mq3.splines.headers.quat`. |
| `w` | `dynamic` | — | W passed as `w` to `mq3.splines.headers.quat`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L80)

<a id="function-function-mq3-splines-headers-quatlength-function-quatlength-value-src-mq3-splines-headers-ml-625237203"></a>
### quatLength

```ml
function quatLength(value)
```

Return `mq3.compat.numeric.f32(trig.sqrt(((((value.x * value.x) + (value.y * value.y)) + (value.z * value.z)) + (value.w * value.w))))` from `splines.headers.quatLength`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `x`, `y`, `z`, `w`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L195)

<a id="function-function-mq3-splines-headers-quatnormalize-function-quatnormalize-value-src-mq3-splines-headers-ml-677511459"></a>
### quatNormalize

```ml
function quatNormalize(value)
```

Compute quat normalize in splines.headers; the normal completion returns `quat((value.x / length), (value.y / length), (value.z / length), (value.w / length))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `x`, `y`, `z`, `w`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L198)

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

Compute radius in splines.headers; the normal completion returns `Length(vecSub(value.maxs, Center(value)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `cleared`, `maxs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L260)

<a id="function-function-mq3-splines-headers-remove-function-remove-list-value-src-mq3-splines-headers-ml-632185735"></a>
### Remove

```ml
function Remove(list, value)
```

Return `mq3.splines.headers.RemoveIndex(list, Find(list, value))` from `splines.headers.Remove`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — | List passed as `list` to `mq3.splines.headers.RemoveIndex`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.splines.headers.Find`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L337)

<a id="function-function-mq3-splines-headers-removeindex-function-removeindex-list-index-src-mq3-splines-headers-ml-1981805090"></a>
### RemoveIndex

```ml
function RemoveIndex(list, index)
```

Remove index in splines.headers; the normal completion returns `true`.

Direct state writes: `list.values`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — | Record exposing `values`. Updated in place: `values`. |
| `index` | `dynamic` | — | Index used in `(index < 0)` and `(current != index)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L329)

<a id="function-function-mq3-splines-headers-resize-function-resize-list-size-src-mq3-splines-headers-ml-1381724127"></a>
### Resize

```ml
function Resize(list, size)
```

Update `list.values`, `list.size` in splines.headers; the normal completion returns `size`.

Validation failures include `list size is negative`.
Direct state writes: `list.values`, `list.size`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — | Record exposing `values`. Updated in place: `values`, `size`. |
| `size` | `dynamic` | — | Size used in `(size < 0)` and `(size < len(list.values))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L290)

<a id="function-function-mq3-splines-headers-setgranularity-function-setgranularity-list-granularity-src-mq3-splines-headers-ml-458846002"></a>
### SetGranularity

```ml
function SetGranularity(list, granularity)
```

Set granularity in splines.headers; the normal completion returns `granularity`.

Validation failures include `list granularity must be positive`.
Direct state writes: `list.granularity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — | Record exposing `values`, `size`. Updated in place: `granularity`. |
| `granularity` | `dynamic` | — | Granularity used in `(granularity <= 0)` and `(len(list.values) + granularity)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L309)

<a id="function-function-mq3-splines-headers-setnum-function-setnum-list-count-src-mq3-splines-headers-ml-123657449"></a>
### SetNum

```ml
function SetNum(list, count)
```

Set num in splines.headers; the normal completion returns `count`.

Validation failures include `list count is negative`.
Direct state writes: `list.values`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — | Record exposing `size`, `granularity`, `values`. Updated in place: `values`. |
| `count` | `dynamic` | — | Count used in `(count < 0)` and `(count > list.size)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L297)

<a id="function-function-mq3-splines-headers-size-function-size-list-src-mq3-splines-headers-ml-974769126"></a>
### Size

```ml
function Size(list)
```

Compute splines.headers.Size as `list.size`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — | Record exposing `size`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L283)

<a id="function-function-mq3-splines-headers-skewsymmetric-function-skewsymmetric-value-src-mq3-splines-headers-ml-1726996401"></a>
### SkewSymmetric

```ml
function SkewSymmetric(value)
```

Return `mq3.splines.headers.mat3(vec3(0.0, (0.0 - value.z), value.y), vec3(value.z, 0.0, (0.0 - value.x)), vec3((0.0 - value.y), value.x, 0.0))` from `splines.headers.SkewSymmetric`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `z`, `y`, `x`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L233)

<a id="function-function-mq3-splines-headers-snap-function-snap-value-src-mq3-splines-headers-ml-504230423"></a>
### Snap

```ml
function Snap(value)
```

Return `mq3.splines.headers.vec3(n.trunc32(value.x), n.trunc32(value.y), n.trunc32(value.z))` from `splines.headers.Snap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `x`, `y`, `z`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L131)

<a id="function-function-mq3-splines-headers-snapcomponent-function-snapcomponent-value-toward-src-mq3-splines-headers-ml-809983698"></a>
### snapComponent

```ml
function snapComponent(value, toward)
```

Compute snap component in splines.headers; the normal completion returns `base`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Floating-point value to convert to signed 32-bit integer semantics. |
| `toward` | `dynamic` | — | Toward used in `(toward > value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L135)

<a id="function-function-mq3-splines-headers-snaptowards-function-snaptowards-value-toward-src-mq3-splines-headers-ml-1298789888"></a>
### SnapTowards

```ml
function SnapTowards(value, toward)
```

Return `mq3.splines.headers.vec3(snapComponent(value.x, toward.x), snapComponent(value.y, toward.y), snapComponent(value.z, toward.z))` from `splines.headers.SnapTowards`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `x`, `y`, `z`. |
| `toward` | `dynamic` | — | Record exposing `x`, `y`, `z`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L139)

<a id="function-function-mq3-splines-headers-sort-function-sort-list-compare-context-src-mq3-splines-headers-ml-955760552"></a>
### Sort

```ml
function Sort(list, compare, context)
```

Compute sort in splines.headers; the normal completion returns `list`.

Validation failures include `list comparator is missing`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `list` | `dynamic` | — | Record exposing `values`. |
| `compare` | `dynamic` | — | Compare used in `(compare == void)` and `compare(context, list.values[(cursor - 1)], list.values[cursor])`. |
| `context` | `dynamic` | — | Context used in `compare(context, list.values[(cursor - 1)], list.values[cursor])` and `(compare(context, list.values[(cursor - 1)], list.values[cursor]) > 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L354)

<a id="function-function-mq3-splines-headers-splinessymbols-function-splinessymbols-src-mq3-splines-headers-ml-846921806"></a>
### splinesSymbols

```ml
function splinesSymbols()
```

List the 0 names in splines.headers.splinesSymbols.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L38)

<a id="function-function-mq3-splines-headers-toforward-function-toforward-value-src-mq3-splines-headers-ml-1867508667"></a>
### toForward

```ml
function toForward(value)
```

Compute splines.headers.toForward as `toVectors(value)[0]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.splines.headers.toVectors`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L191)

<a id="function-function-mq3-splines-headers-tolower-function-tolower-value-src-mq3-splines-headers-ml-1066838843"></a>
### tolower

```ml
function tolower(value)
```

Return `std.string.toLowerAscii(idStr(value))` from `splines.headers.tolower`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.splines.headers.idStr`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L376)

<a id="function-function-mq3-splines-headers-topitch-function-topitch-value-src-mq3-splines-headers-ml-1697850457"></a>
### toPitch

```ml
function toPitch(value)
```

Compute to pitch in splines.headers; the normal completion returns `n.f32(pitch)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `x`, `y`, `z`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L158)

<a id="function-function-mq3-splines-headers-toupper-function-toupper-value-src-mq3-splines-headers-ml-502935433"></a>
### toupper

```ml
function toupper(value)
```

Compute toupper in splines.headers; the normal completion returns `decode(raw)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.splines.headers.idStr`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L379)

<a id="function-function-mq3-splines-headers-tovectors-function-tovectors-value-src-mq3-splines-headers-ml-185490557"></a>
### toVectors

```ml
function toVectors(value)
```

Compute to vectors in splines.headers; the normal completion returns `[forward, right, up]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `pitch`, `yaw`, `roll`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L181)

<a id="function-function-mq3-splines-headers-toyaw-function-toyaw-value-src-mq3-splines-headers-ml-572182379"></a>
### toYaw

```ml
function toYaw(value)
```

Compute to yaw in splines.headers; the normal completion returns `n.f32(yaw)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `x`, `y`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L152)

<a id="function-function-mq3-splines-headers-transpose-function-transpose-matrix-src-mq3-splines-headers-ml-1312540753"></a>
### Transpose

```ml
function Transpose(matrix)
```

Return `mq3.splines.headers.mat3(vec3(matrix.rows[0].x, matrix.rows[1].x, matrix.rows[2].x), vec3(matrix.rows[0].y, matrix.rows[1].y, matrix.rows[2].y), vec3(matrix.rows[0].z, matrix.rows[1].z, matrix.rows[2].z))` from `splines.headers.Transpose`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `matrix` | `dynamic` | — | Record exposing `rows`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L215)

<a id="function-function-mq3-splines-headers-utillistsymbols-function-utillistsymbols-src-mq3-splines-headers-ml-2109216284"></a>
### utilListSymbols

```ml
function utilListSymbols()
```

List the 14 names in splines.headers.utilListSymbols, beginning with `AddUnique`, `Append`, `Clear`, `Condense`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L40)

<a id="function-function-mq3-splines-headers-utilstrsymbols-function-utilstrsymbols-src-mq3-splines-headers-ml-1855036358"></a>
### utilStrSymbols

```ml
function utilStrSymbols()
```

List the 4 names in splines.headers.utilStrSymbols, beginning with `append`, `idStr`, `tolower`, `toupper`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L42)

<a id="function-function-mq3-splines-headers-vec3-function-vec3-x-y-z-src-mq3-splines-headers-ml-1352988225"></a>
### vec3

```ml
function vec3(x, y, z)
```

Create `mq3.splines.headers.Vec3` with x=n.f32(x); y=n.f32(y); z=n.f32(z).

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — | Floating-point value to narrow to binary32. |
| `y` | `dynamic` | — | Floating-point value to narrow to binary32. |
| `z` | `dynamic` | — | Floating-point value to narrow to binary32. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L48)

- [mq3.splines.headers.Vec3](Type-mq3-splines-headers-vec3-1821645369.md) — struct
<a id="function-function-mq3-splines-headers-vec4-function-vec4-value-src-mq3-splines-headers-ml-996977211"></a>
### vec4

```ml
function vec4(value)
```

Compute splines.headers.vec4 as `[value.x, value.y, value.z, value.w]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `x`, `y`, `z`, `w`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L201)

<a id="function-function-mq3-splines-headers-vec4-t-function-vec4-t-x-y-z-w-src-mq3-splines-headers-ml-797039878"></a>
### vec4_t

```ml
function vec4_t(x, y, z, w)
```

Compute splines.headers.vec4_t as `[n.f32(x), n.f32(y), n.f32(z), n.f32(w)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | `dynamic` | — | Floating-point value to narrow to binary32. |
| `y` | `dynamic` | — | Floating-point value to narrow to binary32. |
| `z` | `dynamic` | — | Floating-point value to narrow to binary32. |
| `w` | `dynamic` | — | Floating-point value to narrow to binary32. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L91)

<a id="function-function-mq3-splines-headers-vecadd-function-vecadd-a-b-src-mq3-splines-headers-ml-1484252301"></a>
### vecAdd

```ml
function vecAdd(a, b)
```

Return `mq3.splines.headers.vec3((a.x + b.x), (a.y + b.y), (a.z + b.z))` from `splines.headers.vecAdd`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Record exposing `x`, `y`, `z`. |
| `b` | `dynamic` | — | Record exposing `x`, `y`, `z`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L101)

<a id="function-function-mq3-splines-headers-vecscale-function-vecscale-a-value-src-mq3-splines-headers-ml-1142699330"></a>
### vecScale

```ml
function vecScale(a, value)
```

Return `mq3.splines.headers.vec3((a.x * value), (a.y * value), (a.z * value))` from `splines.headers.vecScale`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Record exposing `x`, `y`, `z`. |
| `value` | `dynamic` | — | Value used in `(a.x * value)` and `(a.y * value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L109)

<a id="function-function-mq3-splines-headers-vecsub-function-vecsub-a-b-src-mq3-splines-headers-ml-373001197"></a>
### vecSub

```ml
function vecSub(a, b)
```

Return `mq3.splines.headers.vec3((a.x - b.x), (a.y - b.y), (a.z - b.z))` from `splines.headers.vecSub`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Record exposing `x`, `y`, `z`. |
| `b` | `dynamic` | — | Record exposing `x`, `y`, `z`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L105)

<a id="function-function-mq3-splines-headers-vectorequal-function-vectorequal-a-b-src-mq3-splines-headers-ml-541684591"></a>
### vectorEqual

```ml
function vectorEqual(a, b)
```

Compute splines.headers.vectorEqual as `(((Q_fabs((a.x - b.x)) <= EQUAL_EPSILON) and (Q_fabs((a.y - b.y)) <= EQUAL_EPSILON)) and (Q_fabs((a.z - b.z)) <= EQUAL_EPSILON))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Record exposing `x`, `y`, `z`. |
| `b` | `dynamic` | — | Record exposing `x`, `y`, `z`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L148)

<a id="function-function-mq3-splines-headers-vectortoangles-function-vectortoangles-value-src-mq3-splines-headers-ml-2084899283"></a>
### vectorToAngles

```ml
function vectorToAngles(value)
```

Return `mq3.splines.headers.angles((0.0 - toPitch(value)), toYaw(value), 0.0)` from `splines.headers.vectorToAngles`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.splines.headers.toPitch`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L164)

<a id="function-function-mq3-splines-headers-zero-function-zero-src-mq3-splines-headers-ml-1736498906"></a>
### Zero

```ml
function Zero()
```

Return `mq3.splines.headers.vec3(0.0, 0.0, 0.0)` from `splines.headers.Zero`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/splines/headers.ml#L128)
