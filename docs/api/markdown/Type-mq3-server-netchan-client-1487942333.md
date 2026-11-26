# `mq3.server.netchan.Client`

[Home](README.md) · [Source file](File-src-mq3-server-netchan-ml-1084677692.md)

<a id="struct-struct-mq3-server-netchan-client-struct-client-src-mq3-server-netchan-ml-1861785027"></a>
## Client

```ml
struct Client
```

Client record for server.netchan, containing `challenge`, `lastClientCommandString`, `reliableCommands`, `channel`, `queue`, `queueInitialized`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L19)

## Members

<a id="field-field-mq3-server-netchan-client-challenge-challenge-src-mq3-server-netchan-ml-1707569186"></a>
### challenge

```ml
challenge
```

Challenge value used to authenticate a connection attempt.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L21)

<a id="field-field-mq3-server-netchan-client-channel-channel-src-mq3-server-netchan-ml-630918362"></a>
### channel

```ml
channel
```

Sequenced network channel used to send this client's messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L27)

<a id="field-field-mq3-server-netchan-client-lastclientcommandstring-lastclientcommandstring-src-mq3-server-netchan-ml-909787166"></a>
### lastClientCommandString

```ml
lastClientCommandString
```

Text of the last processed reliable client command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L23)

<a id="field-field-mq3-server-netchan-client-queue-queue-src-mq3-server-netchan-ml-79100502"></a>
### queue

```ml
queue
```

Messages waiting for earlier fragments to finish transmitting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L29)

<a id="field-field-mq3-server-netchan-client-queueinitialized-queueinitialized-src-mq3-server-netchan-ml-178960908"></a>
### queueInitialized

```ml
queueInitialized
```

True after the pending-message queue has been initialized.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L31)

<a id="field-field-mq3-server-netchan-client-reliablecommands-reliablecommands-src-mq3-server-netchan-ml-1563701746"></a>
### reliableCommands

```ml
reliableCommands
```

Reliable command entries retained until the peer acknowledges them.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/netchan.ml#L25)
