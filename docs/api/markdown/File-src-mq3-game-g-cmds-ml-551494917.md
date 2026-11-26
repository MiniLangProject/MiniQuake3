# `src/mq3/game/g_cmds.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.g_cmds`](Package-mq3-game-g-cmds-246009897.md)

Reachable from entry: **no**

## Imports

- `mq3/game/chat_commands.ml` as `chat` → [src/mq3/game/chat_commands.ml](File-src-mq3-game-chat-commands-ml-2063945313.md)
- `mq3/game/client_commands.ml` as `dispatch` → [src/mq3/game/client_commands.ml](File-src-mq3-game-client-commands-ml-1383420016.md)
- `mq3/game/command_args.ml` as `args` → [src/mq3/game/command_args.ml](File-src-mq3-game-command-args-ml-1980826409.md)
- `mq3/game/follow_commands.ml` as `follow` → [src/mq3/game/follow_commands.ml](File-src-mq3-game-follow-commands-ml-511973794.md)
- `mq3/game/scores.ml` as `scores` → [src/mq3/game/scores.ml](File-src-mq3-game-scores-ml-660975489.md)
- `mq3/game/session.ml` as `sessions` → [src/mq3/game/session.ml](File-src-mq3-game-session-ml-1678952582.md)
- `mq3/game/team_changes.ml` as `teams` → [src/mq3/game/team_changes.ml](File-src-mq3-game-team-changes-ml-909995461.md)
- `mq3/game/utility_commands.ml` as `utility` → [src/mq3/game/utility_commands.ml](File-src-mq3-game-utility-commands-ml-2099018205.md)
- `mq3/game/vote_commands.ml` as `voteCommands` → [src/mq3/game/vote_commands.ml](File-src-mq3-game-vote-commands-ml-1392379875.md)
- `mq3/qcommon/command_buffer.ml` as `commands` → [src/mq3/qcommon/command_buffer.ml](File-src-mq3-qcommon-command-buffer-ml-122952676.md)

## Declarations

<a id="function-function-mq3-game-g-cmds-broadcastteamchange-function-broadcastteamchange-level-client-oldteam-src-mq3-game-g-cmds-ml-1573786845"></a>
### BroadcastTeamChange

```ml
function BroadcastTeamChange(level, client, oldTeam)
```

Forward `BroadcastTeamChange` to `mq3.game.session.broadcastTeamChange` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `serverCommandFn`. |
| `client` | `dynamic` | — | Client state; accesses `team` and `netname`. |
| `oldTeam` | `dynamic` | — | Value used by `broadcastTeamChange` in `else if client.team == 3 and oldTeam != 3 then suffix = " joined the spectators.\\n\\""`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L93)

<a id="function-function-mq3-game-g-cmds-cheatsok-function-cheatsok-level-ent-src-mq3-game-g-cmds-ml-445849537"></a>
### CheatsOk

```ml
function CheatsOk(level, ent)
```

Forward `CheatsOk` to `mq3.game.utility_commands.cheatsOk` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `cheats`. |
| `ent` | `dynamic` | — | Game entity; accesses `health`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L49)

<a id="function-function-mq3-game-g-cmds-clientcommand-function-clientcommand-level-clientnum-argv-src-mq3-game-g-cmds-ml-1057023027"></a>
### ClientCommand

```ml
function ClientCommand(level, clientNum, argv)
```

GAME_CLIENT_COMMAND uses this entry after the server has tokenized the reliable command.  Keeping ClientCommand itself argv-based avoids a second tokenizer on the normal engine path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities` and `intermissiontime`. |
| `clientNum` | `dynamic` | — | Client slot number. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L227)

<a id="function-function-mq3-game-g-cmds-clientcommandstate-function-clientcommandstate-runtime-clientnum-commandstate-src-mq3-game-g-cmds-ml-332220017"></a>
### ClientCommandState

```ml
function ClientCommandState(runtime, clientNum, commandState)
```

Apply `mq3.qcommon.command_buffer.argc`, `mq3.qcommon.command_buffer.argv` and `mq3.game.g_cmds.ClientCommand` while evaluating `ClientCommandState`. Return paths include `ClientCommand(runtime.level,clientNum,argv)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | G cmds runtime; accesses `level`. |
| `clientNum` | `dynamic` | — | Client slot number. |
| `commandState` | `dynamic` | — | Command buffer state; accesses `argv`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L233)

<a id="function-function-mq3-game-g-cmds-clientcommandtext-function-clientcommandtext-runtime-clientnum-text-src-mq3-game-g-cmds-ml-2065798046"></a>
### ClientCommandText

```ml
function ClientCommandText(runtime, clientNum, text)
```

Productive server adapter for a raw reliable command.  It deliberately uses the shared Cmd_TokenizeString implementation, then invokes the same QAGame entry as VM GAME_CLIENT_COMMAND.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — | G cmds runtime; accesses `commandState`. |
| `clientNum` | `dynamic` | — | Client slot number. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L247)

<a id="function-function-mq3-game-g-cmds-clientnumberfromstring-function-clientnumberfromstring-level-callerent-text-src-mq3-game-g-cmds-ml-1034548703"></a>
### ClientNumberFromString

```ml
function ClientNumberFromString(level, callerEnt, text)
```

Forward `ClientNumberFromString` to `mq3.game.follow_commands.clientNumber` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `maxclients` and `clients`. |
| `callerEnt` | `dynamic` | — | Game entity; accesses `slot`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L57)

<a id="function-function-mq3-game-g-cmds-cmd-callteamvote-f-function-cmd-callteamvote-f-level-ent-argv-src-mq3-game-g-cmds-ml-1049797599"></a>
### Cmd_CallTeamVote_f

```ml
function Cmd_CallTeamVote_f(level, ent, argv)
```

Forward `Cmd_CallTeamVote_f` to `mq3.game.vote_commands.callTeamVote` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `allowVote`, `teamVoteTime`, `maxclients`, `entities` and `clients` and related fields. May update `level.teamVoteString[offset]`, `level.teamVoteTime[offset]` and `level.teamVoteYes[offset]` and additional fields in place. |
| `ent` | `dynamic` | — | Game entity; accesses `slot` and `client`. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L205)

<a id="function-function-mq3-game-g-cmds-cmd-callvote-f-function-cmd-callvote-f-level-ent-argv-src-mq3-game-g-cmds-ml-176038535"></a>
### Cmd_CallVote_f

```ml
function Cmd_CallVote_f(level, ent, argv)
```

Forward `Cmd_CallVote_f` to `mq3.game.vote_commands.callVote` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `allowVote`, `voteTime`, `voteExecuteTime`, `voteString` and `voteDisplayString` and related fields. May update `level.voteExecuteTime`, `level.voteString` and `level.voteDisplayString` and additional fields in place. |
| `ent` | `dynamic` | — | Game entity; accesses `slot` and `client`. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L195)

<a id="function-function-mq3-game-g-cmds-cmd-follow-f-function-cmd-follow-f-level-ent-argv-src-mq3-game-g-cmds-ml-230015651"></a>
### Cmd_Follow_f

```ml
function Cmd_Follow_f(level, ent, argv)
```

Forward `Cmd_Follow_f` to `mq3.game.follow_commands.follow` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clients` and `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `client`. May update `ent.client.spectatorState` and `ent.client.spectatorClient` in place. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L112)

<a id="function-function-mq3-game-g-cmds-cmd-followcycle-f-function-cmd-followcycle-f-level-ent-direction-src-mq3-game-g-cmds-ml-750481154"></a>
### Cmd_FollowCycle_f

```ml
function Cmd_FollowCycle_f(level, ent, direction)
```

Forward `Cmd_FollowCycle_f` to `mq3.game.follow_commands.cycle` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`, `maxclients` and `clients`. |
| `ent` | `dynamic` | — | Game entity; accesses `client`. May update `ent.client.spectatorClient` and `ent.client.spectatorState` in place. |
| `direction` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.add32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L117)

<a id="function-function-mq3-game-g-cmds-cmd-gamecommand-f-function-cmd-gamecommand-f-level-ent-argv-src-mq3-game-g-cmds-ml-1115727717"></a>
### Cmd_GameCommand_f

```ml
function Cmd_GameCommand_f(level, ent, argv)
```

Forward `Cmd_GameCommand_f` to `mq3.game.chat_commands.gameCommand` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities`. |
| `ent` | `dynamic` | — | Game entity; accesses `client`. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L185)

<a id="function-function-mq3-game-g-cmds-cmd-give-f-function-cmd-give-f-level-ent-argv-src-mq3-game-g-cmds-ml-1194517523"></a>
### Cmd_Give_f

```ml
function Cmd_Give_f(level, ent, argv)
```

Forward `Cmd_Give_f` to `mq3.game.utility_commands.give` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `cheats`. |
| `ent` | `dynamic` | — | Game entity; accesses `client`, `health` and `r`. May update `ent.health`, `ent.client.ps.stats[c.STAT_WEAPONS]` and `ent.client.ps.ammo[index]` and additional fields in place. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L63)

<a id="function-function-mq3-game-g-cmds-cmd-god-f-function-cmd-god-f-level-ent-src-mq3-game-g-cmds-ml-1523660353"></a>
### Cmd_God_f

```ml
function Cmd_God_f(level, ent)
```

Forward `Cmd_God_f` to `mq3.game.utility_commands.god` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `cheats`. |
| `ent` | `dynamic` | — | Game entity; accesses `flags`. May update `ent.flags` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L67)

<a id="function-function-mq3-game-g-cmds-cmd-kill-f-function-cmd-kill-f-level-ent-src-mq3-game-g-cmds-ml-405756489"></a>
### Cmd_Kill_f

```ml
function Cmd_Kill_f(level, ent)
```

Forward `Cmd_Kill_f` to `mq3.game.utility_commands.kill` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `intermissiontime`, `time`, `scene`, `maxclients` and `clients` and related fields. May update `level.deathAnimIndex` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `client`, `health` and `flags`. May update `ent.flags`, `ent.client.ps.stats[c.STAT_HEALTH]` and `ent.health` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L88)

<a id="function-function-mq3-game-g-cmds-cmd-levelshot-f-function-cmd-levelshot-f-level-ent-src-mq3-game-g-cmds-ml-765793729"></a>
### Cmd_LevelShot_f

```ml
function Cmd_LevelShot_f(level, ent)
```

Forward `Cmd_LevelShot_f` to `mq3.game.utility_commands.levelshot` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `health`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L79)

<a id="function-function-mq3-game-g-cmds-cmd-noclip-f-function-cmd-noclip-f-level-ent-src-mq3-game-g-cmds-ml-788606913"></a>
### Cmd_Noclip_f

```ml
function Cmd_Noclip_f(level, ent)
```

Forward `Cmd_Noclip_f` to `mq3.game.utility_commands.noclip` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `cheats`. |
| `ent` | `dynamic` | — | Game entity; accesses `client`. May update `ent.client.noclip` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L75)

<a id="function-function-mq3-game-g-cmds-cmd-notarget-f-function-cmd-notarget-f-level-ent-src-mq3-game-g-cmds-ml-1958094609"></a>
### Cmd_Notarget_f

```ml
function Cmd_Notarget_f(level, ent)
```

Forward `Cmd_Notarget_f` to `mq3.game.utility_commands.notarget` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `cheats`. |
| `ent` | `dynamic` | — | Game entity; accesses `flags`. May update `ent.flags` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L71)

<a id="function-function-mq3-game-g-cmds-cmd-say-f-function-cmd-say-f-level-ent-argv-mode-arg0-src-mq3-game-g-cmds-ml-493101902"></a>
### Cmd_Say_f

```ml
function Cmd_Say_f(level, ent, argv, mode, arg0)
```

Forward `Cmd_Say_f` to `mq3.game.chat_commands.sayCommand` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `dedicated` and `entities`. |
| `ent` | `dynamic` | — | Game entity; accesses `client`. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |
| `mode` | `dynamic` | — | Value used by `sayTo` in `if mode == SAY_TEAM and not teamBonuses.sameTeam(level,ent,other) then return void end if`. |
| `arg0` | `dynamic` | — | Value used by `sayCommand` in `if len(argv) < 2 and not arg0 then return void end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L141)

<a id="function-function-mq3-game-g-cmds-cmd-score-f-function-cmd-score-f-level-ent-src-mq3-game-g-cmds-ml-1422258161"></a>
### Cmd_Score_f

```ml
function Cmd_Score_f(level, ent)
```

Forward `Cmd_Score_f` to `mq3.game.scores.commandScore` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `numConnectedClients`, `sortedClients`, `time`, `entities` and `teamScores`. |
| `ent` | `dynamic` | — | Game entity; accesses `slot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L45)

<a id="function-function-mq3-game-g-cmds-cmd-setviewpos-f-function-cmd-setviewpos-f-level-ent-argv-src-mq3-game-g-cmds-ml-2107017771"></a>
### Cmd_SetViewpos_f

```ml
function Cmd_SetViewpos_f(level, ent, argv)
```

Forward `Cmd_SetViewpos_f` to `mq3.game.utility_commands.setViewpos` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `cheats`. |
| `ent` | `dynamic` | — | Game entity; accesses `slot`. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L215)

<a id="function-function-mq3-game-g-cmds-cmd-stats-f-function-cmd-stats-f-level-ent-src-mq3-game-g-cmds-ml-2133492659"></a>
### Cmd_Stats_f

```ml
function Cmd_Stats_f(level, ent)
```

Forward `Cmd_Stats_f` to `mq3.game.utility_commands.stats` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Value passed as argument 1 to `mq3.game.utility_commands.stats`. |
| `ent` | `dynamic` | — | Value passed as argument 2 to `mq3.game.utility_commands.stats`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L219)

<a id="function-function-mq3-game-g-cmds-cmd-team-f-function-cmd-team-f-level-ent-argv-src-mq3-game-g-cmds-ml-1478456339"></a>
### Cmd_Team_f

```ml
function Cmd_Team_f(level, ent, argv)
```

Forward `Cmd_Team_f` to `mq3.game.team_changes.commandTeam` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time` and `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `client` and `slot`. May update `ent.client.switchTeamTime` in place. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L107)

<a id="function-function-mq3-game-g-cmds-cmd-teamtask-f-function-cmd-teamtask-f-level-ent-argv-src-mq3-game-g-cmds-ml-1326149987"></a>
### Cmd_TeamTask_f

```ml
function Cmd_TeamTask_f(level, ent, argv)
```

Forward `Cmd_TeamTask_f` to `mq3.game.utility_commands.teamTask` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `userinfoFn` and `userinfoSetFn`. |
| `ent` | `dynamic` | — | Game entity; accesses `client`. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L84)

<a id="function-function-mq3-game-g-cmds-cmd-teamvote-f-function-cmd-teamvote-f-level-ent-argv-src-mq3-game-g-cmds-ml-135625967"></a>
### Cmd_TeamVote_f

```ml
function Cmd_TeamVote_f(level, ent, argv)
```

Forward `Cmd_TeamVote_f` to `mq3.game.vote_commands.castTeamVote` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `teamVoteTime`, `teamVoteYes` and `teamVoteNo`. May update `level.teamVoteYes[offset]` and `level.teamVoteNo[offset]` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `slot` and `client`. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L210)

<a id="function-function-mq3-game-g-cmds-cmd-tell-f-function-cmd-tell-f-level-ent-argv-src-mq3-game-g-cmds-ml-1751076379"></a>
### Cmd_Tell_f

```ml
function Cmd_Tell_f(level, ent, argv)
```

Forward `Cmd_Tell_f` to `mq3.game.chat_commands.tellCommand` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities`. |
| `ent` | `dynamic` | — | Game entity; accesses `r`. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L146)

<a id="function-function-mq3-game-g-cmds-cmd-voice-f-function-cmd-voice-f-level-ent-argv-mode-arg0-voiceonly-src-mq3-game-g-cmds-ml-1548467282"></a>
### Cmd_Voice_f

```ml
function Cmd_Voice_f(level, ent, argv, mode, arg0, voiceOnly)
```

Forward `Cmd_Voice_f` to `mq3.game.chat_commands.voiceCommand` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `dedicated` and `entities`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |
| `mode` | `dynamic` | — | Value used by `voiceTo` in `if mode == SAY_TEAM and not teamBonuses.sameTeam(level,ent,other) then return void end if`. |
| `arg0` | `dynamic` | — | Value used by `voiceCommand` in `if len(argv) < 2 and not arg0 then return void end if`. |
| `voiceOnly` | `dynamic` | — | Whether to emit voice without the accompanying text message. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L170)

<a id="function-function-mq3-game-g-cmds-cmd-voicetaunt-f-function-cmd-voicetaunt-f-level-ent-src-mq3-game-g-cmds-ml-2141002761"></a>
### Cmd_VoiceTaunt_f

```ml
function Cmd_VoiceTaunt_f(level, ent)
```

Forward `Cmd_VoiceTaunt_f` to `mq3.game.chat_commands.voiceTaunt` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities` and `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `client`, `enemy`, `s` and `r`. May update `ent.enemy` and `ent.client.lastkilled_client` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L180)

<a id="function-function-mq3-game-g-cmds-cmd-voicetell-f-function-cmd-voicetell-f-level-ent-argv-voiceonly-src-mq3-game-g-cmds-ml-524599673"></a>
### Cmd_VoiceTell_f

```ml
function Cmd_VoiceTell_f(level, ent, argv, voiceOnly)
```

Forward `Cmd_VoiceTell_f` to `mq3.game.chat_commands.voiceTellCommand` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities`. |
| `ent` | `dynamic` | — | Game entity; accesses `r`. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |
| `voiceOnly` | `dynamic` | — | Whether to emit voice without the accompanying text message. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L176)

<a id="function-function-mq3-game-g-cmds-cmd-vote-f-function-cmd-vote-f-level-ent-argv-src-mq3-game-g-cmds-ml-1365752539"></a>
### Cmd_Vote_f

```ml
function Cmd_Vote_f(level, ent, argv)
```

Forward `Cmd_Vote_f` to `mq3.game.vote_commands.castVote` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `voteTime`, `voteYes` and `voteNo`. May update `level.voteYes` and `level.voteNo` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `slot` and `client`. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L200)

<a id="function-function-mq3-game-g-cmds-cmd-where-f-function-cmd-where-f-level-ent-src-mq3-game-g-cmds-ml-1101829983"></a>
### Cmd_Where_f

```ml
function Cmd_Where_f(level, ent)
```

Forward `Cmd_Where_f` to `mq3.game.chat_commands.where` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `ent` | `dynamic` | — | Game entity; accesses `s` and `slot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L189)

<a id="function-function-mq3-game-g-cmds-concatargs-function-concatargs-argv-start-src-mq3-game-g-cmds-ml-234061522"></a>
### ConcatArgs

```ml
function ConcatArgs(argv, start)
```

Forward `ConcatArgs` to `mq3.game.command_args.concat` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `argv` | `dynamic` | — | Command argument strings in their original order. |
| `start` | `dynamic` | — | Value used by `concat` in `index = start`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L37)

<a id="function-function-mq3-game-g-cmds-createruntime-function-createruntime-level-src-mq3-game-g-cmds-ml-699071126"></a>
### createRuntime

```ml
function createRuntime(level)
```

Create a `mq3.game.g_cmds.Runtime` record, initializing `level` from `level` and `commandState` as `commands.create()`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Initial value stored in `mq3.game.g_cmds.Runtime.level`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L30)

<a id="function-function-mq3-game-g-cmds-deathmatchscoreboardmessage-function-deathmatchscoreboardmessage-level-ent-src-mq3-game-g-cmds-ml-233631945"></a>
### DeathmatchScoreboardMessage

```ml
function DeathmatchScoreboardMessage(level, ent)
```

Forward `DeathmatchScoreboardMessage` to `mq3.game.scores.scoreboard` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `numConnectedClients`, `sortedClients`, `time`, `entities` and `teamScores`. |
| `ent` | `dynamic` | — | Game entity; accesses `slot`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L41)

<a id="function-function-mq3-game-g-cmds-g-say-function-g-say-level-ent-target-mode-text-src-mq3-game-g-cmds-ml-583738090"></a>
### G_Say

```ml
function G_Say(level, ent, target, mode, text)
```

Forward `G_Say` to `mq3.game.chat_commands.say` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `dedicated` and `entities`. |
| `ent` | `dynamic` | — | Game entity; accesses `client`. |
| `target` | `dynamic` | — | Target record; accesses `client`. |
| `mode` | `dynamic` | — | Value used by `sayTo` in `if mode == SAY_TEAM and not teamBonuses.sameTeam(level,ent,other) then return void end if`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L134)

<a id="function-function-mq3-game-g-cmds-g-sayto-function-g-sayto-level-ent-other-mode-color-name-message-src-mq3-game-g-cmds-ml-1748102347"></a>
### G_SayTo

```ml
function G_SayTo(level, ent, other, mode, color, name, message)
```

Forward `G_SayTo` to `mq3.game.chat_commands.sayTo` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | First record; accesses `client`. |
| `other` | `dynamic` | — | Other record; accesses `inuse`, `client` and `slot`. |
| `mode` | `dynamic` | — | Value used by `sayTo` in `if mode == SAY_TEAM and not teamBonuses.sameTeam(level,ent,other) then return void end if`. |
| `color` | `dynamic` | — | Operand used to evaluate the returned expression `chatServerCommand(level,other.slot,command+" \\""+name+"^"+decode(bytes([color & 255]))+message+"\\"")`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L127)

<a id="function-function-mq3-game-g-cmds-g-voice-function-g-voice-level-ent-target-mode-id-voiceonly-src-mq3-game-g-cmds-ml-1636212524"></a>
### G_Voice

```ml
function G_Voice(level, ent, target, mode, id, voiceOnly)
```

Forward `G_Voice` to `mq3.game.chat_commands.voice` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `dedicated` and `entities`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`. |
| `target` | `dynamic` | — | Other record; accesses `inuse`, `client` and `slot`. |
| `mode` | `dynamic` | — | Value used by `voiceTo` in `if mode == SAY_TEAM and not teamBonuses.sameTeam(level,ent,other) then return void end if`. |
| `id` | `dynamic` | — | Text to parse, format or deliver. |
| `voiceOnly` | `dynamic` | — | Whether to emit voice without the accompanying text message. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L162)

<a id="function-function-mq3-game-g-cmds-g-voiceto-function-g-voiceto-level-ent-other-mode-id-voiceonly-src-mq3-game-g-cmds-ml-511937623"></a>
### G_VoiceTo

```ml
function G_VoiceTo(level, ent, other, mode, id, voiceOnly)
```

Forward `G_VoiceTo` to `mq3.game.chat_commands.voiceTo` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`. |
| `other` | `dynamic` | — | Other record; accesses `inuse`, `client` and `slot`. |
| `mode` | `dynamic` | — | Value used by `voiceTo` in `if mode == SAY_TEAM and not teamBonuses.sameTeam(level,ent,other) then return void end if`. |
| `id` | `dynamic` | — | Operand used to evaluate the returned expression `chatServerCommand(level,other.slot,command+" "+str(chatVoiceOnly(voiceOnly))+" "+str(n.i32(ent.s.number))+" "+str(color)+" "+id)`. |
| `voiceOnly` | `dynamic` | — | Whether to emit voice without the accompanying text message. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L154)

- [mq3.game.g_cmds.Runtime](Type-mq3-game-g-cmds-runtime-1776016651.md) — struct
<a id="function-function-mq3-game-g-cmds-sanitizestring-function-sanitizestring-text-src-mq3-game-g-cmds-ml-450607097"></a>
### SanitizeString

```ml
function SanitizeString(text)
```

Forward `SanitizeString` to `mq3.game.follow_commands.sanitize` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L52)

<a id="function-function-mq3-game-g-cmds-setteam-function-setteam-level-ent-text-src-mq3-game-g-cmds-ml-1808735992"></a>
### SetTeam

```ml
function SetTeam(level, ent, text)
```

Forward `SetTeam` to `mq3.game.team_changes.setTeam` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`, `teamForceBalance`, `numNonSpectatorClients`, `maxGameClients` and `time` and related fields. May update `level.playerDieFn` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `client`, `flags` and `health`. May update `ent.flags` and `ent.health` in place. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L98)

<a id="function-function-mq3-game-g-cmds-stopfollowing-function-stopfollowing-level-ent-src-mq3-game-g-cmds-ml-1669690675"></a>
### StopFollowing

```ml
function StopFollowing(level, ent)
```

Forward `StopFollowing` to `mq3.game.team_changes.stopFollowing` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Value passed as argument 1 to `mq3.game.team_changes.stopFollowing`. |
| `ent` | `dynamic` | — | Game entity; accesses `client`, `slot` and `r`. May update `ent.r.svFlags` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L102)
