# `src/mq3/server/client_message.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.client_message`](Package-mq3-server-client-message-1686822270.md)

Reachable from entry: **yes**

## Imports

- `mq3/qcommon/message.ml` as `msgio` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="constant-constant-mq3-server-client-message-clc-client-command-const-clc-client-command-4-src-mq3-server-client-message-ml-1803938479"></a>
### CLC_CLIENT_COMMAND

```ml
const CLC_CLIENT_COMMAND = 4
```

Client-to-server opcode introducing a reliable textual client command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_message.ml#L17)

<a id="constant-constant-mq3-server-client-message-clc-eof-const-clc-eof-5-src-mq3-server-client-message-ml-907334104"></a>
### CLC_EOF

```ml
const CLC_EOF = 5
```

Client-to-server opcode marking the end of a message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_message.ml#L19)

<a id="constant-constant-mq3-server-client-message-clc-move-const-clc-move-2-src-mq3-server-client-message-ml-732380481"></a>
### CLC_MOVE

```ml
const CLC_MOVE = 2
```

Client-to-server opcode carrying user commands with snapshot delta acknowledgment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_message.ml#L13)

<a id="constant-constant-mq3-server-client-message-clc-move-no-delta-const-clc-move-no-delta-3-src-mq3-server-client-message-ml-1590861306"></a>
### CLC_MOVE_NO_DELTA

```ml
const CLC_MOVE_NO_DELTA = 3
```

Client-to-server opcode carrying user commands while requesting a full snapshot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_message.ml#L15)

- [mq3.server.client_message.Client](Type-mq3-server-client-message-client-942774879.md) — struct
<a id="function-function-mq3-server-client-message-createclient-function-createclient-src-mq3-server-client-message-ml-577282840"></a>
### createClient

```ml
function createClient()
```

Create empty client message state with zero acknowledgments and no active download or command text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_message.ml#L76)

<a id="function-function-mq3-server-client-message-createserver-function-createserver-serverid-restartedserverid-src-mq3-server-client-message-ml-675477102"></a>
### createServer

```ml
function createServer(serverId, restartedServerId)
```

Create the server identifier pair used for stale-message and restart checks.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `serverId` | `dynamic` | — | Identifier of the current server/map session. |
| `restartedServerId` | `dynamic` | — | Lower boundary of server identifiers associated with the latest restart. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_message.ml#L74)

<a id="constant-constant-mq3-server-client-message-cs-zombie-const-cs-zombie-1-src-mq3-server-client-message-ml-2023967532"></a>
### CS_ZOMBIE

```ml
const CS_ZOMBIE = 1
```

Client lifecycle state retaining a recently disconnected client for final messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_message.ml#L11)

<a id="function-function-mq3-server-client-message-execute-function-execute-serverstate-clientstate-host-msg-src-mq3-server-client-message-ml-862275497"></a>
### execute

```ml
function execute(serverState, clientState, host, msg)
```

Decode client acknowledgments, consume reliable commands, and dispatch the final movement opcode. Returns `move`, `moveNoDelta`, or `eof` for the corresponding final opcode. Rejected or stale input returns `negativeMessageAck`, `staleReliableAck`, `oldServerId`, `resendGamestate`, `wrongServerId`, `commandRejected`, `zombie`, or `badCommand`; missing input state produces error 6980. Acknowledgments are stored as they are read. A stale reliable acknowledgment is reset to the current server reliable sequence before returning. Recognized movement/gamestate paths report their disposition even when their optional callback is absent; callback return values other than clientCommandFn are ignored.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `serverState` | `dynamic` | — | Current server identifier and restart boundary used to validate the client session. |
| `clientState` | `dynamic` | — | Mutable client acknowledgment, reliable sequence, download, and lifecycle state. |
| `host` | `dynamic` | — | Services for command consumption, movement decoding, gamestate resends, and diagnostics. |
| `msg` | `dynamic` | — | Mutable network message positioned at the decoded client payload; reading switches to bitstream mode. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_message.ml#L91)

<a id="constant-constant-mq3-server-client-message-max-reliable-commands-const-max-reliable-commands-64-src-mq3-server-client-message-ml-1803184575"></a>
### MAX_RELIABLE_COMMANDS

```ml
const MAX_RELIABLE_COMMANDS = 64
```

Capacity of the reliable-command ring retained until acknowledgment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_message.ml#L9)

- [mq3.server.client_message.Server](Type-mq3-server-client-message-server-1884311099.md) — struct
<a id="function-function-mq3-server-client-message-services-function-services-src-mq3-server-client-message-ml-22899144"></a>
### services

```ml
function services()
```

Create client-message services with all callbacks and their shared context initially unset.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_message.ml#L78)

- [mq3.server.client_message.Services](Type-mq3-server-client-message-services-149189296.md) — struct
