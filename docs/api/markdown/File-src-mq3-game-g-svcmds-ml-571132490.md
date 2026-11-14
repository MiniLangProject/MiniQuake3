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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_svcmds.ml#L11)

<a id="function-function-mq3-game-g-svcmds-clientforstring-function-clientforstring-level-text-src-mq3-game-g-svcmds-ml-793502435"></a>
### ClientForString

```ml
function ClientForString(level, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_svcmds.ml#L16)

<a id="function-function-mq3-game-g-svcmds-consolecommand-function-consolecommand-level-argv-src-mq3-game-g-svcmds-ml-907843480"></a>
### ConsoleCommand

```ml
function ConsoleCommand(level, argv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_svcmds.ml#L18)

<a id="function-function-mq3-game-g-svcmds-g-filterpacket-function-g-filterpacket-level-address-src-mq3-game-g-svcmds-ml-179687034"></a>
### G_FilterPacket

```ml
function G_FilterPacket(level, address)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `address` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_svcmds.ml#L10)

<a id="function-function-mq3-game-g-svcmds-g-processipbans-function-g-processipbans-level-src-mq3-game-g-svcmds-ml-674433882"></a>
### G_ProcessIPBans

```ml
function G_ProcessIPBans(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_svcmds.ml#L12)

<a id="function-function-mq3-game-g-svcmds-stringtofilter-function-stringtofilter-level-text-filter-src-mq3-game-g-svcmds-ml-1020005275"></a>
### StringToFilter

```ml
function StringToFilter(level, text, filter)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `filter` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_svcmds.ml#L8)

<a id="function-function-mq3-game-g-svcmds-svcmd-addip-f-function-svcmd-addip-f-level-argv-src-mq3-game-g-svcmds-ml-1267327690"></a>
### Svcmd_AddIP_f

```ml
function Svcmd_AddIP_f(level, argv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_svcmds.ml#L13)

<a id="function-function-mq3-game-g-svcmds-svcmd-entitylist-f-function-svcmd-entitylist-f-level-src-mq3-game-g-svcmds-ml-1111883474"></a>
### Svcmd_EntityList_f

```ml
function Svcmd_EntityList_f(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_svcmds.ml#L15)

<a id="function-function-mq3-game-g-svcmds-svcmd-forceteam-f-function-svcmd-forceteam-f-level-argv-src-mq3-game-g-svcmds-ml-1440453538"></a>
### Svcmd_ForceTeam_f

```ml
function Svcmd_ForceTeam_f(level, argv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_svcmds.ml#L17)

<a id="function-function-mq3-game-g-svcmds-svcmd-removeip-f-function-svcmd-removeip-f-level-argv-src-mq3-game-g-svcmds-ml-740534072"></a>
### Svcmd_RemoveIP_f

```ml
function Svcmd_RemoveIP_f(level, argv)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `argv` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_svcmds.ml#L14)

<a id="function-function-mq3-game-g-svcmds-updateipbans-function-updateipbans-level-src-mq3-game-g-svcmds-ml-325881778"></a>
### UpdateIPBans

```ml
function UpdateIPBans(level)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/g_svcmds.ml#L9)
