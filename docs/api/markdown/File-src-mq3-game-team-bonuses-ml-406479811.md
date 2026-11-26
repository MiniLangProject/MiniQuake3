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

Player-award identifier selecting the mask reward.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/team_bonuses.ml#L13)

<a id="function-function-mq3-game-team-bonuses-awarddefense-function-awarddefense-level-attacker-src-mq3-game-team-bonuses-ml-462576133"></a>
### awardDefense

```ml
function awardDefense(level, attacker)
```

Increment the defender award count and set its player-state flag and two-second reward timer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `attacker` | `dynamic` | — | Attacking entity; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/team_bonuses.ml#L59)

<a id="function-function-mq3-game-team-bonuses-delta-function-delta-first-second-src-mq3-game-team-bonuses-ml-146349358"></a>
### delta

```ml
function delta(first, second)
```

Return a new array `[n.fsub(first[0],second[0]),n.fsub(first[1],second[1]),n.fsub(first[2],second[2])]` for `delta`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `first` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |
| `second` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/team_bonuses.ml#L53)

<a id="function-function-mq3-game-team-bonuses-findclass-function-findclass-level-after-name-src-mq3-game-team-bonuses-ml-1420871411"></a>
### findClass

```ml
function findClass(level, after, name)
```

Find the next active entity with a case-insensitive class-name match for team bonuses.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |
| `after` | `dynamic` | — | After record; accesses `slot`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/team_bonuses.ml#L41)

<a id="function-function-mq3-game-team-bonuses-fragbonuses-function-fragbonuses-level-targ-inflictor-attacker-src-mq3-game-team-bonuses-ml-1630771183"></a>
### fragBonuses

```ml
function fragBonuses(level, targ, inflictor, attacker)
```

Update `attacker.client.lastfraggedcarrier`, `attacker.client.fragcarrier`, `attacker.client.carrierdefense` and `targ.client.lasthurtcarrier` and related state during `fragBonuses`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`, `maxclientsCvar`, `entities` and `scene`. |
| `targ` | `dynamic` | — | Targ record; accesses `client` and `r`. May update `targ.client.lasthurtcarrier` in place. |
| `inflictor` | `dynamic` | — | Not read by this implementation; retained in the `fragBonuses` signature. |
| `attacker` | `dynamic` | — | Attacking entity; accesses `client` and `r`. May update `attacker.client.lastfraggedcarrier`, `attacker.client.fragcarrier` and `attacker.client.carrierdefense` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/team_bonuses.ml#L77)

<a id="function-function-mq3-game-team-bonuses-message-function-message-level-text-src-mq3-game-team-bonuses-ml-1410032999"></a>
### message

```ml
function message(level, text)
```

Use `level.teamMessageFn` to perform `message`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `teamMessageFn`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/team_bonuses.ml#L67)

<a id="function-function-mq3-game-team-bonuses-otherteam-function-otherteam-team-src-mq3-game-team-bonuses-ml-1527042505"></a>
### otherTeam

```ml
function otherTeam(team)
```

Exchange red and blue team identifiers for team bonuses, preserving other team values.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/team_bonuses.ml#L16)

<a id="function-function-mq3-game-team-bonuses-sameteam-function-sameteam-level-first-second-src-mq3-game-team-bonuses-ml-1549869034"></a>
### sameTeam

```ml
function sameTeam(level, first, second)
```

Check whether two client entities share a team in a team game for team bonuses.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `first` | `dynamic` | — | First record; accesses `client`. |
| `second` | `dynamic` | — | Second record; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/team_bonuses.ml#L33)

<a id="function-function-mq3-game-team-bonuses-teamname-function-teamname-team-src-mq3-game-team-bonuses-ml-1028922971"></a>
### teamName

```ml
function teamName(team)
```

Execute `if team == c.TEAM_RED then return "RED" end if if team == c.TEAM_BLUE then return "BLUE" end if if team == c.TEAM_SPE...` in `teamName`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/team_bonuses.ml#L23)
