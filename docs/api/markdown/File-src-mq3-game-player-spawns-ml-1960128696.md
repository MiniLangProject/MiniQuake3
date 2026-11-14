# `src/mq3/game/player_spawns.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.player_spawns`](Package-mq3-game-player-spawns-1984648040.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/server/world.ml` as `sv` → [src/mq3/server/world.ml](File-src-mq3-server-world-ml-118313937.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-player-spawns-ctf-function-ctf-level-team-teamstate-origin-angles-src-mq3-game-player-spawns-ml-757172931"></a>
### ctf

```ml
function ctf(level, team, teamstate, origin, angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |
| `teamstate` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/player_spawns.ml#L127)

<a id="function-function-mq3-game-player-spawns-distancefrom-function-distancefrom-spot-point-src-mq3-game-player-spawns-ml-374925736"></a>
### distanceFrom

```ml
function distanceFrom(spot, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `spot` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/player_spawns.ml#L30)

<a id="function-function-mq3-game-player-spawns-findclass-function-findclass-level-after-name-src-mq3-game-player-spawns-ml-272860753"></a>
### findClass

```ml
function findClass(level, after, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `after` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/player_spawns.ml#L11)

<a id="function-function-mq3-game-player-spawns-findintermission-function-findintermission-level-src-mq3-game-player-spawns-ml-668410224"></a>
### findIntermission

```ml
function findIntermission(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/player_spawns.ml#L132)

<a id="function-function-mq3-game-player-spawns-furthest-function-furthest-level-avoid-origin-angles-src-mq3-game-player-spawns-ml-250756977"></a>
### furthest

```ml
function furthest(level, avoid, origin, angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `avoid` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/player_spawns.ml#L67)

<a id="function-function-mq3-game-player-spawns-initial-function-initial-level-origin-angles-src-mq3-game-player-spawns-ml-2123626330"></a>
### initial

```ml
function initial(level, origin, angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/player_spawns.ml#L97)

<a id="function-function-mq3-game-player-spawns-nearest-function-nearest-level-point-src-mq3-game-player-spawns-ml-512531602"></a>
### nearest

```ml
function nearest(level, point)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/player_spawns.ml#L37)

<a id="function-function-mq3-game-player-spawns-randomdeathmatch-function-randomdeathmatch-level-src-mq3-game-player-spawns-ml-1819014716"></a>
### randomDeathmatch

```ml
function randomDeathmatch(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/player_spawns.ml#L47)

<a id="function-function-mq3-game-player-spawns-randomteam-function-randomteam-level-teamstate-team-src-mq3-game-player-spawns-ml-820015881"></a>
### randomTeam

```ml
function randomTeam(level, teamstate, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `teamstate` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/player_spawns.ml#L108)

<a id="function-function-mq3-game-player-spawns-selectspawn-function-selectspawn-level-avoid-origin-angles-src-mq3-game-player-spawns-ml-2078758599"></a>
### selectSpawn

```ml
function selectSpawn(level, avoid, origin, angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `avoid` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/player_spawns.ml#L94)

<a id="function-function-mq3-game-player-spawns-spawnresult-function-spawnresult-spot-origin-angles-src-mq3-game-player-spawns-ml-81563016"></a>
### spawnResult

```ml
function spawnResult(spot, origin, angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `spot` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/player_spawns.ml#L59)

<a id="function-function-mq3-game-player-spawns-spectator-function-spectator-level-origin-angles-src-mq3-game-player-spawns-ml-1068794004"></a>
### spectator

```ml
function spectator(level, origin, angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/player_spawns.ml#L151)

<a id="function-function-mq3-game-player-spawns-wouldtelefrag-function-wouldtelefrag-level-spot-src-mq3-game-player-spawns-ml-798618798"></a>
### wouldTelefrag

```ml
function wouldTelefrag(level, spot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `spot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/player_spawns.ml#L20)
