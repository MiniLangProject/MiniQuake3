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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `control` | `ptr` | — |  |
| `count` | `i32` | — |  |
| `original` | `i32` | — |  |
| `bottom` | `i32` | — |  |
| `mask` | `i32` | — |  |
| `limit` | `i32` | — |  |
| `breaks` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/native_exec.ml#L7)

<a id="function-function-mq3-vm-native-exec-call-function-call-vm-args-src-mq3-vm-native-exec-ml-276052838"></a>
### call

```ml
function call(vm, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/native_exec.ml#L16)

<a id="constant-constant-mq3-vm-native-exec-control-bytes-const-control-bytes-1080-src-mq3-vm-native-exec-ml-486636992"></a>
### CONTROL_BYTES

```ml
const CONTROL_BYTES = 1080
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/native_exec.ml#L9)

<a id="function-function-mq3-vm-native-exec-fail-function-fail-text-src-mq3-vm-native-exec-ml-360682263"></a>
### fail

```ml
function fail(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/native_exec.ml#L10)

<a id="extern_function-extern-function-mq3-vm-native-exec-plansizenative-extern-function-plansizenative-image-as-ptr-count-as-i32-from-miniquake3-qvm-dll-symbol-mq3-qvm-plan-size-returns-i32-src-mq3-vm-native-exec-ml-535154572"></a>
### planSizeNative

```ml
extern function planSizeNative(image as ptr, count as i32) from "miniquake3_qvm.dll" symbol "mq3_qvm_plan_size" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `image` | `ptr` | — |  |
| `count` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/native_exec.ml#L5)

<a id="function-function-mq3-vm-native-exec-prepare-function-prepare-image-src-mq3-vm-native-exec-ml-1914730287"></a>
### prepare

```ml
function prepare(image)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `image` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/native_exec.ml#L11)

<a id="extern_function-extern-function-mq3-vm-native-exec-preparenative-extern-function-preparenative-image-as-ptr-count-as-i32-plan-as-ptr-capacity-as-i32-from-miniquake3-qvm-dll-symbol-mq3-qvm-prepare-returns-i32-src-mq3-vm-native-exec-ml-931716567"></a>
### prepareNative

```ml
extern function prepareNative(image as ptr, count as i32, plan as ptr, capacity as i32) from "miniquake3_qvm.dll" symbol "mq3_qvm_prepare" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `image` | `ptr` | — |  |
| `count` | `i32` | — |  |
| `plan` | `ptr` | — |  |
| `capacity` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/native_exec.ml#L6)

<a id="function-function-mq3-vm-native-exec-restorestack-function-restorestack-vm-saved-src-mq3-vm-native-exec-ml-318707870"></a>
### restoreStack

```ml
function restoreStack(vm, saved)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `saved` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/native_exec.ml#L15)

<a id="extern_function-extern-function-mq3-vm-native-exec-runnative-extern-function-runnative-plan-as-ptr-planbytes-as-i32-data-as-ptr-databytes-as-i32-control-as-ptr-controlbytes-as-i32-value-as-i32-resume-as-i32-from-miniquake3-qvm-dll-symbol-mq3-qvm-run-returns-i32-src-mq3-vm-native-exec-ml-1364553667"></a>
### runNative

```ml
extern function runNative(plan as ptr, planBytes as i32, data as ptr, dataBytes as i32, control as ptr, controlBytes as i32, value as i32, resume as i32) from "miniquake3_qvm.dll" symbol "mq3_qvm_run" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `plan` | `ptr` | — |  |
| `planBytes` | `i32` | — |  |
| `data` | `ptr` | — |  |
| `dataBytes` | `i32` | — |  |
| `control` | `ptr` | — |  |
| `controlBytes` | `i32` | — |  |
| `value` | `i32` | — |  |
| `resume` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/vm/native_exec.ml#L8)
