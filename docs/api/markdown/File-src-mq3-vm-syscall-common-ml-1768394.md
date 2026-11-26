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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L19)

<a id="function-function-mq3-vm-syscall-common-anglevectors-function-anglevectors-vm-base-src-mq3-vm-syscall-common-ml-1044862000"></a>
### angleVectors

```ml
function angleVectors(vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L256)

<a id="function-function-mq3-vm-syscall-common-argc-function-argc-host-src-mq3-vm-syscall-common-ml-1904164954"></a>
### argc

```ml
function argc(host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L145)

<a id="function-function-mq3-vm-syscall-common-argstext-function-argstext-vm-base-host-src-mq3-vm-syscall-common-ml-1956237070"></a>
### argsText

```ml
function argsText(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L156)

<a id="function-function-mq3-vm-syscall-common-argument-function-argument-vm-address-as-int-index-as-int-src-mq3-vm-syscall-common-ml-1813552869"></a>
### argument

```ml
function argument(vm, address as int, index as int)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `int` | — |  |
| `index` | `int` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L43)

<a id="function-function-mq3-vm-syscall-common-argv-function-argv-vm-base-host-src-mq3-vm-syscall-common-ml-849066622"></a>
### argv

```ml
function argv(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L150)

<a id="function-function-mq3-vm-syscall-common-callback-function-callback-abi-host-src-mq3-vm-syscall-common-ml-1479744616"></a>
### callback

```ml
function callback(abi, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `abi` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L362)

<a id="extern_function-extern-function-mq3-vm-syscall-common-ceil-extern-function-ceil-value-as-double-from-ucrtbase-dll-returns-double-src-mq3-vm-syscall-common-ml-1256415774"></a>
### ceil

```ml
extern function ceil(value as double) from "ucrtbase.dll" returns double
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L18)

<a id="function-function-mq3-vm-syscall-common-cvarcreate-function-cvarcreate-vm-base-host-src-mq3-vm-syscall-common-ml-803860222"></a>
### cvarCreate

```ml
function cvarCreate(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L137)

<a id="function-function-mq3-vm-syscall-common-cvarinfostring-function-cvarinfostring-vm-base-host-src-mq3-vm-syscall-common-ml-217700774"></a>
### cvarInfoString

```ml
function cvarInfoString(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L140)

<a id="function-function-mq3-vm-syscall-common-cvarinteger-function-cvarinteger-vm-base-host-src-mq3-vm-syscall-common-ml-52146638"></a>
### cvarInteger

```ml
function cvarInteger(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L118)

<a id="function-function-mq3-vm-syscall-common-cvarreset-function-cvarreset-vm-base-host-src-mq3-vm-syscall-common-ml-234277880"></a>
### cvarReset

```ml
function cvarReset(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L134)

<a id="function-function-mq3-vm-syscall-common-cvarset-function-cvarset-vm-base-host-src-mq3-vm-syscall-common-ml-1052599414"></a>
### cvarSet

```ml
function cvarSet(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L114)

<a id="function-function-mq3-vm-syscall-common-cvarsetvalue-function-cvarsetvalue-vm-base-host-src-mq3-vm-syscall-common-ml-1407179106"></a>
### cvarSetValue

```ml
function cvarSetValue(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L131)

<a id="function-function-mq3-vm-syscall-common-cvarstring-function-cvarstring-vm-base-host-src-mq3-vm-syscall-common-ml-1950376642"></a>
### cvarString

```ml
function cvarString(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L126)

<a id="function-function-mq3-vm-syscall-common-cvarvaluebits-function-cvarvaluebits-vm-base-host-src-mq3-vm-syscall-common-ml-985991928"></a>
### cvarValueBits

```ml
function cvarValueBits(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L122)

<a id="function-function-mq3-vm-syscall-common-dispatch-function-dispatch-abi-host-vm-base-src-mq3-vm-syscall-common-ml-1409756384"></a>
### dispatch

```ml
function dispatch(abi, host, vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `abi` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L352)

<a id="function-function-mq3-vm-syscall-common-dispatchcgame-function-dispatchcgame-vm-base-host-op-src-mq3-vm-syscall-common-ml-925060171"></a>
### dispatchCgame

```ml
function dispatchCgame(vm, base, host, op)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `op` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L311)

<a id="function-function-mq3-vm-syscall-common-dispatchlibc-function-dispatchlibc-abi-vm-base-op-src-mq3-vm-syscall-common-ml-1088994921"></a>
### dispatchLibc

```ml
function dispatchLibc(abi, vm, base, op)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `abi` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `op` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L268)

<a id="function-function-mq3-vm-syscall-common-dispatchqagame-function-dispatchqagame-vm-base-host-op-src-mq3-vm-syscall-common-ml-461021241"></a>
### dispatchQagame

```ml
function dispatchQagame(vm, base, host, op)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `op` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L290)

<a id="function-function-mq3-vm-syscall-common-dispatchui-function-dispatchui-vm-base-host-op-src-mq3-vm-syscall-common-ml-44064469"></a>
### dispatchUi

```ml
function dispatchUi(vm, base, host, op)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `op` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L327)

<a id="function-function-mq3-vm-syscall-common-emitprint-function-emitprint-vm-base-host-iserror-src-mq3-vm-syscall-common-ml-1206086400"></a>
### emitPrint

```ml
function emitPrint(vm, base, host, isError)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `isError` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L191)

<a id="function-function-mq3-vm-syscall-common-executeconsole-function-executeconsole-vm-base-host-src-mq3-vm-syscall-common-ml-1362842418"></a>
### executeConsole

```ml
function executeConsole(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L198)

<a id="function-function-mq3-vm-syscall-common-fail-function-fail-message-src-mq3-vm-syscall-common-ml-357426807"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L41)

<a id="function-function-mq3-vm-syscall-common-floatresult-function-floatresult-value-src-mq3-vm-syscall-common-ml-1968315299"></a>
### floatResult

```ml
function floatResult(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L234)

<a id="extern_function-extern-function-mq3-vm-syscall-common-floor-extern-function-floor-value-as-double-from-ucrtbase-dll-returns-double-src-mq3-vm-syscall-common-ml-1357807104"></a>
### floor

```ml
extern function floor(value as double) from "ucrtbase.dll" returns double
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `double` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L17)

<a id="function-function-mq3-vm-syscall-common-fsclose-function-fsclose-vm-base-host-src-mq3-vm-syscall-common-ml-2115556960"></a>
### fsClose

```ml
function fsClose(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L186)

<a id="function-function-mq3-vm-syscall-common-fsopen-function-fsopen-vm-base-host-src-mq3-vm-syscall-common-ml-733493098"></a>
### fsOpen

```ml
function fsOpen(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L161)

<a id="function-function-mq3-vm-syscall-common-fsread-function-fsread-vm-base-host-src-mq3-vm-syscall-common-ml-213420058"></a>
### fsRead

```ml
function fsRead(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L174)

<a id="function-function-mq3-vm-syscall-common-fswrite-function-fswrite-vm-base-host-src-mq3-vm-syscall-common-ml-1069829086"></a>
### fsWrite

```ml
function fsWrite(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L180)

<a id="function-function-mq3-vm-syscall-common-libcmemcpy-function-libcmemcpy-vm-base-src-mq3-vm-syscall-common-ml-1864672372"></a>
### libcMemcpy

```ml
function libcMemcpy(vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L210)

<a id="function-function-mq3-vm-syscall-common-libcmemset-function-libcmemset-vm-base-src-mq3-vm-syscall-common-ml-1527759304"></a>
### libcMemset

```ml
function libcMemset(vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L203)

<a id="function-function-mq3-vm-syscall-common-libcstrncpy-function-libcstrncpy-vm-base-src-mq3-vm-syscall-common-ml-1186171926"></a>
### libcStrncpy

```ml
function libcStrncpy(vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L219)

<a id="function-function-mq3-vm-syscall-common-matrixmultiply-function-matrixmultiply-vm-base-src-mq3-vm-syscall-common-ml-915894864"></a>
### matrixMultiply

```ml
function matrixMultiply(vm, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L249)

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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L260)

<a id="function-function-mq3-vm-syscall-common-pointer-function-pointer-vm-value-size-label-src-mq3-vm-syscall-common-ml-1609263377"></a>
### pointer

```ml
function pointer(vm, value, size, label)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L49)

<a id="function-function-mq3-vm-syscall-common-readfloatvector-function-readfloatvector-vm-address-count-label-src-mq3-vm-syscall-common-ml-711285158"></a>
### readFloatVector

```ml
function readFloatVector(vm, address, count, label)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L236)

<a id="function-function-mq3-vm-syscall-common-readstring-function-readstring-vm-value-src-mq3-vm-syscall-common-ml-1917382626"></a>
### readString

```ml
function readString(vm, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L57)

<a id="function-function-mq3-vm-syscall-common-registercvar-function-registercvar-vm-base-host-src-mq3-vm-syscall-common-ml-1637769386"></a>
### registerCvar

```ml
function registerCvar(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L98)

<a id="function-function-mq3-vm-syscall-common-requirecvars-function-requirecvars-host-src-mq3-vm-syscall-common-ml-2017679414"></a>
### requireCvars

```ml
function requireCvars(host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L83)

<a id="function-function-mq3-vm-syscall-common-services-function-services-registry-commands-context-src-mq3-vm-syscall-common-ml-1456419160"></a>
### services

```ml
function services(registry, commands, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `commands` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L37)

- [mq3.vm.syscall_common.Services](Type-mq3-vm-syscall-common-services-1954415278.md) — struct
<a id="function-function-mq3-vm-syscall-common-updatecvar-function-updatecvar-vm-base-host-src-mq3-vm-syscall-common-ml-1855830262"></a>
### updateCvar

```ml
function updateCvar(vm, base, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L105)

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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L66)

<a id="function-function-mq3-vm-syscall-common-writefloatvector-function-writefloatvector-vm-address-values-label-src-mq3-vm-syscall-common-ml-1911562129"></a>
### writeFloatVector

```ml
function writeFloatVector(vm, address, values, label)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `values` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L244)

<a id="function-function-mq3-vm-syscall-common-writeraw-function-writeraw-vm-value-data-count-label-src-mq3-vm-syscall-common-ml-1927750217"></a>
### writeRaw

```ml
function writeRaw(vm, value, data, count, label)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `data` | `dynamic` | — |  |
| `count` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L75)

<a id="function-function-mq3-vm-syscall-common-writevmcvar-function-writevmcvar-vm-address-variable-src-mq3-vm-syscall-common-ml-494905159"></a>
### writeVmCvar

```ml
function writeVmCvar(vm, address, variable)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `variable` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/syscall_common.ml#L88)
