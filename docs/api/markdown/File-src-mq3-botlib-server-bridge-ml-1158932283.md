# `src/mq3/botlib/server_bridge.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.server_bridge`](Package-mq3-botlib-server-bridge-1330625757.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/entitystate.ml` as `entitystate` → [src/mq3/game/entitystate.ml](File-src-mq3-game-entitystate-ml-1227653182.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)
- `mq3/vm/syscall_qagame_world.ml` as `qworld` → [src/mq3/vm/syscall_qagame_world.ml](File-src-mq3-vm-syscall-qagame-world-ml-663586900.md)
- `std/ds/list.ml` as `lists` → `../MiniLangCompilerML/std/ds/list.ml` — external dependency

## Declarations

- [mq3.botlib.server_bridge.Client](Type-mq3-botlib-server-bridge-client-487455042.md) — struct
<a id="function-function-mq3-botlib-server-bridge-clientat-function-clientat-state-client-src-mq3-botlib-server-bridge-ml-1767749082"></a>
### clientAt

```ml
function clientAt(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L27)

- [mq3.botlib.server_bridge.ConsoleResult](Type-mq3-botlib-server-bridge-consoleresult-1221046679.md) — struct
<a id="function-function-mq3-botlib-server-bridge-create-function-create-maxclients-src-mq3-botlib-server-bridge-ml-1172272276"></a>
### create

```ml
function create(maxClients)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxClients` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L23)

<a id="function-function-mq3-botlib-server-bridge-dispatch-function-dispatch-state-vm-base-op-src-mq3-botlib-server-bridge-ml-1930759874"></a>
### dispatch

```ml
function dispatch(state, vm, base, op)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `vm` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |
| `op` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L76)

<a id="function-function-mq3-botlib-server-bridge-emptyclient-function-emptyclient-src-mq3-botlib-server-bridge-ml-571462182"></a>
### emptyClient

```ml
function emptyClient()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L22)

<a id="constant-constant-mq3-botlib-server-bridge-max-reliable-commands-const-max-reliable-commands-64-src-mq3-botlib-server-bridge-ml-1434598463"></a>
### MAX_RELIABLE_COMMANDS

```ml
const MAX_RELIABLE_COMMANDS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L15)

<a id="function-function-mq3-botlib-server-bridge-nextconsolemessage-function-nextconsolemessage-state-client-src-mq3-botlib-server-bridge-ml-76199330"></a>
### nextConsoleMessage

```ml
function nextConsoleMessage(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L57)

<a id="constant-constant-mq3-botlib-server-bridge-op-get-console-message-const-op-get-console-message-210-src-mq3-botlib-server-bridge-ml-995701754"></a>
### OP_GET_CONSOLE_MESSAGE

```ml
const OP_GET_CONSOLE_MESSAGE = 210
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L13)

<a id="constant-constant-mq3-botlib-server-bridge-op-get-snapshot-entity-const-op-get-snapshot-entity-209-src-mq3-botlib-server-bridge-ml-1174500334"></a>
### OP_GET_SNAPSHOT_ENTITY

```ml
const OP_GET_SNAPSHOT_ENTITY = 209
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L12)

<a id="constant-constant-mq3-botlib-server-bridge-op-user-command-const-op-user-command-211-src-mq3-botlib-server-bridge-ml-160984627"></a>
### OP_USER_COMMAND

```ml
const OP_USER_COMMAND = 211
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L14)

<a id="function-function-mq3-botlib-server-bridge-publishsnapshot-function-publishsnapshot-state-client-entities-src-mq3-botlib-server-bridge-ml-292069257"></a>
### publishSnapshot

```ml
function publishSnapshot(state, client, entities)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `entities` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L35)

<a id="function-function-mq3-botlib-server-bridge-queueconsolemessage-function-queueconsolemessage-state-client-text-src-mq3-botlib-server-bridge-ml-1087755257"></a>
### queueConsoleMessage

```ml
function queueConsoleMessage(state, client, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L49)

<a id="function-function-mq3-botlib-server-bridge-readusercommand-function-readusercommand-vm-address-src-mq3-botlib-server-bridge-ml-591768785"></a>
### readUserCommand

```ml
function readUserCommand(vm, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L64)

<a id="function-function-mq3-botlib-server-bridge-resetclient-function-resetclient-state-client-src-mq3-botlib-server-bridge-ml-663209962"></a>
### resetClient

```ml
function resetClient(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L31)

<a id="function-function-mq3-botlib-server-bridge-settime-function-settime-state-time-src-mq3-botlib-server-bridge-ml-1904968210"></a>
### setTime

```ml
function setTime(state, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L30)

<a id="function-function-mq3-botlib-server-bridge-signedbyte-function-signedbyte-value-src-mq3-botlib-server-bridge-ml-2001072471"></a>
### signedByte

```ml
function signedByte(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L63)

<a id="function-function-mq3-botlib-server-bridge-snapshotentity-function-snapshotentity-state-client-sequence-src-mq3-botlib-server-bridge-ml-1534910289"></a>
### snapshotEntity

```ml
function snapshotEntity(state, client, sequence)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `sequence` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L41)

<a id="function-function-mq3-botlib-server-bridge-snapshotentitystate-function-snapshotentitystate-state-client-sequence-src-mq3-botlib-server-bridge-ml-56487913"></a>
### snapshotEntityState

```ml
function snapshotEntityState(state, client, sequence)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `sequence` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L45)

- [mq3.botlib.server_bridge.State](Type-mq3-botlib-server-bridge-state-1834066986.md) — struct
<a id="function-function-mq3-botlib-server-bridge-submitusercommand-function-submitusercommand-state-client-command-src-mq3-botlib-server-bridge-ml-1832230695"></a>
### submitUserCommand

```ml
function submitUserCommand(state, client, command)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L68)

<a id="function-function-mq3-botlib-server-bridge-takepending-function-takepending-state-src-mq3-botlib-server-bridge-ml-1556686507"></a>
### takePending

```ml
function takePending(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L72)

<a id="constant-constant-mq3-botlib-server-bridge-usercmd-size-const-usercmd-size-24-src-mq3-botlib-server-bridge-ml-1311203347"></a>
### USERCMD_SIZE

```ml
const USERCMD_SIZE = 24
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/botlib/server_bridge.ml#L16)
