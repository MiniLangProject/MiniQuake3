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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L49)

<a id="function-function-mq3-vm-syscall-qagame-brushmodel-function-brushmodel-vm-base-host-src-mq3-vm-syscall-qagame-ml-1956602340"></a>
### brushModel

```ml
function brushModel(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L91)

<a id="function-function-mq3-vm-syscall-qagame-callback-function-callback-host-src-mq3-vm-syscall-qagame-ml-2146510780"></a>
### callback

```ml
function callback(host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L204)

<a id="function-function-mq3-vm-syscall-qagame-debugpolygoncreate-function-debugpolygoncreate-vm-base-host-src-mq3-vm-syscall-qagame-ml-817040"></a>
### debugPolygonCreate

```ml
function debugPolygonCreate(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L138)

<a id="function-function-mq3-vm-syscall-qagame-dispatch-function-dispatch-host-vm-base-src-mq3-vm-syscall-qagame-ml-85348628"></a>
### dispatch

```ml
function dispatch(host, vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L197)

<a id="function-function-mq3-vm-syscall-qagame-dispatchspecific-function-dispatchspecific-vm-base-host-op-src-mq3-vm-syscall-qagame-ml-12328851"></a>
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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L157)

<a id="function-function-mq3-vm-syscall-qagame-entitylink-function-entitylink-vm-base-host-islink-src-mq3-vm-syscall-qagame-ml-447516740"></a>
### entityLink

```ml
function entityLink(vm, base, host, isLink)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `isLink` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L108)

<a id="function-function-mq3-vm-syscall-qagame-entitytoken-function-entitytoken-vm-base-host-src-mq3-vm-syscall-qagame-ml-1249798624"></a>
### entityToken

```ml
function entityToken(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L114)

<a id="function-function-mq3-vm-syscall-qagame-filelist-function-filelist-vm-base-host-src-mq3-vm-syscall-qagame-ml-1309192768"></a>
### fileList

```ml
function fileList(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L123)

<a id="function-function-mq3-vm-syscall-qagame-indexedoutput-function-indexedoutput-vm-base-host-callback-name-src-mq3-vm-syscall-qagame-ml-1865226884"></a>
### indexedOutput

```ml
function indexedOutput(vm, base, host, callback, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `callback` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L78)

<a id="function-function-mq3-vm-syscall-qagame-inpvs-function-inpvs-vm-base-host-ignoreportals-src-mq3-vm-syscall-qagame-ml-53662335"></a>
### inPvs

```ml
function inPvs(vm, base, host, ignorePortals)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `ignorePortals` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L97)

<a id="function-function-mq3-vm-syscall-qagame-locategamedata-function-locategamedata-vm-base-host-src-mq3-vm-syscall-qagame-ml-700143552"></a>
### locateGameData

```ml
function locateGameData(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L60)

<a id="function-function-mq3-vm-syscall-qagame-opaque-function-opaque-vm-value-label-src-mq3-vm-syscall-qagame-ml-1204426150"></a>
### opaque

```ml
function opaque(vm, value, label)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L51)

<a id="function-function-mq3-vm-syscall-qagame-portalstate-function-portalstate-vm-base-host-src-mq3-vm-syscall-qagame-ml-1569823322"></a>
### portalState

```ml
function portalState(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L103)

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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L149)

<a id="function-function-mq3-vm-syscall-qagame-serverinfo-function-serverinfo-vm-base-host-src-mq3-vm-syscall-qagame-ml-820174848"></a>
### serverInfo

```ml
function serverInfo(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L85)

<a id="function-function-mq3-vm-syscall-qagame-services-function-services-shared-context-src-mq3-vm-syscall-qagame-ml-129315272"></a>
### services

```ml
function services(shared, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `shared` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L43)

- [mq3.vm.syscall_qagame.Services](Type-mq3-vm-syscall-qagame-services-610565517.md) — struct
<a id="function-function-mq3-vm-syscall-qagame-stringcall-function-stringcall-vm-base-host-callback-name-withclient-src-mq3-vm-syscall-qagame-ml-1929098247"></a>
### stringCall

```ml
function stringCall(vm, base, host, callback, name, withClient)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `callback` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `withClient` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L71)

- [mq3.vm.syscall_qagame.TokenResult](Type-mq3-vm-syscall-qagame-tokenresult-549605699.md) — struct
<a id="function-function-mq3-vm-syscall-qagame-unavailable-function-unavailable-name-src-mq3-vm-syscall-qagame-ml-797689625"></a>
### unavailable

```ml
function unavailable(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L47)

<a id="function-function-mq3-vm-syscall-qagame-vector-function-vector-vm-value-label-src-mq3-vm-syscall-qagame-ml-1429486430"></a>
### vector

```ml
function vector(vm, value, label)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame.ml#L55)
