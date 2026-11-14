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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `area1` | `dynamic` | — |  |
| `area2` | `dynamic` | — |  |
| `open` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/visibility.ml#L88)

<a id="function-function-mq3-collision-visibility-areasconnected-function-areasconnected-state-area1-area2-src-mq3-collision-visibility-ml-495394468"></a>
### areasConnected

```ml
function areasConnected(state, area1, area2)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `area1` | `dynamic` | — |  |
| `area2` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/visibility.ml#L104)

<a id="function-function-mq3-collision-visibility-clusterpvs-function-clusterpvs-state-cluster-src-mq3-collision-visibility-ml-297880431"></a>
### clusterPVS

```ml
function clusterPVS(state, cluster)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `cluster` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/visibility.ml#L61)

<a id="function-function-mq3-collision-visibility-fail-function-fail-message-src-mq3-collision-visibility-ml-2127380473"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/visibility.ml#L20)

<a id="function-function-mq3-collision-visibility-floodconnections-function-floodconnections-state-src-mq3-collision-visibility-ml-1123845631"></a>
### floodConnections

```ml
function floodConnections(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/visibility.ml#L68)

<a id="function-function-mq3-collision-visibility-leafarea-function-leafarea-state-leaf-src-mq3-collision-visibility-ml-1772597767"></a>
### leafArea

```ml
function leafArea(state, leaf)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `leaf` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/visibility.ml#L57)

<a id="function-function-mq3-collision-visibility-leafcluster-function-leafcluster-state-leaf-src-mq3-collision-visibility-ml-291025587"></a>
### leafCluster

```ml
function leafCluster(state, leaf)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `leaf` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/visibility.ml#L53)

<a id="function-function-mq3-collision-visibility-load-function-load-map-src-mq3-collision-visibility-ml-506039826"></a>
### load

```ml
function load(map)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `map` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/visibility.ml#L24)

- [mq3.collision.visibility.Visibility](Type-mq3-collision-visibility-visibility-625257514.md) — struct
<a id="function-function-mq3-collision-visibility-writeareabits-function-writeareabits-state-buffer-area-src-mq3-collision-visibility-ml-2101091682"></a>
### writeAreaBits

```ml
function writeAreaBits(state, buffer, area)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `buffer` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/collision/visibility.ml#L111)
