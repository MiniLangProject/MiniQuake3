# `src/mq3/server/pipeline.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.pipeline`](Package-mq3-server-pipeline-630508703.md)

Reachable from entry: **yes**

## Imports

- `mq3/qcommon/netchan.ml` as `pipelineNetchan` → [src/mq3/qcommon/netchan.ml](File-src-mq3-qcommon-netchan-ml-1381353623.md)
- `mq3/server/download.ml` as `pipelineDownload` → [src/mq3/server/download.ml](File-src-mq3-server-download-ml-1708412053.md)
- `mq3/server/snapshot_runtime.ml` as `pipelineSnapshotRuntime` → [src/mq3/server/snapshot_runtime.ml](File-src-mq3-server-snapshot-runtime-ml-1458120552.md)
- `mq3/server/snapshot_send.ml` as `pipelineSnapshotSend` → [src/mq3/server/snapshot_send.ml](File-src-mq3-server-snapshot-send-ml-704467576.md)

## Declarations

<a id="function-function-mq3-server-pipeline-buildsnapshot-function-buildsnapshot-host-clientstate-serverstate-src-mq3-server-pipeline-ml-707377932"></a>
### buildSnapshot

```ml
function buildSnapshot(host, clientState, serverState)
```

Build snapshot in server.pipeline; the normal completion returns `frame`.

Direct state writes: `serverState.snapshotEntities`, `serverState.snapshotCapacity`, `serverState.nextSnapshotEntities`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |
| `clientState` | `dynamic` | — | Record exposing `state`, `frames`, `outgoingSequence`. |
| `serverState` | `dynamic` | — | Updated in place: `snapshotEntities`, `snapshotCapacity`, `nextSnapshotEntities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pipeline.ml#L66)

<a id="function-function-mq3-server-pipeline-create-function-create-level-clientnum-ringcapacity-baselines-downloadstate-downloadserver-downloadhost-netruntime-netchannel-src-mq3-server-pipeline-ml-422114260"></a>
### create

```ml
function create(level, clientNum, ringCapacity, baselines, downloadState, downloadServer, downloadHost, netRuntime, netChannel)
```

Create pipeline in server.pipeline.

Validation failures include `server pipeline: bad client`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Record exposing `clients`. |
| `clientNum` | `dynamic` | — | Initial `clientNum` field stored in the returned or constructed `mq3.server.pipeline.Pipeline` record. |
| `ringCapacity` | `dynamic` | — | Ring capacity passed as `ringCapacity` to `mq3.server.snapshot_runtime.create`. |
| `baselines` | `dynamic` | — | Baselines passed as `baselines` to `mq3.server.snapshot_send.server`. |
| `downloadState` | `dynamic` | — | Initial `downloadState` field stored in the returned or constructed `mq3.server.pipeline.Pipeline` record. |
| `downloadServer` | `dynamic` | — | Initial `downloadServer` field stored in the returned or constructed `mq3.server.pipeline.Pipeline` record. |
| `downloadHost` | `dynamic` | — | Initial `downloadHost` field stored in the returned or constructed `mq3.server.pipeline.Pipeline` record. |
| `netRuntime` | `dynamic` | — | Initial `netRuntime` field stored in the returned or constructed `mq3.server.pipeline.Pipeline` record. |
| `netChannel` | `dynamic` | — | Record exposing `outgoingSequence`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pipeline.ml#L52)

<a id="function-function-mq3-server-pipeline-host-function-host-pipe-src-mq3-server-pipeline-ml-2086071502"></a>
### host

```ml
function host(pipe)
```

Return `mq3.server.snapshot_send.services(buildSnapshot, writeDownload, transmit, isLocal, isLan, pipe)` from `server.pipeline.host`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pipe` | `dynamic` | — | Context passed as `context` to `mq3.server.snapshot_send.services`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pipeline.ml#L114)

<a id="function-function-mq3-server-pipeline-islan-function-islan-host-clientstate-src-mq3-server-pipeline-ml-59647920"></a>
### isLan

```ml
function isLan(host, clientState)
```

Compute server.pipeline.isLan as `host.context.lan`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |
| `clientState` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pipeline.ml#L111)

<a id="function-function-mq3-server-pipeline-islocal-function-islocal-host-clientstate-src-mq3-server-pipeline-ml-2049157268"></a>
### isLocal

```ml
function isLocal(host, clientState)
```

Compute server.pipeline.isLocal as `host.context.local`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |
| `clientState` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pipeline.ml#L107)

- [mq3.server.pipeline.Pipeline](Type-mq3-server-pipeline-pipeline-1212532013.md) — struct
<a id="function-function-mq3-server-pipeline-sendsnapshot-function-sendsnapshot-pipe-level-time-src-mq3-server-pipeline-ml-1353536231"></a>
### sendSnapshot

```ml
function sendSnapshot(pipe, level, time)
```

Send snapshot in server.pipeline; the normal completion returns `result`.

Validation failures include `server pipeline: level mismatch`.
Direct state writes: `pipe.runtimeLevel`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pipe` | `dynamic` | — | Record exposing `runtime`, `server`, `client`, `netChannel`. Updated in place: `runtimeLevel`. |
| `level` | `dynamic` | — | Record exposing `scene`. |
| `time` | `dynamic` | — | Time operand used by `sendSnapshot`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pipeline.ml#L123)

<a id="function-function-mq3-server-pipeline-transmit-function-transmit-host-clientstate-payload-src-mq3-server-pipeline-ml-1466365306"></a>
### transmit

```ml
function transmit(host, clientState, payload)
```

Update `clientState.outgoingSequence` in server.pipeline; the normal completion returns `len(pipe.fragments)`.

Direct state writes: `clientState.outgoingSequence`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |
| `clientState` | `dynamic` | — | Updated in place: `outgoingSequence`. |
| `payload` | `dynamic` | — | Data passed as `data` to `mq3.qcommon.netchan.transmit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pipeline.ml#L95)

<a id="function-function-mq3-server-pipeline-writedownload-function-writedownload-host-clientstate-msg-src-mq3-server-pipeline-ml-1701712815"></a>
### writeDownload

```ml
function writeDownload(host, clientState, msg)
```

Runtime level is attached only for the synchronous duration of sendSnapshot.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |
| `clientState` | `dynamic` | — | Updated in place: `downloadName`. |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.server.download.writeToClient`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pipeline.ml#L81)
