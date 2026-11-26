# `src/mq3/vm/syscall_common.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.vm.syscall_common`](Package-mq3-vm-syscall-common-22321176.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trans` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/qcommon/command_buffer.ml` as `command` → [src/mq3/qcommon/command_buffer.ml](File-src-mq3-qcommon-command-buffer-ml-122952676.md)
- `mq3/qcommon/cvar.ml` as `cvar` → [src/mq3/qcommon/cvar.ml](File-src-mq3-qcommon-cvar-ml-558393614.md)
- `mq3/shared/math.ml` as `qmath` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="constant-constant-mq3-vm-syscall-common-abi-cgame-const-abi-cgame-1-src-mq3-vm-syscall-common-ml-551741812"></a>
### ABI_CGAME

```ml
const ABI_CGAME = 1
```

ABI selector for the client game VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L14)

<a id="constant-constant-mq3-vm-syscall-common-abi-qagame-const-abi-qagame-0-src-mq3-vm-syscall-common-ml-1532437661"></a>
### ABI_QAGAME

```ml
const ABI_QAGAME = 0
```

ABI selector for the server game VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L12)

<a id="constant-constant-mq3-vm-syscall-common-abi-ui-const-abi-ui-2-src-mq3-vm-syscall-common-ml-135679351"></a>
### ABI_UI

```ml
const ABI_UI = 2
```

ABI selector for the user-interface VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L16)

<a id="extern_function-extern-function-mq3-vm-syscall-common-acos-extern-function-acos-value-as-double-from-ucrtbase-dll-returns-double-src-mq3-vm-syscall-common-ml-1099186900"></a>
### acos

```ml
extern function acos(value as double) from "ucrtbase.dll" returns double
```

Compute the inverse cosine in radians.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — | Floating-point operand. |


**Returns:** The principal angle in radians, with C-runtime domain handling outside [-1, 1].

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L33)

<a id="function-function-mq3-vm-syscall-common-anglevectors-function-anglevectors-vm-base-src-mq3-vm-syscall-common-ml-1044862000"></a>
### angleVectors

```ml
function angleVectors(vm, base)
```

Compute angle vectors in vm.syscall_common; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.readFloatVector`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L458)

<a id="function-function-mq3-vm-syscall-common-argc-function-argc-host-src-mq3-vm-syscall-common-ml-1904164954"></a>
### argc

```ml
function argc(host)
```

Compute argc in vm.syscall_common; the normal completion returns `command.argc(host.commands)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `commands`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L269)

<a id="function-function-mq3-vm-syscall-common-argstext-function-argstext-vm-base-host-src-mq3-vm-syscall-common-ml-1956237070"></a>
### argsText

```ml
function argsText(vm, base, host)
```

Compute args text in vm.syscall_common; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.writeBuffer`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `host` | `dynamic` | — | Record exposing `commands`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L288)

<a id="function-function-mq3-vm-syscall-common-argument-function-argument-vm-address-as-int-index-as-int-src-mq3-vm-syscall-common-ml-1813552869"></a>
### argument

```ml
function argument(vm, address as int, index as int)
```

Read one signed little-endian 32-bit slot from a QVM syscall argument vector. Slot zero contains the trap number; subsequent slots contain arguments. Rejects negative offsets or indexes, address overflow, and reads beyond VM data memory. The argument-vector address is not masked.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | VM exposing its data-memory byte buffer. |
| `address` | `int` | — | Byte offset of the first argument-vector slot in VM memory. |
| `index` | `int` | — | Zero-based slot index, with each slot occupying four bytes. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L87)

<a id="function-function-mq3-vm-syscall-common-argv-function-argv-vm-base-host-src-mq3-vm-syscall-common-ml-849066622"></a>
### argv

```ml
function argv(vm, base, host)
```

Compute argv in vm.syscall_common; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.argument`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `host` | `dynamic` | — | Record exposing `commands`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L278)

<a id="function-function-mq3-vm-syscall-common-callback-function-callback-abi-host-src-mq3-vm-syscall-common-ml-1479744616"></a>
### callback

```ml
function callback(abi, host)
```

Capture an ABI and service bundle in a VM-compatible syscall callback. Returns a function `(vm, base)` that forwards to `dispatch`; `base` is a byte offset inside VM memory.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `abi` | `dynamic` | — | ABI_QAGAME, ABI_CGAME, or ABI_UI for the loaded module. |
| `host` | `dynamic` | — | Shared Services retained by the returned callback. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L607)

<a id="extern_function-extern-function-mq3-vm-syscall-common-ceil-extern-function-ceil-value-as-double-from-ucrtbase-dll-returns-double-src-mq3-vm-syscall-common-ml-1256415774"></a>
### ceil

```ml
extern function ceil(value as double) from "ucrtbase.dll" returns double
```

Round up to the least integral double no smaller than the input.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — | Floating-point operand. |


**Returns:** The integral double rounded toward positive infinity.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L29)

<a id="function-function-mq3-vm-syscall-common-cvarcreate-function-cvarcreate-vm-base-host-src-mq3-vm-syscall-common-ml-803860222"></a>
### cvarCreate

```ml
function cvarCreate(vm, base, host)
```

Compute cvar create in vm.syscall_common; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.readString`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.vm.syscall_common.requireCvars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L255)

<a id="function-function-mq3-vm-syscall-common-cvarinfostring-function-cvarinfostring-vm-base-host-src-mq3-vm-syscall-common-ml-217700774"></a>
### cvarInfoString

```ml
function cvarInfoString(vm, base, host)
```

Compute cvar info string in vm.syscall_common; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.argument`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.vm.syscall_common.requireCvars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L262)

<a id="function-function-mq3-vm-syscall-common-cvarinteger-function-cvarinteger-vm-base-host-src-mq3-vm-syscall-common-ml-52146638"></a>
### cvarInteger

```ml
function cvarInteger(vm, base, host)
```

Return `mq3.qcommon.cvar.variableIntegerValue(requireCvars(host), readString(vm, argument(vm, base, 1)))` from `vm.syscall_common.cvarInteger`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.readString`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.vm.syscall_common.requireCvars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L216)

<a id="function-function-mq3-vm-syscall-common-cvarreset-function-cvarreset-vm-base-host-src-mq3-vm-syscall-common-ml-234277880"></a>
### cvarReset

```ml
function cvarReset(vm, base, host)
```

Compute cvar reset in vm.syscall_common; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.readString`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.vm.syscall_common.requireCvars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L248)

<a id="function-function-mq3-vm-syscall-common-cvarset-function-cvarset-vm-base-host-src-mq3-vm-syscall-common-ml-1052599414"></a>
### cvarSet

```ml
function cvarSet(vm, base, host)
```

Compute cvar set in vm.syscall_common; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.readString`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.vm.syscall_common.requireCvars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L208)

<a id="function-function-mq3-vm-syscall-common-cvarsetvalue-function-cvarsetvalue-vm-base-host-src-mq3-vm-syscall-common-ml-1407179106"></a>
### cvarSetValue

```ml
function cvarSetValue(vm, base, host)
```

Compute cvar set value in vm.syscall_common; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.readString`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.vm.syscall_common.requireCvars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L241)

<a id="function-function-mq3-vm-syscall-common-cvarstring-function-cvarstring-vm-base-host-src-mq3-vm-syscall-common-ml-1950376642"></a>
### cvarString

```ml
function cvarString(vm, base, host)
```

Compute cvar string in vm.syscall_common; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.readString`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.vm.syscall_common.requireCvars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L232)

<a id="function-function-mq3-vm-syscall-common-cvarvaluebits-function-cvarvaluebits-vm-base-host-src-mq3-vm-syscall-common-ml-985991928"></a>
### cvarValueBits

```ml
function cvarValueBits(vm, base, host)
```

Return `mq3.compat.numeric.i32(n.floatBits(cvar.variableValue(requireCvars(host), readString(vm, argument(vm, base, 1)))))` from `vm.syscall_common.cvarValueBits`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.readString`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.vm.syscall_common.requireCvars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L224)

<a id="function-function-mq3-vm-syscall-common-dispatch-function-dispatch-abi-host-vm-base-src-mq3-vm-syscall-common-ml-1409756384"></a>
### dispatch

```ml
function dispatch(abi, host, vm, base)
```

Read a QVM trap number and route it to the shared libc or selected subsystem dispatcher. Validates the host/VM context and argument-vector access first. Opcodes 100..113 use the libc table; other opcodes use the selected server-game, client-game, or UI table. Returns that trap's ABI result or a syscall error for missing services, invalid memory, or unsupported dispatch.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `abi` | `dynamic` | — | ABI selector expected to be ABI_QAGAME, ABI_CGAME, or ABI_UI. |
| `host` | `dynamic` | — | Shared Services whose callbacks receive `host.context` as their first argument. |
| `vm` | `dynamic` | — | VM exposing a data-memory byte buffer and pointer mask. |
| `base` | `dynamic` | — | Byte offset of the syscall vector; slot zero is the trap number, followed by four-byte arguments. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L593)

<a id="function-function-mq3-vm-syscall-common-dispatchcgame-function-dispatchcgame-vm-base-host-op-src-mq3-vm-syscall-common-ml-925060171"></a>
### dispatchCgame

```ml
function dispatchCgame(vm, base, host, op)
```

Dispatch a shared client-game console, cvar, command, clock, or file-system trap. Returns the selected service's ABI result: zero for side-effect traps, an integer/bit-pattern value, or a file-open length/status result. Unknown trap numbers produce a subsystem-specific syscall error.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | VM containing the argument vector and any input/output memory spans. |
| `base` | `dynamic` | — | Byte offset of the syscall argument vector. |
| `host` | `dynamic` | — | Shared Services providing the registry, command parser, and callbacks needed by the trap. |
| `op` | `dynamic` | — | Client-game trap number already read from argument slot zero. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L537)

<a id="function-function-mq3-vm-syscall-common-dispatchlibc-function-dispatchlibc-abi-vm-base-op-src-mq3-vm-syscall-common-ml-1088994921"></a>
### dispatchLibc

```ml
function dispatchLibc(abi, vm, base, op)
```

Dispatch a QVM memory, scalar-math, or vector-math compatibility trap. Opcodes 100..106 share the memory/trigonometry mappings. Later opcodes depend on the selected ABI; floating results are returned as signed int32 containers of float32 bits. Unsupported combinations fail.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `abi` | `dynamic` | — | ABI_QAGAME, ABI_CGAME, or ABI_UI, selecting the ABI-specific tail of the trap table. |
| `vm` | `dynamic` | — | VM whose argument vector and memory spans are consumed by the selected trap. |
| `base` | `dynamic` | — | Byte offset of the syscall argument vector. |
| `op` | `dynamic` | — | Trap number already read from argument slot zero. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L480)

<a id="function-function-mq3-vm-syscall-common-dispatchqagame-function-dispatchqagame-vm-base-host-op-src-mq3-vm-syscall-common-ml-461021241"></a>
### dispatchQagame

```ml
function dispatchQagame(vm, base, host, op)
```

Dispatch a shared server-game console, cvar, command, clock, or file-system trap. Returns the selected service's ABI result: zero for side-effect traps, an integer/bit-pattern value, or a file-open length/status result. Unknown trap numbers produce a subsystem-specific syscall error.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | VM containing the argument vector and any input/output memory spans. |
| `base` | `dynamic` | — | Byte offset of the syscall argument vector. |
| `host` | `dynamic` | — | Shared Services providing the registry, command parser, and callbacks needed by the trap. |
| `op` | `dynamic` | — | Server-game trap number already read from argument slot zero. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L509)

<a id="function-function-mq3-vm-syscall-common-dispatchui-function-dispatchui-vm-base-host-op-src-mq3-vm-syscall-common-ml-44064469"></a>
### dispatchUi

```ml
function dispatchUi(vm, base, host, op)
```

Dispatch a shared user-interface console, cvar, command, clock, or file-system trap. Returns the selected service's ABI result: zero for side-effect traps, an integer/bit-pattern value, or a file-open length/status result. Unknown trap numbers produce a subsystem-specific syscall error.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | VM containing the argument vector and any input/output memory spans. |
| `base` | `dynamic` | — | Byte offset of the syscall argument vector. |
| `host` | `dynamic` | — | Shared Services providing the registry, command parser, and callbacks needed by the trap. |
| `op` | `dynamic` | — | User-interface trap number already read from argument slot zero. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L560)

<a id="function-function-mq3-vm-syscall-common-emitprint-function-emitprint-vm-base-host-iserror-src-mq3-vm-syscall-common-ml-1206086400"></a>
### emitPrint

```ml
function emitPrint(vm, base, host, isError)
```

Emit print in vm.syscall_common; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.readString`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `host` | `dynamic` | — | Record exposing `printFn`, `errorFn`, `context`. |
| `isError` | `dynamic` | — | Is error operand used by `emitPrint`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L352)

<a id="function-function-mq3-vm-syscall-common-executeconsole-function-executeconsole-vm-base-host-src-mq3-vm-syscall-common-ml-1362842418"></a>
### executeConsole

```ml
function executeConsole(vm, base, host)
```

Execute console in vm.syscall_common; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.argument`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `host` | `dynamic` | — | Record exposing `consoleFn`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L363)

<a id="function-function-mq3-vm-syscall-common-fail-function-fail-message-src-mq3-vm-syscall-common-ml-357426807"></a>
### fail

```ml
function fail(message)
```

Create the vm.syscall_common error for `fail` with 3420 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("QVM syscall: " + message)` and `error(3420, ("QVM syscall: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L79)

<a id="function-function-mq3-vm-syscall-common-floatresult-function-floatresult-value-src-mq3-vm-syscall-common-ml-1968315299"></a>
### floatResult

```ml
function floatResult(value)
```

Return `mq3.compat.numeric.i32(n.floatBits(value))` from `vm.syscall_common.floatResult`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Floating-point value to narrow and reinterpret. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L417)

<a id="extern_function-extern-function-mq3-vm-syscall-common-floor-extern-function-floor-value-as-double-from-ucrtbase-dll-returns-double-src-mq3-vm-syscall-common-ml-1357807104"></a>
### floor

```ml
extern function floor(value as double) from "ucrtbase.dll" returns double
```

Round down to the greatest integral double no larger than the input.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — | Floating-point operand. |


**Returns:** The integral double rounded toward negative infinity.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L25)

<a id="function-function-mq3-vm-syscall-common-fsclose-function-fsclose-vm-base-host-src-mq3-vm-syscall-common-ml-2115556960"></a>
### fsClose

```ml
function fsClose(vm, base, host)
```

Close the host file handle in argument slot one and return zero. A missing close callback produces a syscall error.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | VM containing the syscall argument vector. |
| `base` | `dynamic` | — | Byte offset of the syscall argument vector. |
| `host` | `dynamic` | — | Services with `closeFn(context, handle)`; its result is ignored. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L342)

<a id="function-function-mq3-vm-syscall-common-fsopen-function-fsopen-vm-base-host-src-mq3-vm-syscall-common-ml-733493098"></a>
### fsOpen

```ml
function fsOpen(vm, base, host)
```

Open a host file and return the callback's length/status result to the VM. Reads argument slots 1..3 as path pointer, optional handle-output pointer, and open mode. A `void` callback result becomes handle 0 and result -1. With no handle-output pointer, a nonzero opened handle is closed when `closeFn` is available; the length/status result is still returned.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | VM providing the path string and an optional writable four-byte handle slot. |
| `base` | `dynamic` | — | Byte offset of the syscall argument vector, whose slot zero holds the trap number. |
| `host` | `dynamic` | — | Services with `openFn(context, path, mode)` and optional `closeFn(context, handle)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L300)

<a id="function-function-mq3-vm-syscall-common-fsread-function-fsread-vm-base-host-src-mq3-vm-syscall-common-ml-213420058"></a>
### fsRead

```ml
function fsRead(vm, base, host)
```

Read an exact byte count from a host file into VM memory and return zero. Argument slots 1..3 contain destination pointer, requested byte count, and file handle. The callback must return at least the requested count; a short result is a syscall error.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | VM containing the writable destination span and syscall argument vector. |
| `base` | `dynamic` | — | Byte offset of the syscall argument vector. |
| `host` | `dynamic` | — | Services with `readFn(context, handle, count)` returning source bytes. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L319)

<a id="function-function-mq3-vm-syscall-common-fswrite-function-fswrite-vm-base-host-src-mq3-vm-syscall-common-ml-1069829086"></a>
### fsWrite

```ml
function fsWrite(vm, base, host)
```

Pass a checked byte slice from VM memory to the host file writer and return zero. Argument slots 1..3 contain source pointer, byte count, and file handle. The callback's return value is ignored; this trap does not return a partial-write count.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | VM containing the source byte span and syscall argument vector. |
| `base` | `dynamic` | — | Byte offset of the syscall argument vector. |
| `host` | `dynamic` | — | Services with `writeFn(context, handle, data)` handling the outgoing bytes. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L331)

<a id="function-function-mq3-vm-syscall-common-libcmemcpy-function-libcmemcpy-vm-base-src-mq3-vm-syscall-common-ml-1864672372"></a>
### libcMemcpy

```ml
function libcMemcpy(vm, base)
```

Copy a checked VM memory span through a temporary byte buffer, preserving overlapping-source data. Argument slots 1..3 contain destination pointer, source pointer, and byte count. Returns the original destination pointer value after copying exactly the requested number of bytes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | VM containing both memory spans. |
| `base` | `dynamic` | — | Byte offset of the memcpy syscall argument vector. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L385)

<a id="function-function-mq3-vm-syscall-common-libcmemset-function-libcmemset-vm-base-src-mq3-vm-syscall-common-ml-1527759304"></a>
### libcMemset

```ml
function libcMemset(vm, base)
```

Fill a checked VM memory span with the low eight bits of the requested value. Argument slots 1..3 contain destination pointer, fill value, and byte count. Returns the original destination pointer value; even a zero count requires a valid nonzero pointer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | VM whose data-memory bytes are modified. |
| `base` | `dynamic` | — | Byte offset of the memset syscall argument vector. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L373)

<a id="function-function-mq3-vm-syscall-common-libcstrncpy-function-libcstrncpy-vm-base-src-mq3-vm-syscall-common-ml-1186171926"></a>
### libcStrncpy

```ml
function libcStrncpy(vm, base)
```

Copy up to a fixed number of bytes from a VM string, zero-padding after the first terminator. Argument slots 1..3 contain destination pointer, source pointer, and byte count. Returns the original destination pointer. If no zero byte occurs within the count, the output has no added terminator. Both pointers are validated even when the count is zero; the source is checked as each byte is read.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | VM containing the source string and destination span. |
| `base` | `dynamic` | — | Byte offset of the strncpy syscall argument vector. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L400)

<a id="function-function-mq3-vm-syscall-common-matrixmultiply-function-matrixmultiply-vm-base-src-mq3-vm-syscall-common-ml-915894864"></a>
### matrixMultiply

```ml
function matrixMultiply(vm, base)
```

Compute matrix multiply in vm.syscall_common; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.readFloatVector`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L448)

<a id="constant-constant-mq3-vm-syscall-common-max-vm-string-const-max-vm-string-8192-src-mq3-vm-syscall-common-ml-1787193685"></a>
### MAX_VM_STRING

```ml
const MAX_VM_STRING = 8192
```

Maximum number of VM bytes inspected for a string, including its required zero terminator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L18)

- [mq3.vm.syscall_common.OpenResult](Type-mq3-vm-syscall-common-openresult-1613615283.md) — struct
<a id="function-function-mq3-vm-syscall-common-perpendicularvector-function-perpendicularvector-vm-base-src-mq3-vm-syscall-common-ml-329215006"></a>
### perpendicularVector

```ml
function perpendicularVector(vm, base)
```

Compute perpendicular vector in vm.syscall_common; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.readFloatVector`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L465)

<a id="function-function-mq3-vm-syscall-common-pointer-function-pointer-vm-value-size-label-src-mq3-vm-syscall-common-ml-1609263377"></a>
### pointer

```ml
function pointer(vm, value, size, label)
```

Convert a nonzero QVM pointer value to a checked byte offset for a contiguous memory span. Applies `value & vm.mask` before checking the span against VM data memory. Rejects a zero original pointer, negative size, or an out-of-bounds span; a zero-length request still requires a nonzero pointer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | VM supplying the data buffer and its address mask. |
| `value` | `dynamic` | — | QVM pointer value to mask and validate, not a native host address. |
| `size` | `dynamic` | — | Required contiguous span length in bytes. |
| `label` | `dynamic` | — | Name of the accessed value, included in validation diagnostics. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L100)

<a id="function-function-mq3-vm-syscall-common-readfloatvector-function-readfloatvector-vm-address-count-label-src-mq3-vm-syscall-common-ml-711285158"></a>
### readFloatVector

```ml
function readFloatVector(vm, address, count, label)
```

Read consecutive little-endian float32 values from VM memory into a MiniLang numeric array. The checked memory span occupies `count * 4` bytes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | VM whose data memory contains the packed float32 values. |
| `address` | `dynamic` | — | Nonzero QVM pointer to the first component. |
| `count` | `dynamic` | — | Number of float32 components to read, not a byte count. |
| `label` | `dynamic` | — | Vector name included in memory-validation diagnostics. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L425)

<a id="function-function-mq3-vm-syscall-common-readstring-function-readstring-vm-value-src-mq3-vm-syscall-common-ml-1917382626"></a>
### readString

```ml
function readString(vm, value)
```

Decode a zero-terminated string from QVM memory. The terminator must occur within the first MAX_VM_STRING bytes or before the end of VM memory, whichever comes first. A missing terminator or invalid pointer produces a syscall error.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | VM whose data-memory buffer contains the string. |
| `value` | `dynamic` | — | Nonzero QVM pointer value for the first string byte; masked by the VM address mask. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L113)

<a id="function-function-mq3-vm-syscall-common-registercvar-function-registercvar-vm-base-host-src-mq3-vm-syscall-common-ml-1637769386"></a>
### registerCvar

```ml
function registerCvar(vm, base, host)
```

Register cvar in vm.syscall_common; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.argument`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.vm.syscall_common.requireCvars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L184)

<a id="function-function-mq3-vm-syscall-common-requirecvars-function-requirecvars-host-src-mq3-vm-syscall-common-ml-2017679414"></a>
### requireCvars

```ml
function requireCvars(host)
```

Compute require cvars in vm.syscall_common; the normal completion returns `host.cvars`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `cvars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L158)

<a id="function-function-mq3-vm-syscall-common-services-function-services-registry-commands-context-src-mq3-vm-syscall-common-ml-1456419160"></a>
### services

```ml
function services(registry, commands, context)
```

Create shared QVM services with all host callbacks initially unset.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Host cvar registry used by cvar traps, or `void` until configured. |
| `commands` | `dynamic` | — | Command-buffer state supplying the current tokenized command, or `void` until configured. |
| `context` | `dynamic` | — | Opaque value passed unchanged as the first argument to host callbacks. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L73)

- [mq3.vm.syscall_common.Services](Type-mq3-vm-syscall-common-services-1954415278.md) — struct
<a id="function-function-mq3-vm-syscall-common-updatecvar-function-updatecvar-vm-base-host-src-mq3-vm-syscall-common-ml-1855830262"></a>
### updateCvar

```ml
function updateCvar(vm, base, host)
```

Update cvar in vm.syscall_common; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.vm.syscall_common.requireCvars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L195)

<a id="constant-constant-mq3-vm-syscall-common-vm-cvar-size-const-vm-cvar-size-272-src-mq3-vm-syscall-common-ml-671875366"></a>
### VM_CVAR_SIZE

```ml
const VM_CVAR_SIZE = 272
```

Legacy vmCvar_t size: four 32-bit header fields followed by 256 bytes of zero-terminated string storage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L20)

<a id="function-function-mq3-vm-syscall-common-writebuffer-function-writebuffer-vm-value-capacity-data-label-src-mq3-vm-syscall-common-ml-452780766"></a>
### writeBuffer

```ml
function writeBuffer(vm, value, capacity, data, label)
```

Write a bounded zero-terminated byte string to QVM memory and return its payload byte count. Copies at most `capacity - 1` bytes and appends a zero byte. Zero capacity returns zero without accessing or validating the pointer; negative capacity and invalid positive-capacity spans fail. Truncation is byte-based and may split a multibyte encoded character.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | VM whose data memory receives the string and terminator. |
| `value` | `dynamic` | — | Destination QVM pointer value, validated only when capacity is positive. |
| `capacity` | `dynamic` | — | Total destination capacity in bytes, including space for the zero terminator. |
| `data` | `dynamic` | — | Value converted by `bytes(data)` before copying, typically text or a byte buffer. |
| `label` | `dynamic` | — | Destination name included in validation diagnostics. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L131)

<a id="function-function-mq3-vm-syscall-common-writefloatvector-function-writefloatvector-vm-address-values-label-src-mq3-vm-syscall-common-ml-1911562129"></a>
### writeFloatVector

```ml
function writeFloatVector(vm, address, values, label)
```

Write a numeric array as consecutive little-endian float32 values and return `void`. An address of zero intentionally skips the write, allowing optional vector outputs such as AngleVectors. Otherwise the destination must hold four bytes per input component.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | VM whose data-memory buffer receives the packed components. |
| `address` | `dynamic` | — | Optional output QVM pointer; zero means no output requested. |
| `values` | `dynamic` | — | Numeric components narrowed to float32 before serialization. |
| `label` | `dynamic` | — | Vector name included in memory-validation diagnostics. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L440)

<a id="function-function-mq3-vm-syscall-common-writeraw-function-writeraw-vm-value-data-count-label-src-mq3-vm-syscall-common-ml-1927750217"></a>
### writeRaw

```ml
function writeRaw(vm, value, data, count, label)
```

Copy exactly `count` bytes into QVM memory without appending a terminator. Returns `void` on success. Rejects negative lengths, invalid destinations, and source buffers shorter than the requested count. A zero count still validates the destination pointer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | VM whose data memory receives the raw bytes. |
| `value` | `dynamic` | — | Nonzero destination QVM pointer value, masked and checked for the requested span. |
| `data` | `dynamic` | — | Source byte buffer containing at least `count` bytes. |
| `count` | `dynamic` | — | Number of source bytes to copy. |
| `label` | `dynamic` | — | Output name included in pointer and short-source diagnostics. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L148)

<a id="function-function-mq3-vm-syscall-common-writevmcvar-function-writevmcvar-vm-address-variable-src-mq3-vm-syscall-common-ml-494905159"></a>
### writeVmCvar

```ml
function writeVmCvar(vm, address, variable)
```

Serialize a host cvar into the 272-byte legacy vmCvar_t layout and return `void`. Writes the index, modification count, float32 value bits, and integer at byte offsets 0, 4, 8, and 12. The following 256 bytes contain the string with zero padding; encoded string payloads above 255 bytes fail validation after the four header fields have already been written.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | VM whose data memory contains the destination structure. |
| `address` | `dynamic` | — | Nonzero QVM pointer to at least VM_CVAR_SIZE writable bytes. |
| `variable` | `dynamic` | — | Host cvar exposing index, modificationCount, value, integer, and string. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/syscall_common.ml#L170)
