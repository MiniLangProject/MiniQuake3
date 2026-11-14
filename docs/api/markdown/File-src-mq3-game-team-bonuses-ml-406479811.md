# `src/mq3/game/team_bonuses.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.team_bonuses`](Package-mq3-game-team-bonuses-1210357795.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/scores.ml` as `scores` → [src/mq3/game/scores.ml](File-src-mq3-game-scores-ml-660975489.md)
- `mq3/server/world.ml` as `sv` → [src/mq3/server/world.ml](File-src-mq3-server-world-ml-118313937.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="constant-constant-mq3-game-team-bonuses-award-mask-const-award-mask-231496-src-mq3-game-team-bonuses-ml-989497878"></a>
### AWARD_MASK

```ml
const AWARD_MASK = 231496
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_bonuses.ml#L12)

<a id="function-function-mq3-game-team-bonuses-awarddefense-function-awarddefense-level-attacker-src-mq3-game-team-bonuses-ml-462576133"></a>
### awardDefense

```ml
function awardDefense(level, attacker)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `attacker` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_bonuses.ml#L40)

<a id="function-function-mq3-game-team-bonuses-delta-function-delta-first-second-src-mq3-game-team-bonuses-ml-146349358"></a>
### delta

```ml
function delta(first, second)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_bonuses.ml#L37)

<a id="function-function-mq3-game-team-bonuses-findclass-function-findclass-level-after-name-src-mq3-game-team-bonuses-ml-1420871411"></a>
### findClass

```ml
function findClass(level, after, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `after` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_bonuses.ml#L28)

<a id="function-function-mq3-game-team-bonuses-fragbonuses-function-fragbonuses-level-targ-inflictor-attacker-src-mq3-game-team-bonuses-ml-1630771183"></a>
### fragBonuses

```ml
function fragBonuses(level, targ, inflictor, attacker)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `targ` | `dynamic` | — |  |
| `inflictor` | `dynamic` | — |  |
| `attacker` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_bonuses.ml#L50)

<a id="function-function-mq3-game-team-bonuses-message-function-message-level-text-src-mq3-game-team-bonuses-ml-1410032999"></a>
### message

```ml
function message(level, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_bonuses.ml#L45)

<a id="function-function-mq3-game-team-bonuses-otherteam-function-otherteam-team-src-mq3-game-team-bonuses-ml-1527042505"></a>
### otherTeam

```ml
function otherTeam(team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_bonuses.ml#L13)

<a id="function-function-mq3-game-team-bonuses-sameteam-function-sameteam-level-first-second-src-mq3-game-team-bonuses-ml-1549869034"></a>
### sameTeam

```ml
function sameTeam(level, first, second)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `first` | `dynamic` | — |  |
| `second` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_bonuses.ml#L24)

<a id="function-function-mq3-game-team-bonuses-teamname-function-teamname-team-src-mq3-game-team-bonuses-ml-1028922971"></a>
### teamName

```ml
function teamName(team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/team_bonuses.ml#L18)
