# `src/mq3/game/spawn_tables.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.spawn_tables`](Package-mq3-game-spawn-tables-1067306487.md)

Reachable from entry: **no**

## Declarations

<a id="function-function-mq3-game-spawn-tables-classes-function-classes-src-mq3-game-spawn-tables-ml-1819704998"></a>
### classes

```ml
function classes()
```

Return the ordered classes table for spawn tables: 48 entries beginning with `"info_player_start"` and `"info_player_deathmatch"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/spawn_tables.ml#L10)

<a id="function-function-mq3-game-spawn-tables-fields-function-fields-src-mq3-game-spawn-tables-ml-2010619526"></a>
### fields

```ml
function fields()
```

Return the ordered fields table for spawn tables: 20 entries beginning with `["classname", "classname", "F_LSTRING"]` and `["origin", "s.origin", "F_VECTOR"]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/spawn_tables.ml#L6)

<a id="function-function-mq3-game-spawn-tables-items-function-items-src-mq3-game-spawn-tables-ml-2130080246"></a>
### items

```ml
function items()
```

Return the ordered items table for spawn tables: 36 entries beginning with `""` and `"item_armor_shard"`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/spawn_tables.ml#L19)

<a id="function-function-mq3-game-spawn-tables-missionpackclasses-function-missionpackclasses-src-mq3-game-spawn-tables-ml-1241886314"></a>
### missionpackClasses

```ml
function missionpackClasses()
```

Return `classes()+["team_redobelisk", "team_blueobelisk", "team_neutralobelisk"]` for `missionpackClasses`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/spawn_tables.ml#L15)

<a id="function-function-mq3-game-spawn-tables-missionpackitems-function-missionpackitems-src-mq3-game-spawn-tables-ml-1862779402"></a>
### missionpackItems

```ml
function missionpackItems()
```

Return `items()+["holdable_kamikaze","holdable_portal","holdable_invulnerability","ammo_nails","ammo_mines","ammo_belt","item_scout","item_guard","item_dou...` for `missionpackItems`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/spawn_tables.ml#L23)
