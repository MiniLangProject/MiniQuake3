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

Apply `mq3.game.player_spawns.randomTeam`, `mq3.game.player_spawns.selectSpawn` and `mq3.game.player_spawns.spawnResult` while evaluating `ctf`. Return paths include `spawnResult(spot,origin,angles)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |
| `teamstate` | `dynamic` | — | Value used by `randomTeam` in `if teamstate == 0 then`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `angles` | `dynamic` | — | Pitch, yaw and roll angles in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/player_spawns.ml#L170)

<a id="function-function-mq3-game-player-spawns-distancefrom-function-distancefrom-spot-point-src-mq3-game-player-spawns-ml-374925736"></a>
### distanceFrom

```ml
function distanceFrom(spot, point)
```

Measure Euclidean distance from a player spawn point to a world-space point.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `spot` | `dynamic` | — | Spot record; accesses `s`. |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/player_spawns.ml#L40)

<a id="function-function-mq3-game-player-spawns-findclass-function-findclass-level-after-name-src-mq3-game-player-spawns-ml-272860753"></a>
### findClass

```ml
function findClass(level, after, name)
```

Find the next active entity with a case-insensitive class-name match for player spawns.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |
| `after` | `dynamic` | — | After record; accesses `slot`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/player_spawns.ml#L15)

<a id="function-function-mq3-game-player-spawns-findintermission-function-findintermission-level-src-mq3-game-player-spawns-ml-668410224"></a>
### findIntermission

```ml
function findIntermission(level)
```

Update `level.intermission_origin` and `level.intermission_angle` during `findIntermission`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `intermission_origin` and `intermission_angle`. May update `level.intermission_origin` and `level.intermission_angle` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/player_spawns.ml#L177)

<a id="function-function-mq3-game-player-spawns-furthest-function-furthest-level-avoid-origin-angles-src-mq3-game-player-spawns-ml-250756977"></a>
### furthest

```ml
function furthest(level, avoid, origin, angles)
```

Apply `mq3.game.player_spawns.findClass`, `mq3.game.player_spawns.wouldTelefrag` and `mq3.game.player_spawns.distanceFrom` while evaluating `furthest`. Return paths include `spawnResult(spots[rnd],origin,angles)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |
| `avoid` | `dynamic` | — | Three-component point used by the geometric query. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `angles` | `dynamic` | — | Pitch, yaw and roll angles in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/player_spawns.ml#L91)

<a id="function-function-mq3-game-player-spawns-initial-function-initial-level-origin-angles-src-mq3-game-player-spawns-ml-2123626330"></a>
### initial

```ml
function initial(level, origin, angles)
```

Apply `mq3.game.player_spawns.findClass`, `mq3.game.player_spawns.selectSpawn` and `mq3.game.player_spawns.wouldTelefrag` while evaluating `initial`. Return paths include `spawnResult(spot,origin,angles)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `angles` | `dynamic` | — | Pitch, yaw and roll angles in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/player_spawns.ml#L130)

<a id="function-function-mq3-game-player-spawns-nearest-function-nearest-level-point-src-mq3-game-player-spawns-ml-512531602"></a>
### nearest

```ml
function nearest(level, point)
```

Apply `mq3.game.player_spawns.findClass` and `mq3.game.player_spawns.distanceFrom` while evaluating `nearest`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/player_spawns.ml#L50)

<a id="function-function-mq3-game-player-spawns-randomdeathmatch-function-randomdeathmatch-level-src-mq3-game-player-spawns-ml-1819014716"></a>
### randomDeathmatch

```ml
function randomDeathmatch(level)
```

Apply `mq3.game.player_spawns.findClass`, `mq3.game.player_spawns.wouldTelefrag` and `mq3.game.entities.random` while evaluating `randomDeathmatch`. Return paths include `spots[game.random(level) % len(spots)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/player_spawns.ml#L62)

<a id="function-function-mq3-game-player-spawns-randomteam-function-randomteam-level-teamstate-team-src-mq3-game-player-spawns-ml-820015881"></a>
### randomTeam

```ml
function randomTeam(level, teamstate, team)
```

Apply `mq3.game.player_spawns.findClass`, `mq3.game.player_spawns.wouldTelefrag` and `mq3.game.entities.random` while evaluating `randomTeam`. Return paths include `spots[game.random(level) % len(spots)]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |
| `teamstate` | `dynamic` | — | Value used by `randomTeam` in `if teamstate == 0 then`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/player_spawns.ml#L145)

<a id="function-function-mq3-game-player-spawns-selectspawn-function-selectspawn-level-avoid-origin-angles-src-mq3-game-player-spawns-ml-2078758599"></a>
### selectSpawn

```ml
function selectSpawn(level, avoid, origin, angles)
```

Forward `selectSpawn` to `mq3.game.player_spawns.furthest` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |
| `avoid` | `dynamic` | — | Three-component point used by the geometric query. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `angles` | `dynamic` | — | Pitch, yaw and roll angles in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/player_spawns.ml#L123)

<a id="function-function-mq3-game-player-spawns-spawnresult-function-spawnresult-spot-origin-angles-src-mq3-game-player-spawns-ml-81563016"></a>
### spawnResult

```ml
function spawnResult(spot, origin, angles)
```

Update `origin[axis]`, `angles[axis]` and `origin[2]` during `spawnResult`. Return paths include `spot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `spot` | `dynamic` | — | Spot record; accesses `s`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. Entries may be updated in place. |
| `angles` | `dynamic` | — | Pitch, yaw and roll angles in degrees. Entries may be updated in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/player_spawns.ml#L78)

<a id="function-function-mq3-game-player-spawns-spectator-function-spectator-level-origin-angles-src-mq3-game-player-spawns-ml-1068794004"></a>
### spectator

```ml
function spectator(level, origin, angles)
```

Set `origin[axis]` to `level.intermission_origin[axis]` and `angles[axis]` to `level.intermission_angle[axis]` in `mq3.game.player_spawns.spectator`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `intermission_origin` and `intermission_angle`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. Entries may be updated in place. |
| `angles` | `dynamic` | — | Pitch, yaw and roll angles in degrees. Entries may be updated in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/player_spawns.ml#L200)

<a id="function-function-mq3-game-player-spawns-wouldtelefrag-function-wouldtelefrag-level-spot-src-mq3-game-player-spawns-ml-798618798"></a>
### wouldTelefrag

```ml
function wouldTelefrag(level, spot)
```

Apply `mq3.server.world.areaEntities` while evaluating `wouldTelefrag`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene` and `entities`. |
| `spot` | `dynamic` | — | Spot record; accesses `s`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/player_spawns.ml#L27)
