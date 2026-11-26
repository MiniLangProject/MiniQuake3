# `src/mq3/collision/winding.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.collision.winding`](Package-mq3-collision-winding-1127404278.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/qcommon/headers.ml` as `qcommonHeaders` → [src/mq3/qcommon/headers.ml](File-src-mq3-qcommon-headers-ml-405080448.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-collision-winding-add-function-add-a-b-src-mq3-collision-winding-ml-20042139"></a>
### add

```ml
function add(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L36)

<a id="function-function-mq3-collision-winding-addwindingtoconvexhull-function-addwindingtoconvexhull-points-hull-normal-src-mq3-collision-winding-ml-496075269"></a>
### AddWindingToConvexHull

```ml
function AddWindingToConvexHull(points, hull, normal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — |  |
| `hull` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L176)

<a id="function-function-mq3-collision-winding-allocwinding-function-allocwinding-points-src-mq3-collision-winding-ml-1388790465"></a>
### AllocWinding

```ml
function AllocWinding(points)
```

Managed equivalents of the original zone-allocation helpers. Productive collision code uses plain point arrays; these retain the original lifetime errors for callers that need the explicit AllocWinding/FreeWinding surface.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L26)

<a id="function-function-mq3-collision-winding-base-function-base-normal-distance-src-mq3-collision-winding-ml-1198076614"></a>
### base

```ml
function base(normal, distance)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — |  |
| `distance` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L46)

<a id="function-function-mq3-collision-winding-basewindingforplane-function-basewindingforplane-normal-distance-src-mq3-collision-winding-ml-635948570"></a>
### BaseWindingForPlane

```ml
function BaseWindingForPlane(normal, distance)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — |  |
| `distance` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L104)

<a id="function-function-mq3-collision-winding-bounds-function-bounds-points-src-mq3-collision-winding-ml-787888685"></a>
### bounds

```ml
function bounds(points)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L62)

<a id="function-function-mq3-collision-winding-checkwinding-function-checkwinding-points-src-mq3-collision-winding-ml-1861021509"></a>
### CheckWinding

```ml
function CheckWinding(points)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L151)

<a id="function-function-mq3-collision-winding-chop-function-chop-points-normal-distance-src-mq3-collision-winding-ml-1901693925"></a>
### chop

```ml
function chop(points, normal, distance)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `distance` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L203)

<a id="function-function-mq3-collision-winding-chopwinding-function-chopwinding-points-normal-distance-src-mq3-collision-winding-ml-128960417"></a>
### ChopWinding

```ml
function ChopWinding(points, normal, distance)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `distance` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L149)

<a id="function-function-mq3-collision-winding-chopwindinginplace-function-chopwindinginplace-points-normal-distance-epsilon-src-mq3-collision-winding-ml-985036665"></a>
### ChopWindingInPlace

```ml
function ChopWindingInPlace(points, normal, distance, epsilon)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `distance` | `dynamic` | — |  |
| `epsilon` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L146)

<a id="function-function-mq3-collision-winding-classify-function-classify-points-normal-distance-epsilon-src-mq3-collision-winding-ml-999523669"></a>
### classify

```ml
function classify(points, normal, distance, epsilon)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `distance` | `dynamic` | — |  |
| `epsilon` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L108)

<a id="function-function-mq3-collision-winding-clipwindingepsilon-function-clipwindingepsilon-points-normal-distance-epsilon-src-mq3-collision-winding-ml-1442820301"></a>
### ClipWindingEpsilon

```ml
function ClipWindingEpsilon(points, normal, distance, epsilon)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `distance` | `dynamic` | — |  |
| `epsilon` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L128)

<a id="function-function-mq3-collision-winding-clonepoint-function-clonepoint-value-src-mq3-collision-winding-ml-807931059"></a>
### clonePoint

```ml
function clonePoint(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L20)

<a id="function-function-mq3-collision-winding-clonepoints-function-clonepoints-points-src-mq3-collision-winding-ml-893662093"></a>
### clonePoints

```ml
function clonePoints(points)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L21)

<a id="function-function-mq3-collision-winding-copywinding-function-copywinding-points-src-mq3-collision-winding-ml-1322916359"></a>
### CopyWinding

```ml
function CopyWinding(points)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L105)

<a id="function-function-mq3-collision-winding-freewinding-function-freewinding-value-src-mq3-collision-winding-ml-672786027"></a>
### FreeWinding

```ml
function FreeWinding(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L30)

- [mq3.collision.winding.ManagedWinding](Type-mq3-collision-winding-managedwinding-2044491277.md) — struct
<a id="constant-constant-mq3-collision-winding-max-hull-points-const-max-hull-points-128-src-mq3-collision-winding-ml-436613020"></a>
### MAX_HULL_POINTS

```ml
const MAX_HULL_POINTS = 128
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L16)

<a id="constant-constant-mq3-collision-winding-max-map-bounds-const-max-map-bounds-qcommonheaders-max-map-bounds-src-mq3-collision-winding-ml-575702398"></a>
### MAX_MAP_BOUNDS

```ml
const MAX_MAP_BOUNDS = qcommonHeaders.MAX_MAP_BOUNDS
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L14)

<a id="constant-constant-mq3-collision-winding-max-points-on-winding-const-max-points-on-winding-qcommonheaders-max-points-on-winding-src-mq3-collision-winding-ml-1745937626"></a>
### MAX_POINTS_ON_WINDING

```ml
const MAX_POINTS_ON_WINDING = qcommonHeaders.MAX_POINTS_ON_WINDING
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L15)

<a id="function-function-mq3-collision-winding-negate-function-negate-a-src-mq3-collision-winding-ml-1277114961"></a>
### negate

```ml
function negate(a)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L42)

<a id="constant-constant-mq3-collision-winding-on-epsilon-const-on-epsilon-qcommonheaders-on-epsilon-src-mq3-collision-winding-ml-707488423"></a>
### ON_EPSILON

```ml
const ON_EPSILON = qcommonHeaders.ON_EPSILON
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L13)

<a id="function-function-mq3-collision-winding-pw-function-pw-points-src-mq3-collision-winding-ml-2039396109"></a>
### pw

```ml
function pw(points)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L34)

<a id="function-function-mq3-collision-winding-removecolinearpoints-function-removecolinearpoints-points-src-mq3-collision-winding-ml-708717681"></a>
### RemoveColinearPoints

```ml
function RemoveColinearPoints(points)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L73)

<a id="function-function-mq3-collision-winding-reversewinding-function-reversewinding-points-src-mq3-collision-winding-ml-412618649"></a>
### ReverseWinding

```ml
function ReverseWinding(points)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L106)

<a id="constant-constant-mq3-collision-winding-side-back-const-side-back-qcommonheaders-side-back-src-mq3-collision-winding-ml-1079410656"></a>
### SIDE_BACK

```ml
const SIDE_BACK = qcommonHeaders.SIDE_BACK
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L10)

<a id="constant-constant-mq3-collision-winding-side-cross-const-side-cross-qcommonheaders-side-cross-src-mq3-collision-winding-ml-994306443"></a>
### SIDE_CROSS

```ml
const SIDE_CROSS = qcommonHeaders.SIDE_CROSS
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L12)

<a id="constant-constant-mq3-collision-winding-side-front-const-side-front-qcommonheaders-side-front-src-mq3-collision-winding-ml-1863622804"></a>
### SIDE_FRONT

```ml
const SIDE_FRONT = qcommonHeaders.SIDE_FRONT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L9)

<a id="constant-constant-mq3-collision-winding-side-on-const-side-on-qcommonheaders-side-on-src-mq3-collision-winding-ml-1182723294"></a>
### SIDE_ON

```ml
const SIDE_ON = qcommonHeaders.SIDE_ON
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L11)

<a id="function-function-mq3-collision-winding-splitpoint-function-splitpoint-p1-p2-d1-d2-normal-distance-src-mq3-collision-winding-ml-1952884058"></a>
### splitPoint

```ml
function splitPoint(p1, p2, d1, d2, normal, distance)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p1` | `dynamic` | — |  |
| `p2` | `dynamic` | — |  |
| `d1` | `dynamic` | — |  |
| `d2` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `distance` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L118)

<a id="function-function-mq3-collision-winding-subtract-function-subtract-a-b-src-mq3-collision-winding-ml-680272937"></a>
### subtract

```ml
function subtract(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L39)

<a id="function-function-mq3-collision-winding-windingarea-function-windingarea-points-src-mq3-collision-winding-ml-280797611"></a>
### WindingArea

```ml
function WindingArea(points)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L90)

<a id="function-function-mq3-collision-winding-windingbounds-function-windingbounds-points-src-mq3-collision-winding-ml-1572316771"></a>
### WindingBounds

```ml
function WindingBounds(points)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L99)

<a id="function-function-mq3-collision-winding-windingcenter-function-windingcenter-points-src-mq3-collision-winding-ml-1683898435"></a>
### WindingCenter

```ml
function WindingCenter(points)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L100)

<a id="function-function-mq3-collision-winding-windingonplaneside-function-windingonplaneside-points-normal-distance-src-mq3-collision-winding-ml-10077789"></a>
### WindingOnPlaneSide

```ml
function WindingOnPlaneSide(points, normal, distance)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |
| `distance` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L166)

<a id="function-function-mq3-collision-winding-windingplane-function-windingplane-points-src-mq3-collision-winding-ml-637177445"></a>
### WindingPlane

```ml
function WindingPlane(points)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L84)
