# `src/mq3/collision/patchtrace.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.collision.patchtrace`](Package-mq3-collision-patchtrace-89478623.md)

Reachable from entry: **yes**

## Imports

- `mq3/collision/patchmesh.ml` as `mesh` → [src/mq3/collision/patchmesh.ml](File-src-mq3-collision-patchmesh-ml-245132781.md)
- `mq3/collision/winding.ml` as `w` → [src/mq3/collision/winding.ml](File-src-mq3-collision-winding-ml-1357853358.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/qcommon/headers.ml` as `qcommonHeaders` → [src/mq3/qcommon/headers.ml](File-src-mq3-qcommon-headers-ml-405080448.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-collision-patchtrace-adjusted-function-adjusted-work-original-inward-border-src-mq3-collision-patchtrace-ml-1836226187"></a>
### adjusted

```ml
function adjusted(work, original, inward, border)
```

Compute adjusted in collision.patchtrace; the normal completion returns `Adjusted(mesh.Plane(normal, distance, p.signbits), a, b)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Record exposing `start`, `finish`, `capsule`, `radius`, `capsuleOffset`. |
| `original` | `dynamic` | — | Record exposing `signbits`. |
| `inward` | `dynamic` | — | Inward operand used by `adjusted`; its reads are shown in the implementation. |
| `border` | `dynamic` | — | Border operand used by `adjusted`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchtrace.ml#L72)

- [mq3.collision.patchtrace.Adjusted](Type-mq3-collision-patchtrace-adjusted-1193895741.md) — struct
<a id="function-function-mq3-collision-patchtrace-checkplane-function-checkplane-adjusted-clip-src-mq3-collision-patchtrace-ml-768337312"></a>
### checkPlane

```ml
function checkPlane(adjusted, clip)
```

Check plane in collision.patchtrace; the normal completion returns `true`.

Direct state writes: `clip.hit`, `clip.enter`, `clip.leave`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adjusted` | `dynamic` | — | Record exposing `plane`, `start`, `finish`. |
| `clip` | `dynamic` | — | Record exposing `enter`, `leave`. Updated in place: `hit`, `enter`, `leave`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchtrace.ml#L95)

- [mq3.collision.patchtrace.Clip](Type-mq3-collision-patchtrace-clip-921546117.md) — struct
<a id="function-function-mq3-collision-patchtrace-cm-checkfacetplane-function-cm-checkfacetplane-adjusted-clip-src-mq3-collision-patchtrace-ml-332715564"></a>
### CM_CheckFacetPlane

```ml
function CM_CheckFacetPlane(adjusted, clip)
```

Return `mq3.collision.patchtrace.checkPlane(adjusted, clip)` from `collision.patchtrace.CM_CheckFacetPlane`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adjusted` | `dynamic` | — | Adjusted passed as `adjusted` to `mq3.collision.patchtrace.checkPlane`. |
| `clip` | `dynamic` | — | Clip passed as `clip` to `mq3.collision.patchtrace.checkPlane`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchtrace.ml#L116)

<a id="function-function-mq3-collision-patchtrace-cm-clearlevelpatches-function-cm-clearlevelpatches-src-mq3-collision-patchtrace-ml-1323472252"></a>
### CM_ClearLevelPatches

```ml
function CM_ClearLevelPatches()
```

Create `mq3.collision.patchtrace.DebugState` with patch=void; facet=- 1.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchtrace.ml#L38)

<a id="function-function-mq3-collision-patchtrace-cm-drawdebugsurface-function-cm-drawdebugsurface-state-src-mq3-collision-patchtrace-ml-117816511"></a>
### CM_DrawDebugSurface

```ml
function CM_DrawDebugSurface(state)
```

Compute draw debug surface in collision.patchtrace; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `patch`, `facet`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchtrace.ml#L41)

<a id="function-function-mq3-collision-patchtrace-cm-positiontestinpatchcollide-function-cm-positiontestinpatchcollide-work-patch-src-mq3-collision-patchtrace-ml-2130630383"></a>
### CM_PositionTestInPatchCollide

```ml
function CM_PositionTestInPatchCollide(work, patch)
```

Return `mq3.collision.patchtrace.positionTest(work, patch)` from `collision.patchtrace.CM_PositionTestInPatchCollide`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Work passed as `work` to `mq3.collision.patchtrace.positionTest`. |
| `patch` | `dynamic` | — | Patch passed as `patch` to `mq3.collision.patchtrace.positionTest`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchtrace.ml#L226)

<a id="function-function-mq3-collision-patchtrace-cm-tracepointthroughpatchcollide-function-cm-tracepointthroughpatchcollide-work-patch-playercurveclip-src-mq3-collision-patchtrace-ml-757991167"></a>
### CM_TracePointThroughPatchCollide

```ml
function CM_TracePointThroughPatchCollide(work, patch, playerCurveClip)
```

Return `mq3.collision.patchtrace.tracePoint(work, patch, playerCurveClip)` from `collision.patchtrace.CM_TracePointThroughPatchCollide`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Work passed as `work` to `mq3.collision.patchtrace.tracePoint`. |
| `patch` | `dynamic` | — | Patch passed as `patch` to `mq3.collision.patchtrace.tracePoint`. |
| `playerCurveClip` | `dynamic` | — | Player curve clip passed as `playerCurveClip` to `mq3.collision.patchtrace.tracePoint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchtrace.ml#L170)

<a id="function-function-mq3-collision-patchtrace-cm-tracethroughpatchcollide-function-cm-tracethroughpatchcollide-work-patch-playercurveclip-src-mq3-collision-patchtrace-ml-212994473"></a>
### CM_TraceThroughPatchCollide

```ml
function CM_TraceThroughPatchCollide(work, patch, playerCurveClip)
```

Return `mq3.collision.patchtrace.trace(work, patch, playerCurveClip)` from `collision.patchtrace.CM_TraceThroughPatchCollide`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Work passed as `work` to `mq3.collision.patchtrace.trace`. |
| `patch` | `dynamic` | — | Patch passed as `patch` to `mq3.collision.patchtrace.trace`. |
| `playerCurveClip` | `dynamic` | — | Player curve clip passed as `playerCurveClip` to `mq3.collision.patchtrace.trace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchtrace.ml#L203)

<a id="function-function-mq3-collision-patchtrace-cornerdot-function-cornerdot-work-signbits-as-int-normal-as-array-returns-float-src-mq3-collision-patchtrace-ml-734604248"></a>
### cornerDot

```ml
function cornerDot(work, signbits as int, normal as array) returns float
```

Project the box support corner selected by the plane sign bits onto the plane normal.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Trace work record with three-element mins and maxs bounds. |
| `signbits` | `int` | — | Low three bits select maxs instead of mins for X, Y, and Z. |
| `normal` | `array` | — | Three-element plane-normal vector. |


**Returns:** The binary32 dot product of the selected corner and the normal.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchtrace.ml#L59)

- [mq3.collision.patchtrace.DebugState](Type-mq3-collision-patchtrace-debugstate-763828607.md) — struct
<a id="function-function-mq3-collision-patchtrace-positiontest-function-positiontest-work-patch-src-mq3-collision-patchtrace-ml-861045993"></a>
### positionTest

```ml
function positionTest(work, patch)
```

Test position test in collision.patchtrace; the normal completion returns `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Record exposing `isPoint`. |
| `patch` | `dynamic` | — | Record exposing `facets`, `planes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchtrace.ml#L208)

<a id="function-function-mq3-collision-patchtrace-trace-function-trace-work-patch-playercurveclip-src-mq3-collision-patchtrace-ml-844192801"></a>
### trace

```ml
function trace(work, patch, playerCurveClip)
```

Trace patchtrace in collision.patchtrace.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Record exposing `isPoint`, `trace`. |
| `patch` | `dynamic` | — | Record exposing `facets`, `planes`. |
| `playerCurveClip` | `dynamic` | — | Player curve clip passed as `playerCurveClip` to `mq3.collision.patchtrace.CM_TracePointThroughPatchCollide`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchtrace.ml#L176)

<a id="function-function-mq3-collision-patchtrace-tracepoint-function-tracepoint-work-patch-playercurveclip-src-mq3-collision-patchtrace-ml-989481203"></a>
### tracePoint

```ml
function tracePoint(work, patch, playerCurveClip)
```

Trace point in collision.patchtrace.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — | Record exposing `isPoint`, `start`, `finish`, `trace`. |
| `patch` | `dynamic` | — | Record exposing `planes`, `facets`. |
| `playerCurveClip` | `dynamic` | — | Player curve clip used in `(not playerCurveClip or not work.isPoint)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchtrace.ml#L122)
