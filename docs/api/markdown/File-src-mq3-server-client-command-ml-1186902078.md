# `src/mq3/server/client_command.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.client_command`](Package-mq3-server-client-command-916704380.md)

Reachable from entry: **yes**

## Imports

- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)

## Declarations

- [mq3.server.client_command.Client](Type-mq3-server-client-command-client-2135748133.md) — struct
<a id="function-function-mq3-server-client-command-createclient-function-createclient-src-mq3-server-client-command-ml-788648536"></a>
### createClient

```ml
function createClient()
```

Create an initially inactive client with no consumed reliable commands and no flood deadline.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_command.ml#L45)

<a id="constant-constant-mq3-server-client-command-cs-active-const-cs-active-4-src-mq3-server-client-command-ml-1308717357"></a>
### CS_ACTIVE

```ml
const CS_ACTIVE = 4
```

Client-state value identifying a client whose commands may be dispatched as active gameplay commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_command.ml#L9)

<a id="function-function-mq3-server-client-command-execute-function-execute-host-clientstate-msg-src-mq3-server-client-command-ml-1750153017"></a>
### execute

```ml
function execute(host, clientState, msg)
```

Consume one reliable client command and return whether its sequence stream can continue. Duplicate or older sequences return true without callbacks or state updates. A forward sequence gap invokes the optional drop callback and returns false. For the next sequence, the execute callback receives a `clientOk` flag indicating whether game-command flood policy permits dispatch. Even when that flag is false, the sequence and text are retained and the deadline becomes `host.time + 1000`. Returns true after consuming the next command, or error 6981 for missing input state.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Runtime with a millisecond clock, flood policy, and optional execute/drop/diagnostic callbacks. |
| `clientState` | `dynamic` | — | Mutable client sequence, last command text, lifecycle state, and flood deadline. |
| `msg` | `dynamic` | — | Mutable network message positioned at an int32 sequence followed by a zero-terminated command string. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_command.ml#L64)

<a id="function-function-mq3-server-client-command-runtime-function-runtime-src-mq3-server-client-command-ml-413634544"></a>
### runtime

```ml
function runtime()
```

Create reliable-command processing services with flood protection enabled and callbacks unset. The server clock starts at zero and no local client is assumed to be running.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_command.ml#L51)

- [mq3.server.client_command.Runtime](Type-mq3-server-client-command-runtime-180684606.md) — struct
