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

Computes `canSubmitNative()!=0` for `mq3.platform.playable_ambient.canSubmit`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_ambient.ml#L26)

<a id="extern_function-extern-function-mq3-platform-playable-ambient-cansubmitnative-extern-function-cansubmitnative-from-playable-ambient-dll-symbol-playable-ambient-can-submit-returns-i32-src-mq3-platform-playable-ambient-ml-1657569978"></a>
### canSubmitNative

```ml
extern function canSubmitNative() from "playable_ambient.dll" symbol "playable_ambient_can_submit" returns i32
```

Checks whether a queued PCM buffer is available for another ambient chunk.


**Returns:** 1 when a buffer is available; 0 while unavailable or uninitialized.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_ambient.ml#L11)

<a id="function-function-mq3-platform-playable-ambient-init-function-init-rate-src-mq3-platform-playable-ambient-ml-347646482"></a>
### init

```ml
function init(rate)
```

Returns `void` from `mq3.platform.playable_ambient.init`; earlier branches return `error(7630,"ambient output initialization failed")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rate` | `dynamic` | — | Value forwarded as `rate` to `mq3.platform.playable_ambient.initNative`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_ambient.ml#L24)

<a id="extern_function-extern-function-mq3-platform-playable-ambient-initnative-extern-function-initnative-rate-as-i32-from-playable-ambient-dll-symbol-playable-ambient-init-returns-i32-src-mq3-platform-playable-ambient-ml-2074543895"></a>
### initNative

```ml
extern function initNative(rate as i32) from "playable_ambient.dll" symbol "playable_ambient_init" returns i32
```

Opens the queued stereo PCM output used by the spatial ambient mixer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `rate` | `i32` | — | Stereo output sample rate in frames per second; accepted range 4000..192000. |


**Returns:** 1 if the output is ready; 0 on initialization failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_ambient.ml#L8)

<a id="function-function-mq3-platform-playable-ambient-shutdown-function-shutdown-src-mq3-platform-playable-ambient-ml-183704720"></a>
### shutdown

```ml
function shutdown()
```

Returns `void` from `mq3.platform.playable_ambient.shutdown`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_ambient.ml#L37)

<a id="extern_function-extern-function-mq3-platform-playable-ambient-shutdownnative-extern-function-shutdownnative-from-playable-ambient-dll-symbol-playable-ambient-shutdown-returns-void-src-mq3-platform-playable-ambient-ml-941273937"></a>
### shutdownNative

```ml
extern function shutdownNative() from "playable_ambient.dll" symbol "playable_ambient_shutdown" returns void
```

Stops the ambient stream and releases its WinMM output resources.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_ambient.ml#L20)

<a id="function-function-mq3-platform-playable-ambient-stop-function-stop-src-mq3-platform-playable-ambient-ml-2029031836"></a>
### stop

```ml
function stop()
```

Returns `void` from `mq3.platform.playable_ambient.stop`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_ambient.ml#L35)

<a id="extern_function-extern-function-mq3-platform-playable-ambient-stopnative-extern-function-stopnative-from-playable-ambient-dll-symbol-playable-ambient-stop-returns-void-src-mq3-platform-playable-ambient-ml-137367495"></a>
### stopNative

```ml
extern function stopNative() from "playable_ambient.dll" symbol "playable_ambient_stop" returns void
```

Stops ambient playback, releases all queued PCM buffers, and closes the WinMM output handle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_ambient.ml#L18)

<a id="function-function-mq3-platform-playable-ambient-submit-function-submit-samples-src-mq3-platform-playable-ambient-ml-1193101823"></a>
### submit

```ml
function submit(samples)
```

Submits a four-byte-aligned stereo PCM chunk; returns false for a full queue and an error for native failure.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `samples` | `dynamic` | — | Input tested by `samples==void or len(samples)<4 or (len(samples)&3)!=0`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_ambient.ml#L29)

<a id="extern_function-extern-function-mq3-platform-playable-ambient-submitnative-extern-function-submitnative-samples-as-ptr-count-as-i32-from-playable-ambient-dll-symbol-playable-ambient-submit-returns-i32-src-mq3-platform-playable-ambient-ml-319716979"></a>
### submitNative

```ml
extern function submitNative(samples as ptr, count as i32) from "playable_ambient.dll" symbol "playable_ambient_submit" returns i32
```

Copies a stereo PCM chunk into the native ambient queue.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `samples` | `ptr` | — | Read-only interleaved signed 16-bit stereo PCM samples. |
| `count` | `i32` | — | PCM byte count; positive, divisible by four, and at most 16384. |


**Returns:** 1 when queued, 2 when all queue buffers are busy, or 0 on failure.

[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/playable_ambient.ml#L16)
