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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `buildDate` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/cvars.ml#L26)

<a id="function-function-mq3-game-cvars-modulestate-function-modulestate-level-src-mq3-game-cvars-ml-1952350476"></a>
### moduleState

```ml
function moduleState(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/cvars.ml#L48)

<a id="function-function-mq3-game-cvars-observecvar-function-observecvar-state-kind-index-key-value-src-mq3-game-cvars-ml-920422813"></a>
### observeCvar

```ml
function observeCvar(state, kind, index, key, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/cvars.ml#L52)

<a id="function-function-mq3-game-cvars-rebind-function-rebind-level-state-src-mq3-game-cvars-ml-1205747123"></a>
### rebind

```ml
function rebind(level, state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/cvars.ml#L38)

<a id="function-function-mq3-game-cvars-register-function-register-level-src-mq3-game-cvars-ml-1715765482"></a>
### register

```ml
function register(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/cvars.ml#L167)

<a id="function-function-mq3-game-cvars-remapteamshaders-function-remapteamshaders-level-src-mq3-game-cvars-ml-457204498"></a>
### remapTeamShaders

```ml
function remapTeamShaders(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/cvars.ml#L163)

- [mq3.game.cvars.Row](Type-mq3-game-cvars-row-1047596923.md) — struct
<a id="function-function-mq3-game-cvars-set-function-set-level-key-value-src-mq3-game-cvars-ml-821160706"></a>
### set

```ml
function set(level, key, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/cvars.ml#L56)

- [mq3.game.cvars.State](Type-mq3-game-cvars-state-907703542.md) — struct
<a id="function-function-mq3-game-cvars-syncvalue-function-syncvalue-level-row-src-mq3-game-cvars-ml-613341856"></a>
### syncValue

```ml
function syncValue(level, row)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `row` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/cvars.ml#L60)

<a id="function-function-mq3-game-cvars-update-function-update-level-src-mq3-game-cvars-ml-1323711670"></a>
### update

```ml
function update(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/cvars.ml#L185)
