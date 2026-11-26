# `src/mq3/botlib/ai_goal_selection.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_goal_selection`](Package-mq3-botlib-ai-goal-selection-363778117.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/aas_entities.ml` as `aasEntities` → [src/mq3/botlib/aas_entities.ml](File-src-mq3-botlib-aas-entities-ml-525847367.md)
- `mq3/botlib/aas_routing_cache.ml` as `routes` → [src/mq3/botlib/aas_routing_cache.ml](File-src-mq3-botlib-aas-routing-cache-ml-1923771141.md)
- `mq3/botlib/aas_runtime.ml` as `aasRuntime` → [src/mq3/botlib/aas_runtime.ml](File-src-mq3-botlib-aas-runtime-ml-1322908116.md)
- `mq3/botlib/ai_genetic.ml` as `genetic` → [src/mq3/botlib/ai_genetic.ml](File-src-mq3-botlib-ai-genetic-ml-1869515232.md)
- `mq3/botlib/ai_goal_state.ml` as `goalRuntime` → [src/mq3/botlib/ai_goal_state.ml](File-src-mq3-botlib-ai-goal-state-ml-857672002.md)
- `mq3/botlib/ai_item_weights.ml` as `itemWeights` → [src/mq3/botlib/ai_item_weights.ml](File-src-mq3-botlib-ai-item-weights-ml-1163821802.md)
- `mq3/botlib/ai_level_items.ml` as `levelItems` → [src/mq3/botlib/ai_level_items.ml](File-src-mq3-botlib-ai-level-items-ml-1268981414.md)
- `mq3/botlib/ai_resource_pools.ml` as `goalResources` → [src/mq3/botlib/ai_resource_pools.ml](File-src-mq3-botlib-ai-resource-pools-ml-103445473.md)
- `mq3/compat/numeric.ml` as `goalSelectNumeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-botlib-ai-goal-selection-areareachability-function-areareachability-runtime-area-src-mq3-botlib-ai-goal-selection-ml-206652587"></a>
### areaReachability

```ml
function areaReachability(runtime, area)
```

Use `runtime.services.areaReachabilityFn` to perform `areaReachability`. Return paths include `aasRuntime.areaReachability(runtime.levelItems.aas,area)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI goal selection runtime; accesses `services` and `levelItems`. |
| `area` | `dynamic` | — | AAS area number; zero denotes no area. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L132)

<a id="constant-constant-mq3-botlib-ai-goal-selection-avoid-default-time-const-avoid-default-time-30-src-mq3-botlib-ai-goal-selection-ml-319965538"></a>
### AVOID_DEFAULT_TIME

```ml
const AVOID_DEFAULT_TIME = 30
```

Default interval for temporarily avoiding a selected goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L43)

<a id="constant-constant-mq3-botlib-ai-goal-selection-avoid-dropped-time-const-avoid-dropped-time-10-src-mq3-botlib-ai-goal-selection-ml-997218142"></a>
### AVOID_DROPPED_TIME

```ml
const AVOID_DROPPED_TIME = 10
```

Avoidance interval applied to a recently considered dropped-item goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L45)

<a id="constant-constant-mq3-botlib-ai-goal-selection-avoid-minimum-time-const-avoid-minimum-time-10-src-mq3-botlib-ai-goal-selection-ml-806889338"></a>
### AVOID_MINIMUM_TIME

```ml
const AVOID_MINIMUM_TIME = 10
```

Minimum interval retained for a goal-avoidance request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L41)

<a id="function-function-mq3-botlib-ai-goal-selection-avoidtime-function-avoidtime-info-item-src-mq3-botlib-ai-goal-selection-ml-1238704203"></a>
### avoidTime

```ml
function avoidTime(info, item)
```

Choose the item avoidance duration from dropped-item status and respawn time, enforcing the minimum duration.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `info` | `dynamic` | — | Item or entity information record; accesses `respawnTime`. |
| `item` | `dynamic` | — | Item record; accesses `timeout`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L187)

<a id="function-function-mq3-botlib-ai-goal-selection-chooseltgitem-function-chooseltgitem-runtime-handle-origin-inventory-travelflags-src-mq3-botlib-ai-goal-selection-ml-1688725159"></a>
### chooseLTGItem

```ml
function chooseLTGItem(runtime, handle, origin, inventory, travelFlags)
```

Select the highest-weight reachable long-term item goal, add its avoidance timer, and push it onto the goal stack.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI goal selection runtime; accesses `goals` and `levelItems`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot goal state. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `inventory` | `dynamic` | — | Bot inventory indexed by the corresponding inventory constants. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L253)

<a id="function-function-mq3-botlib-ai-goal-selection-choosenbgitem-function-choosenbgitem-runtime-handle-origin-inventory-travelflags-longtermgoal-maxtime-src-mq3-botlib-ai-goal-selection-ml-1789209457"></a>
### chooseNBGItem

```ml
function chooseNBGItem(runtime, handle, origin, inventory, travelFlags, longTermGoal, maxTime)
```

Select a nearby item within the travel-time limit while retaining an acceptable route back to the long-term goal.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI goal selection runtime; accesses `goals` and `levelItems`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot goal state. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `inventory` | `dynamic` | — | Bot inventory indexed by the corresponding inventory constants. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |
| `longTermGoal` | `dynamic` | — | Long term goal record; accesses `areaNum`. |
| `maxTime` | `dynamic` | — | Exclusive upper bound on item travel time in AAS travel-time units. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L268)

<a id="constant-constant-mq3-botlib-ai-goal-selection-contents-solid-const-contents-solid-1-src-mq3-botlib-ai-goal-selection-ml-1837025526"></a>
### CONTENTS_SOLID

```ml
const CONTENTS_SOLID = 1
```

An eye is never valid in a solid.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L39)

<a id="function-function-mq3-botlib-ai-goal-selection-copyvector-function-copyvector-value-src-mq3-botlib-ai-goal-selection-ml-1486191211"></a>
### copyVector

```ml
function copyVector(value)
```

Copy `value[0]`, `value[1]` and `value[2]` into a new ordered array for ai goal selection.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L116)

<a id="function-function-mq3-botlib-ai-goal-selection-create-function-create-items-goals-host-src-mq3-botlib-ai-goal-selection-ml-228282612"></a>
### create

```ml
function create(items, goals, host)
```

Create a `mq3.botlib.ai_goal_selection.Runtime` record, initializing `levelItems` from `items`, `goals` from `goals` and `services` from `host`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `items` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_goal_selection.Runtime.levelItems`. |
| `goals` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_goal_selection.Runtime.goals`. |
| `host` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_goal_selection.Runtime.services`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L97)

<a id="function-function-mq3-botlib-ai-goal-selection-currenttime-function-currenttime-runtime-src-mq3-botlib-ai-goal-selection-ml-102381408"></a>
### currentTime

```ml
function currentTime(runtime)
```

Forward `currentTime` to `mq3.botlib.ai_goal_state.currentTime` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI goal selection runtime; accesses `goals`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L164)

<a id="constant-constant-mq3-botlib-ai-goal-selection-default-dropped-weight-const-default-dropped-weight-1000-src-mq3-botlib-ai-goal-selection-ml-1591245924"></a>
### DEFAULT_DROPPED_WEIGHT

```ml
const DEFAULT_DROPPED_WEIGHT = 1000
```

Default desirability bonus added when scoring a dropped item.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L49)

<a id="function-function-mq3-botlib-ai-goal-selection-entityinfo-function-entityinfo-runtime-number-src-mq3-botlib-ai-goal-selection-ml-340284967"></a>
### entityInfo

```ml
function entityInfo(runtime, number)
```

Use `runtime.services.entityInfoFn` to perform `entityInfo`. Return paths include `aasEntities.info(runtime.levelItems.aasEntities,number)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI goal selection runtime; accesses `services` and `levelItems`. |
| `number` | `dynamic` | — | Value used by `info` in `if state==void or number<0 or number>=state.maxEntities then return emptyInfo() end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L149)

<a id="function-function-mq3-botlib-ai-goal-selection-fail-function-fail-message-src-mq3-botlib-ai-goal-selection-ml-1368722537"></a>
### fail

```ml
function fail(message)
```

Construct error `7594` with diagnostic text `"AI goal selection: "+message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L119)

<a id="function-function-mq3-botlib-ai-goal-selection-geneticparentsandchildselection-function-geneticparentsandchildselection-runtime-numranks-ranks-src-mq3-botlib-ai-goal-selection-ml-2081058550"></a>
### geneticParentsAndChildSelection

```ml
function geneticParentsAndChildSelection(runtime, numRanks, ranks)
```

Forward `geneticParentsAndChildSelection` to `mq3.botlib.ai_genetic.parentsAndChild` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI genetic runtime; accesses `randomSeed`. May update `runtime.randomSeed` in place. |
| `numRanks` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.fmul`. |
| `ranks` | `dynamic` | — | Array or byte sequence accessed at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L383)

<a id="function-function-mq3-botlib-ai-goal-selection-geneticselection-function-geneticselection-runtime-numranks-rankings-src-mq3-botlib-ai-goal-selection-ml-38895460"></a>
### geneticSelection

```ml
function geneticSelection(runtime, numRanks, rankings)
```

Forward `geneticSelection` to `mq3.botlib.ai_genetic.selection` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI genetic runtime; accesses `randomSeed`. May update `runtime.randomSeed` in place. |
| `numRanks` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.fmul`. |
| `rankings` | `dynamic` | — | Array or byte sequence accessed at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L376)

<a id="function-function-mq3-botlib-ai-goal-selection-getlevelitemgoal-function-getlevelitemgoal-runtime-index-name-goal-src-mq3-botlib-ai-goal-selection-ml-1126470074"></a>
### getLevelItemGoal

```ml
function getLevelItemGoal(runtime, index, name, goal)
```

Find the next permitted item matching a pickup name and copy it into the caller's goal record; return -1 when absent.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI goal selection runtime; accesses `levelItems`. |
| `index` | `dynamic` | — | Index of the entry to access. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `areaNum`, `origin`, `entityNum`, `mins` and `maxs` and related fields. May update `goal.areaNum`, `goal.origin` and `goal.entityNum` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L300)

<a id="constant-constant-mq3-botlib-ai-goal-selection-gfl-dropped-const-gfl-dropped-4-src-mq3-botlib-ai-goal-selection-ml-986951567"></a>
### GFL_DROPPED

```ml
const GFL_DROPPED = 4
```

Bot goal-property flag marking dropped.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L37)

<a id="constant-constant-mq3-botlib-ai-goal-selection-gfl-item-const-gfl-item-1-src-mq3-botlib-ai-goal-selection-ml-822714224"></a>
### GFL_ITEM

```ml
const GFL_ITEM = 1
```

Bot goal-property flag marking item.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L33)

<a id="constant-constant-mq3-botlib-ai-goal-selection-gfl-roam-const-gfl-roam-2-src-mq3-botlib-ai-goal-selection-ml-674299605"></a>
### GFL_ROAM

```ml
const GFL_ROAM = 2
```

Bot goal-property flag marking roam.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L35)

<a id="function-function-mq3-botlib-ai-goal-selection-interbreedgoalfuzzylogic-function-interbreedgoalfuzzylogic-runtime-parent1-parent2-child-src-mq3-botlib-ai-goal-selection-ml-423977395"></a>
### interbreedGoalFuzzyLogic

```ml
function interbreedGoalFuzzyLogic(runtime, parent1, parent2, child)
```

Interbreed compatible parent fuzzy-weight configurations into the child goal state, diagnosing incompatible layouts.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI goal selection runtime; accesses `goals`. |
| `parent1` | `dynamic` | — | Handle identifying the allocated bot goal state. |
| `parent2` | `dynamic` | — | Handle identifying the allocated bot goal state. |
| `child` | `dynamic` | — | Handle identifying the allocated bot goal state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L333)

<a id="function-function-mq3-botlib-ai-goal-selection-interbreedseparators-function-interbreedseparators-runtime-first-second-resultgoal-src-mq3-botlib-ai-goal-selection-ml-1230196846"></a>
### interbreedSeparators

```ml
function interbreedSeparators(runtime, first, second, resultGoal)
```

Combine compatible fuzzy separator trees while preserving the released child-parent and weight-bound behavior.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI goal selection runtime; accesses `goals`. |
| `first` | `dynamic` | — | Array or byte sequence accessed at `index`. |
| `second` | `dynamic` | — | Array or byte sequence accessed at `index`. |
| `resultGoal` | `dynamic` | — | Array or byte sequence accessed at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L314)

<a id="function-function-mq3-botlib-ai-goal-selection-itemconfig-function-itemconfig-runtime-src-mq3-botlib-ai-goal-selection-ml-1764043368"></a>
### itemConfig

```ml
function itemConfig(runtime)
```

Apply `mq3.botlib.ai_item_weights.ensureItems` while evaluating `itemConfig`. Return paths include `itemWeights.ensureItems(runtime.levelItems.itemRuntime)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI goal selection runtime; accesses `levelItems`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L167)

<a id="function-function-mq3-botlib-ai-goal-selection-itemgoalinvisbutnotvisible-function-itemgoalinvisbutnotvisible-runtime-viewer-eye-viewangles-goal-src-mq3-botlib-ai-goal-selection-ml-660583961"></a>
### itemGoalInVisButNotVisible

```ml
function itemGoalInVisButNotVisible(runtime, viewer, eye, viewAngles, goal)
```

Detect an unobstructed item goal whose entity information is stale, preserving the released goal-bound calculation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI goal selection runtime; accesses `services`. |
| `viewer` | `dynamic` | — | Entity number ignored by the visibility trace. |
| `eye` | `dynamic` | — | Value passed as argument 2 to `runtime.services.traceFn`. |
| `viewAngles` | `dynamic` | — | Not read by this implementation; retained in the `itemGoalInVisButNotVisible` signature. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `flags`, `origin`, `mins` and `entityNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L287)

- [mq3.botlib.ai_goal_selection.ItemScore](Type-mq3-botlib-ai-goal-selection-itemscore-1002403920.md) — struct
<a id="function-function-mq3-botlib-ai-goal-selection-itemtime-function-itemtime-runtime-query-area-origin-goal-travelflags-src-mq3-botlib-ai-goal-selection-ml-1844770361"></a>
### itemTime

```ml
function itemTime(runtime, query, area, origin, goal, travelFlags)
```

Apply `mq3.botlib.aas_routing_cache.itemQueryTravelTime` and `mq3.botlib.ai_goal_selection.travelTime` while evaluating `itemTime`. Return paths include `travelTime(runtime,area,origin,goal,travelFlags)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI goal selection runtime; accesses `services`. |
| `query` | `dynamic` | — | Query record; accesses `cache`, `area`, `origin`, `flags` and `times` and related fields. May update `query.times` and `query.enterTimes` in place. |
| `area` | `dynamic` | — | Value passed as argument 2 to `runtime.services.travelTimeFn`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `goal` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L213)

<a id="function-function-mq3-botlib-ai-goal-selection-makeitemgoal-function-makeitemgoal-info-item-src-mq3-botlib-ai-goal-selection-ml-1003787027"></a>
### makeItemGoal

```ml
function makeItemGoal(info, item)
```

Create an item goal with copied bounds and origin, including dropped-item and roaming flags.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `info` | `dynamic` | — | Item or entity information record; accesses `mins` and `maxs`. |
| `item` | `dynamic` | — | Item record; accesses `timeout`, `flags`, `goalOrigin`, `goalAreaNum` and `entityNum` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L180)

<a id="function-function-mq3-botlib-ai-goal-selection-mutategoalfuzzylogic-function-mutategoalfuzzylogic-runtime-handle-range-src-mq3-botlib-ai-goal-selection-ml-1291023343"></a>
### mutateGoalFuzzyLogic

```ml
function mutateGoalFuzzyLogic(runtime, handle, range)
```

Apply `mq3.botlib.ai_resource_pools.goalState` and `mq3.botlib.ai_goal_selection.mutateSeparators` while evaluating `mutateGoalFuzzyLogic`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI goal selection runtime; accesses `goals`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot goal state. |
| `range` | `dynamic` | — | Not read by this implementation; retained in the `mutateGoalFuzzyLogic` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L367)

<a id="function-function-mq3-botlib-ai-goal-selection-mutateseparators-function-mutateseparators-runtime-separators-src-mq3-botlib-ai-goal-selection-ml-746849064"></a>
### mutateSeparators

```ml
function mutateSeparators(runtime, separators)
```

Apply `mq3.botlib.ai_goal_selection.mutateSeparators` and `mq3.botlib.ai_goal_selection.randomFloat` while evaluating `mutateSeparators`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI goal selection runtime; accesses `randomSeed`. May update `runtime.randomSeed` in place. |
| `separators` | `dynamic` | — | Value used by `mutateSeparators` in `if separators==void then return void end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L352)

<a id="constant-constant-mq3-botlib-ai-goal-selection-op-choose-ltg-item-const-op-choose-ltg-item-535-src-mq3-botlib-ai-goal-selection-ml-1818655044"></a>
### OP_CHOOSE_LTG_ITEM

```ml
const OP_CHOOSE_LTG_ITEM = 535
```

Bot-library syscall identifier for choose long-term goal item.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L17)

<a id="constant-constant-mq3-botlib-ai-goal-selection-op-choose-nbg-item-const-op-choose-nbg-item-536-src-mq3-botlib-ai-goal-selection-ml-330414561"></a>
### OP_CHOOSE_NBG_ITEM

```ml
const OP_CHOOSE_NBG_ITEM = 536
```

Bot-library syscall identifier for choose nearby goal item.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L19)

<a id="constant-constant-mq3-botlib-ai-goal-selection-op-genetic-parents-and-child-selection-const-op-genetic-parents-and-child-selection-564-src-mq3-botlib-ai-goal-selection-ml-240336554"></a>
### OP_GENETIC_PARENTS_AND_CHILD_SELECTION

```ml
const OP_GENETIC_PARENTS_AND_CHILD_SELECTION = 564
```

Bot-library syscall identifier for genetic parents and child selection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L27)

<a id="constant-constant-mq3-botlib-ai-goal-selection-op-get-level-item-goal-const-op-get-level-item-goal-539-src-mq3-botlib-ai-goal-selection-ml-1355757512"></a>
### OP_GET_LEVEL_ITEM_GOAL

```ml
const OP_GET_LEVEL_ITEM_GOAL = 539
```

Bot-library syscall identifier for get level item goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L23)

<a id="constant-constant-mq3-botlib-ai-goal-selection-op-interbreed-goal-fuzzy-logic-const-op-interbreed-goal-fuzzy-logic-565-src-mq3-botlib-ai-goal-selection-ml-695493283"></a>
### OP_INTERBREED_GOAL_FUZZY_LOGIC

```ml
const OP_INTERBREED_GOAL_FUZZY_LOGIC = 565
```

Baseq3 g_public.h assigns INTERBREED to 565 and MUTATE to 566.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L29)

<a id="constant-constant-mq3-botlib-ai-goal-selection-op-item-goal-in-vis-but-not-visible-const-op-item-goal-in-vis-but-not-visible-538-src-mq3-botlib-ai-goal-selection-ml-25101851"></a>
### OP_ITEM_GOAL_IN_VIS_BUT_NOT_VISIBLE

```ml
const OP_ITEM_GOAL_IN_VIS_BUT_NOT_VISIBLE = 538
```

Bot-library syscall identifier for item goal in vis but not visible.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L21)

<a id="constant-constant-mq3-botlib-ai-goal-selection-op-mutate-goal-fuzzy-logic-const-op-mutate-goal-fuzzy-logic-566-src-mq3-botlib-ai-goal-selection-ml-679821414"></a>
### OP_MUTATE_GOAL_FUZZY_LOGIC

```ml
const OP_MUTATE_GOAL_FUZZY_LOGIC = 566
```

Bot-library syscall identifier for mutate goal fuzzy logic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L31)

<a id="constant-constant-mq3-botlib-ai-goal-selection-op-save-goal-fuzzy-logic-const-op-save-goal-fuzzy-logic-545-src-mq3-botlib-ai-goal-selection-ml-232375863"></a>
### OP_SAVE_GOAL_FUZZY_LOGIC

```ml
const OP_SAVE_GOAL_FUZZY_LOGIC = 545
```

Bot-library syscall identifier for save goal fuzzy logic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L25)

<a id="function-function-mq3-botlib-ai-goal-selection-originarea-function-originarea-runtime-value-origin-src-mq3-botlib-ai-goal-selection-ml-1478866347"></a>
### originArea

```ml
function originArea(runtime, value, origin)
```

Set `value.lastReachabilityArea` to `area` in `mq3.botlib.ai_goal_selection.originArea`. Return paths include `area`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI goal selection runtime; accesses `services` and `levelItems`. |
| `value` | `dynamic` | — | Value record; accesses `client` and `lastReachabilityArea`. May update `value.lastReachabilityArea` in place. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L194)

<a id="function-function-mq3-botlib-ai-goal-selection-permitted-function-permitted-runtime-item-src-mq3-botlib-ai-goal-selection-ml-1581043837"></a>
### permitted

```ml
function permitted(runtime, item)
```

Apply `mq3.botlib.ai_level_items.permitted` while evaluating `permitted`. Return paths include `(item.flags&levelItems.IFL_NOTBOT)==0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI goal selection runtime; accesses `levelItems`. |
| `item` | `dynamic` | — | Item record; accesses `flags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L174)

<a id="function-function-mq3-botlib-ai-goal-selection-randomfloat-function-randomfloat-runtime-src-mq3-botlib-ai-goal-selection-ml-306190694"></a>
### randomFloat

```ml
function randomFloat(runtime)
```

Advance the Windows-compatible 214013/2531011 random sequence and return a value between zero and one.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI goal selection runtime; accesses `randomSeed`. May update `runtime.randomSeed` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L108)

<a id="function-function-mq3-botlib-ai-goal-selection-reachabilityarea-function-reachabilityarea-runtime-origin-client-src-mq3-botlib-ai-goal-selection-ml-1677872727"></a>
### reachabilityArea

```ml
function reachabilityArea(runtime, origin, client)
```

Use `runtime.services.reachabilityAreaFn` to perform `reachabilityArea`. Return paths include `aasRuntime.pointAreaNum(runtime.levelItems.aas,origin)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI goal selection runtime; accesses `services` and `levelItems`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `client` | `dynamic` | — | Value passed as argument 3 to `runtime.services.reachabilityAreaFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L125)

- [mq3.botlib.ai_goal_selection.Runtime](Type-mq3-botlib-ai-goal-selection-runtime-1927224759.md) — struct
<a id="function-function-mq3-botlib-ai-goal-selection-savegoalfuzzylogic-function-savegoalfuzzylogic-runtime-handle-filename-src-mq3-botlib-ai-goal-selection-ml-83961905"></a>
### saveGoalFuzzyLogic

```ml
function saveGoalFuzzyLogic(runtime, handle, filename)
```

Validate the goal-state handle and return zero; the released engine does not write a fuzzy-weight file here.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI goal selection runtime; accesses `goals`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot goal state. |
| `filename` | `dynamic` | — | Unused output filename retained for compatibility; this released-engine operation performs no file write. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L344)

<a id="function-function-mq3-botlib-ai-goal-selection-services-function-services-context-src-mq3-botlib-ai-goal-selection-ml-1537340521"></a>
### services

```ml
function services(context)
```

Create a `mq3.botlib.ai_goal_selection.Services` record, initializing `context` from `context`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context forwarded to the configured host callbacks. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L92)

- [mq3.botlib.ai_goal_selection.Services](Type-mq3-botlib-ai-goal-selection-services-114167561.md) — struct
<a id="function-function-mq3-botlib-ai-goal-selection-setdroppedweight-function-setdroppedweight-runtime-value-src-mq3-botlib-ai-goal-selection-ml-1580900897"></a>
### setDroppedWeight

```ml
function setDroppedWeight(runtime, value)
```

Set `runtime.droppedWeight` to `goalSelectNumeric.f32(value)` in `mq3.botlib.ai_goal_selection.setDroppedWeight`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI goal selection runtime; accesses `droppedWeight`. May update `runtime.droppedWeight` in place. |
| `value` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.f32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L101)

<a id="function-function-mq3-botlib-ai-goal-selection-setrandomseed-function-setrandomseed-runtime-value-src-mq3-botlib-ai-goal-selection-ml-491973789"></a>
### setRandomSeed

```ml
function setRandomSeed(runtime, value)
```

Set `runtime.randomSeed` to `goalSelectNumeric.i32(value)` in `mq3.botlib.ai_goal_selection.setRandomSeed`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI goal selection runtime; accesses `randomSeed`. May update `runtime.randomSeed` in place. |
| `value` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.i32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L105)

<a id="function-function-mq3-botlib-ai-goal-selection-startitemquery-function-startitemquery-runtime-area-origin-travelflags-src-mq3-botlib-ai-goal-selection-ml-959622536"></a>
### startItemQuery

```ml
function startItemQuery(runtime, area, origin, travelFlags)
```

Use `runtime.services.itemQueryFn` to perform `startItemQuery`. Return paths include `runtime.services.itemQueryFn(runtime.services.context,area,origin,travelFlags)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI goal selection runtime; accesses `services`. |
| `area` | `dynamic` | — | Value passed as argument 2 to `runtime.services.itemQueryFn`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L202)

<a id="function-function-mq3-botlib-ai-goal-selection-supportstrap-function-supportstrap-op-src-mq3-botlib-ai-goal-selection-ml-1128319967"></a>
### supportsTrap

```ml
function supportsTrap(op)
```

Test `op==OP_CHOOSE_LTG_ITEM or op==OP_CHOOSE_NBG_ITEM or op==OP_ITEM_GOAL_IN_VIS_BUT_NOT_VISIBLE or op==OP_GET_LEVEL_ITEM_GOAL or op==OP_SAVE_GOAL_FUZZY...` as the condition for `supportsTrap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `op` | `dynamic` | — | Numeric syscall operation identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L388)

<a id="function-function-mq3-botlib-ai-goal-selection-trace-function-trace-runtime-start-finish-viewer-src-mq3-botlib-ai-goal-selection-ml-1085226891"></a>
### trace

```ml
function trace(runtime, start, finish, viewer)
```

Use `runtime.services.traceFn` to perform `trace`. Return paths include `runtime.services.traceFn(runtime.services.context,start,finish,viewer,CONTENTS_SOLID)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI goal selection runtime; accesses `services`. |
| `start` | `dynamic` | — | Value passed as argument 2 to `runtime.services.traceFn`. |
| `finish` | `dynamic` | — | Value passed as argument 3 to `runtime.services.traceFn`. |
| `viewer` | `dynamic` | — | Entity number ignored by the visibility trace. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L158)

<a id="function-function-mq3-botlib-ai-goal-selection-traveltime-function-traveltime-runtime-area-origin-goalarea-travelflags-src-mq3-botlib-ai-goal-selection-ml-2021290786"></a>
### travelTime

```ml
function travelTime(runtime, area, origin, goalArea, travelFlags)
```

Use `runtime.services.travelTimeFn` to perform `travelTime`. Return paths include `runtime.services.travelTimeFn(runtime.services.context,area,origin,goalArea,travelFlags)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI goal selection runtime; accesses `services`. |
| `area` | `dynamic` | — | Value passed as argument 2 to `runtime.services.travelTimeFn`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `goalArea` | `dynamic` | — | Destination AAS area number. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L142)

<a id="constant-constant-mq3-botlib-ai-goal-selection-traveltime-scale-const-traveltime-scale-0-01-src-mq3-botlib-ai-goal-selection-ml-543899186"></a>
### TRAVELTIME_SCALE

```ml
const TRAVELTIME_SCALE = 0.01
```

Factor converting AAS travel costs into the scale used by item-goal scoring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L47)

<a id="function-function-mq3-botlib-ai-goal-selection-weighted-function-weighted-runtime-handle-value-config-inventory-item-area-origin-travelflags-itemquery-fuzzycache-score-src-mq3-botlib-ai-goal-selection-ml-1769691285"></a>
### weighted

```ml
function weighted(runtime, handle, value, config, inventory, item, area, origin, travelFlags, itemQuery, fuzzyCache, score)
```

Score one available item by fuzzy desirability and travel time, including dropped-item bonuses and avoidance timers.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI goal selection runtime; accesses `droppedWeight` and `goals`. |
| `handle` | `dynamic` | — | Resource handle resolved by the owning pool or host service. |
| `value` | `dynamic` | — | Value record; accesses `itemWeightIndex` and `itemWeightConfig`. |
| `config` | `dynamic` | — | Array or byte sequence accessed at `item.itemInfo`. |
| `inventory` | `dynamic` | — | Bot inventory indexed by the corresponding inventory constants. |
| `item` | `dynamic` | — | Item record; accesses `goalAreaNum`, `entityNum`, `flags`, `itemInfo` and `timeout` and related fields. |
| `area` | `dynamic` | — | Value passed as argument 2 to `runtime.services.travelTimeFn`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |
| `itemQuery` | `dynamic` | — | Query record; accesses `cache`, `area`, `origin`, `flags` and `times` and related fields. May update `itemQuery.times` and `itemQuery.enterTimes` in place. |
| `fuzzyCache` | `dynamic` | — | Array or byte sequence accessed at `weightNumber`. Entries are written in place. |
| `score` | `dynamic` | — | Score record; accesses `weight` and `time`. May update `score.weight` and `score.time` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection.ml#L231)
