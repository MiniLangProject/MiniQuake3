# `src/mq3/game/g_spawn.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.g_spawn`](Package-mq3-game-g-spawn-297755815.md)

Reachable from entry: **no**

## Imports

- `mq3/game/spawn.ml` as `spawnKernel` → [src/mq3/game/spawn.ml](File-src-mq3-game-spawn-ml-944765303.md)
- `mq3/game/spawn_tables.ml` as `tables` → [src/mq3/game/spawn_tables.ml](File-src-mq3-game-spawn-tables-ml-2143892395.md)

## Declarations

<a id="function-function-mq3-game-g-spawn-fields-function-fields-src-mq3-game-g-spawn-ml-1361380054"></a>
### fields

```ml
function fields()
```

Forward `fields` to `mq3.game.spawn_tables.fields` and return the delegated result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_spawn.ml#L39)

<a id="function-function-mq3-game-g-spawn-g-addspawnvartoken-function-g-addspawnvartoken-state-value-src-mq3-game-g-spawn-ml-596101484"></a>
### G_AddSpawnVarToken

```ml
function G_AddSpawnVarToken(state, value)
```

Forward `G_AddSpawnVarToken` to `mq3.game.spawn.addToken` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn state; accesses `chars`. May update `state.chars` in place. |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_spawn.ml#L75)

<a id="function-function-mq3-game-g-spawn-g-callspawn-function-g-callspawn-state-ent-src-mq3-game-g-spawn-ml-1558151922"></a>
### G_CallSpawn

```ml
function G_CallSpawn(state, ent)
```

Forward `G_CallSpawn` to `mq3.game.spawn.callSpawn` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn state; accesses `missionpack`, `level` and `unportedFn`. |
| `ent` | `dynamic` | — | Game entity; accesses `classname`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_spawn.ml#L51)

<a id="function-function-mq3-game-g-spawn-g-newstring-function-g-newstring-value-src-mq3-game-g-spawn-ml-1363565921"></a>
### G_NewString

```ml
function G_NewString(value)
```

Forward `G_NewString` to `mq3.game.spawn.newString` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_spawn.ml#L56)

<a id="function-function-mq3-game-g-spawn-g-parsefield-function-g-parsefield-state-key-value-ent-src-mq3-game-g-spawn-ml-1235035744"></a>
### G_ParseField

```ml
function G_ParseField(state, key, value, ent)
```

Forward `G_ParseField` to `mq3.game.spawn.parseLevelField` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | G spawn state; accesses `level`. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |
| `ent` | `dynamic` | — | Game entity; accesses `classname`, `s`, `model`, `model2` and `spawnflags` and related fields. May update `ent.classname`, `ent.s.origin` and `ent.model` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_spawn.ml#L64)

<a id="function-function-mq3-game-g-spawn-g-parsespawnvars-function-g-parsespawnvars-state-src-mq3-game-g-spawn-ml-1297414531"></a>
### G_ParseSpawnVars

```ml
function G_ParseSpawnVars(state)
```

Forward `G_ParseSpawnVars` to `mq3.game.spawn.parseVars` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn state; accesses `vars` and `chars`. May update `state.vars` and `state.chars` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_spawn.ml#L80)

<a id="function-function-mq3-game-g-spawn-g-spawnentitiesfromstring-function-g-spawnentitiesfromstring-state-src-mq3-game-g-spawn-ml-48284965"></a>
### G_SpawnEntitiesFromString

```ml
function G_SpawnEntitiesFromString(state)
```

Forward `G_SpawnEntitiesFromString` to `mq3.game.spawn.load` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn state; accesses `spawning` and `vars`. May update `state.spawning` and `state.vars` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_spawn.ml#L90)

<a id="function-function-mq3-game-g-spawn-g-spawnfloat-function-g-spawnfloat-state-key-defaultstring-src-mq3-game-g-spawn-ml-27790620"></a>
### G_SpawnFloat

```ml
function G_SpawnFloat(state, key, defaultString)
```

Forward `G_SpawnFloat` to `mq3.game.spawn.getFloat` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn values state; accesses `vars`. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |
| `defaultString` | `dynamic` | — | Value used when the requested entry is unavailable. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_spawn.ml#L20)

<a id="function-function-mq3-game-g-spawn-g-spawngentityfromspawnvars-function-g-spawngentityfromspawnvars-state-src-mq3-game-g-spawn-ml-1017037875"></a>
### G_SpawnGEntityFromSpawnVars

```ml
function G_SpawnGEntityFromSpawnVars(state)
```

Forward `G_SpawnGEntityFromSpawnVars` to `mq3.game.spawn.fromVars` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn state; accesses `level`, `vars`, `gametype` and `missionpack`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_spawn.ml#L69)

<a id="function-function-mq3-game-g-spawn-g-spawnint-function-g-spawnint-state-key-defaultstring-src-mq3-game-g-spawn-ml-2072572928"></a>
### G_SpawnInt

```ml
function G_SpawnInt(state, key, defaultString)
```

Forward `G_SpawnInt` to `mq3.game.spawn.getInt` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn values state; accesses `vars`. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |
| `defaultString` | `dynamic` | — | Value used when the requested entry is unavailable. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_spawn.ml#L27)

<a id="function-function-mq3-game-g-spawn-g-spawnstring-function-g-spawnstring-state-key-defaultstring-src-mq3-game-g-spawn-ml-552479392"></a>
### G_SpawnString

```ml
function G_SpawnString(state, key, defaultString)
```

Forward `G_SpawnString` to `mq3.game.spawn.getString` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn values state; accesses `vars`. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |
| `defaultString` | `dynamic` | — | Value used when the requested entry is unavailable. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_spawn.ml#L13)

<a id="function-function-mq3-game-g-spawn-g-spawnvector-function-g-spawnvector-state-key-defaultstring-initial-src-mq3-game-g-spawn-ml-2079884374"></a>
### G_SpawnVector

```ml
function G_SpawnVector(state, key, defaultString, initial)
```

Forward `G_SpawnVector` to `mq3.game.spawn.getVector` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn values state; accesses `vars`. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |
| `defaultString` | `dynamic` | — | Value used when the requested entry is unavailable. |
| `initial` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.textnumbers.vector`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_spawn.ml#L35)

<a id="function-function-mq3-game-g-spawn-sp-item-botroam-function-sp-item-botroam-ent-src-mq3-game-g-spawn-ml-527177823"></a>
### SP_item_botroam

```ml
function SP_item_botroam(ent)
```

Return `void` for `SP_item_botroam`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — | Not read by this implementation; retained in the `SP_item_botroam` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_spawn.ml#L95)

<a id="function-function-mq3-game-g-spawn-sp-worldspawn-function-sp-worldspawn-state-src-mq3-game-g-spawn-ml-513503013"></a>
### SP_worldspawn

```ml
function SP_worldspawn(state)
```

Forward `SP_worldspawn` to `mq3.game.spawn.worldspawn` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn state; accesses `level`, `motd`, `restarted`, `warmupTime` and `doWarmup`. May update `state.level.entities[1022].s.number`, `state.level.entities[1022].classname` and `state.warmupTime` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_spawn.ml#L85)

<a id="function-function-mq3-game-g-spawn-spawns-function-spawns-state-src-mq3-game-g-spawn-ml-1663778359"></a>
### spawns

```ml
function spawns(state)
```

Apply `mq3.game.spawn_tables.missionpackClasses` and `mq3.game.spawn_tables.classes` while evaluating `spawns`. Return paths include `tables.classes()`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | G spawn state; accesses `missionpack`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/g_spawn.ml#L44)
