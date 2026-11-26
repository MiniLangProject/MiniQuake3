# `mq3.client.send_cmd.WriteResult`

[Home](README.md) · [Source file](File-src-mq3-client-send-cmd-ml-1342588170.md)

<a id="struct-struct-mq3-client-send-cmd-writeresult-struct-writeresult-src-mq3-client-send-cmd-ml-1286518027"></a>
## WriteResult

```ml
struct WriteResult
```

Stores send cmd write result record, including `sent`, `message`, `commandCount`, `moveType`, `key`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L151)

## Members

<a id="field-field-mq3-client-send-cmd-writeresult-commandcount-commandcount-src-mq3-client-send-cmd-ml-980263159"></a>
### commandCount

```ml
commandCount
```

When constructing this record, `writePacket` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L157)

<a id="field-field-mq3-client-send-cmd-writeresult-key-key-src-mq3-client-send-cmd-ml-514149079"></a>
### key

```ml
key
```

When constructing this record, `writePacket` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L161)

<a id="field-field-mq3-client-send-cmd-writeresult-message-message-src-mq3-client-send-cmd-ml-1292651575"></a>
### message

```ml
message
```

When constructing this record, `writePacket` supplies an absent (`void`) value for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L155)

<a id="field-field-mq3-client-send-cmd-writeresult-movetype-movetype-src-mq3-client-send-cmd-ml-1212137629"></a>
### moveType

```ml
moveType
```

When constructing this record, `writePacket` supplies `0` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L159)

<a id="field-field-mq3-client-send-cmd-writeresult-sent-sent-src-mq3-client-send-cmd-ml-887372499"></a>
### sent

```ml
sent
```

When constructing this record, `writePacket` supplies `false` for this member.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L153)
