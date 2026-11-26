# `src/mq3/botlib/ai_resource_pools.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_resource_pools`](Package-mq3-botlib-ai-resource-pools-786406283.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/public_headers.ml` as `publicHeaders` → [src/mq3/botlib/public_headers.ml](File-src-mq3-botlib-public-headers-ml-206085358.md)

## Declarations

<a id="function-function-mq3-botlib-ai-resource-pools-allocchatstate-function-allocchatstate-pools-src-mq3-botlib-ai-resource-pools-ml-482299777"></a>
### allocChatState

```ml
function allocChatState(pools)
```

Set `pools.chatStates[handle]` to `emptyChatState()` in `mq3.botlib.ai_resource_pools.allocChatState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — | Bot resource pools; accesses `chatStates`. May update `pools.chatStates[handle]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L235)

<a id="function-function-mq3-botlib-ai-resource-pools-allocgoalstate-function-allocgoalstate-pools-client-src-mq3-botlib-ai-resource-pools-ml-1290871704"></a>
### allocGoalState

```ml
function allocGoalState(pools, client)
```

Set `pools.goalStates[handle]` to `emptyGoalState(client)` in `mq3.botlib.ai_resource_pools.allocGoalState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — | Bot resource pools; accesses `goalStates`. May update `pools.goalStates[handle]` in place. |
| `client` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_resource_pools.GoalState.client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L251)

<a id="function-function-mq3-botlib-ai-resource-pools-allocmovestate-function-allocmovestate-pools-src-mq3-botlib-ai-resource-pools-ml-1079154405"></a>
### allocMoveState

```ml
function allocMoveState(pools)
```

Set `pools.moveStates[handle]` to `emptyMoveState()` in `mq3.botlib.ai_resource_pools.allocMoveState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — | Bot resource pools; accesses `moveStates`. May update `pools.moveStates[handle]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L279)

<a id="function-function-mq3-botlib-ai-resource-pools-allocweaponstate-function-allocweaponstate-pools-src-mq3-botlib-ai-resource-pools-ml-1551054629"></a>
### allocWeaponState

```ml
function allocWeaponState(pools)
```

Set `pools.weaponStates[handle]` to `emptyWeaponState()` in `mq3.botlib.ai_resource_pools.allocWeaponState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — | Bot resource pools; accesses `weaponStates`. May update `pools.weaponStates[handle]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L310)

- [mq3.botlib.ai_resource_pools.AvoidSpot](Type-mq3-botlib-ai-resource-pools-avoidspot-27978860.md) — struct
<a id="function-function-mq3-botlib-ai-resource-pools-chatstate-function-chatstate-pools-handle-src-mq3-botlib-ai-resource-pools-ml-517119781"></a>
### chatState

```ml
function chatState(pools, handle)
```

Apply `mq3.botlib.ai_resource_pools.validHandle` while evaluating `chatState`. Return paths include `pools.chatStates[handle]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — | Bot resource pools; accesses `chatStates`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot chat state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L219)

- [mq3.botlib.ai_resource_pools.ChatState](Type-mq3-botlib-ai-resource-pools-chatstate-780359634.md) — struct
<a id="function-function-mq3-botlib-ai-resource-pools-create-function-create-src-mq3-botlib-ai-resource-pools-ml-792696950"></a>
### create

```ml
function create()
```

Create a `mq3.botlib.ai_resource_pools.Pools` record, initializing `chatStates` as `array(MAX_CLIENTS+1,void)`, `goalStates` as `array(MAX_CLIENTS+1,void)` and `moveStates` as `array(MAX_CLIENTS+1,void)`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L212)

<a id="function-function-mq3-botlib-ai-resource-pools-emptyavoidspots-function-emptyavoidspots-src-mq3-botlib-ai-resource-pools-ml-1169647424"></a>
### emptyAvoidSpots

```ml
function emptyAvoidSpots()
```

Apply `mq3.botlib.ai_resource_pools.vec3` while evaluating `emptyAvoidSpots`. Return paths include `values`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L200)

<a id="function-function-mq3-botlib-ai-resource-pools-emptychatstate-function-emptychatstate-src-mq3-botlib-ai-resource-pools-ml-973927446"></a>
### emptyChatState

```ml
function emptyChatState()
```

Create a `mq3.botlib.ai_resource_pools.ChatState` record with the declared empty defaults.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L202)

<a id="function-function-mq3-botlib-ai-resource-pools-emptygoal-function-emptygoal-src-mq3-botlib-ai-resource-pools-ml-55876610"></a>
### emptyGoal

```ml
function emptyGoal()
```

Create a `mq3.botlib.ai_resource_pools.Goal` record, initializing `origin` as `vec3()`, `mins` as `vec3()` and `maxs` as `vec3()`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L196)

<a id="function-function-mq3-botlib-ai-resource-pools-emptygoalstack-function-emptygoalstack-src-mq3-botlib-ai-resource-pools-ml-1777313026"></a>
### emptyGoalStack

```ml
function emptyGoalStack()
```

Apply `mq3.botlib.ai_resource_pools.emptyGoal` while evaluating `emptyGoalStack`. Return paths include `values`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L198)

<a id="function-function-mq3-botlib-ai-resource-pools-emptygoalstate-function-emptygoalstate-client-src-mq3-botlib-ai-resource-pools-ml-115286735"></a>
### emptyGoalState

```ml
function emptyGoalState(client)
```

Create a `mq3.botlib.ai_resource_pools.GoalState` record, initializing `client` from `client`, `goalStack` as `emptyGoalStack()` and `avoidGoals` as `zeros(MAX_AVOIDGOALS)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_resource_pools.GoalState.client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L205)

<a id="function-function-mq3-botlib-ai-resource-pools-emptymovestate-function-emptymovestate-src-mq3-botlib-ai-resource-pools-ml-413609558"></a>
### emptyMoveState

```ml
function emptyMoveState()
```

Create a `mq3.botlib.ai_resource_pools.MoveState` record, initializing `origin` as `vec3()`, `velocity` as `vec3()` and `viewOffset` as `vec3()`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L207)

<a id="function-function-mq3-botlib-ai-resource-pools-emptyweaponstate-function-emptyweaponstate-src-mq3-botlib-ai-resource-pools-ml-711518682"></a>
### emptyWeaponState

```ml
function emptyWeaponState()
```

Create a `mq3.botlib.ai_resource_pools.WeaponState` record with the declared empty defaults.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L209)

<a id="function-function-mq3-botlib-ai-resource-pools-floatzeros-function-floatzeros-count-src-mq3-botlib-ai-resource-pools-ml-1797316185"></a>
### floatZeros

```ml
function floatZeros(count)
```

Allocate a floating-point array of the requested length initialized to zero.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `count` | `dynamic` | — | Number of entries or bytes processed by this call. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L192)

<a id="function-function-mq3-botlib-ai-resource-pools-freechatstate-function-freechatstate-pools-handle-src-mq3-botlib-ai-resource-pools-ml-486864885"></a>
### freeChatState

```ml
function freeChatState(pools, handle)
```

Set `pools.chatStates[handle]` to `void` in `mq3.botlib.ai_resource_pools.freeChatState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — | Bot resource pools; accesses `chatStates`. May update `pools.chatStates[handle]` in place. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot chat state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L242)

<a id="function-function-mq3-botlib-ai-resource-pools-freegoalstate-function-freegoalstate-pools-handle-src-mq3-botlib-ai-resource-pools-ml-851389227"></a>
### freeGoalState

```ml
function freeGoalState(pools, handle)
```

Set `pools.goalStates[handle]` to `void` in `mq3.botlib.ai_resource_pools.freeGoalState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — | Bot resource pools; accesses `goalStates`. May update `pools.goalStates[handle]` in place. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot goal state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L272)

<a id="function-function-mq3-botlib-ai-resource-pools-freemovestate-function-freemovestate-pools-handle-src-mq3-botlib-ai-resource-pools-ml-2123024679"></a>
### freeMoveState

```ml
function freeMoveState(pools, handle)
```

Set `pools.moveStates[handle]` to `void` in `mq3.botlib.ai_resource_pools.freeMoveState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — | Bot resource pools; accesses `moveStates`. May update `pools.moveStates[handle]` in place. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot movement state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L306)

<a id="function-function-mq3-botlib-ai-resource-pools-freeweaponstate-function-freeweaponstate-pools-handle-src-mq3-botlib-ai-resource-pools-ml-727749589"></a>
### freeWeaponState

```ml
function freeWeaponState(pools, handle)
```

Set `pools.weaponStates[handle]` to `void` in `mq3.botlib.ai_resource_pools.freeWeaponState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — | Bot resource pools; accesses `weaponStates`. May update `pools.weaponStates[handle]` in place. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot weapon state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L322)

- [mq3.botlib.ai_resource_pools.Goal](Type-mq3-botlib-ai-resource-pools-goal-310128640.md) — struct
<a id="function-function-mq3-botlib-ai-resource-pools-goalstate-function-goalstate-pools-handle-src-mq3-botlib-ai-resource-pools-ml-1752130007"></a>
### goalState

```ml
function goalState(pools, handle)
```

Apply `mq3.botlib.ai_resource_pools.validHandle` while evaluating `goalState`. Return paths include `pools.goalStates[handle]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — | Bot resource pools; accesses `goalStates`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot goal state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L223)

- [mq3.botlib.ai_resource_pools.GoalState](Type-mq3-botlib-ai-resource-pools-goalstate-1303085237.md) — struct
<a id="constant-constant-mq3-botlib-ai-resource-pools-max-avoidgoals-const-max-avoidgoals-publicheaders-max-avoidgoals-src-mq3-botlib-ai-resource-pools-ml-1362883218"></a>
### MAX_AVOIDGOALS

```ml
const MAX_AVOIDGOALS = publicHeaders.MAX_AVOIDGOALS
```

Maximum number of temporarily avoided goal identifiers retained per bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L12)

<a id="constant-constant-mq3-botlib-ai-resource-pools-max-avoidreach-const-max-avoidreach-publicheaders-max-avoidreach-src-mq3-botlib-ai-resource-pools-ml-356313051"></a>
### MAX_AVOIDREACH

```ml
const MAX_AVOIDREACH = publicHeaders.MAX_AVOIDREACH
```

Maximum number of temporarily avoided reachabilities retained per bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L14)

<a id="constant-constant-mq3-botlib-ai-resource-pools-max-avoidspots-const-max-avoidspots-publicheaders-max-avoidspots-src-mq3-botlib-ai-resource-pools-ml-2014047645"></a>
### MAX_AVOIDSPOTS

```ml
const MAX_AVOIDSPOTS = publicHeaders.MAX_AVOIDSPOTS
```

Maximum number of spatial avoidance spots retained per bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L16)

<a id="constant-constant-mq3-botlib-ai-resource-pools-max-clients-const-max-clients-64-src-mq3-botlib-ai-resource-pools-ml-660578747"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```

Maximum number of client slots supported by these interfaces.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L8)

<a id="constant-constant-mq3-botlib-ai-resource-pools-max-goalstack-const-max-goalstack-publicheaders-max-goalstack-src-mq3-botlib-ai-resource-pools-ml-822325048"></a>
### MAX_GOALSTACK

```ml
const MAX_GOALSTACK = publicHeaders.MAX_GOALSTACK
```

Maximum number of goals stored on one bot goal stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L10)

<a id="function-function-mq3-botlib-ai-resource-pools-movestate-function-movestate-pools-handle-src-mq3-botlib-ai-resource-pools-ml-566048371"></a>
### moveState

```ml
function moveState(pools, handle)
```

Apply `mq3.botlib.ai_resource_pools.validHandle` while evaluating `moveState`. Return paths include `pools.moveStates[handle]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — | Bot resource pools; accesses `moveStates`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot movement state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L227)

- [mq3.botlib.ai_resource_pools.MoveState](Type-mq3-botlib-ai-resource-pools-movestate-1263083947.md) — struct
<a id="constant-constant-mq3-botlib-ai-resource-pools-op-alloc-chat-state-const-op-alloc-chat-state-507-src-mq3-botlib-ai-resource-pools-ml-591062549"></a>
### OP_ALLOC_CHAT_STATE

```ml
const OP_ALLOC_CHAT_STATE = 507
```

Bot-library syscall identifier for alloc chat state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L19)

<a id="constant-constant-mq3-botlib-ai-resource-pools-op-alloc-goal-state-const-op-alloc-goal-state-546-src-mq3-botlib-ai-resource-pools-ml-1808887674"></a>
### OP_ALLOC_GOAL_STATE

```ml
const OP_ALLOC_GOAL_STATE = 546
```

Bot-library syscall identifier for alloc goal state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L25)

<a id="constant-constant-mq3-botlib-ai-resource-pools-op-alloc-move-state-const-op-alloc-move-state-555-src-mq3-botlib-ai-resource-pools-ml-1108285134"></a>
### OP_ALLOC_MOVE_STATE

```ml
const OP_ALLOC_MOVE_STATE = 555
```

Bot-library syscall identifier for alloc move state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L35)

<a id="constant-constant-mq3-botlib-ai-resource-pools-op-alloc-weapon-state-const-op-alloc-weapon-state-561-src-mq3-botlib-ai-resource-pools-ml-877786145"></a>
### OP_ALLOC_WEAPON_STATE

```ml
const OP_ALLOC_WEAPON_STATE = 561
```

Bot-library syscall identifier for alloc weapon state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L39)

<a id="constant-constant-mq3-botlib-ai-resource-pools-op-free-chat-state-const-op-free-chat-state-508-src-mq3-botlib-ai-resource-pools-ml-1889037448"></a>
### OP_FREE_CHAT_STATE

```ml
const OP_FREE_CHAT_STATE = 508
```

Bot-library syscall identifier for free chat state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L21)

<a id="constant-constant-mq3-botlib-ai-resource-pools-op-free-goal-state-const-op-free-goal-state-547-src-mq3-botlib-ai-resource-pools-ml-1793811527"></a>
### OP_FREE_GOAL_STATE

```ml
const OP_FREE_GOAL_STATE = 547
```

Bot-library syscall identifier for free goal state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L27)

<a id="constant-constant-mq3-botlib-ai-resource-pools-op-free-move-state-const-op-free-move-state-556-src-mq3-botlib-ai-resource-pools-ml-406303485"></a>
### OP_FREE_MOVE_STATE

```ml
const OP_FREE_MOVE_STATE = 556
```

Bot-library syscall identifier for free move state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L37)

<a id="constant-constant-mq3-botlib-ai-resource-pools-op-free-weapon-state-const-op-free-weapon-state-562-src-mq3-botlib-ai-resource-pools-ml-311883484"></a>
### OP_FREE_WEAPON_STATE

```ml
const OP_FREE_WEAPON_STATE = 562
```

Bot-library syscall identifier for free weapon state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L41)

<a id="constant-constant-mq3-botlib-ai-resource-pools-op-reset-avoid-reach-const-op-reset-avoid-reach-551-src-mq3-botlib-ai-resource-pools-ml-440238846"></a>
### OP_RESET_AVOID_REACH

```ml
const OP_RESET_AVOID_REACH = 551
```

Bot-library syscall identifier for reset avoid reach.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L31)

<a id="constant-constant-mq3-botlib-ai-resource-pools-op-reset-goal-state-const-op-reset-goal-state-525-src-mq3-botlib-ai-resource-pools-ml-301126373"></a>
### OP_RESET_GOAL_STATE

```ml
const OP_RESET_GOAL_STATE = 525
```

Bot-library syscall identifier for reset goal state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L23)

<a id="constant-constant-mq3-botlib-ai-resource-pools-op-reset-last-avoid-reach-const-op-reset-last-avoid-reach-552-src-mq3-botlib-ai-resource-pools-ml-1758160255"></a>
### OP_RESET_LAST_AVOID_REACH

```ml
const OP_RESET_LAST_AVOID_REACH = 552
```

Bot-library syscall identifier for reset last avoid reach.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L33)

<a id="constant-constant-mq3-botlib-ai-resource-pools-op-reset-move-state-const-op-reset-move-state-548-src-mq3-botlib-ai-resource-pools-ml-1012671944"></a>
### OP_RESET_MOVE_STATE

```ml
const OP_RESET_MOVE_STATE = 548
```

Bot-library syscall identifier for reset move state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L29)

<a id="constant-constant-mq3-botlib-ai-resource-pools-op-reset-weapon-state-const-op-reset-weapon-state-563-src-mq3-botlib-ai-resource-pools-ml-628509923"></a>
### OP_RESET_WEAPON_STATE

```ml
const OP_RESET_WEAPON_STATE = 563
```

Bot-library syscall identifier for reset weapon state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L43)

- [mq3.botlib.ai_resource_pools.Pools](Type-mq3-botlib-ai-resource-pools-pools-1320277810.md) — struct
<a id="function-function-mq3-botlib-ai-resource-pools-resetavoidgoalsstate-function-resetavoidgoalsstate-value-src-mq3-botlib-ai-resource-pools-ml-948404603"></a>
### resetAvoidGoalsState

```ml
function resetAvoidGoalsState(value)
```

Set `value.avoidGoals` to `zeros(MAX_AVOIDGOALS)` and `value.avoidGoalTimes` to `floatZeros(MAX_AVOIDGOALS)` in `mq3.botlib.ai_resource_pools.resetAvoidGoalsState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `avoidGoals` and `avoidGoalTimes`. May update `value.avoidGoals` and `value.avoidGoalTimes` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L257)

<a id="function-function-mq3-botlib-ai-resource-pools-resetavoidreach-function-resetavoidreach-pools-handle-src-mq3-botlib-ai-resource-pools-ml-1486354557"></a>
### resetAvoidReach

```ml
function resetAvoidReach(pools, handle)
```

Apply `mq3.botlib.ai_resource_pools.moveState`, `mq3.botlib.ai_resource_pools.zeros` and `mq3.botlib.ai_resource_pools.floatZeros` while evaluating `resetAvoidReach`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — | Bot resource pools; accesses `moveStates`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot movement state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L286)

<a id="function-function-mq3-botlib-ai-resource-pools-resetgoalstate-function-resetgoalstate-pools-handle-src-mq3-botlib-ai-resource-pools-ml-2107291323"></a>
### resetGoalState

```ml
function resetGoalState(pools, handle)
```

Apply `mq3.botlib.ai_resource_pools.goalState`, `mq3.botlib.ai_resource_pools.emptyGoalStack` and `mq3.botlib.ai_resource_pools.resetAvoidGoalsState` while evaluating `resetGoalState`. Return paths include `resetAvoidGoalsState(value)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — | Bot resource pools; accesses `goalStates`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot goal state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L264)

<a id="function-function-mq3-botlib-ai-resource-pools-resetlastavoidreach-function-resetlastavoidreach-pools-handle-src-mq3-botlib-ai-resource-pools-ml-1028001345"></a>
### resetLastAvoidReach

```ml
function resetLastAvoidReach(pools, handle)
```

Apply `mq3.botlib.ai_resource_pools.moveState` while evaluating `resetLastAvoidReach`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — | Bot resource pools; accesses `moveStates`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot movement state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L293)

<a id="function-function-mq3-botlib-ai-resource-pools-resetmovestate-function-resetmovestate-pools-handle-src-mq3-botlib-ai-resource-pools-ml-1070108015"></a>
### resetMoveState

```ml
function resetMoveState(pools, handle)
```

Set `pools.moveStates[handle]` to `emptyMoveState()` in `mq3.botlib.ai_resource_pools.resetMoveState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — | Bot resource pools; accesses `moveStates`. May update `pools.moveStates[handle]` in place. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot movement state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L302)

<a id="function-function-mq3-botlib-ai-resource-pools-resetweaponstate-function-resetweaponstate-pools-handle-src-mq3-botlib-ai-resource-pools-ml-1836349115"></a>
### resetWeaponState

```ml
function resetWeaponState(pools, handle)
```

The released BotResetWeaponState has its memset commented out and restores both existing pointers, so it intentionally leaves the complete state intact.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — | Bot resource pools; accesses `weaponStates`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot weapon state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L318)

<a id="function-function-mq3-botlib-ai-resource-pools-shutdown-function-shutdown-pools-src-mq3-botlib-ai-resource-pools-ml-420636133"></a>
### shutdown

```ml
function shutdown(pools)
```

Apply `mq3.botlib.ai_resource_pools.freeChatState`, `mq3.botlib.ai_resource_pools.freeGoalState` and `mq3.botlib.ai_resource_pools.freeMoveState` while evaluating `shutdown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — | Bot resource pools; accesses `chatStates`, `goalStates`, `moveStates` and `weaponStates`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L329)

<a id="function-function-mq3-botlib-ai-resource-pools-supportstrap-function-supportstrap-op-src-mq3-botlib-ai-resource-pools-ml-186023203"></a>
### supportsTrap

```ml
function supportsTrap(op)
```

Test `op==OP_ALLOC_CHAT_STATE or op==OP_FREE_CHAT_STATE or op==OP_RESET_GOAL_STATE or op==OP_ALLOC_GOAL_STATE or op==OP_FREE_GOAL_STATE or op==OP_RESET_M...` as the condition for `supportsTrap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `op` | `dynamic` | — | Numeric syscall operation identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L47)

<a id="function-function-mq3-botlib-ai-resource-pools-validhandle-function-validhandle-handle-src-mq3-botlib-ai-resource-pools-ml-267978120"></a>
### validHandle

```ml
function validHandle(handle)
```

Test `handle>0 and handle<=MAX_CLIENTS` as the condition for `validHandle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — | Resource handle resolved by the owning pool or host service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L215)

<a id="function-function-mq3-botlib-ai-resource-pools-vec3-function-vec3-src-mq3-botlib-ai-resource-pools-ml-2103905062"></a>
### vec3

```ml
function vec3()
```

Return a new array `[0.0,0.0,0.0]` for `vec3`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L194)

<a id="function-function-mq3-botlib-ai-resource-pools-weaponstate-function-weaponstate-pools-handle-src-mq3-botlib-ai-resource-pools-ml-1373755461"></a>
### weaponState

```ml
function weaponState(pools, handle)
```

Apply `mq3.botlib.ai_resource_pools.validHandle` while evaluating `weaponState`. Return paths include `pools.weaponStates[handle]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — | Bot resource pools; accesses `weaponStates`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot weapon state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L231)

- [mq3.botlib.ai_resource_pools.WeaponState](Type-mq3-botlib-ai-resource-pools-weaponstate-1198640016.md) — struct
<a id="function-function-mq3-botlib-ai-resource-pools-zeros-function-zeros-count-src-mq3-botlib-ai-resource-pools-ml-1377276831"></a>
### zeros

```ml
function zeros(count)
```

Allocate an integer array of the requested length initialized to zero.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `count` | `dynamic` | — | Number of entries or bytes processed by this call. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L189)
