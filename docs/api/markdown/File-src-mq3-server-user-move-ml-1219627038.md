# `src/mq3/server/user_move.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.user_move`](Package-mq3-server-user-move-1773075226.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)
- `mq3/qcommon/message_delta.ml` as `userCommandDelta` → [src/mq3/qcommon/message_delta.ml](File-src-mq3-qcommon-message-delta-ml-1923515516.md)

## Declarations

- [mq3.server.user_move.Client](Type-mq3-server-user-move-client-18413339.md) — struct
- [mq3.server.user_move.ClientFrame](Type-mq3-server-user-move-clientframe-1627533280.md) — struct
<a id="function-function-mq3-server-user-move-clientthink-function-clientthink-host-clientstate-command-src-mq3-server-user-move-ml-1759931925"></a>
### clientThink

```ml
function clientThink(host, clientState, command)
```

Update `clientState.lastUsercmd` in server.user_move.

Direct state writes: `clientState.lastUsercmd`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `thinkFn`. |
| `clientState` | `dynamic` | — | Record exposing `state`. Updated in place: `lastUsercmd`. |
| `command` | `dynamic` | — | Command passed as `command` to `mq3.server.user_move.copyCommand`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L127)

<a id="function-function-mq3-server-user-move-copycommand-function-copycommand-command-src-mq3-server-user-move-ml-244286169"></a>
### copyCommand

```ml
function copyCommand(command)
```

Return `mq3.qcommon.message_delta.userCommand(command.serverTime, command.angles[0], command.angles[1], command.angles[2], command.buttons, command.weapon, command.forwardmove, command.rightmove, command.upmove)` from `server.user_move.copyCommand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `command` | `dynamic` | — | Record exposing `serverTime`, `angles`, `buttons`, `weapon`, `forwardmove`, `rightmove`, `upmove`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L108)

<a id="function-function-mq3-server-user-move-createclient-function-createclient-src-mq3-server-user-move-ml-1115529990"></a>
### createClient

```ml
function createClient()
```

Create `mq3.server.user_move.Client` with state=0; messageAcknowledge=0; reliableAcknowledge=0; reliableCommands=createReliableCommands(); deltaMessage=- 1; pureAuthentic=0; gotCP=false; frames=createFrames(); lastUsercmd=zeroCommand().


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L80)

<a id="function-function-mq3-server-user-move-createframes-function-createframes-src-mq3-server-user-move-ml-647267622"></a>
### createFrames

```ml
function createFrames()
```

Create frames in server.user_move; the normal completion returns `result`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L76)

<a id="function-function-mq3-server-user-move-createreliablecommands-function-createreliablecommands-src-mq3-server-user-move-ml-1022825794"></a>
### createReliableCommands

```ml
function createReliableCommands()
```

Create reliable commands in server.user_move; the normal completion returns `result`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L78)

<a id="function-function-mq3-server-user-move-createserver-function-createserver-checksumfeed-time-pure-src-mq3-server-user-move-ml-1197911510"></a>
### createServer

```ml
function createServer(checksumFeed, time, pure)
```

Create `mq3.server.user_move.Server` with checksumFeed=checksumFeed; time=time; pure=pure.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `checksumFeed` | `dynamic` | — | Initial `checksumFeed` field stored in the returned or constructed `mq3.server.user_move.Server` record. |
| `time` | `dynamic` | — | Initial `time` field stored in the returned or constructed `mq3.server.user_move.Server` record. |
| `pure` | `dynamic` | — | Initial `pure` field stored in the returned or constructed `mq3.server.user_move.Server` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L87)

<a id="constant-constant-mq3-server-user-move-cs-active-const-cs-active-4-src-mq3-server-user-move-ml-1744502385"></a>
### CS_ACTIVE

```ml
const CS_ACTIVE = 4
```

Client-state value identifying a client whose user commands advance its in-game entity.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L18)

<a id="constant-constant-mq3-server-user-move-cs-primed-const-cs-primed-3-src-mq3-server-user-move-ml-1066929928"></a>
### CS_PRIMED

```ml
const CS_PRIMED = 3
```

Client lifecycle state after gamestate delivery and before entering active play.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L16)

<a id="function-function-mq3-server-user-move-diagnose-function-diagnose-host-clientstate-text-src-mq3-server-user-move-ml-1263898469"></a>
### diagnose

```ml
function diagnose(host, clientState, text)
```

Compute diagnose in server.user_move.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `diagnosticFn`. |
| `clientState` | `dynamic` | — | Client state used in `host.diagnosticFn(host, clientState, text)`. |
| `text` | `dynamic` | — | Text used in `host.diagnosticFn(host, clientState, text)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L116)

<a id="function-function-mq3-server-user-move-execute-function-execute-serverstate-clientstate-host-msg-isdelta-src-mq3-server-user-move-ml-587965281"></a>
### execute

```ml
function execute(serverState, clientState, host, msg, isDelta)
```

Execute user move in server.user_move; the normal completion returns `executed`.

Validation failures include `user move: missing state`.
Direct state writes: `clientState.deltaMessage`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `serverState` | `dynamic` | — | Record exposing `checksumFeed`, `time`, `pure`. |
| `clientState` | `dynamic` | — | Record exposing `messageAcknowledge`, `reliableCommands`, `reliableAcknowledge`, `frames`, `pureAuthentic`, `gotCP`, `state` and further fields. Updated in place: `deltaMessage`. |
| `host` | `dynamic` | — | Record exposing `sendGamestateFn`, `enterWorldFn`, `dropFn`. |
| `msg` | `dynamic` | — | Msg passed as `msg` to `mq3.qcommon.message.readU8`. |
| `isDelta` | `dynamic` | — | Is delta operand used by `execute`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L143)

<a id="function-function-mq3-server-user-move-hashkey-function-hashkey-text-maxlength-src-mq3-server-user-move-ml-749251621"></a>
### hashKey

```ml
function hashKey(text, maxLength)
```

Com_HashKey uses signed char values on the pinned MSVC reference build.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text used in `bytes(text)` and `(text == void)`. |
| `maxLength` | `dynamic` | — | Max length used in `(limit > maxLength)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L94)

<a id="constant-constant-mq3-server-user-move-max-packet-usercmds-const-max-packet-usercmds-32-src-mq3-server-user-move-ml-535883760"></a>
### MAX_PACKET_USERCMDS

```ml
const MAX_PACKET_USERCMDS = 32
```

Max number of usercmd_t in a packet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L10)

<a id="constant-constant-mq3-server-user-move-max-reliable-commands-const-max-reliable-commands-64-src-mq3-server-user-move-ml-47199"></a>
### MAX_RELIABLE_COMMANDS

```ml
const MAX_RELIABLE_COMMANDS = 64
```

Capacity of the reliable-command ring retained until acknowledgment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L12)

<a id="constant-constant-mq3-server-user-move-packet-mask-const-packet-mask-31-src-mq3-server-user-move-ml-906865821"></a>
### PACKET_MASK

```ml
const PACKET_MASK = 31
```

Mask converting a network sequence number into a circular packet-history slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L14)

- [mq3.server.user_move.Server](Type-mq3-server-user-move-server-1836531263.md) — struct
<a id="function-function-mq3-server-user-move-services-function-services-src-mq3-server-user-move-ml-245697798"></a>
### services

```ml
function services()
```

Create `mq3.server.user_move.Services` with sendGamestateFn=void; enterWorldFn=void; dropFn=void; thinkFn=void; diagnosticFn=void; context=void.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L89)

- [mq3.server.user_move.Services](Type-mq3-server-user-move-services-791730932.md) — struct
<a id="function-function-mq3-server-user-move-zerocommand-function-zerocommand-src-mq3-server-user-move-ml-1222053648"></a>
### zeroCommand

```ml
function zeroCommand()
```

Return `mq3.qcommon.message_delta.userCommand(0, 0, 0, 0, 0, 0, 0, 0, 0)` from `server.user_move.zeroCommand`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/user_move.ml#L74)
