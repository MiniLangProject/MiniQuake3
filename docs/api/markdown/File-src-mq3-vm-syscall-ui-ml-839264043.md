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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L24)

<a id="function-function-mq3-vm-syscall-ui-bindingoutput-function-bindingoutput-vm-base-host-src-mq3-vm-syscall-ui-ml-1714533564"></a>
### bindingOutput

```ml
function bindingOutput(vm, base, host)
```

cl_ui.c Key_GetBindingBuf explicitly converts an unbound key's NULL Key_GetBinding result into an empty, NUL-terminated output buffer. Keep nullable key storage: Key_GetKey must not match never-bound keys.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L48)

<a id="function-function-mq3-vm-syscall-ui-callback-function-callback-host-src-mq3-vm-syscall-ui-ml-1055542084"></a>
### callback

```ml
function callback(host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L194)

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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L18)

- [mq3.vm.syscall_ui.ClientServices](Type-mq3-vm-syscall-ui-clientservices-2130269420.md) — struct
<a id="function-function-mq3-vm-syscall-ui-dispatch-function-dispatch-host-vm-base-src-mq3-vm-syscall-ui-ml-1914049120"></a>
### dispatch

```ml
function dispatch(host, vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L187)

<a id="function-function-mq3-vm-syscall-ui-dispatchspecific-function-dispatchspecific-vm-base-host-op-src-mq3-vm-syscall-ui-ml-876277307"></a>
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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L136)

<a id="function-function-mq3-vm-syscall-ui-drawstretchpic-function-drawstretchpic-vm-base-host-src-mq3-vm-syscall-ui-ml-1614569712"></a>
### drawStretchPic

```ml
function drawStretchPic(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L69)

<a id="function-function-mq3-vm-syscall-ui-fixedoutput-function-fixedoutput-vm-address-data-size-label-src-mq3-vm-syscall-ui-ml-176404268"></a>
### fixedOutput

```ml
function fixedOutput(vm, address, data, size, label)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L30)

<a id="function-function-mq3-vm-syscall-ui-getclientstate-function-getclientstate-vm-base-host-src-mq3-vm-syscall-ui-ml-995753096"></a>
### getClientState

```ml
function getClientState(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L76)

<a id="function-function-mq3-vm-syscall-ui-getconfigstring-function-getconfigstring-vm-base-host-src-mq3-vm-syscall-ui-ml-1932400354"></a>
### getConfigString

```ml
function getConfigString(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L81)

<a id="function-function-mq3-vm-syscall-ui-getfilelist-function-getfilelist-vm-base-host-src-mq3-vm-syscall-ui-ml-1481949456"></a>
### getFileList

```ml
function getFileList(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L96)

<a id="function-function-mq3-vm-syscall-ui-getping-function-getping-vm-base-host-src-mq3-vm-syscall-ui-ml-1060258476"></a>
### getPing

```ml
function getPing(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L88)

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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L19)

- [mq3.vm.syscall_ui.KeyServices](Type-mq3-vm-syscall-ui-keyservices-2694918.md) — struct
<a id="function-function-mq3-vm-syscall-ui-lanservices-function-lanservices-src-mq3-vm-syscall-ui-ml-1655941904"></a>
### lanServices

```ml
function lanServices()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L21)

- [mq3.vm.syscall_ui.LanServices](Type-mq3-vm-syscall-ui-lanservices-1014418130.md) — struct
<a id="function-function-mq3-vm-syscall-ui-lanstring-function-lanstring-vm-base-host-callback-name-src-mq3-vm-syscall-ui-ml-88855288"></a>
### lanString

```ml
function lanString(vm, base, host, callback, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `callback` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L122)

<a id="function-function-mq3-vm-syscall-ui-output-function-output-vm-address-capacity-text-label-src-mq3-vm-syscall-ui-ml-1566044108"></a>
### output

```ml
function output(vm, address, capacity, text, label)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L26)

<a id="function-function-mq3-vm-syscall-ui-registerasset-function-registerasset-vm-base-host-callback-name-src-mq3-vm-syscall-ui-ml-1593089466"></a>
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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L35)

<a id="function-function-mq3-vm-syscall-ui-rendererservices-function-rendererservices-src-mq3-vm-syscall-ui-ml-417031974"></a>
### rendererServices

```ml
function rendererServices()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L20)

- [mq3.vm.syscall_ui.RendererServices](Type-mq3-vm-syscall-ui-rendererservices-625052772.md) — struct
<a id="function-function-mq3-vm-syscall-ui-serverstatus-function-serverstatus-vm-base-host-src-mq3-vm-syscall-ui-ml-560427516"></a>
### serverStatus

```ml
function serverStatus(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L128)

<a id="function-function-mq3-vm-syscall-ui-services-function-services-shared-context-src-mq3-vm-syscall-ui-ml-1541956680"></a>
### services

```ml
function services(shared, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shared` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L22)

- [mq3.vm.syscall_ui.Services](Type-mq3-vm-syscall-ui-services-2060029663.md) — struct
<a id="function-function-mq3-vm-syscall-ui-setbinding-function-setbinding-vm-base-host-src-mq3-vm-syscall-ui-ml-489101492"></a>
### setBinding

```ml
function setBinding(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L54)

<a id="function-function-mq3-vm-syscall-ui-setcolor-function-setcolor-vm-base-host-src-mq3-vm-syscall-ui-ml-808792588"></a>
### setColor

```ml
function setColor(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L59)

<a id="function-function-mq3-vm-syscall-ui-stringoutput-function-stringoutput-vm-base-host-callback-name-src-mq3-vm-syscall-ui-ml-1827977940"></a>
### stringOutput

```ml
function stringOutput(vm, base, host, callback, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `callback` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L40)

<a id="function-function-mq3-vm-syscall-ui-unavailable-function-unavailable-name-src-mq3-vm-syscall-ui-ml-1539105897"></a>
### unavailable

```ml
function unavailable(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui.ml#L23)
