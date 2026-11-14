# `src/mq3/botlib/ai_console_messages.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_console_messages`](Package-mq3-botlib-ai-console-messages-2079648505.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/ai_resource_pools.ml` as `resources` → [src/mq3/botlib/ai_resource_pools.ml](File-src-mq3-botlib-ai-resource-pools-ml-103445473.md)
- `mq3/botlib/lifecycle_runtime.ml` as `botlibRuntime` → [src/mq3/botlib/lifecycle_runtime.ml](File-src-mq3-botlib-lifecycle-runtime-ml-1352513457.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)

## Declarations

<a id="function-function-mq3-botlib-ai-console-messages-clearchat-function-clearchat-state-chathandle-src-mq3-botlib-ai-console-messages-ml-68143241"></a>
### clearChat

```ml
function clearChat(state, chatHandle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `chatHandle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L61)

<a id="function-function-mq3-botlib-ai-console-messages-configure-function-configure-state-capacity-src-mq3-botlib-ai-console-messages-ml-1177892843"></a>
### configure

```ml
function configure(state, capacity)
```

Mirrors InitConsoleMessageHeap: discard the previous heap and rebuild the free list at the max_messages capacity. Chat queues are cleared first so no state retains a slot from the discarded heap.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L67)

<a id="function-function-mq3-botlib-ai-console-messages-configurefrombotlib-function-configurefrombotlib-state-botlib-src-mq3-botlib-ai-console-messages-ml-1323219711"></a>
### configureFromBotlib

```ml
function configureFromBotlib(state, botlib)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `botlib` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L73)

<a id="constant-constant-mq3-botlib-ai-console-messages-console-message-size-const-console-message-size-276-src-mq3-botlib-ai-console-messages-ml-605386616"></a>
### CONSOLE_MESSAGE_SIZE

```ml
const CONSOLE_MESSAGE_SIZE = 276
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L20)

<a id="function-function-mq3-botlib-ai-console-messages-count-function-count-state-chathandle-src-mq3-botlib-ai-console-messages-ml-1243645661"></a>
### count

```ml
function count(state, chatHandle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `chatHandle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L60)

<a id="function-function-mq3-botlib-ai-console-messages-create-function-create-pools-src-mq3-botlib-ai-console-messages-ml-425385777"></a>
### create

```ml
function create(pools)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L30)

<a id="function-function-mq3-botlib-ai-console-messages-createwithcapacity-function-createwithcapacity-pools-capacity-src-mq3-botlib-ai-console-messages-ml-1118252317"></a>
### createWithCapacity

```ml
function createWithCapacity(pools, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L26)

<a id="constant-constant-mq3-botlib-ai-console-messages-default-max-messages-const-default-max-messages-1024-src-mq3-botlib-ai-console-messages-ml-486882666"></a>
### DEFAULT_MAX_MESSAGES

```ml
const DEFAULT_MAX_MESSAGES = 1024
```

be_ai_chat.c obtains this from LibVarValue("max_messages", "1024").


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L16)

<a id="function-function-mq3-botlib-ai-console-messages-dispatch-function-dispatch-state-vm-base-op-src-mq3-botlib-ai-console-messages-ml-1389323878"></a>
### dispatch

```ml
function dispatch(state, vm, base, op)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `op` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L82)

<a id="function-function-mq3-botlib-ai-console-messages-freeslot-function-freeslot-state-slot-src-mq3-botlib-ai-console-messages-ml-192318547"></a>
### freeSlot

```ml
function freeSlot(state, slot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L47)

<a id="function-function-mq3-botlib-ai-console-messages-initialfreeslots-function-initialfreeslots-capacity-src-mq3-botlib-ai-console-messages-ml-1786819814"></a>
### initialFreeSlots

```ml
function initialFreeSlots(capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L25)

<a id="constant-constant-mq3-botlib-ai-console-messages-max-console-messages-const-max-console-messages-default-max-messages-src-mq3-botlib-ai-console-messages-ml-1637020300"></a>
### MAX_CONSOLE_MESSAGES

```ml
const MAX_CONSOLE_MESSAGES = DEFAULT_MAX_MESSAGES
```

Compatibility name for callers that used the old fixed-capacity constant.


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L18)

<a id="constant-constant-mq3-botlib-ai-console-messages-max-message-size-const-max-message-size-256-src-mq3-botlib-ai-console-messages-ml-1294418460"></a>
### MAX_MESSAGE_SIZE

```ml
const MAX_MESSAGE_SIZE = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L19)

- [mq3.botlib.ai_console_messages.Message](Type-mq3-botlib-ai-console-messages-message-1967758676.md) — struct
<a id="function-function-mq3-botlib-ai-console-messages-messagedata-function-messagedata-text-src-mq3-botlib-ai-console-messages-ml-239628377"></a>
### messageData

```ml
function messageData(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L36)

<a id="function-function-mq3-botlib-ai-console-messages-messagetext-function-messagetext-message-src-mq3-botlib-ai-console-messages-ml-111530553"></a>
### messageText

```ml
function messageText(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L39)

<a id="function-function-mq3-botlib-ai-console-messages-next-function-next-state-chathandle-src-mq3-botlib-ai-console-messages-ml-287140515"></a>
### next

```ml
function next(state, chatHandle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `chatHandle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L55)

<a id="constant-constant-mq3-botlib-ai-console-messages-op-next-console-message-const-op-next-console-message-511-src-mq3-botlib-ai-console-messages-ml-103311418"></a>
### OP_NEXT_CONSOLE_MESSAGE

```ml
const OP_NEXT_CONSOLE_MESSAGE = 511
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L13)

<a id="constant-constant-mq3-botlib-ai-console-messages-op-num-console-message-const-op-num-console-message-512-src-mq3-botlib-ai-console-messages-ml-2100225305"></a>
### OP_NUM_CONSOLE_MESSAGE

```ml
const OP_NUM_CONSOLE_MESSAGE = 512
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L14)

<a id="constant-constant-mq3-botlib-ai-console-messages-op-queue-console-message-const-op-queue-console-message-509-src-mq3-botlib-ai-console-messages-ml-316455071"></a>
### OP_QUEUE_CONSOLE_MESSAGE

```ml
const OP_QUEUE_CONSOLE_MESSAGE = 509
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L11)

<a id="constant-constant-mq3-botlib-ai-console-messages-op-remove-console-message-const-op-remove-console-message-510-src-mq3-botlib-ai-console-messages-ml-1779772065"></a>
### OP_REMOVE_CONSOLE_MESSAGE

```ml
const OP_REMOVE_CONSOLE_MESSAGE = 510
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L12)

<a id="function-function-mq3-botlib-ai-console-messages-popfree-function-popfree-state-src-mq3-botlib-ai-console-messages-ml-198366801"></a>
### popFree

```ml
function popFree(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L32)

<a id="function-function-mq3-botlib-ai-console-messages-queue-function-queue-state-chathandle-type-text-src-mq3-botlib-ai-console-messages-ml-338788756"></a>
### queue

```ml
function queue(state, chatHandle, type, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `chatHandle` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L42)

<a id="function-function-mq3-botlib-ai-console-messages-remove-function-remove-state-chathandle-messagehandle-src-mq3-botlib-ai-console-messages-ml-228334528"></a>
### remove

```ml
function remove(state, chatHandle, messageHandle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `chatHandle` | `dynamic` | — |  |
| `messageHandle` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L50)

<a id="function-function-mq3-botlib-ai-console-messages-settime-function-settime-state-time-src-mq3-botlib-ai-console-messages-ml-757691086"></a>
### setTime

```ml
function setTime(state, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L31)

<a id="function-function-mq3-botlib-ai-console-messages-shutdown-function-shutdown-state-src-mq3-botlib-ai-console-messages-ml-2006973811"></a>
### shutdown

```ml
function shutdown(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L76)

- [mq3.botlib.ai_console_messages.State](Type-mq3-botlib-ai-console-messages-state-1558838342.md) — struct
<a id="function-function-mq3-botlib-ai-console-messages-writemessage-function-writemessage-vm-address-message-src-mq3-botlib-ai-console-messages-ml-828863536"></a>
### writeMessage

```ml
function writeMessage(vm, address, message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_console_messages.ml#L79)
