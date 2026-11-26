# `src/mq3/shared/math.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.shared.math`](Package-mq3-shared-math-294886989.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `crt` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/shared/bytedirs.ml` as `bytedirs` → [src/mq3/shared/bytedirs.ml](File-src-mq3-shared-bytedirs-ml-1818459093.md)

## Declarations

<a id="function-function-mq3-shared-math-dotproduct-function-dotproduct-a-b-src-mq3-shared-math-ml-1745354851"></a>
### _DotProduct

```ml
function _DotProduct(a, b)
```

Return `mq3.shared.math.DotProduct(a, b)` from `shared.math._DotProduct`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Left three-element vector. |
| `b` | `dynamic` | — | Right three-element vector. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L417)

<a id="function-function-mq3-shared-math-vectoradd-function-vectoradd-a-b-src-mq3-shared-math-ml-725041317"></a>
### _VectorAdd

```ml
function _VectorAdd(a, b)
```

Compute shared.math._VectorAdd as `[n.fadd(a[0], b[0]), n.fadd(a[1], b[1]), n.fadd(a[2], b[2])]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A used in `a[0]` and `a[1]`. |
| `b` | `dynamic` | — | B used in `b[0]` and `b[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L425)

<a id="function-function-mq3-shared-math-vectorcopy-function-vectorcopy-value-src-mq3-shared-math-ml-573446427"></a>
### _VectorCopy

```ml
function _VectorCopy(value)
```

Compute shared.math._VectorCopy as `[value[0], value[1], value[2]]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `value[0]` and `value[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L428)

<a id="function-function-mq3-shared-math-vectorma-function-vectorma-a-scale-b-src-mq3-shared-math-ml-1853722679"></a>
### _VectorMA

```ml
function _VectorMA(a, scale, b)
```

Return `mq3.shared.math.VectorMA(a, scale, b)` from `shared.math._VectorMA`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A passed as `a` to `mq3.shared.math.VectorMA`. |
| `scale` | `dynamic` | — | Scale passed as `scale` to `mq3.shared.math.VectorMA`. |
| `b` | `dynamic` | — | B passed as `b` to `mq3.shared.math.VectorMA`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L413)

<a id="function-function-mq3-shared-math-vectorscale-function-vectorscale-value-scale-src-mq3-shared-math-ml-623113615"></a>
### _VectorScale

```ml
function _VectorScale(value, scale)
```

Return `mq3.shared.math.VectorScale(value, scale)` from `shared.math._VectorScale`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | A passed as `a` to `mq3.shared.math.VectorScale`. |
| `scale` | `dynamic` | — | Scale passed as `scale` to `mq3.shared.math.VectorScale`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L432)

<a id="function-function-mq3-shared-math-vectorsubtract-function-vectorsubtract-a-b-src-mq3-shared-math-ml-248279953"></a>
### _VectorSubtract

```ml
function _VectorSubtract(a, b)
```

Compute shared.math._VectorSubtract as `[n.fsub(a[0], b[0]), n.fsub(a[1], b[1]), n.fsub(a[2], b[2])]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A used in `a[0]` and `a[1]`. |
| `b` | `dynamic` | — | B used in `b[0]` and `b[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L421)

<a id="function-function-mq3-shared-math-addpointtobounds-function-addpointtobounds-point-mins-maxs-src-mq3-shared-math-ml-1682905212"></a>
### AddPointToBounds

```ml
function AddPointToBounds(point, mins, maxs)
```

Add point to bounds in shared.math; updates `mins entries`, `maxs entries`.

Direct state writes: `mins elements`, `maxs elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — | Point used in `point[i]` and `(point[i] < mins[i])`. |
| `mins` | `dynamic` | — | Mutable sequence written at `i`. |
| `maxs` | `dynamic` | — | Mutable sequence written at `i`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L408)

<a id="function-function-mq3-shared-math-angledelta-function-angledelta-first-second-src-mq3-shared-math-ml-1933659022"></a>
### AngleDelta

```ml
function AngleDelta(first, second)
```

Return `mq3.shared.math.AngleNormalize180(n.fsub(first, second))` from `shared.math.AngleDelta`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — | Left floating-point operand. |
| `second` | `dynamic` | — | Right floating-point operand. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L374)

<a id="function-function-mq3-shared-math-anglemod-function-anglemod-value-src-mq3-shared-math-ml-1117166953"></a>
### AngleMod

```ml
function AngleMod(value)
```

Return `mq3.shared.math.AngleNormalize360(value)` from `shared.math.AngleMod`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Angle passed as `angle` to `mq3.shared.math.AngleNormalize360`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L370)

<a id="function-function-mq3-shared-math-anglenormalize180-function-anglenormalize180-angle-src-mq3-shared-math-ml-1573624401"></a>
### AngleNormalize180

```ml
function AngleNormalize180(angle)
```

Wrap degrees into the signed half-turn range after 16-bit angle normalization.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angle` | `dynamic` | — | Angle passed as `angle` to `mq3.shared.math.AngleNormalize360`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L80)

<a id="function-function-mq3-shared-math-anglenormalize360-function-anglenormalize360-angle-src-mq3-shared-math-ml-811231253"></a>
### AngleNormalize360

```ml
function AngleNormalize360(angle)
```

Wrap degrees through the original 16-bit angle quantization into the [0, 360) range.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angle` | `dynamic` | — | Floating-point value to narrow to binary32. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L54)

<a id="function-function-mq3-shared-math-anglessubtract-function-anglessubtract-first-second-src-mq3-shared-math-ml-1951125638"></a>
### AnglesSubtract

```ml
function AnglesSubtract(first, second)
```

Compute shared.math.AnglesSubtract as `[AngleSubtract(first[0], second[0]), AngleSubtract(first[1], second[1]), AngleSubtract(first[2], second[2])]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — | First used in `first[0]` and `first[1]`. |
| `second` | `dynamic` | — | Second used in `second[0]` and `second[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L367)

<a id="function-function-mq3-shared-math-anglestoaxis-function-anglestoaxis-angles-src-mq3-shared-math-ml-443776874"></a>
### AnglesToAxis

```ml
function AnglesToAxis(angles)
```

Compute angles to axis in shared.math; the normal completion returns `[vectors[0], [n.fneg(right[0]), n.fneg(right[1]), n.fneg(right[2])], vectors[2]]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angles` | `dynamic` | — | Three-element [pitch, yaw, roll] array in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L350)

<a id="function-function-mq3-shared-math-anglesubtract-function-anglesubtract-first-second-src-mq3-shared-math-ml-439132364"></a>
### AngleSubtract

```ml
function AngleSubtract(first, second)
```

Compute angle subtract in shared.math; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — | Left floating-point operand. |
| `second` | `dynamic` | — | Right floating-point operand. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L363)

<a id="function-function-mq3-shared-math-anglevectors-function-anglevectors-angles-src-mq3-shared-math-ml-1743136418"></a>
### AngleVectors

```ml
function AngleVectors(angles)
```

Convert pitch/yaw/roll in degrees to forward, right, and up vectors with Quake-compatible binary32 rounding.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angles` | `dynamic` | — | Three-element [pitch, yaw, roll] array in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L11)

<a id="function-function-mq3-shared-math-atandegrees-function-atandegrees-y-x-src-mq3-shared-math-ml-1376879213"></a>
### atanDegrees

```ml
function atanDegrees(y, x)
```

Convert atan2(y, x) to degrees while preserving the original zero-sign handling.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `y` | `dynamic` | — | Y coordinate of the direction. |
| `x` | `dynamic` | — | X coordinate of the direction. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L29)

<a id="function-function-mq3-shared-math-axisclear-function-axisclear-src-mq3-shared-math-ml-250562002"></a>
### AxisClear

```ml
function AxisClear()
```

Compute shared.math.AxisClear as `[[1.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 1.0]]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L352)

<a id="function-function-mq3-shared-math-axiscopy-function-axiscopy-axis-src-mq3-shared-math-ml-963613663"></a>
### AxisCopy

```ml
function AxisCopy(axis)
```

Compute shared.math.AxisCopy as `[[axis[0][0], axis[0][1], axis[0][2]], [axis[1][0], axis[1][1], axis[1][2]], [axis[2][0], axis[2][1], axis[2][2]]]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `axis` | `dynamic` | — | Axis used in `axis[0]` and `axis[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L355)

<a id="function-function-mq3-shared-math-boxonplaneside-function-boxonplaneside-mins-maxs-plane-src-mq3-shared-math-ml-1826562420"></a>
### BoxOnPlaneSide

```ml
function BoxOnPlaneSide(mins, maxs, plane)
```

Classify an axis-aligned box using the axial plane shortcut or the projected-corner fallback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mins` | `dynamic` | — | Mins passed as `mins` to `mq3.shared.math.BoxOnPlaneSide2`. |
| `maxs` | `dynamic` | — | Maxs passed as `maxs` to `mq3.shared.math.BoxOnPlaneSide2`. |
| `plane` | `dynamic` | — | Record exposing `type`, `dist`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L392)

<a id="function-function-mq3-shared-math-boxonplaneside2-function-boxonplaneside2-mins-maxs-plane-src-mq3-shared-math-ml-463465598"></a>
### BoxOnPlaneSide2

```ml
function BoxOnPlaneSide2(mins, maxs, plane)
```

Classify an axis-aligned box by explicitly projecting its extreme corners onto the plane.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mins` | `dynamic` | — | Mins used in `mins[i]`. |
| `maxs` | `dynamic` | — | Maxs used in `maxs[i]`. |
| `plane` | `dynamic` | — | Record exposing `normal`, `dist`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L384)

<a id="function-function-mq3-shared-math-bytetodir-function-bytetodir-index-src-mq3-shared-math-ml-773906252"></a>
### ByteToDir

```ml
function ByteToDir(index)
```

Compute byte to dir in shared.math; the normal completion returns `[values[index][0], values[index][1], values[index][2]]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Zero-based index into `values`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L275)

<a id="function-function-mq3-shared-math-clampchar-function-clampchar-value-src-mq3-shared-math-ml-1385909471"></a>
### ClampChar

```ml
function ClampChar(value)
```

Clamp char in shared.math; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value > 127)` and `(value < - 128)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L262)

<a id="function-function-mq3-shared-math-clampshort-function-clampshort-value-src-mq3-shared-math-ml-474234445"></a>
### ClampShort

```ml
function ClampShort(value)
```

Clamp short in shared.math; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value > 32767)` and `(value < - 32768)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L265)

<a id="function-function-mq3-shared-math-clearbounds-function-clearbounds-src-mq3-shared-math-ml-1577159438"></a>
### ClearBounds

```ml
function ClearBounds()
```

Compute shared.math.ClearBounds as `[[99999.0, 99999.0, 99999.0], [- 99999.0, - 99999.0, - 99999.0]]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L401)

<a id="function-function-mq3-shared-math-colorbyte-function-colorbyte-value-src-mq3-shared-math-ml-549914135"></a>
### colorByte

```ml
function colorByte(value)
```

Compute shared.math.colorByte as `(n.trunc32(n.fmul(value, 255.0)) & 255)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Left floating-point operand. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L278)

<a id="function-function-mq3-shared-math-colorbytes3-function-colorbytes3-r-g-b-src-mq3-shared-math-ml-868893513"></a>
### ColorBytes3

```ml
function ColorBytes3(r, g, b)
```

Compute shared.math.ColorBytes3 as `((colorByte(r) | (colorByte(g) << 8)) | (colorByte(b) << 16))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `r` | `dynamic` | — | Value passed as `value` to `mq3.shared.math.colorByte`. |
| `g` | `dynamic` | — | Value passed as `value` to `mq3.shared.math.colorByte`. |
| `b` | `dynamic` | — | Value passed as `value` to `mq3.shared.math.colorByte`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L283)

<a id="function-function-mq3-shared-math-colorbytes4-function-colorbytes4-r-g-b-a-src-mq3-shared-math-ml-1106883768"></a>
### ColorBytes4

```ml
function ColorBytes4(r, g, b, a)
```

Return `mq3.compat.numeric.i32((((colorByte(r) | (colorByte(g) << 8)) | (colorByte(b) << 16)) | (colorByte(a) << 24)))` from `shared.math.ColorBytes4`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `r` | `dynamic` | — | Value passed as `value` to `mq3.shared.math.colorByte`. |
| `g` | `dynamic` | — | Value passed as `value` to `mq3.shared.math.colorByte`. |
| `b` | `dynamic` | — | Value passed as `value` to `mq3.shared.math.colorByte`. |
| `a` | `dynamic` | — | Value passed as `value` to `mq3.shared.math.colorByte`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L289)

<a id="function-function-mq3-shared-math-crossproduct-function-crossproduct-a-b-src-mq3-shared-math-ml-1712202677"></a>
### CrossProduct

```ml
function CrossProduct(a, b)
```

Compute shared.math.CrossProduct as `[n.fsub(n.fmul(a[1], b[2]), n.fmul(a[2], b[1])), n.fsub(n.fmul(a[2], b[0]), n.fmul(a[0], b[2])), n.fsub(n.fmul(a[0], b[1]), n.fmul(a[1], b[0]))]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A used in `a[1]` and `a[2]`. |
| `b` | `dynamic` | — | B used in `b[2]` and `b[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L162)

<a id="function-function-mq3-shared-math-dirtobyte-function-dirtobyte-direction-src-mq3-shared-math-ml-997475889"></a>
### DirToByte

```ml
function DirToByte(direction)
```

Select the closest normal from the fixed Quake direction table by maximum dot product.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `direction` | `dynamic` | — | Left three-element vector. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L268)

<a id="function-function-mq3-shared-math-distance-function-distance-a-b-src-mq3-shared-math-ml-585058257"></a>
### Distance

```ml
function Distance(a, b)
```

Return `mq3.compat.numeric.fsqrt(DistanceSquared(a, b))` from `shared.math.Distance`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A passed as `a` to `mq3.shared.math.DistanceSquared`. |
| `b` | `dynamic` | — | B passed as `b` to `mq3.shared.math.DistanceSquared`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L249)

<a id="function-function-mq3-shared-math-distancesquared-function-distancesquared-a-b-src-mq3-shared-math-ml-160059509"></a>
### DistanceSquared

```ml
function DistanceSquared(a, b)
```

Compute distance squared in shared.math; the normal completion returns `DotProduct(d, d)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A used in `a[0]` and `a[1]`. |
| `b` | `dynamic` | — | B used in `b[0]` and `b[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L245)

<a id="function-function-mq3-shared-math-dotproduct-function-dotproduct-a-as-array-b-as-array-returns-float-src-mq3-shared-math-ml-1312321842"></a>
### DotProduct

```ml
function DotProduct(a as array, b as array) returns float
```

Compute a three-component dot product with the numeric compatibility layer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `array` | — | Left three-element vector. |
| `b` | `array` | — | Right three-element vector. |


**Returns:** The dot product with the compatibility layer's binary32 rounding.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L155)

<a id="function-function-mq3-shared-math-lerpangle-function-lerpangle-startangle-target-fraction-src-mq3-shared-math-ml-1372172154"></a>
### LerpAngle

```ml
function LerpAngle(startAngle, target, fraction)
```

Interpolate between angles along the shorter wraparound direction.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `startAngle` | `dynamic` | — | Floating-point value to narrow to binary32. |
| `target` | `dynamic` | — | Floating-point value to narrow to binary32. |
| `fraction` | `dynamic` | — | Left floating-point operand. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L214)

<a id="function-function-mq3-shared-math-makenormalvectors-function-makenormalvectors-forward-src-mq3-shared-math-ml-1180006995"></a>
### MakeNormalVectors

```ml
function MakeNormalVectors(forward)
```

Build perpendicular right/up directions around a forward vector.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `forward` | `dynamic` | — | Normalized three-element forward direction. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L327)

<a id="function-function-mq3-shared-math-matrixmultiply-function-matrixmultiply-left-right-src-mq3-shared-math-ml-1993395845"></a>
### MatrixMultiply

```ml
function MatrixMultiply(left, right)
```

Compute matrix multiply in shared.math; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Left used in `left[i]` and `left[i][0]`. |
| `right` | `dynamic` | — | Right used in `right[0]` and `right[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L309)

<a id="function-function-mq3-shared-math-normalizecolor-function-normalizecolor-input-src-mq3-shared-math-ml-1150959240"></a>
### NormalizeColor

```ml
function NormalizeColor(input)
```

Scale an RGB vector by its largest component and return [original maximum, normalized color].

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — | Input used in `input[0]` and `input[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L292)

<a id="function-function-mq3-shared-math-perpendicularvector-function-perpendicularvector-source-src-mq3-shared-math-ml-1738084845"></a>
### PerpendicularVector

```ml
function PerpendicularVector(source)
```

Construct a normalized vector perpendicular to the supplied direction.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Normalized nonzero three-element direction. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L321)

- [mq3.shared.math.Plane](Type-mq3-shared-math-plane-122607801.md) — struct
<a id="function-function-mq3-shared-math-planefrompoints-function-planefrompoints-a-b-c-src-mq3-shared-math-ml-324064266"></a>
### PlaneFromPoints

```ml
function PlaneFromPoints(a, b, c)
```

Construct the normalized plane through three points, handling degenerate triangles.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Left three-element vector. |
| `b` | `dynamic` | — | B used in `b[0]` and `b[1]`. |
| `c` | `dynamic` | — | C used in `c[0]` and `c[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L301)

<a id="function-function-mq3-shared-math-planetypefornormal-function-planetypefornormal-normal-src-mq3-shared-math-ml-623361097"></a>
### PlaneTypeForNormal

```ml
function PlaneTypeForNormal(normal)
```

Compute plane type for normal in shared.math; the normal completion returns `3`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — | Normal used in `normal[0]` and `normal[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L442)

<a id="function-function-mq3-shared-math-projectpointonplane-function-projectpointonplane-point-normal-src-mq3-shared-math-ml-212480021"></a>
### ProjectPointOnPlane

```ml
function ProjectPointOnPlane(point, normal)
```

Project a point onto the plane through the origin using the original Quake projection formula.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — | Three-element point in the same coordinate space as the plane. |
| `normal` | `dynamic` | — | Unit plane normal; the plane passes through the origin. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L315)

<a id="function-function-mq3-shared-math-q-crandom-function-q-crandom-state-src-mq3-shared-math-ml-1889018369"></a>
### Q_crandom

```ml
function Q_crandom(state)
```

Advance the random seed and map the generated fraction to the centered random range.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.shared.math.Q_random`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L131)

<a id="function-function-mq3-shared-math-q-fabs-function-q-fabs-value-src-mq3-shared-math-ml-1294070601"></a>
### Q_fabs

```ml
function Q_fabs(value)
```

Return `mq3.compat.numeric.bitsFloat((n.floatBits(value) & 2147483647))` from `shared.math.Q_fabs`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Floating-point value to narrow and reinterpret. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L147)

<a id="function-function-mq3-shared-math-q-log2-function-q-log2-value-src-mq3-shared-math-ml-2140537917"></a>
### Q_log2

```ml
function Q_log2(value)
```

Compute log 2 in shared.math; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `(value >> 1)` and `(value != 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L439)

<a id="function-function-mq3-shared-math-q-rand-function-q-rand-state-src-mq3-shared-math-ml-1214075257"></a>
### Q_rand

```ml
function Q_rand(state)
```

Advance the Quake linear-congruential seed and return the new signed 32-bit state.

Direct state writes: `state.seed`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `seed`. Updated in place: `seed`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L118)

<a id="function-function-mq3-shared-math-q-random-function-q-random-state-src-mq3-shared-math-ml-1033063829"></a>
### Q_random

```ml
function Q_random(state)
```

Advance the random seed and scale its low bits into the original [0, 1) random range.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.shared.math.Q_rand`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L125)

<a id="function-function-mq3-shared-math-q-rsqrt-function-q-rsqrt-number-src-mq3-shared-math-ml-456821083"></a>
### Q_rsqrt

```ml
function Q_rsqrt(number)
```

Approximate the reciprocal square root using the original bit estimate and Newton refinement.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — | Left floating-point operand. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L137)

<a id="function-function-mq3-shared-math-radiusfrombounds-function-radiusfrombounds-mins-maxs-src-mq3-shared-math-ml-1581325480"></a>
### RadiusFromBounds

```ml
function RadiusFromBounds(mins, maxs)
```

Compute radius from bounds in shared.math; the normal completion returns `VectorLength(corner)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mins` | `dynamic` | — | Mins used in `mins[i]` and `Q_fabs(mins[i])`. |
| `maxs` | `dynamic` | — | Maxs used in `maxs[i]` and `Q_fabs(maxs[i])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L399)

- [mq3.shared.math.RandomState](Type-mq3-shared-math-randomstate-976325275.md) — struct
<a id="function-function-mq3-shared-math-rotatearounddirection-function-rotatearounddirection-axis-yaw-src-mq3-shared-math-ml-1824208410"></a>
### RotateAroundDirection

```ml
function RotateAroundDirection(axis, yaw)
```

Update `axis entries` in shared.math; the normal completion returns `axis`.

Direct state writes: `axis elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `axis` | `dynamic` | — | Mutable sequence written at `1`, `2`. |
| `yaw` | `dynamic` | — | Rotation angle in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L347)

<a id="function-function-mq3-shared-math-rotatepointaroundvector-function-rotatepointaroundvector-direction-point-degrees-src-mq3-shared-math-ml-743655728"></a>
### RotatePointAroundVector

```ml
function RotatePointAroundVector(direction, point, degrees)
```

Rotate a point around a direction by an angle in degrees.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `direction` | `dynamic` | — | Normalized nonzero three-element rotation-axis direction. |
| `point` | `dynamic` | — | Three-element point to rotate about the origin. |
| `degrees` | `dynamic` | — | Rotation angle in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L334)

<a id="function-function-mq3-shared-math-setplanesignbits-function-setplanesignbits-plane-src-mq3-shared-math-ml-1078601478"></a>
### SetPlaneSignbits

```ml
function SetPlaneSignbits(plane)
```

Set plane signbits in shared.math; the normal completion returns `bits`.

Direct state writes: `plane.signbits`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `plane` | `dynamic` | — | Record exposing `normal`. Updated in place: `signbits`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L379)

<a id="function-function-mq3-shared-math-snapvector-function-snapvector-v-src-mq3-shared-math-ml-621861070"></a>
### SnapVector

```ml
function SnapVector(v)
```

Round the three vector components with the original nearest-even integer behavior.

Direct state writes: `v elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | Mutable sequence written at `axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L90)

<a id="function-function-mq3-shared-math-vectoangles-function-vectoangles-vector-src-mq3-shared-math-ml-1681809759"></a>
### vectoangles

```ml
function vectoangles(vector)
```

Convert a three-component direction to Quake pitch/yaw/roll angles in degrees.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vector` | `dynamic` | — | Three-element X/Y/Z direction vector. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L37)

<a id="function-function-mq3-shared-math-vector4scale-function-vector4scale-value-scale-src-mq3-shared-math-ml-539645043"></a>
### Vector4Scale

```ml
function Vector4Scale(value, scale)
```

Compute shared.math.Vector4Scale as `[n.fmul(value[0], scale), n.fmul(value[1], scale), n.fmul(value[2], scale), n.fmul(value[3], scale)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `value[0]` and `value[1]`. |
| `scale` | `dynamic` | — | Right floating-point operand. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L436)

<a id="function-function-mq3-shared-math-vectorcompare-function-vectorcompare-a-b-src-mq3-shared-math-ml-185218089"></a>
### VectorCompare

```ml
function VectorCompare(a, b)
```

Compute shared.math.VectorCompare as `(((a[0] == b[0]) and (a[1] == b[1])) and (a[2] == b[2]))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A used in `a[0]` and `a[1]`. |
| `b` | `dynamic` | — | B used in `b[0]` and `b[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L238)

<a id="function-function-mq3-shared-math-vectorinverse-function-vectorinverse-v-src-mq3-shared-math-ml-1872684668"></a>
### VectorInverse

```ml
function VectorInverse(v)
```

Update `v entries` in shared.math.

Direct state writes: `v elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | Mutable sequence written at `i`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L259)

<a id="function-function-mq3-shared-math-vectorlength-function-vectorlength-a-src-mq3-shared-math-ml-393753403"></a>
### VectorLength

```ml
function VectorLength(a)
```

Return `mq3.compat.numeric.fsqrt(DotProduct(a, a))` from `shared.math.VectorLength`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Left three-element vector. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L183)

<a id="function-function-mq3-shared-math-vectorlengthsquared-function-vectorlengthsquared-a-src-mq3-shared-math-ml-177145343"></a>
### VectorLengthSquared

```ml
function VectorLengthSquared(a)
```

Return `mq3.shared.math.DotProduct(a, a)` from `shared.math.VectorLengthSquared`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Left three-element vector. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L241)

<a id="function-function-mq3-shared-math-vectorma-function-vectorma-a-scale-b-src-mq3-shared-math-ml-1132874575"></a>
### VectorMA

```ml
function VectorMA(a, scale, b)
```

Compute shared.math.VectorMA as `[n.fadd(a[0], n.fmul(scale, b[0])), n.fadd(a[1], n.fmul(scale, b[1])), n.fadd(a[2], n.fmul(scale, b[2]))]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A used in `a[0]` and `a[1]`. |
| `scale` | `dynamic` | — | Left floating-point operand. |
| `b` | `dynamic` | — | B used in `b[0]` and `b[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L170)

<a id="function-function-mq3-shared-math-vectornormalize-function-vectornormalize-a-src-mq3-shared-math-ml-617696759"></a>
### VectorNormalize

```ml
function VectorNormalize(a)
```

Normalize a three-component vector in place and return its original length.

Direct state writes: `a elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Mutable sequence written at `axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L191)

<a id="function-function-mq3-shared-math-vectornormalize2-function-vectornormalize2-a-src-mq3-shared-math-ml-876626439"></a>
### VectorNormalize2

```ml
function VectorNormalize2(a)
```

Return a normalized vector copy while preserving the input vector.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A passed as `a` to `mq3.shared.math.VectorLength`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L204)

<a id="function-function-mq3-shared-math-vectornormalizefast-function-vectornormalizefast-v-src-mq3-shared-math-ml-1355596498"></a>
### VectorNormalizeFast

```ml
function VectorNormalizeFast(v)
```

Update `v entries` in shared.math.

Direct state writes: `v elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | Mutable sequence written at `i`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L254)

<a id="function-function-mq3-shared-math-vectorrotate-function-vectorrotate-input-matrix-src-mq3-shared-math-ml-492079781"></a>
### VectorRotate

```ml
function VectorRotate(input, matrix)
```

Compute shared.math.VectorRotate as `[DotProduct(input, matrix[0]), DotProduct(input, matrix[1]), DotProduct(input, matrix[2])]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — | Left three-element vector. |
| `matrix` | `dynamic` | — | Matrix used in `matrix[0]` and `matrix[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L359)

<a id="function-function-mq3-shared-math-vectorscale-function-vectorscale-a-scale-src-mq3-shared-math-ml-1741461739"></a>
### VectorScale

```ml
function VectorScale(a, scale)
```

Compute shared.math.VectorScale as `[n.fmul(a[0], scale), n.fmul(a[1], scale), n.fmul(a[2], scale)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A used in `a[0]` and `a[1]`. |
| `scale` | `dynamic` | — | Right floating-point operand. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/shared/math.ml#L177)
