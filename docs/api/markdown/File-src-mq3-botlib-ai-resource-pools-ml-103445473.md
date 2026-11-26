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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L57)

<a id="function-function-mq3-botlib-ai-resource-pools-allocgoalstate-function-allocgoalstate-pools-client-src-mq3-botlib-ai-resource-pools-ml-1290871704"></a>
### allocGoalState

```ml
function allocGoalState(pools, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L67)

<a id="function-function-mq3-botlib-ai-resource-pools-allocmovestate-function-allocmovestate-pools-src-mq3-botlib-ai-resource-pools-ml-1079154405"></a>
### allocMoveState

```ml
function allocMoveState(pools)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L85)

<a id="function-function-mq3-botlib-ai-resource-pools-allocweaponstate-function-allocweaponstate-pools-src-mq3-botlib-ai-resource-pools-ml-1551054629"></a>
### allocWeaponState

```ml
function allocWeaponState(pools)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L102)

- [mq3.botlib.ai_resource_pools.AvoidSpot](Type-mq3-botlib-ai-resource-pools-avoidspot-27978860.md) — struct
<a id="function-function-mq3-botlib-ai-resource-pools-chatstate-function-chatstate-pools-handle-src-mq3-botlib-ai-resource-pools-ml-517119781"></a>
### chatState

```ml
function chatState(pools, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L52)

- [mq3.botlib.ai_resource_pools.ChatState](Type-mq3-botlib-ai-resource-pools-chatstate-780359634.md) — struct
<a id="function-function-mq3-botlib-ai-resource-pools-create-function-create-src-mq3-botlib-ai-resource-pools-ml-792696950"></a>
### create

```ml
function create()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L50)

<a id="function-function-mq3-botlib-ai-resource-pools-emptyavoidspots-function-emptyavoidspots-src-mq3-botlib-ai-resource-pools-ml-1169647424"></a>
### emptyAvoidSpots

```ml
function emptyAvoidSpots()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L44)

<a id="function-function-mq3-botlib-ai-resource-pools-emptychatstate-function-emptychatstate-src-mq3-botlib-ai-resource-pools-ml-973927446"></a>
### emptyChatState

```ml
function emptyChatState()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L45)

<a id="function-function-mq3-botlib-ai-resource-pools-emptygoal-function-emptygoal-src-mq3-botlib-ai-resource-pools-ml-55876610"></a>
### emptyGoal

```ml
function emptyGoal()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L42)

<a id="function-function-mq3-botlib-ai-resource-pools-emptygoalstack-function-emptygoalstack-src-mq3-botlib-ai-resource-pools-ml-1777313026"></a>
### emptyGoalStack

```ml
function emptyGoalStack()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L43)

<a id="function-function-mq3-botlib-ai-resource-pools-emptygoalstate-function-emptygoalstate-client-src-mq3-botlib-ai-resource-pools-ml-115286735"></a>
### emptyGoalState

```ml
function emptyGoalState(client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L46)

<a id="function-function-mq3-botlib-ai-resource-pools-emptymovestate-function-emptymovestate-src-mq3-botlib-ai-resource-pools-ml-413609558"></a>
### emptyMoveState

```ml
function emptyMoveState()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L47)

<a id="function-function-mq3-botlib-ai-resource-pools-emptyweaponstate-function-emptyweaponstate-src-mq3-botlib-ai-resource-pools-ml-711518682"></a>
### emptyWeaponState

```ml
function emptyWeaponState()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L48)

<a id="function-function-mq3-botlib-ai-resource-pools-floatzeros-function-floatzeros-count-src-mq3-botlib-ai-resource-pools-ml-1797316185"></a>
### floatZeros

```ml
function floatZeros(count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `count` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L40)

<a id="function-function-mq3-botlib-ai-resource-pools-freechatstate-function-freechatstate-pools-handle-src-mq3-botlib-ai-resource-pools-ml-486864885"></a>
### freeChatState

```ml
function freeChatState(pools, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L61)

<a id="function-function-mq3-botlib-ai-resource-pools-freegoalstate-function-freegoalstate-pools-handle-src-mq3-botlib-ai-resource-pools-ml-851389227"></a>
### freeGoalState

```ml
function freeGoalState(pools, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L80)

<a id="function-function-mq3-botlib-ai-resource-pools-freemovestate-function-freemovestate-pools-handle-src-mq3-botlib-ai-resource-pools-ml-2123024679"></a>
### freeMoveState

```ml
function freeMoveState(pools, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L100)

<a id="function-function-mq3-botlib-ai-resource-pools-freeweaponstate-function-freeweaponstate-pools-handle-src-mq3-botlib-ai-resource-pools-ml-727749589"></a>
### freeWeaponState

```ml
function freeWeaponState(pools, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L109)

- [mq3.botlib.ai_resource_pools.Goal](Type-mq3-botlib-ai-resource-pools-goal-310128640.md) — struct
<a id="function-function-mq3-botlib-ai-resource-pools-goalstate-function-goalstate-pools-handle-src-mq3-botlib-ai-resource-pools-ml-1752130007"></a>
### goalState

```ml
function goalState(pools, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L53)

- [mq3.botlib.ai_resource_pools.GoalState](Type-mq3-botlib-ai-resource-pools-goalstate-1303085237.md) — struct
<a id="constant-constant-mq3-botlib-ai-resource-pools-max-avoidgoals-const-max-avoidgoals-publicheaders-max-avoidgoals-src-mq3-botlib-ai-resource-pools-ml-1362883218"></a>
### MAX_AVOIDGOALS

```ml
const MAX_AVOIDGOALS = publicHeaders.MAX_AVOIDGOALS
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L9)

<a id="constant-constant-mq3-botlib-ai-resource-pools-max-avoidreach-const-max-avoidreach-publicheaders-max-avoidreach-src-mq3-botlib-ai-resource-pools-ml-356313051"></a>
### MAX_AVOIDREACH

```ml
const MAX_AVOIDREACH = publicHeaders.MAX_AVOIDREACH
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L10)

<a id="constant-constant-mq3-botlib-ai-resource-pools-max-avoidspots-const-max-avoidspots-publicheaders-max-avoidspots-src-mq3-botlib-ai-resource-pools-ml-2014047645"></a>
### MAX_AVOIDSPOTS

```ml
const MAX_AVOIDSPOTS = publicHeaders.MAX_AVOIDSPOTS
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L11)

<a id="constant-constant-mq3-botlib-ai-resource-pools-max-clients-const-max-clients-64-src-mq3-botlib-ai-resource-pools-ml-660578747"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L7)

<a id="constant-constant-mq3-botlib-ai-resource-pools-max-goalstack-const-max-goalstack-publicheaders-max-goalstack-src-mq3-botlib-ai-resource-pools-ml-822325048"></a>
### MAX_GOALSTACK

```ml
const MAX_GOALSTACK = publicHeaders.MAX_GOALSTACK
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L8)

<a id="function-function-mq3-botlib-ai-resource-pools-movestate-function-movestate-pools-handle-src-mq3-botlib-ai-resource-pools-ml-566048371"></a>
### moveState

```ml
function moveState(pools, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L54)

- [mq3.botlib.ai_resource_pools.MoveState](Type-mq3-botlib-ai-resource-pools-movestate-1263083947.md) — struct
<a id="constant-constant-mq3-botlib-ai-resource-pools-op-alloc-chat-state-const-op-alloc-chat-state-507-src-mq3-botlib-ai-resource-pools-ml-591062549"></a>
### OP_ALLOC_CHAT_STATE

```ml
const OP_ALLOC_CHAT_STATE = 507
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L13)

<a id="constant-constant-mq3-botlib-ai-resource-pools-op-alloc-goal-state-const-op-alloc-goal-state-546-src-mq3-botlib-ai-resource-pools-ml-1808887674"></a>
### OP_ALLOC_GOAL_STATE

```ml
const OP_ALLOC_GOAL_STATE = 546
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L16)

<a id="constant-constant-mq3-botlib-ai-resource-pools-op-alloc-move-state-const-op-alloc-move-state-555-src-mq3-botlib-ai-resource-pools-ml-1108285134"></a>
### OP_ALLOC_MOVE_STATE

```ml
const OP_ALLOC_MOVE_STATE = 555
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L21)

<a id="constant-constant-mq3-botlib-ai-resource-pools-op-alloc-weapon-state-const-op-alloc-weapon-state-561-src-mq3-botlib-ai-resource-pools-ml-877786145"></a>
### OP_ALLOC_WEAPON_STATE

```ml
const OP_ALLOC_WEAPON_STATE = 561
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L23)

<a id="constant-constant-mq3-botlib-ai-resource-pools-op-free-chat-state-const-op-free-chat-state-508-src-mq3-botlib-ai-resource-pools-ml-1889037448"></a>
### OP_FREE_CHAT_STATE

```ml
const OP_FREE_CHAT_STATE = 508
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L14)

<a id="constant-constant-mq3-botlib-ai-resource-pools-op-free-goal-state-const-op-free-goal-state-547-src-mq3-botlib-ai-resource-pools-ml-1793811527"></a>
### OP_FREE_GOAL_STATE

```ml
const OP_FREE_GOAL_STATE = 547
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L17)

<a id="constant-constant-mq3-botlib-ai-resource-pools-op-free-move-state-const-op-free-move-state-556-src-mq3-botlib-ai-resource-pools-ml-406303485"></a>
### OP_FREE_MOVE_STATE

```ml
const OP_FREE_MOVE_STATE = 556
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L22)

<a id="constant-constant-mq3-botlib-ai-resource-pools-op-free-weapon-state-const-op-free-weapon-state-562-src-mq3-botlib-ai-resource-pools-ml-311883484"></a>
### OP_FREE_WEAPON_STATE

```ml
const OP_FREE_WEAPON_STATE = 562
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L24)

<a id="constant-constant-mq3-botlib-ai-resource-pools-op-reset-avoid-reach-const-op-reset-avoid-reach-551-src-mq3-botlib-ai-resource-pools-ml-440238846"></a>
### OP_RESET_AVOID_REACH

```ml
const OP_RESET_AVOID_REACH = 551
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L19)

<a id="constant-constant-mq3-botlib-ai-resource-pools-op-reset-goal-state-const-op-reset-goal-state-525-src-mq3-botlib-ai-resource-pools-ml-301126373"></a>
### OP_RESET_GOAL_STATE

```ml
const OP_RESET_GOAL_STATE = 525
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L15)

<a id="constant-constant-mq3-botlib-ai-resource-pools-op-reset-last-avoid-reach-const-op-reset-last-avoid-reach-552-src-mq3-botlib-ai-resource-pools-ml-1758160255"></a>
### OP_RESET_LAST_AVOID_REACH

```ml
const OP_RESET_LAST_AVOID_REACH = 552
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L20)

<a id="constant-constant-mq3-botlib-ai-resource-pools-op-reset-move-state-const-op-reset-move-state-548-src-mq3-botlib-ai-resource-pools-ml-1012671944"></a>
### OP_RESET_MOVE_STATE

```ml
const OP_RESET_MOVE_STATE = 548
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L18)

<a id="constant-constant-mq3-botlib-ai-resource-pools-op-reset-weapon-state-const-op-reset-weapon-state-563-src-mq3-botlib-ai-resource-pools-ml-628509923"></a>
### OP_RESET_WEAPON_STATE

```ml
const OP_RESET_WEAPON_STATE = 563
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L25)

- [mq3.botlib.ai_resource_pools.Pools](Type-mq3-botlib-ai-resource-pools-pools-1320277810.md) — struct
<a id="function-function-mq3-botlib-ai-resource-pools-resetavoidgoalsstate-function-resetavoidgoalsstate-value-src-mq3-botlib-ai-resource-pools-ml-948404603"></a>
### resetAvoidGoalsState

```ml
function resetAvoidGoalsState(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L71)

<a id="function-function-mq3-botlib-ai-resource-pools-resetavoidreach-function-resetavoidreach-pools-handle-src-mq3-botlib-ai-resource-pools-ml-1486354557"></a>
### resetAvoidReach

```ml
function resetAvoidReach(pools, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L89)

<a id="function-function-mq3-botlib-ai-resource-pools-resetgoalstate-function-resetgoalstate-pools-handle-src-mq3-botlib-ai-resource-pools-ml-2107291323"></a>
### resetGoalState

```ml
function resetGoalState(pools, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L75)

<a id="function-function-mq3-botlib-ai-resource-pools-resetlastavoidreach-function-resetlastavoidreach-pools-handle-src-mq3-botlib-ai-resource-pools-ml-1028001345"></a>
### resetLastAvoidReach

```ml
function resetLastAvoidReach(pools, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L93)

<a id="function-function-mq3-botlib-ai-resource-pools-resetmovestate-function-resetmovestate-pools-handle-src-mq3-botlib-ai-resource-pools-ml-1070108015"></a>
### resetMoveState

```ml
function resetMoveState(pools, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L99)

<a id="function-function-mq3-botlib-ai-resource-pools-resetweaponstate-function-resetweaponstate-pools-handle-src-mq3-botlib-ai-resource-pools-ml-1836349115"></a>
### resetWeaponState

```ml
function resetWeaponState(pools, handle)
```

The released BotResetWeaponState has its memset commented out and restores both existing pointers, so it intentionally leaves the complete state intact.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L108)

<a id="function-function-mq3-botlib-ai-resource-pools-shutdown-function-shutdown-pools-src-mq3-botlib-ai-resource-pools-ml-420636133"></a>
### shutdown

```ml
function shutdown(pools)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L114)

<a id="function-function-mq3-botlib-ai-resource-pools-supportstrap-function-supportstrap-op-src-mq3-botlib-ai-resource-pools-ml-186023203"></a>
### supportsTrap

```ml
function supportsTrap(op)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `op` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L27)

<a id="function-function-mq3-botlib-ai-resource-pools-validhandle-function-validhandle-handle-src-mq3-botlib-ai-resource-pools-ml-267978120"></a>
### validHandle

```ml
function validHandle(handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L51)

<a id="function-function-mq3-botlib-ai-resource-pools-vec3-function-vec3-src-mq3-botlib-ai-resource-pools-ml-2103905062"></a>
### vec3

```ml
function vec3()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L41)

<a id="function-function-mq3-botlib-ai-resource-pools-weaponstate-function-weaponstate-pools-handle-src-mq3-botlib-ai-resource-pools-ml-1373755461"></a>
### weaponState

```ml
function weaponState(pools, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L55)

- [mq3.botlib.ai_resource_pools.WeaponState](Type-mq3-botlib-ai-resource-pools-weaponstate-1198640016.md) — struct
<a id="function-function-mq3-botlib-ai-resource-pools-zeros-function-zeros-count-src-mq3-botlib-ai-resource-pools-ml-1377276831"></a>
### zeros

```ml
function zeros(count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `count` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_pools.ml#L39)
