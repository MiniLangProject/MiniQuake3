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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `snapshotState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L32)

<a id="function-function-mq3-client-server-message-emitshownet-function-emitshownet-state-line-src-mq3-client-server-message-ml-1528918005"></a>
### emitShownet

```ml
function emitShownet(state, line)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `line` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L51)

<a id="constant-constant-mq3-client-server-message-max-reliable-commands-const-max-reliable-commands-64-src-mq3-client-server-message-ml-713858343"></a>
### MAX_RELIABLE_COMMANDS

```ml
const MAX_RELIABLE_COMMANDS = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L8)

<a id="function-function-mq3-client-server-message-pad3-function-pad3-value-src-mq3-client-server-message-ml-495164361"></a>
### pad3

```ml
function pad3(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L37)

<a id="function-function-mq3-client-server-message-parsecommandstring-function-parsecommandstring-state-msg-src-mq3-client-server-message-ml-1994860094"></a>
### parseCommandString

```ml
function parseCommandString(state, msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L69)

<a id="function-function-mq3-client-server-message-parseservermessage-function-parseservermessage-state-msg-src-mq3-client-server-message-ml-968209326"></a>
### parseServerMessage

```ml
function parseServerMessage(state, msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L77)

<a id="function-function-mq3-client-server-message-servicename-function-servicename-command-src-mq3-client-server-message-ml-2064532629"></a>
### serviceName

```ml
function serviceName(command)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `command` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L57)

<a id="function-function-mq3-client-server-message-shownet-function-shownet-state-msg-text-src-mq3-client-server-message-ml-280616253"></a>
### shownet

```ml
function shownet(state, msg, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L43)

- [mq3.client.server_message.State](Type-mq3-client-server-message-state-292969621.md) — struct
<a id="constant-constant-mq3-client-server-message-svc-bad-const-svc-bad-0-src-mq3-client-server-message-ml-1644798217"></a>
### SVC_BAD

```ml
const SVC_BAD = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L9)

<a id="constant-constant-mq3-client-server-message-svc-download-const-svc-download-6-src-mq3-client-server-message-ml-2069204263"></a>
### SVC_DOWNLOAD

```ml
const SVC_DOWNLOAD = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L13)

<a id="constant-constant-mq3-client-server-message-svc-eof-const-svc-eof-8-src-mq3-client-server-message-ml-209446589"></a>
### SVC_EOF

```ml
const SVC_EOF = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L15)

<a id="constant-constant-mq3-client-server-message-svc-gamestate-const-svc-gamestate-2-src-mq3-client-server-message-ml-426624351"></a>
### SVC_GAMESTATE

```ml
const SVC_GAMESTATE = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L11)

<a id="constant-constant-mq3-client-server-message-svc-nop-const-svc-nop-1-src-mq3-client-server-message-ml-1135619084"></a>
### SVC_NOP

```ml
const SVC_NOP = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L10)

<a id="constant-constant-mq3-client-server-message-svc-server-command-const-svc-server-command-5-src-mq3-client-server-message-ml-758536898"></a>
### SVC_SERVER_COMMAND

```ml
const SVC_SERVER_COMMAND = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L12)

<a id="constant-constant-mq3-client-server-message-svc-snapshot-const-svc-snapshot-7-src-mq3-client-server-message-ml-849610982"></a>
### SVC_SNAPSHOT

```ml
const SVC_SNAPSHOT = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_message.ml#L14)
