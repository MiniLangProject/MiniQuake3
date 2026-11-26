# `src/mq3/game/cvars.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.cvars`](Package-mq3-game-cvars-1762148233.md)

Reachable from entry: **no**

## Imports

- `mq3/game/cvar_tables.ml` as `cvarTables` → [src/mq3/game/cvar_tables.ml](File-src-mq3-game-cvar-tables-ml-2116155540.md)
- `mq3/qcommon/cvar.ml` as `cv` → [src/mq3/qcommon/cvar.ml](File-src-mq3-qcommon-cvar-ml-558393614.md)

## Declarations

<a id="function-function-mq3-game-cvars-attach-function-attach-level-builddate-src-mq3-game-cvars-ml-1246252808"></a>
### attach

```ml
function attach(level, buildDate)
```

Set `level.gameCvars` to `state` and `level.cvarSetFn` to `set` in `mq3.game.cvars.attach`. Return paths include `state`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`, `cvarMaintenance`, `gameCvars` and `cvarSetFn`. May update `level.gameCvars` and `level.cvarSetFn` in place. |
| `buildDate` | `dynamic` | — | Value used by `entries` in `["","gamedate",buildDate,64,0,false,false],`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/cvars.ml#L45)

<a id="function-function-mq3-game-cvars-modulestate-function-modulestate-level-src-mq3-game-cvars-ml-1952350476"></a>
### moduleState

```ml
function moduleState(level)
```

Require and return the game cvar module state attached to the level.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gameCvars`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/cvars.ml#L72)

<a id="function-function-mq3-game-cvars-observecvar-function-observecvar-state-kind-index-key-value-src-mq3-game-cvars-ml-920422813"></a>
### observeCvar

```ml
function observeCvar(state, kind, index, key, value)
```

Use `state.effectFn` to perform `observeCvar`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Cvars state; accesses `effectFn`. |
| `kind` | `dynamic` | — | Value passed as argument 2 to `state.effectFn`. |
| `index` | `dynamic` | — | Index of the entry to access. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |
| `value` | `dynamic` | — | Value passed as argument 5 to `state.effectFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/cvars.ml#L82)

<a id="function-function-mq3-game-cvars-rebind-function-rebind-level-state-src-mq3-game-cvars-ml-1205747123"></a>
### rebind

```ml
function rebind(level, state)
```

Update `state.level`, `level.gameCvars`, `level.spawner.cvars` and `level.cvarMaintenance` and related state during `rebind`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`, `gameCvars`, `cvarMaintenance` and `cvarSetFn`. May update `level.gameCvars`, `level.spawner.cvars` and `level.cvarMaintenance` and additional fields in place. |
| `state` | `dynamic` | — | Cvars state; accesses `level`, `registry`, `passwordState` and `rows`. May update `state.level` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/cvars.ml#L60)

<a id="function-function-mq3-game-cvars-register-function-register-level-src-mq3-game-cvars-ml-1715765482"></a>
### register

```ml
function register(level)
```

Set `level.warmupModificationCount` to `level.warmupCvarModificationCount` in `mq3.game.cvars.register`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`, `cvarSetFn`, `warmupModificationCount` and `warmupCvarModificationCount`. May update `level.warmupModificationCount` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/cvars.ml#L208)

<a id="function-function-mq3-game-cvars-remapteamshaders-function-remapteamshaders-level-src-mq3-game-cvars-ml-457204498"></a>
### remapTeamShaders

```ml
function remapTeamShaders(level)
```

Return `void` for `remapTeamShaders`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Not read by this implementation; retained in the `remapTeamShaders` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/cvars.ml#L202)

- [mq3.game.cvars.Row](Type-mq3-game-cvars-row-1047596923.md) — struct
<a id="function-function-mq3-game-cvars-set-function-set-level-key-value-src-mq3-game-cvars-ml-821160706"></a>
### set

```ml
function set(level, key, value)
```

Apply `mq3.game.cvars.moduleState`, `mq3.game.cvars.observeCvar` and `mq3.qcommon.cvar.set2` while evaluating `set`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gameCvars`. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |
| `value` | `dynamic` | — | Value passed as argument 5 to `state.effectFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/cvars.ml#L90)

- [mq3.game.cvars.State](Type-mq3-game-cvars-state-907703542.md) — struct
<a id="function-function-mq3-game-cvars-syncvalue-function-syncvalue-level-row-src-mq3-game-cvars-ml-613341856"></a>
### syncValue

```ml
function syncValue(level, row)
```

Update `level.cheats`, `level.dedicated`, `level.spawner.gametype` and `level.spawner.restarted` and related state during `syncValue`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `cheats`, `dedicated`, `spawner`, `maxclientsCvar` and `dmflags` and related fields. May update `level.cheats`, `level.dedicated` and `level.spawner.gametype` and additional fields in place. |
| `row` | `dynamic` | — | Row record; accesses `vm` and `vmName`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/cvars.ml#L97)

<a id="function-function-mq3-game-cvars-update-function-update-level-src-mq3-game-cvars-ml-1323711670"></a>
### update

```ml
function update(level)
```

Use `level.serverCommandFn` to perform `update`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `serverCommandFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/cvars.ml#L228)
