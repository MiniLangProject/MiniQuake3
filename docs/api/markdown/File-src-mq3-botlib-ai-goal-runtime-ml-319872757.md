# `src/mq3/botlib/ai_goal_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_goal_runtime`](Package-mq3-botlib-ai-goal-runtime-1965296315.md)

Reachable from entry: **no**

## Imports

- `mq3/botlib/ai_goal_selection.ml` as `selection` → [src/mq3/botlib/ai_goal_selection.ml](File-src-mq3-botlib-ai-goal-selection-ml-603097719.md)
- `mq3/botlib/ai_goal_state.ml` as `goals` → [src/mq3/botlib/ai_goal_state.ml](File-src-mq3-botlib-ai-goal-state-ml-857672002.md)
- `mq3/botlib/ai_item_weights.ml` as `weights` → [src/mq3/botlib/ai_item_weights.ml](File-src-mq3-botlib-ai-item-weights-ml-1163821802.md)
- `mq3/botlib/ai_level_items.ml` as `levelItems` → [src/mq3/botlib/ai_level_items.ml](File-src-mq3-botlib-ai-level-items-ml-1268981414.md)
- `mq3/botlib/ai_map_goals.ml` as `mapGoals` → [src/mq3/botlib/ai_map_goals.ml](File-src-mq3-botlib-ai-map-goals-ml-805849506.md)
- `mq3/botlib/ai_resource_pools.ml` as `pools` → [src/mq3/botlib/ai_resource_pools.ml](File-src-mq3-botlib-ai-resource-pools-ml-103445473.md)

## Declarations

<a id="function-function-mq3-botlib-ai-goal-runtime-addlevelitemtolist-function-addlevelitemtolist-state-item-src-mq3-botlib-ai-goal-runtime-ml-322276146"></a>
### addLevelItemToList

```ml
function addLevelItemToList(state, item)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `item` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L56)

<a id="function-function-mq3-botlib-ai-goal-runtime-alloclevelitem-function-alloclevelitem-state-src-mq3-botlib-ai-goal-runtime-ml-1278811363"></a>
### allocLevelItem

```ml
function allocLevelItem(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L49)

<a id="constant-constant-mq3-botlib-ai-goal-runtime-avoid-default-time-const-avoid-default-time-30-src-mq3-botlib-ai-goal-runtime-ml-271818558"></a>
### AVOID_DEFAULT_TIME

```ml
const AVOID_DEFAULT_TIME = 30
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L14)

<a id="constant-constant-mq3-botlib-ai-goal-runtime-avoid-minimum-time-const-avoid-minimum-time-10-src-mq3-botlib-ai-goal-runtime-ml-913931930"></a>
### AVOID_MINIMUM_TIME

```ml
const AVOID_MINIMUM_TIME = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L13)

<a id="function-function-mq3-botlib-ai-goal-runtime-bindworld-function-bindworld-state-aasentities-aas-bspentities-gametype-placefn-src-mq3-botlib-ai-goal-runtime-ml-1564530241"></a>
### bindWorld

```ml
function bindWorld(state, aasEntities, aas, bspEntities, gameType, placeFn)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `aasEntities` | `dynamic` | — |  |
| `aas` | `dynamic` | — |  |
| `bspEntities` | `dynamic` | — |  |
| `gameType` | `dynamic` | — |  |
| `placeFn` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L28)

<a id="function-function-mq3-botlib-ai-goal-runtime-botaddtoavoidgoals-function-botaddtoavoidgoals-state-goalstate-number-avoidtime-src-mq3-botlib-ai-goal-runtime-ml-1225406542"></a>
### botAddToAvoidGoals

```ml
function botAddToAvoidGoals(state, goalState, number, avoidTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `goalState` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |
| `avoidTime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L75)

<a id="function-function-mq3-botlib-ai-goal-runtime-botallocgoalstate-function-botallocgoalstate-state-client-src-mq3-botlib-ai-goal-runtime-ml-570717474"></a>
### botAllocGoalState

```ml
function botAllocGoalState(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L41)

<a id="function-function-mq3-botlib-ai-goal-runtime-botavoidgoaltime-function-botavoidgoaltime-state-goalstate-number-src-mq3-botlib-ai-goal-runtime-ml-699749328"></a>
### botAvoidGoalTime

```ml
function botAvoidGoalTime(state, goalState, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `goalState` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L77)

<a id="function-function-mq3-botlib-ai-goal-runtime-botchooseltgitem-function-botchooseltgitem-state-goalstate-origin-inventory-travelflags-src-mq3-botlib-ai-goal-runtime-ml-975299416"></a>
### botChooseLTGItem

```ml
function botChooseLTGItem(state, goalState, origin, inventory, travelFlags)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `goalState` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `inventory` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L96)

<a id="function-function-mq3-botlib-ai-goal-runtime-botchoosenbgitem-function-botchoosenbgitem-state-goalstate-origin-inventory-travelflags-longtermgoal-maxtime-src-mq3-botlib-ai-goal-runtime-ml-1852327512"></a>
### botChooseNBGItem

```ml
function botChooseNBGItem(state, goalState, origin, inventory, travelFlags, longTermGoal, maxTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `goalState` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `inventory` | `dynamic` | — |  |
| `travelFlags` | `dynamic` | — |  |
| `longTermGoal` | `dynamic` | — |  |
| `maxTime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L97)

<a id="function-function-mq3-botlib-ai-goal-runtime-botdumpavoidgoals-function-botdumpavoidgoals-state-goalstate-src-mq3-botlib-ai-goal-runtime-ml-1617610867"></a>
### botDumpAvoidGoals

```ml
function botDumpAvoidGoals(state, goalState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `goalState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L74)

<a id="function-function-mq3-botlib-ai-goal-runtime-botdumpgoalstack-function-botdumpgoalstack-state-goalstate-src-mq3-botlib-ai-goal-runtime-ml-804892691"></a>
### botDumpGoalStack

```ml
function botDumpGoalStack(state, goalState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `goalState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L84)

<a id="function-function-mq3-botlib-ai-goal-runtime-botemptygoalstack-function-botemptygoalstack-state-goalstate-src-mq3-botlib-ai-goal-runtime-ml-2134928673"></a>
### botEmptyGoalStack

```ml
function botEmptyGoalStack(state, goalState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `goalState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L87)

<a id="function-function-mq3-botlib-ai-goal-runtime-botfindentityforlevelitem-function-botfindentityforlevelitem-state-item-src-mq3-botlib-ai-goal-runtime-ml-278467636"></a>
### botFindEntityForLevelItem

```ml
function botFindEntityForLevelItem(state, item)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `item` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L67)

<a id="function-function-mq3-botlib-ai-goal-runtime-botfreegoalstate-function-botfreegoalstate-state-handle-src-mq3-botlib-ai-goal-runtime-ml-700287941"></a>
### botFreeGoalState

```ml
function botFreeGoalState(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L42)

<a id="function-function-mq3-botlib-ai-goal-runtime-botfreeinfoentities-function-botfreeinfoentities-state-src-mq3-botlib-ai-goal-runtime-ml-1133622347"></a>
### botFreeInfoEntities

```ml
function botFreeInfoEntities(state)
```

Map/static/dropped entity population -----------------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L59)

<a id="function-function-mq3-botlib-ai-goal-runtime-botfreeitemweights-function-botfreeitemweights-state-goalstate-src-mq3-botlib-ai-goal-runtime-ml-1721186191"></a>
### botFreeItemWeights

```ml
function botFreeItemWeights(state, goalState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `goalState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L40)

<a id="function-function-mq3-botlib-ai-goal-runtime-botgetlevelitemgoal-function-botgetlevelitemgoal-state-index-name-goal-src-mq3-botlib-ai-goal-runtime-ml-820047617"></a>
### botGetLevelItemGoal

```ml
function botGetLevelItemGoal(state, index, name, goal)
```

Selection, visibility, routing and map goals ---------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L93)

<a id="function-function-mq3-botlib-ai-goal-runtime-botgetmaplocationgoal-function-botgetmaplocationgoal-state-name-src-mq3-botlib-ai-goal-runtime-ml-744103948"></a>
### botGetMapLocationGoal

```ml
function botGetMapLocationGoal(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L94)

<a id="function-function-mq3-botlib-ai-goal-runtime-botgetnextcampspotgoal-function-botgetnextcampspotgoal-state-number-src-mq3-botlib-ai-goal-runtime-ml-1238973300"></a>
### botGetNextCampSpotGoal

```ml
function botGetNextCampSpotGoal(state, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L95)

<a id="function-function-mq3-botlib-ai-goal-runtime-botgetsecondgoal-function-botgetsecondgoal-state-goalstate-src-mq3-botlib-ai-goal-runtime-ml-782787171"></a>
### botGetSecondGoal

```ml
function botGetSecondGoal(state, goalState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `goalState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L89)

<a id="function-function-mq3-botlib-ai-goal-runtime-botgettopgoal-function-botgettopgoal-state-goalstate-src-mq3-botlib-ai-goal-runtime-ml-296042697"></a>
### botGetTopGoal

```ml
function botGetTopGoal(state, goalState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `goalState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L88)

<a id="function-function-mq3-botlib-ai-goal-runtime-botgoalname-function-botgoalname-state-number-size-src-mq3-botlib-ai-goal-runtime-ml-986445989"></a>
### botGoalName

```ml
function botGoalName(state, number, size)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L64)

<a id="function-function-mq3-botlib-ai-goal-runtime-botgoalstatefromhandle-function-botgoalstatefromhandle-state-handle-src-mq3-botlib-ai-goal-runtime-ml-1627109749"></a>
### botGoalStateFromHandle

```ml
function botGoalStateFromHandle(state, handle)
```

Fuzzy weights and goal-state lifecycle ---------------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L33)

<a id="function-function-mq3-botlib-ai-goal-runtime-botinitinfoentities-function-botinitinfoentities-state-src-mq3-botlib-ai-goal-runtime-ml-1410356723"></a>
### botInitInfoEntities

```ml
function botInitInfoEntities(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L60)

<a id="function-function-mq3-botlib-ai-goal-runtime-botinitlevelitems-function-botinitlevelitems-state-src-mq3-botlib-ai-goal-runtime-ml-1437461589"></a>
### botInitLevelItems

```ml
function botInitLevelItems(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L61)

<a id="function-function-mq3-botlib-ai-goal-runtime-botinterbreedgoalfuzzylogic-function-botinterbreedgoalfuzzylogic-state-parent1-parent2-child-src-mq3-botlib-ai-goal-runtime-ml-252721066"></a>
### botInterbreedGoalFuzzyLogic

```ml
function botInterbreedGoalFuzzyLogic(state, parent1, parent2, child)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `parent1` | `dynamic` | — |  |
| `parent2` | `dynamic` | — |  |
| `child` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L34)

<a id="function-function-mq3-botlib-ai-goal-runtime-botitemgoalinvisbutnotvisible-function-botitemgoalinvisbutnotvisible-state-viewer-eye-viewangles-goal-src-mq3-botlib-ai-goal-runtime-ml-186315136"></a>
### botItemGoalInVisButNotVisible

```ml
function botItemGoalInVisButNotVisible(state, viewer, eye, viewAngles, goal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `viewer` | `dynamic` | — |  |
| `eye` | `dynamic` | — |  |
| `viewAngles` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L98)

<a id="function-function-mq3-botlib-ai-goal-runtime-botloaditemweights-function-botloaditemweights-state-goalstate-filename-src-mq3-botlib-ai-goal-runtime-ml-934203688"></a>
### botLoadItemWeights

```ml
function botLoadItemWeights(state, goalState, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `goalState` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L39)

<a id="function-function-mq3-botlib-ai-goal-runtime-botmutategoalfuzzylogic-function-botmutategoalfuzzylogic-state-goalstate-range-src-mq3-botlib-ai-goal-runtime-ml-1139774096"></a>
### botMutateGoalFuzzyLogic

```ml
function botMutateGoalFuzzyLogic(state, goalState, range)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `goalState` | `dynamic` | — |  |
| `range` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L36)

<a id="function-function-mq3-botlib-ai-goal-runtime-botpopgoal-function-botpopgoal-state-goalstate-src-mq3-botlib-ai-goal-runtime-ml-836309267"></a>
### botPopGoal

```ml
function botPopGoal(state, goalState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `goalState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L86)

<a id="function-function-mq3-botlib-ai-goal-runtime-botpushgoal-function-botpushgoal-state-goalstate-goal-src-mq3-botlib-ai-goal-runtime-ml-963539358"></a>
### botPushGoal

```ml
function botPushGoal(state, goalState, goal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `goalState` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L85)

<a id="function-function-mq3-botlib-ai-goal-runtime-botremovefromavoidgoals-function-botremovefromavoidgoals-state-goalstate-number-src-mq3-botlib-ai-goal-runtime-ml-1407865352"></a>
### botRemoveFromAvoidGoals

```ml
function botRemoveFromAvoidGoals(state, goalState, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `goalState` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L76)

<a id="function-function-mq3-botlib-ai-goal-runtime-botresetavoidgoals-function-botresetavoidgoals-state-goalstate-src-mq3-botlib-ai-goal-runtime-ml-1494581563"></a>
### botResetAvoidGoals

```ml
function botResetAvoidGoals(state, goalState)
```

Avoid-goal table and stack ---------------------------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `goalState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L73)

<a id="function-function-mq3-botlib-ai-goal-runtime-botresetgoalstate-function-botresetgoalstate-state-handle-src-mq3-botlib-ai-goal-runtime-ml-461968305"></a>
### botResetGoalState

```ml
function botResetGoalState(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L43)

<a id="function-function-mq3-botlib-ai-goal-runtime-botsavegoalfuzzylogic-function-botsavegoalfuzzylogic-state-goalstate-filename-src-mq3-botlib-ai-goal-runtime-ml-1402426786"></a>
### botSaveGoalFuzzyLogic

```ml
function botSaveGoalFuzzyLogic(state, goalState, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `goalState` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L35)

<a id="function-function-mq3-botlib-ai-goal-runtime-botsetavoidgoaltime-function-botsetavoidgoaltime-state-goalstate-number-avoidtime-src-mq3-botlib-ai-goal-runtime-ml-1883805314"></a>
### botSetAvoidGoalTime

```ml
function botSetAvoidGoalTime(state, goalState, number, avoidTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `goalState` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |
| `avoidTime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L78)

<a id="function-function-mq3-botlib-ai-goal-runtime-botsetupgoalai-function-botsetupgoalai-state-itemconfigfile-gametype-droppedweight-src-mq3-botlib-ai-goal-runtime-ml-560802980"></a>
### botSetupGoalAI

```ml
function botSetupGoalAI(state, itemConfigFile, gameType, droppedWeight)
```

File-level setup/shutdown ----------------------------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `itemConfigFile` | `dynamic` | — |  |
| `gameType` | `dynamic` | — |  |
| `droppedWeight` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L101)

<a id="function-function-mq3-botlib-ai-goal-runtime-botshutdowngoalai-function-botshutdowngoalai-state-src-mq3-botlib-ai-goal-runtime-ml-658239235"></a>
### botShutdownGoalAI

```ml
function botShutdownGoalAI(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L104)

<a id="function-function-mq3-botlib-ai-goal-runtime-bottouchinggoal-function-bottouchinggoal-origin-goal-src-mq3-botlib-ai-goal-runtime-ml-1052547411"></a>
### botTouchingGoal

```ml
function botTouchingGoal(origin, goal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L90)

<a id="function-function-mq3-botlib-ai-goal-runtime-botupdateentityitems-function-botupdateentityitems-state-src-mq3-botlib-ai-goal-runtime-ml-2088427111"></a>
### botUpdateEntityItems

```ml
function botUpdateEntityItems(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L70)

<a id="function-function-mq3-botlib-ai-goal-runtime-create-function-create-context-readfn-timefn-logfn-printfn-services-src-mq3-botlib-ai-goal-runtime-ml-17998897"></a>
### create

```ml
function create(context, readFn, timeFn, logFn, printFn, services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |
| `readFn` | `dynamic` | — |  |
| `timeFn` | `dynamic` | — |  |
| `logFn` | `dynamic` | — |  |
| `printFn` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L24)

<a id="function-function-mq3-botlib-ai-goal-runtime-freelevelitem-function-freelevelitem-state-item-src-mq3-botlib-ai-goal-runtime-ml-918385940"></a>
### freeLevelItem

```ml
function freeLevelItem(state, item)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `item` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L55)

- [mq3.botlib.ai_goal_runtime.Host](Type-mq3-botlib-ai-goal-runtime-host-1286832985.md) — struct
<a id="function-function-mq3-botlib-ai-goal-runtime-hostlog-function-hostlog-host-text-src-mq3-botlib-ai-goal-runtime-ml-1365299861"></a>
### hostLog

```ml
function hostLog(host, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L21)

<a id="function-function-mq3-botlib-ai-goal-runtime-hostname-function-hostname-host-number-src-mq3-botlib-ai-goal-runtime-ml-365823763"></a>
### hostName

```ml
function hostName(host, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L20)

<a id="function-function-mq3-botlib-ai-goal-runtime-hostprint-function-hostprint-host-level-text-src-mq3-botlib-ai-goal-runtime-ml-114716715"></a>
### hostPrint

```ml
function hostPrint(host, level, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `level` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L22)

<a id="function-function-mq3-botlib-ai-goal-runtime-hosttime-function-hosttime-host-src-mq3-botlib-ai-goal-runtime-ml-1736028560"></a>
### hostTime

```ml
function hostTime(host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L19)

<a id="function-function-mq3-botlib-ai-goal-runtime-initlevelitemheap-function-initlevelitemheap-state-capacity-src-mq3-botlib-ai-goal-runtime-ml-1928990205"></a>
### initLevelItemHeap

```ml
function initLevelItemHeap(state, capacity)
```

Level-item heap/list ownership -----------------------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L46)

<a id="function-function-mq3-botlib-ai-goal-runtime-itemweightindex-function-itemweightindex-weightconfig-itemconfig-src-mq3-botlib-ai-goal-runtime-ml-1614667733"></a>
### itemWeightIndex

```ml
function itemWeightIndex(weightConfig, itemConfig)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `weightConfig` | `dynamic` | — |  |
| `itemConfig` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L38)

<a id="function-function-mq3-botlib-ai-goal-runtime-loaditemconfig-function-loaditemconfig-state-filename-src-mq3-botlib-ai-goal-runtime-ml-1943599524"></a>
### loadItemConfig

```ml
function loadItemConfig(state, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L37)

<a id="function-function-mq3-botlib-ai-goal-runtime-removelevelitemfromlist-function-removelevelitemfromlist-state-item-src-mq3-botlib-ai-goal-runtime-ml-1601744100"></a>
### removeLevelItemFromList

```ml
function removeLevelItemFromList(state, item)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `item` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_runtime.ml#L52)

- [mq3.botlib.ai_goal_runtime.State](Type-mq3-botlib-ai-goal-runtime-state-423927872.md) — struct
