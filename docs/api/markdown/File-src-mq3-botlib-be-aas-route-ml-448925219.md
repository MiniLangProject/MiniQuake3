# `src/mq3/botlib/be_aas_route.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.be_aas_route`](Package-mq3-botlib-be-aas-route-238216631.md)

Reachable from entry: **no**

## Imports

- `mq3/botlib/aas_route_extras.ml` as `extras` → [src/mq3/botlib/aas_route_extras.ml](File-src-mq3-botlib-aas-route-extras-ml-1580573357.md)
- `mq3/botlib/aas_routing.ml` as `routing` → [src/mq3/botlib/aas_routing.ml](File-src-mq3-botlib-aas-routing-ml-230871418.md)
- `mq3/botlib/aas_routing_cache.ml` as `routeCache` → [src/mq3/botlib/aas_routing_cache.ml](File-src-mq3-botlib-aas-routing-cache-ml-1923771141.md)
- `mq3/botlib/aas_routing_tables.ml` as `tables` → [src/mq3/botlib/aas_routing_tables.ml](File-src-mq3-botlib-aas-routing-tables-ml-2134281168.md)
- `mq3/botlib/aas_runtime.ml` as `runtimeAas` → [src/mq3/botlib/aas_runtime.ml](File-src-mq3-botlib-aas-runtime-ml-1322908116.md)
- `mq3/botlib/cache_lru.ml` as `lru` → [src/mq3/botlib/cache_lru.ml](File-src-mq3-botlib-cache-lru-ml-148626408.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/format/aas.ml` as `aas` → [src/mq3/format/aas.ml](File-src-mq3-format-aas-ml-835678928.md)

## Declarations

<a id="function-function-mq3-botlib-be-aas-route-aas-allocroutingcache-function-aas-allocroutingcache-state-numtraveltimes-src-mq3-botlib-be-aas-route-ml-780924777"></a>
### AAS_AllocRoutingCache

```ml
function AAS_AllocRoutingCache(state, numTravelTimes)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `numTravelTimes` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L93)

<a id="function-function-mq3-botlib-be-aas-route-aas-alternativeroutegoals-function-aas-alternativeroutegoals-state-start-startareanum-goal-goalareanum-travelflags-maximum-type-src-mq3-botlib-be-aas-route-ml-188818320"></a>
### AAS_AlternativeRouteGoals

```ml
function AAS_AlternativeRouteGoals(state, start, startAreaNum, goal, goalAreaNum, travelFlags, maximum, type)
```

be_aas_routealt.c is exposed here as the natural companion of the routing adapter.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `startAreaNum` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |
| `goalAreaNum` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |
| `maximum` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L172)

<a id="function-function-mq3-botlib-be-aas-route-aas-areacontentstravelflags-function-aas-areacontentstravelflags-state-areanum-src-mq3-botlib-be-aas-route-ml-1789596378"></a>
### AAS_AreaContentsTravelFlags

```ml
function AAS_AreaContentsTravelFlags(state, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L79)

<a id="function-function-mq3-botlib-be-aas-route-aas-areacontentstravelflags-inline-function-aas-areacontentstravelflags-inline-state-areanum-src-mq3-botlib-be-aas-route-ml-796903454"></a>
### AAS_AreaContentsTravelFlags_inline

```ml
function AAS_AreaContentsTravelFlags_inline(state, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L78)

<a id="function-function-mq3-botlib-be-aas-route-aas-areareachabilitytogoalarea-function-aas-areareachabilitytogoalarea-state-areanum-origin-goalareanum-travelflags-src-mq3-botlib-be-aas-route-ml-63759573"></a>
### AAS_AreaReachabilityToGoalArea

```ml
function AAS_AreaReachabilityToGoalArea(state, areaNum, origin, goalAreaNum, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `goalAreaNum` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L140)

<a id="function-function-mq3-botlib-be-aas-route-aas-arearoutetogoalarea-function-aas-arearoutetogoalarea-state-areanum-origin-goalareanum-travelflags-src-mq3-botlib-be-aas-route-ml-2031539279"></a>
### AAS_AreaRouteToGoalArea

```ml
function AAS_AreaRouteToGoalArea(state, areaNum, origin, goalAreaNum, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `goalAreaNum` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L133)

<a id="function-function-mq3-botlib-be-aas-route-aas-areatraveltime-function-aas-areatraveltime-state-areanum-start-finish-src-mq3-botlib-be-aas-route-ml-161594423"></a>
### AAS_AreaTravelTime

```ml
function AAS_AreaTravelTime(state, areaNum, start, finish)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L85)

<a id="function-function-mq3-botlib-be-aas-route-aas-areatraveltimetogoalarea-function-aas-areatraveltimetogoalarea-state-areanum-origin-goalareanum-travelflags-src-mq3-botlib-be-aas-route-ml-671939941"></a>
### AAS_AreaTravelTimeToGoalArea

```ml
function AAS_AreaTravelTimeToGoalArea(state, areaNum, origin, goalAreaNum, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `goalAreaNum` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L139)

<a id="function-function-mq3-botlib-be-aas-route-aas-areavisible-function-aas-areavisible-state-sourcearea-destinationarea-src-mq3-botlib-be-aas-route-ml-888697126"></a>
### AAS_AreaVisible

```ml
function AAS_AreaVisible(state, sourceArea, destinationArea)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `sourceArea` | `dynamic` | — |  |
| `destinationArea` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L154)

<a id="function-function-mq3-botlib-be-aas-route-aas-bridgewalkable-function-aas-bridgewalkable-state-areanum-src-mq3-botlib-be-aas-route-ml-2119764090"></a>
### AAS_BridgeWalkable

```ml
function AAS_BridgeWalkable(state, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L142)

<a id="function-function-mq3-botlib-be-aas-route-aas-calculateareatraveltimes-function-aas-calculateareatraveltimes-state-src-mq3-botlib-be-aas-route-ml-485351585"></a>
### AAS_CalculateAreaTravelTimes

```ml
function AAS_CalculateAreaTravelTimes(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L86)

<a id="function-function-mq3-botlib-be-aas-route-aas-clusterareanum-function-aas-clusterareanum-state-cluster-areanum-src-mq3-botlib-be-aas-route-ml-1873070728"></a>
### AAS_ClusterAreaNum

```ml
function AAS_ClusterAreaNum(state, cluster, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cluster` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L41)

<a id="function-function-mq3-botlib-be-aas-route-aas-createallroutingcache-function-aas-createallroutingcache-state-src-mq3-botlib-be-aas-route-ml-1794369895"></a>
### AAS_CreateAllRoutingCache

```ml
function AAS_CreateAllRoutingCache(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L102)

<a id="function-function-mq3-botlib-be-aas-route-aas-createreversedreachability-function-aas-createreversedreachability-state-src-mq3-botlib-be-aas-route-ml-76809805"></a>
### AAS_CreateReversedReachability

```ml
function AAS_CreateReversedReachability(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L84)

<a id="function-function-mq3-botlib-be-aas-route-aas-enableroutingarea-function-aas-enableroutingarea-state-areanum-enable-src-mq3-botlib-be-aas-route-ml-1271598181"></a>
### AAS_EnableRoutingArea

```ml
function AAS_EnableRoutingArea(state, areaNum, enable)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `enable` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L71)

<a id="function-function-mq3-botlib-be-aas-route-aas-freeallclusterareacache-function-aas-freeallclusterareacache-state-src-mq3-botlib-be-aas-route-ml-1638974505"></a>
### AAS_FreeAllClusterAreaCache

```ml
function AAS_FreeAllClusterAreaCache(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L97)

<a id="function-function-mq3-botlib-be-aas-route-aas-freeallportalcache-function-aas-freeallportalcache-state-src-mq3-botlib-be-aas-route-ml-1253885841"></a>
### AAS_FreeAllPortalCache

```ml
function AAS_FreeAllPortalCache(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L99)

<a id="function-function-mq3-botlib-be-aas-route-aas-freeoldestcache-function-aas-freeoldestcache-state-src-mq3-botlib-be-aas-route-ml-1847717227"></a>
### AAS_FreeOldestCache

```ml
function AAS_FreeOldestCache(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L90)

<a id="function-function-mq3-botlib-be-aas-route-aas-freeroutingcache-function-aas-freeroutingcache-state-value-src-mq3-botlib-be-aas-route-ml-1221181832"></a>
### AAS_FreeRoutingCache

```ml
function AAS_FreeRoutingCache(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L55)

<a id="function-function-mq3-botlib-be-aas-route-aas-freeroutingcaches-function-aas-freeroutingcaches-state-src-mq3-botlib-be-aas-route-ml-1290947567"></a>
### AAS_FreeRoutingCaches

```ml
function AAS_FreeRoutingCaches(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L125)

<a id="function-function-mq3-botlib-be-aas-route-aas-getareacontentstravelflags-function-aas-getareacontentstravelflags-state-areanum-src-mq3-botlib-be-aas-route-ml-1387603990"></a>
### AAS_GetAreaContentsTravelFlags

```ml
function AAS_GetAreaContentsTravelFlags(state, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L77)

<a id="function-function-mq3-botlib-be-aas-route-aas-getarearoutingcache-function-aas-getarearoutingcache-state-cluster-areanum-travelflags-src-mq3-botlib-be-aas-route-ml-1208757423"></a>
### AAS_GetAreaRoutingCache

```ml
function AAS_GetAreaRoutingCache(state, cluster, areaNum, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cluster` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L129)

<a id="function-function-mq3-botlib-be-aas-route-aas-getportalroutingcache-function-aas-getportalroutingcache-state-cluster-areanum-travelflags-src-mq3-botlib-be-aas-route-ml-1460007673"></a>
### AAS_GetPortalRoutingCache

```ml
function AAS_GetPortalRoutingCache(state, cluster, areaNum, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cluster` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L131)

<a id="function-function-mq3-botlib-be-aas-route-aas-initareacontentstravelflags-function-aas-initareacontentstravelflags-state-src-mq3-botlib-be-aas-route-ml-1305061369"></a>
### AAS_InitAreaContentsTravelFlags

```ml
function AAS_InitAreaContentsTravelFlags(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L80)

<a id="function-function-mq3-botlib-be-aas-route-aas-initclusterareacache-function-aas-initclusterareacache-state-src-mq3-botlib-be-aas-route-ml-920778241"></a>
### AAS_InitClusterAreaCache

```ml
function AAS_InitClusterAreaCache(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L98)

<a id="function-function-mq3-botlib-be-aas-route-aas-initportalcache-function-aas-initportalcache-state-src-mq3-botlib-be-aas-route-ml-430529701"></a>
### AAS_InitPortalCache

```ml
function AAS_InitPortalCache(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L100)

<a id="function-function-mq3-botlib-be-aas-route-aas-initportalmaxtraveltimes-function-aas-initportalmaxtraveltimes-state-src-mq3-botlib-be-aas-route-ml-94186445"></a>
### AAS_InitPortalMaxTravelTimes

```ml
function AAS_InitPortalMaxTravelTimes(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L88)

<a id="function-function-mq3-botlib-be-aas-route-aas-initreachabilityareas-function-aas-initreachabilityareas-state-src-mq3-botlib-be-aas-route-ml-744449819"></a>
### AAS_InitReachabilityAreas

```ml
function AAS_InitReachabilityAreas(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L113)

<a id="function-function-mq3-botlib-be-aas-route-aas-initrouting-function-aas-initrouting-state-src-mq3-botlib-be-aas-route-ml-374570289"></a>
### AAS_InitRouting

```ml
function AAS_InitRouting(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L122)

<a id="function-function-mq3-botlib-be-aas-route-aas-initroutingupdate-function-aas-initroutingupdate-state-src-mq3-botlib-be-aas-route-ml-1018632551"></a>
### AAS_InitRoutingUpdate

```ml
function AAS_InitRoutingUpdate(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L101)

<a id="function-function-mq3-botlib-be-aas-route-aas-inittravelflagfromtype-function-aas-inittravelflagfromtype-state-src-mq3-botlib-be-aas-route-ml-318035533"></a>
### AAS_InitTravelFlagFromType

```ml
function AAS_InitTravelFlagFromType(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L42)

<a id="function-function-mq3-botlib-be-aas-route-aas-linkcache-function-aas-linkcache-state-value-src-mq3-botlib-be-aas-route-ml-2050719840"></a>
### AAS_LinkCache

```ml
function AAS_LinkCache(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L51)

<a id="function-function-mq3-botlib-be-aas-route-aas-nearesthidearea-function-aas-nearesthidearea-state-sourcenum-origin-areanum-enemynum-enemyorigin-enemyareanum-travelflags-src-mq3-botlib-be-aas-route-ml-1428440391"></a>
### AAS_NearestHideArea

```ml
function AAS_NearestHideArea(state, sourceNum, origin, areaNum, enemyNum, enemyOrigin, enemyAreaNum, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `sourceNum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `enemyNum` | `dynamic` | — |  |
| `enemyOrigin` | `dynamic` | — |  |
| `enemyAreaNum` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L160)

<a id="function-function-mq3-botlib-be-aas-route-aas-nextareareachability-function-aas-nextareareachability-state-areanum-reachnum-src-mq3-botlib-be-aas-route-ml-2118955395"></a>
### AAS_NextAreaReachability

```ml
function AAS_NextAreaReachability(state, areaNum, reachNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `reachNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L144)

<a id="function-function-mq3-botlib-be-aas-route-aas-nextmodelreachability-function-aas-nextmodelreachability-state-num-modelnum-src-mq3-botlib-be-aas-route-ml-1607861228"></a>
### AAS_NextModelReachability

```ml
function AAS_NextModelReachability(state, num, modelNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `num` | `dynamic` | — |  |
| `modelNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L145)

<a id="function-function-mq3-botlib-be-aas-route-aas-portalmaxtraveltime-function-aas-portalmaxtraveltime-state-portalnum-src-mq3-botlib-be-aas-route-ml-214890309"></a>
### AAS_PortalMaxTravelTime

```ml
function AAS_PortalMaxTravelTime(state, portalNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `portalNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L87)

<a id="function-function-mq3-botlib-be-aas-route-aas-predictroute-function-aas-predictroute-state-route-areanum-origin-goalareanum-travelflags-maxareas-maxtime-stopevent-stopcontents-stoptravelflags-stopareanum-src-mq3-botlib-be-aas-route-ml-386654179"></a>
### AAS_PredictRoute

```ml
function AAS_PredictRoute(state, route, areaNum, origin, goalAreaNum, travelFlags, maxAreas, maxTime, stopEvent, stopContents, stopTravelFlags, stopAreaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `route` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `goalAreaNum` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |
| `maxAreas` | `dynamic` | — |  |
| `maxTime` | `dynamic` | — |  |
| `stopEvent` | `dynamic` | — |  |
| `stopContents` | `dynamic` | — |  |
| `stopTravelFlags` | `dynamic` | — |  |
| `stopAreaNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L141)

<a id="function-function-mq3-botlib-be-aas-route-aas-randomgoalarea-function-aas-randomgoalarea-state-areanum-travelflags-src-mq3-botlib-be-aas-route-ml-1166394851"></a>
### AAS_RandomGoalArea

```ml
function AAS_RandomGoalArea(state, areaNum, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L150)

<a id="function-function-mq3-botlib-be-aas-route-aas-reachabilityfromnum-function-aas-reachabilityfromnum-state-num-src-mq3-botlib-be-aas-route-ml-1627444199"></a>
### AAS_ReachabilityFromNum

```ml
function AAS_ReachabilityFromNum(state, num)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `num` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L143)

<a id="function-function-mq3-botlib-be-aas-route-aas-readcache-function-aas-readcache-state-data-src-mq3-botlib-be-aas-route-ml-260598505"></a>
### AAS_ReadCache

```ml
function AAS_ReadCache(state, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L107)

<a id="function-function-mq3-botlib-be-aas-route-aas-readroutecache-function-aas-readroutecache-state-path-src-mq3-botlib-be-aas-route-ml-1265500770"></a>
### AAS_ReadRouteCache

```ml
function AAS_ReadRouteCache(state, path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L108)

<a id="function-function-mq3-botlib-be-aas-route-aas-removeroutingcacheincluster-function-aas-removeroutingcacheincluster-state-cluster-src-mq3-botlib-be-aas-route-ml-1718693629"></a>
### AAS_RemoveRoutingCacheInCluster

```ml
function AAS_RemoveRoutingCacheInCluster(state, cluster)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cluster` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L58)

<a id="function-function-mq3-botlib-be-aas-route-aas-removeroutingcacheusingarea-function-aas-removeroutingcacheusingarea-state-areanum-src-mq3-botlib-be-aas-route-ml-1453070368"></a>
### AAS_RemoveRoutingCacheUsingArea

```ml
function AAS_RemoveRoutingCacheUsingArea(state, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L64)

<a id="function-function-mq3-botlib-be-aas-route-aas-routinginfo-function-aas-routinginfo-state-src-mq3-botlib-be-aas-route-ml-817587197"></a>
### AAS_RoutingInfo

```ml
function AAS_RoutingInfo(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L37)

<a id="function-function-mq3-botlib-be-aas-route-aas-routingtime-function-aas-routingtime-state-src-mq3-botlib-be-aas-route-ml-720663915"></a>
### AAS_RoutingTime

```ml
function AAS_RoutingTime(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L75)

<a id="function-function-mq3-botlib-be-aas-route-aas-travelflagfortype-function-aas-travelflagfortype-state-traveltype-src-mq3-botlib-be-aas-route-ml-1392294579"></a>
### AAS_TravelFlagForType

```ml
function AAS_TravelFlagForType(state, travelType)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `travelType` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L44)

<a id="function-function-mq3-botlib-be-aas-route-aas-travelflagfortype-inline-function-aas-travelflagfortype-inline-state-traveltype-src-mq3-botlib-be-aas-route-ml-1858971337"></a>
### AAS_TravelFlagForType_inline

```ml
function AAS_TravelFlagForType_inline(state, travelType)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `travelType` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L43)

<a id="function-function-mq3-botlib-be-aas-route-aas-unlinkcache-function-aas-unlinkcache-state-value-src-mq3-botlib-be-aas-route-ml-2083021802"></a>
### AAS_UnlinkCache

```ml
function AAS_UnlinkCache(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L46)

<a id="function-function-mq3-botlib-be-aas-route-aas-updatearearoutingcache-function-aas-updatearearoutingcache-state-value-src-mq3-botlib-be-aas-route-ml-1394746984"></a>
### AAS_UpdateAreaRoutingCache

```ml
function AAS_UpdateAreaRoutingCache(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L128)

<a id="function-function-mq3-botlib-be-aas-route-aas-updateportalroutingcache-function-aas-updateportalroutingcache-state-value-src-mq3-botlib-be-aas-route-ml-892875308"></a>
### AAS_UpdatePortalRoutingCache

```ml
function AAS_UpdatePortalRoutingCache(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L130)

<a id="function-function-mq3-botlib-be-aas-route-aas-writeroutecache-function-aas-writeroutecache-state-path-src-mq3-botlib-be-aas-route-ml-1358388366"></a>
### AAS_WriteRouteCache

```ml
function AAS_WriteRouteCache(state, path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L106)

<a id="function-function-mq3-botlib-be-aas-route-copyvector-function-copyvector-value-src-mq3-botlib-be-aas-route-ml-150323557"></a>
### copyVector

```ml
function copyVector(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L26)

<a id="function-function-mq3-botlib-be-aas-route-create-function-create-runtime-maxentries-services-src-mq3-botlib-be-aas-route-ml-1144870318"></a>
### create

```ml
function create(runtime, maxEntries, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `maxEntries` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L30)

<a id="function-function-mq3-botlib-be-aas-route-createservices-function-createservices-context-src-mq3-botlib-be-aas-route-ml-1973164791"></a>
### createServices

```ml
function createServices(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L25)

<a id="function-function-mq3-botlib-be-aas-route-defaultrandom-function-defaultrandom-context-src-mq3-botlib-be-aas-route-ml-1228865879"></a>
### defaultRandom

```ml
function defaultRandom(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L24)

<a id="function-function-mq3-botlib-be-aas-route-defaulttraceareas-function-defaulttraceareas-context-start-finish-maximum-src-mq3-botlib-be-aas-route-ml-423374212"></a>
### defaultTraceAreas

```ml
function defaultTraceAreas(context, start, finish, maximum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `maximum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L23)

<a id="function-function-mq3-botlib-be-aas-route-defaultvisible-function-defaultvisible-context-sourcearea-destinationarea-src-mq3-botlib-be-aas-route-ml-1814585938"></a>
### defaultVisible

```ml
function defaultVisible(context, sourceArea, destinationArea)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `sourceArea` | `dynamic` | — |  |
| `destinationArea` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L22)

<a id="function-function-mq3-botlib-be-aas-route-distancepointtoline-function-distancepointtoline-v1-v2-point-src-mq3-botlib-be-aas-route-ml-1009034057"></a>
### DistancePointToLine

```ml
function DistancePointToLine(v1, v2, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v1` | `dynamic` | — |  |
| `v2` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L155)

<a id="constant-constant-mq3-botlib-be-aas-route-max-reachability-pass-areas-const-max-reachability-pass-areas-32-src-mq3-botlib-be-aas-route-ml-1469187084"></a>
### MAX_REACHABILITY_PASS_AREAS

```ml
const MAX_REACHABILITY_PASS_AREAS = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L15)

<a id="function-function-mq3-botlib-be-aas-route-randomstart-function-randomstart-state-count-src-mq3-botlib-be-aas-route-ml-492490200"></a>
### randomStart

```ml
function randomStart(state, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L149)

- [mq3.botlib.be_aas_route.ReachabilityAreas](Type-mq3-botlib-be-aas-route-reachabilityareas-1419615598.md) — struct
<a id="function-function-mq3-botlib-be-aas-route-removeat-function-removeat-values-index-src-mq3-botlib-be-aas-route-ml-983486602"></a>
### removeAt

```ml
function removeAt(values, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L28)

- [mq3.botlib.be_aas_route.RoutingCache](Type-mq3-botlib-be-aas-route-routingcache-2084341335.md) — struct
- [mq3.botlib.be_aas_route.Services](Type-mq3-botlib-be-aas-route-services-1860658199.md) — struct
- [mq3.botlib.be_aas_route.State](Type-mq3-botlib-be-aas-route-state-677881948.md) — struct
<a id="function-function-mq3-botlib-be-aas-route-tracepassareas-function-tracepassareas-state-start-finish-src-mq3-botlib-be-aas-route-ml-2066147878"></a>
### tracePassAreas

```ml
function tracePassAreas(state, start, finish)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L110)

<a id="function-function-mq3-botlib-be-aas-route-validstate-function-validstate-state-src-mq3-botlib-be-aas-route-ml-1650419529"></a>
### validState

```ml
function validState(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L27)
