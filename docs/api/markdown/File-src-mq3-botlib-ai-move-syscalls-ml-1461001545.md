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

Apply `mq3.botlib.ai_goal_state_syscalls.readGoal`, `mq3.vm.syscall_common.argument` and `mq3.botlib.ai_move_runtime.moveToGoal` while evaluating `dispatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI move runtime; accesses `router`, `pools`, `services` and `aas`. |
| `vm` | `dynamic` | — | Vm record; accesses `data`. |
| `base` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `op` | `dynamic` | — | Numeric syscall operation identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_syscalls.ml#L42)

<a id="constant-constant-mq3-botlib-ai-move-syscalls-init-move-size-const-init-move-size-68-src-mq3-botlib-ai-move-syscalls-ml-1051044427"></a>
### INIT_MOVE_SIZE

```ml
const INIT_MOVE_SIZE = 68
```

Byte size of the init move record in the bot VM ABI or serialized representation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_syscalls.ml#L12)

<a id="constant-constant-mq3-botlib-ai-move-syscalls-move-result-size-const-move-result-size-52-src-mq3-botlib-ai-move-syscalls-ml-1759370002"></a>
### MOVE_RESULT_SIZE

```ml
const MOVE_RESULT_SIZE = 52
```

Byte size of the move result record in the bot VM ABI or serialized representation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_syscalls.ml#L14)

<a id="function-function-mq3-botlib-ai-move-syscalls-readinitmove-function-readinitmove-vm-address-src-mq3-botlib-ai-move-syscalls-ml-83025603"></a>
### readInitMove

```ml
function readInitMove(vm, address)
```

Build the `mq3.botlib.ai_move_runtime.InitMove` result for `readInitMove`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm record; accesses `data`. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_syscalls.ml#L23)

<a id="function-function-mq3-botlib-ai-move-syscalls-writemoveresult-function-writemoveresult-vm-address-value-src-mq3-botlib-ai-move-syscalls-ml-559726452"></a>
### writeMoveResult

```ml
function writeMoveResult(vm, address, value)
```

Apply `mq3.vm.syscall_common.pointer` and `mq3.botlib.ai_move_syscalls.writeMoveVector` while evaluating `writeMoveResult`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm record; accesses `data`. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `value` | `dynamic` | — | Value record; accesses `failure`, `blocked`, `type`, `blockEntity` and `travelType` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_syscalls.ml#L33)

<a id="function-function-mq3-botlib-ai-move-syscalls-writemovevector-function-writemovevector-data-address-value-src-mq3-botlib-ai-move-syscalls-ml-1278603157"></a>
### writeMoveVector

```ml
function writeMoveVector(data, address, value)
```

Write a movement vector as three consecutive float words in VM memory.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.writeU32`. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `value` | `dynamic` | — | Array or byte sequence accessed at `axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_move_syscalls.ml#L19)
