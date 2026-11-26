# `src/mq3/botlib/aas_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.aas_runtime`](Package-mq3-botlib-aas-runtime-955684208.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/format/aas.ml` as `aas` → [src/mq3/format/aas.ml](File-src-mq3-format-aas-ml-835678928.md)
- `std/array.ml` as `arrays` → `../MiniLangCompilerML/std/array.ml` — external dependency

## Declarations

<a id="function-function-mq3-botlib-aas-runtime-absvalue-function-absvalue-value-src-mq3-botlib-aas-runtime-ml-1284588857"></a>
### absValue

```ml
function absValue(value)
```

Return the absolute value of the numeric argument for aas runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `0.0-value`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L209)

<a id="function-function-mq3-botlib-aas-runtime-appendunique-function-appendunique-values-value-maximum-src-mq3-botlib-aas-runtime-ml-873775471"></a>
### appendUnique

```ml
function appendUnique(values, value, maximum)
```

Append a positive area number only when it is absent and the result list has remaining capacity.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Array or byte sequence accessed at `index`. |
| `value` | `dynamic` | — | Value used by `appendUnique` in `if value<=0 then return values end if`. |
| `maximum` | `dynamic` | — | Upper bound applied by the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L202)

<a id="constant-constant-mq3-botlib-aas-runtime-area-disabled-const-area-disabled-8-src-mq3-botlib-aas-runtime-ml-1469355053"></a>
### AREA_DISABLED

```ml
const AREA_DISABLED = 8
```

Area is disabled for routing when set.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L15)

<a id="function-function-mq3-botlib-aas-runtime-areainfo-function-areainfo-runtime-areanum-src-mq3-botlib-aas-runtime-ml-5597887"></a>
### areaInfo

```ml
function areaInfo(runtime, areaNum)
```

Build the `mq3.botlib.aas_runtime.AreaInfo` result for `areaInfo`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AAS runtime; accesses `map` and `disabled`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L113)

- [mq3.botlib.aas_runtime.AreaInfo](Type-mq3-botlib-aas-runtime-areainfo-1589905451.md) — struct
<a id="function-function-mq3-botlib-aas-runtime-areareachability-function-areareachability-runtime-areanum-src-mq3-botlib-aas-runtime-ml-302353975"></a>
### areaReachability

```ml
function areaReachability(runtime, areaNum)
```

Apply `mq3.botlib.aas_runtime.validArea` and `mq3.format.aas.areaSettings` while evaluating `areaReachability`. Return paths include `settings.numReachableAreas`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AAS runtime; accesses `map`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L122)

<a id="function-function-mq3-botlib-aas-runtime-areavolume-function-areavolume-runtime-areanum-src-mq3-botlib-aas-runtime-ml-900869567"></a>
### areaVolume

```ml
function areaVolume(runtime, areaNum)
```

Apply `mq3.botlib.aas_runtime.validArea`, `mq3.format.aas.area` and `mq3.format.aas.faceIndex` while evaluating `areaVolume`. Return paths include `volume/3.0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AAS runtime; accesses `map`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L156)

<a id="function-function-mq3-botlib-aas-runtime-bboxareas-function-bboxareas-runtime-mins-maxs-maximum-src-mq3-botlib-aas-runtime-ml-2009694552"></a>
### bboxAreas

```ml
function bboxAreas(runtime, mins, maxs, maximum)
```

Apply `mq3.botlib.aas_runtime.appendUnique`, `mq3.format.aas.node` and `mq3.format.aas.plane` while evaluating `bboxAreas`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AAS runtime; accesses `initialized` and `map`. |
| `mins` | `dynamic` | — | Minimum coordinates of the axis-aligned bounds. |
| `maxs` | `dynamic` | — | Maximum coordinates of the axis-aligned bounds. |
| `maximum` | `dynamic` | — | Upper bound applied by the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L215)

<a id="function-function-mq3-botlib-aas-runtime-create-function-create-map-src-mq3-botlib-aas-runtime-ml-103902840"></a>
### create

```ml
function create(map)
```

Build the `mq3.botlib.aas_runtime.Runtime` result for `create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Map record; accesses `counts`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L63)

<a id="function-function-mq3-botlib-aas-runtime-dot-function-dot-point-normal-src-mq3-botlib-aas-runtime-ml-365263563"></a>
### dot

```ml
function dot(point, normal)
```

Return `point[0]*normal[0]+point[1]*normal[1]+point[2]*normal[2]` for `dot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |
| `normal` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L76)

<a id="function-function-mq3-botlib-aas-runtime-enableroutingarea-function-enableroutingarea-runtime-areanum-enable-src-mq3-botlib-aas-runtime-ml-1683837510"></a>
### enableRoutingArea

```ml
function enableRoutingArea(runtime, areaNum, enable)
```

Set `runtime.disabled[areaNum]` to `not (enable!=0)` and `runtime.cacheInvalidations` to `runtime.cacheInvalidations+1` in `mq3.botlib.aas_runtime.enableRoutingArea`. Return paths include `wasEnabled`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AAS runtime; accesses `disabled` and `cacheInvalidations`. May update `runtime.disabled[areaNum]` and `runtime.cacheInvalidations` in place. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `enable` | `dynamic` | — | Value used by `enableRoutingArea` in `if enable<0 then return wasEnabled end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L193)

<a id="function-function-mq3-botlib-aas-runtime-facearea-function-facearea-runtime-facenum-src-mq3-botlib-aas-runtime-ml-114550183"></a>
### faceArea

```ml
function faceArea(runtime, faceNum)
```

Apply `mq3.format.aas.face`, `mq3.format.aas.edgeIndex` and `mq3.format.aas.edge` while evaluating `faceArea`. Return paths include `total`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AAS runtime; accesses `map`. |
| `faceNum` | `dynamic` | — | AAS face index. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L139)

<a id="function-function-mq3-botlib-aas-runtime-fail-function-fail-message-src-mq3-botlib-aas-runtime-ml-722626567"></a>
### fail

```ml
function fail(message)
```

Construct error `7520` with diagnostic text `"AAS runtime: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L60)

<a id="function-function-mq3-botlib-aas-runtime-gettime-function-gettime-runtime-src-mq3-botlib-aas-runtime-ml-244166980"></a>
### getTime

```ml
function getTime(runtime)
```

Return the AAS runtime time, or zero when the runtime is absent.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AAS runtime; accesses `time`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L238)

<a id="function-function-mq3-botlib-aas-runtime-nextareareachability-function-nextareareachability-runtime-areanum-reachnum-src-mq3-botlib-aas-runtime-ml-1010725056"></a>
### nextAreaReachability

```ml
function nextAreaReachability(runtime, areaNum, reachNum)
```

Apply `mq3.botlib.aas_runtime.validArea` and `mq3.format.aas.areaSettings` while evaluating `nextAreaReachability`. Return paths include `reachNum`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AAS runtime; accesses `map`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `reachNum` | `dynamic` | — | Operand used to evaluate the returned expression `reachNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L176)

<a id="function-function-mq3-botlib-aas-runtime-pointareanum-function-pointareanum-runtime-point-src-mq3-botlib-aas-runtime-ml-2034106588"></a>
### pointAreaNum

```ml
function pointAreaNum(runtime, point)
```

Traverse the AAS BSP nodes to locate the area containing the supplied point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AAS runtime; accesses `initialized`, `map`, `nodeCache` and `planeCache`. May update `runtime.nodeCache[nodeNum]` and `runtime.planeCache[node.planeNum]` in place. |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L80)

<a id="function-function-mq3-botlib-aas-runtime-pointpresencetype-function-pointpresencetype-runtime-point-src-mq3-botlib-aas-runtime-ml-1335026198"></a>
### pointPresenceType

```ml
function pointPresenceType(runtime, point)
```

Apply `mq3.botlib.aas_runtime.pointAreaNum` and `mq3.format.aas.areaSettings` while evaluating `pointPresenceType`. Return paths include `settings.presenceType`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AAS runtime; accesses `map`. |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L100)

<a id="constant-constant-mq3-botlib-aas-runtime-presence-crouch-const-presence-crouch-4-src-mq3-botlib-aas-runtime-ml-885450937"></a>
### PRESENCE_CROUCH

```ml
const PRESENCE_CROUCH = 4
```

AAS presence-mask value selecting crouch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L13)

<a id="constant-constant-mq3-botlib-aas-runtime-presence-normal-const-presence-normal-2-src-mq3-botlib-aas-runtime-ml-1023069479"></a>
### PRESENCE_NORMAL

```ml
const PRESENCE_NORMAL = 2
```

AAS presence-mask value selecting normal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L11)

<a id="function-function-mq3-botlib-aas-runtime-presencetypeboundingbox-function-presencetypeboundingbox-presencetype-src-mq3-botlib-aas-runtime-ml-1903546129"></a>
### presenceTypeBoundingBox

```ml
function presenceTypeBoundingBox(presenceType)
```

Return standing or crouching player bounds for the presence type and reject unsupported types.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `presenceType` | `dynamic` | — | AAS presence type selecting the movement bounds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L105)

<a id="function-function-mq3-botlib-aas-runtime-reachabilityfromnum-function-reachabilityfromnum-runtime-reachnum-src-mq3-botlib-aas-runtime-ml-342539303"></a>
### reachabilityFromNum

```ml
function reachabilityFromNum(runtime, reachNum)
```

Apply `mq3.format.aas.reachability` while evaluating `reachabilityFromNum`. Return paths include `aas.reachability(runtime.map,reachNum)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AAS runtime; accesses `initialized` and `map`. |
| `reachNum` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L185)

- [mq3.botlib.aas_runtime.Runtime](Type-mq3-botlib-aas-runtime-runtime-1457431506.md) — struct
<a id="function-function-mq3-botlib-aas-runtime-settime-function-settime-runtime-value-src-mq3-botlib-aas-runtime-ml-1967406547"></a>
### setTime

```ml
function setTime(runtime, value)
```

Set `runtime.time` to `value` in `mq3.botlib.aas_runtime.setTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AAS runtime; accesses `time`. May update `runtime.time` in place. |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `value`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L235)

<a id="function-function-mq3-botlib-aas-runtime-validarea-function-validarea-runtime-areanum-src-mq3-botlib-aas-runtime-ml-1667646997"></a>
### validArea

```ml
function validArea(runtime, areaNum)
```

Test `runtime!=void and runtime.initialized and areaNum>0 and areaNum<runtime.map.counts[aas.LUMP_AREAS]` as the condition for `validArea`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AAS runtime; accesses `initialized` and `map`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L72)

<a id="function-function-mq3-botlib-aas-runtime-vectorcross-function-vectorcross-a-b-src-mq3-botlib-aas-runtime-ml-605056689"></a>
### vectorCross

```ml
function vectorCross(a, b)
```

Return a new array `[a[1]*b[2]-a[2]*b[1],a[2]*b[0]-a[0]*b[2],a[0]*b[1]-a[1]*b[0]]` for `vectorCross`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `b` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L132)

<a id="function-function-mq3-botlib-aas-runtime-vectorlength-function-vectorlength-value-src-mq3-botlib-aas-runtime-ml-1694955825"></a>
### vectorLength

```ml
function vectorLength(value)
```

Forward `vectorLength` to `mq3.compat.numeric.fsqrt` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L135)

<a id="function-function-mq3-botlib-aas-runtime-vectorsubtract-function-vectorsubtract-a-b-src-mq3-botlib-aas-runtime-ml-1431325423"></a>
### vectorSubtract

```ml
function vectorSubtract(a, b)
```

Return a new array `[a[0]-b[0],a[1]-b[1],a[2]-b[2]]` for `vectorSubtract`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `b` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_runtime.ml#L128)
