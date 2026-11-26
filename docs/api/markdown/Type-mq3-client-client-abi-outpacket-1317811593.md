# `mq3.client.client_abi.OutPacket`

[Home](README.md) · [Source file](File-src-mq3-client-client-abi-ml-362324391.md)

<a id="struct-struct-mq3-client-client-abi-outpacket-struct-outpacket-src-mq3-client-client-abi-ml-200201813"></a>
## OutPacket

```ml
struct OutPacket
```

Stores client ABI out packet record, including `p_cmdNumber`, `p_serverTime`, `p_realtime`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L37)

## Members

<a id="field-field-mq3-client-client-abi-outpacket-p-cmdnumber-p-cmdnumber-src-mq3-client-client-abi-ml-11636849"></a>
### p_cmdNumber

```ml
p_cmdNumber
```

Client user-command sequence number when the outgoing packet was sent.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L39)

<a id="field-field-mq3-client-client-abi-outpacket-p-realtime-p-realtime-src-mq3-client-client-abi-ml-1250492353"></a>
### p_realtime

```ml
p_realtime
```

Client realtime timestamp when the outgoing packet was sent.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L43)

<a id="field-field-mq3-client-client-abi-outpacket-p-servertime-p-servertime-src-mq3-client-client-abi-ml-884193535"></a>
### p_serverTime

```ml
p_serverTime
```

Server time in the user command carried by the outgoing packet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/client_abi.ml#L41)
