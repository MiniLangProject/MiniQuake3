# `mq3.server.snapshot_delta.SnapshotFrame`

[Home](README.md) · [Source file](File-src-mq3-server-snapshot-delta-ml-942379398.md)

<a id="struct-struct-mq3-server-snapshot-delta-snapshotframe-struct-snapshotframe-src-mq3-server-snapshot-delta-ml-1944159921"></a>
## SnapshotFrame

```ml
struct SnapshotFrame
```

SnapshotFrame record for server.snapshot_delta, containing `firstEntity`, `numEntities`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_delta.ml#L16)

## Members

<a id="field-field-mq3-server-snapshot-delta-snapshotframe-firstentity-firstentity-src-mq3-server-snapshot-delta-ml-1883236030"></a>
### firstEntity

```ml
firstEntity
```

First entity-state position for this snapshot in the shared circular snapshot buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_delta.ml#L18)

<a id="field-field-mq3-server-snapshot-delta-snapshotframe-numentities-numentities-src-mq3-server-snapshot-delta-ml-149316630"></a>
### numEntities

```ml
numEntities
```

Number of entity records currently represented by this state or snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_delta.ml#L20)
