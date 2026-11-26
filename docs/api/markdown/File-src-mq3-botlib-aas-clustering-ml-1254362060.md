# `src/mq3/botlib/aas_clustering.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.aas_clustering`](Package-mq3-botlib-aas-clustering-776172826.md)

Reachable from entry: **no**

## Imports

- `mq3/format/aas.ml` as `aas` → [src/mq3/format/aas.ml](File-src-mq3-format-aas-ml-835678928.md)

## Declarations

<a id="function-function-mq3-botlib-aas-clustering-aas-addteleporterportals-function-aas-addteleporterportals-value-src-mq3-botlib-aas-clustering-ml-154291625"></a>
### AAS_AddTeleporterPortals

```ml
function AAS_AddTeleporterPortals(value)
```

AAS_AddTeleporterPortals

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `settings` and `reachabilities`. May update `value.settings[r.areaNum].contents` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L349)

<a id="function-function-mq3-botlib-aas-clustering-aas-canmergeareas-function-aas-canmergeareas-value-areanums-src-mq3-botlib-aas-clustering-ml-361023729"></a>
### AAS_CanMergeAreas

```ml
function AAS_CanMergeAreas(value, areaNums)
```

AAS_CanMergeAreas

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `faces`. |
| `areaNums` | `dynamic` | — | Value used by `contains` in `for each value in values if value==needle then return true end if end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L252)

<a id="function-function-mq3-botlib-aas-clustering-aas-canmergefaces-function-aas-canmergefaces-value-facenums-planenum-src-mq3-botlib-aas-clustering-ml-213112823"></a>
### AAS_CanMergeFaces

```ml
function AAS_CanMergeFaces(value, faceNums, planeNum)
```

AAS_CanMergeFaces

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `faces`, `edgeIndex` and `edges`. |
| `faceNums` | `dynamic` | — | Value used by `AAS_CanMergeFaces` in `for each faceNum in faceNums`. |
| `planeNum` | `dynamic` | — | Value used by `AAS_NonConvexEdges` in `p=value.planes[planeNum]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L269)

<a id="function-function-mq3-botlib-aas-clustering-aas-checkareaforpossibleportals-function-aas-checkareaforpossibleportals-value-areanum-src-mq3-botlib-aas-clustering-ml-1806112268"></a>
### AAS_CheckAreaForPossiblePortals

```ml
function AAS_CheckAreaForPossiblePortals(value, areaNum)
```

AAS_CheckAreaForPossiblePortals

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `settings`, `faces` and `edgeIndex`. May update `value.settings[currentArea].contents` in place. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L314)

<a id="function-function-mq3-botlib-aas-clustering-aas-clearcluster-function-aas-clearcluster-value-clusternum-src-mq3-botlib-aas-clustering-ml-2090425631"></a>
### AAS_ClearCluster

```ml
function AAS_ClearCluster(value, clusterNum)
```

AAS_ClearCluster

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `settings`. May update `value.settings[index].cluster` in place. |
| `clusterNum` | `dynamic` | — | AAS cluster number. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L175)

<a id="function-function-mq3-botlib-aas-clustering-aas-connectedareas-function-aas-connectedareas-value-areanums-src-mq3-botlib-aas-clustering-ml-627179053"></a>
### AAS_ConnectedAreas

```ml
function AAS_ConnectedAreas(value, areaNums)
```

AAS_ConnectedAreas

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `faces`. |
| `areaNums` | `dynamic` | — | Array or byte sequence accessed at `current` and `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L302)

<a id="function-function-mq3-botlib-aas-clustering-aas-connectedareas-r-function-aas-connectedareas-r-value-areanums-connectedareas-current-src-mq3-botlib-aas-clustering-ml-1073033471"></a>
### AAS_ConnectedAreas_r

```ml
function AAS_ConnectedAreas_r(value, areaNums, connectedAreas, current)
```

AAS_ConnectedAreas_r

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `faces`. |
| `areaNums` | `dynamic` | — | Array or byte sequence accessed at `current` and `index`. |
| `connectedAreas` | `dynamic` | — | Array or byte sequence accessed at `current` and `index`. Entries are written in place. |
| `current` | `dynamic` | — | Value used by `AAS_ConnectedAreas_r` in `connectedAreas[current]=true`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L296)

<a id="function-function-mq3-botlib-aas-clustering-aas-countforcedclusterportals-function-aas-countforcedclusterportals-value-src-mq3-botlib-aas-clustering-ml-577175203"></a>
### AAS_CountForcedClusterPortals

```ml
function AAS_CountForcedClusterPortals(value)
```

AAS_CountForcedClusterPortals

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `settings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L355)

<a id="function-function-mq3-botlib-aas-clustering-aas-createportals-function-aas-createportals-value-src-mq3-botlib-aas-clustering-ml-142190151"></a>
### AAS_CreatePortals

```ml
function AAS_CreatePortals(value)
```

AAS_CreatePortals

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `portals` and `settings`. May update `value.portals` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L233)

<a id="function-function-mq3-botlib-aas-clustering-aas-createviewportals-function-aas-createviewportals-value-src-mq3-botlib-aas-clustering-ml-289009053"></a>
### AAS_CreateViewPortals

```ml
function AAS_CreateViewPortals(value)
```

AAS_CreateViewPortals

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `settings`. May update `value.settings[index].contents` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L358)

<a id="function-function-mq3-botlib-aas-clustering-aas-findclusters-function-aas-findclusters-value-src-mq3-botlib-aas-clustering-ml-1247884613"></a>
### AAS_FindClusters

```ml
function AAS_FindClusters(value)
```

AAS_FindClusters

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `clusters`, `settings`, `noFaceFlood` and `portalIndex`. May update `value.clusters` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L227)

<a id="function-function-mq3-botlib-aas-clustering-aas-findpossibleportals-function-aas-findpossibleportals-value-src-mq3-botlib-aas-clustering-ml-1984488439"></a>
### AAS_FindPossiblePortals

```ml
function AAS_FindPossiblePortals(value)
```

AAS_FindPossiblePortals

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `settings`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L324)

<a id="function-function-mq3-botlib-aas-clustering-aas-floodcluster-r-function-aas-floodcluster-r-value-areanum-clusternum-src-mq3-botlib-aas-clustering-ml-297035470"></a>
### AAS_FloodCluster_r

```ml
function AAS_FloodCluster_r(value, areaNum, clusterNum)
```

Legacy BSPC flood helpers retained as callable native behavior. AAS_FloodCluster_r

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `settings`. May update `value.settings[areaNum].cluster` in place. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `clusterNum` | `dynamic` | — | AAS cluster number. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L334)

<a id="function-function-mq3-botlib-aas-clustering-aas-floodclusterareas-r-function-aas-floodclusterareas-r-value-areanum-clusternum-src-mq3-botlib-aas-clustering-ml-965382364"></a>
### AAS_FloodClusterAreas_r

```ml
function AAS_FloodClusterAreas_r(value, areaNum, clusterNum)
```

AAS_FloodClusterAreas_r

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `settings` and `noFaceFlood`. May update `value.settings[areaNum].cluster` and `value.settings[areaNum].clusterAreaNum` in place. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `clusterNum` | `dynamic` | — | AAS cluster number. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L197)

<a id="function-function-mq3-botlib-aas-clustering-aas-floodclusterareasusingreachabilities-function-aas-floodclusterareasusingreachabilities-value-clusternum-src-mq3-botlib-aas-clustering-ml-192008231"></a>
### AAS_FloodClusterAreasUsingReachabilities

```ml
function AAS_FloodClusterAreasUsingReachabilities(value, clusterNum)
```

AAS_FloodClusterAreasUsingReachabilities

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `settings`. |
| `clusterNum` | `dynamic` | — | AAS cluster number. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L208)

<a id="function-function-mq3-botlib-aas-clustering-aas-floodclusterreachabilities-function-aas-floodclusterreachabilities-value-clusternum-src-mq3-botlib-aas-clustering-ml-414612115"></a>
### AAS_FloodClusterReachabilities

```ml
function AAS_FloodClusterReachabilities(value, clusterNum)
```

AAS_FloodClusterReachabilities

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `settings`. |
| `clusterNum` | `dynamic` | — | AAS cluster number. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L341)

<a id="function-function-mq3-botlib-aas-clustering-aas-getadjacentareaswithlesspresencetypes-r-function-aas-getadjacentareaswithlesspresencetypes-r-value-areanums-currentareanum-src-mq3-botlib-aas-clustering-ml-1997092869"></a>
### AAS_GetAdjacentAreasWithLessPresenceTypes_r

```ml
function AAS_GetAdjacentAreasWithLessPresenceTypes_r(value, areaNums, currentAreaNum)
```

AAS_GetAdjacentAreasWithLessPresenceTypes_r

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `settings` and `faces`. |
| `areaNums` | `dynamic` | — | Value used by `contains` in `for each value in values if value==needle then return true end if end for`. |
| `currentAreaNum` | `dynamic` | — | Text or value to search for. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L307)

<a id="function-function-mq3-botlib-aas-clustering-aas-initclustering-function-aas-initclustering-value-src-mq3-botlib-aas-clustering-ml-1335281109"></a>
### AAS_InitClustering

```ml
function AAS_InitClustering(value)
```

AAS_InitClustering

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `loaded`, `clusters`, `forceClustering`, `forceReachability` and `settings` and related fields. May update `value.portalIndex`, `value.clusters` and `value.saveFile` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L364)

<a id="function-function-mq3-botlib-aas-clustering-aas-mapcontainsteleporters-function-aas-mapcontainsteleporters-value-src-mq3-botlib-aas-clustering-ml-1467414017"></a>
### AAS_MapContainsTeleporters

```ml
function AAS_MapContainsTeleporters(value)
```

BSPC geometry helpers retained because they are part of the original source API. AAS_MapContainsTeleporters

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `entities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L238)

<a id="constant-constant-mq3-botlib-aas-clustering-aas-max-clusters-const-aas-max-clusters-65536-src-mq3-botlib-aas-clustering-ml-227763400"></a>
### AAS_MAX_CLUSTERS

```ml
const AAS_MAX_CLUSTERS = 65536
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L10)

<a id="constant-constant-mq3-botlib-aas-clustering-aas-max-portalindexsize-const-aas-max-portalindexsize-65536-src-mq3-botlib-aas-clustering-ml-367926614"></a>
### AAS_MAX_PORTALINDEXSIZE

```ml
const AAS_MAX_PORTALINDEXSIZE = 65536
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L9)

<a id="constant-constant-mq3-botlib-aas-clustering-aas-max-portals-const-aas-max-portals-65536-src-mq3-botlib-aas-clustering-ml-852193290"></a>
### AAS_MAX_PORTALS

```ml
const AAS_MAX_PORTALS = 65536
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L8)

<a id="function-function-mq3-botlib-aas-clustering-aas-nonconvexedges-function-aas-nonconvexedges-value-edge1-edge2-side1-side2-planenum-src-mq3-botlib-aas-clustering-ml-1731631799"></a>
### AAS_NonConvexEdges

```ml
function AAS_NonConvexEdges(value, edge1, edge2, side1, side2, planeNum)
```

AAS_NonConvexEdges

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `vertexes` and `planes`. |
| `edge1` | `dynamic` | — | Edge1 record; accesses `vertices`. |
| `edge2` | `dynamic` | — | Edge2 record; accesses `vertices`. |
| `side1` | `dynamic` | — | Value used by `AAS_NonConvexEdges` in `if side1 then edgeVector1=[0-edgeVector1[0],0-edgeVector1[1],0-edgeVector1[2]] end if`. |
| `side2` | `dynamic` | — | Value used by `AAS_NonConvexEdges` in `if side2 then edgeVector2=[0-edgeVector2[0],0-edgeVector2[1],0-edgeVector2[2]] end if`. |
| `planeNum` | `dynamic` | — | Value used by `AAS_NonConvexEdges` in `p=value.planes[planeNum]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L262)

<a id="function-function-mq3-botlib-aas-clustering-aas-nonconvexfaces-function-aas-nonconvexfaces-value-face1-face2-side1-side2-src-mq3-botlib-aas-clustering-ml-1148434685"></a>
### AAS_NonConvexFaces

```ml
function AAS_NonConvexFaces(value, face1, face2, side1, side2)
```

AAS_NonConvexFaces

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `planes`, `edgeIndex`, `edges` and `vertexes`. |
| `face1` | `dynamic` | — | Face1 record; accesses `planeNum`. |
| `face2` | `dynamic` | — | Face2 record; accesses `planeNum`. |
| `side1` | `dynamic` | — | Value used by `AAS_NonConvexFaces` in `plane1=value.planes[face1.planeNum^side1]`. |
| `side2` | `dynamic` | — | Value used by `AAS_NonConvexFaces` in `plane2=value.planes[face2.planeNum^side2]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L245)

<a id="function-function-mq3-botlib-aas-clustering-aas-numberclusterareas-function-aas-numberclusterareas-value-clusternum-src-mq3-botlib-aas-clustering-ml-1113077279"></a>
### AAS_NumberClusterAreas

```ml
function AAS_NumberClusterAreas(value, clusterNum)
```

AAS_NumberClusterAreas

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `clusters`, `settings`, `portals` and `portalIndex`. May update `value.settings[index].clusterAreaNum` in place. |
| `clusterNum` | `dynamic` | — | AAS cluster number. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L218)

<a id="function-function-mq3-botlib-aas-clustering-aas-numberclusterportals-function-aas-numberclusterportals-value-clusternum-src-mq3-botlib-aas-clustering-ml-635194791"></a>
### AAS_NumberClusterPortals

```ml
function AAS_NumberClusterPortals(value, clusterNum)
```

AAS_NumberClusterPortals

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `clusters`, `portals` and `portalIndex`. |
| `clusterNum` | `dynamic` | — | AAS cluster number. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L214)

<a id="function-function-mq3-botlib-aas-clustering-aas-removeallportals-function-aas-removeallportals-value-src-mq3-botlib-aas-clustering-ml-997635945"></a>
### AAS_RemoveAllPortals

```ml
function AAS_RemoveAllPortals(value)
```

AAS_RemoveAllPortals

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `settings`. May update `value.settings[index].contents` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L327)

<a id="function-function-mq3-botlib-aas-clustering-aas-removeclusterareas-function-aas-removeclusterareas-value-src-mq3-botlib-aas-clustering-ml-1638971773"></a>
### AAS_RemoveClusterAreas

```ml
function AAS_RemoveClusterAreas(value)
```

AAS_RemoveClusterAreas

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `settings`. May update `value.settings[index].cluster` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L171)

<a id="function-function-mq3-botlib-aas-clustering-aas-removenotclusterclosingportals-function-aas-removenotclusterclosingportals-value-src-mq3-botlib-aas-clustering-ml-791488497"></a>
### AAS_RemoveNotClusterClosingPortals

```ml
function AAS_RemoveNotClusterClosingPortals(value)
```

AAS_RemoveNotClusterClosingPortals

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `settings`. May update `value.settings[index].contents` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L344)

<a id="function-function-mq3-botlib-aas-clustering-aas-removeportalsclusterreference-function-aas-removeportalsclusterreference-value-clusternum-src-mq3-botlib-aas-clustering-ml-630710087"></a>
### AAS_RemovePortalsClusterReference

```ml
function AAS_RemovePortalsClusterReference(value, clusterNum)
```

AAS_RemovePortalsClusterReference

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `portals`. May update `value.portals[index].frontCluster` and `value.portals[index].backCluster` in place. |
| `clusterNum` | `dynamic` | — | AAS cluster number. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L179)

<a id="function-function-mq3-botlib-aas-clustering-aas-removeteleporterportals-function-aas-removeteleporterportals-value-src-mq3-botlib-aas-clustering-ml-903859071"></a>
### AAS_RemoveTeleporterPortals

```ml
function AAS_RemoveTeleporterPortals(value)
```

AAS_RemoveTeleporterPortals

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `settings` and `reachabilities`. May update `value.settings[r.areaNum].contents` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L337)

<a id="function-function-mq3-botlib-aas-clustering-aas-setviewportalsasclusterportals-function-aas-setviewportalsasclusterportals-value-src-mq3-botlib-aas-clustering-ml-1497850605"></a>
### AAS_SetViewPortalsAsClusterPortals

```ml
function AAS_SetViewPortalsAsClusterPortals(value)
```

AAS_SetViewPortalsAsClusterPortals

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `settings`. May update `value.settings[index].contents` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L361)

<a id="function-function-mq3-botlib-aas-clustering-aas-testportals-function-aas-testportals-value-src-mq3-botlib-aas-clustering-ml-1843566815"></a>
### AAS_TestPortals

```ml
function AAS_TestPortals(value)
```

AAS_TestPortals

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `portals` and `settings`. May update `value.settings[p.areaNum].contents` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L352)

<a id="function-function-mq3-botlib-aas-clustering-aas-updateportal-function-aas-updateportal-value-areanum-clusternum-src-mq3-botlib-aas-clustering-ml-824689434"></a>
### AAS_UpdatePortal

```ml
function AAS_UpdatePortal(value, areaNum, clusterNum)
```

AAS_UpdatePortal

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `portals`, `settings` and `portalIndex`. May update `value.settings[areaNum].contents`, `value.settings[areaNum].cluster` and `value.portalIndex` in place. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `clusterNum` | `dynamic` | — | AAS cluster number. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L184)

<a id="function-function-mq3-botlib-aas-clustering-absint-function-absint-value-src-mq3-botlib-aas-clustering-ml-1511659865"></a>
### absInt

```ml
function absInt(value)
```

Return the absolute value of the numeric argument for aas clustering.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `0-value`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L122)

<a id="function-function-mq3-botlib-aas-clustering-appendunique-function-appendunique-values-needle-src-mq3-botlib-aas-clustering-ml-1797268177"></a>
### appendUnique

```ml
function appendUnique(values, needle)
```

Apply `mq3.botlib.aas_clustering.contains` while evaluating `appendUnique`. Return paths include `values`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Value used by `contains` in `for each value in values if value==needle then return true end if end for`. |
| `needle` | `dynamic` | — | Text or value to search for. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L163)

<a id="function-function-mq3-botlib-aas-clustering-area-function-area-numfaces-firstface-src-mq3-botlib-aas-clustering-ml-1075675969"></a>
### area

```ml
function area(numFaces, firstFace)
```

Create a `mq3.botlib.aas_clustering.Area` record, initializing `numFaces` from `numFaces` and `firstFace` from `firstFace`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `numFaces` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.Area.numFaces`. |
| `firstFace` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.Area.firstFace`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L62)

- [mq3.botlib.aas_clustering.Area](Type-mq3-botlib-aas-clustering-area-352668781.md) — struct
<a id="constant-constant-mq3-botlib-aas-clustering-area-grounded-const-area-grounded-1-src-mq3-botlib-aas-clustering-ml-555790540"></a>
### AREA_GROUNDED

```ml
const AREA_GROUNDED = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L13)

<a id="constant-constant-mq3-botlib-aas-clustering-areacontents-clusterportal-const-areacontents-clusterportal-8-src-mq3-botlib-aas-clustering-ml-1664323727"></a>
### AREACONTENTS_CLUSTERPORTAL

```ml
const AREACONTENTS_CLUSTERPORTAL = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L14)

<a id="constant-constant-mq3-botlib-aas-clustering-areacontents-routeportal-const-areacontents-routeportal-32-src-mq3-botlib-aas-clustering-ml-508480338"></a>
### AREACONTENTS_ROUTEPORTAL

```ml
const AREACONTENTS_ROUTEPORTAL = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L16)

<a id="constant-constant-mq3-botlib-aas-clustering-areacontents-teleportal-const-areacontents-teleportal-16-src-mq3-botlib-aas-clustering-ml-542555340"></a>
### AREACONTENTS_TELEPORTAL

```ml
const AREACONTENTS_TELEPORTAL = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L15)

<a id="constant-constant-mq3-botlib-aas-clustering-areacontents-viewportal-const-areacontents-viewportal-512-src-mq3-botlib-aas-clustering-ml-690700117"></a>
### AREACONTENTS_VIEWPORTAL

```ml
const AREACONTENTS_VIEWPORTAL = 512
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L17)

<a id="function-function-mq3-botlib-aas-clustering-areafaces-function-areafaces-value-areanum-src-mq3-botlib-aas-clustering-ml-1339010982"></a>
### areaFaces

```ml
function areaFaces(value, areaNum)
```

Apply `mq3.botlib.aas_clustering.validArea` and `mq3.botlib.aas_clustering.absInt` while evaluating `areaFaces`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `areas` and `faceIndex`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L151)

<a id="function-function-mq3-botlib-aas-clustering-areahasreachability-function-areahasreachability-value-areanum-src-mq3-botlib-aas-clustering-ml-505038632"></a>
### areaHasReachability

```ml
function areaHasReachability(value, areaNum)
```

Test `validArea(value,areaNum) and value.settings[areaNum].numReachableAreas>0` as the condition for `areaHasReachability`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `settings`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L142)

<a id="function-function-mq3-botlib-aas-clustering-areasettings-function-areasettings-contents-areaflags-presencetype-cluster-clusterareanum-numreachableareas-firstreachablearea-src-mq3-botlib-aas-clustering-ml-1938961185"></a>
### areaSettings

```ml
function areaSettings(contents, areaFlags, presenceType, cluster, clusterAreaNum, numReachableAreas, firstReachableArea)
```

Create a `mq3.botlib.aas_clustering.AreaSettings` record, initializing `contents` from `contents`, `areaFlags` from `areaFlags` and `presenceType` from `presenceType`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `contents` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.AreaSettings.contents`. |
| `areaFlags` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.AreaSettings.areaFlags`. |
| `presenceType` | `dynamic` | — | AAS presence type selecting the movement bounds. |
| `cluster` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.AreaSettings.cluster`. |
| `clusterAreaNum` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.AreaSettings.clusterAreaNum`. |
| `numReachableAreas` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.AreaSettings.numReachableAreas`. |
| `firstReachableArea` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.AreaSettings.firstReachableArea`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L71)

- [mq3.botlib.aas_clustering.AreaSettings](Type-mq3-botlib-aas-clustering-areasettings-203967600.md) — struct
<a id="function-function-mq3-botlib-aas-clustering-cluster-function-cluster-numareas-numreachabilityareas-numportals-firstportal-src-mq3-botlib-aas-clustering-ml-445607606"></a>
### cluster

```ml
function cluster(numAreas, numReachabilityAreas, numPortals, firstPortal)
```

Create a `mq3.botlib.aas_clustering.Cluster` record, initializing `numAreas` from `numAreas`, `numReachabilityAreas` from `numReachabilityAreas` and `numPortals` from `numPortals`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `numAreas` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.Cluster.numAreas`. |
| `numReachabilityAreas` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.Cluster.numReachabilityAreas`. |
| `numPortals` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.Cluster.numPortals`. |
| `firstPortal` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.Cluster.firstPortal`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L88)

- [mq3.botlib.aas_clustering.Cluster](Type-mq3-botlib-aas-clustering-cluster-335209526.md) — struct
<a id="function-function-mq3-botlib-aas-clustering-contains-function-contains-values-needle-src-mq3-botlib-aas-clustering-ml-1775581069"></a>
### contains

```ml
function contains(values, needle)
```

Search the supplied values for an entry equal to the needle.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Value used by `contains` in `for each value in values if value==needle then return true end if end for`. |
| `needle` | `dynamic` | — | Text or value to search for. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L159)

<a id="function-function-mq3-botlib-aas-clustering-cross-function-cross-a-b-src-mq3-botlib-aas-clustering-ml-2043726795"></a>
### cross

```ml
function cross(a, b)
```

Return a new array `[a[1]*b[2]-a[2]*b[1],a[2]*b[0]-a[0]*b[2],a[0]*b[1]-a[1]*b[0]]` for `cross`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `b` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L134)

<a id="function-function-mq3-botlib-aas-clustering-dot-function-dot-a-b-src-mq3-botlib-aas-clustering-ml-974547009"></a>
### dot

```ml
function dot(a, b)
```

Return `a[0]*b[0]+a[1]*b[1]+a[2]*b[2]` for `dot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `b` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L126)

<a id="function-function-mq3-botlib-aas-clustering-edge-function-edge-a-b-src-mq3-botlib-aas-clustering-ml-1532628795"></a>
### edge

```ml
function edge(a, b)
```

Create a `mq3.botlib.aas_clustering.Edge` record, initializing `vertices` as `[a,b]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Operand used to evaluate the returned expression `Edge([a,b])`. |
| `b` | `dynamic` | — | Operand used to evaluate the returned expression `Edge([a,b])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L50)

- [mq3.botlib.aas_clustering.Edge](Type-mq3-botlib-aas-clustering-edge-776394497.md) — struct
<a id="function-function-mq3-botlib-aas-clustering-emit-function-emit-value-boundary-kind-subject-detail-number-src-mq3-botlib-aas-clustering-ml-1023787683"></a>
### emit

```ml
function emit(value, boundary, kind, subject, detail, number)
```

Update `value.actions` during `emit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `actions` and `retailActive`. May update `value.actions` in place. |
| `boundary` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.HostAction.boundary`. |
| `kind` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.HostAction.kind`. |
| `subject` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.HostAction.subject`. |
| `detail` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.HostAction.detail`. |
| `number` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.HostAction.value`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L119)

<a id="function-function-mq3-botlib-aas-clustering-ensurecluster-function-ensurecluster-value-index-src-mq3-botlib-aas-clustering-ml-567488775"></a>
### ensureCluster

```ml
function ensureCluster(value, index)
```

Set `value.clusters` to `value.clusters+[cluster(0,0,0,0)]` in `mq3.botlib.aas_clustering.ensureCluster`. Return paths include `value.clusters[index]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `clusters`. May update `value.clusters` in place. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L167)

<a id="function-function-mq3-botlib-aas-clustering-entity-function-entity-classname-target-targetname-origin-linkedareas-destinationarea-valid-src-mq3-botlib-aas-clustering-ml-1387253010"></a>
### entity

```ml
function entity(className, target, targetName, origin, linkedAreas, destinationArea, valid)
```

Create a `mq3.botlib.aas_clustering.Entity` record, initializing `className` from `className`, `target` from `target` and `targetName` from `targetName`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `className` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.Entity.className`. |
| `target` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.Entity.target`. |
| `targetName` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.Entity.targetName`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `linkedAreas` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.Entity.linkedAreas`. |
| `destinationArea` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.Entity.destinationArea`. |
| `valid` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.Entity.valid`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L97)

- [mq3.botlib.aas_clustering.Entity](Type-mq3-botlib-aas-clustering-entity-1051813991.md) — struct
<a id="function-function-mq3-botlib-aas-clustering-face-function-face-planenum-flags-numedges-firstedge-frontarea-backarea-src-mq3-botlib-aas-clustering-ml-448002198"></a>
### face

```ml
function face(planeNum, flags, numEdges, firstEdge, frontArea, backArea)
```

Create a `mq3.botlib.aas_clustering.Face` record, initializing `planeNum` from `planeNum`, `flags` from `flags` and `numEdges` from `numEdges`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `planeNum` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.Face.planeNum`. |
| `flags` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.Face.flags`. |
| `numEdges` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.Face.numEdges`. |
| `firstEdge` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.Face.firstEdge`. |
| `frontArea` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.Face.frontArea`. |
| `backArea` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.Face.backArea`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L58)

- [mq3.botlib.aas_clustering.Face](Type-mq3-botlib-aas-clustering-face-1757093549.md) — struct
<a id="constant-constant-mq3-botlib-aas-clustering-face-solid-const-face-solid-1-src-mq3-botlib-aas-clustering-ml-1375378656"></a>
### FACE_SOLID

```ml
const FACE_SOLID = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L12)

<a id="function-function-mq3-botlib-aas-clustering-frommap-function-frommap-map-retailactive-src-mq3-botlib-aas-clustering-ml-707857707"></a>
### fromMap

```ml
function fromMap(map, retailActive)
```

Apply `mq3.format.aas.plane`, `mq3.botlib.aas_clustering.plane` and `mq3.format.aas.vertex` while evaluating `fromMap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Map record; accesses `counts`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L373)

- [mq3.botlib.aas_clustering.HostAction](Type-mq3-botlib-aas-clustering-hostaction-1074524356.md) — struct
<a id="constant-constant-mq3-botlib-aas-clustering-max-portalareas-const-max-portalareas-1024-src-mq3-botlib-aas-clustering-ml-1860986540"></a>
### MAX_PORTALAREAS

```ml
const MAX_PORTALAREAS = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L11)

<a id="function-function-mq3-botlib-aas-clustering-otherarea-function-otherarea-value-facenum-areanum-src-mq3-botlib-aas-clustering-ml-816967437"></a>
### otherArea

```ml
function otherArea(value, faceNum, areaNum)
```

Return the area on the opposite side of an AAS face, or zero for an invalid face index.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `faces`. |
| `faceNum` | `dynamic` | — | AAS face index. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L147)

<a id="function-function-mq3-botlib-aas-clustering-plane-function-plane-normal-dist-src-mq3-botlib-aas-clustering-ml-1215880171"></a>
### plane

```ml
function plane(normal, dist)
```

Create a `mq3.botlib.aas_clustering.Plane` record, initializing `normal` from `normal` and `dist` from `dist`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `normal` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.Plane.normal`. |
| `dist` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.Plane.dist`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L46)

- [mq3.botlib.aas_clustering.Plane](Type-mq3-botlib-aas-clustering-plane-1463209310.md) — struct
<a id="function-function-mq3-botlib-aas-clustering-portal-function-portal-areanum-frontcluster-backcluster-frontarea-backarea-src-mq3-botlib-aas-clustering-ml-2047451941"></a>
### portal

```ml
function portal(areaNum, frontCluster, backCluster, frontArea, backArea)
```

Create a `mq3.botlib.aas_clustering.Portal` record, initializing `areaNum` from `areaNum`, `frontCluster` from `frontCluster` and `backCluster` from `backCluster`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `frontCluster` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.Portal.frontCluster`. |
| `backCluster` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.Portal.backCluster`. |
| `frontArea` | `dynamic` | — | Operand used to evaluate the returned expression `Portal(areaNum,frontCluster,backCluster,[frontArea,backArea])`. |
| `backArea` | `dynamic` | — | Operand used to evaluate the returned expression `Portal(areaNum,frontCluster,backCluster,[frontArea,backArea])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L82)

- [mq3.botlib.aas_clustering.Portal](Type-mq3-botlib-aas-clustering-portal-1814820458.md) — struct
<a id="function-function-mq3-botlib-aas-clustering-reachability-function-reachability-areanum-traveltype-src-mq3-botlib-aas-clustering-ml-1101123835"></a>
### reachability

```ml
function reachability(areaNum, travelType)
```

Create a `mq3.botlib.aas_clustering.Reachability` record, initializing `areaNum` from `areaNum` and `travelType` from `travelType`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `travelType` | `dynamic` | — | AAS reachability travel-type code. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L75)

- [mq3.botlib.aas_clustering.Reachability](Type-mq3-botlib-aas-clustering-reachability-1954272347.md) — struct
<a id="function-function-mq3-botlib-aas-clustering-reachableareas-function-reachableareas-value-areanum-src-mq3-botlib-aas-clustering-ml-1277098516"></a>
### reachableAreas

```ml
function reachableAreas(value, areaNum)
```

Apply `mq3.botlib.aas_clustering.validArea` while evaluating `reachableAreas`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `settings` and `reachabilities`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L155)

<a id="function-function-mq3-botlib-aas-clustering-subtract-function-subtract-a-b-src-mq3-botlib-aas-clustering-ml-1302415459"></a>
### subtract

```ml
function subtract(a, b)
```

Return a new array `[a[0]-b[0],a[1]-b[1],a[2]-b[2]]` for `subtract`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `b` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L130)

<a id="constant-constant-mq3-botlib-aas-clustering-travel-teleport-const-travel-teleport-10-src-mq3-botlib-aas-clustering-ml-1302158378"></a>
### TRAVEL_TELEPORT

```ml
const TRAVEL_TELEPORT = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L18)

<a id="function-function-mq3-botlib-aas-clustering-validarea-function-validarea-value-areanum-src-mq3-botlib-aas-clustering-ml-1471588830"></a>
### validArea

```ml
function validArea(value, areaNum)
```

Test `areaNum>0 and areaNum<len(value.areas) and areaNum<len(value.settings)` as the condition for `validArea`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `areas` and `settings`. |
| `areaNum` | `dynamic` | — | AAS area number; zero denotes no area. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L138)

<a id="function-function-mq3-botlib-aas-clustering-world-function-world-loaded-nofaceflood-planes-vertexes-edges-edgeindex-faces-faceindex-areas-settings-reachabilities-retailactive-src-mq3-botlib-aas-clustering-ml-122096713"></a>
### world

```ml
function world(loaded, noFaceFlood, planes, vertexes, edges, edgeIndex, faces, faceIndex, areas, settings, reachabilities, retailActive)
```

Create a `mq3.botlib.aas_clustering.World` record, initializing `loaded` from `loaded`, `noFaceFlood` from `noFaceFlood` and `planes` from `planes`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `loaded` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.World.loaded`. |
| `noFaceFlood` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.World.noFaceFlood`. |
| `planes` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.World.planes`. |
| `vertexes` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.World.vertexes`. |
| `edges` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.World.edges`. |
| `edgeIndex` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.World.edgeIndex`. |
| `faces` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.World.faces`. |
| `faceIndex` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.World.faceIndex`. |
| `areas` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.World.areas`. |
| `settings` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.World.settings`. |
| `reachabilities` | `dynamic` | — | Initial value stored in `mq3.botlib.aas_clustering.World.reachabilities`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/aas_clustering.ml#L111)

- [mq3.botlib.aas_clustering.World](Type-mq3-botlib-aas-clustering-world-1347418376.md) — struct
