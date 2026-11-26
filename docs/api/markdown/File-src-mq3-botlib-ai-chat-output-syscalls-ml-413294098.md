# `src/mq3/botlib/ai_chat_output_syscalls.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_chat_output_syscalls`](Package-mq3-botlib-ai-chat-output-syscalls-2080661790.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/ai_chat_output.ml` as `chatOutput` → [src/mq3/botlib/ai_chat_output.ml](File-src-mq3-botlib-ai-chat-output-ml-737978343.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)

## Declarations

<a id="function-function-mq3-botlib-ai-chat-output-syscalls-dispatch-function-dispatch-state-vm-base-op-src-mq3-botlib-ai-chat-output-syscalls-ml-1526963408"></a>
### dispatch

```ml
function dispatch(state, vm, base, op)
```

Apply `mq3.vm.syscall_common.argument`, `mq3.vm.syscall_common.readString` and `mq3.botlib.ai_chat_output_syscalls.variables` while evaluating `dispatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat output state; accesses `profiles`. |
| `vm` | `dynamic` | — | VM instance owning the syscall memory and state. |
| `base` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `op` | `dynamic` | — | Numeric syscall operation identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output_syscalls.ml#L24)

<a id="function-function-mq3-botlib-ai-chat-output-syscalls-optionalstring-function-optionalstring-vm-pointer-src-mq3-botlib-ai-chat-output-syscalls-ml-994288460"></a>
### optionalString

```ml
function optionalString(vm, pointer)
```

Apply `mq3.vm.syscall_common.readString` while evaluating `optionalString`. Return paths include `common.readString(vm,pointer)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | VM instance owning the syscall memory and state. |
| `pointer` | `dynamic` | — | Value used by `pointer` in `if value==0 then return fail(label+" is NULL") end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output_syscalls.ml#L11)

<a id="function-function-mq3-botlib-ai-chat-output-syscalls-variables-function-variables-vm-base-start-src-mq3-botlib-ai-chat-output-syscalls-ml-348445676"></a>
### variables

```ml
function variables(vm, base, start)
```

Apply `mq3.botlib.ai_chat_output_syscalls.optionalString` and `mq3.vm.syscall_common.argument` while evaluating `variables`. Return paths include `values`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | VM instance owning the syscall memory and state. |
| `base` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `start` | `dynamic` | — | Value used by `variables` in `for index=0 to 7 value=optionalString(vm,common.argument(vm,base,start+index))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_chat_output_syscalls.ml#L16)
