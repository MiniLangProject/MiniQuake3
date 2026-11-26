# `src/mq3/botlib/ai_predict_visible_position_syscalls.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_predict_visible_position_syscalls`](Package-mq3-botlib-ai-predict-visible-position-syscalls-1666559232.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/ai_goal_state_syscalls.ml` as `goalAbi` → [src/mq3/botlib/ai_goal_state_syscalls.ml](File-src-mq3-botlib-ai-goal-state-syscalls-ml-641639453.md)
- `mq3/botlib/ai_predict_visible_position.ml` as `prediction` → [src/mq3/botlib/ai_predict_visible_position.ml](File-src-mq3-botlib-ai-predict-visible-position-ml-125650055.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)

## Declarations

<a id="function-function-mq3-botlib-ai-predict-visible-position-syscalls-dispatch-function-dispatch-runtime-vm-base-op-src-mq3-botlib-ai-predict-visible-position-syscalls-ml-2068268287"></a>
### dispatch

```ml
function dispatch(runtime, vm, base, op)
```

Apply `mq3.vm.syscall_common.readFloatVector`, `mq3.vm.syscall_common.argument` and `mq3.botlib.ai_goal_state_syscalls.readGoal` while evaluating `dispatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI predict visible position runtime; accesses `router`. |
| `vm` | `dynamic` | — | Vm record; accesses `data`. |
| `base` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `op` | `dynamic` | — | Numeric syscall operation identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_predict_visible_position_syscalls.ml#L20)

<a id="function-function-mq3-botlib-ai-predict-visible-position-syscalls-writevector-function-writevector-data-address-value-src-mq3-botlib-ai-predict-visible-position-syscalls-ml-1654829189"></a>
### writeVector

```ml
function writeVector(data, address, value)
```

Write three float bit patterns to consecutive VM memory words for ai predict visible position syscalls.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.writeU32`. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `value` | `dynamic` | — | Array or byte sequence accessed at `axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_predict_visible_position_syscalls.ml#L14)
