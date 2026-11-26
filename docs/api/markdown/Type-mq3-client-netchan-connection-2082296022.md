# `mq3.client.netchan.Connection`

[Home](README.md) · [Source file](File-src-mq3-client-netchan-ml-1745063016.md)

<a id="struct-struct-mq3-client-netchan-connection-struct-connection-src-mq3-client-netchan-ml-1489446919"></a>
## Connection

```ml
struct Connection
```

Stores netchan connection state, including `challenge`, `reliableCommands`, `serverCommands`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/netchan.ml#L19)

## Members

<a id="field-field-mq3-client-netchan-connection-challenge-challenge-src-mq3-client-netchan-ml-278209389"></a>
### challenge

```ml
challenge
```

Server-issued challenge token used to validate the connection handshake.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/netchan.ml#L21)

<a id="field-field-mq3-client-netchan-connection-reliablecommands-reliablecommands-src-mq3-client-netchan-ml-1159944969"></a>
### reliableCommands

```ml
reliableCommands
```

Ring of reliable command strings awaiting acknowledgement or execution.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/netchan.ml#L23)

<a id="field-field-mq3-client-netchan-connection-servercommands-servercommands-src-mq3-client-netchan-ml-706441799"></a>
### serverCommands

```ml
serverCommands
```

Reliable server commands retained for ordered execution by the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/netchan.ml#L25)
