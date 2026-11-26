# `src/mq3/botlib/elementary_action_syscalls.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.elementary_action_syscalls`](Package-mq3-botlib-elementary-action-syscalls-944978928.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/elementary_actions.ml` as `ea` → [src/mq3/botlib/elementary_actions.ml](File-src-mq3-botlib-elementary-actions-ml-737481412.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)

## Declarations

<a id="function-function-mq3-botlib-elementary-action-syscalls-dispatch-function-dispatch-state-vm-base-op-src-mq3-botlib-elementary-action-syscalls-ml-1529924522"></a>
### dispatch

```ml
function dispatch(state, vm, base, op)
```

Apply `mq3.vm.syscall_common.argument`, `mq3.vm.syscall_common.readString` and `mq3.botlib.elementary_actions.say` while evaluating `dispatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Elementary actions state; accesses `commandFn`, `context` and `commandCount`. May update `state.commandCount` in place. |
| `vm` | `dynamic` | — | Vm record; accesses `data`. |
| `base` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `op` | `dynamic` | — | Numeric syscall operation identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/elementary_action_syscalls.ml#L19)

<a id="function-function-mq3-botlib-elementary-action-syscalls-farg-function-farg-vm-base-index-src-mq3-botlib-elementary-action-syscalls-ml-2130824560"></a>
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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/elementary_action_syscalls.ml#L13)
