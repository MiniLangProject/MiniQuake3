# `mq3.server.user_move.Client`

[Home](README.md) · [Source file](File-src-mq3-server-user-move-ml-1219627038.md)

<a id="struct-struct-mq3-server-user-move-client-struct-client-src-mq3-server-user-move-ml-1386911659"></a>
## Client

```ml
struct Client
```

Client record for server.user_move, containing `state`, `messageAcknowledge`, `reliableAcknowledge`, `reliableCommands`, `deltaMessage`, `pureAuthentic`, and 3 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L26)

## Members

<a id="field-field-mq3-server-user-move-client-deltamessage-deltamessage-src-mq3-server-user-move-ml-1215286268"></a>
### deltaMessage

```ml
deltaMessage
```

Acknowledged snapshot message selected as the base for delta compression.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L37)

<a id="field-field-mq3-server-user-move-client-frames-frames-src-mq3-server-user-move-ml-1721311730"></a>
### frames

```ml
frames
```

Updates can be delta'd from here.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L43)

<a id="field-field-mq3-server-user-move-client-gotcp-gotcp-src-mq3-server-user-move-ml-457287990"></a>
### gotCP

```ml
gotCP
```

True after the client has sent its pure-server checksum verification command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L41)

<a id="field-field-mq3-server-user-move-client-lastusercmd-lastusercmd-src-mq3-server-user-move-ml-1977452786"></a>
### lastUsercmd

```ml
lastUsercmd
```

Most recent user-command record received or processed for this client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L45)

<a id="field-field-mq3-server-user-move-client-messageacknowledge-messageacknowledge-src-mq3-server-user-move-ml-1151283208"></a>
### messageAcknowledge

```ml
messageAcknowledge
```

Sequence number of the newest server message acknowledged by the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L31)

<a id="field-field-mq3-server-user-move-client-pureauthentic-pureauthentic-src-mq3-server-user-move-ml-303153218"></a>
### pureAuthentic

```ml
pureAuthentic
```

True after the client has passed the pure-package authentication check.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L39)

<a id="field-field-mq3-server-user-move-client-reliableacknowledge-reliableacknowledge-src-mq3-server-user-move-ml-1721550922"></a>
### reliableAcknowledge

```ml
reliableAcknowledge
```

Reliable command acknowledgment used while validating movement-message state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L33)

<a id="field-field-mq3-server-user-move-client-reliablecommands-reliablecommands-src-mq3-server-user-move-ml-1682578002"></a>
### reliableCommands

```ml
reliableCommands
```

Reliable command entries retained until the peer acknowledges them.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L35)

<a id="field-field-mq3-server-user-move-client-state-state-src-mq3-server-user-move-ml-775778334"></a>
### state

```ml
state
```

Connection lifecycle value that distinguishes entering the world from advancing an already active player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L29)
