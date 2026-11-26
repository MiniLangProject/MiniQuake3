# `mq3.client.cgame_snapshot.Snapshot`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-snapshot-ml-1128039285.md)

<a id="struct-struct-mq3-client-cgame-snapshot-snapshot-struct-snapshot-src-mq3-client-cgame-snapshot-ml-686438563"></a>
## Snapshot

```ml
struct Snapshot
```

Stores client game snapshot snapshot metadata and contents, including `number`, `serverTime`, `snapFlags`, `serverCommandSequence`, `playerState`, `entities`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L20)

## Members

<a id="field-field-mq3-client-cgame-snapshot-snapshot-entities-entities-src-mq3-client-cgame-snapshot-ml-707089337"></a>
### entities

```ml
entities
```

Entity-state or renderer-entity entries represented by the current snapshot or scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L32)

<a id="field-field-mq3-client-cgame-snapshot-snapshot-number-number-src-mq3-client-cgame-snapshot-ml-2097320217"></a>
### number

```ml
number
```

When constructing this record, `wrap` supplies `number` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L22)

<a id="field-field-mq3-client-cgame-snapshot-snapshot-playerstate-playerstate-src-mq3-client-cgame-snapshot-ml-967150519"></a>
### playerState

```ml
playerState
```

Player-state record associated with this client snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L30)

<a id="field-field-mq3-client-cgame-snapshot-snapshot-servercommandsequence-servercommandsequence-src-mq3-client-cgame-snapshot-ml-208651743"></a>
### serverCommandSequence

```ml
serverCommandSequence
```

Reliable server-command sequence executed when this snapshot is installed or becomes current.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L28)

<a id="field-field-mq3-client-cgame-snapshot-snapshot-servertime-servertime-src-mq3-client-cgame-snapshot-ml-1723063307"></a>
### serverTime

```ml
serverTime
```

Server simulation time in milliseconds used to order and transition client-game snapshots.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L24)

<a id="field-field-mq3-client-cgame-snapshot-snapshot-snapflags-snapflags-src-mq3-client-cgame-snapshot-ml-2024108955"></a>
### snapFlags

```ml
snapFlags
```

Snapshot flags describing rate delay and dropped-command conditions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cgame_snapshot.ml#L26)
