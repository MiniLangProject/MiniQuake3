# `src/mq3/vm/runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.vm.runtime`](Package-mq3-vm-runtime-1429102457.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/interpreter.ml` as `interpreter` → [src/mq3/vm/interpreter.ml](File-src-mq3-vm-interpreter-ml-500037689.md)
- `mq3/vm/jit_compat.ml` as `jit` → [src/mq3/vm/jit_compat.ml](File-src-mq3-vm-jit-compat-ml-1033093697.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-vm-runtime-argptr-function-argptr-runtime-value-src-mq3-vm-runtime-ml-885590421"></a>
### argPtr

```ml
function argPtr(runtime, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L191)

<a id="function-function-mq3-vm-runtime-call-function-call-runtime-slot-args-src-mq3-vm-runtime-ml-1716349039"></a>
### call

```ml
function call(runtime, slot, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L143)

<a id="function-function-mq3-vm-runtime-callcompiled-function-callcompiled-slot-args-src-mq3-vm-runtime-ml-495453561"></a>
### callCompiled

```ml
function callCompiled(slot, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L150)

<a id="function-function-mq3-vm-runtime-clear-function-clear-runtime-src-mq3-vm-runtime-ml-1964764874"></a>
### clear

```ml
function clear(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L189)

<a id="function-function-mq3-vm-runtime-compile-function-compile-slot-image-syscall-src-mq3-vm-runtime-ml-652648954"></a>
### compile

```ml
function compile(slot, image, syscall)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — |  |
| `image` | `dynamic` | — |  |
| `syscall` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L111)

<a id="function-function-mq3-vm-runtime-create-function-create-host-src-mq3-vm-runtime-ml-1221969992"></a>
### create

```ml
function create(host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L23)

<a id="function-function-mq3-vm-runtime-debug-function-debug-runtime-level-src-mq3-vm-runtime-ml-1953335482"></a>
### debug

```ml
function debug(runtime, level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L30)

<a id="function-function-mq3-vm-runtime-dllsyscall-function-dllsyscall-runtime-args-src-mq3-vm-runtime-ml-1402127227"></a>
### dllSyscall

```ml
function dllSyscall(runtime, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L152)

<a id="function-function-mq3-vm-runtime-emptyslot-function-emptyslot-src-mq3-vm-runtime-ml-553813852"></a>
### emptySlot

```ml
function emptySlot()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L22)

<a id="function-function-mq3-vm-runtime-explicitargptr-function-explicitargptr-runtime-slot-value-src-mq3-vm-runtime-ml-1137133541"></a>
### explicitArgPtr

```ml
function explicitArgPtr(runtime, slot, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L195)

<a id="function-function-mq3-vm-runtime-find-function-find-runtime-name-src-mq3-vm-runtime-ml-664371217"></a>
### find

```ml
function find(runtime, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L99)

<a id="function-function-mq3-vm-runtime-free-function-free-runtime-slot-src-mq3-vm-runtime-ml-859786096"></a>
### free

```ml
function free(runtime, slot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L171)

<a id="function-function-mq3-vm-runtime-freeall-function-freeall-runtime-src-mq3-vm-runtime-ml-1778016054"></a>
### freeAll

```ml
function freeAll(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L181)

<a id="function-function-mq3-vm-runtime-info-function-info-runtime-src-mq3-vm-runtime-ml-1354477032"></a>
### info

```ml
function info(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L215)

<a id="function-function-mq3-vm-runtime-init-function-init-runtime-src-mq3-vm-runtime-ml-366723248"></a>
### init

```ml
function init(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L230)

<a id="function-function-mq3-vm-runtime-load-function-load-runtime-name-syscall-src-mq3-vm-runtime-ml-1204895070"></a>
### load

```ml
function load(runtime, name, syscall)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `syscall` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L140)

<a id="function-function-mq3-vm-runtime-loadimage-function-loadimage-runtime-name-src-mq3-vm-runtime-ml-801194931"></a>
### loadImage

```ml
function loadImage(runtime, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L105)

<a id="function-function-mq3-vm-runtime-loadmapsymbols-function-loadmapsymbols-runtime-slot-src-mq3-vm-runtime-ml-1556976408"></a>
### loadMapSymbols

```ml
function loadMapSymbols(runtime, slot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L114)

<a id="function-function-mq3-vm-runtime-loadmode-function-loadmode-runtime-name-syscall-mode-src-mq3-vm-runtime-ml-2090478623"></a>
### loadMode

```ml
function loadMode(runtime, name, syscall, mode)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `syscall` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L122)

<a id="function-function-mq3-vm-runtime-loadsymbols-function-loadsymbols-slot-text-developer-src-mq3-vm-runtime-ml-1066745431"></a>
### loadSymbols

```ml
function loadSymbols(slot, text, developer)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `developer` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L80)

<a id="function-function-mq3-vm-runtime-logsyscalls-function-logsyscalls-runtime-argsoffset-args-src-mq3-vm-runtime-ml-1318932305"></a>
### logSyscalls

```ml
function logSyscalls(runtime, argsOffset, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `argsOffset` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L223)

<a id="constant-constant-mq3-vm-runtime-max-vm-const-max-vm-3-src-mq3-vm-runtime-ml-1171798936"></a>
### MAX_VM

```ml
const MAX_VM = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L10)

<a id="function-function-mq3-vm-runtime-parsehex-function-parsehex-text-src-mq3-vm-runtime-ml-501224239"></a>
### parseHex

```ml
function parseHex(text)
```

ParseHex intentionally ignores non-hex characters rather than terminating.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L33)

<a id="function-function-mq3-vm-runtime-profile-function-profile-runtime-src-mq3-vm-runtime-ml-458567638"></a>
### profile

```ml
function profile(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L203)

<a id="function-function-mq3-vm-runtime-profilesort-function-profilesort-left-right-src-mq3-vm-runtime-ml-323439001"></a>
### profileSort

```ml
function profileSort(left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L200)

<a id="function-function-mq3-vm-runtime-restart-function-restart-runtime-slot-src-mq3-vm-runtime-ml-317404674"></a>
### restart

```ml
function restart(runtime, slot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L160)

<a id="function-function-mq3-vm-runtime-restorecurrent-function-restorecurrent-runtime-previous-src-mq3-vm-runtime-ml-910596479"></a>
### restoreCurrent

```ml
function restoreCurrent(runtime, previous)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `previous` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L142)

- [mq3.vm.runtime.Runtime](Type-mq3-vm-runtime-runtime-1291952059.md) — struct
<a id="function-function-mq3-vm-runtime-samename-function-samename-left-right-src-mq3-vm-runtime-ml-642979367"></a>
### sameName

```ml
function sameName(left, right)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — |  |
| `right` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L98)

<a id="function-function-mq3-vm-runtime-services-function-services-src-mq3-vm-runtime-ml-45030966"></a>
### services

```ml
function services()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L21)

- [mq3.vm.runtime.Services](Type-mq3-vm-runtime-services-861255749.md) — struct
- [mq3.vm.runtime.Slot](Type-mq3-vm-runtime-slot-1102647489.md) — struct
<a id="constant-constant-mq3-vm-runtime-stack-size-const-stack-size-131072-src-mq3-vm-runtime-ml-241373959"></a>
### STACK_SIZE

```ml
const STACK_SIZE = 131072
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L14)

- [mq3.vm.runtime.Symbol](Type-mq3-vm-runtime-symbol-1074374177.md) — struct
<a id="function-function-mq3-vm-runtime-symbolforcompiledpointer-function-symbolforcompiledpointer-slot-code-src-mq3-vm-runtime-ml-1523936105"></a>
### symbolForCompiledPointer

```ml
function symbolForCompiledPointer(slot, code)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — |  |
| `code` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L61)

<a id="function-function-mq3-vm-runtime-symboltovalue-function-symboltovalue-slot-name-src-mq3-vm-runtime-ml-1400652383"></a>
### symbolToValue

```ml
function symbolToValue(slot, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L56)

<a id="function-function-mq3-vm-runtime-tokens-function-tokens-text-src-mq3-vm-runtime-ml-88495219"></a>
### tokens

```ml
function tokens(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L70)

<a id="function-function-mq3-vm-runtime-valuetofunctionsymbol-function-valuetofunctionsymbol-slot-value-src-mq3-vm-runtime-ml-1466433503"></a>
### valueToFunctionSymbol

```ml
function valueToFunctionSymbol(slot, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L45)

<a id="function-function-mq3-vm-runtime-valuetosymbol-function-valuetosymbol-slot-value-src-mq3-vm-runtime-ml-480704415"></a>
### valueToSymbol

```ml
function valueToSymbol(slot, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L51)

<a id="function-function-mq3-vm-runtime-vm2c-function-vm2c-pointer-length-src-mq3-vm-runtime-ml-873359967"></a>
### vm2c

```ml
function vm2c(pointer, length)
```

VM_VM2C is an identity conversion in the shipped engine.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pointer` | `dynamic` | — |  |
| `length` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L29)

<a id="constant-constant-mq3-vm-runtime-vmi-bytecode-const-vmi-bytecode-1-src-mq3-vm-runtime-ml-2059184582"></a>
### VMI_BYTECODE

```ml
const VMI_BYTECODE = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L12)

<a id="constant-constant-mq3-vm-runtime-vmi-compiled-const-vmi-compiled-2-src-mq3-vm-runtime-ml-1226008259"></a>
### VMI_COMPILED

```ml
const VMI_COMPILED = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L13)

<a id="constant-constant-mq3-vm-runtime-vmi-native-const-vmi-native-0-src-mq3-vm-runtime-ml-422896281"></a>
### VMI_NATIVE

```ml
const VMI_NATIVE = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L11)
