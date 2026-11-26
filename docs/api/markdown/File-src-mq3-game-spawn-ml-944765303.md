# `src/mq3/game/spawn.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.spawn`](Package-mq3-game-spawn-1593603569.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `textnum` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/game/combat.ml` as `combat` → [src/mq3/game/combat.ml](File-src-mq3-game-combat-ml-473208184.md)
- `mq3/game/entities.ml` as `game` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/g_items.ml` as `gameItems` → [src/mq3/game/g_items.ml](File-src-mq3-game-g-items-ml-1981196396.md)
- `mq3/game/g_local.ml` as `local` → [src/mq3/game/g_local.ml](File-src-mq3-game-g-local-ml-1293969097.md)
- `mq3/game/memory.ml` as `memory` → [src/mq3/game/memory.ml](File-src-mq3-game-memory-ml-2117335517.md)
- `mq3/game/movement.ml` as `movement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/game/spawn_functions.ml` as `functions` → [src/mq3/game/spawn_functions.ml](File-src-mq3-game-spawn-functions-ml-1306159949.md)
- `mq3/game/spawn_tables.ml` as `tables` → [src/mq3/game/spawn_tables.ml](File-src-mq3-game-spawn-tables-ml-2143892395.md)
- `mq3/game/spawn_values.ml` as `values` → [src/mq3/game/spawn_values.ml](File-src-mq3-game-spawn-values-ml-1233448418.md)
- `mq3/qcommon/cvar.ml` as `cv` → [src/mq3/qcommon/cvar.ml](File-src-mq3-qcommon-cvar-ml-558393614.md)
- `mq3/shared/parser.ml` as `parser` → [src/mq3/shared/parser.ml](File-src-mq3-shared-parser-ml-1977832534.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-spawn-addtoken-function-addtoken-state-value-src-mq3-game-spawn-ml-644143508"></a>
### addToken

```ml
function addToken(state, value)
```

Set `state.chars` to `next` in `mq3.game.spawn.addToken`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn state; accesses `chars`. May update `state.chars` in place. |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L205)

<a id="function-function-mq3-game-spawn-callspawn-function-callspawn-state-ent-src-mq3-game-spawn-ml-674042530"></a>
### callSpawn

```ml
function callSpawn(state, ent)
```

Use `state.unportedFn` to perform `callSpawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn state; accesses `missionpack`, `level` and `unportedFn`. |
| `ent` | `dynamic` | — | Game entity; accesses `classname`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L281)

<a id="function-function-mq3-game-spawn-create-function-create-level-text-src-mq3-game-spawn-ml-657154539"></a>
### create

```ml
function create(level, text)
```

Set `level.spawner` to `state` and `level.damageFn` to `combat.damage` in `mq3.game.spawn.create`. Return paths include `state`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner` and `damageFn`. May update `level.spawner` and `level.damageFn` in place. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L44)

<a id="function-function-mq3-game-spawn-effect-function-effect-state-kind-index-key-value-src-mq3-game-spawn-ml-217343885"></a>
### effect

```ml
function effect(state, kind, index, key, value)
```

Use `state.effectFn` to perform `effect`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn state; accesses `effectFn`. |
| `kind` | `dynamic` | — | Value passed as argument 2 to `state.effectFn`. |
| `index` | `dynamic` | — | Index of the entry to access. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |
| `value` | `dynamic` | — | Value passed as argument 5 to `state.effectFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L236)

<a id="function-function-mq3-game-spawn-fromvars-function-fromvars-state-src-mq3-game-spawn-ml-274452507"></a>
### fromVars

```ml
function fromVars(state)
```

Apply `mq3.game.entities.spawn`, `mq3.game.spawn.parseLevelField` and `mq3.game.spawn.getInt` while evaluating `fromVars`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn state; accesses `level`, `vars`, `gametype` and `missionpack`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L305)

<a id="function-function-mq3-game-spawn-getfloat-function-getfloat-state-key-fallback-src-mq3-game-spawn-ml-985165628"></a>
### getFloat

```ml
function getFloat(state, key, fallback)
```

Apply `mq3.game.spawn.getString` while evaluating `getFloat`. Return paths include `[result[0],n.f32(textnum.atof(result[1]))]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn values state; accesses `vars`. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |
| `fallback` | `dynamic` | — | Value used when the requested entry is unavailable. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L69)

<a id="function-function-mq3-game-spawn-getint-function-getint-state-key-fallback-src-mq3-game-spawn-ml-493058368"></a>
### getInt

```ml
function getInt(state, key, fallback)
```

Apply `mq3.game.spawn.getString` while evaluating `getInt`. Return paths include `[result[0],textnum.atoi(result[1])]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn values state; accesses `vars`. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |
| `fallback` | `dynamic` | — | Value used when the requested entry is unavailable. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L62)

<a id="function-function-mq3-game-spawn-getstring-function-getstring-state-key-fallback-src-mq3-game-spawn-ml-1007838582"></a>
### getString

```ml
function getString(state, key, fallback)
```

Forward `getString` to `mq3.game.spawn_values.getString` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn values state; accesses `vars`. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |
| `fallback` | `dynamic` | — | Value used when the requested entry is unavailable. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L54)

<a id="function-function-mq3-game-spawn-getvector-function-getvector-state-key-fallback-initial-src-mq3-game-spawn-ml-2078850512"></a>
### getVector

```ml
function getVector(state, key, fallback, initial)
```

Apply `mq3.game.spawn.getString` while evaluating `getVector`. Return paths include `[result[0],values[1]]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn values state; accesses `vars`. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |
| `fallback` | `dynamic` | — | Value used when the requested entry is unavailable. |
| `initial` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.textnumbers.vector`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L77)

<a id="function-function-mq3-game-spawn-load-function-load-state-src-mq3-game-spawn-ml-461778323"></a>
### load

```ml
function load(state)
```

Update `state.spawning` and `state.vars` during `load`. Return paths include `state`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn state; accesses `spawning` and `vars`. May update `state.spawning` and `state.vars` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L326)

<a id="function-function-mq3-game-spawn-newstring-function-newstring-value-src-mq3-game-spawn-ml-519981417"></a>
### newString

```ml
function newString(value)
```

Copy a native spawn string while translating newline escapes and preserving the released backslash escape behavior.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L83)

<a id="function-function-mq3-game-spawn-parsefield-function-parsefield-key-value-ent-src-mq3-game-spawn-ml-1038250227"></a>
### parseField

```ml
function parseField(key, value, ent)
```

Forward `parseField` to `mq3.game.spawn.parseLevelField` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |
| `ent` | `dynamic` | — | Game entity; accesses `classname`, `s`, `model`, `model2` and `spawnflags` and related fields. May update `ent.classname`, `ent.s.origin` and `ent.model` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L103)

<a id="function-function-mq3-game-spawn-parselevelfield-function-parselevelfield-level-key-value-ent-src-mq3-game-spawn-ml-1003926461"></a>
### parseLevelField

```ml
function parseLevelField(level, key, value, ent)
```

Update `ent.classname`, `ent.s.origin`, `ent.model` and `ent.model2` and related state during `parseLevelField`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `memoryState`. May update `level.memoryState` in place. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |
| `ent` | `dynamic` | — | Game entity; accesses `classname`, `s`, `model`, `model2` and `spawnflags` and related fields. May update `ent.classname`, `ent.s.origin` and `ent.model` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L111)

<a id="function-function-mq3-game-spawn-parsevars-function-parsevars-state-src-mq3-game-spawn-ml-72674357"></a>
### parseVars

```ml
function parseVars(state)
```

Update `state.vars` and `state.chars` during `parseVars`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn state; accesses `vars` and `chars`. May update `state.vars` and `state.chars` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L213)

<a id="function-function-mq3-game-spawn-setconfig-function-setconfig-state-index-value-src-mq3-game-spawn-ml-2103218492"></a>
### setConfig

```ml
function setConfig(state, index, value)
```

Forward `setConfig` to `mq3.game.spawn_values.setConfig` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn values state; accesses `configstrings` and `effectFn`. May update `state.configstrings[index]` in place. |
| `index` | `dynamic` | — | Index of the entry to access. |
| `value` | `dynamic` | — | Value passed as argument 5 to `state.effectFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L244)

<a id="function-function-mq3-game-spawn-setcvar-function-setcvar-state-key-value-src-mq3-game-spawn-ml-707472135"></a>
### setCvar

```ml
function setCvar(state, key, value)
```

Apply `mq3.qcommon.cvar.set2` and `mq3.game.spawn.effect` while evaluating `setCvar`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn state; accesses `cvars`. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |
| `value` | `dynamic` | — | Initial value stored in `mq3.qcommon.cvar.Cvar.string`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L251)

<a id="function-function-mq3-game-spawn-spawndiagnostic-function-spawndiagnostic-state-text-src-mq3-game-spawn-ml-1405074930"></a>
### spawnDiagnostic

```ml
function spawnDiagnostic(state, text)
```

Use `state.level.gamePrintFn` to perform `spawnDiagnostic`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn state; accesses `level`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L271)

- [mq3.game.spawn.State](Type-mq3-game-spawn-state-1341454670.md) — struct
<a id="function-function-mq3-game-spawn-token-function-token-state-src-mq3-game-spawn-ml-932534125"></a>
### token

```ml
function token(state)
```

Apply `mq3.shared.parser.parseExt` while evaluating `token`. Return paths include `[state.parser.offset >= 0 or value != "",value]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn state; accesses `parser`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L198)

<a id="function-function-mq3-game-spawn-worldspawn-function-worldspawn-state-src-mq3-game-spawn-ml-1564732003"></a>
### worldspawn

```ml
function worldspawn(state)
```

Update `state.level.entities[1022].s.number`, `state.level.entities[1022].classname` and `state.warmupTime` during `worldspawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Spawn state; accesses `level`, `motd`, `restarted`, `warmupTime` and `doWarmup`. May update `state.level.entities[1022].s.number`, `state.level.entities[1022].classname` and `state.warmupTime` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/spawn.ml#L257)
