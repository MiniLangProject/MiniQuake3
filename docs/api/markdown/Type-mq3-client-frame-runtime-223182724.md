# `mq3.client.frame.Runtime`

[Home](README.md) · [Source file](File-src-mq3-client-frame-ml-2110176474.md)

<a id="struct-struct-mq3-client-frame-runtime-struct-runtime-src-mq3-client-frame-ml-1798499653"></a>
## Runtime

```ml
struct Runtime
```

Stores frame runtime wiring and state, including `running`, `cdDialog`, `state`, `keyCatchers`, `serverRunning`, `aviDemo` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L31)

## Members

<a id="field-field-mq3-client-frame-runtime-avidemo-avidemo-src-mq3-client-frame-ml-97380929"></a>
### aviDemo

```ml
aviDemo
```

When constructing this record, `runtime` supplies `0` for this member. Used by `run` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L47)

<a id="field-field-mq3-client-frame-runtime-cddialog-cddialog-src-mq3-client-frame-ml-2103340699"></a>
### cdDialog

```ml
cdDialog
```

When constructing this record, `runtime` supplies `0` for this member. Used by `run` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L37)

<a id="field-field-mq3-client-frame-runtime-forceavidemo-forceavidemo-src-mq3-client-frame-ml-1875475033"></a>
### forceAviDemo

```ml
forceAviDemo
```

When constructing this record, `runtime` supplies `0` for this member. Used by `run` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L50)

<a id="field-field-mq3-client-frame-runtime-framecount-framecount-src-mq3-client-frame-ml-2009934693"></a>
### framecount

```ml
framecount
```

When constructing this record, `runtime` supplies `0` for this member. Used by `run` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L67)

<a id="field-field-mq3-client-frame-runtime-frametime-frametime-src-mq3-client-frame-ml-1457084413"></a>
### frametime

```ml
frametime
```

Elapsed client time in milliseconds since the preceding frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L61)

<a id="field-field-mq3-client-frame-runtime-keycatchers-keycatchers-src-mq3-client-frame-ml-1633504877"></a>
### keyCatchers

```ml
keyCatchers
```

Bitmask selecting which subsystems currently intercept keyboard input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L42)

<a id="field-field-mq3-client-frame-runtime-lastpackettime-lastpackettime-src-mq3-client-frame-ml-1852449823"></a>
### lastPacketTime

```ml
lastPacketTime
```

Client timestamp of the latest received server packet, used to detect timeouts.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L78)

<a id="field-field-mq3-client-frame-runtime-modifiedflags-modifiedflags-src-mq3-client-frame-ml-1390720957"></a>
### modifiedFlags

```ml
modifiedFlags
```

When constructing this record, `runtime` supplies `0` for this member. Used by `checkUserinfo` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L76)

<a id="field-field-mq3-client-frame-runtime-paused-paused-src-mq3-client-frame-ml-1285963581"></a>
### paused

```ml
paused
```

When constructing this record, `runtime` supplies `0` for this member. Used by `checkUserinfo` and `checkTimeout` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L70)

<a id="field-field-mq3-client-frame-runtime-realframetime-realframetime-src-mq3-client-frame-ml-1125961297"></a>
### realFrametime

```ml
realFrametime
```

When constructing this record, `runtime` supplies `0` for this member. Used by `run` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L59)

<a id="field-field-mq3-client-frame-runtime-realtime-realtime-src-mq3-client-frame-ml-1144298339"></a>
### realtime

```ml
realtime
```

Accumulated client runtime clock in milliseconds, advanced by each frame duration and used for networking and timeouts.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L64)

<a id="field-field-mq3-client-frame-runtime-running-running-src-mq3-client-frame-ml-1784556097"></a>
### running

```ml
running
```

When constructing this record, `runtime` supplies `0` for this member. Used by `run` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L34)

<a id="field-field-mq3-client-frame-runtime-serverpaused-serverpaused-src-mq3-client-frame-ml-1827023199"></a>
### serverPaused

```ml
serverPaused
```

When constructing this record, `runtime` supplies `0` for this member. Used by `checkTimeout` and `run` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L73)

<a id="field-field-mq3-client-frame-runtime-serverrunning-serverrunning-src-mq3-client-frame-ml-1448503661"></a>
### serverRunning

```ml
serverRunning
```

True when a local game server is running in the same engine instance.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L44)

<a id="field-field-mq3-client-frame-runtime-state-state-src-mq3-client-frame-ml-179187009"></a>
### state

```ml
state
```

When constructing this record, `runtime` supplies `CA_DISCONNECTED` for this member. Used by `checkUserinfo` and `checkTimeout` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L40)

<a id="field-field-mq3-client-frame-runtime-timegraph-timegraph-src-mq3-client-frame-ml-245379893"></a>
### timeGraph

```ml
timeGraph
```

When constructing this record, `runtime` supplies `0` for this member. Used by `run` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L56)

<a id="field-field-mq3-client-frame-runtime-timeoutcount-timeoutcount-src-mq3-client-frame-ml-371866061"></a>
### timeoutCount

```ml
timeoutCount
```

When constructing this record, `runtime` supplies `0` for this member. Used by `checkTimeout` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L84)

<a id="field-field-mq3-client-frame-runtime-timeoutseconds-timeoutseconds-src-mq3-client-frame-ml-1863885537"></a>
### timeoutSeconds

```ml
timeoutSeconds
```

When constructing this record, `runtime` supplies `30.0` for this member. Used by `checkTimeout` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L81)

<a id="field-field-mq3-client-frame-runtime-timescale-timescale-src-mq3-client-frame-ml-46034033"></a>
### timeScale

```ml
timeScale
```

When constructing this record, `runtime` supplies `1.0` for this member. Used by `run` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/frame.ml#L53)
