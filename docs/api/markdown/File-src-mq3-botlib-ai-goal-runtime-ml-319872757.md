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

Set `state.levelItems.levelItems` to `[item]+state.levelItems.levelItems` in `mq3.botlib.ai_goal_runtime.addLevelItemToList`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `levelItems`. May update `state.levelItems.levelItems` in place. |
| `item` | `dynamic` | — | Value used by `addLevelItemToList` in `if item==void then return 0 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L176)

<a id="function-function-mq3-botlib-ai-goal-runtime-alloclevelitem-function-alloclevelitem-state-src-mq3-botlib-ai-goal-runtime-ml-1278811363"></a>
### allocLevelItem

```ml
function allocLevelItem(state)
```

Set `state.freeLevelItems` to `state.freeLevelItems-1` in `mq3.botlib.ai_goal_runtime.allocLevelItem`. Return paths include `levelItems.BotLevelItem(0,0,0,0.0,[0.0,0.0,0.0],0,[0.0,0.0,0.0],0,0.0)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `freeLevelItems`. May update `state.freeLevelItems` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L160)

<a id="constant-constant-mq3-botlib-ai-goal-runtime-avoid-default-time-const-avoid-default-time-30-src-mq3-botlib-ai-goal-runtime-ml-271818558"></a>
### AVOID_DEFAULT_TIME

```ml
const AVOID_DEFAULT_TIME = 30
```

Default interval for temporarily avoiding a selected goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L16)

<a id="constant-constant-mq3-botlib-ai-goal-runtime-avoid-minimum-time-const-avoid-minimum-time-10-src-mq3-botlib-ai-goal-runtime-ml-913931930"></a>
### AVOID_MINIMUM_TIME

```ml
const AVOID_MINIMUM_TIME = 10
```

Minimum interval retained for a goal-avoidance request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L14)

<a id="function-function-mq3-botlib-ai-goal-runtime-bindworld-function-bindworld-state-aasentities-aas-bspentities-gametype-placefn-src-mq3-botlib-ai-goal-runtime-ml-1564530241"></a>
### bindWorld

```ml
function bindWorld(state, aasEntities, aas, bspEntities, gameType, placeFn)
```

Update `state.aasEntities`, `state.aas`, `state.bspEntities` and `state.gameType` and related state during `bindWorld`. Return paths include `state`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `aasEntities`, `aas`, `bspEntities`, `gameType` and `placeFn` and related fields. May update `state.aasEntities`, `state.aas` and `state.bspEntities` and additional fields in place. |
| `aasEntities` | `dynamic` | — | Value used by `bind` in `state.aasEntities=entities`. |
| `aas` | `dynamic` | — | Value used by `bind` in `state.aas=aas`. |
| `bspEntities` | `dynamic` | — | Value used by `bind` in `state.bspEntities=bspEntities`. |
| `gameType` | `dynamic` | — | Value used by `bind` in `state.gameType=gameType`. |
| `placeFn` | `dynamic` | — | Value used by `bind` in `state.placeFn=placeFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L98)

<a id="function-function-mq3-botlib-ai-goal-runtime-botaddtoavoidgoals-function-botaddtoavoidgoals-state-goalstate-number-avoidtime-src-mq3-botlib-ai-goal-runtime-ml-1225406542"></a>
### botAddToAvoidGoals

```ml
function botAddToAvoidGoals(state, goalState, number, avoidTime)
```

Forward `botAddToAvoidGoals` to `mq3.botlib.ai_goal_state.addToAvoidGoals` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `goals`. |
| `goalState` | `dynamic` | — | Handle of the pooled bot goal state. |
| `number` | `dynamic` | — | Value used by `addToAvoidGoals` in `if value.avoidGoals[index]==number then value.avoidGoals[index]=number`. |
| `avoidTime` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.fadd`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L219)

<a id="function-function-mq3-botlib-ai-goal-runtime-botallocgoalstate-function-botallocgoalstate-state-client-src-mq3-botlib-ai-goal-runtime-ml-570717474"></a>
### botAllocGoalState

```ml
function botAllocGoalState(state, client)
```

Forward `botAllocGoalState` to `mq3.botlib.ai_resource_pools.allocGoalState` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `pools`. |
| `client` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_resource_pools.GoalState.client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L142)

<a id="function-function-mq3-botlib-ai-goal-runtime-botavoidgoaltime-function-botavoidgoaltime-state-goalstate-number-src-mq3-botlib-ai-goal-runtime-ml-699749328"></a>
### botAvoidGoalTime

```ml
function botAvoidGoalTime(state, goalState, number)
```

Forward `botAvoidGoalTime` to `mq3.botlib.ai_goal_state.avoidGoalTime` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `goals`. |
| `goalState` | `dynamic` | — | Handle of the pooled bot goal state. |
| `number` | `dynamic` | — | Value used by `avoidGoalTime` in `if value.avoidGoals[index]==number and value.avoidGoalTimes[index]>=now then return goalNumeric.fsub(value.avoid...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L229)

<a id="function-function-mq3-botlib-ai-goal-runtime-botchooseltgitem-function-botchooseltgitem-state-goalstate-origin-inventory-travelflags-src-mq3-botlib-ai-goal-runtime-ml-975299416"></a>
### botChooseLTGItem

```ml
function botChooseLTGItem(state, goalState, origin, inventory, travelFlags)
```

Forward `botChooseLTGItem` to `mq3.botlib.ai_goal_selection.chooseLTGItem` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `selection`. |
| `goalState` | `dynamic` | — | Handle of the pooled bot goal state. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `inventory` | `dynamic` | — | Bot inventory indexed by the corresponding inventory constants. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L291)

<a id="function-function-mq3-botlib-ai-goal-runtime-botchoosenbgitem-function-botchoosenbgitem-state-goalstate-origin-inventory-travelflags-longtermgoal-maxtime-src-mq3-botlib-ai-goal-runtime-ml-1852327512"></a>
### botChooseNBGItem

```ml
function botChooseNBGItem(state, goalState, origin, inventory, travelFlags, longTermGoal, maxTime)
```

Forward `botChooseNBGItem` to `mq3.botlib.ai_goal_selection.chooseNBGItem` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `selection`. |
| `goalState` | `dynamic` | — | Handle of the pooled bot goal state. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `inventory` | `dynamic` | — | Bot inventory indexed by the corresponding inventory constants. |
| `travelFlags` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |
| `longTermGoal` | `dynamic` | — | Long term goal record; accesses `areaNum`. |
| `maxTime` | `dynamic` | — | Upper limit on the route travel-time value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L300)

<a id="function-function-mq3-botlib-ai-goal-runtime-botdumpavoidgoals-function-botdumpavoidgoals-state-goalstate-src-mq3-botlib-ai-goal-runtime-ml-1617610867"></a>
### botDumpAvoidGoals

```ml
function botDumpAvoidGoals(state, goalState)
```

Forward `botDumpAvoidGoals` to `mq3.botlib.ai_goal_state.dumpAvoidGoals` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `goals`. |
| `goalState` | `dynamic` | — | Handle of the pooled bot goal state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L213)

<a id="function-function-mq3-botlib-ai-goal-runtime-botdumpgoalstack-function-botdumpgoalstack-state-goalstate-src-mq3-botlib-ai-goal-runtime-ml-804892691"></a>
### botDumpGoalStack

```ml
function botDumpGoalStack(state, goalState)
```

Forward `botDumpGoalStack` to `mq3.botlib.ai_goal_state.dumpGoalStack` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `goals`. |
| `goalState` | `dynamic` | — | Handle of the pooled bot goal state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L244)

<a id="function-function-mq3-botlib-ai-goal-runtime-botemptygoalstack-function-botemptygoalstack-state-goalstate-src-mq3-botlib-ai-goal-runtime-ml-2134928673"></a>
### botEmptyGoalStack

```ml
function botEmptyGoalStack(state, goalState)
```

Forward `botEmptyGoalStack` to `mq3.botlib.ai_goal_state.emptyGoalStack` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `goals`. |
| `goalState` | `dynamic` | — | Handle of the pooled bot goal state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L257)

<a id="function-function-mq3-botlib-ai-goal-runtime-botfindentityforlevelitem-function-botfindentityforlevelitem-state-item-src-mq3-botlib-ai-goal-runtime-ml-278467636"></a>
### botFindEntityForLevelItem

```ml
function botFindEntityForLevelItem(state, item)
```

Apply `mq3.botlib.ai_level_items.update` while evaluating `botFindEntityForLevelItem`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `levelItems`. |
| `item` | `dynamic` | — | Item record; accesses `number`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L199)

<a id="function-function-mq3-botlib-ai-goal-runtime-botfreegoalstate-function-botfreegoalstate-state-handle-src-mq3-botlib-ai-goal-runtime-ml-700287941"></a>
### botFreeGoalState

```ml
function botFreeGoalState(state, handle)
```

Apply `mq3.botlib.ai_goal_runtime.botFreeItemWeights` and `mq3.botlib.ai_resource_pools.freeGoalState` while evaluating `botFreeGoalState`. Return paths include `pools.freeGoalState(state.pools,handle)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `pools`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot goal state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L146)

<a id="function-function-mq3-botlib-ai-goal-runtime-botfreeinfoentities-function-botfreeinfoentities-state-src-mq3-botlib-ai-goal-runtime-ml-1133622347"></a>
### botFreeInfoEntities

```ml
function botFreeInfoEntities(state)
```

Map/static/dropped entity population -----------------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `mapGoals`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L180)

<a id="function-function-mq3-botlib-ai-goal-runtime-botfreeitemweights-function-botfreeitemweights-state-goalstate-src-mq3-botlib-ai-goal-runtime-ml-1721186191"></a>
### botFreeItemWeights

```ml
function botFreeItemWeights(state, goalState)
```

Forward `botFreeItemWeights` to `mq3.botlib.ai_item_weights.freeItemWeights` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `itemWeights` and `pools`. |
| `goalState` | `dynamic` | — | Handle of the pooled bot goal state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L138)

<a id="function-function-mq3-botlib-ai-goal-runtime-botgetlevelitemgoal-function-botgetlevelitemgoal-state-index-name-goal-src-mq3-botlib-ai-goal-runtime-ml-820047617"></a>
### botGetLevelItemGoal

```ml
function botGetLevelItemGoal(state, index, name, goal)
```

Selection, visibility, routing and map goals ---------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `selection`. |
| `index` | `dynamic` | — | Index of the entry to access. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `areaNum`, `origin`, `entityNum`, `mins` and `maxs` and related fields. May update `goal.areaNum`, `goal.origin` and `goal.entityNum` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L276)

<a id="function-function-mq3-botlib-ai-goal-runtime-botgetmaplocationgoal-function-botgetmaplocationgoal-state-name-src-mq3-botlib-ai-goal-runtime-ml-744103948"></a>
### botGetMapLocationGoal

```ml
function botGetMapLocationGoal(state, name)
```

Forward `botGetMapLocationGoal` to `mq3.botlib.ai_map_goals.mapLocationGoal` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `mapGoals`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L280)

<a id="function-function-mq3-botlib-ai-goal-runtime-botgetnextcampspotgoal-function-botgetnextcampspotgoal-state-number-src-mq3-botlib-ai-goal-runtime-ml-1238973300"></a>
### botGetNextCampSpotGoal

```ml
function botGetNextCampSpotGoal(state, number)
```

Forward `botGetNextCampSpotGoal` to `mq3.botlib.ai_map_goals.nextCampSpotGoal` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `mapGoals`. |
| `number` | `dynamic` | — | Operand used to evaluate the returned expression `CampResult(number+1,state.campSpots[index].goal)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L284)

<a id="function-function-mq3-botlib-ai-goal-runtime-botgetsecondgoal-function-botgetsecondgoal-state-goalstate-src-mq3-botlib-ai-goal-runtime-ml-782787171"></a>
### botGetSecondGoal

```ml
function botGetSecondGoal(state, goalState)
```

Forward `botGetSecondGoal` to `mq3.botlib.ai_goal_state.secondGoal` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `goals`. |
| `goalState` | `dynamic` | — | Handle of the pooled bot goal state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L265)

<a id="function-function-mq3-botlib-ai-goal-runtime-botgettopgoal-function-botgettopgoal-state-goalstate-src-mq3-botlib-ai-goal-runtime-ml-296042697"></a>
### botGetTopGoal

```ml
function botGetTopGoal(state, goalState)
```

Forward `botGetTopGoal` to `mq3.botlib.ai_goal_state.topGoal` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `goals`. |
| `goalState` | `dynamic` | — | Handle of the pooled bot goal state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L261)

<a id="function-function-mq3-botlib-ai-goal-runtime-botgoalname-function-botgoalname-state-number-size-src-mq3-botlib-ai-goal-runtime-ml-986445989"></a>
### botGoalName

```ml
function botGoalName(state, number, size)
```

Apply `mq3.botlib.ai_level_items.goalName` while evaluating `botGoalName`. Return paths include `decode(slice(data,0,count))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `levelItems`. |
| `number` | `dynamic` | — | Value used by `goalName` in `for each levelItem in state.levelItems if levelItem.number==number then return items[levelItem.itemInfo].name en...`. |
| `size` | `dynamic` | — | Size or capacity supplied to the buffer operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L193)

<a id="function-function-mq3-botlib-ai-goal-runtime-botgoalstatefromhandle-function-botgoalstatefromhandle-state-handle-src-mq3-botlib-ai-goal-runtime-ml-1627109749"></a>
### botGoalStateFromHandle

```ml
function botGoalStateFromHandle(state, handle)
```

Fuzzy weights and goal-state lifecycle ---------------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `pools`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot goal state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L105)

<a id="function-function-mq3-botlib-ai-goal-runtime-botinitinfoentities-function-botinitinfoentities-state-src-mq3-botlib-ai-goal-runtime-ml-1410356723"></a>
### botInitInfoEntities

```ml
function botInitInfoEntities(state)
```

Forward `botInitInfoEntities` to `mq3.botlib.ai_map_goals.initialize` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `mapGoals`, `aas` and `bspEntities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L183)

<a id="function-function-mq3-botlib-ai-goal-runtime-botinitlevelitems-function-botinitlevelitems-state-src-mq3-botlib-ai-goal-runtime-ml-1437461589"></a>
### botInitLevelItems

```ml
function botInitLevelItems(state)
```

Set `state.freeLevelItems` to `state.levelItems.maxLevelItems-len(state.levelItems.levelItems)` in `mq3.botlib.ai_goal_runtime.botInitLevelItems`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `levelItems` and `freeLevelItems`. May update `state.freeLevelItems` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L186)

<a id="function-function-mq3-botlib-ai-goal-runtime-botinterbreedgoalfuzzylogic-function-botinterbreedgoalfuzzylogic-state-parent1-parent2-child-src-mq3-botlib-ai-goal-runtime-ml-252721066"></a>
### botInterbreedGoalFuzzyLogic

```ml
function botInterbreedGoalFuzzyLogic(state, parent1, parent2, child)
```

Forward `botInterbreedGoalFuzzyLogic` to `mq3.botlib.ai_goal_selection.interbreedGoalFuzzyLogic` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `selection`. |
| `parent1` | `dynamic` | — | Handle identifying the allocated bot goal state. |
| `parent2` | `dynamic` | — | Handle identifying the allocated bot goal state. |
| `child` | `dynamic` | — | Handle identifying the allocated bot goal state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L111)

<a id="function-function-mq3-botlib-ai-goal-runtime-botitemgoalinvisbutnotvisible-function-botitemgoalinvisbutnotvisible-state-viewer-eye-viewangles-goal-src-mq3-botlib-ai-goal-runtime-ml-186315136"></a>
### botItemGoalInVisButNotVisible

```ml
function botItemGoalInVisButNotVisible(state, viewer, eye, viewAngles, goal)
```

Forward `botItemGoalInVisButNotVisible` to `mq3.botlib.ai_goal_selection.itemGoalInVisButNotVisible` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `selection`. |
| `viewer` | `dynamic` | — | Entity number ignored by the visibility trace. |
| `eye` | `dynamic` | — | Value passed as argument 2 to `runtime.services.traceFn`. |
| `viewAngles` | `dynamic` | — | Pitch, yaw and roll of the bot view in degrees. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `flags`, `origin`, `mins` and `entityNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L307)

<a id="function-function-mq3-botlib-ai-goal-runtime-botloaditemweights-function-botloaditemweights-state-goalstate-filename-src-mq3-botlib-ai-goal-runtime-ml-934203688"></a>
### botLoadItemWeights

```ml
function botLoadItemWeights(state, goalState, filename)
```

Forward `botLoadItemWeights` to `mq3.botlib.ai_item_weights.loadItemWeights` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `itemWeights` and `pools`. |
| `goalState` | `dynamic` | — | Handle of the pooled bot goal state. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L134)

<a id="function-function-mq3-botlib-ai-goal-runtime-botmutategoalfuzzylogic-function-botmutategoalfuzzylogic-state-goalstate-range-src-mq3-botlib-ai-goal-runtime-ml-1139774096"></a>
### botMutateGoalFuzzyLogic

```ml
function botMutateGoalFuzzyLogic(state, goalState, range)
```

Forward `botMutateGoalFuzzyLogic` to `mq3.botlib.ai_goal_selection.mutateGoalFuzzyLogic` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `selection`. |
| `goalState` | `dynamic` | — | Handle of the pooled bot goal state. |
| `range` | `dynamic` | — | Value passed as argument 3 to `mq3.botlib.ai_goal_selection.mutateGoalFuzzyLogic`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L121)

<a id="function-function-mq3-botlib-ai-goal-runtime-botpopgoal-function-botpopgoal-state-goalstate-src-mq3-botlib-ai-goal-runtime-ml-836309267"></a>
### botPopGoal

```ml
function botPopGoal(state, goalState)
```

Forward `botPopGoal` to `mq3.botlib.ai_goal_state.popGoal` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `goals`. |
| `goalState` | `dynamic` | — | Handle of the pooled bot goal state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L253)

<a id="function-function-mq3-botlib-ai-goal-runtime-botpushgoal-function-botpushgoal-state-goalstate-goal-src-mq3-botlib-ai-goal-runtime-ml-963539358"></a>
### botPushGoal

```ml
function botPushGoal(state, goalState, goal)
```

Forward `botPushGoal` to `mq3.botlib.ai_goal_state.pushGoal` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `goals`. |
| `goalState` | `dynamic` | — | Handle of the pooled bot goal state. |
| `goal` | `dynamic` | — | Value record; accesses `origin`, `areaNum`, `mins`, `maxs` and `entityNum` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L249)

<a id="function-function-mq3-botlib-ai-goal-runtime-botremovefromavoidgoals-function-botremovefromavoidgoals-state-goalstate-number-src-mq3-botlib-ai-goal-runtime-ml-1407865352"></a>
### botRemoveFromAvoidGoals

```ml
function botRemoveFromAvoidGoals(state, goalState, number)
```

Forward `botRemoveFromAvoidGoals` to `mq3.botlib.ai_goal_state.removeFromAvoidGoals` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `goals`. |
| `goalState` | `dynamic` | — | Handle of the pooled bot goal state. |
| `number` | `dynamic` | — | Value used by `removeFromAvoidGoals` in `if value.avoidGoals[index]==number and value.avoidGoalTimes[index]>=now then value.avoidGoalTimes[index]=0.0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L224)

<a id="function-function-mq3-botlib-ai-goal-runtime-botresetavoidgoals-function-botresetavoidgoals-state-goalstate-src-mq3-botlib-ai-goal-runtime-ml-1494581563"></a>
### botResetAvoidGoals

```ml
function botResetAvoidGoals(state, goalState)
```

Avoid-goal table and stack ---------------------------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `goals`. |
| `goalState` | `dynamic` | — | Handle of the pooled bot goal state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L209)

<a id="function-function-mq3-botlib-ai-goal-runtime-botresetgoalstate-function-botresetgoalstate-state-handle-src-mq3-botlib-ai-goal-runtime-ml-461968305"></a>
### botResetGoalState

```ml
function botResetGoalState(state, handle)
```

Forward `botResetGoalState` to `mq3.botlib.ai_resource_pools.resetGoalState` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `pools`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot goal state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L150)

<a id="function-function-mq3-botlib-ai-goal-runtime-botsavegoalfuzzylogic-function-botsavegoalfuzzylogic-state-goalstate-filename-src-mq3-botlib-ai-goal-runtime-ml-1402426786"></a>
### botSaveGoalFuzzyLogic

```ml
function botSaveGoalFuzzyLogic(state, goalState, filename)
```

Forward `botSaveGoalFuzzyLogic` to `mq3.botlib.ai_goal_selection.saveGoalFuzzyLogic` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `selection`. |
| `goalState` | `dynamic` | — | Handle of the pooled bot goal state. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L116)

<a id="function-function-mq3-botlib-ai-goal-runtime-botsetavoidgoaltime-function-botsetavoidgoaltime-state-goalstate-number-avoidtime-src-mq3-botlib-ai-goal-runtime-ml-1883805314"></a>
### botSetAvoidGoalTime

```ml
function botSetAvoidGoalTime(state, goalState, number, avoidTime)
```

Apply `mq3.botlib.ai_item_weights.ensureItems` and `mq3.botlib.ai_goal_state.addToAvoidGoals` while evaluating `botSetAvoidGoalTime`. Return paths include `goals.addToAvoidGoals(state.goals,goalState,number,value)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `itemWeights`, `levelItems` and `goals`. |
| `goalState` | `dynamic` | — | Handle of the pooled bot goal state. |
| `number` | `dynamic` | — | Value used by `addToAvoidGoals` in `if value.avoidGoals[index]==number then value.avoidGoals[index]=number`. |
| `avoidTime` | `dynamic` | — | Value used by `botSetAvoidGoalTime` in `value=avoidTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L235)

<a id="function-function-mq3-botlib-ai-goal-runtime-botsetupgoalai-function-botsetupgoalai-state-itemconfigfile-gametype-droppedweight-src-mq3-botlib-ai-goal-runtime-ml-560802980"></a>
### botSetupGoalAI

```ml
function botSetupGoalAI(state, itemConfigFile, gameType, droppedWeight)
```

File-level setup/shutdown ----------------------------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `gameType`, `levelItems`, `selection` and `setup`. May update `state.gameType` and `state.setup` in place. |
| `itemConfigFile` | `dynamic` | — | Filename supplied to the configured loader or file service. |
| `gameType` | `dynamic` | — | Operand used to evaluate the returned expression `value`. |
| `droppedWeight` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.f32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L314)

<a id="function-function-mq3-botlib-ai-goal-runtime-botshutdowngoalai-function-botshutdowngoalai-state-src-mq3-botlib-ai-goal-runtime-ml-658239235"></a>
### botShutdownGoalAI

```ml
function botShutdownGoalAI(state)
```

Set `state.freeLevelItems` to `0` and `state.setup` to `false` in `mq3.botlib.ai_goal_runtime.botShutdownGoalAI`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `pools`, `levelItems`, `itemWeights`, `freeLevelItems` and `setup`. May update `state.freeLevelItems` and `state.setup` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L319)

<a id="function-function-mq3-botlib-ai-goal-runtime-bottouchinggoal-function-bottouchinggoal-origin-goal-src-mq3-botlib-ai-goal-runtime-ml-1052547411"></a>
### botTouchingGoal

```ml
function botTouchingGoal(origin, goal)
```

Forward `botTouchingGoal` to `mq3.botlib.ai_goal_state.touchingGoal` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `mins`, `origin` and `maxs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L269)

<a id="function-function-mq3-botlib-ai-goal-runtime-botupdateentityitems-function-botupdateentityitems-state-src-mq3-botlib-ai-goal-runtime-ml-2088427111"></a>
### botUpdateEntityItems

```ml
function botUpdateEntityItems(state)
```

Forward `botUpdateEntityItems` to `mq3.botlib.ai_level_items.update` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `levelItems`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L204)

<a id="function-function-mq3-botlib-ai-goal-runtime-create-function-create-context-readfn-timefn-logfn-printfn-services-src-mq3-botlib-ai-goal-runtime-ml-17998897"></a>
### create

```ml
function create(context, readFn, timeFn, logFn, printFn, services)
```

Build the `mq3.botlib.ai_goal_runtime.State` result for `create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Context forwarded to the configured host callbacks. |
| `readFn` | `dynamic` | — | Callback that loads a named resource through the supplied context. |
| `timeFn` | `dynamic` | — | Callback that supplies the current botlib time. |
| `logFn` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_goal_runtime.Host.logFn`. |
| `printFn` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_goal_runtime.Host.printFn`. |
| `services` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_goal_selection.Runtime.services`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L87)

<a id="function-function-mq3-botlib-ai-goal-runtime-freelevelitem-function-freelevelitem-state-item-src-mq3-botlib-ai-goal-runtime-ml-918385940"></a>
### freeLevelItem

```ml
function freeLevelItem(state, item)
```

Set `state.freeLevelItems` to `state.freeLevelItems+1` and `state.freeLevelItems` to `state.levelItems.maxLevelItems` in `mq3.botlib.ai_goal_runtime.freeLevelItem`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `freeLevelItems` and `levelItems`. May update `state.freeLevelItems` in place. |
| `item` | `dynamic` | — | Value used by `removeLevelItemFromList` in `for each candidate in state.levelItems.levelItems if not removed and candidate==item then removed=true else valu...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L172)

- [mq3.botlib.ai_goal_runtime.Host](Type-mq3-botlib-ai-goal-runtime-host-1286832985.md) — struct
<a id="function-function-mq3-botlib-ai-goal-runtime-hostlog-function-hostlog-host-text-src-mq3-botlib-ai-goal-runtime-ml-1365299861"></a>
### hostLog

```ml
function hostLog(host, text)
```

Use `host.logFn` to perform `hostLog`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Host service configuration; accesses `logFn` and `userContext`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L73)

<a id="function-function-mq3-botlib-ai-goal-runtime-hostname-function-hostname-host-number-src-mq3-botlib-ai-goal-runtime-ml-365823763"></a>
### hostName

```ml
function hostName(host, number)
```

Apply `mq3.botlib.ai_level_items.goalName` while evaluating `hostName`. Return paths include `levelItems.goalName(host.levelItems,number)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Host service configuration; accesses `levelItems`. |
| `number` | `dynamic` | — | Value used by `goalName` in `for each levelItem in state.levelItems if levelItem.number==number then return items[levelItem.itemInfo].name en...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L69)

<a id="function-function-mq3-botlib-ai-goal-runtime-hostprint-function-hostprint-host-level-text-src-mq3-botlib-ai-goal-runtime-ml-114716715"></a>
### hostPrint

```ml
function hostPrint(host, level, text)
```

Use `host.printFn` to perform `hostPrint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Host service configuration; accesses `printFn` and `userContext`. |
| `level` | `dynamic` | — | Value passed as argument 2 to `host.printFn`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L78)

<a id="function-function-mq3-botlib-ai-goal-runtime-hosttime-function-hosttime-host-src-mq3-botlib-ai-goal-runtime-ml-1736028560"></a>
### hostTime

```ml
function hostTime(host)
```

Use `host.timeFn` to perform `hostTime`. Return paths include `host.timeFn(host.userContext)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Host service configuration; accesses `timeFn` and `userContext`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L65)

<a id="function-function-mq3-botlib-ai-goal-runtime-initlevelitemheap-function-initlevelitemheap-state-capacity-src-mq3-botlib-ai-goal-runtime-ml-1928990205"></a>
### initLevelItemHeap

```ml
function initLevelItemHeap(state, capacity)
```

Level-item heap/list ownership -----------------------------------------

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `levelItems` and `freeLevelItems`. May update `state.levelItems.maxLevelItems`, `state.levelItems.levelItems` and `state.levelItems.numLevelItems` and additional fields in place. |
| `capacity` | `dynamic` | — | Maximum number of entries to allocate or retain. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L155)

<a id="function-function-mq3-botlib-ai-goal-runtime-itemweightindex-function-itemweightindex-weightconfig-itemconfig-src-mq3-botlib-ai-goal-runtime-ml-1614667733"></a>
### itemWeightIndex

```ml
function itemWeightIndex(weightConfig, itemConfig)
```

Forward `itemWeightIndex` to `mq3.botlib.ai_item_weights.itemWeightIndex` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `weightConfig` | `dynamic` | — | Configuration record; accesses `weights`. |
| `itemConfig` | `dynamic` | — | Value used by `itemWeightIndex` in `for each item in items result=result+[findWeight(config,item.classname)] end for`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L129)

<a id="function-function-mq3-botlib-ai-goal-runtime-loaditemconfig-function-loaditemconfig-state-filename-src-mq3-botlib-ai-goal-runtime-ml-1943599524"></a>
### loadItemConfig

```ml
function loadItemConfig(state, filename)
```

Set `state.itemWeights.items` to `value` in `mq3.botlib.ai_goal_runtime.loadItemConfig`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `itemWeights`. May update `state.itemWeights.items` in place. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L125)

<a id="function-function-mq3-botlib-ai-goal-runtime-removelevelitemfromlist-function-removelevelitemfromlist-state-item-src-mq3-botlib-ai-goal-runtime-ml-1601744100"></a>
### removeLevelItemFromList

```ml
function removeLevelItemFromList(state, item)
```

Set `state.levelItems.levelItems` to `values` in `mq3.botlib.ai_goal_runtime.removeLevelItemFromList`. Return paths include `removed`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI goal runtime state; accesses `levelItems`. May update `state.levelItems.levelItems` in place. |
| `item` | `dynamic` | — | Value used by `removeLevelItemFromList` in `for each candidate in state.levelItems.levelItems if not removed and candidate==item then removed=true else valu...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_runtime.ml#L166)

- [mq3.botlib.ai_goal_runtime.State](Type-mq3-botlib-ai-goal-runtime-state-423927872.md) — struct
