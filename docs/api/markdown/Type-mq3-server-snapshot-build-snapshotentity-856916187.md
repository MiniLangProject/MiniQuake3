# `mq3.server.snapshot_build.SnapshotEntity`

[Home](README.md) · [Source file](File-src-mq3-server-snapshot-build-ml-2050633468.md)

<a id="struct-struct-mq3-server-snapshot-build-snapshotentity-struct-snapshotentity-src-mq3-server-snapshot-build-ml-1101376141"></a>
## SnapshotEntity

```ml
struct SnapshotEntity
```

SnapshotEntity record for server.snapshot_build, containing `state`, `linked`, `svFlags`, `singleClient`, `clusters`, `lastCluster`, and 3 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L49)

## Members

<a id="field-field-mq3-server-snapshot-build-snapshotentity-areanum-areanum-src-mq3-server-snapshot-build-ml-1170501348"></a>
### areaNum

```ml
areaNum
```

Primary collision-map area containing this entity, used for snapshot area visibility.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L63)

<a id="field-field-mq3-server-snapshot-build-snapshotentity-areanum2-areanum2-src-mq3-server-snapshot-build-ml-423691614"></a>
### areaNum2

```ml
areaNum2
```

Second AAS area number used by the operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L65)

<a id="field-field-mq3-server-snapshot-build-snapshotentity-clusters-clusters-src-mq3-server-snapshot-build-ml-1565640954"></a>
### clusters

```ml
clusters
```

Cluster records or assignments used to group navigation and visibility areas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L59)

<a id="field-field-mq3-server-snapshot-build-snapshotentity-lastcluster-lastcluster-src-mq3-server-snapshot-build-ml-299314860"></a>
### lastCluster

```ml
lastCluster
```

Final visibility cluster used when the explicit cluster list overflows.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L61)

<a id="field-field-mq3-server-snapshot-build-snapshotentity-linked-linked-src-mq3-server-snapshot-build-ml-1427265518"></a>
### linked

```ml
linked
```

True when this entity or resource is linked into the world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L53)

<a id="field-field-mq3-server-snapshot-build-snapshotentity-singleclient-singleclient-src-mq3-server-snapshot-build-ml-533266986"></a>
### singleClient

```ml
singleClient
```

Client number selected or excluded by the entity's single-client visibility flags.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L57)

<a id="field-field-mq3-server-snapshot-build-snapshotentity-snapshotcounter-snapshotcounter-src-mq3-server-snapshot-build-ml-576105900"></a>
### snapshotCounter

```ml
snapshotCounter
```

Generation marker used to avoid adding an entity twice to one snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L67)

<a id="field-field-mq3-server-snapshot-build-snapshotentity-state-state-src-mq3-server-snapshot-build-ml-2053197952"></a>
### state

```ml
state
```

Network entity-state payload considered for inclusion in a snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L51)

<a id="field-field-mq3-server-snapshot-build-snapshotentity-svflags-svflags-src-mq3-server-snapshot-build-ml-1722829656"></a>
### svFlags

```ml
svFlags
```

Server-side visibility and entity-behavior flags.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L55)
