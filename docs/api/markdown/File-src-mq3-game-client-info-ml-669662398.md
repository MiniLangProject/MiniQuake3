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
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-client-info-changed-function-changed-level-slot-src-mq3-game-client-info-ml-1606121916"></a>
### changed

```ml
function changed(level, slot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `slot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/client_info.ml#L66)

<a id="function-function-mq3-game-client-info-cleanname-function-cleanname-text-capacity-src-mq3-game-client-info-ml-814238207"></a>
### cleanName

```ml
function cleanName(text, capacity)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `capacity` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/client_info.ml#L19)

<a id="function-function-mq3-game-client-info-infoclientlimit-function-infoclientlimit-level-src-mq3-game-client-info-ml-572875024"></a>
### infoClientLimit

```ml
function infoClientLimit(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/client_info.ml#L45)

<a id="function-function-mq3-game-client-info-leadervalue-function-leadervalue-client-src-mq3-game-client-info-ml-114999143"></a>
### leaderValue

```ml
function leaderValue(client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/client_info.ml#L12)

<a id="function-function-mq3-game-client-info-pickteam-function-pickteam-level-ignoreclientnum-src-mq3-game-client-info-ml-485592713"></a>
### pickTeam

```ml
function pickTeam(level, ignoreClientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ignoreClientNum` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/client_info.ml#L58)

<a id="constant-constant-mq3-game-client-info-svf-bot-const-svf-bot-8-src-mq3-game-client-info-ml-1187945169"></a>
### SVF_BOT

```ml
const SVF_BOT = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/client_info.ml#L11)

<a id="function-function-mq3-game-client-info-teamleader-function-teamleader-level-team-src-mq3-game-client-info-ml-721760443"></a>
### teamLeader

```ml
function teamLeader(level, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/client_info.ml#L49)
