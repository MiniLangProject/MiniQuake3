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
| `normal` | `array` | — |  |
| `mins` | `array` | — |  |
| `maxs` | `array` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/brush.ml#L77)

<a id="extern_function-extern-function-mq3-collision-brush-clipconvexnative-extern-function-clipconvexnative-planes-as-ptr-planebytes-as-i32-ax-as-double-ay-as-double-az-as-double-bx-as-double-by-as-double-bz-as-double-lx-as-double-ly-as-double-lz-as-double-hx-as-double-hy-as-double-hz-as-double-limit-as-double-output-as-bytes-from-miniquake3-qvm-dll-symbol-mq3-trace-convex-brush-returns-i32-src-mq3-collision-brush-ml-572409977"></a>
### clipConvexNative

```ml
extern function clipConvexNative(planes as ptr, planeBytes as i32, ax as double, ay as double, az as double, bx as double, by as double, bz as double, lx as double, ly as double, lz as double, hx as double, hy as double, hz as double, limit as double, output as bytes) from "miniquake3_qvm.dll" symbol "mq3_trace_convex_brush" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `planes` | `ptr` | — |  |
| `planeBytes` | `i32` | — |  |
| `ax` | `double` | — |  |
| `ay` | `double` | — |  |
| `az` | `double` | — |  |
| `bx` | `double` | — |  |
| `by` | `double` | — |  |
| `bz` | `double` | — |  |
| `lx` | `double` | — |  |
| `ly` | `double` | — |  |
| `lz` | `double` | — |  |
| `hx` | `double` | — |  |
| `hy` | `double` | — |  |
| `hz` | `double` | — |  |
| `limit` | `double` | — |  |
| `output` | `bytes` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/brush.ml#L8)

<a id="function-function-mq3-collision-brush-cm-distancefromlinesquared-function-cm-distancefromlinesquared-point-linestart-lineend-direction-src-mq3-collision-brush-ml-1759940554"></a>
### CM_DistanceFromLineSquared

```ml
function CM_DistanceFromLineSquared(point, lineStart, lineEnd, direction)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — |  |
| `lineStart` | `dynamic` | — |  |
| `lineEnd` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/brush.ml#L71)

<a id="function-function-mq3-collision-brush-cm-projectpointontovector-function-cm-projectpointontovector-point-start-direction-src-mq3-collision-brush-ml-938090851"></a>
### CM_ProjectPointOntoVector

```ml
function CM_ProjectPointOntoVector(point, start, direction)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/brush.ml#L70)

<a id="function-function-mq3-collision-brush-cm-tracethroughbrush-function-cm-tracethroughbrush-trace-planes-contents-start-finish-mins-maxs-capsule-radius-capsuleoffset-src-mq3-collision-brush-ml-973708860"></a>
### CM_TraceThroughBrush

```ml
function CM_TraceThroughBrush(trace, planes, contents, start, finish, mins, maxs, capsule, radius, capsuleOffset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `trace` | `dynamic` | — |  |
| `planes` | `dynamic` | — |  |
| `contents` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `capsule` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `capsuleOffset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/brush.ml#L183)

<a id="function-function-mq3-collision-brush-cm-vectordistancesquared-function-cm-vectordistancesquared-a-b-src-mq3-collision-brush-ml-1968195173"></a>
### CM_VectorDistanceSquared

```ml
function CM_VectorDistanceSquared(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/brush.ml#L72)

<a id="function-function-mq3-collision-brush-distancefromlinesquared-function-distancefromlinesquared-point-linestart-lineend-direction-src-mq3-collision-brush-ml-704297218"></a>
### distanceFromLineSquared

```ml
function distanceFromLineSquared(point, lineStart, lineEnd, direction)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — |  |
| `lineStart` | `dynamic` | — |  |
| `lineEnd` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/brush.ml#L45)

<a id="function-function-mq3-collision-brush-emptytrace-function-emptytrace-src-mq3-collision-brush-ml-1896061566"></a>
### emptyTrace

```ml
function emptyTrace()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/brush.ml#L27)

<a id="function-function-mq3-collision-brush-packplanes-function-packplanes-planes-src-mq3-collision-brush-ml-1958392161"></a>
### packPlanes

```ml
function packPlanes(planes)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `planes` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/brush.ml#L96)

- [mq3.collision.brush.Plane](Type-mq3-collision-brush-plane-61311760.md) — struct
<a id="function-function-mq3-collision-brush-projectpointontovector-function-projectpointontovector-point-start-direction-src-mq3-collision-brush-ml-530301161"></a>
### projectPointOntoVector

```ml
function projectPointOntoVector(point, start, direction)
```

BASIC MATH from cm_trace.c.  These stay here beside the brush kernel so capsule primitives and their differential tests share the exact binary32 operation ordering of the original C translation unit.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/brush.ml#L34)

<a id="function-function-mq3-collision-brush-settraceplane-function-settraceplane-trace-plane-src-mq3-collision-brush-ml-214399169"></a>
### setTracePlane

```ml
function setTracePlane(trace, plane)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `trace` | `dynamic` | — |  |
| `plane` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/brush.ml#L85)

<a id="function-function-mq3-collision-brush-squarerootfloat-function-squarerootfloat-number-src-mq3-collision-brush-ml-1920655653"></a>
### SquareRootFloat

```ml
function SquareRootFloat(number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/brush.ml#L73)

<a id="function-function-mq3-collision-brush-squarerootfloat-function-squarerootfloat-number-src-mq3-collision-brush-ml-1835943013"></a>
### squareRootFloat

```ml
function squareRootFloat(number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/brush.ml#L59)

- [mq3.collision.brush.Trace](Type-mq3-collision-brush-trace-408474163.md) — struct
<a id="function-function-mq3-collision-brush-tracepacked-function-tracepacked-trace-planes-packed-contents-start-finish-mins-maxs-scratch-src-mq3-collision-brush-ml-2102787561"></a>
### tracePacked

```ml
function tracePacked(trace, planes, packed, contents, start, finish, mins, maxs, scratch)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `trace` | `dynamic` | — |  |
| `planes` | `dynamic` | — |  |
| `packed` | `dynamic` | — |  |
| `contents` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `scratch` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/brush.ml#L107)

<a id="function-function-mq3-collision-brush-tracethroughbrush-function-tracethroughbrush-trace-planes-contents-start-finish-mins-maxs-capsule-radius-capsuleoffset-src-mq3-collision-brush-ml-216415844"></a>
### traceThroughBrush

```ml
function traceThroughBrush(trace, planes, contents, start, finish, mins, maxs, capsule, radius, capsuleOffset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `trace` | `dynamic` | — |  |
| `planes` | `dynamic` | — |  |
| `contents` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `capsule` | `dynamic` | — |  |
| `radius` | `dynamic` | — |  |
| `capsuleOffset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/brush.ml#L121)

<a id="function-function-mq3-collision-brush-vectordistancesquared-function-vectordistancesquared-a-b-src-mq3-collision-brush-ml-2055336091"></a>
### vectorDistanceSquared

```ml
function vectorDistanceSquared(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/brush.ml#L40)
