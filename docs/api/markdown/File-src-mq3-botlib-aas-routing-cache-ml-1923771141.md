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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `goalAreaNum` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L304)

<a id="function-function-mq3-botlib-aas-routing-cache-areatraveltimetogoalarea-function-areatraveltimetogoalarea-cache-areanum-origin-goalareanum-travelflags-src-mq3-botlib-aas-routing-cache-ml-699147080"></a>
### areaTravelTimeToGoalArea

```ml
function areaTravelTimeToGoalArea(cache, areaNum, origin, goalAreaNum, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `goalAreaNum` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L303)

<a id="function-function-mq3-botlib-aas-routing-cache-bits-function-bits-origin-src-mq3-botlib-aas-routing-cache-ml-981601680"></a>
### bits

```ml
function bits(origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L62)

<a id="function-function-mq3-botlib-aas-routing-cache-buildareacache-function-buildareacache-cache-cluster-goalareanum-travelflags-src-mq3-botlib-aas-routing-cache-ml-2134718229"></a>
### buildAreaCache

```ml
function buildAreaCache(cache, cluster, goalAreaNum, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `cluster` | `dynamic` | — |  |
| `goalAreaNum` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L101)

<a id="function-function-mq3-botlib-aas-routing-cache-builddestinationcosts-function-builddestinationcosts-cache-goalareanum-travelflags-src-mq3-botlib-aas-routing-cache-ml-1421973345"></a>
### buildDestinationCosts

```ml
function buildDestinationCosts(cache, goalAreaNum, travelFlags)
```

Store the cost of the route after each incoming reach. Travel between reaches depends on their endpoints, so a cache of costs per area loses information. Origin travel is added only when choosing the first reach.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `goalAreaNum` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L220)

<a id="function-function-mq3-botlib-aas-routing-cache-buildportalcache-function-buildportalcache-cache-cluster-goalareanum-travelflags-src-mq3-botlib-aas-routing-cache-ml-895996769"></a>
### buildPortalCache

```ml
function buildPortalCache(cache, cluster, goalAreaNum, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `cluster` | `dynamic` | — |  |
| `goalAreaNum` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L139)

- [mq3.botlib.aas_routing_cache.Cache](Type-mq3-botlib-aas-routing-cache-cache-275212243.md) — struct
<a id="constant-constant-mq3-botlib-aas-routing-cache-cache-area-const-cache-area-1-src-mq3-botlib-aas-routing-cache-ml-177282666"></a>
### CACHE_AREA

```ml
const CACHE_AREA = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L17)

<a id="constant-constant-mq3-botlib-aas-routing-cache-cache-portal-const-cache-portal-2-src-mq3-botlib-aas-routing-cache-ml-1393296533"></a>
### CACHE_PORTAL

```ml
const CACHE_PORTAL = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L18)

<a id="function-function-mq3-botlib-aas-routing-cache-clear-function-clear-cache-src-mq3-botlib-aas-routing-cache-ml-557896644"></a>
### clear

```ml
function clear(cache)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L346)

<a id="function-function-mq3-botlib-aas-routing-cache-clearrouteentries-function-clearrouteentries-cache-src-mq3-botlib-aas-routing-cache-ml-285624090"></a>
### clearRouteEntries

```ml
function clearRouteEntries(cache)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L77)

<a id="function-function-mq3-botlib-aas-routing-cache-clusterareanum-function-clusterareanum-cache-cluster-areanum-src-mq3-botlib-aas-routing-cache-ml-969330361"></a>
### clusterAreaNum

```ml
function clusterAreaNum(cache, cluster, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `cluster` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L43)

<a id="function-function-mq3-botlib-aas-routing-cache-crc16span-function-crc16span-data-offset-count-src-mq3-botlib-aas-routing-cache-ml-1941140528"></a>
### crc16Span

```ml
function crc16Span(data, offset, count)
```

AAS_WriteRouteCache writes a stable 32-byte RCD v2 header.  The original payload embeds native pointers, so MiniQuake3 follows that header with a versioned pointer-free representation of the same routing arrays.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L351)

<a id="function-function-mq3-botlib-aas-routing-cache-create-function-create-router-maxentries-src-mq3-botlib-aas-routing-cache-ml-1565632635"></a>
### create

```ml
function create(router, maxEntries)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — |  |
| `maxEntries` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L33)

<a id="function-function-mq3-botlib-aas-routing-cache-decodercd-function-decodercd-cache-data-src-mq3-botlib-aas-routing-cache-ml-373427252"></a>
### decodeRcd

```ml
function decodeRcd(cache, data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L387)

<a id="function-function-mq3-botlib-aas-routing-cache-decoderecord-function-decoderecord-cache-data-offset-expectedtype-generation-serial-src-mq3-botlib-aas-routing-cache-ml-885052441"></a>
### decodeRecord

```ml
function decodeRecord(cache, data, offset, expectedType, generation, serial)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `expectedType` | `dynamic` | — |  |
| `generation` | `dynamic` | — |  |
| `serial` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L376)

<a id="constant-constant-mq3-botlib-aas-routing-cache-default-max-entries-const-default-max-entries-4096-src-mq3-botlib-aas-routing-cache-ml-1317866074"></a>
### DEFAULT_MAX_ENTRIES

```ml
const DEFAULT_MAX_ENTRIES = 4096
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L19)

<a id="function-function-mq3-botlib-aas-routing-cache-encodercd-function-encodercd-cache-src-mq3-botlib-aas-routing-cache-ml-1875622764"></a>
### encodeRcd

```ml
function encodeRcd(cache)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L366)

- [mq3.botlib.aas_routing_cache.Entry](Type-mq3-botlib-aas-routing-cache-entry-1478553641.md) — struct
<a id="function-function-mq3-botlib-aas-routing-cache-getareacache-function-getareacache-cache-cluster-goalareanum-travelflags-src-mq3-botlib-aas-routing-cache-ml-1851181757"></a>
### getAreaCache

```ml
function getAreaCache(cache, cluster, goalAreaNum, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `cluster` | `dynamic` | — |  |
| `goalAreaNum` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L130)

<a id="function-function-mq3-botlib-aas-routing-cache-getportalcache-function-getportalcache-cache-cluster-goalareanum-travelflags-src-mq3-botlib-aas-routing-cache-ml-672523857"></a>
### getPortalCache

```ml
function getPortalCache(cache, cluster, goalAreaNum, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `cluster` | `dynamic` | — |  |
| `goalAreaNum` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L179)

<a id="function-function-mq3-botlib-aas-routing-cache-getu16-function-getu16-data-offset-src-mq3-botlib-aas-routing-cache-ml-537394723"></a>
### getU16

```ml
function getU16(data, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L359)

<a id="function-function-mq3-botlib-aas-routing-cache-itemquery-function-itemquery-cache-area-origin-flags-src-mq3-botlib-aas-routing-cache-ml-1443009164"></a>
### itemQuery

```ml
function itemQuery(cache, area, origin, flags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L324)

- [mq3.botlib.aas_routing_cache.ItemQuery](Type-mq3-botlib-aas-routing-cache-itemquery-1438569692.md) — struct
<a id="function-function-mq3-botlib-aas-routing-cache-itemquerytraveltime-function-itemquerytraveltime-query-goal-src-mq3-botlib-aas-routing-cache-ml-1142501865"></a>
### itemQueryTravelTime

```ml
function itemQueryTravelTime(query, goal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `query` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L329)

<a id="function-function-mq3-botlib-aas-routing-cache-itemtraveltime-function-itemtraveltime-cache-areanum-origin-goalareanum-travelflags-src-mq3-botlib-aas-routing-cache-ml-1827019288"></a>
### itemTravelTime

```ml
function itemTravelTime(cache, areaNum, origin, goalAreaNum, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `goalAreaNum` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L316)

<a id="function-function-mq3-botlib-aas-routing-cache-loadrcd-function-loadrcd-cache-path-src-mq3-botlib-aas-routing-cache-ml-2062640161"></a>
### loadRcd

```ml
function loadRcd(cache, path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L408)

<a id="function-function-mq3-botlib-aas-routing-cache-mapcrc-function-mapcrc-cache-lump-src-mq3-botlib-aas-routing-cache-ml-532262924"></a>
### mapCrc

```ml
function mapCrc(cache, lump)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `lump` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L354)

<a id="function-function-mq3-botlib-aas-routing-cache-normalizedflags-function-normalizedflags-cache-areanum-goalareanum-travelflags-src-mq3-botlib-aas-routing-cache-ml-839327006"></a>
### normalizedFlags

```ml
function normalizedFlags(cache, areaNum, goalAreaNum, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `goalAreaNum` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L57)

- [mq3.botlib.aas_routing_cache.PortalCache](Type-mq3-botlib-aas-routing-cache-portalcache-1688852037.md) — struct
<a id="function-function-mq3-botlib-aas-routing-cache-portalforarea-function-portalforarea-cache-areanum-src-mq3-botlib-aas-routing-cache-ml-745434369"></a>
### portalForArea

```ml
function portalForArea(cache, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L39)

- [mq3.botlib.aas_routing_cache.PortalUpdate](Type-mq3-botlib-aas-routing-cache-portalupdate-808334932.md) — struct
<a id="function-function-mq3-botlib-aas-routing-cache-propagatedportalroute-function-propagatedportalroute-cache-goalcluster-areanum-origin-goalareanum-travelflags-src-mq3-botlib-aas-routing-cache-ml-2091118193"></a>
### propagatedPortalRoute

```ml
function propagatedPortalRoute(cache, goalCluster, areaNum, origin, goalAreaNum, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `goalCluster` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `goalAreaNum` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L195)

<a id="function-function-mq3-botlib-aas-routing-cache-propagatedroute-function-propagatedroute-cache-cluster-areanum-origin-goalareanum-travelflags-src-mq3-botlib-aas-routing-cache-ml-560662752"></a>
### propagatedRoute

```ml
function propagatedRoute(cache, cluster, areaNum, origin, goalAreaNum, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `cluster` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `goalAreaNum` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L188)

<a id="function-function-mq3-botlib-aas-routing-cache-putu16-function-putu16-data-offset-value-src-mq3-botlib-aas-routing-cache-ml-1872972412"></a>
### putU16

```ml
function putU16(data, offset, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L358)

<a id="function-function-mq3-botlib-aas-routing-cache-query-function-query-cache-areanum-origin-goalareanum-travelflags-src-mq3-botlib-aas-routing-cache-ml-348597008"></a>
### query

```ml
function query(cache, areaNum, origin, goalAreaNum, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `goalAreaNum` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L279)

<a id="constant-constant-mq3-botlib-aas-routing-cache-rcd-header-size-const-rcd-header-size-32-src-mq3-botlib-aas-routing-cache-ml-714437972"></a>
### RCD_HEADER_SIZE

```ml
const RCD_HEADER_SIZE = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L22)

<a id="constant-constant-mq3-botlib-aas-routing-cache-rcd-ident-const-rcd-ident-1129465165-src-mq3-botlib-aas-routing-cache-ml-1790859035"></a>
### RCD_IDENT

```ml
const RCD_IDENT = 1129465165
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L20)

<a id="constant-constant-mq3-botlib-aas-routing-cache-rcd-payload-ident-const-rcd-payload-ident-1296847427-src-mq3-botlib-aas-routing-cache-ml-777175637"></a>
### RCD_PAYLOAD_IDENT

```ml
const RCD_PAYLOAD_IDENT = 1296847427
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L23)

<a id="constant-constant-mq3-botlib-aas-routing-cache-rcd-payload-version-const-rcd-payload-version-1-src-mq3-botlib-aas-routing-cache-ml-1741014832"></a>
### RCD_PAYLOAD_VERSION

```ml
const RCD_PAYLOAD_VERSION = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L24)

<a id="constant-constant-mq3-botlib-aas-routing-cache-rcd-record-header-size-const-rcd-record-header-size-24-src-mq3-botlib-aas-routing-cache-ml-1503392503"></a>
### RCD_RECORD_HEADER_SIZE

```ml
const RCD_RECORD_HEADER_SIZE = 24
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L25)

<a id="constant-constant-mq3-botlib-aas-routing-cache-rcd-version-const-rcd-version-2-src-mq3-botlib-aas-routing-cache-ml-1709470517"></a>
### RCD_VERSION

```ml
const RCD_VERSION = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L21)

<a id="function-function-mq3-botlib-aas-routing-cache-recordsize-function-recordsize-value-src-mq3-botlib-aas-routing-cache-ml-1523957207"></a>
### recordSize

```ml
function recordSize(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L360)

<a id="function-function-mq3-botlib-aas-routing-cache-resetlru-function-resetlru-cache-src-mq3-botlib-aas-routing-cache-ml-23894526"></a>
### resetLru

```ml
function resetLru(cache)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L98)

<a id="function-function-mq3-botlib-aas-routing-cache-routekey-function-routekey-type-cluster-areanum-goalareanum-travelflags-hasorigin-originbits-src-mq3-botlib-aas-routing-cache-ml-17353588"></a>
### routeKey

```ml
function routeKey(type, cluster, areaNum, goalAreaNum, travelFlags, hasOrigin, originBits)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `type` | `dynamic` | — |  |
| `cluster` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `goalAreaNum` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |
| `hasOrigin` | `dynamic` | — |  |
| `originBits` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L65)

<a id="function-function-mq3-botlib-aas-routing-cache-routetype-function-routetype-cache-areanum-goalareanum-src-mq3-botlib-aas-routing-cache-ml-1271936785"></a>
### routeType

```ml
function routeType(cache, areaNum, goalAreaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `goalAreaNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L48)

<a id="function-function-mq3-botlib-aas-routing-cache-savercd-function-savercd-cache-path-src-mq3-botlib-aas-routing-cache-ml-1902633471"></a>
### saveRcd

```ml
function saveRcd(cache, path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L407)

- [mq3.botlib.aas_routing_cache.Scratch](Type-mq3-botlib-aas-routing-cache-scratch-1634636235.md) — struct
<a id="function-function-mq3-botlib-aas-routing-cache-scratchfor-function-scratchfor-cache-src-mq3-botlib-aas-routing-cache-ml-709361098"></a>
### scratchFor

```ml
function scratchFor(cache)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L89)

<a id="function-function-mq3-botlib-aas-routing-cache-sync-function-sync-cache-src-mq3-botlib-aas-routing-cache-ml-1447308970"></a>
### sync

```ml
function sync(cache)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L73)

<a id="function-function-mq3-botlib-aas-routing-cache-tablekey-function-tablekey-cluster-goalareanum-travelflags-src-mq3-botlib-aas-routing-cache-ml-57352473"></a>
### tableKey

```ml
function tableKey(cluster, goalAreaNum, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cluster` | `dynamic` | — |  |
| `goalAreaNum` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L70)

<a id="function-function-mq3-botlib-aas-routing-cache-weightedquery-function-weightedquery-cache-areanum-origin-goalareanum-travelflags-timeonly-src-mq3-botlib-aas-routing-cache-ml-1087316739"></a>
### weightedQuery

```ml
function weightedQuery(cache, areaNum, origin, goalAreaNum, travelFlags, timeOnly)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `goalAreaNum` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |
| `timeOnly` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L305)

<a id="function-function-mq3-botlib-aas-routing-cache-weightedroute-function-weightedroute-cache-areanum-origin-goalareanum-travelflags-timeonly-src-mq3-botlib-aas-routing-cache-ml-1156162801"></a>
### weightedRoute

```ml
function weightedRoute(cache, areaNum, origin, goalAreaNum, travelFlags, timeOnly)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `goalAreaNum` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |
| `timeOnly` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L250)

<a id="function-function-mq3-botlib-aas-routing-cache-weightedtraveltime-function-weightedtraveltime-cache-areanum-origin-goalareanum-travelflags-src-mq3-botlib-aas-routing-cache-ml-563193108"></a>
### weightedTravelTime

```ml
function weightedTravelTime(cache, areaNum, origin, goalAreaNum, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `cache` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `goalAreaNum` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L313)

<a id="function-function-mq3-botlib-aas-routing-cache-writerecord-function-writerecord-data-offset-type-value-src-mq3-botlib-aas-routing-cache-ml-1324540484"></a>
### writeRecord

```ml
function writeRecord(data, offset, type, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing_cache.ml#L361)
