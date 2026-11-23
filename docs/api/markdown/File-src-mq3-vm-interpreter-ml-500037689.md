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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L185)

<a id="function-function-mq3-vm-interpreter-callfast-function-callfast-vm-args-src-mq3-vm-interpreter-ml-1372106202"></a>
### callFast

```ml
function callFast(vm, args)
```

Keep the MiniLang interpreter as the executable reference implementation. Production dispatch runs the same validated plan in bounded native code and yields back to MiniLang at each trap without crossing a callback ABI.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L160)

<a id="function-function-mq3-vm-interpreter-fail-function-fail-message-src-mq3-vm-interpreter-ml-2045130873"></a>
### fail

```ml
function fail(message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L36)

<a id="function-function-mq3-vm-interpreter-imagelayout-function-imagelayout-image-src-mq3-vm-interpreter-ml-735397417"></a>
### imageLayout

```ml
function imageLayout(image)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `image` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L83)

- [mq3.vm.interpreter.ImageLayout](Type-mq3-vm-interpreter-imagelayout-733203426.md) — struct
<a id="function-function-mq3-vm-interpreter-immediatesize-function-immediatesize-op-src-mq3-vm-interpreter-ml-690945279"></a>
### immediateSize

```ml
function immediateSize(op)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `op` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L71)

<a id="function-function-mq3-vm-interpreter-load-function-load-image-callback-src-mq3-vm-interpreter-ml-598598174"></a>
### load

```ml
function load(image, callback)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `image` | `dynamic` | — |  |
| `callback` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L102)

<a id="function-function-mq3-vm-interpreter-restorestack-function-restorestack-vm-saved-src-mq3-vm-interpreter-ml-625622636"></a>
### restoreStack

```ml
function restoreStack(vm, saved)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `saved` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L181)

<a id="function-function-mq3-vm-interpreter-signeddivide-function-signeddivide-a-b-src-mq3-vm-interpreter-ml-1769187931"></a>
### signedDivide

```ml
function signedDivide(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L170)

<a id="function-function-mq3-vm-interpreter-stackneed-function-stackneed-op-src-mq3-vm-interpreter-ml-1190623647"></a>
### stackNeed

```ml
function stackNeed(op)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `op` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L77)

<a id="function-function-mq3-vm-interpreter-targetaddress-function-targetaddress-vm-target-src-mq3-vm-interpreter-ml-2097599284"></a>
### targetAddress

```ml
function targetAddress(vm, target)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L165)

- [mq3.vm.interpreter.VM](Type-mq3-vm-interpreter-vm-1653730746.md) — struct
<a id="function-function-mq3-vm-interpreter-vm-indent-function-vm-indent-calllevel-src-mq3-vm-interpreter-ml-2095087730"></a>
### VM_Indent

```ml
function VM_Indent(callLevel)
```

Debug helpers from vm_interpreted.c.  The C implementation returns a pointer into a static forty-space string; MiniLang returns the equivalent immutable suffix.  Stack traces retain the original frame layout: [return pc, previous program stack] at offsets 0 and 4.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `callLevel` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L44)

<a id="function-function-mq3-vm-interpreter-vm-stacktrace-function-vm-stacktrace-data-programcounter-programstack-symbolfn-context-src-mq3-vm-interpreter-ml-86497079"></a>
### VM_StackTrace

```ml
function VM_StackTrace(data, programCounter, programStack, symbolFn, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |
| `programCounter` | `dynamic` | — |  |
| `programStack` | `dynamic` | — |  |
| `symbolFn` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L52)
