# `src/mq3/game/g_main.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.g_main`](Package-mq3-game-g-main-858323509.md)

Reachable from entry: **no**

## Imports

- `mq3/game/client_active.ml` as `clientActive` → [src/mq3/game/client_active.ml](File-src-mq3-game-client-active-ml-1919364260.md)
- `mq3/game/client_commands.ml` as `clientCommands` → [src/mq3/game/client_commands.ml](File-src-mq3-game-client-commands-ml-1383420016.md)
- `mq3/game/cvar_maintenance.ml` as `cvarMaintenance` → [src/mq3/game/cvar_maintenance.ml](File-src-mq3-game-cvar-maintenance-ml-54356974.md)
- `mq3/game/cvars.ml` as `cvars` → [src/mq3/game/cvars.ml](File-src-mq3-game-cvars-ml-718537019.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/frame.ml` as `frame` → [src/mq3/game/frame.ml](File-src-mq3-game-frame-ml-543279317.md)
- `mq3/game/g_client.ml` as `gClient` → [src/mq3/game/g_client.ml](File-src-mq3-game-g-client-ml-991769123.md)
- `mq3/game/initialization.ml` as `initialization` → [src/mq3/game/initialization.ml](File-src-mq3-game-initialization-ml-1982718888.md)
- `mq3/game/intermission.ml` as `intermission` → [src/mq3/game/intermission.ml](File-src-mq3-game-intermission-ml-2122930812.md)
- `mq3/game/lifecycle.ml` as `lifecycle` → [src/mq3/game/lifecycle.ml](File-src-mq3-game-lifecycle-ml-96284622.md)
- `mq3/game/logging.ml` as `logging` → [src/mq3/game/logging.ml](File-src-mq3-game-logging-ml-1623089765.md)
- `mq3/game/player_spawns.ml` as `playerSpawns` → [src/mq3/game/player_spawns.ml](File-src-mq3-game-player-spawns-ml-1960128696.md)
- `mq3/game/scores.ml` as `scores` → [src/mq3/game/scores.ml](File-src-mq3-game-scores-ml-660975489.md)
- `mq3/game/server_commands.ml` as `serverCommands` → [src/mq3/game/server_commands.ml](File-src-mq3-game-server-commands-ml-2072466884.md)
- `mq3/game/tournament.ml` as `tournament` → [src/mq3/game/tournament.ml](File-src-mq3-game-tournament-ml-590125009.md)
- `mq3/game/votes.ml` as `votes` → [src/mq3/game/votes.ml](File-src-mq3-game-votes-ml-1007667129.md)
- `mq3/shared/q_shared_runtime.ml` as `shared` → [src/mq3/shared/q_shared_runtime.ml](File-src-mq3-shared-q-shared-runtime-ml-1830953505.md)

## Declarations

<a id="function-function-mq3-game-g-main-addtournamentplayer-function-addtournamentplayer-level-src-mq3-game-g-main-ml-1084478948"></a>
### AddTournamentPlayer

```ml
function AddTournamentPlayer(level)
```

Forward `AddTournamentPlayer` to `mq3.game.tournament.addPlayer` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `numPlayingClients`, `intermissiontime`, `maxclients`, `clients` and `spawner` and related fields. May update `level.spawner.warmupTime` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L204)

<a id="function-function-mq3-game-g-main-adjusttournamentscores-function-adjusttournamentscores-level-src-mq3-game-g-main-ml-1764930006"></a>
### AdjustTournamentScores

```ml
function AdjustTournamentScores(level)
```

Forward `AdjustTournamentScores` to `mq3.game.tournament.adjustScores` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clients`. May update `level.clients[slot].wins` and `level.clients[slot].losses` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L213)

<a id="function-function-mq3-game-g-main-argument-function-argument-args-index-src-mq3-game-g-main-ml-1840816567"></a>
### argument

```ml
function argument(args, index)
```

Read an indexed qagame argument, returning zero for an omitted argument and an error for a non-array argument list.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `args` | `dynamic` | — | Array or byte sequence accessed at `index`. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L86)

<a id="function-function-mq3-game-g-main-beginintermission-function-beginintermission-level-src-mq3-game-g-main-ml-181706520"></a>
### BeginIntermission

```ml
function BeginIntermission(level)
```

Forward `BeginIntermission` to `mq3.game.intermission.begin` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `intermissiontime`, `spawner`, `time`, `updateTournamentInfoFn` and `spawnVictoryPadsFn` and related fields. May update `level.intermissiontime` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L220)

<a id="constant-constant-mq3-game-g-main-botai-start-frame-const-botai-start-frame-10-src-mq3-game-g-main-ml-1470994340"></a>
### BOTAI_START_FRAME

```ml
const BOTAI_START_FRAME = 10
```

VM command requesting one bot-AI frame from the game module.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L45)

<a id="function-function-mq3-game-g-main-calculateranks-function-calculateranks-level-src-mq3-game-g-main-ml-966443342"></a>
### CalculateRanks

```ml
function CalculateRanks(level)
```

Forward `CalculateRanks` to `mq3.game.scores.calculateRanks` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `maxclients`, `follow1`, `follow2`, `numConnectedClients` and `numNonSpectatorClients` and related fields. May update `level.follow1`, `level.follow2` and `level.numConnectedClients` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L164)

<a id="function-function-mq3-game-g-main-checkcvars-function-checkcvars-level-src-mq3-game-g-main-ml-784594094"></a>
### CheckCvars

```ml
function CheckCvars(level)
```

Forward `CheckCvars` to `mq3.game.cvar_maintenance.check` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `cvarMaintenance` and `cvarSetFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L142)

<a id="function-function-mq3-game-g-main-checkexitrules-function-checkexitrules-level-src-mq3-game-g-main-ml-507864646"></a>
### CheckExitRules

```ml
function CheckExitRules(level)
```

Forward `CheckExitRules` to `mq3.game.scores.checkExitRules` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `intermissiontime`, `intermissionQueued`, `time`, `timelimit` and `spawner` and related fields. May update `level.intermissionQueued` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L173)

<a id="function-function-mq3-game-g-main-checkintermissionexit-function-checkintermissionexit-level-src-mq3-game-g-main-ml-793041978"></a>
### CheckIntermissionExit

```ml
function CheckIntermissionExit(level)
```

Forward `CheckIntermissionExit` to `mq3.game.scores.checkIntermissionExit` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`, `maxclientsCvar`, `clients`, `entities` and `time` and related fields. May update `level.readyToExit` and `level.exitTime` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L180)

<a id="function-function-mq3-game-g-main-checkteamleader-function-checkteamleader-level-team-src-mq3-game-g-main-ml-1852021759"></a>
### CheckTeamLeader

```ml
function CheckTeamLeader(level, team)
```

Forward `CheckTeamLeader` to `mq3.game.votes.checkTeamLeader` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `maxclients`, `clients` and `entities`. May update `level.clients[index].teamLeader` in place. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L201)

<a id="function-function-mq3-game-g-main-checkteamvote-function-checkteamvote-level-team-src-mq3-game-g-main-ml-473910881"></a>
### CheckTeamVote

```ml
function CheckTeamVote(level, team)
```

Forward `CheckTeamVote` to `mq3.game.votes.checkTeam` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `teamVoteTime`, `time`, `teamVoteYes`, `numteamVotingClients` and `teamVoteString` and related fields. May update `level.teamVoteTime[offset]` in place. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L187)

<a id="function-function-mq3-game-g-main-checktournament-function-checktournament-level-src-mq3-game-g-main-ml-676106688"></a>
### CheckTournament

```ml
function CheckTournament(level)
```

Forward `CheckTournament` to `mq3.game.tournament.check` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`, `numPlayingClients`, `tournamentAddFn`, `warmupCvarModificationCount` and `warmupModificationCount` and related fields. May update `level.warmupModificationCount` and `level.spawner.warmupTime` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L153)

<a id="function-function-mq3-game-g-main-checkvote-function-checkvote-level-src-mq3-game-g-main-ml-933266234"></a>
### CheckVote

```ml
function CheckVote(level)
```

Forward `CheckVote` to `mq3.game.votes.check` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `voteExecuteTime`, `time`, `voteString`, `voteTime` and `voteYes` and related fields. May update `level.voteExecuteTime` and `level.voteTime` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L183)

<a id="function-function-mq3-game-g-main-com-error-function-com-error-level-code-format-arguments-src-mq3-game-g-main-ml-289212934"></a>
### Com_Error

```ml
function Com_Error(level, code, format, arguments)
```

Forward `Com_Error` to `mq3.game.g_main.G_Error` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Value passed as argument 1 to `mq3.game.g_main.G_Error`. |
| `code` | `dynamic` | — | Not read by this implementation; retained in the `Com_Error` signature. |
| `format` | `dynamic` | — | C-style format string. |
| `arguments` | `dynamic` | — | Ordered arguments consumed by the call or formatter. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L126)

<a id="function-function-mq3-game-g-main-com-printf-function-com-printf-level-format-arguments-src-mq3-game-g-main-ml-454819301"></a>
### Com_Printf

```ml
function Com_Printf(level, format, arguments)
```

Forward `Com_Printf` to `mq3.game.g_main.G_Printf` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `format` | `dynamic` | — | C-style format string. |
| `arguments` | `dynamic` | — | Ordered arguments consumed by the call or formatter. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L120)

<a id="function-function-mq3-game-g-main-createruntime-function-createruntime-level-src-mq3-game-g-main-ml-1493529322"></a>
### createRuntime

```ml
function createRuntime(level)
```

Create a `mq3.game.g_main.Runtime` record, initializing `level` from `level`, `gmainInitFn` as `defaultInit` and `gmainShutdownFn` as `defaultShutdown`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Initial value stored in `mq3.game.g_main.Runtime.level`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L294)

<a id="function-function-mq3-game-g-main-defaultbegin-function-defaultbegin-runtime-a-src-mq3-game-g-main-ml-264914765"></a>
### defaultBegin

```ml
function defaultBegin(runtime, a)
```

Forward `defaultBegin` to `mq3.game.g_client.ClientBegin` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | G main runtime; accesses `level`. |
| `a` | `dynamic` | — | Client slot number. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L275)

<a id="function-function-mq3-game-g-main-defaultbotframe-function-defaultbotframe-runtime-a-src-mq3-game-g-main-ml-1495704415"></a>
### defaultBotFrame

```ml
function defaultBotFrame(runtime, a)
```

Forward `defaultBotFrame` to `mq3.game.lifecycle.startBotFrame` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | G main runtime; accesses `level`. |
| `a` | `dynamic` | — | Time value in the units expected by this module. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L290)

<a id="function-function-mq3-game-g-main-defaultcommand-function-defaultcommand-runtime-a-src-mq3-game-g-main-ml-612765485"></a>
### defaultCommand

```ml
function defaultCommand(runtime, a)
```

Forward `defaultCommand` to `mq3.game.client_commands.command` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | G main runtime; accesses `level` and `gmainArgv`. |
| `a` | `dynamic` | — | Client slot number. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L279)

<a id="function-function-mq3-game-g-main-defaultconnect-function-defaultconnect-runtime-a-b-c-src-mq3-game-g-main-ml-713455306"></a>
### defaultConnect

```ml
function defaultConnect(runtime, a, b, c)
```

Forward `defaultConnect` to `mq3.game.g_client.ClientConnect` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | G main runtime; accesses `level`. |
| `a` | `dynamic` | — | Client slot number. |
| `b` | `dynamic` | — | Operand used to evaluate the returned expression `gClient.ClientConnect(runtime.level,a,b!=0,c!=0)`. |
| `c` | `dynamic` | — | Operand used to evaluate the returned expression `gClient.ClientConnect(runtime.level,a,b!=0,c!=0)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L259)

<a id="function-function-mq3-game-g-main-defaultconsole-function-defaultconsole-runtime-src-mq3-game-g-main-ml-1053633340"></a>
### defaultConsole

```ml
function defaultConsole(runtime)
```

Forward `defaultConsole` to `mq3.game.server_commands.command` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | G main runtime; accesses `level` and `gmainArgv`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L286)

<a id="function-function-mq3-game-g-main-defaultdisconnect-function-defaultdisconnect-runtime-a-src-mq3-game-g-main-ml-1133703719"></a>
### defaultDisconnect

```ml
function defaultDisconnect(runtime, a)
```

Forward `defaultDisconnect` to `mq3.game.g_client.ClientDisconnect` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | G main runtime; accesses `level`. |
| `a` | `dynamic` | — | Client slot number. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L271)

<a id="function-function-mq3-game-g-main-defaultframe-function-defaultframe-runtime-a-src-mq3-game-g-main-ml-485035037"></a>
### defaultFrame

```ml
function defaultFrame(runtime, a)
```

Forward `defaultFrame` to `mq3.game.g_main.G_RunFrame` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | G main runtime; accesses `level`. |
| `a` | `dynamic` | — | Current server game time in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L283)

<a id="function-function-mq3-game-g-main-defaultinit-function-defaultinit-runtime-a-b-c-src-mq3-game-g-main-ml-1783750416"></a>
### defaultInit

```ml
function defaultInit(runtime, a, b, c)
```

Forward `defaultInit` to `mq3.game.g_main.G_InitGame` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | G main runtime; accesses `level` and `gmainEntityText`. |
| `a` | `dynamic` | — | Current server game time in milliseconds. |
| `b` | `dynamic` | — | State used to initialize the deterministic random sequence. |
| `c` | `dynamic` | — | Whether initialization or shutdown belongs to a map restart. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L249)

<a id="function-function-mq3-game-g-main-defaultshutdown-function-defaultshutdown-runtime-a-src-mq3-game-g-main-ml-1519474471"></a>
### defaultShutdown

```ml
function defaultShutdown(runtime, a)
```

Forward `defaultShutdown` to `mq3.game.g_main.G_ShutdownGame` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | G main runtime; accesses `level`. |
| `a` | `dynamic` | — | Whether initialization or shutdown belongs to a map restart. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L253)

<a id="function-function-mq3-game-g-main-defaultthink-function-defaultthink-runtime-a-src-mq3-game-g-main-ml-1326342321"></a>
### defaultThink

```ml
function defaultThink(runtime, a)
```

Forward `defaultThink` to `mq3.game.client_active.think` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | G main runtime; accesses `level`. |
| `a` | `dynamic` | — | Client slot number. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L263)

<a id="function-function-mq3-game-g-main-defaultuserinfo-function-defaultuserinfo-runtime-a-src-mq3-game-g-main-ml-916349805"></a>
### defaultUserinfo

```ml
function defaultUserinfo(runtime, a)
```

Forward `defaultUserinfo` to `mq3.game.g_client.ClientUserinfoChanged` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | G main runtime; accesses `level`. |
| `a` | `dynamic` | — | Client slot number. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L267)

<a id="function-function-mq3-game-g-main-exitlevel-function-exitlevel-level-src-mq3-game-g-main-ml-990885174"></a>
### ExitLevel

```ml
function ExitLevel(level)
```

Forward `ExitLevel` to `mq3.game.intermission.exitLevel` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `botInterbreedEndMatchFn`, `botLifecycleState`, `spawner`, `restarted` and `consoleCommandFn` and related fields. May update `level.restarted`, `level.changemap` and `level.intermissiontime` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L223)

<a id="function-function-mq3-game-g-main-findintermissionpoint-function-findintermissionpoint-level-src-mq3-game-g-main-ml-152278496"></a>
### FindIntermissionPoint

```ml
function FindIntermissionPoint(level)
```

Forward `FindIntermissionPoint` to `mq3.game.player_spawns.findIntermission` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `intermission_origin` and `intermission_angle`. May update `level.intermission_origin` and `level.intermission_angle` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L156)

<a id="function-function-mq3-game-g-main-formatted-function-formatted-format-arguments-src-mq3-game-g-main-ml-936378905"></a>
### formatted

```ml
function formatted(format, arguments)
```

Format a qagame diagnostic and reject output exceeding the original 1024-byte buffer including its terminator.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `format` | `dynamic` | — | C-style format string. |
| `arguments` | `dynamic` | — | Ordered arguments consumed by the call or formatter. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L94)

<a id="function-function-mq3-game-g-main-g-error-function-g-error-level-format-arguments-src-mq3-game-g-main-ml-1789694821"></a>
### G_Error

```ml
function G_Error(level, format, arguments)
```

Construct qagame error 481 from the formatted diagnostic text.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Not read by this implementation; retained in the `G_Error` signature. |
| `format` | `dynamic` | — | C-style format string. |
| `arguments` | `dynamic` | — | Ordered arguments consumed by the call or formatter. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L113)

<a id="function-function-mq3-game-g-main-g-findteams-function-g-findteams-level-src-mq3-game-g-main-ml-1675690760"></a>
### G_FindTeams

```ml
function G_FindTeams(level)
```

Forward `G_FindTeams` to `mq3.game.initialization.findTeams` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities`, `entities` and `gamePrintFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L242)

<a id="function-function-mq3-game-g-main-g-initgame-function-g-initgame-level-leveltime-randomseed-restart-entitytext-src-mq3-game-g-main-ml-1663798314"></a>
### G_InitGame

```ml
function G_InitGame(level, levelTime, randomSeed, restart, entityText)
```

Forward `G_InitGame` to `mq3.game.lifecycle.init` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`, `randSeed`, `time`, `startTime` and `sndFry` and related fields. May update `level.spawner.parser`, `level.randSeed` and `level.time` and additional fields in place. |
| `levelTime` | `dynamic` | — | Current server game time in milliseconds. |
| `randomSeed` | `dynamic` | — | State used to initialize the deterministic random sequence. |
| `restart` | `dynamic` | — | Whether initialization or shutdown belongs to a map restart. |
| `entityText` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L230)

<a id="function-function-mq3-game-g-main-g-logprintf-function-g-logprintf-level-format-arguments-src-mq3-game-g-main-ml-565956047"></a>
### G_LogPrintf

```ml
function G_LogPrintf(level, format, arguments)
```

Forward `G_LogPrintf` to `mq3.game.logging.write` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`, `dedicated`, `gamePrintFn`, `logFile` and `logWriteFn`. |
| `format` | `dynamic` | — | C-style format string. |
| `arguments` | `dynamic` | — | Ordered arguments consumed by the call or formatter. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L239)

<a id="function-function-mq3-game-g-main-g-printf-function-g-printf-level-format-arguments-src-mq3-game-g-main-ml-2010961769"></a>
### G_Printf

```ml
function G_Printf(level, format, arguments)
```

Format and deliver a qagame diagnostic through the installed game-print callback, rejecting a missing callback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `format` | `dynamic` | — | C-style format string. |
| `arguments` | `dynamic` | — | Ordered arguments consumed by the call or formatter. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L104)

<a id="function-function-mq3-game-g-main-g-registercvars-function-g-registercvars-level-src-mq3-game-g-main-ml-880268594"></a>
### G_RegisterCvars

```ml
function G_RegisterCvars(level)
```

Forward `G_RegisterCvars` to `mq3.game.cvars.register` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`, `cvarSetFn`, `warmupModificationCount` and `warmupCvarModificationCount`. May update `level.warmupModificationCount` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L133)

<a id="function-function-mq3-game-g-main-g-remapteamshaders-function-g-remapteamshaders-level-src-mq3-game-g-main-ml-1528718582"></a>
### G_RemapTeamShaders

```ml
function G_RemapTeamShaders(level)
```

Forward `G_RemapTeamShaders` to `mq3.game.cvars.remapTeamShaders` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Value passed as argument 1 to `mq3.game.cvars.remapTeamShaders`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L139)

<a id="function-function-mq3-game-g-main-g-runframe-function-g-runframe-level-leveltime-src-mq3-game-g-main-ml-158340979"></a>
### G_RunFrame

```ml
function G_RunFrame(level, levelTime)
```

Forward `G_RunFrame` to `mq3.game.frame.run` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `restarted`, `framenum`, `previousTime`, `time` and `updateCvarsFn` and related fields. May update `level.framenum`, `level.previousTime` and `level.time` in place. |
| `levelTime` | `dynamic` | — | Current server game time in milliseconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L150)

<a id="function-function-mq3-game-g-main-g-runthink-function-g-runthink-level-ent-src-mq3-game-g-main-ml-1709312325"></a>
### G_RunThink

```ml
function G_RunThink(level, ent)
```

Forward `G_RunThink` to `mq3.game.entities.runThink` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `nextthink` and `think`. May update `ent.nextthink` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L146)

<a id="function-function-mq3-game-g-main-g-shutdowngame-function-g-shutdowngame-level-restart-src-mq3-game-g-main-ml-631063303"></a>
### G_ShutdownGame

```ml
function G_ShutdownGame(level, restart)
```

Forward `G_ShutdownGame` to `mq3.game.lifecycle.shutdown` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `logFile`. |
| `restart` | `dynamic` | — | Whether initialization or shutdown belongs to a map restart. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L234)

<a id="function-function-mq3-game-g-main-g-updatecvars-function-g-updatecvars-level-src-mq3-game-g-main-ml-2024503202"></a>
### G_UpdateCvars

```ml
function G_UpdateCvars(level)
```

Forward `G_UpdateCvars` to `mq3.game.cvars.update` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `serverCommandFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L136)

<a id="constant-constant-mq3-game-g-main-game-client-begin-const-game-client-begin-3-src-mq3-game-g-main-ml-1271755370"></a>
### GAME_CLIENT_BEGIN

```ml
const GAME_CLIENT_BEGIN = 3
```

Game-module VM command identifier selecting client begin.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L31)

<a id="constant-constant-mq3-game-g-main-game-client-command-const-game-client-command-6-src-mq3-game-g-main-ml-133612783"></a>
### GAME_CLIENT_COMMAND

```ml
const GAME_CLIENT_COMMAND = 6
```

Game-module VM command identifier selecting client command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L37)

<a id="constant-constant-mq3-game-g-main-game-client-connect-const-game-client-connect-2-src-mq3-game-g-main-ml-703251879"></a>
### GAME_CLIENT_CONNECT

```ml
const GAME_CLIENT_CONNECT = 2
```

Game-module VM command identifier selecting client connect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L29)

<a id="constant-constant-mq3-game-g-main-game-client-disconnect-const-game-client-disconnect-5-src-mq3-game-g-main-ml-1820334280"></a>
### GAME_CLIENT_DISCONNECT

```ml
const GAME_CLIENT_DISCONNECT = 5
```

Game-module VM command identifier selecting client disconnect.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L35)

<a id="constant-constant-mq3-game-g-main-game-client-think-const-game-client-think-7-src-mq3-game-g-main-ml-1974133518"></a>
### GAME_CLIENT_THINK

```ml
const GAME_CLIENT_THINK = 7
```

Game-module VM command identifier selecting client think.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L39)

<a id="constant-constant-mq3-game-g-main-game-client-userinfo-changed-const-game-client-userinfo-changed-4-src-mq3-game-g-main-ml-372402677"></a>
### GAME_CLIENT_USERINFO_CHANGED

```ml
const GAME_CLIENT_USERINFO_CHANGED = 4
```

Game-module VM command identifier selecting client user information changed.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L33)

<a id="constant-constant-mq3-game-g-main-game-console-command-const-game-console-command-9-src-mq3-game-g-main-ml-309390834"></a>
### GAME_CONSOLE_COMMAND

```ml
const GAME_CONSOLE_COMMAND = 9
```

Game-module VM command identifier selecting console command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L43)

<a id="constant-constant-mq3-game-g-main-game-init-const-game-init-0-src-mq3-game-g-main-ml-675975717"></a>
### GAME_INIT

```ml
const GAME_INIT = 0
```

Game-module VM command identifier selecting init.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L25)

<a id="constant-constant-mq3-game-g-main-game-run-frame-const-game-run-frame-8-src-mq3-game-g-main-ml-1765544399"></a>
### GAME_RUN_FRAME

```ml
const GAME_RUN_FRAME = 8
```

Game-module VM command identifier selecting run frame.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L41)

<a id="constant-constant-mq3-game-g-main-game-shutdown-const-game-shutdown-1-src-mq3-game-g-main-ml-1433186212"></a>
### GAME_SHUTDOWN

```ml
const GAME_SHUTDOWN = 1
```

Game-module VM command identifier selecting shutdown.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L27)

<a id="function-function-mq3-game-g-main-gamecvartable-function-gamecvartable-level-src-mq3-game-g-main-ml-210631866"></a>
### gameCvarTable

```ml
function gameCvarTable(level)
```

Return `cvars.moduleState(level).rows` for `gameCvarTable`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gameCvars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L130)

<a id="function-function-mq3-game-g-main-logexit-function-logexit-level-reason-src-mq3-game-g-main-ml-2142636890"></a>
### LogExit

```ml
function LogExit(level, reason)
```

Forward `LogExit` to `mq3.game.scores.logExit` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `intermissionQueued`, `time`, `spawner`, `numConnectedClients` and `teamScores` and related fields. May update `level.intermissionQueued` in place. |
| `reason` | `dynamic` | — | Reason text recorded with the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L177)

<a id="function-function-mq3-game-g-main-moveclienttointermission-function-moveclienttointermission-level-ent-src-mq3-game-g-main-ml-1878475773"></a>
### MoveClientToIntermission

```ml
function MoveClientToIntermission(level, ent)
```

Forward `MoveClientToIntermission` to `mq3.game.intermission.moveClient` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `intermission_origin` and `intermission_angle`. |
| `ent` | `dynamic` | — | Game entity; accesses `client`, `s` and `r`. May update `ent.s.origin[axis]`, `ent.client.ps.origin[axis]` and `ent.client.ps.viewangles[axis]` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L217)

<a id="function-function-mq3-game-g-main-printteam-function-printteam-level-team-message-src-mq3-game-g-main-ml-279053100"></a>
### PrintTeam

```ml
function PrintTeam(level, team, message)
```

Forward `PrintTeam` to `mq3.game.votes.printTeam` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `maxclients` and `clients`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L192)

<a id="function-function-mq3-game-g-main-removetournamentloser-function-removetournamentloser-level-src-mq3-game-g-main-ml-728040186"></a>
### RemoveTournamentLoser

```ml
function RemoveTournamentLoser(level)
```

Forward `RemoveTournamentLoser` to `mq3.game.tournament.removeLoser` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `numPlayingClients`, `clients` and `entities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L207)

<a id="function-function-mq3-game-g-main-removetournamentwinner-function-removetournamentwinner-level-src-mq3-game-g-main-ml-1787068874"></a>
### RemoveTournamentWinner

```ml
function RemoveTournamentWinner(level)
```

Forward `RemoveTournamentWinner` to `mq3.game.tournament.removeWinner` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `numPlayingClients`, `clients` and `entities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L210)

- [mq3.game.g_main.Runtime](Type-mq3-game-g-main-runtime-2035159239.md) — struct
<a id="function-function-mq3-game-g-main-scoreistied-function-scoreistied-level-src-mq3-game-g-main-ml-1504488602"></a>
### ScoreIsTied

```ml
function ScoreIsTied(level)
```

Forward `ScoreIsTied` to `mq3.game.scores.scoreIsTied` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `numPlayingClients`, `spawner`, `teamScores` and `sortedClients`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L170)

<a id="function-function-mq3-game-g-main-sendscoreboardmessagetoallclients-function-sendscoreboardmessagetoallclients-level-src-mq3-game-g-main-ml-664371072"></a>
### SendScoreboardMessageToAllClients

```ml
function SendScoreboardMessageToAllClients(level)
```

Forward `SendScoreboardMessageToAllClients` to `mq3.game.scores.sendAll` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `maxclients`, `clients` and `entities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L167)

<a id="function-function-mq3-game-g-main-setleader-function-setleader-level-team-client-src-mq3-game-g-main-ml-1512034058"></a>
### SetLeader

```ml
function SetLeader(level, team, client)
```

Forward `SetLeader` to `mq3.game.votes.setLeader` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clients` and `maxclients`. May update `level.clients[current].teamLeader` and `level.clients[slot].teamLeader` in place. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |
| `client` | `dynamic` | — | Slot in the owning table or pool. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L197)

<a id="function-function-mq3-game-g-main-sortranks-function-sortranks-level-a-b-src-mq3-game-g-main-ml-1487735627"></a>
### SortRanks

```ml
function SortRanks(level, a, b)
```

Forward `SortRanks` to `mq3.game.scores.compareRanks` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clients`. |
| `a` | `dynamic` | — | Slot in the owning table or pool. |
| `b` | `dynamic` | — | Slot in the owning table or pool. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L161)

<a id="function-function-mq3-game-g-main-vmmain-function-vmmain-runtime-command-args-src-mq3-game-g-main-ml-1171035510"></a>
### vmMain

```ml
function vmMain(runtime, command, args)
```

vmMain -- the only qagame export.  The return values and command ordering match the pinned Baseq3 switch; unknown commands return -1.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | G main runtime; accesses `level`, `gmainInitFn`, `gmainShutdownFn`, `gmainConnectFn` and `gmainThinkFn` and related fields. |
| `command` | `dynamic` | — | Value used by `vmMain` in `if command == GAME_INIT then runtime.gmainInitFn(runtime,argument(args,0),argument(args,1),argument(args,2))`. |
| `args` | `dynamic` | — | Array or byte sequence accessed at `index`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_main.ml#L304)
