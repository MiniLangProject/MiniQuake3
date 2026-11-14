# `src/mq3/botlib/ai_move_syscalls.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_move_syscalls`](Package-mq3-botlib-ai-move-syscalls-934930769.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/ai_goal_state_syscalls.ml` as `goalAbi` → [src/mq3/botlib/ai_goal_state_syscalls.ml](File-src-mq3-botlib-ai-goal-state-syscalls-ml-641639453.md)
- `mq3/botlib/ai_move_runtime.ml` as `moveSyscallRuntime` → [src/mq3/botlib/ai_move_runtime.ml](File-src-mq3-botlib-ai-move-runtime-ml-1991141291.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)

## Declarations

<a id="function-function-mq3-botlib-ai-move-syscalls-dispatch-function-dispatch-runtime-vm-base-op-src-mq3-botlib-ai-move-syscalls-ml-53446799"></a>
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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_syscalls.ml#L24)

<a id="constant-constant-mq3-botlib-ai-move-syscalls-init-move-size-const-init-move-size-68-src-mq3-botlib-ai-move-syscalls-ml-1051044427"></a>
### INIT_MOVE_SIZE

```ml
const INIT_MOVE_SIZE = 68
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_syscalls.ml#L11)

<a id="constant-constant-mq3-botlib-ai-move-syscalls-move-result-size-const-move-result-size-52-src-mq3-botlib-ai-move-syscalls-ml-1759370002"></a>
### MOVE_RESULT_SIZE

```ml
const MOVE_RESULT_SIZE = 52
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_syscalls.ml#L12)

<a id="function-function-mq3-botlib-ai-move-syscalls-readinitmove-function-readinitmove-vm-address-src-mq3-botlib-ai-move-syscalls-ml-83025603"></a>
### readInitMove

```ml
function readInitMove(vm, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_syscalls.ml#L14)

<a id="function-function-mq3-botlib-ai-move-syscalls-writemoveresult-function-writemoveresult-vm-address-value-src-mq3-botlib-ai-move-syscalls-ml-559726452"></a>
### writeMoveResult

```ml
function writeMoveResult(vm, address, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_syscalls.ml#L20)

<a id="function-function-mq3-botlib-ai-move-syscalls-writemovevector-function-writemovevector-data-address-value-src-mq3-botlib-ai-move-syscalls-ml-1278603157"></a>
### writeMoveVector

```ml
function writeMoveVector(data, address, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_move_syscalls.ml#L13)
