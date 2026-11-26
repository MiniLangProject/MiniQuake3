# `mq3.server.packet_event.Client`

[Home](README.md) · [Source file](File-src-mq3-server-packet-event-ml-761376352.md)

<a id="struct-struct-mq3-server-packet-event-client-struct-client-src-mq3-server-packet-event-ml-145375217"></a>
## Client

```ml
struct Client
```

Client record for server.packet_event, containing `state`, `netchan`, `lastPacketTime`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/packet_event.ml#L21)

## Members

<a id="field-field-mq3-server-packet-event-client-lastpackettime-lastpackettime-src-mq3-server-packet-event-ml-932262638"></a>
### lastPacketTime

```ml
lastPacketTime
```

Server timestamp of the most recently received client packet, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/packet_event.ml#L28)

<a id="field-field-mq3-server-packet-event-client-netchan-netchan-src-mq3-server-packet-event-ml-466328392"></a>
### netchan

```ml
netchan
```

Sequenced network channel used to exchange this client's packets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/packet_event.ml#L26)

<a id="field-field-mq3-server-packet-event-client-state-state-src-mq3-server-packet-event-ml-490715436"></a>
### state

```ml
state
```

Connection lifecycle value that determines whether a sequenced packet may belong to this connection.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/packet_event.ml#L24)
