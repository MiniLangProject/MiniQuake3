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
| `messageHost` | `dynamic` | — | Record exposing `context`. |
| `clientState` | `dynamic` | — | Mutable client sequencing record; accepted commands update its sequence, text, and next reliable-command time. |
| `msg` | `dynamic` | — | Network message read at the current cursor: an int32 sequence followed by a C string. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L109)

<a id="function-function-mq3-server-client-input-create-function-create-commandhost-dispatchhost-moveserver-movehost-serverstate-src-mq3-server-client-input-ml-13658252"></a>
### create

```ml
function create(commandHost, dispatchHost, moveServer, moveHost, serverState)
```

Create client input in server.client_input; the normal completion returns `runtime`.

Validation failures include `client input: missing service`.
Direct state writes: `commandHost.context`, `commandHost.executeFn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandHost` | `dynamic` | — | Updated in place: `context`, `executeFn`. |
| `dispatchHost` | `dynamic` | — | Initial `dispatchHost` field stored in the returned or constructed `mq3.server.client_input.Runtime` record. |
| `moveServer` | `dynamic` | — | Initial `moveServer` field stored in the returned or constructed `mq3.server.client_input.Runtime` record. |
| `moveHost` | `dynamic` | — | Initial `moveHost` field stored in the returned or constructed `mq3.server.client_input.Runtime` record. |
| `serverState` | `dynamic` | — | Initial `serverState` field stored in the returned or constructed `mq3.server.client_input.Runtime` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L87)

<a id="function-function-mq3-server-client-input-createclient-function-createclient-src-mq3-server-client-input-ml-1209894494"></a>
### createClient

```ml
function createClient()
```

Create client in server.client_input.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L61)

<a id="function-function-mq3-server-client-input-executetext-function-executetext-commandhost-clientstate-text-clientok-src-mq3-server-client-input-ml-1851392709"></a>
### executeText

```ml
function executeText(commandHost, clientState, text, clientOk)
```

Execute text in server.client_input; the normal completion returns `commandDispatch.execute(runtime.dispatchHost, clientState, text, clientOk, runtime.serverState)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `commandHost` | `dynamic` | — | Record exposing `context`. |
| `clientState` | `dynamic` | — | Client state passed as `clientState` to `mq3.server.client_command_dispatch.execute`. |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.server.client_command_dispatch.execute`. |
| `clientOk` | `dynamic` | — | Client ok passed as `clientOk` to `mq3.server.client_command_dispatch.execute`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L73)

- [mq3.server.client_input.Runtime](Type-mq3-server-client-input-runtime-753799615.md) — struct
<a id="function-function-mq3-server-client-input-settime-function-settime-runtime-time-src-mq3-server-client-input-ml-573087527"></a>
### setTime

```ml
function setTime(runtime, time)
```

Set time in server.client_input.

Validation failures include `client input: missing runtime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `commandHost`, `moveServer`. |
| `time` | `dynamic` | — | Time operand used by `setTime`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L99)

<a id="function-function-mq3-server-client-input-usermovefn-function-usermovefn-messagehost-clientstate-msg-isdelta-src-mq3-server-client-input-ml-1558293192"></a>
### userMoveFn

```ml
function userMoveFn(messageHost, clientState, msg, isDelta)
```

Compute user move fn in server.client_input; the normal completion returns `userMove.execute(runtime.moveServer, clientState, runtime.moveHost, msg, isDelta)`.

Validation failures include `client input: missing runtime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `messageHost` | `dynamic` | — | Record exposing `context`. |
| `clientState` | `dynamic` | — | Client state passed as `clientState` to `mq3.server.user_move.execute`. |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.server.user_move.execute`. |
| `isDelta` | `dynamic` | — | Is delta passed as `isDelta` to `mq3.server.user_move.execute`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_input.ml#L121)
