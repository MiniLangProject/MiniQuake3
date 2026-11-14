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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L242)

<a id="function-function-mq3-shared-math-vectoradd-function-vectoradd-a-b-src-mq3-shared-math-ml-725041317"></a>
### _VectorAdd

```ml
function _VectorAdd(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L244)

<a id="function-function-mq3-shared-math-vectorcopy-function-vectorcopy-value-src-mq3-shared-math-ml-573446427"></a>
### _VectorCopy

```ml
function _VectorCopy(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L245)

<a id="function-function-mq3-shared-math-vectorma-function-vectorma-a-scale-b-src-mq3-shared-math-ml-1853722679"></a>
### _VectorMA

```ml
function _VectorMA(a, scale, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L241)

<a id="function-function-mq3-shared-math-vectorscale-function-vectorscale-value-scale-src-mq3-shared-math-ml-623113615"></a>
### _VectorScale

```ml
function _VectorScale(value, scale)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L246)

<a id="function-function-mq3-shared-math-vectorsubtract-function-vectorsubtract-a-b-src-mq3-shared-math-ml-248279953"></a>
### _VectorSubtract

```ml
function _VectorSubtract(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L243)

<a id="function-function-mq3-shared-math-addpointtobounds-function-addpointtobounds-point-mins-maxs-src-mq3-shared-math-ml-1682905212"></a>
### AddPointToBounds

```ml
function AddPointToBounds(point, mins, maxs)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L240)

<a id="function-function-mq3-shared-math-angledelta-function-angledelta-first-second-src-mq3-shared-math-ml-1933659022"></a>
### AngleDelta

```ml
function AngleDelta(first, second)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L228)

<a id="function-function-mq3-shared-math-anglemod-function-anglemod-value-src-mq3-shared-math-ml-1117166953"></a>
### AngleMod

```ml
function AngleMod(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L227)

<a id="function-function-mq3-shared-math-anglenormalize180-function-anglenormalize180-angle-src-mq3-shared-math-ml-1573624401"></a>
### AngleNormalize180

```ml
function AngleNormalize180(angle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L69)

<a id="function-function-mq3-shared-math-anglenormalize360-function-anglenormalize360-angle-src-mq3-shared-math-ml-811231253"></a>
### AngleNormalize360

```ml
function AngleNormalize360(angle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L45)

<a id="function-function-mq3-shared-math-anglessubtract-function-anglessubtract-first-second-src-mq3-shared-math-ml-1951125638"></a>
### AnglesSubtract

```ml
function AnglesSubtract(first, second)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L226)

<a id="function-function-mq3-shared-math-anglestoaxis-function-anglestoaxis-angles-src-mq3-shared-math-ml-443776874"></a>
### AnglesToAxis

```ml
function AnglesToAxis(angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L221)

<a id="function-function-mq3-shared-math-anglesubtract-function-anglesubtract-first-second-src-mq3-shared-math-ml-439132364"></a>
### AngleSubtract

```ml
function AngleSubtract(first, second)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L225)

<a id="function-function-mq3-shared-math-anglevectors-function-anglevectors-angles-src-mq3-shared-math-ml-1743136418"></a>
### AngleVectors

```ml
function AngleVectors(angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L9)

<a id="function-function-mq3-shared-math-atandegrees-function-atandegrees-y-x-src-mq3-shared-math-ml-1376879213"></a>
### atanDegrees

```ml
function atanDegrees(y, x)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `y` | `dynamic` | — |  |
| `x` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L24)

<a id="function-function-mq3-shared-math-axisclear-function-axisclear-src-mq3-shared-math-ml-250562002"></a>
### AxisClear

```ml
function AxisClear()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L222)

<a id="function-function-mq3-shared-math-axiscopy-function-axiscopy-axis-src-mq3-shared-math-ml-963613663"></a>
### AxisCopy

```ml
function AxisCopy(axis)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `axis` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L223)

<a id="function-function-mq3-shared-math-boxonplaneside-function-boxonplaneside-mins-maxs-plane-src-mq3-shared-math-ml-1826562420"></a>
### BoxOnPlaneSide

```ml
function BoxOnPlaneSide(mins, maxs, plane)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `plane` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L234)

<a id="function-function-mq3-shared-math-boxonplaneside2-function-boxonplaneside2-mins-maxs-plane-src-mq3-shared-math-ml-463465598"></a>
### BoxOnPlaneSide2

```ml
function BoxOnPlaneSide2(mins, maxs, plane)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `plane` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L230)

<a id="function-function-mq3-shared-math-bytetodir-function-bytetodir-index-src-mq3-shared-math-ml-773906252"></a>
### ByteToDir

```ml
function ByteToDir(index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L184)

<a id="function-function-mq3-shared-math-clampchar-function-clampchar-value-src-mq3-shared-math-ml-1385909471"></a>
### ClampChar

```ml
function ClampChar(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L177)

<a id="function-function-mq3-shared-math-clampshort-function-clampshort-value-src-mq3-shared-math-ml-474234445"></a>
### ClampShort

```ml
function ClampShort(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L178)

<a id="function-function-mq3-shared-math-clearbounds-function-clearbounds-src-mq3-shared-math-ml-1577159438"></a>
### ClearBounds

```ml
function ClearBounds()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L239)

<a id="function-function-mq3-shared-math-colorbyte-function-colorbyte-value-src-mq3-shared-math-ml-549914135"></a>
### colorByte

```ml
function colorByte(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L185)

<a id="function-function-mq3-shared-math-colorbytes3-function-colorbytes3-r-g-b-src-mq3-shared-math-ml-868893513"></a>
### ColorBytes3

```ml
function ColorBytes3(r, g, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `r` | `dynamic` | — |  |
| `g` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L186)

<a id="function-function-mq3-shared-math-colorbytes4-function-colorbytes4-r-g-b-a-src-mq3-shared-math-ml-1106883768"></a>
### ColorBytes4

```ml
function ColorBytes4(r, g, b, a)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `r` | `dynamic` | — |  |
| `g` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L187)

<a id="function-function-mq3-shared-math-crossproduct-function-crossproduct-a-b-src-mq3-shared-math-ml-1712202677"></a>
### CrossProduct

```ml
function CrossProduct(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L126)

<a id="function-function-mq3-shared-math-dirtobyte-function-dirtobyte-direction-src-mq3-shared-math-ml-997475889"></a>
### DirToByte

```ml
function DirToByte(direction)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `direction` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L179)

<a id="function-function-mq3-shared-math-distance-function-distance-a-b-src-mq3-shared-math-ml-585058257"></a>
### Distance

```ml
function Distance(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L174)

<a id="function-function-mq3-shared-math-distancesquared-function-distancesquared-a-b-src-mq3-shared-math-ml-160059509"></a>
### DistanceSquared

```ml
function DistanceSquared(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L173)

<a id="function-function-mq3-shared-math-dotproduct-function-dotproduct-a-b-src-mq3-shared-math-ml-680440325"></a>
### DotProduct

```ml
function DotProduct(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L122)

<a id="function-function-mq3-shared-math-lerpangle-function-lerpangle-startangle-target-fraction-src-mq3-shared-math-ml-1372172154"></a>
### LerpAngle

```ml
function LerpAngle(startAngle, target, fraction)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `startAngle` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |
| `fraction` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L159)

<a id="function-function-mq3-shared-math-makenormalvectors-function-makenormalvectors-forward-src-mq3-shared-math-ml-1180006995"></a>
### MakeNormalVectors

```ml
function MakeNormalVectors(forward)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `forward` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L209)

<a id="function-function-mq3-shared-math-matrixmultiply-function-matrixmultiply-left-right-src-mq3-shared-math-ml-1993395845"></a>
### MatrixMultiply

```ml
function MatrixMultiply(left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L198)

<a id="function-function-mq3-shared-math-normalizecolor-function-normalizecolor-input-src-mq3-shared-math-ml-1150959240"></a>
### NormalizeColor

```ml
function NormalizeColor(input)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L188)

<a id="function-function-mq3-shared-math-perpendicularvector-function-perpendicularvector-source-src-mq3-shared-math-ml-1738084845"></a>
### PerpendicularVector

```ml
function PerpendicularVector(source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L205)

- [mq3.shared.math.Plane](Type-mq3-shared-math-plane-122607801.md) — struct
<a id="function-function-mq3-shared-math-planefrompoints-function-planefrompoints-a-b-c-src-mq3-shared-math-ml-324064266"></a>
### PlaneFromPoints

```ml
function PlaneFromPoints(a, b, c)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L193)

<a id="function-function-mq3-shared-math-planetypefornormal-function-planetypefornormal-normal-src-mq3-shared-math-ml-623361097"></a>
### PlaneTypeForNormal

```ml
function PlaneTypeForNormal(normal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L249)

<a id="function-function-mq3-shared-math-projectpointonplane-function-projectpointonplane-point-normal-src-mq3-shared-math-ml-212480021"></a>
### ProjectPointOnPlane

```ml
function ProjectPointOnPlane(point, normal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L201)

<a id="function-function-mq3-shared-math-q-crandom-function-q-crandom-state-src-mq3-shared-math-ml-1889018369"></a>
### Q_crandom

```ml
function Q_crandom(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L106)

<a id="function-function-mq3-shared-math-q-fabs-function-q-fabs-value-src-mq3-shared-math-ml-1294070601"></a>
### Q_fabs

```ml
function Q_fabs(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L118)

<a id="function-function-mq3-shared-math-q-log2-function-q-log2-value-src-mq3-shared-math-ml-2140537917"></a>
### Q_log2

```ml
function Q_log2(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L248)

<a id="function-function-mq3-shared-math-q-rand-function-q-rand-state-src-mq3-shared-math-ml-1214075257"></a>
### Q_rand

```ml
function Q_rand(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L97)

<a id="function-function-mq3-shared-math-q-random-function-q-random-state-src-mq3-shared-math-ml-1033063829"></a>
### Q_random

```ml
function Q_random(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L102)

<a id="function-function-mq3-shared-math-q-rsqrt-function-q-rsqrt-number-src-mq3-shared-math-ml-456821083"></a>
### Q_rsqrt

```ml
function Q_rsqrt(number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L110)

<a id="function-function-mq3-shared-math-radiusfrombounds-function-radiusfrombounds-mins-maxs-src-mq3-shared-math-ml-1581325480"></a>
### RadiusFromBounds

```ml
function RadiusFromBounds(mins, maxs)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L238)

- [mq3.shared.math.RandomState](Type-mq3-shared-math-randomstate-976325275.md) — struct
<a id="function-function-mq3-shared-math-rotatearounddirection-function-rotatearounddirection-axis-yaw-src-mq3-shared-math-ml-1824208410"></a>
### RotateAroundDirection

```ml
function RotateAroundDirection(axis, yaw)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `axis` | `dynamic` | — |  |
| `yaw` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L220)

<a id="function-function-mq3-shared-math-rotatepointaroundvector-function-rotatepointaroundvector-direction-point-degrees-src-mq3-shared-math-ml-743655728"></a>
### RotatePointAroundVector

```ml
function RotatePointAroundVector(direction, point, degrees)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `direction` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `degrees` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L212)

<a id="function-function-mq3-shared-math-setplanesignbits-function-setplanesignbits-plane-src-mq3-shared-math-ml-1078601478"></a>
### SetPlaneSignbits

```ml
function SetPlaneSignbits(plane)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `plane` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L229)

<a id="function-function-mq3-shared-math-snapvector-function-snapvector-v-src-mq3-shared-math-ml-621861070"></a>
### SnapVector

```ml
function SnapVector(v)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L75)

<a id="function-function-mq3-shared-math-vectoangles-function-vectoangles-vector-src-mq3-shared-math-ml-1681809759"></a>
### vectoangles

```ml
function vectoangles(vector)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vector` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L30)

<a id="function-function-mq3-shared-math-vector4scale-function-vector4scale-value-scale-src-mq3-shared-math-ml-539645043"></a>
### Vector4Scale

```ml
function Vector4Scale(value, scale)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L247)

<a id="function-function-mq3-shared-math-vectorcompare-function-vectorcompare-a-b-src-mq3-shared-math-ml-185218089"></a>
### VectorCompare

```ml
function VectorCompare(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L171)

<a id="function-function-mq3-shared-math-vectorinverse-function-vectorinverse-v-src-mq3-shared-math-ml-1872684668"></a>
### VectorInverse

```ml
function VectorInverse(v)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L176)

<a id="function-function-mq3-shared-math-vectorlength-function-vectorlength-a-src-mq3-shared-math-ml-393753403"></a>
### VectorLength

```ml
function VectorLength(a)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L138)

<a id="function-function-mq3-shared-math-vectorlengthsquared-function-vectorlengthsquared-a-src-mq3-shared-math-ml-177145343"></a>
### VectorLengthSquared

```ml
function VectorLengthSquared(a)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L172)

<a id="function-function-mq3-shared-math-vectorma-function-vectorma-a-scale-b-src-mq3-shared-math-ml-1132874575"></a>
### VectorMA

```ml
function VectorMA(a, scale, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L130)

<a id="function-function-mq3-shared-math-vectornormalize-function-vectornormalize-a-src-mq3-shared-math-ml-617696759"></a>
### VectorNormalize

```ml
function VectorNormalize(a)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L142)

<a id="function-function-mq3-shared-math-vectornormalize2-function-vectornormalize2-a-src-mq3-shared-math-ml-876626439"></a>
### VectorNormalize2

```ml
function VectorNormalize2(a)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L153)

<a id="function-function-mq3-shared-math-vectornormalizefast-function-vectornormalizefast-v-src-mq3-shared-math-ml-1355596498"></a>
### VectorNormalizeFast

```ml
function VectorNormalizeFast(v)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L175)

<a id="function-function-mq3-shared-math-vectorrotate-function-vectorrotate-input-matrix-src-mq3-shared-math-ml-492079781"></a>
### VectorRotate

```ml
function VectorRotate(input, matrix)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — |  |
| `matrix` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L224)

<a id="function-function-mq3-shared-math-vectorscale-function-vectorscale-a-scale-src-mq3-shared-math-ml-1741461739"></a>
### VectorScale

```ml
function VectorScale(a, scale)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `scale` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/shared/math.ml#L134)
