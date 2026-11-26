# `mq3.server.snapshot_send.Server`

[Home](README.md) · [Source file](File-src-mq3-server-snapshot-send-ml-704467576.md)

<a id="struct-struct-mq3-server-snapshot-send-server-struct-server-src-mq3-server-snapshot-send-ml-975667203"></a>
## Server

```ml
struct Server
```

Server record for server.snapshot_send, containing `time`, `snapFlagServerBit`, `snapshotEntities`, `snapshotCapacity`, `nextSnapshotEntities`, `baselines`, and 3 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_send.ml#L96)

## Members

<a id="field-field-mq3-server-snapshot-send-server-baselines-baselines-src-mq3-server-snapshot-send-ml-1076900846"></a>
### baselines

```ml
baselines
```

Baseline entity states used as initial references for delta compression.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_send.ml#L109)

<a id="field-field-mq3-server-snapshot-send-server-lanforcerate-lanforcerate-src-mq3-server-snapshot-send-ml-118885926"></a>
### lanForceRate

```ml
lanForceRate
```

True when LAN clients bypass the normal rate limit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_send.ml#L115)

<a id="field-field-mq3-server-snapshot-send-server-maxrate-maxrate-src-mq3-server-snapshot-send-ml-1696907554"></a>
### maxRate

```ml
maxRate
```

Upper bound on the client transmission rate, in bytes per second.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_send.ml#L113)

<a id="field-field-mq3-server-snapshot-send-server-nextsnapshotentities-nextsnapshotentities-src-mq3-server-snapshot-send-ml-305596094"></a>
### nextSnapshotEntities

```ml
nextSnapshotEntities
```

Next absolute insertion position in the circular snapshot-entity buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_send.ml#L107)

<a id="field-field-mq3-server-snapshot-send-server-padpackets-padpackets-src-mq3-server-snapshot-send-ml-819215558"></a>
### padPackets

```ml
padPackets
```

Additional padding requested for outgoing snapshot messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_send.ml#L111)

<a id="field-field-mq3-server-snapshot-send-server-snapflagserverbit-snapflagserverbit-src-mq3-server-snapshot-send-ml-986192210"></a>
### snapFlagServerBit

```ml
snapFlagServerBit
```

Snapshot server-count bit toggled when a new server level is spawned.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_send.ml#L101)

<a id="field-field-mq3-server-snapshot-send-server-snapshotcapacity-snapshotcapacity-src-mq3-server-snapshot-send-ml-1038474894"></a>
### snapshotCapacity

```ml
snapshotCapacity
```

Number of entity states retained for snapshot delta references.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_send.ml#L105)

<a id="field-field-mq3-server-snapshot-send-server-snapshotentities-snapshotentities-src-mq3-server-snapshot-send-ml-1317456256"></a>
### snapshotEntities

```ml
snapshotEntities
```

Entity states retained in the server snapshot ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_send.ml#L103)

<a id="field-field-mq3-server-snapshot-send-server-time-time-src-mq3-server-snapshot-send-ml-1325268956"></a>
### time

```ml
time
```

Server simulation time written into outgoing snapshots and used to schedule sends, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_send.ml#L99)
