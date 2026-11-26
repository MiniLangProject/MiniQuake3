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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `clientState` | `dynamic` | — |  |
| `serverState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pipeline.ml#L20)

<a id="function-function-mq3-server-pipeline-create-function-create-level-clientnum-ringcapacity-baselines-downloadstate-downloadserver-downloadhost-netruntime-netchannel-src-mq3-server-pipeline-ml-422114260"></a>
### create

```ml
function create(level, clientNum, ringCapacity, baselines, downloadState, downloadServer, downloadHost, netRuntime, netChannel)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `ringCapacity` | `dynamic` | — |  |
| `baselines` | `dynamic` | — |  |
| `downloadState` | `dynamic` | — |  |
| `downloadServer` | `dynamic` | — |  |
| `downloadHost` | `dynamic` | — |  |
| `netRuntime` | `dynamic` | — |  |
| `netChannel` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pipeline.ml#L12)

<a id="function-function-mq3-server-pipeline-host-function-host-pipe-src-mq3-server-pipeline-ml-2086071502"></a>
### host

```ml
function host(pipe)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pipe` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pipeline.ml#L51)

<a id="function-function-mq3-server-pipeline-islan-function-islan-host-clientstate-src-mq3-server-pipeline-ml-59647920"></a>
### isLan

```ml
function isLan(host, clientState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `clientState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pipeline.ml#L50)

<a id="function-function-mq3-server-pipeline-islocal-function-islocal-host-clientstate-src-mq3-server-pipeline-ml-2049157268"></a>
### isLocal

```ml
function isLocal(host, clientState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `clientState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pipeline.ml#L49)

- [mq3.server.pipeline.Pipeline](Type-mq3-server-pipeline-pipeline-1212532013.md) — struct
<a id="function-function-mq3-server-pipeline-sendsnapshot-function-sendsnapshot-pipe-level-time-src-mq3-server-pipeline-ml-1353536231"></a>
### sendSnapshot

```ml
function sendSnapshot(pipe, level, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `pipe` | `dynamic` | — |  |
| `level` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pipeline.ml#L53)

<a id="function-function-mq3-server-pipeline-transmit-function-transmit-host-clientstate-payload-src-mq3-server-pipeline-ml-1466365306"></a>
### transmit

```ml
function transmit(host, clientState, payload)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `clientState` | `dynamic` | — |  |
| `payload` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pipeline.ml#L40)

<a id="function-function-mq3-server-pipeline-writedownload-function-writedownload-host-clientstate-msg-src-mq3-server-pipeline-ml-1701712815"></a>
### writeDownload

```ml
function writeDownload(host, clientState, msg)
```

Runtime level is attached only for the synchronous duration of sendSnapshot.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `clientState` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/pipeline.ml#L32)
