# `mq3.client.cgame_view.Snapshot`

[Home](README.md) · [Source file](File-src-mq3-client-cgame-view-ml-1544499938.md)

<a id="struct-struct-mq3-client-cgame-view-snapshot-struct-snapshot-src-mq3-client-cgame-view-ml-1133071025"></a>
## Snapshot

```ml
struct Snapshot
```

Stores client game view snapshot metadata and contents, including `ps`, `snapFlags`, `areamask`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L145)

## Members

<a id="field-field-mq3-client-cgame-view-snapshot-areamask-areamask-src-mq3-client-cgame-view-ml-248037399"></a>
### areamask

```ml
areamask
```

Portal-area visibility bitset associated with the current snapshot or rendered view.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L151)

<a id="field-field-mq3-client-cgame-view-snapshot-ps-ps-src-mq3-client-cgame-view-ml-1287807843"></a>
### ps

```ml
ps
```

Complete player-state record carried by the snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L147)

<a id="field-field-mq3-client-cgame-view-snapshot-snapflags-snapflags-src-mq3-client-cgame-view-ml-329012469"></a>
### snapFlags

```ml
snapFlags
```

Snapshot flags describing rate delay and dropped-command conditions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/cgame_view.ml#L149)
