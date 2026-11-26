# `src/mq3/botlib/ai_chat_goal_tail.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_chat_goal_tail`](Package-mq3-botlib-ai-chat-goal-tail-1661611928.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/ai_chat_profiles.ml` as `profiles` → [src/mq3/botlib/ai_chat_profiles.ml](File-src-mq3-botlib-ai-chat-profiles-ml-1781106722.md)
- `mq3/botlib/ai_goal_state.ml` as `goals` → [src/mq3/botlib/ai_goal_state.ml](File-src-mq3-botlib-ai-goal-state-ml-857672002.md)
- `mq3/botlib/ai_item_weights.ml` as `itemWeights` → [src/mq3/botlib/ai_item_weights.ml](File-src-mq3-botlib-ai-item-weights-ml-1163821802.md)
- `mq3/botlib/ai_resource_pools.ml` as `pools` → [src/mq3/botlib/ai_resource_pools.ml](File-src-mq3-botlib-ai-resource-pools-ml-103445473.md)

## Declarations

<a id="constant-constant-mq3-botlib-ai-chat-goal-tail-avoid-default-time-const-avoid-default-time-30-src-mq3-botlib-ai-chat-goal-tail-ml-1852317214"></a>
### AVOID_DEFAULT_TIME

```ml
const AVOID_DEFAULT_TIME = 30
```

Default interval for temporarily avoiding a selected goal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L24)

<a id="constant-constant-mq3-botlib-ai-chat-goal-tail-avoid-minimum-time-const-avoid-minimum-time-10-src-mq3-botlib-ai-chat-goal-tail-ml-501024790"></a>
### AVOID_MINIMUM_TIME

```ml
const AVOID_MINIMUM_TIME = 10
```

Minimum interval retained for a goal-avoidance request.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L22)

<a id="function-function-mq3-botlib-ai-chat-goal-tail-chatstate-function-chatstate-state-handle-src-mq3-botlib-ai-chat-goal-tail-ml-1612733753"></a>
### chatState

```ml
function chatState(state, handle)
```

Apply `mq3.botlib.ai_resource_pools.chatState` while evaluating `chatState`. Return paths include `pools.chatState(state.chatProfiles.pools,handle)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat goal tail state; accesses `chatProfiles`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot chat state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L43)

<a id="function-function-mq3-botlib-ai-chat-goal-tail-create-function-create-chatprofiles-goalruntime-levelitems-src-mq3-botlib-ai-chat-goal-tail-ml-1793519771"></a>
### create

```ml
function create(chatProfiles, goalRuntime, levelItems)
```

Create a `mq3.botlib.ai_chat_goal_tail.State` record, initializing `chatProfiles` from `chatProfiles`, `goalRuntime` from `goalRuntime` and `levelItems` from `levelItems`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `chatProfiles` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_chat_goal_tail.State.chatProfiles`. |
| `goalRuntime` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_chat_goal_tail.State.goalRuntime`. |
| `levelItems` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_chat_goal_tail.State.levelItems`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L39)

<a id="function-function-mq3-botlib-ai-chat-goal-tail-getchatmessage-function-getchatmessage-state-handle-size-src-mq3-botlib-ai-chat-goal-tail-ml-326452756"></a>
### getChatMessage

```ml
function getChatMessage(state, handle, size)
```

Apply `mq3.botlib.ai_chat_goal_tail.chatState` and `mq3.botlib.ai_chat_goal_tail.removeTildes` while evaluating `getChatMessage`. Return paths include `decode(slice(data,0,count))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat goal tail state; accesses `chatProfiles`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot chat state. |
| `size` | `dynamic` | — | Size or capacity supplied to the buffer operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L66)

<a id="function-function-mq3-botlib-ai-chat-goal-tail-numinitialchats-function-numinitialchats-state-handle-type-src-mq3-botlib-ai-chat-goal-tail-ml-1067980045"></a>
### numInitialChats

```ml
function numInitialChats(state, handle, type)
```

Apply `mq3.botlib.ai_chat_goal_tail.chatState` and `mq3.botlib.ai_chat_profiles.typeByName` while evaluating `numInitialChats`. Return paths include `len(selected.messages)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat goal tail state; accesses `chatProfiles`. |
| `handle` | `dynamic` | — | Handle identifying the allocated bot chat state. |
| `type` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L48)

<a id="constant-constant-mq3-botlib-ai-chat-goal-tail-op-get-chat-message-const-op-get-chat-message-570-src-mq3-botlib-ai-chat-goal-tail-ml-1766833685"></a>
### OP_GET_CHAT_MESSAGE

```ml
const OP_GET_CHAT_MESSAGE = 570
```

Bot-library syscall identifier for get chat message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L14)

<a id="constant-constant-mq3-botlib-ai-chat-goal-tail-op-num-initial-chats-const-op-num-initial-chats-569-src-mq3-botlib-ai-chat-goal-tail-ml-1225477187"></a>
### OP_NUM_INITIAL_CHATS

```ml
const OP_NUM_INITIAL_CHATS = 569
```

Bot-library syscall identifier for number initial chats.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L12)

<a id="constant-constant-mq3-botlib-ai-chat-goal-tail-op-predict-visible-position-const-op-predict-visible-position-572-src-mq3-botlib-ai-chat-goal-tail-ml-1855612839"></a>
### OP_PREDICT_VISIBLE_POSITION

```ml
const OP_PREDICT_VISIBLE_POSITION = 572
```

Bot-library syscall identifier for predict visible position.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L18)

<a id="constant-constant-mq3-botlib-ai-chat-goal-tail-op-remove-from-avoid-goals-const-op-remove-from-avoid-goals-571-src-mq3-botlib-ai-chat-goal-tail-ml-1671513836"></a>
### OP_REMOVE_FROM_AVOID_GOALS

```ml
const OP_REMOVE_FROM_AVOID_GOALS = 571
```

Bot-library syscall identifier for remove from avoid goals.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L16)

<a id="constant-constant-mq3-botlib-ai-chat-goal-tail-op-set-avoid-goal-time-const-op-set-avoid-goal-time-573-src-mq3-botlib-ai-chat-goal-tail-ml-1353072954"></a>
### OP_SET_AVOID_GOAL_TIME

```ml
const OP_SET_AVOID_GOAL_TIME = 573
```

Bot-library syscall identifier for set avoid goal time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L20)

<a id="function-function-mq3-botlib-ai-chat-goal-tail-removefromavoidgoals-function-removefromavoidgoals-state-handle-number-src-mq3-botlib-ai-chat-goal-tail-ml-1094226228"></a>
### removeFromAvoidGoals

```ml
function removeFromAvoidGoals(state, handle, number)
```

Apply `mq3.botlib.ai_goal_state.removeFromAvoidGoals` while evaluating `removeFromAvoidGoals`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat goal tail state; accesses `goalRuntime`. |
| `handle` | `dynamic` | — | Resource handle resolved by the owning pool or host service. |
| `number` | `dynamic` | — | Value used by `removeFromAvoidGoals` in `if value.avoidGoals[index]==number and value.avoidGoalTimes[index]>=now then value.avoidGoalTimes[index]=0.0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L74)

<a id="function-function-mq3-botlib-ai-chat-goal-tail-removetildes-function-removetildes-value-src-mq3-botlib-ai-chat-goal-tail-ml-1245634257"></a>
### removeTildes

```ml
function removeTildes(value)
```

Remove single tilde markers and unescape doubled tildes in ai chat goal tail text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L53)

<a id="function-function-mq3-botlib-ai-chat-goal-tail-respawntime-function-respawntime-state-number-src-mq3-botlib-ai-chat-goal-tail-ml-607116960"></a>
### respawnTime

```ml
function respawnTime(state, number)
```

Apply `mq3.botlib.ai_item_weights.ensureItems` while evaluating `respawnTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat goal tail state; accesses `levelItems`. |
| `number` | `dynamic` | — | Value used by `respawnTime` in `if levelItem.number==number and levelItem.itemInfo>=0 and levelItem.itemInfo<len(config) then value=config[level...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L78)

<a id="function-function-mq3-botlib-ai-chat-goal-tail-setavoidgoaltime-function-setavoidgoaltime-state-handle-number-avoidtime-src-mq3-botlib-ai-chat-goal-tail-ml-466492844"></a>
### setAvoidGoalTime

```ml
function setAvoidGoalTime(state, handle, number, avoidTime)
```

Apply `mq3.botlib.ai_chat_goal_tail.respawnTime` and `mq3.botlib.ai_goal_state.addToAvoidGoals` while evaluating `setAvoidGoalTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat goal tail state; accesses `goalRuntime`. |
| `handle` | `dynamic` | — | Resource handle resolved by the owning pool or host service. |
| `number` | `dynamic` | — | Value used by `respawnTime` in `if levelItem.number==number and levelItem.itemInfo>=0 and levelItem.itemInfo<len(config) then value=config[level...`. |
| `avoidTime` | `dynamic` | — | Value used by `setAvoidGoalTime` in `value=avoidTime`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L90)

- [mq3.botlib.ai_chat_goal_tail.State](Type-mq3-botlib-ai-chat-goal-tail-state-449589671.md) — struct
<a id="function-function-mq3-botlib-ai-chat-goal-tail-supportstrap-function-supportstrap-op-src-mq3-botlib-ai-chat-goal-tail-ml-1652129987"></a>
### supportsTrap

```ml
function supportsTrap(op)
```

Test `op==OP_NUM_INITIAL_CHATS or op==OP_GET_CHAT_MESSAGE or op==OP_REMOVE_FROM_AVOID_GOALS or op==OP_SET_AVOID_GOAL_TIME` as the condition for `supportsTrap`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `op` | `dynamic` | — | Numeric syscall operation identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L97)
