# `src/mq3/botlib/ai_map_goal_syscalls.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_map_goal_syscalls`](Package-mq3-botlib-ai-map-goal-syscalls-1235187094.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/ai_map_goals.ml` as `mapGoals` → [src/mq3/botlib/ai_map_goals.ml](File-src-mq3-botlib-ai-map-goals-ml-805849506.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)

## Declarations

<a id="constant-constant-mq3-botlib-ai-map-goal-syscalls-bot-goal-size-const-bot-goal-size-56-src-mq3-botlib-ai-map-goal-syscalls-ml-1178839204"></a>
### BOT_GOAL_SIZE

```ml
const BOT_GOAL_SIZE = 56
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_map_goal_syscalls.ml#L9)

<a id="function-function-mq3-botlib-ai-map-goal-syscalls-dispatch-function-dispatch-state-vm-base-op-src-mq3-botlib-ai-map-goal-syscalls-ml-1846804950"></a>
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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_map_goal_syscalls.ml#L16)

<a id="function-function-mq3-botlib-ai-map-goal-syscalls-writeselectedgoal-function-writeselectedgoal-vm-address-goal-src-mq3-botlib-ai-map-goal-syscalls-ml-1212235518"></a>
### writeSelectedGoal

```ml
function writeSelectedGoal(vm, address, goal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_map_goal_syscalls.ml#L11)

<a id="function-function-mq3-botlib-ai-map-goal-syscalls-writevector-function-writevector-data-address-value-src-mq3-botlib-ai-map-goal-syscalls-ml-1264979321"></a>
### writeVector

```ml
function writeVector(data, address, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_map_goal_syscalls.ml#L10)
