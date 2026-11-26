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

Return the absolute value of the numeric argument for aas optimizer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `0-value`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L82)

- [mq3.botlib.aas_optimizer.Action](Type-mq3-botlib-aas-optimizer-action-1500456565.md) — struct
<a id="function-function-mq3-botlib-aas-optimizer-area-function-area-areanum-numfaces-firstface-mins-maxs-center-src-mq3-botlib-aas-optimizer-ml-2042477927"></a>
### area

```ml
function area(areaNum, numFaces, firstFace, mins, maxs, center)
```

Create a `mq3.botlib.aas_optimizer.Area` record, initializing `areaNum` from `areaNum`, `numFaces` from `numFaces` and `firstFace` from `firstFace`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `numFaces` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_optimizer.Area.numFaces`. |
| `firstFace` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_optimizer.Area.firstFace`. |
| `mins` | `dynamic` | — | Minimum coordinates of the axis-aligned bounds. |
| `maxs` | `dynamic` | — | Maximum coordinates of the axis-aligned bounds. |
| `center` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_optimizer.Area.center`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L48)

- [mq3.botlib.aas_optimizer.Area](Type-mq3-botlib-aas-optimizer-area-950683266.md) — struct
<a id="function-function-mq3-botlib-aas-optimizer-copy3-function-copy3-value-src-mq3-botlib-aas-optimizer-ml-943860107"></a>
### copy3

```ml
function copy3(value)
```

Copy `value[0]`, `value[1]` and `value[2]` into a new ordered array for aas optimizer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L73)

<a id="function-function-mq3-botlib-aas-optimizer-copyarea-function-copyarea-value-src-mq3-botlib-aas-optimizer-ml-1795427807"></a>
### copyArea

```ml
function copyArea(value)
```

Create a `mq3.botlib.aas_optimizer.Area` record, initializing `areaNum` as `value.areaNum`, `numFaces` as `value.numFaces` and `firstFace` as `value.firstFace`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `areaNum`, `numFaces`, `firstFace`, `mins` and `maxs` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L79)

<a id="function-function-mq3-botlib-aas-optimizer-copyface-function-copyface-value-src-mq3-botlib-aas-optimizer-ml-1391163643"></a>
### copyFace

```ml
function copyFace(value)
```

Create a `mq3.botlib.aas_optimizer.Face` record, initializing `planeNum` as `value.planeNum`, `flags` as `value.flags` and `numEdges` as `value.numEdges`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `planeNum`, `flags`, `numEdges`, `firstEdge` and `frontArea` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L76)

<a id="function-function-mq3-botlib-aas-optimizer-edge-function-edge-a-b-src-mq3-botlib-aas-optimizer-ml-917045835"></a>
### edge

```ml
function edge(a, b)
```

Create a `mq3.botlib.aas_optimizer.Edge` record, initializing `vertices` as `[a,b]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Operand used to evaluate the returned expression `Edge([a,b])`. |
| `b` | `dynamic` | — | Operand used to evaluate the returned expression `Edge([a,b])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L32)

- [mq3.botlib.aas_optimizer.Edge](Type-mq3-botlib-aas-optimizer-edge-1105959402.md) — struct
<a id="function-function-mq3-botlib-aas-optimizer-face-function-face-planenum-flags-numedges-firstedge-frontarea-backarea-src-mq3-botlib-aas-optimizer-ml-1410929146"></a>
### face

```ml
function face(planeNum, flags, numEdges, firstEdge, frontArea, backArea)
```

Create a `mq3.botlib.aas_optimizer.Face` record, initializing `planeNum` from `planeNum`, `flags` from `flags` and `numEdges` from `numEdges`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `planeNum` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_optimizer.Face.planeNum`. |
| `flags` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_optimizer.Face.flags`. |
| `numEdges` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_optimizer.Face.numEdges`. |
| `firstEdge` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_optimizer.Face.firstEdge`. |
| `frontArea` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_optimizer.Face.frontArea`. |
| `backArea` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_optimizer.Face.backArea`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L40)

- [mq3.botlib.aas_optimizer.Face](Type-mq3-botlib-aas-optimizer-face-1027663558.md) — struct
<a id="constant-constant-mq3-botlib-aas-optimizer-face-ladder-const-face-ladder-2-src-mq3-botlib-aas-optimizer-ml-1709122265"></a>
### FACE_LADDER

```ml
const FACE_LADDER = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L8)

<a id="function-function-mq3-botlib-aas-optimizer-frommap-function-frommap-map-mapname-time-retailactive-src-mq3-botlib-aas-optimizer-ml-1339027359"></a>
### fromMap

```ml
function fromMap(map, mapName, time, retailActive)
```

Apply `mq3.format.aas.vertex`, `mq3.format.aas.edge` and `mq3.format.aas.edgeIndex` while evaluating `fromMap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Map record; accesses `counts`. |
| `mapName` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_optimizer.World.mapName`. |
| `time` | `dynamic` | — | Time value in the units expected by this module. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L143)

<a id="function-function-mq3-botlib-aas-optimizer-keepedge-function-keepedge-value-src-mq3-botlib-aas-optimizer-ml-49513043"></a>
### keepEdge

```ml
function keepEdge(value)
```

AAS_KeepEdge

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Not read by this implementation; retained in the `keepEdge` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L90)

<a id="function-function-mq3-botlib-aas-optimizer-keepface-function-keepface-value-src-mq3-botlib-aas-optimizer-ml-2103044335"></a>
### keepFace

```ml
function keepFace(value)
```

AAS_KeepFace

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `flags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L93)

<a id="function-function-mq3-botlib-aas-optimizer-optimize-function-optimize-source-src-mq3-botlib-aas-optimizer-ml-914773489"></a>
### optimize

```ml
function optimize(source)
```

AAS_Optimize

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `loaded`, `areas`, `reachability`, `retailActive` and `actions`. May update `source.actions` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L134)

<a id="function-function-mq3-botlib-aas-optimizer-optimizealloc-function-optimizealloc-source-src-mq3-botlib-aas-optimizer-ml-1473690485"></a>
### optimizeAlloc

```ml
function optimizeAlloc(source)
```

AAS_OptimizeAlloc

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `areas`, `vertexes`, `edges` and `faces`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L97)

<a id="function-function-mq3-botlib-aas-optimizer-optimizearea-function-optimizearea-source-optimized-areanum-src-mq3-botlib-aas-optimizer-ml-1490564101"></a>
### optimizeArea

```ml
function optimizeArea(source, optimized, areaNum)
```

AAS_OptimizeArea

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `areas` and `faceIndex`. |
| `optimized` | `dynamic` | — | Optimized record; accesses `faceIndex` and `areas`. May update `optimized.faceIndex` and `optimized.areas[areaNum]` in place. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L121)

- [mq3.botlib.aas_optimizer.Optimized](Type-mq3-botlib-aas-optimizer-optimized-1630032316.md) — struct
<a id="function-function-mq3-botlib-aas-optimizer-optimizeedge-function-optimizeedge-source-optimized-edgenum-src-mq3-botlib-aas-optimizer-ml-1488232581"></a>
### optimizeEdge

```ml
function optimizeEdge(source, optimized, edgeNum)
```

AAS_OptimizeEdge

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `edges` and `vertexes`. |
| `optimized` | `dynamic` | — | Optimized record; accesses `edgeOptimizeIndex`, `vertexOptimizeIndex`, `vertexes` and `edges`. May update `optimized.vertexes`, `optimized.vertexOptimizeIndex[vertex]` and `optimized.edges` and additional fields in place. |
| `edgeNum` | `dynamic` | — | Operand used to evaluate the returned expression `0-value`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L105)

<a id="function-function-mq3-botlib-aas-optimizer-optimizeface-function-optimizeface-source-optimized-facenum-src-mq3-botlib-aas-optimizer-ml-1514190233"></a>
### optimizeFace

```ml
function optimizeFace(source, optimized, faceNum)
```

AAS_OptimizeFace

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `faces` and `edgeIndex`. |
| `optimized` | `dynamic` | — | Optimized record; accesses `faceOptimizeIndex`, `edgeIndex` and `faces`. May update `optimized.edgeIndex`, `optimized.faces` and `optimized.faceOptimizeIndex[index]` in place. |
| `faceNum` | `dynamic` | — | AAS face index. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L113)

<a id="function-function-mq3-botlib-aas-optimizer-optimizestore-function-optimizestore-source-optimized-src-mq3-botlib-aas-optimizer-ml-2064786358"></a>
### optimizeStore

```ml
function optimizeStore(source, optimized)
```

AAS_OptimizeStore

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | `dynamic` | — | Parser source state; accesses `vertexes`, `edges`, `edgeIndex`, `faces` and `faceIndex` and related fields. May update `source.vertexes`, `source.edges` and `source.edgeIndex` and additional fields in place. |
| `optimized` | `dynamic` | — | Optimized record; accesses `vertexes`, `edges`, `edgeIndex`, `faces` and `faceIndex` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L128)

<a id="function-function-mq3-botlib-aas-optimizer-reachability-function-reachability-areanum-facenum-edgenum-start-finish-traveltype-traveltime-src-mq3-botlib-aas-optimizer-ml-1556454025"></a>
### reachability

```ml
function reachability(areaNum, faceNum, edgeNum, start, finish, travelType, travelTime)
```

Create a `mq3.botlib.aas_optimizer.Reachability` record, initializing `areaNum` from `areaNum`, `faceNum` from `faceNum` and `edgeNum` from `edgeNum`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `faceNum` | `dynamic` | — | AAS face index. |
| `edgeNum` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_optimizer.Reachability.edgeNum`. |
| `start` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_optimizer.Reachability.start`. |
| `finish` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_optimizer.Reachability.finish`. |
| `travelType` | `dynamic` | — | AAS reachability travel-type code. |
| `travelTime` | `dynamic` | — | AAS travel-time value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L57)

- [mq3.botlib.aas_optimizer.Reachability](Type-mq3-botlib-aas-optimizer-reachability-1494583068.md) — struct
<a id="function-function-mq3-botlib-aas-optimizer-signed-function-signed-index-source-src-mq3-botlib-aas-optimizer-ml-184050119"></a>
### signed

```ml
function signed(index, source)
```

Apply the original oriented index sign to a replacement index.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Index of the entry to access. |
| `source` | `dynamic` | — | Value used by `signed` in `if source<0 then return 0-index end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L86)

<a id="constant-constant-mq3-botlib-aas-optimizer-travel-elevator-const-travel-elevator-11-src-mq3-botlib-aas-optimizer-ml-1885567975"></a>
### TRAVEL_ELEVATOR

```ml
const TRAVEL_ELEVATOR = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L9)

<a id="constant-constant-mq3-botlib-aas-optimizer-travel-funcbob-const-travel-funcbob-19-src-mq3-botlib-aas-optimizer-ml-836324885"></a>
### TRAVEL_FUNCBOB

```ml
const TRAVEL_FUNCBOB = 19
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L11)

<a id="constant-constant-mq3-botlib-aas-optimizer-travel-jumppad-const-travel-jumppad-18-src-mq3-botlib-aas-optimizer-ml-1541094722"></a>
### TRAVEL_JUMPPAD

```ml
const TRAVEL_JUMPPAD = 18
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L10)

<a id="constant-constant-mq3-botlib-aas-optimizer-traveltype-mask-const-traveltype-mask-16777215-src-mq3-botlib-aas-optimizer-ml-1473589543"></a>
### TRAVELTYPE_MASK

```ml
const TRAVELTYPE_MASK = 16777215
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L12)

<a id="function-function-mq3-botlib-aas-optimizer-world-function-world-mapname-loaded-time-vertexes-edges-edgeindex-faces-faceindex-areas-reachabilities-retailactive-src-mq3-botlib-aas-optimizer-ml-1510317441"></a>
### world

```ml
function world(mapName, loaded, time, vertexes, edges, edgeIndex, faces, faceIndex, areas, reachabilities, retailActive)
```

Create a `mq3.botlib.aas_optimizer.World` record, initializing `mapName` from `mapName`, `loaded` from `loaded` and `time` from `time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mapName` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_optimizer.World.mapName`. |
| `loaded` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_optimizer.World.loaded`. |
| `time` | `dynamic` | — | Time value in the units expected by this module. |
| `vertexes` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_optimizer.World.vertexes`. |
| `edges` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_optimizer.World.edges`. |
| `edgeIndex` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_optimizer.World.edgeIndex`. |
| `faces` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_optimizer.World.faces`. |
| `faceIndex` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_optimizer.World.faceIndex`. |
| `areas` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_optimizer.World.areas`. |
| `reachabilities` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_optimizer.World.reachability`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_optimizer.ml#L70)

- [mq3.botlib.aas_optimizer.World](Type-mq3-botlib-aas-optimizer-world-1897776461.md) — struct
