# `src/mq3/game/bot_population.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.bot_population`](Package-mq3-game-bot-population-1885615843.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/textnumbers.ml` as `textnum` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/game/bot_clients.ml` as `botClients` → [src/mq3/game/bot_clients.ml](File-src-mq3-game-bot-clients-ml-237353140.md)
- `mq3/game/bot_registry.ml` as `botRegistry` → [src/mq3/game/bot_registry.ml](File-src-mq3-game-bot-registry-ml-1422489899.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/qcommon/cvar.ml` as `cv` → [src/mq3/qcommon/cvar.ml](File-src-mq3-qcommon-cvar-ml-558393614.md)
- `mq3/shared/info.ml` as `infoStrings` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-bot-population-addbot-function-addbot-level-state-name-skill-team-delay-altname-src-mq3-game-bot-population-ml-1954019837"></a>
### addBot

```ml
function addBot(level, state, name, skill, team, delay, altname)
```

Record or dispatch `"^1Error: bot has no aifile specified\n"` and `"^1Unable to add bot. All player slots are in use.\n"` actions in `addBot`. Return paths include `clientNum`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `maxclients`, `spawner` and `entities`. |
| `state` | `dynamic` | — | Bot population state; accesses `registry`, `allocateClientFn`, `setUserinfoFn`, `connectClientFn` and `clients`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `skill` | `dynamic` | — | Bot skill value used to select or interpolate characteristics. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |
| `delay` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.add32`. |
| `altname` | `dynamic` | — | Value used by `addBot` in `if altname != void and altname != "" then botname = altname end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L234)

<a id="function-function-mq3-game-bot-population-addrandombot-function-addrandombot-level-state-team-src-mq3-game-bot-population-ml-824596388"></a>
### addRandomBot

```ml
function addRandomBot(level, state, team)
```

Apply `mq3.shared.info.value`, `mq3.game.bot_population.botAlreadyUsed` and `mq3.game.bot_population.console` while evaluating `addRandomBot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clients`. |
| `state` | `dynamic` | — | Bot population state; accesses `registry` and `spSkill`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L125)

<a id="constant-constant-mq3-game-bot-population-bot-begin-delay-base-const-bot-begin-delay-base-2000-src-mq3-game-bot-population-ml-804866861"></a>
### BOT_BEGIN_DELAY_BASE

```ml
const BOT_BEGIN_DELAY_BASE = 2000
```

Initial delay in milliseconds before queued bots begin playing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L27)

<a id="constant-constant-mq3-game-bot-population-bot-begin-delay-increment-const-bot-begin-delay-increment-1500-src-mq3-game-bot-population-ml-1550680933"></a>
### BOT_BEGIN_DELAY_INCREMENT

```ml
const BOT_BEGIN_DELAY_INCREMENT = 1500
```

Additional delay in milliseconds used to stagger consecutive bot starts.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L29)

<a id="function-function-mq3-game-bot-population-botalreadyused-function-botalreadyused-level-state-name-team-src-mq3-game-bot-population-ml-516101435"></a>
### botAlreadyUsed

```ml
function botAlreadyUsed(level, state, name, team)
```

Apply `mq3.game.bot_clients.clientLimit` and `mq3.game.bot_clients.entityForClient` while evaluating `botAlreadyUsed`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clients`. |
| `state` | `dynamic` | — | Not read by this implementation; retained in the `botAlreadyUsed` signature. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L108)

<a id="function-function-mq3-game-bot-population-botlist-function-botlist-level-state-src-mq3-game-bot-population-ml-1859880911"></a>
### botList

```ml
function botList(level, state)
```

Apply `mq3.game.bot_population.output`, `mq3.shared.info.value` and `mq3.game.bot_population.padded` while evaluating `botList`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Value passed as argument 1 to `state.printFn`. |
| `state` | `dynamic` | — | Bot population state; accesses `registry`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L314)

<a id="function-function-mq3-game-bot-population-checkminimumplayers-function-checkminimumplayers-level-state-src-mq3-game-bot-population-ml-627732185"></a>
### checkMinimumPlayers

```ml
function checkMinimumPlayers(level, state)
```

Set `state.checkTime` to `level.time` and `state.minimumPlayers` to `state.minimumVm.integer` in `mq3.game.bot_population.checkMinimumPlayers`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `intermissiontime`, `time`, `spawner` and `maxclients`. |
| `state` | `dynamic` | — | Bot population state; accesses `checkTime`, `minimumVm`, `minimumPlayers` and `clients`. May update `state.checkTime` and `state.minimumPlayers` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L161)

<a id="function-function-mq3-game-bot-population-clean-function-clean-text-src-mq3-game-bot-population-ml-140792423"></a>
### clean

```ml
function clean(text)
```

Apply `mq3.shared.info.textBytes` while evaluating `clean`. Return paths include `decode(bytes(result))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L92)

<a id="function-function-mq3-game-bot-population-console-function-console-level-state-text-src-mq3-game-bot-population-ml-113469708"></a>
### console

```ml
function console(level, state, text)
```

Use `state.consoleFn` to perform `console`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Value passed as argument 1 to `state.consoleFn`. |
| `state` | `dynamic` | — | Bot population state; accesses `consoleFn`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L85)

<a id="function-function-mq3-game-bot-population-create-function-create-registry-clients-src-mq3-game-bot-population-ml-1052471601"></a>
### create

```ml
function create(registry, clients)
```

Create a `mq3.game.bot_population.State` record, initializing `registry` from `registry`, `clients` from `clients` and `spSkill` as `4.0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — | Initial value stored in `mq3.game.bot_population.State.registry`. |
| `clients` | `dynamic` | — | Initial value stored in `mq3.game.bot_population.State.clients`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L68)

<a id="constant-constant-mq3-game-bot-population-exec-insert-const-exec-insert-1-src-mq3-game-bot-population-ml-1939338088"></a>
### EXEC_INSERT

```ml
const EXEC_INSERT = 1
```

Console-command execution mode selecting insert scheduling.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L25)

<a id="constant-constant-mq3-game-bot-population-gt-ffa-const-gt-ffa-0-src-mq3-game-bot-population-ml-1225328225"></a>
### GT_FFA

```ml
const GT_FFA = 0
```

Game-mode identifier selecting ffa rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L15)

<a id="constant-constant-mq3-game-bot-population-gt-single-player-const-gt-single-player-2-src-mq3-game-bot-population-ml-2073040749"></a>
### GT_SINGLE_PLAYER

```ml
const GT_SINGLE_PLAYER = 2
```

Game-mode identifier selecting single player rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L19)

<a id="constant-constant-mq3-game-bot-population-gt-team-const-gt-team-3-src-mq3-game-bot-population-ml-902228270"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```

Game-mode identifier selecting team rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L21)

<a id="constant-constant-mq3-game-bot-population-gt-tournament-const-gt-tournament-1-src-mq3-game-bot-population-ml-43567092"></a>
### GT_TOURNAMENT

```ml
const GT_TOURNAMENT = 1
```

Game-mode identifier selecting tournament rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L17)

<a id="function-function-mq3-game-bot-population-infoset-function-infoset-level-state-value-key-text-src-mq3-game-bot-population-ml-219126870"></a>
### infoSet

```ml
function infoSet(level, state, value, key, text)
```

Forward `infoSet` to `mq3.shared.info.setValue` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Context forwarded to the configured host callbacks. |
| `state` | `dynamic` | — | Bot population state; accesses `printFn`. |
| `value` | `dynamic` | — | Text to parse, format or deliver. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L198)

<a id="function-function-mq3-game-bot-population-initsingleplayer-function-initsingleplayer-level-state-restart-mapname-src-mq3-game-bot-population-ml-1714272405"></a>
### initSinglePlayer

```ml
function initSinglePlayer(level, state, restart, mapname)
```

Use `state.cvarSetFn` to perform `initSinglePlayer`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `spawner`. |
| `state` | `dynamic` | — | Bot population state; accesses `registry` and `cvarSetFn`. |
| `restart` | `dynamic` | — | Whether initialization or shutdown belongs to a map restart. |
| `mapname` | `dynamic` | — | Value passed as argument 2 to `std.string.equalsIgnoreCaseAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L352)

<a id="function-function-mq3-game-bot-population-output-function-output-level-state-text-src-mq3-game-bot-population-ml-1530164714"></a>
### output

```ml
function output(level, state, text)
```

Use `state.printFn` to perform `output`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Value passed as argument 1 to `state.printFn`. |
| `state` | `dynamic` | — | Bot population state; accesses `printFn`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L76)

<a id="function-function-mq3-game-bot-population-padded-function-padded-text-width-src-mq3-game-bot-population-ml-1106611413"></a>
### padded

```ml
function padded(text, width)
```

Right-pad a bot-list field to the requested width and append one separating space.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text to parse, format or deliver. |
| `width` | `dynamic` | — | Operand used to evaluate the returned expression `text+decode(bytes(width-len(data),32))+" "`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L306)

<a id="function-function-mq3-game-bot-population-pickteam-function-pickteam-level-ignore-src-mq3-game-bot-population-ml-516529612"></a>
### pickTeam

```ml
function pickTeam(level, ignore)
```

Apply `mq3.game.bot_population.teamCount` while evaluating `pickTeam`. Return paths include `c.TEAM_BLUE`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `teamScores`. |
| `ignore` | `dynamic` | — | Value used by `teamCount` in `if slot != ignore and client.connected != 0 and client.team == team then count = count+1 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L218)

<a id="function-function-mq3-game-bot-population-removerandombot-function-removerandombot-level-state-team-src-mq3-game-bot-population-ml-1024330712"></a>
### removeRandomBot

```ml
function removeRandomBot(level, state, team)
```

Apply `mq3.game.bot_clients.clientLimit`, `mq3.game.bot_clients.entityForClient` and `mq3.game.bot_population.console` while evaluating `removeRandomBot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clients`. |
| `state` | `dynamic` | — | Bot population state; accesses `consoleFn`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L146)

<a id="function-function-mq3-game-bot-population-serviceaddbot-function-serviceaddbot-level-state-args-src-mq3-game-bot-population-ml-2093052450"></a>
### serviceAddBot

```ml
function serviceAddBot(level, state, args)
```

Use `state.serverCommandFn` to perform `serviceAddBot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `time` and `startTime`. |
| `state` | `dynamic` | — | Bot population state; accesses `botEnable`, `clRunning` and `serverCommandFn`. |
| `args` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L287)

<a id="function-function-mq3-game-bot-population-spawnbots-function-spawnbots-level-state-botlist-basedelay-src-mq3-game-bot-population-ml-1418351124"></a>
### spawnBots

```ml
function spawnBots(level, state, botList, baseDelay)
```

Set `state.spSkill` to `skill` in `mq3.game.bot_population.spawnBots`. Return paths include `delay`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Value passed as argument 1 to `state.consoleFn`. |
| `state` | `dynamic` | — | Bot population state; accesses `spSkill` and `cvarSetFn`. May update `state.spSkill` in place. |
| `botList` | `dynamic` | — | Text to parse, format or deliver. |
| `baseDelay` | `dynamic` | — | Value used by `spawnBots` in `delay = baseDelay`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L331)

- [mq3.game.bot_population.State](Type-mq3-game-bot-population-state-1400645272.md) — struct
<a id="constant-constant-mq3-game-bot-population-svf-bot-const-svf-bot-8-src-mq3-game-bot-population-ml-874840121"></a>
### SVF_BOT

```ml
const SVF_BOT = 8
```

Server entity-flag bit controlling bot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L23)

<a id="function-function-mq3-game-bot-population-teamcount-function-teamcount-level-ignore-team-src-mq3-game-bot-population-ml-984042553"></a>
### teamCount

```ml
function teamCount(level, ignore, team)
```

Apply `mq3.game.bot_clients.clientLimit` while evaluating `teamCount`. Return paths include `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — | Game-level state; accesses `clients`. |
| `ignore` | `dynamic` | — | Value used by `teamCount` in `if slot != ignore and client.connected != 0 and client.team == team then count = count+1 end if`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L206)
