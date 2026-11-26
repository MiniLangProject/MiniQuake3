# `src/mq3/vm/runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.vm.runtime`](Package-mq3-vm-runtime-1429102457.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/vm/interpreter.ml` as `interpreter` → [src/mq3/vm/interpreter.ml](File-src-mq3-vm-interpreter-ml-500037689.md)
- `mq3/vm/jit_compat.ml` as `jit` → [src/mq3/vm/jit_compat.ml](File-src-mq3-vm-jit-compat-ml-1033093697.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-vm-runtime-argptr-function-argptr-runtime-value-src-mq3-vm-runtime-ml-885590421"></a>
### argPtr

```ml
function argPtr(runtime, value)
```

Compute arg ptr in vm.runtime; the normal completion returns `(value & runtime.current.machine.mask)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `current`. |
| `value` | `dynamic` | — | Value used in `(value == 0)` and `((value == 0) or (runtime == void))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L374)

<a id="function-function-mq3-vm-runtime-call-function-call-runtime-slot-args-src-mq3-vm-runtime-ml-1716349039"></a>
### call

```ml
function call(runtime, slot, args)
```

Update `runtime.last`, `runtime.current` in vm.runtime; the normal completion returns `interpreter.callFast(slot.machine, args)`.

Validation failures include `VM runtime: call on inactive VM`.
Direct state writes: `runtime.last`, `runtime.current`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `current`, `debugLevel`, `services`. Updated in place: `last`, `current`. |
| `slot` | `dynamic` | — | Record exposing `active`, `machine`, `compiled`. |
| `args` | `dynamic` | — | Args passed as `args` to `mq3.vm.runtime.callCompiled`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L296)

<a id="function-function-mq3-vm-runtime-callcompiled-function-callcompiled-slot-args-src-mq3-vm-runtime-ml-495453561"></a>
### callCompiled

```ml
function callCompiled(slot, args)
```

Return `mq3.vm.jit_compat.VM_CallCompiled(slot.compiledPlan, args)` from `vm.runtime.callCompiled`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — | Record exposing `compiledPlan`. |
| `args` | `dynamic` | — | Args passed as `args` to `mq3.vm.jit_compat.VM_CallCompiled`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L306)

<a id="function-function-mq3-vm-runtime-clear-function-clear-runtime-src-mq3-vm-runtime-ml-1964764874"></a>
### clear

```ml
function clear(runtime)
```

Return `mq3.vm.runtime.freeAll(runtime)` from `vm.runtime.clear`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Runtime passed as `runtime` to `mq3.vm.runtime.freeAll`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L369)

<a id="function-function-mq3-vm-runtime-compile-function-compile-slot-image-syscall-src-mq3-vm-runtime-ml-652648954"></a>
### compile

```ml
function compile(slot, image, syscall)
```

Update `slot.compiledPlan`, `slot.machine`, `slot.compiled`, `slot.native` in vm.runtime; the normal completion returns `slot.machine`.

Direct state writes: `slot.compiledPlan`, `slot.machine`, `slot.compiled`, `slot.native`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — | Record exposing `compiledPlan`, `machine`. Updated in place: `compiledPlan`, `machine`, `compiled`, `native`. |
| `image` | `dynamic` | — | Image passed as `image` to `mq3.vm.jit_compat.VM_Compile`. |
| `syscall` | `dynamic` | — | Callback passed as `callback` to `mq3.vm.jit_compat.VM_Compile`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L238)

<a id="function-function-mq3-vm-runtime-create-function-create-host-src-mq3-vm-runtime-ml-1221969992"></a>
### create

```ml
function create(host)
```

Create runtime in vm.runtime; the normal completion returns `Runtime([emptySlot(), emptySlot(), emptySlot()], host, void, void, 0, 0, [])`.

Validation failures include `VM runtime: missing image loader`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `loadFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L106)

<a id="function-function-mq3-vm-runtime-debug-function-debug-runtime-level-src-mq3-vm-runtime-ml-1953335482"></a>
### debug

```ml
function debug(runtime, level)
```

Update `runtime.debugLevel` in vm.runtime.

Direct state writes: `runtime.debugLevel`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Updated in place: `debugLevel`. |
| `level` | `dynamic` | — | Level operand used by `debug`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L120)

<a id="function-function-mq3-vm-runtime-dllsyscall-function-dllsyscall-runtime-args-src-mq3-vm-runtime-ml-1402127227"></a>
### dllSyscall

```ml
function dllSyscall(runtime, args)
```

Compute dll syscall in vm.runtime; the normal completion returns `slot.syscall(machine, base)`.

Validation failures include `VM runtime: DLL syscall without current VM`; `VM runtime: DLL syscall arguments outside VM memory`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `current`. |
| `args` | `dynamic` | — | Args used in `len(args)` and `args[index]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L313)

<a id="function-function-mq3-vm-runtime-emptyslot-function-emptyslot-src-mq3-vm-runtime-ml-553813852"></a>
### emptySlot

```ml
function emptySlot()
```

Create `mq3.vm.runtime.Slot` with name=""; image=void; machine=void; syscall=void; active=false; generation=0; symbols=[]; numSymbols=0; compiled=false; native=false; codeLength=0; tableLength=0; compiledPlan=void.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L101)

<a id="function-function-mq3-vm-runtime-explicitargptr-function-explicitargptr-runtime-slot-value-src-mq3-vm-runtime-ml-1137133541"></a>
### explicitArgPtr

```ml
function explicitArgPtr(runtime, slot, value)
```

Compute explicit arg ptr in vm.runtime; the normal completion returns `(value & slot.machine.mask)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `current`. |
| `slot` | `dynamic` | — | Record exposing `native`, `machine`. |
| `value` | `dynamic` | — | Value used in `(value == 0)` and `(value & slot.machine.mask)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L382)

<a id="function-function-mq3-vm-runtime-find-function-find-runtime-name-src-mq3-vm-runtime-ml-664371217"></a>
### find

```ml
function find(runtime, name)
```

Find runtime in vm.runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `slots`. |
| `name` | `dynamic` | — | Right passed as `right` to `mq3.vm.runtime.sameName`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L217)

<a id="function-function-mq3-vm-runtime-free-function-free-runtime-slot-src-mq3-vm-runtime-ml-859786096"></a>
### free

```ml
function free(runtime, slot)
```

Update `runtime.current`, `runtime.last`, `slot.name`, `slot.image` in vm.runtime.

Validation failures include `VM runtime: bad free parameters`.
Direct state writes: `runtime.current`, `runtime.last`, `slot.name`, `slot.image`, `slot.machine`, `slot.syscall`, `slot.active`, `slot.symbols` and further fields.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `services`. Updated in place: `current`, `last`. |
| `slot` | `dynamic` | — | Record exposing `active`, `name`. Updated in place: `name`, `image`, `machine`, `syscall`, `active`, `symbols` and further fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L344)

<a id="function-function-mq3-vm-runtime-freeall-function-freeall-runtime-src-mq3-vm-runtime-ml-1778016054"></a>
### freeAll

```ml
function freeAll(runtime)
```

Update `runtime.current`, `runtime.last` in vm.runtime.

Validation failures include `VM runtime: missing runtime`.
Direct state writes: `runtime.current`, `runtime.last`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `slots`, `services`. Updated in place: `current`, `last`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L359)

<a id="function-function-mq3-vm-runtime-info-function-info-runtime-src-mq3-vm-runtime-ml-1354477032"></a>
### info

```ml
function info(runtime)
```

Compute info in vm.runtime; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `slots`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L409)

<a id="function-function-mq3-vm-runtime-init-function-init-runtime-src-mq3-vm-runtime-ml-366723248"></a>
### init

```ml
function init(runtime)
```

Update `runtime.debugLevel`, `runtime.syscallCount`, `runtime.syscallLog` in vm.runtime; the normal completion returns `runtime`.

Validation failures include `VM runtime: missing init runtime`.
Direct state writes: `runtime.debugLevel`, `runtime.syscallCount`, `runtime.syscallLog`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `services`. Updated in place: `debugLevel`, `syscallCount`, `syscallLog`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L436)

<a id="function-function-mq3-vm-runtime-load-function-load-runtime-name-syscall-src-mq3-vm-runtime-ml-1204895070"></a>
### load

```ml
function load(runtime, name, syscall)
```

Return `mq3.vm.runtime.loadMode(runtime, name, syscall, VMI_BYTECODE)` from `vm.runtime.load`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Runtime passed as `runtime` to `mq3.vm.runtime.loadMode`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.vm.runtime.loadMode`. |
| `syscall` | `dynamic` | — | Syscall passed as `syscall` to `mq3.vm.runtime.loadMode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L281)

<a id="function-function-mq3-vm-runtime-loadimage-function-loadimage-runtime-name-src-mq3-vm-runtime-ml-801194931"></a>
### loadImage

```ml
function loadImage(runtime, name)
```

Load image in vm.runtime; the normal completion returns `image`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `services`. |
| `name` | `dynamic` | — | Name used in `("vm/" + name)` and `(("vm/" + name) + ".qvm")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L226)

<a id="function-function-mq3-vm-runtime-loadmapsymbols-function-loadmapsymbols-runtime-slot-src-mq3-vm-runtime-ml-1556976408"></a>
### loadMapSymbols

```ml
function loadMapSymbols(runtime, slot)
```

Load map symbols in vm.runtime; the normal completion returns `loadSymbols(slot, mapText, true)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `services`. |
| `slot` | `dynamic` | — | Record exposing `numSymbols`, `name`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L244)

<a id="function-function-mq3-vm-runtime-loadmode-function-loadmode-runtime-name-syscall-mode-src-mq3-vm-runtime-ml-2090478623"></a>
### loadMode

```ml
function loadMode(runtime, name, syscall, mode)
```

Load mode in vm.runtime; the normal completion returns `target`.

Validation failures include `VM runtime: bad create parameters`; `VM runtime: no free slot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `slots`, `services`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.vm.runtime.find`. |
| `syscall` | `dynamic` | — | Syscall passed as `syscall` to `mq3.vm.runtime.compile`. |
| `mode` | `dynamic` | — | Mode used in `(mode == VMI_NATIVE)` and `(mode >= VMI_COMPILED)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L259)

<a id="function-function-mq3-vm-runtime-loadsymbols-function-loadsymbols-slot-text-developer-src-mq3-vm-runtime-ml-1066745431"></a>
### loadSymbols

```ml
function loadSymbols(slot, text, developer)
```

Load symbols in vm.runtime; the normal completion returns `slot.numSymbols`.

Validation failures include `VM runtime: missing symbol target`.
Direct state writes: `slot.symbols`, `slot.numSymbols`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — | Record exposing `numSymbols`, `machine`, `symbols`. Updated in place: `symbols`, `numSymbols`. |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.vm.runtime.tokens`. |
| `developer` | `dynamic` | — | Developer operand used by `loadSymbols`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L192)

<a id="function-function-mq3-vm-runtime-logsyscalls-function-logsyscalls-runtime-argsoffset-args-src-mq3-vm-runtime-ml-1318932305"></a>
### logSyscalls

```ml
function logSyscalls(runtime, argsOffset, args)
```

Update `runtime.syscallCount`, `runtime.syscallLog` in vm.runtime; the normal completion returns `row`.

Validation failures include `VM runtime: missing syscall logger`.
Direct state writes: `runtime.syscallCount`, `runtime.syscallLog`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `syscallCount`, `syscallLog`, `services`. Updated in place: `syscallCount`, `syscallLog`. |
| `argsOffset` | `dynamic` | — | Args offset operand used by `logSyscalls`; its reads are shown in the implementation. |
| `args` | `dynamic` | — | Args used in `len(args)` and `args[index]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L424)

<a id="constant-constant-mq3-vm-runtime-max-vm-const-max-vm-3-src-mq3-vm-runtime-ml-1171798936"></a>
### MAX_VM

```ml
const MAX_VM = 3
```

Number of named VM slots available for the game, client game, and user interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L11)

<a id="function-function-mq3-vm-runtime-parsehex-function-parsehex-text-src-mq3-vm-runtime-ml-501224239"></a>
### parseHex

```ml
function parseHex(text)
```

ParseHex intentionally ignores non-hex characters rather than terminating.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text used in `bytes(text)` and `(text == void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L124)

<a id="function-function-mq3-vm-runtime-profile-function-profile-runtime-src-mq3-vm-runtime-ml-458567638"></a>
### profile

```ml
function profile(runtime)
```

Compute profile in vm.runtime; the normal completion returns `[lines, total]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `last`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L395)

<a id="function-function-mq3-vm-runtime-profilesort-function-profilesort-left-right-src-mq3-vm-runtime-ml-323439001"></a>
### profileSort

```ml
function profileSort(left, right)
```

Compute profile sort in vm.runtime; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Record exposing `profileCount`. |
| `right` | `dynamic` | — | Record exposing `profileCount`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L390)

<a id="function-function-mq3-vm-runtime-restart-function-restart-runtime-slot-src-mq3-vm-runtime-ml-317404674"></a>
### restart

```ml
function restart(runtime, slot)
```

Update `slot.image`, `slot.generation` in vm.runtime; the normal completion returns `slot`.

Validation failures include `VM runtime: restart on inactive VM`.
Direct state writes: `slot.image`, `slot.generation`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `services`. |
| `slot` | `dynamic` | — | Record exposing `active`, `name`, `syscall`, `machine`, `generation`. Updated in place: `image`, `generation`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L327)

<a id="function-function-mq3-vm-runtime-restorecurrent-function-restorecurrent-runtime-previous-src-mq3-vm-runtime-ml-910596479"></a>
### restoreCurrent

```ml
function restoreCurrent(runtime, previous)
```

Update `runtime.current` in vm.runtime.

Direct state writes: `runtime.current`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Updated in place: `current`. |
| `previous` | `dynamic` | — | Previous used in `(previous != void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L288)

- [mq3.vm.runtime.Runtime](Type-mq3-vm-runtime-runtime-1291952059.md) — struct
<a id="function-function-mq3-vm-runtime-samename-function-samename-left-right-src-mq3-vm-runtime-ml-642979367"></a>
### sameName

```ml
function sameName(left, right)
```

Compute vm.runtime.sameName as `(strings.toLowerAscii(left) == strings.toLowerAscii(right))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `left` | `dynamic` | — | Left used in `strings.toLowerAscii(left)` and `(strings.toLowerAscii(left) == strings.toLowerAscii(right))`. |
| `right` | `dynamic` | — | Right used in `strings.toLowerAscii(right)` and `(strings.toLowerAscii(left) == strings.toLowerAscii(right))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L213)

<a id="function-function-mq3-vm-runtime-services-function-services-src-mq3-vm-runtime-ml-45030966"></a>
### services

```ml
function services()
```

Create `mq3.vm.runtime.Services` with loadFn=void; symbolFn=void; developerFn=void; diagnosticFn=void; registerCvarFn=void; addCommandFn=void; logFn=void; context=void.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L99)

- [mq3.vm.runtime.Services](Type-mq3-vm-runtime-services-861255749.md) — struct
- [mq3.vm.runtime.Slot](Type-mq3-vm-runtime-slot-1102647489.md) — struct
<a id="constant-constant-mq3-vm-runtime-stack-size-const-stack-size-131072-src-mq3-vm-runtime-ml-241373959"></a>
### STACK_SIZE

```ml
const STACK_SIZE = 131072
```

Number of bytes reserved for the QVM program stack.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L19)

- [mq3.vm.runtime.Symbol](Type-mq3-vm-runtime-symbol-1074374177.md) — struct
<a id="function-function-mq3-vm-runtime-symbolforcompiledpointer-function-symbolforcompiledpointer-slot-code-src-mq3-vm-runtime-ml-1523936105"></a>
### symbolForCompiledPointer

```ml
function symbolForCompiledPointer(slot, code)
```

Compute symbol for compiled pointer in vm.runtime; the normal completion returns `valueToSymbol(slot, instruction)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — | Record exposing `machine`, `codeLength`. |
| `code` | `dynamic` | — | Code used in `(code < 0)` and `(code >= slot.codeLength)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L164)

<a id="function-function-mq3-vm-runtime-symboltovalue-function-symboltovalue-slot-name-src-mq3-vm-runtime-ml-1400652383"></a>
### symbolToValue

```ml
function symbolToValue(slot, name)
```

Compute symbol to value in vm.runtime; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — | Record exposing `symbols`. |
| `name` | `dynamic` | — | Name used in `(entry.name == name)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L156)

<a id="function-function-mq3-vm-runtime-tokens-function-tokens-text-src-mq3-vm-runtime-ml-88495219"></a>
### tokens

```ml
function tokens(text)
```

Compute tokens in vm.runtime; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text used in `bytes(text)` and `(text == void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L175)

<a id="function-function-mq3-vm-runtime-valuetofunctionsymbol-function-valuetofunctionsymbol-slot-value-src-mq3-vm-runtime-ml-1466433503"></a>
### valueToFunctionSymbol

```ml
function valueToFunctionSymbol(slot, value)
```

Compute value to function symbol in vm.runtime; the normal completion returns `entry`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — | Record exposing `symbols`. |
| `value` | `dynamic` | — | Value used in `(slot.symbols[index].value <= value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L139)

<a id="function-function-mq3-vm-runtime-valuetosymbol-function-valuetosymbol-slot-value-src-mq3-vm-runtime-ml-480704415"></a>
### valueToSymbol

```ml
function valueToSymbol(slot, value)
```

Compute value to symbol in vm.runtime; the normal completion returns `((entry.name + "+") + str((value - entry.value)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `slot` | `dynamic` | — | Record exposing `symbols`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.vm.runtime.valueToFunctionSymbol`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L148)

<a id="function-function-mq3-vm-runtime-vm2c-function-vm2c-pointer-length-src-mq3-vm-runtime-ml-873359967"></a>
### vm2c

```ml
function vm2c(pointer, length)
```

VM_VM2C is an identity conversion in the shipped engine.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pointer` | `dynamic` | — | Value returned unchanged by this function. |
| `length` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L114)

<a id="constant-constant-mq3-vm-runtime-vmi-bytecode-const-vmi-bytecode-1-src-mq3-vm-runtime-ml-2059184582"></a>
### VMI_BYTECODE

```ml
const VMI_BYTECODE = 1
```

VM execution mode that interprets Quake virtual-machine bytecode.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L15)

<a id="constant-constant-mq3-vm-runtime-vmi-compiled-const-vmi-compiled-2-src-mq3-vm-runtime-ml-1226008259"></a>
### VMI_COMPILED

```ml
const VMI_COMPILED = 2
```

VM execution mode that requests the supported compiled execution path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L17)

<a id="constant-constant-mq3-vm-runtime-vmi-native-const-vmi-native-0-src-mq3-vm-runtime-ml-422896281"></a>
### VMI_NATIVE

```ml
const VMI_NATIVE = 0
```

VM execution mode that loads the native game-module implementation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/runtime.ml#L13)
