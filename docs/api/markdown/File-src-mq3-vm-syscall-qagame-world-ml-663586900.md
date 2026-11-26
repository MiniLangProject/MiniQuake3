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

Return `mq3.vm.syscall_common.argument(vm, base, index)` from `vm.syscall_qagame_world.arg`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.argument`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.vm.syscall_common.argument`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L68)

<a id="function-function-mq3-vm-syscall-qagame-world-dispatch-function-dispatch-host-vm-base-op-src-mq3-vm-syscall-qagame-world-ml-1798047605"></a>
### dispatch

```ml
function dispatch(host, vm, base, op)
```

Dispatch syscall qagame world in vm.syscall_qagame_world; the normal completion returns `error(3422, ("qagame world syscall: unsupported trap " + str(op)))`.

Validation failures include `qagame world syscall: invalid dispatcher context`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.vm.syscall_qagame_world.trace`. |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_qagame_world.trace`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_qagame_world.trace`. |
| `op` | `dynamic` | — | Op used in `str(op)` and `("qagame world syscall: unsupported trap " + str(op))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L210)

<a id="function-function-mq3-vm-syscall-qagame-world-entitiesinbox-function-entitiesinbox-vm-base-host-src-mq3-vm-syscall-qagame-world-ml-1405818632"></a>
### entitiesInBox

```ml
function entitiesInBox(vm, base, host)
```

Compute entities in box in vm.syscall_qagame_world; the normal completion returns `len(found)`.

Validation failures include `qagame world syscall: negative entity-list capacity`; `qagame world syscall: entity-list capacity overflow`; `qagame world syscall: entity service returned no list`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_qagame_world.arg`. |
| `host` | `dynamic` | — | Record exposing `entitiesInBoxFn`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L166)

<a id="function-function-mq3-vm-syscall-qagame-world-entitycontact-function-entitycontact-vm-base-host-capsule-src-mq3-vm-syscall-qagame-world-ml-140877783"></a>
### entityContact

```ml
function entityContact(vm, base, host, capsule)
```

Compute entity contact in vm.syscall_qagame_world; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_qagame_world.vector`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_qagame_world.arg`. |
| `host` | `dynamic` | — | Record exposing `entityContactFn`, `context`. |
| `capsule` | `dynamic` | — | Capsule used in `host.entityContactFn(host.context, mins, maxs, entity, capsule)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L185)

<a id="function-function-mq3-vm-syscall-qagame-world-getusercmd-function-getusercmd-vm-base-host-src-mq3-vm-syscall-qagame-world-ml-112217762"></a>
### getUsercmd

```ml
function getUsercmd(vm, base, host)
```

Get usercmd in vm.syscall_qagame_world; the normal completion returns `writeUsercmd(vm, address, host.getUsercmdFn(host.context, arg(vm, base, 1)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_qagame_world.arg`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_qagame_world.arg`. |
| `host` | `dynamic` | — | Record exposing `getUsercmdFn`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L197)

<a id="function-function-mq3-vm-syscall-qagame-world-nullablevector-function-nullablevector-vm-address-label-src-mq3-vm-syscall-qagame-world-ml-2012140331"></a>
### nullableVector

```ml
function nullableVector(vm, address, label)
```

Compute nullable vector in vm.syscall_qagame_world; the normal completion returns `vector(vm, address, label)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_qagame_world.vector`. |
| `address` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_qagame_world.vector`. |
| `label` | `dynamic` | — | Label passed as `label` to `mq3.vm.syscall_qagame_world.vector`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L83)

<a id="function-function-mq3-vm-syscall-qagame-world-pointcontents-function-pointcontents-vm-base-host-src-mq3-vm-syscall-qagame-world-ml-1324183006"></a>
### pointContents

```ml
function pointContents(vm, base, host)
```

Compute point contents in vm.syscall_qagame_world; the normal completion returns `host.pointContentsFn(host.context, vector(vm, arg(vm, base, 1), "point contents origin"), arg(vm, base, 2))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_qagame_world.vector`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_qagame_world.arg`. |
| `host` | `dynamic` | — | Record exposing `pointContentsFn`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L155)

<a id="function-function-mq3-vm-syscall-qagame-world-requirevector-function-requirevector-value-label-src-mq3-vm-syscall-qagame-world-ml-622852605"></a>
### requireVector

```ml
function requireVector(value, label)
```

Compute require vector in vm.syscall_qagame_world; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `len(value)` and `(value == void)`. |
| `label` | `dynamic` | — | Label used in `("qagame world syscall: invalid " + label)` and `error(3422, ("qagame world syscall: invalid " + label))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L91)

<a id="function-function-mq3-vm-syscall-qagame-world-services-function-services-context-src-mq3-vm-syscall-qagame-world-ml-1390337559"></a>
### services

```ml
function services(context)
```

Create `mq3.vm.syscall_qagame_world.Services` with context=context; traceFn=void; pointContentsFn=void; entitiesInBoxFn=void; entityContactFn=void; getUsercmdFn=void.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Initial `context` field stored in the returned or constructed `mq3.vm.syscall_qagame_world.Services` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L60)

- [mq3.vm.syscall_qagame_world.Services](Type-mq3-vm-syscall-qagame-world-services-285424344.md) — struct
<a id="function-function-mq3-vm-syscall-qagame-world-trace-function-trace-vm-base-host-capsule-src-mq3-vm-syscall-qagame-world-ml-793153915"></a>
### trace

```ml
function trace(vm, base, host, capsule)
```

Trace syscall qagame world in vm.syscall_qagame_world; the normal completion returns `writeTrace(vm, output, result)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_qagame_world.arg`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_qagame_world.arg`. |
| `host` | `dynamic` | — | Record exposing `traceFn`, `context`. |
| `capsule` | `dynamic` | — | Capsule used in `host.traceFn(host.context, start, mins, maxs, finish, arg(vm, base, 6), arg(vm, base, 7), capsule)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L140)

<a id="constant-constant-mq3-vm-syscall-qagame-world-trace-size-const-trace-size-56-src-mq3-vm-syscall-qagame-world-ml-1148073860"></a>
### TRACE_SIZE

```ml
const TRACE_SIZE = 56
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L30)

- [mq3.vm.syscall_qagame_world.TraceResult](Type-mq3-vm-syscall-qagame-world-traceresult-1924788560.md) — struct
<a id="function-function-mq3-vm-syscall-qagame-world-unavailable-function-unavailable-name-src-mq3-vm-syscall-qagame-world-ml-1545991691"></a>
### unavailable

```ml
function unavailable(name)
```

Create the vm.syscall_qagame_world error for `unavailable` with 3422 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used in `("qagame world syscall: " + name)` and `(("qagame world syscall: " + name) + " service unavailable")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L63)

<a id="constant-constant-mq3-vm-syscall-qagame-world-usercmd-size-const-usercmd-size-24-src-mq3-vm-syscall-qagame-world-ml-394438831"></a>
### USERCMD_SIZE

```ml
const USERCMD_SIZE = 24
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L31)

<a id="function-function-mq3-vm-syscall-qagame-world-usercommand-function-usercommand-servertime-angles-buttons-weapon-forwardmove-rightmove-upmove-src-mq3-vm-syscall-qagame-world-ml-913347976"></a>
### userCommand

```ml
function userCommand(serverTime, angles, buttons, weapon, forwardmove, rightmove, upmove)
```

Return `mq3.qcommon.message_delta.UserCommand(serverTime, angles, buttons, weapon, forwardmove, rightmove, upmove)` from `vm.syscall_qagame_world.userCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `serverTime` | `dynamic` | — | Initial `serverTime` field stored in the returned or constructed `mq3.qcommon.message_delta.UserCommand` record. |
| `angles` | `dynamic` | — | Initial `angles` field stored in the returned or constructed `mq3.qcommon.message_delta.UserCommand` record. |
| `buttons` | `dynamic` | — | Initial `buttons` field stored in the returned or constructed `mq3.qcommon.message_delta.UserCommand` record. |
| `weapon` | `dynamic` | — | Initial `weapon` field stored in the returned or constructed `mq3.qcommon.message_delta.UserCommand` record. |
| `forwardmove` | `dynamic` | — | Initial `forwardmove` field stored in the returned or constructed `mq3.qcommon.message_delta.UserCommand` record. |
| `rightmove` | `dynamic` | — | Initial `rightmove` field stored in the returned or constructed `mq3.qcommon.message_delta.UserCommand` record. |
| `upmove` | `dynamic` | — | Initial `upmove` field stored in the returned or constructed `mq3.qcommon.message_delta.UserCommand` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L232)

<a id="function-function-mq3-vm-syscall-qagame-world-vector-function-vector-vm-address-label-src-mq3-vm-syscall-qagame-world-ml-1845833235"></a>
### vector

```ml
function vector(vm, address, label)
```

Apply `mq3.vm.syscall_common.pointer`, `mq3.compat.numeric.bitsFloat`, `mq3.compat.numeric.readU32` for vector in vm.syscall_qagame_world.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `address` | `dynamic` | — | Value passed as `value` to `mq3.vm.syscall_common.pointer`. |
| `label` | `dynamic` | — | Label passed as `label` to `mq3.vm.syscall_common.pointer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L74)

<a id="function-function-mq3-vm-syscall-qagame-world-writetrace-function-writetrace-vm-address-result-src-mq3-vm-syscall-qagame-world-ml-353747750"></a>
### writeTrace

```ml
function writeTrace(vm, address, result)
```

Write trace in vm.syscall_qagame_world; the normal completion returns `0`.

Validation failures include `qagame world syscall: trace service returned no result`; `qagame world syscall: invalid trace output buffer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `address` | `dynamic` | — | Value passed as `value` to `mq3.vm.syscall_common.pointer`. |
| `result` | `dynamic` | — | Record exposing `endpos`, `planeNormal`, `allsolid`, `startsolid`, `planeType`, `planeSignBits`, `fraction` and further fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L102)

<a id="extern_function-extern-function-mq3-vm-syscall-qagame-world-writetracenative-extern-function-writetracenative-data-as-bytes-capacity-as-i32-offset-as-i32-allsolid-as-u32-startsolid-as-u32-fraction-as-double-x-as-double-y-as-double-z-as-double-nx-as-double-ny-as-double-nz-as-double-distance-as-double-planemetadata-as-u32-flags-as-u32-contents-as-u32-entity-as-u32-from-miniquake3-abi-dll-symbol-mq3-write-qvm-trace-returns-i32-src-mq3-vm-syscall-qagame-world-ml-401817385"></a>
### writeTraceNative

```ml
extern function writeTraceNative(data as bytes, capacity as i32, offset as i32, allsolid as u32, startsolid as u32, fraction as double, x as double, y as double, z as double, nx as double, ny as double, nz as double, distance as double, planeMetadata as u32, flags as u32, contents as u32, entity as u32) from "miniquake3_abi.dll" symbol "mq3_write_qvm_trace" returns i32
```

Serialize a complete 56-byte Quake III trace_t into bounded QVM memory.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `bytes` | — | Mutable VM byte memory. |
| `capacity` | `i32` | — | VM byte-buffer capacity. |
| `offset` | `i32` | — | Destination byte offset with 56 bytes remaining. |
| `allsolid` | `u32` | — | Nonzero when the complete sweep is inside solid geometry. |
| `startsolid` | `u32` | — | Nonzero when the initial position is inside solid geometry. |
| `fraction` | `double` | — | Fraction of the sweep completed before impact. |
| `x` | `double` | — | Trace endpoint X coordinate. |
| `y` | `double` | — | Trace endpoint Y coordinate. |
| `z` | `double` | — | Trace endpoint Z coordinate. |
| `nx` | `double` | — | Impact-plane normal X component. |
| `ny` | `double` | — | Impact-plane normal Y component. |
| `nz` | `double` | — | Impact-plane normal Z component. |
| `distance` | `double` | — | Impact-plane distance. |
| `planeMetadata` | `u32` | — | Packed plane type/sign bits; the native writer retains the low 16 bits. |
| `flags` | `u32` | — | Surface flags. |
| `contents` | `u32` | — | Collision contents flags. |
| `entity` | `u32` | — | Hit entity number. |


**Returns:** 1 after writing all fourteen words; 0 when the destination is null or out of bounds.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L28)

<a id="function-function-mq3-vm-syscall-qagame-world-writeusercmd-function-writeusercmd-vm-address-command-src-mq3-vm-syscall-qagame-world-ml-1155101428"></a>
### writeUsercmd

```ml
function writeUsercmd(vm, address, command)
```

Write usercmd in vm.syscall_qagame_world; the normal completion returns `0`.

Validation failures include `qagame world syscall: invalid usercmd result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `address` | `dynamic` | — | Value passed as `value` to `mq3.vm.syscall_common.pointer`. |
| `command` | `dynamic` | — | Record exposing `angles`, `serverTime`, `buttons`, `weapon`, `forwardmove`, `rightmove`, `upmove`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_qagame_world.ml#L124)
