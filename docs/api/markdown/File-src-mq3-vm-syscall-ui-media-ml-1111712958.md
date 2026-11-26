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

Return `mq3.vm.syscall_common.argument(vm, base, index)` from `vm.syscall_ui_media.arg`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.argument`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.vm.syscall_common.argument`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L35)

<a id="function-function-mq3-vm-syscall-ui-media-callback-function-callback-host-src-mq3-vm-syscall-ui-media-ml-1964382310"></a>
### callback

```ml
function callback(host)
```

Apply `mq3.vm.syscall_ui_media.dispatch` for callback in vm.syscall_ui_media.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.vm.syscall_ui_media.dispatch`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L174)

<a id="constant-constant-mq3-vm-syscall-ui-media-cdkey-chars-const-cdkey-chars-16-src-mq3-vm-syscall-ui-media-ml-1456779388"></a>
### CDKEY_CHARS

```ml
const CDKEY_CHARS = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L8)

<a id="function-function-mq3-vm-syscall-ui-media-cinematicservices-function-cinematicservices-src-mq3-vm-syscall-ui-media-ml-384474442"></a>
### cinematicServices

```ml
function cinematicServices()
```

Create `mq3.vm.syscall_ui_media.CinematicServices` with playFn=void; stopFn=void; runFn=void; drawFn=void; setExtentsFn=void.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L22)

- [mq3.vm.syscall_ui_media.CinematicServices](Type-mq3-vm-syscall-ui-media-cinematicservices-294348599.md) — struct
<a id="function-function-mq3-vm-syscall-ui-media-dispatch-function-dispatch-host-vm-base-src-mq3-vm-syscall-ui-media-ml-1180042506"></a>
### dispatch

```ml
function dispatch(host, vm, base)
```

Dispatch syscall ui media in vm.syscall_ui_media; the normal completion returns `error(3424, ("UI media syscall: unsupported trap " + str(op)))`.

Validation failures include `UI media syscall: invalid dispatcher context`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `sound`, `context`, `cinematic`, `platform`. |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_ui_media.arg`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L148)

<a id="function-function-mq3-vm-syscall-ui-media-getcdkey-function-getcdkey-vm-base-host-src-mq3-vm-syscall-ui-media-ml-2058804454"></a>
### getCdKey

```ml
function getCdKey(vm, base, host)
```

Get cd key in vm.syscall_ui_media; the normal completion returns `0`.

Validation failures include `UI media syscall: CD-key output capacity below 17 bytes`; `UI media syscall: CD-key service returned fewer than 16 bytes`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_ui_media.arg`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_ui_media.arg`. |
| `host` | `dynamic` | — | Record exposing `platform`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L110)

<a id="function-function-mq3-vm-syscall-ui-media-platformservices-function-platformservices-src-mq3-vm-syscall-ui-media-ml-985825828"></a>
### platformServices

```ml
function platformServices()
```

Create `mq3.vm.syscall_ui_media.PlatformServices` with realTimeFn=void; remapShaderFn=void; getCdKeyFn=void; setCdKeyFn=void; verifyCdKeyFn=void; seekFn=void; pbStatusFn=void.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L24)

- [mq3.vm.syscall_ui_media.PlatformServices](Type-mq3-vm-syscall-ui-media-platformservices-853685373.md) — struct
<a id="function-function-mq3-vm-syscall-ui-media-playcinematic-function-playcinematic-vm-base-host-src-mq3-vm-syscall-ui-media-ml-1422613596"></a>
### playCinematic

```ml
function playCinematic(vm, base, host)
```

Apply `mq3.vm.syscall_ui_media.unavailable`, `host.cinematic.playFn`, `mq3.vm.syscall_common.readString` for play cinematic in vm.syscall_ui_media.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.readString`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_ui_media.arg`. |
| `host` | `dynamic` | — | Record exposing `cinematic`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L81)

<a id="constant-constant-mq3-vm-syscall-ui-media-qtime-size-const-qtime-size-36-src-mq3-vm-syscall-ui-media-ml-844951296"></a>
### QTIME_SIZE

```ml
const QTIME_SIZE = 36
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L7)

<a id="function-function-mq3-vm-syscall-ui-media-realtime-function-realtime-vm-base-host-src-mq3-vm-syscall-ui-media-ml-1896840274"></a>
### realTime

```ml
function realTime(vm, base, host)
```

Compute real time in vm.syscall_ui_media; the normal completion returns `value[0]`.

Validation failures include `UI media syscall: invalid qtime_t layout`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.writeRaw`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_ui_media.arg`. |
| `host` | `dynamic` | — | Record exposing `platform`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L70)

<a id="function-function-mq3-vm-syscall-ui-media-registersound-function-registersound-vm-base-host-src-mq3-vm-syscall-ui-media-ml-1937664170"></a>
### registerSound

```ml
function registerSound(vm, base, host)
```

Register sound in vm.syscall_ui_media; the normal completion returns `host.sound.registerFn(host.context, common.readString(vm, arg(vm, base, 1)), (arg(vm, base, 2) != 0))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.readString`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_ui_media.arg`. |
| `host` | `dynamic` | — | Record exposing `sound`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L41)

<a id="function-function-mq3-vm-syscall-ui-media-remapshader-function-remapshader-vm-base-host-src-mq3-vm-syscall-ui-media-ml-211718562"></a>
### remapShader

```ml
function remapShader(vm, base, host)
```

Compute remap shader in vm.syscall_ui_media; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.readString`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_ui_media.arg`. |
| `host` | `dynamic` | — | Record exposing `platform`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L99)

<a id="function-function-mq3-vm-syscall-ui-media-services-function-services-context-src-mq3-vm-syscall-ui-media-ml-1268546915"></a>
### services

```ml
function services(context)
```

Create `mq3.vm.syscall_ui_media.Services` with context=context; sound=soundServices(); cinematic=cinematicServices(); platform=platformServices().

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Initial `context` field stored in the returned or constructed `mq3.vm.syscall_ui_media.Services` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L27)

- [mq3.vm.syscall_ui_media.Services](Type-mq3-vm-syscall-ui-media-services-852465026.md) — struct
<a id="function-function-mq3-vm-syscall-ui-media-setcdkey-function-setcdkey-vm-base-host-src-mq3-vm-syscall-ui-media-ml-1522019862"></a>
### setCdKey

```ml
function setCdKey(vm, base, host)
```

Set cd key in vm.syscall_ui_media; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_ui_media.arg`. |
| `host` | `dynamic` | — | Record exposing `platform`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L124)

<a id="function-function-mq3-vm-syscall-ui-media-setextents-function-setextents-vm-base-host-src-mq3-vm-syscall-ui-media-ml-1865803738"></a>
### setExtents

```ml
function setExtents(vm, base, host)
```

Set extents in vm.syscall_ui_media; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_ui_media.arg`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_ui_media.arg`. |
| `host` | `dynamic` | — | Record exposing `cinematic`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L90)

<a id="function-function-mq3-vm-syscall-ui-media-soundservices-function-soundservices-src-mq3-vm-syscall-ui-media-ml-2053217950"></a>
### soundServices

```ml
function soundServices()
```

Create `mq3.vm.syscall_ui_media.SoundServices` with registerFn=void; startLocalFn=void; stopBackgroundFn=void; startBackgroundFn=void.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L20)

- [mq3.vm.syscall_ui_media.SoundServices](Type-mq3-vm-syscall-ui-media-soundservices-1573489229.md) — struct
<a id="function-function-mq3-vm-syscall-ui-media-startbackground-function-startbackground-vm-base-host-src-mq3-vm-syscall-ui-media-ml-287935202"></a>
### startBackground

```ml
function startBackground(vm, base, host)
```

Start background in vm.syscall_ui_media; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.readString`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_ui_media.arg`. |
| `host` | `dynamic` | — | Record exposing `sound`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L59)

<a id="function-function-mq3-vm-syscall-ui-media-startlocalsound-function-startlocalsound-vm-base-host-src-mq3-vm-syscall-ui-media-ml-828958910"></a>
### startLocalSound

```ml
function startLocalSound(vm, base, host)
```

Start local sound in vm.syscall_ui_media; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_ui_media.arg`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_ui_media.arg`. |
| `host` | `dynamic` | — | Record exposing `sound`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L50)

<a id="function-function-mq3-vm-syscall-ui-media-unavailable-function-unavailable-name-src-mq3-vm-syscall-ui-media-ml-1588143715"></a>
### unavailable

```ml
function unavailable(name)
```

Create the vm.syscall_ui_media error for `unavailable` with 3424 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used in `("UI media syscall: " + name)` and `(("UI media syscall: " + name) + " service unavailable")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L30)

<a id="function-function-mq3-vm-syscall-ui-media-verifycdkey-function-verifycdkey-vm-base-host-src-mq3-vm-syscall-ui-media-ml-1254290068"></a>
### verifyCdKey

```ml
function verifyCdKey(vm, base, host)
```

Compute verify cd key in vm.syscall_ui_media; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_ui_media.arg`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_ui_media.arg`. |
| `host` | `dynamic` | — | Record exposing `platform`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_ui_media.ml#L134)
