# `src/mq3/botlib/ai_resource_syscalls.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_resource_syscalls`](Package-mq3-botlib-ai-resource-syscalls-772366270.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/ai_resource_pools.ml` as `resources` → [src/mq3/botlib/ai_resource_pools.ml](File-src-mq3-botlib-ai-resource-pools-ml-103445473.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)

## Declarations

<a id="function-function-mq3-botlib-ai-resource-syscalls-dispatch-function-dispatch-pools-vm-base-op-src-mq3-botlib-ai-resource-syscalls-ml-1123750380"></a>
### dispatch

```ml
function dispatch(pools, vm, base, op)
```

Apply `mq3.vm.syscall_common.argument`, `mq3.botlib.ai_resource_pools.allocChatState` and `mq3.botlib.ai_resource_pools.freeChatState` while evaluating `dispatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — | Bot resource pools; accesses `chatStates`. May update `pools.chatStates[handle]` in place. |
| `vm` | `dynamic` | — | VM instance owning the syscall memory and state. |
| `base` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `op` | `dynamic` | — | Numeric syscall operation identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_resource_syscalls.ml#L13)
