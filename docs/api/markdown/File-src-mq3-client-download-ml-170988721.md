# `src/mq3/client/download.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.download`](Package-mq3-client-download-912091121.md)

Reachable from entry: **yes**

## Imports

- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)

## Declarations

<a id="function-function-mq3-client-download-call-function-call-service-host-a-b-src-mq3-client-download-ml-1348154282"></a>
### call

```ml
function call(service, host, a, b)
```

Calls `service` from download `call`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `service` | `dynamic` | — | Value used by `if service!=void then service(host,a,b) end if`. |
| `host` | `dynamic` | — | host record passed to the download helper calls. |
| `a` | `dynamic` | — | Value used by `if service!=void then service(host,a,b) end if`. |
| `b` | `dynamic` | — | Value used by `if service!=void then service(host,a,b) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/download.ml#L22)

<a id="function-function-mq3-client-download-create-function-create-src-mq3-client-download-ml-1144889066"></a>
### create

```ml
function create()
```

Creates a `mq3.client.download.State` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/download.ml#L14)

<a id="constant-constant-mq3-client-download-max-msglen-const-max-msglen-16384-src-mq3-client-download-ml-295364541"></a>
### MAX_MSGLEN

```ml
const MAX_MSGLEN = 16384
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/download.ml#L7)

<a id="function-function-mq3-client-download-parsedownload-function-parsedownload-state-host-msg-src-mq3-client-download-ml-1401624696"></a>
### parseDownload

```ml
function parseDownload(state, host, msg)
```

Updates `state.downloadSize`, `state.download`, `state.downloadBlock`, `state.downloadCount` and additional values during download `parseDownload`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Mutable download record/storage; this routine assigns `state.downloadSize`, `state.download`, `state.downloadBlock`, `state.downloadCount` and additional values. |
| `host` | `dynamic` | — | Record read through `host.cvarValueFn`, `host.printFn`, `host.reliableFn`, `host.openFn` and additional values. |
| `msg` | `dynamic` | — | Record read through `msg.readcount`, `msg.cursize`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/download.ml#L28)

<a id="function-function-mq3-client-download-services-function-services-src-mq3-client-download-ml-1986083990"></a>
### services

```ml
function services()
```

Creates a `mq3.client.download.Services` record. Initializes the record with the defaults written in this constructor.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/download.ml#L16)

- [mq3.client.download.Services](Type-mq3-client-download-services-753847501.md) — struct
- [mq3.client.download.State](Type-mq3-client-download-state-817781582.md) — struct
