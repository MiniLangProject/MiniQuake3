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

Test connect prefix in server.connectionless; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Record exposing `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/connectionless.ml#L16)

<a id="function-function-mq3-server-connectionless-dispatch-function-dispatch-runtime-host-sourceaddress-msg-src-mq3-server-connectionless-ml-1807300734"></a>
### dispatch

```ml
function dispatch(runtime, host, sourceAddress, msg)
```

Dispatch connectionless in server.connectionless; the normal completion returns `"unknown"`.

Validation failures include `connectionless: missing state`; `connectionless: missing OOB marker`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Runtime passed as `runtime` to `mq3.server.oob_connect.getChallenge`. |
| `host` | `dynamic` | — | Record exposing `decompressFn`, `statusFn`, `infoFn`, `authorizeFn`, `rconFn`, `diagnosticFn`. |
| `sourceAddress` | `dynamic` | — | Source address passed as `sourceAddress` to `mq3.server.oob_connect.getChallenge`. |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.beginReadingOob`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/connectionless.ml#L36)

<a id="function-function-mq3-server-connectionless-services-function-services-src-mq3-server-connectionless-ml-104543780"></a>
### services

```ml
function services()
```

Create `mq3.server.connectionless.Services` with statusFn=void; infoFn=void; rconFn=void; authorizeFn=void; decompressFn=void; diagnosticFn=void; context=void.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/connectionless.ml#L13)

- [mq3.server.connectionless.Services](Type-mq3-server-connectionless-services-775299350.md) — struct
<a id="function-function-mq3-server-connectionless-tokens-function-tokens-text-src-mq3-server-connectionless-ml-1651922383"></a>
### tokens

```ml
function tokens(text)
```

Compute tokens in server.connectionless; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.command_buffer.tokenizeString`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/connectionless.ml#L24)
