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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |
| `original` | `dynamic` | — |  |
| `inward` | `dynamic` | — |  |
| `border` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchtrace.ml#L48)

- [mq3.collision.patchtrace.Adjusted](Type-mq3-collision-patchtrace-adjusted-1193895741.md) — struct
<a id="function-function-mq3-collision-patchtrace-checkplane-function-checkplane-adjusted-clip-src-mq3-collision-patchtrace-ml-768337312"></a>
### checkPlane

```ml
function checkPlane(adjusted, clip)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adjusted` | `dynamic` | — |  |
| `clip` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchtrace.ml#L66)

- [mq3.collision.patchtrace.Clip](Type-mq3-collision-patchtrace-clip-921546117.md) — struct
<a id="function-function-mq3-collision-patchtrace-cm-checkfacetplane-function-cm-checkfacetplane-adjusted-clip-src-mq3-collision-patchtrace-ml-332715564"></a>
### CM_CheckFacetPlane

```ml
function CM_CheckFacetPlane(adjusted, clip)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `adjusted` | `dynamic` | — |  |
| `clip` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchtrace.ml#L84)

<a id="function-function-mq3-collision-patchtrace-cm-clearlevelpatches-function-cm-clearlevelpatches-src-mq3-collision-patchtrace-ml-1323472252"></a>
### CM_ClearLevelPatches

```ml
function CM_ClearLevelPatches()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchtrace.ml#L26)

<a id="function-function-mq3-collision-patchtrace-cm-drawdebugsurface-function-cm-drawdebugsurface-state-src-mq3-collision-patchtrace-ml-117816511"></a>
### CM_DrawDebugSurface

```ml
function CM_DrawDebugSurface(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchtrace.ml#L27)

<a id="function-function-mq3-collision-patchtrace-cm-positiontestinpatchcollide-function-cm-positiontestinpatchcollide-work-patch-src-mq3-collision-patchtrace-ml-2130630383"></a>
### CM_PositionTestInPatchCollide

```ml
function CM_PositionTestInPatchCollide(work, patch)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |
| `patch` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchtrace.ml#L172)

<a id="function-function-mq3-collision-patchtrace-cm-tracepointthroughpatchcollide-function-cm-tracepointthroughpatchcollide-work-patch-playercurveclip-src-mq3-collision-patchtrace-ml-757991167"></a>
### CM_TracePointThroughPatchCollide

```ml
function CM_TracePointThroughPatchCollide(work, patch, playerCurveClip)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |
| `patch` | `dynamic` | — |  |
| `playerCurveClip` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchtrace.ml#L130)

<a id="function-function-mq3-collision-patchtrace-cm-tracethroughpatchcollide-function-cm-tracethroughpatchcollide-work-patch-playercurveclip-src-mq3-collision-patchtrace-ml-212994473"></a>
### CM_TraceThroughPatchCollide

```ml
function CM_TraceThroughPatchCollide(work, patch, playerCurveClip)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |
| `patch` | `dynamic` | — |  |
| `playerCurveClip` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchtrace.ml#L155)

<a id="function-function-mq3-collision-patchtrace-cornerdot-function-cornerdot-work-signbits-as-int-normal-as-array-returns-float-src-mq3-collision-patchtrace-ml-734604248"></a>
### cornerDot

```ml
function cornerDot(work, signbits as int, normal as array) returns float
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |
| `signbits` | `int` | — |  |
| `normal` | `array` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchtrace.ml#L40)

- [mq3.collision.patchtrace.DebugState](Type-mq3-collision-patchtrace-debugstate-763828607.md) — struct
<a id="function-function-mq3-collision-patchtrace-positiontest-function-positiontest-work-patch-src-mq3-collision-patchtrace-ml-861045993"></a>
### positionTest

```ml
function positionTest(work, patch)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |
| `patch` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchtrace.ml#L157)

<a id="function-function-mq3-collision-patchtrace-trace-function-trace-work-patch-playercurveclip-src-mq3-collision-patchtrace-ml-844192801"></a>
### trace

```ml
function trace(work, patch, playerCurveClip)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |
| `patch` | `dynamic` | — |  |
| `playerCurveClip` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchtrace.ml#L132)

<a id="function-function-mq3-collision-patchtrace-tracepoint-function-tracepoint-work-patch-playercurveclip-src-mq3-collision-patchtrace-ml-989481203"></a>
### tracePoint

```ml
function tracePoint(work, patch, playerCurveClip)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `work` | `dynamic` | — |  |
| `patch` | `dynamic` | — |  |
| `playerCurveClip` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/collision/patchtrace.ml#L86)
