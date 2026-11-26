# `src/mq3/game/utility_commands.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.utility_commands`](Package-mq3-game-utility-commands-1219200121.md)

Reachable from entry: **no**

## Imports

- `mq3/collision/brush.ml` as `utilityBrush` → [src/mq3/collision/brush.ml](File-src-mq3-collision-brush-ml-582513812.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `textnum` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/game/command_args.ml` as `commandArgs` → [src/mq3/game/command_args.ml](File-src-mq3-game-command-args-ml-1980826409.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/deaths.ml` as `utilityDeaths` → [src/mq3/game/deaths.ml](File-src-mq3-game-deaths-ml-761874289.md)
- `mq3/game/entities.ml` as `utilityEntities` → [src/mq3/game/entities.ml](File-src-mq3-game-entities-ml-1863725345.md)
- `mq3/game/intermission.ml` as `utilityIntermission` → [src/mq3/game/intermission.ml](File-src-mq3-game-intermission-ml-2122930812.md)
- `mq3/game/items.ml` as `utilityItems` → [src/mq3/game/items.ml](File-src-mq3-game-items-ml-152650830.md)
- `mq3/game/movement.ml` as `utilityMovement` → [src/mq3/game/movement.ml](File-src-mq3-game-movement-ml-621504687.md)
- `mq3/game/session.ml` as `utilitySessions` → [src/mq3/game/session.ml](File-src-mq3-game-session-ml-1678952582.md)
- `mq3/game/teleport.ml` as `utilityTeleport` → [src/mq3/game/teleport.ml](File-src-mq3-game-teleport-ml-594448221.md)
- `mq3/game/votes.ml` as `utilityVotes` → [src/mq3/game/votes.ml](File-src-mq3-game-votes-ml-1007667129.md)
- `mq3/shared/info.ml` as `utilityInfo` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-utility-commands-cheatsok-function-cheatsok-level-ent-src-mq3-game-utility-commands-ml-120952073"></a>
### cheatsOk

```ml
function cheatsOk(level, ent)
```

Apply `mq3.game.utility_commands.utilitySend` while evaluating `cheatsOk`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `cheats`. |
| `ent` | `dynamic` | — | Game entity; accesses `health`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/utility_commands.ml#L34)

<a id="function-function-mq3-game-utility-commands-give-function-give-level-ent-argv-src-mq3-game-utility-commands-ml-1727088847"></a>
### give

```ml
function give(level, ent, argv)
```

Update `ent.health`, `ent.client.ps.stats[c.STAT_WEAPONS]`, `ent.client.ps.ammo[index]` and `ent.client.ps.stats[c.STAT_ARMOR]` and related state during `give`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `cheats`. |
| `ent` | `dynamic` | — | Game entity; accesses `client`, `health` and `r`. May update `ent.health`, `ent.client.ps.stats[c.STAT_WEAPONS]` and `ent.client.ps.ammo[index]` and additional fields in place. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/utility_commands.ml#L67)

<a id="function-function-mq3-game-utility-commands-god-function-god-level-ent-src-mq3-game-utility-commands-ml-99440033"></a>
### god

```ml
function god(level, ent)
```

Set `ent.flags` to `ent.flags ^ 0x10` in `mq3.game.utility_commands.god`. Return paths include `utilitySend(level,ent,"print \""+message+"\"")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `cheats`. |
| `ent` | `dynamic` | — | Game entity; accesses `flags`. May update `ent.flags` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/utility_commands.ml#L116)

<a id="function-function-mq3-game-utility-commands-kill-function-kill-level-ent-src-mq3-game-utility-commands-ml-855012329"></a>
### kill

```ml
function kill(level, ent)
```

Update `ent.flags`, `ent.client.ps.stats[c.STAT_HEALTH]` and `ent.health` during `kill`. Return paths include `utilityDeaths.playerDie(level,ent,ent,ent,100000,c.MOD_SUICIDE)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `intermissiontime`, `time`, `scene`, `maxclients` and `clients` and related fields. May update `level.deathAnimIndex` in place. |
| `ent` | `dynamic` | — | Game entity; accesses `client`, `health` and `flags`. May update `ent.flags`, `ent.client.ps.stats[c.STAT_HEALTH]` and `ent.health` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/utility_commands.ml#L184)

<a id="function-function-mq3-game-utility-commands-levelshot-function-levelshot-level-ent-src-mq3-game-utility-commands-ml-1389349949"></a>
### levelshot

```ml
function levelshot(level, ent)
```

Apply `mq3.game.utility_commands.cheatsOk`, `mq3.game.utility_commands.utilitySend` and `mq3.game.intermission.begin` while evaluating `levelshot`. Return paths include `utilitySend(level,ent,"clientLevelShot")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `ent` | `dynamic` | — | Game entity; accesses `health`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/utility_commands.ml#L148)

<a id="function-function-mq3-game-utility-commands-noclip-function-noclip-level-ent-src-mq3-game-utility-commands-ml-886016401"></a>
### noclip

```ml
function noclip(level, ent)
```

Set `ent.client.noclip` to `not ent.client.noclip` in `mq3.game.utility_commands.noclip`. Return paths include `utilitySend(level,ent,"print \""+message+"\"")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `cheats`. |
| `ent` | `dynamic` | — | Game entity; accesses `client`. May update `ent.client.noclip` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/utility_commands.ml#L136)

<a id="function-function-mq3-game-utility-commands-notarget-function-notarget-level-ent-src-mq3-game-utility-commands-ml-1274736257"></a>
### notarget

```ml
function notarget(level, ent)
```

Set `ent.flags` to `ent.flags ^ 0x20` in `mq3.game.utility_commands.notarget`. Return paths include `utilitySend(level,ent,"print \""+message+"\"")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `cheats`. |
| `ent` | `dynamic` | — | Game entity; accesses `flags`. May update `ent.flags` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/utility_commands.ml#L126)

<a id="function-function-mq3-game-utility-commands-setviewpos-function-setviewpos-level-ent-argv-src-mq3-game-utility-commands-ml-2049844847"></a>
### setViewpos

```ml
function setViewpos(level, ent, argv)
```

Apply `mq3.game.utility_commands.utilitySend`, `mq3.game.command_args.argument` and `mq3.game.teleport.player` while evaluating `setViewpos`. Return paths include `utilityTeleport.player(level,ent,origin,angles)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `cheats`. |
| `ent` | `dynamic` | — | Game entity; accesses `slot`. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/utility_commands.ml#L195)

<a id="function-function-mq3-game-utility-commands-stats-function-stats-level-ent-src-mq3-game-utility-commands-ml-80388627"></a>
### stats

```ml
function stats(level, ent)
```

Return `void` for `stats`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Not read by this implementation; retained in the `stats` signature. |
| `ent` | `dynamic` | — | Not read by this implementation; retained in the `stats` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/utility_commands.ml#L210)

<a id="function-function-mq3-game-utility-commands-teamtask-function-teamtask-level-ent-argv-src-mq3-game-utility-commands-ml-886612863"></a>
### teamTask

```ml
function teamTask(level, ent, argv)
```

Use `level.userinfoFn` and `level.userinfoSetFn` to perform `teamTask`. Return paths include `utilityVotes.userinfoChanged(level,clientSlot)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `userinfoFn` and `userinfoSetFn`. |
| `ent` | `dynamic` | — | Game entity; accesses `client`. |
| `argv` | `dynamic` | — | Command argument strings in their original order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/utility_commands.ml#L168)

<a id="function-function-mq3-game-utility-commands-utilityfinditem-function-utilityfinditem-name-src-mq3-game-utility-commands-ml-1772081585"></a>
### utilityFindItem

```ml
function utilityFindItem(name)
```

Apply `mq3.shared.info.textBytes` while evaluating `utilityFindItem`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/utility_commands.ml#L47)

<a id="function-function-mq3-game-utility-commands-utilityinfodiagnostic-function-utilityinfodiagnostic-level-message-src-mq3-game-utility-commands-ml-295682813"></a>
### utilityInfoDiagnostic

```ml
function utilityInfoDiagnostic(level, message)
```

Use `level.gamePrintFn` to perform `utilityInfoDiagnostic`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `gamePrintFn`. |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/utility_commands.ml#L159)

<a id="function-function-mq3-game-utility-commands-utilitysend-function-utilitysend-level-ent-message-src-mq3-game-utility-commands-ml-1418839774"></a>
### utilitySend

```ml
function utilitySend(level, ent, message)
```

Use `level.serverCommandFn` to perform `utilitySend`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `serverCommandFn`. |
| `ent` | `dynamic` | — | Game entity; accesses `slot`. |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/utility_commands.ml#L25)
