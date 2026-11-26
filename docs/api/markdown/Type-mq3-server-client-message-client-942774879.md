# `mq3.server.client_message.Client`

[Home](README.md) · [Source file](File-src-mq3-server-client-message-ml-526567844.md)

<a id="struct-struct-mq3-server-client-message-client-struct-client-src-mq3-server-client-message-ml-1623766981"></a>
## Client

```ml
struct Client
```

Client acknowledgment, reliable-command, download, and lifecycle state used during message dispatch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_message.ml#L29)

## Members

<a id="field-field-mq3-server-client-message-client-downloadname-downloadname-src-mq3-server-client-message-ml-1970682634"></a>
### downloadName

```ml
downloadName
```

Requested asset download path, or an empty string when no download is active.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_message.ml#L42)

<a id="field-field-mq3-server-client-message-client-gamestatemessagenum-gamestatemessagenum-src-mq3-server-client-message-ml-1207675148"></a>
### gamestateMessageNum

```ml
gamestateMessageNum
```

Outgoing network sequence number of the client gamestate message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_message.ml#L40)

<a id="field-field-mq3-server-client-message-client-lastclientcommand-lastclientcommand-src-mq3-server-client-message-ml-1563654788"></a>
### lastClientCommand

```ml
lastClientCommand
```

Sequence number of the last processed reliable client command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_message.ml#L46)

<a id="field-field-mq3-server-client-message-client-lastclientcommandstring-lastclientcommandstring-src-mq3-server-client-message-ml-1773291400"></a>
### lastClientCommandString

```ml
lastClientCommandString
```

Text of the last processed reliable client command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_message.ml#L48)

<a id="field-field-mq3-server-client-message-client-messageacknowledge-messageacknowledge-src-mq3-server-client-message-ml-1109591898"></a>
### messageAcknowledge

```ml
messageAcknowledge
```

Sequence number of the newest server message acknowledged by the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_message.ml#L34)

<a id="field-field-mq3-server-client-message-client-name-name-src-mq3-server-client-message-ml-1880641870"></a>
### name

```ml
name
```

Extracted from userinfo, high bits masked.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_message.ml#L44)

<a id="field-field-mq3-server-client-message-client-nextreliabletime-nextreliabletime-src-mq3-server-client-message-ml-223970460"></a>
### nextReliableTime

```ml
nextReliableTime
```

Millisecond deadline used by active-client command flood protection. Commands received before it can still advance reliable sequencing while game-command dispatch is denied.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_message.ml#L51)

<a id="field-field-mq3-server-client-message-client-reliableacknowledge-reliableacknowledge-src-mq3-server-client-message-ml-689386316"></a>
### reliableAcknowledge

```ml
reliableAcknowledge
```

Reliable server-command sequence acknowledged by the decoded client message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_message.ml#L36)

<a id="field-field-mq3-server-client-message-client-reliablesequence-reliablesequence-src-mq3-server-client-message-ml-1791496078"></a>
### reliableSequence

```ml
reliableSequence
```

Sequence number of the newest queued reliable command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_message.ml#L38)

<a id="field-field-mq3-server-client-message-client-state-state-src-mq3-server-client-message-ml-234354072"></a>
### state

```ml
state
```

Connection lifecycle value that controls which decoded commands and movement messages are accepted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_message.ml#L32)
