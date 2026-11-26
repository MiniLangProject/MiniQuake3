# `mq3.qcommon.common.State`

[Home](README.md) · [Source file](File-src-mq3-qcommon-common-ml-778957851.md)

<a id="struct-struct-mq3-qcommon-common-state-struct-state-src-mq3-qcommon-common-ml-109364801"></a>
## State

```ml
struct State
```

State record for qcommon.common, containing `services`, `commandState`, `startupState`, `configState`, `networkPump`, `engineRuntime`, and 37 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L188)

## Members

<a id="field-field-mq3-qcommon-common-state-buildscript-buildscript-src-mq3-qcommon-common-ml-443205656"></a>
### buildScript

```ml
buildScript
```

True when running in asset-build script mode.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L214)

<a id="field-field-mq3-qcommon-common-state-cameramode-cameramode-src-mq3-qcommon-common-ml-703347428"></a>
### cameraMode

```ml
cameraMode
```

True when camera playback enables its special frame-time policy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L252)

<a id="field-field-mq3-qcommon-common-state-cdkey-cdkey-src-mq3-qcommon-common-ml-1410901892"></a>
### cdKey

```ml
cdKey
```

Configured game key used by the host validation interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L262)

<a id="field-field-mq3-qcommon-common-state-commandstate-commandstate-src-mq3-qcommon-common-ml-429728508"></a>
### commandState

```ml
commandState
```

Console-command buffer and registered command handlers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L192)

<a id="field-field-mq3-qcommon-common-state-completionfield-completionfield-src-mq3-qcommon-common-ml-1834343356"></a>
### completionField

```ml
completionField
```

Editable console field receiving the completion result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L274)

<a id="field-field-mq3-qcommon-common-state-completionstring-completionstring-src-mq3-qcommon-common-ml-1130988986"></a>
### completionString

```ml
completionString
```

Prefix currently being matched by console completion.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L268)

<a id="field-field-mq3-qcommon-common-state-configstate-configstate-src-mq3-qcommon-common-ml-669333564"></a>
### configState

```ml
configState
```

Configuration persistence state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L196)

<a id="field-field-mq3-qcommon-common-state-dedicated-dedicated-src-mq3-qcommon-common-ml-87225824"></a>
### dedicated

```ml
dedicated
```

True when the server runs without a local graphical client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L242)

<a id="field-field-mq3-qcommon-common-state-developer-developer-src-mq3-qcommon-common-ml-1218613180"></a>
### developer

```ml
developer
```

True when developer diagnostics are enabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L204)

<a id="field-field-mq3-qcommon-common-state-engineruntime-engineruntime-src-mq3-qcommon-common-ml-697543164"></a>
### engineRuntime

```ml
engineRuntime
```

Bound engine runtime receiving common lifecycle events.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L200)

<a id="field-field-mq3-qcommon-common-state-errorcount-errorcount-src-mq3-qcommon-common-ml-809809942"></a>
### errorCount

```ml
errorCount
```

Number of error recorded by this state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L212)

<a id="field-field-mq3-qcommon-common-state-errorentered-errorentered-src-mq3-qcommon-common-ml-1393785218"></a>
### errorEntered

```ml
errorEntered
```

True while an error is being handled, preventing recursive error handling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L206)

<a id="field-field-mq3-qcommon-common-state-errormessage-errormessage-src-mq3-qcommon-common-ml-991884982"></a>
### errorMessage

```ml
errorMessage
```

Text of the error currently being handled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L208)

<a id="field-field-mq3-qcommon-common-state-fixedtime-fixedtime-src-mq3-qcommon-common-ml-756726056"></a>
### fixedTime

```ml
fixedTime
```

Fixed frame-time override used when deterministic stepping is requested.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L248)

<a id="field-field-mq3-qcommon-common-state-framemsec-framemsec-src-mq3-qcommon-common-ml-1421163392"></a>
### frameMsec

```ml
frameMsec
```

Elapsed milliseconds supplied to the current engine frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L236)

<a id="field-field-mq3-qcommon-common-state-framenumber-framenumber-src-mq3-qcommon-common-ml-812267872"></a>
### frameNumber

```ml
frameNumber
```

Number of engine frames processed since initialization.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L238)

<a id="field-field-mq3-qcommon-common-state-frametime-frametime-src-mq3-qcommon-common-ml-1295567404"></a>
### frameTime

```ml
frameTime
```

Host timestamp associated with the current engine frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L234)

<a id="field-field-mq3-qcommon-common-state-fullyinitialized-fullyinitialized-src-mq3-qcommon-common-ml-950091772"></a>
### fullyInitialized

```ml
fullyInitialized
```

True after common engine initialization has completed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L216)

<a id="field-field-mq3-qcommon-common-state-head-head-src-mq3-qcommon-common-ml-361102876"></a>
### head

```ml
head
```

Monotonic write position in the circular queue of pushed system events.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L220)

<a id="field-field-mq3-qcommon-common-state-hunk-hunk-src-mq3-qcommon-common-ml-2000813208"></a>
### hunk

```ml
hunk
```

Low/high-bank managed hunk allocator.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L260)

<a id="field-field-mq3-qcommon-common-state-journaldirty-journaldirty-src-mq3-qcommon-common-ml-2006577758"></a>
### journalDirty

```ml
journalDirty
```

True when recorded journal changes need to be saved.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L232)

<a id="field-field-mq3-qcommon-common-state-journalevents-journalevents-src-mq3-qcommon-common-ml-1230948236"></a>
### journalEvents

```ml
journalEvents
```

Recorded or replayable host events.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L226)

<a id="field-field-mq3-qcommon-common-state-journalindex-journalindex-src-mq3-qcommon-common-ml-1982740114"></a>
### journalIndex

```ml
journalIndex
```

Next journal event to consume during replay.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L228)

<a id="field-field-mq3-qcommon-common-state-journalmode-journalmode-src-mq3-qcommon-common-ml-254240560"></a>
### journalMode

```ml
journalMode
```

Event-journal mode selecting disabled, recording, or replay behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L224)

<a id="field-field-mq3-qcommon-common-state-journalpath-journalpath-src-mq3-qcommon-common-ml-1213980564"></a>
### journalPath

```ml
journalPath
```

Filesystem path of the event journal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L230)

<a id="field-field-mq3-qcommon-common-state-lasterrortime-lasterrortime-src-mq3-qcommon-common-ml-803550856"></a>
### lastErrorTime

```ml
lastErrorTime
```

Timestamp of the previous engine error.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L210)

<a id="field-field-mq3-qcommon-common-state-lastprint-lastprint-src-mq3-qcommon-common-ml-780101336"></a>
### lastPrint

```ml
lastPrint
```

Most recently emitted console diagnostic text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L266)

<a id="field-field-mq3-qcommon-common-state-lasttime-lasttime-src-mq3-qcommon-common-ml-230425162"></a>
### lastTime

```ml
lastTime
```

Host timestamp retained from the preceding frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L240)

<a id="field-field-mq3-qcommon-common-state-matchcount-matchcount-src-mq3-qcommon-common-ml-948672240"></a>
### matchCount

```ml
matchCount
```

Number of match recorded by this state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L272)

<a id="field-field-mq3-qcommon-common-state-maxfps-maxfps-src-mq3-qcommon-common-ml-165026014"></a>
### maxFps

```ml
maxFps
```

Frame-rate limit used when calculating the minimum frame interval.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L244)

<a id="field-field-mq3-qcommon-common-state-networkpump-networkpump-src-mq3-qcommon-common-ml-540296176"></a>
### networkPump

```ml
networkPump
```

Network event pump shared by the engine endpoints.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L198)

<a id="field-field-mq3-qcommon-common-state-pushed-pushed-src-mq3-qcommon-common-ml-502454602"></a>
### pushed

```ml
pushed
```

Buffered host events waiting to be dispatched.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L218)

<a id="field-field-mq3-qcommon-common-state-redirect-redirect-src-mq3-qcommon-common-ml-1982799724"></a>
### redirect

```ml
redirect
```

Active console-output redirection buffer and callback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L202)

<a id="field-field-mq3-qcommon-common-state-services-services-src-mq3-qcommon-common-ml-941590340"></a>
### services

```ml
services
```

Common-engine host operations for console output, files, events, timing, and lifecycle.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L190)

<a id="field-field-mq3-qcommon-common-state-shortestmatch-shortestmatch-src-mq3-qcommon-common-ml-400690360"></a>
### shortestMatch

```ml
shortestMatch
```

Common prefix shared by all console-completion candidates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L270)

<a id="field-field-mq3-qcommon-common-state-shutdown-shutdown-src-mq3-qcommon-common-ml-1671417340"></a>
### shutdown

```ml
shutdown
```

True after shutdown has been requested or completed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L264)

<a id="field-field-mq3-qcommon-common-state-smallzone-smallzone-src-mq3-qcommon-common-ml-582173380"></a>
### smallZone

```ml
smallZone
```

Managed memory zone for small allocations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L258)

<a id="field-field-mq3-qcommon-common-state-startupstate-startupstate-src-mq3-qcommon-common-ml-797337388"></a>
### startupState

```ml
startupState
```

Parsed startup arguments and commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L194)

<a id="field-field-mq3-qcommon-common-state-svrunning-svrunning-src-mq3-qcommon-common-ml-1585192912"></a>
### svRunning

```ml
svRunning
```

True when a local server is active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L254)

<a id="field-field-mq3-qcommon-common-state-tail-tail-src-mq3-qcommon-common-ml-715666220"></a>
### tail

```ml
tail
```

Read position in the buffered host-event queue.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L222)

<a id="field-field-mq3-qcommon-common-state-timedemo-timedemo-src-mq3-qcommon-common-ml-966484732"></a>
### timedemo

```ml
timedemo
```

True when timed-demo playback disables ordinary frame pacing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L246)

<a id="field-field-mq3-qcommon-common-state-timescale-timescale-src-mq3-qcommon-common-ml-1088513768"></a>
### timescale

```ml
timescale
```

Multiplier applied to the elapsed simulation time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L250)

<a id="field-field-mq3-qcommon-common-state-zone-zone-src-mq3-qcommon-common-ml-347337332"></a>
### zone

```ml
zone
```

General-purpose managed memory zone.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/qcommon/common.ml#L256)
