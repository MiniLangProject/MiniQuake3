# `src/mq3/server/client_command_dispatch.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.client_command_dispatch`](Package-mq3-server-client-command-dispatch-1615768847.md)

Reachable from entry: **yes**

## Imports

- `mq3/qcommon/command_buffer.ml` as `commandBuffer` → [src/mq3/qcommon/command_buffer.ml](File-src-mq3-qcommon-command-buffer-ml-122952676.md)
- `mq3/server/client_lifecycle.ml` as `lifecycle` → [src/mq3/server/client_lifecycle.ml](File-src-mq3-server-client-lifecycle-ml-743240113.md)

## Declarations

<a id="function-function-mq3-server-client-command-dispatch-builtinindex-function-builtinindex-name-src-mq3-server-client-command-dispatch-ml-694380035"></a>
### builtinIndex

```ml
function builtinIndex(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_command_dispatch.ml#L15)

<a id="function-function-mq3-server-client-command-dispatch-builtinnames-function-builtinnames-src-mq3-server-client-command-dispatch-ml-1231020014"></a>
### builtinNames

```ml
function builtinNames()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_command_dispatch.ml#L13)

<a id="function-function-mq3-server-client-command-dispatch-execute-function-execute-host-clientstate-text-clientok-serverstate-src-mq3-server-client-command-dispatch-ml-834217692"></a>
### execute

```ml
function execute(host, clientState, text, clientOk, serverState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `clientState` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `clientOk` | `dynamic` | — |  |
| `serverState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_command_dispatch.ml#L21)

<a id="function-function-mq3-server-client-command-dispatch-services-function-services-src-mq3-server-client-command-dispatch-ml-115334554"></a>
### services

```ml
function services()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_command_dispatch.ml#L11)

- [mq3.server.client_command_dispatch.Services](Type-mq3-server-client-command-dispatch-services-1762339519.md) — struct
<a id="constant-constant-mq3-server-client-command-dispatch-ss-game-const-ss-game-2-src-mq3-server-client-command-dispatch-ml-447169141"></a>
### SS_GAME

```ml
const SS_GAME = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/client_command_dispatch.ml#L8)
