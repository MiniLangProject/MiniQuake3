# `mq3.server.abi.Server`

[Home](README.md) · [Source file](File-src-mq3-server-abi-ml-141226179.md)

<a id="struct-struct-mq3-server-abi-server-struct-server-src-mq3-server-abi-ml-1178970491"></a>
## Server

```ml
struct Server
```

Server record for server.abi, containing `state`, `restarting`, `serverId`, `restartedServerId`, `checksumFeed`, `checksumFeedServerId`, and 13 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L169)

## Members

<a id="field-field-mq3-server-abi-server-checksumfeed-checksumfeed-src-mq3-server-abi-ml-1901279116"></a>
### checksumFeed

```ml
checksumFeed
```

Server-supplied feed value used to calculate pure-package checksums.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L179)

<a id="field-field-mq3-server-abi-server-checksumfeedserverid-checksumfeedserverid-src-mq3-server-abi-ml-2058962664"></a>
### checksumFeedServerId

```ml
checksumFeedServerId
```

Server identifier associated with the current checksum feed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L181)

<a id="field-field-mq3-server-abi-server-configstrings-configstrings-src-mq3-server-abi-ml-122747910"></a>
### configstrings

```ml
configstrings
```

Server configuration strings indexed by their protocol slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L191)

<a id="field-field-mq3-server-abi-server-entityparsepoint-entityparsepoint-src-mq3-server-abi-ml-1030491726"></a>
### entityParsePoint

```ml
entityParsePoint
```

Current position in the map entity text supplied to the game VM.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L195)

<a id="field-field-mq3-server-abi-server-gameclients-gameclients-src-mq3-server-abi-ml-1638198558"></a>
### gameClients

```ml
gameClients
```

Game-VM client records associated with the server client slots.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L203)

<a id="field-field-mq3-server-abi-server-gameclientsize-gameclientsize-src-mq3-server-abi-ml-1954683910"></a>
### gameClientSize

```ml
gameClientSize
```

Will be > sizeof(playerState_t) due to game private data.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L205)

<a id="field-field-mq3-server-abi-server-gentities-gentities-src-mq3-server-abi-ml-487272254"></a>
### gentities

```ml
gentities
```

Game-VM entity array exposed to server-side collision and snapshot code.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L197)

<a id="field-field-mq3-server-abi-server-gentitysize-gentitysize-src-mq3-server-abi-ml-1820948570"></a>
### gentitySize

```ml
gentitySize
```

Byte stride between game-VM entity records.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L199)

<a id="field-field-mq3-server-abi-server-models-models-src-mq3-server-abi-ml-191175198"></a>
### models

```ml
models
```

Submodel records associated with the loaded map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L189)

<a id="field-field-mq3-server-abi-server-nextframetime-nextframetime-src-mq3-server-abi-ml-1230489166"></a>
### nextFrameTime

```ml
nextFrameTime
```

When time > nextFrameTime, process world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L187)

<a id="field-field-mq3-server-abi-server-numentities-numentities-src-mq3-server-abi-ml-2020870402"></a>
### numEntities

```ml
numEntities
```

Number of entity records currently represented by this state or snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L201)

<a id="field-field-mq3-server-abi-server-restartedserverid-restartedserverid-src-mq3-server-abi-ml-398491170"></a>
### restartedServerId

```ml
restartedServerId
```

Server identifier retained from before the latest map restart.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L177)

<a id="field-field-mq3-server-abi-server-restarting-restarting-src-mq3-server-abi-ml-1992973592"></a>
### restarting

```ml
restarting
```

True while the server performs an in-place map restart.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L173)

<a id="field-field-mq3-server-abi-server-restarttime-restarttime-src-mq3-server-abi-ml-1823919166"></a>
### restartTime

```ml
restartTime
```

Scheduled time for restarting the current map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L207)

<a id="field-field-mq3-server-abi-server-serverid-serverid-src-mq3-server-abi-ml-1242565742"></a>
### serverId

```ml
serverId
```

Identifier distinguishing the current server or map session.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L175)

<a id="field-field-mq3-server-abi-server-snapshotcounter-snapshotcounter-src-mq3-server-abi-ml-2027960302"></a>
### snapshotCounter

```ml
snapshotCounter
```

Generation marker used to avoid adding an entity twice to one snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L183)

<a id="field-field-mq3-server-abi-server-state-state-src-mq3-server-abi-ml-495089354"></a>
### state

```ml
state
```

Server lifecycle state selecting dead, loading, or active gameplay.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L171)

<a id="field-field-mq3-server-abi-server-sventities-sventities-src-mq3-server-abi-ml-954884638"></a>
### svEntities

```ml
svEntities
```

Server-owned visibility and collision bookkeeping for game entities.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L193)

<a id="field-field-mq3-server-abi-server-timeresidual-timeresidual-src-mq3-server-abi-ml-1343644398"></a>
### timeResidual

```ml
timeResidual
```

Unconsumed elapsed milliseconds carried into the next server simulation frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L185)
