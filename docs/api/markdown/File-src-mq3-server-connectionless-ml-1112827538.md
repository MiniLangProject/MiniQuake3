# `src/mq3/server/connectionless.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.connectionless`](Package-mq3-server-connectionless-2081411696.md)

Reachable from entry: **yes**

## Imports

- `mq3/qcommon/command_buffer.ml` as `commandBuffer` → [src/mq3/qcommon/command_buffer.ml](File-src-mq3-qcommon-command-buffer-ml-122952676.md)
- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)
- `mq3/server/oob_connect.ml` as `oobConnect` → [src/mq3/server/oob_connect.ml](File-src-mq3-server-oob-connect-ml-829458266.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-server-connectionless-connectprefix-function-connectprefix-msg-src-mq3-server-connectionless-ml-980026313"></a>
### connectPrefix

```ml
function connectPrefix(msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/connectionless.ml#L12)

<a id="function-function-mq3-server-connectionless-dispatch-function-dispatch-runtime-host-sourceaddress-msg-src-mq3-server-connectionless-ml-1807300734"></a>
### dispatch

```ml
function dispatch(runtime, host, sourceAddress, msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `sourceAddress` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/connectionless.ml#L23)

<a id="function-function-mq3-server-connectionless-services-function-services-src-mq3-server-connectionless-ml-104543780"></a>
### services

```ml
function services()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/connectionless.ml#L11)

- [mq3.server.connectionless.Services](Type-mq3-server-connectionless-services-775299350.md) — struct
<a id="function-function-mq3-server-connectionless-tokens-function-tokens-text-src-mq3-server-connectionless-ml-1651922383"></a>
### tokens

```ml
function tokens(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/connectionless.ml#L18)
