# `src/mq3/server/main_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.main_runtime`](Package-mq3-server-main-runtime-1896163191.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `numbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/server/connectionless.ml` as `connectionless` → [src/mq3/server/connectionless.ml](File-src-mq3-server-connectionless-ml-1112827538.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-server-main-runtime-authorizecallback-function-authorizecallback-host-address-args-src-mq3-server-main-runtime-ml-1319500859"></a>
### authorizeCallback

```ml
function authorizeCallback(host, address, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L194)

- [mq3.server.main_runtime.Binding](Type-mq3-server-main-runtime-binding-1989764180.md) — struct
<a id="function-function-mq3-server-main-runtime-bounded-function-bounded-text-capacity-src-mq3-server-main-runtime-ml-986822535"></a>
### bounded

```ml
function bounded(text, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L69)

<a id="function-function-mq3-server-main-runtime-client-function-client-state-name-ping-score-src-mq3-server-main-runtime-ml-1763388830"></a>
### client

```ml
function client(state, name, ping, score)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `ping` | `dynamic` | — |  |
| `score` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L27)

- [mq3.server.main_runtime.Client](Type-mq3-server-main-runtime-client-1505800316.md) — struct
<a id="function-function-mq3-server-main-runtime-confignumber-function-confignumber-text-src-mq3-server-main-runtime-ml-1097758533"></a>
### configNumber

```ml
function configNumber(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L57)

<a id="function-function-mq3-server-main-runtime-connectionlessservices-function-connectionlessservices-state-host-src-mq3-server-main-runtime-ml-541570811"></a>
### connectionlessServices

```ml
function connectionlessServices(state, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L197)

<a id="constant-constant-mq3-server-main-runtime-cs-active-const-cs-active-4-src-mq3-server-main-runtime-ml-2089549677"></a>
### CS_ACTIVE

```ml
const CS_ACTIVE = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L20)

<a id="constant-constant-mq3-server-main-runtime-cs-connected-const-cs-connected-2-src-mq3-server-main-runtime-ml-280056533"></a>
### CS_CONNECTED

```ml
const CS_CONNECTED = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L18)

<a id="constant-constant-mq3-server-main-runtime-cs-free-const-cs-free-0-src-mq3-server-main-runtime-ml-1455774761"></a>
### CS_FREE

```ml
const CS_FREE = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L16)

<a id="constant-constant-mq3-server-main-runtime-cs-primed-const-cs-primed-3-src-mq3-server-main-runtime-ml-697682622"></a>
### CS_PRIMED

```ml
const CS_PRIMED = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L19)

<a id="constant-constant-mq3-server-main-runtime-cs-zombie-const-cs-zombie-1-src-mq3-server-main-runtime-ml-311925148"></a>
### CS_ZOMBIE

```ml
const CS_ZOMBIE = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L17)

<a id="function-function-mq3-server-main-runtime-decompresscallback-function-decompresscallback-host-msg-offset-src-mq3-server-main-runtime-ml-380620832"></a>
### decompressCallback

```ml
function decompressCallback(host, msg, offset)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |
| `offset` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L195)

<a id="function-function-mq3-server-main-runtime-diagnosticcallback-function-diagnosticcallback-host-address-text-src-mq3-server-main-runtime-ml-1011861205"></a>
### diagnosticCallback

```ml
function diagnosticCallback(host, address, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L196)

<a id="constant-constant-mq3-server-main-runtime-gt-single-player-const-gt-single-player-2-src-mq3-server-main-runtime-ml-19036221"></a>
### GT_SINGLE_PLAYER

```ml
const GT_SINGLE_PLAYER = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L21)

<a id="constant-constant-mq3-server-main-runtime-heartbeat-game-const-heartbeat-game-quakearena-1-src-mq3-server-main-runtime-ml-2043118257"></a>
### HEARTBEAT_GAME

```ml
const HEARTBEAT_GAME = "QuakeArena-1"
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L23)

<a id="constant-constant-mq3-server-main-runtime-heartbeat-msec-const-heartbeat-msec-300000-src-mq3-server-main-runtime-ml-392125222"></a>
### HEARTBEAT_MSEC

```ml
const HEARTBEAT_MSEC = 300000
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L22)

<a id="function-function-mq3-server-main-runtime-infocallback-function-infocallback-host-address-args-src-mq3-server-main-runtime-ml-1282542431"></a>
### infoCallback

```ml
function infoCallback(host, address, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L192)

<a id="function-function-mq3-server-main-runtime-master-function-master-name-value-src-mq3-server-main-runtime-ml-1415112280"></a>
### master

```ml
function master(name, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L32)

- [mq3.server.main_runtime.Master](Type-mq3-server-main-runtime-master-1361694537.md) — struct
<a id="constant-constant-mq3-server-main-runtime-max-info-string-const-max-info-string-1024-src-mq3-server-main-runtime-ml-1524373162"></a>
### MAX_INFO_STRING

```ml
const MAX_INFO_STRING = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L15)

<a id="constant-constant-mq3-server-main-runtime-max-msglen-const-max-msglen-16384-src-mq3-server-main-runtime-ml-1946732765"></a>
### MAX_MSGLEN

```ml
const MAX_MSGLEN = 16384
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L14)

<a id="constant-constant-mq3-server-main-runtime-max-reliable-commands-const-max-reliable-commands-64-src-mq3-server-main-runtime-ml-427417937"></a>
### MAX_RELIABLE_COMMANDS

```ml
const MAX_RELIABLE_COMMANDS = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L12)

<a id="constant-constant-mq3-server-main-runtime-max-string-chars-const-max-string-chars-1024-src-mq3-server-main-runtime-ml-1738426900"></a>
### MAX_STRING_CHARS

```ml
const MAX_STRING_CHARS = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L13)

<a id="constant-constant-mq3-server-main-runtime-port-master-const-port-master-27950-src-mq3-server-main-runtime-ml-1826979404"></a>
### PORT_MASTER

```ml
const PORT_MASTER = 27950
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L24)

<a id="function-function-mq3-server-main-runtime-rconcallback-function-rconcallback-host-address-msg-text-args-src-mq3-server-main-runtime-ml-143252963"></a>
### rconCallback

```ml
function rconCallback(host, address, msg, text, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `msg` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L193)

<a id="function-function-mq3-server-main-runtime-remotetail-function-remotetail-text-src-mq3-server-main-runtime-ml-1593941457"></a>
### remoteTail

```ml
function remoteTail(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L170)

<a id="function-function-mq3-server-main-runtime-requireclient-function-requireclient-value-src-mq3-server-main-runtime-ml-829473353"></a>
### requireClient

```ml
function requireClient(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L64)

<a id="function-function-mq3-server-main-runtime-runtime-function-runtime-src-mq3-server-main-runtime-ml-487718306"></a>
### runtime

```ml
function runtime()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L35)

- [mq3.server.main_runtime.Runtime](Type-mq3-server-main-runtime-runtime-1540197373.md) — struct
<a id="function-function-mq3-server-main-runtime-say-function-say-host-text-src-mq3-server-main-runtime-ml-1267963625"></a>
### say

```ml
function say(host, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L43)

<a id="function-function-mq3-server-main-runtime-send-function-send-host-address-text-src-mq3-server-main-runtime-ml-288341117"></a>
### send

```ml
function send(host, address, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L42)

<a id="function-function-mq3-server-main-runtime-services-function-services-src-mq3-server-main-runtime-ml-1382638490"></a>
### services

```ml
function services()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L40)

- [mq3.server.main_runtime.Services](Type-mq3-server-main-runtime-services-1416563799.md) — struct
<a id="function-function-mq3-server-main-runtime-statuscallback-function-statuscallback-host-address-args-src-mq3-server-main-runtime-ml-2129196695"></a>
### statusCallback

```ml
function statusCallback(host, address, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L191)

<a id="function-function-mq3-server-main-runtime-statusline-function-statusline-value-src-mq3-server-main-runtime-ml-1126191793"></a>
### statusLine

```ml
function statusLine(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L136)

<a id="function-function-mq3-server-main-runtime-sv-addservercommand-function-sv-addservercommand-host-value-cmd-src-mq3-server-main-runtime-ml-299056709"></a>
### SV_AddServerCommand

```ml
function SV_AddServerCommand(host, value, cmd)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `cmd` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L84)

<a id="function-function-mq3-server-main-runtime-sv-expandnewlines-function-sv-expandnewlines-value-src-mq3-server-main-runtime-ml-645727883"></a>
### SV_ExpandNewlines

```ml
function SV_ExpandNewlines(value)
```

SV_ExpandNewlines uses a 1024-byte static buffer and stops with three bytes left, because a final input newline needs two output bytes plus NUL.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L47)

<a id="function-function-mq3-server-main-runtime-sv-flushredirect-function-sv-flushredirect-state-host-output-src-mq3-server-main-runtime-ml-1969455074"></a>
### SV_FlushRedirect

```ml
function SV_FlushRedirect(state, host, output)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `output` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L165)

<a id="function-function-mq3-server-main-runtime-sv-masterheartbeat-function-sv-masterheartbeat-state-host-src-mq3-server-main-runtime-ml-473550951"></a>
### SV_MasterHeartbeat

```ml
function SV_MasterHeartbeat(state, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L110)

<a id="function-function-mq3-server-main-runtime-sv-mastershutdown-function-sv-mastershutdown-state-host-src-mq3-server-main-runtime-ml-2012795163"></a>
### SV_MasterShutdown

```ml
function SV_MasterShutdown(state, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L130)

<a id="function-function-mq3-server-main-runtime-sv-replacependingservercommands-function-sv-replacependingservercommands-value-cmd-src-mq3-server-main-runtime-ml-2099848613"></a>
### SV_ReplacePendingServerCommands

```ml
function SV_ReplacePendingServerCommands(value, cmd)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `cmd` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L73)

<a id="function-function-mq3-server-main-runtime-sv-sendservercommand-function-sv-sendservercommand-state-host-target-cmd-src-mq3-server-main-runtime-ml-428837048"></a>
### SV_SendServerCommand

```ml
function SV_SendServerCommand(state, host, target, cmd)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |
| `cmd` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L100)

<a id="function-function-mq3-server-main-runtime-svc-info-function-svc-info-state-host-address-challenge-src-mq3-server-main-runtime-ml-1416807114"></a>
### SVC_Info

```ml
function SVC_Info(state, host, address, challenge)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `challenge` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L151)

<a id="function-function-mq3-server-main-runtime-svc-remotecommand-function-svc-remotecommand-state-host-address-raw-args-src-mq3-server-main-runtime-ml-113775764"></a>
### SVC_RemoteCommand

```ml
function SVC_RemoteCommand(state, host, address, raw, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `raw` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L179)

<a id="function-function-mq3-server-main-runtime-svc-status-function-svc-status-state-host-address-challenge-src-mq3-server-main-runtime-ml-842789034"></a>
### SVC_Status

```ml
function SVC_Status(state, host, address, challenge)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `challenge` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L140)
