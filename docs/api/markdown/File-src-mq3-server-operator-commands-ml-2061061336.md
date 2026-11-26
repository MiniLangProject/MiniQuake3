# `src/mq3/server/operator_commands.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.operator_commands`](Package-mq3-server-operator-commands-1948962592.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/textnumbers.ml` as `numbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

- [mq3.server.operator_commands.Action](Type-mq3-server-operator-commands-action-901380872.md) — struct
<a id="constant-constant-mq3-server-operator-commands-authorize-server-name-const-authorize-server-name-authorize-quake3arena-com-src-mq3-server-operator-commands-ml-1983249340"></a>
### AUTHORIZE_SERVER_NAME

```ml
const AUTHORIZE_SERVER_NAME = "authorize.quake3arena.com"
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L25)

<a id="function-function-mq3-server-operator-commands-banclient-function-banclient-state-value-src-mq3-server-operator-commands-ml-106888248"></a>
### banClient

```ml
function banClient(state, value)
```

Update `state.authorizeType`, `state.authorizeIp` in server.operator_commands; the normal completion returns `false`.

Direct state writes: `state.authorizeType`, `state.authorizeIp`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `authorizeIp`, `authorizeType`. Updated in place: `authorizeType`, `authorizeIp`. |
| `value` | `dynamic` | — | Record exposing `ip`, `name`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L183)

<a id="function-function-mq3-server-operator-commands-cleanname-function-cleanname-name-src-mq3-server-operator-commands-ml-1689234371"></a>
### cleanName

```ml
function cleanName(name)
```

Compute clean name in server.operator_commands; the normal completion returns `decode(slice(output, 0, count))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used in `bytes(name)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L111)

<a id="function-function-mq3-server-operator-commands-client-function-client-state-name-addresstype-address-ip-qport-rate-ping-lastpackettime-score-src-mq3-server-operator-commands-ml-2049127178"></a>
### client

```ml
function client(state, name, addressType, address, ip, qport, rate, ping, lastPacketTime, score)
```

Create `mq3.server.operator_commands.Client` with state=state; name=name; userinfo=""; addressType=addressType; address=address; ip=ip; qport=qport; rate=rate; ping=ping; lastPacketTime=lastPacketTime; score=score; lastUsercmd=void; denied="".

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Initial `state` field stored in the returned or constructed `mq3.server.operator_commands.Client` record. |
| `name` | `dynamic` | — | Initial `name` field stored in the returned or constructed `mq3.server.operator_commands.Client` record. |
| `addressType` | `dynamic` | — | Initial `addressType` field stored in the returned or constructed `mq3.server.operator_commands.Client` record. |
| `address` | `dynamic` | — | Initial `address` field stored in the returned or constructed `mq3.server.operator_commands.Client` record. |
| `ip` | `dynamic` | — | Initial `ip` field stored in the returned or constructed `mq3.server.operator_commands.Client` record. |
| `qport` | `dynamic` | — | Initial `qport` field stored in the returned or constructed `mq3.server.operator_commands.Client` record. |
| `rate` | `dynamic` | — | Initial `rate` field stored in the returned or constructed `mq3.server.operator_commands.Client` record. |
| `ping` | `dynamic` | — | Initial `ping` field stored in the returned or constructed `mq3.server.operator_commands.Client` record. |
| `lastPacketTime` | `dynamic` | — | Initial `lastPacketTime` field stored in the returned or constructed `mq3.server.operator_commands.Client` record. |
| `score` | `dynamic` | — | Initial `score` field stored in the returned or constructed `mq3.server.operator_commands.Client` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L46)

- [mq3.server.operator_commands.Client](Type-mq3-server-operator-commands-client-1675369449.md) — struct
<a id="function-function-mq3-server-operator-commands-cmd-argv-function-cmd-argv-state-index-src-mq3-server-operator-commands-ml-1110235531"></a>
### Cmd_Argv

```ml
function Cmd_Argv(state, index)
```

Compute cmd argv in server.operator_commands; the normal completion returns `state.args[index]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `args`. |
| `index` | `dynamic` | — | Zero-based index into `state.args`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L85)

<a id="function-function-mq3-server-operator-commands-cmdargs-function-cmdargs-state-src-mq3-server-operator-commands-ml-1424585503"></a>
### cmdArgs

```ml
function cmdArgs(state)
```

Compute cmd args in server.operator_commands; the normal completion returns `text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `rawArgs`, `args`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L88)

<a id="function-function-mq3-server-operator-commands-create-function-create-src-mq3-server-operator-commands-ml-1167802602"></a>
### create

```ml
function create()
```

Create `mq3.server.operator_commands.State` with running=false; dedicated=false; args=[]; rawArgs=""; 25 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L48)

<a id="constant-constant-mq3-server-operator-commands-cs-active-const-cs-active-4-src-mq3-server-operator-commands-ml-2007215429"></a>
### CS_ACTIVE

```ml
const CS_ACTIVE = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L13)

<a id="constant-constant-mq3-server-operator-commands-cs-connected-const-cs-connected-2-src-mq3-server-operator-commands-ml-1110721141"></a>
### CS_CONNECTED

```ml
const CS_CONNECTED = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L11)

<a id="constant-constant-mq3-server-operator-commands-cs-free-const-cs-free-0-src-mq3-server-operator-commands-ml-625889537"></a>
### CS_FREE

```ml
const CS_FREE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L9)

<a id="constant-constant-mq3-server-operator-commands-cs-primed-const-cs-primed-3-src-mq3-server-operator-commands-ml-727265884"></a>
### CS_PRIMED

```ml
const CS_PRIMED = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L12)

<a id="constant-constant-mq3-server-operator-commands-cs-warmup-const-cs-warmup-5-src-mq3-server-operator-commands-ml-1197086010"></a>
### CS_WARMUP

```ml
const CS_WARMUP = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L24)

<a id="constant-constant-mq3-server-operator-commands-cs-zombie-const-cs-zombie-1-src-mq3-server-operator-commands-ml-1179118298"></a>
### CS_ZOMBIE

```ml
const CS_ZOMBIE = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L10)

<a id="function-function-mq3-server-operator-commands-cvar-function-cvar-state-name-fallback-src-mq3-server-operator-commands-ml-1222287434"></a>
### cvar

```ml
function cvar(state, name, fallback)
```

Compute cvar in server.operator_commands; the normal completion returns `state.cvars[index][1]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `cvars`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.server.operator_commands.cvarIndex`. |
| `fallback` | `dynamic` | — | Value returned unchanged by this function. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L97)

<a id="function-function-mq3-server-operator-commands-cvarindex-function-cvarindex-state-name-src-mq3-server-operator-commands-ml-1619065652"></a>
### cvarIndex

```ml
function cvarIndex(state, name)
```

Compute cvar index in server.operator_commands; the normal completion returns `- 1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `cvars`. |
| `name` | `dynamic` | — | Name used in `(state.cvars[index][0] == name)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L92)

<a id="function-function-mq3-server-operator-commands-drop-function-drop-state-value-reason-src-mq3-server-operator-commands-ml-69688824"></a>
### drop

```ml
function drop(state, value, reason)
```

Update `value.state`, `value.lastPacketTime` in server.operator_commands.

Direct state writes: `value.state`, `value.lastPacketTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `time`. |
| `value` | `dynamic` | — | Record exposing `name`. Updated in place: `state`, `lastPacketTime`. |
| `reason` | `dynamic` | — | Text passed as `text` to `mq3.server.operator_commands.emit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L136)

<a id="function-function-mq3-server-operator-commands-emit-function-emit-state-boundary-kind-target-text-values-src-mq3-server-operator-commands-ml-1620648369"></a>
### emit

```ml
function emit(state, boundary, kind, target, text, values)
```

Emit operator commands in server.operator_commands; the normal completion returns `action`.

Direct state writes: `state.actions`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `hostFn`, `actions`, `hostContext`. Updated in place: `actions`. |
| `boundary` | `dynamic` | — | Initial `boundary` field stored in the returned or constructed `mq3.server.operator_commands.Action` record. |
| `kind` | `dynamic` | — | Initial `kind` field stored in the returned or constructed `mq3.server.operator_commands.Action` record. |
| `target` | `dynamic` | — | Initial `target` field stored in the returned or constructed `mq3.server.operator_commands.Action` record. |
| `text` | `dynamic` | — | Initial `text` field stored in the returned or constructed `mq3.server.operator_commands.Action` record. |
| `values` | `dynamic` | — | Initial `values` field stored in the returned or constructed `mq3.server.operator_commands.Action` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L67)

<a id="constant-constant-mq3-server-operator-commands-gt-ffa-const-gt-ffa-0-src-mq3-server-operator-commands-ml-880347205"></a>
### GT_FFA

```ml
const GT_FFA = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L22)

<a id="constant-constant-mq3-server-operator-commands-gt-single-player-const-gt-single-player-2-src-mq3-server-operator-commands-ml-479259073"></a>
### GT_SINGLE_PLAYER

```ml
const GT_SINGLE_PLAYER = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L23)

<a id="function-function-mq3-server-operator-commands-hostprotected-function-hostprotected-state-value-src-mq3-server-operator-commands-ml-1758458140"></a>
### hostProtected

```ml
function hostProtected(state, value)
```

Test host protected in server.operator_commands; the normal completion returns `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.server.operator_commands.emit`. |
| `value` | `dynamic` | — | Record exposing `addressType`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L140)

<a id="function-function-mq3-server-operator-commands-infoprint-function-infoprint-state-title-value-src-mq3-server-operator-commands-ml-1617164702"></a>
### infoPrint

```ml
function infoPrint(state, title, value)
```

Compute info print in server.operator_commands; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.server.operator_commands.say`. |
| `title` | `dynamic` | — | Title used in `(title + "\\n")` and `say(state, (title + "\\n"))`. |
| `value` | `dynamic` | — | Text passed as `text` to `mq3.server.operator_commands.emit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L224)

<a id="function-function-mq3-server-operator-commands-leftpad-function-leftpad-text-width-src-mq3-server-operator-commands-ml-613189505"></a>
### leftPad

```ml
function leftPad(text, width)
```

Compute left pad in server.operator_commands; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text operand used by `leftPad`; its reads are shown in the implementation. |
| `width` | `dynamic` | — | Width used in `(len(bytes(result)) < width)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L201)

<a id="function-function-mq3-server-operator-commands-mapexists-function-mapexists-state-path-src-mq3-server-operator-commands-ml-1874198804"></a>
### mapExists

```ml
function mapExists(state, path)
```

Test map exists in server.operator_commands; the normal completion returns `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `mapFiles`. |
| `path` | `dynamic` | — | B passed as `b` to `mq3.server.operator_commands.same`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L108)

<a id="constant-constant-mq3-server-operator-commands-na-bad-const-na-bad-1-src-mq3-server-operator-commands-ml-501162714"></a>
### NA_BAD

```ml
const NA_BAD = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L15)

<a id="constant-constant-mq3-server-operator-commands-na-bot-const-na-bot-0-src-mq3-server-operator-commands-ml-507170197"></a>
### NA_BOT

```ml
const NA_BOT = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L14)

<a id="constant-constant-mq3-server-operator-commands-na-ip-const-na-ip-4-src-mq3-server-operator-commands-ml-825124093"></a>
### NA_IP

```ml
const NA_IP = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L17)

<a id="constant-constant-mq3-server-operator-commands-na-loopback-const-na-loopback-2-src-mq3-server-operator-commands-ml-762711179"></a>
### NA_LOOPBACK

```ml
const NA_LOOPBACK = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L16)

<a id="function-function-mq3-server-operator-commands-playerbyname-function-playerbyname-state-name-src-mq3-server-operator-commands-ml-845118648"></a>
### playerByName

```ml
function playerByName(state, name)
```

Compute player by name in server.operator_commands.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `running`, `clients`. |
| `name` | `dynamic` | — | B passed as `b` to `mq3.server.operator_commands.same`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L117)

<a id="function-function-mq3-server-operator-commands-playerbynum-function-playerbynum-state-text-src-mq3-server-operator-commands-ml-263661184"></a>
### playerByNum

```ml
function playerByNum(state, text)
```

Compute player by num in server.operator_commands; the normal completion returns `value`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `running`, `maxclients`, `clients`. |
| `text` | `dynamic` | — | Null-terminated narrow numeric text accepted by the C runtime. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L125)

<a id="constant-constant-mq3-server-operator-commands-port-authorize-const-port-authorize-27952-src-mq3-server-operator-commands-ml-98888268"></a>
### PORT_AUTHORIZE

```ml
const PORT_AUTHORIZE = 27952
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L26)

<a id="function-function-mq3-server-operator-commands-rightpad-function-rightpad-text-width-src-mq3-server-operator-commands-ml-265144885"></a>
### rightPad

```ml
function rightPad(text, width)
```

Compute right pad in server.operator_commands; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text operand used by `rightPad`; its reads are shown in the implementation. |
| `width` | `dynamic` | — | Width used in `(len(bytes(result)) < width)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L205)

<a id="function-function-mq3-server-operator-commands-same-function-same-a-b-src-mq3-server-operator-commands-ml-2049543095"></a>
### same

```ml
function same(a, b)
```

Compute server.operator_commands.same as `(strings.toLowerAscii(a) == strings.toLowerAscii(b))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A used in `strings.toLowerAscii(a)` and `(strings.toLowerAscii(a) == strings.toLowerAscii(b))`. |
| `b` | `dynamic` | — | B used in `strings.toLowerAscii(b)` and `(strings.toLowerAscii(a) == strings.toLowerAscii(b))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L77)

<a id="function-function-mq3-server-operator-commands-say-function-say-state-text-src-mq3-server-operator-commands-ml-1116188278"></a>
### say

```ml
function say(state, text)
```

Update `state.prints` in server.operator_commands; the normal completion returns `text`.

Direct state writes: `state.prints`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `prints`. Updated in place: `prints`. |
| `text` | `dynamic` | — | Text passed as `text` to `mq3.server.operator_commands.emit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L73)

<a id="function-function-mq3-server-operator-commands-setcvar-function-setcvar-state-name-value-src-mq3-server-operator-commands-ml-2035191383"></a>
### setCvar

```ml
function setCvar(state, name, value)
```

Set cvar in server.operator_commands; the normal completion returns `value`.

Direct state writes: `state.cvars`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `cvars`. Updated in place: `cvars`. |
| `name` | `dynamic` | — | Name passed as `name` to `mq3.server.operator_commands.cvarIndex`. |
| `value` | `dynamic` | — | Text passed as `text` to `mq3.server.operator_commands.emit`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L104)

<a id="function-function-mq3-server-operator-commands-sethost-function-sethost-state-context-callback-src-mq3-server-operator-commands-ml-2141898343"></a>
### setHost

```ml
function setHost(state, context, callback)
```

Set host in server.operator_commands; the normal completion returns `state`.

Direct state writes: `state.hostContext`, `state.hostFn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Updated in place: `hostContext`, `hostFn`. |
| `context` | `dynamic` | — | Context operand used by `setHost`; its reads are shown in the implementation. |
| `callback` | `dynamic` | — | Callback invoked for callback; the call sites below define the callback arguments. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L57)

<a id="constant-constant-mq3-server-operator-commands-snapflag-servercount-const-snapflag-servercount-4-src-mq3-server-operator-commands-ml-1871457433"></a>
### SNAPFLAG_SERVERCOUNT

```ml
const SNAPFLAG_SERVERCOUNT = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L21)

<a id="constant-constant-mq3-server-operator-commands-ss-dead-const-ss-dead-0-src-mq3-server-operator-commands-ml-250779921"></a>
### SS_DEAD

```ml
const SS_DEAD = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L18)

<a id="constant-constant-mq3-server-operator-commands-ss-game-const-ss-game-2-src-mq3-server-operator-commands-ml-917184919"></a>
### SS_GAME

```ml
const SS_GAME = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L20)

<a id="constant-constant-mq3-server-operator-commands-ss-loading-const-ss-loading-1-src-mq3-server-operator-commands-ml-1780709378"></a>
### SS_LOADING

```ml
const SS_LOADING = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L19)

<a id="function-function-mq3-server-operator-commands-starts-function-starts-a-b-src-mq3-server-operator-commands-ml-1073006123"></a>
### starts

```ml
function starts(a, b)
```

Compute starts in server.operator_commands; the normal completion returns `(slice(bytes(left), 0, len(bytes(right))) == bytes(right))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | A used in `strings.toLowerAscii(a)`. |
| `b` | `dynamic` | — | B used in `strings.toLowerAscii(b)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L81)

- [mq3.server.operator_commands.State](Type-mq3-server-operator-commands-state-2040661727.md) — struct
<a id="function-function-mq3-server-operator-commands-sv-addoperatorcommands-function-sv-addoperatorcommands-state-src-mq3-server-operator-commands-ml-2080448873"></a>
### SV_AddOperatorCommands

```ml
function SV_AddOperatorCommands(state)
```

Add operator commands in server.operator_commands; the normal completion returns `len(state.commandNames)`.

Direct state writes: `state.commandsInitialized`, `state.commandNames`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `commandsInitialized`, `dedicated`, `commandNames`. Updated in place: `commandsInitialized`, `commandNames`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L244)

<a id="function-function-mq3-server-operator-commands-sv-ban-f-function-sv-ban-f-state-src-mq3-server-operator-commands-ml-1188583545"></a>
### SV_Ban_f

```ml
function SV_Ban_f(state)
```

Compute ban f in server.operator_commands; the normal completion returns `banClient(state, value)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `running`, `args`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L190)

<a id="function-function-mq3-server-operator-commands-sv-bannum-f-function-sv-bannum-f-state-src-mq3-server-operator-commands-ml-126743289"></a>
### SV_BanNum_f

```ml
function SV_BanNum_f(state)
```

Compute ban num f in server.operator_commands; the normal completion returns `banClient(state, value)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `running`, `args`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L193)

<a id="function-function-mq3-server-operator-commands-sv-consay-f-function-sv-consay-f-state-src-mq3-server-operator-commands-ml-629540549"></a>
### SV_ConSay_f

```ml
function SV_ConSay_f(state)
```

Test con say f in server.operator_commands; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `running`, `args`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L214)

<a id="function-function-mq3-server-operator-commands-sv-dumpuser-f-function-sv-dumpuser-f-state-src-mq3-server-operator-commands-ml-958702457"></a>
### SV_DumpUser_f

```ml
function SV_DumpUser_f(state)
```

Test dump user f in server.operator_commands; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `running`, `args`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L233)

<a id="function-function-mq3-server-operator-commands-sv-heartbeat-f-function-sv-heartbeat-f-state-src-mq3-server-operator-commands-ml-576334217"></a>
### SV_Heartbeat_f

```ml
function SV_Heartbeat_f(state)
```

Update `state.nextHeartbeat` in server.operator_commands; the normal completion returns `state.nextHeartbeat`.

Direct state writes: `state.nextHeartbeat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `nextHeartbeat`. Updated in place: `nextHeartbeat`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L219)

<a id="function-function-mq3-server-operator-commands-sv-kick-f-function-sv-kick-f-state-src-mq3-server-operator-commands-ml-610688843"></a>
### SV_Kick_f

```ml
function SV_Kick_f(state)
```

Test kick f in server.operator_commands; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `running`, `args`, `clients`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L171)

<a id="function-function-mq3-server-operator-commands-sv-kicknum-f-function-sv-kicknum-f-state-src-mq3-server-operator-commands-ml-1414369857"></a>
### SV_KickNum_f

```ml
function SV_KickNum_f(state)
```

Test kick num f in server.operator_commands; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `running`, `args`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L196)

<a id="function-function-mq3-server-operator-commands-sv-killserver-f-function-sv-killserver-f-state-src-mq3-server-operator-commands-ml-2146667081"></a>
### SV_KillServer_f

```ml
function SV_KillServer_f(state)
```

Update `state.running` in server.operator_commands.

Direct state writes: `state.running`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Updated in place: `running`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L238)

<a id="function-function-mq3-server-operator-commands-sv-map-f-function-sv-map-f-state-src-mq3-server-operator-commands-ml-1182137077"></a>
### SV_Map_f

```ml
function SV_Map_f(state)
```

Update `state.cvars`, `state.gametype`, `state.mapname` in server.operator_commands; the normal completion returns `true`.

Direct state writes: `state.cvars`, `state.gametype`, `state.mapname`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `cvars`, `gametype`. Updated in place: `cvars`, `gametype`, `mapname`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L146)

<a id="function-function-mq3-server-operator-commands-sv-maprestart-f-function-sv-maprestart-f-state-src-mq3-server-operator-commands-ml-493332601"></a>
### SV_MapRestart_f

```ml
function SV_MapRestart_f(state)
```

Update `state.restartTime`, `state.configstrings`, `state.mapname`, `state.snapFlag` in server.operator_commands; the normal completion returns `true`.

Direct state writes: `state.restartTime`, `state.configstrings`, `state.mapname`, `state.snapFlag`, `state.serverId`, `state.serverState`, `state.restarting`, `state.time`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `frameTime`, `serverId`, `running`, `restartTime`, `args`, `time`, `configstrings` and further fields. Updated in place: `restartTime`, `configstrings`, `mapname`, `snapFlag`, `serverId`, `serverState` and further fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L158)

<a id="function-function-mq3-server-operator-commands-sv-removeoperatorcommands-function-sv-removeoperatorcommands-state-src-mq3-server-operator-commands-ml-1948320697"></a>
### SV_RemoveOperatorCommands

```ml
function SV_RemoveOperatorCommands(state)
```

Compute server.operator_commands.SV_RemoveOperatorCommands as `0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Reserved argument; this implementation does not read its value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L249)

<a id="function-function-mq3-server-operator-commands-sv-serverinfo-f-function-sv-serverinfo-f-state-src-mq3-server-operator-commands-ml-322697865"></a>
### SV_Serverinfo_f

```ml
function SV_Serverinfo_f(state)
```

Return `mq3.server.operator_commands.infoPrint(state, "Server info settings:", cvar(state, "serverinfo", ""))` from `server.operator_commands.SV_Serverinfo_f`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.server.operator_commands.infoPrint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L227)

<a id="function-function-mq3-server-operator-commands-sv-status-f-function-sv-status-f-state-src-mq3-server-operator-commands-ml-1359708471"></a>
### SV_Status_f

```ml
function SV_Status_f(state)
```

Compute status f in server.operator_commands; the normal completion returns `text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `running`, `mapname`, `clients`, `time`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L208)

<a id="function-function-mq3-server-operator-commands-sv-systeminfo-f-function-sv-systeminfo-f-state-src-mq3-server-operator-commands-ml-456536153"></a>
### SV_Systeminfo_f

```ml
function SV_Systeminfo_f(state)
```

Return `mq3.server.operator_commands.infoPrint(state, "System info settings:", cvar(state, "systeminfo", ""))` from `server.operator_commands.SV_Systeminfo_f`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.server.operator_commands.infoPrint`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/operator_commands.ml#L230)
