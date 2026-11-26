# `mq3.engine.local_qvm_match.Snapshot`

[Home](README.md) · [Source file](File-src-mq3-engine-local-qvm-match-ml-725859098.md)

<a id="struct-struct-mq3-engine-local-qvm-match-snapshot-struct-snapshot-src-mq3-engine-local-qvm-match-ml-2087233015"></a>
## Snapshot

```ml
struct Snapshot
```

Snapshot record for engine.local_qvm_match, containing `serverTime`, `playerState`, `entities`, `areaBits`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L486)

## Members

<a id="field-field-mq3-engine-local-qvm-match-snapshot-areabits-areabits-src-mq3-engine-local-qvm-match-ml-1301587551"></a>
### areaBits

```ml
areaBits
```

Bit mask describing the snapshot's visible or accessible areas.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L494)

<a id="field-field-mq3-engine-local-qvm-match-snapshot-entities-entities-src-mq3-engine-local-qvm-match-ml-1694939923"></a>
### entities

```ml
entities
```

Entity records associated with the current world, scene, or snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L492)

<a id="field-field-mq3-engine-local-qvm-match-snapshot-playerstate-playerstate-src-mq3-engine-local-qvm-match-ml-1023706877"></a>
### playerState

```ml
playerState
```

Player movement and gameplay state carried by the snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L490)

<a id="field-field-mq3-engine-local-qvm-match-snapshot-servertime-servertime-src-mq3-engine-local-qvm-match-ml-1582300509"></a>
### serverTime

```ml
serverTime
```

Server timestamp of the snapshot, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/engine/local_qvm_match.ml#L488)
