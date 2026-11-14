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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_spawn.ml#L21)

<a id="function-function-mq3-game-g-spawn-g-addspawnvartoken-function-g-addspawnvartoken-state-value-src-mq3-game-g-spawn-ml-596101484"></a>
### G_AddSpawnVarToken

```ml
function G_AddSpawnVarToken(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_spawn.ml#L40)

<a id="function-function-mq3-game-g-spawn-g-callspawn-function-g-callspawn-state-ent-src-mq3-game-g-spawn-ml-1558151922"></a>
### G_CallSpawn

```ml
function G_CallSpawn(state, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_spawn.ml#L28)

<a id="function-function-mq3-game-g-spawn-g-newstring-function-g-newstring-value-src-mq3-game-g-spawn-ml-1363565921"></a>
### G_NewString

```ml
function G_NewString(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_spawn.ml#L31)

<a id="function-function-mq3-game-g-spawn-g-parsefield-function-g-parsefield-state-key-value-ent-src-mq3-game-g-spawn-ml-1235035744"></a>
### G_ParseField

```ml
function G_ParseField(state, key, value, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_spawn.ml#L34)

<a id="function-function-mq3-game-g-spawn-g-parsespawnvars-function-g-parsespawnvars-state-src-mq3-game-g-spawn-ml-1297414531"></a>
### G_ParseSpawnVars

```ml
function G_ParseSpawnVars(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_spawn.ml#L43)

<a id="function-function-mq3-game-g-spawn-g-spawnentitiesfromstring-function-g-spawnentitiesfromstring-state-src-mq3-game-g-spawn-ml-48284965"></a>
### G_SpawnEntitiesFromString

```ml
function G_SpawnEntitiesFromString(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_spawn.ml#L49)

<a id="function-function-mq3-game-g-spawn-g-spawnfloat-function-g-spawnfloat-state-key-defaultstring-src-mq3-game-g-spawn-ml-27790620"></a>
### G_SpawnFloat

```ml
function G_SpawnFloat(state, key, defaultString)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `defaultString` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_spawn.ml#L12)

<a id="function-function-mq3-game-g-spawn-g-spawngentityfromspawnvars-function-g-spawngentityfromspawnvars-state-src-mq3-game-g-spawn-ml-1017037875"></a>
### G_SpawnGEntityFromSpawnVars

```ml
function G_SpawnGEntityFromSpawnVars(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_spawn.ml#L37)

<a id="function-function-mq3-game-g-spawn-g-spawnint-function-g-spawnint-state-key-defaultstring-src-mq3-game-g-spawn-ml-2072572928"></a>
### G_SpawnInt

```ml
function G_SpawnInt(state, key, defaultString)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `defaultString` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_spawn.ml#L15)

<a id="function-function-mq3-game-g-spawn-g-spawnstring-function-g-spawnstring-state-key-defaultstring-src-mq3-game-g-spawn-ml-552479392"></a>
### G_SpawnString

```ml
function G_SpawnString(state, key, defaultString)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `defaultString` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_spawn.ml#L9)

<a id="function-function-mq3-game-g-spawn-g-spawnvector-function-g-spawnvector-state-key-defaultstring-initial-src-mq3-game-g-spawn-ml-2079884374"></a>
### G_SpawnVector

```ml
function G_SpawnVector(state, key, defaultString, initial)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `defaultString` | `dynamic` | — |  |
| `initial` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_spawn.ml#L18)

<a id="function-function-mq3-game-g-spawn-sp-item-botroam-function-sp-item-botroam-ent-src-mq3-game-g-spawn-ml-527177823"></a>
### SP_item_botroam

```ml
function SP_item_botroam(ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_spawn.ml#L52)

<a id="function-function-mq3-game-g-spawn-sp-worldspawn-function-sp-worldspawn-state-src-mq3-game-g-spawn-ml-513503013"></a>
### SP_worldspawn

```ml
function SP_worldspawn(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_spawn.ml#L46)

<a id="function-function-mq3-game-g-spawn-spawns-function-spawns-state-src-mq3-game-g-spawn-ml-1663778359"></a>
### spawns

```ml
function spawns(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_spawn.ml#L24)
