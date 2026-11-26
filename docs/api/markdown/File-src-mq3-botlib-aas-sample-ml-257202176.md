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

Set `world.areaLinked[areaNum]` to `[link.id]+world.areaLinked[areaNum]` and `world.linkedEntities` to `world.linkedEntities+[result]` in `mq3.botlib.aas_sample.AAS_AASLinkEntity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World data; accesses `areaLinked`, `runtime`, `heap` and `linkedEntities`. May update `world.areaLinked[areaNum]` and `world.linkedEntities` in place. |
| `absmins` | `dynamic` | — | World-space minimum coordinates of the bounds. |
| `absmaxs` | `dynamic` | — | World-space maximum coordinates of the bounds. |
| `entNum` | `dynamic` | — | Value used by `AAS_AASLinkEntity` in `for each id in world.areaLinked[areaNum] if world.heap[id].allocated and world.heap[id].entNum==entNum then dupl...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L311)

<a id="function-function-mq3-botlib-aas-sample-aas-allocaaslink-function-aas-allocaaslink-world-src-mq3-botlib-aas-sample-ml-1031308288"></a>
### AAS_AllocAASLink

```ml
function AAS_AllocAASLink(world)
```

Record or dispatch `"heap-empty"` actions in `AAS_AllocAASLink`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World data; accesses `freeIds`, `heap` and `numFree`. May update `world.freeIds` and `world.numFree` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L141)

<a id="function-function-mq3-botlib-aas-sample-aas-areacluster-function-aas-areacluster-world-areanum-src-mq3-botlib-aas-sample-ml-1722790561"></a>
### AAS_AreaCluster

```ml
function AAS_AreaCluster(world, areaNum)
```

Apply `mq3.botlib.aas_sample.validArea` and `mq3.format.aas.areaSettings` while evaluating `AAS_AreaCluster`. Return paths include `aas.areaSettings(world.map,areaNum).cluster`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World data; accesses `map`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L172)

<a id="function-function-mq3-botlib-aas-sample-aas-areaentitycollision-function-aas-areaentitycollision-world-areanum-start-finish-presencetype-passent-src-mq3-botlib-aas-sample-ml-379580743"></a>
### AAS_AreaEntityCollision

```ml
function AAS_AreaEntityCollision(world, areaNum, start, finish, presenceType, passent)
```

Use `world.services.entityCollisionFn` to perform `AAS_AreaEntityCollision`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World data; accesses `areaLinked`, `services` and `heap`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `start` | `dynamic` | — | Value passed as argument 3 to `world.services.entityCollisionFn`. |
| `finish` | `dynamic` | — | Value passed as argument 6 to `world.services.entityCollisionFn`. |
| `presenceType` | `dynamic` | — | AAS presence type selecting the movement bounds. |
| `passent` | `dynamic` | — | Value used by `AAS_AreaEntityCollision` in `if not link.allocated or link.entNum==passent then continue end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L210)

<a id="function-function-mq3-botlib-aas-sample-aas-areagroundface-function-aas-areagroundface-world-areanum-point-src-mq3-botlib-aas-sample-ml-1914717131"></a>
### AAS_AreaGroundFace

```ml
function AAS_AreaGroundFace(world, areaNum, point)
```

Apply `mq3.botlib.aas_sample.validArea`, `mq3.format.aas.area` and `mq3.format.aas.faceIndex` while evaluating `AAS_AreaGroundFace`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World data; accesses `map`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L280)

<a id="function-function-mq3-botlib-aas-sample-aas-areainfo-function-aas-areainfo-world-areanum-src-mq3-botlib-aas-sample-ml-462061723"></a>
### AAS_AreaInfo

```ml
function AAS_AreaInfo(world, areaNum)
```

Apply `mq3.botlib.aas_sample.validArea` and `mq3.botlib.aas_runtime.areaInfo` while evaluating `AAS_AreaInfo`. Return paths include `aasSampleRuntime.areaInfo(world.runtime,areaNum)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World data; accesses `runtime`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L331)

<a id="function-function-mq3-botlib-aas-sample-aas-areapresencetype-function-aas-areapresencetype-world-areanum-src-mq3-botlib-aas-sample-ml-747169895"></a>
### AAS_AreaPresenceType

```ml
function AAS_AreaPresenceType(world, areaNum)
```

Apply `mq3.botlib.aas_sample.validArea` and `mq3.format.aas.areaSettings` while evaluating `AAS_AreaPresenceType`. Return paths include `aas.areaSettings(world.map,areaNum).presenceType`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World data; accesses `map`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L176)

<a id="function-function-mq3-botlib-aas-sample-aas-bboxareas-function-aas-bboxareas-world-absmins-absmaxs-maximum-src-mq3-botlib-aas-sample-ml-935754660"></a>
### AAS_BBoxAreas

```ml
function AAS_BBoxAreas(world, absmins, absmaxs, maximum)
```

Forward `AAS_BBoxAreas` to `mq3.botlib.aas_runtime.bboxAreas` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World data; accesses `runtime`. |
| `absmins` | `dynamic` | — | World-space minimum coordinates of the bounds. |
| `absmaxs` | `dynamic` | — | World-space maximum coordinates of the bounds. |
| `maximum` | `dynamic` | — | Upper bound applied by the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L327)

<a id="function-function-mq3-botlib-aas-sample-aas-boxonplaneside2-function-aas-boxonplaneside2-absmins-absmaxs-plane-src-mq3-botlib-aas-sample-ml-195573688"></a>
### AAS_BoxOnPlaneSide2

```ml
function AAS_BoxOnPlaneSide2(absmins, absmaxs, plane)
```

Apply `mq3.botlib.aas_sample.dot` while evaluating `AAS_BoxOnPlaneSide2`. Return paths include `sides`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `absmins` | `dynamic` | — | World-space minimum coordinates of the bounds. |
| `absmaxs` | `dynamic` | — | World-space maximum coordinates of the bounds. |
| `plane` | `dynamic` | — | Plane record; accesses `normal` and `dist`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L297)

<a id="function-function-mq3-botlib-aas-sample-aas-boxorigindistancefromplane-function-aas-boxorigindistancefromplane-normal-mins-maxs-side-src-mq3-botlib-aas-sample-ml-1554293278"></a>
### AAS_BoxOriginDistanceFromPlane

```ml
function AAS_BoxOriginDistanceFromPlane(normal, mins, maxs, side)
```

Apply `mq3.botlib.aas_sample.dot` while evaluating `AAS_BoxOriginDistanceFromPlane`. Return paths include `0.0-dot(point,normal)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `mins` | `dynamic` | — | Minimum coordinates of the axis-aligned bounds. |
| `maxs` | `dynamic` | — | Maximum coordinates of the axis-aligned bounds. |
| `side` | `dynamic` | — | Value used by `AAS_BoxOriginDistanceFromPlane` in `if side!=0 then`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L190)

<a id="function-function-mq3-botlib-aas-sample-aas-deallocaaslink-function-aas-deallocaaslink-world-link-src-mq3-botlib-aas-sample-ml-1601343100"></a>
### AAS_DeAllocAASLink

```ml
function AAS_DeAllocAASLink(world, link)
```

Update `link.allocated`, `link.entNum`, `link.areaNum` and `world.freeIds` and related state during `AAS_DeAllocAASLink`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World data; accesses `freeIds` and `numFree`. May update `world.freeIds` and `world.numFree` in place. |
| `link` | `dynamic` | — | Link record; accesses `allocated`, `entNum`, `areaNum` and `id`. May update `link.allocated`, `link.entNum` and `link.areaNum` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L147)

<a id="function-function-mq3-botlib-aas-sample-aas-faceplane-function-aas-faceplane-world-facenum-src-mq3-botlib-aas-sample-ml-967053397"></a>
### AAS_FacePlane

```ml
function AAS_FacePlane(world, faceNum)
```

Apply `mq3.format.aas.face`, `mq3.format.aas.plane` and `mq3.botlib.aas_sample.copy3` while evaluating `AAS_FacePlane`. Return paths include `[copy3(plane.normal),plane.dist]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World data; accesses `map`. |
| `faceNum` | `dynamic` | — | AAS face index. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L286)

<a id="function-function-mq3-botlib-aas-sample-aas-freeaaslinkedentities-function-aas-freeaaslinkedentities-world-src-mq3-botlib-aas-sample-ml-266500406"></a>
### AAS_FreeAASLinkedEntities

```ml
function AAS_FreeAASLinkedEntities(world)
```

Set `world.areaLinked` to `[]` and `world.linkedEntities` to `[]` in `mq3.botlib.aas_sample.AAS_FreeAASLinkedEntities`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World data; accesses `areaLinked` and `linkedEntities`. May update `world.areaLinked` and `world.linkedEntities` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L155)

<a id="function-function-mq3-botlib-aas-sample-aas-freeaaslinkheap-function-aas-freeaaslinkheap-world-src-mq3-botlib-aas-sample-ml-546846974"></a>
### AAS_FreeAASLinkHeap

```ml
function AAS_FreeAASLinkHeap(world)
```

Update `world.heap`, `world.links`, `world.freeIds` and `world.numFree` during `AAS_FreeAASLinkHeap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World data; accesses `heap`, `links`, `freeIds` and `numFree`. May update `world.heap`, `world.links` and `world.freeIds` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L138)

<a id="function-function-mq3-botlib-aas-sample-aas-initaaslinkedentities-function-aas-initaaslinkedentities-world-src-mq3-botlib-aas-sample-ml-1816262618"></a>
### AAS_InitAASLinkedEntities

```ml
function AAS_InitAASLinkedEntities(world)
```

Update `world.areaLinked`, `world.areaLinked[index]` and `world.linkedEntities` during `AAS_InitAASLinkedEntities`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World data; accesses `areaLinked`, `map` and `linkedEntities`. May update `world.areaLinked`, `world.areaLinked[index]` and `world.linkedEntities` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L152)

<a id="function-function-mq3-botlib-aas-sample-aas-initaaslinkheap-function-aas-initaaslinkheap-world-maximum-src-mq3-botlib-aas-sample-ml-1380164496"></a>
### AAS_InitAASLinkHeap

```ml
function AAS_InitAASLinkHeap(world, maximum)
```

Update `world.heap`, `world.links`, `world.freeIds` and `world.heap[index]` and related state during `AAS_InitAASLinkHeap`. Return paths include `maximum`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World data; accesses `heap`, `links`, `freeIds` and `numFree`. May update `world.heap`, `world.links` and `world.freeIds` and additional fields in place. |
| `maximum` | `dynamic` | — | Upper bound applied by the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L133)

<a id="function-function-mq3-botlib-aas-sample-aas-insideface-function-aas-insideface-world-facenum-pnormal-point-epsilon-src-mq3-botlib-aas-sample-ml-106752850"></a>
### AAS_InsideFace

```ml
function AAS_InsideFace(world, faceNum, pnormal, point, epsilon)
```

Apply `mq3.format.aas.face`, `mq3.format.aas.edgeIndex` and `mq3.botlib.aas_sample.edgeVertices` while evaluating `AAS_InsideFace`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World data; accesses `map`. |
| `faceNum` | `dynamic` | — | AAS face index. |
| `pnormal` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |
| `epsilon` | `dynamic` | — | Value used by `AAS_InsideFace` in `if dot(pointvec,separation)<0.0-epsilon then return false end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L242)

<a id="function-function-mq3-botlib-aas-sample-aas-linkentityclientbbox-function-aas-linkentityclientbbox-world-absmins-absmaxs-entnum-presencetype-src-mq3-botlib-aas-sample-ml-1879200622"></a>
### AAS_LinkEntityClientBBox

```ml
function AAS_LinkEntityClientBBox(world, absmins, absmaxs, entNum, presenceType)
```

Apply `mq3.botlib.aas_sample.AAS_PresenceTypeBoundingBox` and `mq3.botlib.aas_sample.AAS_AASLinkEntity` while evaluating `AAS_LinkEntityClientBBox`. Return paths include `AAS_AASLinkEntity(world,newmins,newmaxs,entNum)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World data; accesses `areaLinked`, `runtime`, `heap` and `linkedEntities`. May update `world.areaLinked[areaNum]` and `world.linkedEntities` in place. |
| `absmins` | `dynamic` | — | World-space minimum coordinates of the bounds. |
| `absmaxs` | `dynamic` | — | World-space maximum coordinates of the bounds. |
| `entNum` | `dynamic` | — | Value used by `AAS_AASLinkEntity` in `for each id in world.areaLinked[areaNum] if world.heap[id].allocated and world.heap[id].entNum==entNum then dupl...`. |
| `presenceType` | `dynamic` | — | AAS presence type selecting the movement bounds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L321)

<a id="function-function-mq3-botlib-aas-sample-aas-planefromnum-function-aas-planefromnum-world-planenum-src-mq3-botlib-aas-sample-ml-817315570"></a>
### AAS_PlaneFromNum

```ml
function AAS_PlaneFromNum(world, planeNum)
```

Apply `mq3.format.aas.plane` while evaluating `AAS_PlaneFromNum`. Return paths include `aas.plane(world.map,planeNum)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World data; accesses `map`. |
| `planeNum` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L335)

<a id="function-function-mq3-botlib-aas-sample-aas-pointareanum-function-aas-pointareanum-world-point-src-mq3-botlib-aas-sample-ml-706207062"></a>
### AAS_PointAreaNum

```ml
function AAS_PointAreaNum(world, point)
```

Forward `AAS_PointAreaNum` to `mq3.botlib.aas_runtime.pointAreaNum` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World data; accesses `runtime`. |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L159)

<a id="function-function-mq3-botlib-aas-sample-aas-pointinsideface-function-aas-pointinsideface-world-facenum-point-epsilon-src-mq3-botlib-aas-sample-ml-225770409"></a>
### AAS_PointInsideFace

```ml
function AAS_PointInsideFace(world, faceNum, point, epsilon)
```

Apply `mq3.format.aas.face`, `mq3.format.aas.plane` and `mq3.botlib.aas_sample.AAS_InsideFace` while evaluating `AAS_PointInsideFace`. Return paths include `AAS_InsideFace(world,faceNum,plane.normal,point,epsilon)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World data; accesses `map`. |
| `faceNum` | `dynamic` | — | AAS face index. |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |
| `epsilon` | `dynamic` | — | Value used by `AAS_InsideFace` in `if dot(pointvec,separation)<0.0-epsilon then return false end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L250)

<a id="function-function-mq3-botlib-aas-sample-aas-pointpresencetype-function-aas-pointpresencetype-world-point-src-mq3-botlib-aas-sample-ml-17328204"></a>
### AAS_PointPresenceType

```ml
function AAS_PointPresenceType(world, point)
```

Forward `AAS_PointPresenceType` to `mq3.botlib.aas_runtime.pointPresenceType` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World data; accesses `runtime`. |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L180)

<a id="function-function-mq3-botlib-aas-sample-aas-pointreachabilityareaindex-function-aas-pointreachabilityareaindex-world-origin-src-mq3-botlib-aas-sample-ml-579561042"></a>
### AAS_PointReachabilityAreaIndex

```ml
function AAS_PointReachabilityAreaIndex(world, origin)
```

Apply `mq3.format.aas.cluster`, `mq3.botlib.aas_sample.AAS_PointAreaNum` and `mq3.botlib.aas_sample.validArea` while evaluating `AAS_PointReachabilityAreaIndex`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World data; accesses `map`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L163)

<a id="function-function-mq3-botlib-aas-sample-aas-presencetypeboundingbox-function-aas-presencetypeboundingbox-presencetype-src-mq3-botlib-aas-sample-ml-219601413"></a>
### AAS_PresenceTypeBoundingBox

```ml
function AAS_PresenceTypeBoundingBox(presenceType)
```

Return standing bounds for normal presence and crouching bounds for the other presence values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `presenceType` | `dynamic` | — | AAS presence type selecting the movement bounds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L126)

<a id="function-function-mq3-botlib-aas-sample-aas-swimlevel-function-aas-swimlevel-world-point-src-mq3-botlib-aas-sample-ml-702193866"></a>
### AAS_SwimLevel

```ml
function AAS_SwimLevel(world, point)
```

Use `world.services.pointContentsFn` to perform `AAS_SwimLevel`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World data; accesses `services`. |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L184)

<a id="function-function-mq3-botlib-aas-sample-aas-traceareas-function-aas-traceareas-world-start-finish-maximum-src-mq3-botlib-aas-sample-ml-253565823"></a>
### AAS_TraceAreas

```ml
function AAS_TraceAreas(world, start, finish, maximum)
```

Forward `AAS_TraceAreas` to `mq3.botlib.aas_trace_areas.trace` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World data; accesses `runtime`. |
| `start` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `finish` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `maximum` | `dynamic` | — | Upper bound applied by the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L229)

<a id="function-function-mq3-botlib-aas-sample-aas-traceclientbbox-function-aas-traceclientbbox-world-start-finish-presencetype-passent-src-mq3-botlib-aas-sample-ml-594006574"></a>
### AAS_TraceClientBBox

```ml
function AAS_TraceClientBBox(world, start, finish, presenceType, passent)
```

Apply `mq3.botlib.aas_client_trace.trace`, `mq3.botlib.aas_trace_areas.trace` and `mq3.botlib.aas_sample.AAS_AreaEntityCollision` while evaluating `AAS_TraceClientBBox`. Return paths include `best`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World data; accesses `runtime` and `services`. |
| `start` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `finish` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `presenceType` | `dynamic` | — | AAS presence type selecting the movement bounds. |
| `passent` | `dynamic` | — | Value used by `AAS_AreaEntityCollision` in `if not link.allocated or link.entNum==passent then continue end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L220)

<a id="function-function-mq3-botlib-aas-sample-aas-traceendface-function-aas-traceendface-world-trace-src-mq3-botlib-aas-sample-ml-1540330401"></a>
### AAS_TraceEndFace

```ml
function AAS_TraceEndFace(world, trace)
```

Apply `mq3.botlib.aas_sample.validArea`, `mq3.format.aas.area` and `mq3.format.aas.faceIndex` while evaluating `AAS_TraceEndFace`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World data; accesses `map`. |
| `trace` | `dynamic` | — | Trace record; accesses `startsolid`, `lastarea`, `planenum` and `endpos`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L290)

<a id="function-function-mq3-botlib-aas-sample-aas-unlinkfromareas-function-aas-unlinkfromareas-world-links-src-mq3-botlib-aas-sample-ml-45778155"></a>
### AAS_UnlinkFromAreas

```ml
function AAS_UnlinkFromAreas(world, links)
```

Set `world.areaLinked[link.areaNum]` to `remaining` in `mq3.botlib.aas_sample.AAS_UnlinkFromAreas`. Return paths include `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World data; accesses `heap` and `areaLinked`. May update `world.areaLinked[link.areaNum]` in place. |
| `links` | `dynamic` | — | Value used by `AAS_UnlinkFromAreas` in `for each id in links if id<0 or id>=len(world.heap) then continue end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L303)

- [mq3.botlib.aas_sample.Action](Type-mq3-botlib-aas-sample-action-201581026.md) — struct
<a id="function-function-mq3-botlib-aas-sample-againstladder-function-againstladder-rt-origin-src-mq3-botlib-aas-sample-ml-1360716054"></a>
### againstLadder

```ml
function againstLadder(rt, origin)
```

Apply `mq3.botlib.aas_runtime.pointAreaNum`, `mq3.format.aas.areaSettings` and `mq3.format.aas.area` while evaluating `againstLadder`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rt` | `dynamic` | — | Rt record; accesses `map`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L254)

<a id="constant-constant-mq3-botlib-aas-sample-bbox-normal-epsilon-const-bbox-normal-epsilon-0-001-src-mq3-botlib-aas-sample-ml-205918898"></a>
### BBOX_NORMAL_EPSILON

```ml
const BBOX_NORMAL_EPSILON = 0.001
```

Tolerance used when classifying a bounding box against an AAS plane.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L30)

<a id="constant-constant-mq3-botlib-aas-sample-contents-lava-const-contents-lava-8-src-mq3-botlib-aas-sample-ml-274546829"></a>
### CONTENTS_LAVA

```ml
const CONTENTS_LAVA = 8
```

Collision contents bit marking lava.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L24)

<a id="constant-constant-mq3-botlib-aas-sample-contents-slime-const-contents-slime-16-src-mq3-botlib-aas-sample-ml-226121700"></a>
### CONTENTS_SLIME

```ml
const CONTENTS_SLIME = 16
```

Collision contents bit marking slime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L22)

<a id="constant-constant-mq3-botlib-aas-sample-contents-water-const-contents-water-32-src-mq3-botlib-aas-sample-ml-704627448"></a>
### CONTENTS_WATER

```ml
const CONTENTS_WATER = 32
```

Collision contents bit marking water.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L20)

<a id="function-function-mq3-botlib-aas-sample-copy3-function-copy3-v-src-mq3-botlib-aas-sample-ml-1083915682"></a>
### copy3

```ml
function copy3(v)
```

Copy `v[0]`, `v[1]` and `v[2]` into a new ordered array for aas sample.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `v` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L106)

<a id="function-function-mq3-botlib-aas-sample-create-function-create-rt-src-mq3-botlib-aas-sample-ml-292521614"></a>
### create

```ml
function create(rt)
```

Build the `mq3.botlib.aas_sample.World` result for `create`. Return paths include `World(rt,rt.map,[],[],[],0,array(count,void),[],Services(void,void,void),false,[])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rt` | `dynamic` | — | Rt record; accesses `initialized` and `map`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L94)

<a id="function-function-mq3-botlib-aas-sample-cross-function-cross-a-b-src-mq3-botlib-aas-sample-ml-654862555"></a>
### cross

```ml
function cross(a, b)
```

Return a new array `[a[1]*b[2]-a[2]*b[1],a[2]*b[0]-a[0]*b[2],a[0]*b[1]-a[1]*b[0]]` for `cross`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `b` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L118)

<a id="function-function-mq3-botlib-aas-sample-dot-function-dot-a-b-src-mq3-botlib-aas-sample-ml-1418768425"></a>
### dot

```ml
function dot(a, b)
```

Return `a[0]*b[0]+a[1]*b[1]+a[2]*b[2]` for `dot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `b` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L114)

<a id="function-function-mq3-botlib-aas-sample-edgevertices-function-edgevertices-world-signededge-src-mq3-botlib-aas-sample-ml-693662389"></a>
### edgeVertices

```ml
function edgeVertices(world, signedEdge)
```

Apply `mq3.format.aas.edge` and `mq3.format.aas.vertex` while evaluating `edgeVertices`. Return paths include `[aas.vertex(world.map,edge[side]),aas.vertex(world.map,edge[1-side])]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World data; accesses `map`. |
| `signedEdge` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L233)

<a id="function-function-mq3-botlib-aas-sample-emit-function-emit-world-kind-subject-detail-src-mq3-botlib-aas-sample-ml-141428107"></a>
### emit

```ml
function emit(world, kind, subject, detail)
```

Set `world.actions` to `world.actions+[event]` in `mq3.botlib.aas_sample.emit`. Return paths include `event`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World data; accesses `retailActive` and `actions`. May update `world.actions` in place. |
| `kind` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_sample.Action.kind`. |
| `subject` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_sample.Action.subject`. |
| `detail` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_sample.Action.detail`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L103)

<a id="constant-constant-mq3-botlib-aas-sample-face-ground-const-face-ground-4-src-mq3-botlib-aas-sample-ml-2047953697"></a>
### FACE_GROUND

```ml
const FACE_GROUND = 4
```

Standing on ground when in this face.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L18)

- [mq3.botlib.aas_sample.Link](Type-mq3-botlib-aas-sample-link-1965626248.md) — struct
<a id="constant-constant-mq3-botlib-aas-sample-mask-solid-playerclip-const-mask-solid-playerclip-65537-src-mq3-botlib-aas-sample-ml-279313711"></a>
### MASK_SOLID_PLAYERCLIP

```ml
const MASK_SOLID_PLAYERCLIP = 65537
```

Combined collision-contents mask for solid geometry and player clipping.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L28)

<a id="constant-constant-mq3-botlib-aas-sample-mask-water-const-mask-water-56-src-mq3-botlib-aas-sample-ml-246327378"></a>
### MASK_WATER

```ml
const MASK_WATER = 56
```

Combined collision-contents mask for water, slime, and lava volumes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L26)

<a id="constant-constant-mq3-botlib-aas-sample-presence-crouch-const-presence-crouch-4-src-mq3-botlib-aas-sample-ml-738180829"></a>
### PRESENCE_CROUCH

```ml
const PRESENCE_CROUCH = 4
```

AAS presence-mask value selecting crouch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L16)

<a id="constant-constant-mq3-botlib-aas-sample-presence-none-const-presence-none-1-src-mq3-botlib-aas-sample-ml-321193008"></a>
### PRESENCE_NONE

```ml
const PRESENCE_NONE = 1
```

AAS presence-mask value selecting none.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L12)

<a id="constant-constant-mq3-botlib-aas-sample-presence-normal-const-presence-normal-2-src-mq3-botlib-aas-sample-ml-676115063"></a>
### PRESENCE_NORMAL

```ml
const PRESENCE_NORMAL = 2
```

AAS presence-mask value selecting normal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L14)

- [mq3.botlib.aas_sample.Services](Type-mq3-botlib-aas-sample-services-1927989576.md) — struct
<a id="function-function-mq3-botlib-aas-sample-sub-function-sub-a-b-src-mq3-botlib-aas-sample-ml-1758766607"></a>
### sub

```ml
function sub(a, b)
```

Return a new array `[a[0]-b[0],a[1]-b[1],a[2]-b[2]]` for `sub`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `b` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L110)

<a id="function-function-mq3-botlib-aas-sample-validarea-function-validarea-world-areanum-src-mq3-botlib-aas-sample-ml-419883217"></a>
### validArea

```ml
function validArea(world, areaNum)
```

Test `areaNum>0 and areaNum<world.map.counts[aas.LUMP_AREAS]` as the condition for `validArea`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `world` | `dynamic` | — | World data; accesses `map`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_sample.ml#L122)

- [mq3.botlib.aas_sample.World](Type-mq3-botlib-aas-sample-world-1803097932.md) — struct
