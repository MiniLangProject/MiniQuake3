# `src/mq3/server/init_runtime.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.init_runtime`](Package-mq3-server-init-runtime-159119524.md)

Reachable from entry: **yes**

## Imports

- `mq3/game/entitystate.ml` as `entitystate` → [src/mq3/game/entitystate.ml](File-src-mq3-game-entitystate-ml-1227653182.md)
- `mq3/qcommon/cvar.ml` as `cvar` → [src/mq3/qcommon/cvar.ml](File-src-mq3-qcommon-cvar-ml-558393614.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-server-init-runtime-action-function-action-host-kind-a-b-c-src-mq3-server-init-runtime-ml-1774232732"></a>
### action

```ml
function action(host, kind, a, b, c)
```

Compute action in server.init_runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `actionFn`. |
| `kind` | `dynamic` | — | Kind used in `host.actionFn(host, kind, a, b, c)`. |
| `a` | `dynamic` | — | A used in `host.actionFn(host, kind, a, b, c)`. |
| `b` | `dynamic` | — | B used in `host.actionFn(host, kind, a, b, c)`. |
| `c` | `dynamic` | — | C used in `host.actionFn(host, kind, a, b, c)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L74)

<a id="function-function-mq3-server-init-runtime-bounded-function-bounded-text-capacity-src-mq3-server-init-runtime-ml-2044473593"></a>
### bounded

```ml
function bounded(text, capacity)
```

Compute bounded in server.init_runtime; the normal completion returns `text`.

Validation failures include `bufferSize < 1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text used in `bytes(text)` and `(text == void)`. |
| `capacity` | `dynamic` | — | Capacity used in `(capacity < 1)` and `(capacity - 1)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L90)

<a id="function-function-mq3-server-init-runtime-client-function-client-tag-src-mq3-server-init-runtime-ml-225160276"></a>
### client

```ml
function client(tag)
```

Create `mq3.server.init_runtime.Client` with state=CS_FREE; userinfo=""; name=""; noServerInfo=false; bot=false; loopback=false; gentityNumber=- 1; deltaMessage=0; nextSnapshotTime=0; tag=tag; commands=[].

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `tag` | `dynamic` | — | Initial `tag` field stored in the returned or constructed `mq3.server.init_runtime.Client` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L34)

- [mq3.server.init_runtime.Client](Type-mq3-server-init-runtime-client-1866530461.md) — struct
<a id="constant-constant-mq3-server-init-runtime-config-chunk-const-config-chunk-1000-src-mq3-server-init-runtime-ml-495407760"></a>
### CONFIG_CHUNK

```ml
const CONFIG_CHUNK = 1000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L15)

<a id="constant-constant-mq3-server-init-runtime-config-payload-const-config-payload-999-src-mq3-server-init-runtime-ml-1864494142"></a>
### CONFIG_PAYLOAD

```ml
const CONFIG_PAYLOAD = 999
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L16)

<a id="constant-constant-mq3-server-init-runtime-cs-active-const-cs-active-4-src-mq3-server-init-runtime-ml-516266149"></a>
### CS_ACTIVE

```ml
const CS_ACTIVE = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L25)

<a id="constant-constant-mq3-server-init-runtime-cs-connected-const-cs-connected-2-src-mq3-server-init-runtime-ml-1582197245"></a>
### CS_CONNECTED

```ml
const CS_CONNECTED = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L23)

<a id="constant-constant-mq3-server-init-runtime-cs-free-const-cs-free-0-src-mq3-server-init-runtime-ml-283161425"></a>
### CS_FREE

```ml
const CS_FREE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L22)

<a id="constant-constant-mq3-server-init-runtime-cs-primed-const-cs-primed-3-src-mq3-server-init-runtime-ml-583298798"></a>
### CS_PRIMED

```ml
const CS_PRIMED = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L24)

<a id="constant-constant-mq3-server-init-runtime-cs-serverinfo-const-cs-serverinfo-0-src-mq3-server-init-runtime-ml-79278269"></a>
### CS_SERVERINFO

```ml
const CS_SERVERINFO = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L20)

<a id="constant-constant-mq3-server-init-runtime-cs-systeminfo-const-cs-systeminfo-1-src-mq3-server-init-runtime-ml-523951252"></a>
### CS_SYSTEMINFO

```ml
const CS_SYSTEMINFO = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L21)

<a id="function-function-mq3-server-init-runtime-freshclients-function-freshclients-count-src-mq3-server-init-runtime-ml-689039699"></a>
### freshClients

```ml
function freshClients(count)
```

Compute fresh clients in server.init_runtime; the normal completion returns `result`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `count` | `dynamic` | — | Count used in `(count - 1)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L199)

<a id="function-function-mq3-server-init-runtime-level-function-level-src-mq3-server-init-runtime-ml-406904304"></a>
### level

```ml
function level()
```

Compute level in server.init_runtime; the normal completion returns `Level(SS_DEAD, false, array(MAX_CONFIGSTRINGS, ""), entities, baselines, 0, 0, 0, 0, 0, 0, "")`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L46)

- [mq3.server.init_runtime.Level](Type-mq3-server-init-runtime-level-2080764412.md) — struct
<a id="constant-constant-mq3-server-init-runtime-max-clients-const-max-clients-64-src-mq3-server-init-runtime-ml-1855823307"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L11)

<a id="constant-constant-mq3-server-init-runtime-max-configstrings-const-max-configstrings-1024-src-mq3-server-init-runtime-ml-1129928704"></a>
### MAX_CONFIGSTRINGS

```ml
const MAX_CONFIGSTRINGS = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L10)

<a id="constant-constant-mq3-server-init-runtime-max-info-string-const-max-info-string-1024-src-mq3-server-init-runtime-ml-353813064"></a>
### MAX_INFO_STRING

```ml
const MAX_INFO_STRING = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L12)

<a id="constant-constant-mq3-server-init-runtime-max-name-length-const-max-name-length-32-src-mq3-server-init-runtime-ml-844961834"></a>
### MAX_NAME_LENGTH

```ml
const MAX_NAME_LENGTH = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L13)

<a id="constant-constant-mq3-server-init-runtime-max-packet-entities-const-max-packet-entities-64-src-mq3-server-init-runtime-ml-449443243"></a>
### MAX_PACKET_ENTITIES

```ml
const MAX_PACKET_ENTITIES = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L18)

<a id="constant-constant-mq3-server-init-runtime-max-string-chars-const-max-string-chars-1024-src-mq3-server-init-runtime-ml-788461422"></a>
### MAX_STRING_CHARS

```ml
const MAX_STRING_CHARS = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L14)

<a id="constant-constant-mq3-server-init-runtime-packet-backup-const-packet-backup-32-src-mq3-server-init-runtime-ml-1959034218"></a>
### PACKET_BACKUP

```ml
const PACKET_BACKUP = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L17)

<a id="function-function-mq3-server-init-runtime-quotecommand-function-quotecommand-kind-index-text-src-mq3-server-init-runtime-ml-1919615161"></a>
### quoteCommand

```ml
function quoteCommand(kind, index, text)
```

Compute server.init_runtime.quoteCommand as `(((((kind + " ") + str(index)) + " \"") + text) + "\"\n")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `kind` | `dynamic` | — | Kind used in `(kind + " ")` and `((kind + " ") + str(index))`. |
| `index` | `dynamic` | — | Index used in `str(index)` and `((kind + " ") + str(index))`. |
| `text` | `dynamic` | — | Text used in `((((kind + " ") + str(index)) + " \\"") + text)` and `(((((kind + " ") + str(index)) + " \\"") + text) + "\\"\\n")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L99)

<a id="function-function-mq3-server-init-runtime-reconnectclients-function-reconnectclients-state-host-killbots-src-mq3-server-init-runtime-ml-104886689"></a>
### reconnectClients

```ml
function reconnectClients(state, host, killBots)
```

Compute reconnect clients in server.init_runtime; the normal completion returns `kept`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `maxClients`, `svs`, `sv`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.server.init_runtime.action`. |
| `killBots` | `dynamic` | — | Kill bots used in `(current.bot and killBots)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L256)

<a id="function-function-mq3-server-init-runtime-registercvars-function-registercvars-state-src-mq3-server-init-runtime-ml-471190449"></a>
### registerCvars

```ml
function registerCvars(state)
```

Register cvars in server.init_runtime; the normal completion returns `len(specs)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `registry`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L308)

<a id="function-function-mq3-server-init-runtime-requestedmax-function-requestedmax-state-src-mq3-server-init-runtime-ml-644059017"></a>
### requestedMax

```ml
function requestedMax(state)
```

Compute requested max in server.init_runtime; the normal completion returns `value.integer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `registry`, `maxClients`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L177)

<a id="function-function-mq3-server-init-runtime-requireclient-function-requireclient-state-index-src-mq3-server-init-runtime-ml-814927591"></a>
### requireClient

```ml
function requireClient(state, index)
```

Compute require client in server.init_runtime; the normal completion returns `state.svs.clients[index]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `maxClients`, `svs`. |
| `index` | `dynamic` | — | Zero-based index into `state.svs.clients`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L146)

<a id="function-function-mq3-server-init-runtime-requireconfigindex-function-requireconfigindex-index-src-mq3-server-init-runtime-ml-776546684"></a>
### requireConfigIndex

```ml
function requireConfigIndex(index)
```

Compute require config index in server.init_runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | `dynamic` | — | Index used in `str(index)` and `(index < 0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L81)

<a id="function-function-mq3-server-init-runtime-runtime-function-runtime-src-mq3-server-init-runtime-ml-1477633016"></a>
### runtime

```ml
function runtime()
```

Create `mq3.server.init_runtime.Runtime` with sv=level(); svs=staticState(); registry=cvar.create(); maxClients=8; 10 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L60)

- [mq3.server.init_runtime.Runtime](Type-mq3-server-init-runtime-runtime-1059025126.md) — struct
<a id="function-function-mq3-server-init-runtime-seed-function-seed-state-host-src-mq3-server-init-runtime-ml-1527380815"></a>
### seed

```ml
function seed(state, host)
```

Compute seed in server.init_runtime; the normal completion returns `((((first & 32767) << 16) ^ (second & 32767)) ^ extra)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `frameTime`. |
| `host` | `dynamic` | — | Record exposing `millisecondsFn`, `randomFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L246)

<a id="function-function-mq3-server-init-runtime-sendconfig-function-sendconfig-clientstate-index-value-src-mq3-server-init-runtime-ml-950190249"></a>
### sendConfig

```ml
function sendConfig(clientState, index, value)
```

Send config in server.init_runtime; the normal completion returns `count`.

Direct state writes: `clientState.commands`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientState` | `dynamic` | — | Record exposing `commands`. Updated in place: `commands`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.server.init_runtime.quoteCommand`. |
| `value` | `dynamic` | — | Text passed as `text` to `mq3.server.init_runtime.quoteCommand`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L107)

<a id="function-function-mq3-server-init-runtime-services-function-services-src-mq3-server-init-runtime-ml-2043065232"></a>
### services

```ml
function services()
```

Create `mq3.server.init_runtime.Services` with context=void; actionFn=void; randomFn=void; millisecondsFn=void.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L67)

- [mq3.server.init_runtime.Services](Type-mq3-server-init-runtime-services-349563314.md) — struct
<a id="function-function-mq3-server-init-runtime-sharedentity-function-sharedentity-src-mq3-server-init-runtime-ml-482816416"></a>
### sharedEntity

```ml
function sharedEntity()
```

Create `mq3.server.init_runtime.SharedEntity` with linked=false; state=entitystate.create().


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L41)

- [mq3.server.init_runtime.SharedEntity](Type-mq3-server-init-runtime-sharedentity-1915972140.md) — struct
<a id="constant-constant-mq3-server-init-runtime-snapflag-servercount-const-snapflag-servercount-4-src-mq3-server-init-runtime-ml-172434033"></a>
### SNAPFLAG_SERVERCOUNT

```ml
const SNAPFLAG_SERVERCOUNT = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L19)

<a id="function-function-mq3-server-init-runtime-snapshotcount-function-snapshotcount-state-src-mq3-server-init-runtime-ml-226665975"></a>
### snapshotCount

```ml
function snapshotCount(state)
```

Compute snapshot count in server.init_runtime; the normal completion returns `((state.maxClients * 4) * MAX_PACKET_ENTITIES)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `dedicated`, `maxClients`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L193)

<a id="constant-constant-mq3-server-init-runtime-ss-dead-const-ss-dead-0-src-mq3-server-init-runtime-ml-1346243153"></a>
### SS_DEAD

```ml
const SS_DEAD = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L26)

<a id="constant-constant-mq3-server-init-runtime-ss-game-const-ss-game-2-src-mq3-server-init-runtime-ml-1411218807"></a>
### SS_GAME

```ml
const SS_GAME = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L28)

<a id="constant-constant-mq3-server-init-runtime-ss-loading-const-ss-loading-1-src-mq3-server-init-runtime-ml-996667548"></a>
### SS_LOADING

```ml
const SS_LOADING = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L27)

- [mq3.server.init_runtime.Static](Type-mq3-server-init-runtime-static-420608236.md) — struct
<a id="function-function-mq3-server-init-runtime-staticstate-function-staticstate-src-mq3-server-init-runtime-ml-879527862"></a>
### staticState

```ml
function staticState()
```

Create `mq3.server.init_runtime.Static` with initialized=false; clients=[]; numSnapshotEntities=0; snapshotEntities=[]; nextSnapshotEntities=0; snapFlagServerBit=0; time=0.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L55)

<a id="function-function-mq3-server-init-runtime-sv-boundmaxclients-function-sv-boundmaxclients-state-minimum-src-mq3-server-init-runtime-ml-369655947"></a>
### SV_BoundMaxClients

```ml
function SV_BoundMaxClients(state, minimum)
```

Update `state.maxClients` in server.init_runtime; the normal completion returns `wanted`.

Direct state writes: `state.maxClients`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `registry`. Updated in place: `maxClients`. |
| `minimum` | `dynamic` | — | Minimum used in `(wanted < minimum)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L185)

<a id="function-function-mq3-server-init-runtime-sv-changemaxclients-function-sv-changemaxclients-state-host-src-mq3-server-init-runtime-ml-69232111"></a>
### SV_ChangeMaxClients

```ml
function SV_ChangeMaxClients(state, host)
```

Test change max clients in server.init_runtime; the normal completion returns `true`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `maxClients`, `svs`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.server.init_runtime.action`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L216)

<a id="function-function-mq3-server-init-runtime-sv-clearserver-function-sv-clearserver-state-src-mq3-server-init-runtime-ml-1033074801"></a>
### SV_ClearServer

```ml
function SV_ClearServer(state)
```

Clear server in server.init_runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `sv`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L228)

<a id="function-function-mq3-server-init-runtime-sv-createbaseline-function-sv-createbaseline-state-src-mq3-server-init-runtime-ml-1736086231"></a>
### SV_CreateBaseline

```ml
function SV_CreateBaseline(state)
```

Create baseline in server.init_runtime; the normal completion returns `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `sv`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L166)

<a id="function-function-mq3-server-init-runtime-sv-finalmessage-function-sv-finalmessage-state-host-message-src-mq3-server-init-runtime-ml-2132308824"></a>
### SV_FinalMessage

```ml
function SV_FinalMessage(state, host, message)
```

Compute final message in server.init_runtime; the normal completion returns `snapshots`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `maxClients`, `svs`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.server.init_runtime.action`. |
| `message` | `dynamic` | — | Message used in `("print \\"" + message)` and `(("print \\"" + message) + "\\"")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L330)

<a id="function-function-mq3-server-init-runtime-sv-getconfigstring-function-sv-getconfigstring-state-index-buffersize-src-mq3-server-init-runtime-ml-73382156"></a>
### SV_GetConfigstring

```ml
function SV_GetConfigstring(state, index, bufferSize)
```

Get configstring in server.init_runtime; the normal completion returns `bounded(state.sv.configstrings[index], bufferSize)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `sv`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.server.init_runtime.requireConfigIndex`. |
| `bufferSize` | `dynamic` | — | Capacity passed as `capacity` to `mq3.server.init_runtime.bounded`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L141)

<a id="function-function-mq3-server-init-runtime-sv-getuserinfo-function-sv-getuserinfo-state-index-buffersize-src-mq3-server-init-runtime-ml-545447492"></a>
### SV_GetUserinfo

```ml
function SV_GetUserinfo(state, index, bufferSize)
```

Return `mq3.server.init_runtime.bounded(requireClient(state, index).userinfo, bufferSize)` from `server.init_runtime.SV_GetUserinfo`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.server.init_runtime.requireClient`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.server.init_runtime.requireClient`. |
| `bufferSize` | `dynamic` | — | Capacity passed as `capacity` to `mq3.server.init_runtime.bounded`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L162)

<a id="function-function-mq3-server-init-runtime-sv-init-function-sv-init-state-host-src-mq3-server-init-runtime-ml-889022955"></a>
### SV_Init

```ml
function SV_Init(state, host)
```

Update `state.operatorCommands`, `state.botInitialized` in server.init_runtime; the normal completion returns `count`.

Direct state writes: `state.operatorCommands`, `state.botInitialized`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Updated in place: `operatorCommands`, `botInitialized`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.server.init_runtime.action`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L322)

<a id="function-function-mq3-server-init-runtime-sv-setconfigstring-function-sv-setconfigstring-state-index-value-src-mq3-server-init-runtime-ml-1694271948"></a>
### SV_SetConfigstring

```ml
function SV_SetConfigstring(state, index, value)
```

Set configstring in server.init_runtime; the normal completion returns `delivered`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `sv`, `svs`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.server.init_runtime.requireConfigIndex`. |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.server.init_runtime.sendConfig`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L125)

<a id="function-function-mq3-server-init-runtime-sv-setuserinfo-function-sv-setuserinfo-state-index-value-src-mq3-server-init-runtime-ml-1410414036"></a>
### SV_SetUserinfo

```ml
function SV_SetUserinfo(state, index, value)
```

Set userinfo in server.init_runtime.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | State passed as `state` to `mq3.server.init_runtime.requireClient`. |
| `index` | `dynamic` | — | Index passed as `index` to `mq3.server.init_runtime.requireClient`. |
| `value` | `dynamic` | — | Text passed as `text` to `mq3.server.init_runtime.bounded`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L154)

<a id="function-function-mq3-server-init-runtime-sv-shutdown-function-sv-shutdown-state-host-finalmessage-src-mq3-server-init-runtime-ml-1699801192"></a>
### SV_Shutdown

```ml
function SV_Shutdown(state, host, finalMessage)
```

Update `state.svs`, `state.running`, `state.operatorCommands`, `state.shutdown` in server.init_runtime; the normal completion returns `true`.

Direct state writes: `state.svs`, `state.running`, `state.operatorCommands`, `state.shutdown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `running`, `svs`, `errorEntered`, `registry`. Updated in place: `svs`, `running`, `operatorCommands`, `shutdown`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.server.init_runtime.SV_FinalMessage`. |
| `finalMessage` | `dynamic` | — | Message passed as `message` to `mq3.server.init_runtime.SV_FinalMessage`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L349)

<a id="function-function-mq3-server-init-runtime-sv-spawnserver-function-sv-spawnserver-state-host-mapname-killbots-src-mq3-server-init-runtime-ml-180319830"></a>
### SV_SpawnServer

```ml
function SV_SpawnServer(state, host, mapName, killBots)
```

Update `state.gametypeModified`, `state.modifiedFlags` in server.init_runtime; the normal completion returns `checksum`.

Direct state writes: `state.gametypeModified`, `state.modifiedFlags`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `running`, `registry`, `svs`, `sv`, `frameTime`, `pure`, `dedicated` and further fields. Updated in place: `gametypeModified`, `modifiedFlags`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.server.init_runtime.action`. |
| `mapName` | `dynamic` | — | A passed as `a` to `mq3.server.init_runtime.action`. |
| `killBots` | `dynamic` | — | Kill bots passed as `killBots` to `mq3.server.init_runtime.reconnectClients`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L281)

<a id="function-function-mq3-server-init-runtime-sv-startup-function-sv-startup-state-host-src-mq3-server-init-runtime-ml-1325621115"></a>
### SV_Startup

```ml
function SV_Startup(state, host)
```

Update `state.running` in server.init_runtime; the normal completion returns `state.maxClients`.

Validation failures include `SV_Startup: svs.initialized`.
Direct state writes: `state.running`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Record exposing `svs`, `maxClients`, `registry`. Updated in place: `running`. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.server.init_runtime.action`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L208)

<a id="function-function-mq3-server-init-runtime-sv-touchcgame-function-sv-touchcgame-state-host-src-mq3-server-init-runtime-ml-1903245743"></a>
### SV_TouchCGame

```ml
function SV_TouchCGame(state, host)
```

Test touch c game in server.init_runtime; the normal completion returns `false`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Reserved argument; this implementation does not read its value. |
| `host` | `dynamic` | — | Host passed as `host` to `mq3.server.init_runtime.action`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/init_runtime.ml#L237)
