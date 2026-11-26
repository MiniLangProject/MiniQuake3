# `src/mq3/botlib/ai_goal_state_syscalls.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_goal_state_syscalls`](Package-mq3-botlib-ai-goal-state-syscalls-1929082697.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/ai_goal_state.ml` as `goalRuntime` → [src/mq3/botlib/ai_goal_state.ml](File-src-mq3-botlib-ai-goal-state-ml-857672002.md)
- `mq3/botlib/ai_resource_pools.ml` as `goalResources` → [src/mq3/botlib/ai_resource_pools.ml](File-src-mq3-botlib-ai-resource-pools-ml-103445473.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)

## Declarations

<a id="constant-constant-mq3-botlib-ai-goal-state-syscalls-bot-goal-size-const-bot-goal-size-56-src-mq3-botlib-ai-goal-state-syscalls-ml-1681334962"></a>
### BOT_GOAL_SIZE

```ml
const BOT_GOAL_SIZE = 56
```

Byte size of the bot goal record in the bot VM ABI or serialized representation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state_syscalls.ml#L11)

<a id="function-function-mq3-botlib-ai-goal-state-syscalls-dispatch-function-dispatch-runtime-vm-base-op-src-mq3-botlib-ai-goal-state-syscalls-ml-1611876787"></a>
### dispatch

```ml
function dispatch(runtime, vm, base, op)
```

Apply `mq3.botlib.ai_goal_state.resetAvoidGoals`, `mq3.vm.syscall_common.argument` and `mq3.botlib.ai_goal_state_syscalls.readGoal` while evaluating `dispatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI goal state runtime; accesses `pools`. |
| `vm` | `dynamic` | — | VM instance owning the syscall memory and state. |
| `base` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `op` | `dynamic` | — | Numeric syscall operation identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state_syscalls.ml#L44)

<a id="function-function-mq3-botlib-ai-goal-state-syscalls-readgoal-function-readgoal-vm-address-src-mq3-botlib-ai-goal-state-syscalls-ml-742361983"></a>
### readGoal

```ml
function readGoal(vm, address)
```

Build the `mq3.botlib.ai_resource_pools.Goal` result for `readGoal`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm record; accesses `data`. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state_syscalls.ml#L25)

<a id="function-function-mq3-botlib-ai-goal-state-syscalls-vector-function-vector-data-address-src-mq3-botlib-ai-goal-state-syscalls-ml-77616868"></a>
### vector

```ml
function vector(data, address)
```

Return a new array `[n.bitsFloat(n.readI32(data,address)),n.bitsFloat(n.readI32(data,address+4)),n.bitsFloat(n.readI32(data,address+8))]` for `vector`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.readI32`. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state_syscalls.ml#L16)

<a id="function-function-mq3-botlib-ai-goal-state-syscalls-writegoal-function-writegoal-vm-address-goal-src-mq3-botlib-ai-goal-state-syscalls-ml-1894277060"></a>
### writeGoal

```ml
function writeGoal(vm, address, goal)
```

Apply `mq3.vm.syscall_common.pointer` and `mq3.botlib.ai_goal_state_syscalls.writeVector` while evaluating `writeGoal`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm record; accesses `data`. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `origin`, `areaNum`, `mins`, `maxs` and `entityNum` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state_syscalls.ml#L33)

<a id="function-function-mq3-botlib-ai-goal-state-syscalls-writevector-function-writevector-data-address-value-src-mq3-botlib-ai-goal-state-syscalls-ml-536031715"></a>
### writeVector

```ml
function writeVector(data, address, value)
```

Write three float bit patterns to consecutive VM memory words for ai goal state syscalls.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.writeU32`. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `value` | `dynamic` | — | Array or byte sequence accessed at `axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_state_syscalls.ml#L21)
