# `src/mq3/vm/syscall_ui_media.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.vm.syscall_ui_media`](Package-mq3-vm-syscall-ui-media-1752790932.md)

Reachable from entry: **yes**

## Imports

- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)

## Declarations

<a id="function-function-mq3-vm-syscall-ui-media-arg-function-arg-vm-base-index-src-mq3-vm-syscall-ui-media-ml-1823722372"></a>
### arg

```ml
function arg(vm, base, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_ui_media.ml#L20)

<a id="function-function-mq3-vm-syscall-ui-media-callback-function-callback-host-src-mq3-vm-syscall-ui-media-ml-1964382310"></a>
### callback

```ml
function callback(host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_ui_media.ml#L107)

<a id="constant-constant-mq3-vm-syscall-ui-media-cdkey-chars-const-cdkey-chars-16-src-mq3-vm-syscall-ui-media-ml-1456779388"></a>
### CDKEY_CHARS

```ml
const CDKEY_CHARS = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_ui_media.ml#L8)

<a id="function-function-mq3-vm-syscall-ui-media-cinematicservices-function-cinematicservices-src-mq3-vm-syscall-ui-media-ml-384474442"></a>
### cinematicServices

```ml
function cinematicServices()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_ui_media.ml#L16)

- [mq3.vm.syscall_ui_media.CinematicServices](Type-mq3-vm-syscall-ui-media-cinematicservices-294348599.md) — struct
<a id="function-function-mq3-vm-syscall-ui-media-dispatch-function-dispatch-host-vm-base-src-mq3-vm-syscall-ui-media-ml-1180042506"></a>
### dispatch

```ml
function dispatch(host, vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_ui_media.ml#L83)

<a id="function-function-mq3-vm-syscall-ui-media-getcdkey-function-getcdkey-vm-base-host-src-mq3-vm-syscall-ui-media-ml-2058804454"></a>
### getCdKey

```ml
function getCdKey(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_ui_media.ml#L59)

<a id="function-function-mq3-vm-syscall-ui-media-platformservices-function-platformservices-src-mq3-vm-syscall-ui-media-ml-985825828"></a>
### platformServices

```ml
function platformServices()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_ui_media.ml#L17)

- [mq3.vm.syscall_ui_media.PlatformServices](Type-mq3-vm-syscall-ui-media-platformservices-853685373.md) — struct
<a id="function-function-mq3-vm-syscall-ui-media-playcinematic-function-playcinematic-vm-base-host-src-mq3-vm-syscall-ui-media-ml-1422613596"></a>
### playCinematic

```ml
function playCinematic(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_ui_media.ml#L44)

<a id="constant-constant-mq3-vm-syscall-ui-media-qtime-size-const-qtime-size-36-src-mq3-vm-syscall-ui-media-ml-844951296"></a>
### QTIME_SIZE

```ml
const QTIME_SIZE = 36
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_ui_media.ml#L7)

<a id="function-function-mq3-vm-syscall-ui-media-realtime-function-realtime-vm-base-host-src-mq3-vm-syscall-ui-media-ml-1896840274"></a>
### realTime

```ml
function realTime(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_ui_media.ml#L37)

<a id="function-function-mq3-vm-syscall-ui-media-registersound-function-registersound-vm-base-host-src-mq3-vm-syscall-ui-media-ml-1937664170"></a>
### registerSound

```ml
function registerSound(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_ui_media.ml#L22)

<a id="function-function-mq3-vm-syscall-ui-media-remapshader-function-remapshader-vm-base-host-src-mq3-vm-syscall-ui-media-ml-211718562"></a>
### remapShader

```ml
function remapShader(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_ui_media.ml#L54)

<a id="function-function-mq3-vm-syscall-ui-media-services-function-services-context-src-mq3-vm-syscall-ui-media-ml-1268546915"></a>
### services

```ml
function services(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_ui_media.ml#L18)

- [mq3.vm.syscall_ui_media.Services](Type-mq3-vm-syscall-ui-media-services-852465026.md) — struct
<a id="function-function-mq3-vm-syscall-ui-media-setcdkey-function-setcdkey-vm-base-host-src-mq3-vm-syscall-ui-media-ml-1522019862"></a>
### setCdKey

```ml
function setCdKey(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_ui_media.ml#L69)

<a id="function-function-mq3-vm-syscall-ui-media-setextents-function-setextents-vm-base-host-src-mq3-vm-syscall-ui-media-ml-1865803738"></a>
### setExtents

```ml
function setExtents(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_ui_media.ml#L49)

<a id="function-function-mq3-vm-syscall-ui-media-soundservices-function-soundservices-src-mq3-vm-syscall-ui-media-ml-2053217950"></a>
### soundServices

```ml
function soundServices()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_ui_media.ml#L15)

- [mq3.vm.syscall_ui_media.SoundServices](Type-mq3-vm-syscall-ui-media-soundservices-1573489229.md) — struct
<a id="function-function-mq3-vm-syscall-ui-media-startbackground-function-startbackground-vm-base-host-src-mq3-vm-syscall-ui-media-ml-287935202"></a>
### startBackground

```ml
function startBackground(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_ui_media.ml#L32)

<a id="function-function-mq3-vm-syscall-ui-media-startlocalsound-function-startlocalsound-vm-base-host-src-mq3-vm-syscall-ui-media-ml-828958910"></a>
### startLocalSound

```ml
function startLocalSound(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_ui_media.ml#L27)

<a id="function-function-mq3-vm-syscall-ui-media-unavailable-function-unavailable-name-src-mq3-vm-syscall-ui-media-ml-1588143715"></a>
### unavailable

```ml
function unavailable(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_ui_media.ml#L19)

<a id="function-function-mq3-vm-syscall-ui-media-verifycdkey-function-verifycdkey-vm-base-host-src-mq3-vm-syscall-ui-media-ml-1254290068"></a>
### verifyCdKey

```ml
function verifyCdKey(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/syscall_ui_media.ml#L75)
