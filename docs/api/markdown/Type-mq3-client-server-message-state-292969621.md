# `mq3.client.server_message.State`

[Home](README.md) · [Source file](File-src-mq3-client-server-message-ml-749329636.md)

<a id="struct-struct-mq3-client-server-message-state-struct-state-src-mq3-client-server-message-ml-1370711221"></a>
## State

```ml
struct State
```

Stores server message state, including `snapshotState`, `reliableAcknowledge`, `reliableSequence`, `serverCommandSequence`, `serverCommands`, `gamestateFn` and additional values.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L26)

## Members

<a id="field-field-mq3-client-server-message-state-context-context-src-mq3-client-server-message-ml-1314213458"></a>
### context

```ml
context
```

Caller-supplied value forwarded unchanged to the service callbacks for server-message parsing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L46)

<a id="field-field-mq3-client-server-message-state-downloadfn-downloadfn-src-mq3-client-server-message-ml-796487634"></a>
### downloadFn

```ml
downloadFn
```

Host callback for the download operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L44)

<a id="field-field-mq3-client-server-message-state-gamestatefn-gamestatefn-src-mq3-client-server-message-ml-928608498"></a>
### gamestateFn

```ml
gamestateFn
```

Host callback for the gamestate operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L41)

<a id="field-field-mq3-client-server-message-state-reliableacknowledge-reliableacknowledge-src-mq3-client-server-message-ml-1357428450"></a>
### reliableAcknowledge

```ml
reliableAcknowledge
```

Highest reliable-command sequence acknowledged as executed by the peer.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L31)

<a id="field-field-mq3-client-server-message-state-reliablesequence-reliablesequence-src-mq3-client-server-message-ml-519003948"></a>
### reliableSequence

```ml
reliableSequence
```

Sequence number assigned to the latest queued reliable command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L33)

<a id="field-field-mq3-client-server-message-state-servercommands-servercommands-src-mq3-client-server-message-ml-248419036"></a>
### serverCommands

```ml
serverCommands
```

Reliable server commands retained for ordered execution by the client.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L38)

<a id="field-field-mq3-client-server-message-state-servercommandsequence-servercommandsequence-src-mq3-client-server-message-ml-1780431666"></a>
### serverCommandSequence

```ml
serverCommandSequence
```

Highest accepted reliable server-command sequence used to reject duplicates and index the command ring.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L36)

<a id="field-field-mq3-client-server-message-state-shownetcontext-shownetcontext-src-mq3-client-server-message-ml-2060308528"></a>
### shownetContext

```ml
shownetContext
```

When constructing this record, `create` supplies an absent (`void`) value for this member. Used by `shownet` and `emitShownet` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L57)

<a id="field-field-mq3-client-server-message-state-shownetfn-shownetfn-src-mq3-client-server-message-ml-954161450"></a>
### shownetFn

```ml
shownetFn
```

Host callback for the shownet operation; an unset callback leaves that host operation unavailable.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L54)

<a id="field-field-mq3-client-server-message-state-shownetlevel-shownetlevel-src-mq3-client-server-message-ml-1735238114"></a>
### shownetLevel

```ml
shownetLevel
```

When constructing this record, `create` supplies `0` for this member. Used by `shownet` and `parseServerMessage` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L49)

<a id="field-field-mq3-client-server-message-state-shownetlines-shownetlines-src-mq3-client-server-message-ml-791393772"></a>
### shownetLines

```ml
shownetLines
```

When constructing this record, `create` supplies an empty list for this member. Used by `shownet` and `emitShownet` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L52)

<a id="field-field-mq3-client-server-message-state-snapshotstate-snapshotstate-src-mq3-client-server-message-ml-1740321098"></a>
### snapshotState

```ml
snapshotState
```

When constructing this record, `create` supplies `snapshotState` for this member. Used by `parseServerMessage` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L29)
