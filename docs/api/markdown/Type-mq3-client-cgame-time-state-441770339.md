# `mq3.client.cgame_time.State`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-time-ml-148018170.md)

<a id="struct-struct-mq3-client-cgame-time-state-struct-state-src-mq3-client-cgame-time-ml-1456095809"></a>
## State

```ml
struct State
```

Stores client game time state, including `host`, `connectionState`, `realtime`, `snapValid`, `snapFlags`, `snapServerTime` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L41)

## Members

<a id="field-field-mq3-client-cgame-time-state-activeaction-activeaction-src-mq3-client-cgame-time-ml-1117531154"></a>
### activeAction

```ml
activeAction
```

When constructing this record, `create` supplies an empty string for this member. Used by `firstSnapshot` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L102)

<a id="field-field-mq3-client-cgame-time-state-clientpaused-clientpaused-src-mq3-client-cgame-time-ml-1527428256"></a>
### clientPaused

```ml
clientPaused
```

When constructing this record, `create` supplies `false` for this member. Used by `setCGameTime` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L96)

<a id="field-field-mq3-client-cgame-time-state-connectionstate-connectionstate-src-mq3-client-cgame-time-ml-119836674"></a>
### connectionState

```ml
connectionState
```

Client connection-state identifier controlling handshake, loading, and active-play behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L45)

<a id="field-field-mq3-client-cgame-time-state-demoplaying-demoplaying-src-mq3-client-cgame-time-ml-804751630"></a>
### demoPlaying

```ml
demoPlaying
```

True while the client receives its game data from a recorded demo.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L70)

<a id="field-field-mq3-client-cgame-time-state-extrapolatedsnapshot-extrapolatedsnapshot-src-mq3-client-cgame-time-ml-2015535492"></a>
### extrapolatedSnapshot

```ml
extrapolatedSnapshot
```

True when a CGame frame had to extrapolate beyond the newest available snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L59)

<a id="field-field-mq3-client-cgame-time-state-firstdemoframeskipped-firstdemoframeskipped-src-mq3-client-cgame-time-ml-1663516690"></a>
### firstDemoFrameSkipped

```ml
firstDemoFrameSkipped
```

When constructing this record, `create` supplies `false` for this member. Used by `setCGameTime` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L73)

<a id="field-field-mq3-client-cgame-time-state-freezedemo-freezedemo-src-mq3-client-cgame-time-ml-1614583874"></a>
### freezeDemo

```ml
freezeDemo
```

When constructing this record, `create` supplies `false` for this member. Used by `setCGameTime` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L76)

<a id="field-field-mq3-client-cgame-time-state-host-host-src-mq3-client-cgame-time-ml-1374503318"></a>
### host

```ml
host
```

Host-adapter callbacks and context used to execute the module's engine operations.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L43)

<a id="field-field-mq3-client-cgame-time-state-newsnapshots-newsnapshots-src-mq3-client-cgame-time-ml-1097736736"></a>
### newSnapshots

```ml
newSnapshots
```

True after parsing a new valid snapshot that has not yet been consumed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L57)

<a id="field-field-mq3-client-cgame-time-state-oldframeservertime-oldframeservertime-src-mq3-client-cgame-time-ml-413626274"></a>
### oldFrameServerTime

```ml
oldFrameServerTime
```

Server time from the preceding rendered frame, used to recognize restart discontinuities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L68)

<a id="field-field-mq3-client-cgame-time-state-oldservertime-oldservertime-src-mq3-client-cgame-time-ml-620493078"></a>
### oldServerTime

```ml
oldServerTime
```

Previous client estimate of server time, retained to prevent time from moving backward.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L63)

<a id="field-field-mq3-client-cgame-time-state-realtime-realtime-src-mq3-client-cgame-time-ml-1983582276"></a>
### realtime

```ml
realtime
```

Local client clock in milliseconds used to estimate the server-time offset and presentation time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L47)

<a id="field-field-mq3-client-cgame-time-state-serverpaused-serverpaused-src-mq3-client-cgame-time-ml-999480240"></a>
### serverPaused

```ml
serverPaused
```

When constructing this record, `create` supplies `false` for this member. Used by `setCGameTime` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L93)

<a id="field-field-mq3-client-cgame-time-state-serverrunning-serverrunning-src-mq3-client-cgame-time-ml-909301834"></a>
### serverRunning

```ml
serverRunning
```

True when a local game server is running in the same engine instance.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L90)

<a id="field-field-mq3-client-cgame-time-state-servertime-servertime-src-mq3-client-cgame-time-ml-1419930686"></a>
### serverTime

```ml
serverTime
```

Synchronized client presentation time for server state, in milliseconds, after time-offset and nudge adjustment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L66)

<a id="field-field-mq3-client-cgame-time-state-servertimedelta-servertimedelta-src-mq3-client-cgame-time-ml-1331608634"></a>
### serverTimeDelta

```ml
serverTimeDelta
```

Offset added to client realtime to estimate current server time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L61)

<a id="field-field-mq3-client-cgame-time-state-snapflags-snapflags-src-mq3-client-cgame-time-ml-937188118"></a>
### snapFlags

```ml
snapFlags
```

Snapshot flags describing rate delay and dropped-command conditions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L52)

<a id="field-field-mq3-client-cgame-time-state-snapservertime-snapservertime-src-mq3-client-cgame-time-ml-1662353814"></a>
### snapServerTime

```ml
snapServerTime
```

When constructing this record, `create` supplies `0` for this member. Used by `adjustTimeDelta` and `firstSnapshot` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L55)

<a id="field-field-mq3-client-cgame-time-state-snapvalid-snapvalid-src-mq3-client-cgame-time-ml-2069637482"></a>
### snapValid

```ml
snapValid
```

When constructing this record, `create` supplies `false` for this member. Used by `setCGameTime` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L50)

<a id="field-field-mq3-client-cgame-time-state-timedemo-timedemo-src-mq3-client-cgame-time-ml-1622416882"></a>
### timedemo

```ml
timedemo
```

When constructing this record, `create` supplies `false` for this member. Used by `setCGameTime` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L79)

<a id="field-field-mq3-client-cgame-time-state-timedemobasetime-timedemobasetime-src-mq3-client-cgame-time-ml-1845914050"></a>
### timeDemoBaseTime

```ml
timeDemoBaseTime
```

Base server time from which fixed-step timed-demo frames are calculated.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L85)

<a id="field-field-mq3-client-cgame-time-state-timedemoframes-timedemoframes-src-mq3-client-cgame-time-ml-2145766770"></a>
### timeDemoFrames

```ml
timeDemoFrames
```

Number of frames rendered during the timed-demo measurement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L83)

<a id="field-field-mq3-client-cgame-time-state-timedemostart-timedemostart-src-mq3-client-cgame-time-ml-827264290"></a>
### timeDemoStart

```ml
timeDemoStart
```

Client realtime timestamp at the beginning of the timed-demo measurement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L81)

<a id="field-field-mq3-client-cgame-time-state-timenudge-timenudge-src-mq3-client-cgame-time-ml-1613216882"></a>
### timeNudge

```ml
timeNudge
```

When constructing this record, `create` supplies `0` for this member. Used by `setCGameTime` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L88)

<a id="field-field-mq3-client-cgame-time-state-timescale-timescale-src-mq3-client-cgame-time-ml-1100073974"></a>
### timescale

```ml
timescale
```

When constructing this record, `create` supplies `1.0` for this member. Used by `adjustTimeDelta` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L99)
