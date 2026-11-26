# `src/mq3/game/client_info.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.client_info`](Package-mq3-game-client-info-1746692922.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/textnumbers.ml` as `textnum` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/spawn_values.ml` as `values` → [src/mq3/game/spawn_values.ml](File-src-mq3-game-spawn-values-ml-1233448418.md)
- `mq3/game/tournament.ml` as `tournament` → [src/mq3/game/tournament.ml](File-src-mq3-game-tournament-ml-590125009.md)
- `mq3/shared/info.ml` as `infoStrings` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-client-info-changed-function-changed-level-slot-src-mq3-game-client-info-ml-1606121916"></a>
### changed

```ml
function changed(level, slot)
```

Use `level.userinfoFn`, `level.serverCommandFn` and `level.gameLogFn` to perform `changed`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities`, `userinfoFn`, `serverCommandFn`, `spawner` and `gameLogFn`. |
| `slot` | `dynamic` | — | Slot in the owning table or pool. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_info.ml#L83)

<a id="function-function-mq3-game-client-info-cleanname-function-cleanname-text-capacity-src-mq3-game-client-info-ml-814238207"></a>
### cleanName

```ml
function cleanName(text, capacity)
```

Apply `mq3.shared.info.textBytes` and `mq3.shared.info.copy` while evaluating `cleanName`. Return paths include `decode(bytes(output))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text to parse, format or deliver. |
| `capacity` | `dynamic` | — | Maximum number of entries to allocate or retain. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_info.ml#L25)

<a id="function-function-mq3-game-client-info-infoclientlimit-function-infoclientlimit-level-src-mq3-game-client-info-ml-572875024"></a>
### infoClientLimit

```ml
function infoClientLimit(level)
```

Validate the client limit used for userinfo team selection.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `maxclients`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_info.ml#L53)

<a id="function-function-mq3-game-client-info-leadervalue-function-leadervalue-client-src-mq3-game-client-info-ml-114999143"></a>
### leaderValue

```ml
function leaderValue(client)
```

Normalize a client's team-leader value to the integer representation written into userinfo.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — | Client state; accesses `teamLeader`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_info.ml#L15)

<a id="function-function-mq3-game-client-info-pickteam-function-pickteam-level-ignoreclientnum-src-mq3-game-client-info-ml-485592713"></a>
### pickTeam

```ml
function pickTeam(level, ignoreClientNum)
```

Apply `mq3.game.tournament.teamCount` while evaluating `pickTeam`. Return paths include `c.TEAM_BLUE`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `teamScores`. |
| `ignoreClientNum` | `dynamic` | — | Value used by `teamCount` in `if slot == ignoreClientNum then continue end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_info.ml#L72)

<a id="constant-constant-mq3-game-client-info-svf-bot-const-svf-bot-8-src-mq3-game-client-info-ml-1187945169"></a>
### SVF_BOT

```ml
const SVF_BOT = 8
```

Server entity-flag bit controlling bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_info.ml#L12)

<a id="function-function-mq3-game-client-info-teamleader-function-teamleader-level-team-src-mq3-game-client-info-ml-721760443"></a>
### teamLeader

```ml
function teamLeader(level, team)
```

Apply `mq3.game.client_info.infoClientLimit` while evaluating `teamLeader`. Return paths include `-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `maxclients` and `clients`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/client_info.ml#L60)
