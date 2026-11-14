# `src/mq3/vm/syscall_cgame.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.vm.syscall_cgame`](Package-mq3-vm-syscall-cgame-5084556.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/cgame_key_traps.ml` as `keyTraps` → [src/mq3/vm/cgame_key_traps.ml](File-src-mq3-vm-cgame-key-traps-ml-2020826655.md)
- `mq3/vm/cgame_pc_traps.ml` as `pcTraps` → [src/mq3/vm/cgame_pc_traps.ml](File-src-mq3-vm-cgame-pc-traps-ml-1555701781.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)

## Declarations

<a id="function-function-mq3-vm-syscall-cgame-arg-function-arg-vm-base-index-src-mq3-vm-syscall-cgame-ml-1687270014"></a>
### arg

```ml
function arg(vm, base, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_cgame.ml#L50)

- [mq3.vm.syscall_cgame.BytesResult](Type-mq3-vm-syscall-cgame-bytesresult-1324674204.md) — struct
<a id="function-function-mq3-vm-syscall-cgame-callback-function-callback-host-src-mq3-vm-syscall-cgame-ml-2086062176"></a>
### callback

```ml
function callback(host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_cgame.ml#L144)

<a id="function-function-mq3-vm-syscall-cgame-currentsnapshotnumber-function-currentsnapshotnumber-vm-base-host-src-mq3-vm-syscall-cgame-ml-1578320780"></a>
### currentSnapshotNumber

```ml
function currentSnapshotNumber(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_cgame.ml#L73)

<a id="function-function-mq3-vm-syscall-cgame-dispatch-function-dispatch-host-vm-base-src-mq3-vm-syscall-cgame-ml-1136731308"></a>
### dispatch

```ml
function dispatch(host, vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_cgame.ml#L137)

<a id="function-function-mq3-vm-syscall-cgame-dispatchspecific-function-dispatchspecific-vm-base-host-op-src-mq3-vm-syscall-cgame-ml-201136029"></a>
### dispatchSpecific

```ml
function dispatchSpecific(vm, base, host, op)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `op` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_cgame.ml#L102)

<a id="function-function-mq3-vm-syscall-cgame-exactoutput-function-exactoutput-vm-address-data-size-label-src-mq3-vm-syscall-cgame-ml-1694933178"></a>
### exactOutput

```ml
function exactOutput(vm, address, data, size, label)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_cgame.ml#L52)

<a id="function-function-mq3-vm-syscall-cgame-fixedstate-function-fixedstate-vm-base-host-callback-size-name-src-mq3-vm-syscall-cgame-ml-768185987"></a>
### fixedState

```ml
function fixedState(vm, base, host, callback, size, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `callback` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_cgame.ml#L68)

<a id="constant-constant-mq3-vm-syscall-cgame-gamestate-size-const-gamestate-size-20100-src-mq3-vm-syscall-cgame-ml-1649345948"></a>
### GAMESTATE_SIZE

```ml
const GAMESTATE_SIZE = 20100
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_cgame.ml#L10)

<a id="function-function-mq3-vm-syscall-cgame-getservercommand-function-getservercommand-vm-base-host-src-mq3-vm-syscall-cgame-ml-1211872812"></a>
### getServerCommand

```ml
function getServerCommand(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_cgame.ml#L91)

<a id="constant-constant-mq3-vm-syscall-cgame-glconfig-size-const-glconfig-size-11332-src-mq3-vm-syscall-cgame-ml-617663855"></a>
### GLCONFIG_SIZE

```ml
const GLCONFIG_SIZE = 11332
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_cgame.ml#L13)

<a id="function-function-mq3-vm-syscall-cgame-registerasset-function-registerasset-vm-base-host-callback-name-src-mq3-vm-syscall-cgame-ml-707987810"></a>
### registerAsset

```ml
function registerAsset(vm, base, host, callback, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `callback` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_cgame.ml#L63)

<a id="function-function-mq3-vm-syscall-cgame-services-function-services-shared-context-src-mq3-vm-syscall-cgame-ml-1801255762"></a>
### services

```ml
function services(shared, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shared` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_cgame.ml#L45)

- [mq3.vm.syscall_cgame.Services](Type-mq3-vm-syscall-cgame-services-1633463978.md) — struct
<a id="function-function-mq3-vm-syscall-cgame-setusercmdvalue-function-setusercmdvalue-vm-base-host-src-mq3-vm-syscall-cgame-ml-1134407664"></a>
### setUserCmdValue

```ml
function setUserCmdValue(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_cgame.ml#L97)

<a id="constant-constant-mq3-vm-syscall-cgame-snapshot-size-const-snapshot-size-53772-src-mq3-vm-syscall-cgame-ml-1396102329"></a>
### SNAPSHOT_SIZE

```ml
const SNAPSHOT_SIZE = 53772
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_cgame.ml#L11)

- [mq3.vm.syscall_cgame.SnapshotNumber](Type-mq3-vm-syscall-cgame-snapshotnumber-2061525543.md) — struct
<a id="function-function-mq3-vm-syscall-cgame-stringevent-function-stringevent-vm-base-host-callback-name-src-mq3-vm-syscall-cgame-ml-1178835182"></a>
### stringEvent

```ml
function stringEvent(vm, base, host, callback, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `callback` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_cgame.ml#L58)

<a id="function-function-mq3-vm-syscall-cgame-unavailable-function-unavailable-name-src-mq3-vm-syscall-cgame-ml-842356419"></a>
### unavailable

```ml
function unavailable(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_cgame.ml#L49)

<a id="constant-constant-mq3-vm-syscall-cgame-usercmd-size-const-usercmd-size-24-src-mq3-vm-syscall-cgame-ml-160644467"></a>
### USERCMD_SIZE

```ml
const USERCMD_SIZE = 24
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_cgame.ml#L12)

<a id="function-function-mq3-vm-syscall-cgame-variablestate-function-variablestate-vm-base-host-callback-size-name-src-mq3-vm-syscall-cgame-ml-1805670625"></a>
### variableState

```ml
function variableState(vm, base, host, callback, size, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `callback` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_cgame.ml#L83)
