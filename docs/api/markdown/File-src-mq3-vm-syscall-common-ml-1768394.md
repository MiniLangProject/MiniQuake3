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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L12)

<a id="constant-constant-mq3-vm-syscall-common-abi-qagame-const-abi-qagame-0-src-mq3-vm-syscall-common-ml-1532437661"></a>
### ABI_QAGAME

```ml
const ABI_QAGAME = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L11)

<a id="constant-constant-mq3-vm-syscall-common-abi-ui-const-abi-ui-2-src-mq3-vm-syscall-common-ml-135679351"></a>
### ABI_UI

```ml
const ABI_UI = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L13)

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

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L28)

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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L405)

<a id="function-function-mq3-vm-syscall-common-argc-function-argc-host-src-mq3-vm-syscall-common-ml-1904164954"></a>
### argc

```ml
function argc(host)
```

Compute argc in vm.syscall_common; the normal completion returns `command.argc(host.commands)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `commands`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L234)

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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L253)

<a id="function-function-mq3-vm-syscall-common-argument-function-argument-vm-address-as-int-index-as-int-src-mq3-vm-syscall-common-ml-1813552869"></a>
### argument

```ml
function argument(vm, address as int, index as int)
```

Compute argument in vm.syscall_common; the normal completion returns `n.readI32(vm.data, at)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `address` | `int` | — | Address used in `(address < 0)` and `(at < address)`. |
| `index` | `int` | — | Index used in `(index * 4)` and `(index < 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L64)

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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L243)

<a id="function-function-mq3-vm-syscall-common-callback-function-callback-abi-host-src-mq3-vm-syscall-common-ml-1479744616"></a>
### callback

```ml
function callback(abi, host)
```

Apply `mq3.vm.syscall_common.dispatch` for callback in vm.syscall_common.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `abi` | `dynamic` | — | Abi passed as `abi` to `mq3.vm.syscall_common.dispatch`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.vm.syscall_common.dispatch`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L542)

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

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L24)

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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L220)

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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L227)

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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L181)

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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L213)

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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L173)

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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L206)

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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L197)

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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L189)

<a id="function-function-mq3-vm-syscall-common-dispatch-function-dispatch-abi-host-vm-base-src-mq3-vm-syscall-common-ml-1409756384"></a>
### dispatch

```ml
function dispatch(abi, host, vm, base)
```

Dispatch syscall common in vm.syscall_common; the normal completion returns `fail("unknown ABI")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `abi` | `dynamic` | — | Abi passed as `abi` to `mq3.vm.syscall_common.dispatchLibc`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.vm.syscall_common.dispatchQagame`. |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L529)

<a id="function-function-mq3-vm-syscall-common-dispatchcgame-function-dispatchcgame-vm-base-host-op-src-mq3-vm-syscall-common-ml-925060171"></a>
### dispatchCgame

```ml
function dispatchCgame(vm, base, host, op)
```

Dispatch cgame in vm.syscall_common; the normal completion returns `fail(("unsupported cgame trap " + str(op)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.dispatchQagame`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_common.dispatchQagame`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.vm.syscall_common.dispatchQagame`. |
| `op` | `dynamic` | — | Op passed as `op` to `mq3.vm.syscall_common.dispatchQagame`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L478)

<a id="function-function-mq3-vm-syscall-common-dispatchlibc-function-dispatchlibc-abi-vm-base-op-src-mq3-vm-syscall-common-ml-1088994921"></a>
### dispatchLibc

```ml
function dispatchLibc(abi, vm, base, op)
```

Dispatch libc in vm.syscall_common; the normal completion returns `fail(("unsupported VM libc trap " + str(op)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `abi` | `dynamic` | — | Abi used in `(abi == ABI_CGAME)` and `(abi == ABI_QAGAME)`. |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.libcMemset`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_common.libcMemset`. |
| `op` | `dynamic` | — | Op used in `str(op)` and `(op == 107)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L425)

<a id="function-function-mq3-vm-syscall-common-dispatchqagame-function-dispatchqagame-vm-base-host-op-src-mq3-vm-syscall-common-ml-461021241"></a>
### dispatchQagame

```ml
function dispatchQagame(vm, base, host, op)
```

Dispatch qagame in vm.syscall_common; the normal completion returns `fail(("unsupported qagame trap " + str(op)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.emitPrint`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_common.emitPrint`. |
| `host` | `dynamic` | — | Record exposing `millisecondsFn`, `context`. |
| `op` | `dynamic` | — | Op used in `str(op)` and `("unsupported qagame trap " + str(op))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L452)

<a id="function-function-mq3-vm-syscall-common-dispatchui-function-dispatchui-vm-base-host-op-src-mq3-vm-syscall-common-ml-44064469"></a>
### dispatchUi

```ml
function dispatchUi(vm, base, host, op)
```

Dispatch ui in vm.syscall_common; the normal completion returns `fail(("unsupported UI trap " + str(op)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.emitPrint`. |
| `base` | `dynamic` | — | Base passed as `base` to `mq3.vm.syscall_common.emitPrint`. |
| `host` | `dynamic` | — | Record exposing `millisecondsFn`, `context`. |
| `op` | `dynamic` | — | Op used in `str(op)` and `("unsupported UI trap " + str(op))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L499)

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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L309)

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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L320)

<a id="function-function-mq3-vm-syscall-common-fail-function-fail-message-src-mq3-vm-syscall-common-ml-357426807"></a>
### fail

```ml
function fail(message)
```

Create the vm.syscall_common error for `fail` with 3420 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("QVM syscall: " + message)` and `error(3420, ("QVM syscall: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L58)

<a id="function-function-mq3-vm-syscall-common-floatresult-function-floatresult-value-src-mq3-vm-syscall-common-ml-1968315299"></a>
### floatResult

```ml
function floatResult(value)
```

Return `mq3.compat.numeric.i32(n.floatBits(value))` from `vm.syscall_common.floatResult`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Floating-point value to narrow and reinterpret. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L367)

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

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L20)

<a id="function-function-mq3-vm-syscall-common-fsclose-function-fsclose-vm-base-host-src-mq3-vm-syscall-common-ml-2115556960"></a>
### fsClose

```ml
function fsClose(vm, base, host)
```

Close syscall common in vm.syscall_common; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.argument`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `host` | `dynamic` | — | Record exposing `closeFn`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L299)

<a id="function-function-mq3-vm-syscall-common-fsopen-function-fsopen-vm-base-host-src-mq3-vm-syscall-common-ml-733493098"></a>
### fsOpen

```ml
function fsOpen(vm, base, host)
```

Open syscall common in vm.syscall_common; the normal completion returns `result.length`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `data`, `mask`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `host` | `dynamic` | — | Record exposing `openFn`, `context`, `closeFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L262)

<a id="function-function-mq3-vm-syscall-common-fsread-function-fsread-vm-base-host-src-mq3-vm-syscall-common-ml-213420058"></a>
### fsRead

```ml
function fsRead(vm, base, host)
```

Read syscall common in vm.syscall_common; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm passed as `vm` to `mq3.vm.syscall_common.argument`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `host` | `dynamic` | — | Record exposing `readFn`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L279)

<a id="function-function-mq3-vm-syscall-common-fswrite-function-fswrite-vm-base-host-src-mq3-vm-syscall-common-ml-1069829086"></a>
### fsWrite

```ml
function fsWrite(vm, base, host)
```

Write syscall common in vm.syscall_common; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |
| `host` | `dynamic` | — | Record exposing `writeFn`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L289)

<a id="function-function-mq3-vm-syscall-common-libcmemcpy-function-libcmemcpy-vm-base-src-mq3-vm-syscall-common-ml-1864672372"></a>
### libcMemcpy

```ml
function libcMemcpy(vm, base)
```

Compute libc memcpy in vm.syscall_common; the normal completion returns `destination`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L338)

<a id="function-function-mq3-vm-syscall-common-libcmemset-function-libcmemset-vm-base-src-mq3-vm-syscall-common-ml-1527759304"></a>
### libcMemset

```ml
function libcMemset(vm, base)
```

Compute libc memset in vm.syscall_common; the normal completion returns `destination`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L328)

<a id="function-function-mq3-vm-syscall-common-libcstrncpy-function-libcstrncpy-vm-base-src-mq3-vm-syscall-common-ml-1186171926"></a>
### libcStrncpy

```ml
function libcStrncpy(vm, base)
```

Compute libc strncpy in vm.syscall_common; the normal completion returns `destination`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `base` | `dynamic` | — | Address passed as `address` to `mq3.vm.syscall_common.argument`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L350)

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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L395)

<a id="constant-constant-mq3-vm-syscall-common-max-vm-string-const-max-vm-string-8192-src-mq3-vm-syscall-common-ml-1787193685"></a>
### MAX_VM_STRING

```ml
const MAX_VM_STRING = 8192
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L14)

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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L412)

<a id="function-function-mq3-vm-syscall-common-pointer-function-pointer-vm-value-size-label-src-mq3-vm-syscall-common-ml-1609263377"></a>
### pointer

```ml
function pointer(vm, value, size, label)
```

Compute pointer in vm.syscall_common; the normal completion returns `at`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `mask`, `data`. |
| `value` | `dynamic` | — | Value used in `(value == 0)` and `(value & vm.mask)`. |
| `size` | `dynamic` | — | Size used in `(size < 0)` and `(size > (len(vm.data) - at))`. |
| `label` | `dynamic` | — | Label used in `(label + " is NULL")` and `fail((label + " is NULL"))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L75)

<a id="function-function-mq3-vm-syscall-common-readfloatvector-function-readfloatvector-vm-address-count-label-src-mq3-vm-syscall-common-ml-711285158"></a>
### readFloatVector

```ml
function readFloatVector(vm, address, count, label)
```

Read float vector in vm.syscall_common; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `address` | `dynamic` | — | Value passed as `value` to `mq3.vm.syscall_common.pointer`. |
| `count` | `dynamic` | — | Count used in `(count * 4)` and `(index < count)`. |
| `label` | `dynamic` | — | Label passed as `label` to `mq3.vm.syscall_common.pointer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L374)

<a id="function-function-mq3-vm-syscall-common-readstring-function-readstring-vm-value-src-mq3-vm-syscall-common-ml-1917382626"></a>
### readString

```ml
function readString(vm, value)
```

Read string in vm.syscall_common; the normal completion returns `decode(slice(vm.data, at, (stop - at)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.vm.syscall_common.pointer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L86)

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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L149)

<a id="function-function-mq3-vm-syscall-common-requirecvars-function-requirecvars-host-src-mq3-vm-syscall-common-ml-2017679414"></a>
### requireCvars

```ml
function requireCvars(host)
```

Compute require cvars in vm.syscall_common; the normal completion returns `host.cvars`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `cvars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L126)

<a id="function-function-mq3-vm-syscall-common-services-function-services-registry-commands-context-src-mq3-vm-syscall-common-ml-1456419160"></a>
### services

```ml
function services(registry, commands, context)
```

Create `mq3.vm.syscall_common.Services` with cvars=registry; commands=commands; context=context; printFn=void; errorFn=void; millisecondsFn=void; consoleFn=void; openFn=void; readFn=void; writeFn=void; closeFn=void.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Initial `cvars` field stored in the returned or constructed `mq3.vm.syscall_common.Services` record. |
| `commands` | `dynamic` | — | Initial `commands` field stored in the returned or constructed `mq3.vm.syscall_common.Services` record. |
| `context` | `dynamic` | — | Initial `context` field stored in the returned or constructed `mq3.vm.syscall_common.Services` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L52)

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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L160)

<a id="constant-constant-mq3-vm-syscall-common-vm-cvar-size-const-vm-cvar-size-272-src-mq3-vm-syscall-common-ml-671875366"></a>
### VM_CVAR_SIZE

```ml
const VM_CVAR_SIZE = 272
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L15)

<a id="function-function-mq3-vm-syscall-common-writebuffer-function-writebuffer-vm-value-capacity-data-label-src-mq3-vm-syscall-common-ml-452780766"></a>
### writeBuffer

```ml
function writeBuffer(vm, value, capacity, data, label)
```

Write buffer in vm.syscall_common; the normal completion returns `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.vm.syscall_common.pointer`. |
| `capacity` | `dynamic` | — | Size passed as `size` to `mq3.vm.syscall_common.pointer`. |
| `data` | `dynamic` | — | Data used in `bytes(data)` and `copyBytes(vm.data, at, source, 0, count)`. |
| `label` | `dynamic` | — | Label passed as `label` to `mq3.vm.syscall_common.pointer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L101)

<a id="function-function-mq3-vm-syscall-common-writefloatvector-function-writefloatvector-vm-address-values-label-src-mq3-vm-syscall-common-ml-1911562129"></a>
### writeFloatVector

```ml
function writeFloatVector(vm, address, values, label)
```

Write float vector in vm.syscall_common.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `address` | `dynamic` | — | Value passed as `value` to `mq3.vm.syscall_common.pointer`. |
| `values` | `dynamic` | — | Values used in `len(values)` and `values[index]`. |
| `label` | `dynamic` | — | Label passed as `label` to `mq3.vm.syscall_common.pointer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L387)

<a id="function-function-mq3-vm-syscall-common-writeraw-function-writeraw-vm-value-data-count-label-src-mq3-vm-syscall-common-ml-1927750217"></a>
### writeRaw

```ml
function writeRaw(vm, value, data, count, label)
```

Write raw in vm.syscall_common.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.vm.syscall_common.pointer`. |
| `data` | `dynamic` | — | Data used in `len(data)` and `(len(data) < count)`. |
| `count` | `dynamic` | — | Size passed as `size` to `mq3.vm.syscall_common.pointer`. |
| `label` | `dynamic` | — | Label passed as `label` to `mq3.vm.syscall_common.pointer`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L116)

<a id="function-function-mq3-vm-syscall-common-writevmcvar-function-writevmcvar-vm-address-variable-src-mq3-vm-syscall-common-ml-494905159"></a>
### writeVmCvar

```ml
function writeVmCvar(vm, address, variable)
```

Write vm cvar in vm.syscall_common.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `data`. |
| `address` | `dynamic` | — | Value passed as `value` to `mq3.vm.syscall_common.pointer`. |
| `variable` | `dynamic` | — | Record exposing `index`, `modificationCount`, `value`, `integer`, `string`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L135)
