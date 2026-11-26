# `mq3.platform.win_main_runtime.Runtime`

[Home](README.md) · [Source file](File-src-mq3-platform-win-main-runtime-ml-2060063046.md)

<a id="struct-struct-mq3-platform-win-main-runtime-runtime-struct-runtime-src-mq3-platform-win-main-runtime-ml-1290954271"></a>
## Runtime

```ml
struct Runtime
```

Data record for `mq3.platform.win_main_runtime.Runtime`; groups `commandLine`, `events`, `head`, `tail`, `overflows`, `printed`, and 34 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L148)

## Members

<a id="field-field-mq3-platform-win-main-runtime-runtime-actions-actions-src-mq3-platform-win-main-runtime-ml-1892020869"></a>
### actions

```ml
actions
```

Platform operations recorded for dispatch or inspection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L194)

<a id="field-field-mq3-platform-win-main-runtime-runtime-arch-arch-src-mq3-platform-win-main-runtime-ml-467596693"></a>
### arch

```ml
arch
```

Processor or platform architecture identifier used during startup.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L170)

<a id="field-field-mq3-platform-win-main-runtime-runtime-clockfn-clockfn-src-mq3-platform-win-main-runtime-ml-896338513"></a>
### clockFn

```ml
clockFn
```

Host callback used to perform clock operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L196)

<a id="field-field-mq3-platform-win-main-runtime-runtime-commandline-commandline-src-mq3-platform-win-main-runtime-ml-1666131369"></a>
### commandLine

```ml
commandLine
```

Command-line text supplied when initializing the platform runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L150)

<a id="field-field-mq3-platform-win-main-runtime-runtime-commonframefn-commonframefn-src-mq3-platform-win-main-runtime-ml-1295206137"></a>
### commonFrameFn

```ml
commonFrameFn
```

Host callback used to perform common frame operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L216)

<a id="field-field-mq3-platform-win-main-runtime-runtime-commoninitfn-commoninitfn-src-mq3-platform-win-main-runtime-ml-1839600351"></a>
### commonInitFn

```ml
commonInitFn
```

Host callback used to perform common init operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L214)

<a id="field-field-mq3-platform-win-main-runtime-runtime-consolefn-consolefn-src-mq3-platform-win-main-runtime-ml-245612569"></a>
### consoleFn

```ml
consoleFn
```

Host callback used to perform console operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L200)

<a id="field-field-mq3-platform-win-main-runtime-runtime-consolevisible-consolevisible-src-mq3-platform-win-main-runtime-ml-486726547"></a>
### consoleVisible

```ml
consoleVisible
```

Whether the native console window is visible.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L178)

<a id="field-field-mq3-platform-win-main-runtime-runtime-context-context-src-mq3-platform-win-main-runtime-ml-1025905129"></a>
### context

```ml
context
```

Windows host state supplied to console, error-display, sleep, and frame callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L228)

<a id="field-field-mq3-platform-win-main-runtime-runtime-cpuid-cpuid-src-mq3-platform-win-main-runtime-ml-1915929573"></a>
### cpuId

```ml
cpuId
```

Processor feature category selected by platform detection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L174)

<a id="field-field-mq3-platform-win-main-runtime-runtime-cpustring-cpustring-src-mq3-platform-win-main-runtime-ml-1543520121"></a>
### cpuString

```ml
cpuString
```

Human-readable processor description used by platform initialization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L172)

<a id="field-field-mq3-platform-win-main-runtime-runtime-createconsolefn-createconsolefn-src-mq3-platform-win-main-runtime-ml-744020045"></a>
### createConsoleFn

```ml
createConsoleFn
```

Host callback used to perform create console operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L218)

<a id="field-field-mq3-platform-win-main-runtime-runtime-destroyconsolefn-destroyconsolefn-src-mq3-platform-win-main-runtime-ml-275461507"></a>
### destroyConsoleFn

```ml
destroyConsoleFn
```

Host callback used to perform destroy console operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L220)

<a id="field-field-mq3-platform-win-main-runtime-runtime-dlls-dlls-src-mq3-platform-win-main-runtime-ml-852084183"></a>
### dlls

```ml
dlls
```

Loaded dynamic libraries and their entry-point records.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L186)

<a id="field-field-mq3-platform-win-main-runtime-runtime-errorconsolefn-errorconsolefn-src-mq3-platform-win-main-runtime-ml-1517855415"></a>
### errorConsoleFn

```ml
errorConsoleFn
```

Host callback used to perform error console operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L224)

<a id="field-field-mq3-platform-win-main-runtime-runtime-errortext-errortext-src-mq3-platform-win-main-runtime-ml-1866492305"></a>
### errorText

```ml
errorText
```

Text describing the most recent platform error.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L164)

<a id="field-field-mq3-platform-win-main-runtime-runtime-events-events-src-mq3-platform-win-main-runtime-ml-1128416431"></a>
### events

```ml
events
```

Pending input or system events awaiting delivery.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L152)

<a id="field-field-mq3-platform-win-main-runtime-runtime-fatal-fatal-src-mq3-platform-win-main-runtime-ml-1426954537"></a>
### fatal

```ml
fatal
```

Whether a fatal platform error has occurred.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L162)

<a id="field-field-mq3-platform-win-main-runtime-runtime-framecount-framecount-src-mq3-platform-win-main-runtime-ml-1382489489"></a>
### frameCount

```ml
frameCount
```

Sequence count of frames processed by this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L190)

<a id="field-field-mq3-platform-win-main-runtime-runtime-head-head-src-mq3-platform-win-main-runtime-ml-1374183081"></a>
### head

```ml
head
```

Producer cursor of the next native system-event slot to fill.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L154)

<a id="field-field-mq3-platform-win-main-runtime-runtime-initialized-initialized-src-mq3-platform-win-main-runtime-ml-1657923705"></a>
### initialized

```ml
initialized
```

Whether initialization completed successfully.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L168)

<a id="field-field-mq3-platform-win-main-runtime-runtime-inputframefn-inputframefn-src-mq3-platform-win-main-runtime-ml-760379031"></a>
### inputFrameFn

```ml
inputFrameFn
```

Host callback used to perform input frame operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L208)

<a id="field-field-mq3-platform-win-main-runtime-runtime-inputinitfn-inputinitfn-src-mq3-platform-win-main-runtime-ml-1867249049"></a>
### inputInitFn

```ml
inputInitFn
```

Host callback used to perform input init operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L204)

<a id="field-field-mq3-platform-win-main-runtime-runtime-inputshutdownfn-inputshutdownfn-src-mq3-platform-win-main-runtime-ml-2036499657"></a>
### inputShutdownFn

```ml
inputShutdownFn
```

Host callback used to perform input shutdown operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L206)

<a id="field-field-mq3-platform-win-main-runtime-runtime-inputstarted-inputstarted-src-mq3-platform-win-main-runtime-ml-685664491"></a>
### inputStarted

```ml
inputStarted
```

Whether platform input services have started.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L180)

<a id="field-field-mq3-platform-win-main-runtime-runtime-networkinitfn-networkinitfn-src-mq3-platform-win-main-runtime-ml-2113781265"></a>
### networkInitFn

```ml
networkInitFn
```

Host callback used to perform network init operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L210)

<a id="field-field-mq3-platform-win-main-runtime-runtime-networkrestartfn-networkrestartfn-src-mq3-platform-win-main-runtime-ml-764770339"></a>
### networkRestartFn

```ml
networkRestartFn
```

Host callback used to perform network restart operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L212)

<a id="field-field-mq3-platform-win-main-runtime-runtime-networkstarted-networkstarted-src-mq3-platform-win-main-runtime-ml-1934324859"></a>
### networkStarted

```ml
networkStarted
```

Whether platform network services have started.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L182)

<a id="field-field-mq3-platform-win-main-runtime-runtime-overflows-overflows-src-mq3-platform-win-main-runtime-ml-346727281"></a>
### overflows

```ml
overflows
```

Number of events lost because the queue reached capacity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L158)

<a id="field-field-mq3-platform-win-main-runtime-runtime-packetfn-packetfn-src-mq3-platform-win-main-runtime-ml-1179475077"></a>
### packetFn

```ml
packetFn
```

Host callback used to perform packet operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L202)

<a id="field-field-mq3-platform-win-main-runtime-runtime-printed-printed-src-mq3-platform-win-main-runtime-ml-2098864201"></a>
### printed

```ml
printed
```

Console text captured from platform print calls.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L160)

<a id="field-field-mq3-platform-win-main-runtime-runtime-pumpfn-pumpfn-src-mq3-platform-win-main-runtime-ml-279245161"></a>
### pumpFn

```ml
pumpFn
```

Host callback used to perform pump operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L198)

<a id="field-field-mq3-platform-win-main-runtime-runtime-quitcode-quitcode-src-mq3-platform-win-main-runtime-ml-1491370865"></a>
### quitCode

```ml
quitCode
```

Exit status requested when terminating the application.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L166)

<a id="field-field-mq3-platform-win-main-runtime-runtime-showconsolefn-showconsolefn-src-mq3-platform-win-main-runtime-ml-174801497"></a>
### showConsoleFn

```ml
showConsoleFn
```

Host callback used to perform show console operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L222)

<a id="field-field-mq3-platform-win-main-runtime-runtime-sleepfn-sleepfn-src-mq3-platform-win-main-runtime-ml-32633361"></a>
### sleepFn

```ml
sleepFn
```

Host callback used to perform sleep operations for this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L226)

<a id="field-field-mq3-platform-win-main-runtime-runtime-streams-streams-src-mq3-platform-win-main-runtime-ml-310663189"></a>
### streams

```ml
streams
```

Open streamed-file records managed by the platform runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L188)

<a id="field-field-mq3-platform-win-main-runtime-runtime-streamstarted-streamstarted-src-mq3-platform-win-main-runtime-ml-26311829"></a>
### streamStarted

```ml
streamStarted
```

Whether the streamed-file subsystem has started.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L184)

<a id="field-field-mq3-platform-win-main-runtime-runtime-tail-tail-src-mq3-platform-win-main-runtime-ml-590752537"></a>
### tail

```ml
tail
```

Consumer position of the next event to remove from the queue.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L156)

<a id="field-field-mq3-platform-win-main-runtime-runtime-totalmsec-totalmsec-src-mq3-platform-win-main-runtime-ml-648894073"></a>
### totalMsec

```ml
totalMsec
```

Total elapsed milliseconds accumulated by the runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L192)

<a id="field-field-mq3-platform-win-main-runtime-runtime-username-username-src-mq3-platform-win-main-runtime-ml-1827627025"></a>
### username

```ml
username
```

Operating-system user name used for user-specific settings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/platform/win_main_runtime.ml#L176)
