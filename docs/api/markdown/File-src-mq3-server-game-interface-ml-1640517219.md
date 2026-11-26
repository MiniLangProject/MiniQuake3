# `src/mq3/server/game_interface.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.server.game_interface`](Package-mq3-server-game-interface-314093487.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)

## Declarations

<a id="function-function-mq3-server-game-interface-floatasint-function-floatasint-value-src-mq3-server-game-interface-ml-1314832645"></a>
### FloatAsInt

```ml
function FloatAsInt(value)
```

Return `mq3.compat.numeric.i32(n.floatBits(value))` from `server.game_interface.FloatAsInt`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Floating-point value to narrow and reinterpret. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L37)

<a id="constant-constant-mq3-server-game-interface-max-gentities-const-max-gentities-1024-src-mq3-server-game-interface-ml-1980557458"></a>
### MAX_GENTITIES

```ml
const MAX_GENTITIES = 1024
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L11)

<a id="function-function-mq3-server-game-interface-requirelayout-function-requirelayout-value-src-mq3-server-game-interface-ml-1186236999"></a>
### requireLayout

```ml
function requireLayout(value)
```

Compute require layout in server.game_interface; the normal completion returns `value`.

Validation failures include `server game interface: game data is not located`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `gentitySize`, `gameClientSize`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L64)

<a id="function-function-mq3-server-game-interface-services-function-services-context-src-mq3-server-game-interface-ml-1809242439"></a>
### services

```ml
function services(context)
```

Create `mq3.server.game_interface.Services` with errorFn=void; printFn=void; sendServerCommandFn=void; dropClientFn=void; 7 further fields.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — | Initial `context` field stored in the returned or constructed `mq3.server.game_interface.Services` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L33)

- [mq3.server.game_interface.Services](Type-mq3-server-game-interface-services-1529200671.md) — struct
<a id="constant-constant-mq3-server-game-interface-ss-dead-const-ss-dead-0-src-mq3-server-game-interface-ml-1548728809"></a>
### SS_DEAD

```ml
const SS_DEAD = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L8)

<a id="constant-constant-mq3-server-game-interface-ss-game-const-ss-game-2-src-mq3-server-game-interface-ml-2078206495"></a>
### SS_GAME

```ml
const SS_GAME = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L10)

<a id="constant-constant-mq3-server-game-interface-ss-loading-const-ss-loading-1-src-mq3-server-game-interface-ml-491855776"></a>
### SS_LOADING

```ml
const SS_LOADING = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L9)

<a id="function-function-mq3-server-game-interface-state-function-state-maxclients-src-mq3-server-game-interface-ml-803760406"></a>
### state

```ml
function state(maxClients)
```

Compute state in server.game_interface; the normal completion returns `State(0, 0, 0, 0, 0, maxClients, SS_DEAD, "", clients, entities)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxClients` | `dynamic` | — | Initial `maxClients` field stored in the returned or constructed `mq3.server.game_interface.State` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L23)

- [mq3.server.game_interface.State](Type-mq3-server-game-interface-state-540958212.md) — struct
<a id="function-function-mq3-server-game-interface-sv-adjustareaportalstate-function-sv-adjustareaportalstate-value-entitynumber-open-host-src-mq3-server-game-interface-ml-1196226157"></a>
### SV_AdjustAreaPortalState

```ml
function SV_AdjustAreaPortalState(value, entityNumber, open, host)
```

Test adjust area portal state in server.game_interface; the normal completion returns `true`.

Validation failures include `server game interface: missing area portal service`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.server.game_interface.SV_SvEntityForGentity`. |
| `entityNumber` | `dynamic` | — | Entity number passed as `entityNumber` to `mq3.server.game_interface.SV_SvEntityForGentity`. |
| `open` | `dynamic` | — | Open used in `host.adjustAreaPortalFn(host.context, entity.areanum, entity.areanum2, open)`. |
| `host` | `dynamic` | — | Record exposing `adjustAreaPortalFn`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L189)

<a id="function-function-mq3-server-game-interface-sv-gameclientnum-function-sv-gameclientnum-value-number-src-mq3-server-game-interface-ml-422897704"></a>
### SV_GameClientNum

```ml
function SV_GameClientNum(value, number)
```

Compute game client num in server.game_interface; the normal completion returns `(value.gameClients + (value.gameClientSize * number))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `gameClients`, `gameClientSize`. |
| `number` | `dynamic` | — | Number used in `(value.gameClientSize * number)` and `(value.gameClients + (value.gameClientSize * number))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L83)

<a id="function-function-mq3-server-game-interface-sv-gamecommand-function-sv-gamecommand-value-host-src-mq3-server-game-interface-ml-1631773043"></a>
### SV_GameCommand

```ml
function SV_GameCommand(value, host)
```

Compute game command in server.game_interface; the normal completion returns `host.gameCommandFn(host.context)`.

Validation failures include `server game interface: missing game command service`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `serverState`. |
| `host` | `dynamic` | — | Record exposing `gameCommandFn`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L200)

<a id="function-function-mq3-server-game-interface-sv-gamedropclient-function-sv-gamedropclient-value-clientnum-reason-host-src-mq3-server-game-interface-ml-1340046830"></a>
### SV_GameDropClient

```ml
function SV_GameDropClient(value, clientNum, reason, host)
```

Test game drop client in server.game_interface; the normal completion returns `true`.

Validation failures include `server game interface: missing drop service`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `maxClients`. |
| `clientNum` | `dynamic` | — | Client num used in `(clientNum < 0)` and `(clientNum >= value.maxClients)`. |
| `reason` | `dynamic` | — | Reason used in `host.dropClientFn(host.context, clientNum, reason)`. |
| `host` | `dynamic` | — | Record exposing `dropClientFn`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L124)

<a id="function-function-mq3-server-game-interface-sv-gameerror-function-sv-gameerror-host-text-src-mq3-server-game-interface-ml-35851695"></a>
### SV_GameError

```ml
function SV_GameError(host, text)
```

Compute game error in server.game_interface; the normal completion returns `error(7340, text)`.

Validation failures include `server game interface: missing services`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `errorFn`, `context`. |
| `text` | `dynamic` | — | Text used in `error(7340, text)` and `host.errorFn(host.context, text)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L44)

<a id="function-function-mq3-server-game-interface-sv-gameprint-function-sv-gameprint-host-text-src-mq3-server-game-interface-ml-1418268043"></a>
### SV_GamePrint

```ml
function SV_GamePrint(host, text)
```

Compute game print in server.game_interface.

Validation failures include `server game interface: missing services`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — | Record exposing `printFn`, `context`. |
| `text` | `dynamic` | — | Text used in `host.printFn(host.context, text)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L54)

<a id="function-function-mq3-server-game-interface-sv-gamesendservercommand-function-sv-gamesendservercommand-value-clientnum-text-host-src-mq3-server-game-interface-ml-209199533"></a>
### SV_GameSendServerCommand

```ml
function SV_GameSendServerCommand(value, clientNum, text, host)
```

Test game send server command in server.game_interface; the normal completion returns `true`.

Validation failures include `server game interface: missing send service`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `maxClients`. |
| `clientNum` | `dynamic` | — | Client num used in `(clientNum < 0)` and `(clientNum != - 1)`. |
| `text` | `dynamic` | — | Text used in `host.sendServerCommandFn(host.context, clientNum, text)`. |
| `host` | `dynamic` | — | Record exposing `sendServerCommandFn`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L112)

<a id="function-function-mq3-server-game-interface-sv-gentityforsventity-function-sv-gentityforsventity-value-serverentity-src-mq3-server-game-interface-ml-177123691"></a>
### SV_GEntityForSvEntity

```ml
function SV_GEntityForSvEntity(value, serverEntity)
```

Compute g entity for sv entity in server.game_interface; the normal completion returns `SV_GentityNum(value, serverEntity.number)`.

Validation failures include `SV_GEntityForSvEntity: missing svEnt`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as `value` to `mq3.server.game_interface.SV_GentityNum`. |
| `serverEntity` | `dynamic` | — | Record exposing `number`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L100)

<a id="function-function-mq3-server-game-interface-sv-gentitynum-function-sv-gentitynum-value-number-src-mq3-server-game-interface-ml-2079897400"></a>
### SV_GentityNum

```ml
function SV_GentityNum(value, number)
```

Compute gentity num in server.game_interface; the normal completion returns `(value.gentities + (value.gentitySize * number))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `gentities`, `gentitySize`. |
| `number` | `dynamic` | — | Number used in `(value.gentitySize * number)` and `(value.gentities + (value.gentitySize * number))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L77)

<a id="function-function-mq3-server-game-interface-sv-getserverinfo-function-sv-getserverinfo-value-buffersize-src-mq3-server-game-interface-ml-1616540730"></a>
### SV_GetServerinfo

```ml
function SV_GetServerinfo(value, bufferSize)
```

Get serverinfo in server.game_interface; the normal completion returns `decode(slice(encoded, 0, count))`.

Validation failures include `SV_GetServerinfo: bufferSize < 1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `serverInfo`. |
| `bufferSize` | `dynamic` | — | Buffer size used in `(bufferSize < 1)` and `(bufferSize - 1)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L135)

<a id="function-function-mq3-server-game-interface-sv-getusercmd-function-sv-getusercmd-value-clientnum-src-mq3-server-game-interface-ml-522523078"></a>
### SV_GetUsercmd

```ml
function SV_GetUsercmd(value, clientNum)
```

Get usercmd in server.game_interface; the normal completion returns `value.clients[clientNum]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `maxClients`, `clients`. |
| `clientNum` | `dynamic` | — | Zero-based index into `value.clients`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L159)

<a id="function-function-mq3-server-game-interface-sv-inpvsignoreportals-function-sv-inpvsignoreportals-p1-p2-host-src-mq3-server-game-interface-ml-1961146899"></a>
### SV_inPVSIgnorePortals

```ml
function SV_inPVSIgnorePortals(p1, p2, host)
```

Test in pvs ignore portals in server.game_interface; the normal completion returns `true`.

Validation failures include `server game interface: missing PVS service`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p1` | `dynamic` | — | P 1 used in `host.pointLeafnumFn(host.context, p1)`. |
| `p2` | `dynamic` | — | P 2 used in `host.pointLeafnumFn(host.context, p2)`. |
| `host` | `dynamic` | — | Record exposing `pointLeafnumFn`, `leafClusterFn`, `clusterPvsFn`, `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L170)

<a id="function-function-mq3-server-game-interface-sv-locategamedata-function-sv-locategamedata-value-gentities-numgentities-sizeofgentity-clients-sizeofgameclient-src-mq3-server-game-interface-ml-1240975442"></a>
### SV_LocateGameData

```ml
function SV_LocateGameData(value, gentities, numGEntities, sizeofGEntity, clients, sizeofGameClient)
```

Update `value.gentities`, `value.gentitySize`, `value.numEntities`, `value.gameClients` in server.game_interface.

Validation failures include `server game interface: invalid game data layout`.
Direct state writes: `value.gentities`, `value.gentitySize`, `value.numEntities`, `value.gameClients`, `value.gameClientSize`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Updated in place: `gentities`, `gentitySize`, `numEntities`, `gameClients`, `gameClientSize`. |
| `gentities` | `dynamic` | — | Gentities operand used by `SV_LocateGameData`; its reads are shown in the implementation. |
| `numGEntities` | `dynamic` | — | Num g entities used in `(numGEntities < 0)` and `((value == void) or (numGEntities < 0))`. |
| `sizeofGEntity` | `dynamic` | — | Sizeof g entity used in `(sizeofGEntity <= 0)` and `(((value == void) or (numGEntities < 0)) or (sizeofGEntity <= 0))`. |
| `clients` | `dynamic` | — | Clients operand used by `SV_LocateGameData`; its reads are shown in the implementation. |
| `sizeofGameClient` | `dynamic` | — | Sizeof game client used in `(sizeofGameClient <= 0)` and `((((value == void) or (numGEntities < 0)) or (sizeofGEntity <= 0)) or (sizeofGameClient <= 0))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L151)

<a id="function-function-mq3-server-game-interface-sv-numforgentity-function-sv-numforgentity-value-address-src-mq3-server-game-interface-ml-1519455021"></a>
### SV_NumForGentity

```ml
function SV_NumForGentity(value, address)
```

Compute num for gentity in server.game_interface; the normal completion returns `((address - value.gentities) / value.gentitySize)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `gentities`, `gentitySize`. |
| `address` | `dynamic` | — | Address used in `(address - value.gentities)` and `((address - value.gentities) / value.gentitySize)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L71)

<a id="function-function-mq3-server-game-interface-sv-sventityforgentity-function-sv-sventityforgentity-value-entitynumber-src-mq3-server-game-interface-ml-981619413"></a>
### SV_SvEntityForGentity

```ml
function SV_SvEntityForGentity(value, entityNumber)
```

Compute sv entity for gentity in server.game_interface; the normal completion returns `value.svEntities[entityNumber]`.

Validation failures include `SV_SvEntityForGentity: bad gEnt`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Record exposing `svEntities`. |
| `entityNumber` | `dynamic` | — | Zero-based index into `value.svEntities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L91)

<a id="function-function-mq3-server-game-interface-sventity-function-sventity-number-src-mq3-server-game-interface-ml-985279479"></a>
### svEntity

```ml
function svEntity(number)
```

Create `mq3.server.game_interface.SvEntity` with number=number; areanum=- 1; areanum2=- 1.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — | Initial `number` field stored in the returned or constructed `mq3.server.game_interface.SvEntity` record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/game_interface.ml#L17)

- [mq3.server.game_interface.SvEntity](Type-mq3-server-game-interface-sventity-1340921889.md) — struct
