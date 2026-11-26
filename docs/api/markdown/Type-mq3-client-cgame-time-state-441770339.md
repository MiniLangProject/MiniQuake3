# `mq3.client.cgame_time.State`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-time-ml-148018170.md)

<a id="struct-struct-mq3-client-cgame-time-state-struct-state-src-mq3-client-cgame-time-ml-1456095809"></a>
## State

```ml
struct State
```

Stores client game time state, including `host`, `connectionState`, `realtime`, `snapValid`, `snapFlags`, `snapServerTime` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L14)

## Members

<a id="field-field-mq3-client-cgame-time-state-activeaction-activeaction-src-mq3-client-cgame-time-ml-1117531154"></a>
### activeAction

```ml
activeAction
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L39)

<a id="field-field-mq3-client-cgame-time-state-clientpaused-clientpaused-src-mq3-client-cgame-time-ml-1527428256"></a>
### clientPaused

```ml
clientPaused
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L37)

<a id="field-field-mq3-client-cgame-time-state-connectionstate-connectionstate-src-mq3-client-cgame-time-ml-119836674"></a>
### connectionState

```ml
connectionState
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L16)

<a id="field-field-mq3-client-cgame-time-state-demoplaying-demoplaying-src-mq3-client-cgame-time-ml-804751630"></a>
### demoPlaying

```ml
demoPlaying
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L27)

<a id="field-field-mq3-client-cgame-time-state-extrapolatedsnapshot-extrapolatedsnapshot-src-mq3-client-cgame-time-ml-2015535492"></a>
### extrapolatedSnapshot

```ml
extrapolatedSnapshot
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L22)

<a id="field-field-mq3-client-cgame-time-state-firstdemoframeskipped-firstdemoframeskipped-src-mq3-client-cgame-time-ml-1663516690"></a>
### firstDemoFrameSkipped

```ml
firstDemoFrameSkipped
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L28)

<a id="field-field-mq3-client-cgame-time-state-freezedemo-freezedemo-src-mq3-client-cgame-time-ml-1614583874"></a>
### freezeDemo

```ml
freezeDemo
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L29)

<a id="field-field-mq3-client-cgame-time-state-host-host-src-mq3-client-cgame-time-ml-1374503318"></a>
### host

```ml
host
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L15)

<a id="field-field-mq3-client-cgame-time-state-newsnapshots-newsnapshots-src-mq3-client-cgame-time-ml-1097736736"></a>
### newSnapshots

```ml
newSnapshots
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L21)

<a id="field-field-mq3-client-cgame-time-state-oldframeservertime-oldframeservertime-src-mq3-client-cgame-time-ml-413626274"></a>
### oldFrameServerTime

```ml
oldFrameServerTime
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L26)

<a id="field-field-mq3-client-cgame-time-state-oldservertime-oldservertime-src-mq3-client-cgame-time-ml-620493078"></a>
### oldServerTime

```ml
oldServerTime
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L24)

<a id="field-field-mq3-client-cgame-time-state-realtime-realtime-src-mq3-client-cgame-time-ml-1983582276"></a>
### realtime

```ml
realtime
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L17)

<a id="field-field-mq3-client-cgame-time-state-serverpaused-serverpaused-src-mq3-client-cgame-time-ml-999480240"></a>
### serverPaused

```ml
serverPaused
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L36)

<a id="field-field-mq3-client-cgame-time-state-serverrunning-serverrunning-src-mq3-client-cgame-time-ml-909301834"></a>
### serverRunning

```ml
serverRunning
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L35)

<a id="field-field-mq3-client-cgame-time-state-servertime-servertime-src-mq3-client-cgame-time-ml-1419930686"></a>
### serverTime

```ml
serverTime
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L25)

<a id="field-field-mq3-client-cgame-time-state-servertimedelta-servertimedelta-src-mq3-client-cgame-time-ml-1331608634"></a>
### serverTimeDelta

```ml
serverTimeDelta
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L23)

<a id="field-field-mq3-client-cgame-time-state-snapflags-snapflags-src-mq3-client-cgame-time-ml-937188118"></a>
### snapFlags

```ml
snapFlags
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L19)

<a id="field-field-mq3-client-cgame-time-state-snapservertime-snapservertime-src-mq3-client-cgame-time-ml-1662353814"></a>
### snapServerTime

```ml
snapServerTime
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L20)

<a id="field-field-mq3-client-cgame-time-state-snapvalid-snapvalid-src-mq3-client-cgame-time-ml-2069637482"></a>
### snapValid

```ml
snapValid
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L18)

<a id="field-field-mq3-client-cgame-time-state-timedemo-timedemo-src-mq3-client-cgame-time-ml-1622416882"></a>
### timedemo

```ml
timedemo
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L30)

<a id="field-field-mq3-client-cgame-time-state-timedemobasetime-timedemobasetime-src-mq3-client-cgame-time-ml-1845914050"></a>
### timeDemoBaseTime

```ml
timeDemoBaseTime
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L33)

<a id="field-field-mq3-client-cgame-time-state-timedemoframes-timedemoframes-src-mq3-client-cgame-time-ml-2145766770"></a>
### timeDemoFrames

```ml
timeDemoFrames
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L32)

<a id="field-field-mq3-client-cgame-time-state-timedemostart-timedemostart-src-mq3-client-cgame-time-ml-827264290"></a>
### timeDemoStart

```ml
timeDemoStart
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L31)

<a id="field-field-mq3-client-cgame-time-state-timenudge-timenudge-src-mq3-client-cgame-time-ml-1613216882"></a>
### timeNudge

```ml
timeNudge
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L34)

<a id="field-field-mq3-client-cgame-time-state-timescale-timescale-src-mq3-client-cgame-time-ml-1100073974"></a>
### timescale

```ml
timescale
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_time.ml#L38)
