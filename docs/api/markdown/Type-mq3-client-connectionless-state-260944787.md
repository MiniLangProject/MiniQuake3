# `mq3.client.connectionless.State`

[Home](README.md) · [Source file](File-src-mq3-client-connectionless-ml-1561502254.md)

<a id="struct-struct-mq3-client-connectionless-state-struct-state-src-mq3-client-connectionless-ml-887985485"></a>
## State

```ml
struct State
```

Stores connectionless state, including `connectionState`, `realtime`, `serverAddress`, `channel`, `challenge`, `connectPacketCount` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L41)

## Members

<a id="field-field-mq3-client-connectionless-state-challenge-challenge-src-mq3-client-connectionless-ml-1673576486"></a>
### challenge

```ml
challenge
```

Server-issued challenge token used to validate the connection handshake.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L52)

<a id="field-field-mq3-client-connectionless-state-channel-channel-src-mq3-client-connectionless-ml-2053323270"></a>
### channel

```ml
channel
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `disconnectPacket` and `dispatch` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L50)

<a id="field-field-mq3-client-connectionless-state-connectionstate-connectionstate-src-mq3-client-connectionless-ml-432612118"></a>
### connectionState

```ml
connectionState
```

Client connection-state identifier controlling handshake, loading, and active-play behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L43)

<a id="field-field-mq3-client-connectionless-state-connectpacketcount-connectpacketcount-src-mq3-client-connectionless-ml-1722589684"></a>
### connectPacketCount

```ml
connectPacketCount
```

Number of connection-handshake packets sent, also used by progress displays.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L54)

<a id="field-field-mq3-client-connectionless-state-connecttime-connecttime-src-mq3-client-connectionless-ml-1432398278"></a>
### connectTime

```ml
connectTime
```

Timestamp of the most recent connection attempt or handshake retransmission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L56)

<a id="field-field-mq3-client-connectionless-state-demoplaying-demoplaying-src-mq3-client-connectionless-ml-1470856434"></a>
### demoplaying

```ml
demoplaying
```

When constructing this record, `create` supplies `false` for this member. Used by `checkForResend` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L68)

<a id="field-field-mq3-client-connectionless-state-lastpacketsenttime-lastpacketsenttime-src-mq3-client-connectionless-ml-1731355384"></a>
### lastPacketSentTime

```ml
lastPacketSentTime
```

Client timestamp of the latest outgoing packet, used to schedule retransmission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L58)

<a id="field-field-mq3-client-connectionless-state-lastpackettime-lastpackettime-src-mq3-client-connectionless-ml-1578109412"></a>
### lastPacketTime

```ml
lastPacketTime
```

Client timestamp of the latest received server packet, used to detect timeouts.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L60)

<a id="field-field-mq3-client-connectionless-state-qport-qport-src-mq3-client-connectionless-ml-1821415254"></a>
### qport

```ml
qport
```

When constructing this record, `create` supplies `0` for this member. Used by `checkForResend` and `dispatch` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L65)

<a id="field-field-mq3-client-connectionless-state-realtime-realtime-src-mq3-client-connectionless-ml-765132656"></a>
### realtime

```ml
realtime
```

Current local client time in milliseconds used to schedule connection attempts and retransmission.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L45)

<a id="field-field-mq3-client-connectionless-state-serveraddress-serveraddress-src-mq3-client-connectionless-ml-454759386"></a>
### serverAddress

```ml
serverAddress
```

Network endpoint of the server selected for this connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L47)

<a id="field-field-mq3-client-connectionless-state-servermessage-servermessage-src-mq3-client-connectionless-ml-109654326"></a>
### serverMessage

```ml
serverMessage
```

Status or error text received during the server connection handshake.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/connectionless.ml#L62)
