# `src/mq3/vm/syscall_qagame_world.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.vm.syscall_qagame_world`](Package-mq3-vm-syscall-qagame-world-799376534.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/qcommon/message_delta.ml` as `messageDelta` → [src/mq3/qcommon/message_delta.ml](File-src-mq3-qcommon-message-delta-ml-1923515516.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)

## Declarations

<a id="function-function-mq3-vm-syscall-qagame-world-arg-function-arg-vm-base-index-src-mq3-vm-syscall-qagame-world-ml-1532469536"></a>
### arg

```ml
function arg(vm, base, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L39)

<a id="function-function-mq3-vm-syscall-qagame-world-dispatch-function-dispatch-host-vm-base-op-src-mq3-vm-syscall-qagame-world-ml-1798047605"></a>
### dispatch

```ml
function dispatch(host, vm, base, op)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `op` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L127)

<a id="function-function-mq3-vm-syscall-qagame-world-entitiesinbox-function-entitiesinbox-vm-base-host-src-mq3-vm-syscall-qagame-world-ml-1405818632"></a>
### entitiesInBox

```ml
function entitiesInBox(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L99)

<a id="function-function-mq3-vm-syscall-qagame-world-entitycontact-function-entitycontact-vm-base-host-capsule-src-mq3-vm-syscall-qagame-world-ml-140877783"></a>
### entityContact

```ml
function entityContact(vm, base, host, capsule)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `capsule` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L113)

<a id="function-function-mq3-vm-syscall-qagame-world-getusercmd-function-getusercmd-vm-base-host-src-mq3-vm-syscall-qagame-world-ml-112217762"></a>
### getUsercmd

```ml
function getUsercmd(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L121)

<a id="function-function-mq3-vm-syscall-qagame-world-nullablevector-function-nullablevector-vm-address-label-src-mq3-vm-syscall-qagame-world-ml-2012140331"></a>
### nullableVector

```ml
function nullableVector(vm, address, label)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L46)

<a id="function-function-mq3-vm-syscall-qagame-world-pointcontents-function-pointcontents-vm-base-host-src-mq3-vm-syscall-qagame-world-ml-1324183006"></a>
### pointContents

```ml
function pointContents(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L94)

<a id="function-function-mq3-vm-syscall-qagame-world-requirevector-function-requirevector-value-label-src-mq3-vm-syscall-qagame-world-ml-622852605"></a>
### requireVector

```ml
function requireVector(value, label)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L51)

<a id="function-function-mq3-vm-syscall-qagame-world-services-function-services-context-src-mq3-vm-syscall-qagame-world-ml-1390337559"></a>
### services

```ml
function services(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L37)

- [mq3.vm.syscall_qagame_world.Services](Type-mq3-vm-syscall-qagame-world-services-285424344.md) — struct
<a id="function-function-mq3-vm-syscall-qagame-world-trace-function-trace-vm-base-host-capsule-src-mq3-vm-syscall-qagame-world-ml-793153915"></a>
### trace

```ml
function trace(vm, base, host, capsule)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `capsule` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L83)

<a id="constant-constant-mq3-vm-syscall-qagame-world-trace-size-const-trace-size-56-src-mq3-vm-syscall-qagame-world-ml-1148073860"></a>
### TRACE_SIZE

```ml
const TRACE_SIZE = 56
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L11)

- [mq3.vm.syscall_qagame_world.TraceResult](Type-mq3-vm-syscall-qagame-world-traceresult-1924788560.md) — struct
<a id="function-function-mq3-vm-syscall-qagame-world-unavailable-function-unavailable-name-src-mq3-vm-syscall-qagame-world-ml-1545991691"></a>
### unavailable

```ml
function unavailable(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L38)

<a id="constant-constant-mq3-vm-syscall-qagame-world-usercmd-size-const-usercmd-size-24-src-mq3-vm-syscall-qagame-world-ml-394438831"></a>
### USERCMD_SIZE

```ml
const USERCMD_SIZE = 24
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L12)

<a id="function-function-mq3-vm-syscall-qagame-world-usercommand-function-usercommand-servertime-angles-buttons-weapon-forwardmove-rightmove-upmove-src-mq3-vm-syscall-qagame-world-ml-913347976"></a>
### userCommand

```ml
function userCommand(serverTime, angles, buttons, weapon, forwardmove, rightmove, upmove)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `serverTime` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |
| `buttons` | `dynamic` | — |  |
| `weapon` | `dynamic` | — |  |
| `forwardmove` | `dynamic` | — |  |
| `rightmove` | `dynamic` | — |  |
| `upmove` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L141)

<a id="function-function-mq3-vm-syscall-qagame-world-vector-function-vector-vm-address-label-src-mq3-vm-syscall-qagame-world-ml-1845833235"></a>
### vector

```ml
function vector(vm, address, label)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L41)

<a id="function-function-mq3-vm-syscall-qagame-world-writetrace-function-writetrace-vm-address-result-src-mq3-vm-syscall-qagame-world-ml-353747750"></a>
### writeTrace

```ml
function writeTrace(vm, address, result)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `result` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L56)

<a id="extern_function-extern-function-mq3-vm-syscall-qagame-world-writetracenative-extern-function-writetracenative-data-as-bytes-capacity-as-i32-offset-as-i32-allsolid-as-u32-startsolid-as-u32-fraction-as-double-x-as-double-y-as-double-z-as-double-nx-as-double-ny-as-double-nz-as-double-distance-as-double-planemetadata-as-u32-flags-as-u32-contents-as-u32-entity-as-u32-from-miniquake3-abi-dll-symbol-mq3-write-qvm-trace-returns-i32-src-mq3-vm-syscall-qagame-world-ml-401817385"></a>
### writeTraceNative

```ml
extern function writeTraceNative(data as bytes, capacity as i32, offset as i32, allsolid as u32, startsolid as u32, fraction as double, x as double, y as double, z as double, nx as double, ny as double, nz as double, distance as double, planeMetadata as u32, flags as u32, contents as u32, entity as u32) from "miniquake3_abi.dll" symbol "mq3_write_qvm_trace" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `bytes` | — |  |
| `capacity` | `i32` | — |  |
| `offset` | `i32` | — |  |
| `allsolid` | `u32` | — |  |
| `startsolid` | `u32` | — |  |
| `fraction` | `double` | — |  |
| `x` | `double` | — |  |
| `y` | `double` | — |  |
| `z` | `double` | — |  |
| `nx` | `double` | — |  |
| `ny` | `double` | — |  |
| `nz` | `double` | — |  |
| `distance` | `double` | — |  |
| `planeMetadata` | `u32` | — |  |
| `flags` | `u32` | — |  |
| `contents` | `u32` | — |  |
| `entity` | `u32` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L9)

<a id="function-function-mq3-vm-syscall-qagame-world-writeusercmd-function-writeusercmd-vm-address-command-src-mq3-vm-syscall-qagame-world-ml-1155101428"></a>
### writeUsercmd

```ml
function writeUsercmd(vm, address, command)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L72)
