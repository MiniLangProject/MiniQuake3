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

Apply `mq3.game.server_commands.get` while evaluating `attach`. Return paths include `state`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `serverCommands`. May update `level.serverCommands` in place. |
| `addBotFn` | `dynamic` | — | Value used by `attach` in `state.addBotFn = addBotFn`. |
| `botListFn` | `dynamic` | — | Value used by `attach` in `state.botListFn = botListFn`. |
| `abortPodiumFn` | `dynamic` | — | Value used by `attach` in `state.abortPodiumFn = abortPodiumFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/server_commands.ml#L33)

<a id="function-function-mq3-game-server-commands-botboundary-function-botboundary-level-argv-callback-label-src-mq3-game-server-commands-ml-2097865229"></a>
### botBoundary

```ml
function botBoundary(level, argv, callback, label)
```

Require the requested bot command callback and invoke it with the level and command arguments.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Value passed as argument 1 to `callback`. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |
| `callback` | `dynamic` | — | Callback invoked by this operation. |
| `label` | `dynamic` | — | Label retained with the diagnostic or action record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/server_commands.ml#L113)

<a id="function-function-mq3-game-server-commands-clientforstring-function-clientforstring-level-text-src-mq3-game-server-commands-ml-453295291"></a>
### clientForString

```ml
function clientForString(level, text)
```

Apply `mq3.shared.info.textBytes` and `mq3.game.server_commands.serverPrint` while evaluating `clientForString`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `maxclients` and `clients`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/server_commands.ml#L77)

<a id="function-function-mq3-game-server-commands-command-function-command-level-argv-src-mq3-game-server-commands-ml-1141385736"></a>
### command

```ml
function command(level, argv)
```

Use `level.consoleCommandFn` and `level.serverCommandFn` to perform `command`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `consoleCommandFn`, `dedicated` and `serverCommandFn`. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/server_commands.ml#L120)

<a id="function-function-mq3-game-server-commands-entitylist-function-entitylist-level-src-mq3-game-server-commands-ml-84500448"></a>
### entityList

```ml
function entityList(level)
```

Apply `mq3.game.server_commands.serverPrint` and `mq3.game.server_commands.slotText` while evaluating `entityList`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/server_commands.ml#L56)

<a id="function-function-mq3-game-server-commands-forceteam-function-forceteam-level-argv-src-mq3-game-server-commands-ml-612804390"></a>
### forceTeam

```ml
function forceTeam(level, argv)
```

Apply `mq3.game.server_commands.clientForString`, `mq3.game.command_args.argument` and `mq3.game.session.sessionSlot` while evaluating `forceTeam`. Return paths include `teamChanges.setTeam(level,level.entities[slot],commandArgs.argument(argv,2,1024))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities`. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/server_commands.ml#L102)

<a id="function-function-mq3-game-server-commands-get-function-get-level-src-mq3-game-server-commands-ml-642600692"></a>
### get

```ml
function get(level)
```

Set `level.serverCommands` to `State(void,void,void)` in `mq3.game.server_commands.get`. Return paths include `level.serverCommands`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `serverCommands`. May update `level.serverCommands` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/server_commands.ml#L24)

<a id="function-function-mq3-game-server-commands-serverprint-function-serverprint-level-text-src-mq3-game-server-commands-ml-1398232029"></a>
### serverPrint

```ml
function serverPrint(level, text)
```

Use `level.gamePrintFn` to perform `serverPrint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/server_commands.ml#L40)

<a id="function-function-mq3-game-server-commands-slottext-function-slottext-value-src-mq3-game-server-commands-ml-1382355081"></a>
### slotText

```ml
function slotText(value)
```

Format a signed client-slot value right-aligned in a field at least three characters wide.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.i32`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/server_commands.ml#L47)

- [mq3.game.server_commands.State](Type-mq3-game-server-commands-state-1908516811.md) — struct
