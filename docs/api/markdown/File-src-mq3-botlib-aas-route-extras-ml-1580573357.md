# `src/mq3/botlib/aas_route_extras.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.aas_route_extras`](Package-mq3-botlib-aas-route-extras-2040414097.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/aas_routing.ml` as `routeExtraRouting` → [src/mq3/botlib/aas_routing.ml](File-src-mq3-botlib-aas-routing-ml-230871418.md)
- `mq3/botlib/aas_routing_cache.ml` as `routeExtraCache` → [src/mq3/botlib/aas_routing_cache.ml](File-src-mq3-botlib-aas-routing-cache-ml-1923771141.md)
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

Forward `AAS_InitAlternativeRouting` to `mq3.botlib.aas_route_extras.initAlternativeRouting` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — | AAS routing state; accesses `settings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L122)

<a id="function-function-mq3-botlib-aas-route-extras-aas-shutdownalternativerouting-function-aas-shutdownalternativerouting-state-src-mq3-botlib-aas-route-extras-ml-1235845361"></a>
### AAS_ShutdownAlternativeRouting

```ml
function AAS_ShutdownAlternativeRouting(state)
```

Forward `AAS_ShutdownAlternativeRouting` to `mq3.botlib.aas_route_extras.shutdownAlternativeRouting` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS route extras state; accesses `valid`, `clusterAreas`, `numClusterAreas` and `initialized`. May update `state.valid`, `state.clusterAreas` and `state.numClusterAreas` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L125)

<a id="function-function-mq3-botlib-aas-route-extras-absint-function-absint-value-src-mq3-botlib-aas-route-extras-ml-651641365"></a>
### absInt

```ml
function absInt(value)
```

Return the absolute value of the numeric argument for aas route extras.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `0-value`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L94)

- [mq3.botlib.aas_route_extras.AlternativeRouteGoal](Type-mq3-botlib-aas-route-extras-alternativeroutegoal-906342734.md) — struct
<a id="function-function-mq3-botlib-aas-route-extras-alternativeroutegoals-function-alternativeroutegoals-router-start-startareanum-goal-goalareanum-travelflags-maximum-type-src-mq3-botlib-aas-route-extras-ml-306256186"></a>
### alternativeRouteGoals

```ml
function alternativeRouteGoals(router, start, startAreaNum, goal, goalAreaNum, travelFlags, maximum, type)
```

Apply `mq3.botlib.aas_route_extras.validRouter`, `mq3.botlib.aas_route_extras.routeTime` and `mq3.botlib.aas_route_extras.connectedMidrange` while evaluating `alternativeRouteGoals`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — | AAS routing state; accesses `settings` and `runtime`. |
| `start` | `dynamic` | — | World-space position as three coordinates. |
| `startAreaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `goal` | `dynamic` | — | Value used by `alternativeRouteGoals` in `if not validRouter(router) or start==void or goal==void or startAreaNum==0 or goalAreaNum==0 or maximum<=0 then...`. |
| `goalAreaNum` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |
| `maximum` | `dynamic` | — | Upper bound applied by the operation. |
| `type` | `dynamic` | — | Value used by `alternativeRouteGoals` in `if (type&ALTROUTEGOAL_ALL)==0 and not (((type&ALTROUTEGOAL_CLUSTERPORTALS)!=0 and (contents&AREACONTENTS_CLUSTER...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L239)

- [mq3.botlib.aas_route_extras.AlternativeRoutingState](Type-mq3-botlib-aas-route-extras-alternativeroutingstate-203968939.md) — struct
<a id="constant-constant-mq3-botlib-aas-route-extras-altroutegoal-all-const-altroutegoal-all-1-src-mq3-botlib-aas-route-extras-ml-1414014528"></a>
### ALTROUTEGOAL_ALL

```ml
const ALTROUTEGOAL_ALL = 1
```

Alternative-route goal selector for all.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L22)

<a id="constant-constant-mq3-botlib-aas-route-extras-altroutegoal-clusterportals-const-altroutegoal-clusterportals-2-src-mq3-botlib-aas-route-extras-ml-887883991"></a>
### ALTROUTEGOAL_CLUSTERPORTALS

```ml
const ALTROUTEGOAL_CLUSTERPORTALS = 2
```

Alternative-route goal selector for cluster portals.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L24)

<a id="constant-constant-mq3-botlib-aas-route-extras-altroutegoal-viewportals-const-altroutegoal-viewportals-4-src-mq3-botlib-aas-route-extras-ml-1639564507"></a>
### ALTROUTEGOAL_VIEWPORTALS

```ml
const ALTROUTEGOAL_VIEWPORTALS = 4
```

Alternative-route goal selector for view portals.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L26)

<a id="function-function-mq3-botlib-aas-route-extras-altroutingfloodcluster-function-altroutingfloodcluster-router-state-areanum-src-mq3-botlib-aas-route-extras-ml-1877178031"></a>
### altRoutingFloodCluster

```ml
function altRoutingFloodCluster(router, state, areaNum)
```

Update `state.clusterAreas[state.numClusterAreas]`, `state.numClusterAreas` and `state.valid[areaNum]` during `altRoutingFloodCluster`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — | AAS routing state; accesses `runtime`. |
| `state` | `dynamic` | — | AAS route extras state; accesses `initialized`, `valid`, `clusterAreas` and `numClusterAreas`. May update `state.clusterAreas[state.numClusterAreas]`, `state.numClusterAreas` and `state.valid[areaNum]` in place. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L131)

<a id="constant-constant-mq3-botlib-aas-route-extras-areacontents-clusterportal-const-areacontents-clusterportal-8-src-mq3-botlib-aas-route-extras-ml-1031393207"></a>
### AREACONTENTS_CLUSTERPORTAL

```ml
const AREACONTENTS_CLUSTERPORTAL = 8
```

AAS area-contents bit marking cluster portal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L28)

<a id="constant-constant-mq3-botlib-aas-route-extras-areacontents-viewportal-const-areacontents-viewportal-512-src-mq3-botlib-aas-route-extras-ml-769541289"></a>
### AREACONTENTS_VIEWPORTAL

```ml
const AREACONTENTS_VIEWPORTAL = 512
```

AAS area-contents bit marking view portal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L30)

<a id="function-function-mq3-botlib-aas-route-extras-connectedmidrange-function-connectedmidrange-router-first-valid-src-mq3-botlib-aas-route-extras-ml-1891588859"></a>
### connectedMidrange

```ml
function connectedMidrange(router, first, valid)
```

Apply `mq3.botlib.aas_route_extras.altRoutingFloodCluster` while evaluating `connectedMidrange`. Return paths include `routeExtraArrays.slice(state.clusterAreas,0,state.numClusterAreas)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — | AAS routing state; accesses `runtime`. |
| `first` | `dynamic` | — | AAS area number; zero denotes no area. |
| `valid` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_route_extras.AlternativeRoutingState.valid`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L221)

<a id="function-function-mq3-botlib-aas-route-extras-copyvector-function-copyvector-value-src-mq3-botlib-aas-route-extras-ml-1440082173"></a>
### copyVector

```ml
function copyVector(value)
```

Copy `value[0]`, `value[1]` and `value[2]` into a new ordered array for aas route extras.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L88)

<a id="function-function-mq3-botlib-aas-route-extras-distancesquared-function-distancesquared-a-b-src-mq3-botlib-aas-route-extras-ml-530026953"></a>
### distanceSquared

```ml
function distanceSquared(a, b)
```

Calculate squared Euclidean distance between two three-component points for aas route extras.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `b` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L228)

<a id="function-function-mq3-botlib-aas-route-extras-initalternativerouting-function-initalternativerouting-router-src-mq3-botlib-aas-route-extras-ml-2034406939"></a>
### initAlternativeRouting

```ml
function initAlternativeRouting(router)
```

The released botlib keeps these two work arrays as process globals.  The port keeps them in an explicit owner so map restarts retain the same allocation/lifetime boundary without leaking state between botlib worlds.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — | AAS routing state; accesses `settings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L110)

<a id="constant-constant-mq3-botlib-aas-route-extras-max-reachability-pass-areas-const-max-reachability-pass-areas-32-src-mq3-botlib-aas-route-extras-ml-481694368"></a>
### MAX_REACHABILITY_PASS_AREAS

```ml
const MAX_REACHABILITY_PASS_AREAS = 32
```

Maximum number of AAS areas collected while tracing a reachability path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L42)

<a id="constant-constant-mq3-botlib-aas-route-extras-op-alternative-route-goal-const-op-alternative-route-goal-575-src-mq3-botlib-aas-route-extras-ml-998792408"></a>
### OP_ALTERNATIVE_ROUTE_GOAL

```ml
const OP_ALTERNATIVE_ROUTE_GOAL = 575
```

Bot-library syscall identifier for alternative route goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L16)

<a id="constant-constant-mq3-botlib-aas-route-extras-op-point-reachability-area-index-const-op-point-reachability-area-index-577-src-mq3-botlib-aas-route-extras-ml-2032934730"></a>
### OP_POINT_REACHABILITY_AREA_INDEX

```ml
const OP_POINT_REACHABILITY_AREA_INDEX = 577
```

Bot-library syscall identifier for point area reachability area index.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L20)

<a id="constant-constant-mq3-botlib-aas-route-extras-op-predict-route-const-op-predict-route-576-src-mq3-botlib-aas-route-extras-ml-753438063"></a>
### OP_PREDICT_ROUTE

```ml
const OP_PREDICT_ROUTE = 576
```

Bot-library syscall identifier for predict route.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L18)

<a id="function-function-mq3-botlib-aas-route-extras-passedareas-function-passedareas-router-reach-src-mq3-botlib-aas-route-extras-ml-1104122544"></a>
### passedAreas

```ml
function passedAreas(router, reach)
```

Apply `mq3.botlib.aas_trace_areas.trace` while evaluating `passedAreas`. Return paths include `crossed.areas`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — | AAS routing state; accesses `runtime`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `travelType`, `start` and `finish`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L147)

<a id="function-function-mq3-botlib-aas-route-extras-pointreachabilityareaindex-function-pointreachabilityareaindex-state-origin-src-mq3-botlib-aas-route-extras-ml-1180733955"></a>
### pointReachabilityAreaIndex

```ml
function pointReachabilityAreaIndex(state, origin)
```

Apply `mq3.format.aas.cluster`, `mq3.botlib.aas_runtime.pointAreaNum` and `mq3.botlib.aas_runtime.areaReachability` while evaluating `pointReachabilityAreaIndex`. Return paths include `index+clusterAreaNum`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS route extras state; accesses `initialized` and `map`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L263)

<a id="function-function-mq3-botlib-aas-route-extras-predictroute-function-predictroute-router-route-areanum-origin-goalareanum-travelflags-maxareas-maxtime-stopevent-stopcontents-stoptfl-stopareanum-src-mq3-botlib-aas-route-extras-ml-164771494"></a>
### predictRoute

```ml
function predictRoute(router, route, areaNum, origin, goalAreaNum, travelFlags, maxAreas, maxTime, stopEvent, stopContents, stopTfl, stopAreaNum)
```

Forward `predictRoute` to `mq3.botlib.aas_route_extras.predictRouteCached` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — | AAS routing state; accesses `settings` and `reaches`. |
| `route` | `dynamic` | — | Route record; accesses `stopEvent`, `endArea`, `endContents`, `endTravelFlags` and `endPos` and related fields. May update `route.stopEvent`, `route.endArea` and `route.endContents` and additional fields in place. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `goalAreaNum` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |
| `maxAreas` | `dynamic` | — | Value used by `predictRouteCached` in `while currentArea!=goalAreaNum and (maxAreas==0 or step<maxAreas) and step<areaCount`. |
| `maxTime` | `dynamic` | — | Upper limit on the route travel-time value. |
| `stopEvent` | `dynamic` | — | Value used by `predictRouteCached` in `route.stopEvent=RSE_NONE`. |
| `stopContents` | `dynamic` | — | Value used by `predictRouteCached` in `if (stopEvent&RSE_ENTERCONTENTS)!=0 and (router.settings[testArea].contents&stopContents)!=0 then route.stopEven...`. |
| `stopTfl` | `dynamic` | — | Value used by `predictRouteCached` in `if (reachFlags&stopTfl)!=0 then route.stopEvent=RSE_USETRAVELTYPE`. |
| `stopAreaNum` | `dynamic` | — | Value used by `predictRouteCached` in `if (stopEvent&RSE_ENTERAREA)!=0 and testArea==stopAreaNum then route.stopEvent=RSE_ENTERAREA`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L213)

- [mq3.botlib.aas_route_extras.PredictRoute](Type-mq3-botlib-aas-route-extras-predictroute-1593577971.md) — struct
<a id="function-function-mq3-botlib-aas-route-extras-predictroutecached-function-predictroutecached-router-cache-route-areanum-origin-goalareanum-travelflags-maxareas-maxtime-stopevent-stopcontents-stoptfl-stopareanum-src-mq3-botlib-aas-route-extras-ml-182676320"></a>
### predictRouteCached

```ml
function predictRouteCached(router, cache, route, areaNum, origin, goalAreaNum, travelFlags, maxAreas, maxTime, stopEvent, stopContents, stopTfl, stopAreaNum)
```

Update `route.stopEvent`, `route.endArea`, `route.endContents` and `route.endTravelFlags` and related state during `predictRouteCached`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — | AAS routing state; accesses `settings` and `reaches`. |
| `cache` | `dynamic` | — | Routing cache state; accesses `router`. |
| `route` | `dynamic` | — | Route record; accesses `stopEvent`, `endArea`, `endContents`, `endTravelFlags` and `endPos` and related fields. May update `route.stopEvent`, `route.endArea` and `route.endContents` and additional fields in place. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `goalAreaNum` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |
| `maxAreas` | `dynamic` | — | Value used by `predictRouteCached` in `while currentArea!=goalAreaNum and (maxAreas==0 or step<maxAreas) and step<areaCount`. |
| `maxTime` | `dynamic` | — | Upper limit on the route travel-time value. |
| `stopEvent` | `dynamic` | — | Value used by `predictRouteCached` in `route.stopEvent=RSE_NONE`. |
| `stopContents` | `dynamic` | — | Value used by `predictRouteCached` in `if (stopEvent&RSE_ENTERCONTENTS)!=0 and (router.settings[testArea].contents&stopContents)!=0 then route.stopEven...`. |
| `stopTfl` | `dynamic` | — | Value used by `predictRouteCached` in `if (reachFlags&stopTfl)!=0 then route.stopEvent=RSE_USETRAVELTYPE`. |
| `stopAreaNum` | `dynamic` | — | Value used by `predictRouteCached` in `if (stopEvent&RSE_ENTERAREA)!=0 and testArea==stopAreaNum then route.stopEvent=RSE_ENTERAREA`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L170)

<a id="function-function-mq3-botlib-aas-route-extras-routetime-function-routetime-router-area-origin-goalarea-travelflags-src-mq3-botlib-aas-route-extras-ml-1023819155"></a>
### routeTime

```ml
function routeTime(router, area, origin, goalArea, travelFlags)
```

Forward `routeTime` to `mq3.botlib.aas_routing.areaTravelTimeToGoalArea` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — | AAS routing state; accesses `runtime` and `settings`. |
| `area` | `dynamic` | — | AAS area number; zero denotes no area. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `goalArea` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L104)

<a id="constant-constant-mq3-botlib-aas-route-extras-rse-enterarea-const-rse-enterarea-8-src-mq3-botlib-aas-route-extras-ml-209110993"></a>
### RSE_ENTERAREA

```ml
const RSE_ENTERAREA = 8
```

Stop when entering the given area.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L40)

<a id="constant-constant-mq3-botlib-aas-route-extras-rse-entercontents-const-rse-entercontents-4-src-mq3-botlib-aas-route-extras-ml-875376321"></a>
### RSE_ENTERCONTENTS

```ml
const RSE_ENTERCONTENTS = 4
```

Stop when entering the given contents.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L38)

<a id="constant-constant-mq3-botlib-aas-route-extras-rse-none-const-rse-none-0-src-mq3-botlib-aas-route-extras-ml-730704081"></a>
### RSE_NONE

```ml
const RSE_NONE = 0
```

Route-prediction result indicating that no requested stop event occurred.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L32)

<a id="constant-constant-mq3-botlib-aas-route-extras-rse-noroute-const-rse-noroute-1-src-mq3-botlib-aas-route-extras-ml-1506083064"></a>
### RSE_NOROUTE

```ml
const RSE_NOROUTE = 1
```

No route to goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L34)

<a id="constant-constant-mq3-botlib-aas-route-extras-rse-usetraveltype-const-rse-usetraveltype-2-src-mq3-botlib-aas-route-extras-ml-1754704923"></a>
### RSE_USETRAVELTYPE

```ml
const RSE_USETRAVELTYPE = 2
```

Stop as soon as on of the given travel types is used.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L36)

<a id="function-function-mq3-botlib-aas-route-extras-shutdownalternativerouting-function-shutdownalternativerouting-state-src-mq3-botlib-aas-route-extras-ml-717701245"></a>
### shutdownAlternativeRouting

```ml
function shutdownAlternativeRouting(state)
```

Update `state.valid`, `state.clusterAreas`, `state.numClusterAreas` and `state.initialized` during `shutdownAlternativeRouting`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AAS route extras state; accesses `valid`, `clusterAreas`, `numClusterAreas` and `initialized`. May update `state.valid`, `state.clusterAreas` and `state.numClusterAreas` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L116)

<a id="function-function-mq3-botlib-aas-route-extras-supportstrap-function-supportstrap-op-src-mq3-botlib-aas-route-extras-ml-265223201"></a>
### supportsTrap

```ml
function supportsTrap(op)
```

Test `op==OP_ALTERNATIVE_ROUTE_GOAL or op==OP_PREDICT_ROUTE or op==OP_POINT_REACHABILITY_AREA_INDEX` as the condition for `supportsTrap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `op` | `dynamic` | — | Numeric syscall operation identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L272)

<a id="function-function-mq3-botlib-aas-route-extras-u16-function-u16-value-src-mq3-botlib-aas-route-extras-ml-418873693"></a>
### u16

```ml
function u16(value)
```

Return `value&65535` for `u16`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `value&65535`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L91)

<a id="function-function-mq3-botlib-aas-route-extras-validrouter-function-validrouter-router-src-mq3-botlib-aas-route-extras-ml-1848484733"></a>
### validRouter

```ml
function validRouter(router)
```

Test `router!=void and router.runtime!=void and router.runtime.initialized` as the condition for `validRouter`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — | AAS routing state; accesses `runtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_route_extras.ml#L97)
