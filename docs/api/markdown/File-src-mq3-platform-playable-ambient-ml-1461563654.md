# `src/mq3/platform/playable_ambient.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.platform.playable_ambient`](Package-mq3-platform-playable-ambient-646210736.md)

Reachable from entry: **yes**

## Declarations

<a id="function-function-mq3-platform-playable-ambient-cansubmit-function-cansubmit-src-mq3-platform-playable-ambient-ml-1935268416"></a>
### canSubmit

```ml
function canSubmit()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_ambient.ml#L12)

<a id="extern_function-extern-function-mq3-platform-playable-ambient-cansubmitnative-extern-function-cansubmitnative-from-playable-ambient-dll-symbol-playable-ambient-can-submit-returns-i32-src-mq3-platform-playable-ambient-ml-1657569978"></a>
### canSubmitNative

```ml
extern function canSubmitNative() from "playable_ambient.dll" symbol "playable_ambient_can_submit" returns i32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_ambient.ml#L6)

<a id="function-function-mq3-platform-playable-ambient-init-function-init-rate-src-mq3-platform-playable-ambient-ml-347646482"></a>
### init

```ml
function init(rate)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rate` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_ambient.ml#L11)

<a id="extern_function-extern-function-mq3-platform-playable-ambient-initnative-extern-function-initnative-rate-as-i32-from-playable-ambient-dll-symbol-playable-ambient-init-returns-i32-src-mq3-platform-playable-ambient-ml-2074543895"></a>
### initNative

```ml
extern function initNative(rate as i32) from "playable_ambient.dll" symbol "playable_ambient_init" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rate` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_ambient.ml#L5)

<a id="function-function-mq3-platform-playable-ambient-shutdown-function-shutdown-src-mq3-platform-playable-ambient-ml-183704720"></a>
### shutdown

```ml
function shutdown()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_ambient.ml#L19)

<a id="extern_function-extern-function-mq3-platform-playable-ambient-shutdownnative-extern-function-shutdownnative-from-playable-ambient-dll-symbol-playable-ambient-shutdown-returns-void-src-mq3-platform-playable-ambient-ml-941273937"></a>
### shutdownNative

```ml
extern function shutdownNative() from "playable_ambient.dll" symbol "playable_ambient_shutdown" returns void
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_ambient.ml#L9)

<a id="function-function-mq3-platform-playable-ambient-stop-function-stop-src-mq3-platform-playable-ambient-ml-2029031836"></a>
### stop

```ml
function stop()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_ambient.ml#L18)

<a id="extern_function-extern-function-mq3-platform-playable-ambient-stopnative-extern-function-stopnative-from-playable-ambient-dll-symbol-playable-ambient-stop-returns-void-src-mq3-platform-playable-ambient-ml-137367495"></a>
### stopNative

```ml
extern function stopNative() from "playable_ambient.dll" symbol "playable_ambient_stop" returns void
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_ambient.ml#L8)

<a id="function-function-mq3-platform-playable-ambient-submit-function-submit-samples-src-mq3-platform-playable-ambient-ml-1193101823"></a>
### submit

```ml
function submit(samples)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `samples` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_ambient.ml#L13)

<a id="extern_function-extern-function-mq3-platform-playable-ambient-submitnative-extern-function-submitnative-samples-as-ptr-count-as-i32-from-playable-ambient-dll-symbol-playable-ambient-submit-returns-i32-src-mq3-platform-playable-ambient-ml-319716979"></a>
### submitNative

```ml
extern function submitNative(samples as ptr, count as i32) from "playable_ambient.dll" symbol "playable_ambient_submit" returns i32
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `samples` | `ptr` | — |  |
| `count` | `i32` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/platform/playable_ambient.ml#L7)
