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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L25)

<a id="function-function-mq3-server-operator-commands-banclient-function-banclient-state-value-src-mq3-server-operator-commands-ml-106888248"></a>
### banClient

```ml
function banClient(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L89)

<a id="function-function-mq3-server-operator-commands-cleanname-function-cleanname-name-src-mq3-server-operator-commands-ml-1689234371"></a>
### cleanName

```ml
function cleanName(name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L47)

<a id="function-function-mq3-server-operator-commands-client-function-client-state-name-addresstype-address-ip-qport-rate-ping-lastpackettime-score-src-mq3-server-operator-commands-ml-2049127178"></a>
### client

```ml
function client(state, name, addressType, address, ip, qport, rate, ping, lastPacketTime, score)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `addressType` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |
| `ip` | `dynamic` | — |  |
| `qport` | `dynamic` | — |  |
| `rate` | `dynamic` | — |  |
| `ping` | `dynamic` | — |  |
| `lastPacketTime` | `dynamic` | — |  |
| `score` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L32)

- [mq3.server.operator_commands.Client](Type-mq3-server-operator-commands-client-1675369449.md) — struct
<a id="function-function-mq3-server-operator-commands-cmd-argv-function-cmd-argv-state-index-src-mq3-server-operator-commands-ml-1110235531"></a>
### Cmd_Argv

```ml
function Cmd_Argv(state, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L41)

<a id="function-function-mq3-server-operator-commands-cmdargs-function-cmdargs-state-src-mq3-server-operator-commands-ml-1424585503"></a>
### cmdArgs

```ml
function cmdArgs(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L42)

<a id="function-function-mq3-server-operator-commands-create-function-create-src-mq3-server-operator-commands-ml-1167802602"></a>
### create

```ml
function create()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L33)

<a id="constant-constant-mq3-server-operator-commands-cs-active-const-cs-active-4-src-mq3-server-operator-commands-ml-2007215429"></a>
### CS_ACTIVE

```ml
const CS_ACTIVE = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L13)

<a id="constant-constant-mq3-server-operator-commands-cs-connected-const-cs-connected-2-src-mq3-server-operator-commands-ml-1110721141"></a>
### CS_CONNECTED

```ml
const CS_CONNECTED = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L11)

<a id="constant-constant-mq3-server-operator-commands-cs-free-const-cs-free-0-src-mq3-server-operator-commands-ml-625889537"></a>
### CS_FREE

```ml
const CS_FREE = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L9)

<a id="constant-constant-mq3-server-operator-commands-cs-primed-const-cs-primed-3-src-mq3-server-operator-commands-ml-727265884"></a>
### CS_PRIMED

```ml
const CS_PRIMED = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L12)

<a id="constant-constant-mq3-server-operator-commands-cs-warmup-const-cs-warmup-5-src-mq3-server-operator-commands-ml-1197086010"></a>
### CS_WARMUP

```ml
const CS_WARMUP = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L24)

<a id="constant-constant-mq3-server-operator-commands-cs-zombie-const-cs-zombie-1-src-mq3-server-operator-commands-ml-1179118298"></a>
### CS_ZOMBIE

```ml
const CS_ZOMBIE = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L10)

<a id="function-function-mq3-server-operator-commands-cvar-function-cvar-state-name-fallback-src-mq3-server-operator-commands-ml-1222287434"></a>
### cvar

```ml
function cvar(state, name, fallback)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `fallback` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L44)

<a id="function-function-mq3-server-operator-commands-cvarindex-function-cvarindex-state-name-src-mq3-server-operator-commands-ml-1619065652"></a>
### cvarIndex

```ml
function cvarIndex(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L43)

<a id="function-function-mq3-server-operator-commands-drop-function-drop-state-value-reason-src-mq3-server-operator-commands-ml-69688824"></a>
### drop

```ml
function drop(state, value, reason)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L60)

<a id="function-function-mq3-server-operator-commands-emit-function-emit-state-boundary-kind-target-text-values-src-mq3-server-operator-commands-ml-1620648369"></a>
### emit

```ml
function emit(state, boundary, kind, target, text, values)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `boundary` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `values` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L37)

<a id="constant-constant-mq3-server-operator-commands-gt-ffa-const-gt-ffa-0-src-mq3-server-operator-commands-ml-880347205"></a>
### GT_FFA

```ml
const GT_FFA = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L22)

<a id="constant-constant-mq3-server-operator-commands-gt-single-player-const-gt-single-player-2-src-mq3-server-operator-commands-ml-479259073"></a>
### GT_SINGLE_PLAYER

```ml
const GT_SINGLE_PLAYER = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L23)

<a id="function-function-mq3-server-operator-commands-hostprotected-function-hostprotected-state-value-src-mq3-server-operator-commands-ml-1758458140"></a>
### hostProtected

```ml
function hostProtected(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L61)

<a id="function-function-mq3-server-operator-commands-infoprint-function-infoprint-state-title-value-src-mq3-server-operator-commands-ml-1617164702"></a>
### infoPrint

```ml
function infoPrint(state, title, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `title` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L106)

<a id="function-function-mq3-server-operator-commands-leftpad-function-leftpad-text-width-src-mq3-server-operator-commands-ml-613189505"></a>
### leftPad

```ml
function leftPad(text, width)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L98)

<a id="function-function-mq3-server-operator-commands-mapexists-function-mapexists-state-path-src-mq3-server-operator-commands-ml-1874198804"></a>
### mapExists

```ml
function mapExists(state, path)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `path` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L46)

<a id="constant-constant-mq3-server-operator-commands-na-bad-const-na-bad-1-src-mq3-server-operator-commands-ml-501162714"></a>
### NA_BAD

```ml
const NA_BAD = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L15)

<a id="constant-constant-mq3-server-operator-commands-na-bot-const-na-bot-0-src-mq3-server-operator-commands-ml-507170197"></a>
### NA_BOT

```ml
const NA_BOT = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L14)

<a id="constant-constant-mq3-server-operator-commands-na-ip-const-na-ip-4-src-mq3-server-operator-commands-ml-825124093"></a>
### NA_IP

```ml
const NA_IP = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L17)

<a id="constant-constant-mq3-server-operator-commands-na-loopback-const-na-loopback-2-src-mq3-server-operator-commands-ml-762711179"></a>
### NA_LOOPBACK

```ml
const NA_LOOPBACK = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L16)

<a id="function-function-mq3-server-operator-commands-playerbyname-function-playerbyname-state-name-src-mq3-server-operator-commands-ml-845118648"></a>
### playerByName

```ml
function playerByName(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L50)

<a id="function-function-mq3-server-operator-commands-playerbynum-function-playerbynum-state-text-src-mq3-server-operator-commands-ml-263661184"></a>
### playerByNum

```ml
function playerByNum(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L55)

<a id="constant-constant-mq3-server-operator-commands-port-authorize-const-port-authorize-27952-src-mq3-server-operator-commands-ml-98888268"></a>
### PORT_AUTHORIZE

```ml
const PORT_AUTHORIZE = 27952
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L26)

<a id="function-function-mq3-server-operator-commands-rightpad-function-rightpad-text-width-src-mq3-server-operator-commands-ml-265144885"></a>
### rightPad

```ml
function rightPad(text, width)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L99)

<a id="function-function-mq3-server-operator-commands-same-function-same-a-b-src-mq3-server-operator-commands-ml-2049543095"></a>
### same

```ml
function same(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L39)

<a id="function-function-mq3-server-operator-commands-say-function-say-state-text-src-mq3-server-operator-commands-ml-1116188278"></a>
### say

```ml
function say(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L38)

<a id="function-function-mq3-server-operator-commands-setcvar-function-setcvar-state-name-value-src-mq3-server-operator-commands-ml-2035191383"></a>
### setCvar

```ml
function setCvar(state, name, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L45)

<a id="function-function-mq3-server-operator-commands-sethost-function-sethost-state-context-callback-src-mq3-server-operator-commands-ml-2141898343"></a>
### setHost

```ml
function setHost(state, context, callback)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `context` | `dynamic` | — |  |
| `callback` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L36)

<a id="constant-constant-mq3-server-operator-commands-snapflag-servercount-const-snapflag-servercount-4-src-mq3-server-operator-commands-ml-1871457433"></a>
### SNAPFLAG_SERVERCOUNT

```ml
const SNAPFLAG_SERVERCOUNT = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L21)

<a id="constant-constant-mq3-server-operator-commands-ss-dead-const-ss-dead-0-src-mq3-server-operator-commands-ml-250779921"></a>
### SS_DEAD

```ml
const SS_DEAD = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L18)

<a id="constant-constant-mq3-server-operator-commands-ss-game-const-ss-game-2-src-mq3-server-operator-commands-ml-917184919"></a>
### SS_GAME

```ml
const SS_GAME = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L20)

<a id="constant-constant-mq3-server-operator-commands-ss-loading-const-ss-loading-1-src-mq3-server-operator-commands-ml-1780709378"></a>
### SS_LOADING

```ml
const SS_LOADING = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L19)

<a id="function-function-mq3-server-operator-commands-starts-function-starts-a-b-src-mq3-server-operator-commands-ml-1073006123"></a>
### starts

```ml
function starts(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L40)

- [mq3.server.operator_commands.State](Type-mq3-server-operator-commands-state-2040661727.md) — struct
<a id="function-function-mq3-server-operator-commands-sv-addoperatorcommands-function-sv-addoperatorcommands-state-src-mq3-server-operator-commands-ml-2080448873"></a>
### SV_AddOperatorCommands

```ml
function SV_AddOperatorCommands(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L112)

<a id="function-function-mq3-server-operator-commands-sv-ban-f-function-sv-ban-f-state-src-mq3-server-operator-commands-ml-1188583545"></a>
### SV_Ban_f

```ml
function SV_Ban_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L94)

<a id="function-function-mq3-server-operator-commands-sv-bannum-f-function-sv-bannum-f-state-src-mq3-server-operator-commands-ml-126743289"></a>
### SV_BanNum_f

```ml
function SV_BanNum_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L95)

<a id="function-function-mq3-server-operator-commands-sv-consay-f-function-sv-consay-f-state-src-mq3-server-operator-commands-ml-629540549"></a>
### SV_ConSay_f

```ml
function SV_ConSay_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L104)

<a id="function-function-mq3-server-operator-commands-sv-dumpuser-f-function-sv-dumpuser-f-state-src-mq3-server-operator-commands-ml-958702457"></a>
### SV_DumpUser_f

```ml
function SV_DumpUser_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L109)

<a id="function-function-mq3-server-operator-commands-sv-heartbeat-f-function-sv-heartbeat-f-state-src-mq3-server-operator-commands-ml-576334217"></a>
### SV_Heartbeat_f

```ml
function SV_Heartbeat_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L105)

<a id="function-function-mq3-server-operator-commands-sv-kick-f-function-sv-kick-f-state-src-mq3-server-operator-commands-ml-610688843"></a>
### SV_Kick_f

```ml
function SV_Kick_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L82)

<a id="function-function-mq3-server-operator-commands-sv-kicknum-f-function-sv-kicknum-f-state-src-mq3-server-operator-commands-ml-1414369857"></a>
### SV_KickNum_f

```ml
function SV_KickNum_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L96)

<a id="function-function-mq3-server-operator-commands-sv-killserver-f-function-sv-killserver-f-state-src-mq3-server-operator-commands-ml-2146667081"></a>
### SV_KillServer_f

```ml
function SV_KillServer_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L110)

<a id="function-function-mq3-server-operator-commands-sv-map-f-function-sv-map-f-state-src-mq3-server-operator-commands-ml-1182137077"></a>
### SV_Map_f

```ml
function SV_Map_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L63)

<a id="function-function-mq3-server-operator-commands-sv-maprestart-f-function-sv-maprestart-f-state-src-mq3-server-operator-commands-ml-493332601"></a>
### SV_MapRestart_f

```ml
function SV_MapRestart_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L71)

<a id="function-function-mq3-server-operator-commands-sv-removeoperatorcommands-function-sv-removeoperatorcommands-state-src-mq3-server-operator-commands-ml-1948320697"></a>
### SV_RemoveOperatorCommands

```ml
function SV_RemoveOperatorCommands(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L115)

<a id="function-function-mq3-server-operator-commands-sv-serverinfo-f-function-sv-serverinfo-f-state-src-mq3-server-operator-commands-ml-322697865"></a>
### SV_Serverinfo_f

```ml
function SV_Serverinfo_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L107)

<a id="function-function-mq3-server-operator-commands-sv-status-f-function-sv-status-f-state-src-mq3-server-operator-commands-ml-1359708471"></a>
### SV_Status_f

```ml
function SV_Status_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L100)

<a id="function-function-mq3-server-operator-commands-sv-systeminfo-f-function-sv-systeminfo-f-state-src-mq3-server-operator-commands-ml-456536153"></a>
### SV_Systeminfo_f

```ml
function SV_Systeminfo_f(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/operator_commands.ml#L108)
