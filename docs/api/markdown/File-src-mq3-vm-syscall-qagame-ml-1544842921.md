# `src/mq3/vm/syscall_qagame.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.vm.syscall_qagame`](Package-mq3-vm-syscall-qagame-1919376177.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)
- `mq3/vm/syscall_qagame_world.ml` as `world` → [src/mq3/vm/syscall_qagame_world.ml](File-src-mq3-vm-syscall-qagame-world-ml-663586900.md)

## Declarations

<a id="function-function-mq3-vm-syscall-qagame-arg-function-arg-vm-base-index-src-mq3-vm-syscall-qagame-ml-464392852"></a>
### arg

```ml
function arg(vm, base, index)
```

Return `mq3.vm.syscall_common.argument(vm, base, index)` from `vm.syscall_qagame.arg`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.argument`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.vm.syscall_common.argument`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L60)

<a id="function-function-mq3-vm-syscall-qagame-brushmodel-function-brushmodel-vm-base-host-src-mq3-vm-syscall-qagame-ml-1956602340"></a>
### brushModel

```ml
function brushModel(vm, base, host)
```

Compute brush model in vm.syscall_qagame; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_qagame.opaque`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_qagame.arg`. |
| `host` | `dynamic` | — | Record exposing `setBrushModelFn`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L137)

<a id="function-function-mq3-vm-syscall-qagame-callback-function-callback-host-src-mq3-vm-syscall-qagame-ml-2146510780"></a>
### callback

```ml
function callback(host)
```

Apply `mq3.vm.syscall_qagame.dispatch` for callback in vm.syscall_qagame.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.vm.syscall_qagame.dispatch`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L299)

<a id="function-function-mq3-vm-syscall-qagame-debugpolygoncreate-function-debugpolygoncreate-vm-base-host-src-mq3-vm-syscall-qagame-ml-817040"></a>
### debugPolygonCreate

```ml
function debugPolygonCreate(vm, base, host)
```

Compute debug polygon create in vm.syscall_qagame; the normal completion returns `host.debugPolygonCreateFn(host.context, arg(vm, base, 1), points)`.

Validation failures include `qagame syscall: negative debug-polygon point count`; `qagame syscall: debug-polygon point count overflow`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_qagame.arg`. |
| `host` | `dynamic` | — | Record exposing `debugPolygonCreateFn`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L214)

<a id="function-function-mq3-vm-syscall-qagame-dispatch-function-dispatch-host-vm-base-src-mq3-vm-syscall-qagame-ml-85348628"></a>
### dispatch

```ml
function dispatch(host, vm, base)
```

Dispatch syscall qagame in vm.syscall_qagame; the normal completion returns `dispatchSpecific(vm, base, host, op)`.

Validation failures include `qagame syscall: invalid dispatcher context`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `shared`. |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.argument`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L290)

<a id="function-function-mq3-vm-syscall-qagame-dispatchspecific-function-dispatchspecific-vm-base-host-op-src-mq3-vm-syscall-qagame-ml-12328851"></a>
### dispatchSpecific

```ml
function dispatchSpecific(vm, base, host, op)
```

Dispatch specific in vm.syscall_qagame; the normal completion returns `error(3421, ("qagame syscall: unsupported server trap " + str(op)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_qagame_world.dispatch`. |
| `host` | `dynamic` | — | Record exposing `worldServices`, `fileListFn`, `debugPolygonCreateFn`, `debugPolygonDeleteFn`, `context`, `realTimeFn`, `dropClientFn` and further fields. |
| `op` | `dynamic` | — | Op passed as `op` to `mq3.vm.syscall_qagame_world.dispatch`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L244)

<a id="function-function-mq3-vm-syscall-qagame-entitylink-function-entitylink-vm-base-host-islink-src-mq3-vm-syscall-qagame-ml-447516740"></a>
### entityLink

```ml
function entityLink(vm, base, host, isLink)
```

Compute entity link in vm.syscall_qagame; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_qagame.opaque`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_qagame.arg`. |
| `host` | `dynamic` | — | Record exposing `unlinkEntityFn`, `linkEntityFn`, `context`. |
| `isLink` | `dynamic` | — | Is link operand used by `entityLink`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L168)

<a id="function-function-mq3-vm-syscall-qagame-entitytoken-function-entitytoken-vm-base-host-src-mq3-vm-syscall-qagame-ml-1249798624"></a>
### entityToken

```ml
function entityToken(vm, base, host)
```

Compute entity token in vm.syscall_qagame; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.writeBuffer`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_qagame.arg`. |
| `host` | `dynamic` | — | Record exposing `entityTokenFn`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L178)

<a id="function-function-mq3-vm-syscall-qagame-filelist-function-filelist-vm-base-host-src-mq3-vm-syscall-qagame-ml-1309192768"></a>
### fileList

```ml
function fileList(vm, base, host)
```

Compute file list in vm.syscall_qagame; the normal completion returns `count`.

Validation failures include `qagame syscall: negative file-list capacity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_qagame.arg`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_qagame.arg`. |
| `host` | `dynamic` | — | Record exposing `fileListFn`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L193)

<a id="function-function-mq3-vm-syscall-qagame-indexedoutput-function-indexedoutput-vm-base-host-callback-name-src-mq3-vm-syscall-qagame-ml-1865226884"></a>
### indexedOutput

```ml
function indexedOutput(vm, base, host, callback, name)
```

Compute indexed output in vm.syscall_qagame; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_qagame.arg`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_qagame.arg`. |
| `host` | `dynamic` | — | Record exposing `context`. |
| `callback` | `dynamic` | — | Callback invoked for callback; the call sites below define the callback arguments. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.vm.syscall_qagame.unavailable`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L116)

<a id="function-function-mq3-vm-syscall-qagame-inpvs-function-inpvs-vm-base-host-ignoreportals-src-mq3-vm-syscall-qagame-ml-53662335"></a>
### inPvs

```ml
function inPvs(vm, base, host, ignorePortals)
```

Compute in pvs in vm.syscall_qagame; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_qagame.vector`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_qagame.arg`. |
| `host` | `dynamic` | — | Record exposing `inPvsFn`, `context`. |
| `ignorePortals` | `dynamic` | — | Argument 4 passed to `host.inPvsFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L148)

<a id="function-function-mq3-vm-syscall-qagame-locategamedata-function-locategamedata-vm-base-host-src-mq3-vm-syscall-qagame-ml-700143552"></a>
### locateGameData

```ml
function locateGameData(vm, base, host)
```

Compute locate game data in vm.syscall_qagame; the normal completion returns `0`.

Validation failures include `qagame syscall: invalid game-data layout`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_qagame.arg`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_qagame.arg`. |
| `host` | `dynamic` | — | Record exposing `locateGameDataFn`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L85)

<a id="function-function-mq3-vm-syscall-qagame-opaque-function-opaque-vm-value-label-src-mq3-vm-syscall-qagame-ml-1204426150"></a>
### opaque

```ml
function opaque(vm, value, label)
```

Return `mq3.vm.syscall_common.pointer(vm, value, 1, label)` from `vm.syscall_qagame.opaque`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.pointer`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.vm.syscall_common.pointer`. |
| `label` | `dynamic` | — | Label passed as `label` to `mq3.vm.syscall_common.pointer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L66)

<a id="function-function-mq3-vm-syscall-qagame-portalstate-function-portalstate-vm-base-host-src-mq3-vm-syscall-qagame-ml-1569823322"></a>
### portalState

```ml
function portalState(vm, base, host)
```

Compute portal state in vm.syscall_qagame; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_qagame.opaque`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_qagame.arg`. |
| `host` | `dynamic` | — | Record exposing `adjustAreaPortalFn`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L158)

<a id="constant-constant-mq3-vm-syscall-qagame-qtime-size-const-qtime-size-36-src-mq3-vm-syscall-qagame-ml-37612602"></a>
### QTIME_SIZE

```ml
const QTIME_SIZE = 36
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L10)

<a id="function-function-mq3-vm-syscall-qagame-realtime-function-realtime-vm-base-host-src-mq3-vm-syscall-qagame-ml-1009759860"></a>
### realTime

```ml
function realTime(vm, base, host)
```

Compute real time in vm.syscall_qagame; the normal completion returns `value.epoch`.

Validation failures include `qagame syscall: invalid qtime_t layout`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_qagame.arg`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_qagame.arg`. |
| `host` | `dynamic` | — | Record exposing `realTimeFn`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L231)

<a id="function-function-mq3-vm-syscall-qagame-serverinfo-function-serverinfo-vm-base-host-src-mq3-vm-syscall-qagame-ml-820174848"></a>
### serverInfo

```ml
function serverInfo(vm, base, host)
```

Compute server info in vm.syscall_qagame; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.writeBuffer`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_qagame.arg`. |
| `host` | `dynamic` | — | Record exposing `getServerinfoFn`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L127)

<a id="function-function-mq3-vm-syscall-qagame-services-function-services-shared-context-src-mq3-vm-syscall-qagame-ml-129315272"></a>
### services

```ml
function services(shared, context)
```

Create `mq3.vm.syscall_qagame.Services` with shared=shared; context=context; locateGameDataFn=void; dropClientFn=void; 22 further fields.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shared` | `dynamic` | — | Initial `shared` field stored in the returned or constructed `mq3.vm.syscall_qagame.Services` record. |
| `context` | `dynamic` | — | Initial `context` field stored in the returned or constructed `mq3.vm.syscall_qagame.Services` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L48)

- [mq3.vm.syscall_qagame.Services](Type-mq3-vm-syscall-qagame-services-610565517.md) — struct
<a id="function-function-mq3-vm-syscall-qagame-stringcall-function-stringcall-vm-base-host-callback-name-withclient-src-mq3-vm-syscall-qagame-ml-1929098247"></a>
### stringCall

```ml
function stringCall(vm, base, host, callback, name, withClient)
```

Compute string call in vm.syscall_qagame; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.readString`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_qagame.arg`. |
| `host` | `dynamic` | — | Record exposing `context`. |
| `callback` | `dynamic` | — | Callback invoked for callback; the call sites below define the callback arguments. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.vm.syscall_qagame.unavailable`. |
| `withClient` | `dynamic` | — | With client operand used by `stringCall`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L103)

- [mq3.vm.syscall_qagame.TokenResult](Type-mq3-vm-syscall-qagame-tokenresult-549605699.md) — struct
<a id="function-function-mq3-vm-syscall-qagame-unavailable-function-unavailable-name-src-mq3-vm-syscall-qagame-ml-797689625"></a>
### unavailable

```ml
function unavailable(name)
```

Create the vm.syscall_qagame error for `unavailable` with 3421 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used in `("qagame syscall: " + name)` and `(("qagame syscall: " + name) + " service unavailable")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L54)

<a id="function-function-mq3-vm-syscall-qagame-vector-function-vector-vm-value-label-src-mq3-vm-syscall-qagame-ml-1429486430"></a>
### vector

```ml
function vector(vm, value, label)
```

Apply `mq3.vm.syscall_common.pointer`, `mq3.compat.numeric.bitsFloat`, `mq3.compat.numeric.readU32` for vector in vm.syscall_qagame.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.vm.syscall_common.pointer`. |
| `label` | `dynamic` | — | Label passed as `label` to `mq3.vm.syscall_common.pointer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L74)
