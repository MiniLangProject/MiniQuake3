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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_state_syscalls.ml#L10)

<a id="function-function-mq3-botlib-ai-goal-state-syscalls-dispatch-function-dispatch-runtime-vm-base-op-src-mq3-botlib-ai-goal-state-syscalls-ml-1611876787"></a>
### dispatch

```ml
function dispatch(runtime, vm, base, op)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `op` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_state_syscalls.ml#L24)

<a id="function-function-mq3-botlib-ai-goal-state-syscalls-readgoal-function-readgoal-vm-address-src-mq3-botlib-ai-goal-state-syscalls-ml-742361983"></a>
### readGoal

```ml
function readGoal(vm, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_state_syscalls.ml#L14)

<a id="function-function-mq3-botlib-ai-goal-state-syscalls-vector-function-vector-data-address-src-mq3-botlib-ai-goal-state-syscalls-ml-77616868"></a>
### vector

```ml
function vector(data, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_state_syscalls.ml#L12)

<a id="function-function-mq3-botlib-ai-goal-state-syscalls-writegoal-function-writegoal-vm-address-goal-src-mq3-botlib-ai-goal-state-syscalls-ml-1894277060"></a>
### writeGoal

```ml
function writeGoal(vm, address, goal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_state_syscalls.ml#L18)

<a id="function-function-mq3-botlib-ai-goal-state-syscalls-writevector-function-writevector-data-address-value-src-mq3-botlib-ai-goal-state-syscalls-ml-536031715"></a>
### writeVector

```ml
function writeVector(data, address, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_goal_state_syscalls.ml#L13)
