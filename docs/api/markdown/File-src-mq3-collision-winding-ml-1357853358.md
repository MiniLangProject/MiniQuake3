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

Compute collision.winding.add as `[n.fadd(a[0], b[0]), n.fadd(a[1], b[1]), n.fadd(a[2], b[2])]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A used in `a[0]` and `a[1]`. |
| `b` | `dynamic` | — | B used in `b[0]` and `b[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L67)

<a id="function-function-mq3-collision-winding-addwindingtoconvexhull-function-addwindingtoconvexhull-points-hull-normal-src-mq3-collision-winding-ml-496075269"></a>
### AddWindingToConvexHull

```ml
function AddWindingToConvexHull(points, hull, normal)
```

Add winding to convex hull in collision.winding; the normal completion returns `hullPoints`.

Validation failures include `AddWindingToConvexHull: point limit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — | Points passed as `points` to `mq3.collision.winding.CopyWinding`. |
| `hull` | `dynamic` | — | Points passed as `points` to `mq3.collision.winding.CopyWinding`. |
| `normal` | `dynamic` | — | A passed as `a` to `mq3.shared.math.CrossProduct`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L282)

<a id="function-function-mq3-collision-winding-allocwinding-function-allocwinding-points-src-mq3-collision-winding-ml-1388790465"></a>
### AllocWinding

```ml
function AllocWinding(points)
```

Managed equivalents of the original zone-allocation helpers. Productive collision code uses plain point arrays; these retain the original lifetime errors for callers that need the explicit AllocWinding/FreeWinding surface.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — | Initial `capacity` field stored in the returned or constructed `mq3.collision.winding.ManagedWinding` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L47)

<a id="function-function-mq3-collision-winding-base-function-base-normal-distance-src-mq3-collision-winding-ml-1198076614"></a>
### base

```ml
function base(normal, distance)
```

Apply `mq3.shared.math.Q_fabs`, `mq3.shared.math.VectorNormalize2`, `mq3.shared.math.VectorMA` for base in collision.winding.

Validation failures include `Winding: no plane axis`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — | B passed as `b` to `mq3.shared.math.VectorMA`. |
| `distance` | `dynamic` | — | Scale passed as `scale` to `mq3.shared.math.VectorScale`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L87)

<a id="function-function-mq3-collision-winding-basewindingforplane-function-basewindingforplane-normal-distance-src-mq3-collision-winding-ml-635948570"></a>
### BaseWindingForPlane

```ml
function BaseWindingForPlane(normal, distance)
```

Return `mq3.collision.winding.base(normal, distance)` from `collision.winding.BaseWindingForPlane`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — | Normal passed as `normal` to `mq3.collision.winding.base`. |
| `distance` | `dynamic` | — | Distance passed as `distance` to `mq3.collision.winding.base`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L164)

<a id="function-function-mq3-collision-winding-bounds-function-bounds-points-src-mq3-collision-winding-ml-787888685"></a>
### bounds

```ml
function bounds(points)
```

Compute bounds in collision.winding; the normal completion returns `[mins, maxs]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — | Sequence traversed as `point` by the loop in `bounds`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L105)

<a id="function-function-mq3-collision-winding-checkwinding-function-checkwinding-points-src-mq3-collision-winding-ml-1861021509"></a>
### CheckWinding

```ml
function CheckWinding(points)
```

Check winding in collision.winding; the normal completion returns `true`.

Validation failures include `CheckWinding: fewer than three points`; `CheckWinding: area below one`; `CheckWinding: bogus range`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — | Points passed as `points` to `mq3.collision.winding.WindingArea`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L247)

<a id="function-function-mq3-collision-winding-chop-function-chop-points-normal-distance-src-mq3-collision-winding-ml-1901693925"></a>
### chop

```ml
function chop(points, normal, distance)
```

Compute chop in collision.winding; the normal completion returns `result`.

Validation failures include `Winding: point limit exceeded`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — | Points used in `points[i]` and `len(points)`. |
| `normal` | `dynamic` | — | Right three-element vector. |
| `distance` | `dynamic` | — | Right floating-point operand. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L315)

<a id="function-function-mq3-collision-winding-chopwinding-function-chopwinding-points-normal-distance-src-mq3-collision-winding-ml-128960417"></a>
### ChopWinding

```ml
function ChopWinding(points, normal, distance)
```

Return `mq3.collision.winding.ChopWindingInPlace(points, normal, distance, ON_EPSILON)` from `collision.winding.ChopWinding`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — | Points passed as `points` to `mq3.collision.winding.ChopWindingInPlace`. |
| `normal` | `dynamic` | — | Normal passed as `normal` to `mq3.collision.winding.ChopWindingInPlace`. |
| `distance` | `dynamic` | — | Distance passed as `distance` to `mq3.collision.winding.ChopWindingInPlace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L241)

<a id="function-function-mq3-collision-winding-chopwindinginplace-function-chopwindinginplace-points-normal-distance-epsilon-src-mq3-collision-winding-ml-985036665"></a>
### ChopWindingInPlace

```ml
function ChopWindingInPlace(points, normal, distance, epsilon)
```

Compute chop winding in place in collision.winding; the normal completion returns `split[0]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — | Points passed as `points` to `mq3.collision.winding.ClipWindingEpsilon`. |
| `normal` | `dynamic` | — | Normal passed as `normal` to `mq3.collision.winding.ClipWindingEpsilon`. |
| `distance` | `dynamic` | — | Distance passed as `distance` to `mq3.collision.winding.ClipWindingEpsilon`. |
| `epsilon` | `dynamic` | — | Epsilon passed as `epsilon` to `mq3.collision.winding.ClipWindingEpsilon`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L234)

<a id="function-function-mq3-collision-winding-classify-function-classify-points-normal-distance-epsilon-src-mq3-collision-winding-ml-999523669"></a>
### classify

```ml
function classify(points, normal, distance, epsilon)
```

Compute classify in collision.winding; the normal completion returns `[dists, sides, counts]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — | Sequence traversed as `point` by the loop in `classify`. |
| `normal` | `dynamic` | — | Right three-element vector. |
| `distance` | `dynamic` | — | Right floating-point operand. |
| `epsilon` | `dynamic` | — | Floating-point value whose binary32 sign is toggled. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L177)

<a id="function-function-mq3-collision-winding-clipwindingepsilon-function-clipwindingepsilon-points-normal-distance-epsilon-src-mq3-collision-winding-ml-1442820301"></a>
### ClipWindingEpsilon

```ml
function ClipWindingEpsilon(points, normal, distance, epsilon)
```

Compute clip winding epsilon in collision.winding; the normal completion returns `[front, back]`.

Validation failures include `ClipWinding: point limit exceeded`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — | Points passed as `points` to `mq3.collision.winding.classify`. |
| `normal` | `dynamic` | — | Normal passed as `normal` to `mq3.collision.winding.classify`. |
| `distance` | `dynamic` | — | Distance passed as `distance` to `mq3.collision.winding.classify`. |
| `epsilon` | `dynamic` | — | Epsilon passed as `epsilon` to `mq3.collision.winding.classify`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L211)

<a id="function-function-mq3-collision-winding-clonepoint-function-clonepoint-value-src-mq3-collision-winding-ml-807931059"></a>
### clonePoint

```ml
function clonePoint(value)
```

Compute collision.winding.clonePoint as `[value[0], value[1], value[2]]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `value[0]` and `value[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L38)

<a id="function-function-mq3-collision-winding-clonepoints-function-clonepoints-points-src-mq3-collision-winding-ml-893662093"></a>
### clonePoints

```ml
function clonePoints(points)
```

Compute clone points in collision.winding; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — | Sequence traversed as `point` by the loop in `clonePoints`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L41)

<a id="function-function-mq3-collision-winding-copywinding-function-copywinding-points-src-mq3-collision-winding-ml-1322916359"></a>
### CopyWinding

```ml
function CopyWinding(points)
```

Return `mq3.collision.winding.clonePoints(points)` from `collision.winding.CopyWinding`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — | Points passed as `points` to `mq3.collision.winding.clonePoints`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L167)

<a id="function-function-mq3-collision-winding-freewinding-function-freewinding-value-src-mq3-collision-winding-ml-672786027"></a>
### FreeWinding

```ml
function FreeWinding(value)
```

Update `value.freed`, `value.points` in collision.winding.

Validation failures include `FreeWinding: freed a freed winding`.
Direct state writes: `value.freed`, `value.points`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `freed`. Updated in place: `freed`, `points`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L56)

- [mq3.collision.winding.ManagedWinding](Type-mq3-collision-winding-managedwinding-2044491277.md) — struct
<a id="constant-constant-mq3-collision-winding-max-hull-points-const-max-hull-points-128-src-mq3-collision-winding-ml-436613020"></a>
### MAX_HULL_POINTS

```ml
const MAX_HULL_POINTS = 128
```

Maximum number of points collected for a debug collision hull.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L24)

<a id="constant-constant-mq3-collision-winding-max-map-bounds-const-max-map-bounds-qcommonheaders-max-map-bounds-src-mq3-collision-winding-ml-575702398"></a>
### MAX_MAP_BOUNDS

```ml
const MAX_MAP_BOUNDS = qcommonHeaders.MAX_MAP_BOUNDS
```

Largest accepted absolute coordinate in a collision winding.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L20)

<a id="constant-constant-mq3-collision-winding-max-points-on-winding-const-max-points-on-winding-qcommonheaders-max-points-on-winding-src-mq3-collision-winding-ml-1745937626"></a>
### MAX_POINTS_ON_WINDING

```ml
const MAX_POINTS_ON_WINDING = qcommonHeaders.MAX_POINTS_ON_WINDING
```

Maximum number of vertices in a clipped winding polygon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L22)

<a id="function-function-mq3-collision-winding-negate-function-negate-a-src-mq3-collision-winding-ml-1277114961"></a>
### negate

```ml
function negate(a)
```

Compute collision.winding.negate as `[n.bitsFloat((n.floatBits(a[0]) ^ 2147483648)), n.bitsFloat((n.floatBits(a[1]) ^ 2147483648)), n.bitsFloat((n.floatBits(a[2]) ^ 2147483648))]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A used in `a[0]` and `a[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L78)

<a id="constant-constant-mq3-collision-winding-on-epsilon-const-on-epsilon-qcommonheaders-on-epsilon-src-mq3-collision-winding-ml-707488423"></a>
### ON_EPSILON

```ml
const ON_EPSILON = qcommonHeaders.ON_EPSILON
```

Distance tolerance for classifying a point as lying on a plane.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L18)

<a id="function-function-mq3-collision-winding-pw-function-pw-points-src-mq3-collision-winding-ml-2039396109"></a>
### pw

```ml
function pw(points)
```

Compute pw in collision.winding; the normal completion returns `lines`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — | Sequence traversed as `point` by the loop in `pw`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L62)

<a id="function-function-mq3-collision-winding-removecolinearpoints-function-removecolinearpoints-points-src-mq3-collision-winding-ml-708717681"></a>
### RemoveColinearPoints

```ml
function RemoveColinearPoints(points)
```

Remove colinear points in collision.winding; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — | Points passed as `points` to `mq3.collision.winding.clonePoints`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L118)

<a id="function-function-mq3-collision-winding-reversewinding-function-reversewinding-points-src-mq3-collision-winding-ml-412618649"></a>
### ReverseWinding

```ml
function ReverseWinding(points)
```

Compute reverse winding in collision.winding; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — | Points used in `len(points)` and `(len(points) - 1)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L170)

<a id="constant-constant-mq3-collision-winding-side-back-const-side-back-qcommonheaders-side-back-src-mq3-collision-winding-ml-1079410656"></a>
### SIDE_BACK

```ml
const SIDE_BACK = qcommonHeaders.SIDE_BACK
```

Plane-classification result for geometry behind the plane.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L12)

<a id="constant-constant-mq3-collision-winding-side-cross-const-side-cross-qcommonheaders-side-cross-src-mq3-collision-winding-ml-994306443"></a>
### SIDE_CROSS

```ml
const SIDE_CROSS = qcommonHeaders.SIDE_CROSS
```

Plane-classification result for geometry crossing the plane.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L16)

<a id="constant-constant-mq3-collision-winding-side-front-const-side-front-qcommonheaders-side-front-src-mq3-collision-winding-ml-1863622804"></a>
### SIDE_FRONT

```ml
const SIDE_FRONT = qcommonHeaders.SIDE_FRONT
```

Plane-classification result for geometry in front of the plane.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L10)

<a id="constant-constant-mq3-collision-winding-side-on-const-side-on-qcommonheaders-side-on-src-mq3-collision-winding-ml-1182723294"></a>
### SIDE_ON

```ml
const SIDE_ON = qcommonHeaders.SIDE_ON
```

Plane-classification result for geometry within the plane tolerance.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L14)

<a id="function-function-mq3-collision-winding-splitpoint-function-splitpoint-p1-p2-d1-d2-normal-distance-src-mq3-collision-winding-ml-1952884058"></a>
### splitPoint

```ml
function splitPoint(p1, p2, d1, d2, normal, distance)
```

Compute split point in collision.winding; the normal completion returns `mid`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p1` | `dynamic` | — | P 1 used in `p1[axis]` and `n.fsub(p2[axis], p1[axis])`. |
| `p2` | `dynamic` | — | P 2 used in `p2[axis]` and `n.fsub(p2[axis], p1[axis])`. |
| `d1` | `dynamic` | — | Left floating-point operand. |
| `d2` | `dynamic` | — | Right floating-point operand. |
| `normal` | `dynamic` | — | Normal used in `normal[axis]` and `(normal[axis] == 1.0)`. |
| `distance` | `dynamic` | — | Floating-point value whose binary32 sign is toggled. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L194)

<a id="function-function-mq3-collision-winding-subtract-function-subtract-a-b-src-mq3-collision-winding-ml-680272937"></a>
### subtract

```ml
function subtract(a, b)
```

Compute collision.winding.subtract as `[n.fsub(a[0], b[0]), n.fsub(a[1], b[1]), n.fsub(a[2], b[2])]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A used in `a[0]` and `a[1]`. |
| `b` | `dynamic` | — | B used in `b[0]` and `b[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L73)

<a id="function-function-mq3-collision-winding-windingarea-function-windingarea-points-src-mq3-collision-winding-ml-280797611"></a>
### WindingArea

```ml
function WindingArea(points)
```

Compute winding area in collision.winding; the normal completion returns `total`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — | Points used in `points[0]` and `points[i]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L141)

<a id="function-function-mq3-collision-winding-windingbounds-function-windingbounds-points-src-mq3-collision-winding-ml-1572316771"></a>
### WindingBounds

```ml
function WindingBounds(points)
```

Return `mq3.collision.winding.bounds(points)` from `collision.winding.WindingBounds`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — | Points passed as `points` to `mq3.collision.winding.bounds`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L152)

<a id="function-function-mq3-collision-winding-windingcenter-function-windingcenter-points-src-mq3-collision-winding-ml-1683898435"></a>
### WindingCenter

```ml
function WindingCenter(points)
```

Compute winding center in collision.winding; the normal completion returns `q.VectorScale(center, n.fdiv(1.0, n.f32(len(points))))`.

Validation failures include `WindingCenter: empty winding`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — | Points used in `len(points)` and `(len(points) == 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L157)

<a id="function-function-mq3-collision-winding-windingonplaneside-function-windingonplaneside-points-normal-distance-src-mq3-collision-winding-ml-10077789"></a>
### WindingOnPlaneSide

```ml
function WindingOnPlaneSide(points, normal, distance)
```

Compute winding on plane side in collision.winding; the normal completion returns `SIDE_ON`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — | Sequence traversed as `point` by the loop in `WindingOnPlaneSide`. |
| `normal` | `dynamic` | — | Right three-element vector. |
| `distance` | `dynamic` | — | Right floating-point operand. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L266)

<a id="function-function-mq3-collision-winding-windingplane-function-windingplane-points-src-mq3-collision-winding-ml-637177445"></a>
### WindingPlane

```ml
function WindingPlane(points)
```

Compute winding plane in collision.winding; the normal completion returns `[normal, q.DotProduct(points[0], normal)]`.

Validation failures include `WindingPlane: fewer than three points`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `points` | `dynamic` | — | Points used in `points[1]` and `points[0]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/winding.ml#L133)
