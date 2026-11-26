# `mq3.server.client_input.Client`

[Home](README.md) · [Source file](File-src-mq3-server-client-input-ml-936991025.md)

<a id="struct-struct-mq3-server-client-input-client-struct-client-src-mq3-server-client-input-ml-133952287"></a>
## Client

```ml
struct Client
```

Client record for server.client_input, containing `state`, `name`, `messageAcknowledge`, `reliableAcknowledge`, `reliableSequence`, `gamestateMessageNum`, and 10 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L10)

## Members

<a id="field-field-mq3-server-client-input-client-deltamessage-deltamessage-src-mq3-server-client-input-ml-1592353032"></a>
### deltaMessage

```ml
deltaMessage
```

Acknowledged snapshot message selected as the base for delta compression.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L35)

<a id="field-field-mq3-server-client-input-client-downloadname-downloadname-src-mq3-server-client-input-ml-1472534340"></a>
### downloadName

```ml
downloadName
```

Requested asset download path, or an empty string when no download is active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L24)

<a id="field-field-mq3-server-client-input-client-frames-frames-src-mq3-server-client-input-ml-1970447586"></a>
### frames

```ml
frames
```

Updates can be delta'd from here.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L41)

<a id="field-field-mq3-server-client-input-client-gamestatemessagenum-gamestatemessagenum-src-mq3-server-client-input-ml-370709194"></a>
### gamestateMessageNum

```ml
gamestateMessageNum
```

Outgoing network sequence number of the client gamestate message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L22)

<a id="field-field-mq3-server-client-input-client-gotcp-gotcp-src-mq3-server-client-input-ml-1268383070"></a>
### gotCP

```ml
gotCP
```

True after the client has sent its pure-server checksum verification command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L39)

<a id="field-field-mq3-server-client-input-client-lastclientcommand-lastclientcommand-src-mq3-server-client-input-ml-244192498"></a>
### lastClientCommand

```ml
lastClientCommand
```

Sequence number of the last processed reliable client command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L28)

<a id="field-field-mq3-server-client-input-client-lastclientcommandstring-lastclientcommandstring-src-mq3-server-client-input-ml-1384792710"></a>
### lastClientCommandString

```ml
lastClientCommandString
```

Text of the last processed reliable client command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L26)

<a id="field-field-mq3-server-client-input-client-lastusercmd-lastusercmd-src-mq3-server-client-input-ml-1851107778"></a>
### lastUsercmd

```ml
lastUsercmd
```

Most recent user-command record received or processed for this client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L43)

<a id="field-field-mq3-server-client-input-client-messageacknowledge-messageacknowledge-src-mq3-server-client-input-ml-529214044"></a>
### messageAcknowledge

```ml
messageAcknowledge
```

Sequence number of the newest server message acknowledged by the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L16)

<a id="field-field-mq3-server-client-input-client-name-name-src-mq3-server-client-input-ml-2043654392"></a>
### name

```ml
name
```

Extracted from userinfo, high bits masked.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L14)

<a id="field-field-mq3-server-client-input-client-nextreliabletime-nextreliabletime-src-mq3-server-client-input-ml-952446602"></a>
### nextReliableTime

```ml
nextReliableTime
```

Millisecond deadline used by active-client command flood protection. Commands received before it can still advance reliable sequencing while game-command dispatch is denied.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L31)

<a id="field-field-mq3-server-client-input-client-pureauthentic-pureauthentic-src-mq3-server-client-input-ml-741449826"></a>
### pureAuthentic

```ml
pureAuthentic
```

True after the client has passed the pure-package authentication check.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L37)

<a id="field-field-mq3-server-client-input-client-reliableacknowledge-reliableacknowledge-src-mq3-server-client-input-ml-666280842"></a>
### reliableAcknowledge

```ml
reliableAcknowledge
```

Reliable server-command acknowledgment retained in the client input state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L18)

<a id="field-field-mq3-server-client-input-client-reliablecommands-reliablecommands-src-mq3-server-client-input-ml-529907934"></a>
### reliableCommands

```ml
reliableCommands
```

Reliable command entries retained until the peer acknowledges them.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L33)

<a id="field-field-mq3-server-client-input-client-reliablesequence-reliablesequence-src-mq3-server-client-input-ml-577620976"></a>
### reliableSequence

```ml
reliableSequence
```

Sequence number of the newest queued reliable command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L20)

<a id="field-field-mq3-server-client-input-client-state-state-src-mq3-server-client-input-ml-658968574"></a>
### state

```ml
state
```

Connection lifecycle value that tracks connection readiness while handling parsed input messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L12)
