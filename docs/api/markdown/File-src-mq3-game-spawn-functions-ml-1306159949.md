# `src/mq3/game/spawn_functions.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.spawn_functions`](Package-mq3-game-spawn-functions-1158842135.md)

Reachable from entry: **no**

## Imports

- `mq3/collision/world.ml` as `cm` → [src/mq3/collision/world.ml](File-src-mq3-collision-world-ml-863162236.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `textnum` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/compat/transcendental.ml` as `crt` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/g_misc.ml` as `gMisc` → [src/mq3/game/g_misc.ml](File-src-mq3-game-g-misc-ml-587221462.md)
- `mq3/game/g_mover.ml` as `gMover` → [src/mq3/game/g_mover.ml](File-src-mq3-game-g-mover-ml-1861149167.md)
- `mq3/game/g_target.ml` as `gTarget` → [src/mq3/game/g_target.ml](File-src-mq3-game-g-target-ml-1700130877.md)
- `mq3/game/g_trigger.ml` as `gTrigger` → [src/mq3/game/g_trigger.ml](File-src-mq3-game-g-trigger-ml-185706924.md)
- `mq3/game/hazards.ml` as `hazards` → [src/mq3/game/hazards.ml](File-src-mq3-game-hazards-ml-330250313.md)
- `mq3/game/map_targets.ml` as `mapTargets` → [src/mq3/game/map_targets.ml](File-src-mq3-game-map-targets-ml-50586407.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/game/portals.ml` as `portals` → [src/mq3/game/portals.ml](File-src-mq3-game-portals-ml-1828127247.md)
- `mq3/game/shooters.ml` as `shooters` → [src/mq3/game/shooters.ml](File-src-mq3-game-shooters-ml-1959498419.md)
- `mq3/game/spawn_values.ml` as `values` → [src/mq3/game/spawn_values.ml](File-src-mq3-game-spawn-values-ml-1233448418.md)
- `mq3/game/targets.ml` as `targets` → [src/mq3/game/targets.ml](File-src-mq3-game-targets-ml-1419507080.md)
- `mq3/game/team_missionpack.ml` as `teamMissionpack` → [src/mq3/game/team_missionpack.ml](File-src-mq3-game-team-missionpack-ml-955808983.md)
- `mq3/game/triggers.ml` as `triggers` → [src/mq3/game/triggers.ml](File-src-mq3-game-triggers-ml-802018551.md)
- `mq3/server/world.ml` as `sv` → [src/mq3/server/world.ml](File-src-mq3-server-world-ml-118313937.md)
- `mq3/shared/directions.ml` as `dirs` → [src/mq3/shared/directions.ml](File-src-mq3-shared-directions-ml-575237557.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-spawn-functions-aimattarget-function-aimattarget-level-ent-src-mq3-game-spawn-functions-ml-2000823505"></a>
### aimAtTarget

```ml
function aimAtTarget(level, ent)
```

Update `ent.s.origin2` and `ent.s.origin2[2]` during `aimAtTarget`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `r`, `target` and `s`. May update `ent.s.origin2` and `ent.s.origin2[2]` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/spawn_functions.ml#L64)

<a id="function-function-mq3-game-spawn-functions-dispatch-function-dispatch-level-ent-src-mq3-game-spawn-functions-ml-1143669247"></a>
### dispatch

```ml
function dispatch(level, ent)
```

Set `ent.classname` to `"info_player_deathmatch"` in `mq3.game.spawn_functions.dispatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner` and `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `classname`. May update `ent.classname` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/spawn_functions.ml#L136)

<a id="function-function-mq3-game-spawn-functions-initshooter-function-initshooter-level-ent-weapon-src-mq3-game-spawn-functions-ml-2115834003"></a>
### initShooter

```ml
function initShooter(level, ent, weapon)
```

Update `ent.use`, `ent.s.weapon`, `ent.random` and `ent.think` and related state during `initShooter`. Return paths include `game.link(level,ent)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `use`, `s`, `random`, `target` and `think` and related fields. May update `ent.use`, `ent.s.weapon` and `ent.random` and additional fields in place. |
| `weapon` | `dynamic` | — | Weapon identifier used by the action or inventory lookup. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/spawn_functions.ml#L125)

<a id="function-function-mq3-game-spawn-functions-inittrigger-function-inittrigger-level-ent-src-mq3-game-spawn-functions-ml-1021733195"></a>
### initTrigger

```ml
function initTrigger(level, ent)
```

Set `ent.r.contents` to `0x40000000` and `ent.r.svFlags` to `1` in `mq3.game.spawn_functions.initTrigger`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`, `model` and `r`. May update `ent.r.contents` and `ent.r.svFlags` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/spawn_functions.ml#L56)

<a id="function-function-mq3-game-spawn-functions-laserstart-function-laserstart-level-self-src-mq3-game-spawn-functions-ml-250016416"></a>
### laserStart

```ml
function laserStart(level, self)
```

Update `self.s.eType`, `self.enemy`, `self.use` and `self.think` and related state during `laserStart`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |
| `self` | `dynamic` | — | Entity receiving the callback; accesses `s`, `target`, `classname`, `enemy` and `use` and related fields. May update `self.s.eType`, `self.enemy` and `self.use` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/spawn_functions.ml#L99)

<a id="function-function-mq3-game-spawn-functions-movedirvector-function-movedirvector-angles-src-mq3-game-spawn-functions-ml-2133028172"></a>
### movedirVector

```ml
function movedirVector(angles)
```

Forward `movedirVector` to `mq3.shared.directions.movedirVector` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angles` | `dynamic` | — | Pitch, yaw and roll angles in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/spawn_functions.ml#L30)

<a id="function-function-mq3-game-spawn-functions-playerdeathmatch-function-playerdeathmatch-level-ent-src-mq3-game-spawn-functions-ml-119639895"></a>
### playerDeathmatch

```ml
function playerDeathmatch(level, ent)
```

Set `ent.flags` to `ent.flags | 0x2000` and `ent.flags` to `ent.flags | 0x4000` in `mq3.game.spawn_functions.playerDeathmatch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `flags`. May update `ent.flags` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/spawn_functions.ml#L91)

<a id="function-function-mq3-game-spawn-functions-runthink-function-runthink-level-ent-src-mq3-game-spawn-functions-ml-1003343583"></a>
### runThink

```ml
function runThink(level, ent)
```

Forward `runThink` to `mq3.game.entities.runThink` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time`. |
| `ent` | `dynamic` | — | Game entity; accesses `nextthink` and `think`. May update `ent.nextthink` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/spawn_functions.ml#L85)

<a id="function-function-mq3-game-spawn-functions-setbrushmodel-function-setbrushmodel-level-ent-name-src-mq3-game-spawn-functions-ml-627634548"></a>
### setBrushModel

```ml
function setBrushModel(level, ent, name)
```

Update `ent.s.modelindex`, `ent.r.mins`, `ent.r.maxs` and `ent.r.bmodel` and related state during `setBrushModel`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `scene`. |
| `ent` | `dynamic` | — | Game entity; accesses `s`, `r` and `slot`. May update `ent.s.modelindex`, `ent.r.mins` and `ent.r.maxs` and additional fields in place. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/spawn_functions.ml#L44)

<a id="function-function-mq3-game-spawn-functions-setmovedir-function-setmovedir-ent-src-mq3-game-spawn-functions-ml-779790167"></a>
### setMovedir

```ml
function setMovedir(ent)
```

Set `ent.movedir` to `movedirVector(ent.s.angles)` and `ent.s.angles` to `[0.0,0.0,0.0]` in `mq3.game.spawn_functions.setMovedir`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — | Game entity; accesses `movedir` and `s`. May update `ent.movedir` and `ent.s.angles` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/spawn_functions.ml#L35)
