# `src/mq3/botlib/ai_chat_string_syscalls.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_chat_string_syscalls`](Package-mq3-botlib-ai-chat-string-syscalls-169188038.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/ai_chat_profiles.ml` as `chatProfiles` → [src/mq3/botlib/ai_chat_profiles.ml](File-src-mq3-botlib-ai-chat-profiles-ml-1781106722.md)
- `mq3/botlib/ai_chat_strings.ml` as `chatStrings` → [src/mq3/botlib/ai_chat_strings.ml](File-src-mq3-botlib-ai-chat-strings-ml-176982668.md)
- `mq3/botlib/ai_chat_syscalls.ml` as `profileSyscalls` → [src/mq3/botlib/ai_chat_syscalls.ml](File-src-mq3-botlib-ai-chat-syscalls-ml-1875910582.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)

## Declarations

<a id="function-function-mq3-botlib-ai-chat-string-syscalls-dispatch-function-dispatch-stringsstate-profilestate-vm-base-op-src-mq3-botlib-ai-chat-string-syscalls-ml-1687162568"></a>
### dispatch

```ml
function dispatch(stringsState, profileState, vm, base, op)
```

Apply `mq3.vm.syscall_common.argument`, `mq3.vm.syscall_common.readString` and `mq3.botlib.ai_chat_string_syscalls.mutate` while evaluating `dispatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `stringsState` | `dynamic` | — | AI chat strings state; accesses `groups`. |
| `profileState` | `dynamic` | — | AI chat profiles state; accesses `pools`, `reload` and `cache`. May update `profileState.cache` in place. |
| `vm` | `dynamic` | — | VM instance owning the syscall memory and state. |
| `base` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `op` | `dynamic` | — | Numeric syscall operation identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_string_syscalls.ml#L25)

<a id="function-function-mq3-botlib-ai-chat-string-syscalls-mutate-function-mutate-vm-address-value-label-src-mq3-botlib-ai-chat-string-syscalls-ml-319469836"></a>
### mutate

```ml
function mutate(vm, address, value, label)
```

Apply `mq3.vm.syscall_common.pointer` and `mq3.vm.syscall_common.writeBuffer` while evaluating `mutate`. Return paths include `common.writeBuffer(vm,address,chatStrings.MAX_MESSAGE_SIZE,value,label)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | VM instance owning the syscall memory and state. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `value` | `dynamic` | — | Array or byte sequence accessed at `at+count`. Entries are written in place. |
| `label` | `dynamic` | — | Label retained with the diagnostic or action record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_chat_string_syscalls.ml#L15)
