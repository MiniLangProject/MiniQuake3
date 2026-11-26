# `mq3.server.reliable_commands.ReliableClient`

[Home](README.md) · [Source file](File-src-mq3-server-reliable-commands-ml-1690433750.md)

<a id="struct-struct-mq3-server-reliable-commands-reliableclient-struct-reliableclient-src-mq3-server-reliable-commands-ml-1151805459"></a>
## ReliableClient

```ml
struct ReliableClient
```

ReliableClient record for server.reliable_commands, containing `reliableAcknowledge`, `reliableSequence`, `reliableSent`, `reliableCommands`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/reliable_commands.ml#L13)

## Members

<a id="field-field-mq3-server-reliable-commands-reliableclient-reliableacknowledge-reliableacknowledge-src-mq3-server-reliable-commands-ml-1273380724"></a>
### reliableAcknowledge

```ml
reliableAcknowledge
```

Acknowledgment cursor used to retire queued reliable server commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/reliable_commands.ml#L15)

<a id="field-field-mq3-server-reliable-commands-reliableclient-reliablecommands-reliablecommands-src-mq3-server-reliable-commands-ml-361904612"></a>
### reliableCommands

```ml
reliableCommands
```

Reliable command entries retained until the peer acknowledges them.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/reliable_commands.ml#L21)

<a id="field-field-mq3-server-reliable-commands-reliableclient-reliablesent-reliablesent-src-mq3-server-reliable-commands-ml-1178746764"></a>
### reliableSent

```ml
reliableSent
```

Sequence number of the newest reliable command transmitted to the peer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/reliable_commands.ml#L19)

<a id="field-field-mq3-server-reliable-commands-reliableclient-reliablesequence-reliablesequence-src-mq3-server-reliable-commands-ml-1927933366"></a>
### reliableSequence

```ml
reliableSequence
```

Sequence number of the newest queued reliable command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/reliable_commands.ml#L17)
