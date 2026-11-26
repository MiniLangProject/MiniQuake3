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

Apply `mq3.botlib.ai_resource_pools.chatState` and `mq3.botlib.ai_console_messages.freeSlot` while evaluating `clearChat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI console messages state; accesses `pools`. |
| `chatHandle` | `dynamic` | — | Handle identifying the allocated bot chat state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L100)

<a id="function-function-mq3-botlib-ai-console-messages-configure-function-configure-state-capacity-src-mq3-botlib-ai-console-messages-ml-1177892843"></a>
### configure

```ml
function configure(state, capacity)
```

Mirrors InitConsoleMessageHeap: discard the previous heap and rebuild the free list at the max_messages capacity. Chat queues are cleared first so no state retains a slot from the discarded heap.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI console messages state; accesses `capacity`, `nodes` and `freeSlots`. May update `state.capacity`, `state.nodes` and `state.freeSlots` in place. |
| `capacity` | `dynamic` | — | Maximum number of entries to allocate or retain. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L108)

<a id="function-function-mq3-botlib-ai-console-messages-configurefrombotlib-function-configurefrombotlib-state-botlib-src-mq3-botlib-ai-console-messages-ml-1323219711"></a>
### configureFromBotlib

```ml
function configureFromBotlib(state, botlib)
```

Forward `configureFromBotlib` to `mq3.botlib.ai_console_messages.configure` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI console messages state; accesses `capacity`, `nodes` and `freeSlots`. May update `state.capacity`, `state.nodes` and `state.freeSlots` in place. |
| `botlib` | `dynamic` | — | Lib variables state; accesses `variables`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L117)

<a id="constant-constant-mq3-botlib-ai-console-messages-console-message-size-const-console-message-size-276-src-mq3-botlib-ai-console-messages-ml-605386616"></a>
### CONSOLE_MESSAGE_SIZE

```ml
const CONSOLE_MESSAGE_SIZE = 276
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L20)

<a id="function-function-mq3-botlib-ai-console-messages-count-function-count-state-chathandle-src-mq3-botlib-ai-console-messages-ml-1243645661"></a>
### count

```ml
function count(state, chatHandle)
```

Apply `mq3.botlib.ai_resource_pools.chatState` while evaluating `count`. Return paths include `chat.numConsoleMessages`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI console messages state; accesses `pools`. |
| `chatHandle` | `dynamic` | — | Handle identifying the allocated bot chat state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L96)

<a id="function-function-mq3-botlib-ai-console-messages-create-function-create-pools-src-mq3-botlib-ai-console-messages-ml-425385777"></a>
### create

```ml
function create(pools)
```

Forward `create` to `mq3.botlib.ai_console_messages.createWithCapacity` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_console_messages.State.pools`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L39)

<a id="function-function-mq3-botlib-ai-console-messages-createwithcapacity-function-createwithcapacity-pools-capacity-src-mq3-botlib-ai-console-messages-ml-1118252317"></a>
### createWithCapacity

```ml
function createWithCapacity(pools, capacity)
```

Build the `mq3.botlib.ai_console_messages.State` result for `createWithCapacity`. Return paths include `State(pools,array(capacity,void),initialFreeSlots(capacity),0.0,capacity)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_console_messages.State.pools`. |
| `capacity` | `dynamic` | — | Maximum number of entries to allocate or retain. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L33)

<a id="constant-constant-mq3-botlib-ai-console-messages-default-max-messages-const-default-max-messages-1024-src-mq3-botlib-ai-console-messages-ml-486882666"></a>
### DEFAULT_MAX_MESSAGES

```ml
const DEFAULT_MAX_MESSAGES = 1024
```

be_ai_chat.c obtains this from LibVarValue("max_messages", "1024").


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L16)

<a id="function-function-mq3-botlib-ai-console-messages-dispatch-function-dispatch-state-vm-base-op-src-mq3-botlib-ai-console-messages-ml-1389323878"></a>
### dispatch

```ml
function dispatch(state, vm, base, op)
```

Apply `mq3.vm.syscall_common.argument`, `mq3.vm.syscall_common.readString` and `mq3.botlib.ai_console_messages.queue` while evaluating `dispatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI console messages state; accesses `pools`, `time` and `nodes`. May update `state.nodes[slot]` in place. |
| `vm` | `dynamic` | — | VM instance owning the syscall memory and state. |
| `base` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `op` | `dynamic` | — | Numeric syscall operation identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L137)

<a id="function-function-mq3-botlib-ai-console-messages-freeslot-function-freeslot-state-slot-src-mq3-botlib-ai-console-messages-ml-192318547"></a>
### freeSlot

```ml
function freeSlot(state, slot)
```

Set `state.nodes[slot]` to `void` and `state.freeSlots` to `[slot]+state.freeSlots` in `mq3.botlib.ai_console_messages.freeSlot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI console messages state; accesses `capacity`, `nodes` and `freeSlots`. May update `state.nodes[slot]` and `state.freeSlots` in place. |
| `slot` | `dynamic` | — | Slot in the owning table or pool. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L73)

<a id="function-function-mq3-botlib-ai-console-messages-initialfreeslots-function-initialfreeslots-capacity-src-mq3-botlib-ai-console-messages-ml-1786819814"></a>
### initialFreeSlots

```ml
function initialFreeSlots(capacity)
```

Build the initial free-slot list in ascending order from zero to capacity minus one.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `capacity` | `dynamic` | — | Maximum number of entries to allocate or retain. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L29)

<a id="constant-constant-mq3-botlib-ai-console-messages-max-console-messages-const-max-console-messages-default-max-messages-src-mq3-botlib-ai-console-messages-ml-1637020300"></a>
### MAX_CONSOLE_MESSAGES

```ml
const MAX_CONSOLE_MESSAGES = DEFAULT_MAX_MESSAGES
```

Compatibility name for callers that used the old fixed-capacity constant.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L18)

<a id="constant-constant-mq3-botlib-ai-console-messages-max-message-size-const-max-message-size-256-src-mq3-botlib-ai-console-messages-ml-1294418460"></a>
### MAX_MESSAGE_SIZE

```ml
const MAX_MESSAGE_SIZE = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L19)

- [mq3.botlib.ai_console_messages.Message](Type-mq3-botlib-ai-console-messages-message-1967758676.md) — struct
<a id="function-function-mq3-botlib-ai-console-messages-messagedata-function-messagedata-text-src-mq3-botlib-ai-console-messages-ml-239628377"></a>
### messageData

```ml
function messageData(text)
```

Copy chat text into a zero-filled fixed-size message buffer, truncating input to the buffer capacity.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L52)

<a id="function-function-mq3-botlib-ai-console-messages-messagetext-function-messagetext-message-src-mq3-botlib-ai-console-messages-ml-111530553"></a>
### messageText

```ml
function messageText(message)
```

Decode message bytes up to the first zero or the fixed message-buffer limit.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message record; accesses `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L57)

<a id="function-function-mq3-botlib-ai-console-messages-next-function-next-state-chathandle-src-mq3-botlib-ai-console-messages-ml-287140515"></a>
### next

```ml
function next(state, chatHandle)
```

Build the `mq3.botlib.ai_console_messages.Message` result for `next`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI console messages state; accesses `pools` and `nodes`. |
| `chatHandle` | `dynamic` | — | Handle identifying the allocated bot chat state. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L88)

<a id="constant-constant-mq3-botlib-ai-console-messages-op-next-console-message-const-op-next-console-message-511-src-mq3-botlib-ai-console-messages-ml-103311418"></a>
### OP_NEXT_CONSOLE_MESSAGE

```ml
const OP_NEXT_CONSOLE_MESSAGE = 511
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L13)

<a id="constant-constant-mq3-botlib-ai-console-messages-op-num-console-message-const-op-num-console-message-512-src-mq3-botlib-ai-console-messages-ml-2100225305"></a>
### OP_NUM_CONSOLE_MESSAGE

```ml
const OP_NUM_CONSOLE_MESSAGE = 512
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L14)

<a id="constant-constant-mq3-botlib-ai-console-messages-op-queue-console-message-const-op-queue-console-message-509-src-mq3-botlib-ai-console-messages-ml-316455071"></a>
### OP_QUEUE_CONSOLE_MESSAGE

```ml
const OP_QUEUE_CONSOLE_MESSAGE = 509
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L11)

<a id="constant-constant-mq3-botlib-ai-console-messages-op-remove-console-message-const-op-remove-console-message-510-src-mq3-botlib-ai-console-messages-ml-1779772065"></a>
### OP_REMOVE_CONSOLE_MESSAGE

```ml
const OP_REMOVE_CONSOLE_MESSAGE = 510
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L12)

<a id="function-function-mq3-botlib-ai-console-messages-popfree-function-popfree-state-src-mq3-botlib-ai-console-messages-ml-198366801"></a>
### popFree

```ml
function popFree(state)
```

Set `state.freeSlots` to `[]` and `state.freeSlots` to `next` in `mq3.botlib.ai_console_messages.popFree`. Return paths include `slot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI console messages state; accesses `freeSlots`. May update `state.freeSlots` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L46)

<a id="function-function-mq3-botlib-ai-console-messages-queue-function-queue-state-chathandle-type-text-src-mq3-botlib-ai-console-messages-ml-338788756"></a>
### queue

```ml
function queue(state, chatHandle, type, text)
```

Set `state.nodes[slot]` to `message` in `mq3.botlib.ai_console_messages.queue`. Return paths include `message.handle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI console messages state; accesses `pools`, `time` and `nodes`. May update `state.nodes[slot]` in place. |
| `chatHandle` | `dynamic` | — | Handle identifying the allocated bot chat state. |
| `type` | `dynamic` | — | Initial value stored in `mq3.botlib.ai_console_messages.Message.type`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L65)

<a id="function-function-mq3-botlib-ai-console-messages-remove-function-remove-state-chathandle-messagehandle-src-mq3-botlib-ai-console-messages-ml-228334528"></a>
### remove

```ml
function remove(state, chatHandle, messageHandle)
```

Apply `mq3.botlib.ai_resource_pools.chatState` and `mq3.botlib.ai_console_messages.freeSlot` while evaluating `remove`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI console messages state; accesses `pools` and `nodes`. |
| `chatHandle` | `dynamic` | — | Handle identifying the allocated bot chat state. |
| `messageHandle` | `dynamic` | — | Value used by `remove` in `if not removed and message!=void and message.handle==messageHandle then freeSlot(state,slot)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L80)

<a id="function-function-mq3-botlib-ai-console-messages-settime-function-settime-state-time-src-mq3-botlib-ai-console-messages-ml-757691086"></a>
### setTime

```ml
function setTime(state, time)
```

Set `state.time` to `time` in `mq3.botlib.ai_console_messages.setTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI console messages state; accesses `time`. May update `state.time` in place. |
| `time` | `dynamic` | — | Time value in the units expected by this module. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L43)

<a id="function-function-mq3-botlib-ai-console-messages-shutdown-function-shutdown-state-src-mq3-botlib-ai-console-messages-ml-2006973811"></a>
### shutdown

```ml
function shutdown(state)
```

Set `state.nodes` to `array(state.capacity,void)` and `state.freeSlots` to `initialFreeSlots(state.capacity)` in `mq3.botlib.ai_console_messages.shutdown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI console messages state; accesses `nodes`, `capacity` and `freeSlots`. May update `state.nodes` and `state.freeSlots` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L122)

- [mq3.botlib.ai_console_messages.State](Type-mq3-botlib-ai-console-messages-state-1558838342.md) — struct
<a id="function-function-mq3-botlib-ai-console-messages-writemessage-function-writemessage-vm-address-message-src-mq3-botlib-ai-console-messages-ml-828863536"></a>
### writeMessage

```ml
function writeMessage(vm, address, message)
```

Apply `mq3.vm.syscall_common.pointer` while evaluating `writeMessage`. Return paths include `message.handle`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm record; accesses `data`. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `message` | `dynamic` | — | Message record; accesses `handle`, `time`, `type` and `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_console_messages.ml#L129)
