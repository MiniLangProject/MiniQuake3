# `mq3.server.snapshot_build.Frame`

[Home](README.md) · [Source file](File-src-mq3-server-snapshot-build-ml-2050633468.md)

<a id="struct-struct-mq3-server-snapshot-build-frame-struct-frame-src-mq3-server-snapshot-build-ml-479400101"></a>
## Frame

```ml
struct Frame
```

Frame record for server.snapshot_build, containing `areaBytes`, `areaBits`, `playerState`, `numEntities`, `firstEntity`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L85)

## Members

<a id="field-field-mq3-server-snapshot-build-frame-areabits-areabits-src-mq3-server-snapshot-build-ml-125186912"></a>
### areaBits

```ml
areaBits
```

Bitset of map areas visible in this snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L89)

<a id="field-field-mq3-server-snapshot-build-frame-areabytes-areabytes-src-mq3-server-snapshot-build-ml-701915518"></a>
### areaBytes

```ml
areaBytes
```

Number of valid bytes in the snapshot's area-visibility mask.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L87)

<a id="field-field-mq3-server-snapshot-build-frame-firstentity-firstentity-src-mq3-server-snapshot-build-ml-1276696406"></a>
### firstEntity

```ml
firstEntity
```

First entity-state position for this snapshot in the shared circular snapshot buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L95)

<a id="field-field-mq3-server-snapshot-build-frame-numentities-numentities-src-mq3-server-snapshot-build-ml-2044293774"></a>
### numEntities

```ml
numEntities
```

Number of entity records currently represented by this state or snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L93)

<a id="field-field-mq3-server-snapshot-build-frame-playerstate-playerstate-src-mq3-server-snapshot-build-ml-220371738"></a>
### playerState

```ml
playerState
```

Authoritative player-state record used for snapshots and game simulation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/snapshot_build.ml#L91)
