# `src/mq3/server/download.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.download`](Package-mq3-server-download-981793181.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `textnumbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/qcommon/command_buffer.ml` as `commandBuffer` → [src/mq3/qcommon/command_buffer.ml](File-src-mq3-qcommon-command-buffer-ml-122952676.md)
- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)

## Declarations

<a id="function-function-mq3-server-download-acknowledge-function-acknowledge-state-serverstate-host-block-src-mq3-server-download-ml-2029719434"></a>
### acknowledge

```ml
function acknowledge(state, serverState, host, block)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `serverState` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `block` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L130)

<a id="function-function-mq3-server-download-begindownload-function-begindownload-state-host-name-src-mq3-server-download-ml-155499394"></a>
### beginDownload

```ml
function beginDownload(state, host, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L44)

<a id="function-function-mq3-server-download-blockcount-function-blockcount-state-maxrate-src-mq3-server-download-ml-1423307661"></a>
### blockCount

```ml
function blockCount(state, maxRate)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `maxRate` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L95)

<a id="function-function-mq3-server-download-close-function-close-state-host-src-mq3-server-download-ml-1756497127"></a>
### close

```ml
function close(state, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L32)

<a id="function-function-mq3-server-download-commandruntime-function-commandruntime-state-serverstate-downloadhost-sendgamestatefn-context-src-mq3-server-download-ml-1045979583"></a>
### commandRuntime

```ml
function commandRuntime(state, serverState, downloadHost, sendGamestateFn, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `serverState` | `dynamic` | — |  |
| `downloadHost` | `dynamic` | — |  |
| `sendGamestateFn` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L28)

- [mq3.server.download.CommandRuntime](Type-mq3-server-download-commandruntime-583942862.md) — struct
<a id="function-function-mq3-server-download-create-function-create-name-rate-snapshotmsec-src-mq3-server-download-ml-1849929887"></a>
### create

```ml
function create(name, rate, snapshotMsec)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `rate` | `dynamic` | — |  |
| `snapshotMsec` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L16)

<a id="function-function-mq3-server-download-dispatchcommand-function-dispatchcommand-dispatchhost-clientstate-name-parser-src-mq3-server-download-ml-1464656290"></a>
### dispatchCommand

```ml
function dispatchCommand(dispatchHost, clientState, name, parser)
```

Signature-compatible with client_command_dispatch.Services.downloadFn.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dispatchHost` | `dynamic` | — |  |
| `clientState` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `parser` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L61)

<a id="function-function-mq3-server-download-donedownload-function-donedownload-runtime-clientstate-src-mq3-server-download-ml-1528579450"></a>
### doneDownload

```ml
function doneDownload(runtime, clientState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `clientState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L54)

<a id="function-function-mq3-server-download-failuretext-function-failuretext-state-serverstate-idpack-missionpack-src-mq3-server-download-ml-2096731120"></a>
### failureText

```ml
function failureText(state, serverState, idPack, missionPack)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `serverState` | `dynamic` | — |  |
| `idPack` | `dynamic` | — |  |
| `missionPack` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L71)

<a id="constant-constant-mq3-server-download-max-download-blksize-const-max-download-blksize-2048-src-mq3-server-download-ml-463438019"></a>
### MAX_DOWNLOAD_BLKSIZE

```ml
const MAX_DOWNLOAD_BLKSIZE = 2048
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L11)

<a id="constant-constant-mq3-server-download-max-download-window-const-max-download-window-8-src-mq3-server-download-ml-694569361"></a>
### MAX_DOWNLOAD_WINDOW

```ml
const MAX_DOWNLOAD_WINDOW = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L10)

<a id="constant-constant-mq3-server-download-max-qpath-const-max-qpath-64-src-mq3-server-download-ml-1708417873"></a>
### MAX_QPATH

```ml
const MAX_QPATH = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L13)

<a id="function-function-mq3-server-download-openifneeded-function-openifneeded-state-serverstate-host-msg-src-mq3-server-download-ml-762905714"></a>
### openIfNeeded

```ml
function openIfNeeded(state, serverState, host, msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `serverState` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L83)

<a id="function-function-mq3-server-download-qpath-function-qpath-name-src-mq3-server-download-ml-2078477661"></a>
### qpath

```ml
function qpath(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L39)

<a id="function-function-mq3-server-download-server-function-server-time-allowdownload-pure-maxrate-src-mq3-server-download-ml-1273670238"></a>
### server

```ml
function server(time, allowDownload, pure, maxRate)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | `dynamic` | — |  |
| `allowDownload` | `dynamic` | — |  |
| `pure` | `dynamic` | — |  |
| `maxRate` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L20)

- [mq3.server.download.Server](Type-mq3-server-download-server-1977836046.md) — struct
<a id="function-function-mq3-server-download-services-function-services-idpakfn-openfn-readfn-closefn-dropfn-context-src-mq3-server-download-ml-364164795"></a>
### services

```ml
function services(idPakFn, openFn, readFn, closeFn, dropFn, context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `idPakFn` | `dynamic` | — |  |
| `openFn` | `dynamic` | — |  |
| `readFn` | `dynamic` | — |  |
| `closeFn` | `dynamic` | — |  |
| `dropFn` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L22)

- [mq3.server.download.Services](Type-mq3-server-download-services-2065249425.md) — struct
- [mq3.server.download.State](Type-mq3-server-download-state-1637242474.md) — struct
<a id="function-function-mq3-server-download-stopdownload-function-stopdownload-state-host-src-mq3-server-download-ml-1281519035"></a>
### stopDownload

```ml
function stopDownload(state, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L49)

<a id="constant-constant-mq3-server-download-svc-download-const-svc-download-6-src-mq3-server-download-ml-386795511"></a>
### SVC_DOWNLOAD

```ml
const SVC_DOWNLOAD = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L12)

<a id="function-function-mq3-server-download-writetoclient-function-writetoclient-state-serverstate-host-msg-src-mq3-server-download-ml-479279476"></a>
### writeToClient

```ml
function writeToClient(state, serverState, host, msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `serverState` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L104)
