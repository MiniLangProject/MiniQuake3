# `src/mq3/vm/interpreter.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.vm.interpreter`](Package-mq3-vm-interpreter-1003839299.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/format/qfiles.ml` as `qfiles` → [src/mq3/format/qfiles.ml](File-src-mq3-format-qfiles-ml-1013095051.md)
- `mq3/vm/native_exec.ml` as `nativeExec` → [src/mq3/vm/native_exec.ml](File-src-mq3-vm-native-exec-ml-1980853896.md)

## Declarations

<a id="function-function-mq3-vm-interpreter-call-function-call-vm-args-src-mq3-vm-interpreter-ml-1225421514"></a>
### call

```ml
function call(vm, args)
```

Update `vm.steps`, `vm.breaks`, `vm.programStack` in vm.interpreter.

Direct state writes: `vm.steps`, `vm.breaks`, `vm.programStack`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `programStack`, `steps`, `stackBottom`, `data`, `limit`, `code`, `starts` and further fields. Updated in place: `steps`, `breaks`, `programStack`. |
| `args` | `dynamic` | — | Args used in `len(args)` and `args[index]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/interpreter.ml#L221)

<a id="function-function-mq3-vm-interpreter-callfast-function-callfast-vm-args-src-mq3-vm-interpreter-ml-1372106202"></a>
### callFast

```ml
function callFast(vm, args)
```

Keep the MiniLang interpreter as the executable reference implementation. Production dispatch runs the same validated plan in bounded native code and yields back to MiniLang at each trap without crossing a callback ABI.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `nativePlan`. |
| `args` | `dynamic` | — | Args passed as `args` to `mq3.vm.interpreter.call`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/interpreter.ml#L182)

<a id="function-function-mq3-vm-interpreter-fail-function-fail-message-src-mq3-vm-interpreter-ml-2045130873"></a>
### fail

```ml
function fail(message)
```

Create the vm.interpreter error for `fail` with 3400 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Message used in `("QVM: " + message)` and `error(3400, ("QVM: " + message))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/interpreter.ml#L40)

<a id="function-function-mq3-vm-interpreter-imagelayout-function-imagelayout-image-src-mq3-vm-interpreter-ml-735397417"></a>
### imageLayout

```ml
function imageLayout(image)
```

Compute image layout in vm.interpreter; the normal completion returns `ImageLayout(count, codeOffset, codeLength, dataOffset, dataLength, litLength, memorySize)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `image` | `dynamic` | — | Data passed as `data` to `mq3.compat.numeric.readU32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/interpreter.ml#L100)

- [mq3.vm.interpreter.ImageLayout](Type-mq3-vm-interpreter-imagelayout-733203426.md) — struct
<a id="function-function-mq3-vm-interpreter-immediatesize-function-immediatesize-op-src-mq3-vm-interpreter-ml-690945279"></a>
### immediateSize

```ml
function immediateSize(op)
```

Compute immediate size in vm.interpreter; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `op` | `dynamic` | — | Op used in `(op == 3)` and `(op == 4)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/interpreter.ml#L84)

<a id="function-function-mq3-vm-interpreter-load-function-load-image-callback-src-mq3-vm-interpreter-ml-598598174"></a>
### load

```ml
function load(image, callback)
```

Load interpreter in vm.interpreter.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `image` | `dynamic` | — | Image passed as `image` to `mq3.vm.interpreter.imageLayout`. |
| `callback` | `dynamic` | — | Initial `syscall` field stored in the returned or constructed `mq3.vm.interpreter.VM` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/interpreter.ml#L122)

<a id="function-function-mq3-vm-interpreter-restorestack-function-restorestack-vm-saved-src-mq3-vm-interpreter-ml-625622636"></a>
### restoreStack

```ml
function restoreStack(vm, saved)
```

Update `vm.programStack` in vm.interpreter.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Updated in place: `programStack`. |
| `saved` | `dynamic` | — | Saved operand used by `restoreStack`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/interpreter.ml#L212)

<a id="function-function-mq3-vm-interpreter-signeddivide-function-signeddivide-a-b-src-mq3-vm-interpreter-ml-1769187931"></a>
### signedDivide

```ml
function signedDivide(a, b)
```

Compute signed divide in vm.interpreter; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A passed as `a` to `mq3.compat.numeric.quotient`. |
| `b` | `dynamic` | — | B passed as `b` to `mq3.compat.numeric.quotient`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/interpreter.ml#L198)

<a id="function-function-mq3-vm-interpreter-stackneed-function-stackneed-op-src-mq3-vm-interpreter-ml-1190623647"></a>
### stackNeed

```ml
function stackNeed(op)
```

Compute stack need in vm.interpreter; the normal completion returns `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `op` | `dynamic` | — | Op used in `(op == 5)` and `(op == 7)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/interpreter.ml#L92)

<a id="function-function-mq3-vm-interpreter-targetaddress-function-targetaddress-vm-target-src-mq3-vm-interpreter-ml-2097599284"></a>
### targetAddress

```ml
function targetAddress(vm, target)
```

Compute target address in vm.interpreter; the normal completion returns `vm.addresses[target]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Record exposing `addresses`. |
| `target` | `dynamic` | — | Zero-based index into `vm.addresses`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/interpreter.ml#L190)

- [mq3.vm.interpreter.VM](Type-mq3-vm-interpreter-vm-1653730746.md) — struct
<a id="function-function-mq3-vm-interpreter-vm-indent-function-vm-indent-calllevel-src-mq3-vm-interpreter-ml-2095087730"></a>
### VM_Indent

```ml
function VM_Indent(callLevel)
```

Debug helpers from vm_interpreted.c.  The C implementation returns a pointer into a static forty-space string; MiniLang returns the equivalent immutable suffix.  Stack traces retain the original frame layout: [return pc, previous program stack] at offsets 0 and 4.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `callLevel` | `dynamic` | — | Call level used in `(callLevel < 0)` and `(callLevel > 20)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/interpreter.ml#L49)

<a id="function-function-mq3-vm-interpreter-vm-stacktrace-function-vm-stacktrace-data-programcounter-programstack-symbolfn-context-src-mq3-vm-interpreter-ml-86497079"></a>
### VM_StackTrace

```ml
function VM_StackTrace(data, programCounter, programStack, symbolFn, context)
```

Compute stack trace in vm.interpreter; the normal completion returns `lines`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data passed as `data` to `mq3.compat.numeric.readI32`. |
| `programCounter` | `dynamic` | — | Program counter used in `str(programCounter)` and `(programCounter == - 1)`. |
| `programStack` | `dynamic` | — | Offset passed as `offset` to `mq3.compat.numeric.readI32`. |
| `symbolFn` | `dynamic` | — | Callback invoked for symbol; the call sites below define the callback arguments. |
| `context` | `dynamic` | — | Context used in `symbolFn(context, programCounter)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/vm/interpreter.ml#L63)
