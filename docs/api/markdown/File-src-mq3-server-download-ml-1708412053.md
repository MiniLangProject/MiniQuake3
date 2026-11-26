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

Update `state.sendTime`, `state.clientBlock` in server.download; the normal completion returns `true`.

Direct state writes: `state.sendTime`, `state.clientBlock`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `clientBlock`, `blockSizes`. Updated in place: `sendTime`, `clientBlock`. |
| `serverState` | `dynamic` | — | Record exposing `time`. |
| `host` | `dynamic` | — | Record exposing `dropFn`. |
| `block` | `dynamic` | — | Block used in `(block != state.clientBlock)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L277)

<a id="function-function-mq3-server-download-begindownload-function-begindownload-state-host-name-src-mq3-server-download-ml-155499394"></a>
### beginDownload

```ml
function beginDownload(state, host, name)
```

Begin download in server.download; updates `state.name`.

Validation failures include `download command: missing state or host`.
Direct state writes: `state.name`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Updated in place: `name`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.server.download.close`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.server.download.qpath`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L147)

<a id="function-function-mq3-server-download-blockcount-function-blockcount-state-maxrate-src-mq3-server-download-ml-1423307661"></a>
### blockCount

```ml
function blockCount(state, maxRate)
```

Compute block count in server.download; the normal completion returns `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `rate`, `snapshotMsec`. |
| `maxRate` | `dynamic` | — | Max rate used in `(maxRate != 0)` and `(maxRate < 1000)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L228)

<a id="function-function-mq3-server-download-close-function-close-state-host-src-mq3-server-download-ml-1756497127"></a>
### close

```ml
function close(state, host)
```

Close download in server.download; updates `state.handle`, `state.name`.

Direct state writes: `state.handle`, `state.name`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `handle`, `blocks`, `blockSizes`. Updated in place: `handle`, `name`. |
| `host` | `dynamic` | — | Record exposing `closeFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L126)

<a id="function-function-mq3-server-download-commandruntime-function-commandruntime-state-serverstate-downloadhost-sendgamestatefn-context-src-mq3-server-download-ml-1045979583"></a>
### commandRuntime

```ml
function commandRuntime(state, serverState, downloadHost, sendGamestateFn, context)
```

Create `mq3.server.download.CommandRuntime` with state=state; serverState=serverState; downloadHost=downloadHost; sendGamestateFn=sendGamestateFn; context=context.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Initial `state` field stored in the returned or constructed `mq3.server.download.CommandRuntime` record. |
| `serverState` | `dynamic` | — | Initial `serverState` field stored in the returned or constructed `mq3.server.download.CommandRuntime` record. |
| `downloadHost` | `dynamic` | — | Initial `downloadHost` field stored in the returned or constructed `mq3.server.download.CommandRuntime` record. |
| `sendGamestateFn` | `dynamic` | — | Initial `sendGamestateFn` field stored in the returned or constructed `mq3.server.download.CommandRuntime` record. |
| `context` | `dynamic` | — | Initial `context` field stored in the returned or constructed `mq3.server.download.CommandRuntime` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L117)

- [mq3.server.download.CommandRuntime](Type-mq3-server-download-commandruntime-583942862.md) — struct
<a id="function-function-mq3-server-download-create-function-create-name-rate-snapshotmsec-src-mq3-server-download-ml-1849929887"></a>
### create

```ml
function create(name, rate, snapshotMsec)
```

Create `mq3.server.download.State` with name=name; handle=void; size=0; count=0; 9 further fields.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Initial `name` field stored in the returned or constructed `mq3.server.download.State` record. |
| `rate` | `dynamic` | — | Initial `rate` field stored in the returned or constructed `mq3.server.download.State` record. |
| `snapshotMsec` | `dynamic` | — | Initial `snapshotMsec` field stored in the returned or constructed `mq3.server.download.State` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L52)

<a id="function-function-mq3-server-download-dispatchcommand-function-dispatchcommand-dispatchhost-clientstate-name-parser-src-mq3-server-download-ml-1464656290"></a>
### dispatchCommand

```ml
function dispatchCommand(dispatchHost, clientState, name, parser)
```

Signature-compatible with client_command_dispatch.Services.downloadFn.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `dispatchHost` | `dynamic` | — | Record exposing `downloadContext`. |
| `clientState` | `dynamic` | — | Client state passed as `clientState` to `mq3.server.download.doneDownload`. |
| `name` | `dynamic` | — | Name used in `(name == "nextdl")` and `(name == "stopdl")`. |
| `parser` | `dynamic` | — | State passed as `state` to `mq3.qcommon.command_buffer.argv`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L178)

<a id="function-function-mq3-server-download-donedownload-function-donedownload-runtime-clientstate-src-mq3-server-download-ml-1528579450"></a>
### doneDownload

```ml
function doneDownload(runtime, clientState)
```

Compute done download in server.download.

Validation failures include `download command: missing runtime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `sendGamestateFn`. |
| `clientState` | `dynamic` | — | Client state used in `runtime.sendGamestateFn(runtime, clientState)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L167)

<a id="function-function-mq3-server-download-failuretext-function-failuretext-state-serverstate-idpack-missionpack-src-mq3-server-download-ml-2096731120"></a>
### failureText

```ml
function failureText(state, serverState, idPack, missionPack)
```

Compute failure text in server.download; the normal completion returns `(("File \"" + state.name) + "\" not found on server for autodownloading.\n")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `name`. |
| `serverState` | `dynamic` | — | Record exposing `allowDownload`, `pure`. |
| `idPack` | `dynamic` | — | Id pack operand used by `failureText`; its reads are shown in the implementation. |
| `missionPack` | `dynamic` | — | Mission pack operand used by `failureText`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L193)

<a id="constant-constant-mq3-server-download-max-download-blksize-const-max-download-blksize-2048-src-mq3-server-download-ml-463438019"></a>
### MAX_DOWNLOAD_BLKSIZE

```ml
const MAX_DOWNLOAD_BLKSIZE = 2048
```

2048 byte block chunks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L13)

<a id="constant-constant-mq3-server-download-max-download-window-const-max-download-window-8-src-mq3-server-download-ml-694569361"></a>
### MAX_DOWNLOAD_WINDOW

```ml
const MAX_DOWNLOAD_WINDOW = 8
```

Max of eight download frames.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L11)

<a id="constant-constant-mq3-server-download-max-qpath-const-max-qpath-64-src-mq3-server-download-ml-1708417873"></a>
### MAX_QPATH

```ml
const MAX_QPATH = 64
```

Maximum character capacity reserved for a Quake asset path.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L17)

<a id="function-function-mq3-server-download-openifneeded-function-openifneeded-state-serverstate-host-msg-src-mq3-server-download-ml-762905714"></a>
### openIfNeeded

```ml
function openIfNeeded(state, serverState, host, msg)
```

Open if needed in server.download; the normal completion returns `true`.

Validation failures include `download: missing filesystem service`.
Direct state writes: `state.name`, `state.handle`, `state.size`, `state.currentBlock`, `state.clientBlock`, `state.xmitBlock`, `state.count`, `state.eof`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `handle`, `name`. Updated in place: `name`, `handle`, `size`, `currentBlock`, `clientBlock`, `xmitBlock` and further fields. |
| `serverState` | `dynamic` | — | Record exposing `allowDownload`. |
| `host` | `dynamic` | — | Record exposing `idPakFn`, `openFn`. |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.writeByte`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L213)

<a id="function-function-mq3-server-download-qpath-function-qpath-name-src-mq3-server-download-ml-2078477661"></a>
### qpath

```ml
function qpath(name)
```

Compute qpath in server.download; the normal completion returns `decode(slice(data, 0, count))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used in `bytes(name)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L135)

<a id="function-function-mq3-server-download-server-function-server-time-allowdownload-pure-maxrate-src-mq3-server-download-ml-1273670238"></a>
### server

```ml
function server(time, allowDownload, pure, maxRate)
```

Create `mq3.server.download.Server` with time=time; allowDownload=allowDownload; pure=pure; maxRate=maxRate.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | `dynamic` | — | Initial `time` field stored in the returned or constructed `mq3.server.download.Server` record. |
| `allowDownload` | `dynamic` | — | Initial `allowDownload` field stored in the returned or constructed `mq3.server.download.Server` record. |
| `pure` | `dynamic` | — | Initial `pure` field stored in the returned or constructed `mq3.server.download.Server` record. |
| `maxRate` | `dynamic` | — | Initial `maxRate` field stored in the returned or constructed `mq3.server.download.Server` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L71)

- [mq3.server.download.Server](Type-mq3-server-download-server-1977836046.md) — struct
<a id="function-function-mq3-server-download-services-function-services-idpakfn-openfn-readfn-closefn-dropfn-context-src-mq3-server-download-ml-364164795"></a>
### services

```ml
function services(idPakFn, openFn, readFn, closeFn, dropFn, context)
```

Create `mq3.server.download.Services` with idPakFn=idPakFn; openFn=openFn; readFn=readFn; closeFn=closeFn; dropFn=dropFn; context=context.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `idPakFn` | `dynamic` | — | Initial `idPakFn` field stored in the returned or constructed `mq3.server.download.Services` record. |
| `openFn` | `dynamic` | — | Initial `openFn` field stored in the returned or constructed `mq3.server.download.Services` record. |
| `readFn` | `dynamic` | — | Initial `readFn` field stored in the returned or constructed `mq3.server.download.Services` record. |
| `closeFn` | `dynamic` | — | Initial `closeFn` field stored in the returned or constructed `mq3.server.download.Services` record. |
| `dropFn` | `dynamic` | — | Initial `dropFn` field stored in the returned or constructed `mq3.server.download.Services` record. |
| `context` | `dynamic` | — | Initial `context` field stored in the returned or constructed `mq3.server.download.Services` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L94)

- [mq3.server.download.Services](Type-mq3-server-download-services-2065249425.md) — struct
- [mq3.server.download.State](Type-mq3-server-download-state-1637242474.md) — struct
<a id="function-function-mq3-server-download-stopdownload-function-stopdownload-state-host-src-mq3-server-download-ml-1281519035"></a>
### stopDownload

```ml
function stopDownload(state, host)
```

Stop download in server.download.

Validation failures include `download command: missing state or host`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.server.download.close`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.server.download.close`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L157)

<a id="constant-constant-mq3-server-download-svc-download-const-svc-download-6-src-mq3-server-download-ml-386795511"></a>
### SVC_DOWNLOAD

```ml
const SVC_DOWNLOAD = 6
```

Server-to-client opcode introducing an asset download block.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L15)

<a id="function-function-mq3-server-download-writetoclient-function-writetoclient-state-serverstate-host-msg-src-mq3-server-download-ml-479279476"></a>
### writeToClient

```ml
function writeToClient(state, serverState, host, msg)
```

Write to client in server.download; the normal completion returns `written`.

Direct state writes: `state.count`, `state.currentBlock`, `state.eof`, `state.xmitBlock`, `state.sendTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `name`, `currentBlock`, `clientBlock`, `size`, `count`, `handle`, `blocks` and further fields. Updated in place: `count`, `currentBlock`, `eof`, `xmitBlock`, `sendTime`. |
| `serverState` | `dynamic` | — | Record exposing `maxRate`, `time`. |
| `host` | `dynamic` | — | Record exposing `readFn`. |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.server.download.openIfNeeded`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/download.ml#L244)
