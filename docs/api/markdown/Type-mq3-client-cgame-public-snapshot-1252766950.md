# `mq3.client.cgame_public.Snapshot`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-public-ml-173138442.md)

<a id="struct-struct-mq3-client-cgame-public-snapshot-struct-snapshot-src-mq3-client-cgame-public-ml-506269489"></a>
## Snapshot

```ml
struct Snapshot
```

Stores client game public snapshot metadata and contents, including `snapFlags`, `ping`, `serverTime`, `areamask`, `ps`, `numEntities` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L251)

## Members

<a id="field-field-mq3-client-cgame-public-snapshot-areamask-areamask-src-mq3-client-cgame-public-ml-539120783"></a>
### areamask

```ml
areamask
```

Portal-area visibility bitset associated with the current snapshot or rendered view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L260)

<a id="field-field-mq3-client-cgame-public-snapshot-entities-entities-src-mq3-client-cgame-public-ml-1690026179"></a>
### entities

```ml
entities
```

Entity-state or renderer-entity entries represented by the current snapshot or scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L266)

<a id="field-field-mq3-client-cgame-public-snapshot-numentities-numentities-src-mq3-client-cgame-public-ml-568047557"></a>
### numEntities

```ml
numEntities
```

Number of entity-state entries represented by the snapshot or scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L264)

<a id="field-field-mq3-client-cgame-public-snapshot-numservercommands-numservercommands-src-mq3-client-cgame-public-ml-730078273"></a>
### numServerCommands

```ml
numServerCommands
```

Number of reliable server commands associated with the snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L268)

<a id="field-field-mq3-client-cgame-public-snapshot-ping-ping-src-mq3-client-cgame-public-ml-1789148701"></a>
### ping

```ml
ping
```

Latency in milliseconds attached to the snapshot exposed through the public client-game interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L255)

<a id="field-field-mq3-client-cgame-public-snapshot-ps-ps-src-mq3-client-cgame-public-ml-516950083"></a>
### ps

```ml
ps
```

Complete player-state record carried by the snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L262)

<a id="field-field-mq3-client-cgame-public-snapshot-servercommandsequence-servercommandsequence-src-mq3-client-cgame-public-ml-452838121"></a>
### serverCommandSequence

```ml
serverCommandSequence
```

Reliable server-command sequence that must be processed before this public client-game snapshot becomes current.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L271)

<a id="field-field-mq3-client-cgame-public-snapshot-servertime-servertime-src-mq3-client-cgame-public-ml-725009745"></a>
### serverTime

```ml
serverTime
```

Server simulation timestamp in milliseconds exposed through the public client-game snapshot interface.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L258)

<a id="field-field-mq3-client-cgame-public-snapshot-snapflags-snapflags-src-mq3-client-cgame-public-ml-1732500749"></a>
### snapFlags

```ml
snapFlags
```

Snapshot flags describing rate delay and dropped-command conditions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_public.ml#L253)
