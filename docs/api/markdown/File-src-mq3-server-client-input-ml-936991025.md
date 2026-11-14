# `src/mq3/server/client_input.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.client_input`](Package-mq3-server-client-input-154933965.md)

Reachable from entry: **yes**

## Imports

- `mq3/server/client_command.ml` as `clientCommand` → [src/mq3/server/client_command.ml](File-src-mq3-server-client-command-ml-1186902078.md)
- `mq3/server/client_command_dispatch.ml` as `commandDispatch` → [src/mq3/server/client_command_dispatch.ml](File-src-mq3-server-client-command-dispatch-ml-253634273.md)
- `mq3/server/user_move.ml` as `userMove` → [src/mq3/server/user_move.ml](File-src-mq3-server-user-move-ml-1219627038.md)

## Declarations

- [mq3.server.client_input.Client](Type-mq3-server-client-input-client-289754034.md) — struct
<a id="function-function-mq3-server-client-input-clientcommandfn-function-clientcommandfn-messagehost-clientstate-msg-src-mq3-server-client-input-ml-533296576"></a>
### clientCommandFn

```ml
function clientCommandFn(messageHost, clientState, msg)
```

These signatures match client_message.Services and can be installed directly in network_ingress.Services.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `messageHost` | `dynamic` | — |  |
| `clientState` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L45)

<a id="function-function-mq3-server-client-input-create-function-create-commandhost-dispatchhost-moveserver-movehost-serverstate-src-mq3-server-client-input-ml-13658252"></a>
### create

```ml
function create(commandHost, dispatchHost, moveServer, moveHost, serverState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandHost` | `dynamic` | — |  |
| `dispatchHost` | `dynamic` | — |  |
| `moveServer` | `dynamic` | — |  |
| `moveHost` | `dynamic` | — |  |
| `serverState` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L31)

<a id="function-function-mq3-server-client-input-createclient-function-createclient-src-mq3-server-client-input-ml-1209894494"></a>
### createClient

```ml
function createClient()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L19)

<a id="function-function-mq3-server-client-input-executetext-function-executetext-commandhost-clientstate-text-clientok-src-mq3-server-client-input-ml-1851392709"></a>
### executeText

```ml
function executeText(commandHost, clientState, text, clientOk)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandHost` | `dynamic` | — |  |
| `clientState` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `clientOk` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L26)

- [mq3.server.client_input.Runtime](Type-mq3-server-client-input-runtime-753799615.md) — struct
<a id="function-function-mq3-server-client-input-settime-function-settime-runtime-time-src-mq3-server-client-input-ml-573087527"></a>
### setTime

```ml
function setTime(runtime, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L38)

<a id="function-function-mq3-server-client-input-usermovefn-function-usermovefn-messagehost-clientstate-msg-isdelta-src-mq3-server-client-input-ml-1558293192"></a>
### userMoveFn

```ml
function userMoveFn(messageHost, clientState, msg, isDelta)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `messageHost` | `dynamic` | — |  |
| `clientState` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |
| `isDelta` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L50)
