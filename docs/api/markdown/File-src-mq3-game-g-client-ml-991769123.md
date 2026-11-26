# `src/mq3/game/g_client.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.g_client`](Package-mq3-game-g-client-228926071.md)

Reachable from entry: **no**

## Imports

- `mq3/game/bodies.ml` as `bodies` → [src/mq3/game/bodies.ml](File-src-mq3-game-bodies-ml-247011888.md)
- `mq3/game/client_connect.ml` as `clientConnect` → [src/mq3/game/client_connect.ml](File-src-mq3-game-client-connect-ml-341852694.md)
- `mq3/game/client_disconnect.ml` as `clientDisconnect` → [src/mq3/game/client_disconnect.ml](File-src-mq3-game-client-disconnect-ml-1192618936.md)
- `mq3/game/client_info.ml` as `clientInfo` → [src/mq3/game/client_info.ml](File-src-mq3-game-client-info-ml-669662398.md)
- `mq3/game/client_spawn.ml` as `clientSpawn` → [src/mq3/game/client_spawn.ml](File-src-mq3-game-client-spawn-ml-1352690125.md)
- `mq3/game/deaths.ml` as `deaths` → [src/mq3/game/deaths.ml](File-src-mq3-game-deaths-ml-761874289.md)
- `mq3/game/player_spawns.ml` as `spawns` → [src/mq3/game/player_spawns.ml](File-src-mq3-game-player-spawns-ml-1960128696.md)
- `mq3/game/spawn_functions.ml` as `spawnFunctions` → [src/mq3/game/spawn_functions.ml](File-src-mq3-game-spawn-functions-ml-1306159949.md)
- `mq3/game/teleport.ml` as `teleport` → [src/mq3/game/teleport.ml](File-src-mq3-game-teleport-ml-594448221.md)
- `mq3/game/tournament.ml` as `tournament` → [src/mq3/game/tournament.ml](File-src-mq3-game-tournament-ml-590125009.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-g-client-bodysink-function-bodysink-level-ent-src-mq3-game-g-client-ml-1334668873"></a>
### BodySink

```ml
function BodySink(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_client.ml#L34)

<a id="function-function-mq3-game-g-client-clientbegin-function-clientbegin-level-clientnum-src-mq3-game-g-client-ml-1558184357"></a>
### ClientBegin

```ml
function ClientBegin(level, clientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_client.ml#L59)

<a id="function-function-mq3-game-g-client-clientcleanname-function-clientcleanname-input-outsize-src-mq3-game-g-client-ml-414627389"></a>
### ClientCleanName

```ml
function ClientCleanName(input, outSize)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — |  |
| `outSize` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_client.ml#L56)

<a id="function-function-mq3-game-g-client-clientconnect-function-clientconnect-level-clientnum-firsttime-isbot-src-mq3-game-g-client-ml-1575828959"></a>
### ClientConnect

```ml
function ClientConnect(level, clientNum, firstTime, isBot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `firstTime` | `dynamic` | — |  |
| `isBot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_client.ml#L58)

<a id="function-function-mq3-game-g-client-clientdisconnect-function-clientdisconnect-level-clientnum-src-mq3-game-g-client-ml-1924769177"></a>
### ClientDisconnect

```ml
function ClientDisconnect(level, clientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_client.ml#L61)

<a id="function-function-mq3-game-g-client-clientspawn-function-clientspawn-level-ent-src-mq3-game-g-client-ml-1291618029"></a>
### ClientSpawn

```ml
function ClientSpawn(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_client.ml#L60)

<a id="function-function-mq3-game-g-client-clientuserinfochanged-function-clientuserinfochanged-level-clientnum-src-mq3-game-g-client-ml-1239412533"></a>
### ClientUserinfoChanged

```ml
function ClientUserinfoChanged(level, clientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_client.ml#L57)

<a id="function-function-mq3-game-g-client-copytobodyque-function-copytobodyque-level-ent-src-mq3-game-g-client-ml-1772990187"></a>
### CopyToBodyQue

```ml
function CopyToBodyQue(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_client.ml#L35)

<a id="function-function-mq3-game-g-client-initbodyque-function-initbodyque-level-src-mq3-game-g-client-ml-1797263356"></a>
### InitBodyQue

```ml
function InitBodyQue(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_client.ml#L33)

<a id="function-function-mq3-game-g-client-pickteam-function-pickteam-level-ignoreclientnum-src-mq3-game-g-client-ml-1416885647"></a>
### PickTeam

```ml
function PickTeam(level, ignoreClientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ignoreClientNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_client.ml#L41)

<a id="function-function-mq3-game-g-client-respawn-function-respawn-level-ent-src-mq3-game-g-client-ml-655183857"></a>
### respawn

```ml
function respawn(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_client.ml#L37)

<a id="function-function-mq3-game-g-client-selectinitialspawnpoint-function-selectinitialspawnpoint-level-origin-angles-src-mq3-game-g-client-ml-1046500642"></a>
### SelectInitialSpawnPoint

```ml
function SelectInitialSpawnPoint(level, origin, angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_client.ml#L30)

<a id="function-function-mq3-game-g-client-selectnearestdeathmatchspawnpoint-function-selectnearestdeathmatchspawnpoint-level-point-src-mq3-game-g-client-ml-38176078"></a>
### SelectNearestDeathmatchSpawnPoint

```ml
function SelectNearestDeathmatchSpawnPoint(level, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_client.ml#L26)

<a id="function-function-mq3-game-g-client-selectrandomdeathmatchspawnpoint-function-selectrandomdeathmatchspawnpoint-level-src-mq3-game-g-client-ml-818154994"></a>
### SelectRandomDeathmatchSpawnPoint

```ml
function SelectRandomDeathmatchSpawnPoint(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_client.ml#L27)

<a id="function-function-mq3-game-g-client-selectrandomfurthestspawnpoint-function-selectrandomfurthestspawnpoint-level-avoidpoint-origin-angles-src-mq3-game-g-client-ml-1306989077"></a>
### SelectRandomFurthestSpawnPoint

```ml
function SelectRandomFurthestSpawnPoint(level, avoidPoint, origin, angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `avoidPoint` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_client.ml#L28)

<a id="function-function-mq3-game-g-client-selectspawnpoint-function-selectspawnpoint-level-avoidpoint-origin-angles-src-mq3-game-g-client-ml-231952285"></a>
### SelectSpawnPoint

```ml
function SelectSpawnPoint(level, avoidPoint, origin, angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `avoidPoint` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_client.ml#L29)

<a id="function-function-mq3-game-g-client-selectspectatorspawnpoint-function-selectspectatorspawnpoint-level-origin-angles-src-mq3-game-g-client-ml-416662440"></a>
### SelectSpectatorSpawnPoint

```ml
function SelectSpectatorSpawnPoint(level, origin, angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_client.ml#L31)

<a id="function-function-mq3-game-g-client-setclientviewangle-function-setclientviewangle-ent-angle-src-mq3-game-g-client-ml-215473286"></a>
### SetClientViewAngle

```ml
function SetClientViewAngle(ent, angle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — |  |
| `angle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_client.ml#L36)

<a id="function-function-mq3-game-g-client-skin-function-skin-model-skinname-src-mq3-game-g-client-ml-642272575"></a>
### skin

```ml
function skin(model, skinName)
```

The original ForceClientSkin helper is commented out in the pinned source, but the inventory intentionally retains its parsed `skin` parameter.  Keep the exact useful transformation available without mutating caller storage.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — |  |
| `skinName` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_client.ml#L46)

<a id="function-function-mq3-game-g-client-sp-info-player-deathmatch-function-sp-info-player-deathmatch-level-ent-src-mq3-game-g-client-ml-1041086517"></a>
### SP_info_player_deathmatch

```ml
function SP_info_player_deathmatch(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_client.ml#L18)

<a id="function-function-mq3-game-g-client-sp-info-player-intermission-function-sp-info-player-intermission-level-ent-src-mq3-game-g-client-ml-643827931"></a>
### SP_info_player_intermission

```ml
function SP_info_player_intermission(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_client.ml#L23)

<a id="function-function-mq3-game-g-client-sp-info-player-start-function-sp-info-player-start-level-ent-src-mq3-game-g-client-ml-303014645"></a>
### SP_info_player_start

```ml
function SP_info_player_start(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_client.ml#L19)

<a id="function-function-mq3-game-g-client-spotwouldtelefrag-function-spotwouldtelefrag-level-spot-src-mq3-game-g-client-ml-360117480"></a>
### SpotWouldTelefrag

```ml
function SpotWouldTelefrag(level, spot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `spot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_client.ml#L25)

<a id="function-function-mq3-game-g-client-teamcount-function-teamcount-level-ignoreclientnum-team-src-mq3-game-g-client-ml-1426072030"></a>
### TeamCount

```ml
function TeamCount(level, ignoreClientNum, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ignoreClientNum` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_client.ml#L39)

<a id="function-function-mq3-game-g-client-teamleader-function-teamleader-level-team-src-mq3-game-g-client-ml-1191121939"></a>
### TeamLeader

```ml
function TeamLeader(level, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_client.ml#L40)

<a id="function-function-mq3-game-g-client-trap-dropclient-function-trap-dropclient-level-clientnum-reason-src-mq3-game-g-client-ml-857819589"></a>
### trap_DropClient

```ml
function trap_DropClient(level, clientNum, reason)
```

Game logic never calls ClientDisconnect directly when kicking a client. Keep the syscall boundary explicit so the engine performs its housekeeping and calls ClientDisconnect back through vmMain in the original order.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_client.ml#L66)
