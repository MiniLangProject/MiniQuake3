# `mq3.server.operator_commands.Client`

[Home](README.md) · [Source file](File-src-mq3-server-operator-commands-ml-2061061336.md)

<a id="struct-struct-mq3-server-operator-commands-client-struct-client-src-mq3-server-operator-commands-ml-706462011"></a>
## Client

```ml
struct Client
```

Client record for server.operator_commands, containing `state`, `name`, `userinfo`, `addressType`, `address`, `ip`, and 7 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L47)

## Members

<a id="field-field-mq3-server-operator-commands-client-address-address-src-mq3-server-operator-commands-ml-462876494"></a>
### address

```ml
address
```

Network address associated with the client or packet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L57)

<a id="field-field-mq3-server-operator-commands-client-addresstype-addresstype-src-mq3-server-operator-commands-ml-1705089630"></a>
### addressType

```ml
addressType
```

Network-address kind, such as loopback, IPv4, or bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L55)

<a id="field-field-mq3-server-operator-commands-client-denied-denied-src-mq3-server-operator-commands-ml-645657820"></a>
### denied

```ml
denied
```

Reason the client was denied or disconnected by an operator command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L73)

<a id="field-field-mq3-server-operator-commands-client-ip-ip-src-mq3-server-operator-commands-ml-1203614304"></a>
### ip

```ml
ip
```

Address bytes identifying the remote IPv4 endpoint.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L59)

<a id="field-field-mq3-server-operator-commands-client-lastpackettime-lastpackettime-src-mq3-server-operator-commands-ml-1360685332"></a>
### lastPacketTime

```ml
lastPacketTime
```

Server timestamp of the most recently received client packet, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L67)

<a id="field-field-mq3-server-operator-commands-client-lastusercmd-lastusercmd-src-mq3-server-operator-commands-ml-1281527138"></a>
### lastUsercmd

```ml
lastUsercmd
```

Most recent user-command record received or processed for this client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L71)

<a id="field-field-mq3-server-operator-commands-client-name-name-src-mq3-server-operator-commands-ml-89677364"></a>
### name

```ml
name
```

Extracted from userinfo, high bits masked.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L51)

<a id="field-field-mq3-server-operator-commands-client-ping-ping-src-mq3-server-operator-commands-ml-1400786394"></a>
### ping

```ml
ping
```

Estimated round-trip client latency in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L65)

<a id="field-field-mq3-server-operator-commands-client-qport-qport-src-mq3-server-operator-commands-ml-696863882"></a>
### qport

```ml
qport
```

Client-selected virtual port used to recognize a connection across address translation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L61)

<a id="field-field-mq3-server-operator-commands-client-rate-rate-src-mq3-server-operator-commands-ml-1367043514"></a>
### rate

```ml
rate
```

Maximum client download and snapshot transfer rate, in bytes per second.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L63)

<a id="field-field-mq3-server-operator-commands-client-score-score-src-mq3-server-operator-commands-ml-1874456674"></a>
### score

```ml
score
```

Client score printed by operator status commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L69)

<a id="field-field-mq3-server-operator-commands-client-state-state-src-mq3-server-operator-commands-ml-274536766"></a>
### state

```ml
state
```

Connection lifecycle value that determines which operator commands can address this player slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L49)

<a id="field-field-mq3-server-operator-commands-client-userinfo-userinfo-src-mq3-server-operator-commands-ml-638461700"></a>
### userinfo

```ml
userinfo
```

Backslash-delimited client information string, including name and connection settings.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L53)
