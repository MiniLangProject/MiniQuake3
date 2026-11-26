# `src/mq3/game/g_svcmds.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.g_svcmds`](Package-mq3-game-g-svcmds-1510158568.md)

Reachable from entry: **no**

## Imports

- `mq3/game/ip_filters.ml` as `filters` → [src/mq3/game/ip_filters.ml](File-src-mq3-game-ip-filters-ml-868936231.md)
- `mq3/game/server_commands.ml` as `commands` → [src/mq3/game/server_commands.ml](File-src-mq3-game-server-commands-ml-2072466884.md)

## Declarations

<a id="function-function-mq3-game-g-svcmds-addip-function-addip-level-address-src-mq3-game-g-svcmds-ml-747265974"></a>
### AddIP

```ml
function AddIP(level, address)
```

Forward `AddIP` to `mq3.game.ip_filters.addIP` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `ipFilters`. May update `level.ipFilters` in place. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_svcmds.ml#L23)

<a id="function-function-mq3-game-g-svcmds-clientforstring-function-clientforstring-level-text-src-mq3-game-g-svcmds-ml-793502435"></a>
### ClientForString

```ml
function ClientForString(level, text)
```

Forward `ClientForString` to `mq3.game.server_commands.clientForString` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `maxclients` and `clients`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_svcmds.ml#L41)

<a id="function-function-mq3-game-g-svcmds-consolecommand-function-consolecommand-level-argv-src-mq3-game-g-svcmds-ml-907843480"></a>
### ConsoleCommand

```ml
function ConsoleCommand(level, argv)
```

Forward `ConsoleCommand` to `mq3.game.server_commands.command` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `consoleCommandFn`, `dedicated` and `serverCommandFn`. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_svcmds.ml#L49)

<a id="function-function-mq3-game-g-svcmds-g-filterpacket-function-g-filterpacket-level-address-src-mq3-game-g-svcmds-ml-179687034"></a>
### G_FilterPacket

```ml
function G_FilterPacket(level, address)
```

Forward `G_FilterPacket` to `mq3.game.ip_filters.filterPacket` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `ipFilters`. May update `level.ipFilters` in place. |
| `address` | `dynamic` | — | Address within the VM memory or native data buffer. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_svcmds.ml#L19)

<a id="function-function-mq3-game-g-svcmds-g-processipbans-function-g-processipbans-level-src-mq3-game-g-svcmds-ml-674433882"></a>
### G_ProcessIPBans

```ml
function G_ProcessIPBans(level)
```

Forward `G_ProcessIPBans` to `mq3.game.ip_filters.processBans` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `ipFilters`. May update `level.ipFilters` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_svcmds.ml#L26)

<a id="function-function-mq3-game-g-svcmds-stringtofilter-function-stringtofilter-level-text-filter-src-mq3-game-g-svcmds-ml-1020005275"></a>
### StringToFilter

```ml
function StringToFilter(level, text, filter)
```

Forward `StringToFilter` to `mq3.game.ip_filters.stringToFilter` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |
| `filter` | `dynamic` | — | Filter record; accesses `mask` and `compare`. May update `filter.mask` and `filter.compare` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_svcmds.ml#L12)

<a id="function-function-mq3-game-g-svcmds-svcmd-addip-f-function-svcmd-addip-f-level-argv-src-mq3-game-g-svcmds-ml-1267327690"></a>
### Svcmd_AddIP_f

```ml
function Svcmd_AddIP_f(level, argv)
```

Forward `Svcmd_AddIP_f` to `mq3.game.ip_filters.addCommand` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_svcmds.ml#L30)

<a id="function-function-mq3-game-g-svcmds-svcmd-entitylist-f-function-svcmd-entitylist-f-level-src-mq3-game-g-svcmds-ml-1111883474"></a>
### Svcmd_EntityList_f

```ml
function Svcmd_EntityList_f(level)
```

Forward `Svcmd_EntityList_f` to `mq3.game.server_commands.entityList` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `num_entities` and `entities`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_svcmds.ml#L37)

<a id="function-function-mq3-game-g-svcmds-svcmd-forceteam-f-function-svcmd-forceteam-f-level-argv-src-mq3-game-g-svcmds-ml-1440453538"></a>
### Svcmd_ForceTeam_f

```ml
function Svcmd_ForceTeam_f(level, argv)
```

Forward `Svcmd_ForceTeam_f` to `mq3.game.server_commands.forceTeam` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `entities`. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_svcmds.ml#L45)

<a id="function-function-mq3-game-g-svcmds-svcmd-removeip-f-function-svcmd-removeip-f-level-argv-src-mq3-game-g-svcmds-ml-740534072"></a>
### Svcmd_RemoveIP_f

```ml
function Svcmd_RemoveIP_f(level, argv)
```

Forward `Svcmd_RemoveIP_f` to `mq3.game.ip_filters.removeCommand` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_svcmds.ml#L34)

<a id="function-function-mq3-game-g-svcmds-updateipbans-function-updateipbans-level-src-mq3-game-g-svcmds-ml-325881778"></a>
### UpdateIPBans

```ml
function UpdateIPBans(level)
```

Forward `UpdateIPBans` to `mq3.game.ip_filters.updateBans` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `cvarSetFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/g_svcmds.ml#L15)
