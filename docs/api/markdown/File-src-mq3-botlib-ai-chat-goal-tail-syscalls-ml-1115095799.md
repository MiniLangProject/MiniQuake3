# `src/mq3/botlib/ai_chat_goal_tail_syscalls.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_chat_goal_tail_syscalls`](Package-mq3-botlib-ai-chat-goal-tail-syscalls-962488907.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/ai_chat_goal_tail.ml` as `tail` → [src/mq3/botlib/ai_chat_goal_tail.ml](File-src-mq3-botlib-ai-chat-goal-tail-ml-1426920332.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)

## Declarations

<a id="function-function-mq3-botlib-ai-chat-goal-tail-syscalls-dispatch-function-dispatch-state-vm-base-op-src-mq3-botlib-ai-chat-goal-tail-syscalls-ml-824830294"></a>
### dispatch

```ml
function dispatch(state, vm, base, op)
```

Apply `mq3.vm.syscall_common.argument`, `mq3.vm.syscall_common.readString` and `mq3.botlib.ai_chat_goal_tail.numInitialChats` while evaluating `dispatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI chat goal tail state; accesses `chatProfiles`. |
| `vm` | `dynamic` | — | VM instance owning the syscall memory and state. |
| `base` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `op` | `dynamic` | — | Numeric syscall operation identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_goal_tail_syscalls.ml#L14)
