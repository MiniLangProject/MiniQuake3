# `src/mq3/server/snapshot_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.snapshot_runtime`](Package-mq3-server-snapshot-runtime-1899297250.md)

Reachable from entry: **yes**

## Imports

- `mq3/collision/visibility.ml` as `visibility` → [src/mq3/collision/visibility.ml](File-src-mq3-collision-visibility-ml-1423508826.md)
- `mq3/collision/world.ml` as `cm` → [src/mq3/collision/world.ml](File-src-mq3-collision-world-ml-863162236.md)
- `mq3/game/entitystate.ml` as `entitystate` → [src/mq3/game/entitystate.ml](File-src-mq3-game-entitystate-ml-1227653182.md)
- `mq3/server/snapshot_build.ml` as `runtimeSnapshotBuild` → [src/mq3/server/snapshot_build.ml](File-src-mq3-server-snapshot-build-ml-2050633468.md)
- `std/array.ml` as `arrays` → `../../a7594a0c0299/MiniLangCompilerML/std/array.ml` — external dependency

## Declarations

<a id="function-function-mq3-server-snapshot-runtime-areasconnected-function-areasconnected-host-first-second-src-mq3-server-snapshot-runtime-ml-1588329108"></a>
### areasConnected

```ml
function areasConnected(host, first, second)
```

Return `mq3.collision.visibility.areasConnected(host.context.world.visibility, first, second)` from `server.snapshot_runtime.areasConnected`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |
| `first` | `dynamic` | — | Area 1 passed as `area1` to `mq3.collision.visibility.areasConnected`. |
| `second` | `dynamic` | — | Area 2 passed as `area2` to `mq3.collision.visibility.areasConnected`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_runtime.ml#L44)

<a id="function-function-mq3-server-snapshot-runtime-buildclientframe-function-buildclientframe-runtime-level-clientnum-zombie-src-mq3-server-snapshot-runtime-ml-1805398137"></a>
### buildClientFrame

```ml
function buildClientFrame(runtime, level, clientNum, zombie)
```

Build client frame in server.snapshot_runtime.

Validation failures include `snapshot runtime: bad client number`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `buildWorld`, `scene`. |
| `level` | `dynamic` | — | Record exposing `clients`, `num_entities`, `entities`. |
| `clientNum` | `dynamic` | — | Zero-based index into `level.entities`, `level.clients`. |
| `zombie` | `dynamic` | — | Zombie passed as `zombie` to `mq3.server.snapshot_build.buildClientSnapshot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_runtime.ml#L106)

<a id="function-function-mq3-server-snapshot-runtime-clusterpvs-function-clusterpvs-host-cluster-src-mq3-server-snapshot-runtime-ml-611282676"></a>
### clusterPvs

```ml
function clusterPvs(host, cluster)
```

Return `mq3.collision.visibility.clusterPVS(host.context.world.visibility, cluster)` from `server.snapshot_runtime.clusterPvs`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |
| `cluster` | `dynamic` | — | Cluster passed as `cluster` to `mq3.collision.visibility.clusterPVS`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_runtime.ml#L39)

<a id="function-function-mq3-server-snapshot-runtime-create-function-create-level-ringcapacity-src-mq3-server-snapshot-runtime-ml-1022973948"></a>
### create

```ml
function create(level, ringCapacity)
```

Create snapshot runtime in server.snapshot_runtime; the normal completion returns `Runtime(level.scene, runtimeSnapshotBuild.world(true, mapped, ringCapacity))`.

Validation failures include `snapshot runtime: missing level`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Record exposing `scene`, `num_entities`, `entities`. |
| `ringCapacity` | `dynamic` | — | Ring capacity passed as `ringCapacity` to `mq3.server.snapshot_build.world`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_runtime.ml#L67)

<a id="function-function-mq3-server-snapshot-runtime-hostservices-function-hostservices-scene-src-mq3-server-snapshot-runtime-ml-116480152"></a>
### hostServices

```ml
function hostServices(scene)
```

Apply `mq3.server.snapshot_build.services` for host services in server.snapshot_runtime.

Validation failures include `snapshot runtime: missing collision scene`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scene` | `dynamic` | — | Record exposing `world`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_runtime.ml#L50)

<a id="function-function-mq3-server-snapshot-runtime-leafarea-function-leafarea-host-leaf-src-mq3-server-snapshot-runtime-ml-1334794538"></a>
### leafArea

```ml
function leafArea(host, leaf)
```

Return `mq3.collision.visibility.leafArea(host.context.world.visibility, leaf)` from `server.snapshot_runtime.leafArea`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |
| `leaf` | `dynamic` | — | Leaf passed as `leaf` to `mq3.collision.visibility.leafArea`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_runtime.ml#L26)

<a id="function-function-mq3-server-snapshot-runtime-leafcluster-function-leafcluster-host-leaf-src-mq3-server-snapshot-runtime-ml-865727918"></a>
### leafCluster

```ml
function leafCluster(host, leaf)
```

Return `mq3.collision.visibility.leafCluster(host.context.world.visibility, leaf)` from `server.snapshot_runtime.leafCluster`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |
| `leaf` | `dynamic` | — | Leaf passed as `leaf` to `mq3.collision.visibility.leafCluster`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_runtime.ml#L30)

<a id="function-function-mq3-server-snapshot-runtime-mappedentity-function-mappedentity-gameentity-src-mq3-server-snapshot-runtime-ml-1106855025"></a>
### mappedEntity

```ml
function mappedEntity(gameEntity)
```

Apply `mq3.server.snapshot_build.snapshotEntity`, `mq3.game.entitystate.copy` for mapped entity in server.snapshot_runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gameEntity` | `dynamic` | — | Record exposing `r`, `s`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_runtime.ml#L57)

<a id="function-function-mq3-server-snapshot-runtime-pointleaf-function-pointleaf-host-origin-src-mq3-server-snapshot-runtime-ml-251596936"></a>
### pointLeaf

```ml
function pointLeaf(host, origin)
```

Return `mq3.collision.world.pointLeafnum(host.context.world, origin)` from `server.snapshot_runtime.pointLeaf`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |
| `origin` | `dynamic` | — | Point passed as `point` to `mq3.collision.world.pointLeafnum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_runtime.ml#L22)

- [mq3.server.snapshot_runtime.Runtime](Type-mq3-server-snapshot-runtime-runtime-335203544.md) — struct
<a id="function-function-mq3-server-snapshot-runtime-synclevel-function-synclevel-runtime-level-src-mq3-server-snapshot-runtime-ml-529200892"></a>
### syncLevel

```ml
function syncLevel(runtime, level)
```

Refresh game-owned state and spatial metadata while preserving the server's per-snapshot deduplication counters and persistent packet-entity ring.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `scene`, `buildWorld`. |
| `level` | `dynamic` | — | Record exposing `scene`, `num_entities`, `entities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_runtime.ml#L80)

<a id="function-function-mq3-server-snapshot-runtime-writeareabits-function-writeareabits-host-bits-area-src-mq3-server-snapshot-runtime-ml-2079956811"></a>
### writeAreaBits

```ml
function writeAreaBits(host, bits, area)
```

Return `mq3.collision.visibility.writeAreaBits(host.context.world.visibility, bits, area)` from `server.snapshot_runtime.writeAreaBits`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |
| `bits` | `dynamic` | — | Buffer passed as `buffer` to `mq3.collision.visibility.writeAreaBits`. |
| `area` | `dynamic` | — | Area passed as `area` to `mq3.collision.visibility.writeAreaBits`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_runtime.ml#L35)
