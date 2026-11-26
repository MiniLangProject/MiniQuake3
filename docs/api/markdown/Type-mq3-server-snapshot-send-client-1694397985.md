# `mq3.server.snapshot_send.Client`

[Home](README.md) · [Source file](File-src-mq3-server-snapshot-send-ml-704467576.md)

<a id="struct-struct-mq3-server-snapshot-send-client-struct-client-src-mq3-server-snapshot-send-ml-1640213731"></a>
## Client

```ml
struct Client
```

Client record for server.snapshot_send, containing `state`, `reliableCommands`, `reliableSequence`, `reliableAcknowledge`, `reliableSent`, `lastClientCommand`, and 9 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L57)

## Members

<a id="field-field-mq3-server-snapshot-send-client-bot-bot-src-mq3-server-snapshot-send-ml-2131171702"></a>
### bot

```ml
bot
```

True when the client slot is controlled by an in-process bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L87)

<a id="field-field-mq3-server-snapshot-send-client-deltamessage-deltamessage-src-mq3-server-snapshot-send-ml-1001746364"></a>
### deltaMessage

```ml
deltaMessage
```

Acknowledged snapshot message selected as the base for delta compression.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L71)

<a id="field-field-mq3-server-snapshot-send-client-downloadname-downloadname-src-mq3-server-snapshot-send-ml-140008608"></a>
### downloadName

```ml
downloadName
```

Requested asset download path, or an empty string when no download is active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L85)

<a id="field-field-mq3-server-snapshot-send-client-frames-frames-src-mq3-server-snapshot-send-ml-1707217394"></a>
### frames

```ml
frames
```

Updates can be delta'd from here.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L75)

<a id="field-field-mq3-server-snapshot-send-client-lastclientcommand-lastclientcommand-src-mq3-server-snapshot-send-ml-1811593538"></a>
### lastClientCommand

```ml
lastClientCommand
```

Sequence number of the last processed reliable client command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L69)

<a id="field-field-mq3-server-snapshot-send-client-nextsnapshottime-nextsnapshottime-src-mq3-server-snapshot-send-ml-99992882"></a>
### nextSnapshotTime

```ml
nextSnapshotTime
```

Earliest server timestamp for sending the next snapshot, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L83)

<a id="field-field-mq3-server-snapshot-send-client-outgoingsequence-outgoingsequence-src-mq3-server-snapshot-send-ml-193496924"></a>
### outgoingSequence

```ml
outgoingSequence
```

Sequence number to place on the next outgoing network message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L73)

<a id="field-field-mq3-server-snapshot-send-client-rate-rate-src-mq3-server-snapshot-send-ml-36725850"></a>
### rate

```ml
rate
```

Maximum client download and snapshot transfer rate, in bytes per second.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L79)

<a id="field-field-mq3-server-snapshot-send-client-ratedelayed-ratedelayed-src-mq3-server-snapshot-send-ml-2131259358"></a>
### rateDelayed

```ml
rateDelayed
```

True when rate limiting postponed the next snapshot beyond its normal interval.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L77)

<a id="field-field-mq3-server-snapshot-send-client-reliableacknowledge-reliableacknowledge-src-mq3-server-snapshot-send-ml-1985660610"></a>
### reliableAcknowledge

```ml
reliableAcknowledge
```

Last reliable server command acknowledged when selecting commands to prefix to a snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L65)

<a id="field-field-mq3-server-snapshot-send-client-reliablecommands-reliablecommands-src-mq3-server-snapshot-send-ml-388218594"></a>
### reliableCommands

```ml
reliableCommands
```

Reliable command entries retained until the peer acknowledges them.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L61)

<a id="field-field-mq3-server-snapshot-send-client-reliablesent-reliablesent-src-mq3-server-snapshot-send-ml-1195047274"></a>
### reliableSent

```ml
reliableSent
```

Sequence number of the newest reliable command transmitted to the peer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L67)

<a id="field-field-mq3-server-snapshot-send-client-reliablesequence-reliablesequence-src-mq3-server-snapshot-send-ml-1063699220"></a>
### reliableSequence

```ml
reliableSequence
```

Sequence number of the newest queued reliable command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L63)

<a id="field-field-mq3-server-snapshot-send-client-snapshotmsec-snapshotmsec-src-mq3-server-snapshot-send-ml-1821387818"></a>
### snapshotMsec

```ml
snapshotMsec
```

Requested interval between snapshots, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L81)

<a id="field-field-mq3-server-snapshot-send-client-state-state-src-mq3-server-snapshot-send-ml-260011382"></a>
### state

```ml
state
```

Connection lifecycle value that decides whether to build and send a normal snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/snapshot_send.ml#L59)
