# `src/mq3/client/cl_parse_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.cl_parse_runtime`](Package-mq3-client-cl-parse-runtime-1996921073.md)

Reachable from entry: **no**

## Imports

- `mq3/client/download.ml` as `download` → [src/mq3/client/download.ml](File-src-mq3-client-download-ml-170988721.md)
- `mq3/client/gamestate.ml` as `gamestate` → [src/mq3/client/gamestate.ml](File-src-mq3-client-gamestate-ml-1690167636.md)
- `mq3/client/protocol_runtime.ml` as `protocolRuntime` → [src/mq3/client/protocol_runtime.ml](File-src-mq3-client-protocol-runtime-ml-1085434472.md)
- `mq3/client/server_message.ml` as `serverMessage` → [src/mq3/client/server_message.ml](File-src-mq3-client-server-message-ml-749329636.md)
- `mq3/client/snapshot_command.ml` as `snapshotCommand` → [src/mq3/client/snapshot_command.ml](File-src-mq3-client-snapshot-command-ml-285373799.md)
- `mq3/client/snapshot_parse.ml` as `snapshotParse` → [src/mq3/client/snapshot_parse.ml](File-src-mq3-client-snapshot-parse-ml-455311349.md)
- `mq3/client/system_info.ml` as `systemInfo` → [src/mq3/client/system_info.ml](File-src-mq3-client-system-info-ml-628530239.md)

## Declarations

<a id="function-function-mq3-client-cl-parse-runtime-cl-deltaentity-function-cl-deltaentity-state-msg-frame-newnum-old-unchanged-src-mq3-client-cl-parse-runtime-ml-1433820355"></a>
### CL_DeltaEntity

```ml
function CL_DeltaEntity(state, msg, frame, newnum, old, unchanged)
```

Adapts `mq3.client.snapshot_parse.deltaEntity` to engine client parse runtime `CL_DeltaEntity`, returning its result for `state, msg, frame, newnum, old, unchanged`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.snapshot_parse.deltaEntity`. |
| `msg` | `dynamic` | — | Argument 2 of `mq3.client.snapshot_parse.deltaEntity`. |
| `frame` | `dynamic` | — | Argument 3 of `mq3.client.snapshot_parse.deltaEntity`. |
| `newnum` | `dynamic` | — | Argument 4 of `mq3.client.snapshot_parse.deltaEntity`. |
| `old` | `dynamic` | — | Argument 5 of `mq3.client.snapshot_parse.deltaEntity`. |
| `unchanged` | `dynamic` | — | Argument 6 of `mq3.client.snapshot_parse.deltaEntity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_parse_runtime.ml#L54)

<a id="function-function-mq3-client-cl-parse-runtime-cl-parsecommandstring-function-cl-parsecommandstring-state-msg-src-mq3-client-cl-parse-runtime-ml-472072294"></a>
### CL_ParseCommandString

```ml
function CL_ParseCommandString(state, msg)
```

Adapts `mq3.client.server_message.parseCommandString` to engine client parse runtime `CL_ParseCommandString`, returning its result for `state, msg`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.server_message.parseCommandString`. |
| `msg` | `dynamic` | — | Argument 2 of `mq3.client.server_message.parseCommandString`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_parse_runtime.ml#L92)

<a id="function-function-mq3-client-cl-parse-runtime-cl-parsedownload-function-cl-parsedownload-state-services-msg-src-mq3-client-cl-parse-runtime-ml-2083716632"></a>
### CL_ParseDownload

```ml
function CL_ParseDownload(state, services, msg)
```

Adapts `mq3.client.download.parseDownload` to engine client parse runtime `CL_ParseDownload`, returning its result for `state, services, msg`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.download.parseDownload`. |
| `services` | `dynamic` | — | Argument 2 of `mq3.client.download.parseDownload`. |
| `msg` | `dynamic` | — | Argument 3 of `mq3.client.download.parseDownload`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_parse_runtime.ml#L85)

<a id="function-function-mq3-client-cl-parse-runtime-cl-parsegamestate-function-cl-parsegamestate-state-msg-src-mq3-client-cl-parse-runtime-ml-1471854276"></a>
### CL_ParseGamestate

```ml
function CL_ParseGamestate(state, msg)
```

Adapts `mq3.client.gamestate.parse` to engine client parse runtime `CL_ParseGamestate`, returning its result for `state, msg`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.gamestate.parse`. |
| `msg` | `dynamic` | — | Argument 2 of `mq3.client.gamestate.parse`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_parse_runtime.ml#L77)

<a id="function-function-mq3-client-cl-parse-runtime-cl-parsepacketentities-function-cl-parsepacketentities-state-msg-oldframe-newframe-src-mq3-client-cl-parse-runtime-ml-1818794589"></a>
### CL_ParsePacketEntities

```ml
function CL_ParsePacketEntities(state, msg, oldframe, newframe)
```

Adapts `mq3.client.snapshot_parse.parsePacketEntities` to engine client parse runtime `CL_ParsePacketEntities`, returning its result for `state, msg, oldframe, newframe`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.snapshot_parse.parsePacketEntities`. |
| `msg` | `dynamic` | — | Argument 2 of `mq3.client.snapshot_parse.parsePacketEntities`. |
| `oldframe` | `dynamic` | — | Argument 3 of `mq3.client.snapshot_parse.parsePacketEntities`. |
| `newframe` | `dynamic` | — | Argument 4 of `mq3.client.snapshot_parse.parsePacketEntities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_parse_runtime.ml#L63)

<a id="function-function-mq3-client-cl-parse-runtime-cl-parseservermessage-function-cl-parseservermessage-runtime-msg-src-mq3-client-cl-parse-runtime-ml-1329423721"></a>
### CL_ParseServerMessage

```ml
function CL_ParseServerMessage(runtime, msg)
```

Calls `mq3.client.protocol_runtime.parse` from engine client parse runtime `CL_ParseServerMessage`. The final path returns `protocolRuntime.parse(runtime.protocol,msg)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record read through `runtime.protocol`. |
| `msg` | `dynamic` | — | Value used by `return protocolRuntime.parse(runtime.protocol,msg)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_parse_runtime.ml#L99)

<a id="function-function-mq3-client-cl-parse-runtime-cl-parsesnapshot-function-cl-parsesnapshot-state-msg-src-mq3-client-cl-parse-runtime-ml-1793635312"></a>
### CL_ParseSnapshot

```ml
function CL_ParseSnapshot(state, msg)
```

Adapts `mq3.client.snapshot_command.parseSnapshot` to engine client parse runtime `CL_ParseSnapshot`, returning its result for `state, msg`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.snapshot_command.parseSnapshot`. |
| `msg` | `dynamic` | — | Argument 2 of `mq3.client.snapshot_command.parseSnapshot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_parse_runtime.ml#L70)

<a id="function-function-mq3-client-cl-parse-runtime-cl-systeminfochanged-function-cl-systeminfochanged-state-services-text-src-mq3-client-cl-parse-runtime-ml-1967363414"></a>
### CL_SystemInfoChanged

```ml
function CL_SystemInfoChanged(state, services, text)
```

Adapts `mq3.client.system_info.apply` to engine client parse runtime `CL_SystemInfoChanged`, returning its result for `state, services, text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Argument 1 of `mq3.client.system_info.apply`. |
| `services` | `dynamic` | — | Argument 2 of `mq3.client.system_info.apply`. |
| `text` | `dynamic` | — | Argument 3 of `mq3.client.system_info.apply`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_parse_runtime.ml#L108)

<a id="function-function-mq3-client-cl-parse-runtime-configureshownet-function-configureshownet-runtime-level-outputfn-context-src-mq3-client-cl-parse-runtime-ml-1785278722"></a>
### configureShownet

```ml
function configureShownet(runtime, level, outputFn, context)
```

Evaluates engine client parse runtime `configureShownet` and returns `error(6990,"cl_parse: missing runtime")`, `void` according to its guard/selection conditions.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record read through `runtime.protocol.dispatcher`. |
| `level` | `dynamic` | — | Value assigned to `state.shownetLevel`. |
| `outputFn` | `dynamic` | — | Value assigned to `state.shownetFn`. |
| `context` | `dynamic` | — | Value assigned to `state.shownetContext`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_parse_runtime.ml#L32)

<a id="function-function-mq3-client-cl-parse-runtime-create-function-create-downloadservices-systemservices-src-mq3-client-cl-parse-runtime-ml-1688440143"></a>
### create

```ml
function create(downloadServices, systemServices)
```

Calls `mq3.client.download.services`, `mq3.client.system_info.services`, `mq3.client.protocol_runtime.create` and additional helpers from engine client parse runtime `create`. The final path returns `Runtime(protocol,systemState,systemServices)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `downloadServices` | `dynamic` | — | Value used by `if downloadServices==void then downloadServices=download.services() end if`. |
| `systemServices` | `dynamic` | — | Value used by `if systemServices==void then systemServices=systemInfo.services() end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_parse_runtime.ml#L19)

- [mq3.client.cl_parse_runtime.Runtime](Type-mq3-client-cl-parse-runtime-runtime-1984470323.md) — struct
<a id="function-function-mq3-client-cl-parse-runtime-shownet-function-shownet-state-msg-text-src-mq3-client-cl-parse-runtime-ml-900360411"></a>
### SHOWNET

```ml
function SHOWNET(state, msg, text)
```

Calls `mq3.client.server_message.shownet` from engine client parse runtime `SHOWNET`. The final path returns `serverMessage.shownet(state,msg,text)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Shared engine client parse runtime state passed to the helper calls in `SHOWNET`. |
| `msg` | `dynamic` | — | Value used by `if state==void or msg==void then return error(6991,"cl_parse: missing shownet state") end if`. |
| `text` | `dynamic` | — | Text consumed or emitted by `SHOWNET` in the engine client parse runtime path. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/cl_parse_runtime.ml#L42)
