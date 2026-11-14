# `src/mq3/botlib/aas_route_extras.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.aas_route_extras`](Package-mq3-botlib-aas-route-extras-2040414097.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/aas_routing.ml` as `routeExtraRouting` → [src/mq3/botlib/aas_routing.ml](File-src-mq3-botlib-aas-routing-ml-230871418.md)
- `mq3/botlib/aas_runtime.ml` as `routeExtraRuntime` → [src/mq3/botlib/aas_runtime.ml](File-src-mq3-botlib-aas-runtime-ml-1322908116.md)
- `mq3/botlib/aas_trace_areas.ml` as `routeExtraTraceAreas` → [src/mq3/botlib/aas_trace_areas.ml](File-src-mq3-botlib-aas-trace-areas-ml-2060721500.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/format/aas.ml` as `routeExtraAas` → [src/mq3/format/aas.ml](File-src-mq3-format-aas-ml-835678928.md)
- `std/array.ml` as `routeExtraArrays` → `../MiniLangCompilerML/std/array.ml` — external dependency

## Declarations

<a id="function-function-mq3-botlib-aas-route-extras-aas-initalternativerouting-function-aas-initalternativerouting-router-src-mq3-botlib-aas-route-extras-ml-119210943"></a>
### AAS_InitAlternativeRouting

```ml
function AAS_InitAlternativeRouting(router)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L50)

<a id="function-function-mq3-botlib-aas-route-extras-aas-shutdownalternativerouting-function-aas-shutdownalternativerouting-state-src-mq3-botlib-aas-route-extras-ml-1235845361"></a>
### AAS_ShutdownAlternativeRouting

```ml
function AAS_ShutdownAlternativeRouting(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L51)

<a id="function-function-mq3-botlib-aas-route-extras-absint-function-absint-value-src-mq3-botlib-aas-route-extras-ml-651641365"></a>
### absInt

```ml
function absInt(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L35)

- [mq3.botlib.aas_route_extras.AlternativeRouteGoal](Type-mq3-botlib-aas-route-extras-alternativeroutegoal-906342734.md) — struct
<a id="function-function-mq3-botlib-aas-route-extras-alternativeroutegoals-function-alternativeroutegoals-router-start-startareanum-goal-goalareanum-travelflags-maximum-type-src-mq3-botlib-aas-route-extras-ml-306256186"></a>
### alternativeRouteGoals

```ml
function alternativeRouteGoals(router, start, startAreaNum, goal, goalAreaNum, travelFlags, maximum, type)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `startAreaNum` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |
| `goalAreaNum` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |
| `maximum` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L108)

- [mq3.botlib.aas_route_extras.AlternativeRoutingState](Type-mq3-botlib-aas-route-extras-alternativeroutingstate-203968939.md) — struct
<a id="constant-constant-mq3-botlib-aas-route-extras-altroutegoal-all-const-altroutegoal-all-1-src-mq3-botlib-aas-route-extras-ml-1414014528"></a>
### ALTROUTEGOAL_ALL

```ml
const ALTROUTEGOAL_ALL = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L17)

<a id="constant-constant-mq3-botlib-aas-route-extras-altroutegoal-clusterportals-const-altroutegoal-clusterportals-2-src-mq3-botlib-aas-route-extras-ml-887883991"></a>
### ALTROUTEGOAL_CLUSTERPORTALS

```ml
const ALTROUTEGOAL_CLUSTERPORTALS = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L18)

<a id="constant-constant-mq3-botlib-aas-route-extras-altroutegoal-viewportals-const-altroutegoal-viewportals-4-src-mq3-botlib-aas-route-extras-ml-1639564507"></a>
### ALTROUTEGOAL_VIEWPORTALS

```ml
const ALTROUTEGOAL_VIEWPORTALS = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L19)

<a id="function-function-mq3-botlib-aas-route-extras-altroutingfloodcluster-function-altroutingfloodcluster-router-state-areanum-src-mq3-botlib-aas-route-extras-ml-1877178031"></a>
### altRoutingFloodCluster

```ml
function altRoutingFloodCluster(router, state, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L53)

<a id="constant-constant-mq3-botlib-aas-route-extras-areacontents-clusterportal-const-areacontents-clusterportal-8-src-mq3-botlib-aas-route-extras-ml-1031393207"></a>
### AREACONTENTS_CLUSTERPORTAL

```ml
const AREACONTENTS_CLUSTERPORTAL = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L20)

<a id="constant-constant-mq3-botlib-aas-route-extras-areacontents-viewportal-const-areacontents-viewportal-512-src-mq3-botlib-aas-route-extras-ml-769541289"></a>
### AREACONTENTS_VIEWPORTAL

```ml
const AREACONTENTS_VIEWPORTAL = 512
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L21)

<a id="function-function-mq3-botlib-aas-route-extras-connectedmidrange-function-connectedmidrange-router-first-valid-src-mq3-botlib-aas-route-extras-ml-1891588859"></a>
### connectedMidrange

```ml
function connectedMidrange(router, first, valid)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — |  |
| `first` | `dynamic` | — |  |
| `valid` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L102)

<a id="function-function-mq3-botlib-aas-route-extras-copyvector-function-copyvector-value-src-mq3-botlib-aas-route-extras-ml-1440082173"></a>
### copyVector

```ml
function copyVector(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L33)

<a id="function-function-mq3-botlib-aas-route-extras-distancesquared-function-distancesquared-a-b-src-mq3-botlib-aas-route-extras-ml-530026953"></a>
### distanceSquared

```ml
function distanceSquared(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L106)

<a id="function-function-mq3-botlib-aas-route-extras-initalternativerouting-function-initalternativerouting-router-src-mq3-botlib-aas-route-extras-ml-2034406939"></a>
### initAlternativeRouting

```ml
function initAlternativeRouting(router)
```

The released botlib keeps these two work arrays as process globals.  The port keeps them in an explicit owner so map restarts retain the same allocation/lifetime boundary without leaking state between botlib worlds.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L42)

<a id="constant-constant-mq3-botlib-aas-route-extras-max-reachability-pass-areas-const-max-reachability-pass-areas-32-src-mq3-botlib-aas-route-extras-ml-481694368"></a>
### MAX_REACHABILITY_PASS_AREAS

```ml
const MAX_REACHABILITY_PASS_AREAS = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L27)

<a id="constant-constant-mq3-botlib-aas-route-extras-op-alternative-route-goal-const-op-alternative-route-goal-575-src-mq3-botlib-aas-route-extras-ml-998792408"></a>
### OP_ALTERNATIVE_ROUTE_GOAL

```ml
const OP_ALTERNATIVE_ROUTE_GOAL = 575
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L14)

<a id="constant-constant-mq3-botlib-aas-route-extras-op-point-reachability-area-index-const-op-point-reachability-area-index-577-src-mq3-botlib-aas-route-extras-ml-2032934730"></a>
### OP_POINT_REACHABILITY_AREA_INDEX

```ml
const OP_POINT_REACHABILITY_AREA_INDEX = 577
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L16)

<a id="constant-constant-mq3-botlib-aas-route-extras-op-predict-route-const-op-predict-route-576-src-mq3-botlib-aas-route-extras-ml-753438063"></a>
### OP_PREDICT_ROUTE

```ml
const OP_PREDICT_ROUTE = 576
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L15)

<a id="function-function-mq3-botlib-aas-route-extras-passedareas-function-passedareas-router-reach-src-mq3-botlib-aas-route-extras-ml-1104122544"></a>
### passedAreas

```ml
function passedAreas(router, reach)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — |  |
| `reach` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L66)

<a id="function-function-mq3-botlib-aas-route-extras-pointreachabilityareaindex-function-pointreachabilityareaindex-state-origin-src-mq3-botlib-aas-route-extras-ml-1180733955"></a>
### pointReachabilityAreaIndex

```ml
function pointReachabilityAreaIndex(state, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L129)

<a id="function-function-mq3-botlib-aas-route-extras-predictroute-function-predictroute-router-route-areanum-origin-goalareanum-travelflags-maxareas-maxtime-stopevent-stopcontents-stoptfl-stopareanum-src-mq3-botlib-aas-route-extras-ml-164771494"></a>
### predictRoute

```ml
function predictRoute(router, route, areaNum, origin, goalAreaNum, travelFlags, maxAreas, maxTime, stopEvent, stopContents, stopTfl, stopAreaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — |  |
| `route` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `goalAreaNum` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |
| `maxAreas` | `dynamic` | — |  |
| `maxTime` | `dynamic` | — |  |
| `stopEvent` | `dynamic` | — |  |
| `stopContents` | `dynamic` | — |  |
| `stopTfl` | `dynamic` | — |  |
| `stopAreaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L75)

- [mq3.botlib.aas_route_extras.PredictRoute](Type-mq3-botlib-aas-route-extras-predictroute-1593577971.md) — struct
<a id="function-function-mq3-botlib-aas-route-extras-routetime-function-routetime-router-area-origin-goalarea-travelflags-src-mq3-botlib-aas-route-extras-ml-1023819155"></a>
### routeTime

```ml
function routeTime(router, area, origin, goalArea, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `goalArea` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L37)

<a id="constant-constant-mq3-botlib-aas-route-extras-rse-enterarea-const-rse-enterarea-8-src-mq3-botlib-aas-route-extras-ml-209110993"></a>
### RSE_ENTERAREA

```ml
const RSE_ENTERAREA = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L26)

<a id="constant-constant-mq3-botlib-aas-route-extras-rse-entercontents-const-rse-entercontents-4-src-mq3-botlib-aas-route-extras-ml-875376321"></a>
### RSE_ENTERCONTENTS

```ml
const RSE_ENTERCONTENTS = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L25)

<a id="constant-constant-mq3-botlib-aas-route-extras-rse-none-const-rse-none-0-src-mq3-botlib-aas-route-extras-ml-730704081"></a>
### RSE_NONE

```ml
const RSE_NONE = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L22)

<a id="constant-constant-mq3-botlib-aas-route-extras-rse-noroute-const-rse-noroute-1-src-mq3-botlib-aas-route-extras-ml-1506083064"></a>
### RSE_NOROUTE

```ml
const RSE_NOROUTE = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L23)

<a id="constant-constant-mq3-botlib-aas-route-extras-rse-usetraveltype-const-rse-usetraveltype-2-src-mq3-botlib-aas-route-extras-ml-1754704923"></a>
### RSE_USETRAVELTYPE

```ml
const RSE_USETRAVELTYPE = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L24)

<a id="function-function-mq3-botlib-aas-route-extras-shutdownalternativerouting-function-shutdownalternativerouting-state-src-mq3-botlib-aas-route-extras-ml-717701245"></a>
### shutdownAlternativeRouting

```ml
function shutdownAlternativeRouting(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L46)

<a id="function-function-mq3-botlib-aas-route-extras-supportstrap-function-supportstrap-op-src-mq3-botlib-aas-route-extras-ml-265223201"></a>
### supportsTrap

```ml
function supportsTrap(op)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `op` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L136)

<a id="function-function-mq3-botlib-aas-route-extras-u16-function-u16-value-src-mq3-botlib-aas-route-extras-ml-418873693"></a>
### u16

```ml
function u16(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L34)

<a id="function-function-mq3-botlib-aas-route-extras-validrouter-function-validrouter-router-src-mq3-botlib-aas-route-extras-ml-1848484733"></a>
### validRouter

```ml
function validRouter(router)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_route_extras.ml#L36)
