# `src/mq3/client/server_command_stream.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.server_command_stream`](Package-mq3-client-server-command-stream-1126703377.md)

Reachable from entry: **yes**

## Imports

- `mq3/qcommon/command_buffer.ml` as `command` → [src/mq3/qcommon/command_buffer.ml](File-src-mq3-qcommon-command-buffer-ml-122952676.md)

## Declarations

<a id="constant-constant-mq3-client-server-command-stream-big-info-string-const-big-info-string-8192-src-mq3-client-server-command-stream-ml-1845933809"></a>
### BIG_INFO_STRING

```ml
const BIG_INFO_STRING = 8192
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_command_stream.ml#L9)

<a id="function-function-mq3-client-server-command-stream-create-function-create-commandstate-configstrings-src-mq3-client-server-command-stream-ml-1444738370"></a>
### create

```ml
function create(commandState, configstrings)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — |  |
| `configstrings` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_command_stream.ml#L35)

<a id="constant-constant-mq3-client-server-command-stream-cs-systeminfo-const-cs-systeminfo-1-src-mq3-client-server-command-stream-ml-88308008"></a>
### CS_SYSTEMINFO

```ml
const CS_SYSTEMINFO = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_command_stream.ml#L11)

<a id="function-function-mq3-client-server-command-stream-get-function-get-state-host-number-src-mq3-client-server-command-stream-ml-1604669394"></a>
### get

```ml
function get(state, host, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_command_stream.ml#L69)

<a id="constant-constant-mq3-client-server-command-stream-max-configstrings-const-max-configstrings-1024-src-mq3-client-server-command-stream-ml-1424815438"></a>
### MAX_CONFIGSTRINGS

```ml
const MAX_CONFIGSTRINGS = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_command_stream.ml#L10)

<a id="constant-constant-mq3-client-server-command-stream-max-reliable-commands-const-max-reliable-commands-64-src-mq3-client-server-command-stream-ml-2060510799"></a>
### MAX_RELIABLE_COMMANDS

```ml
const MAX_RELIABLE_COMMANDS = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_command_stream.ml#L8)

<a id="function-function-mq3-client-server-command-stream-queue-function-queue-state-text-src-mq3-client-server-command-stream-ml-1667189820"></a>
### queue

```ml
function queue(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_command_stream.ml#L42)

<a id="function-function-mq3-client-server-command-stream-services-function-services-src-mq3-client-server-command-stream-ml-35372526"></a>
### services

```ml
function services()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_command_stream.ml#L34)

- [mq3.client.server_command_stream.Services](Type-mq3-client-server-command-stream-services-921509293.md) — struct
<a id="function-function-mq3-client-server-command-stream-setsequence-function-setsequence-state-sequence-commands-src-mq3-client-server-command-stream-ml-926277336"></a>
### setSequence

```ml
function setSequence(state, sequence, commands)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `sequence` | `dynamic` | — |  |
| `commands` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_command_stream.ml#L49)

- [mq3.client.server_command_stream.State](Type-mq3-client-server-command-stream-state-1716556974.md) — struct
<a id="function-function-mq3-client-server-command-stream-toolong-function-toolong-prefix-value-extra-src-mq3-client-server-command-stream-ml-564194421"></a>
### tooLong

```ml
function tooLong(prefix, value, extra)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `prefix` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `extra` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_command_stream.ml#L65)

<a id="function-function-mq3-client-server-command-stream-updateconfigstring-function-updateconfigstring-state-host-src-mq3-client-server-command-stream-ml-2004200445"></a>
### updateConfigstring

```ml
function updateConfigstring(state, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/server_command_stream.ml#L56)
