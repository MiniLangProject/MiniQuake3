# `src/mq3/server/abi.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.abi`](Package-mq3-server-abi-765894957.md)

Reachable from entry: **yes**

## Imports

- `mq3/game/entitystate.ml` as `entitystate` → [src/mq3/game/entitystate.ml](File-src-mq3-game-entitystate-ml-1227653182.md)
- `mq3/game/playerstate.ml` as `playerstate` → [src/mq3/game/playerstate.ml](File-src-mq3-game-playerstate-ml-1407876292.md)
- `mq3/qcommon/message_delta.ml` as `usercmd` → [src/mq3/qcommon/message_delta.ml](File-src-mq3-qcommon-message-delta-ml-1923515516.md)
- `mq3/server/game_interface.ml` as `gameInterface` → [src/mq3/server/game_interface.ml](File-src-mq3-server-game-interface-ml-1640517219.md)
- `mq3/server/snapshot_build.ml` as `snapshotBuild` → [src/mq3/server/snapshot_build.ml](File-src-mq3-server-snapshot-build-ml-2050633468.md)
- `mq3/server/snapshot_send.ml` as `snapshotSend` → [src/mq3/server/snapshot_send.ml](File-src-mq3-server-snapshot-send-ml-704467576.md)
- `std/array.ml` as `arrays` → `../MiniLangCompilerML/std/array.ml` — external dependency

## Declarations

<a id="constant-constant-mq3-server-abi-authorize-timeout-const-authorize-timeout-5000-src-mq3-server-abi-ml-1116891916"></a>
### AUTHORIZE_TIMEOUT

```ml
const AUTHORIZE_TIMEOUT = 5000
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L27)

<a id="function-function-mq3-server-abi-bindgameinterface-function-bindgameinterface-mapstate-persistentstate-target-src-mq3-server-abi-ml-1665090378"></a>
### bindGameInterface

```ml
function bindGameInterface(mapState, persistentState, target)
```

Update `target.gentities`, `target.gentitySize`, `target.numEntities`, `target.gameClients` in server.abi; the normal completion returns `target`.

Validation failures include `server ABI: missing game binding`.
Direct state writes: `target.gentities`, `target.gentitySize`, `target.numEntities`, `target.gameClients`, `target.gameClientSize`, `target.maxClients`, `target.serverState`, `target.clients` and further fields.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mapState` | `dynamic` | — | Record exposing `gentities`, `gentitySize`, `numEntities`, `gameClients`, `gameClientSize`, `state`, `svEntities`. |
| `persistentState` | `dynamic` | — | Record exposing `clients`. |
| `target` | `dynamic` | — | Record exposing `clients`, `svEntities`. Updated in place: `gentities`, `gentitySize`, `numEntities`, `gameClients`, `gameClientSize`, `maxClients` and further fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L206)

<a id="function-function-mq3-server-abi-challenge-function-challenge-src-mq3-server-abi-ml-1842982276"></a>
### challenge

```ml
function challenge()
```

Create `mq3.server.abi.Challenge` with address=void; challenge=0; time=0; pingTime=0; firstTime=0; connected=false.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L140)

- [mq3.server.abi.Challenge](Type-mq3-server-abi-challenge-1945353050.md) — struct
<a id="function-function-mq3-server-abi-challengelayout-function-challengelayout-src-mq3-server-abi-ml-1124335796"></a>
### challengeLayout

```ml
function challengeLayout()
```

Return `mq3.server.abi.layout("challenge_t", 40, ["adr", "challenge", "time", "pingTime", "firstTime", "connected"], [0, 20, 24, 28, 32, 36], [], [])` from `server.abi.challengeLayout`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L65)

<a id="function-function-mq3-server-abi-client-function-client-src-mq3-server-abi-ml-1761737538"></a>
### client

```ml
function client()
```

Apply `mq3.server.abi.clientSnapshot`, `mq3.server.abi.Client`, `mq3.qcommon.message_delta.userCommand` for client in server.abi.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L132)

- [mq3.server.abi.Client](Type-mq3-server-abi-client-966821330.md) — struct
<a id="function-function-mq3-server-abi-clientlayout-function-clientlayout-src-mq3-server-abi-ml-521658270"></a>
### clientLayout

```ml
function clientLayout()
```

Delegate `clientLayout` to `mq3.server.abi.layout` and return its result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L63)

<a id="function-function-mq3-server-abi-clientsnapshot-function-clientsnapshot-src-mq3-server-abi-ml-1425837534"></a>
### clientSnapshot

```ml
function clientSnapshot()
```

Create `mq3.server.abi.ClientSnapshot` with areabytes=0; areabits=bytes(MAX_MAP_AREA_BYTES, 0); ps=playerstate.create(); numEntities=0; firstEntity=0; messageSent=0; messageAcked=0; messageSize=0.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L121)

- [mq3.server.abi.ClientSnapshot](Type-mq3-server-abi-clientsnapshot-1234231006.md) — struct
<a id="function-function-mq3-server-abi-clientsnapshotlayout-function-clientsnapshotlayout-src-mq3-server-abi-ml-848180290"></a>
### clientSnapshotLayout

```ml
function clientSnapshotLayout()
```

Return `mq3.server.abi.layout("clientSnapshot_t", 524, ["areabytes", "areabits", "ps", "num_entities", "first_entity", "messageSent", "messageAcked", "messageSize"], [0, 4, 36, 504, 508, 512, 516, 520], ["areabits"], [32])` from `server.abi.clientSnapshotLayout`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L59)

<a id="function-function-mq3-server-abi-clusters-function-clusters-value-src-mq3-server-abi-ml-1797973371"></a>
### clusters

```ml
function clusters(value)
```

Compute clusters in server.abi; the normal completion returns `arrays.slice(value.clusternums, 0, count)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `numClusters`, `clusternums`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L104)

<a id="constant-constant-mq3-server-abi-cs-active-const-cs-active-4-src-mq3-server-abi-ml-434032683"></a>
### CS_ACTIVE

```ml
const CS_ACTIVE = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L25)

<a id="constant-constant-mq3-server-abi-cs-connected-const-cs-connected-2-src-mq3-server-abi-ml-1790740927"></a>
### CS_CONNECTED

```ml
const CS_CONNECTED = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L23)

<a id="constant-constant-mq3-server-abi-cs-free-const-cs-free-0-src-mq3-server-abi-ml-669318367"></a>
### CS_FREE

```ml
const CS_FREE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L21)

<a id="constant-constant-mq3-server-abi-cs-primed-const-cs-primed-3-src-mq3-server-abi-ml-2091593166"></a>
### CS_PRIMED

```ml
const CS_PRIMED = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L24)

<a id="constant-constant-mq3-server-abi-cs-zombie-const-cs-zombie-1-src-mq3-server-abi-ml-966220416"></a>
### CS_ZOMBIE

```ml
const CS_ZOMBIE = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L22)

<a id="function-function-mq3-server-abi-cvarnames-function-cvarnames-src-mq3-server-abi-ml-1999234794"></a>
### cvarNames

```ml
function cvarNames()
```

The declarations below are part of server.h's public surface even though MiniLang stores cvars in the managed Cvars value and dispatches functions from their owning modules.  Keeping the original spelling/order here gives ABI tooling a single canonical manifest without introducing duplicate stubs.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L75)

<a id="function-function-mq3-server-abi-cvars-function-cvars-src-mq3-server-abi-ml-1889587008"></a>
### cvars

```ml
function cvars()
```

Create `mq3.server.abi.Cvars` with fps=void; timeout=void; zombietime=void; rconPassword=void; 21 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L159)

- [mq3.server.abi.Cvars](Type-mq3-server-abi-cvars-51168696.md) — struct
<a id="function-function-mq3-server-abi-globals-function-globals-maxclients-numsnapshotentities-src-mq3-server-abi-ml-1596234743"></a>
### globals

```ml
function globals(maxClients, numSnapshotEntities)
```

Create `mq3.server.abi.Globals` with svs=serverStatic(maxClients, numSnapshotEntities); sv=server(); gvm=void; cvars=cvars().

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxClients` | `dynamic` | — | Max clients passed as `maxClients` to `mq3.server.abi.serverStatic`. |
| `numSnapshotEntities` | `dynamic` | — | Num snapshot entities passed as `numSnapshotEntities` to `mq3.server.abi.serverStatic`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L165)

- [mq3.server.abi.Globals](Type-mq3-server-abi-globals-2097768435.md) — struct
<a id="function-function-mq3-server-abi-layout-function-layout-name-size-fields-offsets-arrayfields-arraycounts-src-mq3-server-abi-ml-1506505768"></a>
### layout

```ml
function layout(name, size, fields, offsets, arrayFields, arrayCounts)
```

Create `mq3.server.abi.Layout` with name=name; size=size; fields=fields; offsets=offsets; arrayFields=arrayFields; arrayCounts=arrayCounts.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Initial `name` field stored in the returned or constructed `mq3.server.abi.Layout` record. |
| `size` | `dynamic` | — | Initial `size` field stored in the returned or constructed `mq3.server.abi.Layout` record. |
| `fields` | `dynamic` | — | Initial `fields` field stored in the returned or constructed `mq3.server.abi.Layout` record. |
| `offsets` | `dynamic` | — | Initial `offsets` field stored in the returned or constructed `mq3.server.abi.Layout` record. |
| `arrayFields` | `dynamic` | — | Initial `arrayFields` field stored in the returned or constructed `mq3.server.abi.Layout` record. |
| `arrayCounts` | `dynamic` | — | Initial `arrayCounts` field stored in the returned or constructed `mq3.server.abi.Layout` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L53)

- [mq3.server.abi.Layout](Type-mq3-server-abi-layout-1689550659.md) — struct
<a id="function-function-mq3-server-abi-layouts-function-layouts-src-mq3-server-abi-ml-879658108"></a>
### layouts

```ml
function layouts()
```

Compute server.abi.layouts as `[svEntityLayout(), serverLayout(), clientSnapshotLayout(), netchanBufferLayout(), clientLayout(), challengeLayout(), serverStaticLayout()]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L69)

<a id="constant-constant-mq3-server-abi-max-challenges-const-max-challenges-1024-src-mq3-server-abi-ml-1517842310"></a>
### MAX_CHALLENGES

```ml
const MAX_CHALLENGES = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L26)

<a id="constant-constant-mq3-server-abi-max-configstrings-const-max-configstrings-1024-src-mq3-server-abi-ml-1561346750"></a>
### MAX_CONFIGSTRINGS

```ml
const MAX_CONFIGSTRINGS = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L32)

<a id="constant-constant-mq3-server-abi-max-download-window-const-max-download-window-8-src-mq3-server-abi-ml-1272336767"></a>
### MAX_DOWNLOAD_WINDOW

```ml
const MAX_DOWNLOAD_WINDOW = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L40)

<a id="constant-constant-mq3-server-abi-max-ent-clusters-const-max-ent-clusters-16-src-mq3-server-abi-ml-1871710220"></a>
### MAX_ENT_CLUSTERS

```ml
const MAX_ENT_CLUSTERS = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L17)

<a id="constant-constant-mq3-server-abi-max-gentities-const-max-gentities-1024-src-mq3-server-abi-ml-377512246"></a>
### MAX_GENTITIES

```ml
const MAX_GENTITIES = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L33)

<a id="constant-constant-mq3-server-abi-max-info-string-const-max-info-string-1024-src-mq3-server-abi-ml-1347876894"></a>
### MAX_INFO_STRING

```ml
const MAX_INFO_STRING = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L35)

<a id="constant-constant-mq3-server-abi-max-map-area-bytes-const-max-map-area-bytes-32-src-mq3-server-abi-ml-1130778764"></a>
### MAX_MAP_AREA_BYTES

```ml
const MAX_MAP_AREA_BYTES = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L34)

<a id="constant-constant-mq3-server-abi-max-master-servers-const-max-master-servers-5-src-mq3-server-abi-ml-1084545950"></a>
### MAX_MASTER_SERVERS

```ml
const MAX_MASTER_SERVERS = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L29)

<a id="constant-constant-mq3-server-abi-max-masters-const-max-masters-8-src-mq3-server-abi-ml-1214453615"></a>
### MAX_MASTERS

```ml
const MAX_MASTERS = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L28)

<a id="constant-constant-mq3-server-abi-max-models-const-max-models-256-src-mq3-server-abi-ml-1885530030"></a>
### MAX_MODELS

```ml
const MAX_MODELS = 256
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L31)

<a id="constant-constant-mq3-server-abi-max-msglen-const-max-msglen-16384-src-mq3-server-abi-ml-504081083"></a>
### MAX_MSGLEN

```ml
const MAX_MSGLEN = 16384
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L41)

<a id="constant-constant-mq3-server-abi-max-name-length-const-max-name-length-32-src-mq3-server-abi-ml-1777892400"></a>
### MAX_NAME_LENGTH

```ml
const MAX_NAME_LENGTH = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L38)

<a id="constant-constant-mq3-server-abi-max-qpath-const-max-qpath-64-src-mq3-server-abi-ml-776790079"></a>
### MAX_QPATH

```ml
const MAX_QPATH = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L39)

<a id="constant-constant-mq3-server-abi-max-reliable-commands-const-max-reliable-commands-64-src-mq3-server-abi-ml-1002517823"></a>
### MAX_RELIABLE_COMMANDS

```ml
const MAX_RELIABLE_COMMANDS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L36)

<a id="constant-constant-mq3-server-abi-max-string-chars-const-max-string-chars-1024-src-mq3-server-abi-ml-2063744880"></a>
### MAX_STRING_CHARS

```ml
const MAX_STRING_CHARS = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L37)

<a id="function-function-mq3-server-abi-netchanbuffer-function-netchanbuffer-msg-src-mq3-server-abi-ml-782451889"></a>
### netchanBuffer

```ml
function netchanBuffer(msg)
```

Create `mq3.server.abi.NetchanBuffer` with msg=msg; msgBuffer=bytes(MAX_MSGLEN, 0); next=void.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `msg` | `dynamic` | — | Initial `msg` field stored in the returned or constructed `mq3.server.abi.NetchanBuffer` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L127)

- [mq3.server.abi.NetchanBuffer](Type-mq3-server-abi-netchanbuffer-1585573798.md) — struct
<a id="function-function-mq3-server-abi-netchanbufferlayout-function-netchanbufferlayout-src-mq3-server-abi-ml-1599708340"></a>
### netchanBufferLayout

```ml
function netchanBufferLayout()
```

Return `mq3.server.abi.layout("netchan_buffer_t", 16420, ["msg", "msgBuffer", "next"], [0, 32, 16416], ["msgBuffer"], [16384])` from `server.abi.netchanBufferLayout`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L61)

<a id="constant-constant-mq3-server-abi-packet-backup-const-packet-backup-32-src-mq3-server-abi-ml-1557840544"></a>
### PACKET_BACKUP

```ml
const PACKET_BACKUP = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L42)

<a id="constant-constant-mq3-server-abi-pers-score-const-pers-score-0-src-mq3-server-abi-ml-2069476879"></a>
### PERS_SCORE

```ml
const PERS_SCORE = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L16)

<a id="function-function-mq3-server-abi-prototypenames-function-prototypenames-src-mq3-server-abi-ml-78137254"></a>
### prototypeNames

```ml
function prototypeNames()
```

List the 60 names in server.abi.prototypeNames, beginning with `SV_FinalMessage`, `SV_SendServerCommand`, `SV_AddOperatorCommands`, `SV_RemoveOperatorCommands`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L79)

<a id="function-function-mq3-server-abi-server-function-server-src-mq3-server-abi-ml-458776754"></a>
### server

```ml
function server()
```

Apply `mq3.server.abi.svEntity`, `mq3.server.abi.Server` for server in server.abi.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L113)

- [mq3.server.abi.Server](Type-mq3-server-abi-server-1363816382.md) — struct
<a id="function-function-mq3-server-abi-serverlayout-function-serverlayout-src-mq3-server-abi-ml-1449230166"></a>
### serverLayout

```ml
function serverLayout()
```

Delegate `serverLayout` to `mq3.server.abi.layout` and return its result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L57)

<a id="function-function-mq3-server-abi-serverstatic-function-serverstatic-maxclients-numsnapshotentities-src-mq3-server-abi-ml-2104554503"></a>
### serverStatic

```ml
function serverStatic(maxClients, numSnapshotEntities)
```

Apply `mq3.server.abi.client`, `mq3.server.abi.challenge`, `mq3.server.abi.ServerStatic` for server static in server.abi.

Validation failures include `server ABI: invalid persistent sizes`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxClients` | `dynamic` | — | Max clients used in `(maxClients < 0)` and `(maxClients - 1)`. |
| `numSnapshotEntities` | `dynamic` | — | Initial `numSnapshotEntities` field stored in the returned or constructed `mq3.server.abi.ServerStatic` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L149)

- [mq3.server.abi.ServerStatic](Type-mq3-server-abi-serverstatic-951087980.md) — struct
<a id="function-function-mq3-server-abi-serverstaticlayout-function-serverstaticlayout-src-mq3-server-abi-ml-1660925134"></a>
### serverStaticLayout

```ml
function serverStaticLayout()
```

Delegate `serverStaticLayout` to `mq3.server.abi.layout` and return its result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L67)

<a id="function-function-mq3-server-abi-setclusters-function-setclusters-value-clusters-lastcluster-src-mq3-server-abi-ml-1319810992"></a>
### setClusters

```ml
function setClusters(value, clusters, lastCluster)
```

Set clusters in server.abi; the normal completion returns `value`.

Validation failures include `server ABI: invalid cluster set`.
Direct state writes: `value.numClusters`, `value.clusternums`, `value.lastCluster`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `clusternums`. Updated in place: `numClusters`, `clusternums`, `lastCluster`. |
| `clusters` | `dynamic` | — | Clusters used in `len(clusters)` and `clusters[index]`. |
| `lastCluster` | `dynamic` | — | Last cluster operand used by `setClusters`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L96)

<a id="constant-constant-mq3-server-abi-ss-dead-const-ss-dead-0-src-mq3-server-abi-ml-1726092543"></a>
### SS_DEAD

```ml
const SS_DEAD = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L18)

<a id="constant-constant-mq3-server-abi-ss-game-const-ss-game-2-src-mq3-server-abi-ml-1818069361"></a>
### SS_GAME

```ml
const SS_GAME = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L20)

<a id="constant-constant-mq3-server-abi-ss-loading-const-ss-loading-1-src-mq3-server-abi-ml-2039344308"></a>
### SS_LOADING

```ml
const SS_LOADING = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L19)

<a id="function-function-mq3-server-abi-sventity-function-sventity-src-mq3-server-abi-ml-783654302"></a>
### svEntity

```ml
function svEntity()
```

Create `mq3.server.abi.SvEntity` with worldSector=void; nextEntityInWorldSector=void; baseline=entitystate.create(); numClusters=0; clusternums=array(MAX_ENT_CLUSTERS, 0); lastCluster=0; areanum=0; areanum2=0; snapshotCounter=0.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L86)

- [mq3.server.abi.SvEntity](Type-mq3-server-abi-sventity-1246905027.md) — struct
<a id="function-function-mq3-server-abi-sventitylayout-function-sventitylayout-src-mq3-server-abi-ml-11838474"></a>
### svEntityLayout

```ml
function svEntityLayout()
```

Delegate `svEntityLayout` to `mq3.server.abi.layout` and return its result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L55)

<a id="function-function-mq3-server-abi-tosnapshotentity-function-tosnapshotentity-value-linked-svflags-singleclient-src-mq3-server-abi-ml-999379851"></a>
### toSnapshotEntity

```ml
function toSnapshotEntity(value, linked, svFlags, singleClient)
```

Productive projections. They deliberately preserve the canonical fixed-size rings while adapting the managed representation used by execution modules.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `baseline`, `lastCluster`, `areanum`, `areanum2`. |
| `linked` | `dynamic` | — | Linked passed as `linked` to `mq3.server.snapshot_build.snapshotEntity`. |
| `svFlags` | `dynamic` | — | Sv flags passed as `svFlags` to `mq3.server.snapshot_build.snapshotEntity`. |
| `singleClient` | `dynamic` | — | Single client passed as `singleClient` to `mq3.server.snapshot_build.snapshotEntity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L173)

<a id="function-function-mq3-server-abi-tosnapshotframe-function-tosnapshotframe-value-src-mq3-server-abi-ml-2142218043"></a>
### toSnapshotFrame

```ml
function toSnapshotFrame(value)
```

Compute to snapshot frame in server.abi; the normal completion returns `result`.

Validation failures include `server ABI: missing clientSnapshot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `areabytes`, `areabits`, `ps`, `numEntities`, `firstEntity`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L181)

<a id="function-function-mq3-server-abi-tosnapshotserver-function-tosnapshotserver-mapstate-persistentstate-padpackets-maxrate-lanforcerate-src-mq3-server-abi-ml-1733708259"></a>
### toSnapshotServer

```ml
function toSnapshotServer(mapState, persistentState, padPackets, maxRate, lanForceRate)
```

Compute to snapshot server in server.abi; the normal completion returns `result`.

Validation failures include `server ABI: invalid snapshot server`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mapState` | `dynamic` | — | Record exposing `svEntities`. |
| `persistentState` | `dynamic` | — | Record exposing `numSnapshotEntities`, `time`, `snapshotEntities`, `snapFlagServerBit`, `nextSnapshotEntities`. |
| `padPackets` | `dynamic` | — | Pad packets operand used by `toSnapshotServer`; its reads are shown in the implementation. |
| `maxRate` | `dynamic` | — | Max rate operand used by `toSnapshotServer`; its reads are shown in the implementation. |
| `lanForceRate` | `dynamic` | — | Lan force rate operand used by `toSnapshotServer`; its reads are shown in the implementation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/abi.ml#L193)
