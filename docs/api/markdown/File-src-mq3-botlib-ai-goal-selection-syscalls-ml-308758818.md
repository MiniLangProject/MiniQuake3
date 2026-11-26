# `src/mq3/botlib/ai_goal_selection_syscalls.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_goal_selection_syscalls`](Package-mq3-botlib-ai-goal-selection-syscalls-869744760.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/ai_goal_selection.ml` as `goalSelection` → [src/mq3/botlib/ai_goal_selection.ml](File-src-mq3-botlib-ai-goal-selection-ml-603097719.md)
- `mq3/botlib/ai_goal_state_syscalls.ml` as `goalAbi` → [src/mq3/botlib/ai_goal_state_syscalls.ml](File-src-mq3-botlib-ai-goal-state-syscalls-ml-641639453.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)

## Declarations

<a id="function-function-mq3-botlib-ai-goal-selection-syscalls-dispatch-function-dispatch-runtime-vm-base-op-src-mq3-botlib-ai-goal-selection-syscalls-ml-1646639551"></a>
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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection_syscalls.ml#L17)

<a id="constant-constant-mq3-botlib-ai-goal-selection-syscalls-inventory-count-const-inventory-count-256-src-mq3-botlib-ai-goal-selection-syscalls-ml-903049230"></a>
### INVENTORY_COUNT

```ml
const INVENTORY_COUNT = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection_syscalls.ml#L9)

<a id="function-function-mq3-botlib-ai-goal-selection-syscalls-readinventory-function-readinventory-vm-address-src-mq3-botlib-ai-goal-selection-syscalls-ml-1302086663"></a>
### readInventory

```ml
function readInventory(vm, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection_syscalls.ml#L10)

<a id="function-function-mq3-botlib-ai-goal-selection-syscalls-readranks-function-readranks-vm-address-count-src-mq3-botlib-ai-goal-selection-syscalls-ml-589389304"></a>
### readRanks

```ml
function readRanks(vm, address, count)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection_syscalls.ml#L13)
