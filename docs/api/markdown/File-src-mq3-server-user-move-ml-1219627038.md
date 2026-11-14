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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `clientState` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/user_move.ml#L61)

<a id="function-function-mq3-server-user-move-copycommand-function-copycommand-command-src-mq3-server-user-move-ml-244286169"></a>
### copyCommand

```ml
function copyCommand(command)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `command` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/user_move.ml#L52)

<a id="function-function-mq3-server-user-move-createclient-function-createclient-src-mq3-server-user-move-ml-1115529990"></a>
### createClient

```ml
function createClient()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/user_move.ml#L33)

<a id="function-function-mq3-server-user-move-createframes-function-createframes-src-mq3-server-user-move-ml-647267622"></a>
### createFrames

```ml
function createFrames()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/user_move.ml#L31)

<a id="function-function-mq3-server-user-move-createreliablecommands-function-createreliablecommands-src-mq3-server-user-move-ml-1022825794"></a>
### createReliableCommands

```ml
function createReliableCommands()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/user_move.ml#L32)

<a id="function-function-mq3-server-user-move-createserver-function-createserver-checksumfeed-time-pure-src-mq3-server-user-move-ml-1197911510"></a>
### createServer

```ml
function createServer(checksumFeed, time, pure)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `checksumFeed` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `pure` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/user_move.ml#L36)

<a id="constant-constant-mq3-server-user-move-cs-active-const-cs-active-4-src-mq3-server-user-move-ml-1744502385"></a>
### CS_ACTIVE

```ml
const CS_ACTIVE = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/user_move.ml#L13)

<a id="constant-constant-mq3-server-user-move-cs-primed-const-cs-primed-3-src-mq3-server-user-move-ml-1066929928"></a>
### CS_PRIMED

```ml
const CS_PRIMED = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/user_move.ml#L12)

<a id="function-function-mq3-server-user-move-diagnose-function-diagnose-host-clientstate-text-src-mq3-server-user-move-ml-1263898469"></a>
### diagnose

```ml
function diagnose(host, clientState, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `clientState` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/user_move.ml#L56)

<a id="function-function-mq3-server-user-move-execute-function-execute-serverstate-clientstate-host-msg-isdelta-src-mq3-server-user-move-ml-587965281"></a>
### execute

```ml
function execute(serverState, clientState, host, msg, isDelta)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `serverState` | `dynamic` | — |  |
| `clientState` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |
| `isDelta` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/user_move.ml#L68)

<a id="function-function-mq3-server-user-move-hashkey-function-hashkey-text-maxlength-src-mq3-server-user-move-ml-749251621"></a>
### hashKey

```ml
function hashKey(text, maxLength)
```

Com_HashKey uses signed char values on the pinned MSVC reference build.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `maxLength` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/user_move.ml#L40)

<a id="constant-constant-mq3-server-user-move-max-packet-usercmds-const-max-packet-usercmds-32-src-mq3-server-user-move-ml-535883760"></a>
### MAX_PACKET_USERCMDS

```ml
const MAX_PACKET_USERCMDS = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/user_move.ml#L9)

<a id="constant-constant-mq3-server-user-move-max-reliable-commands-const-max-reliable-commands-64-src-mq3-server-user-move-ml-47199"></a>
### MAX_RELIABLE_COMMANDS

```ml
const MAX_RELIABLE_COMMANDS = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/user_move.ml#L10)

<a id="constant-constant-mq3-server-user-move-packet-mask-const-packet-mask-31-src-mq3-server-user-move-ml-906865821"></a>
### PACKET_MASK

```ml
const PACKET_MASK = 31
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/user_move.ml#L11)

- [mq3.server.user_move.Server](Type-mq3-server-user-move-server-1836531263.md) — struct
<a id="function-function-mq3-server-user-move-services-function-services-src-mq3-server-user-move-ml-245697798"></a>
### services

```ml
function services()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/user_move.ml#L37)

- [mq3.server.user_move.Services](Type-mq3-server-user-move-services-791730932.md) — struct
<a id="function-function-mq3-server-user-move-zerocommand-function-zerocommand-src-mq3-server-user-move-ml-1222053648"></a>
### zeroCommand

```ml
function zeroCommand()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/user_move.ml#L30)
