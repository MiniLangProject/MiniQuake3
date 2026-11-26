# `mq3.server.snapshot_build.World`

[Home](README.md) · [Source file](File-src-mq3-server-snapshot-build-ml-2050633468.md)

<a id="struct-struct-mq3-server-snapshot-build-world-struct-world-src-mq3-server-snapshot-build-ml-999575843"></a>
## World

```ml
struct World
```

World record for server.snapshot_build, containing `active`, `snapshotCounter`, `entities`, `ring`, `ringCapacity`, `nextSnapshotEntities`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L70)

## Members

<a id="field-field-mq3-server-snapshot-build-world-active-active-src-mq3-server-snapshot-build-ml-287588069"></a>
### active

```ml
active
```

True while this entry participates in the active runtime.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L72)

<a id="field-field-mq3-server-snapshot-build-world-entities-entities-src-mq3-server-snapshot-build-ml-299091115"></a>
### entities

```ml
entities
```

Game or BSP entity records tracked by this subsystem.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L76)

<a id="field-field-mq3-server-snapshot-build-world-nextsnapshotentities-nextsnapshotentities-src-mq3-server-snapshot-build-ml-1670057821"></a>
### nextSnapshotEntities

```ml
nextSnapshotEntities
```

Next absolute insertion position in the circular snapshot-entity buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L82)

<a id="field-field-mq3-server-snapshot-build-world-ring-ring-src-mq3-server-snapshot-build-ml-314733749"></a>
### ring

```ml
ring
```

Circular storage retaining entity states referenced by sent snapshots.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L78)

<a id="field-field-mq3-server-snapshot-build-world-ringcapacity-ringcapacity-src-mq3-server-snapshot-build-ml-1366379389"></a>
### ringCapacity

```ml
ringCapacity
```

Number of entity-state slots in the snapshot ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L80)

<a id="field-field-mq3-server-snapshot-build-world-snapshotcounter-snapshotcounter-src-mq3-server-snapshot-build-ml-1948865013"></a>
### snapshotCounter

```ml
snapshotCounter
```

Generation marker used to avoid adding an entity twice to one snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L74)
