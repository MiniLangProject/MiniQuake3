# `src/mq3/vm/syscall_ui.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.vm.syscall_ui`](Package-mq3-vm-syscall-ui-1443405295.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)
- `mq3/vm/syscall_ui_media.ml` as `media` → [src/mq3/vm/syscall_ui_media.ml](File-src-mq3-vm-syscall-ui-media-ml-1111712958.md)

## Declarations

<a id="function-function-mq3-vm-syscall-ui-arg-function-arg-vm-base-index-src-mq3-vm-syscall-ui-ml-401226320"></a>
### arg

```ml
function arg(vm, base, index)
```

Return `mq3.vm.syscall_common.argument(vm, base, index)` from `vm.syscall_ui.arg`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.argument`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.vm.syscall_common.argument`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L42)

<a id="function-function-mq3-vm-syscall-ui-bindingoutput-function-bindingoutput-vm-base-host-src-mq3-vm-syscall-ui-ml-1714533564"></a>
### bindingOutput

```ml
function bindingOutput(vm, base, host)
```

cl_ui.c Key_GetBindingBuf explicitly converts an unbound key's NULL Key_GetBinding result into an empty, NUL-terminated output buffer. Keep nullable key storage: Key_GetKey must not match never-bound keys.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_ui.arg`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_ui.arg`. |
| `host` | `dynamic` | — | Record exposing `keys`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L93)

<a id="function-function-mq3-vm-syscall-ui-callback-function-callback-host-src-mq3-vm-syscall-ui-ml-1055542084"></a>
### callback

```ml
function callback(host)
```

Apply `mq3.vm.syscall_ui.dispatch` for callback in vm.syscall_ui.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.vm.syscall_ui.dispatch`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L292)

<a id="constant-constant-mq3-vm-syscall-ui-client-state-size-const-client-state-size-3084-src-mq3-vm-syscall-ui-ml-364908230"></a>
### CLIENT_STATE_SIZE

```ml
const CLIENT_STATE_SIZE = 3084
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L9)

<a id="function-function-mq3-vm-syscall-ui-clientservices-function-clientservices-src-mq3-vm-syscall-ui-ml-598890558"></a>
### clientServices

```ml
function clientServices()
```

Create `mq3.vm.syscall_ui.ClientServices` with clipboardFn=void; glconfigFn=void; clientStateFn=void; configStringFn=void.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L24)

- [mq3.vm.syscall_ui.ClientServices](Type-mq3-vm-syscall-ui-clientservices-2130269420.md) — struct
<a id="function-function-mq3-vm-syscall-ui-dispatch-function-dispatch-host-vm-base-src-mq3-vm-syscall-ui-ml-1914049120"></a>
### dispatch

```ml
function dispatch(host, vm, base)
```

Dispatch syscall ui in vm.syscall_ui; the normal completion returns `dispatchSpecific(vm, base, host, op)`.

Validation failures include `UI syscall: invalid dispatcher context`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `shared`. |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.argument`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L283)

<a id="function-function-mq3-vm-syscall-ui-dispatchspecific-function-dispatchspecific-vm-base-host-op-src-mq3-vm-syscall-ui-ml-876277307"></a>
### dispatchSpecific

```ml
function dispatchSpecific(vm, base, host, op)
```

Dispatch specific in vm.syscall_ui; the normal completion returns `error(3423, ("UI syscall: unsupported client trap " + str(op)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_ui_media.dispatch`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_ui_media.dispatch`. |
| `host` | `dynamic` | — | Record exposing `mediaServices`, `renderer`, `context`, `keys`, `client`, `lan`, `memoryRemainingFn` and further fields. |
| `op` | `dynamic` | — | Op used in `str(op)` and `(op == 31)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L226)

<a id="function-function-mq3-vm-syscall-ui-drawstretchpic-function-drawstretchpic-vm-base-host-src-mq3-vm-syscall-ui-ml-1614569712"></a>
### drawStretchPic

```ml
function drawStretchPic(vm, base, host)
```

Compute draw stretch pic in vm.syscall_ui; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_ui.arg`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_ui.arg`. |
| `host` | `dynamic` | — | Record exposing `renderer`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L126)

<a id="function-function-mq3-vm-syscall-ui-fixedoutput-function-fixedoutput-vm-address-data-size-label-src-mq3-vm-syscall-ui-ml-176404268"></a>
### fixedOutput

```ml
function fixedOutput(vm, address, data, size, label)
```

Compute fixed output in vm.syscall_ui; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.writeRaw`. |
| `address` | `dynamic` | — | Value passed as `value` to `mq3.vm.syscall_common.writeRaw`. |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.vm.syscall_common.writeRaw`. |
| `size` | `dynamic` | — | Count passed as `count` to `mq3.vm.syscall_common.writeRaw`. |
| `label` | `dynamic` | — | Label used in `(label + " output")` and `("UI syscall: invalid " + label)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L60)

<a id="function-function-mq3-vm-syscall-ui-getclientstate-function-getclientstate-vm-base-host-src-mq3-vm-syscall-ui-ml-995753096"></a>
### getClientState

```ml
function getClientState(vm, base, host)
```

Get client state in vm.syscall_ui; the normal completion returns `fixedOutput(vm, arg(vm, base, 1), host.client.clientStateFn(host.context), CLIENT_STATE_SIZE, "client state")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_ui.fixedOutput`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_ui.arg`. |
| `host` | `dynamic` | — | Record exposing `client`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L137)

<a id="function-function-mq3-vm-syscall-ui-getconfigstring-function-getconfigstring-vm-base-host-src-mq3-vm-syscall-ui-ml-1932400354"></a>
### getConfigString

```ml
function getConfigString(vm, base, host)
```

Get config string in vm.syscall_ui; the normal completion returns `1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_ui.arg`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_ui.arg`. |
| `host` | `dynamic` | — | Record exposing `client`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L146)

<a id="function-function-mq3-vm-syscall-ui-getfilelist-function-getfilelist-vm-base-host-src-mq3-vm-syscall-ui-ml-1481949456"></a>
### getFileList

```ml
function getFileList(vm, base, host)
```

Get file list in vm.syscall_ui; the normal completion returns `count`.

Validation failures include `UI syscall: negative file-list capacity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_ui.arg`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_ui.arg`. |
| `host` | `dynamic` | — | Record exposing `fileListFn`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L171)

<a id="function-function-mq3-vm-syscall-ui-getping-function-getping-vm-base-host-src-mq3-vm-syscall-ui-ml-1060258476"></a>
### getPing

```ml
function getPing(vm, base, host)
```

Get ping in vm.syscall_ui; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_ui.arg`. |
| `host` | `dynamic` | — | Record exposing `lan`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L157)

<a id="constant-constant-mq3-vm-syscall-ui-glconfig-size-const-glconfig-size-11332-src-mq3-vm-syscall-ui-ml-1691936003"></a>
### GLCONFIG_SIZE

```ml
const GLCONFIG_SIZE = 11332
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L10)

<a id="function-function-mq3-vm-syscall-ui-keyservices-function-keyservices-src-mq3-vm-syscall-ui-ml-325991520"></a>
### keyServices

```ml
function keyServices()
```

Create `mq3.vm.syscall_ui.KeyServices` with keyNameFn=void; bindingFn=void; setBindingFn=void; isDownFn=void; getOverstrikeFn=void; setOverstrikeFn=void; clearFn=void; getCatcherFn=void; setCatcherFn=void.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L26)

- [mq3.vm.syscall_ui.KeyServices](Type-mq3-vm-syscall-ui-keyservices-2694918.md) — struct
<a id="function-function-mq3-vm-syscall-ui-lanservices-function-lanservices-src-mq3-vm-syscall-ui-ml-1655941904"></a>
### lanServices

```ml
function lanServices()
```

Create `mq3.vm.syscall_ui.LanServices` with loadFn=void; saveFn=void; addFn=void; removeFn=void; 14 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L30)

- [mq3.vm.syscall_ui.LanServices](Type-mq3-vm-syscall-ui-lanservices-1014418130.md) — struct
<a id="function-function-mq3-vm-syscall-ui-lanstring-function-lanstring-vm-base-host-callback-name-src-mq3-vm-syscall-ui-ml-88855288"></a>
### lanString

```ml
function lanString(vm, base, host, callback, name)
```

Compute lan string in vm.syscall_ui; the normal completion returns `output(vm, arg(vm, base, 3), arg(vm, base, 4), value, (name + " output"))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_ui.arg`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_ui.arg`. |
| `host` | `dynamic` | — | Record exposing `context`. |
| `callback` | `dynamic` | — | Callback invoked for callback; the call sites below define the callback arguments. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.vm.syscall_ui.unavailable`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L203)

<a id="function-function-mq3-vm-syscall-ui-output-function-output-vm-address-capacity-text-label-src-mq3-vm-syscall-ui-ml-1566044108"></a>
### output

```ml
function output(vm, address, capacity, text, label)
```

Compute output in vm.syscall_ui; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.writeBuffer`. |
| `address` | `dynamic` | — | Value passed as `value` to `mq3.vm.syscall_common.writeBuffer`. |
| `capacity` | `dynamic` | — | Capacity passed as `capacity` to `mq3.vm.syscall_common.writeBuffer`. |
| `text` | `dynamic` | — | Data passed as `data` to `mq3.vm.syscall_common.writeBuffer`. |
| `label` | `dynamic` | — | Label passed as `label` to `mq3.vm.syscall_common.writeBuffer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L50)

<a id="function-function-mq3-vm-syscall-ui-registerasset-function-registerasset-vm-base-host-callback-name-src-mq3-vm-syscall-ui-ml-1593089466"></a>
### registerAsset

```ml
function registerAsset(vm, base, host, callback, name)
```

Register asset in vm.syscall_ui; the normal completion returns `callback(host.context, common.readString(vm, arg(vm, base, 1)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.readString`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_ui.arg`. |
| `host` | `dynamic` | — | Record exposing `context`. |
| `callback` | `dynamic` | — | Callback invoked for callback; the call sites below define the callback arguments. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.vm.syscall_ui.unavailable`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L71)

<a id="function-function-mq3-vm-syscall-ui-rendererservices-function-rendererservices-src-mq3-vm-syscall-ui-ml-417031974"></a>
### rendererServices

```ml
function rendererServices()
```

Create `mq3.vm.syscall_ui.RendererServices` with registerModelFn=void; registerSkinFn=void; registerShaderNoMipFn=void; clearSceneFn=void; setColorFn=void; drawStretchPicFn=void; updateScreenFn=void.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L28)

- [mq3.vm.syscall_ui.RendererServices](Type-mq3-vm-syscall-ui-rendererservices-625052772.md) — struct
<a id="function-function-mq3-vm-syscall-ui-serverstatus-function-serverstatus-vm-base-host-src-mq3-vm-syscall-ui-ml-560427516"></a>
### serverStatus

```ml
function serverStatus(vm, base, host)
```

Compute server status in vm.syscall_ui; the normal completion returns `1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.readString`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_ui.arg`. |
| `host` | `dynamic` | — | Record exposing `lan`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L213)

<a id="function-function-mq3-vm-syscall-ui-services-function-services-shared-context-src-mq3-vm-syscall-ui-ml-1541956680"></a>
### services

```ml
function services(shared, context)
```

Create `mq3.vm.syscall_ui.Services` with shared=shared; context=context; client=clientServices(); keys=keyServices(); 6 further fields.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shared` | `dynamic` | — | Initial `shared` field stored in the returned or constructed `mq3.vm.syscall_ui.Services` record. |
| `context` | `dynamic` | — | Initial `context` field stored in the returned or constructed `mq3.vm.syscall_ui.Services` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L34)

- [mq3.vm.syscall_ui.Services](Type-mq3-vm-syscall-ui-services-2060029663.md) — struct
<a id="function-function-mq3-vm-syscall-ui-setbinding-function-setbinding-vm-base-host-src-mq3-vm-syscall-ui-ml-489101492"></a>
### setBinding

```ml
function setBinding(vm, base, host)
```

Set binding in vm.syscall_ui; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_ui.arg`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_ui.arg`. |
| `host` | `dynamic` | — | Record exposing `keys`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L103)

<a id="function-function-mq3-vm-syscall-ui-setcolor-function-setcolor-vm-base-host-src-mq3-vm-syscall-ui-ml-808792588"></a>
### setColor

```ml
function setColor(vm, base, host)
```

Set color in vm.syscall_ui; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_ui.arg`. |
| `host` | `dynamic` | — | Record exposing `renderer`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L112)

<a id="function-function-mq3-vm-syscall-ui-stringoutput-function-stringoutput-vm-base-host-callback-name-src-mq3-vm-syscall-ui-ml-1827977940"></a>
### stringOutput

```ml
function stringOutput(vm, base, host, callback, name)
```

Compute string output in vm.syscall_ui; the normal completion returns `output(vm, arg(vm, base, 2), arg(vm, base, 3), callback(host.context, arg(vm, base, 1)), (name + " output"))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_ui.output`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_ui.arg`. |
| `host` | `dynamic` | — | Record exposing `context`. |
| `callback` | `dynamic` | — | Callback invoked for callback; the call sites below define the callback arguments. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.vm.syscall_ui.unavailable`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L82)

<a id="function-function-mq3-vm-syscall-ui-unavailable-function-unavailable-name-src-mq3-vm-syscall-ui-ml-1539105897"></a>
### unavailable

```ml
function unavailable(name)
```

Create the vm.syscall_ui error for `unavailable` with 3423 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used in `("UI syscall: " + name)` and `(("UI syscall: " + name) + " service unavailable")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L37)
