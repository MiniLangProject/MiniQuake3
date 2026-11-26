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
| `client` | `dynamic` | — |  |
| `sequence` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/reliable_commands.ml#L45)

<a id="function-function-mq3-server-reliable-commands-add-function-add-client-text-src-mq3-server-reliable-commands-ml-1669790468"></a>
### add

```ml
function add(client, text)
```

Exact reliable ring insertion rule from SV_AddServerCommand. A false result represents the original connection-drop boundary when 65 commands are pending.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/reliable_commands.ml#L35)

<a id="function-function-mq3-server-reliable-commands-commandat-function-commandat-client-sequence-src-mq3-server-reliable-commands-ml-74566696"></a>
### commandAt

```ml
function commandAt(client, sequence)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — |  |
| `sequence` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/reliable_commands.ml#L28)

<a id="function-function-mq3-server-reliable-commands-create-function-create-src-mq3-server-reliable-commands-ml-1179031262"></a>
### create

```ml
function create()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/reliable_commands.ml#L17)

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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/reliable_commands.ml#L55)

- [mq3.server.reliable_commands.ReliableClient](Type-mq3-server-reliable-commands-reliableclient-823202325.md) — struct
<a id="function-function-mq3-server-reliable-commands-requirering-function-requirering-client-src-mq3-server-reliable-commands-ml-106160385"></a>
### requireRing

```ml
function requireRing(client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/reliable_commands.ml#L21)

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
| `client` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/reliable_commands.ml#L64)
