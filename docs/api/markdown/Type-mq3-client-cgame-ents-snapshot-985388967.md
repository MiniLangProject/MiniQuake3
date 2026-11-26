# `mq3.client.cgame_ents.Snapshot`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-ents-ml-1890303843.md)

<a id="struct-struct-mq3-client-cgame-ents-snapshot-struct-snapshot-src-mq3-client-cgame-ents-ml-1496554435"></a>
## Snapshot

```ml
struct Snapshot
```

Stores client game ents snapshot metadata and contents, including `serverTime`, `playerState`, `entities`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L137)

## Members

<a id="field-field-mq3-client-cgame-ents-snapshot-entities-entities-src-mq3-client-cgame-ents-ml-272573633"></a>
### entities

```ml
entities
```

Entity-state or renderer-entity entries represented by the current snapshot or scene.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L143)

<a id="field-field-mq3-client-cgame-ents-snapshot-playerstate-playerstate-src-mq3-client-cgame-ents-ml-192767463"></a>
### playerState

```ml
playerState
```

Player-state record associated with this client snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L141)

<a id="field-field-mq3-client-cgame-ents-snapshot-servertime-servertime-src-mq3-client-cgame-ents-ml-1112917027"></a>
### serverTime

```ml
serverTime
```

Server simulation timestamp in milliseconds used when interpolating rendered entity snapshots.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_ents.ml#L139)
