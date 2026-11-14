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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L26)

<a id="constant-constant-mq3-server-game-interface-max-gentities-const-max-gentities-1024-src-mq3-server-game-interface-ml-1980557458"></a>
### MAX_GENTITIES

```ml
const MAX_GENTITIES = 1024
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L11)

<a id="function-function-mq3-server-game-interface-requirelayout-function-requirelayout-value-src-mq3-server-game-interface-ml-1186236999"></a>
### requireLayout

```ml
function requireLayout(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L39)

<a id="function-function-mq3-server-game-interface-services-function-services-context-src-mq3-server-game-interface-ml-1809242439"></a>
### services

```ml
function services(context)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L24)

- [mq3.server.game_interface.Services](Type-mq3-server-game-interface-services-1529200671.md) — struct
<a id="constant-constant-mq3-server-game-interface-ss-dead-const-ss-dead-0-src-mq3-server-game-interface-ml-1548728809"></a>
### SS_DEAD

```ml
const SS_DEAD = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L8)

<a id="constant-constant-mq3-server-game-interface-ss-game-const-ss-game-2-src-mq3-server-game-interface-ml-2078206495"></a>
### SS_GAME

```ml
const SS_GAME = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L10)

<a id="constant-constant-mq3-server-game-interface-ss-loading-const-ss-loading-1-src-mq3-server-game-interface-ml-491855776"></a>
### SS_LOADING

```ml
const SS_LOADING = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L9)

<a id="function-function-mq3-server-game-interface-state-function-state-maxclients-src-mq3-server-game-interface-ml-803760406"></a>
### state

```ml
function state(maxClients)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `maxClients` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L17)

- [mq3.server.game_interface.State](Type-mq3-server-game-interface-state-540958212.md) — struct
<a id="function-function-mq3-server-game-interface-sv-adjustareaportalstate-function-sv-adjustareaportalstate-value-entitynumber-open-host-src-mq3-server-game-interface-ml-1196226157"></a>
### SV_AdjustAreaPortalState

```ml
function SV_AdjustAreaPortalState(value, entityNumber, open, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `entityNumber` | `dynamic` | — |  |
| `open` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L100)

<a id="function-function-mq3-server-game-interface-sv-gameclientnum-function-sv-gameclientnum-value-number-src-mq3-server-game-interface-ml-422897704"></a>
### SV_GameClientNum

```ml
function SV_GameClientNum(value, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L49)

<a id="function-function-mq3-server-game-interface-sv-gamecommand-function-sv-gamecommand-value-host-src-mq3-server-game-interface-ml-1631773043"></a>
### SV_GameCommand

```ml
function SV_GameCommand(value, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L106)

<a id="function-function-mq3-server-game-interface-sv-gamedropclient-function-sv-gamedropclient-value-clientnum-reason-host-src-mq3-server-game-interface-ml-1340046830"></a>
### SV_GameDropClient

```ml
function SV_GameDropClient(value, clientNum, reason, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L66)

<a id="function-function-mq3-server-game-interface-sv-gameerror-function-sv-gameerror-host-text-src-mq3-server-game-interface-ml-35851695"></a>
### SV_GameError

```ml
function SV_GameError(host, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L28)

<a id="function-function-mq3-server-game-interface-sv-gameprint-function-sv-gameprint-host-text-src-mq3-server-game-interface-ml-1418268043"></a>
### SV_GamePrint

```ml
function SV_GamePrint(host, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `host` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L33)

<a id="function-function-mq3-server-game-interface-sv-gamesendservercommand-function-sv-gamesendservercommand-value-clientnum-text-host-src-mq3-server-game-interface-ml-209199533"></a>
### SV_GameSendServerCommand

```ml
function SV_GameSendServerCommand(value, clientNum, text, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L61)

<a id="function-function-mq3-server-game-interface-sv-gentityforsventity-function-sv-gentityforsventity-value-serverentity-src-mq3-server-game-interface-ml-177123691"></a>
### SV_GEntityForSvEntity

```ml
function SV_GEntityForSvEntity(value, serverEntity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `serverEntity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L56)

<a id="function-function-mq3-server-game-interface-sv-gentitynum-function-sv-gentitynum-value-number-src-mq3-server-game-interface-ml-2079897400"></a>
### SV_GentityNum

```ml
function SV_GentityNum(value, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L46)

<a id="function-function-mq3-server-game-interface-sv-getserverinfo-function-sv-getserverinfo-value-buffersize-src-mq3-server-game-interface-ml-1616540730"></a>
### SV_GetServerinfo

```ml
function SV_GetServerinfo(value, bufferSize)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `bufferSize` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L72)

<a id="function-function-mq3-server-game-interface-sv-getusercmd-function-sv-getusercmd-value-clientnum-src-mq3-server-game-interface-ml-522523078"></a>
### SV_GetUsercmd

```ml
function SV_GetUsercmd(value, clientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L83)

<a id="function-function-mq3-server-game-interface-sv-inpvsignoreportals-function-sv-inpvsignoreportals-p1-p2-host-src-mq3-server-game-interface-ml-1961146899"></a>
### SV_inPVSIgnorePortals

```ml
function SV_inPVSIgnorePortals(p1, p2, host)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `p1` | `dynamic` | — |  |
| `p2` | `dynamic` | — |  |
| `host` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L88)

<a id="function-function-mq3-server-game-interface-sv-locategamedata-function-sv-locategamedata-value-gentities-numgentities-sizeofgentity-clients-sizeofgameclient-src-mq3-server-game-interface-ml-1240975442"></a>
### SV_LocateGameData

```ml
function SV_LocateGameData(value, gentities, numGEntities, sizeofGEntity, clients, sizeofGameClient)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `gentities` | `dynamic` | — |  |
| `numGEntities` | `dynamic` | — |  |
| `sizeofGEntity` | `dynamic` | — |  |
| `clients` | `dynamic` | — |  |
| `sizeofGameClient` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L78)

<a id="function-function-mq3-server-game-interface-sv-numforgentity-function-sv-numforgentity-value-address-src-mq3-server-game-interface-ml-1519455021"></a>
### SV_NumForGentity

```ml
function SV_NumForGentity(value, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L43)

<a id="function-function-mq3-server-game-interface-sv-sventityforgentity-function-sv-sventityforgentity-value-entitynumber-src-mq3-server-game-interface-ml-981619413"></a>
### SV_SvEntityForGentity

```ml
function SV_SvEntityForGentity(value, entityNumber)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `entityNumber` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L52)

<a id="function-function-mq3-server-game-interface-sventity-function-sventity-number-src-mq3-server-game-interface-ml-985279479"></a>
### svEntity

```ml
function svEntity(number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/server/game_interface.ml#L14)

- [mq3.server.game_interface.SvEntity](Type-mq3-server-game-interface-sventity-1340921889.md) — struct
