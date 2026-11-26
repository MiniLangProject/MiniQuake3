# `src/mq3/botlib/ai_character_syscalls.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_character_syscalls`](Package-mq3-botlib-ai-character-syscalls-1132432385.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/ai_characters.ml` as `characters` → [src/mq3/botlib/ai_characters.ml](File-src-mq3-botlib-ai-characters-ml-311974577.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)

## Declarations

<a id="function-function-mq3-botlib-ai-character-syscalls-dispatch-function-dispatch-state-vm-base-op-src-mq3-botlib-ai-character-syscalls-ml-1109209610"></a>
### dispatch

```ml
function dispatch(state, vm, base, op)
```

Apply `mq3.vm.syscall_common.readString`, `mq3.vm.syscall_common.argument` and `mq3.botlib.ai_characters.loadCharacter` while evaluating `dispatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI characters state; accesses `readFn`. |
| `vm` | `dynamic` | — | VM instance owning the syscall memory and state. |
| `base` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `op` | `dynamic` | — | Numeric syscall operation identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_character_syscalls.ml#L19)

<a id="function-function-mq3-botlib-ai-character-syscalls-farg-function-farg-vm-base-index-src-mq3-botlib-ai-character-syscalls-ml-1476361772"></a>
### farg

```ml
function farg(vm, base, index)
```

Return the result of `n.bitsFloat(common.argument(vm,base,index))` for `farg`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | VM instance owning the syscall memory and state. |
| `base` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_character_syscalls.ml#L13)
