# `src/mq3/botlib/ai_goal_state.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_goal_state`](Package-mq3-botlib-ai-goal-state-210206662.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/ai_resource_pools.ml` as `goalResources` → [src/mq3/botlib/ai_resource_pools.ml](File-src-mq3-botlib-ai-resource-pools-ml-103445473.md)
- `mq3/compat/numeric.ml` as `goalNumeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-botlib-ai-goal-state-addtoavoidgoals-function-addtoavoidgoals-runtime-handle-number-avoidtime-src-mq3-botlib-ai-goal-state-ml-1721072319"></a>
### addToAvoidGoals

```ml
function addToAvoidGoals(runtime, handle, number, avoidTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |
| `avoidTime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L45)

<a id="function-function-mq3-botlib-ai-goal-state-avoidgoaltime-function-avoidgoaltime-runtime-handle-number-src-mq3-botlib-ai-goal-state-ml-1857923601"></a>
### avoidGoalTime

```ml
function avoidGoalTime(runtime, handle, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L62)

<a id="function-function-mq3-botlib-ai-goal-state-copygoal-function-copygoal-value-src-mq3-botlib-ai-goal-state-ml-1613439393"></a>
### copyGoal

```ml
function copyGoal(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L32)

<a id="function-function-mq3-botlib-ai-goal-state-copyvector-function-copyvector-value-src-mq3-botlib-ai-goal-state-ml-506848857"></a>
### copyVector

```ml
function copyVector(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L31)

<a id="function-function-mq3-botlib-ai-goal-state-create-function-create-pools-context-timefn-goalnamefn-logfn-printfn-src-mq3-botlib-ai-goal-state-ml-1208343904"></a>
### create

```ml
function create(pools, context, timeFn, goalNameFn, logFn, printFn)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |
| `timeFn` | `dynamic` | — |  |
| `goalNameFn` | `dynamic` | — |  |
| `logFn` | `dynamic` | — |  |
| `printFn` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L24)

<a id="function-function-mq3-botlib-ai-goal-state-currenttime-function-currenttime-runtime-src-mq3-botlib-ai-goal-state-ml-45084334"></a>
### currentTime

```ml
function currentTime(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L27)

<a id="function-function-mq3-botlib-ai-goal-state-dumpavoidgoals-function-dumpavoidgoals-runtime-handle-src-mq3-botlib-ai-goal-state-ml-1582883492"></a>
### dumpAvoidGoals

```ml
function dumpAvoidGoals(runtime, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L69)

<a id="function-function-mq3-botlib-ai-goal-state-dumpgoalstack-function-dumpgoalstack-runtime-handle-src-mq3-botlib-ai-goal-state-ml-1343778266"></a>
### dumpGoalStack

```ml
function dumpGoalStack(runtime, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L76)

<a id="function-function-mq3-botlib-ai-goal-state-emitlog-function-emitlog-runtime-text-src-mq3-botlib-ai-goal-state-ml-870779829"></a>
### emitLog

```ml
function emitLog(runtime, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L39)

<a id="function-function-mq3-botlib-ai-goal-state-emitprint-function-emitprint-runtime-level-text-src-mq3-botlib-ai-goal-state-ml-826752549"></a>
### emitPrint

```ml
function emitPrint(runtime, level, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `level` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L40)

<a id="function-function-mq3-botlib-ai-goal-state-emptygoalstack-function-emptygoalstack-runtime-handle-src-mq3-botlib-ai-goal-state-ml-2126859940"></a>
### emptyGoalStack

```ml
function emptyGoalStack(runtime, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L89)

<a id="function-function-mq3-botlib-ai-goal-state-goalname-function-goalname-runtime-number-src-mq3-botlib-ai-goal-state-ml-942512185"></a>
### goalName

```ml
function goalName(runtime, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L35)

<a id="constant-constant-mq3-botlib-ai-goal-state-op-avoid-goal-time-const-op-avoid-goal-time-540-src-mq3-botlib-ai-goal-state-ml-1206132830"></a>
### OP_AVOID_GOAL_TIME

```ml
const OP_AVOID_GOAL_TIME = 540
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L19)

<a id="constant-constant-mq3-botlib-ai-goal-state-op-dump-avoid-goals-const-op-dump-avoid-goals-530-src-mq3-botlib-ai-goal-state-ml-1574513537"></a>
### OP_DUMP_AVOID_GOALS

```ml
const OP_DUMP_AVOID_GOALS = 530
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L13)

<a id="constant-constant-mq3-botlib-ai-goal-state-op-dump-goal-stack-const-op-dump-goal-stack-531-src-mq3-botlib-ai-goal-state-ml-630399330"></a>
### OP_DUMP_GOAL_STACK

```ml
const OP_DUMP_GOAL_STACK = 531
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L14)

<a id="constant-constant-mq3-botlib-ai-goal-state-op-empty-goal-stack-const-op-empty-goal-stack-529-src-mq3-botlib-ai-goal-state-ml-1683896399"></a>
### OP_EMPTY_GOAL_STACK

```ml
const OP_EMPTY_GOAL_STACK = 529
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L12)

<a id="constant-constant-mq3-botlib-ai-goal-state-op-get-second-goal-const-op-get-second-goal-534-src-mq3-botlib-ai-goal-state-ml-559420705"></a>
### OP_GET_SECOND_GOAL

```ml
const OP_GET_SECOND_GOAL = 534
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L17)

<a id="constant-constant-mq3-botlib-ai-goal-state-op-get-top-goal-const-op-get-top-goal-533-src-mq3-botlib-ai-goal-state-ml-1754311472"></a>
### OP_GET_TOP_GOAL

```ml
const OP_GET_TOP_GOAL = 533
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L16)

<a id="constant-constant-mq3-botlib-ai-goal-state-op-goal-name-const-op-goal-name-532-src-mq3-botlib-ai-goal-state-ml-860463407"></a>
### OP_GOAL_NAME

```ml
const OP_GOAL_NAME = 532
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L15)

<a id="constant-constant-mq3-botlib-ai-goal-state-op-pop-goal-const-op-pop-goal-528-src-mq3-botlib-ai-goal-state-ml-155846388"></a>
### OP_POP_GOAL

```ml
const OP_POP_GOAL = 528
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L11)

<a id="constant-constant-mq3-botlib-ai-goal-state-op-push-goal-const-op-push-goal-527-src-mq3-botlib-ai-goal-state-ml-1633414459"></a>
### OP_PUSH_GOAL

```ml
const OP_PUSH_GOAL = 527
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L10)

<a id="constant-constant-mq3-botlib-ai-goal-state-op-reset-avoid-goals-const-op-reset-avoid-goals-526-src-mq3-botlib-ai-goal-state-ml-1731226012"></a>
### OP_RESET_AVOID_GOALS

```ml
const OP_RESET_AVOID_GOALS = 526
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L9)

<a id="constant-constant-mq3-botlib-ai-goal-state-op-touching-goal-const-op-touching-goal-537-src-mq3-botlib-ai-goal-state-ml-885223884"></a>
### OP_TOUCHING_GOAL

```ml
const OP_TOUCHING_GOAL = 537
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L18)

<a id="function-function-mq3-botlib-ai-goal-state-popgoal-function-popgoal-runtime-handle-src-mq3-botlib-ai-goal-state-ml-1422073864"></a>
### popGoal

```ml
function popGoal(runtime, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L86)

<a id="constant-constant-mq3-botlib-ai-goal-state-prt-error-const-prt-error-3-src-mq3-botlib-ai-goal-state-ml-669558928"></a>
### PRT_ERROR

```ml
const PRT_ERROR = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L20)

<a id="function-function-mq3-botlib-ai-goal-state-pushgoal-function-pushgoal-runtime-handle-goal-src-mq3-botlib-ai-goal-state-ml-691106377"></a>
### pushGoal

```ml
function pushGoal(runtime, handle, goal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L81)

<a id="function-function-mq3-botlib-ai-goal-state-removefromavoidgoals-function-removefromavoidgoals-runtime-handle-number-src-mq3-botlib-ai-goal-state-ml-1384743767"></a>
### removeFromAvoidGoals

```ml
function removeFromAvoidGoals(runtime, handle, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L55)

<a id="function-function-mq3-botlib-ai-goal-state-resetavoidgoals-function-resetavoidgoals-runtime-handle-src-mq3-botlib-ai-goal-state-ml-339935000"></a>
### resetAvoidGoals

```ml
function resetAvoidGoals(runtime, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L42)

- [mq3.botlib.ai_goal_state.Runtime](Type-mq3-botlib-ai-goal-state-runtime-1899549260.md) — struct
<a id="function-function-mq3-botlib-ai-goal-state-secondgoal-function-secondgoal-runtime-handle-src-mq3-botlib-ai-goal-state-ml-1484744600"></a>
### secondGoal

```ml
function secondGoal(runtime, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L95)

<a id="function-function-mq3-botlib-ai-goal-state-supportstrap-function-supportstrap-op-src-mq3-botlib-ai-goal-state-ml-1467280807"></a>
### supportsTrap

```ml
function supportsTrap(op)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `op` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L108)

<a id="function-function-mq3-botlib-ai-goal-state-topgoal-function-topgoal-runtime-handle-src-mq3-botlib-ai-goal-state-ml-764598968"></a>
### topGoal

```ml
function topGoal(runtime, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L92)

<a id="function-function-mq3-botlib-ai-goal-state-touchinggoal-function-touchinggoal-origin-goal-src-mq3-botlib-ai-goal-state-ml-133068521"></a>
### touchingGoal

```ml
function touchingGoal(origin, goal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state.ml#L99)
