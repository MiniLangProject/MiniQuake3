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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |
| `frame` | `dynamic` | — |  |
| `newnum` | `dynamic` | — |  |
| `old` | `dynamic` | — |  |
| `unchanged` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_parse_runtime.ml#L34)

<a id="function-function-mq3-client-cl-parse-runtime-cl-parsecommandstring-function-cl-parsecommandstring-state-msg-src-mq3-client-cl-parse-runtime-ml-472072294"></a>
### CL_ParseCommandString

```ml
function CL_ParseCommandString(state, msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_parse_runtime.ml#L54)

<a id="function-function-mq3-client-cl-parse-runtime-cl-parsedownload-function-cl-parsedownload-state-services-msg-src-mq3-client-cl-parse-runtime-ml-2083716632"></a>
### CL_ParseDownload

```ml
function CL_ParseDownload(state, services, msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_parse_runtime.ml#L50)

<a id="function-function-mq3-client-cl-parse-runtime-cl-parsegamestate-function-cl-parsegamestate-state-msg-src-mq3-client-cl-parse-runtime-ml-1471854276"></a>
### CL_ParseGamestate

```ml
function CL_ParseGamestate(state, msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_parse_runtime.ml#L46)

<a id="function-function-mq3-client-cl-parse-runtime-cl-parsepacketentities-function-cl-parsepacketentities-state-msg-oldframe-newframe-src-mq3-client-cl-parse-runtime-ml-1818794589"></a>
### CL_ParsePacketEntities

```ml
function CL_ParsePacketEntities(state, msg, oldframe, newframe)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |
| `oldframe` | `dynamic` | — |  |
| `newframe` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_parse_runtime.ml#L38)

<a id="function-function-mq3-client-cl-parse-runtime-cl-parseservermessage-function-cl-parseservermessage-runtime-msg-src-mq3-client-cl-parse-runtime-ml-1329423721"></a>
### CL_ParseServerMessage

```ml
function CL_ParseServerMessage(runtime, msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_parse_runtime.ml#L58)

<a id="function-function-mq3-client-cl-parse-runtime-cl-parsesnapshot-function-cl-parsesnapshot-state-msg-src-mq3-client-cl-parse-runtime-ml-1793635312"></a>
### CL_ParseSnapshot

```ml
function CL_ParseSnapshot(state, msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_parse_runtime.ml#L42)

<a id="function-function-mq3-client-cl-parse-runtime-cl-systeminfochanged-function-cl-systeminfochanged-state-services-text-src-mq3-client-cl-parse-runtime-ml-1967363414"></a>
### CL_SystemInfoChanged

```ml
function CL_SystemInfoChanged(state, services, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `services` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_parse_runtime.ml#L63)

<a id="function-function-mq3-client-cl-parse-runtime-configureshownet-function-configureshownet-runtime-level-outputfn-context-src-mq3-client-cl-parse-runtime-ml-1785278722"></a>
### configureShownet

```ml
function configureShownet(runtime, level, outputFn, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `level` | `dynamic` | — |  |
| `outputFn` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_parse_runtime.ml#L23)

<a id="function-function-mq3-client-cl-parse-runtime-create-function-create-downloadservices-systemservices-src-mq3-client-cl-parse-runtime-ml-1688440143"></a>
### create

```ml
function create(downloadServices, systemServices)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `downloadServices` | `dynamic` | — |  |
| `systemServices` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_parse_runtime.ml#L15)

- [mq3.client.cl_parse_runtime.Runtime](Type-mq3-client-cl-parse-runtime-runtime-1984470323.md) — struct
<a id="function-function-mq3-client-cl-parse-runtime-shownet-function-shownet-state-msg-text-src-mq3-client-cl-parse-runtime-ml-900360411"></a>
### SHOWNET

```ml
function SHOWNET(state, msg, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/cl_parse_runtime.ml#L29)
