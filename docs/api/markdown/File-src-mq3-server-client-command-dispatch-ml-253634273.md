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

Compute builtin index in server.client_command_dispatch; the normal completion returns `- 1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used in `(names[index] == name)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_command_dispatch.ml#L36)

<a id="function-function-mq3-server-client-command-dispatch-builtinnames-function-builtinnames-src-mq3-server-client-command-dispatch-ml-1231020014"></a>
### builtinNames

```ml
function builtinNames()
```

List the 8 names in server.client_command_dispatch.builtinNames, beginning with `userinfo`, `disconnect`, `cp`, `vdr`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_command_dispatch.ml#L32)

<a id="function-function-mq3-server-client-command-dispatch-execute-function-execute-host-clientstate-text-clientok-serverstate-src-mq3-server-client-command-dispatch-ml-834217692"></a>
### execute

```ml
function execute(host, clientState, text, clientOk, serverState)
```

Execute client command dispatch in server.client_command_dispatch; the normal completion returns `"ignored"`.

Validation failures include `client command dispatch: missing input`; `client command dispatch: missing builtin service`; `client command dispatch: missing game service`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `downloadFn`, `builtinFn`, `lifecycleRuntime`, `gameFn`, `ignoredFn`. |
| `clientState` | `dynamic` | — | Client passed as `client` to `mq3.server.client_lifecycle.dispatchBuiltin`. |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.qcommon.command_buffer.tokenizeString`. |
| `clientOk` | `dynamic` | — | Client ok operand used by `execute`; its reads are shown in the implementation. |
| `serverState` | `dynamic` | — | Server state used in `(serverState == SS_GAME)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_command_dispatch.ml#L50)

<a id="function-function-mq3-server-client-command-dispatch-services-function-services-src-mq3-server-client-command-dispatch-ml-115334554"></a>
### services

```ml
function services()
```

Create `mq3.server.client_command_dispatch.Services` with builtinFn=void; downloadFn=void; gameFn=void; ignoredFn=void; context=void; downloadContext=void; lifecycleRuntime=void.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_command_dispatch.ml#L29)

- [mq3.server.client_command_dispatch.Services](Type-mq3-server-client-command-dispatch-services-1762339519.md) — struct
<a id="constant-constant-mq3-server-client-command-dispatch-ss-game-const-ss-game-2-src-mq3-server-client-command-dispatch-ml-447169141"></a>
### SS_GAME

```ml
const SS_GAME = 2
```

Server lifecycle state for an active game map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_command_dispatch.ml#L9)
