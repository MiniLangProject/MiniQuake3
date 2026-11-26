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

Apply `mq3.vm.syscall_common.readFloatVector`, `mq3.vm.syscall_common.argument` and `mq3.botlib.ai_goal_selection_syscalls.readInventory` while evaluating `dispatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI goal selection runtime; accesses `goals` and `levelItems`. |
| `vm` | `dynamic` | — | Vm record; accesses `data`. |
| `base` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `op` | `dynamic` | — | Numeric syscall operation identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection_syscalls.ml#L30)

<a id="constant-constant-mq3-botlib-ai-goal-selection-syscalls-inventory-count-const-inventory-count-256-src-mq3-botlib-ai-goal-selection-syscalls-ml-903049230"></a>
### INVENTORY_COUNT

```ml
const INVENTORY_COUNT = 256
```

Number of inventory integer slots read from the bot VM ABI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection_syscalls.ml#L10)

<a id="function-function-mq3-botlib-ai-goal-selection-syscalls-readinventory-function-readinventory-vm-address-src-mq3-botlib-ai-goal-selection-syscalls-ml-1302086663"></a>
### readInventory

```ml
function readInventory(vm, address)
```

Apply `mq3.vm.syscall_common.pointer` while evaluating `readInventory`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm record; accesses `data`. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection_syscalls.ml#L14)

<a id="function-function-mq3-botlib-ai-goal-selection-syscalls-readranks-function-readranks-vm-address-count-src-mq3-botlib-ai-goal-selection-syscalls-ml-589389304"></a>
### readRanks

```ml
function readRanks(vm, address, count)
```

Apply `mq3.vm.syscall_common.pointer` while evaluating `readRanks`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm record; accesses `data`. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `count` | `dynamic` | — | Number of entries or bytes processed by this call. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_goal_selection_syscalls.ml#L21)
