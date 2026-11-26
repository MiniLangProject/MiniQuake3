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

Truncate entity-key text to the maximum epair buffer size minus its terminator.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_map_goals.ml#L72)

- [mq3.botlib.ai_map_goals.CampResult](Type-mq3-botlib-ai-map-goals-campresult-1529521514.md) — struct
- [mq3.botlib.ai_map_goals.CampSpot](Type-mq3-botlib-ai-map-goals-campspot-1867151947.md) — struct
<a id="function-function-mq3-botlib-ai-map-goals-clear-function-clear-state-src-mq3-botlib-ai-map-goals-ml-123189539"></a>
### clear

```ml
function clear(state)
```

Update `state.aas`, `state.bspEntities`, `state.locations` and `state.campSpots` and related state during `clear`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI map goals state; accesses `aas`, `bspEntities`, `locations`, `campSpots` and `initialized`. May update `state.aas`, `state.bspEntities` and `state.locations` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_map_goals.ml#L110)

<a id="function-function-mq3-botlib-ai-map-goals-create-function-create-src-mq3-botlib-ai-map-goals-ml-1665945452"></a>
### create

```ml
function create()
```

Create a `mq3.botlib.ai_map_goals.State` record with the declared empty defaults.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_map_goals.ml#L63)

<a id="function-function-mq3-botlib-ai-map-goals-epair-function-epair-entity-key-src-mq3-botlib-ai-map-goals-ml-580775528"></a>
### epair

```ml
function epair(entity, key)
```

Look up a map-entity key and return a found flag with the corresponding text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — | Value used by `epair` in `if entity==void then return [false,""] end if`. |
| `key` | `dynamic` | — | Lookup text matched against `pair[0]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_map_goals.ml#L67)

<a id="function-function-mq3-botlib-ai-map-goals-floatvalue-function-floatvalue-entity-key-src-mq3-botlib-ai-map-goals-ml-1872751886"></a>
### floatValue

```ml
function floatValue(entity, key)
```

Apply `mq3.botlib.ai_map_goals.epair` while evaluating `floatValue`. Return paths include `numbers.atof32(pair[1])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — | Value used by `epair` in `if entity==void then return [false,""] end if`. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_map_goals.ml#L84)

<a id="function-function-mq3-botlib-ai-map-goals-goalat-function-goalat-aas-origin-src-mq3-botlib-ai-map-goals-ml-2086219049"></a>
### goalAt

```ml
function goalAt(aas, origin)
```

Build the `mq3.botlib.ai_resource_pools.Goal` result for `goalAt`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `aas` | `dynamic` | — | AAS runtime; accesses `initialized`, `map`, `nodeCache` and `planeCache`. May update `aas.nodeCache[nodeNum]` and `aas.planeCache[node.planeNum]` in place. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_map_goals.ml#L88)

<a id="function-function-mq3-botlib-ai-map-goals-initialize-function-initialize-state-aas-bspentities-src-mq3-botlib-ai-map-goals-ml-2018889234"></a>
### initialize

```ml
function initialize(state, aas, bspEntities)
```

Update `state.aas`, `state.bspEntities`, `state.locations` and `state.campSpots` and related state during `initialize`. Return paths include `[len(state.locations),len(state.campSpots)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI map goals state; accesses `aas`, `bspEntities`, `locations`, `campSpots` and `initialized`. May update `state.aas`, `state.bspEntities` and `state.locations` and additional fields in place. |
| `aas` | `dynamic` | — | AAS runtime; accesses `initialized`, `map`, `nodeCache` and `planeCache`. May update `aas.nodeCache[nodeNum]` and `aas.planeCache[node.planeNum]` in place. |
| `bspEntities` | `dynamic` | — | Array or byte sequence accessed at `entityNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_map_goals.ml#L96)

- [mq3.botlib.ai_map_goals.MapLocation](Type-mq3-botlib-ai-map-goals-maplocation-850048939.md) — struct
<a id="function-function-mq3-botlib-ai-map-goals-maplocationgoal-function-maplocationgoal-state-name-src-mq3-botlib-ai-map-goals-ml-1486785190"></a>
### mapLocationGoal

```ml
function mapLocationGoal(state, name)
```

Find a named map-location goal using an ASCII case-insensitive comparison.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI map goals state; accesses `locations`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_map_goals.ml#L121)

<a id="constant-constant-mq3-botlib-ai-map-goals-max-epairkey-const-max-epairkey-botlibheaders-max-epairkey-src-mq3-botlib-ai-map-goals-ml-1259806562"></a>
### MAX_EPAIRKEY

```ml
const MAX_EPAIRKEY = botlibHeaders.MAX_EPAIRKEY
```

Maximum character capacity of a BSP entity key or value.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_map_goals.ml#L17)

<a id="function-function-mq3-botlib-ai-map-goals-nextcampspotgoal-function-nextcampspotgoal-state-number-src-mq3-botlib-ai-map-goals-ml-1923858388"></a>
### nextCampSpotGoal

```ml
function nextCampSpotGoal(state, number)
```

Build the `mq3.botlib.ai_map_goals.CampResult` result for `nextCampSpotGoal`. Return paths include `CampResult(number+1,state.campSpots[index].goal)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI map goals state; accesses `campSpots`. |
| `number` | `dynamic` | — | Operand used to evaluate the returned expression `CampResult(number+1,state.campSpots[index].goal)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_map_goals.ml#L114)

<a id="constant-constant-mq3-botlib-ai-map-goals-op-get-map-location-goal-const-op-get-map-location-goal-568-src-mq3-botlib-ai-map-goals-ml-1057732658"></a>
### OP_GET_MAP_LOCATION_GOAL

```ml
const OP_GET_MAP_LOCATION_GOAL = 568
```

Bot-library syscall identifier for get map location goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_map_goals.ml#L15)

<a id="constant-constant-mq3-botlib-ai-map-goals-op-get-next-camp-spot-goal-const-op-get-next-camp-spot-goal-567-src-mq3-botlib-ai-map-goals-ml-1727687565"></a>
### OP_GET_NEXT_CAMP_SPOT_GOAL

```ml
const OP_GET_NEXT_CAMP_SPOT_GOAL = 567
```

Bot-library syscall identifier for get next camp spot goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_map_goals.ml#L13)

- [mq3.botlib.ai_map_goals.State](Type-mq3-botlib-ai-map-goals-state-206674215.md) — struct
<a id="function-function-mq3-botlib-ai-map-goals-supportstrap-function-supportstrap-op-src-mq3-botlib-ai-map-goals-ml-488332499"></a>
### supportsTrap

```ml
function supportsTrap(op)
```

Test `op==OP_GET_NEXT_CAMP_SPOT_GOAL or op==OP_GET_MAP_LOCATION_GOAL` as the condition for `supportsTrap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `op` | `dynamic` | — | Numeric syscall operation identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_map_goals.ml#L126)

<a id="function-function-mq3-botlib-ai-map-goals-vectorvalue-function-vectorvalue-entity-key-src-mq3-botlib-ai-map-goals-ml-591345734"></a>
### vectorValue

```ml
function vectorValue(entity, key)
```

Apply `mq3.botlib.ai_map_goals.epair` while evaluating `vectorValue`. Return paths include `parsed[1]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entity` | `dynamic` | — | Value used by `epair` in `if entity==void then return [false,""] end if`. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_map_goals.ml#L78)
