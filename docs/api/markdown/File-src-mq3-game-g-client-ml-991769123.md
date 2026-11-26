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
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-g-client-bodysink-function-bodysink-level-ent-src-mq3-game-g-client-ml-1334668873"></a>
### BodySink

```ml
function BodySink(level, ent)
```

Forward `BodySink` to `mq3.game.bodies.sink` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `timestamp`, `physicsObject`, `nextthink` and `s`. May update `ent.physicsObject`, `ent.nextthink` and `ent.s.pos.trBase[2]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_client.ml#L74)

<a id="function-function-mq3-game-g-client-clientbegin-function-clientbegin-level-clientnum-src-mq3-game-g-client-ml-1558184357"></a>
### ClientBegin

```ml
function ClientBegin(level, clientNum)
```

Forward `ClientBegin` to `mq3.game.client_spawn.clientBegin` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clients`, `spawner`, `playerDieFn`, `entities` and `time` and related fields. |
| `clientNum` | `dynamic` | — | Client slot number. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_client.ml#L134)

<a id="function-function-mq3-game-g-client-clientcleanname-function-clientcleanname-input-outsize-src-mq3-game-g-client-ml-414627389"></a>
### ClientCleanName

```ml
function ClientCleanName(input, outSize)
```

Forward `ClientCleanName` to `mq3.game.client_info.cleanName` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `input` | `dynamic` | — | Text to parse, format or deliver. |
| `outSize` | `dynamic` | — | Maximum number of entries to allocate or retain. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_client.ml#L120)

<a id="function-function-mq3-game-g-client-clientconnect-function-clientconnect-level-clientnum-firsttime-isbot-src-mq3-game-g-client-ml-1575828959"></a>
### ClientConnect

```ml
function ClientConnect(level, clientNum, firstTime, isBot)
```

Forward `ClientConnect` to `mq3.game.client_connect.connect` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities`, `userinfoFn`, `filterPacketFn`, `cvarMaintenance` and `clients` and related fields. |
| `clientNum` | `dynamic` | — | Client slot number. |
| `firstTime` | `dynamic` | — | Value used by `connect` in `if firstTime or level.newSession then sessions.initClient(level,client,info) end if`. |
| `isBot` | `dynamic` | — | Value used by `connect` in `if isBot then`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_client.ml#L130)

<a id="function-function-mq3-game-g-client-clientdisconnect-function-clientdisconnect-level-clientnum-src-mq3-game-g-client-ml-1924769177"></a>
### ClientDisconnect

```ml
function ClientDisconnect(level, clientNum)
```

Forward `ClientDisconnect` to `mq3.game.client_disconnect.disconnect` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `removeQueuedBotBeginFn`, `lifecycleState`, `entities`, `maxclients` and `clients` and related fields. May update `level.clients[winner].wins` in place. |
| `clientNum` | `dynamic` | — | Client slot number. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_client.ml#L142)

<a id="function-function-mq3-game-g-client-clientspawn-function-clientspawn-level-ent-src-mq3-game-g-client-ml-1291618029"></a>
### ClientSpawn

```ml
function ClientSpawn(level, ent)
```

Forward `ClientSpawn` to `mq3.game.client_spawn.spawn` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clients`, `spawner`, `playerDieFn`, `respawnFn` and `clientBeginFn` and related fields. May update `level.playerDieFn`, `level.respawnFn` and `level.clientBeginFn` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `slot`, `client`, `s`, `takedamage` and `inuse` and related fields. May update `ent.s.eFlags`, `ent.s.groundEntityNum` and `ent.client` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_client.ml#L138)

<a id="function-function-mq3-game-g-client-clientuserinfochanged-function-clientuserinfochanged-level-clientnum-src-mq3-game-g-client-ml-1239412533"></a>
### ClientUserinfoChanged

```ml
function ClientUserinfoChanged(level, clientNum)
```

Forward `ClientUserinfoChanged` to `mq3.game.client_info.changed` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities`, `userinfoFn`, `serverCommandFn`, `spawner` and `gameLogFn`. |
| `clientNum` | `dynamic` | — | Client slot number. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_client.ml#L124)

<a id="function-function-mq3-game-g-client-copytobodyque-function-copytobodyque-level-ent-src-mq3-game-g-client-ml-1772990187"></a>
### CopyToBodyQue

```ml
function CopyToBodyQue(level, ent)
```

Forward `CopyToBodyQue` to `mq3.game.bodies.copyToQueue` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene`, `bodyQue`, `bodyQueIndex` and `time`. May update `level.bodyQueIndex` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `s`, `client`, `r` and `health`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_client.ml#L78)

<a id="function-function-mq3-game-g-client-initbodyque-function-initbodyque-level-src-mq3-game-g-client-ml-1797263356"></a>
### InitBodyQue

```ml
function InitBodyQue(level)
```

Forward `InitBodyQue` to `mq3.game.bodies.initQueue` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `bodyQueIndex` and `bodyQue`. May update `level.bodyQueIndex`, `level.bodyQue` and `level.bodyQue[i]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_client.ml#L70)

<a id="function-function-mq3-game-g-client-pickteam-function-pickteam-level-ignoreclientnum-src-mq3-game-g-client-ml-1416885647"></a>
### PickTeam

```ml
function PickTeam(level, ignoreClientNum)
```

Forward `PickTeam` to `mq3.game.client_info.pickTeam` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `teamScores`. |
| `ignoreClientNum` | `dynamic` | — | Value used by `teamCount` in `if slot == ignoreClientNum then continue end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_client.ml#L100)

<a id="function-function-mq3-game-g-client-respawn-function-respawn-level-ent-src-mq3-game-g-client-ml-655183857"></a>
### respawn

```ml
function respawn(level, ent)
```

Forward `respawn` to `mq3.game.deaths.respawn` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `playerDieFn`. May update `level.playerDieFn` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `client` and `s`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_client.ml#L86)

<a id="function-function-mq3-game-g-client-selectinitialspawnpoint-function-selectinitialspawnpoint-level-origin-angles-src-mq3-game-g-client-ml-1046500642"></a>
### SelectInitialSpawnPoint

```ml
function SelectInitialSpawnPoint(level, origin, angles)
```

Forward `SelectInitialSpawnPoint` to `mq3.game.player_spawns.initial` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `angles` | `dynamic` | — | Pitch, yaw and roll angles in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_client.ml#L61)

<a id="function-function-mq3-game-g-client-selectnearestdeathmatchspawnpoint-function-selectnearestdeathmatchspawnpoint-level-point-src-mq3-game-g-client-ml-38176078"></a>
### SelectNearestDeathmatchSpawnPoint

```ml
function SelectNearestDeathmatchSpawnPoint(level, point)
```

Forward `SelectNearestDeathmatchSpawnPoint` to `mq3.game.player_spawns.nearest` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_client.ml#L41)

<a id="function-function-mq3-game-g-client-selectrandomdeathmatchspawnpoint-function-selectrandomdeathmatchspawnpoint-level-src-mq3-game-g-client-ml-818154994"></a>
### SelectRandomDeathmatchSpawnPoint

```ml
function SelectRandomDeathmatchSpawnPoint(level)
```

Forward `SelectRandomDeathmatchSpawnPoint` to `mq3.game.player_spawns.randomDeathmatch` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_client.ml#L44)

<a id="function-function-mq3-game-g-client-selectrandomfurthestspawnpoint-function-selectrandomfurthestspawnpoint-level-avoidpoint-origin-angles-src-mq3-game-g-client-ml-1306989077"></a>
### SelectRandomFurthestSpawnPoint

```ml
function SelectRandomFurthestSpawnPoint(level, avoidPoint, origin, angles)
```

Forward `SelectRandomFurthestSpawnPoint` to `mq3.game.player_spawns.furthest` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |
| `avoidPoint` | `dynamic` | — | Three-component point used by the geometric query. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `angles` | `dynamic` | — | Pitch, yaw and roll angles in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_client.ml#L50)

<a id="function-function-mq3-game-g-client-selectspawnpoint-function-selectspawnpoint-level-avoidpoint-origin-angles-src-mq3-game-g-client-ml-231952285"></a>
### SelectSpawnPoint

```ml
function SelectSpawnPoint(level, avoidPoint, origin, angles)
```

Forward `SelectSpawnPoint` to `mq3.game.player_spawns.selectSpawn` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |
| `avoidPoint` | `dynamic` | — | Three-component point used by the geometric query. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `angles` | `dynamic` | — | Pitch, yaw and roll angles in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_client.ml#L56)

<a id="function-function-mq3-game-g-client-selectspectatorspawnpoint-function-selectspectatorspawnpoint-level-origin-angles-src-mq3-game-g-client-ml-416662440"></a>
### SelectSpectatorSpawnPoint

```ml
function SelectSpectatorSpawnPoint(level, origin, angles)
```

Forward `SelectSpectatorSpawnPoint` to `mq3.game.player_spawns.spectator` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `intermission_origin` and `intermission_angle`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `angles` | `dynamic` | — | Pitch, yaw and roll angles in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_client.ml#L66)

<a id="function-function-mq3-game-g-client-setclientviewangle-function-setclientviewangle-ent-angle-src-mq3-game-g-client-ml-215473286"></a>
### SetClientViewAngle

```ml
function SetClientViewAngle(ent, angle)
```

Forward `SetClientViewAngle` to `mq3.game.teleport.setClientViewAngle` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — | Game entity; accesses `client` and `s`. May update `ent.client.ps.delta_angles[axis]`, `ent.s.angles` and `ent.client.ps.viewangles` in place. |
| `angle` | `dynamic` | — | Pitch, yaw and roll angles in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_client.ml#L82)

<a id="function-function-mq3-game-g-client-skin-function-skin-model-skinname-src-mq3-game-g-client-ml-642272575"></a>
### skin

```ml
function skin(model, skinName)
```

The original ForceClientSkin helper is commented out in the pinned source, but the inventory intentionally retains its parsed `skin` parameter.  Keep the exact useful transformation available without mutating caller storage.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `model` | `dynamic` | — | Value passed as argument 1 to `bytes`. |
| `skinName` | `dynamic` | — | Operand used to evaluate the returned expression `model+"/"+skinName`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_client.ml#L107)

<a id="function-function-mq3-game-g-client-sp-info-player-deathmatch-function-sp-info-player-deathmatch-level-ent-src-mq3-game-g-client-ml-1041086517"></a>
### SP_info_player_deathmatch

```ml
function SP_info_player_deathmatch(level, ent)
```

Forward `SP_info_player_deathmatch` to `mq3.game.spawn_functions.playerDeathmatch` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `flags`. May update `ent.flags` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_client.ml#L21)

<a id="function-function-mq3-game-g-client-sp-info-player-intermission-function-sp-info-player-intermission-level-ent-src-mq3-game-g-client-ml-643827931"></a>
### SP_info_player_intermission

```ml
function SP_info_player_intermission(level, ent)
```

Return `void` for `SP_info_player_intermission`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Not read by this implementation; retained in the `SP_info_player_intermission` signature. |
| `ent` | `dynamic` | — | Not read by this implementation; retained in the `SP_info_player_intermission` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_client.ml#L32)

<a id="function-function-mq3-game-g-client-sp-info-player-start-function-sp-info-player-start-level-ent-src-mq3-game-g-client-ml-303014645"></a>
### SP_info_player_start

```ml
function SP_info_player_start(level, ent)
```

Set `ent.classname` to `"info_player_deathmatch"` in `mq3.game.g_client.SP_info_player_start`. Return paths include `spawnFunctions.playerDeathmatch(level,ent)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `classname`. May update `ent.classname` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_client.ml#L25)

<a id="function-function-mq3-game-g-client-spotwouldtelefrag-function-spotwouldtelefrag-level-spot-src-mq3-game-g-client-ml-360117480"></a>
### SpotWouldTelefrag

```ml
function SpotWouldTelefrag(level, spot)
```

Forward `SpotWouldTelefrag` to `mq3.game.player_spawns.wouldTelefrag` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene` and `entities`. |
| `spot` | `dynamic` | — | Spot record; accesses `s`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_client.ml#L37)

<a id="function-function-mq3-game-g-client-teamcount-function-teamcount-level-ignoreclientnum-team-src-mq3-game-g-client-ml-1426072030"></a>
### TeamCount

```ml
function TeamCount(level, ignoreClientNum, team)
```

Forward `TeamCount` to `mq3.game.tournament.teamCount` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `maxclients` and `clients`. |
| `ignoreClientNum` | `dynamic` | — | Value used by `teamCount` in `if slot == ignoreClientNum then continue end if`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_client.ml#L92)

<a id="function-function-mq3-game-g-client-teamleader-function-teamleader-level-team-src-mq3-game-g-client-ml-1191121939"></a>
### TeamLeader

```ml
function TeamLeader(level, team)
```

Forward `TeamLeader` to `mq3.game.client_info.teamLeader` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `maxclients` and `clients`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_client.ml#L96)

<a id="function-function-mq3-game-g-client-trap-dropclient-function-trap-dropclient-level-clientnum-reason-src-mq3-game-g-client-ml-857819589"></a>
### trap_DropClient

```ml
function trap_DropClient(level, clientNum, reason)
```

Game logic never calls ClientDisconnect directly when kicking a client. Keep the syscall boundary explicit so the engine performs its housekeeping and calls ClientDisconnect back through vmMain in the original order.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `dropClientFn`. |
| `clientNum` | `dynamic` | — | Client slot number. |
| `reason` | `dynamic` | — | Reason text recorded with the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_client.ml#L150)
