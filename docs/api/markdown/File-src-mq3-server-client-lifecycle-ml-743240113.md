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

Return `mq3.shared.info.copy(value, 32)` from `server.client_lifecycle.boundedName`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Text passed as `text` to `mq3.shared.info.copy`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L181)

<a id="function-function-mq3-server-client-lifecycle-call2-function-call2-callback-host-a-b-src-mq3-server-client-lifecycle-ml-247173484"></a>
### call2

```ml
function call2(callback, host, a, b)
```

Compute call 2 in server.client_lifecycle.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `callback` | `dynamic` | — | Callback invoked for callback; the call sites below define the callback arguments. |
| `host` | `dynamic` | — | Host used in `callback(host, a, b)`. |
| `a` | `dynamic` | — | A used in `callback(host, a, b)`. |
| `b` | `dynamic` | — | B used in `callback(host, a, b)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L170)

<a id="function-function-mq3-server-client-lifecycle-call3-function-call3-callback-host-a-b-c-src-mq3-server-client-lifecycle-ml-191686421"></a>
### call3

```ml
function call3(callback, host, a, b, c)
```

Compute call 3 in server.client_lifecycle.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `callback` | `dynamic` | — | Callback invoked for callback; the call sites below define the callback arguments. |
| `host` | `dynamic` | — | Host used in `callback(host, a, b, c)`. |
| `a` | `dynamic` | — | A used in `callback(host, a, b, c)`. |
| `b` | `dynamic` | — | B used in `callback(host, a, b, c)`. |
| `c` | `dynamic` | — | C used in `callback(host, a, b, c)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L177)

- [mq3.server.client_lifecycle.Client](Type-mq3-server-client-lifecycle-client-2065191686.md) — struct
<a id="function-function-mq3-server-client-lifecycle-cliententerworld-function-cliententerworld-server-client-clientnum-cmd-host-src-mq3-server-client-lifecycle-ml-1543160679"></a>
### clientEnterWorld

```ml
function clientEnterWorld(server, client, clientNum, cmd, host)
```

Update `client.state`, `client.gentityNumber`, `client.deltaMessage`, `client.nextSnapshotTime` in server.client_lifecycle.

Direct state writes: `client.state`, `client.gentityNumber`, `client.deltaMessage`, `client.nextSnapshotTime`, `client.lastUsercmd`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — | Record exposing `time`. |
| `client` | `dynamic` | — | Updated in place: `state`, `gentityNumber`, `deltaMessage`, `nextSnapshotTime`, `lastUsercmd`. |
| `clientNum` | `dynamic` | — | A passed as `a` to `mq3.server.client_lifecycle.call2`. |
| `cmd` | `dynamic` | — | Command passed as `command` to `mq3.server.user_move.copyCommand`. |
| `host` | `dynamic` | — | Record exposing `gameBeginFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L324)

<a id="function-function-mq3-server-client-lifecycle-commandargs-function-commandargs-parser-src-mq3-server-client-lifecycle-ml-340338609"></a>
### commandArgs

```ml
function commandArgs(parser)
```

Compute command args in server.client_lifecycle; the normal completion returns `args`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `parser` | `dynamic` | — | State passed as `state` to `mq3.qcommon.command_buffer.argc`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L374)

<a id="function-function-mq3-server-client-lifecycle-contains-function-contains-values-wanted-src-mq3-server-client-lifecycle-ml-468848807"></a>
### contains

```ml
function contains(values, wanted)
```

Test client lifecycle in server.client_lifecycle; the normal completion returns `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `values` | `dynamic` | — | Sequence traversed as `value` by the loop in `contains`. |
| `wanted` | `dynamic` | — | Wanted used in `(value == wanted)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L236)

<a id="function-function-mq3-server-client-lifecycle-createclient-function-createclient-src-mq3-server-client-lifecycle-ml-1266657790"></a>
### createClient

```ml
function createClient()
```

Create `mq3.server.client_lifecycle.Client` with state=CS_FREE; name=""; userinfo=""; addressText=""; 19 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L89)

<a id="function-function-mq3-server-client-lifecycle-createserver-function-createserver-clientcount-src-mq3-server-client-lifecycle-ml-2146492190"></a>
### createServer

```ml
function createServer(clientCount)
```

Create server in server.client_lifecycle; the normal completion returns `Server(0, 0, 0, 0, array(1024, ""), array(1024, void), clients, [], 0, 0, false, false, 0, 1)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientCount` | `dynamic` | — | Client count used in `(clientCount - 1)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L126)

<a id="constant-constant-mq3-server-client-lifecycle-cs-active-const-cs-active-4-src-mq3-server-client-lifecycle-ml-539603781"></a>
### CS_ACTIVE

```ml
const CS_ACTIVE = 4
```

Client-state value identifying a client that has completed entry into the game world.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L26)

<a id="constant-constant-mq3-server-client-lifecycle-cs-connected-const-cs-connected-2-src-mq3-server-client-lifecycle-ml-1341573177"></a>
### CS_CONNECTED

```ml
const CS_CONNECTED = 2
```

Client lifecycle state after connection but before gamestate priming.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L22)

<a id="constant-constant-mq3-server-client-lifecycle-cs-free-const-cs-free-0-src-mq3-server-client-lifecycle-ml-1045330745"></a>
### CS_FREE

```ml
const CS_FREE = 0
```

Client-state value identifying a slot with no live client lifecycle to manage.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L18)

<a id="constant-constant-mq3-server-client-lifecycle-cs-primed-const-cs-primed-3-src-mq3-server-client-lifecycle-ml-1315003270"></a>
### CS_PRIMED

```ml
const CS_PRIMED = 3
```

Client lifecycle state after gamestate delivery and before entering active play.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L24)

<a id="constant-constant-mq3-server-client-lifecycle-cs-zombie-const-cs-zombie-1-src-mq3-server-client-lifecycle-ml-1450685176"></a>
### CS_ZOMBIE

```ml
const CS_ZOMBIE = 1
```

Client lifecycle state retaining a recently disconnected client for final messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L20)

<a id="function-function-mq3-server-client-lifecycle-dispatchbuiltin-function-dispatchbuiltin-runtime-client-name-parser-src-mq3-server-client-lifecycle-ml-671201433"></a>
### dispatchBuiltin

```ml
function dispatchBuiltin(runtime, client, name, parser)
```

Productive callback for client_command_dispatch.Services.builtinFn.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | Record exposing `server`, `host`, `clientNum`. |
| `client` | `dynamic` | — | Client passed as `client` to `mq3.server.client_lifecycle.SV_UpdateUserinfo_f`. |
| `name` | `dynamic` | — | Name used in `(name == "cp")` and `(name == "vdr")`. |
| `parser` | `dynamic` | — | State passed as `state` to `mq3.qcommon.command_buffer.argv`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L380)

<a id="function-function-mq3-server-client-lifecycle-dropclient-function-dropclient-server-client-clientnum-reason-host-src-mq3-server-client-lifecycle-ml-389149843"></a>
### dropClient

```ml
function dropClient(server, client, clientNum, reason, host)
```

Update `client.state`, `client.userinfo` in server.client_lifecycle; the normal completion returns `true`.

Direct state writes: `client.state`, `client.userinfo`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — | Record exposing `clients`. |
| `client` | `dynamic` | — | Record exposing `state`, `bot`, `name`. Updated in place: `state`, `userinfo`. |
| `clientNum` | `dynamic` | — | A passed as `a` to `mq3.server.client_lifecycle.call2`. |
| `reason` | `dynamic` | — | Reason used in `("disconnect \\"" + reason)` and `(("disconnect \\"" + reason) + "\\"")`. |
| `host` | `dynamic` | — | Record exposing `challengeDisconnectFn`, `closeDownloadFn`, `broadcastFn`, `gameDisconnectFn`, `sendCommandFn`, `botFreeFn`, `setUserinfoFn` and further fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L344)

<a id="constant-constant-mq3-server-client-lifecycle-max-msglen-const-max-msglen-16384-src-mq3-server-client-lifecycle-ml-1812458653"></a>
### MAX_MSGLEN

```ml
const MAX_MSGLEN = 16384
```

Maximum byte length of a complete sequenced network message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L36)

<a id="function-function-mq3-server-client-lifecycle-packetbytes-function-packetbytes-msg-src-mq3-server-client-lifecycle-ml-1500669035"></a>
### packetBytes

```ml
function packetBytes(msg)
```

Compute packet bytes in server.client_lifecycle; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Record exposing `cursize`, `data`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L291)

<a id="function-function-mq3-server-client-lifecycle-resetpureclient-function-resetpureclient-client-src-mq3-server-client-lifecycle-ml-461837369"></a>
### resetPureClient

```ml
function resetPureClient(client)
```

Reset pure client in server.client_lifecycle; updates `client.pureAuthentic`, `client.gotCP`.

Direct state writes: `client.pureAuthentic`, `client.gotCP`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — | Updated in place: `pureAuthentic`, `gotCP`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L228)

<a id="function-function-mq3-server-client-lifecycle-runtime-function-runtime-server-host-clientnum-src-mq3-server-client-lifecycle-ml-1514735826"></a>
### runtime

```ml
function runtime(server, host, clientNum)
```

Create `mq3.server.client_lifecycle.Runtime` with server=server; host=host; clientNum=clientNum.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — | Initial `server` field stored in the returned or constructed `mq3.server.client_lifecycle.Runtime` record. |
| `host` | `dynamic` | — | Initial `host` field stored in the returned or constructed `mq3.server.client_lifecycle.Runtime` record. |
| `clientNum` | `dynamic` | — | Initial `clientNum` field stored in the returned or constructed `mq3.server.client_lifecycle.Runtime` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L400)

- [mq3.server.client_lifecycle.Runtime](Type-mq3-server-client-lifecycle-runtime-68527011.md) — struct
<a id="function-function-mq3-server-client-lifecycle-sendclientgamestate-function-sendclientgamestate-server-client-clientnum-host-src-mq3-server-client-lifecycle-ml-1050279875"></a>
### sendClientGameState

```ml
function sendClientGameState(server, client, clientNum, host)
```

Send client game state in server.client_lifecycle; the normal completion returns `payload`.

Direct state writes: `client.state`, `client.pureAuthentic`, `client.gotCP`, `client.gamestateMessageNum`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — | Record exposing `configstrings`, `baselines`, `checksumFeed`. |
| `client` | `dynamic` | — | Record exposing `outgoingSequence`, `lastClientCommand`, `reliableSequence`. Updated in place: `state`, `pureAuthentic`, `gotCP`, `gamestateMessageNum`. |
| `clientNum` | `dynamic` | — | Value passed as `value` to `mq3.qcommon.message.writeLong`. |
| `host` | `dynamic` | — | Record exposing `transmitFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L299)

- [mq3.server.client_lifecycle.Server](Type-mq3-server-client-lifecycle-server-1562721514.md) — struct
<a id="function-function-mq3-server-client-lifecycle-services-function-services-src-mq3-server-client-lifecycle-ml-586833726"></a>
### services

```ml
function services()
```

Create `mq3.server.client_lifecycle.Services` with context=void; transmitFn=void; snapshotFn=void; dropFn=void; 10 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L164)

- [mq3.server.client_lifecycle.Services](Type-mq3-server-client-lifecycle-services-1455886397.md) — struct
<a id="function-function-mq3-server-client-lifecycle-sv-cliententerworld-function-sv-cliententerworld-server-client-clientnum-cmd-host-src-mq3-server-client-lifecycle-ml-1290002293"></a>
### SV_ClientEnterWorld

```ml
function SV_ClientEnterWorld(server, client, clientNum, cmd, host)
```

Return `mq3.server.client_lifecycle.clientEnterWorld(server, client, clientNum, cmd, host)` from `server.client_lifecycle.SV_ClientEnterWorld`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — | Server passed as `server` to `mq3.server.client_lifecycle.clientEnterWorld`. |
| `client` | `dynamic` | — | Client passed as `client` to `mq3.server.client_lifecycle.clientEnterWorld`. |
| `clientNum` | `dynamic` | — | Client num passed as `clientNum` to `mq3.server.client_lifecycle.clientEnterWorld`. |
| `cmd` | `dynamic` | — | Cmd passed as `cmd` to `mq3.server.client_lifecycle.clientEnterWorld`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.server.client_lifecycle.clientEnterWorld`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L334)

<a id="function-function-mq3-server-client-lifecycle-sv-disconnect-f-function-sv-disconnect-f-server-client-clientnum-host-src-mq3-server-client-lifecycle-ml-1933778373"></a>
### SV_Disconnect_f

```ml
function SV_Disconnect_f(server, client, clientNum, host)
```

Return `mq3.server.client_lifecycle.dropClient(server, client, clientNum, "disconnected", host)` from `server.client_lifecycle.SV_Disconnect_f`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — | Server passed as `server` to `mq3.server.client_lifecycle.dropClient`. |
| `client` | `dynamic` | — | Client passed as `client` to `mq3.server.client_lifecycle.dropClient`. |
| `clientNum` | `dynamic` | — | Client num passed as `clientNum` to `mq3.server.client_lifecycle.dropClient`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.server.client_lifecycle.dropClient`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L370)

<a id="function-function-mq3-server-client-lifecycle-sv-dropclient-function-sv-dropclient-server-client-clientnum-reason-host-src-mq3-server-client-lifecycle-ml-1196432779"></a>
### SV_DropClient

```ml
function SV_DropClient(server, client, clientNum, reason, host)
```

Return `mq3.server.client_lifecycle.dropClient(server, client, clientNum, reason, host)` from `server.client_lifecycle.SV_DropClient`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — | Server passed as `server` to `mq3.server.client_lifecycle.dropClient`. |
| `client` | `dynamic` | — | Client passed as `client` to `mq3.server.client_lifecycle.dropClient`. |
| `clientNum` | `dynamic` | — | Client num passed as `clientNum` to `mq3.server.client_lifecycle.dropClient`. |
| `reason` | `dynamic` | — | Reason passed as `reason` to `mq3.server.client_lifecycle.dropClient`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.server.client_lifecycle.dropClient`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L364)

<a id="function-function-mq3-server-client-lifecycle-sv-resetpureclient-f-function-sv-resetpureclient-f-client-src-mq3-server-client-lifecycle-ml-2000707433"></a>
### SV_ResetPureClient_f

```ml
function SV_ResetPureClient_f(client)
```

Return `mq3.server.client_lifecycle.resetPureClient(client)` from `server.client_lifecycle.SV_ResetPureClient_f`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — | Client passed as `client` to `mq3.server.client_lifecycle.resetPureClient`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L231)

<a id="function-function-mq3-server-client-lifecycle-sv-sendclientgamestate-function-sv-sendclientgamestate-server-client-clientnum-host-src-mq3-server-client-lifecycle-ml-1167420067"></a>
### SV_SendClientGameState

```ml
function SV_SendClientGameState(server, client, clientNum, host)
```

Return `mq3.server.client_lifecycle.sendClientGameState(server, client, clientNum, host)` from `server.client_lifecycle.SV_SendClientGameState`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — | Server passed as `server` to `mq3.server.client_lifecycle.sendClientGameState`. |
| `client` | `dynamic` | — | Client passed as `client` to `mq3.server.client_lifecycle.sendClientGameState`. |
| `clientNum` | `dynamic` | — | Client num passed as `clientNum` to `mq3.server.client_lifecycle.sendClientGameState`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.server.client_lifecycle.sendClientGameState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L314)

<a id="function-function-mq3-server-client-lifecycle-sv-updateuserinfo-f-function-sv-updateuserinfo-f-server-client-text-host-clientnum-src-mq3-server-client-lifecycle-ml-140518660"></a>
### SV_UpdateUserinfo_f

```ml
function SV_UpdateUserinfo_f(server, client, text, host, clientNum)
```

Return `mq3.server.client_lifecycle.updateUserinfo(server, client, text, host, clientNum)` from `server.client_lifecycle.SV_UpdateUserinfo_f`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — | Server passed as `server` to `mq3.server.client_lifecycle.updateUserinfo`. |
| `client` | `dynamic` | — | Client passed as `client` to `mq3.server.client_lifecycle.updateUserinfo`. |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.server.client_lifecycle.updateUserinfo`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.server.client_lifecycle.updateUserinfo`. |
| `clientNum` | `dynamic` | — | Client num passed as `clientNum` to `mq3.server.client_lifecycle.updateUserinfo`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L223)

<a id="function-function-mq3-server-client-lifecycle-sv-userinfochanged-function-sv-userinfochanged-server-client-src-mq3-server-client-lifecycle-ml-398398870"></a>
### SV_UserinfoChanged

```ml
function SV_UserinfoChanged(server, client)
```

Return `mq3.server.client_lifecycle.userinfoChanged(client, server.dedicated, server.lanForceRate)` from `server.client_lifecycle.SV_UserinfoChanged`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — | Record exposing `dedicated`, `lanForceRate`. |
| `client` | `dynamic` | — | Client passed as `client` to `mq3.server.client_lifecycle.userinfoChanged`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L203)

<a id="function-function-mq3-server-client-lifecycle-sv-verifypaks-f-function-sv-verifypaks-f-server-client-args-host-clientnum-src-mq3-server-client-lifecycle-ml-103516218"></a>
### SV_VerifyPaks_f

```ml
function SV_VerifyPaks_f(server, client, args, host, clientNum)
```

Return `mq3.server.client_lifecycle.verifyPaks(server, client, args, host, clientNum)` from `server.client_lifecycle.SV_VerifyPaks_f`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — | Server passed as `server` to `mq3.server.client_lifecycle.verifyPaks`. |
| `client` | `dynamic` | — | Client passed as `client` to `mq3.server.client_lifecycle.verifyPaks`. |
| `args` | `dynamic` | — | Args passed as `args` to `mq3.server.client_lifecycle.verifyPaks`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.server.client_lifecycle.verifyPaks`. |
| `clientNum` | `dynamic` | — | Client num passed as `clientNum` to `mq3.server.client_lifecycle.verifyPaks`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L287)

<a id="constant-constant-mq3-server-client-lifecycle-svc-baseline-const-svc-baseline-4-src-mq3-server-client-lifecycle-ml-1043458391"></a>
### SVC_BASELINE

```ml
const SVC_BASELINE = 4
```

Server-to-client opcode introducing an entity state used as a delta baseline.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L32)

<a id="constant-constant-mq3-server-client-lifecycle-svc-configstring-const-svc-configstring-3-src-mq3-server-client-lifecycle-ml-56736800"></a>
### SVC_CONFIGSTRING

```ml
const SVC_CONFIGSTRING = 3
```

Server-to-client opcode introducing an indexed configuration string.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L30)

<a id="constant-constant-mq3-server-client-lifecycle-svc-eof-const-svc-eof-8-src-mq3-server-client-lifecycle-ml-1943557945"></a>
### SVC_EOF

```ml
const SVC_EOF = 8
```

Server-to-client opcode marking the end of a message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L34)

<a id="constant-constant-mq3-server-client-lifecycle-svc-gamestate-const-svc-gamestate-2-src-mq3-server-client-lifecycle-ml-2077129547"></a>
### SVC_GAMESTATE

```ml
const SVC_GAMESTATE = 2
```

Server-to-client opcode introducing the initial configuration and entity baselines.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L28)

<a id="function-function-mq3-server-client-lifecycle-updateuserinfo-function-updateuserinfo-server-client-text-host-clientnum-src-mq3-server-client-lifecycle-ml-736024346"></a>
### updateUserinfo

```ml
function updateUserinfo(server, client, text, host, clientNum)
```

Update userinfo in server.client_lifecycle.

Direct state writes: `client.userinfo`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — | Server passed as `server` to `mq3.server.client_lifecycle.SV_UserinfoChanged`. |
| `client` | `dynamic` | — | Updated in place: `userinfo`. |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.shared.info.copy`. |
| `host` | `dynamic` | — | Record exposing `gameUserinfoFn`. |
| `clientNum` | `dynamic` | — | A passed as `a` to `mq3.server.client_lifecycle.call2`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L213)

<a id="function-function-mq3-server-client-lifecycle-userinfochanged-function-userinfochanged-client-dedicated-lanforcerate-src-mq3-server-client-lifecycle-ml-1872953778"></a>
### userinfoChanged

```ml
function userinfoChanged(client, dedicated, lanForceRate)
```

Update `client.name`, `client.rate`, `client.userinfo`, `client.snapshotMsec` in server.client_lifecycle.

Direct state writes: `client.name`, `client.rate`, `client.userinfo`, `client.snapshotMsec`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — | Record exposing `userinfo`, `lan`, `rate`, `addressText`, `local`. Updated in place: `name`, `rate`, `userinfo`, `snapshotMsec`. |
| `dedicated` | `dynamic` | — | Dedicated used in `(dedicated != 2)` and `(client.lan and (dedicated != 2))`. |
| `lanForceRate` | `dynamic` | — | Lan force rate used in `(lanForceRate == 1)` and `((client.lan and (dedicated != 2)) and (lanForceRate == 1))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L188)

<a id="function-function-mq3-server-client-lifecycle-verifypaks-function-verifypaks-server-client-args-host-clientnum-src-mq3-server-client-lifecycle-ml-400857572"></a>
### verifyPaks

```ml
function verifyPaks(server, client, args, host, clientNum)
```

Update `client.gotCP`, `client.pureAuthentic`, `client.nextSnapshotTime`, `client.state` in server.client_lifecycle; the normal completion returns `"invalid"`.

Direct state writes: `client.gotCP`, `client.pureAuthentic`, `client.nextSnapshotTime`, `client.state`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `server` | `dynamic` | — | Record exposing `pure`, `cgamePakFound`, `uiPakFound`, `checksumFeedServerId`, `cgameChecksum`, `uiChecksum`, `loadedPureChecksums` and further fields. |
| `client` | `dynamic` | — | Updated in place: `gotCP`, `pureAuthentic`, `nextSnapshotTime`, `state`. |
| `args` | `dynamic` | — | Args used in `args[1]` and `args[4]`. |
| `host` | `dynamic` | — | Record exposing `snapshotFn`, `dropFn`. |
| `clientNum` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/client_lifecycle.ml#L245)
