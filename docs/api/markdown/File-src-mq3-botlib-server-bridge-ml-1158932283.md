# `src/mq3/botlib/server_bridge.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.botlib.server_bridge`](Package-mq3-botlib-server-bridge-1330625757.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/entitystate.ml` as `entitystate` → [src/mq3/game/entitystate.ml](File-src-mq3-game-entitystate-ml-1227653182.md)
- `mq3/vm/syscall_common.ml` as `common` → [src/mq3/vm/syscall_common.ml](File-src-mq3-vm-syscall-common-ml-1768394.md)
- `mq3/vm/syscall_qagame_world.ml` as `qworld` → [src/mq3/vm/syscall_qagame_world.ml](File-src-mq3-vm-syscall-qagame-world-ml-663586900.md)
- `std/ds/list.ml` as `lists` → `../../a7594a0c0299/MiniLangCompilerML/std/ds/list.ml` — external dependency

## Declarations

- [mq3.botlib.server_bridge.Client](Type-mq3-botlib-server-bridge-client-487455042.md) — struct
<a id="function-function-mq3-botlib-server-bridge-clientat-function-clientat-state-client-src-mq3-botlib-server-bridge-ml-1767749082"></a>
### clientAt

```ml
function clientAt(state, client)
```

Read a bridge client record by its zero-based slot, returning void for an invalid state or slot.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Server bridge state; accesses `clients`. |
| `client` | `dynamic` | — | Operand used to evaluate the returned expression `state.clients[client]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_bridge.ml#L68)

- [mq3.botlib.server_bridge.ConsoleResult](Type-mq3-botlib-server-bridge-consoleresult-1221046679.md) — struct
<a id="function-function-mq3-botlib-server-bridge-create-function-create-maxclients-src-mq3-botlib-server-bridge-ml-1172272276"></a>
### create

```ml
function create(maxClients)
```

Build the `mq3.botlib.server_bridge.State` result for `create`. Return paths include `State(clients,0,-1)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxClients` | `dynamic` | — | Value passed as argument 1 to `array`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_bridge.ml#L61)

<a id="function-function-mq3-botlib-server-bridge-dispatch-function-dispatch-state-vm-base-op-src-mq3-botlib-server-bridge-ml-1930759874"></a>
### dispatch

```ml
function dispatch(state, vm, base, op)
```

Apply `mq3.vm.syscall_common.argument`, `mq3.botlib.server_bridge.snapshotEntity` and `mq3.botlib.server_bridge.nextConsoleMessage` while evaluating `dispatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Server bridge state; accesses `clients`. |
| `vm` | `dynamic` | — | VM instance owning the syscall memory and state. |
| `base` | `dynamic` | — | Address within the VM memory or native data buffer. |
| `op` | `dynamic` | — | Numeric syscall operation identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_bridge.ml#L158)

<a id="function-function-mq3-botlib-server-bridge-emptyclient-function-emptyclient-src-mq3-botlib-server-bridge-ml-571462182"></a>
### emptyClient

```ml
function emptyClient()
```

Create a `mq3.botlib.server_bridge.Client` record, initializing `reliableCommands` as `array(MAX_RELIABLE_COMMANDS,"")`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_bridge.ml#L58)

<a id="constant-constant-mq3-botlib-server-bridge-max-reliable-commands-const-max-reliable-commands-64-src-mq3-botlib-server-bridge-ml-1434598463"></a>
### MAX_RELIABLE_COMMANDS

```ml
const MAX_RELIABLE_COMMANDS = 64
```

Capacity of the reliable-command ring retained until acknowledgment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_bridge.ml#L19)

<a id="function-function-mq3-botlib-server-bridge-nextconsolemessage-function-nextconsolemessage-state-client-src-mq3-botlib-server-bridge-ml-76199330"></a>
### nextConsoleMessage

```ml
function nextConsoleMessage(state, client)
```

Build the `mq3.botlib.server_bridge.ConsoleResult` result for `nextConsoleMessage`. Return paths include `ConsoleResult(true,text)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Server bridge state; accesses `now`. |
| `client` | `dynamic` | — | Operand used to evaluate the returned expression `state.clients[client]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_bridge.ml#L123)

<a id="constant-constant-mq3-botlib-server-bridge-op-get-console-message-const-op-get-console-message-210-src-mq3-botlib-server-bridge-ml-995701754"></a>
### OP_GET_CONSOLE_MESSAGE

```ml
const OP_GET_CONSOLE_MESSAGE = 210
```

Bot-library syscall identifier for get console message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_bridge.ml#L15)

<a id="constant-constant-mq3-botlib-server-bridge-op-get-snapshot-entity-const-op-get-snapshot-entity-209-src-mq3-botlib-server-bridge-ml-1174500334"></a>
### OP_GET_SNAPSHOT_ENTITY

```ml
const OP_GET_SNAPSHOT_ENTITY = 209
```

Bot-library syscall identifier for get snapshot entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_bridge.ml#L13)

<a id="constant-constant-mq3-botlib-server-bridge-op-user-command-const-op-user-command-211-src-mq3-botlib-server-bridge-ml-160984627"></a>
### OP_USER_COMMAND

```ml
const OP_USER_COMMAND = 211
```

Bot-library syscall identifier for user command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_bridge.ml#L17)

<a id="function-function-mq3-botlib-server-bridge-publishsnapshot-function-publishsnapshot-state-client-entities-src-mq3-botlib-server-bridge-ml-292069257"></a>
### publishSnapshot

```ml
function publishSnapshot(state, client, entities)
```

Apply `mq3.botlib.server_bridge.clientAt` and `mq3.game.entitystate.copy` while evaluating `publishSnapshot`. Return paths include `len(value.snapshotEntities)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Server bridge state; accesses `clients`. |
| `client` | `dynamic` | — | Operand used to evaluate the returned expression `state.clients[client]`. |
| `entities` | `dynamic` | — | Sequence whose length bounds the iteration or lookup in `publishSnapshot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_bridge.ml#L86)

<a id="function-function-mq3-botlib-server-bridge-queueconsolemessage-function-queueconsolemessage-state-client-text-src-mq3-botlib-server-bridge-ml-1087755257"></a>
### queueConsoleMessage

```ml
function queueConsoleMessage(state, client, text)
```

Apply `mq3.botlib.server_bridge.clientAt` while evaluating `queueConsoleMessage`. Return paths include `value.reliableSequence`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Server bridge state; accesses `clients`. |
| `client` | `dynamic` | — | Operand used to evaluate the returned expression `state.clients[client]`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_bridge.ml#L112)

<a id="function-function-mq3-botlib-server-bridge-readusercommand-function-readusercommand-vm-address-src-mq3-botlib-server-bridge-ml-591768785"></a>
### readUserCommand

```ml
function readUserCommand(vm, address)
```

Apply `mq3.vm.syscall_common.pointer`, `mq3.vm.syscall_qagame_world.userCommand` and `mq3.botlib.server_bridge.signedByte` while evaluating `readUserCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `vm` | `dynamic` | — | Vm record; accesses `data`. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_bridge.ml#L135)

<a id="function-function-mq3-botlib-server-bridge-resetclient-function-resetclient-state-client-src-mq3-botlib-server-bridge-ml-663209962"></a>
### resetClient

```ml
function resetClient(state, client)
```

Set `state.clients[client]` to `emptyClient()` in `mq3.botlib.server_bridge.resetClient`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Server bridge state; accesses `clients`. May update `state.clients[client]` in place. |
| `client` | `dynamic` | — | Value used by `resetClient` in `if state==void or client<0 or client>=len(state.clients) then return error(7580,"bot server bridge: invalid rese...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_bridge.ml#L78)

<a id="function-function-mq3-botlib-server-bridge-settime-function-settime-state-time-src-mq3-botlib-server-bridge-ml-1904968210"></a>
### setTime

```ml
function setTime(state, time)
```

Set `state.now` to `time` in `mq3.botlib.server_bridge.setTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Server bridge state; accesses `now`. May update `state.now` in place. |
| `time` | `dynamic` | — | Time value in the units expected by this module. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_bridge.ml#L74)

<a id="function-function-mq3-botlib-server-bridge-signedbyte-function-signedbyte-value-src-mq3-botlib-server-bridge-ml-2001072471"></a>
### signedByte

```ml
function signedByte(value)
```

Interpret a user-command byte as a signed eight-bit movement component.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Operand used to evaluate the returned expression `value-256`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_bridge.ml#L131)

<a id="function-function-mq3-botlib-server-bridge-snapshotentity-function-snapshotentity-state-client-sequence-src-mq3-botlib-server-bridge-ml-1534910289"></a>
### snapshotEntity

```ml
function snapshotEntity(state, client, sequence)
```

Apply `mq3.botlib.server_bridge.clientAt` while evaluating `snapshotEntity`. Return paths include `value.snapshotEntities[sequence].number`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Server bridge state; accesses `clients`. |
| `client` | `dynamic` | — | Operand used to evaluate the returned expression `state.clients[client]`. |
| `sequence` | `dynamic` | — | Operand used to evaluate the returned expression `value.snapshotEntities[sequence].number`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_bridge.ml#L96)

<a id="function-function-mq3-botlib-server-bridge-snapshotentitystate-function-snapshotentitystate-state-client-sequence-src-mq3-botlib-server-bridge-ml-56487913"></a>
### snapshotEntityState

```ml
function snapshotEntityState(state, client, sequence)
```

Apply `mq3.botlib.server_bridge.clientAt` and `mq3.game.entitystate.copy` while evaluating `snapshotEntityState`. Return paths include `entitystate.copy(value.snapshotEntities[sequence])`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Server bridge state; accesses `clients`. |
| `client` | `dynamic` | — | Operand used to evaluate the returned expression `state.clients[client]`. |
| `sequence` | `dynamic` | — | Operand used to evaluate the returned expression `entitystate.copy(value.snapshotEntities[sequence])`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_bridge.ml#L104)

- [mq3.botlib.server_bridge.State](Type-mq3-botlib-server-bridge-state-1834066986.md) — struct
<a id="function-function-mq3-botlib-server-bridge-submitusercommand-function-submitusercommand-state-client-command-src-mq3-botlib-server-bridge-ml-1832230695"></a>
### submitUserCommand

```ml
function submitUserCommand(state, client, command)
```

Apply `mq3.botlib.server_bridge.clientAt` and `mq3.vm.syscall_qagame_world.userCommand` while evaluating `submitUserCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Server bridge state; accesses `clients`. |
| `client` | `dynamic` | — | Operand used to evaluate the returned expression `state.clients[client]`. |
| `command` | `dynamic` | — | Command record; accesses `serverTime`, `angles`, `buttons`, `weapon` and `forwardmove` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_bridge.ml#L143)

<a id="function-function-mq3-botlib-server-bridge-takepending-function-takepending-state-src-mq3-botlib-server-bridge-ml-1556686507"></a>
### takePending

```ml
function takePending(state)
```

Collect pending bot user commands with their client slots and clear the consumed pending flags.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Server bridge state; accesses `clients`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_bridge.ml#L149)

<a id="constant-constant-mq3-botlib-server-bridge-usercmd-size-const-usercmd-size-24-src-mq3-botlib-server-bridge-ml-1311203347"></a>
### USERCMD_SIZE

```ml
const USERCMD_SIZE = 24
```

Byte size of the user command record in the bot VM ABI or serialized representation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/server_bridge.ml#L21)
