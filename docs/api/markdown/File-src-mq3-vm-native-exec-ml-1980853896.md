# `src/mq3/vm/native_exec.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.vm.native_exec`](Package-mq3-vm-native-exec-459327352.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="extern_function-extern-function-mq3-vm-native-exec-beginnative-extern-function-beginnative-control-as-ptr-count-as-i32-original-as-i32-bottom-as-i32-mask-as-i32-limit-as-i32-breaks-as-i32-from-miniquake3-qvm-dll-symbol-mq3-qvm-begin-returns-i32-src-mq3-vm-native-exec-ml-1139068121"></a>
### beginNative

```ml
extern function beginNative(control as ptr, count as i32, original as i32, bottom as i32, mask as i32, limit as i32, breaks as i32) from "miniquake3_qvm.dll" symbol "mq3_qvm_begin" returns i32
```

Initialize the reentrant QVM control block and reserve the vmMain argument frame.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `ptr` | — | Writable control block of at least CONTROL_BYTES bytes. |
| `count` | `i32` | — | Control-block capacity in bytes. |
| `original` | `i32` | — | Original VM program-stack byte offset. |
| `bottom` | `i32` | — | Lower program-stack boundary. |
| `mask` | `i32` | — | VM data-address mask. |
| `limit` | `i32` | — | Nonnegative instruction budget. |
| `breaks` | `i32` | — | Initial breakpoint counter. |


**Returns:** 1 after initialization, or 0 when the control buffer, stack, or instruction budget is invalid.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/native_exec.ml#L26)

<a id="function-function-mq3-vm-native-exec-call-function-call-vm-args-src-mq3-vm-native-exec-ml-276052838"></a>
### call

```ml
function call(vm, args)
```

Invoke vmMain with at most ten arguments, servicing native syscall continuations and restoring the VM stack on every exit.

Direct state writes: `vm.steps`, `vm.breaks`, `vm.programStack`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Mutable VM runtime, including data memory, prepared native plan, stack bounds, counters, and syscall callback. |
| `args` | `dynamic` | — | At most ten vmMain integer arguments; omitted slots are filled with zero. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/native_exec.ml#L60)

<a id="constant-constant-mq3-vm-native-exec-control-bytes-const-control-bytes-1080-src-mq3-vm-native-exec-ml-486636992"></a>
### CONTROL_BYTES

```ml
const CONTROL_BYTES = 1080
```

Byte size used for control storage or binary layout in mq3.vm.native_exec.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/native_exec.ml#L39)

<a id="function-function-mq3-vm-native-exec-fail-function-fail-text-src-mq3-vm-native-exec-ml-360682263"></a>
### fail

```ml
function fail(text)
```

Create the vm.native_exec error for `fail` with 3400 and the supplied diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text used in `("QVM: " + text)` and `error(3400, ("QVM: " + text))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/native_exec.ml#L42)

<a id="extern_function-extern-function-mq3-vm-native-exec-plansizenative-extern-function-plansizenative-image-as-ptr-count-as-i32-from-miniquake3-qvm-dll-symbol-mq3-qvm-plan-size-returns-i32-src-mq3-vm-native-exec-ml-535154572"></a>
### planSizeNative

```ml
extern function planSizeNative(image as ptr, count as i32) from "miniquake3_qvm.dll" symbol "mq3_qvm_plan_size" returns i32
```

Measure the decoded QVM instruction-plan allocation from the image header.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `image` | `ptr` | — | Read-only QVM image byte address. |
| `count` | `i32` | — | QVM image length in bytes. |


**Returns:** The required plan size in bytes, or -1 for an invalid image header.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/native_exec.ml#L9)

<a id="function-function-mq3-vm-native-exec-prepare-function-prepare-image-src-mq3-vm-native-exec-ml-1914730287"></a>
### prepare

```ml
function prepare(image)
```

Prepare native exec in vm.native_exec; the normal completion returns `plan`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `image` | `dynamic` | — | Image used in `len(image)` and `nativeBytesPtr(image)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/native_exec.ml#L45)

<a id="extern_function-extern-function-mq3-vm-native-exec-preparenative-extern-function-preparenative-image-as-ptr-count-as-i32-plan-as-ptr-capacity-as-i32-from-miniquake3-qvm-dll-symbol-mq3-qvm-prepare-returns-i32-src-mq3-vm-native-exec-ml-931716567"></a>
### prepareNative

```ml
extern function prepareNative(image as ptr, count as i32, plan as ptr, capacity as i32) from "miniquake3_qvm.dll" symbol "mq3_qvm_prepare" returns i32
```

Validate QVM instructions and branches while constructing a native dispatch plan.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `image` | `ptr` | — | Read-only QVM image bytes. |
| `count` | `i32` | — | Image length in bytes. |
| `plan` | `ptr` | — | Writable native plan allocation. |
| `capacity` | `i32` | — | Plan-buffer byte capacity, at least planSizeNative(image, count). |


**Returns:** 1 on success; -1 for invalid buffers/header, -2 for invalid instructions, or -3 for an invalid branch target.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/native_exec.ml#L16)

<a id="function-function-mq3-vm-native-exec-restorestack-function-restorestack-vm-saved-src-mq3-vm-native-exec-ml-318707870"></a>
### restoreStack

```ml
function restoreStack(vm, saved)
```

Update `vm.programStack` in vm.native_exec.

Direct state writes: `vm.programStack`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Updated in place: `programStack`. |
| `saved` | `dynamic` | — | Saved operand used by `restoreStack`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/native_exec.ml#L54)

<a id="extern_function-extern-function-mq3-vm-native-exec-runnative-extern-function-runnative-plan-as-ptr-planbytes-as-i32-data-as-ptr-databytes-as-i32-control-as-ptr-controlbytes-as-i32-value-as-i32-resume-as-i32-from-miniquake3-qvm-dll-symbol-mq3-qvm-run-returns-i32-src-mq3-vm-native-exec-ml-1364553667"></a>
### runNative

```ml
extern function runNative(plan as ptr, planBytes as i32, data as ptr, dataBytes as i32, control as ptr, controlBytes as i32, value as i32, resume as i32) from "miniquake3_qvm.dll" symbol "mq3_qvm_run" returns i32
```

Execute or resume a prepared QVM until completion, a syscall continuation, or an execution error.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `plan` | `ptr` | — | Read-only decoded instruction plan. |
| `planBytes` | `i32` | — | Instruction-plan length in bytes. |
| `data` | `ptr` | — | Mutable QVM data-memory address. |
| `dataBytes` | `i32` | — | Power-of-two VM data-memory size in bytes. |
| `control` | `ptr` | — | Mutable reentrant control block. |
| `controlBytes` | `i32` | — | Control-block capacity in bytes. |
| `value` | `i32` | — | Syscall result supplied when resuming. |
| `resume` | `i32` | — | Nonzero to resume the pending syscall using value. |


**Returns:** 0 for normal return, a positive syscall-continuation status, or a negative validation/execution error; the control block carries the result.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/vm/native_exec.ml#L37)
