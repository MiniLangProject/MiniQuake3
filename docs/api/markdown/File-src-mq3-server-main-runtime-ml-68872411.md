# `src/mq3/server/main_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.main_runtime`](Package-mq3-server-main-runtime-1896163191.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `numbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/server/connectionless.ml` as `connectionless` → [src/mq3/server/connectionless.ml](File-src-mq3-server-connectionless-ml-1112827538.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-server-main-runtime-authorizecallback-function-authorizecallback-host-address-args-src-mq3-server-main-runtime-ml-1319500859"></a>
### authorizeCallback

```ml
function authorizeCallback(host, address, args)
```

Compute authorize callback in server.main_runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |
| `address` | `dynamic` | — | Address used in `host.context.services.authorizeFn(host.context.services, address, args)`. |
| `args` | `dynamic` | — | Args used in `host.context.services.authorizeFn(host.context.services, address, args)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L411)

- [mq3.server.main_runtime.Binding](Type-mq3-server-main-runtime-binding-1989764180.md) — struct
<a id="function-function-mq3-server-main-runtime-bounded-function-bounded-text-capacity-src-mq3-server-main-runtime-ml-986822535"></a>
### bounded

```ml
function bounded(text, capacity)
```

Compute bounded in server.main_runtime; the normal completion returns `decode(slice(data, 0, (capacity - 1)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text used in `bytes(text)`. |
| `capacity` | `dynamic` | — | Capacity used in `(capacity - 1)` and `(len(data) < capacity)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L207)

<a id="function-function-mq3-server-main-runtime-client-function-client-state-name-ping-score-src-mq3-server-main-runtime-ml-1763388830"></a>
### client

```ml
function client(state, name, ping, score)
```

Create `mq3.server.main_runtime.Client` with state=state; name=name; ping=ping; score=score; reliableAcknowledge=0; reliableSequence=0; reliableSent=0; reliableCommands=array(MAX_RELIABLE_COMMANDS, "").

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Initial `state` field stored in the returned or constructed `mq3.server.main_runtime.Client` record. |
| `name` | `dynamic` | — | Initial `name` field stored in the returned or constructed `mq3.server.main_runtime.Client` record. |
| `ping` | `dynamic` | — | Initial `ping` field stored in the returned or constructed `mq3.server.main_runtime.Client` record. |
| `score` | `dynamic` | — | Initial `score` field stored in the returned or constructed `mq3.server.main_runtime.Client` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L64)

- [mq3.server.main_runtime.Client](Type-mq3-server-main-runtime-client-1505800316.md) — struct
<a id="function-function-mq3-server-main-runtime-confignumber-function-confignumber-text-src-mq3-server-main-runtime-ml-1097758533"></a>
### configNumber

```ml
function configNumber(text)
```

Compute config number in server.main_runtime; the normal completion returns `numbers.atoi(decode(slice(data, index, (len(data) - index))))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text used in `bytes(text)` and `(text == void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L188)

<a id="function-function-mq3-server-main-runtime-connectionlessservices-function-connectionlessservices-state-host-src-mq3-server-main-runtime-ml-541570811"></a>
### connectionlessServices

```ml
function connectionlessServices(state, host)
```

Compute connectionless services in server.main_runtime; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Initial `state` field stored in the returned or constructed `mq3.server.main_runtime.Binding` record. |
| `host` | `dynamic` | — | Initial `services` field stored in the returned or constructed `mq3.server.main_runtime.Binding` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L425)

<a id="constant-constant-mq3-server-main-runtime-cs-active-const-cs-active-4-src-mq3-server-main-runtime-ml-2089549677"></a>
### CS_ACTIVE

```ml
const CS_ACTIVE = 4
```

Client-state value identifying an active player reported by the server runtime and status handlers.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L29)

<a id="constant-constant-mq3-server-main-runtime-cs-connected-const-cs-connected-2-src-mq3-server-main-runtime-ml-280056533"></a>
### CS_CONNECTED

```ml
const CS_CONNECTED = 2
```

Client lifecycle state after connection but before gamestate priming.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L25)

<a id="constant-constant-mq3-server-main-runtime-cs-free-const-cs-free-0-src-mq3-server-main-runtime-ml-1455774761"></a>
### CS_FREE

```ml
const CS_FREE = 0
```

Client-state value identifying a vacant client entry ignored by server connection services.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L21)

<a id="constant-constant-mq3-server-main-runtime-cs-primed-const-cs-primed-3-src-mq3-server-main-runtime-ml-697682622"></a>
### CS_PRIMED

```ml
const CS_PRIMED = 3
```

Client lifecycle state after gamestate delivery and before entering active play.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L27)

<a id="constant-constant-mq3-server-main-runtime-cs-zombie-const-cs-zombie-1-src-mq3-server-main-runtime-ml-311925148"></a>
### CS_ZOMBIE

```ml
const CS_ZOMBIE = 1
```

Client lifecycle state retaining a recently disconnected client for final messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L23)

<a id="function-function-mq3-server-main-runtime-decompresscallback-function-decompresscallback-host-msg-offset-src-mq3-server-main-runtime-ml-380620832"></a>
### decompressCallback

```ml
function decompressCallback(host, msg, offset)
```

Decompress callback in server.main_runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |
| `msg` | `dynamic` | — | Msg used in `host.context.services.decompressFn(host.context.services, msg, offset)`. |
| `offset` | `dynamic` | — | Offset used in `host.context.services.decompressFn(host.context.services, msg, offset)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L416)

<a id="function-function-mq3-server-main-runtime-diagnosticcallback-function-diagnosticcallback-host-address-text-src-mq3-server-main-runtime-ml-1011861205"></a>
### diagnosticCallback

```ml
function diagnosticCallback(host, address, text)
```

Compute diagnostic callback in server.main_runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |
| `address` | `dynamic` | — | Address used in `host.context.services.diagnosticFn(host.context.services, address, text)`. |
| `text` | `dynamic` | — | Text used in `host.context.services.diagnosticFn(host.context.services, address, text)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L421)

<a id="constant-constant-mq3-server-main-runtime-gt-single-player-const-gt-single-player-2-src-mq3-server-main-runtime-ml-19036221"></a>
### GT_SINGLE_PLAYER

```ml
const GT_SINGLE_PLAYER = 2
```

Game-mode identifier for single-player progression.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L31)

<a id="constant-constant-mq3-server-main-runtime-heartbeat-game-const-heartbeat-game-quakearena-1-src-mq3-server-main-runtime-ml-2043118257"></a>
### HEARTBEAT_GAME

```ml
const HEARTBEAT_GAME = "QuakeArena-1"
```

Game name advertised in master-server heartbeat messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L35)

<a id="constant-constant-mq3-server-main-runtime-heartbeat-msec-const-heartbeat-msec-300000-src-mq3-server-main-runtime-ml-392125222"></a>
### HEARTBEAT_MSEC

```ml
const HEARTBEAT_MSEC = 300000
```

Interval between master-server heartbeats, in milliseconds.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L33)

<a id="function-function-mq3-server-main-runtime-infocallback-function-infocallback-host-address-args-src-mq3-server-main-runtime-ml-1282542431"></a>
### infoCallback

```ml
function infoCallback(host, address, args)
```

Compute info callback in server.main_runtime; the normal completion returns `SVC_Info(host.context.state, host.context.services, address, challenge)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |
| `address` | `dynamic` | — | Address passed as `address` to `mq3.server.main_runtime.SVC_Info`. |
| `args` | `dynamic` | — | Args used in `args[1]` and `len(args)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L399)

<a id="function-function-mq3-server-main-runtime-master-function-master-name-value-src-mq3-server-main-runtime-ml-1415112280"></a>
### master

```ml
function master(name, value)
```

Create `mq3.server.main_runtime.Master` with name=name; value=value; modified=true; address=void.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Initial `name` field stored in the returned or constructed `mq3.server.main_runtime.Master` record. |
| `value` | `dynamic` | — | Initial `value` field stored in the returned or constructed `mq3.server.main_runtime.Master` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L82)

- [mq3.server.main_runtime.Master](Type-mq3-server-main-runtime-master-1361694537.md) — struct
<a id="constant-constant-mq3-server-main-runtime-max-info-string-const-max-info-string-1024-src-mq3-server-main-runtime-ml-1524373162"></a>
### MAX_INFO_STRING

```ml
const MAX_INFO_STRING = 1024
```

Maximum length of a backslash-delimited server or client information string.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L19)

<a id="constant-constant-mq3-server-main-runtime-max-msglen-const-max-msglen-16384-src-mq3-server-main-runtime-ml-1946732765"></a>
### MAX_MSGLEN

```ml
const MAX_MSGLEN = 16384
```

Maximum byte length of a complete sequenced network message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L17)

<a id="constant-constant-mq3-server-main-runtime-max-reliable-commands-const-max-reliable-commands-64-src-mq3-server-main-runtime-ml-427417937"></a>
### MAX_RELIABLE_COMMANDS

```ml
const MAX_RELIABLE_COMMANDS = 64
```

Capacity of the reliable-command ring retained until acknowledgment.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L13)

<a id="constant-constant-mq3-server-main-runtime-max-string-chars-const-max-string-chars-1024-src-mq3-server-main-runtime-ml-1738426900"></a>
### MAX_STRING_CHARS

```ml
const MAX_STRING_CHARS = 1024
```

Max length of a string passed to Cmd_TokenizeString.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L15)

<a id="constant-constant-mq3-server-main-runtime-port-master-const-port-master-27950-src-mq3-server-main-runtime-ml-1826979404"></a>
### PORT_MASTER

```ml
const PORT_MASTER = 27950
```

Default UDP port used by the master-server directory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L37)

<a id="function-function-mq3-server-main-runtime-rconcallback-function-rconcallback-host-address-msg-text-args-src-mq3-server-main-runtime-ml-143252963"></a>
### rconCallback

```ml
function rconCallback(host, address, msg, text, args)
```

Return `mq3.server.main_runtime.SVC_RemoteCommand(host.context.state, host.context.services, address, text, args)` from `server.main_runtime.rconCallback`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |
| `address` | `dynamic` | — | Address passed as `address` to `mq3.server.main_runtime.SVC_RemoteCommand`. |
| `msg` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `text` | `dynamic` | — | Raw passed as `raw` to `mq3.server.main_runtime.SVC_RemoteCommand`. |
| `args` | `dynamic` | — | Args passed as `args` to `mq3.server.main_runtime.SVC_RemoteCommand`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L406)

<a id="function-function-mq3-server-main-runtime-remotetail-function-remotetail-text-src-mq3-server-main-runtime-ml-1593941457"></a>
### remoteTail

```ml
function remoteTail(text)
```

Compute remote tail in server.main_runtime; the normal completion returns `decode(slice(data, index, (len(data) - index)))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text used in `bytes(text)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L355)

<a id="function-function-mq3-server-main-runtime-requireclient-function-requireclient-value-src-mq3-server-main-runtime-ml-829473353"></a>
### requireClient

```ml
function requireClient(value)
```

Compute require client in server.main_runtime.

Validation failures include `sv_main: invalid reliable client`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `reliableCommands`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L199)

<a id="function-function-mq3-server-main-runtime-runtime-function-runtime-src-mq3-server-main-runtime-ml-487718306"></a>
### runtime

```ml
function runtime()
```

Create `mq3.server.main_runtime.Runtime` with time=0; nextHeartbeatTime=0; dedicated=0; masters=[]; 18 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L132)

- [mq3.server.main_runtime.Runtime](Type-mq3-server-main-runtime-runtime-1540197373.md) — struct
<a id="function-function-mq3-server-main-runtime-say-function-say-host-text-src-mq3-server-main-runtime-ml-1267963625"></a>
### say

```ml
function say(host, text)
```

Compute say in server.main_runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `printFn`. |
| `text` | `dynamic` | — | Text used in `host.printFn(host, text)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L171)

<a id="function-function-mq3-server-main-runtime-send-function-send-host-address-text-src-mq3-server-main-runtime-ml-288341117"></a>
### send

```ml
function send(host, address, text)
```

Send main runtime in server.main_runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `sendFn`. |
| `address` | `dynamic` | — | Address used in `host.sendFn(host, address, text)`. |
| `text` | `dynamic` | — | Text used in `host.sendFn(host, address, text)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L167)

<a id="function-function-mq3-server-main-runtime-services-function-services-src-mq3-server-main-runtime-ml-1382638490"></a>
### services

```ml
function services()
```

Create `mq3.server.main_runtime.Services` with sendFn=void; resolveFn=void; printFn=void; dropFn=void; executeFn=void; millisecondsFn=void; authorizeFn=void; decompressFn=void; diagnosticFn=void; context=void.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L161)

- [mq3.server.main_runtime.Services](Type-mq3-server-main-runtime-services-1416563799.md) — struct
<a id="function-function-mq3-server-main-runtime-statuscallback-function-statuscallback-host-address-args-src-mq3-server-main-runtime-ml-2129196695"></a>
### statusCallback

```ml
function statusCallback(host, address, args)
```

Compute status callback in server.main_runtime; the normal completion returns `SVC_Status(host.context.state, host.context.services, address, challenge)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `context`. |
| `address` | `dynamic` | — | Address passed as `address` to `mq3.server.main_runtime.SVC_Status`. |
| `args` | `dynamic` | — | Args used in `args[1]` and `len(args)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L394)

<a id="function-function-mq3-server-main-runtime-statusline-function-statusline-value-src-mq3-server-main-runtime-ml-1126191793"></a>
### statusLine

```ml
function statusLine(value)
```

Return `mq3.server.main_runtime.bounded((((((str(value.score) + " ") + str(value.ping)) + " \"") + value.name) + "\"\n"), 1024)` from `server.main_runtime.statusLine`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `score`, `ping`, `name`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L303)

<a id="function-function-mq3-server-main-runtime-sv-addservercommand-function-sv-addservercommand-host-value-cmd-src-mq3-server-main-runtime-ml-299056709"></a>
### SV_AddServerCommand

```ml
function SV_AddServerCommand(host, value, cmd)
```

Add server command in server.main_runtime; the normal completion returns `true`.

Direct state writes: `value.reliableSequence`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `dropFn`. |
| `value` | `dynamic` | — | Record exposing `reliableSequence`, `reliableAcknowledge`, `reliableCommands`. Updated in place: `reliableSequence`. |
| `cmd` | `dynamic` | — | Text passed as `text` to `mq3.server.main_runtime.bounded`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L231)

<a id="function-function-mq3-server-main-runtime-sv-expandnewlines-function-sv-expandnewlines-value-src-mq3-server-main-runtime-ml-645727883"></a>
### SV_ExpandNewlines

```ml
function SV_ExpandNewlines(value)
```

SV_ExpandNewlines uses a 1024-byte static buffer and stops with three bytes left, because a final input newline needs two output bytes plus NUL.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used in `bytes(value)` and `(value == void)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L176)

<a id="function-function-mq3-server-main-runtime-sv-flushredirect-function-sv-flushredirect-state-host-output-src-mq3-server-main-runtime-ml-1969455074"></a>
### SV_FlushRedirect

```ml
function SV_FlushRedirect(state, host, output)
```

Compute flush redirect in server.main_runtime; the normal completion returns `text`.

Validation failures include `sv_main: missing redirect address`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `redirectAddress`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.server.main_runtime.send`. |
| `output` | `dynamic` | — | Output used in `("print\\n" + output)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L348)

<a id="function-function-mq3-server-main-runtime-sv-masterheartbeat-function-sv-masterheartbeat-state-host-src-mq3-server-main-runtime-ml-473550951"></a>
### SV_MasterHeartbeat

```ml
function SV_MasterHeartbeat(state, host)
```

Update `state.nextHeartbeatTime` in server.main_runtime; the normal completion returns `count`.

Validation failures include `sv_main: missing heartbeat runtime`.
Direct state writes: `state.nextHeartbeatTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `dedicated`, `time`, `nextHeartbeatTime`, `masters`. Updated in place: `nextHeartbeatTime`. |
| `host` | `dynamic` | — | Record exposing `resolveFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L270)

<a id="function-function-mq3-server-main-runtime-sv-mastershutdown-function-sv-mastershutdown-state-host-src-mq3-server-main-runtime-ml-2012795163"></a>
### SV_MasterShutdown

```ml
function SV_MasterShutdown(state, host)
```

Update `state.nextHeartbeatTime` in server.main_runtime; the normal completion returns `(first + second)`.

Direct state writes: `state.nextHeartbeatTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Updated in place: `nextHeartbeatTime`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.server.main_runtime.SV_MasterHeartbeat`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L295)

<a id="function-function-mq3-server-main-runtime-sv-replacependingservercommands-function-sv-replacependingservercommands-value-cmd-src-mq3-server-main-runtime-ml-2099848613"></a>
### SV_ReplacePendingServerCommands

```ml
function SV_ReplacePendingServerCommands(value, cmd)
```

Test replace pending server commands in server.main_runtime; the normal completion returns `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `reliableSent`, `reliableSequence`, `reliableCommands`. |
| `cmd` | `dynamic` | — | Text passed as `text` to `mq3.server.main_runtime.configNumber`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L214)

<a id="function-function-mq3-server-main-runtime-sv-sendservercommand-function-sv-sendservercommand-state-host-target-cmd-src-mq3-server-main-runtime-ml-428837048"></a>
### SV_SendServerCommand

```ml
function SV_SendServerCommand(state, host, target, cmd)
```

Send server command in server.main_runtime; the normal completion returns `count`.

Validation failures include `sv_main: missing command runtime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `dedicated`, `clients`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.server.main_runtime.SV_AddServerCommand`. |
| `target` | `dynamic` | — | Value passed as `value` to `mq3.server.main_runtime.SV_AddServerCommand`. |
| `cmd` | `dynamic` | — | Text passed as `text` to `mq3.server.main_runtime.bounded`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L254)

<a id="function-function-mq3-server-main-runtime-svc-info-function-svc-info-state-host-address-challenge-src-mq3-server-main-runtime-ml-1416807114"></a>
### SVC_Info

```ml
function SVC_Info(state, host, address, challenge)
```

Compute svc info in server.main_runtime; the normal completion returns `response`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `gametype`, `uiSinglePlayerActive`, `maxClients`, `clients`, `privateClients`, `protocol`, `hostname` and further fields. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.server.main_runtime.send`. |
| `address` | `dynamic` | — | Address passed as `address` to `mq3.server.main_runtime.send`. |
| `challenge` | `dynamic` | — | New value passed as `newValue` to `mq3.shared.info.setValue`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L328)

<a id="function-function-mq3-server-main-runtime-svc-remotecommand-function-svc-remotecommand-state-host-address-raw-args-src-mq3-server-main-runtime-ml-113775764"></a>
### SVC_RemoteCommand

```ml
function SVC_RemoteCommand(state, host, address, raw, args)
```

Update `state.lastRconTime`, `state.redirectAddress` in server.main_runtime; the normal completion returns `output`.

Direct state writes: `state.lastRconTime`, `state.redirectAddress`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `time`, `lastRconTime`, `rconPassword`. Updated in place: `lastRconTime`, `redirectAddress`. |
| `host` | `dynamic` | — | Record exposing `millisecondsFn`, `executeFn`. |
| `address` | `dynamic` | — | Address operand used by `SVC_RemoteCommand`; its reads are shown in the implementation. |
| `raw` | `dynamic` | — | Text passed as `text` to `mq3.server.main_runtime.remoteTail`. |
| `args` | `dynamic` | — | Args used in `args[1]` and `len(args)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L372)

<a id="function-function-mq3-server-main-runtime-svc-status-function-svc-status-state-host-address-challenge-src-mq3-server-main-runtime-ml-842789034"></a>
### SVC_Status

```ml
function SVC_Status(state, host, address, challenge)
```

Compute svc status in server.main_runtime; the normal completion returns `response`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `gametype`, `serverInfo`, `restricted`, `clients`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.server.main_runtime.send`. |
| `address` | `dynamic` | — | Address passed as `address` to `mq3.server.main_runtime.send`. |
| `challenge` | `dynamic` | — | New value passed as `newValue` to `mq3.shared.info.setValue`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/server/main_runtime.ml#L312)
