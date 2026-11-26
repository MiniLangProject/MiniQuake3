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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `service` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/download.ml#L13)

<a id="function-function-mq3-client-download-create-function-create-src-mq3-client-download-ml-1144889066"></a>
### create

```ml
function create()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/download.ml#L11)

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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/download.ml#L15)

<a id="function-function-mq3-client-download-services-function-services-src-mq3-client-download-ml-1986083990"></a>
### services

```ml
function services()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/download.ml#L12)

- [mq3.client.download.Services](Type-mq3-client-download-services-753847501.md) — struct
- [mq3.client.download.State](Type-mq3-client-download-state-817781582.md) — struct
