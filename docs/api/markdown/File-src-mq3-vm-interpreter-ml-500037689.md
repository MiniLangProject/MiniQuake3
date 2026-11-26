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

Run vmMain in the reference bytecode interpreter and return its single integer result. Reserves a 48-byte entry frame, zero-fills unused argument slots, and enforces code, operand-stack, program-stack, and per-call instruction-budget checks. The saved program-stack pointer is restored on exit; VM data writes and cumulative step/break counters remain visible to the caller. Trap calls invoke `vm.syscall(vm, argumentBase)` and convert its result to signed int32.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Loaded VM containing decoded instructions, mutable data memory, limits, and syscall handler. |
| `args` | `dynamic` | — | Up to ten integer slots written after the entry-frame header; slot zero conventionally selects the vmMain command. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L267)

<a id="function-function-mq3-vm-interpreter-callfast-function-callfast-vm-args-src-mq3-vm-interpreter-ml-1372106202"></a>
### callFast

```ml
function callFast(vm, args)
```

Keep the MiniLang interpreter as the executable reference implementation. Production dispatch runs the same validated plan in bounded native code and yields back to MiniLang at each trap without crossing a callback ABI. Execute vmMain through the prepared native plan, falling back to `call` when no plan is present. Both paths accept the same VM argument vector and return the VM result or an execution error.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Loaded interpreter VM with mutable memory, counters, and optional native plan. |
| `args` | `dynamic` | — | Up to ten integer argument slots, including the vmMain command selector. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L223)

<a id="function-function-mq3-vm-interpreter-fail-function-fail-message-src-mq3-vm-interpreter-ml-2045130873"></a>
### fail

```ml
function fail(message)
```

Create an interpreter error with code 3400 and the `QVM: ` prefix.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | `dynamic` | — | Diagnostic text appended after the subsystem prefix. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L65)

<a id="function-function-mq3-vm-interpreter-imagelayout-function-imagelayout-image-src-mq3-vm-interpreter-ml-735397417"></a>
### imageLayout

```ml
function imageLayout(image)
```

Validate the QVM header and return its section offsets, lengths, and declared memory size. Accepts VM_MAGIC images with positive instruction/code counts, nonoverlapping code and data, four-byte-aligned initialized data, and total data/literal/BSS storage from 65,536 through 268,435,456 bytes. Invalid or truncated sections produce an interpreter error.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `image` | `dynamic` | — | Complete QVM file as a byte buffer, including the 32-byte header. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L135)

- [mq3.vm.interpreter.ImageLayout](Type-mq3-vm-interpreter-imagelayout-733203426.md) — struct
<a id="function-function-mq3-vm-interpreter-immediatesize-function-immediatesize-op-src-mq3-vm-interpreter-ml-690945279"></a>
### immediateSize

```ml
function immediateSize(op)
```

Return an opcode's immediate-operand length in bytes: 4, 1, or 0, excluding the opcode byte. This helper classifies the opcode only; `load` separately rejects invalid opcode numbers.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `op` | `dynamic` | — | Numeric QVM opcode. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L115)

<a id="function-function-mq3-vm-interpreter-load-function-load-image-callback-src-mq3-vm-interpreter-ml-598598174"></a>
### load

```ml
function load(image, callback)
```

Decode and validate a QVM image, allocate zeroed data memory, and prepare native execution metadata. Instruction numbers map to code byte offsets; immediate branches are rewritten to those offsets. Initialized data and literals are copied into power-of-two memory, leaving BSS and remaining bytes zero. Returns a VM with a 65,536-byte program-stack region and a default 50,000,000-step call budget, or an image-validation/native-plan error. A missing callback is allowed until the VM executes a trap.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `image` | `dynamic` | — | Complete QVM file bytes whose header and instructions will be validated. |
| `callback` | `dynamic` | — | Optional host syscall callback `(vm, argumentBase)`; the base is a VM byte offset. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L161)

<a id="function-function-mq3-vm-interpreter-restorestack-function-restorestack-vm-saved-src-mq3-vm-interpreter-ml-625622636"></a>
### restoreStack

```ml
function restoreStack(vm, saved)
```

Restore the VM program-stack pointer saved before a call. Used by the deferred cleanup so normal returns and execution errors restore the caller's stack pointer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Mutable VM whose `programStack` is restored. |
| `saved` | `dynamic` | — | Program-stack byte offset captured at call entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L256)

<a id="function-function-mq3-vm-interpreter-signeddivide-function-signeddivide-a-b-src-mq3-vm-interpreter-ml-1769187931"></a>
### signedDivide

```ml
function signedDivide(a, b)
```

Divide signed 32-bit operands with truncation toward zero. Zero divisors and INT32_MIN divided by -1 produce interpreter errors.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | Signed 32-bit dividend. |
| `b` | `dynamic` | — | Signed 32-bit divisor. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L241)

<a id="function-function-mq3-vm-interpreter-stackneed-function-stackneed-op-src-mq3-vm-interpreter-ml-1190623647"></a>
### stackNeed

```ml
function stackNeed(op)
```

Return the minimum operand-stack depth required before executing a QVM opcode. The result is 0, 1, or 2 and does not describe the opcode's net stack-size change.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `op` | `dynamic` | — | Numeric QVM opcode whose input operands are being checked. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L124)

<a id="function-function-mq3-vm-interpreter-targetaddress-function-targetaddress-vm-target-src-mq3-vm-interpreter-ml-2097599284"></a>
### targetAddress

```ml
function targetAddress(vm, target)
```

Resolve a zero-based QVM instruction number to its decoded code byte offset. Negative targets and instruction numbers outside the address table produce an interpreter error.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Loaded VM containing the instruction-number-to-byte-offset table. |
| `target` | `dynamic` | — | Zero-based instruction number supplied by a call or computed jump. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L232)

- [mq3.vm.interpreter.VM](Type-mq3-vm-interpreter-vm-1653730746.md) — struct
<a id="function-function-mq3-vm-interpreter-vm-indent-function-vm-indent-calllevel-src-mq3-vm-interpreter-ml-2095087730"></a>
### VM_Indent

```ml
function VM_Indent(callLevel)
```

Debug helpers from vm_interpreted.c.  The C implementation returns a pointer into a static forty-space string; MiniLang returns the equivalent immutable suffix.  Stack traces retain the original frame layout: [return pc, previous program stack] at offsets 0 and 4. Return two indentation spaces per call level, clamped to forty spaces above level twenty. Negative levels produce an interpreter error.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `callLevel` | `dynamic` | — | Nonnegative stack-trace nesting depth. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L76)

<a id="function-function-mq3-vm-interpreter-vm-stacktrace-function-vm-stacktrace-data-programcounter-programstack-symbolfn-context-src-mq3-vm-interpreter-ml-86497079"></a>
### VM_StackTrace

```ml
function VM_StackTrace(data, programCounter, programStack, symbolFn, context)
```

Collect at most 32 stack frames from QVM data memory, starting with the current frame. Each frame contributes either its numeric program counter or the symbol callback's result. Frame links use the previous program stack at offset 4 and the return counter at offset 0; a return counter of -1 terminates the trace. Out-of-bounds frame links produce an error.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | VM data-memory bytes containing the linked stack frames. |
| `programCounter` | `dynamic` | — | Initial code position to report before following the first frame link. |
| `programStack` | `dynamic` | — | Byte offset of the current frame in `data`. |
| `symbolFn` | `dynamic` | — | Optional callback `(context, programCounter)` whose result becomes the trace entry. |
| `context` | `dynamic` | — | Opaque value passed unchanged as the first argument to `symbolFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/interpreter.ml#L93)
