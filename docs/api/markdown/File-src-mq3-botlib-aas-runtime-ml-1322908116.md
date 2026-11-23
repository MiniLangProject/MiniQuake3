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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L113)

<a id="function-function-mq3-botlib-aas-runtime-appendunique-function-appendunique-values-value-maximum-src-mq3-botlib-aas-runtime-ml-873775471"></a>
### appendUnique

```ml
function appendUnique(values, value, maximum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `maximum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L108)

<a id="constant-constant-mq3-botlib-aas-runtime-area-disabled-const-area-disabled-8-src-mq3-botlib-aas-runtime-ml-1469355053"></a>
### AREA_DISABLED

```ml
const AREA_DISABLED = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L12)

<a id="function-function-mq3-botlib-aas-runtime-areainfo-function-areainfo-runtime-areanum-src-mq3-botlib-aas-runtime-ml-5597887"></a>
### areaInfo

```ml
function areaInfo(runtime, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L51)

- [mq3.botlib.aas_runtime.AreaInfo](Type-mq3-botlib-aas-runtime-areainfo-1589905451.md) — struct
<a id="function-function-mq3-botlib-aas-runtime-areareachability-function-areareachability-runtime-areanum-src-mq3-botlib-aas-runtime-ml-302353975"></a>
### areaReachability

```ml
function areaReachability(runtime, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L57)

<a id="function-function-mq3-botlib-aas-runtime-areavolume-function-areavolume-runtime-areanum-src-mq3-botlib-aas-runtime-ml-900869567"></a>
### areaVolume

```ml
function areaVolume(runtime, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L77)

<a id="function-function-mq3-botlib-aas-runtime-bboxareas-function-bboxareas-runtime-mins-maxs-maximum-src-mq3-botlib-aas-runtime-ml-2009694552"></a>
### bboxAreas

```ml
function bboxAreas(runtime, mins, maxs, maximum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `maximum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L114)

<a id="function-function-mq3-botlib-aas-runtime-create-function-create-map-src-mq3-botlib-aas-runtime-ml-103902840"></a>
### create

```ml
function create(map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L18)

<a id="function-function-mq3-botlib-aas-runtime-dot-function-dot-point-normal-src-mq3-botlib-aas-runtime-ml-365263563"></a>
### dot

```ml
function dot(point, normal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | `dynamic` | — |  |
| `normal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L25)

<a id="function-function-mq3-botlib-aas-runtime-enableroutingarea-function-enableroutingarea-runtime-areanum-enable-src-mq3-botlib-aas-runtime-ml-1683837510"></a>
### enableRoutingArea

```ml
function enableRoutingArea(runtime, areaNum, enable)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `enable` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L103)

<a id="function-function-mq3-botlib-aas-runtime-facearea-function-facearea-runtime-facenum-src-mq3-botlib-aas-runtime-ml-114550183"></a>
### faceArea

```ml
function faceArea(runtime, faceNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `faceNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L63)

<a id="function-function-mq3-botlib-aas-runtime-fail-function-fail-message-src-mq3-botlib-aas-runtime-ml-722626567"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L17)

<a id="function-function-mq3-botlib-aas-runtime-gettime-function-gettime-runtime-src-mq3-botlib-aas-runtime-ml-244166980"></a>
### getTime

```ml
function getTime(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L132)

<a id="function-function-mq3-botlib-aas-runtime-nextareareachability-function-nextareareachability-runtime-areanum-reachnum-src-mq3-botlib-aas-runtime-ml-1010725056"></a>
### nextAreaReachability

```ml
function nextAreaReachability(runtime, areaNum, reachNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `reachNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L93)

<a id="function-function-mq3-botlib-aas-runtime-pointareanum-function-pointareanum-runtime-point-src-mq3-botlib-aas-runtime-ml-2034106588"></a>
### pointAreaNum

```ml
function pointAreaNum(runtime, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L26)

<a id="function-function-mq3-botlib-aas-runtime-pointpresencetype-function-pointpresencetype-runtime-point-src-mq3-botlib-aas-runtime-ml-1335026198"></a>
### pointPresenceType

```ml
function pointPresenceType(runtime, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L43)

<a id="constant-constant-mq3-botlib-aas-runtime-presence-crouch-const-presence-crouch-4-src-mq3-botlib-aas-runtime-ml-885450937"></a>
### PRESENCE_CROUCH

```ml
const PRESENCE_CROUCH = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L11)

<a id="constant-constant-mq3-botlib-aas-runtime-presence-normal-const-presence-normal-2-src-mq3-botlib-aas-runtime-ml-1023069479"></a>
### PRESENCE_NORMAL

```ml
const PRESENCE_NORMAL = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L10)

<a id="function-function-mq3-botlib-aas-runtime-presencetypeboundingbox-function-presencetypeboundingbox-presencetype-src-mq3-botlib-aas-runtime-ml-1903546129"></a>
### presenceTypeBoundingBox

```ml
function presenceTypeBoundingBox(presenceType)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `presenceType` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L46)

<a id="function-function-mq3-botlib-aas-runtime-reachabilityfromnum-function-reachabilityfromnum-runtime-reachnum-src-mq3-botlib-aas-runtime-ml-342539303"></a>
### reachabilityFromNum

```ml
function reachabilityFromNum(runtime, reachNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `reachNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L99)

- [mq3.botlib.aas_runtime.Runtime](Type-mq3-botlib-aas-runtime-runtime-1457431506.md) — struct
<a id="function-function-mq3-botlib-aas-runtime-settime-function-settime-runtime-value-src-mq3-botlib-aas-runtime-ml-1967406547"></a>
### setTime

```ml
function setTime(runtime, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L131)

<a id="function-function-mq3-botlib-aas-runtime-validarea-function-validarea-runtime-areanum-src-mq3-botlib-aas-runtime-ml-1667646997"></a>
### validArea

```ml
function validArea(runtime, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L24)

<a id="function-function-mq3-botlib-aas-runtime-vectorcross-function-vectorcross-a-b-src-mq3-botlib-aas-runtime-ml-605056689"></a>
### vectorCross

```ml
function vectorCross(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L61)

<a id="function-function-mq3-botlib-aas-runtime-vectorlength-function-vectorlength-value-src-mq3-botlib-aas-runtime-ml-1694955825"></a>
### vectorLength

```ml
function vectorLength(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L62)

<a id="function-function-mq3-botlib-aas-runtime-vectorsubtract-function-vectorsubtract-a-b-src-mq3-botlib-aas-runtime-ml-1431325423"></a>
### vectorSubtract

```ml
function vectorSubtract(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_runtime.ml#L60)
