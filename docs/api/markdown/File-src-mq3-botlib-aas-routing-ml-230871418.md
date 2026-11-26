# `src/mq3/botlib/aas_routing.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.aas_routing`](Package-mq3-botlib-aas-routing-1258623442.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/aas_runtime.ml` as `rt` → [src/mq3/botlib/aas_runtime.ml](File-src-mq3-botlib-aas-runtime-ml-1322908116.md)
- `mq3/botlib/public_headers.ml` as `publicHeaders` → [src/mq3/botlib/public_headers.ml](File-src-mq3-botlib-public-headers-ml-206085358.md)
- `mq3/format/aas.ml` as `aas` → [src/mq3/format/aas.ml](File-src-mq3-format-aas-ml-835678928.md)

## Declarations

<a id="function-function-mq3-botlib-aas-routing-allowed-function-allowed-required-travelflags-src-mq3-botlib-aas-routing-ml-1307517378"></a>
### allowed

```ml
function allowed(required, travelFlags)
```

Test `(required&travelFlags)==required` as the condition for `allowed`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `required` | `dynamic` | — | Operand used to evaluate the returned expression `(required&travelFlags)==required`. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L127)

<a id="constant-constant-mq3-botlib-aas-routing-area-bridge-const-area-bridge-16-src-mq3-botlib-aas-routing-ml-448874918"></a>
### AREA_BRIDGE

```ml
const AREA_BRIDGE = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L70)

<a id="constant-constant-mq3-botlib-aas-routing-area-liquid-const-area-liquid-4-src-mq3-botlib-aas-routing-ml-1205182525"></a>
### AREA_LIQUID

```ml
const AREA_LIQUID = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L69)

<a id="constant-constant-mq3-botlib-aas-routing-areacontents-donotenter-const-areacontents-donotenter-256-src-mq3-botlib-aas-routing-ml-137735988"></a>
### AREACONTENTS_DONOTENTER

```ml
const AREACONTENTS_DONOTENTER = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L66)

<a id="constant-constant-mq3-botlib-aas-routing-areacontents-lava-const-areacontents-lava-2-src-mq3-botlib-aas-routing-ml-849791419"></a>
### AREACONTENTS_LAVA

```ml
const AREACONTENTS_LAVA = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L64)

<a id="constant-constant-mq3-botlib-aas-routing-areacontents-notteam1-const-areacontents-notteam1-2048-src-mq3-botlib-aas-routing-ml-1028108591"></a>
### AREACONTENTS_NOTTEAM1

```ml
const AREACONTENTS_NOTTEAM1 = 2048
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L67)

<a id="constant-constant-mq3-botlib-aas-routing-areacontents-notteam2-const-areacontents-notteam2-4096-src-mq3-botlib-aas-routing-ml-1943024394"></a>
### AREACONTENTS_NOTTEAM2

```ml
const AREACONTENTS_NOTTEAM2 = 4096
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L68)

<a id="constant-constant-mq3-botlib-aas-routing-areacontents-slime-const-areacontents-slime-4-src-mq3-botlib-aas-routing-ml-266731091"></a>
### AREACONTENTS_SLIME

```ml
const AREACONTENTS_SLIME = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L65)

<a id="constant-constant-mq3-botlib-aas-routing-areacontents-water-const-areacontents-water-1-src-mq3-botlib-aas-routing-ml-1132817366"></a>
### AREACONTENTS_WATER

```ml
const AREACONTENTS_WATER = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L63)

<a id="function-function-mq3-botlib-aas-routing-areacontentstravelflags-function-areacontentstravelflags-router-areanum-src-mq3-botlib-aas-routing-ml-1540130634"></a>
### areaContentsTravelFlags

```ml
function areaContentsTravelFlags(router, areaNum)
```

Read the cached contents travel mask for an area, returning TFL_INVALID when the router or area is invalid.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — | AAS routing state; accesses `settings` and `areaFlags`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L120)

<a id="function-function-mq3-botlib-aas-routing-areareachabilitytogoalarea-function-areareachabilitytogoalarea-router-areanum-origin-goalareanum-travelflags-src-mq3-botlib-aas-routing-ml-1725085503"></a>
### areaReachabilityToGoalArea

```ml
function areaReachabilityToGoalArea(router, areaNum, origin, goalAreaNum, travelFlags)
```

Return `areaRouteToGoalArea(router,areaNum,origin,goalAreaNum,travelFlags).reachNum` for `areaReachabilityToGoalArea`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — | AAS routing state; accesses `runtime` and `settings`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `goalAreaNum` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L287)

<a id="function-function-mq3-botlib-aas-routing-arearoutetogoalarea-function-arearoutetogoalarea-router-areanum-origin-goalareanum-travelflags-src-mq3-botlib-aas-routing-ml-736216305"></a>
### areaRouteToGoalArea

```ml
function areaRouteToGoalArea(router, areaNum, origin, goalAreaNum, travelFlags)
```

Build the `mq3.botlib.aas_routing.Route` result for `areaRouteToGoalArea`. Return paths include `searchFromArea(router,areaNum,origin,goalAreaNum,travelFlags,void)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — | AAS routing state; accesses `runtime` and `settings`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `goalAreaNum` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L217)

<a id="function-function-mq3-botlib-aas-routing-areatraveltime-function-areatraveltime-router-areanum-start-finish-src-mq3-botlib-aas-routing-ml-2143478815"></a>
### areaTravelTime

```ml
function areaTravelTime(router, areaNum, start, finish)
```

Apply `mq3.botlib.aas_runtime.validArea` and `mq3.botlib.aas_routing.scaledDistanceNative` while evaluating `areaTravelTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — | AAS routing state; accesses `runtime` and `settings`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `start` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `finish` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L155)

<a id="function-function-mq3-botlib-aas-routing-areatraveltimetogoalarea-function-areatraveltimetogoalarea-router-areanum-origin-goalareanum-travelflags-src-mq3-botlib-aas-routing-ml-22880807"></a>
### areaTravelTimeToGoalArea

```ml
function areaTravelTimeToGoalArea(router, areaNum, origin, goalAreaNum, travelFlags)
```

Return `areaRouteToGoalArea(router,areaNum,origin,goalAreaNum,travelFlags).travelTime` for `areaTravelTimeToGoalArea`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — | AAS routing state; accesses `runtime` and `settings`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `goalAreaNum` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L280)

<a id="function-function-mq3-botlib-aas-routing-contentstravelflags-function-contentstravelflags-value-src-mq3-botlib-aas-routing-ml-419962027"></a>
### contentsTravelFlags

```ml
function contentsTravelFlags(value)
```

Translate AAS area contents into air, liquid, exclusion and team restriction travel flags.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `contents` and `flags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L108)

<a id="function-function-mq3-botlib-aas-routing-create-function-create-runtime-src-mq3-botlib-aas-routing-ml-1926952334"></a>
### create

```ml
function create(runtime)
```

Build routing settings, reachability records and travel masks from an initialized AAS map.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AAS routing runtime; accesses `initialized` and `map`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L84)

<a id="function-function-mq3-botlib-aas-routing-edgeallowed-function-edgeallowed-router-reach-travelflags-src-mq3-botlib-aas-routing-ml-409389249"></a>
### edgeAllowed

```ml
function edgeAllowed(router, reach, travelFlags)
```

Apply `mq3.botlib.aas_runtime.validArea` and `mq3.botlib.aas_routing.allowed` while evaluating `edgeAllowed`. Return paths include `allowed(required,travelFlags) and allowed(router.areaFlags[destination],travelFlags)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — | AAS routing state; accesses `runtime`, `travelTypeFlags` and `areaFlags`. |
| `reach` | `dynamic` | — | AAS reachability record; accesses `areaNum` and `travelType`. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L132)

<a id="function-function-mq3-botlib-aas-routing-fail-function-fail-message-src-mq3-botlib-aas-routing-ml-5783867"></a>
### fail

```ml
function fail(message)
```

Construct error `7530` with diagnostic text `"AAS routing: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L81)

- [mq3.botlib.aas_routing.Heap](Type-mq3-botlib-aas-routing-heap-1740437250.md) — struct
<a id="function-function-mq3-botlib-aas-routing-heapcreate-function-heapcreate-capacity-src-mq3-botlib-aas-routing-ml-590680214"></a>
### heapCreate

```ml
function heapCreate(capacity)
```

Create a `mq3.botlib.aas_routing.Heap` record, initializing `times` as `array(capacity+1,0)`, `reaches` as `array(capacity+1,0)` and `firstReaches` as `array(capacity+1,0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `capacity` | `dynamic` | — | Maximum number of entries to allocate or retain. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L165)

<a id="function-function-mq3-botlib-aas-routing-heapless-function-heapless-heap-left-right-src-mq3-botlib-aas-routing-ml-912131947"></a>
### heapLess

```ml
function heapLess(heap, left, right)
```

Order routing heap entries by travel time, breaking ties by reachability number.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `heap` | `dynamic` | — | Heap record; accesses `times` and `reaches`. |
| `left` | `dynamic` | — | Operand used to evaluate the returned expression `heap.times[left]<heap.times[right]`. |
| `right` | `dynamic` | — | Operand used to evaluate the returned expression `heap.times[left]<heap.times[right]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L170)

<a id="function-function-mq3-botlib-aas-routing-heappop-function-heappop-heap-src-mq3-botlib-aas-routing-ml-321738666"></a>
### heapPop

```ml
function heapPop(heap)
```

Update `heap.size`, `heap.times[1]`, `heap.reaches[1]` and `heap.firstReaches[1]` during `heapPop`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `heap` | `dynamic` | — | Heap record; accesses `size`, `times`, `reaches`, `firstReaches` and `positions`. May update `heap.size`, `heap.times[1]` and `heap.reaches[1]` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L198)

<a id="function-function-mq3-botlib-aas-routing-heapput-function-heapput-heap-reachnum-time-firstreach-src-mq3-botlib-aas-routing-ml-1213586329"></a>
### heapPut

```ml
function heapPut(heap, reachNum, time, firstReach)
```

Update `heap.size`, `heap.reaches[position]`, `heap.positions[reachNum]` and `heap.times[position]` and related state during `heapPut`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `heap` | `dynamic` | — | Heap record; accesses `positions`, `size`, `reaches`, `times` and `firstReaches`. May update `heap.size`, `heap.reaches[position]` and `heap.positions[reachNum]` and additional fields in place. |
| `reachNum` | `dynamic` | — | Value used by `heapPut` in `position=heap.positions[reachNum]`. |
| `time` | `dynamic` | — | Time value in the units expected by this module. |
| `firstReach` | `dynamic` | — | Value used by `heapPut` in `heap.firstReaches[position]=firstReach`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L189)

<a id="function-function-mq3-botlib-aas-routing-heapswap-function-heapswap-heap-left-right-src-mq3-botlib-aas-routing-ml-1164695531"></a>
### heapSwap

```ml
function heapSwap(heap, left, right)
```

Update `heap.times[left]`, `heap.times[right]`, `heap.reaches[left]` and `heap.reaches[right]` and related state during `heapSwap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `heap` | `dynamic` | — | Heap record; accesses `times`, `reaches`, `firstReaches` and `positions`. May update `heap.times[left]`, `heap.times[right]` and `heap.reaches[left]` and additional fields in place. |
| `left` | `dynamic` | — | Value used by `heapSwap` in `value=heap.times[left]`. |
| `right` | `dynamic` | — | Value used by `heapSwap` in `heap.times[left]=heap.times[right]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L178)

- [mq3.botlib.aas_routing.Route](Type-mq3-botlib-aas-routing-route-1884253753.md) — struct
- [mq3.botlib.aas_routing.Router](Type-mq3-botlib-aas-routing-router-403349521.md) — struct
<a id="extern_function-extern-function-mq3-botlib-aas-routing-scaleddistancenative-extern-function-scaleddistancenative-ax-as-double-ay-as-double-az-as-double-bx-as-double-by-as-double-bz-as-double-scale-as-double-from-miniquake3-abi-dll-symbol-mq3-scaled-distance3-trunc-returns-i32-src-mq3-botlib-aas-routing-ml-138898908"></a>
### scaledDistanceNative

```ml
extern function scaledDistanceNative(ax as double, ay as double, az as double, bx as double, by as double, bz as double, scale as double) from "miniquake3_abi.dll" symbol "mq3_scaled_distance3_trunc" returns i32
```

Calculate truncated scaled distance between two 3D points through the native routing helper.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ax` | `double` | — | Native `double` value forwarded in the `ax` argument of `scaledDistanceNative`. |
| `ay` | `double` | — | Native `double` value forwarded in the `ay` argument of `scaledDistanceNative`. |
| `az` | `double` | — | Native `double` value forwarded in the `az` argument of `scaledDistanceNative`. |
| `bx` | `double` | — | Native `double` value forwarded in the `bx` argument of `scaledDistanceNative`. |
| `by` | `double` | — | Native `double` value forwarded in the `by` argument of `scaledDistanceNative`. |
| `bz` | `double` | — | Native `double` value forwarded in the `bz` argument of `scaledDistanceNative`. |
| `scale` | `double` | — | Multiplier applied to the Euclidean distance before conversion to a signed integer. |


**Returns:** Scaled Euclidean distance truncated to the helper's signed 32-bit integer result.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L148)

<a id="function-function-mq3-botlib-aas-routing-searchfromarea-function-searchfromarea-router-areanum-origin-goalareanum-travelflags-times-src-mq3-botlib-aas-routing-ml-1945604579"></a>
### searchFromArea

```ml
function searchFromArea(router, areaNum, origin, goalAreaNum, travelFlags, times)
```

Dijkstra's first arrival in an area has the same cost as stopping the point-to-point search at that area. The one-source table needs no tie decision because item scoring reads travel time only.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — | AAS routing state; accesses `reaches` and `settings`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `goalAreaNum` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |
| `times` | `dynamic` | — | Array or byte sequence accessed at `currentArea`. Entries are written in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L247)

<a id="constant-constant-mq3-botlib-aas-routing-tfl-air-const-tfl-air-publicheaders-tfl-air-src-mq3-botlib-aas-routing-ml-1470994639"></a>
### TFL_AIR

```ml
const TFL_AIR = publicHeaders.TFL_AIR
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L51)

<a id="constant-constant-mq3-botlib-aas-routing-tfl-barrierjump-const-tfl-barrierjump-publicheaders-tfl-barrierjump-src-mq3-botlib-aas-routing-ml-87821420"></a>
### TFL_BARRIERJUMP

```ml
const TFL_BARRIERJUMP = publicHeaders.TFL_BARRIERJUMP
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L36)

<a id="constant-constant-mq3-botlib-aas-routing-tfl-bfgjump-const-tfl-bfgjump-publicheaders-tfl-bfgjump-src-mq3-botlib-aas-routing-ml-325432546"></a>
### TFL_BFGJUMP

```ml
const TFL_BFGJUMP = publicHeaders.TFL_BFGJUMP
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L45)

<a id="constant-constant-mq3-botlib-aas-routing-tfl-bridge-const-tfl-bridge-publicheaders-tfl-bridge-src-mq3-botlib-aas-routing-ml-160780176"></a>
### TFL_BRIDGE

```ml
const TFL_BRIDGE = publicHeaders.TFL_BRIDGE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L58)

<a id="constant-constant-mq3-botlib-aas-routing-tfl-crouch-const-tfl-crouch-publicheaders-tfl-crouch-src-mq3-botlib-aas-routing-ml-1165261049"></a>
### TFL_CROUCH

```ml
const TFL_CROUCH = publicHeaders.TFL_CROUCH
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L35)

<a id="constant-constant-mq3-botlib-aas-routing-tfl-default-const-tfl-default-publicheaders-tfl-default-src-mq3-botlib-aas-routing-ml-1007875490"></a>
### TFL_DEFAULT

```ml
const TFL_DEFAULT = publicHeaders.TFL_DEFAULT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L61)

<a id="constant-constant-mq3-botlib-aas-routing-tfl-donotenter-const-tfl-donotenter-publicheaders-tfl-donotenter-src-mq3-botlib-aas-routing-ml-340129955"></a>
### TFL_DONOTENTER

```ml
const TFL_DONOTENTER = publicHeaders.TFL_DONOTENTER
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L55)

<a id="constant-constant-mq3-botlib-aas-routing-tfl-doublejump-const-tfl-doublejump-publicheaders-tfl-doublejump-src-mq3-botlib-aas-routing-ml-651152156"></a>
### TFL_DOUBLEJUMP

```ml
const TFL_DOUBLEJUMP = publicHeaders.TFL_DOUBLEJUMP
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L47)

<a id="constant-constant-mq3-botlib-aas-routing-tfl-elevator-const-tfl-elevator-publicheaders-tfl-elevator-src-mq3-botlib-aas-routing-ml-656476117"></a>
### TFL_ELEVATOR

```ml
const TFL_ELEVATOR = publicHeaders.TFL_ELEVATOR
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L43)

<a id="constant-constant-mq3-botlib-aas-routing-tfl-flight-const-tfl-flight-publicheaders-tfl-flight-src-mq3-botlib-aas-routing-ml-1284308761"></a>
### TFL_FLIGHT

```ml
const TFL_FLIGHT = publicHeaders.TFL_FLIGHT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L57)

<a id="constant-constant-mq3-botlib-aas-routing-tfl-funcbob-const-tfl-funcbob-publicheaders-tfl-funcbob-src-mq3-botlib-aas-routing-ml-784769046"></a>
### TFL_FUNCBOB

```ml
const TFL_FUNCBOB = publicHeaders.TFL_FUNCBOB
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L56)

<a id="constant-constant-mq3-botlib-aas-routing-tfl-grapplehook-const-tfl-grapplehook-publicheaders-tfl-grapplehook-src-mq3-botlib-aas-routing-ml-99428891"></a>
### TFL_GRAPPLEHOOK

```ml
const TFL_GRAPPLEHOOK = publicHeaders.TFL_GRAPPLEHOOK
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L46)

<a id="constant-constant-mq3-botlib-aas-routing-tfl-invalid-const-tfl-invalid-publicheaders-tfl-invalid-src-mq3-botlib-aas-routing-ml-2096206032"></a>
### TFL_INVALID

```ml
const TFL_INVALID = publicHeaders.TFL_INVALID
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L33)

<a id="constant-constant-mq3-botlib-aas-routing-tfl-jump-const-tfl-jump-publicheaders-tfl-jump-src-mq3-botlib-aas-routing-ml-1640779159"></a>
### TFL_JUMP

```ml
const TFL_JUMP = publicHeaders.TFL_JUMP
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L37)

<a id="constant-constant-mq3-botlib-aas-routing-tfl-jumppad-const-tfl-jumppad-publicheaders-tfl-jumppad-src-mq3-botlib-aas-routing-ml-248037750"></a>
### TFL_JUMPPAD

```ml
const TFL_JUMPPAD = publicHeaders.TFL_JUMPPAD
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L50)

<a id="constant-constant-mq3-botlib-aas-routing-tfl-ladder-const-tfl-ladder-publicheaders-tfl-ladder-src-mq3-botlib-aas-routing-ml-255159559"></a>
### TFL_LADDER

```ml
const TFL_LADDER = publicHeaders.TFL_LADDER
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L38)

<a id="constant-constant-mq3-botlib-aas-routing-tfl-lava-const-tfl-lava-publicheaders-tfl-lava-src-mq3-botlib-aas-routing-ml-1900108505"></a>
### TFL_LAVA

```ml
const TFL_LAVA = publicHeaders.TFL_LAVA
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L54)

<a id="constant-constant-mq3-botlib-aas-routing-tfl-notteam1-const-tfl-notteam1-publicheaders-tfl-notteam1-src-mq3-botlib-aas-routing-ml-1656434678"></a>
### TFL_NOTTEAM1

```ml
const TFL_NOTTEAM1 = publicHeaders.TFL_NOTTEAM1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L59)

<a id="constant-constant-mq3-botlib-aas-routing-tfl-notteam2-const-tfl-notteam2-publicheaders-tfl-notteam2-src-mq3-botlib-aas-routing-ml-751992993"></a>
### TFL_NOTTEAM2

```ml
const TFL_NOTTEAM2 = publicHeaders.TFL_NOTTEAM2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L60)

<a id="constant-constant-mq3-botlib-aas-routing-tfl-rampjump-const-tfl-rampjump-publicheaders-tfl-rampjump-src-mq3-botlib-aas-routing-ml-1012571435"></a>
### TFL_RAMPJUMP

```ml
const TFL_RAMPJUMP = publicHeaders.TFL_RAMPJUMP
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L48)

<a id="constant-constant-mq3-botlib-aas-routing-tfl-rocketjump-const-tfl-rocketjump-publicheaders-tfl-rocketjump-src-mq3-botlib-aas-routing-ml-1355369311"></a>
### TFL_ROCKETJUMP

```ml
const TFL_ROCKETJUMP = publicHeaders.TFL_ROCKETJUMP
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L44)

<a id="constant-constant-mq3-botlib-aas-routing-tfl-slime-const-tfl-slime-publicheaders-tfl-slime-src-mq3-botlib-aas-routing-ml-178982411"></a>
### TFL_SLIME

```ml
const TFL_SLIME = publicHeaders.TFL_SLIME
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L53)

<a id="constant-constant-mq3-botlib-aas-routing-tfl-strafejump-const-tfl-strafejump-publicheaders-tfl-strafejump-src-mq3-botlib-aas-routing-ml-920135758"></a>
### TFL_STRAFEJUMP

```ml
const TFL_STRAFEJUMP = publicHeaders.TFL_STRAFEJUMP
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L49)

<a id="constant-constant-mq3-botlib-aas-routing-tfl-swim-const-tfl-swim-publicheaders-tfl-swim-src-mq3-botlib-aas-routing-ml-2037641619"></a>
### TFL_SWIM

```ml
const TFL_SWIM = publicHeaders.TFL_SWIM
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L40)

<a id="constant-constant-mq3-botlib-aas-routing-tfl-teleport-const-tfl-teleport-publicheaders-tfl-teleport-src-mq3-botlib-aas-routing-ml-1572803990"></a>
### TFL_TELEPORT

```ml
const TFL_TELEPORT = publicHeaders.TFL_TELEPORT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L42)

<a id="constant-constant-mq3-botlib-aas-routing-tfl-walk-const-tfl-walk-publicheaders-tfl-walk-src-mq3-botlib-aas-routing-ml-1885578268"></a>
### TFL_WALK

```ml
const TFL_WALK = publicHeaders.TFL_WALK
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L34)

<a id="constant-constant-mq3-botlib-aas-routing-tfl-walkoffledge-const-tfl-walkoffledge-publicheaders-tfl-walkoffledge-src-mq3-botlib-aas-routing-ml-1465244782"></a>
### TFL_WALKOFFLEDGE

```ml
const TFL_WALKOFFLEDGE = publicHeaders.TFL_WALKOFFLEDGE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L39)

<a id="constant-constant-mq3-botlib-aas-routing-tfl-water-const-tfl-water-publicheaders-tfl-water-src-mq3-botlib-aas-routing-ml-1456065632"></a>
### TFL_WATER

```ml
const TFL_WATER = publicHeaders.TFL_WATER
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L52)

<a id="constant-constant-mq3-botlib-aas-routing-tfl-waterjump-const-tfl-waterjump-publicheaders-tfl-waterjump-src-mq3-botlib-aas-routing-ml-1000600428"></a>
### TFL_WATERJUMP

```ml
const TFL_WATERJUMP = publicHeaders.TFL_WATERJUMP
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L41)

<a id="constant-constant-mq3-botlib-aas-routing-travel-barrierjump-const-travel-barrierjump-4-src-mq3-botlib-aas-routing-ml-777618291"></a>
### TRAVEL_BARRIERJUMP

```ml
const TRAVEL_BARRIERJUMP = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L16)

<a id="constant-constant-mq3-botlib-aas-routing-travel-bfgjump-const-travel-bfgjump-13-src-mq3-botlib-aas-routing-ml-1806682903"></a>
### TRAVEL_BFGJUMP

```ml
const TRAVEL_BFGJUMP = 13
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L25)

<a id="constant-constant-mq3-botlib-aas-routing-travel-crouch-const-travel-crouch-3-src-mq3-botlib-aas-routing-ml-865923732"></a>
### TRAVEL_CROUCH

```ml
const TRAVEL_CROUCH = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L15)

<a id="constant-constant-mq3-botlib-aas-routing-travel-doublejump-const-travel-doublejump-15-src-mq3-botlib-aas-routing-ml-960113523"></a>
### TRAVEL_DOUBLEJUMP

```ml
const TRAVEL_DOUBLEJUMP = 15
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L27)

<a id="constant-constant-mq3-botlib-aas-routing-travel-elevator-const-travel-elevator-11-src-mq3-botlib-aas-routing-ml-1863529703"></a>
### TRAVEL_ELEVATOR

```ml
const TRAVEL_ELEVATOR = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L23)

<a id="constant-constant-mq3-botlib-aas-routing-travel-funcbob-const-travel-funcbob-19-src-mq3-botlib-aas-routing-ml-1511498709"></a>
### TRAVEL_FUNCBOB

```ml
const TRAVEL_FUNCBOB = 19
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L31)

<a id="constant-constant-mq3-botlib-aas-routing-travel-grapplehook-const-travel-grapplehook-14-src-mq3-botlib-aas-routing-ml-952139968"></a>
### TRAVEL_GRAPPLEHOOK

```ml
const TRAVEL_GRAPPLEHOOK = 14
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L26)

<a id="constant-constant-mq3-botlib-aas-routing-travel-invalid-const-travel-invalid-1-src-mq3-botlib-aas-routing-ml-1681383472"></a>
### TRAVEL_INVALID

```ml
const TRAVEL_INVALID = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L13)

<a id="constant-constant-mq3-botlib-aas-routing-travel-jump-const-travel-jump-5-src-mq3-botlib-aas-routing-ml-1268041770"></a>
### TRAVEL_JUMP

```ml
const TRAVEL_JUMP = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L17)

<a id="constant-constant-mq3-botlib-aas-routing-travel-jumppad-const-travel-jumppad-18-src-mq3-botlib-aas-routing-ml-1352496958"></a>
### TRAVEL_JUMPPAD

```ml
const TRAVEL_JUMPPAD = 18
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L30)

<a id="constant-constant-mq3-botlib-aas-routing-travel-ladder-const-travel-ladder-6-src-mq3-botlib-aas-routing-ml-239958859"></a>
### TRAVEL_LADDER

```ml
const TRAVEL_LADDER = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L18)

<a id="constant-constant-mq3-botlib-aas-routing-travel-rampjump-const-travel-rampjump-16-src-mq3-botlib-aas-routing-ml-1212503746"></a>
### TRAVEL_RAMPJUMP

```ml
const TRAVEL_RAMPJUMP = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L28)

<a id="constant-constant-mq3-botlib-aas-routing-travel-rocketjump-const-travel-rocketjump-12-src-mq3-botlib-aas-routing-ml-1637845670"></a>
### TRAVEL_ROCKETJUMP

```ml
const TRAVEL_ROCKETJUMP = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L24)

<a id="constant-constant-mq3-botlib-aas-routing-travel-strafejump-const-travel-strafejump-17-src-mq3-botlib-aas-routing-ml-1956056077"></a>
### TRAVEL_STRAFEJUMP

```ml
const TRAVEL_STRAFEJUMP = 17
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L29)

<a id="constant-constant-mq3-botlib-aas-routing-travel-swim-const-travel-swim-8-src-mq3-botlib-aas-routing-ml-2005224421"></a>
### TRAVEL_SWIM

```ml
const TRAVEL_SWIM = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L20)

<a id="constant-constant-mq3-botlib-aas-routing-travel-teleport-const-travel-teleport-10-src-mq3-botlib-aas-routing-ml-19382520"></a>
### TRAVEL_TELEPORT

```ml
const TRAVEL_TELEPORT = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L22)

<a id="constant-constant-mq3-botlib-aas-routing-travel-walk-const-travel-walk-2-src-mq3-botlib-aas-routing-ml-1403067479"></a>
### TRAVEL_WALK

```ml
const TRAVEL_WALK = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L14)

<a id="constant-constant-mq3-botlib-aas-routing-travel-walkoffledge-const-travel-walkoffledge-7-src-mq3-botlib-aas-routing-ml-2015903216"></a>
### TRAVEL_WALKOFFLEDGE

```ml
const TRAVEL_WALKOFFLEDGE = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L19)

<a id="constant-constant-mq3-botlib-aas-routing-travel-waterjump-const-travel-waterjump-9-src-mq3-botlib-aas-routing-ml-762436852"></a>
### TRAVEL_WATERJUMP

```ml
const TRAVEL_WATERJUMP = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L21)

<a id="constant-constant-mq3-botlib-aas-routing-travelflag-notteam1-const-travelflag-notteam1-16777216-src-mq3-botlib-aas-routing-ml-1610958686"></a>
### TRAVELFLAG_NOTTEAM1

```ml
const TRAVELFLAG_NOTTEAM1 = 16777216
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L11)

<a id="constant-constant-mq3-botlib-aas-routing-travelflag-notteam2-const-travelflag-notteam2-33554432-src-mq3-botlib-aas-routing-ml-681532244"></a>
### TRAVELFLAG_NOTTEAM2

```ml
const TRAVELFLAG_NOTTEAM2 = 33554432
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L12)

<a id="function-function-mq3-botlib-aas-routing-travelflagfortype-function-travelflagfortype-traveltype-src-mq3-botlib-aas-routing-ml-933331096"></a>
### travelFlagForType

```ml
function travelFlagForType(travelType)
```

Map the masked AAS travel type to its travel flag, returning TFL_INVALID for an out-of-range type.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `travelType` | `dynamic` | — | AAS reachability travel-type code. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L98)

<a id="function-function-mq3-botlib-aas-routing-traveltimesfromarea-function-traveltimesfromarea-router-areanum-origin-travelflags-src-mq3-botlib-aas-routing-ml-904575243"></a>
### travelTimesFromArea

```ml
function travelTimesFromArea(router, areaNum, origin, travelFlags)
```

Apply `mq3.botlib.aas_runtime.validArea` and `mq3.botlib.aas_routing.searchFromArea` while evaluating `travelTimesFromArea`. Return paths include `times`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `router` | `dynamic` | — | AAS routing state; accesses `runtime` and `settings`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L231)

<a id="constant-constant-mq3-botlib-aas-routing-traveltype-mask-const-traveltype-mask-16777215-src-mq3-botlib-aas-routing-ml-849578027"></a>
### TRAVELTYPE_MASK

```ml
const TRAVELTYPE_MASK = 16777215
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_routing.ml#L10)
