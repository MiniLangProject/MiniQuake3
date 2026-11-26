# `src/mq3/botlib/ai_avoid_spot_syscalls.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.ai_avoid_spot_syscalls`](Package-mq3-botlib-ai-avoid-spot-syscalls-446257284.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/ai_avoid_spots.ml` as `avoidSpots` → [src/mq3/botlib/ai_avoid_spots.ml](File-src-mq3-botlib-ai-avoid-spots-ml-627085596.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)

## Declarations

<a id="function-function-mq3-botlib-ai-avoid-spot-syscalls-dispatch-function-dispatch-pools-vm-base-src-mq3-botlib-ai-avoid-spot-syscalls-ml-463089239"></a>
### dispatch

```ml
function dispatch(pools, vm, base)
```

Apply `mq3.vm.syscall_common.readFloatVector`, `mq3.vm.syscall_common.argument` and `mq3.botlib.ai_avoid_spots.add` while evaluating `dispatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pools` | `dynamic` | — | Bot resource pools; accesses `moveStates`. |
| `vm` | `dynamic` | — | VM instance owning the syscall memory and state. |
| `base` | `dynamic` | — | Address within the VM memory or native data buffer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/ai_avoid_spot_syscalls.ml#L13)
