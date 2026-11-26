# `mq3.client.send_cmd.OutPacket`

[Home](README.md) · [Source file](File-src-mq3-client-send-cmd-ml-1342588170.md)

<a id="struct-struct-mq3-client-send-cmd-outpacket-struct-outpacket-src-mq3-client-send-cmd-ml-1766663095"></a>
## OutPacket

```ml
struct OutPacket
```

Stores send cmd out packet record, including `serverTime`, `realtime`, `cmdNumber`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/send_cmd.ml#L44)

## Members

<a id="field-field-mq3-client-send-cmd-outpacket-cmdnumber-cmdnumber-src-mq3-client-send-cmd-ml-259923933"></a>
### cmdNumber

```ml
cmdNumber
```

Monotonically advancing user-command sequence number for the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/send_cmd.ml#L50)

<a id="field-field-mq3-client-send-cmd-outpacket-realtime-realtime-src-mq3-client-send-cmd-ml-284500379"></a>
### realtime

```ml
realtime
```

Local timestamp in milliseconds at which this outgoing user-command packet was sent.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/send_cmd.ml#L48)

<a id="field-field-mq3-client-send-cmd-outpacket-servertime-servertime-src-mq3-client-send-cmd-ml-328457945"></a>
### serverTime

```ml
serverTime
```

Timestamp in milliseconds of the latest user command included in this outgoing packet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/send_cmd.ml#L46)
