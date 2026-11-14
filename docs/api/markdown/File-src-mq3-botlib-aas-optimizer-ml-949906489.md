# `src/mq3/botlib/aas_optimizer.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.aas_optimizer`](Package-mq3-botlib-aas-optimizer-1503201435.md)

Reachable from entry: **no**

## Imports

- `mq3/format/aas.ml` as `aas` → [src/mq3/format/aas.ml](File-src-mq3-format-aas-ml-835678928.md)

## Declarations

<a id="function-function-mq3-botlib-aas-optimizer-absindex-function-absindex-value-src-mq3-botlib-aas-optimizer-ml-867065479"></a>
### absIndex

```ml
function absIndex(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L30)

- [mq3.botlib.aas_optimizer.Action](Type-mq3-botlib-aas-optimizer-action-1500456565.md) — struct
<a id="function-function-mq3-botlib-aas-optimizer-area-function-area-areanum-numfaces-firstface-mins-maxs-center-src-mq3-botlib-aas-optimizer-ml-2042477927"></a>
### area

```ml
function area(areaNum, numFaces, firstFace, mins, maxs, center)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `areaNum` | `dynamic` | — |  |
| `numFaces` | `dynamic` | — |  |
| `firstFace` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `center` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L24)

- [mq3.botlib.aas_optimizer.Area](Type-mq3-botlib-aas-optimizer-area-950683266.md) — struct
<a id="function-function-mq3-botlib-aas-optimizer-copy3-function-copy3-value-src-mq3-botlib-aas-optimizer-ml-943860107"></a>
### copy3

```ml
function copy3(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L27)

<a id="function-function-mq3-botlib-aas-optimizer-copyarea-function-copyarea-value-src-mq3-botlib-aas-optimizer-ml-1795427807"></a>
### copyArea

```ml
function copyArea(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L29)

<a id="function-function-mq3-botlib-aas-optimizer-copyface-function-copyface-value-src-mq3-botlib-aas-optimizer-ml-1391163643"></a>
### copyFace

```ml
function copyFace(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L28)

<a id="function-function-mq3-botlib-aas-optimizer-edge-function-edge-a-b-src-mq3-botlib-aas-optimizer-ml-917045835"></a>
### edge

```ml
function edge(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L22)

- [mq3.botlib.aas_optimizer.Edge](Type-mq3-botlib-aas-optimizer-edge-1105959402.md) — struct
<a id="function-function-mq3-botlib-aas-optimizer-face-function-face-planenum-flags-numedges-firstedge-frontarea-backarea-src-mq3-botlib-aas-optimizer-ml-1410929146"></a>
### face

```ml
function face(planeNum, flags, numEdges, firstEdge, frontArea, backArea)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `planeNum` | `dynamic` | — |  |
| `flags` | `dynamic` | — |  |
| `numEdges` | `dynamic` | — |  |
| `firstEdge` | `dynamic` | — |  |
| `frontArea` | `dynamic` | — |  |
| `backArea` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L23)

- [mq3.botlib.aas_optimizer.Face](Type-mq3-botlib-aas-optimizer-face-1027663558.md) — struct
<a id="constant-constant-mq3-botlib-aas-optimizer-face-ladder-const-face-ladder-2-src-mq3-botlib-aas-optimizer-ml-1709122265"></a>
### FACE_LADDER

```ml
const FACE_LADDER = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L8)

<a id="function-function-mq3-botlib-aas-optimizer-frommap-function-frommap-map-mapname-time-retailactive-src-mq3-botlib-aas-optimizer-ml-1339027359"></a>
### fromMap

```ml
function fromMap(map, mapName, time, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |
| `mapName` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L68)

<a id="function-function-mq3-botlib-aas-optimizer-keepedge-function-keepedge-value-src-mq3-botlib-aas-optimizer-ml-49513043"></a>
### keepEdge

```ml
function keepEdge(value)
```

AAS_KeepEdge

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L34)

<a id="function-function-mq3-botlib-aas-optimizer-keepface-function-keepface-value-src-mq3-botlib-aas-optimizer-ml-2103044335"></a>
### keepFace

```ml
function keepFace(value)
```

AAS_KeepFace

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L36)

<a id="function-function-mq3-botlib-aas-optimizer-optimize-function-optimize-source-src-mq3-botlib-aas-optimizer-ml-914773489"></a>
### optimize

```ml
function optimize(source)
```

AAS_Optimize

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L64)

<a id="function-function-mq3-botlib-aas-optimizer-optimizealloc-function-optimizealloc-source-src-mq3-botlib-aas-optimizer-ml-1473690485"></a>
### optimizeAlloc

```ml
function optimizeAlloc(source)
```

AAS_OptimizeAlloc

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L39)

<a id="function-function-mq3-botlib-aas-optimizer-optimizearea-function-optimizearea-source-optimized-areanum-src-mq3-botlib-aas-optimizer-ml-1490564101"></a>
### optimizeArea

```ml
function optimizeArea(source, optimized, areaNum)
```

AAS_OptimizeArea

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `optimized` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L54)

- [mq3.botlib.aas_optimizer.Optimized](Type-mq3-botlib-aas-optimizer-optimized-1630032316.md) — struct
<a id="function-function-mq3-botlib-aas-optimizer-optimizeedge-function-optimizeedge-source-optimized-edgenum-src-mq3-botlib-aas-optimizer-ml-1488232581"></a>
### optimizeEdge

```ml
function optimizeEdge(source, optimized, edgeNum)
```

AAS_OptimizeEdge

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `optimized` | `dynamic` | — |  |
| `edgeNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L44)

<a id="function-function-mq3-botlib-aas-optimizer-optimizeface-function-optimizeface-source-optimized-facenum-src-mq3-botlib-aas-optimizer-ml-1514190233"></a>
### optimizeFace

```ml
function optimizeFace(source, optimized, faceNum)
```

AAS_OptimizeFace

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `optimized` | `dynamic` | — |  |
| `faceNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L49)

<a id="function-function-mq3-botlib-aas-optimizer-optimizestore-function-optimizestore-source-optimized-src-mq3-botlib-aas-optimizer-ml-2064786358"></a>
### optimizeStore

```ml
function optimizeStore(source, optimized)
```

AAS_OptimizeStore

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — |  |
| `optimized` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L59)

<a id="function-function-mq3-botlib-aas-optimizer-reachability-function-reachability-areanum-facenum-edgenum-start-finish-traveltype-traveltime-src-mq3-botlib-aas-optimizer-ml-1556454025"></a>
### reachability

```ml
function reachability(areaNum, faceNum, edgeNum, start, finish, travelType, travelTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `areaNum` | `dynamic` | — |  |
| `faceNum` | `dynamic` | — |  |
| `edgeNum` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `travelType` | `dynamic` | — |  |
| `travelTime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L25)

- [mq3.botlib.aas_optimizer.Reachability](Type-mq3-botlib-aas-optimizer-reachability-1494583068.md) — struct
<a id="function-function-mq3-botlib-aas-optimizer-signed-function-signed-index-source-src-mq3-botlib-aas-optimizer-ml-184050119"></a>
### signed

```ml
function signed(index, source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L31)

<a id="constant-constant-mq3-botlib-aas-optimizer-travel-elevator-const-travel-elevator-11-src-mq3-botlib-aas-optimizer-ml-1885567975"></a>
### TRAVEL_ELEVATOR

```ml
const TRAVEL_ELEVATOR = 11
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L9)

<a id="constant-constant-mq3-botlib-aas-optimizer-travel-funcbob-const-travel-funcbob-19-src-mq3-botlib-aas-optimizer-ml-836324885"></a>
### TRAVEL_FUNCBOB

```ml
const TRAVEL_FUNCBOB = 19
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L11)

<a id="constant-constant-mq3-botlib-aas-optimizer-travel-jumppad-const-travel-jumppad-18-src-mq3-botlib-aas-optimizer-ml-1541094722"></a>
### TRAVEL_JUMPPAD

```ml
const TRAVEL_JUMPPAD = 18
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L10)

<a id="constant-constant-mq3-botlib-aas-optimizer-traveltype-mask-const-traveltype-mask-16777215-src-mq3-botlib-aas-optimizer-ml-1473589543"></a>
### TRAVELTYPE_MASK

```ml
const TRAVELTYPE_MASK = 16777215
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L12)

<a id="function-function-mq3-botlib-aas-optimizer-world-function-world-mapname-loaded-time-vertexes-edges-edgeindex-faces-faceindex-areas-reachabilities-retailactive-src-mq3-botlib-aas-optimizer-ml-1510317441"></a>
### world

```ml
function world(mapName, loaded, time, vertexes, edges, edgeIndex, faces, faceIndex, areas, reachabilities, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mapName` | `dynamic` | — |  |
| `loaded` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `vertexes` | `dynamic` | — |  |
| `edges` | `dynamic` | — |  |
| `edgeIndex` | `dynamic` | — |  |
| `faces` | `dynamic` | — |  |
| `faceIndex` | `dynamic` | — |  |
| `areas` | `dynamic` | — |  |
| `reachabilities` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_optimizer.ml#L26)

- [mq3.botlib.aas_optimizer.World](Type-mq3-botlib-aas-optimizer-world-1897776461.md) — struct
