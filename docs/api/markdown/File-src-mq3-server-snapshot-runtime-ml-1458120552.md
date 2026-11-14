# `src/mq3/server/snapshot_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.snapshot_runtime`](Package-mq3-server-snapshot-runtime-1899297250.md)

Reachable from entry: **yes**

## Imports

- `mq3/collision/visibility.ml` as `visibility` → [src/mq3/collision/visibility.ml](File-src-mq3-collision-visibility-ml-1423508826.md)
- `mq3/collision/world.ml` as `cm` → [src/mq3/collision/world.ml](File-src-mq3-collision-world-ml-863162236.md)
- `mq3/game/entitystate.ml` as `entitystate` → [src/mq3/game/entitystate.ml](File-src-mq3-game-entitystate-ml-1227653182.md)
- `mq3/server/snapshot_build.ml` as `runtimeSnapshotBuild` → [src/mq3/server/snapshot_build.ml](File-src-mq3-server-snapshot-build-ml-2050633468.md)
- `std/array.ml` as `arrays` → `../MiniLangCompilerML/std/array.ml` — external dependency

## Declarations

<a id="function-function-mq3-server-snapshot-runtime-areasconnected-function-areasconnected-host-first-second-src-mq3-server-snapshot-runtime-ml-1588329108"></a>
### areasConnected

```ml
function areasConnected(host, first, second)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/snapshot_runtime.ml#L18)

<a id="function-function-mq3-server-snapshot-runtime-buildclientframe-function-buildclientframe-runtime-level-clientnum-zombie-src-mq3-server-snapshot-runtime-ml-1805398137"></a>
### buildClientFrame

```ml
function buildClientFrame(runtime, level, clientNum, zombie)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `level` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `zombie` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/snapshot_runtime.ml#L60)

<a id="function-function-mq3-server-snapshot-runtime-clusterpvs-function-clusterpvs-host-cluster-src-mq3-server-snapshot-runtime-ml-611282676"></a>
### clusterPvs

```ml
function clusterPvs(host, cluster)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `cluster` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/snapshot_runtime.ml#L17)

<a id="function-function-mq3-server-snapshot-runtime-create-function-create-level-ringcapacity-src-mq3-server-snapshot-runtime-ml-1022973948"></a>
### create

```ml
function create(level, ringCapacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ringCapacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/snapshot_runtime.ml#L30)

<a id="function-function-mq3-server-snapshot-runtime-hostservices-function-hostservices-scene-src-mq3-server-snapshot-runtime-ml-116480152"></a>
### hostServices

```ml
function hostServices(scene)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `scene` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/snapshot_runtime.ml#L20)

<a id="function-function-mq3-server-snapshot-runtime-leafarea-function-leafarea-host-leaf-src-mq3-server-snapshot-runtime-ml-1334794538"></a>
### leafArea

```ml
function leafArea(host, leaf)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `leaf` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/snapshot_runtime.ml#L14)

<a id="function-function-mq3-server-snapshot-runtime-leafcluster-function-leafcluster-host-leaf-src-mq3-server-snapshot-runtime-ml-865727918"></a>
### leafCluster

```ml
function leafCluster(host, leaf)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `leaf` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/snapshot_runtime.ml#L15)

<a id="function-function-mq3-server-snapshot-runtime-mappedentity-function-mappedentity-gameentity-src-mq3-server-snapshot-runtime-ml-1106855025"></a>
### mappedEntity

```ml
function mappedEntity(gameEntity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `gameEntity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/snapshot_runtime.ml#L25)

<a id="function-function-mq3-server-snapshot-runtime-pointleaf-function-pointleaf-host-origin-src-mq3-server-snapshot-runtime-ml-251596936"></a>
### pointLeaf

```ml
function pointLeaf(host, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/snapshot_runtime.ml#L13)

- [mq3.server.snapshot_runtime.Runtime](Type-mq3-server-snapshot-runtime-runtime-335203544.md) — struct
<a id="function-function-mq3-server-snapshot-runtime-synclevel-function-synclevel-runtime-level-src-mq3-server-snapshot-runtime-ml-529200892"></a>
### syncLevel

```ml
function syncLevel(runtime, level)
```

Refresh game-owned state and spatial metadata while preserving the server's per-snapshot deduplication counters and persistent packet-entity ring.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/snapshot_runtime.ml#L41)

<a id="function-function-mq3-server-snapshot-runtime-writeareabits-function-writeareabits-host-bits-area-src-mq3-server-snapshot-runtime-ml-2079956811"></a>
### writeAreaBits

```ml
function writeAreaBits(host, bits, area)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `bits` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/snapshot_runtime.ml#L16)
