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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `oldTeam` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L40)

<a id="function-function-mq3-game-g-cmds-cheatsok-function-cheatsok-level-ent-src-mq3-game-g-cmds-ml-445849537"></a>
### CheatsOk

```ml
function CheatsOk(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L29)

<a id="function-function-mq3-game-g-cmds-clientcommand-function-clientcommand-level-clientnum-argv-src-mq3-game-g-cmds-ml-1057023027"></a>
### ClientCommand

```ml
function ClientCommand(level, clientNum, argv)
```

GAME_CLIENT_COMMAND uses this entry after the server has tokenized the reliable command.  Keeping ClientCommand itself argv-based avoids a second tokenizer on the normal engine path.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L69)

<a id="function-function-mq3-game-g-cmds-clientcommandstate-function-clientcommandstate-runtime-clientnum-commandstate-src-mq3-game-g-cmds-ml-332220017"></a>
### ClientCommandState

```ml
function ClientCommandState(runtime, clientNum, commandState)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `commandState` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L71)

<a id="function-function-mq3-game-g-cmds-clientcommandtext-function-clientcommandtext-runtime-clientnum-text-src-mq3-game-g-cmds-ml-2065798046"></a>
### ClientCommandText

```ml
function ClientCommandText(runtime, clientNum, text)
```

Productive server adapter for a raw reliable command.  It deliberately uses the shared Cmd_TokenizeString implementation, then invokes the same QAGame entry as VM GAME_CLIENT_COMMAND.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `runtime` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L82)

<a id="function-function-mq3-game-g-cmds-clientnumberfromstring-function-clientnumberfromstring-level-callerent-text-src-mq3-game-g-cmds-ml-1034548703"></a>
### ClientNumberFromString

```ml
function ClientNumberFromString(level, callerEnt, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `callerEnt` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L31)

<a id="function-function-mq3-game-g-cmds-cmd-callteamvote-f-function-cmd-callteamvote-f-level-ent-argv-src-mq3-game-g-cmds-ml-1049797599"></a>
### Cmd_CallTeamVote_f

```ml
function Cmd_CallTeamVote_f(level, ent, argv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L61)

<a id="function-function-mq3-game-g-cmds-cmd-callvote-f-function-cmd-callvote-f-level-ent-argv-src-mq3-game-g-cmds-ml-176038535"></a>
### Cmd_CallVote_f

```ml
function Cmd_CallVote_f(level, ent, argv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L59)

<a id="function-function-mq3-game-g-cmds-cmd-follow-f-function-cmd-follow-f-level-ent-argv-src-mq3-game-g-cmds-ml-230015651"></a>
### Cmd_Follow_f

```ml
function Cmd_Follow_f(level, ent, argv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L44)

<a id="function-function-mq3-game-g-cmds-cmd-followcycle-f-function-cmd-followcycle-f-level-ent-direction-src-mq3-game-g-cmds-ml-750481154"></a>
### Cmd_FollowCycle_f

```ml
function Cmd_FollowCycle_f(level, ent, direction)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `direction` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L45)

<a id="function-function-mq3-game-g-cmds-cmd-gamecommand-f-function-cmd-gamecommand-f-level-ent-argv-src-mq3-game-g-cmds-ml-1115727717"></a>
### Cmd_GameCommand_f

```ml
function Cmd_GameCommand_f(level, ent, argv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L56)

<a id="function-function-mq3-game-g-cmds-cmd-give-f-function-cmd-give-f-level-ent-argv-src-mq3-game-g-cmds-ml-1194517523"></a>
### Cmd_Give_f

```ml
function Cmd_Give_f(level, ent, argv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L33)

<a id="function-function-mq3-game-g-cmds-cmd-god-f-function-cmd-god-f-level-ent-src-mq3-game-g-cmds-ml-1523660353"></a>
### Cmd_God_f

```ml
function Cmd_God_f(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L34)

<a id="function-function-mq3-game-g-cmds-cmd-kill-f-function-cmd-kill-f-level-ent-src-mq3-game-g-cmds-ml-405756489"></a>
### Cmd_Kill_f

```ml
function Cmd_Kill_f(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L39)

<a id="function-function-mq3-game-g-cmds-cmd-levelshot-f-function-cmd-levelshot-f-level-ent-src-mq3-game-g-cmds-ml-765793729"></a>
### Cmd_LevelShot_f

```ml
function Cmd_LevelShot_f(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L37)

<a id="function-function-mq3-game-g-cmds-cmd-noclip-f-function-cmd-noclip-f-level-ent-src-mq3-game-g-cmds-ml-788606913"></a>
### Cmd_Noclip_f

```ml
function Cmd_Noclip_f(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L36)

<a id="function-function-mq3-game-g-cmds-cmd-notarget-f-function-cmd-notarget-f-level-ent-src-mq3-game-g-cmds-ml-1958094609"></a>
### Cmd_Notarget_f

```ml
function Cmd_Notarget_f(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L35)

<a id="function-function-mq3-game-g-cmds-cmd-say-f-function-cmd-say-f-level-ent-argv-mode-arg0-src-mq3-game-g-cmds-ml-493101902"></a>
### Cmd_Say_f

```ml
function Cmd_Say_f(level, ent, argv, mode, arg0)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `arg0` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L49)

<a id="function-function-mq3-game-g-cmds-cmd-score-f-function-cmd-score-f-level-ent-src-mq3-game-g-cmds-ml-1422258161"></a>
### Cmd_Score_f

```ml
function Cmd_Score_f(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L28)

<a id="function-function-mq3-game-g-cmds-cmd-setviewpos-f-function-cmd-setviewpos-f-level-ent-argv-src-mq3-game-g-cmds-ml-2107017771"></a>
### Cmd_SetViewpos_f

```ml
function Cmd_SetViewpos_f(level, ent, argv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L63)

<a id="function-function-mq3-game-g-cmds-cmd-stats-f-function-cmd-stats-f-level-ent-src-mq3-game-g-cmds-ml-2133492659"></a>
### Cmd_Stats_f

```ml
function Cmd_Stats_f(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L64)

<a id="function-function-mq3-game-g-cmds-cmd-team-f-function-cmd-team-f-level-ent-argv-src-mq3-game-g-cmds-ml-1478456339"></a>
### Cmd_Team_f

```ml
function Cmd_Team_f(level, ent, argv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L43)

<a id="function-function-mq3-game-g-cmds-cmd-teamtask-f-function-cmd-teamtask-f-level-ent-argv-src-mq3-game-g-cmds-ml-1326149987"></a>
### Cmd_TeamTask_f

```ml
function Cmd_TeamTask_f(level, ent, argv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L38)

<a id="function-function-mq3-game-g-cmds-cmd-teamvote-f-function-cmd-teamvote-f-level-ent-argv-src-mq3-game-g-cmds-ml-135625967"></a>
### Cmd_TeamVote_f

```ml
function Cmd_TeamVote_f(level, ent, argv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L62)

<a id="function-function-mq3-game-g-cmds-cmd-tell-f-function-cmd-tell-f-level-ent-argv-src-mq3-game-g-cmds-ml-1751076379"></a>
### Cmd_Tell_f

```ml
function Cmd_Tell_f(level, ent, argv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L50)

<a id="function-function-mq3-game-g-cmds-cmd-voice-f-function-cmd-voice-f-level-ent-argv-mode-arg0-voiceonly-src-mq3-game-g-cmds-ml-1548467282"></a>
### Cmd_Voice_f

```ml
function Cmd_Voice_f(level, ent, argv, mode, arg0, voiceOnly)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `arg0` | `dynamic` | — |  |
| `voiceOnly` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L53)

<a id="function-function-mq3-game-g-cmds-cmd-voicetaunt-f-function-cmd-voicetaunt-f-level-ent-src-mq3-game-g-cmds-ml-2141002761"></a>
### Cmd_VoiceTaunt_f

```ml
function Cmd_VoiceTaunt_f(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L55)

<a id="function-function-mq3-game-g-cmds-cmd-voicetell-f-function-cmd-voicetell-f-level-ent-argv-voiceonly-src-mq3-game-g-cmds-ml-524599673"></a>
### Cmd_VoiceTell_f

```ml
function Cmd_VoiceTell_f(level, ent, argv, voiceOnly)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |
| `voiceOnly` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L54)

<a id="function-function-mq3-game-g-cmds-cmd-vote-f-function-cmd-vote-f-level-ent-argv-src-mq3-game-g-cmds-ml-1365752539"></a>
### Cmd_Vote_f

```ml
function Cmd_Vote_f(level, ent, argv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L60)

<a id="function-function-mq3-game-g-cmds-cmd-where-f-function-cmd-where-f-level-ent-src-mq3-game-g-cmds-ml-1101829983"></a>
### Cmd_Where_f

```ml
function Cmd_Where_f(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L57)

<a id="function-function-mq3-game-g-cmds-concatargs-function-concatargs-argv-start-src-mq3-game-g-cmds-ml-234061522"></a>
### ConcatArgs

```ml
function ConcatArgs(argv, start)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `argv` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L26)

<a id="function-function-mq3-game-g-cmds-createruntime-function-createruntime-level-src-mq3-game-g-cmds-ml-699071126"></a>
### createRuntime

```ml
function createRuntime(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L22)

<a id="function-function-mq3-game-g-cmds-deathmatchscoreboardmessage-function-deathmatchscoreboardmessage-level-ent-src-mq3-game-g-cmds-ml-233631945"></a>
### DeathmatchScoreboardMessage

```ml
function DeathmatchScoreboardMessage(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L27)

<a id="function-function-mq3-game-g-cmds-g-say-function-g-say-level-ent-target-mode-text-src-mq3-game-g-cmds-ml-583738090"></a>
### G_Say

```ml
function G_Say(level, ent, target, mode, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L48)

<a id="function-function-mq3-game-g-cmds-g-sayto-function-g-sayto-level-ent-other-mode-color-name-message-src-mq3-game-g-cmds-ml-1748102347"></a>
### G_SayTo

```ml
function G_SayTo(level, ent, other, mode, color, name, message)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `color` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L47)

<a id="function-function-mq3-game-g-cmds-g-voice-function-g-voice-level-ent-target-mode-id-voiceonly-src-mq3-game-g-cmds-ml-1636212524"></a>
### G_Voice

```ml
function G_Voice(level, ent, target, mode, id, voiceOnly)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `voiceOnly` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L52)

<a id="function-function-mq3-game-g-cmds-g-voiceto-function-g-voiceto-level-ent-other-mode-id-voiceonly-src-mq3-game-g-cmds-ml-511937623"></a>
### G_VoiceTo

```ml
function G_VoiceTo(level, ent, other, mode, id, voiceOnly)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `other` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `id` | `dynamic` | — |  |
| `voiceOnly` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L51)

- [mq3.game.g_cmds.Runtime](Type-mq3-game-g-cmds-runtime-1776016651.md) — struct
<a id="function-function-mq3-game-g-cmds-sanitizestring-function-sanitizestring-text-src-mq3-game-g-cmds-ml-450607097"></a>
### SanitizeString

```ml
function SanitizeString(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L30)

<a id="function-function-mq3-game-g-cmds-setteam-function-setteam-level-ent-text-src-mq3-game-g-cmds-ml-1808735992"></a>
### SetTeam

```ml
function SetTeam(level, ent, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L41)

<a id="function-function-mq3-game-g-cmds-stopfollowing-function-stopfollowing-level-ent-src-mq3-game-g-cmds-ml-1669690675"></a>
### StopFollowing

```ml
function StopFollowing(level, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_cmds.ml#L42)
