# `src/mq3/botlib/aas_routing_cache.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.aas_routing_cache`](Package-mq3-botlib-aas-routing-cache-915258667.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/aas_routing.ml` as `routing` → [src/mq3/botlib/aas_routing.ml](File-src-mq3-botlib-aas-routing-ml-230871418.md)
- `mq3/botlib/aas_routing_tables.ml` as `routingTables` → [src/mq3/botlib/aas_routing_tables.ml](File-src-mq3-botlib-aas-routing-tables-ml-2134281168.md)
- `mq3/botlib/cache_lru.ml` as `lru` → [src/mq3/botlib/cache_lru.ml](File-src-mq3-botlib-cache-lru-ml-148626408.md)
- `mq3/botlib/crc16.ml` as `crc16` → [src/mq3/botlib/crc16.ml](File-src-mq3-botlib-crc16-ml-267571879.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/format/aas.ml` as `aas` → [src/mq3/format/aas.ml](File-src-mq3-format-aas-ml-835678928.md)
- `std/ds/hashmap.ml` as `maps` → `../MiniLangCompilerML/std/ds/hashmap.ml` — external dependency
- `std/ds/list.ml` as `lists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency
- `std/ds/queue.ml` as `queues` → `../MiniLangCompilerML/std/ds/queue.ml` — external dependency
- `std/fs.ml` as `fs` → `../MiniLangCompilerML/std/fs.ml` — external dependency

## Declarations

- [mq3.botlib.aas_routing_cache.AreaCache](Type-mq3-botlib-aas-routing-cache-areacache-1134238000.md) — struct
<a id="function-function-mq3-botlib-aas-routing-cache-areareachabilitytogoalarea-function-areareachabilitytogoalarea-cache-areanum-origin-goalareanum-travelflags-src-mq3-botlib-aas-routing-cache-ml-1842297808"></a>
### areaReachabilityToGoalArea

```ml
function areaReachabilityToGoalArea(cache, areaNum, origin, goalAreaNum, travelFlags)
```

Return `query(cache,areaNum,origin,goalAreaNum,travelFlags).reachNum` for `areaReachabilityToGoalArea`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Routing cache state; accesses `router`, `routeIndex`, `hits`, `serial` and `routeLru` and related fields. May update `cache.hits`, `cache.serial` and `cache.misses` and additional fields in place. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `goalAreaNum` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L573)

<a id="function-function-mq3-botlib-aas-routing-cache-areatraveltimetogoalarea-function-areatraveltimetogoalarea-cache-areanum-origin-goalareanum-travelflags-src-mq3-botlib-aas-routing-cache-ml-699147080"></a>
### areaTravelTimeToGoalArea

```ml
function areaTravelTimeToGoalArea(cache, areaNum, origin, goalAreaNum, travelFlags)
```

Return `query(cache,areaNum,origin,goalAreaNum,travelFlags).travelTime` for `areaTravelTimeToGoalArea`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Routing cache state; accesses `router`, `routeIndex`, `hits`, `serial` and `routeLru` and related fields. May update `cache.hits`, `cache.serial` and `cache.misses` and additional fields in place. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `goalAreaNum` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L566)

<a id="function-function-mq3-botlib-aas-routing-cache-bits-function-bits-origin-src-mq3-botlib-aas-routing-cache-ml-981601680"></a>
### bits

```ml
function bits(origin)
```

Encode the origin coordinates as their three float bit patterns, using zero words for an absent origin.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | World-space position as three coordinates. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L226)

<a id="function-function-mq3-botlib-aas-routing-cache-buildareacache-function-buildareacache-cache-cluster-goalareanum-travelflags-src-mq3-botlib-aas-routing-cache-ml-2134718229"></a>
### buildAreaCache

```ml
function buildAreaCache(cache, cluster, goalAreaNum, travelFlags)
```

Set `cache.areaUpdates` to `cache.areaUpdates+1` in `mq3.botlib.aas_routing_cache.buildAreaCache`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Routing cache state; accesses `router`, `generation`, `serial`, `staticTables` and `areaUpdates`. May update `cache.areaUpdates` in place. |
| `cluster` | `dynamic` | — | Index of the entry to access. |
| `goalAreaNum` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L313)

<a id="function-function-mq3-botlib-aas-routing-cache-builddestinationcosts-function-builddestinationcosts-cache-goalareanum-travelflags-src-mq3-botlib-aas-routing-cache-ml-1421973345"></a>
### buildDestinationCosts

```ml
function buildDestinationCosts(cache, goalAreaNum, travelFlags)
```

Store the cost of the route after each incoming reach. Travel between reaches depends on their endpoints, so a cache of costs per area loses information. Origin travel is added only when choosing the first reach.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Routing cache state; accesses `router`, `staticTables` and `weightedBuilds`. May update `cache.weightedBuilds` in place. |
| `goalAreaNum` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L464)

<a id="function-function-mq3-botlib-aas-routing-cache-buildportalcache-function-buildportalcache-cache-cluster-goalareanum-travelflags-src-mq3-botlib-aas-routing-cache-ml-895996769"></a>
### buildPortalCache

```ml
function buildPortalCache(cache, cluster, goalAreaNum, travelFlags)
```

Set `cache.portalUpdates` to `cache.portalUpdates+1` in `mq3.botlib.aas_routing_cache.buildPortalCache`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Routing cache state; accesses `router`, `staticTables`, `portalUpdates`, `generation` and `serial`. May update `cache.portalUpdates` in place. |
| `cluster` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_routing_cache.PortalUpdate.cluster`. |
| `goalAreaNum` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L361)

- [mq3.botlib.aas_routing_cache.Cache](Type-mq3-botlib-aas-routing-cache-cache-275212243.md) — struct
<a id="constant-constant-mq3-botlib-aas-routing-cache-cache-area-const-cache-area-1-src-mq3-botlib-aas-routing-cache-ml-177282666"></a>
### CACHE_AREA

```ml
const CACHE_AREA = 1
```

Routing-cache type identifier for routes within an AAS cluster.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L18)

<a id="constant-constant-mq3-botlib-aas-routing-cache-cache-portal-const-cache-portal-2-src-mq3-botlib-aas-routing-cache-ml-1393296533"></a>
### CACHE_PORTAL

```ml
const CACHE_PORTAL = 2
```

Routing-cache type identifier for routes between cluster portals.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L20)

<a id="function-function-mq3-botlib-aas-routing-cache-clear-function-clear-cache-src-mq3-botlib-aas-routing-cache-ml-557896644"></a>
### clear

```ml
function clear(cache)
```

Update `cache.areaCaches`, `cache.portalCaches`, `cache.generation` and `cache.serial` and related state during `clear`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Routing cache state; accesses `areaCaches`, `portalCaches`, `areaIndex`, `portalIndex` and `generation` and related fields. May update `cache.areaCaches`, `cache.portalCaches` and `cache.generation` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L644)

<a id="function-function-mq3-botlib-aas-routing-cache-clearrouteentries-function-clearrouteentries-cache-src-mq3-botlib-aas-routing-cache-ml-285624090"></a>
### clearRouteEntries

```ml
function clearRouteEntries(cache)
```

Set `cache.destinationCosts[slot]` to `void` in `mq3.botlib.aas_routing_cache.clearRouteEntries`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Routing cache state; accesses `entries`, `routeIndex`, `routeLru`, `destinationLru` and `destinationCosts`. May update `cache.destinationCosts[slot]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L257)

<a id="function-function-mq3-botlib-aas-routing-cache-clusterareanum-function-clusterareanum-cache-cluster-areanum-src-mq3-botlib-aas-routing-cache-ml-969330361"></a>
### clusterAreaNum

```ml
function clusterAreaNum(cache, cluster, areaNum)
```

Apply `mq3.botlib.aas_routing_cache.portalForArea` while evaluating `clusterAreaNum`. Return paths include `portal.clusterAreaNums[side]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Routing cache state; accesses `router`. |
| `cluster` | `dynamic` | — | Value used by `clusterAreaNum` in `if settings.cluster>0 then return settings.clusterAreaNum end if`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L196)

<a id="function-function-mq3-botlib-aas-routing-cache-crc16span-function-crc16span-data-offset-count-src-mq3-botlib-aas-routing-cache-ml-1941140528"></a>
### crc16Span

```ml
function crc16Span(data, offset, count)
```

AAS_WriteRouteCache writes a stable 32-byte RCD v2 header.  The original payload embeds native pointers, so MiniQuake3 follows that header with a versioned pointer-free representation of the same routing arrays.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Array or byte sequence accessed at `offset+index`. |
| `offset` | `dynamic` | — | Offset into the buffer or sequence used by this operation. |
| `count` | `dynamic` | — | Number of entries or bytes processed by this call. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L652)

<a id="function-function-mq3-botlib-aas-routing-cache-create-function-create-router-maxentries-src-mq3-botlib-aas-routing-cache-ml-1565632635"></a>
### create

```ml
function create(router, maxEntries)
```

Build the `mq3.botlib.aas_routing_cache.Cache` result for `create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — | AAS routing state; accesses `runtime` and `reaches`. |
| `maxEntries` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_routing_cache.Cache.maxEntries`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L179)

<a id="function-function-mq3-botlib-aas-routing-cache-decodercd-function-decodercd-cache-data-src-mq3-botlib-aas-routing-cache-ml-373427252"></a>
### decodeRcd

```ml
function decodeRcd(cache, data)
```

Update `cache.portalCaches`, `cache.areaCaches`, `cache.generation` and `cache.serial` during `decodeRcd`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Routing cache state; accesses `router`, `maxEntries`, `serial`, `portalIndex` and `areaIndex` and related fields. May update `cache.portalCaches`, `cache.areaCaches` and `cache.generation` and additional fields in place. |
| `data` | `dynamic` | — | Array or byte sequence accessed at `offset` and `offset+1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L717)

<a id="function-function-mq3-botlib-aas-routing-cache-decoderecord-function-decoderecord-cache-data-offset-expectedtype-generation-serial-src-mq3-botlib-aas-routing-cache-ml-885052441"></a>
### decodeRecord

```ml
function decodeRecord(cache, data, offset, expectedType, generation, serial)
```

Apply `mq3.format.aas.cluster` and `mq3.botlib.aas_routing_cache.getU16` while evaluating `decodeRecord`. Return paths include `[value,offset+size]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Routing cache state; accesses `router`. |
| `data` | `dynamic` | — | Array or byte sequence accessed at `offset` and `offset+1`. |
| `offset` | `dynamic` | — | Offset into the buffer or sequence used by this operation. |
| `expectedType` | `dynamic` | — | Value used by `decodeRecord` in `if size<RCD_RECORD_HEADER_SIZE or count<0 or size!=RCD_RECORD_HEADER_SIZE+count*3 or offset+size>len(data) or ty...`. |
| `generation` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_routing_cache.PortalCache.generation`. |
| `serial` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_routing_cache.PortalCache.serial`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L703)

<a id="constant-constant-mq3-botlib-aas-routing-cache-default-max-entries-const-default-max-entries-4096-src-mq3-botlib-aas-routing-cache-ml-1317866074"></a>
### DEFAULT_MAX_ENTRIES

```ml
const DEFAULT_MAX_ENTRIES = 4096
```

Default maximum number of routing-cache entries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L22)

<a id="function-function-mq3-botlib-aas-routing-cache-encodercd-function-encodercd-cache-src-mq3-botlib-aas-routing-cache-ml-1875622764"></a>
### encodeRcd

```ml
function encodeRcd(cache)
```

Apply `mq3.botlib.aas_routing_cache.sync`, `mq3.botlib.aas_routing_cache.recordSize` and `mq3.botlib.aas_routing_cache.mapCrc` while evaluating `encodeRcd`. Return paths include `data`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Routing cache state; accesses `router`, `portalCaches` and `areaCaches`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L686)

- [mq3.botlib.aas_routing_cache.Entry](Type-mq3-botlib-aas-routing-cache-entry-1478553641.md) — struct
<a id="function-function-mq3-botlib-aas-routing-cache-getareacache-function-getareacache-cache-cluster-goalareanum-travelflags-src-mq3-botlib-aas-routing-cache-ml-1851181757"></a>
### getAreaCache

```ml
function getAreaCache(cache, cluster, goalAreaNum, travelFlags)
```

Update `cache.areaHits`, `cache.serial`, `cache.areaMisses` and `cache.areaCaches` and related state during `getAreaCache`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Routing cache state; accesses `areaIndex`, `areaHits`, `serial`, `areaLru` and `areaMisses` and related fields. May update `cache.areaHits`, `cache.serial` and `cache.areaMisses` and additional fields in place. |
| `cluster` | `dynamic` | — | Value passed as argument 3 to `mq3.compat.numeric.writeU32`. |
| `goalAreaNum` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L347)

<a id="function-function-mq3-botlib-aas-routing-cache-getportalcache-function-getportalcache-cache-cluster-goalareanum-travelflags-src-mq3-botlib-aas-routing-cache-ml-672523857"></a>
### getPortalCache

```ml
function getPortalCache(cache, cluster, goalAreaNum, travelFlags)
```

Update `cache.portalHits`, `cache.serial`, `cache.portalMisses` and `cache.portalCaches` and related state during `getPortalCache`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Routing cache state; accesses `portalIndex`, `portalHits`, `serial`, `portalLru` and `portalMisses` and related fields. May update `cache.portalHits`, `cache.serial` and `cache.portalMisses` and additional fields in place. |
| `cluster` | `dynamic` | — | Value passed as argument 3 to `mq3.compat.numeric.writeU32`. |
| `goalAreaNum` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L406)

<a id="function-function-mq3-botlib-aas-routing-cache-getu16-function-getu16-data-offset-src-mq3-botlib-aas-routing-cache-ml-537394723"></a>
### getU16

```ml
function getU16(data, offset)
```

Test `data[offset]|(data[offset+1]<<8)` as the condition for `getU16`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Array or byte sequence accessed at `offset` and `offset+1`. |
| `offset` | `dynamic` | — | Offset into the buffer or sequence used by this operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L670)

<a id="function-function-mq3-botlib-aas-routing-cache-itemquery-function-itemquery-cache-area-origin-flags-src-mq3-botlib-aas-routing-cache-ml-1443009164"></a>
### itemQuery

```ml
function itemQuery(cache, area, origin, flags)
```

Build the `mq3.botlib.aas_routing_cache.ItemQuery` result for `itemQuery`. Return paths include `ItemQuery(cache,area,origin,flags,void,void)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Routing cache state; accesses `router`, `generation`, `areaCaches`, `portalCaches` and `areaIndex` and related fields. May update `cache.areaCaches`, `cache.portalCaches` and `cache.generation` and additional fields in place. |
| `area` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_routing_cache.ItemQuery.area`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `flags` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_routing_cache.ItemQuery.flags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L617)

- [mq3.botlib.aas_routing_cache.ItemQuery](Type-mq3-botlib-aas-routing-cache-itemquery-1438569692.md) — struct
<a id="function-function-mq3-botlib-aas-routing-cache-itemquerytraveltime-function-itemquerytraveltime-query-goal-src-mq3-botlib-aas-routing-cache-ml-1142501865"></a>
### itemQueryTravelTime

```ml
function itemQueryTravelTime(query, goal)
```

Update `query.times` and `query.enterTimes` during `itemQueryTravelTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `query` | `dynamic` | — | Query record; accesses `cache`, `area`, `origin`, `flags` and `times` and related fields. May update `query.times` and `query.enterTimes` in place. |
| `goal` | `dynamic` | — | Destination AAS area number. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L625)

<a id="function-function-mq3-botlib-aas-routing-cache-itemtraveltime-function-itemtraveltime-cache-areanum-origin-goalareanum-travelflags-src-mq3-botlib-aas-routing-cache-ml-1827019288"></a>
### itemTravelTime

```ml
function itemTravelTime(cache, areaNum, origin, goalAreaNum, travelFlags)
```

Apply `mq3.botlib.aas_routing_cache.routeType`, `mq3.botlib.aas_routing_cache.weightedTravelTime` and `mq3.botlib.aas_routing_cache.areaTravelTimeToGoalArea` while evaluating `itemTravelTime`. Return paths include `areaTravelTimeToGoalArea(cache,areaNum,origin,goalAreaNum,travelFlags)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Routing cache state; accesses `router`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `goalAreaNum` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L604)

<a id="function-function-mq3-botlib-aas-routing-cache-loadrcd-function-loadrcd-cache-path-src-mq3-botlib-aas-routing-cache-ml-2062640161"></a>
### loadRcd

```ml
function loadRcd(cache, path)
```

Apply `mq3.botlib.aas_routing_cache.decodeRcd` while evaluating `loadRcd`. Return paths include `decodeRcd(cache,data)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Routing cache state; accesses `router`, `maxEntries`, `serial`, `portalIndex` and `areaIndex` and related fields. May update `cache.portalCaches`, `cache.areaCaches` and `cache.generation` and additional fields in place. |
| `path` | `dynamic` | — | Resource path supplied to the file or parser operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L744)

<a id="function-function-mq3-botlib-aas-routing-cache-mapcrc-function-mapcrc-cache-lump-src-mq3-botlib-aas-routing-cache-ml-532262924"></a>
### mapCrc

```ml
function mapCrc(cache, lump)
```

Apply `mq3.botlib.aas_routing_cache.crc16Span` while evaluating `mapCrc`. Return paths include `crc16Span(map.data,map.offsets[lump],map.lengths[lump])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Routing cache state; accesses `router`. |
| `lump` | `dynamic` | — | Operand used to evaluate the returned expression `crc16Span(map.data,map.offsets[lump],map.lengths[lump])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L658)

<a id="function-function-mq3-botlib-aas-routing-cache-normalizedflags-function-normalizedflags-cache-areanum-goalareanum-travelflags-src-mq3-botlib-aas-routing-cache-ml-839327006"></a>
### normalizedFlags

```ml
function normalizedFlags(cache, areaNum, goalAreaNum, travelFlags)
```

Permit DONOTENTER routing when either endpoint itself lies in a DONOTENTER area.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Routing cache state; accesses `router`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `goalAreaNum` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L219)

- [mq3.botlib.aas_routing_cache.PortalCache](Type-mq3-botlib-aas-routing-cache-portalcache-1688852037.md) — struct
<a id="function-function-mq3-botlib-aas-routing-cache-portalforarea-function-portalforarea-cache-areanum-src-mq3-botlib-aas-routing-cache-ml-745434369"></a>
### portalForArea

```ml
function portalForArea(cache, areaNum)
```

Apply `mq3.format.aas.portal` while evaluating `portalForArea`. Return paths include `aas.portal(cache.router.runtime.map,portalNum)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Routing cache state; accesses `router`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L188)

- [mq3.botlib.aas_routing_cache.PortalUpdate](Type-mq3-botlib-aas-routing-cache-portalupdate-808334932.md) — struct
<a id="function-function-mq3-botlib-aas-routing-cache-propagatedportalroute-function-propagatedportalroute-cache-goalcluster-areanum-origin-goalareanum-travelflags-src-mq3-botlib-aas-routing-cache-ml-2091118193"></a>
### propagatedPortalRoute

```ml
function propagatedPortalRoute(cache, goalCluster, areaNum, origin, goalAreaNum, travelFlags)
```

Build the `mq3.botlib.aas_routing.Route` result for `propagatedPortalRoute`. Return paths include `routing.Route(bestTime,bestReach)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Routing cache state; accesses `router` and `staticTables`. |
| `goalCluster` | `dynamic` | — | Value passed as argument 3 to `mq3.compat.numeric.writeU32`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `goalAreaNum` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L436)

<a id="function-function-mq3-botlib-aas-routing-cache-propagatedroute-function-propagatedroute-cache-cluster-areanum-origin-goalareanum-travelflags-src-mq3-botlib-aas-routing-cache-ml-560662752"></a>
### propagatedRoute

```ml
function propagatedRoute(cache, cluster, areaNum, origin, goalAreaNum, travelFlags)
```

Build the `mq3.botlib.aas_routing.Route` result for `propagatedRoute`. Return paths include `routing.Route(travelTime,reachNum)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Routing cache state; accesses `router`. |
| `cluster` | `dynamic` | — | Value passed as argument 3 to `mq3.compat.numeric.writeU32`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `goalAreaNum` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L422)

<a id="function-function-mq3-botlib-aas-routing-cache-putu16-function-putu16-data-offset-value-src-mq3-botlib-aas-routing-cache-ml-1872972412"></a>
### putU16

```ml
function putU16(data, offset, value)
```

Set `data[offset]` to `value&255` and `data[offset+1]` to `(value>>8)&255` in `mq3.botlib.aas_routing_cache.putU16`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Array or byte sequence accessed at `offset` and `offset+1`. Entries are written in place. |
| `offset` | `dynamic` | — | Offset into the buffer or sequence used by this operation. |
| `value` | `dynamic` | — | Value used by `putU16` in `data[offset]=value&255`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L666)

<a id="function-function-mq3-botlib-aas-routing-cache-query-function-query-cache-areanum-origin-goalareanum-travelflags-src-mq3-botlib-aas-routing-cache-ml-348597008"></a>
### query

```ml
function query(cache, areaNum, origin, goalAreaNum, travelFlags)
```

Update `cache.hits`, `cache.serial`, `cache.misses` and `cache.evictions` during `query`. Return paths include `route`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Routing cache state; accesses `router`, `routeIndex`, `hits`, `serial` and `routeLru` and related fields. May update `cache.hits`, `cache.serial` and `cache.misses` and additional fields in place. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `goalAreaNum` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L536)

<a id="constant-constant-mq3-botlib-aas-routing-cache-rcd-header-size-const-rcd-header-size-32-src-mq3-botlib-aas-routing-cache-ml-714437972"></a>
### RCD_HEADER_SIZE

```ml
const RCD_HEADER_SIZE = 32
```

Byte size of the legacy routing-cache file header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L28)

<a id="constant-constant-mq3-botlib-aas-routing-cache-rcd-ident-const-rcd-ident-1129465165-src-mq3-botlib-aas-routing-cache-ml-1790859035"></a>
### RCD_IDENT

```ml
const RCD_IDENT = 1129465165
```

Magic value identifying the routing-cache file header.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L24)

<a id="constant-constant-mq3-botlib-aas-routing-cache-rcd-payload-ident-const-rcd-payload-ident-1296847427-src-mq3-botlib-aas-routing-cache-ml-777175637"></a>
### RCD_PAYLOAD_IDENT

```ml
const RCD_PAYLOAD_IDENT = 1296847427
```

Magic value identifying the managed routing-cache payload.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L30)

<a id="constant-constant-mq3-botlib-aas-routing-cache-rcd-payload-version-const-rcd-payload-version-1-src-mq3-botlib-aas-routing-cache-ml-1741014832"></a>
### RCD_PAYLOAD_VERSION

```ml
const RCD_PAYLOAD_VERSION = 1
```

Serialized format or interface version expected by AAS routing cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L32)

<a id="constant-constant-mq3-botlib-aas-routing-cache-rcd-record-header-size-const-rcd-record-header-size-24-src-mq3-botlib-aas-routing-cache-ml-1503392503"></a>
### RCD_RECORD_HEADER_SIZE

```ml
const RCD_RECORD_HEADER_SIZE = 24
```

Byte size of the fixed header preceding one routing-cache record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L34)

<a id="constant-constant-mq3-botlib-aas-routing-cache-rcd-version-const-rcd-version-2-src-mq3-botlib-aas-routing-cache-ml-1709470517"></a>
### RCD_VERSION

```ml
const RCD_VERSION = 2
```

Serialized format or interface version expected by AAS routing cache.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L26)

<a id="function-function-mq3-botlib-aas-routing-cache-recordsize-function-recordsize-value-src-mq3-botlib-aas-routing-cache-ml-1523957207"></a>
### recordSize

```ml
function recordSize(value)
```

Return `RCD_RECORD_HEADER_SIZE+len(value.travelTimes)*3` for `recordSize`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `travelTimes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L673)

<a id="function-function-mq3-botlib-aas-routing-cache-resetlru-function-resetlru-cache-src-mq3-botlib-aas-routing-cache-ml-23894526"></a>
### resetLru

```ml
function resetLru(cache)
```

Apply `mq3.botlib.cache_lru.clear` while evaluating `resetLru`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Routing cache state; accesses `routeLru`, `areaLru` and `portalLru`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L305)

<a id="function-function-mq3-botlib-aas-routing-cache-routekey-function-routekey-type-cluster-areanum-goalareanum-travelflags-hasorigin-originbits-src-mq3-botlib-aas-routing-cache-ml-17353588"></a>
### routeKey

```ml
function routeKey(type, cluster, areaNum, goalAreaNum, travelFlags, hasOrigin, originBits)
```

Encode routing type, cluster, endpoints, travel flags and optional origin bits into a fixed 36-byte cache key.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `type` | `dynamic` | — | Value passed as argument 3 to `mq3.compat.numeric.writeU32`. |
| `cluster` | `dynamic` | — | Value passed as argument 3 to `mq3.compat.numeric.writeU32`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `goalAreaNum` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |
| `hasOrigin` | `dynamic` | — | Value used by `routeKey` in `if hasOrigin then n.writeU32(key,20,1)`. |
| `originBits` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L237)

<a id="function-function-mq3-botlib-aas-routing-cache-routetype-function-routetype-cache-areanum-goalareanum-src-mq3-botlib-aas-routing-cache-ml-1271936785"></a>
### routeType

```ml
function routeType(cache, areaNum, goalAreaNum)
```

Apply `mq3.botlib.aas_routing_cache.portalForArea` while evaluating `routeType`. Return paths include `[CACHE_PORTAL,goalCluster]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Routing cache state; accesses `router`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `goalAreaNum` | `dynamic` | — | Destination AAS area number. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L205)

<a id="function-function-mq3-botlib-aas-routing-cache-savercd-function-savercd-cache-path-src-mq3-botlib-aas-routing-cache-ml-1902633471"></a>
### saveRcd

```ml
function saveRcd(cache, path)
```

Apply `mq3.botlib.aas_routing_cache.encodeRcd` while evaluating `saveRcd`. Return paths include `result==true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Routing cache state; accesses `router`, `portalCaches` and `areaCaches`. |
| `path` | `dynamic` | — | Resource path supplied to the file or parser operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L740)

- [mq3.botlib.aas_routing_cache.Scratch](Type-mq3-botlib-aas-routing-cache-scratch-1634636235.md) — struct
<a id="function-function-mq3-botlib-aas-routing-cache-scratchfor-function-scratchfor-cache-src-mq3-botlib-aas-routing-cache-ml-709361098"></a>
### scratchFor

```ml
function scratchFor(cache)
```

Set `cache.scratch` to `value` and `cache.scratchBuilds` to `cache.scratchBuilds+1` in `mq3.botlib.aas_routing_cache.scratchFor`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Routing cache state; accesses `router`, `scratch` and `scratchBuilds`. May update `cache.scratch` and `cache.scratchBuilds` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L294)

<a id="function-function-mq3-botlib-aas-routing-cache-sync-function-sync-cache-src-mq3-botlib-aas-routing-cache-ml-1447308970"></a>
### sync

```ml
function sync(cache)
```

Update `cache.areaCaches`, `cache.portalCaches`, `cache.generation` and `cache.invalidations` during `sync`. Return paths include `current`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Routing cache state; accesses `router`, `generation`, `areaCaches`, `portalCaches` and `areaIndex` and related fields. May update `cache.areaCaches`, `cache.portalCaches` and `cache.generation` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L251)

<a id="function-function-mq3-botlib-aas-routing-cache-tablekey-function-tablekey-cluster-goalareanum-travelflags-src-mq3-botlib-aas-routing-cache-ml-57352473"></a>
### tableKey

```ml
function tableKey(cluster, goalAreaNum, travelFlags)
```

Encode cluster, goal area and travel flags into a fixed 12-byte routing-table cache key.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cluster` | `dynamic` | — | Value passed as argument 3 to `mq3.compat.numeric.writeU32`. |
| `goalAreaNum` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L246)

<a id="function-function-mq3-botlib-aas-routing-cache-weightedquery-function-weightedquery-cache-areanum-origin-goalareanum-travelflags-timeonly-src-mq3-botlib-aas-routing-cache-ml-1087316739"></a>
### weightedQuery

```ml
function weightedQuery(cache, areaNum, origin, goalAreaNum, travelFlags, timeOnly)
```

Build the `mq3.botlib.aas_routing.Route` result for `weightedQuery`. Return paths include `weightedRoute(cache,areaNum,origin,goalAreaNum,flags,timeOnly)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Routing cache state; accesses `router`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `goalAreaNum` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |
| `timeOnly` | `dynamic` | — | Value used by `weightedRoute` in `if not tied or timeOnly then return routing.Route(bestTime,best) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L581)

<a id="function-function-mq3-botlib-aas-routing-cache-weightedroute-function-weightedroute-cache-areanum-origin-goalareanum-travelflags-timeonly-src-mq3-botlib-aas-routing-cache-ml-1156162801"></a>
### weightedRoute

```ml
function weightedRoute(cache, areaNum, origin, goalAreaNum, travelFlags, timeOnly)
```

Set `cache.destinationCosts[slot]` to `buildDestinationCosts(cache,goalAreaNum,travelFlags)` and `cache.weightedFallbacks` to `cache.weightedFallbacks+1` in `mq3.botlib.aas_routing_cache.weightedRoute`. Return paths include `routing.areaRouteToGoalArea(router,areaNum,origin,goalAreaNum,travelFlags)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Routing cache state; accesses `router`, `staticTables`, `destinationLru`, `destinationCosts` and `weightedFallbacks`. May update `cache.destinationCosts[slot]` and `cache.weightedFallbacks` in place. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `goalAreaNum` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |
| `timeOnly` | `dynamic` | — | Value used by `weightedRoute` in `if not tied or timeOnly then return routing.Route(bestTime,best) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L501)

<a id="function-function-mq3-botlib-aas-routing-cache-weightedtraveltime-function-weightedtraveltime-cache-areanum-origin-goalareanum-travelflags-src-mq3-botlib-aas-routing-cache-ml-563193108"></a>
### weightedTravelTime

```ml
function weightedTravelTime(cache, areaNum, origin, goalAreaNum, travelFlags)
```

Return `weightedQuery(cache,areaNum,origin,goalAreaNum,travelFlags,true).travelTime` for `weightedTravelTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — | Routing cache state; accesses `router`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `goalAreaNum` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L595)

<a id="function-function-mq3-botlib-aas-routing-cache-writerecord-function-writerecord-data-offset-type-value-src-mq3-botlib-aas-routing-cache-ml-1324540484"></a>
### writeRecord

```ml
function writeRecord(data, offset, type, value)
```

Set `data[offset+RCD_RECORD_HEADER_SIZE+count*2+index]` to `value.reachabilities[index]&255` in `mq3.botlib.aas_routing_cache.writeRecord`. Return paths include `offset+size`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Array or byte sequence accessed at `offset` and `offset+1`. Entries are written in place. |
| `offset` | `dynamic` | — | Offset into the buffer or sequence used by this operation. |
| `type` | `dynamic` | — | Value passed as argument 3 to `mq3.compat.numeric.writeU32`. |
| `value` | `dynamic` | — | Value record; accesses `travelTimes`, `cluster`, `goalAreaNum`, `travelFlags` and `reachabilities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L679)
