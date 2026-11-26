# `mq3.client.snapshot_command.Snapshot`

[Home](README.md) · [Source file](File-src-mq3-client-snapshot-command-ml-285373799.md)

<a id="struct-struct-mq3-client-snapshot-command-snapshot-struct-snapshot-src-mq3-client-snapshot-command-ml-760192775"></a>
## Snapshot

```ml
struct Snapshot
```

Stores snapshot command snapshot metadata and contents, including `valid`, `snapFlags`, `serverTime`, `messageNum`, `deltaNum`, `ping` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_command.ml#L30)

## Members

<a id="field-field-mq3-client-snapshot-command-snapshot-areamask-areamask-src-mq3-client-snapshot-command-ml-586409785"></a>
### areaMask

```ml
areaMask
```

Portal-area visibility bitset associated with the current snapshot or rendered view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_command.ml#L45)

<a id="field-field-mq3-client-snapshot-command-snapshot-deltanum-deltanum-src-mq3-client-snapshot-command-ml-2045946411"></a>
### deltaNum

```ml
deltaNum
```

Sequence number of the earlier message used as this snapshot's delta base.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_command.ml#L40)

<a id="field-field-mq3-client-snapshot-command-snapshot-messagenum-messagenum-src-mq3-client-snapshot-command-ml-1993140773"></a>
### messageNum

```ml
messageNum
```

Incoming network-message sequence number associated with the snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_command.ml#L38)

<a id="field-field-mq3-client-snapshot-command-snapshot-numentities-numentities-src-mq3-client-snapshot-command-ml-950602943"></a>
### numEntities

```ml
numEntities
```

Number of entity-state entries represented by the snapshot or scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_command.ml#L49)

<a id="field-field-mq3-client-snapshot-command-snapshot-parseentitiesnum-parseentitiesnum-src-mq3-client-snapshot-command-ml-1092583219"></a>
### parseEntitiesNum

```ml
parseEntitiesNum
```

Absolute position in the parsed-entity ring at which this snapshot's entities begin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_command.ml#L51)

<a id="field-field-mq3-client-snapshot-command-snapshot-ping-ping-src-mq3-client-snapshot-command-ml-609604659"></a>
### ping

```ml
ping
```

Snapshot latency in milliseconds, derived from acknowledged outgoing packets; 999 is used when no matching packet is found.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_command.ml#L43)

<a id="field-field-mq3-client-snapshot-command-snapshot-playerstate-playerstate-src-mq3-client-snapshot-command-ml-1238194163"></a>
### playerState

```ml
playerState
```

Player-state record associated with this client snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_command.ml#L47)

<a id="field-field-mq3-client-snapshot-command-snapshot-servercommandnum-servercommandnum-src-mq3-client-snapshot-command-ml-295603627"></a>
### serverCommandNum

```ml
serverCommandNum
```

Server-command sequence that must be executed before presenting this snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_command.ml#L53)

<a id="field-field-mq3-client-snapshot-command-snapshot-servertime-servertime-src-mq3-client-snapshot-command-ml-486250751"></a>
### serverTime

```ml
serverTime
```

Authoritative simulation timestamp in milliseconds decoded from the server snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_command.ml#L36)

<a id="field-field-mq3-client-snapshot-command-snapshot-snapflags-snapflags-src-mq3-client-snapshot-command-ml-893152343"></a>
### snapFlags

```ml
snapFlags
```

Snapshot flags describing rate delay and dropped-command conditions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_command.ml#L34)

<a id="field-field-mq3-client-snapshot-command-snapshot-valid-valid-src-mq3-client-snapshot-command-ml-422468819"></a>
### valid

```ml
valid
```

True when the stored data passed the validation required by its consumer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_command.ml#L32)
