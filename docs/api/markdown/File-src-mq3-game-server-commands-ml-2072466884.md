# `src/mq3/game/server_commands.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.server_commands`](Package-mq3-game-server-commands-829581692.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `textnum` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/game/arenas.ml` as `arenas` → [src/mq3/game/arenas.ml](File-src-mq3-game-arenas-ml-1267669936.md)
- `mq3/game/command_args.ml` as `commandArgs` → [src/mq3/game/command_args.ml](File-src-mq3-game-command-args-ml-1980826409.md)
- `mq3/game/ip_filters.ml` as `ipFilters` → [src/mq3/game/ip_filters.ml](File-src-mq3-game-ip-filters-ml-868936231.md)
- `mq3/game/memory.ml` as `gameMemory` → [src/mq3/game/memory.ml](File-src-mq3-game-memory-ml-2117335517.md)
- `mq3/game/session.ml` as `sessions` → [src/mq3/game/session.ml](File-src-mq3-game-session-ml-1678952582.md)
- `mq3/game/team_changes.ml` as `teamChanges` → [src/mq3/game/team_changes.ml](File-src-mq3-game-team-changes-ml-909995461.md)
- `mq3/shared/info.ml` as `infoStrings` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-server-commands-attach-function-attach-level-addbotfn-botlistfn-abortpodiumfn-src-mq3-game-server-commands-ml-897628771"></a>
### attach

```ml
function attach(level, addBotFn, botListFn, abortPodiumFn)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `addBotFn` | `dynamic` | — |  |
| `botListFn` | `dynamic` | — |  |
| `abortPodiumFn` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/server_commands.ml#L25)

<a id="function-function-mq3-game-server-commands-botboundary-function-botboundary-level-argv-callback-label-src-mq3-game-server-commands-ml-2097865229"></a>
### botBoundary

```ml
function botBoundary(level, argv, callback, label)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |
| `callback` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/server_commands.ml#L87)

<a id="function-function-mq3-game-server-commands-clientforstring-function-clientforstring-level-text-src-mq3-game-server-commands-ml-453295291"></a>
### clientForString

```ml
function clientForString(level, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/server_commands.ml#L59)

<a id="function-function-mq3-game-server-commands-command-function-command-level-argv-src-mq3-game-server-commands-ml-1141385736"></a>
### command

```ml
function command(level, argv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/server_commands.ml#L91)

<a id="function-function-mq3-game-server-commands-entitylist-function-entitylist-level-src-mq3-game-server-commands-ml-84500448"></a>
### entityList

```ml
function entityList(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/server_commands.ml#L41)

<a id="function-function-mq3-game-server-commands-forceteam-function-forceteam-level-argv-src-mq3-game-server-commands-ml-612804390"></a>
### forceTeam

```ml
function forceTeam(level, argv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/server_commands.ml#L81)

<a id="function-function-mq3-game-server-commands-get-function-get-level-src-mq3-game-server-commands-ml-642600692"></a>
### get

```ml
function get(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/server_commands.ml#L21)

<a id="function-function-mq3-game-server-commands-serverprint-function-serverprint-level-text-src-mq3-game-server-commands-ml-1398232029"></a>
### serverPrint

```ml
function serverPrint(level, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/server_commands.ml#L29)

<a id="function-function-mq3-game-server-commands-slottext-function-slottext-value-src-mq3-game-server-commands-ml-1382355081"></a>
### slotText

```ml
function slotText(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/server_commands.ml#L34)

- [mq3.game.server_commands.State](Type-mq3-game-server-commands-state-1908516811.md) — struct
