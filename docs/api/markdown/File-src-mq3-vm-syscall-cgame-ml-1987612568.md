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

Return `mq3.vm.syscall_common.argument(vm, base, index)` from `vm.syscall_cgame.arg`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.argument`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.vm.syscall_common.argument`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L102)

- [mq3.vm.syscall_cgame.BytesResult](Type-mq3-vm-syscall-cgame-bytesresult-1324674204.md) — struct
<a id="function-function-mq3-vm-syscall-cgame-callback-function-callback-host-src-mq3-vm-syscall-cgame-ml-2086062176"></a>
### callback

```ml
function callback(host)
```

Apply `mq3.vm.syscall_cgame.dispatch` for callback in vm.syscall_cgame.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.vm.syscall_cgame.dispatch`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L255)

<a id="function-function-mq3-vm-syscall-cgame-currentsnapshotnumber-function-currentsnapshotnumber-vm-base-host-src-mq3-vm-syscall-cgame-ml-1578320780"></a>
### currentSnapshotNumber

```ml
function currentSnapshotNumber(vm, base, host)
```

Compute current snapshot number in vm.syscall_cgame; the normal completion returns `0`.

Validation failures include `cgame syscall: invalid current snapshot result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_cgame.arg`. |
| `host` | `dynamic` | — | Record exposing `getCurrentSnapshotNumberFn`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L156)

<a id="function-function-mq3-vm-syscall-cgame-dispatch-function-dispatch-host-vm-base-src-mq3-vm-syscall-cgame-ml-1136731308"></a>
### dispatch

```ml
function dispatch(host, vm, base)
```

Dispatch syscall cgame in vm.syscall_cgame; the normal completion returns `dispatchSpecific(vm, base, host, op)`.

Validation failures include `cgame syscall: invalid dispatcher context`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `shared`. |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.argument`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L246)

<a id="function-function-mq3-vm-syscall-cgame-dispatchspecific-function-dispatchspecific-vm-base-host-op-src-mq3-vm-syscall-cgame-ml-201136029"></a>
### dispatchSpecific

```ml
function dispatchSpecific(vm, base, host, op)
```

Dispatch specific in vm.syscall_cgame; the normal completion returns `error(3422, ("cgame syscall: unsupported client trap " + str(op)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_cgame.stringEvent`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_cgame.stringEvent`. |
| `host` | `dynamic` | — | Record exposing `addCommandFn`, `sendClientCommandFn`, `updateScreenFn`, `context`, `loadWorldFn`, `registerModelFn`, `registerSkinFn` and further fields. |
| `op` | `dynamic` | — | Op used in `str(op)` and `host.extendedFn(host.context, vm, base, op)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L205)

<a id="function-function-mq3-vm-syscall-cgame-exactoutput-function-exactoutput-vm-address-data-size-label-src-mq3-vm-syscall-cgame-ml-1694933178"></a>
### exactOutput

```ml
function exactOutput(vm, address, data, size, label)
```

Compute exact output in vm.syscall_cgame; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.writeRaw`. |
| `address` | `dynamic` | — | Value passed as `value` to `mq3.vm.syscall_common.writeRaw`. |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.vm.syscall_common.writeRaw`. |
| `size` | `dynamic` | — | Count passed as `count` to `mq3.vm.syscall_common.writeRaw`. |
| `label` | `dynamic` | — | Label used in `(label + " output")` and `("cgame syscall: invalid " + label)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L110)

<a id="function-function-mq3-vm-syscall-cgame-fixedstate-function-fixedstate-vm-base-host-callback-size-name-src-mq3-vm-syscall-cgame-ml-768185987"></a>
### fixedState

```ml
function fixedState(vm, base, host, callback, size, name)
```

Compute fixed state in vm.syscall_cgame; the normal completion returns `exactOutput(vm, arg(vm, base, 1), callback(host.context), size, name)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_cgame.exactOutput`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_cgame.arg`. |
| `host` | `dynamic` | — | Record exposing `context`. |
| `callback` | `dynamic` | — | Callback invoked for callback; the call sites below define the callback arguments. |
| `size` | `dynamic` | — | Size passed as `size` to `mq3.vm.syscall_cgame.exactOutput`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.vm.syscall_cgame.unavailable`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L145)

<a id="constant-constant-mq3-vm-syscall-cgame-gamestate-size-const-gamestate-size-20100-src-mq3-vm-syscall-cgame-ml-1649345948"></a>
### GAMESTATE_SIZE

```ml
const GAMESTATE_SIZE = 20100
```

Byte size used for gamestate storage or binary layout in mq3.vm.syscall_cgame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L11)

<a id="function-function-mq3-vm-syscall-cgame-getservercommand-function-getservercommand-vm-base-host-src-mq3-vm-syscall-cgame-ml-1211872812"></a>
### getServerCommand

```ml
function getServerCommand(vm, base, host)
```

Get server command in vm.syscall_cgame; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_cgame.arg`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_cgame.arg`. |
| `host` | `dynamic` | — | Record exposing `getServerCommandFn`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L185)

<a id="constant-constant-mq3-vm-syscall-cgame-glconfig-size-const-glconfig-size-11332-src-mq3-vm-syscall-cgame-ml-617663855"></a>
### GLCONFIG_SIZE

```ml
const GLCONFIG_SIZE = 11332
```

Byte size used for glconfig storage or binary layout in mq3.vm.syscall_cgame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L17)

<a id="function-function-mq3-vm-syscall-cgame-registerasset-function-registerasset-vm-base-host-callback-name-src-mq3-vm-syscall-cgame-ml-707987810"></a>
### registerAsset

```ml
function registerAsset(vm, base, host, callback, name)
```

Register asset in vm.syscall_cgame; the normal completion returns `callback(host.context, common.readString(vm, arg(vm, base, 1)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.readString`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_cgame.arg`. |
| `host` | `dynamic` | — | Record exposing `context`. |
| `callback` | `dynamic` | — | Callback invoked for callback; the call sites below define the callback arguments. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.vm.syscall_cgame.unavailable`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L133)

<a id="function-function-mq3-vm-syscall-cgame-services-function-services-shared-context-src-mq3-vm-syscall-cgame-ml-1801255762"></a>
### services

```ml
function services(shared, context)
```

Create `mq3.vm.syscall_cgame.Services` with shared=shared; context=context; addCommandFn=void; removeCommandFn=void; 20 further fields.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shared` | `dynamic` | — | Initial `shared` field stored in the returned or constructed `mq3.vm.syscall_cgame.Services` record. |
| `context` | `dynamic` | — | Initial `context` field stored in the returned or constructed `mq3.vm.syscall_cgame.Services` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L91)

- [mq3.vm.syscall_cgame.Services](Type-mq3-vm-syscall-cgame-services-1633463978.md) — struct
<a id="function-function-mq3-vm-syscall-cgame-setusercmdvalue-function-setusercmdvalue-vm-base-host-src-mq3-vm-syscall-cgame-ml-1134407664"></a>
### setUserCmdValue

```ml
function setUserCmdValue(vm, base, host)
```

Set user cmd value in vm.syscall_cgame; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_cgame.arg`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_cgame.arg`. |
| `host` | `dynamic` | — | Record exposing `setUserCmdValueFn`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L195)

<a id="constant-constant-mq3-vm-syscall-cgame-snapshot-size-const-snapshot-size-53772-src-mq3-vm-syscall-cgame-ml-1396102329"></a>
### SNAPSHOT_SIZE

```ml
const SNAPSHOT_SIZE = 53772
```

Byte size used for snapshot storage or binary layout in mq3.vm.syscall_cgame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L13)

- [mq3.vm.syscall_cgame.SnapshotNumber](Type-mq3-vm-syscall-cgame-snapshotnumber-2061525543.md) — struct
<a id="function-function-mq3-vm-syscall-cgame-stringevent-function-stringevent-vm-base-host-callback-name-src-mq3-vm-syscall-cgame-ml-1178835182"></a>
### stringEvent

```ml
function stringEvent(vm, base, host, callback, name)
```

Compute string event in vm.syscall_cgame; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.readString`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_cgame.arg`. |
| `host` | `dynamic` | — | Record exposing `context`. |
| `callback` | `dynamic` | — | Callback invoked for callback; the call sites below define the callback arguments. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.vm.syscall_cgame.unavailable`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L122)

<a id="function-function-mq3-vm-syscall-cgame-unavailable-function-unavailable-name-src-mq3-vm-syscall-cgame-ml-842356419"></a>
### unavailable

```ml
function unavailable(name)
```

Create the vm.syscall_cgame error for `unavailable` with 3422 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used in `("cgame syscall: " + name)` and `(("cgame syscall: " + name) + " service unavailable")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L97)

<a id="constant-constant-mq3-vm-syscall-cgame-usercmd-size-const-usercmd-size-24-src-mq3-vm-syscall-cgame-ml-160644467"></a>
### USERCMD_SIZE

```ml
const USERCMD_SIZE = 24
```

Byte size used for user command storage or binary layout in mq3.vm.syscall_cgame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L15)

<a id="function-function-mq3-vm-syscall-cgame-variablestate-function-variablestate-vm-base-host-callback-size-name-src-mq3-vm-syscall-cgame-ml-1805670625"></a>
### variableState

```ml
function variableState(vm, base, host, callback, size, name)
```

Compute variable state in vm.syscall_cgame; the normal completion returns `1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_cgame.arg`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_cgame.arg`. |
| `host` | `dynamic` | — | Record exposing `context`. |
| `callback` | `dynamic` | — | Callback invoked for callback; the call sites below define the callback arguments. |
| `size` | `dynamic` | — | Size passed as `size` to `mq3.vm.syscall_cgame.exactOutput`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.vm.syscall_cgame.unavailable`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_cgame.ml#L173)
