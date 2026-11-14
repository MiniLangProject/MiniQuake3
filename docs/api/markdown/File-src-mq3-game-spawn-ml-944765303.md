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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/spawn.ml#L168)

<a id="function-function-mq3-game-spawn-callspawn-function-callspawn-state-ent-src-mq3-game-spawn-ml-674042530"></a>
### callSpawn

```ml
function callSpawn(state, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/spawn.ml#L220)

<a id="function-function-mq3-game-spawn-create-function-create-level-text-src-mq3-game-spawn-ml-657154539"></a>
### create

```ml
function create(level, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/spawn.ml#L40)

<a id="function-function-mq3-game-spawn-effect-function-effect-state-kind-index-key-value-src-mq3-game-spawn-ml-217343885"></a>
### effect

```ml
function effect(state, kind, index, key, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/spawn.ml#L191)

<a id="function-function-mq3-game-spawn-fromvars-function-fromvars-state-src-mq3-game-spawn-ml-274452507"></a>
### fromVars

```ml
function fromVars(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/spawn.ml#L242)

<a id="function-function-mq3-game-spawn-getfloat-function-getfloat-state-key-fallback-src-mq3-game-spawn-ml-985165628"></a>
### getFloat

```ml
function getFloat(state, key, fallback)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `fallback` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/spawn.ml#L53)

<a id="function-function-mq3-game-spawn-getint-function-getint-state-key-fallback-src-mq3-game-spawn-ml-493058368"></a>
### getInt

```ml
function getInt(state, key, fallback)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `fallback` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/spawn.ml#L50)

<a id="function-function-mq3-game-spawn-getstring-function-getstring-state-key-fallback-src-mq3-game-spawn-ml-1007838582"></a>
### getString

```ml
function getString(state, key, fallback)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `fallback` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/spawn.ml#L46)

<a id="function-function-mq3-game-spawn-getvector-function-getvector-state-key-fallback-initial-src-mq3-game-spawn-ml-2078850512"></a>
### getVector

```ml
function getVector(state, key, fallback, initial)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `fallback` | `dynamic` | — |  |
| `initial` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/spawn.ml#L56)

<a id="function-function-mq3-game-spawn-load-function-load-state-src-mq3-game-spawn-ml-461778323"></a>
### load

```ml
function load(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/spawn.ml#L261)

<a id="function-function-mq3-game-spawn-newstring-function-newstring-value-src-mq3-game-spawn-ml-519981417"></a>
### newString

```ml
function newString(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/spawn.ml#L60)

<a id="function-function-mq3-game-spawn-parsefield-function-parsefield-key-value-ent-src-mq3-game-spawn-ml-1038250227"></a>
### parseField

```ml
function parseField(key, value, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/spawn.ml#L76)

<a id="function-function-mq3-game-spawn-parselevelfield-function-parselevelfield-level-key-value-ent-src-mq3-game-spawn-ml-1003926461"></a>
### parseLevelField

```ml
function parseLevelField(level, key, value, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/spawn.ml#L79)

<a id="function-function-mq3-game-spawn-parsevars-function-parsevars-state-src-mq3-game-spawn-ml-72674357"></a>
### parseVars

```ml
function parseVars(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/spawn.ml#L174)

<a id="function-function-mq3-game-spawn-setconfig-function-setconfig-state-index-value-src-mq3-game-spawn-ml-2103218492"></a>
### setConfig

```ml
function setConfig(state, index, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `index` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/spawn.ml#L195)

<a id="function-function-mq3-game-spawn-setcvar-function-setcvar-state-key-value-src-mq3-game-spawn-ml-707472135"></a>
### setCvar

```ml
function setCvar(state, key, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/spawn.ml#L198)

<a id="function-function-mq3-game-spawn-spawndiagnostic-function-spawndiagnostic-state-text-src-mq3-game-spawn-ml-1405074930"></a>
### spawnDiagnostic

```ml
function spawnDiagnostic(state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/spawn.ml#L213)

- [mq3.game.spawn.State](Type-mq3-game-spawn-state-1341454670.md) — struct
<a id="function-function-mq3-game-spawn-token-function-token-state-src-mq3-game-spawn-ml-932534125"></a>
### token

```ml
function token(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/spawn.ml#L164)

<a id="function-function-mq3-game-spawn-worldspawn-function-worldspawn-state-src-mq3-game-spawn-ml-1564732003"></a>
### worldspawn

```ml
function worldspawn(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/spawn.ml#L202)
