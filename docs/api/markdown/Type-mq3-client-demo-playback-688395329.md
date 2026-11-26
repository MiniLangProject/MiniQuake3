# `mq3.client.demo.Playback`

[Home](README.md) · [Source file](File-src-mq3-client-demo-ml-1236155596.md)

<a id="struct-struct-mq3-client-demo-playback-struct-playback-src-mq3-client-demo-ml-1897011685"></a>
## Playback

```ml
struct Playback
```

Stores demo playback record, including `serverMessageSequence`, `lastPacketTime`, `offset`, `completed`, `truncated`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo.ml#L101)

## Members

<a id="field-field-mq3-client-demo-playback-completed-completed-src-mq3-client-demo-ml-1277038542"></a>
### completed

```ml
completed
```

When constructing this record, `playback` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo.ml#L109)

<a id="field-field-mq3-client-demo-playback-lastpackettime-lastpackettime-src-mq3-client-demo-ml-1275242632"></a>
### lastPacketTime

```ml
lastPacketTime
```

Client timestamp of the latest received server packet, used to detect timeouts.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo.ml#L105)

<a id="field-field-mq3-client-demo-playback-offset-offset-src-mq3-client-demo-ml-1937030924"></a>
### offset

```ml
offset
```

When constructing this record, `playback` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo.ml#L107)

<a id="field-field-mq3-client-demo-playback-servermessagesequence-servermessagesequence-src-mq3-client-demo-ml-1047018022"></a>
### serverMessageSequence

```ml
serverMessageSequence
```

Highest server network-message sequence observed by the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo.ml#L103)

<a id="field-field-mq3-client-demo-playback-truncated-truncated-src-mq3-client-demo-ml-1552549034"></a>
### truncated

```ml
truncated
```

When constructing this record, `playback` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/demo.ml#L111)
