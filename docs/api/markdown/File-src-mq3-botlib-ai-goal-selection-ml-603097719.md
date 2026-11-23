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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L56)

<a id="constant-constant-mq3-botlib-ai-goal-selection-avoid-default-time-const-avoid-default-time-30-src-mq3-botlib-ai-goal-selection-ml-1191662340"></a>
### AVOID_DEFAULT_TIME

```ml
const AVOID_DEFAULT_TIME = 30.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L30)

<a id="constant-constant-mq3-botlib-ai-goal-selection-avoid-dropped-time-const-avoid-dropped-time-10-src-mq3-botlib-ai-goal-selection-ml-1369216928"></a>
### AVOID_DROPPED_TIME

```ml
const AVOID_DROPPED_TIME = 10.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L31)

<a id="constant-constant-mq3-botlib-ai-goal-selection-avoid-minimum-time-const-avoid-minimum-time-10-src-mq3-botlib-ai-goal-selection-ml-1348042396"></a>
### AVOID_MINIMUM_TIME

```ml
const AVOID_MINIMUM_TIME = 10.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L29)

<a id="function-function-mq3-botlib-ai-goal-selection-avoidtime-function-avoidtime-info-item-src-mq3-botlib-ai-goal-selection-ml-1238704203"></a>
### avoidTime

```ml
function avoidTime(info, item)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `info` | `dynamic` | — |  |
| `item` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L84)

<a id="function-function-mq3-botlib-ai-goal-selection-chooseltgitem-function-chooseltgitem-runtime-handle-origin-inventory-travelflags-src-mq3-botlib-ai-goal-selection-ml-1688725159"></a>
### chooseLTGItem

```ml
function chooseLTGItem(runtime, handle, origin, inventory, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `inventory` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L115)

<a id="function-function-mq3-botlib-ai-goal-selection-choosenbgitem-function-choosenbgitem-runtime-handle-origin-inventory-travelflags-longtermgoal-maxtime-src-mq3-botlib-ai-goal-selection-ml-1789209457"></a>
### chooseNBGItem

```ml
function chooseNBGItem(runtime, handle, origin, inventory, travelFlags, longTermGoal, maxTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `inventory` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |
| `longTermGoal` | `dynamic` | — |  |
| `maxTime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L122)

<a id="constant-constant-mq3-botlib-ai-goal-selection-contents-solid-const-contents-solid-1-src-mq3-botlib-ai-goal-selection-ml-1837025526"></a>
### CONTENTS_SOLID

```ml
const CONTENTS_SOLID = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L28)

<a id="function-function-mq3-botlib-ai-goal-selection-copyvector-function-copyvector-value-src-mq3-botlib-ai-goal-selection-ml-1486191211"></a>
### copyVector

```ml
function copyVector(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L49)

<a id="function-function-mq3-botlib-ai-goal-selection-create-function-create-items-goals-host-src-mq3-botlib-ai-goal-selection-ml-228282612"></a>
### create

```ml
function create(items, goals, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `items` | `dynamic` | — |  |
| `goals` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L40)

<a id="function-function-mq3-botlib-ai-goal-selection-currenttime-function-currenttime-runtime-src-mq3-botlib-ai-goal-selection-ml-102381408"></a>
### currentTime

```ml
function currentTime(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L72)

<a id="constant-constant-mq3-botlib-ai-goal-selection-default-dropped-weight-const-default-dropped-weight-1000-src-mq3-botlib-ai-goal-selection-ml-561079542"></a>
### DEFAULT_DROPPED_WEIGHT

```ml
const DEFAULT_DROPPED_WEIGHT = 1000.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L33)

<a id="function-function-mq3-botlib-ai-goal-selection-entityinfo-function-entityinfo-runtime-number-src-mq3-botlib-ai-goal-selection-ml-340284967"></a>
### entityInfo

```ml
function entityInfo(runtime, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L64)

<a id="function-function-mq3-botlib-ai-goal-selection-fail-function-fail-message-src-mq3-botlib-ai-goal-selection-ml-1368722537"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L50)

<a id="function-function-mq3-botlib-ai-goal-selection-geneticparentsandchildselection-function-geneticparentsandchildselection-runtime-numranks-ranks-src-mq3-botlib-ai-goal-selection-ml-2081058550"></a>
### geneticParentsAndChildSelection

```ml
function geneticParentsAndChildSelection(runtime, numRanks, ranks)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `numRanks` | `dynamic` | — |  |
| `ranks` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L197)

<a id="function-function-mq3-botlib-ai-goal-selection-geneticselection-function-geneticselection-runtime-numranks-rankings-src-mq3-botlib-ai-goal-selection-ml-38895460"></a>
### geneticSelection

```ml
function geneticSelection(runtime, numRanks, rankings)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `numRanks` | `dynamic` | — |  |
| `rankings` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L194)

<a id="function-function-mq3-botlib-ai-goal-selection-getlevelitemgoal-function-getlevelitemgoal-runtime-index-name-goal-src-mq3-botlib-ai-goal-selection-ml-1126470074"></a>
### getLevelItemGoal

```ml
function getLevelItemGoal(runtime, index, name, goal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L143)

<a id="constant-constant-mq3-botlib-ai-goal-selection-gfl-dropped-const-gfl-dropped-4-src-mq3-botlib-ai-goal-selection-ml-986951567"></a>
### GFL_DROPPED

```ml
const GFL_DROPPED = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L27)

<a id="constant-constant-mq3-botlib-ai-goal-selection-gfl-item-const-gfl-item-1-src-mq3-botlib-ai-goal-selection-ml-822714224"></a>
### GFL_ITEM

```ml
const GFL_ITEM = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L25)

<a id="constant-constant-mq3-botlib-ai-goal-selection-gfl-roam-const-gfl-roam-2-src-mq3-botlib-ai-goal-selection-ml-674299605"></a>
### GFL_ROAM

```ml
const GFL_ROAM = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L26)

<a id="function-function-mq3-botlib-ai-goal-selection-interbreedgoalfuzzylogic-function-interbreedgoalfuzzylogic-runtime-parent1-parent2-child-src-mq3-botlib-ai-goal-selection-ml-423977395"></a>
### interbreedGoalFuzzyLogic

```ml
function interbreedGoalFuzzyLogic(runtime, parent1, parent2, child)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `parent1` | `dynamic` | — |  |
| `parent2` | `dynamic` | — |  |
| `child` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L166)

<a id="function-function-mq3-botlib-ai-goal-selection-interbreedseparators-function-interbreedseparators-runtime-first-second-resultgoal-src-mq3-botlib-ai-goal-selection-ml-1230196846"></a>
### interbreedSeparators

```ml
function interbreedSeparators(runtime, first, second, resultGoal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |
| `resultGoal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L152)

<a id="function-function-mq3-botlib-ai-goal-selection-itemconfig-function-itemconfig-runtime-src-mq3-botlib-ai-goal-selection-ml-1764043368"></a>
### itemConfig

```ml
function itemConfig(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L73)

<a id="function-function-mq3-botlib-ai-goal-selection-itemgoalinvisbutnotvisible-function-itemgoalinvisbutnotvisible-runtime-viewer-eye-viewangles-goal-src-mq3-botlib-ai-goal-selection-ml-660583961"></a>
### itemGoalInVisButNotVisible

```ml
function itemGoalInVisButNotVisible(runtime, viewer, eye, viewAngles, goal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `viewer` | `dynamic` | — |  |
| `eye` | `dynamic` | — |  |
| `viewAngles` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L135)

- [mq3.botlib.ai_goal_selection.ItemScore](Type-mq3-botlib-ai-goal-selection-itemscore-1002403920.md) — struct
<a id="function-function-mq3-botlib-ai-goal-selection-itemtime-function-itemtime-runtime-query-area-origin-goal-travelflags-src-mq3-botlib-ai-goal-selection-ml-1844770361"></a>
### itemTime

```ml
function itemTime(runtime, query, area, origin, goal, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `query` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L94)

<a id="function-function-mq3-botlib-ai-goal-selection-makeitemgoal-function-makeitemgoal-info-item-src-mq3-botlib-ai-goal-selection-ml-1003787027"></a>
### makeItemGoal

```ml
function makeItemGoal(info, item)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `info` | `dynamic` | — |  |
| `item` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L80)

<a id="function-function-mq3-botlib-ai-goal-selection-mutategoalfuzzylogic-function-mutategoalfuzzylogic-runtime-handle-range-src-mq3-botlib-ai-goal-selection-ml-1291023343"></a>
### mutateGoalFuzzyLogic

```ml
function mutateGoalFuzzyLogic(runtime, handle, range)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `range` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L189)

<a id="function-function-mq3-botlib-ai-goal-selection-mutateseparators-function-mutateseparators-runtime-separators-src-mq3-botlib-ai-goal-selection-ml-746849064"></a>
### mutateSeparators

```ml
function mutateSeparators(runtime, separators)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `separators` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L178)

<a id="constant-constant-mq3-botlib-ai-goal-selection-op-choose-ltg-item-const-op-choose-ltg-item-535-src-mq3-botlib-ai-goal-selection-ml-1818655044"></a>
### OP_CHOOSE_LTG_ITEM

```ml
const OP_CHOOSE_LTG_ITEM = 535
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L16)

<a id="constant-constant-mq3-botlib-ai-goal-selection-op-choose-nbg-item-const-op-choose-nbg-item-536-src-mq3-botlib-ai-goal-selection-ml-330414561"></a>
### OP_CHOOSE_NBG_ITEM

```ml
const OP_CHOOSE_NBG_ITEM = 536
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L17)

<a id="constant-constant-mq3-botlib-ai-goal-selection-op-genetic-parents-and-child-selection-const-op-genetic-parents-and-child-selection-564-src-mq3-botlib-ai-goal-selection-ml-240336554"></a>
### OP_GENETIC_PARENTS_AND_CHILD_SELECTION

```ml
const OP_GENETIC_PARENTS_AND_CHILD_SELECTION = 564
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L21)

<a id="constant-constant-mq3-botlib-ai-goal-selection-op-get-level-item-goal-const-op-get-level-item-goal-539-src-mq3-botlib-ai-goal-selection-ml-1355757512"></a>
### OP_GET_LEVEL_ITEM_GOAL

```ml
const OP_GET_LEVEL_ITEM_GOAL = 539
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L19)

<a id="constant-constant-mq3-botlib-ai-goal-selection-op-interbreed-goal-fuzzy-logic-const-op-interbreed-goal-fuzzy-logic-565-src-mq3-botlib-ai-goal-selection-ml-695493283"></a>
### OP_INTERBREED_GOAL_FUZZY_LOGIC

```ml
const OP_INTERBREED_GOAL_FUZZY_LOGIC = 565
```

Baseq3 g_public.h assigns INTERBREED to 565 and MUTATE to 566.


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L23)

<a id="constant-constant-mq3-botlib-ai-goal-selection-op-item-goal-in-vis-but-not-visible-const-op-item-goal-in-vis-but-not-visible-538-src-mq3-botlib-ai-goal-selection-ml-25101851"></a>
### OP_ITEM_GOAL_IN_VIS_BUT_NOT_VISIBLE

```ml
const OP_ITEM_GOAL_IN_VIS_BUT_NOT_VISIBLE = 538
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L18)

<a id="constant-constant-mq3-botlib-ai-goal-selection-op-mutate-goal-fuzzy-logic-const-op-mutate-goal-fuzzy-logic-566-src-mq3-botlib-ai-goal-selection-ml-679821414"></a>
### OP_MUTATE_GOAL_FUZZY_LOGIC

```ml
const OP_MUTATE_GOAL_FUZZY_LOGIC = 566
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L24)

<a id="constant-constant-mq3-botlib-ai-goal-selection-op-save-goal-fuzzy-logic-const-op-save-goal-fuzzy-logic-545-src-mq3-botlib-ai-goal-selection-ml-232375863"></a>
### OP_SAVE_GOAL_FUZZY_LOGIC

```ml
const OP_SAVE_GOAL_FUZZY_LOGIC = 545
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L20)

<a id="function-function-mq3-botlib-ai-goal-selection-originarea-function-originarea-runtime-value-origin-src-mq3-botlib-ai-goal-selection-ml-1478866347"></a>
### originArea

```ml
function originArea(runtime, value, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L87)

<a id="function-function-mq3-botlib-ai-goal-selection-permitted-function-permitted-runtime-item-src-mq3-botlib-ai-goal-selection-ml-1581043837"></a>
### permitted

```ml
function permitted(runtime, item)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `item` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L77)

<a id="function-function-mq3-botlib-ai-goal-selection-randomfloat-function-randomfloat-runtime-src-mq3-botlib-ai-goal-selection-ml-306190694"></a>
### randomFloat

```ml
function randomFloat(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L43)

<a id="function-function-mq3-botlib-ai-goal-selection-reachabilityarea-function-reachabilityarea-runtime-origin-client-src-mq3-botlib-ai-goal-selection-ml-1677872727"></a>
### reachabilityArea

```ml
function reachabilityArea(runtime, origin, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L52)

- [mq3.botlib.ai_goal_selection.Runtime](Type-mq3-botlib-ai-goal-selection-runtime-1927224759.md) — struct
<a id="function-function-mq3-botlib-ai-goal-selection-savegoalfuzzylogic-function-savegoalfuzzylogic-runtime-handle-filename-src-mq3-botlib-ai-goal-selection-ml-83961905"></a>
### saveGoalFuzzyLogic

```ml
function saveGoalFuzzyLogic(runtime, handle, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L173)

<a id="function-function-mq3-botlib-ai-goal-selection-services-function-services-context-src-mq3-botlib-ai-goal-selection-ml-1537340521"></a>
### services

```ml
function services(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L39)

- [mq3.botlib.ai_goal_selection.Services](Type-mq3-botlib-ai-goal-selection-services-114167561.md) — struct
<a id="function-function-mq3-botlib-ai-goal-selection-setdroppedweight-function-setdroppedweight-runtime-value-src-mq3-botlib-ai-goal-selection-ml-1580900897"></a>
### setDroppedWeight

```ml
function setDroppedWeight(runtime, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L41)

<a id="function-function-mq3-botlib-ai-goal-selection-setrandomseed-function-setrandomseed-runtime-value-src-mq3-botlib-ai-goal-selection-ml-491973789"></a>
### setRandomSeed

```ml
function setRandomSeed(runtime, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L42)

<a id="function-function-mq3-botlib-ai-goal-selection-startitemquery-function-startitemquery-runtime-area-origin-travelflags-src-mq3-botlib-ai-goal-selection-ml-959622536"></a>
### startItemQuery

```ml
function startItemQuery(runtime, area, origin, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L90)

<a id="function-function-mq3-botlib-ai-goal-selection-supportstrap-function-supportstrap-op-src-mq3-botlib-ai-goal-selection-ml-1128319967"></a>
### supportsTrap

```ml
function supportsTrap(op)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `op` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L200)

<a id="function-function-mq3-botlib-ai-goal-selection-trace-function-trace-runtime-start-finish-viewer-src-mq3-botlib-ai-goal-selection-ml-1085226891"></a>
### trace

```ml
function trace(runtime, start, finish, viewer)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `finish` | `dynamic` | — |  |
| `viewer` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L68)

<a id="function-function-mq3-botlib-ai-goal-selection-traveltime-function-traveltime-runtime-area-origin-goalarea-travelflags-src-mq3-botlib-ai-goal-selection-ml-2021290786"></a>
### travelTime

```ml
function travelTime(runtime, area, origin, goalArea, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `goalArea` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L60)

<a id="constant-constant-mq3-botlib-ai-goal-selection-traveltime-scale-const-traveltime-scale-1-e-002-src-mq3-botlib-ai-goal-selection-ml-638047084"></a>
### TRAVELTIME_SCALE

```ml
const TRAVELTIME_SCALE = 1.e-002
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L32)

<a id="function-function-mq3-botlib-ai-goal-selection-weighted-function-weighted-runtime-handle-value-config-inventory-item-area-origin-travelflags-itemquery-fuzzycache-score-src-mq3-botlib-ai-goal-selection-ml-1769691285"></a>
### weighted

```ml
function weighted(runtime, handle, value, config, inventory, item, area, origin, travelFlags, itemQuery, fuzzyCache, score)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `config` | `dynamic` | — |  |
| `inventory` | `dynamic` | — |  |
| `item` | `dynamic` | — |  |
| `area` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |
| `itemQuery` | `dynamic` | — |  |
| `fuzzyCache` | `dynamic` | — |  |
| `score` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_selection.ml#L99)
