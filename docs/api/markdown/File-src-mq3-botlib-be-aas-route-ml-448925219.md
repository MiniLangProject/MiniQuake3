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

Set `state.routingCacheSize` to `state.routingCacheSize+size` in `mq3.botlib.be_aas_route.AAS_AllocRoutingCache`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `routingCacheSize`, `maxRoutingCacheSize` and `lru`. May update `state.routingCacheSize` in place. |
| `numTravelTimes` | `dynamic` | — | Value passed as argument 1 to `array`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L186)

<a id="function-function-mq3-botlib-be-aas-route-aas-alternativeroutegoals-function-aas-alternativeroutegoals-state-start-startareanum-goal-goalareanum-travelflags-maximum-type-src-mq3-botlib-be-aas-route-ml-188818320"></a>
### AAS_AlternativeRouteGoals

```ml
function AAS_AlternativeRouteGoals(state, start, startAreaNum, goal, goalAreaNum, travelFlags, maximum, type)
```

be_aas_routealt.c is exposed here as the natural companion of the routing adapter.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `router`. |
| `start` | `dynamic` | — | World-space position as three coordinates. |
| `startAreaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `goal` | `dynamic` | — | Value used by `alternativeRouteGoals` in `if not validRouter(router) or start==void or goal==void or startAreaNum==0 or goalAreaNum==0 or maximum<=0 then...`. |
| `goalAreaNum` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |
| `maximum` | `dynamic` | — | Upper bound applied by the operation. |
| `type` | `dynamic` | — | Value used by `alternativeRouteGoals` in `if (type&ALTROUTEGOAL_ALL)==0 and not (((type&ALTROUTEGOAL_CLUSTERPORTALS)!=0 and (contents&AREACONTENTS_CLUSTER...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L389)

<a id="function-function-mq3-botlib-be-aas-route-aas-areacontentstravelflags-function-aas-areacontentstravelflags-state-areanum-src-mq3-botlib-be-aas-route-ml-1789596378"></a>
### AAS_AreaContentsTravelFlags

```ml
function AAS_AreaContentsTravelFlags(state, areaNum)
```

Forward `AAS_AreaContentsTravelFlags` to `mq3.botlib.be_aas_route.AAS_AreaContentsTravelFlags_inline` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `areaContentTravelFlags`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L151)

<a id="function-function-mq3-botlib-be-aas-route-aas-areacontentstravelflags-inline-function-aas-areacontentstravelflags-inline-state-areanum-src-mq3-botlib-be-aas-route-ml-796903454"></a>
### AAS_AreaContentsTravelFlags_inline

```ml
function AAS_AreaContentsTravelFlags_inline(state, areaNum)
```

Read the precomputed area contents travel flags, returning TFL_INVALID for an invalid state or area.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `areaContentTravelFlags`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L147)

<a id="function-function-mq3-botlib-be-aas-route-aas-areareachabilitytogoalarea-function-aas-areareachabilitytogoalarea-state-areanum-origin-goalareanum-travelflags-src-mq3-botlib-be-aas-route-ml-63759573"></a>
### AAS_AreaReachabilityToGoalArea

```ml
function AAS_AreaReachabilityToGoalArea(state, areaNum, origin, goalAreaNum, travelFlags)
```

Return `AAS_AreaRouteToGoalArea(state,areaNum,origin,goalAreaNum,travelFlags).reachNum` for `AAS_AreaReachabilityToGoalArea`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `cache` and `router`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `goalAreaNum` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L298)

<a id="function-function-mq3-botlib-be-aas-route-aas-arearoutetogoalarea-function-aas-arearoutetogoalarea-state-areanum-origin-goalareanum-travelflags-src-mq3-botlib-be-aas-route-ml-2031539279"></a>
### AAS_AreaRouteToGoalArea

```ml
function AAS_AreaRouteToGoalArea(state, areaNum, origin, goalAreaNum, travelFlags)
```

Build the `mq3.botlib.aas_routing.Route` result for `AAS_AreaRouteToGoalArea`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `cache` and `router`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `goalAreaNum` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L279)

<a id="function-function-mq3-botlib-be-aas-route-aas-areatraveltime-function-aas-areatraveltime-state-areanum-start-finish-src-mq3-botlib-be-aas-route-ml-161594423"></a>
### AAS_AreaTravelTime

```ml
function AAS_AreaTravelTime(state, areaNum, start, finish)
```

Apply `mq3.botlib.be_aas_route.validState` and `mq3.botlib.aas_routing.areaTravelTime` while evaluating `AAS_AreaTravelTime`. Return paths include `routing.areaTravelTime(state.router,areaNum,start,finish)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `router`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `start` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `finish` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L166)

<a id="function-function-mq3-botlib-be-aas-route-aas-areatraveltimetogoalarea-function-aas-areatraveltimetogoalarea-state-areanum-origin-goalareanum-travelflags-src-mq3-botlib-be-aas-route-ml-671939941"></a>
### AAS_AreaTravelTimeToGoalArea

```ml
function AAS_AreaTravelTimeToGoalArea(state, areaNum, origin, goalAreaNum, travelFlags)
```

Return `AAS_AreaRouteToGoalArea(state,areaNum,origin,goalAreaNum,travelFlags).travelTime` for `AAS_AreaTravelTimeToGoalArea`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `cache` and `router`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `goalAreaNum` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L291)

<a id="function-function-mq3-botlib-be-aas-route-aas-areavisible-function-aas-areavisible-state-sourcearea-destinationarea-src-mq3-botlib-be-aas-route-ml-888697126"></a>
### AAS_AreaVisible

```ml
function AAS_AreaVisible(state, sourceArea, destinationArea)
```

Use `state.services.visibleFn` to perform `AAS_AreaVisible`. Return paths include `state.services.visibleFn(state.services.context,sourceArea,destinationArea)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `services`. |
| `sourceArea` | `dynamic` | — | Value passed as argument 2 to `state.services.visibleFn`. |
| `destinationArea` | `dynamic` | — | Value passed as argument 3 to `state.services.visibleFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L350)

<a id="function-function-mq3-botlib-be-aas-route-aas-bridgewalkable-function-aas-bridgewalkable-state-areanum-src-mq3-botlib-be-aas-route-ml-2119764090"></a>
### AAS_BridgeWalkable

```ml
function AAS_BridgeWalkable(state, areaNum)
```

Return `false` for `AAS_BridgeWalkable`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Not read by this implementation; retained in the `AAS_BridgeWalkable` signature. |
| `areaNum` | `dynamic` | — | Not read by this implementation; retained in the `AAS_BridgeWalkable` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L316)

<a id="function-function-mq3-botlib-be-aas-route-aas-calculateareatraveltimes-function-aas-calculateareatraveltimes-state-src-mq3-botlib-be-aas-route-ml-485351585"></a>
### AAS_CalculateAreaTravelTimes

```ml
function AAS_CalculateAreaTravelTimes(state)
```

Apply `mq3.botlib.be_aas_route.validState` and `mq3.botlib.be_aas_route.AAS_CreateReversedReachability` while evaluating `AAS_CalculateAreaTravelTimes`. Return paths include `len(state.staticTables.areaTravelTimes)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `staticTables`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L169)

<a id="function-function-mq3-botlib-be-aas-route-aas-clusterareanum-function-aas-clusterareanum-state-cluster-areanum-src-mq3-botlib-be-aas-route-ml-1873070728"></a>
### AAS_ClusterAreaNum

```ml
function AAS_ClusterAreaNum(state, cluster, areaNum)
```

Apply `mq3.botlib.be_aas_route.validState` and `mq3.botlib.aas_routing_cache.clusterAreaNum` while evaluating `AAS_ClusterAreaNum`. Return paths include `routeCache.clusterAreaNum(state.cache,cluster,areaNum)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `cache`. |
| `cluster` | `dynamic` | — | Value used by `clusterAreaNum` in `if settings.cluster>0 then return settings.clusterAreaNum end if`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L75)

<a id="function-function-mq3-botlib-be-aas-route-aas-createallroutingcache-function-aas-createallroutingcache-state-src-mq3-botlib-be-aas-route-ml-1794369895"></a>
### AAS_CreateAllRoutingCache

```ml
function AAS_CreateAllRoutingCache(state)
```

Apply `mq3.botlib.be_aas_route.validState`, `mq3.format.aas.area` and `mq3.botlib.aas_routing_cache.areaTravelTimeToGoalArea` while evaluating `AAS_CreateAllRoutingCache`. Return paths include `created`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `router`, `runtime` and `cache`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L207)

<a id="function-function-mq3-botlib-be-aas-route-aas-createreversedreachability-function-aas-createreversedreachability-state-src-mq3-botlib-be-aas-route-ml-76809805"></a>
### AAS_CreateReversedReachability

```ml
function AAS_CreateReversedReachability(state)
```

Set `state.staticTables` to `tables.create(state.router)` and `state.cache.staticTables` to `state.staticTables` in `mq3.botlib.be_aas_route.AAS_CreateReversedReachability`. Return paths include `state.staticTables.totalLinks`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `staticTables`, `router` and `cache`. May update `state.staticTables` and `state.cache.staticTables` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L160)

<a id="function-function-mq3-botlib-be-aas-route-aas-enableroutingarea-function-aas-enableroutingarea-state-areanum-enable-src-mq3-botlib-be-aas-route-ml-1271598181"></a>
### AAS_EnableRoutingArea

```ml
function AAS_EnableRoutingArea(state, areaNum, enable)
```

Apply `mq3.botlib.be_aas_route.validState`, `mq3.botlib.aas_runtime.enableRoutingArea` and `mq3.botlib.be_aas_route.AAS_RemoveRoutingCacheUsingArea` while evaluating `AAS_EnableRoutingArea`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `runtime`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `enable` | `dynamic` | — | Value used by `enableRoutingArea` in `if enable<0 then return wasEnabled end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L132)

<a id="function-function-mq3-botlib-be-aas-route-aas-freeallclusterareacache-function-aas-freeallclusterareacache-state-src-mq3-botlib-be-aas-route-ml-1638974505"></a>
### AAS_FreeAllClusterAreaCache

```ml
function AAS_FreeAllClusterAreaCache(state)
```

Set `state.cache.areaCaches` to `[]` in `mq3.botlib.be_aas_route.AAS_FreeAllClusterAreaCache`. Return paths include `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `cache`. May update `state.cache.areaCaches` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L192)

<a id="function-function-mq3-botlib-be-aas-route-aas-freeallportalcache-function-aas-freeallportalcache-state-src-mq3-botlib-be-aas-route-ml-1253885841"></a>
### AAS_FreeAllPortalCache

```ml
function AAS_FreeAllPortalCache(state)
```

Set `state.cache.portalCaches` to `[]` in `mq3.botlib.be_aas_route.AAS_FreeAllPortalCache`. Return paths include `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `cache`. May update `state.cache.portalCaches` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L198)

<a id="function-function-mq3-botlib-be-aas-route-aas-freeoldestcache-function-aas-freeoldestcache-state-src-mq3-botlib-be-aas-route-ml-1847717227"></a>
### AAS_FreeOldestCache

```ml
function AAS_FreeOldestCache(state)
```

Apply `mq3.botlib.be_aas_route.AAS_FreeRoutingCache` while evaluating `AAS_FreeOldestCache`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `lru`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L180)

<a id="function-function-mq3-botlib-be-aas-route-aas-freeroutingcache-function-aas-freeroutingcache-state-value-src-mq3-botlib-be-aas-route-ml-1221181832"></a>
### AAS_FreeRoutingCache

```ml
function AAS_FreeRoutingCache(state, value)
```

Set `state.routingCacheSize` to `state.routingCacheSize-value.size` and `state.routingCacheSize` to `0` in `mq3.botlib.be_aas_route.AAS_FreeRoutingCache`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `routingCacheSize`. May update `state.routingCacheSize` in place. |
| `value` | `dynamic` | — | Value record; accesses `size`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L106)

<a id="function-function-mq3-botlib-be-aas-route-aas-freeroutingcaches-function-aas-freeroutingcaches-state-src-mq3-botlib-be-aas-route-ml-1290947567"></a>
### AAS_FreeRoutingCaches

```ml
function AAS_FreeRoutingCaches(state)
```

Update `state.staticTables`, `state.areaContentTravelFlags`, `state.reachabilityAreas` and `state.reachabilityAreaIndex` and related state during `AAS_FreeRoutingCaches`. Return paths include `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `cache`, `lru`, `staticTables`, `areaContentTravelFlags` and `reachabilityAreas` and related fields. May update `state.staticTables`, `state.areaContentTravelFlags` and `state.reachabilityAreas` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L249)

<a id="function-function-mq3-botlib-be-aas-route-aas-getareacontentstravelflags-function-aas-getareacontentstravelflags-state-areanum-src-mq3-botlib-be-aas-route-ml-1387603990"></a>
### AAS_GetAreaContentsTravelFlags

```ml
function AAS_GetAreaContentsTravelFlags(state, areaNum)
```

Apply `mq3.botlib.be_aas_route.validState` and `mq3.botlib.aas_routing.areaContentsTravelFlags` while evaluating `AAS_GetAreaContentsTravelFlags`. Return paths include `routing.areaContentsTravelFlags(state.router,areaNum)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `router`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L143)

<a id="function-function-mq3-botlib-be-aas-route-aas-getarearoutingcache-function-aas-getarearoutingcache-state-cluster-areanum-travelflags-src-mq3-botlib-be-aas-route-ml-1208757423"></a>
### AAS_GetAreaRoutingCache

```ml
function AAS_GetAreaRoutingCache(state, cluster, areaNum, travelFlags)
```

Apply `mq3.botlib.aas_routing_cache.getAreaCache` while evaluating `AAS_GetAreaRoutingCache`. Return paths include `routeCache.getAreaCache(state.cache,cluster,areaNum,travelFlags)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `cache`. |
| `cluster` | `dynamic` | — | Value passed as argument 3 to `mq3.compat.numeric.writeU32`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L261)

<a id="function-function-mq3-botlib-be-aas-route-aas-getportalroutingcache-function-aas-getportalroutingcache-state-cluster-areanum-travelflags-src-mq3-botlib-be-aas-route-ml-1460007673"></a>
### AAS_GetPortalRoutingCache

```ml
function AAS_GetPortalRoutingCache(state, cluster, areaNum, travelFlags)
```

Apply `mq3.botlib.aas_routing_cache.getPortalCache` while evaluating `AAS_GetPortalRoutingCache`. Return paths include `routeCache.getPortalCache(state.cache,cluster,areaNum,travelFlags)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `cache`. |
| `cluster` | `dynamic` | — | Value passed as argument 3 to `mq3.compat.numeric.writeU32`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L271)

<a id="function-function-mq3-botlib-be-aas-route-aas-initareacontentstravelflags-function-aas-initareacontentstravelflags-state-src-mq3-botlib-be-aas-route-ml-1305061369"></a>
### AAS_InitAreaContentsTravelFlags

```ml
function AAS_InitAreaContentsTravelFlags(state)
```

Set `state.areaContentTravelFlags` to `array(len(state.router.settings),0)` and `state.areaContentTravelFlags[areaNum]` to `AAS_GetAreaContentsTravelFlags(state,areaNum)` in `mq3.botlib.be_aas_route.AAS_InitAreaContentsTravelFlags`. Return paths include `len(state.areaContentTravelFlags)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `areaContentTravelFlags` and `router`. May update `state.areaContentTravelFlags` and `state.areaContentTravelFlags[areaNum]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L154)

<a id="function-function-mq3-botlib-be-aas-route-aas-initclusterareacache-function-aas-initclusterareacache-state-src-mq3-botlib-be-aas-route-ml-920778241"></a>
### AAS_InitClusterAreaCache

```ml
function AAS_InitClusterAreaCache(state)
```

Apply `mq3.botlib.be_aas_route.AAS_FreeAllClusterAreaCache` while evaluating `AAS_InitClusterAreaCache`. Return paths include `state.runtime.map.counts[aas.LUMP_CLUSTERS]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `runtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L195)

<a id="function-function-mq3-botlib-be-aas-route-aas-initportalcache-function-aas-initportalcache-state-src-mq3-botlib-be-aas-route-ml-430529701"></a>
### AAS_InitPortalCache

```ml
function AAS_InitPortalCache(state)
```

Apply `mq3.botlib.be_aas_route.AAS_FreeAllPortalCache` while evaluating `AAS_InitPortalCache`. Return paths include `state.runtime.map.counts[aas.LUMP_AREAS]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `runtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L201)

<a id="function-function-mq3-botlib-be-aas-route-aas-initportalmaxtraveltimes-function-aas-initportalmaxtraveltimes-state-src-mq3-botlib-be-aas-route-ml-94186445"></a>
### AAS_InitPortalMaxTravelTimes

```ml
function AAS_InitPortalMaxTravelTimes(state)
```

Apply `mq3.botlib.be_aas_route.validState` and `mq3.botlib.be_aas_route.AAS_CreateReversedReachability` while evaluating `AAS_InitPortalMaxTravelTimes`. Return paths include `len(state.staticTables.portalMaxTravelTimes)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `staticTables`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L176)

<a id="function-function-mq3-botlib-be-aas-route-aas-initreachabilityareas-function-aas-initreachabilityareas-state-src-mq3-botlib-be-aas-route-ml-744449819"></a>
### AAS_InitReachabilityAreas

```ml
function AAS_InitReachabilityAreas(state)
```

Update `state.reachabilityAreas` and `state.reachabilityAreaIndex` during `AAS_InitReachabilityAreas`. Return paths include `len(state.reachabilityAreaIndex)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `reachabilityAreas`, `reachabilityAreaIndex` and `router`. May update `state.reachabilityAreas` and `state.reachabilityAreaIndex` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L233)

<a id="function-function-mq3-botlib-be-aas-route-aas-initrouting-function-aas-initrouting-state-src-mq3-botlib-be-aas-route-ml-374570289"></a>
### AAS_InitRouting

```ml
function AAS_InitRouting(state)
```

Set `state.initialized` to `true` in `mq3.botlib.be_aas_route.AAS_InitRouting`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `initialized`. May update `state.initialized` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L244)

<a id="function-function-mq3-botlib-be-aas-route-aas-initroutingupdate-function-aas-initroutingupdate-state-src-mq3-botlib-be-aas-route-ml-1018632551"></a>
### AAS_InitRoutingUpdate

```ml
function AAS_InitRoutingUpdate(state)
```

Return the combined number of AAS areas and portals required by routing updates.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `runtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L204)

<a id="function-function-mq3-botlib-be-aas-route-aas-inittravelflagfromtype-function-aas-inittravelflagfromtype-state-src-mq3-botlib-be-aas-route-ml-318035533"></a>
### AAS_InitTravelFlagFromType

```ml
function AAS_InitTravelFlagFromType(state)
```

Return `20` for `AAS_InitTravelFlagFromType`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Not read by this implementation; retained in the `AAS_InitTravelFlagFromType` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L78)

<a id="function-function-mq3-botlib-be-aas-route-aas-linkcache-function-aas-linkcache-state-value-src-mq3-botlib-be-aas-route-ml-2050719840"></a>
### AAS_LinkCache

```ml
function AAS_LinkCache(state, value)
```

Update `state.lru`, `value.linked` and `value.time` during `AAS_LinkCache`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `lru`. May update `state.lru` in place. |
| `value` | `dynamic` | — | Value record; accesses `linked` and `time`. May update `value.linked` and `value.time` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L99)

<a id="function-function-mq3-botlib-be-aas-route-aas-nearesthidearea-function-aas-nearesthidearea-state-sourcenum-origin-areanum-enemynum-enemyorigin-enemyareanum-travelflags-src-mq3-botlib-be-aas-route-ml-1428440391"></a>
### AAS_NearestHideArea

```ml
function AAS_NearestHideArea(state, sourceNum, origin, areaNum, enemyNum, enemyOrigin, enemyAreaNum, travelFlags)
```

Apply `mq3.botlib.be_aas_route.validState`, `mq3.botlib.be_aas_route.copyVector` and `mq3.botlib.be_aas_route.AAS_AreaVisible` while evaluating `AAS_NearestHideArea`. Return paths include `bestArea`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `router`. |
| `sourceNum` | `dynamic` | — | Not read by this implementation; retained in the `AAS_NearestHideArea` signature. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `enemyNum` | `dynamic` | — | Not read by this implementation; retained in the `AAS_NearestHideArea` signature. |
| `enemyOrigin` | `dynamic` | — | Three-component point used by the geometric query. |
| `enemyAreaNum` | `dynamic` | — | Value passed as argument 2 to `state.services.visibleFn`. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L369)

<a id="function-function-mq3-botlib-be-aas-route-aas-nextareareachability-function-aas-nextareareachability-state-areanum-reachnum-src-mq3-botlib-be-aas-route-ml-2118955395"></a>
### AAS_NextAreaReachability

```ml
function AAS_NextAreaReachability(state, areaNum, reachNum)
```

Apply `mq3.botlib.aas_runtime.nextAreaReachability` while evaluating `AAS_NextAreaReachability`. Return paths include `runtimeAas.nextAreaReachability(state.runtime,areaNum,reachNum)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `runtime`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `reachNum` | `dynamic` | — | Operand used to evaluate the returned expression `reachNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L325)

<a id="function-function-mq3-botlib-be-aas-route-aas-nextmodelreachability-function-aas-nextmodelreachability-state-num-modelnum-src-mq3-botlib-be-aas-route-ml-1607861228"></a>
### AAS_NextModelReachability

```ml
function AAS_NextModelReachability(state, num, modelNum)
```

Apply `mq3.botlib.be_aas_route.validState` while evaluating `AAS_NextModelReachability`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `router`. |
| `num` | `dynamic` | — | Value used by `AAS_NextModelReachability` in `if num<=0 then num=1 else if num>=len(state.router.reaches) then return 0 else num=num+1 end if`. |
| `modelNum` | `dynamic` | — | Value used by `AAS_NextModelReachability` in `if kind==routing.TRAVEL_ELEVATOR and reach.faceNum==modelNum then return index end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L330)

<a id="function-function-mq3-botlib-be-aas-route-aas-portalmaxtraveltime-function-aas-portalmaxtraveltime-state-portalnum-src-mq3-botlib-be-aas-route-ml-214890309"></a>
### AAS_PortalMaxTravelTime

```ml
function AAS_PortalMaxTravelTime(state, portalNum)
```

Apply `mq3.botlib.aas_routing_tables.portalMaxTravelTime` while evaluating `AAS_PortalMaxTravelTime`. Return paths include `tables.portalMaxTravelTime(state.staticTables,portalNum)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `staticTables`. |
| `portalNum` | `dynamic` | — | Operand used to evaluate the returned expression `tables.portalMaxTravelTimes[portalNum]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L173)

<a id="function-function-mq3-botlib-be-aas-route-aas-predictroute-function-aas-predictroute-state-route-areanum-origin-goalareanum-travelflags-maxareas-maxtime-stopevent-stopcontents-stoptravelflags-stopareanum-src-mq3-botlib-be-aas-route-ml-386654179"></a>
### AAS_PredictRoute

```ml
function AAS_PredictRoute(state, route, areaNum, origin, goalAreaNum, travelFlags, maxAreas, maxTime, stopEvent, stopContents, stopTravelFlags, stopAreaNum)
```

Apply `mq3.botlib.aas_route_extras.predictRoute` while evaluating `AAS_PredictRoute`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `router`. |
| `route` | `dynamic` | — | Route record; accesses `stopEvent`, `endArea`, `endContents`, `endTravelFlags` and `endPos` and related fields. May update `route.stopEvent`, `route.endArea` and `route.endContents` and additional fields in place. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `goalAreaNum` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |
| `maxAreas` | `dynamic` | — | Value used by `predictRouteCached` in `while currentArea!=goalAreaNum and (maxAreas==0 or step<maxAreas) and step<areaCount`. |
| `maxTime` | `dynamic` | — | Upper limit on the route travel-time value. |
| `stopEvent` | `dynamic` | — | Value used by `predictRouteCached` in `route.stopEvent=RSE_NONE`. |
| `stopContents` | `dynamic` | — | Value used by `predictRouteCached` in `if (stopEvent&RSE_ENTERCONTENTS)!=0 and (router.settings[testArea].contents&stopContents)!=0 then route.stopEven...`. |
| `stopTravelFlags` | `dynamic` | — | Value used by `predictRouteCached` in `if (reachFlags&stopTfl)!=0 then route.stopEvent=RSE_USETRAVELTYPE`. |
| `stopAreaNum` | `dynamic` | — | Value used by `predictRouteCached` in `if (stopEvent&RSE_ENTERAREA)!=0 and testArea==stopAreaNum then route.stopEvent=RSE_ENTERAREA`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L312)

<a id="function-function-mq3-botlib-be-aas-route-aas-randomgoalarea-function-aas-randomgoalarea-state-areanum-travelflags-src-mq3-botlib-be-aas-route-ml-1166394851"></a>
### AAS_RandomGoalArea

```ml
function AAS_RandomGoalArea(state, areaNum, travelFlags)
```

Apply `mq3.botlib.be_aas_route.validState`, `mq3.botlib.aas_runtime.areaReachability` and `mq3.botlib.be_aas_route.randomStart` while evaluating `AAS_RandomGoalArea`. Return paths include `[false,0,[0.0,0.0,0.0]]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `runtime` and `router`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L342)

<a id="function-function-mq3-botlib-be-aas-route-aas-reachabilityfromnum-function-aas-reachabilityfromnum-state-num-src-mq3-botlib-be-aas-route-ml-1627444199"></a>
### AAS_ReachabilityFromNum

```ml
function AAS_ReachabilityFromNum(state, num)
```

Apply `mq3.botlib.aas_runtime.reachabilityFromNum` while evaluating `AAS_ReachabilityFromNum`. Return paths include `runtimeAas.reachabilityFromNum(state.runtime,num)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `runtime`. |
| `num` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L320)

<a id="function-function-mq3-botlib-be-aas-route-aas-readcache-function-aas-readcache-state-data-src-mq3-botlib-be-aas-route-ml-260598505"></a>
### AAS_ReadCache

```ml
function AAS_ReadCache(state, data)
```

Apply `mq3.botlib.aas_routing_cache.decodeRcd` while evaluating `AAS_ReadCache`. Return paths include `routeCache.decodeRcd(state.cache,data)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `cache`. |
| `data` | `dynamic` | — | Array or byte sequence accessed at `offset` and `offset+1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L218)

<a id="function-function-mq3-botlib-be-aas-route-aas-readroutecache-function-aas-readroutecache-state-path-src-mq3-botlib-be-aas-route-ml-1265500770"></a>
### AAS_ReadRouteCache

```ml
function AAS_ReadRouteCache(state, path)
```

Apply `mq3.botlib.aas_routing_cache.loadRcd` while evaluating `AAS_ReadRouteCache`. Return paths include `routeCache.loadRcd(state.cache,path)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `cache`. |
| `path` | `dynamic` | — | Resource path supplied to the file or parser operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L222)

<a id="function-function-mq3-botlib-be-aas-route-aas-removeroutingcacheincluster-function-aas-removeroutingcacheincluster-state-cluster-src-mq3-botlib-be-aas-route-ml-1718693629"></a>
### AAS_RemoveRoutingCacheInCluster

```ml
function AAS_RemoveRoutingCacheInCluster(state, cluster)
```

Update `state.routingCacheSize` and `state.lru` during `AAS_RemoveRoutingCacheInCluster`. Return paths include `removed`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `lru` and `routingCacheSize`. May update `state.routingCacheSize` and `state.lru` in place. |
| `cluster` | `dynamic` | — | Value used by `AAS_RemoveRoutingCacheInCluster` in `for each value in state.lru if value.cluster==cluster then value.linked=false`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L112)

<a id="function-function-mq3-botlib-be-aas-route-aas-removeroutingcacheusingarea-function-aas-removeroutingcacheusingarea-state-areanum-src-mq3-botlib-be-aas-route-ml-1453070368"></a>
### AAS_RemoveRoutingCacheUsingArea

```ml
function AAS_RemoveRoutingCacheUsingArea(state, areaNum)
```

Apply `mq3.botlib.be_aas_route.validState`, `mq3.botlib.be_aas_route.AAS_RemoveRoutingCacheInCluster` and `mq3.botlib.aas_routing_cache.portalForArea` while evaluating `AAS_RemoveRoutingCacheUsingArea`. Return paths include `removed`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `router` and `cache`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L121)

<a id="function-function-mq3-botlib-be-aas-route-aas-routinginfo-function-aas-routinginfo-state-src-mq3-botlib-be-aas-route-ml-817587197"></a>
### AAS_RoutingInfo

```ml
function AAS_RoutingInfo(state)
```

Apply `mq3.botlib.be_aas_route.validState` while evaluating `AAS_RoutingInfo`. Return paths include `[cache.areaUpdates,cache.portalUpdates,state.routingCacheSize,cache.hits,cache.misses]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `cache` and `routingCacheSize`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L67)

<a id="function-function-mq3-botlib-be-aas-route-aas-routingtime-function-aas-routingtime-state-src-mq3-botlib-be-aas-route-ml-720663915"></a>
### AAS_RoutingTime

```ml
function AAS_RoutingTime(state)
```

Apply `mq3.botlib.aas_runtime.getTime` while evaluating `AAS_RoutingTime`. Return paths include `runtimeAas.getTime(state.runtime)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `runtime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L138)

<a id="function-function-mq3-botlib-be-aas-route-aas-travelflagfortype-function-aas-travelflagfortype-state-traveltype-src-mq3-botlib-be-aas-route-ml-1392294579"></a>
### AAS_TravelFlagForType

```ml
function AAS_TravelFlagForType(state, travelType)
```

Forward `AAS_TravelFlagForType` to `mq3.botlib.be_aas_route.AAS_TravelFlagForType_inline` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Value passed as argument 1 to `mq3.botlib.be_aas_route.AAS_TravelFlagForType_inline`. |
| `travelType` | `dynamic` | — | AAS reachability travel-type code. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L86)

<a id="function-function-mq3-botlib-be-aas-route-aas-travelflagfortype-inline-function-aas-travelflagfortype-inline-state-traveltype-src-mq3-botlib-be-aas-route-ml-1858971337"></a>
### AAS_TravelFlagForType_inline

```ml
function AAS_TravelFlagForType_inline(state, travelType)
```

Forward `AAS_TravelFlagForType_inline` to `mq3.botlib.aas_routing.travelFlagForType` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Not read by this implementation; retained in the `AAS_TravelFlagForType_inline` signature. |
| `travelType` | `dynamic` | — | AAS reachability travel-type code. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L82)

<a id="function-function-mq3-botlib-be-aas-route-aas-unlinkcache-function-aas-unlinkcache-state-value-src-mq3-botlib-be-aas-route-ml-2083021802"></a>
### AAS_UnlinkCache

```ml
function AAS_UnlinkCache(state, value)
```

Set `state.lru` to `removeAt(state.lru,index)` and `value.linked` to `false` in `mq3.botlib.be_aas_route.AAS_UnlinkCache`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `lru`. May update `state.lru` in place. |
| `value` | `dynamic` | — | Value record; accesses `linked`. May update `value.linked` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L91)

<a id="function-function-mq3-botlib-be-aas-route-aas-updatearearoutingcache-function-aas-updatearearoutingcache-state-value-src-mq3-botlib-be-aas-route-ml-1394746984"></a>
### AAS_UpdateAreaRoutingCache

```ml
function AAS_UpdateAreaRoutingCache(state, value)
```

Apply `mq3.botlib.aas_routing_cache.buildAreaCache` while evaluating `AAS_UpdateAreaRoutingCache`. Return paths include `routeCache.buildAreaCache(state.cache,value.cluster,value.goalAreaNum,value.travelFlags)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `cache`. |
| `value` | `dynamic` | — | Value record; accesses `cluster`, `goalAreaNum` and `travelFlags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L255)

<a id="function-function-mq3-botlib-be-aas-route-aas-updateportalroutingcache-function-aas-updateportalroutingcache-state-value-src-mq3-botlib-be-aas-route-ml-892875308"></a>
### AAS_UpdatePortalRoutingCache

```ml
function AAS_UpdatePortalRoutingCache(state, value)
```

Apply `mq3.botlib.aas_routing_cache.buildPortalCache` while evaluating `AAS_UpdatePortalRoutingCache`. Return paths include `routeCache.buildPortalCache(state.cache,value.cluster,value.goalAreaNum,value.travelFlags)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `cache`. |
| `value` | `dynamic` | — | Value record; accesses `cluster`, `goalAreaNum` and `travelFlags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L265)

<a id="function-function-mq3-botlib-be-aas-route-aas-writeroutecache-function-aas-writeroutecache-state-path-src-mq3-botlib-be-aas-route-ml-1358388366"></a>
### AAS_WriteRouteCache

```ml
function AAS_WriteRouteCache(state, path)
```

Apply `mq3.botlib.aas_routing_cache.saveRcd` while evaluating `AAS_WriteRouteCache`. Return paths include `routeCache.saveRcd(state.cache,path)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `cache`. |
| `path` | `dynamic` | — | Resource path supplied to the file or parser operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L214)

<a id="function-function-mq3-botlib-be-aas-route-copyvector-function-copyvector-value-src-mq3-botlib-be-aas-route-ml-150323557"></a>
### copyVector

```ml
function copyVector(value)
```

Copy `value[0]`, `value[1]` and `value[2]` into a new ordered array for be aas route.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L45)

<a id="function-function-mq3-botlib-be-aas-route-create-function-create-runtime-maxentries-services-src-mq3-botlib-be-aas-route-ml-1144870318"></a>
### create

```ml
function create(runtime, maxEntries, services)
```

Apply `mq3.botlib.aas_routing.create`, `mq3.botlib.be_aas_route.createServices` and `mq3.botlib.aas_routing_cache.create` while evaluating `create`. Return paths include `state`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AAS routing runtime; accesses `initialized` and `map`. |
| `maxEntries` | `dynamic` | — | Initial value stored in `mq3.botlib.be_aas_route.State.maxRoutingCacheSize`. |
| `services` | `dynamic` | — | Initial value stored in `mq3.botlib.be_aas_route.State.services`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L58)

<a id="function-function-mq3-botlib-be-aas-route-createservices-function-createservices-context-src-mq3-botlib-be-aas-route-ml-1973164791"></a>
### createServices

```ml
function createServices(context)
```

Create a `mq3.botlib.be_aas_route.Services` record, initializing `context` from `context`, `visibleFn` as `defaultVisible` and `traceAreasFn` as `defaultTraceAreas`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context forwarded to the configured host callbacks. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L42)

<a id="function-function-mq3-botlib-be-aas-route-defaultrandom-function-defaultrandom-context-src-mq3-botlib-be-aas-route-ml-1228865879"></a>
### defaultRandom

```ml
function defaultRandom(context)
```

Return `0.0` for `defaultRandom`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Not read by this implementation; retained in the `defaultRandom` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L39)

<a id="function-function-mq3-botlib-be-aas-route-defaulttraceareas-function-defaulttraceareas-context-start-finish-maximum-src-mq3-botlib-be-aas-route-ml-423374212"></a>
### defaultTraceAreas

```ml
function defaultTraceAreas(context, start, finish, maximum)
```

Return a new array `[]` for `defaultTraceAreas`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Not read by this implementation; retained in the `defaultTraceAreas` signature. |
| `start` | `dynamic` | — | Not read by this implementation; retained in the `defaultTraceAreas` signature. |
| `finish` | `dynamic` | — | Not read by this implementation; retained in the `defaultTraceAreas` signature. |
| `maximum` | `dynamic` | — | Not read by this implementation; retained in the `defaultTraceAreas` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L36)

<a id="function-function-mq3-botlib-be-aas-route-defaultvisible-function-defaultvisible-context-sourcearea-destinationarea-src-mq3-botlib-be-aas-route-ml-1814585938"></a>
### defaultVisible

```ml
function defaultVisible(context, sourceArea, destinationArea)
```

Return `false` for `defaultVisible`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Not read by this implementation; retained in the `defaultVisible` signature. |
| `sourceArea` | `dynamic` | — | Not read by this implementation; retained in the `defaultVisible` signature. |
| `destinationArea` | `dynamic` | — | Not read by this implementation; retained in the `defaultVisible` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L30)

<a id="function-function-mq3-botlib-be-aas-route-distancepointtoline-function-distancepointtoline-v1-v2-point-src-mq3-botlib-be-aas-route-ml-1009034057"></a>
### DistancePointToLine

```ml
function DistancePointToLine(v1, v2, point)
```

Calculate the distance from a point to the infinite line through two endpoints, treating coincident endpoints as a point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v1` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `v2` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L355)

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

Use `state.services.randomFn` to perform `randomStart`. Return paths include `n.trunc32(value*count)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `services`. |
| `count` | `dynamic` | — | Number of entries or bytes processed by this call. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L337)

- [mq3.botlib.be_aas_route.ReachabilityAreas](Type-mq3-botlib-be-aas-route-reachabilityareas-1419615598.md) — struct
<a id="function-function-mq3-botlib-be-aas-route-removeat-function-removeat-values-index-src-mq3-botlib-be-aas-route-ml-983486602"></a>
### removeAt

```ml
function removeAt(values, index)
```

Return a copy of the routing list without the specified element, preserving the other entries in order.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Array or byte sequence accessed at `cursor`. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L52)

- [mq3.botlib.be_aas_route.RoutingCache](Type-mq3-botlib-be-aas-route-routingcache-2084341335.md) — struct
- [mq3.botlib.be_aas_route.Services](Type-mq3-botlib-be-aas-route-services-1860658199.md) — struct
- [mq3.botlib.be_aas_route.State](Type-mq3-botlib-be-aas-route-state-677881948.md) — struct
<a id="function-function-mq3-botlib-be-aas-route-tracepassareas-function-tracepassareas-state-start-finish-src-mq3-botlib-be-aas-route-ml-2066147878"></a>
### tracePassAreas

```ml
function tracePassAreas(state, start, finish)
```

Use `state.services.traceAreasFn` to perform `tracePassAreas`. Return paths include `values`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `services`. |
| `start` | `dynamic` | — | Value passed as argument 2 to `state.services.traceAreasFn`. |
| `finish` | `dynamic` | — | Value passed as argument 3 to `state.services.traceAreasFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L228)

<a id="function-function-mq3-botlib-be-aas-route-validstate-function-validstate-state-src-mq3-botlib-be-aas-route-ml-1650419529"></a>
### validState

```ml
function validState(state)
```

Test `state!=void and state.runtime!=void and state.router!=void` as the condition for `validState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Be AAS route state; accesses `runtime` and `router`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/be_aas_route.ml#L48)
