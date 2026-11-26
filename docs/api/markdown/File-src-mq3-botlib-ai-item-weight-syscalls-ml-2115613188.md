# `src/mq3/botlib/ai_item_weight_syscalls.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_item_weight_syscalls`](Package-mq3-botlib-ai-item-weight-syscalls-467645396.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/ai_item_weights.ml` as `weights` → [src/mq3/botlib/ai_item_weights.ml](File-src-mq3-botlib-ai-item-weights-ml-1163821802.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)

## Declarations

<a id="function-function-mq3-botlib-ai-item-weight-syscalls-dispatch-function-dispatch-runtime-pools-vm-base-op-src-mq3-botlib-ai-item-weight-syscalls-ml-1807082926"></a>
### dispatch

```ml
function dispatch(runtime, pools, vm, base, op)
```

Apply `mq3.vm.syscall_common.argument`, `mq3.vm.syscall_common.readString` and `mq3.botlib.ai_item_weights.loadItemWeights` while evaluating `dispatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI item weights runtime; accesses `reloadCharacters` and `configs`. May update `runtime.configs` in place. |
| `pools` | `dynamic` | — | Bot resource pools; accesses `goalStates`. |
| `vm` | `dynamic` | — | VM instance owning the syscall memory and state. |
| `base` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `op` | `dynamic` | — | Numeric syscall operation identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_item_weight_syscalls.ml#L13)
