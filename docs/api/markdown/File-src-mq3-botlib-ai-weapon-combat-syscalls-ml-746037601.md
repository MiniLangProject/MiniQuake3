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

Apply `mq3.botlib.ai_weapon_combat_syscalls.readInventory`, `mq3.vm.syscall_common.argument` and `mq3.botlib.ai_weapon_combat.chooseBestFightWeapon` while evaluating `dispatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | AI weapon combat runtime; accesses `config`. |
| `pools` | `dynamic` | — | Bot resource pools; accesses `weaponStates`. |
| `vm` | `dynamic` | — | VM instance owning the syscall memory and state. |
| `base` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `op` | `dynamic` | — | Numeric syscall operation identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_combat_syscalls.ml#L26)

<a id="constant-constant-mq3-botlib-ai-weapon-combat-syscalls-inventory-count-const-inventory-count-256-src-mq3-botlib-ai-weapon-combat-syscalls-ml-2143757898"></a>
### INVENTORY_COUNT

```ml
const INVENTORY_COUNT = 256
```

Number of inventory integer slots read from the bot VM ABI.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_combat_syscalls.ml#L10)

<a id="function-function-mq3-botlib-ai-weapon-combat-syscalls-readinventory-function-readinventory-vm-address-src-mq3-botlib-ai-weapon-combat-syscalls-ml-427997881"></a>
### readInventory

```ml
function readInventory(vm, address)
```

Apply `mq3.vm.syscall_common.pointer` while evaluating `readInventory`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm record; accesses `data`. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_weapon_combat_syscalls.ml#L15)
