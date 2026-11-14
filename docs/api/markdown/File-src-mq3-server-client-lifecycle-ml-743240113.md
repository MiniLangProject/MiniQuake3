# `src/mq3/server/client_lifecycle.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.client_lifecycle`](Package-mq3-server-client-lifecycle-935848769.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `numbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/game/entitystate.ml` as `entitystate` → [src/mq3/game/entitystate.ml](File-src-mq3-game-entitystate-ml-1227653182.md)
- `mq3/qcommon/command_buffer.ml` as `command` → [src/mq3/qcommon/command_buffer.ml](File-src-mq3-qcommon-command-buffer-ml-122952676.md)
- `mq3/qcommon/message.ml` as `message` → [src/mq3/qcommon/message.ml](File-src-mq3-qcommon-message-ml-1547411275.md)
- `mq3/qcommon/message_state_delta.ml` as `delta` → [src/mq3/qcommon/message_state_delta.ml](File-src-mq3-qcommon-message-state-delta-ml-255612102.md)
- `mq3/server/reliable_commands.ml` as `reliable` → [src/mq3/server/reliable_commands.ml](File-src-mq3-server-reliable-commands-ml-1690433750.md)
- `mq3/server/user_move.ml` as `userMove` → [src/mq3/server/user_move.ml](File-src-mq3-server-user-move-ml-1219627038.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)

## Declarations

<a id="function-function-mq3-server-client-lifecycle-boundedname-function-boundedname-value-src-mq3-server-client-lifecycle-ml-417797849"></a>
### boundedName

```ml
function boundedName(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L44)

<a id="function-function-mq3-server-client-lifecycle-call2-function-call2-callback-host-a-b-src-mq3-server-client-lifecycle-ml-247173484"></a>
### call2

```ml
function call2(callback, host, a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `callback` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L41)

<a id="function-function-mq3-server-client-lifecycle-call3-function-call3-callback-host-a-b-c-src-mq3-server-client-lifecycle-ml-191686421"></a>
### call3

```ml
function call3(callback, host, a, b, c)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `callback` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L42)

- [mq3.server.client_lifecycle.Client](Type-mq3-server-client-lifecycle-client-2065191686.md) — struct
<a id="function-function-mq3-server-client-lifecycle-cliententerworld-function-cliententerworld-server-client-clientnum-cmd-host-src-mq3-server-client-lifecycle-ml-1543160679"></a>
### clientEnterWorld

```ml
function clientEnterWorld(server, client, clientNum, cmd, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `cmd` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L119)

<a id="function-function-mq3-server-client-lifecycle-commandargs-function-commandargs-parser-src-mq3-server-client-lifecycle-ml-340338609"></a>
### commandArgs

```ml
function commandArgs(parser)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `parser` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L142)

<a id="function-function-mq3-server-client-lifecycle-contains-function-contains-values-wanted-src-mq3-server-client-lifecycle-ml-468848807"></a>
### contains

```ml
function contains(values, wanted)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — |  |
| `wanted` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L67)

<a id="function-function-mq3-server-client-lifecycle-createclient-function-createclient-src-mq3-server-client-lifecycle-ml-1266657790"></a>
### createClient

```ml
function createClient()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L29)

<a id="function-function-mq3-server-client-lifecycle-createserver-function-createserver-clientcount-src-mq3-server-client-lifecycle-ml-2146492190"></a>
### createServer

```ml
function createServer(clientCount)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientCount` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L34)

<a id="constant-constant-mq3-server-client-lifecycle-cs-active-const-cs-active-4-src-mq3-server-client-lifecycle-ml-539603781"></a>
### CS_ACTIVE

```ml
const CS_ACTIVE = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L21)

<a id="constant-constant-mq3-server-client-lifecycle-cs-connected-const-cs-connected-2-src-mq3-server-client-lifecycle-ml-1341573177"></a>
### CS_CONNECTED

```ml
const CS_CONNECTED = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L19)

<a id="constant-constant-mq3-server-client-lifecycle-cs-free-const-cs-free-0-src-mq3-server-client-lifecycle-ml-1045330745"></a>
### CS_FREE

```ml
const CS_FREE = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L17)

<a id="constant-constant-mq3-server-client-lifecycle-cs-primed-const-cs-primed-3-src-mq3-server-client-lifecycle-ml-1315003270"></a>
### CS_PRIMED

```ml
const CS_PRIMED = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L20)

<a id="constant-constant-mq3-server-client-lifecycle-cs-zombie-const-cs-zombie-1-src-mq3-server-client-lifecycle-ml-1450685176"></a>
### CS_ZOMBIE

```ml
const CS_ZOMBIE = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L18)

<a id="function-function-mq3-server-client-lifecycle-dispatchbuiltin-function-dispatchbuiltin-runtime-client-name-parser-src-mq3-server-client-lifecycle-ml-671201433"></a>
### dispatchBuiltin

```ml
function dispatchBuiltin(runtime, client, name, parser)
```

Productive callback for client_command_dispatch.Services.builtinFn.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `parser` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L144)

<a id="function-function-mq3-server-client-lifecycle-dropclient-function-dropclient-server-client-clientnum-reason-host-src-mq3-server-client-lifecycle-ml-389149843"></a>
### dropClient

```ml
function dropClient(server, client, clientNum, reason, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L125)

<a id="constant-constant-mq3-server-client-lifecycle-max-msglen-const-max-msglen-16384-src-mq3-server-client-lifecycle-ml-1812458653"></a>
### MAX_MSGLEN

```ml
const MAX_MSGLEN = 16384
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L26)

<a id="function-function-mq3-server-client-lifecycle-packetbytes-function-packetbytes-msg-src-mq3-server-client-lifecycle-ml-1500669035"></a>
### packetBytes

```ml
function packetBytes(msg)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L106)

<a id="function-function-mq3-server-client-lifecycle-resetpureclient-function-resetpureclient-client-src-mq3-server-client-lifecycle-ml-461837369"></a>
### resetPureClient

```ml
function resetPureClient(client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L64)

<a id="function-function-mq3-server-client-lifecycle-runtime-function-runtime-server-host-clientnum-src-mq3-server-client-lifecycle-ml-1514735826"></a>
### runtime

```ml
function runtime(server, host, clientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L152)

- [mq3.server.client_lifecycle.Runtime](Type-mq3-server-client-lifecycle-runtime-68527011.md) — struct
<a id="function-function-mq3-server-client-lifecycle-sendclientgamestate-function-sendclientgamestate-server-client-clientnum-host-src-mq3-server-client-lifecycle-ml-1050279875"></a>
### sendClientGameState

```ml
function sendClientGameState(server, client, clientNum, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L107)

- [mq3.server.client_lifecycle.Server](Type-mq3-server-client-lifecycle-server-1562721514.md) — struct
<a id="function-function-mq3-server-client-lifecycle-services-function-services-src-mq3-server-client-lifecycle-ml-586833726"></a>
### services

```ml
function services()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L40)

- [mq3.server.client_lifecycle.Services](Type-mq3-server-client-lifecycle-services-1455886397.md) — struct
<a id="function-function-mq3-server-client-lifecycle-sv-cliententerworld-function-sv-cliententerworld-server-client-clientnum-cmd-host-src-mq3-server-client-lifecycle-ml-1290002293"></a>
### SV_ClientEnterWorld

```ml
function SV_ClientEnterWorld(server, client, clientNum, cmd, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `cmd` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L123)

<a id="function-function-mq3-server-client-lifecycle-sv-disconnect-f-function-sv-disconnect-f-server-client-clientnum-host-src-mq3-server-client-lifecycle-ml-1933778373"></a>
### SV_Disconnect_f

```ml
function SV_Disconnect_f(server, client, clientNum, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L140)

<a id="function-function-mq3-server-client-lifecycle-sv-dropclient-function-sv-dropclient-server-client-clientnum-reason-host-src-mq3-server-client-lifecycle-ml-1196432779"></a>
### SV_DropClient

```ml
function SV_DropClient(server, client, clientNum, reason, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L139)

<a id="function-function-mq3-server-client-lifecycle-sv-resetpureclient-f-function-sv-resetpureclient-f-client-src-mq3-server-client-lifecycle-ml-2000707433"></a>
### SV_ResetPureClient_f

```ml
function SV_ResetPureClient_f(client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L65)

<a id="function-function-mq3-server-client-lifecycle-sv-sendclientgamestate-function-sv-sendclientgamestate-server-client-clientnum-host-src-mq3-server-client-lifecycle-ml-1167420067"></a>
### SV_SendClientGameState

```ml
function SV_SendClientGameState(server, client, clientNum, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L117)

<a id="function-function-mq3-server-client-lifecycle-sv-updateuserinfo-f-function-sv-updateuserinfo-f-server-client-text-host-clientnum-src-mq3-server-client-lifecycle-ml-140518660"></a>
### SV_UpdateUserinfo_f

```ml
function SV_UpdateUserinfo_f(server, client, text, host, clientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L63)

<a id="function-function-mq3-server-client-lifecycle-sv-userinfochanged-function-sv-userinfochanged-server-client-src-mq3-server-client-lifecycle-ml-398398870"></a>
### SV_UserinfoChanged

```ml
function SV_UserinfoChanged(server, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L57)

<a id="function-function-mq3-server-client-lifecycle-sv-verifypaks-f-function-sv-verifypaks-f-server-client-args-host-clientnum-src-mq3-server-client-lifecycle-ml-103516218"></a>
### SV_VerifyPaks_f

```ml
function SV_VerifyPaks_f(server, client, args, host, clientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L104)

<a id="constant-constant-mq3-server-client-lifecycle-svc-baseline-const-svc-baseline-4-src-mq3-server-client-lifecycle-ml-1043458391"></a>
### SVC_BASELINE

```ml
const SVC_BASELINE = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L24)

<a id="constant-constant-mq3-server-client-lifecycle-svc-configstring-const-svc-configstring-3-src-mq3-server-client-lifecycle-ml-56736800"></a>
### SVC_CONFIGSTRING

```ml
const SVC_CONFIGSTRING = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L23)

<a id="constant-constant-mq3-server-client-lifecycle-svc-eof-const-svc-eof-8-src-mq3-server-client-lifecycle-ml-1943557945"></a>
### SVC_EOF

```ml
const SVC_EOF = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L25)

<a id="constant-constant-mq3-server-client-lifecycle-svc-gamestate-const-svc-gamestate-2-src-mq3-server-client-lifecycle-ml-2077129547"></a>
### SVC_GAMESTATE

```ml
const SVC_GAMESTATE = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L22)

<a id="function-function-mq3-server-client-lifecycle-updateuserinfo-function-updateuserinfo-server-client-text-host-clientnum-src-mq3-server-client-lifecycle-ml-736024346"></a>
### updateUserinfo

```ml
function updateUserinfo(server, client, text, host, clientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L59)

<a id="function-function-mq3-server-client-lifecycle-userinfochanged-function-userinfochanged-client-dedicated-lanforcerate-src-mq3-server-client-lifecycle-ml-1872953778"></a>
### userinfoChanged

```ml
function userinfoChanged(client, dedicated, lanForceRate)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — |  |
| `dedicated` | `dynamic` | — |  |
| `lanForceRate` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L45)

<a id="function-function-mq3-server-client-lifecycle-verifypaks-function-verifypaks-server-client-args-host-clientnum-src-mq3-server-client-lifecycle-ml-400857572"></a>
### verifyPaks

```ml
function verifyPaks(server, client, args, host, clientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L68)
