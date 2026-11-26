# `mq3.client.snapshot_command.OutPacket`

[Home](README.md) · [Source file](File-src-mq3-client-snapshot-command-ml-285373799.md)

<a id="struct-struct-mq3-client-snapshot-command-outpacket-struct-outpacket-src-mq3-client-snapshot-command-ml-1941057557"></a>
## OutPacket

```ml
struct OutPacket
```

Stores snapshot command out packet record, including `serverTime`, `realtime`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_command.ml#L20)

## Members

<a id="field-field-mq3-client-snapshot-command-outpacket-realtime-realtime-src-mq3-client-snapshot-command-ml-1976937255"></a>
### realtime

```ml
realtime
```

Local send timestamp in milliseconds used to calculate latency when a snapshot acknowledges this packet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_command.ml#L26)

<a id="field-field-mq3-client-snapshot-command-outpacket-servertime-servertime-src-mq3-client-snapshot-command-ml-1263735013"></a>
### serverTime

```ml
serverTime
```

Timestamp in milliseconds of the user command carried by this packet, compared with the snapshot command acknowledgement.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/snapshot_command.ml#L23)
