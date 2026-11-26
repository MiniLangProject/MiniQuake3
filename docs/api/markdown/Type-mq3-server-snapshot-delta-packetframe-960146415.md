# `mq3.server.snapshot_delta.PacketFrame`

[Home](README.md) · [Source file](File-src-mq3-server-snapshot-delta-ml-942379398.md)

<a id="struct-struct-mq3-server-snapshot-delta-packetframe-struct-packetframe-src-mq3-server-snapshot-delta-ml-2045831521"></a>
## PacketFrame

```ml
struct PacketFrame
```

PacketFrame record for server.snapshot_delta, containing `firstEntity`, `numEntities`, `areaBits`, `playerState`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_delta.ml#L31)

## Members

<a id="field-field-mq3-server-snapshot-delta-packetframe-areabits-areabits-src-mq3-server-snapshot-delta-ml-1935560480"></a>
### areaBits

```ml
areaBits
```

Bitset of map areas visible in this snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_delta.ml#L37)

<a id="field-field-mq3-server-snapshot-delta-packetframe-firstentity-firstentity-src-mq3-server-snapshot-delta-ml-565407850"></a>
### firstEntity

```ml
firstEntity
```

First entity-state position for this snapshot in the shared circular snapshot buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_delta.ml#L33)

<a id="field-field-mq3-server-snapshot-delta-packetframe-numentities-numentities-src-mq3-server-snapshot-delta-ml-831295570"></a>
### numEntities

```ml
numEntities
```

Number of entity records currently represented by this state or snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_delta.ml#L35)

<a id="field-field-mq3-server-snapshot-delta-packetframe-playerstate-playerstate-src-mq3-server-snapshot-delta-ml-989661990"></a>
### playerState

```ml
playerState
```

Authoritative player-state record used for snapshots and game simulation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_delta.ml#L39)
