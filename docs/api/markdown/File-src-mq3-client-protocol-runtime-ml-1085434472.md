# `src/mq3/client/protocol_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.protocol_runtime`](Package-mq3-client-protocol-runtime-290981598.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/download.ml` as `download` → [src/mq3/client/download.ml](File-src-mq3-client-download-ml-170988721.md)
- `mq3/client/gamestate.ml` as `gamestate` → [src/mq3/client/gamestate.ml](File-src-mq3-client-gamestate-ml-1690167636.md)
- `mq3/client/server_message.ml` as `serverMessage` → [src/mq3/client/server_message.ml](File-src-mq3-client-server-message-ml-749329636.md)
- `mq3/client/snapshot_command.ml` as `snapshotCommand` → [src/mq3/client/snapshot_command.ml](File-src-mq3-client-snapshot-command-ml-285373799.md)

## Declarations

<a id="function-function-mq3-client-protocol-runtime-create-function-create-downloadservices-src-mq3-client-protocol-runtime-ml-1579134484"></a>
### create

```ml
function create(downloadServices)
```

Calls `mq3.client.download.services`, `mq3.client.server_message.create`, `mq3.client.protocol_runtime.Runtime` and additional helpers from protocol runtime `create`. The final path returns `runtime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `downloadServices` | `dynamic` | — | Value used by `if downloadServices==void then downloadServices=download.services() end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/protocol_runtime.ml#L47)

<a id="function-function-mq3-client-protocol-runtime-downloadcommand-function-downloadcommand-dispatcher-msg-src-mq3-client-protocol-runtime-ml-1132138684"></a>
### downloadCommand

```ml
function downloadCommand(dispatcher, msg)
```

Calls `mq3.client.download.parseDownload` from protocol runtime `downloadCommand`. The final path returns `download.parseDownload(runtime.downloadState,runtime.downloadServices,msg)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dispatcher` | `dynamic` | — | Record read through `dispatcher.context`. |
| `msg` | `dynamic` | — | Value used by `return download.parseDownload(runtime.downloadState,runtime.downloadServices,msg)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/protocol_runtime.ml#L39)

<a id="function-function-mq3-client-protocol-runtime-gamestatecommand-function-gamestatecommand-dispatcher-msg-src-mq3-client-protocol-runtime-ml-1708327414"></a>
### gamestateCommand

```ml
function gamestateCommand(dispatcher, msg)
```

Updates `dispatcher.snapshotState`, `dispatcher.serverCommandSequence`, `dispatcher.snapshotState.serverCommandSequence`, `dispatcher.snapshotState.entityState.entityBaselines` during protocol runtime `gamestateCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dispatcher` | `dynamic` | — | Mutable protocol runtime record/storage; this routine assigns `dispatcher.snapshotState`, `dispatcher.serverCommandSequence`, `dispatcher.snapshotState.serverCommandSequence`, `dispatcher.snapshotState.entityState.entityBaselines`. |
| `msg` | `dynamic` | — | Value used by `parsed=try(gamestate.parse(runtime.gamestateState,msg))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/protocol_runtime.ml#L22)

<a id="function-function-mq3-client-protocol-runtime-parse-function-parse-runtime-msg-src-mq3-client-protocol-runtime-ml-962627107"></a>
### parse

```ml
function parse(runtime, msg)
```

Calls `mq3.client.server_message.parseServerMessage` from protocol runtime `parse`. The final path returns `serverMessage.parseServerMessage(runtime.dispatcher,msg)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record read through `runtime.dispatcher`. |
| `msg` | `dynamic` | — | Value used by `return serverMessage.parseServerMessage(runtime.dispatcher,msg)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/protocol_runtime.ml#L57)

- [mq3.client.protocol_runtime.Runtime](Type-mq3-client-protocol-runtime-runtime-2050442980.md) — struct
