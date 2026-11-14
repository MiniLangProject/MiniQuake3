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

<a id="constant-constant-mq3-botlib-ai-chat-goal-tail-avoid-default-time-const-avoid-default-time-30-src-mq3-botlib-ai-chat-goal-tail-ml-2097555130"></a>
### AVOID_DEFAULT_TIME

```ml
const AVOID_DEFAULT_TIME = 30.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L17)

<a id="constant-constant-mq3-botlib-ai-chat-goal-tail-avoid-minimum-time-const-avoid-minimum-time-10-src-mq3-botlib-ai-chat-goal-tail-ml-38429298"></a>
### AVOID_MINIMUM_TIME

```ml
const AVOID_MINIMUM_TIME = 10.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L16)

<a id="function-function-mq3-botlib-ai-chat-goal-tail-chatstate-function-chatstate-state-handle-src-mq3-botlib-ai-chat-goal-tail-ml-1612733753"></a>
### chatState

```ml
function chatState(state, handle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L21)

<a id="function-function-mq3-botlib-ai-chat-goal-tail-create-function-create-chatprofiles-goalruntime-levelitems-src-mq3-botlib-ai-chat-goal-tail-ml-1793519771"></a>
### create

```ml
function create(chatProfiles, goalRuntime, levelItems)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `chatProfiles` | `dynamic` | — |  |
| `goalRuntime` | `dynamic` | — |  |
| `levelItems` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L20)

<a id="function-function-mq3-botlib-ai-chat-goal-tail-getchatmessage-function-getchatmessage-state-handle-size-src-mq3-botlib-ai-chat-goal-tail-ml-326452756"></a>
### getChatMessage

```ml
function getChatMessage(state, handle, size)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L34)

<a id="function-function-mq3-botlib-ai-chat-goal-tail-numinitialchats-function-numinitialchats-state-handle-type-src-mq3-botlib-ai-chat-goal-tail-ml-1067980045"></a>
### numInitialChats

```ml
function numInitialChats(state, handle, type)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L22)

<a id="constant-constant-mq3-botlib-ai-chat-goal-tail-op-get-chat-message-const-op-get-chat-message-570-src-mq3-botlib-ai-chat-goal-tail-ml-1766833685"></a>
### OP_GET_CHAT_MESSAGE

```ml
const OP_GET_CHAT_MESSAGE = 570
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L12)

<a id="constant-constant-mq3-botlib-ai-chat-goal-tail-op-num-initial-chats-const-op-num-initial-chats-569-src-mq3-botlib-ai-chat-goal-tail-ml-1225477187"></a>
### OP_NUM_INITIAL_CHATS

```ml
const OP_NUM_INITIAL_CHATS = 569
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L11)

<a id="constant-constant-mq3-botlib-ai-chat-goal-tail-op-predict-visible-position-const-op-predict-visible-position-572-src-mq3-botlib-ai-chat-goal-tail-ml-1855612839"></a>
### OP_PREDICT_VISIBLE_POSITION

```ml
const OP_PREDICT_VISIBLE_POSITION = 572
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L14)

<a id="constant-constant-mq3-botlib-ai-chat-goal-tail-op-remove-from-avoid-goals-const-op-remove-from-avoid-goals-571-src-mq3-botlib-ai-chat-goal-tail-ml-1671513836"></a>
### OP_REMOVE_FROM_AVOID_GOALS

```ml
const OP_REMOVE_FROM_AVOID_GOALS = 571
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L13)

<a id="constant-constant-mq3-botlib-ai-chat-goal-tail-op-set-avoid-goal-time-const-op-set-avoid-goal-time-573-src-mq3-botlib-ai-chat-goal-tail-ml-1353072954"></a>
### OP_SET_AVOID_GOAL_TIME

```ml
const OP_SET_AVOID_GOAL_TIME = 573
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L15)

<a id="function-function-mq3-botlib-ai-chat-goal-tail-removefromavoidgoals-function-removefromavoidgoals-state-handle-number-src-mq3-botlib-ai-chat-goal-tail-ml-1094226228"></a>
### removeFromAvoidGoals

```ml
function removeFromAvoidGoals(state, handle, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L38)

<a id="function-function-mq3-botlib-ai-chat-goal-tail-removetildes-function-removetildes-value-src-mq3-botlib-ai-chat-goal-tail-ml-1245634257"></a>
### removeTildes

```ml
function removeTildes(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L25)

<a id="function-function-mq3-botlib-ai-chat-goal-tail-respawntime-function-respawntime-state-number-src-mq3-botlib-ai-chat-goal-tail-ml-607116960"></a>
### respawnTime

```ml
function respawnTime(state, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L39)

<a id="function-function-mq3-botlib-ai-chat-goal-tail-setavoidgoaltime-function-setavoidgoaltime-state-handle-number-avoidtime-src-mq3-botlib-ai-chat-goal-tail-ml-466492844"></a>
### setAvoidGoalTime

```ml
function setAvoidGoalTime(state, handle, number, avoidTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `handle` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |
| `avoidTime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L46)

- [mq3.botlib.ai_chat_goal_tail.State](Type-mq3-botlib-ai-chat-goal-tail-state-449589671.md) — struct
<a id="function-function-mq3-botlib-ai-chat-goal-tail-supportstrap-function-supportstrap-op-src-mq3-botlib-ai-chat-goal-tail-ml-1652129987"></a>
### supportsTrap

```ml
function supportsTrap(op)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `op` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_goal_tail.ml#L51)
