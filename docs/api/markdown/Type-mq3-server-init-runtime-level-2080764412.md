# `mq3.server.init_runtime.Level`

[Home](README.md) · [Source file](File-src-mq3-server-init-runtime-ml-863108862.md)

<a id="struct-struct-mq3-server-init-runtime-level-struct-level-src-mq3-server-init-runtime-ml-1582173371"></a>
## Level

```ml
struct Level
```

Level record for server.init_runtime, containing `state`, `restarting`, `configstrings`, `entities`, `baselines`, `numEntities`, and 6 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L93)

## Members

<a id="field-field-mq3-server-init-runtime-level-baselines-baselines-src-mq3-server-init-runtime-ml-1069670483"></a>
### baselines

```ml
baselines
```

Baseline entity states used as initial references for delta compression.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L103)

<a id="field-field-mq3-server-init-runtime-level-checksumfeed-checksumfeed-src-mq3-server-init-runtime-ml-1450855305"></a>
### checksumFeed

```ml
checksumFeed
```

Server-supplied feed value used to calculate pure-package checksums.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L107)

<a id="field-field-mq3-server-init-runtime-level-checksumfeedserverid-checksumfeedserverid-src-mq3-server-init-runtime-ml-1999001453"></a>
### checksumFeedServerId

```ml
checksumFeedServerId
```

Server identifier associated with the current checksum feed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L113)

<a id="field-field-mq3-server-init-runtime-level-configstrings-configstrings-src-mq3-server-init-runtime-ml-1881572587"></a>
### configstrings

```ml
configstrings
```

Server configuration strings indexed by their protocol slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L99)

<a id="field-field-mq3-server-init-runtime-level-entities-entities-src-mq3-server-init-runtime-ml-1480531401"></a>
### entities

```ml
entities
```

Game or BSP entity records tracked by this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L101)

<a id="field-field-mq3-server-init-runtime-level-mapchecksum-mapchecksum-src-mq3-server-init-runtime-ml-1117698379"></a>
### mapChecksum

```ml
mapChecksum
```

Checksum of the currently loaded BSP map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L115)

<a id="field-field-mq3-server-init-runtime-level-mapname-mapname-src-mq3-server-init-runtime-ml-1525179323"></a>
### mapname

```ml
mapname
```

Name of the current game map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L117)

<a id="field-field-mq3-server-init-runtime-level-numentities-numentities-src-mq3-server-init-runtime-ml-591145391"></a>
### numEntities

```ml
numEntities
```

Number of entity records currently represented by this state or snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L105)

<a id="field-field-mq3-server-init-runtime-level-restartedserverid-restartedserverid-src-mq3-server-init-runtime-ml-923432679"></a>
### restartedServerId

```ml
restartedServerId
```

Server identifier retained from before the latest map restart.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L111)

<a id="field-field-mq3-server-init-runtime-level-restarting-restarting-src-mq3-server-init-runtime-ml-1925379717"></a>
### restarting

```ml
restarting
```

True while the server performs an in-place map restart.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L97)

<a id="field-field-mq3-server-init-runtime-level-serverid-serverid-src-mq3-server-init-runtime-ml-2120968051"></a>
### serverId

```ml
serverId
```

Identifier distinguishing the current server or map session.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L109)

<a id="field-field-mq3-server-init-runtime-level-state-state-src-mq3-server-init-runtime-ml-605814975"></a>
### state

```ml
state
```

Server lifecycle state selecting dead, loading, or active gameplay.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L95)
