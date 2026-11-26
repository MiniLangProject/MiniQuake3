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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_command_stream.ml#L9)

<a id="function-function-mq3-client-server-command-stream-create-function-create-commandstate-configstrings-src-mq3-client-server-command-stream-ml-1444738370"></a>
### create

```ml
function create(commandState, configstrings)
```

Creates the reliable server-command consumer with a 64-command ring and validates the configstring table capacity.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandState` | `dynamic` | — | commandState record passed to the server command stream helper calls. |
| `configstrings` | `dynamic` | — | Sequence whose length/content is inspected by `create`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_command_stream.ml#L41)

<a id="constant-constant-mq3-client-server-command-stream-cs-systeminfo-const-cs-systeminfo-1-src-mq3-client-server-command-stream-ml-88308008"></a>
### CS_SYSTEMINFO

```ml
const CS_SYSTEMINFO = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_command_stream.ml#L11)

<a id="function-function-mq3-client-server-command-stream-get-function-get-state-host-number-src-mq3-client-server-command-stream-ml-1604669394"></a>
### get

```ml
function get(state, host, number)
```

Consumes a numbered reliable command, assembles bcs fragments, updates configstrings and handles disconnect/map-restart/levelshot commands.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable server command stream record/storage; this routine assigns `state.lastExecuted`, `state.bigConfigString`. |
| `host` | `dynamic` | — | Optional callbacks for configstrings, system-info changes, map-restart cleanup and local levelshot commands. |
| `number` | `dynamic` | — | Reliable sequence to consume; commands beyond the received sequence are rejected, and expired ring entries fail outside demo playback. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_command_stream.ml#L93)

<a id="constant-constant-mq3-client-server-command-stream-max-configstrings-const-max-configstrings-1024-src-mq3-client-server-command-stream-ml-1424815438"></a>
### MAX_CONFIGSTRINGS

```ml
const MAX_CONFIGSTRINGS = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_command_stream.ml#L10)

<a id="constant-constant-mq3-client-server-command-stream-max-reliable-commands-const-max-reliable-commands-64-src-mq3-client-server-command-stream-ml-2060510799"></a>
### MAX_RELIABLE_COMMANDS

```ml
const MAX_RELIABLE_COMMANDS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_command_stream.ml#L8)

<a id="function-function-mq3-client-server-command-stream-queue-function-queue-state-text-src-mq3-client-server-command-stream-ml-1667189820"></a>
### queue

```ml
function queue(state, text)
```

Appends a reliable server command to the sequence ring and returns its assigned sequence number.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable server command stream record/storage; this routine assigns `state.commandSequence`, `state.commands[state.commandSequence&(MAX_RELIABLE_COMMANDS-1)]`. |
| `text` | `dynamic` | — | Text consumed or emitted by `queue` in the server command stream path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_command_stream.ml#L51)

<a id="function-function-mq3-client-server-command-stream-services-function-services-src-mq3-client-server-command-stream-ml-35372526"></a>
### services

```ml
function services()
```

Creates a `mq3.client.server_command_stream.Services` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_command_stream.ml#L37)

- [mq3.client.server_command_stream.Services](Type-mq3-client-server-command-stream-services-921509293.md) — struct
<a id="function-function-mq3-client-server-command-stream-setsequence-function-setsequence-state-sequence-commands-src-mq3-client-server-command-stream-ml-926277336"></a>
### setSequence

```ml
function setSequence(state, sequence, commands)
```

Copies a validated external reliable-command ring and its current sequence into the consumer state.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable server command stream record/storage; this routine assigns `state.commandSequence`, `state.commands[index]`. |
| `sequence` | `dynamic` | — | Value assigned to `state.commandSequence`. |
| `commands` | `dynamic` | — | Mutable sequence; this routine writes `commands[index]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_command_stream.ml#L62)

- [mq3.client.server_command_stream.State](Type-mq3-client-server-command-stream-state-1716556974.md) — struct
<a id="function-function-mq3-client-server-command-stream-toolong-function-toolong-prefix-value-extra-src-mq3-client-server-command-stream-ml-564194421"></a>
### tooLong

```ml
function tooLong(prefix, value, extra)
```

Checks whether a configstring fragment plus reserved terminator space reaches the BIG_INFO_STRING byte limit.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `prefix` | `dynamic` | — | Value used by `return len(bytes(prefix))+len(bytes(value))+extra>=BIG_INFO_STRING`. |
| `value` | `dynamic` | — | Value used by `return len(bytes(prefix))+len(bytes(value))+extra>=BIG_INFO_STRING`. |
| `extra` | `dynamic` | — | Additional bytes reserved for quoting or termination when testing the 8,192-byte configstring limit. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_command_stream.ml#L85)

<a id="function-function-mq3-client-server-command-stream-updateconfigstring-function-updateconfigstring-state-host-src-mq3-client-server-command-stream-ml-2004200445"></a>
### updateConfigstring

```ml
function updateConfigstring(state, host)
```

Applies the tokenized configstring command and notifies configstring/system-info callbacks as required.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable server command stream record/storage; this routine assigns `state.configstrings[index]`. |
| `host` | `dynamic` | — | Record read through `host.configstringFn`, `host.context`, `host.systemInfoFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/server_command_stream.ml#L72)
