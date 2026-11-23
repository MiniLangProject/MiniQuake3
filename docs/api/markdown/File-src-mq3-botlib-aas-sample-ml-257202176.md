# `src/mq3/botlib/aas_sample.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.aas_sample`](Package-mq3-botlib-aas-sample-1758281190.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/aas_client_trace.ml` as `clientTrace` → [src/mq3/botlib/aas_client_trace.ml](File-src-mq3-botlib-aas-client-trace-ml-566175929.md)
- `mq3/botlib/aas_runtime.ml` as `aasSampleRuntime` → [src/mq3/botlib/aas_runtime.ml](File-src-mq3-botlib-aas-runtime-ml-1322908116.md)
- `mq3/botlib/aas_trace_areas.ml` as `traceAreas` → [src/mq3/botlib/aas_trace_areas.ml](File-src-mq3-botlib-aas-trace-areas-ml-2060721500.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/format/aas.ml` as `aas` → [src/mq3/format/aas.ml](File-src-mq3-format-aas-ml-835678928.md)

## Declarations

<a id="function-function-mq3-botlib-aas-sample-aas-aaslinkentity-function-aas-aaslinkentity-world-absmins-absmaxs-entnum-src-mq3-botlib-aas-sample-ml-1026198627"></a>
### AAS_AASLinkEntity

```ml
function AAS_AASLinkEntity(world, absmins, absmaxs, entNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `absmins` | `dynamic` | — |  |
| `absmaxs` | `dynamic` | — |  |
| `entNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L129)

<a id="function-function-mq3-botlib-aas-sample-aas-allocaaslink-function-aas-allocaaslink-world-src-mq3-botlib-aas-sample-ml-1031308288"></a>
### AAS_AllocAASLink

```ml
function AAS_AllocAASLink(world)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L46)

<a id="function-function-mq3-botlib-aas-sample-aas-areacluster-function-aas-areacluster-world-areanum-src-mq3-botlib-aas-sample-ml-1722790561"></a>
### AAS_AreaCluster

```ml
function AAS_AreaCluster(world, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L61)

<a id="function-function-mq3-botlib-aas-sample-aas-areaentitycollision-function-aas-areaentitycollision-world-areanum-start-finish-presencetype-passent-src-mq3-botlib-aas-sample-ml-379580743"></a>
### AAS_AreaEntityCollision

```ml
function AAS_AreaEntityCollision(world, areaNum, start, finish, presenceType, passent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `presenceType` | `dynamic` | — |  |
| `passent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L78)

<a id="function-function-mq3-botlib-aas-sample-aas-areagroundface-function-aas-areagroundface-world-areanum-point-src-mq3-botlib-aas-sample-ml-1914717131"></a>
### AAS_AreaGroundFace

```ml
function AAS_AreaGroundFace(world, areaNum, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L116)

<a id="function-function-mq3-botlib-aas-sample-aas-areainfo-function-aas-areainfo-world-areanum-src-mq3-botlib-aas-sample-ml-462061723"></a>
### AAS_AreaInfo

```ml
function AAS_AreaInfo(world, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L135)

<a id="function-function-mq3-botlib-aas-sample-aas-areapresencetype-function-aas-areapresencetype-world-areanum-src-mq3-botlib-aas-sample-ml-747169895"></a>
### AAS_AreaPresenceType

```ml
function AAS_AreaPresenceType(world, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L62)

<a id="function-function-mq3-botlib-aas-sample-aas-bboxareas-function-aas-bboxareas-world-absmins-absmaxs-maximum-src-mq3-botlib-aas-sample-ml-935754660"></a>
### AAS_BBoxAreas

```ml
function AAS_BBoxAreas(world, absmins, absmaxs, maximum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `absmins` | `dynamic` | — |  |
| `absmaxs` | `dynamic` | — |  |
| `maximum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L134)

<a id="function-function-mq3-botlib-aas-sample-aas-boxonplaneside2-function-aas-boxonplaneside2-absmins-absmaxs-plane-src-mq3-botlib-aas-sample-ml-195573688"></a>
### AAS_BoxOnPlaneSide2

```ml
function AAS_BoxOnPlaneSide2(absmins, absmaxs, plane)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `absmins` | `dynamic` | — |  |
| `absmaxs` | `dynamic` | — |  |
| `plane` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L123)

<a id="function-function-mq3-botlib-aas-sample-aas-boxorigindistancefromplane-function-aas-boxorigindistancefromplane-normal-mins-maxs-side-src-mq3-botlib-aas-sample-ml-1554293278"></a>
### AAS_BoxOriginDistanceFromPlane

```ml
function AAS_BoxOriginDistanceFromPlane(normal, mins, maxs, side)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `side` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L65)

<a id="function-function-mq3-botlib-aas-sample-aas-deallocaaslink-function-aas-deallocaaslink-world-link-src-mq3-botlib-aas-sample-ml-1601343100"></a>
### AAS_DeAllocAASLink

```ml
function AAS_DeAllocAASLink(world, link)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `link` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L49)

<a id="function-function-mq3-botlib-aas-sample-aas-faceplane-function-aas-faceplane-world-facenum-src-mq3-botlib-aas-sample-ml-967053397"></a>
### AAS_FacePlane

```ml
function AAS_FacePlane(world, faceNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `faceNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L119)

<a id="function-function-mq3-botlib-aas-sample-aas-freeaaslinkedentities-function-aas-freeaaslinkedentities-world-src-mq3-botlib-aas-sample-ml-266500406"></a>
### AAS_FreeAASLinkedEntities

```ml
function AAS_FreeAASLinkedEntities(world)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L53)

<a id="function-function-mq3-botlib-aas-sample-aas-freeaaslinkheap-function-aas-freeaaslinkheap-world-src-mq3-botlib-aas-sample-ml-546846974"></a>
### AAS_FreeAASLinkHeap

```ml
function AAS_FreeAASLinkHeap(world)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L45)

<a id="function-function-mq3-botlib-aas-sample-aas-initaaslinkedentities-function-aas-initaaslinkedentities-world-src-mq3-botlib-aas-sample-ml-1816262618"></a>
### AAS_InitAASLinkedEntities

```ml
function AAS_InitAASLinkedEntities(world)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L52)

<a id="function-function-mq3-botlib-aas-sample-aas-initaaslinkheap-function-aas-initaaslinkheap-world-maximum-src-mq3-botlib-aas-sample-ml-1380164496"></a>
### AAS_InitAASLinkHeap

```ml
function AAS_InitAASLinkHeap(world, maximum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `maximum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L42)

<a id="function-function-mq3-botlib-aas-sample-aas-insideface-function-aas-insideface-world-facenum-pnormal-point-epsilon-src-mq3-botlib-aas-sample-ml-106752850"></a>
### AAS_InsideFace

```ml
function AAS_InsideFace(world, faceNum, pnormal, point, epsilon)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `faceNum` | `dynamic` | — |  |
| `pnormal` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `epsilon` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L90)

<a id="function-function-mq3-botlib-aas-sample-aas-linkentityclientbbox-function-aas-linkentityclientbbox-world-absmins-absmaxs-entnum-presencetype-src-mq3-botlib-aas-sample-ml-1879200622"></a>
### AAS_LinkEntityClientBBox

```ml
function AAS_LinkEntityClientBBox(world, absmins, absmaxs, entNum, presenceType)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `absmins` | `dynamic` | — |  |
| `absmaxs` | `dynamic` | — |  |
| `entNum` | `dynamic` | — |  |
| `presenceType` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L133)

<a id="function-function-mq3-botlib-aas-sample-aas-planefromnum-function-aas-planefromnum-world-planenum-src-mq3-botlib-aas-sample-ml-817315570"></a>
### AAS_PlaneFromNum

```ml
function AAS_PlaneFromNum(world, planeNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `planeNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L136)

<a id="function-function-mq3-botlib-aas-sample-aas-pointareanum-function-aas-pointareanum-world-point-src-mq3-botlib-aas-sample-ml-706207062"></a>
### AAS_PointAreaNum

```ml
function AAS_PointAreaNum(world, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L54)

<a id="function-function-mq3-botlib-aas-sample-aas-pointinsideface-function-aas-pointinsideface-world-facenum-point-epsilon-src-mq3-botlib-aas-sample-ml-225770409"></a>
### AAS_PointInsideFace

```ml
function AAS_PointInsideFace(world, faceNum, point, epsilon)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `faceNum` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `epsilon` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L93)

<a id="function-function-mq3-botlib-aas-sample-aas-pointpresencetype-function-aas-pointpresencetype-world-point-src-mq3-botlib-aas-sample-ml-17328204"></a>
### AAS_PointPresenceType

```ml
function AAS_PointPresenceType(world, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L63)

<a id="function-function-mq3-botlib-aas-sample-aas-pointreachabilityareaindex-function-aas-pointreachabilityareaindex-world-origin-src-mq3-botlib-aas-sample-ml-579561042"></a>
### AAS_PointReachabilityAreaIndex

```ml
function AAS_PointReachabilityAreaIndex(world, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L55)

<a id="function-function-mq3-botlib-aas-sample-aas-presencetypeboundingbox-function-aas-presencetypeboundingbox-presencetype-src-mq3-botlib-aas-sample-ml-219601413"></a>
### AAS_PresenceTypeBoundingBox

```ml
function AAS_PresenceTypeBoundingBox(presenceType)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `presenceType` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L38)

<a id="function-function-mq3-botlib-aas-sample-aas-swimlevel-function-aas-swimlevel-world-point-src-mq3-botlib-aas-sample-ml-702193866"></a>
### AAS_SwimLevel

```ml
function AAS_SwimLevel(world, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L64)

<a id="function-function-mq3-botlib-aas-sample-aas-traceareas-function-aas-traceareas-world-start-finish-maximum-src-mq3-botlib-aas-sample-ml-253565823"></a>
### AAS_TraceAreas

```ml
function AAS_TraceAreas(world, start, finish, maximum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `maximum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L86)

<a id="function-function-mq3-botlib-aas-sample-aas-traceclientbbox-function-aas-traceclientbbox-world-start-finish-presencetype-passent-src-mq3-botlib-aas-sample-ml-594006574"></a>
### AAS_TraceClientBBox

```ml
function AAS_TraceClientBBox(world, start, finish, presenceType, passent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `presenceType` | `dynamic` | — |  |
| `passent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L82)

<a id="function-function-mq3-botlib-aas-sample-aas-traceendface-function-aas-traceendface-world-trace-src-mq3-botlib-aas-sample-ml-1540330401"></a>
### AAS_TraceEndFace

```ml
function AAS_TraceEndFace(world, trace)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `trace` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L120)

<a id="function-function-mq3-botlib-aas-sample-aas-unlinkfromareas-function-aas-unlinkfromareas-world-links-src-mq3-botlib-aas-sample-ml-45778155"></a>
### AAS_UnlinkFromAreas

```ml
function AAS_UnlinkFromAreas(world, links)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `links` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L126)

- [mq3.botlib.aas_sample.Action](Type-mq3-botlib-aas-sample-action-201581026.md) — struct
<a id="function-function-mq3-botlib-aas-sample-againstladder-function-againstladder-rt-origin-src-mq3-botlib-aas-sample-ml-1360716054"></a>
### againstLadder

```ml
function againstLadder(rt, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rt` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L94)

<a id="constant-constant-mq3-botlib-aas-sample-bbox-normal-epsilon-const-bbox-normal-epsilon-1-e-003-src-mq3-botlib-aas-sample-ml-549183955"></a>
### BBOX_NORMAL_EPSILON

```ml
const BBOX_NORMAL_EPSILON = 1.e-003
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L20)

<a id="constant-constant-mq3-botlib-aas-sample-contents-lava-const-contents-lava-8-src-mq3-botlib-aas-sample-ml-274546829"></a>
### CONTENTS_LAVA

```ml
const CONTENTS_LAVA = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L17)

<a id="constant-constant-mq3-botlib-aas-sample-contents-slime-const-contents-slime-16-src-mq3-botlib-aas-sample-ml-226121700"></a>
### CONTENTS_SLIME

```ml
const CONTENTS_SLIME = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L16)

<a id="constant-constant-mq3-botlib-aas-sample-contents-water-const-contents-water-32-src-mq3-botlib-aas-sample-ml-704627448"></a>
### CONTENTS_WATER

```ml
const CONTENTS_WATER = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L15)

<a id="function-function-mq3-botlib-aas-sample-copy3-function-copy3-v-src-mq3-botlib-aas-sample-ml-1083915682"></a>
### copy3

```ml
function copy3(v)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L32)

<a id="function-function-mq3-botlib-aas-sample-create-function-create-rt-src-mq3-botlib-aas-sample-ml-292521614"></a>
### create

```ml
function create(rt)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rt` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L27)

<a id="function-function-mq3-botlib-aas-sample-cross-function-cross-a-b-src-mq3-botlib-aas-sample-ml-654862555"></a>
### cross

```ml
function cross(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L35)

<a id="function-function-mq3-botlib-aas-sample-dot-function-dot-a-b-src-mq3-botlib-aas-sample-ml-1418768425"></a>
### dot

```ml
function dot(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L34)

<a id="function-function-mq3-botlib-aas-sample-edgevertices-function-edgevertices-world-signededge-src-mq3-botlib-aas-sample-ml-693662389"></a>
### edgeVertices

```ml
function edgeVertices(world, signedEdge)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `signedEdge` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L87)

<a id="function-function-mq3-botlib-aas-sample-emit-function-emit-world-kind-subject-detail-src-mq3-botlib-aas-sample-ml-141428107"></a>
### emit

```ml
function emit(world, kind, subject, detail)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `subject` | `dynamic` | — |  |
| `detail` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L31)

<a id="constant-constant-mq3-botlib-aas-sample-face-ground-const-face-ground-4-src-mq3-botlib-aas-sample-ml-2047953697"></a>
### FACE_GROUND

```ml
const FACE_GROUND = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L14)

- [mq3.botlib.aas_sample.Link](Type-mq3-botlib-aas-sample-link-1965626248.md) — struct
<a id="constant-constant-mq3-botlib-aas-sample-mask-solid-playerclip-const-mask-solid-playerclip-65537-src-mq3-botlib-aas-sample-ml-279313711"></a>
### MASK_SOLID_PLAYERCLIP

```ml
const MASK_SOLID_PLAYERCLIP = 65537
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L19)

<a id="constant-constant-mq3-botlib-aas-sample-mask-water-const-mask-water-56-src-mq3-botlib-aas-sample-ml-246327378"></a>
### MASK_WATER

```ml
const MASK_WATER = 56
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L18)

<a id="constant-constant-mq3-botlib-aas-sample-presence-crouch-const-presence-crouch-4-src-mq3-botlib-aas-sample-ml-738180829"></a>
### PRESENCE_CROUCH

```ml
const PRESENCE_CROUCH = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L13)

<a id="constant-constant-mq3-botlib-aas-sample-presence-none-const-presence-none-1-src-mq3-botlib-aas-sample-ml-321193008"></a>
### PRESENCE_NONE

```ml
const PRESENCE_NONE = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L11)

<a id="constant-constant-mq3-botlib-aas-sample-presence-normal-const-presence-normal-2-src-mq3-botlib-aas-sample-ml-676115063"></a>
### PRESENCE_NORMAL

```ml
const PRESENCE_NORMAL = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L12)

- [mq3.botlib.aas_sample.Services](Type-mq3-botlib-aas-sample-services-1927989576.md) — struct
<a id="function-function-mq3-botlib-aas-sample-sub-function-sub-a-b-src-mq3-botlib-aas-sample-ml-1758766607"></a>
### sub

```ml
function sub(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L33)

<a id="function-function-mq3-botlib-aas-sample-validarea-function-validarea-world-areanum-src-mq3-botlib-aas-sample-ml-419883217"></a>
### validArea

```ml
function validArea(world, areaNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/aas_sample.ml#L36)

- [mq3.botlib.aas_sample.World](Type-mq3-botlib-aas-sample-world-1803097932.md) — struct
