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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L100)

<a id="function-function-mq3-game-g-main-adjusttournamentscores-function-adjusttournamentscores-level-src-mq3-game-g-main-ml-1764930006"></a>
### AdjustTournamentScores

```ml
function AdjustTournamentScores(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L103)

<a id="function-function-mq3-game-g-main-argument-function-argument-args-index-src-mq3-game-g-main-ml-1840816567"></a>
### argument

```ml
function argument(args, index)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `args` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L57)

<a id="function-function-mq3-game-g-main-beginintermission-function-beginintermission-level-src-mq3-game-g-main-ml-181706520"></a>
### BeginIntermission

```ml
function BeginIntermission(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L105)

<a id="constant-constant-mq3-game-g-main-botai-start-frame-const-botai-start-frame-10-src-mq3-game-g-main-ml-1470994340"></a>
### BOTAI_START_FRAME

```ml
const BOTAI_START_FRAME = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L34)

<a id="function-function-mq3-game-g-main-calculateranks-function-calculateranks-level-src-mq3-game-g-main-ml-966443342"></a>
### CalculateRanks

```ml
function CalculateRanks(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L89)

<a id="function-function-mq3-game-g-main-checkcvars-function-checkcvars-level-src-mq3-game-g-main-ml-784594094"></a>
### CheckCvars

```ml
function CheckCvars(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L83)

<a id="function-function-mq3-game-g-main-checkexitrules-function-checkexitrules-level-src-mq3-game-g-main-ml-507864646"></a>
### CheckExitRules

```ml
function CheckExitRules(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L92)

<a id="function-function-mq3-game-g-main-checkintermissionexit-function-checkintermissionexit-level-src-mq3-game-g-main-ml-793041978"></a>
### CheckIntermissionExit

```ml
function CheckIntermissionExit(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L94)

<a id="function-function-mq3-game-g-main-checkteamleader-function-checkteamleader-level-team-src-mq3-game-g-main-ml-1852021759"></a>
### CheckTeamLeader

```ml
function CheckTeamLeader(level, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L99)

<a id="function-function-mq3-game-g-main-checkteamvote-function-checkteamvote-level-team-src-mq3-game-g-main-ml-473910881"></a>
### CheckTeamVote

```ml
function CheckTeamVote(level, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L96)

<a id="function-function-mq3-game-g-main-checktournament-function-checktournament-level-src-mq3-game-g-main-ml-676106688"></a>
### CheckTournament

```ml
function CheckTournament(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L86)

<a id="function-function-mq3-game-g-main-checkvote-function-checkvote-level-src-mq3-game-g-main-ml-933266234"></a>
### CheckVote

```ml
function CheckVote(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L95)

<a id="function-function-mq3-game-g-main-com-error-function-com-error-level-code-format-arguments-src-mq3-game-g-main-ml-289212934"></a>
### Com_Error

```ml
function Com_Error(level, code, format, arguments)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `code` | `dynamic` | — |  |
| `format` | `dynamic` | — |  |
| `arguments` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L77)

<a id="function-function-mq3-game-g-main-com-printf-function-com-printf-level-format-arguments-src-mq3-game-g-main-ml-454819301"></a>
### Com_Printf

```ml
function Com_Printf(level, format, arguments)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `format` | `dynamic` | — |  |
| `arguments` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L76)

<a id="function-function-mq3-game-g-main-createruntime-function-createruntime-level-src-mq3-game-g-main-ml-1493529322"></a>
### createRuntime

```ml
function createRuntime(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L124)

<a id="function-function-mq3-game-g-main-defaultbegin-function-defaultbegin-runtime-a-src-mq3-game-g-main-ml-264914765"></a>
### defaultBegin

```ml
function defaultBegin(runtime, a)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L118)

<a id="function-function-mq3-game-g-main-defaultbotframe-function-defaultbotframe-runtime-a-src-mq3-game-g-main-ml-1495704415"></a>
### defaultBotFrame

```ml
function defaultBotFrame(runtime, a)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L122)

<a id="function-function-mq3-game-g-main-defaultcommand-function-defaultcommand-runtime-a-src-mq3-game-g-main-ml-612765485"></a>
### defaultCommand

```ml
function defaultCommand(runtime, a)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L119)

<a id="function-function-mq3-game-g-main-defaultconnect-function-defaultconnect-runtime-a-b-c-src-mq3-game-g-main-ml-713455306"></a>
### defaultConnect

```ml
function defaultConnect(runtime, a, b, c)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L114)

<a id="function-function-mq3-game-g-main-defaultconsole-function-defaultconsole-runtime-src-mq3-game-g-main-ml-1053633340"></a>
### defaultConsole

```ml
function defaultConsole(runtime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L121)

<a id="function-function-mq3-game-g-main-defaultdisconnect-function-defaultdisconnect-runtime-a-src-mq3-game-g-main-ml-1133703719"></a>
### defaultDisconnect

```ml
function defaultDisconnect(runtime, a)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L117)

<a id="function-function-mq3-game-g-main-defaultframe-function-defaultframe-runtime-a-src-mq3-game-g-main-ml-485035037"></a>
### defaultFrame

```ml
function defaultFrame(runtime, a)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L120)

<a id="function-function-mq3-game-g-main-defaultinit-function-defaultinit-runtime-a-b-c-src-mq3-game-g-main-ml-1783750416"></a>
### defaultInit

```ml
function defaultInit(runtime, a, b, c)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |
| `c` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L112)

<a id="function-function-mq3-game-g-main-defaultshutdown-function-defaultshutdown-runtime-a-src-mq3-game-g-main-ml-1519474471"></a>
### defaultShutdown

```ml
function defaultShutdown(runtime, a)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L113)

<a id="function-function-mq3-game-g-main-defaultthink-function-defaultthink-runtime-a-src-mq3-game-g-main-ml-1326342321"></a>
### defaultThink

```ml
function defaultThink(runtime, a)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L115)

<a id="function-function-mq3-game-g-main-defaultuserinfo-function-defaultuserinfo-runtime-a-src-mq3-game-g-main-ml-916349805"></a>
### defaultUserinfo

```ml
function defaultUserinfo(runtime, a)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L116)

<a id="function-function-mq3-game-g-main-exitlevel-function-exitlevel-level-src-mq3-game-g-main-ml-990885174"></a>
### ExitLevel

```ml
function ExitLevel(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L106)

<a id="function-function-mq3-game-g-main-findintermissionpoint-function-findintermissionpoint-level-src-mq3-game-g-main-ml-152278496"></a>
### FindIntermissionPoint

```ml
function FindIntermissionPoint(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L87)

<a id="function-function-mq3-game-g-main-formatted-function-formatted-format-arguments-src-mq3-game-g-main-ml-936378905"></a>
### formatted

```ml
function formatted(format, arguments)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `format` | `dynamic` | — |  |
| `arguments` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L62)

<a id="function-function-mq3-game-g-main-g-error-function-g-error-level-format-arguments-src-mq3-game-g-main-ml-1789694821"></a>
### G_Error

```ml
function G_Error(level, format, arguments)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `format` | `dynamic` | — |  |
| `arguments` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L73)

<a id="function-function-mq3-game-g-main-g-findteams-function-g-findteams-level-src-mq3-game-g-main-ml-1675690760"></a>
### G_FindTeams

```ml
function G_FindTeams(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L110)

<a id="function-function-mq3-game-g-main-g-initgame-function-g-initgame-level-leveltime-randomseed-restart-entitytext-src-mq3-game-g-main-ml-1663798314"></a>
### G_InitGame

```ml
function G_InitGame(level, levelTime, randomSeed, restart, entityText)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `levelTime` | `dynamic` | — |  |
| `randomSeed` | `dynamic` | — |  |
| `restart` | `dynamic` | — |  |
| `entityText` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L107)

<a id="function-function-mq3-game-g-main-g-logprintf-function-g-logprintf-level-format-arguments-src-mq3-game-g-main-ml-565956047"></a>
### G_LogPrintf

```ml
function G_LogPrintf(level, format, arguments)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `format` | `dynamic` | — |  |
| `arguments` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L109)

<a id="function-function-mq3-game-g-main-g-printf-function-g-printf-level-format-arguments-src-mq3-game-g-main-ml-2010961769"></a>
### G_Printf

```ml
function G_Printf(level, format, arguments)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `format` | `dynamic` | — |  |
| `arguments` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L68)

<a id="function-function-mq3-game-g-main-g-registercvars-function-g-registercvars-level-src-mq3-game-g-main-ml-880268594"></a>
### G_RegisterCvars

```ml
function G_RegisterCvars(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L80)

<a id="function-function-mq3-game-g-main-g-remapteamshaders-function-g-remapteamshaders-level-src-mq3-game-g-main-ml-1528718582"></a>
### G_RemapTeamShaders

```ml
function G_RemapTeamShaders(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L82)

<a id="function-function-mq3-game-g-main-g-runframe-function-g-runframe-level-leveltime-src-mq3-game-g-main-ml-158340979"></a>
### G_RunFrame

```ml
function G_RunFrame(level, levelTime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `levelTime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L85)

<a id="function-function-mq3-game-g-main-g-runthink-function-g-runthink-level-ent-src-mq3-game-g-main-ml-1709312325"></a>
### G_RunThink

```ml
function G_RunThink(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L84)

<a id="function-function-mq3-game-g-main-g-shutdowngame-function-g-shutdowngame-level-restart-src-mq3-game-g-main-ml-631063303"></a>
### G_ShutdownGame

```ml
function G_ShutdownGame(level, restart)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `restart` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L108)

<a id="function-function-mq3-game-g-main-g-updatecvars-function-g-updatecvars-level-src-mq3-game-g-main-ml-2024503202"></a>
### G_UpdateCvars

```ml
function G_UpdateCvars(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L81)

<a id="constant-constant-mq3-game-g-main-game-client-begin-const-game-client-begin-3-src-mq3-game-g-main-ml-1271755370"></a>
### GAME_CLIENT_BEGIN

```ml
const GAME_CLIENT_BEGIN = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L27)

<a id="constant-constant-mq3-game-g-main-game-client-command-const-game-client-command-6-src-mq3-game-g-main-ml-133612783"></a>
### GAME_CLIENT_COMMAND

```ml
const GAME_CLIENT_COMMAND = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L30)

<a id="constant-constant-mq3-game-g-main-game-client-connect-const-game-client-connect-2-src-mq3-game-g-main-ml-703251879"></a>
### GAME_CLIENT_CONNECT

```ml
const GAME_CLIENT_CONNECT = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L26)

<a id="constant-constant-mq3-game-g-main-game-client-disconnect-const-game-client-disconnect-5-src-mq3-game-g-main-ml-1820334280"></a>
### GAME_CLIENT_DISCONNECT

```ml
const GAME_CLIENT_DISCONNECT = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L29)

<a id="constant-constant-mq3-game-g-main-game-client-think-const-game-client-think-7-src-mq3-game-g-main-ml-1974133518"></a>
### GAME_CLIENT_THINK

```ml
const GAME_CLIENT_THINK = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L31)

<a id="constant-constant-mq3-game-g-main-game-client-userinfo-changed-const-game-client-userinfo-changed-4-src-mq3-game-g-main-ml-372402677"></a>
### GAME_CLIENT_USERINFO_CHANGED

```ml
const GAME_CLIENT_USERINFO_CHANGED = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L28)

<a id="constant-constant-mq3-game-g-main-game-console-command-const-game-console-command-9-src-mq3-game-g-main-ml-309390834"></a>
### GAME_CONSOLE_COMMAND

```ml
const GAME_CONSOLE_COMMAND = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L33)

<a id="constant-constant-mq3-game-g-main-game-init-const-game-init-0-src-mq3-game-g-main-ml-675975717"></a>
### GAME_INIT

```ml
const GAME_INIT = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L24)

<a id="constant-constant-mq3-game-g-main-game-run-frame-const-game-run-frame-8-src-mq3-game-g-main-ml-1765544399"></a>
### GAME_RUN_FRAME

```ml
const GAME_RUN_FRAME = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L32)

<a id="constant-constant-mq3-game-g-main-game-shutdown-const-game-shutdown-1-src-mq3-game-g-main-ml-1433186212"></a>
### GAME_SHUTDOWN

```ml
const GAME_SHUTDOWN = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L25)

<a id="function-function-mq3-game-g-main-gamecvartable-function-gamecvartable-level-src-mq3-game-g-main-ml-210631866"></a>
### gameCvarTable

```ml
function gameCvarTable(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L79)

<a id="function-function-mq3-game-g-main-logexit-function-logexit-level-reason-src-mq3-game-g-main-ml-2142636890"></a>
### LogExit

```ml
function LogExit(level, reason)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L93)

<a id="function-function-mq3-game-g-main-moveclienttointermission-function-moveclienttointermission-level-ent-src-mq3-game-g-main-ml-1878475773"></a>
### MoveClientToIntermission

```ml
function MoveClientToIntermission(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L104)

<a id="function-function-mq3-game-g-main-printteam-function-printteam-level-team-message-src-mq3-game-g-main-ml-279053100"></a>
### PrintTeam

```ml
function PrintTeam(level, team, message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L97)

<a id="function-function-mq3-game-g-main-removetournamentloser-function-removetournamentloser-level-src-mq3-game-g-main-ml-728040186"></a>
### RemoveTournamentLoser

```ml
function RemoveTournamentLoser(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L101)

<a id="function-function-mq3-game-g-main-removetournamentwinner-function-removetournamentwinner-level-src-mq3-game-g-main-ml-1787068874"></a>
### RemoveTournamentWinner

```ml
function RemoveTournamentWinner(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L102)

- [mq3.game.g_main.Runtime](Type-mq3-game-g-main-runtime-2035159239.md) — struct
<a id="function-function-mq3-game-g-main-scoreistied-function-scoreistied-level-src-mq3-game-g-main-ml-1504488602"></a>
### ScoreIsTied

```ml
function ScoreIsTied(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L91)

<a id="function-function-mq3-game-g-main-sendscoreboardmessagetoallclients-function-sendscoreboardmessagetoallclients-level-src-mq3-game-g-main-ml-664371072"></a>
### SendScoreboardMessageToAllClients

```ml
function SendScoreboardMessageToAllClients(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L90)

<a id="function-function-mq3-game-g-main-setleader-function-setleader-level-team-client-src-mq3-game-g-main-ml-1512034058"></a>
### SetLeader

```ml
function SetLeader(level, team, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L98)

<a id="function-function-mq3-game-g-main-sortranks-function-sortranks-level-a-b-src-mq3-game-g-main-ml-1487735627"></a>
### SortRanks

```ml
function SortRanks(level, a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L88)

<a id="function-function-mq3-game-g-main-vmmain-function-vmmain-runtime-command-args-src-mq3-game-g-main-ml-1171035510"></a>
### vmMain

```ml
function vmMain(runtime, command, args)
```

vmMain -- the only qagame export.  The return values and command ordering match the pinned Baseq3 switch; unknown commands return -1.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_main.ml#L131)
