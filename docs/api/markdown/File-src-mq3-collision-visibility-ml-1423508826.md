# `src/mq3/collision/visibility.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.collision.visibility`](Package-mq3-collision-visibility-61488568.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-collision-visibility-adjustareaportalstate-function-adjustareaportalstate-state-area1-area2-open-src-mq3-collision-visibility-ml-1747142538"></a>
### adjustAreaPortalState

```ml
function adjustAreaPortalState(state, area1, area2, open)
```

Compute adjust area portal state in collision.visibility.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `numAreas`, `portals`. |
| `area1` | `dynamic` | — | Area 1 used in `(area1 < 0)` and `(area1 * state.numAreas)`. |
| `area2` | `dynamic` | — | Area 2 used in `(area2 < 0)` and `(area2 * state.numAreas)`. |
| `open` | `dynamic` | — | Open operand used by `adjustAreaPortalState`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/visibility.ml#L135)

<a id="function-function-mq3-collision-visibility-areasconnected-function-areasconnected-state-area1-area2-src-mq3-collision-visibility-ml-495394468"></a>
### areasConnected

```ml
function areasConnected(state, area1, area2)
```

Compute areas connected in collision.visibility; the normal completion returns `(state.floodnums[area1] == state.floodnums[area2])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `noAreas`, `numAreas`, `floodnums`. |
| `area1` | `dynamic` | — | Zero-based index into `state.floodnums`. |
| `area2` | `dynamic` | — | Zero-based index into `state.floodnums`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/visibility.ml#L155)

<a id="function-function-mq3-collision-visibility-clusterpvs-function-clusterpvs-state-cluster-src-mq3-collision-visibility-ml-297880431"></a>
### clusterPVS

```ml
function clusterPVS(state, cluster)
```

Compute cluster pvs in collision.visibility; the normal completion returns `slice(state.data, offset, state.clusterBytes)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `numClusters`, `vised`, `clusterBytes`, `data`. |
| `cluster` | `dynamic` | — | Cluster used in `(cluster >= 0)` and `(cluster < state.numClusters)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/visibility.ml#L86)

<a id="function-function-mq3-collision-visibility-clustervisible-function-clustervisible-state-as-visibility-sourcecluster-as-int-targetcluster-as-int-returns-bool-src-mq3-collision-visibility-ml-1939401254"></a>
### clusterVisible

```ml
function clusterVisible(state as Visibility, sourceCluster as int, targetCluster as int) returns bool
```

Hot PVS tests need one bit, not a freshly copied visibility row. Match clusterPVS's first-row fallback for invalid source clusters.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `Visibility` | — | Visibility table and its per-cluster row width. |
| `sourceCluster` | `int` | — | Source cluster index; invalid or unavailable rows fall back to the first row. |
| `targetCluster` | `int` | — | Target cluster index whose bit is tested; negative/out-of-row indices return false. |


**Returns:** True when the selected PVS bit is set; false when it is clear or the target bit is out of range.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/visibility.ml#L99)

<a id="function-function-mq3-collision-visibility-fail-function-fail-message-src-mq3-collision-visibility-ml-2127380473"></a>
### fail

```ml
function fail(message)
```

Create the collision.visibility error for `fail` with 3504 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("Visibility: " + message)` and `error(3504, ("Visibility: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/visibility.ml#L34)

<a id="function-function-mq3-collision-visibility-floodconnections-function-floodconnections-state-src-mq3-collision-visibility-ml-1123845631"></a>
### floodConnections

```ml
function floodConnections(state)
```

Update `state.floodnums` in collision.visibility.

Direct state writes: `state.floodnums`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `numAreas`, `floodnums`, `portals`. Updated in place: `floodnums`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/visibility.ml#L110)

<a id="function-function-mq3-collision-visibility-leafarea-function-leafarea-state-leaf-src-mq3-collision-visibility-ml-1772597767"></a>
### leafArea

```ml
function leafArea(state, leaf)
```

Compute leaf area in collision.visibility; the normal completion returns `state.areas[leaf]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `areas`. |
| `leaf` | `dynamic` | — | Zero-based index into `state.areas`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/visibility.ml#L79)

<a id="function-function-mq3-collision-visibility-leafcluster-function-leafcluster-state-leaf-src-mq3-collision-visibility-ml-291025587"></a>
### leafCluster

```ml
function leafCluster(state, leaf)
```

Compute leaf cluster in collision.visibility; the normal completion returns `state.clusters[leaf]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `clusters`. |
| `leaf` | `dynamic` | — | Zero-based index into `state.clusters`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/visibility.ml#L72)

<a id="function-function-mq3-collision-visibility-load-function-load-map-src-mq3-collision-visibility-ml-506039826"></a>
### load

```ml
function load(map)
```

Load visibility in collision.visibility; the normal completion returns `state`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — | Record exposing `counts`, `offsets`, `data`, `lengths`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/visibility.ml#L40)

- [mq3.collision.visibility.Visibility](Type-mq3-collision-visibility-visibility-625257514.md) — struct
<a id="function-function-mq3-collision-visibility-writeareabits-function-writeareabits-state-buffer-area-src-mq3-collision-visibility-ml-2101091682"></a>
### writeAreaBits

```ml
function writeAreaBits(state, buffer, area)
```

Write area bits in collision.visibility; the normal completion returns `count`.

Direct state writes: `buffer elements`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `numAreas`, `noAreas`, `floodnums`. |
| `buffer` | `dynamic` | — | Mutable sequence written at `index`, `(index >> 3)`. |
| `area` | `dynamic` | — | Zero-based index into `state.floodnums`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/collision/visibility.ml#L168)
