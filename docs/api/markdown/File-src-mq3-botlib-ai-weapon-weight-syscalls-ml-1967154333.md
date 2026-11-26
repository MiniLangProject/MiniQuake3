# `src/mq3/botlib/ai_weapon_weight_syscalls.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_weapon_weight_syscalls`](Package-mq3-botlib-ai-weapon-weight-syscalls-1156879547.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/ai_weapon_weights.ml` as `weaponWeights` → [src/mq3/botlib/ai_weapon_weights.ml](File-src-mq3-botlib-ai-weapon-weights-ml-776993711.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)

## Declarations

<a id="function-function-mq3-botlib-ai-weapon-weight-syscalls-dispatch-function-dispatch-runtime-pools-vm-base-op-src-mq3-botlib-ai-weapon-weight-syscalls-ml-190831686"></a>
### dispatch

```ml
function dispatch(runtime, pools, vm, base, op)
```

Apply `mq3.vm.syscall_common.readString`, `mq3.vm.syscall_common.argument` and `mq3.botlib.ai_weapon_weights.loadWeaponWeights` while evaluating `dispatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI weapon weights runtime; accesses `fuzzyRuntime`. |
| `pools` | `dynamic` | — | Bot resource pools; accesses `weaponStates`. |
| `vm` | `dynamic` | — | VM instance owning the syscall memory and state. |
| `base` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `op` | `dynamic` | — | Numeric syscall operation identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_weight_syscalls.ml#L11)
