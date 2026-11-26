# `mq3.botlib.server_bridge.Client`

[Home](README.md) · [Source file](File-src-mq3-botlib-server-bridge-ml-1158932283.md)

<a id="struct-struct-mq3-botlib-server-bridge-client-struct-client-src-mq3-botlib-server-bridge-ml-1314030771"></a>
## Client

```ml
struct Client
```

`Client` record for server bridge, containing `snapshotEntities`, `reliableCommands`, `reliableSequence`, `reliableAcknowledge` and `lastPacketTime` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L24)

## Members

<a id="field-field-mq3-botlib-server-bridge-client-lastpackettime-lastpackettime-src-mq3-botlib-server-bridge-ml-678419376"></a>
### lastPacketTime

```ml
lastPacketTime
```

Server timestamp of the most recently received client packet, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L34)

<a id="field-field-mq3-botlib-server-bridge-client-pending-pending-src-mq3-botlib-server-bridge-ml-2026315074"></a>
### pending

```ml
pending
```

Saved token or command awaiting consumption by the next operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L38)

<a id="field-field-mq3-botlib-server-bridge-client-reliableacknowledge-reliableacknowledge-src-mq3-botlib-server-bridge-ml-134065066"></a>
### reliableAcknowledge

```ml
reliableAcknowledge
```

Reliable server-command acknowledgment mirrored for the bot-server bridge.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L32)

<a id="field-field-mq3-botlib-server-bridge-client-reliablecommands-reliablecommands-src-mq3-botlib-server-bridge-ml-1591621534"></a>
### reliableCommands

```ml
reliableCommands
```

Reliable command entries retained until the peer acknowledges them.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L28)

<a id="field-field-mq3-botlib-server-bridge-client-reliablesequence-reliablesequence-src-mq3-botlib-server-bridge-ml-1366169760"></a>
### reliableSequence

```ml
reliableSequence
```

Sequence number of the newest queued reliable command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L30)

<a id="field-field-mq3-botlib-server-bridge-client-snapshotentities-snapshotentities-src-mq3-botlib-server-bridge-ml-416007980"></a>
### snapshotEntities

```ml
snapshotEntities
```

Entity states retained in the server snapshot ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L26)

<a id="field-field-mq3-botlib-server-bridge-client-usercommand-usercommand-src-mq3-botlib-server-bridge-ml-1391108046"></a>
### userCommand

```ml
userCommand
```

Most recent user command supplied for this bot client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L36)
