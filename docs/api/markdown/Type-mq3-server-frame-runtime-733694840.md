# `mq3.server.frame.Runtime`

[Home](README.md) · [Source file](File-src-mq3-server-frame-ml-1912753238.md)

<a id="struct-struct-mq3-server-frame-runtime-struct-runtime-src-mq3-server-frame-ml-401254069"></a>
## Runtime

```ml
struct Runtime
```

Runtime record for server.frame, containing `killServer`, `running`, `clPaused`, `svPaused`, `fps`, `dedicated`, and 14 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L21)

## Members

<a id="field-field-mq3-server-frame-runtime-clpaused-clpaused-src-mq3-server-frame-ml-866483811"></a>
### clPaused

```ml
clPaused
```

Current local-client pause setting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L27)

<a id="field-field-mq3-server-frame-runtime-dedicated-dedicated-src-mq3-server-frame-ml-1890850561"></a>
### dedicated

```ml
dedicated
```

True when the server runs without a local graphical client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L33)

<a id="field-field-mq3-server-frame-runtime-fps-fps-src-mq3-server-frame-ml-1549754497"></a>
### fps

```ml
fps
```

Requested server simulation frames per second.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L31)

<a id="field-field-mq3-server-frame-runtime-killserver-killserver-src-mq3-server-frame-ml-1834891159"></a>
### killServer

```ml
killServer
```

True when the current frame should shut down the server.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L23)

<a id="field-field-mq3-server-frame-runtime-maxrate-maxrate-src-mq3-server-frame-ml-2075699553"></a>
### maxRate

```ml
maxRate
```

Upper bound on the client transmission rate, in bytes per second.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L51)

<a id="field-field-mq3-server-frame-runtime-modifiedflags-modifiedflags-src-mq3-server-frame-ml-1449879725"></a>
### modifiedFlags

```ml
modifiedFlags
```

Bit mask of configuration-variable categories modified since the last clear.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L37)

<a id="field-field-mq3-server-frame-runtime-nextsnapshotentities-nextsnapshotentities-src-mq3-server-frame-ml-1696039125"></a>
### nextSnapshotEntities

```ml
nextSnapshotEntities
```

Next absolute insertion position in the circular snapshot-entity buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L47)

<a id="field-field-mq3-server-frame-runtime-numsnapshotentities-numsnapshotentities-src-mq3-server-frame-ml-882294245"></a>
### numSnapshotEntities

```ml
numSnapshotEntities
```

Number of entity-state slots reserved in the snapshot ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L49)

<a id="field-field-mq3-server-frame-runtime-pauseclients-pauseclients-src-mq3-server-frame-ml-1416178141"></a>
### pauseClients

```ml
pauseClients
```

Client records used to decide whether pausing is allowed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L53)

<a id="field-field-mq3-server-frame-runtime-pingclients-pingclients-src-mq3-server-frame-ml-1793034025"></a>
### pingClients

```ml
pingClients
```

Client acknowledgment histories used to update latency estimates.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L55)

<a id="field-field-mq3-server-frame-runtime-playerstates-playerstates-src-mq3-server-frame-ml-880815431"></a>
### playerStates

```ml
playerStates
```

Current game player-state records used by server frame processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L57)

<a id="field-field-mq3-server-frame-runtime-restarttime-restarttime-src-mq3-server-frame-ml-311304253"></a>
### restartTime

```ml
restartTime
```

Scheduled time for restarting the current map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L45)

<a id="field-field-mq3-server-frame-runtime-running-running-src-mq3-server-frame-ml-1043087993"></a>
### running

```ml
running
```

True while the server or represented subsystem is running.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L25)

<a id="field-field-mq3-server-frame-runtime-snapshotclients-snapshotclients-src-mq3-server-frame-ml-1865237937"></a>
### snapshotClients

```ml
snapshotClients
```

Client scheduling state used to send the next snapshots.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L61)

<a id="field-field-mq3-server-frame-runtime-speeds-speeds-src-mq3-server-frame-ml-1556700761"></a>
### speeds

```ml
speeds
```

True when detailed frame-timing diagnostics are enabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L35)

<a id="field-field-mq3-server-frame-runtime-svpaused-svpaused-src-mq3-server-frame-ml-1226873375"></a>
### svPaused

```ml
svPaused
```

Current server pause setting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L29)

<a id="field-field-mq3-server-frame-runtime-time-time-src-mq3-server-frame-ml-650902247"></a>
### time

```ml
time
```

Simulation clock advanced by completed server frames, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L43)

<a id="field-field-mq3-server-frame-runtime-timegame-timegame-src-mq3-server-frame-ml-1079699319"></a>
### timeGame

```ml
timeGame
```

Host execution time accumulated while running the game frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L39)

<a id="field-field-mq3-server-frame-runtime-timeoutstate-timeoutstate-src-mq3-server-frame-ml-641666185"></a>
### timeoutState

```ml
timeoutState
```

Client timeout state examined during the server frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L59)

<a id="field-field-mq3-server-frame-runtime-timeresidual-timeresidual-src-mq3-server-frame-ml-84098429"></a>
### timeResidual

```ml
timeResidual
```

Unconsumed elapsed milliseconds carried into the next server simulation frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/frame.ml#L41)
