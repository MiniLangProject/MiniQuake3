# `mq3.server.snapshot_send.SendFrame`

[Home](README.md) · [Source file](File-src-mq3-server-snapshot-send-ml-704467576.md)

<a id="struct-struct-mq3-server-snapshot-send-sendframe-struct-sendframe-src-mq3-server-snapshot-send-ml-1297700815"></a>
## SendFrame

```ml
struct SendFrame
```

SendFrame record for server.snapshot_send, containing `firstEntity`, `numEntities`, `areaBits`, `playerState`, `messageSent`, `messageAcked`, and 1 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L30)

## Members

<a id="field-field-mq3-server-snapshot-send-sendframe-areabits-areabits-src-mq3-server-snapshot-send-ml-1007671528"></a>
### areaBits

```ml
areaBits
```

Bitset of map areas visible in this snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L36)

<a id="field-field-mq3-server-snapshot-send-sendframe-firstentity-firstentity-src-mq3-server-snapshot-send-ml-32103494"></a>
### firstEntity

```ml
firstEntity
```

First entity-state position for this snapshot in the shared circular snapshot buffer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L32)

<a id="field-field-mq3-server-snapshot-send-sendframe-messageacked-messageacked-src-mq3-server-snapshot-send-ml-1452646924"></a>
### messageAcked

```ml
messageAcked
```

Server timestamp when this snapshot message was acknowledged, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L42)

<a id="field-field-mq3-server-snapshot-send-sendframe-messagesent-messagesent-src-mq3-server-snapshot-send-ml-147951374"></a>
### messageSent

```ml
messageSent
```

Server timestamp when this snapshot message was transmitted, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L40)

<a id="field-field-mq3-server-snapshot-send-sendframe-messagesize-messagesize-src-mq3-server-snapshot-send-ml-1974506130"></a>
### messageSize

```ml
messageSize
```

Transmitted snapshot-message size in bytes, used for rate limiting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L44)

<a id="field-field-mq3-server-snapshot-send-sendframe-numentities-numentities-src-mq3-server-snapshot-send-ml-2100619758"></a>
### numEntities

```ml
numEntities
```

Number of entity records currently represented by this state or snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L34)

<a id="field-field-mq3-server-snapshot-send-sendframe-playerstate-playerstate-src-mq3-server-snapshot-send-ml-571404690"></a>
### playerState

```ml
playerState
```

Authoritative player-state record used for snapshots and game simulation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L38)
