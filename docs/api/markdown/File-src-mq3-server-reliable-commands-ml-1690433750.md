# `src/mq3/server/reliable_commands.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.reliable_commands`](Package-mq3-server-reliable-commands-259102878.md)

Reachable from entry: **yes**

## Imports

- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)

## Declarations

<a id="function-function-mq3-server-reliable-commands-acknowledge-function-acknowledge-client-sequence-src-mq3-server-reliable-commands-ml-411727500"></a>
### acknowledge

```ml
function acknowledge(client, sequence)
```

The stale acknowledgement repair used before snapshot construction in SV_ExecuteClientMessage. Future acknowledgements are retained by Baseq3.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — | Record exposing `reliableAcknowledge`, `reliableSequence`. Updated in place: `reliableAcknowledge`. |
| `sequence` | `dynamic` | — | Sequence operand used by `acknowledge`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/reliable_commands.ml#L58)

<a id="function-function-mq3-server-reliable-commands-add-function-add-client-text-src-mq3-server-reliable-commands-ml-1669790468"></a>
### add

```ml
function add(client, text)
```

Exact reliable ring insertion rule from SV_AddServerCommand. A false result represents the original connection-drop boundary when 65 commands are pending.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — | Record exposing `reliableSequence`, `reliableAcknowledge`, `reliableCommands`. Updated in place: `reliableSequence`. |
| `text` | `dynamic` | — | Text operand used by `add`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/reliable_commands.ml#L46)

<a id="function-function-mq3-server-reliable-commands-commandat-function-commandat-client-sequence-src-mq3-server-reliable-commands-ml-74566696"></a>
### commandAt

```ml
function commandAt(client, sequence)
```

Compute command at in server.reliable_commands; the normal completion returns `client.reliableCommands[(sequence & (MAX_RELIABLE_COMMANDS - 1))]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — | Record exposing `reliableCommands`. |
| `sequence` | `dynamic` | — | Sequence used in `(sequence & (MAX_RELIABLE_COMMANDS - 1))` and `client.reliableCommands[(sequence & (MAX_RELIABLE_COMMANDS - 1))]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/reliable_commands.ml#L37)

<a id="function-function-mq3-server-reliable-commands-create-function-create-src-mq3-server-reliable-commands-ml-1179031262"></a>
### create

```ml
function create()
```

Create `mq3.server.reliable_commands.ReliableClient` with reliableAcknowledge=0; reliableSequence=0; reliableSent=0; reliableCommands=array(MAX_RELIABLE_COMMANDS, "").


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/reliable_commands.ml#L19)

<a id="constant-constant-mq3-server-reliable-commands-max-reliable-commands-const-max-reliable-commands-64-src-mq3-server-reliable-commands-ml-1176494295"></a>
### MAX_RELIABLE_COMMANDS

```ml
const MAX_RELIABLE_COMMANDS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/reliable_commands.ml#L7)

<a id="function-function-mq3-server-reliable-commands-pending-function-pending-client-src-mq3-server-reliable-commands-ml-2139074633"></a>
### pending

```ml
function pending(client)
```

Compute pending in server.reliable_commands; the normal completion returns `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — | Record exposing `reliableSequence`, `reliableAcknowledge`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/reliable_commands.ml#L70)

- [mq3.server.reliable_commands.ReliableClient](Type-mq3-server-reliable-commands-reliableclient-823202325.md) — struct
<a id="function-function-mq3-server-reliable-commands-requirering-function-requirering-client-src-mq3-server-reliable-commands-ml-106160385"></a>
### requireRing

```ml
function requireRing(client)
```

Compute require ring in server.reliable_commands.

Validation failures include `reliable commands: invalid command ring`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — | Record exposing `reliableCommands`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/reliable_commands.ml#L27)

<a id="constant-constant-mq3-server-reliable-commands-svc-server-command-const-svc-server-command-5-src-mq3-server-reliable-commands-ml-1592746956"></a>
### SVC_SERVER_COMMAND

```ml
const SVC_SERVER_COMMAND = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/reliable_commands.ml#L8)

<a id="function-function-mq3-server-reliable-commands-updateservercommandstoclient-function-updateservercommandstoclient-client-msg-src-mq3-server-reliable-commands-ml-1953107754"></a>
### updateServerCommandsToClient

```ml
function updateServerCommandsToClient(client, msg)
```

Exact SV_UpdateServerCommandsToClient loop. Each unacknowledged command is embedded as svc_serverCommand, its absolute sequence, and a C string.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — | Record exposing `reliableAcknowledge`, `reliableSequence`. Updated in place: `reliableSent`. |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeByte`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/reliable_commands.ml#L81)
