# `src/mq3/server/snapshot_build.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.snapshot_build`](Package-mq3-server-snapshot-build-150266642.md)

Reachable from entry: **yes**

## Imports

- `mq3/game/entitystate.ml` as `entitystate` → [src/mq3/game/entitystate.ml](File-src-mq3-game-entitystate-ml-1227653182.md)
- `mq3/game/g_public.ml` as `gpublic` → [src/mq3/game/g_public.ml](File-src-mq3-game-g-public-ml-554411541.md)
- `mq3/game/playerstate.ml` as `playerstate` → [src/mq3/game/playerstate.ml](File-src-mq3-game-playerstate-ml-1407876292.md)
- `std/sort.ml` as `sorts` → `../MiniLangCompilerML/std/sort.ml` — external dependency

## Declarations

<a id="function-function-mq3-server-snapshot-build-addentitiesvisiblefrompoint-function-addentitiesvisiblefrompoint-worldstate-host-origin-outframe-numbers-portal-src-mq3-server-snapshot-build-ml-1904294800"></a>
### addEntitiesVisibleFromPoint

```ml
function addEntitiesVisibleFromPoint(worldState, host, origin, outFrame, numbers, portal)
```

Host callbacks provide CM_PointLeafnum, leaf area/cluster, CM_WriteAreaBits, CM_ClusterPVS and CM_AreasConnected. Portal recursion stays in MiniLang.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `worldState` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `outFrame` | `dynamic` | — |  |
| `numbers` | `dynamic` | — |  |
| `portal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L76)

<a id="function-function-mq3-server-snapshot-build-addentity-function-addentity-worldstate-entity-numbers-src-mq3-server-snapshot-build-ml-2016544720"></a>
### addEntity

```ml
function addEntity(worldState, entity, numbers)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `worldState` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `numbers` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L57)

<a id="function-function-mq3-server-snapshot-build-buildclientsnapshot-function-buildclientsnapshot-worldstate-host-ps-cliententitypresent-zombie-src-mq3-server-snapshot-build-ml-1001516793"></a>
### buildClientSnapshot

```ml
function buildClientSnapshot(worldState, host, ps, clientEntityPresent, zombie)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `worldState` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `ps` | `dynamic` | — |  |
| `clientEntityPresent` | `dynamic` | — |  |
| `zombie` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L124)

<a id="function-function-mq3-server-snapshot-build-distancesquared-function-distancesquared-first-second-src-mq3-server-snapshot-build-ml-950875106"></a>
### distanceSquared

```ml
function distanceSquared(first, second)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L69)

<a id="function-function-mq3-server-snapshot-build-entitynumbers-function-entitynumbers-src-mq3-server-snapshot-build-ml-1537161874"></a>
### entityNumbers

```ml
function entityNumbers()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L39)

- [mq3.server.snapshot_build.EntityNumbers](Type-mq3-server-snapshot-build-entitynumbers-1057370823.md) — struct
<a id="function-function-mq3-server-snapshot-build-frame-function-frame-src-mq3-server-snapshot-build-ml-891023274"></a>
### frame

```ml
function frame()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L36)

- [mq3.server.snapshot_build.Frame](Type-mq3-server-snapshot-build-frame-285652081.md) — struct
<a id="constant-constant-mq3-server-snapshot-build-max-gentities-const-max-gentities-1024-src-mq3-server-snapshot-build-ml-1902973892"></a>
### MAX_GENTITIES

```ml
const MAX_GENTITIES = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L12)

<a id="constant-constant-mq3-server-snapshot-build-max-map-area-bytes-const-max-map-area-bytes-32-src-mq3-server-snapshot-build-ml-297081586"></a>
### MAX_MAP_AREA_BYTES

```ml
const MAX_MAP_AREA_BYTES = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L11)

<a id="constant-constant-mq3-server-snapshot-build-max-snapshot-entities-const-max-snapshot-entities-1024-src-mq3-server-snapshot-build-ml-911377612"></a>
### MAX_SNAPSHOT_ENTITIES

```ml
const MAX_SNAPSHOT_ENTITIES = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L10)

<a id="function-function-mq3-server-snapshot-build-pvscontains-function-pvscontains-pvs-cluster-src-mq3-server-snapshot-build-ml-983218871"></a>
### pvsContains

```ml
function pvsContains(pvs, cluster)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pvs` | `dynamic` | — |  |
| `cluster` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L65)

<a id="function-function-mq3-server-snapshot-build-services-function-services-pointleaffn-leafareafn-leafclusterfn-writeareabitsfn-clusterpvsfn-areasconnectedfn-context-src-mq3-server-snapshot-build-ml-1785242430"></a>
### services

```ml
function services(pointLeafFn, leafAreaFn, leafClusterFn, writeAreaBitsFn, clusterPvsFn, areasConnectedFn, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pointLeafFn` | `dynamic` | — |  |
| `leafAreaFn` | `dynamic` | — |  |
| `leafClusterFn` | `dynamic` | — |  |
| `writeAreaBitsFn` | `dynamic` | — |  |
| `clusterPvsFn` | `dynamic` | — |  |
| `areasConnectedFn` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L26)

- [mq3.server.snapshot_build.Services](Type-mq3-server-snapshot-build-services-1404099900.md) — struct
<a id="function-function-mq3-server-snapshot-build-snapshotentity-function-snapshotentity-state-linked-svflags-singleclient-clusters-lastcluster-areanum-areanum2-src-mq3-server-snapshot-build-ml-1304673626"></a>
### snapshotEntity

```ml
function snapshotEntity(state, linked, svFlags, singleClient, clusters, lastCluster, areaNum, areaNum2)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `linked` | `dynamic` | — |  |
| `svFlags` | `dynamic` | — |  |
| `singleClient` | `dynamic` | — |  |
| `clusters` | `dynamic` | — |  |
| `lastCluster` | `dynamic` | — |  |
| `areaNum` | `dynamic` | — |  |
| `areaNum2` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L29)

- [mq3.server.snapshot_build.SnapshotEntity](Type-mq3-server-snapshot-build-snapshotentity-856916187.md) — struct
<a id="function-function-mq3-server-snapshot-build-sortentitynumbers-function-sortentitynumbers-numbers-src-mq3-server-snapshot-build-ml-669261220"></a>
### sortEntityNumbers

```ml
function sortEntityNumbers(numbers)
```

SV_QsortEntityNumbers semantics. Keep the caller-owned input detached while using the standard-library O(n log n) sort instead of repeatedly concatenating arrays in an O(n^2) insertion sort on every client snapshot.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `numbers` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L44)

<a id="constant-constant-mq3-server-snapshot-build-svf-broadcast-const-svf-broadcast-gpublic-svf-broadcast-src-mq3-server-snapshot-build-ml-674964760"></a>
### SVF_BROADCAST

```ml
const SVF_BROADCAST = gpublic.SVF_BROADCAST
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L15)

<a id="constant-constant-mq3-server-snapshot-build-svf-clientmask-const-svf-clientmask-gpublic-svf-clientmask-src-mq3-server-snapshot-build-ml-1678679296"></a>
### SVF_CLIENTMASK

```ml
const SVF_CLIENTMASK = gpublic.SVF_CLIENTMASK
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L14)

<a id="constant-constant-mq3-server-snapshot-build-svf-noclient-const-svf-noclient-gpublic-svf-noclient-src-mq3-server-snapshot-build-ml-516309299"></a>
### SVF_NOCLIENT

```ml
const SVF_NOCLIENT = gpublic.SVF_NOCLIENT
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L13)

<a id="constant-constant-mq3-server-snapshot-build-svf-notsingleclient-const-svf-notsingleclient-gpublic-svf-notsingleclient-src-mq3-server-snapshot-build-ml-521997323"></a>
### SVF_NOTSINGLECLIENT

```ml
const SVF_NOTSINGLECLIENT = gpublic.SVF_NOTSINGLECLIENT
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L18)

<a id="constant-constant-mq3-server-snapshot-build-svf-portal-const-svf-portal-gpublic-svf-portal-src-mq3-server-snapshot-build-ml-1330676353"></a>
### SVF_PORTAL

```ml
const SVF_PORTAL = gpublic.SVF_PORTAL
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L16)

<a id="constant-constant-mq3-server-snapshot-build-svf-singleclient-const-svf-singleclient-gpublic-svf-singleclient-src-mq3-server-snapshot-build-ml-361854284"></a>
### SVF_SINGLECLIENT

```ml
const SVF_SINGLECLIENT = gpublic.SVF_SINGLECLIENT
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L17)

<a id="function-function-mq3-server-snapshot-build-world-function-world-active-entities-ringcapacity-src-mq3-server-snapshot-build-ml-330307467"></a>
### world

```ml
function world(active, entities, ringCapacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `active` | `dynamic` | — |  |
| `entities` | `dynamic` | — |  |
| `ringCapacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L32)

- [mq3.server.snapshot_build.World](Type-mq3-server-snapshot-build-world-2119455472.md) — struct
