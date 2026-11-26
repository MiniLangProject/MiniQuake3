# `mq3.server.init_runtime.Static`

[Home](README.md) · [Source file](File-src-mq3-server-init-runtime-ml-863108862.md)

<a id="struct-struct-mq3-server-init-runtime-static-struct-static-src-mq3-server-init-runtime-ml-1872896617"></a>
## Static

```ml
struct Static
```

Static record for server.init_runtime, containing `initialized`, `clients`, `numSnapshotEntities`, `snapshotEntities`, `nextSnapshotEntities`, `snapFlagServerBit`, and 1 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L127)

## Members

<a id="field-field-mq3-server-init-runtime-static-clients-clients-src-mq3-server-init-runtime-ml-774939215"></a>
### clients

```ml
clients
```

Persistent client records allocated at server startup and retained across map changes.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L131)

<a id="field-field-mq3-server-init-runtime-static-initialized-initialized-src-mq3-server-init-runtime-ml-1542305779"></a>
### initialized

```ml
initialized
```

True after persistent server client and snapshot storage has been allocated.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L129)

<a id="field-field-mq3-server-init-runtime-static-nextsnapshotentities-nextsnapshotentities-src-mq3-server-init-runtime-ml-1375935835"></a>
### nextSnapshotEntities

```ml
nextSnapshotEntities
```

Next absolute insertion position in the circular snapshot-entity buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L137)

<a id="field-field-mq3-server-init-runtime-static-numsnapshotentities-numsnapshotentities-src-mq3-server-init-runtime-ml-1696753323"></a>
### numSnapshotEntities

```ml
numSnapshotEntities
```

Number of entity-state slots reserved in the snapshot ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L133)

<a id="field-field-mq3-server-init-runtime-static-snapflagserverbit-snapflagserverbit-src-mq3-server-init-runtime-ml-1718528279"></a>
### snapFlagServerBit

```ml
snapFlagServerBit
```

Snapshot server-count bit toggled when a new server level is spawned.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L139)

<a id="field-field-mq3-server-init-runtime-static-snapshotentities-snapshotentities-src-mq3-server-init-runtime-ml-876367109"></a>
### snapshotEntities

```ml
snapshotEntities
```

Entity states retained in the server snapshot ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L135)

<a id="field-field-mq3-server-init-runtime-static-time-time-src-mq3-server-init-runtime-ml-1684806625"></a>
### time

```ml
time
```

Persistent server clock retained across level startup and restart, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L141)
