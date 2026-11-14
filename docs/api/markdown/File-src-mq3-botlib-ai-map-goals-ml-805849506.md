# `src/mq3/botlib/ai_map_goals.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_map_goals`](Package-mq3-botlib-ai-map-goals-1545057048.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/aas_runtime.ml` as `aasRuntime` → [src/mq3/botlib/aas_runtime.ml](File-src-mq3-botlib-aas-runtime-ml-1322908116.md)
- `mq3/botlib/ai_resource_pools.ml` as `resources` → [src/mq3/botlib/ai_resource_pools.ml](File-src-mq3-botlib-ai-resource-pools-ml-103445473.md)
- `mq3/botlib/internal_headers.ml` as `botlibHeaders` → [src/mq3/botlib/internal_headers.ml](File-src-mq3-botlib-internal-headers-ml-282928546.md)
- `mq3/compat/textnumbers.ml` as `numbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-botlib-ai-map-goals-bounded-function-bounded-value-src-mq3-botlib-ai-map-goals-ml-1528079055"></a>
### bounded

```ml
function bounded(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_map_goals.ml#L25)

- [mq3.botlib.ai_map_goals.CampResult](Type-mq3-botlib-ai-map-goals-campresult-1529521514.md) — struct
- [mq3.botlib.ai_map_goals.CampSpot](Type-mq3-botlib-ai-map-goals-campspot-1867151947.md) — struct
<a id="function-function-mq3-botlib-ai-map-goals-clear-function-clear-state-src-mq3-botlib-ai-map-goals-ml-123189539"></a>
### clear

```ml
function clear(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_map_goals.ml#L48)

<a id="function-function-mq3-botlib-ai-map-goals-create-function-create-src-mq3-botlib-ai-map-goals-ml-1665945452"></a>
### create

```ml
function create()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_map_goals.ml#L21)

<a id="function-function-mq3-botlib-ai-map-goals-epair-function-epair-entity-key-src-mq3-botlib-ai-map-goals-ml-580775528"></a>
### epair

```ml
function epair(entity, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_map_goals.ml#L22)

<a id="function-function-mq3-botlib-ai-map-goals-floatvalue-function-floatvalue-entity-key-src-mq3-botlib-ai-map-goals-ml-1872751886"></a>
### floatValue

```ml
function floatValue(entity, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_map_goals.ml#L31)

<a id="function-function-mq3-botlib-ai-map-goals-goalat-function-goalat-aas-origin-src-mq3-botlib-ai-map-goals-ml-2086219049"></a>
### goalAt

```ml
function goalAt(aas, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `aas` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_map_goals.ml#L32)

<a id="function-function-mq3-botlib-ai-map-goals-initialize-function-initialize-state-aas-bspentities-src-mq3-botlib-ai-map-goals-ml-2018889234"></a>
### initialize

```ml
function initialize(state, aas, bspEntities)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `aas` | `dynamic` | — |  |
| `bspEntities` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_map_goals.ml#L36)

- [mq3.botlib.ai_map_goals.MapLocation](Type-mq3-botlib-ai-map-goals-maplocation-850048939.md) — struct
<a id="function-function-mq3-botlib-ai-map-goals-maplocationgoal-function-maplocationgoal-state-name-src-mq3-botlib-ai-map-goals-ml-1486785190"></a>
### mapLocationGoal

```ml
function mapLocationGoal(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_map_goals.ml#L53)

<a id="constant-constant-mq3-botlib-ai-map-goals-max-epairkey-const-max-epairkey-botlibheaders-max-epairkey-src-mq3-botlib-ai-map-goals-ml-1259806562"></a>
### MAX_EPAIRKEY

```ml
const MAX_EPAIRKEY = botlibHeaders.MAX_EPAIRKEY
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_map_goals.ml#L14)

<a id="function-function-mq3-botlib-ai-map-goals-nextcampspotgoal-function-nextcampspotgoal-state-number-src-mq3-botlib-ai-map-goals-ml-1923858388"></a>
### nextCampSpotGoal

```ml
function nextCampSpotGoal(state, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_map_goals.ml#L49)

<a id="constant-constant-mq3-botlib-ai-map-goals-op-get-map-location-goal-const-op-get-map-location-goal-568-src-mq3-botlib-ai-map-goals-ml-1057732658"></a>
### OP_GET_MAP_LOCATION_GOAL

```ml
const OP_GET_MAP_LOCATION_GOAL = 568
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_map_goals.ml#L13)

<a id="constant-constant-mq3-botlib-ai-map-goals-op-get-next-camp-spot-goal-const-op-get-next-camp-spot-goal-567-src-mq3-botlib-ai-map-goals-ml-1727687565"></a>
### OP_GET_NEXT_CAMP_SPOT_GOAL

```ml
const OP_GET_NEXT_CAMP_SPOT_GOAL = 567
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_map_goals.ml#L12)

- [mq3.botlib.ai_map_goals.State](Type-mq3-botlib-ai-map-goals-state-206674215.md) — struct
<a id="function-function-mq3-botlib-ai-map-goals-supportstrap-function-supportstrap-op-src-mq3-botlib-ai-map-goals-ml-488332499"></a>
### supportsTrap

```ml
function supportsTrap(op)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `op` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_map_goals.ml#L56)

<a id="function-function-mq3-botlib-ai-map-goals-vectorvalue-function-vectorvalue-entity-key-src-mq3-botlib-ai-map-goals-ml-591345734"></a>
### vectorValue

```ml
function vectorValue(entity, key)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_map_goals.ml#L28)
