# `mq3.server.oob_connect.Client`

[Home](README.md) · [Source file](File-src-mq3-server-oob-connect-ml-829458266.md)

<a id="struct-struct-mq3-server-oob-connect-client-struct-client-src-mq3-server-oob-connect-ml-1266844883"></a>
## Client

```ml
struct Client
```

Client record for server.oob_connect, containing `state`, `address`, `qport`, `lastConnectTime`, `reliableAcknowledge`, `reliableSequence`, and 6 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L63)

## Members

<a id="field-field-mq3-server-oob-connect-client-address-address-src-mq3-server-oob-connect-ml-1255375942"></a>
### address

```ml
address
```

Network address associated with the client or packet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L68)

<a id="field-field-mq3-server-oob-connect-client-bot-bot-src-mq3-server-oob-connect-ml-8485774"></a>
### bot

```ml
bot
```

True when the client slot is controlled by an in-process bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L88)

<a id="field-field-mq3-server-oob-connect-client-challenge-challenge-src-mq3-server-oob-connect-ml-1315347738"></a>
### challenge

```ml
challenge
```

Challenge value used to authenticate a connection attempt.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L78)

<a id="field-field-mq3-server-oob-connect-client-gamestatemessagenum-gamestatemessagenum-src-mq3-server-oob-connect-ml-168630218"></a>
### gamestateMessageNum

```ml
gamestateMessageNum
```

Outgoing network sequence number of the client gamestate message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L86)

<a id="field-field-mq3-server-oob-connect-client-lastconnecttime-lastconnecttime-src-mq3-server-oob-connect-ml-389730898"></a>
### lastConnectTime

```ml
lastConnectTime
```

Server timestamp when this client connection began, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L72)

<a id="field-field-mq3-server-oob-connect-client-lastpackettime-lastpackettime-src-mq3-server-oob-connect-ml-1093000236"></a>
### lastPacketTime

```ml
lastPacketTime
```

Server timestamp of the most recently received client packet, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L84)

<a id="field-field-mq3-server-oob-connect-client-nextsnapshottime-nextsnapshottime-src-mq3-server-oob-connect-ml-2077013450"></a>
### nextSnapshotTime

```ml
nextSnapshotTime
```

Earliest server timestamp for sending the next snapshot, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L82)

<a id="field-field-mq3-server-oob-connect-client-qport-qport-src-mq3-server-oob-connect-ml-627231626"></a>
### qport

```ml
qport
```

Client-selected virtual port used to recognize a connection across address translation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L70)

<a id="field-field-mq3-server-oob-connect-client-reliableacknowledge-reliableacknowledge-src-mq3-server-oob-connect-ml-1859273418"></a>
### reliableAcknowledge

```ml
reliableAcknowledge
```

Reliable command acknowledgment reset when this connection slot is admitted or reused.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L74)

<a id="field-field-mq3-server-oob-connect-client-reliablesequence-reliablesequence-src-mq3-server-oob-connect-ml-633333132"></a>
### reliableSequence

```ml
reliableSequence
```

Sequence number of the newest queued reliable command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L76)

<a id="field-field-mq3-server-oob-connect-client-state-state-src-mq3-server-oob-connect-ml-908738966"></a>
### state

```ml
state
```

Connection lifecycle value that tracks slot availability and progress through connection admission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L66)

<a id="field-field-mq3-server-oob-connect-client-userinfo-userinfo-src-mq3-server-oob-connect-ml-8137252"></a>
### userinfo

```ml
userinfo
```

Backslash-delimited client information string, including name and connection settings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/oob_connect.ml#L80)
