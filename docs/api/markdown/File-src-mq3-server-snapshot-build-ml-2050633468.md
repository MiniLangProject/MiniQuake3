# `src/mq3/server/snapshot_build.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.snapshot_build`](Package-mq3-server-snapshot-build-150266642.md)

Reachable from entry: **yes**

## Imports

- `mq3/game/entitystate.ml` as `entitystate` → [src/mq3/game/entitystate.ml](File-src-mq3-game-entitystate-ml-1227653182.md)
- `mq3/game/g_public.ml` as `gpublic` → [src/mq3/game/g_public.ml](File-src-mq3-game-g-public-ml-554411541.md)
- `mq3/game/playerstate.ml` as `playerstate` → [src/mq3/game/playerstate.ml](File-src-mq3-game-playerstate-ml-1407876292.md)
- `std/ds/list.ml` as `snapshotLists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency
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
| `worldState` | `dynamic` | — | World state passed as `worldState` to `mq3.server.snapshot_build.addVisibleMode`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.server.snapshot_build.addVisibleMode`. |
| `origin` | `dynamic` | — | Origin passed as `origin` to `mq3.server.snapshot_build.addVisibleMode`. |
| `outFrame` | `dynamic` | — | Out frame passed as `outFrame` to `mq3.server.snapshot_build.addVisibleMode`. |
| `numbers` | `dynamic` | — | Numbers passed as `numbers` to `mq3.server.snapshot_build.addVisibleMode`. |
| `portal` | `dynamic` | — | Portal passed as `portal` to `mq3.server.snapshot_build.addVisibleMode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_build.ml#L135)

<a id="function-function-mq3-server-snapshot-build-addentity-function-addentity-worldstate-entity-numbers-src-mq3-server-snapshot-build-ml-2016544720"></a>
### addEntity

```ml
function addEntity(worldState, entity, numbers)
```

Return `mq3.server.snapshot_build.addEntityMode(worldState, entity, numbers, void)` from `server.snapshot_build.addEntity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `worldState` | `dynamic` | — | World state passed as `worldState` to `mq3.server.snapshot_build.addEntityMode`. |
| `entity` | `dynamic` | — | Entity passed as `entity` to `mq3.server.snapshot_build.addEntityMode`. |
| `numbers` | `dynamic` | — | Numbers passed as `numbers` to `mq3.server.snapshot_build.addEntityMode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_build.ml#L93)

<a id="function-function-mq3-server-snapshot-build-addentitymode-function-addentitymode-worldstate-entity-numbers-builder-src-mq3-server-snapshot-build-ml-550307837"></a>
### addEntityMode

```ml
function addEntityMode(worldState, entity, numbers, builder)
```

Add entity mode in server.snapshot_build; the normal completion returns `true`.

Direct state writes: `entity.snapshotCounter`, `numbers.count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `worldState` | `dynamic` | — | Record exposing `snapshotCounter`. |
| `entity` | `dynamic` | — | Record exposing `snapshotCounter`, `state`. Updated in place: `snapshotCounter`. |
| `numbers` | `dynamic` | — | Record exposing `count`, `values`. Updated in place: `count`. |
| `builder` | `dynamic` | — | Record exposing `add`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_build.ml#L103)

<a id="function-function-mq3-server-snapshot-build-addvisiblemode-function-addvisiblemode-worldstate-host-origin-outframe-numbers-portal-builder-src-mq3-server-snapshot-build-ml-750390859"></a>
### addVisibleMode

```ml
function addVisibleMode(worldState, host, origin, outFrame, numbers, portal, builder)
```

Add visible mode in server.snapshot_build; updates `outFrame.areaBytes`.

Validation failures include `snapshot build: client mask index`.
Direct state writes: `outFrame.areaBytes`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `worldState` | `dynamic` | — | Record exposing `active`, `entities`, `snapshotCounter`. |
| `host` | `dynamic` | — | Record exposing `pointLeafFn`, `leafAreaFn`, `leafClusterFn`, `writeAreaBitsFn`, `clusterPvsFn`, `areasConnectedFn`. |
| `origin` | `dynamic` | — | Second passed as `second` to `mq3.server.snapshot_build.distanceSquared`. |
| `outFrame` | `dynamic` | — | Record exposing `areaBits`, `playerState`. Updated in place: `areaBytes`. |
| `numbers` | `dynamic` | — | Numbers passed as `numbers` to `mq3.server.snapshot_build.addEntityMode`. |
| `portal` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `builder` | `dynamic` | — | Builder passed as `builder` to `mq3.server.snapshot_build.addEntityMode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_build.ml#L149)

<a id="function-function-mq3-server-snapshot-build-buildclientsnapshot-function-buildclientsnapshot-worldstate-host-ps-cliententitypresent-zombie-src-mq3-server-snapshot-build-ml-1001516793"></a>
### buildClientSnapshot

```ml
function buildClientSnapshot(worldState, host, ps, clientEntityPresent, zombie)
```

Build client snapshot in server.snapshot_build; the normal completion returns `outFrame`.

Validation failures include `snapshot build: bad client entity`; `snapshot build: entity ring wrapped`.
Direct state writes: `worldState.snapshotCounter`, `worldState.nextSnapshotEntities`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `worldState` | `dynamic` | — | Record exposing `snapshotCounter`, `entities`, `nextSnapshotEntities`, `ring`, `ringCapacity`. Updated in place: `snapshotCounter`, `nextSnapshotEntities`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.server.snapshot_build.addVisibleMode`. |
| `ps` | `dynamic` | — | Record exposing `clientNum`, `origin`, `viewheight`. |
| `clientEntityPresent` | `dynamic` | — | Client entity present used in `(not clientEntityPresent or zombie)`. |
| `zombie` | `dynamic` | — | Zombie used in `(not clientEntityPresent or zombie)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_build.ml#L206)

<a id="function-function-mq3-server-snapshot-build-distancesquared-function-distancesquared-first-second-src-mq3-server-snapshot-build-ml-950875106"></a>
### distanceSquared

```ml
function distanceSquared(first, second)
```

Compute distance squared in server.snapshot_build; the normal completion returns `(((x * x) + (y * y)) + (z * z))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — | First used in `first[0]` and `first[1]`. |
| `second` | `dynamic` | — | Second used in `second[0]` and `second[1]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_build.ml#L122)

<a id="function-function-mq3-server-snapshot-build-entitynumbers-function-entitynumbers-src-mq3-server-snapshot-build-ml-1537161874"></a>
### entityNumbers

```ml
function entityNumbers()
```

Create `mq3.server.snapshot_build.EntityNumbers` with values=array(MAX_SNAPSHOT_ENTITIES, 0); count=0.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_build.ml#L70)

- [mq3.server.snapshot_build.EntityNumbers](Type-mq3-server-snapshot-build-entitynumbers-1057370823.md) — struct
<a id="function-function-mq3-server-snapshot-build-frame-function-frame-src-mq3-server-snapshot-build-ml-891023274"></a>
### frame

```ml
function frame()
```

Create `mq3.server.snapshot_build.Frame` with areaBytes=0; areaBits=bytes(MAX_MAP_AREA_BYTES, 0); playerState=playerstate.create(); numEntities=0; firstEntity=0.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_build.ml#L66)

- [mq3.server.snapshot_build.Frame](Type-mq3-server-snapshot-build-frame-285652081.md) — struct
<a id="constant-constant-mq3-server-snapshot-build-max-gentities-const-max-gentities-1024-src-mq3-server-snapshot-build-ml-1902973892"></a>
### MAX_GENTITIES

```ml
const MAX_GENTITIES = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_build.ml#L13)

<a id="constant-constant-mq3-server-snapshot-build-max-map-area-bytes-const-max-map-area-bytes-32-src-mq3-server-snapshot-build-ml-297081586"></a>
### MAX_MAP_AREA_BYTES

```ml
const MAX_MAP_AREA_BYTES = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_build.ml#L12)

<a id="constant-constant-mq3-server-snapshot-build-max-snapshot-entities-const-max-snapshot-entities-1024-src-mq3-server-snapshot-build-ml-911377612"></a>
### MAX_SNAPSHOT_ENTITIES

```ml
const MAX_SNAPSHOT_ENTITIES = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_build.ml#L11)

<a id="function-function-mq3-server-snapshot-build-pvscontains-function-pvscontains-pvs-cluster-src-mq3-server-snapshot-build-ml-983218871"></a>
### pvsContains

```ml
function pvsContains(pvs, cluster)
```

Compute pvs contains in server.snapshot_build; the normal completion returns `((pvs[(cluster >> 3)] & (1 << (cluster & 7))) != 0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pvs` | `dynamic` | — | Pvs used in `len(pvs)` and `pvs[(cluster >> 3)]`. |
| `cluster` | `dynamic` | — | Cluster used in `(cluster < 0)` and `(cluster & 7)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_build.ml#L115)

<a id="function-function-mq3-server-snapshot-build-services-function-services-pointleaffn-leafareafn-leafclusterfn-writeareabitsfn-clusterpvsfn-areasconnectedfn-context-src-mq3-server-snapshot-build-ml-1785242430"></a>
### services

```ml
function services(pointLeafFn, leafAreaFn, leafClusterFn, writeAreaBitsFn, clusterPvsFn, areasConnectedFn, context)
```

Create `mq3.server.snapshot_build.Services` with pointLeafFn=pointLeafFn; leafAreaFn=leafAreaFn; leafClusterFn=leafClusterFn; writeAreaBitsFn=writeAreaBitsFn; clusterPvsFn=clusterPvsFn; areasConnectedFn=areasConnectedFn; context=context.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pointLeafFn` | `dynamic` | — | Initial `pointLeafFn` field stored in the returned or constructed `mq3.server.snapshot_build.Services` record. |
| `leafAreaFn` | `dynamic` | — | Initial `leafAreaFn` field stored in the returned or constructed `mq3.server.snapshot_build.Services` record. |
| `leafClusterFn` | `dynamic` | — | Initial `leafClusterFn` field stored in the returned or constructed `mq3.server.snapshot_build.Services` record. |
| `writeAreaBitsFn` | `dynamic` | — | Initial `writeAreaBitsFn` field stored in the returned or constructed `mq3.server.snapshot_build.Services` record. |
| `clusterPvsFn` | `dynamic` | — | Initial `clusterPvsFn` field stored in the returned or constructed `mq3.server.snapshot_build.Services` record. |
| `areasConnectedFn` | `dynamic` | — | Initial `areasConnectedFn` field stored in the returned or constructed `mq3.server.snapshot_build.Services` record. |
| `context` | `dynamic` | — | Initial `context` field stored in the returned or constructed `mq3.server.snapshot_build.Services` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_build.ml#L40)

- [mq3.server.snapshot_build.Services](Type-mq3-server-snapshot-build-services-1404099900.md) — struct
<a id="function-function-mq3-server-snapshot-build-snapshotentity-function-snapshotentity-state-linked-svflags-singleclient-clusters-lastcluster-areanum-areanum2-src-mq3-server-snapshot-build-ml-1304673626"></a>
### snapshotEntity

```ml
function snapshotEntity(state, linked, svFlags, singleClient, clusters, lastCluster, areaNum, areaNum2)
```

Create `mq3.server.snapshot_build.SnapshotEntity` with state=state; linked=linked; svFlags=svFlags; singleClient=singleClient; clusters=clusters; lastCluster=lastCluster; areaNum=areaNum; areaNum2=areaNum2; snapshotCounter=0.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Initial `state` field stored in the returned or constructed `mq3.server.snapshot_build.SnapshotEntity` record. |
| `linked` | `dynamic` | — | Initial `linked` field stored in the returned or constructed `mq3.server.snapshot_build.SnapshotEntity` record. |
| `svFlags` | `dynamic` | — | Initial `svFlags` field stored in the returned or constructed `mq3.server.snapshot_build.SnapshotEntity` record. |
| `singleClient` | `dynamic` | — | Initial `singleClient` field stored in the returned or constructed `mq3.server.snapshot_build.SnapshotEntity` record. |
| `clusters` | `dynamic` | — | Initial `clusters` field stored in the returned or constructed `mq3.server.snapshot_build.SnapshotEntity` record. |
| `lastCluster` | `dynamic` | — | Initial `lastCluster` field stored in the returned or constructed `mq3.server.snapshot_build.SnapshotEntity` record. |
| `areaNum` | `dynamic` | — | Initial `areaNum` field stored in the returned or constructed `mq3.server.snapshot_build.SnapshotEntity` record. |
| `areaNum2` | `dynamic` | — | Initial `areaNum2` field stored in the returned or constructed `mq3.server.snapshot_build.SnapshotEntity` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_build.ml#L52)

- [mq3.server.snapshot_build.SnapshotEntity](Type-mq3-server-snapshot-build-snapshotentity-856916187.md) — struct
<a id="function-function-mq3-server-snapshot-build-sortentitynumbers-function-sortentitynumbers-numbers-src-mq3-server-snapshot-build-ml-669261220"></a>
### sortEntityNumbers

```ml
function sortEntityNumbers(numbers)
```

SV_QsortEntityNumbers semantics. Keep the caller-owned input detached while using the standard-library O(n log n) sort instead of repeatedly concatenating arrays in an O(n^2) insertion sort on every client snapshot.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `numbers` | `dynamic` | — | Numbers used in `len(numbers)` and `typeof(numbers)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_build.ml#L76)

<a id="constant-constant-mq3-server-snapshot-build-svf-broadcast-const-svf-broadcast-gpublic-svf-broadcast-src-mq3-server-snapshot-build-ml-674964760"></a>
### SVF_BROADCAST

```ml
const SVF_BROADCAST = gpublic.SVF_BROADCAST
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_build.ml#L16)

<a id="constant-constant-mq3-server-snapshot-build-svf-clientmask-const-svf-clientmask-gpublic-svf-clientmask-src-mq3-server-snapshot-build-ml-1678679296"></a>
### SVF_CLIENTMASK

```ml
const SVF_CLIENTMASK = gpublic.SVF_CLIENTMASK
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_build.ml#L15)

<a id="constant-constant-mq3-server-snapshot-build-svf-noclient-const-svf-noclient-gpublic-svf-noclient-src-mq3-server-snapshot-build-ml-516309299"></a>
### SVF_NOCLIENT

```ml
const SVF_NOCLIENT = gpublic.SVF_NOCLIENT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_build.ml#L14)

<a id="constant-constant-mq3-server-snapshot-build-svf-notsingleclient-const-svf-notsingleclient-gpublic-svf-notsingleclient-src-mq3-server-snapshot-build-ml-521997323"></a>
### SVF_NOTSINGLECLIENT

```ml
const SVF_NOTSINGLECLIENT = gpublic.SVF_NOTSINGLECLIENT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_build.ml#L19)

<a id="constant-constant-mq3-server-snapshot-build-svf-portal-const-svf-portal-gpublic-svf-portal-src-mq3-server-snapshot-build-ml-1330676353"></a>
### SVF_PORTAL

```ml
const SVF_PORTAL = gpublic.SVF_PORTAL
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_build.ml#L17)

<a id="constant-constant-mq3-server-snapshot-build-svf-singleclient-const-svf-singleclient-gpublic-svf-singleclient-src-mq3-server-snapshot-build-ml-361854284"></a>
### SVF_SINGLECLIENT

```ml
const SVF_SINGLECLIENT = gpublic.SVF_SINGLECLIENT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_build.ml#L18)

<a id="function-function-mq3-server-snapshot-build-world-function-world-active-entities-ringcapacity-src-mq3-server-snapshot-build-ml-330307467"></a>
### world

```ml
function world(active, entities, ringCapacity)
```

Compute world in server.snapshot_build; the normal completion returns `World(active, 0, entities, array(ringCapacity, void), ringCapacity, 0)`.

Validation failures include `snapshot build: invalid ring capacity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `active` | `dynamic` | — | Initial `active` field stored in the returned or constructed `mq3.server.snapshot_build.World` record. |
| `entities` | `dynamic` | — | Initial `entities` field stored in the returned or constructed `mq3.server.snapshot_build.World` record. |
| `ringCapacity` | `dynamic` | — | Initial `ringCapacity` field stored in the returned or constructed `mq3.server.snapshot_build.World` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_build.ml#L61)

- [mq3.server.snapshot_build.World](Type-mq3-server-snapshot-build-world-2119455472.md) — struct
