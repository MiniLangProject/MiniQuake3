# `src/mq3/botlib/aas_client_movement_syscalls.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.aas_client_movement_syscalls`](Package-mq3-botlib-aas-client-movement-syscalls-718024788.md)

Reachable from entry: **yes**

## Imports

- `mq3/botlib/aas_client_movement.ml` as `aasClientMovement` → [src/mq3/botlib/aas_client_movement.ml](File-src-mq3-botlib-aas-client-movement-ml-551897611.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)

## Declarations

<a id="constant-constant-mq3-botlib-aas-client-movement-syscalls-aas-clientmove-size-const-aas-clientmove-size-84-src-mq3-botlib-aas-client-movement-syscalls-ml-1517494145"></a>
### AAS_CLIENTMOVE_SIZE

```ml
const AAS_CLIENTMOVE_SIZE = 84
```

Byte size of the AAS client movement prediction record in the bot VM ABI or serialized representation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement_syscalls.ml#L11)

<a id="function-function-mq3-botlib-aas-client-movement-syscalls-dispatch-function-dispatch-services-vm-base-src-mq3-botlib-aas-client-movement-syscalls-ml-2129030112"></a>
### dispatch

```ml
function dispatch(services, vm, base)
```

Apply `mq3.vm.syscall_common.pointer`, `mq3.vm.syscall_common.argument` and `mq3.vm.syscall_common.readFloatVector` while evaluating `dispatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | S record; accesses `settings`. |
| `vm` | `dynamic` | — | Vm record; accesses `data`. |
| `base` | `dynamic` | — | Address within the VM memory or native data buffer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement_syscalls.ml#L21)

<a id="function-function-mq3-botlib-aas-client-movement-syscalls-writevector-function-writevector-data-address-value-src-mq3-botlib-aas-client-movement-syscalls-ml-1333138845"></a>
### writeVector

```ml
function writeVector(data, address, value)
```

Write three float bit patterns to consecutive VM memory words for aas client movement syscalls.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.writeU32`. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `value` | `dynamic` | — | Array or byte sequence accessed at `axis`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/aas_client_movement_syscalls.ml#L16)
