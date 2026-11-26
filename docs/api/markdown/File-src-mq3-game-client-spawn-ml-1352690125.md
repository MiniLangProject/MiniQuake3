# `src/mq3/game/client_spawn.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.client_spawn`](Package-mq3-game-client-spawn-1050822633.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `textnum` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/game/bodies.ml` as `bodies` → [src/mq3/game/bodies.ml](File-src-mq3-game-bodies-ml-247011888.md)
- `mq3/game/client_active.ml` as `clientActive` → [src/mq3/game/client_active.ml](File-src-mq3-game-client-active-ml-1919364260.md)
- `mq3/game/client_frame.ml` as `clientFrame` → [src/mq3/game/client_frame.ml](File-src-mq3-game-client-frame-ml-1603528079.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/g_utils.ml` as `gUtils` → [src/mq3/game/g_utils.ml](File-src-mq3-game-g-utils-ml-808912811.md)
- `mq3/game/game_headers.ml` as `headers` → [src/mq3/game/game_headers.ml](File-src-mq3-game-game-headers-ml-1243119809.md)
- `mq3/game/intermission.ml` as `spawnIntermission` → [src/mq3/game/intermission.ml](File-src-mq3-game-intermission-ml-2122930812.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/game/player_spawns.ml` as `spawns` → [src/mq3/game/player_spawns.ml](File-src-mq3-game-player-spawns-ml-1960128696.md)
- `mq3/game/playerstate.ml` as `playerstate` → [src/mq3/game/playerstate.ml](File-src-mq3-game-playerstate-ml-1407876292.md)
- `mq3/game/scores.ml` as `scores` → [src/mq3/game/scores.ml](File-src-mq3-game-scores-ml-660975489.md)
- `mq3/game/snapshot.ml` as `snapshot` → [src/mq3/game/snapshot.ml](File-src-mq3-game-snapshot-ml-1144176980.md)
- `mq3/game/targets.ml` as `targets` → [src/mq3/game/targets.ml](File-src-mq3-game-targets-ml-1419507080.md)
- `mq3/game/teleport.ml` as `teleport` → [src/mq3/game/teleport.ml](File-src-mq3-game-teleport-ml-594448221.md)
- `mq3/shared/info.ml` as `infoStrings` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-client-spawn-cleartransient-function-cleartransient-client-savedping-persistant-eventsequence-src-mq3-game-client-spawn-ml-944664034"></a>
### clearTransient

```ml
function clearTransient(client, savedPing, persistant, eventSequence)
```

Update `client.ps`, `client.ps.ping`, `client.ps.persistant[index]` and `client.ps.eventSequence` and related state during `clearTransient`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — | Client state; accesses `ps`, `readyToExit`, `noclip`, `lastCmdTime` and `buttons` and related fields. May update `client.ps`, `client.ps.ping` and `client.ps.persistant[index]` and additional fields in place. |
| `savedPing` | `dynamic` | — | Value used by `clearTransient` in `client.ps.ping = savedPing`. |
| `persistant` | `dynamic` | — | Array or byte sequence accessed at `index`. Entries are written in place. |
| `eventSequence` | `dynamic` | — | Value used by `clearTransient` in `client.ps.eventSequence = eventSequence`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_spawn.ml#L61)

<a id="function-function-mq3-game-client-spawn-clientbegin-function-clientbegin-level-clientnum-src-mq3-game-client-spawn-ml-1005726709"></a>
### clientBegin

```ml
function clientBegin(level, clientNum)
```

Use `level.serverCommandFn` and `level.gameLogFn` to perform `clientBegin`. Return paths include `scores.calculateRanks(level)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clients`, `spawner`, `playerDieFn`, `entities` and `time` and related fields. |
| `clientNum` | `dynamic` | — | Client slot number. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_spawn.ml#L196)

<a id="constant-constant-mq3-game-client-spawn-contents-body-const-contents-body-headers-contents-body-src-mq3-game-client-spawn-ml-1636033196"></a>
### CONTENTS_BODY

```ml
const CONTENTS_BODY = headers.CONTENTS_BODY
```

Collision-contents bit identifying body space or objects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_spawn.ml#L45)

<a id="constant-constant-mq3-game-client-spawn-ef-kamikaze-const-ef-kamikaze-512-src-mq3-game-client-spawn-ml-1124636601"></a>
### EF_KAMIKAZE

```ml
const EF_KAMIKAZE = 512
```

Network entity-flag bit indicating kamikaze.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_spawn.ml#L29)

<a id="constant-constant-mq3-game-client-spawn-ef-teamvoted-const-ef-teamvoted-524288-src-mq3-game-client-spawn-ml-11333160"></a>
### EF_TEAMVOTED

```ml
const EF_TEAMVOTED = 524288
```

Network entity-flag bit indicating teamvoted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_spawn.ml#L33)

<a id="constant-constant-mq3-game-client-spawn-ef-teleport-bit-const-ef-teleport-bit-4-src-mq3-game-client-spawn-ml-2146053473"></a>
### EF_TELEPORT_BIT

```ml
const EF_TELEPORT_BIT = 4
```

Network entity-flag bit indicating teleport bit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_spawn.ml#L27)

<a id="constant-constant-mq3-game-client-spawn-ef-voted-const-ef-voted-16384-src-mq3-game-client-spawn-ml-1550173619"></a>
### EF_VOTED

```ml
const EF_VOTED = 16384
```

Network entity-flag bit indicating voted.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_spawn.ml#L31)

<a id="constant-constant-mq3-game-client-spawn-fl-no-bots-const-fl-no-bots-8192-src-mq3-game-client-spawn-ml-1652297899"></a>
### FL_NO_BOTS

```ml
const FL_NO_BOTS = 8192
```

Game entity-flag bit enabling or marking no bots.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_spawn.ml#L39)

<a id="constant-constant-mq3-game-client-spawn-fl-no-humans-const-fl-no-humans-16384-src-mq3-game-client-spawn-ml-178910329"></a>
### FL_NO_HUMANS

```ml
const FL_NO_HUMANS = 16384
```

Game entity-flag bit enabling or marking no humans.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_spawn.ml#L41)

<a id="function-function-mq3-game-client-spawn-infovalue-function-infovalue-info-key-src-mq3-game-client-spawn-ml-1049552465"></a>
### infoValue

```ml
function infoValue(info, key)
```

Forward `infoValue` to `mq3.shared.info.value` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `info` | `dynamic` | — | Text to parse, format or deliver. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_spawn.ml#L52)

<a id="constant-constant-mq3-game-client-spawn-mask-playersolid-const-mask-playersolid-33619969-src-mq3-game-client-spawn-ml-1245615391"></a>
### MASK_PLAYERSOLID

```ml
const MASK_PLAYERSOLID = 33619969
```

Combined CONTENTS_* mask used for playersolid collision queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_spawn.ml#L47)

<a id="constant-constant-mq3-game-client-spawn-pmf-respawned-const-pmf-respawned-512-src-mq3-game-client-spawn-ml-736947165"></a>
### PMF_RESPAWNED

```ml
const PMF_RESPAWNED = 512
```

Player movement-state bit indicating respawned.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_spawn.ml#L37)

<a id="constant-constant-mq3-game-client-spawn-pmf-time-knockback-const-pmf-time-knockback-64-src-mq3-game-client-spawn-ml-1010879917"></a>
### PMF_TIME_KNOCKBACK

```ml
const PMF_TIME_KNOCKBACK = 64
```

Player movement-state bit indicating time knockback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_spawn.ml#L35)

<a id="function-function-mq3-game-client-spawn-respawn-function-respawn-level-ent-src-mq3-game-client-spawn-ml-584292121"></a>
### respawn

```ml
function respawn(level, ent)
```

Use `level.clientSpawnFn` to perform `respawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clientSpawnFn` and `playerDieFn`. |
| `ent` | `dynamic` | — | Game entity; accesses `client` and `s`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_spawn.ml#L82)

<a id="function-function-mq3-game-client-spawn-selectpoint-function-selectpoint-level-ent-client-origin-angles-src-mq3-game-client-spawn-ml-2051663460"></a>
### selectPoint

```ml
function selectPoint(level, ent, client, origin, angles)
```

Set `client.initialSpawn` to `true` in `mq3.game.client_spawn.selectPoint`. Return paths include `spot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `r`. |
| `client` | `dynamic` | — | Client state; accesses `team`, `teamStateState`, `initialSpawn`, `localClient` and `ps`. May update `client.initialSpawn` in place. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `angles` | `dynamic` | — | Pitch, yaw and roll angles in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_spawn.ml#L99)

<a id="function-function-mq3-game-client-spawn-spawn-function-spawn-level-ent-diefn-src-mq3-game-client-spawn-ml-48002753"></a>
### spawn

```ml
function spawn(level, ent, dieFn)
```

Update `level.playerDieFn`, `level.respawnFn`, `level.clientBeginFn` and `ent.s.eFlags` and related state during `spawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clients`, `spawner`, `playerDieFn`, `respawnFn` and `clientBeginFn` and related fields. May update `level.playerDieFn`, `level.respawnFn` and `level.clientBeginFn` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `slot`, `client`, `s`, `takedamage` and `inuse` and related fields. May update `ent.s.eFlags`, `ent.s.groundEntityNum` and `ent.client` and additional fields in place. |
| `dieFn` | `dynamic` | — | Value used by `spawn` in `level.playerDieFn = dieFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_spawn.ml#L121)

<a id="constant-constant-mq3-game-client-spawn-svf-bot-const-svf-bot-8-src-mq3-game-client-spawn-ml-1971359301"></a>
### SVF_BOT

```ml
const SVF_BOT = 8
```

Server entity-flag bit controlling bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/client_spawn.ml#L43)
