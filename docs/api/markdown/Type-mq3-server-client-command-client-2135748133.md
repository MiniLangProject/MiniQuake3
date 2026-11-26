# `mq3.server.client_command.Client`

[Home](README.md) · [Source file](File-src-mq3-server-client-command-ml-1186902078.md)

<a id="struct-struct-mq3-server-client-command-client-struct-client-src-mq3-server-client-command-ml-2035897997"></a>
## Client

```ml
struct Client
```

Per-client reliable-command sequence, most recent command text, and flood-control deadline.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_command.ml#L12)

## Members

<a id="field-field-mq3-server-client-command-client-lastclientcommand-lastclientcommand-src-mq3-server-client-command-ml-2018650540"></a>
### lastClientCommand

```ml
lastClientCommand
```

Sequence number of the last processed reliable client command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_command.ml#L18)

<a id="field-field-mq3-server-client-command-client-lastclientcommandstring-lastclientcommandstring-src-mq3-server-client-command-ml-1079452016"></a>
### lastClientCommandString

```ml
lastClientCommandString
```

Text of the last processed reliable client command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_command.ml#L20)

<a id="field-field-mq3-server-client-command-client-name-name-src-mq3-server-client-command-ml-1042915510"></a>
### name

```ml
name
```

Extracted from userinfo, high bits masked.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_command.ml#L16)

<a id="field-field-mq3-server-client-command-client-nextreliabletime-nextreliabletime-src-mq3-server-client-command-ml-386007956"></a>
### nextReliableTime

```ml
nextReliableTime
```

Millisecond deadline used by active-client command flood protection. Commands received before it can still advance reliable sequencing while game-command dispatch is denied.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_command.ml#L23)

<a id="field-field-mq3-server-client-command-client-state-state-src-mq3-server-client-command-ml-65702640"></a>
### state

```ml
state
```

Connection lifecycle value that gates dispatch of commands that require an active game client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_command.ml#L14)
