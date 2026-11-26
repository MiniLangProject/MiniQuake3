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

Byte size of the bot goal record in the bot VM ABI or serialized representation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_map_goal_syscalls.ml#L10)

<a id="function-function-mq3-botlib-ai-map-goal-syscalls-dispatch-function-dispatch-state-vm-base-op-src-mq3-botlib-ai-map-goal-syscalls-ml-1846804950"></a>
### dispatch

```ml
function dispatch(state, vm, base, op)
```

Apply `mq3.botlib.ai_map_goals.nextCampSpotGoal`, `mq3.vm.syscall_common.argument` and `mq3.botlib.ai_map_goal_syscalls.writeSelectedGoal` while evaluating `dispatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI map goals state; accesses `campSpots`. |
| `vm` | `dynamic` | — | VM instance owning the syscall memory and state. |
| `base` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `op` | `dynamic` | — | Numeric syscall operation identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_map_goal_syscalls.ml#L30)

<a id="function-function-mq3-botlib-ai-map-goal-syscalls-writeselectedgoal-function-writeselectedgoal-vm-address-goal-src-mq3-botlib-ai-map-goal-syscalls-ml-1212235518"></a>
### writeSelectedGoal

```ml
function writeSelectedGoal(vm, address, goal)
```

Apply `mq3.vm.syscall_common.pointer` and `mq3.botlib.ai_map_goal_syscalls.writeVector` while evaluating `writeSelectedGoal`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm record; accesses `data`. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `origin`, `areaNum`, `mins`, `maxs` and `entityNum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_map_goal_syscalls.ml#L20)

<a id="function-function-mq3-botlib-ai-map-goal-syscalls-writevector-function-writevector-data-address-value-src-mq3-botlib-ai-map-goal-syscalls-ml-1264979321"></a>
### writeVector

```ml
function writeVector(data, address, value)
```

Write three float bit patterns to consecutive VM memory words for ai map goal syscalls.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.writeU32`. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `value` | `dynamic` | — | Array or byte sequence accessed at `axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_map_goal_syscalls.ml#L15)
