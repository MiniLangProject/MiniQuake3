# `src/mq3/client/send_cmd.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.client.send_cmd`](Package-mq3-client-send-cmd-1096206656.md)

Reachable from entry: **yes**

## Imports

- `mq3/client/command_ring.ml` as `sendCommandRing` → [src/mq3/client/command_ring.ml](File-src-mq3-client-command-ring-ml-1850754325.md)
- `mq3/client/netchan.ml` as `clientNetchan` → [src/mq3/client/netchan.ml](File-src-mq3-client-netchan-ml-1745063016.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)
- `mq3/qcommon/message_delta.ml` as `usercmdDelta` → [src/mq3/qcommon/message_delta.ml](File-src-mq3-qcommon-message-delta-ml-1923515516.md)

## Declarations

<a id="constant-constant-mq3-client-send-cmd-ca-active-const-ca-active-8-src-mq3-client-send-cmd-ml-851328377"></a>
### CA_ACTIVE

```ml
const CA_ACTIVE = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L14)

<a id="constant-constant-mq3-client-send-cmd-ca-cinematic-const-ca-cinematic-9-src-mq3-client-send-cmd-ml-1539124450"></a>
### CA_CINEMATIC

```ml
const CA_CINEMATIC = 9
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L15)

<a id="constant-constant-mq3-client-send-cmd-ca-connected-const-ca-connected-5-src-mq3-client-send-cmd-ml-1037436742"></a>
### CA_CONNECTED

```ml
const CA_CONNECTED = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L12)

<a id="constant-constant-mq3-client-send-cmd-ca-primed-const-ca-primed-7-src-mq3-client-send-cmd-ml-44252506"></a>
### CA_PRIMED

```ml
const CA_PRIMED = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L13)

<a id="constant-constant-mq3-client-send-cmd-clc-client-command-const-clc-client-command-4-src-mq3-client-send-cmd-ml-1994060667"></a>
### CLC_CLIENT_COMMAND

```ml
const CLC_CLIENT_COMMAND = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L25)

<a id="constant-constant-mq3-client-send-cmd-clc-move-const-clc-move-2-src-mq3-client-send-cmd-ml-2109013033"></a>
### CLC_MOVE

```ml
const CLC_MOVE = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L23)

<a id="constant-constant-mq3-client-send-cmd-clc-move-no-delta-const-clc-move-no-delta-3-src-mq3-client-send-cmd-ml-851449422"></a>
### CLC_MOVE_NO_DELTA

```ml
const CLC_MOVE_NO_DELTA = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L24)

<a id="constant-constant-mq3-client-send-cmd-cmd-backup-const-cmd-backup-64-src-mq3-client-send-cmd-ml-1593137739"></a>
### CMD_BACKUP

```ml
const CMD_BACKUP = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L17)

<a id="constant-constant-mq3-client-send-cmd-cmd-mask-const-cmd-mask-63-src-mq3-client-send-cmd-ml-946363524"></a>
### CMD_MASK

```ml
const CMD_MASK = 63
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L18)

<a id="function-function-mq3-client-send-cmd-commandcopy-function-commandcopy-value-src-mq3-client-send-cmd-ml-393416185"></a>
### commandCopy

```ml
function commandCopy(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L41)

<a id="function-function-mq3-client-send-cmd-create-function-create-src-mq3-client-send-cmd-ml-371260116"></a>
### create

```ml
function create()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L45)

<a id="function-function-mq3-client-send-cmd-createnewcommand-function-createnewcommand-state-frametime-host-src-mq3-client-send-cmd-ml-748147797"></a>
### createNewCommand

```ml
function createNewCommand(state, frameTime, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `frameTime` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L65)

<a id="function-function-mq3-client-send-cmd-diagnose-function-diagnose-host-text-src-mq3-client-send-cmd-ml-1198002173"></a>
### diagnose

```ml
function diagnose(host, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L63)

<a id="function-function-mq3-client-send-cmd-hashkey-function-hashkey-text-maxlength-src-mq3-client-send-cmd-ml-1267003325"></a>
### hashKey

```ml
function hashKey(text, maxLength)
```

Com_HashKey uses signed char on the pinned Windows reference build.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `maxLength` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L54)

<a id="function-function-mq3-client-send-cmd-liveservices-function-liveservices-runtime-channel-src-mq3-client-send-cmd-ml-847702331"></a>
### liveServices

```ml
function liveServices(runtime, channel)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `channel` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L132)

<a id="function-function-mq3-client-send-cmd-livetransmit-function-livetransmit-host-state-msg-src-mq3-client-send-cmd-ml-1620269776"></a>
### liveTransmit

```ml
function liveTransmit(host, state, msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L127)

- [mq3.client.send_cmd.LiveTransport](Type-mq3-client-send-cmd-livetransport-48332773.md) — struct
<a id="constant-constant-mq3-client-send-cmd-max-packet-usercmds-const-max-packet-usercmds-32-src-mq3-client-send-cmd-ml-1724838990"></a>
### MAX_PACKET_USERCMDS

```ml
const MAX_PACKET_USERCMDS = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L21)

<a id="constant-constant-mq3-client-send-cmd-max-reliable-commands-const-max-reliable-commands-64-src-mq3-client-send-cmd-ml-2060274003"></a>
### MAX_RELIABLE_COMMANDS

```ml
const MAX_RELIABLE_COMMANDS = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L22)

<a id="constant-constant-mq3-client-send-cmd-na-loopback-const-na-loopback-2-src-mq3-client-send-cmd-ml-1855938283"></a>
### NA_LOOPBACK

```ml
const NA_LOOPBACK = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L16)

- [mq3.client.send_cmd.OutPacket](Type-mq3-client-send-cmd-outpacket-1444303254.md) — struct
<a id="constant-constant-mq3-client-send-cmd-packet-backup-const-packet-backup-32-src-mq3-client-send-cmd-ml-1837351882"></a>
### PACKET_BACKUP

```ml
const PACKET_BACKUP = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L19)

<a id="constant-constant-mq3-client-send-cmd-packet-mask-const-packet-mask-31-src-mq3-client-send-cmd-ml-2092627817"></a>
### PACKET_MASK

```ml
const PACKET_MASK = 31
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L20)

<a id="function-function-mq3-client-send-cmd-ready-function-ready-state-host-src-mq3-client-send-cmd-ml-325190501"></a>
### ready

```ml
function ready(state, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L74)

<a id="function-function-mq3-client-send-cmd-send-function-send-state-frametime-host-src-mq3-client-send-cmd-ml-937658437"></a>
### send

```ml
function send(state, frameTime, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `frameTime` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L118)

<a id="function-function-mq3-client-send-cmd-services-function-services-src-mq3-client-send-cmd-ml-424593320"></a>
### services

```ml
function services()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L51)

- [mq3.client.send_cmd.Services](Type-mq3-client-send-cmd-services-1843866438.md) — struct
<a id="function-function-mq3-client-send-cmd-setcvar-function-setcvar-host-name-value-src-mq3-client-send-cmd-ml-480295106"></a>
### setCvar

```ml
function setCvar(host, name, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L60)

- [mq3.client.send_cmd.State](Type-mq3-client-send-cmd-state-1928835903.md) — struct
<a id="function-function-mq3-client-send-cmd-writepacket-function-writepacket-state-host-src-mq3-client-send-cmd-ml-1991051129"></a>
### writePacket

```ml
function writePacket(state, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L85)

- [mq3.client.send_cmd.WriteResult](Type-mq3-client-send-cmd-writeresult-2064183540.md) — struct
<a id="function-function-mq3-client-send-cmd-zerocommand-function-zerocommand-src-mq3-client-send-cmd-ml-10821858"></a>
### zeroCommand

```ml
function zeroCommand()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/client/send_cmd.ml#L40)
