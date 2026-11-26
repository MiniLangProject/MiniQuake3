# `src/mq3/game/spawn_values.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.spawn_values`](Package-mq3-game-spawn-values-1057899936.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `textnum` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-spawn-values-configindex-function-configindex-state-name-start-capacity-create-src-mq3-game-spawn-values-ml-490883442"></a>
### configIndex

```ml
function configIndex(state, name, start, capacity, create)
```

Apply `mq3.game.spawn_values.setConfig` while evaluating `configIndex`. Return paths include `index`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn values state; accesses `configstrings`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `start` | `dynamic` | — | Value used by `configIndex` in `if start < 0 or capacity < 1 or start+capacity > 1024 then return error(485,"Invalid configstring range") end if`. |
| `capacity` | `dynamic` | — | Maximum number of entries to allocate or retain. |
| `create` | `dynamic` | — | Value used by `configIndex` in `if not create then return 0 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/spawn_values.ml#L47)

<a id="function-function-mq3-game-spawn-values-getfloat-function-getfloat-state-key-fallback-src-mq3-game-spawn-values-ml-554110950"></a>
### getFloat

```ml
function getFloat(state, key, fallback)
```

Apply `mq3.game.spawn_values.getString` while evaluating `getFloat`. Return paths include `[value[0],n.f32(textnum.atof(value[1]))]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn values state; accesses `vars`. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |
| `fallback` | `dynamic` | — | Value used when the requested entry is unavailable. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/spawn_values.ml#L28)

<a id="function-function-mq3-game-spawn-values-getint-function-getint-state-key-fallback-src-mq3-game-spawn-values-ml-263140546"></a>
### getInt

```ml
function getInt(state, key, fallback)
```

Apply `mq3.game.spawn_values.getString` while evaluating `getInt`. Return paths include `[value[0],textnum.atoi(value[1])]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn values state; accesses `vars`. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |
| `fallback` | `dynamic` | — | Value used when the requested entry is unavailable. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/spawn_values.ml#L21)

<a id="function-function-mq3-game-spawn-values-getstring-function-getstring-state-key-fallback-src-mq3-game-spawn-values-ml-881266688"></a>
### getString

```ml
function getString(state, key, fallback)
```

Look up a spawn key case-insensitively and return a found flag with either its text or the supplied fallback.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn values state; accesses `vars`. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |
| `fallback` | `dynamic` | — | Value used when the requested entry is unavailable. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/spawn_values.ml#L11)

<a id="function-function-mq3-game-spawn-values-modelindex-function-modelindex-state-name-src-mq3-game-spawn-values-ml-737307678"></a>
### modelIndex

```ml
function modelIndex(state, name)
```

Forward `modelIndex` to `mq3.game.spawn_values.configIndex` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn values state; accesses `configstrings`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/spawn_values.ml#L73)

<a id="function-function-mq3-game-spawn-values-setconfig-function-setconfig-state-index-value-src-mq3-game-spawn-values-ml-1583478660"></a>
### setConfig

```ml
function setConfig(state, index, value)
```

Set `state.configstrings[index]` to `""` and `state.configstrings[index]` to `value` in `mq3.game.spawn_values.setConfig`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn values state; accesses `configstrings` and `effectFn`. May update `state.configstrings[index]` in place. |
| `index` | `dynamic` | — | Index of the entry to access. |
| `value` | `dynamic` | — | Value passed as argument 5 to `state.effectFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/spawn_values.ml#L35)

<a id="function-function-mq3-game-spawn-values-soundindex-function-soundindex-state-name-src-mq3-game-spawn-values-ml-1563858458"></a>
### soundIndex

```ml
function soundIndex(state, name)
```

Forward `soundIndex` to `mq3.game.spawn_values.configIndex` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn values state; accesses `configstrings`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/spawn_values.ml#L67)
