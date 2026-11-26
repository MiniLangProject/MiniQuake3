# `src/mq3/collision/brush.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.collision.brush`](Package-mq3-collision-brush-2045527092.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-collision-brush-boxsupportdot-function-boxsupportdot-normal-as-array-mins-as-array-maxs-as-array-src-mq3-collision-brush-ml-1068987722"></a>
### boxSupportDot

```ml
function boxSupportDot(normal as array, mins as array, maxs as array)
```

The support point is consumed by one dot product. Keep the coordinates scalar so clipping a brush does not allocate a corner for every plane.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `array` | — | Normal used in `normal[0]` and `normal[1]`. |
| `mins` | `array` | — | Mins used in `mins[0]` and `mins[1]`. |
| `maxs` | `array` | — | Maxs used in `maxs[0]` and `maxs[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/brush.ml#L128)

<a id="extern_function-extern-function-mq3-collision-brush-clipconvexnative-extern-function-clipconvexnative-planes-as-ptr-planebytes-as-i32-ax-as-double-ay-as-double-az-as-double-bx-as-double-by-as-double-bz-as-double-lx-as-double-ly-as-double-lz-as-double-hx-as-double-hy-as-double-hz-as-double-limit-as-double-output-as-bytes-from-miniquake3-qvm-dll-symbol-mq3-trace-convex-brush-returns-i32-src-mq3-collision-brush-ml-572409977"></a>
### clipConvexNative

```ml
extern function clipConvexNative(planes as ptr, planeBytes as i32, ax as double, ay as double, az as double, bx as double, by as double, bz as double, lx as double, ly as double, lz as double, hx as double, hy as double, hz as double, limit as double, output as bytes) from "miniquake3_qvm.dll" symbol "mq3_trace_convex_brush" returns i32
```

Clip a swept box against packed convex-brush planes using strict binary32 arithmetic.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `planes` | `ptr` | — | Read-only normal/distance records, four binary32 values per plane. |
| `planeBytes` | `i32` | — | Packed-plane byte length, divisible by 16. |
| `ax` | `double` | — | X component of the sweep start. |
| `ay` | `double` | — | Y component of the sweep start. |
| `az` | `double` | — | Z component of the sweep start. |
| `bx` | `double` | — | X component of the sweep end. |
| `by` | `double` | — | Y component of the sweep end. |
| `bz` | `double` | — | Z component of the sweep end. |
| `lx` | `double` | — | X component of the moving box minimum. |
| `ly` | `double` | — | Y component of the moving box minimum. |
| `lz` | `double` | — | Z component of the moving box minimum. |
| `hx` | `double` | — | X component of the moving box maximum. |
| `hy` | `double` | — | Y component of the moving box maximum. |
| `hz` | `double` | — | Z component of the moving box maximum. |
| `limit` | `double` | — | Current nearest-hit fraction limiting the sweep. |
| `output` | `bytes` | — | Writable buffer for the binary32 collision fraction when a hit is reported. |


**Returns:** The native brush-classification status; a negative result rejects invalid input, and statuses at least 3 also write the hit fraction.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/brush.ml#L26)

<a id="function-function-mq3-collision-brush-cm-distancefromlinesquared-function-cm-distancefromlinesquared-point-linestart-lineend-direction-src-mq3-collision-brush-ml-1759940554"></a>
### CM_DistanceFromLineSquared

```ml
function CM_DistanceFromLineSquared(point, lineStart, lineEnd, direction)
```

Return `mq3.collision.brush.distanceFromLineSquared(point, lineStart, lineEnd, direction)` from `collision.brush.CM_DistanceFromLineSquared`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — | Point passed as `point` to `mq3.collision.brush.distanceFromLineSquared`. |
| `lineStart` | `dynamic` | — | Line start passed as `lineStart` to `mq3.collision.brush.distanceFromLineSquared`. |
| `lineEnd` | `dynamic` | — | Line end passed as `lineEnd` to `mq3.collision.brush.distanceFromLineSquared`. |
| `direction` | `dynamic` | — | Direction passed as `direction` to `mq3.collision.brush.distanceFromLineSquared`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/brush.ml#L114)

<a id="function-function-mq3-collision-brush-cm-projectpointontovector-function-cm-projectpointontovector-point-start-direction-src-mq3-collision-brush-ml-938090851"></a>
### CM_ProjectPointOntoVector

```ml
function CM_ProjectPointOntoVector(point, start, direction)
```

Return `mq3.collision.brush.projectPointOntoVector(point, start, direction)` from `collision.brush.CM_ProjectPointOntoVector`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — | Point passed as `point` to `mq3.collision.brush.projectPointOntoVector`. |
| `start` | `dynamic` | — | Start passed as `start` to `mq3.collision.brush.projectPointOntoVector`. |
| `direction` | `dynamic` | — | Direction passed as `direction` to `mq3.collision.brush.projectPointOntoVector`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/brush.ml#L108)

<a id="function-function-mq3-collision-brush-cm-tracethroughbrush-function-cm-tracethroughbrush-trace-planes-contents-start-finish-mins-maxs-capsule-radius-capsuleoffset-src-mq3-collision-brush-ml-973708860"></a>
### CM_TraceThroughBrush

```ml
function CM_TraceThroughBrush(trace, planes, contents, start, finish, mins, maxs, capsule, radius, capsuleOffset)
```

Return `mq3.collision.brush.traceThroughBrush(trace, planes, contents, start, finish, mins, maxs, capsule, radius, capsuleOffset)` from `collision.brush.CM_TraceThroughBrush`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `trace` | `dynamic` | — | Trace passed as `trace` to `mq3.collision.brush.traceThroughBrush`. |
| `planes` | `dynamic` | — | Planes passed as `planes` to `mq3.collision.brush.traceThroughBrush`. |
| `contents` | `dynamic` | — | Contents passed as `contents` to `mq3.collision.brush.traceThroughBrush`. |
| `start` | `dynamic` | — | Start passed as `start` to `mq3.collision.brush.traceThroughBrush`. |
| `finish` | `dynamic` | — | Finish passed as `finish` to `mq3.collision.brush.traceThroughBrush`. |
| `mins` | `dynamic` | — | Mins passed as `mins` to `mq3.collision.brush.traceThroughBrush`. |
| `maxs` | `dynamic` | — | Maxs passed as `maxs` to `mq3.collision.brush.traceThroughBrush`. |
| `capsule` | `dynamic` | — | Capsule passed as `capsule` to `mq3.collision.brush.traceThroughBrush`. |
| `radius` | `dynamic` | — | Radius passed as `radius` to `mq3.collision.brush.traceThroughBrush`. |
| `capsuleOffset` | `dynamic` | — | Capsule offset passed as `capsuleOffset` to `mq3.collision.brush.traceThroughBrush`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/brush.ml#L277)

<a id="function-function-mq3-collision-brush-cm-vectordistancesquared-function-cm-vectordistancesquared-a-b-src-mq3-collision-brush-ml-1968195173"></a>
### CM_VectorDistanceSquared

```ml
function CM_VectorDistanceSquared(a, b)
```

Return `mq3.collision.brush.vectorDistanceSquared(a, b)` from `collision.brush.CM_VectorDistanceSquared`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A passed as `a` to `mq3.collision.brush.vectorDistanceSquared`. |
| `b` | `dynamic` | — | B passed as `b` to `mq3.collision.brush.vectorDistanceSquared`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/brush.ml#L118)

<a id="function-function-mq3-collision-brush-distancefromlinesquared-function-distancefromlinesquared-point-linestart-lineend-direction-src-mq3-collision-brush-ml-704297218"></a>
### distanceFromLineSquared

```ml
function distanceFromLineSquared(point, lineStart, lineEnd, direction)
```

Compute distance from line squared in collision.brush; the normal completion returns `q.DotProduct(delta, delta)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — | Point passed as `point` to `mq3.collision.brush.projectPointOntoVector`. |
| `lineStart` | `dynamic` | — | Start passed as `start` to `mq3.collision.brush.projectPointOntoVector`. |
| `lineEnd` | `dynamic` | — | Line end used in `lineEnd[axis]` and `lineEnd[outside]`. |
| `direction` | `dynamic` | — | Direction passed as `direction` to `mq3.collision.brush.projectPointOntoVector`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/brush.ml#L77)

<a id="function-function-mq3-collision-brush-emptytrace-function-emptytrace-src-mq3-collision-brush-ml-1896061566"></a>
### emptyTrace

```ml
function emptyTrace()
```

Create `mq3.collision.brush.Trace` with fraction=n.f32(1); normal=[0.0, 0.0, 0.0]; distance=0.0; surfaceFlags=0; contents=0; startsolid=false; allsolid=false; planeMetadata=0.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/brush.ml#L48)

<a id="function-function-mq3-collision-brush-packplanes-function-packplanes-planes-src-mq3-collision-brush-ml-1958392161"></a>
### packPlanes

```ml
function packPlanes(planes)
```

Compute pack planes in collision.brush; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `planes` | `dynamic` | — | Planes used in `len(planes)` and `(len(planes) * 16)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/brush.ml#L154)

- [mq3.collision.brush.Plane](Type-mq3-collision-brush-plane-61311760.md) — struct
<a id="function-function-mq3-collision-brush-projectpointontovector-function-projectpointontovector-point-start-direction-src-mq3-collision-brush-ml-530301161"></a>
### projectPointOntoVector

```ml
function projectPointOntoVector(point, start, direction)
```

BASIC MATH from cm_trace.c.  These stay here beside the brush kernel so capsule primitives and their differential tests share the exact binary32 operation ordering of the original C translation unit.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — | Point used in `point[0]` and `point[1]`. |
| `start` | `dynamic` | — | A passed as `a` to `mq3.shared.math.VectorMA`. |
| `direction` | `dynamic` | — | Right three-element vector. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/brush.ml#L58)

<a id="function-function-mq3-collision-brush-settraceplane-function-settraceplane-trace-plane-src-mq3-collision-brush-ml-214399169"></a>
### setTracePlane

```ml
function setTracePlane(trace, plane)
```

Set trace plane in collision.brush; updates `trace.normal`, `trace.distance`, `trace.surfaceFlags`.

Direct state writes: `trace.normal`, `trace.distance`, `trace.surfaceFlags`, `trace.planeMetadata`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `trace` | `dynamic` | — | Updated in place: `normal`, `distance`, `surfaceFlags`, `planeMetadata`. |
| `plane` | `dynamic` | — | Record exposing `normal`, `distance`, `flags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/brush.ml#L141)

<a id="function-function-mq3-collision-brush-squarerootfloat-function-squarerootfloat-number-src-mq3-collision-brush-ml-1920655653"></a>
### SquareRootFloat

```ml
function SquareRootFloat(number)
```

Return `mq3.collision.brush.squareRootFloat(number)` from `collision.brush.SquareRootFloat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — | Number passed as `number` to `mq3.collision.brush.squareRootFloat`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/brush.ml#L121)

<a id="function-function-mq3-collision-brush-squarerootfloat-function-squarerootfloat-number-src-mq3-collision-brush-ml-1835943013"></a>
### squareRootFloat

```ml
function squareRootFloat(number)
```

Compute square root float in collision.brush; the normal completion returns `n.fmul(number, y)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — | Left floating-point operand. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/brush.ml#L93)

- [mq3.collision.brush.Trace](Type-mq3-collision-brush-trace-408474163.md) — struct
<a id="function-function-mq3-collision-brush-tracepacked-function-tracepacked-trace-planes-packed-contents-start-finish-mins-maxs-scratch-src-mq3-collision-brush-ml-2102787561"></a>
### tracePacked

```ml
function tracePacked(trace, planes, packed, contents, start, finish, mins, maxs, scratch)
```

Trace packed in collision.brush; the normal completion returns `trace`.

Direct state writes: `trace.startsolid`, `trace.allsolid`, `trace.fraction`, `trace.contents`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `trace` | `dynamic` | — | Record exposing `fraction`. Updated in place: `startsolid`, `allsolid`, `fraction`, `contents`. |
| `planes` | `dynamic` | — | Planes passed as `planes` to `mq3.collision.brush.traceThroughBrush`. |
| `packed` | `dynamic` | — | Packed used in `len(packed)` and `nativeBytesPtr(packed)`. |
| `contents` | `dynamic` | — | Contents passed as `contents` to `mq3.collision.brush.traceThroughBrush`. |
| `start` | `dynamic` | — | Start passed as `start` to `mq3.collision.brush.traceThroughBrush`. |
| `finish` | `dynamic` | — | Finish passed as `finish` to `mq3.collision.brush.traceThroughBrush`. |
| `mins` | `dynamic` | — | Mins passed as `mins` to `mq3.collision.brush.traceThroughBrush`. |
| `maxs` | `dynamic` | — | Maxs passed as `maxs` to `mq3.collision.brush.traceThroughBrush`. |
| `scratch` | `dynamic` | — | Writable buffer for the binary32 collision fraction when a hit is reported. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/brush.ml#L177)

<a id="function-function-mq3-collision-brush-tracethroughbrush-function-tracethroughbrush-trace-planes-contents-start-finish-mins-maxs-capsule-radius-capsuleoffset-src-mq3-collision-brush-ml-216415844"></a>
### traceThroughBrush

```ml
function traceThroughBrush(trace, planes, contents, start, finish, mins, maxs, capsule, radius, capsuleOffset)
```

Trace through brush in collision.brush; the normal completion returns `trace`.

Direct state writes: `trace.startsolid`, `trace.allsolid`, `trace.fraction`, `trace.contents`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `trace` | `dynamic` | — | Record exposing `fraction`. Updated in place: `startsolid`, `allsolid`, `fraction`, `contents`. |
| `planes` | `dynamic` | — | Planes used in `len(planes)` and `(len(planes) == 0)`. |
| `contents` | `dynamic` | — | Contents operand used by `traceThroughBrush`; its reads are shown in the implementation. |
| `start` | `dynamic` | — | Left three-element vector. |
| `finish` | `dynamic` | — | Left three-element vector. |
| `mins` | `dynamic` | — | Mins passed as `mins` to `mq3.collision.brush.boxSupportDot`. |
| `maxs` | `dynamic` | — | Maxs passed as `maxs` to `mq3.collision.brush.boxSupportDot`. |
| `capsule` | `dynamic` | — | Capsule operand used by `traceThroughBrush`; its reads are shown in the implementation. |
| `radius` | `dynamic` | — | Right floating-point operand. |
| `capsuleOffset` | `dynamic` | — | Right three-element vector. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/brush.ml#L204)

<a id="function-function-mq3-collision-brush-vectordistancesquared-function-vectordistancesquared-a-b-src-mq3-collision-brush-ml-2055336091"></a>
### vectorDistanceSquared

```ml
function vectorDistanceSquared(a, b)
```

Compute vector distance squared in collision.brush; the normal completion returns `q.DotProduct(delta, delta)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A used in `a[0]` and `a[1]`. |
| `b` | `dynamic` | — | B used in `b[0]` and `b[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/brush.ml#L67)
