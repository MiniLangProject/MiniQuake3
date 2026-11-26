# `src/mq3/client/server_message.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.server_message`](Package-mq3-client-server-message-136625358.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/snapshot_command.ml` as `snapshotCommand` → [src/mq3/client/snapshot_command.ml](File-src-mq3-client-snapshot-command-ml-285373799.md)
- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)

## Declarations

<a id="function-function-mq3-client-server-message-create-function-create-snapshotstate-src-mq3-client-server-message-ml-832218357"></a>
### create

```ml
function create(snapshotState)
```

Creates reliable-command dispatch state, allocating snapshot state when the caller does not provide it.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshotState` | `dynamic` | — | Value used by `if snapshotState==void then snapshotState=snapshotCommand.create() end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L62)

<a id="function-function-mq3-client-server-message-emitshownet-function-emitshownet-state-line-src-mq3-client-server-message-ml-1528918005"></a>
### emitShownet

```ml
function emitShownet(state, line)
```

Appends a diagnostic line and forwards it to the optional shownet callback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable server message record/storage; this routine assigns `state.shownetLines`. |
| `line` | `dynamic` | — | Value used by `state.shownetLines=state.shownetLines+[line]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L90)

<a id="constant-constant-mq3-client-server-message-max-reliable-commands-const-max-reliable-commands-64-src-mq3-client-server-message-ml-713858343"></a>
### MAX_RELIABLE_COMMANDS

```ml
const MAX_RELIABLE_COMMANDS = 64
```

Capacity limit for the reliable commands collection or bounded storage used by this client module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L9)

<a id="function-function-mq3-client-server-message-pad3-function-pad3-value-src-mq3-client-server-message-ml-495164361"></a>
### pad3

```ml
function pad3(value)
```

Pads a diagnostic message offset to a minimum width of three characters.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `text=str(value)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L69)

<a id="function-function-mq3-client-server-message-parsecommandstring-function-parsecommandstring-state-msg-src-mq3-client-server-message-ml-1994860094"></a>
### parseCommandString

```ml
function parseCommandString(state, msg)
```

Reads a reliable server command, rejects truncated payloads and ignores already received command sequences.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable server message record/storage; this routine assigns `state.serverCommandSequence`, `state.serverCommands[sequence&(MAX_RELIABLE_COMMANDS-1)]`. |
| `msg` | `dynamic` | — | Message reader positioned before the command sequence and NUL-terminated command string. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L113)

<a id="function-function-mq3-client-server-message-parseservermessage-function-parseservermessage-state-msg-src-mq3-client-server-message-ml-968209326"></a>
### parseServerMessage

```ml
function parseServerMessage(state, msg)
```

Parses the reliable acknowledgement and dispatches server commands, snapshots, gamestates and downloads until EOF, returning command/snapshot counts.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable server message record/storage; this routine assigns `state.shownetLines`, `state.reliableAcknowledge`, `state.snapshotState.serverCommandSequence`, `state.snapshotState.shownetLevel` and additional values. |
| `msg` | `dynamic` | — | Mutable server-message reader; parsing switches to bitstream mode and advances its read cursor. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L124)

<a id="function-function-mq3-client-server-message-servicename-function-servicename-command-src-mq3-client-server-message-ml-2064532629"></a>
### serviceName

```ml
function serviceName(command)
```

Maps service-command bytes to their diagnostic names, retaining unknown numeric codes in a BAD CMD message.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `command` | `dynamic` | — | Value used by `if command==SVC_BAD then return "svc_bad" end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L98)

<a id="function-function-mq3-client-server-message-shownet-function-shownet-state-msg-text-src-mq3-client-server-message-ml-280616253"></a>
### shownet

```ml
function shownet(state, msg, text)
```

Records and optionally emits a byte-offset diagnostic line when shownet verbosity is at least two.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable server message record/storage; this routine assigns `state.shownetLines`. |
| `msg` | `dynamic` | — | Record read through `msg.readcount`. |
| `text` | `dynamic` | — | Text consumed or emitted by `shownet` in the server message path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L79)

- [mq3.client.server_message.State](Type-mq3-client-server-message-state-292969621.md) — struct
<a id="constant-constant-mq3-client-server-message-svc-bad-const-svc-bad-0-src-mq3-client-server-message-ml-1644798217"></a>
### SVC_BAD

```ml
const SVC_BAD = 0
```

Server-message command byte selecting the bad protocol operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L11)

<a id="constant-constant-mq3-client-server-message-svc-download-const-svc-download-6-src-mq3-client-server-message-ml-2069204263"></a>
### SVC_DOWNLOAD

```ml
const SVC_DOWNLOAD = 6
```

Server-message command byte selecting the download protocol operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L19)

<a id="constant-constant-mq3-client-server-message-svc-eof-const-svc-eof-8-src-mq3-client-server-message-ml-209446589"></a>
### SVC_EOF

```ml
const SVC_EOF = 8
```

Server-message command byte selecting the eof protocol operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L23)

<a id="constant-constant-mq3-client-server-message-svc-gamestate-const-svc-gamestate-2-src-mq3-client-server-message-ml-426624351"></a>
### SVC_GAMESTATE

```ml
const SVC_GAMESTATE = 2
```

Server-message command byte selecting the gamestate protocol operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L15)

<a id="constant-constant-mq3-client-server-message-svc-nop-const-svc-nop-1-src-mq3-client-server-message-ml-1135619084"></a>
### SVC_NOP

```ml
const SVC_NOP = 1
```

Server-message command byte selecting the nop protocol operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L13)

<a id="constant-constant-mq3-client-server-message-svc-server-command-const-svc-server-command-5-src-mq3-client-server-message-ml-758536898"></a>
### SVC_SERVER_COMMAND

```ml
const SVC_SERVER_COMMAND = 5
```

Server-message command byte selecting the server command protocol operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L17)

<a id="constant-constant-mq3-client-server-message-svc-snapshot-const-svc-snapshot-7-src-mq3-client-server-message-ml-849610982"></a>
### SVC_SNAPSHOT

```ml
const SVC_SNAPSHOT = 7
```

Server-message command byte selecting the snapshot protocol operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L21)
