# `src/mq3/game/votes.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.votes`](Package-mq3-game-votes-664835351.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `textnum` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/game/client_info.ml` as `clientInfo` → [src/mq3/game/client_info.ml](File-src-mq3-game-client-info-ml-669662398.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/spawn_values.ml` as `values` → [src/mq3/game/spawn_values.ml](File-src-mq3-game-spawn-values-ml-1233448418.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-votes-check-function-check-level-src-mq3-game-votes-ml-67838102"></a>
### check

```ml
function check(level)
```

Update `level.voteExecuteTime` and `level.voteTime` during `check`. Return paths include `config(level,8)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `voteExecuteTime`, `time`, `voteString`, `voteTime` and `voteYes` and related fields. May update `level.voteExecuteTime` and `level.voteTime` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/votes.ml#L56)

<a id="function-function-mq3-game-votes-checkteam-function-checkteam-level-team-src-mq3-game-votes-ml-2013583643"></a>
### checkTeam

```ml
function checkTeam(level, team)
```

Set `level.teamVoteTime[offset]` to `0` in `mq3.game.votes.checkTeam`. Return paths include `config(level,12+offset)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `teamVoteTime`, `time`, `teamVoteYes`, `numteamVotingClients` and `teamVoteString` and related fields. May update `level.teamVoteTime[offset]` in place. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/votes.ml#L148)

<a id="function-function-mq3-game-votes-checkteamleader-function-checkteamleader-level-team-src-mq3-game-votes-ml-392217793"></a>
### checkTeamLeader

```ml
function checkTeamLeader(level, team)
```

Set `level.clients[index].teamLeader` to `true` in `mq3.game.votes.checkTeamLeader`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `maxclients`, `clients` and `entities`. May update `level.clients[index].teamLeader` in place. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/votes.ml#L124)

<a id="function-function-mq3-game-votes-clientlimit-function-clientlimit-level-src-mq3-game-votes-ml-1076743630"></a>
### clientLimit

```ml
function clientLimit(level)
```

Validate the team-leader client limit against the native sixty-four-client capacity.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `maxclients`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/votes.ml#L76)

<a id="function-function-mq3-game-votes-commandtext-function-commandtext-text-src-mq3-game-votes-ml-597145955"></a>
### commandText

```ml
function commandText(text)
```

Convert vote command text to bytes after enforcing the native length limit and rejecting embedded zero bytes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/votes.ml#L38)

<a id="function-function-mq3-game-votes-config-function-config-level-index-src-mq3-game-votes-ml-499007704"></a>
### config

```ml
function config(level, index)
```

Apply `mq3.game.spawn_values.setConfig` while evaluating `config`. Return paths include `values.setConfig(level.spawner,index,"")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/votes.ml#L32)

<a id="function-function-mq3-game-votes-console-function-console-level-text-src-mq3-game-votes-ml-1219750553"></a>
### console

```ml
function console(level, text)
```

Use `level.consoleCommandFn` to perform `console`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `consoleCommandFn`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/votes.ml#L49)

<a id="function-function-mq3-game-votes-half-function-half-value-src-mq3-game-votes-ml-746670403"></a>
### half

```ml
function half(value)
```

Divide a signed 32-bit vote count by two with truncation toward zero.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.i32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/votes.ml#L15)

<a id="function-function-mq3-game-votes-printteam-function-printteam-level-team-message-src-mq3-game-votes-ml-722334500"></a>
### printTeam

```ml
function printTeam(level, team, message)
```

Apply `mq3.game.votes.clientLimit` and `mq3.game.votes.send` while evaluating `printTeam`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `maxclients` and `clients`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/votes.ml#L84)

<a id="function-function-mq3-game-votes-send-function-send-level-slot-message-src-mq3-game-votes-ml-227964361"></a>
### send

```ml
function send(level, slot, message)
```

Use `level.serverCommandFn` to perform `send`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `serverCommandFn`. |
| `slot` | `dynamic` | — | Slot in the owning table or pool. |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/votes.ml#L25)

<a id="function-function-mq3-game-votes-setleader-function-setleader-level-team-slot-src-mq3-game-votes-ml-736076811"></a>
### setLeader

```ml
function setLeader(level, team, slot)
```

Set `level.clients[current].teamLeader` to `false` and `level.clients[slot].teamLeader` to `true` in `mq3.game.votes.setLeader`. Return paths include `printTeam(level,team,"print \""+level.clients[slot].netname+" is the new team leader\n\"")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clients` and `maxclients`. May update `level.clients[current].teamLeader` and `level.clients[slot].teamLeader` in place. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |
| `slot` | `dynamic` | — | Slot in the owning table or pool. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/votes.ml#L105)

<a id="constant-constant-mq3-game-votes-svf-bot-const-svf-bot-8-src-mq3-game-votes-ml-124725787"></a>
### SVF_BOT

```ml
const SVF_BOT = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/votes.ml#L11)

<a id="function-function-mq3-game-votes-userinfochanged-function-userinfochanged-level-slot-src-mq3-game-votes-ml-1653212924"></a>
### userinfoChanged

```ml
function userinfoChanged(level, slot)
```

Use `level.clientUserinfoChangedFn` to perform `userinfoChanged`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clientUserinfoChangedFn`. |
| `slot` | `dynamic` | — | Slot in the owning table or pool. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/votes.ml#L96)
