# `src/mq3/server/client_message.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.client_message`](Package-mq3-server-client-message-1686822270.md)

Reachable from entry: **yes**

## Imports

- `mq3/qcommon/message.ml` as `msgio` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="constant-constant-mq3-server-client-message-clc-client-command-const-clc-client-command-4-src-mq3-server-client-message-ml-1803938479"></a>
### CLC_CLIENT_COMMAND

```ml
const CLC_CLIENT_COMMAND = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_message.ml#L12)

<a id="constant-constant-mq3-server-client-message-clc-eof-const-clc-eof-5-src-mq3-server-client-message-ml-907334104"></a>
### CLC_EOF

```ml
const CLC_EOF = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_message.ml#L13)

<a id="constant-constant-mq3-server-client-message-clc-move-const-clc-move-2-src-mq3-server-client-message-ml-732380481"></a>
### CLC_MOVE

```ml
const CLC_MOVE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_message.ml#L10)

<a id="constant-constant-mq3-server-client-message-clc-move-no-delta-const-clc-move-no-delta-3-src-mq3-server-client-message-ml-1590861306"></a>
### CLC_MOVE_NO_DELTA

```ml
const CLC_MOVE_NO_DELTA = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_message.ml#L11)

- [mq3.server.client_message.Client](Type-mq3-server-client-message-client-942774879.md) — struct
<a id="function-function-mq3-server-client-message-createclient-function-createclient-src-mq3-server-client-message-ml-577282840"></a>
### createClient

```ml
function createClient()
```

Create `mq3.server.client_message.Client` with state=0; messageAcknowledge=0; reliableAcknowledge=0; reliableSequence=0; gamestateMessageNum=0; downloadName=""; name=""; lastClientCommand=0; lastClientCommandString=""; nextReliableTime=0.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_message.ml#L31)

<a id="function-function-mq3-server-client-message-createserver-function-createserver-serverid-restartedserverid-src-mq3-server-client-message-ml-675477102"></a>
### createServer

```ml
function createServer(serverId, restartedServerId)
```

Create `mq3.server.client_message.Server` with serverId=serverId; restartedServerId=restartedServerId.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `serverId` | `dynamic` | — | Initial `serverId` field stored in the returned or constructed `mq3.server.client_message.Server` record. |
| `restartedServerId` | `dynamic` | — | Initial `restartedServerId` field stored in the returned or constructed `mq3.server.client_message.Server` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_message.ml#L29)

<a id="constant-constant-mq3-server-client-message-cs-zombie-const-cs-zombie-1-src-mq3-server-client-message-ml-2023967532"></a>
### CS_ZOMBIE

```ml
const CS_ZOMBIE = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_message.ml#L9)

<a id="function-function-mq3-server-client-message-execute-function-execute-serverstate-clientstate-host-msg-src-mq3-server-client-message-ml-862275497"></a>
### execute

```ml
function execute(serverState, clientState, host, msg)
```

Execute client message in server.client_message; the normal completion returns `"eof"`.

Validation failures include `client message: missing state`.
Direct state writes: `clientState.messageAcknowledge`, `clientState.reliableAcknowledge`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `serverState` | `dynamic` | — | Record exposing `serverId`, `restartedServerId`. |
| `clientState` | `dynamic` | — | Record exposing `messageAcknowledge`, `reliableAcknowledge`, `reliableSequence`, `lastClientCommandString`, `downloadName`, `gamestateMessageNum`, `state`. Updated in place: `messageAcknowledge`, `reliableAcknowledge`. |
| `host` | `dynamic` | — | Record exposing `dropFn`, `sendGamestateFn`, `clientCommandFn`, `userMoveFn`, `diagnosticFn`. |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.bitstream`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_message.ml#L43)

<a id="constant-constant-mq3-server-client-message-max-reliable-commands-const-max-reliable-commands-64-src-mq3-server-client-message-ml-1803184575"></a>
### MAX_RELIABLE_COMMANDS

```ml
const MAX_RELIABLE_COMMANDS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_message.ml#L8)

- [mq3.server.client_message.Server](Type-mq3-server-client-message-server-1884311099.md) — struct
<a id="function-function-mq3-server-client-message-services-function-services-src-mq3-server-client-message-ml-22899144"></a>
### services

```ml
function services()
```

Create `mq3.server.client_message.Services` with clientCommandFn=void; userMoveFn=void; sendGamestateFn=void; dropFn=void; diagnosticFn=void; context=void.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_message.ml#L33)

- [mq3.server.client_message.Services](Type-mq3-server-client-message-services-149189296.md) — struct
