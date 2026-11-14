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
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-bot-population-addbot-function-addbot-level-state-name-skill-team-delay-altname-src-mq3-game-bot-population-ml-1954019837"></a>
### addBot

```ml
function addBot(level, state, name, skill, team, delay, altname)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `skill` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |
| `delay` | `dynamic` | — |  |
| `altname` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L160)

<a id="function-function-mq3-game-bot-population-addrandombot-function-addrandombot-level-state-team-src-mq3-game-bot-population-ml-824596388"></a>
### addRandomBot

```ml
function addRandomBot(level, state, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L79)

<a id="constant-constant-mq3-game-bot-population-bot-begin-delay-base-const-bot-begin-delay-base-2000-src-mq3-game-bot-population-ml-804866861"></a>
### BOT_BEGIN_DELAY_BASE

```ml
const BOT_BEGIN_DELAY_BASE = 2000
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L20)

<a id="constant-constant-mq3-game-bot-population-bot-begin-delay-increment-const-bot-begin-delay-increment-1500-src-mq3-game-bot-population-ml-1550680933"></a>
### BOT_BEGIN_DELAY_INCREMENT

```ml
const BOT_BEGIN_DELAY_INCREMENT = 1500
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L21)

<a id="function-function-mq3-game-bot-population-botalreadyused-function-botalreadyused-level-state-name-team-src-mq3-game-bot-population-ml-516101435"></a>
### botAlreadyUsed

```ml
function botAlreadyUsed(level, state, name, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L66)

<a id="function-function-mq3-game-bot-population-botlist-function-botlist-level-state-src-mq3-game-bot-population-ml-1859880911"></a>
### botList

```ml
function botList(level, state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L230)

<a id="function-function-mq3-game-bot-population-checkminimumplayers-function-checkminimumplayers-level-state-src-mq3-game-bot-population-ml-627732185"></a>
### checkMinimumPlayers

```ml
function checkMinimumPlayers(level, state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L108)

<a id="function-function-mq3-game-bot-population-clean-function-clean-text-src-mq3-game-bot-population-ml-140792423"></a>
### clean

```ml
function clean(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L55)

<a id="function-function-mq3-game-bot-population-console-function-console-level-state-text-src-mq3-game-bot-population-ml-113469708"></a>
### console

```ml
function console(level, state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L50)

<a id="function-function-mq3-game-bot-population-create-function-create-registry-clients-src-mq3-game-bot-population-ml-1052471601"></a>
### create

```ml
function create(registry, clients)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `registry` | `dynamic` | — |  |
| `clients` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L41)

<a id="constant-constant-mq3-game-bot-population-exec-insert-const-exec-insert-1-src-mq3-game-bot-population-ml-1939338088"></a>
### EXEC_INSERT

```ml
const EXEC_INSERT = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L19)

<a id="constant-constant-mq3-game-bot-population-gt-ffa-const-gt-ffa-0-src-mq3-game-bot-population-ml-1225328225"></a>
### GT_FFA

```ml
const GT_FFA = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L14)

<a id="constant-constant-mq3-game-bot-population-gt-single-player-const-gt-single-player-2-src-mq3-game-bot-population-ml-2073040749"></a>
### GT_SINGLE_PLAYER

```ml
const GT_SINGLE_PLAYER = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L16)

<a id="constant-constant-mq3-game-bot-population-gt-team-const-gt-team-3-src-mq3-game-bot-population-ml-902228270"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L17)

<a id="constant-constant-mq3-game-bot-population-gt-tournament-const-gt-tournament-1-src-mq3-game-bot-population-ml-43567092"></a>
### GT_TOURNAMENT

```ml
const GT_TOURNAMENT = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L15)

<a id="function-function-mq3-game-bot-population-infoset-function-infoset-level-state-value-key-text-src-mq3-game-bot-population-ml-219126870"></a>
### infoSet

```ml
function infoSet(level, state, value, key, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L139)

<a id="function-function-mq3-game-bot-population-initsingleplayer-function-initsingleplayer-level-state-restart-mapname-src-mq3-game-bot-population-ml-1714272405"></a>
### initSinglePlayer

```ml
function initSinglePlayer(level, state, restart, mapname)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `restart` | `dynamic` | — |  |
| `mapname` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L258)

<a id="function-function-mq3-game-bot-population-output-function-output-level-state-text-src-mq3-game-bot-population-ml-1530164714"></a>
### output

```ml
function output(level, state, text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L45)

<a id="function-function-mq3-game-bot-population-padded-function-padded-text-width-src-mq3-game-bot-population-ml-1106611413"></a>
### padded

```ml
function padded(text, width)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `width` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L225)

<a id="function-function-mq3-game-bot-population-pickteam-function-pickteam-level-ignore-src-mq3-game-bot-population-ml-516529612"></a>
### pickTeam

```ml
function pickTeam(level, ignore)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ignore` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L152)

<a id="function-function-mq3-game-bot-population-removerandombot-function-removerandombot-level-state-team-src-mq3-game-bot-population-ml-1024330712"></a>
### removeRandomBot

```ml
function removeRandomBot(level, state, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L96)

<a id="function-function-mq3-game-bot-population-serviceaddbot-function-serviceaddbot-level-state-args-src-mq3-game-bot-population-ml-2093052450"></a>
### serviceAddBot

```ml
function serviceAddBot(level, state, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L209)

<a id="function-function-mq3-game-bot-population-spawnbots-function-spawnbots-level-state-botlist-basedelay-src-mq3-game-bot-population-ml-1418351124"></a>
### spawnBots

```ml
function spawnBots(level, state, botList, baseDelay)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |
| `botList` | `dynamic` | — |  |
| `baseDelay` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L242)

- [mq3.game.bot_population.State](Type-mq3-game-bot-population-state-1400645272.md) — struct
<a id="constant-constant-mq3-game-bot-population-svf-bot-const-svf-bot-8-src-mq3-game-bot-population-ml-874840121"></a>
### SVF_BOT

```ml
const SVF_BOT = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L18)

<a id="function-function-mq3-game-bot-population-teamcount-function-teamcount-level-ignore-team-src-mq3-game-bot-population-ml-984042553"></a>
### teamCount

```ml
function teamCount(level, ignore, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | `dynamic` | — |  |
| `ignore` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_population.ml#L143)
