# `mq3.client.client_main.Lifecycle`

[Home](README.md) · [Source file](File-src-mq3-client-client-main-ml-798872826.md)

<a id="struct-struct-mq3-client-client-main-lifecycle-struct-lifecycle-src-mq3-client-client-main-ml-1196627113"></a>
## Lifecycle

```ml
struct Lifecycle
```

Stores client main lifecycle record, including `initialized`, `state`, `renderer`, `sound`, `hunk`, `realtime` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L169)

## Members

<a id="field-field-mq3-client-client-main-lifecycle-cgamestarted-cgamestarted-src-mq3-client-client-main-ml-253121285"></a>
### cgameStarted

```ml
cgameStarted
```

When constructing this record, `create` supplies `false` for this member. Used by `CL_Vid_Restart_f` and `CL_ShutdownAll` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L203)

<a id="field-field-mq3-client-client-main-lifecycle-connectpacketcount-connectpacketcount-src-mq3-client-client-main-ml-1986503999"></a>
### connectPacketCount

```ml
connectPacketCount
```

Number of connection-handshake packets sent, also used by progress displays.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L207)

<a id="field-field-mq3-client-client-main-lifecycle-connecttime-connecttime-src-mq3-client-client-main-ml-345236641"></a>
### connectTime

```ml
connectTime
```

Timestamp of the most recent connection attempt or handshake retransmission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L205)

<a id="field-field-mq3-client-client-main-lifecycle-framecount-framecount-src-mq3-client-client-main-ml-488425609"></a>
### framecount

```ml
framecount
```

When constructing this record, `create` supplies `0` for this member. Used by `CL_Frame` and `packets` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L187)

<a id="field-field-mq3-client-client-main-lifecycle-hunk-hunk-src-mq3-client-client-main-ml-333917461"></a>
### hunk

```ml
hunk
```

When constructing this record, `create` supplies `false` for this member. Used by `CL_StartHunkUsers` and `CL_Vid_Restart_f` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L181)

<a id="field-field-mq3-client-client-main-lifecycle-initialized-initialized-src-mq3-client-client-main-ml-560689137"></a>
### initialized

```ml
initialized
```

True between client startup and shutdown; guards duplicate lifecycle initialization and teardown.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L171)

<a id="field-field-mq3-client-client-main-lifecycle-lastpackettime-lastpackettime-src-mq3-client-client-main-ml-1583598499"></a>
### lastPacketTime

```ml
lastPacketTime
```

Client timestamp of the latest received server packet, used to detect timeouts.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L189)

<a id="field-field-mq3-client-client-main-lifecycle-realtime-realtime-src-mq3-client-client-main-ml-1396662407"></a>
### realtime

```ml
realtime
```

Local client lifecycle clock in milliseconds used by networking, demo playback, and fallback time queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L184)

<a id="field-field-mq3-client-client-main-lifecycle-renderer-renderer-src-mq3-client-client-main-ml-235230003"></a>
### renderer

```ml
renderer
```

Renderer implementation name reported by the graphics driver.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L176)

<a id="field-field-mq3-client-client-main-lifecycle-serverrunning-serverrunning-src-mq3-client-client-main-ml-432683697"></a>
### serverRunning

```ml
serverRunning
```

True when a local game server is running in the same engine instance.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L197)

<a id="field-field-mq3-client-client-main-lifecycle-sound-sound-src-mq3-client-client-main-ml-159056557"></a>
### sound

```ml
sound
```

True while the client sound subsystem is initialized; cleared during sound shutdown or restart.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L178)

<a id="field-field-mq3-client-client-main-lifecycle-state-state-src-mq3-client-client-main-ml-1560163573"></a>
### state

```ml
state
```

When constructing this record, `create` supplies `CA_UNINITIALIZED` for this member. Used by `CL_Record_f` and `CL_PlayDemo_f` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L174)

<a id="field-field-mq3-client-client-main-lifecycle-timeoutcount-timeoutcount-src-mq3-client-client-main-ml-2068002641"></a>
### timeoutCount

```ml
timeoutCount
```

When constructing this record, `create` supplies `0` for this member. Used by `CL_ClearState` and `CL_CheckTimeout` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L192)

<a id="field-field-mq3-client-client-main-lifecycle-timeoutseconds-timeoutseconds-src-mq3-client-client-main-ml-64628917"></a>
### timeoutSeconds

```ml
timeoutSeconds
```

When constructing this record, `create` supplies `30` for this member. Used by `CL_CheckTimeout` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L195)

<a id="field-field-mq3-client-client-main-lifecycle-uistarted-uistarted-src-mq3-client-client-main-ml-843402665"></a>
### uiStarted

```ml
uiStarted
```

When constructing this record, `create` supplies `false` for this member. Used by `CL_Vid_Restart_f` and `CL_ShutdownAll` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_main.ml#L200)
