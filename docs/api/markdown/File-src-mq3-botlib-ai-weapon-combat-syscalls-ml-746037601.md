# `src/mq3/botlib/ai_weapon_combat_syscalls.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_weapon_combat_syscalls`](Package-mq3-botlib-ai-weapon-combat-syscalls-767476939.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/ai_weapon_combat.ml` as `aiWeaponCombat` → [src/mq3/botlib/ai_weapon_combat.ml](File-src-mq3-botlib-ai-weapon-combat-ml-661609126.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)

## Declarations

<a id="function-function-mq3-botlib-ai-weapon-combat-syscalls-dispatch-function-dispatch-runtime-pools-vm-base-op-src-mq3-botlib-ai-weapon-combat-syscalls-ml-1083426734"></a>
### dispatch

```ml
function dispatch(runtime, pools, vm, base, op)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `pools` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `op` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_combat_syscalls.ml#L16)

<a id="constant-constant-mq3-botlib-ai-weapon-combat-syscalls-inventory-count-const-inventory-count-256-src-mq3-botlib-ai-weapon-combat-syscalls-ml-2143757898"></a>
### INVENTORY_COUNT

```ml
const INVENTORY_COUNT = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_combat_syscalls.ml#L9)

<a id="function-function-mq3-botlib-ai-weapon-combat-syscalls-readinventory-function-readinventory-vm-address-src-mq3-botlib-ai-weapon-combat-syscalls-ml-427997881"></a>
### readInventory

```ml
function readInventory(vm, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/botlib/ai_weapon_combat_syscalls.ml#L11)
