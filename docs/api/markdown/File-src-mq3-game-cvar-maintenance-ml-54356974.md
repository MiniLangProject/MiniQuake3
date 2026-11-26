# `src/mq3/game/cvar_maintenance.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.cvar_maintenance`](Package-mq3-game-cvar-maintenance-64205672.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-cvar-maintenance-check-function-check-level-src-mq3-game-cvar-maintenance-ml-1233858482"></a>
### check

```ml
function check(level)
```

Use `level.cvarSetFn` to perform `check`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `cvarMaintenance` and `cvarSetFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/cvar_maintenance.ml#L24)

<a id="function-function-mq3-game-cvar-maintenance-create-function-create-src-mq3-game-cvar-maintenance-ml-116955276"></a>
### create

```ml
function create()
```

Create a `mq3.game.cvar_maintenance.State` record, initializing `lastPasswordModificationCount` as `-1`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/cvar_maintenance.ml#L17)

- [mq3.game.cvar_maintenance.State](Type-mq3-game-cvar-maintenance-state-1996197783.md) — struct
