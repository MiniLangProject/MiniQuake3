# `src/mq3/game/bot_ai_commands.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.bot_ai_commands`](Package-mq3-game-bot-ai-commands-1478186533.md)

Reachable from entry: **no**

## Imports

- `mq3/game/bot_fight_state.ml` as `fight` → [src/mq3/game/bot_fight_state.ml](File-src-mq3-game-bot-fight-state-ml-409372288.md)
- `mq3/game/bot_lifecycle.ml` as `commandBots` → [src/mq3/game/bot_lifecycle.ml](File-src-mq3-game-bot-lifecycle-ml-1736646636.md)
- `mq3/game/bot_seek_state.ml` as `seek` → [src/mq3/game/bot_seek_state.ml](File-src-mq3-game-bot-seek-state-ml-2095182684.md)
- `mq3/game/playerstate.ml` as `ps` → [src/mq3/game/playerstate.ml](File-src-mq3-game-playerstate-ml-1407876292.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)

## Declarations

<a id="function-function-mq3-game-bot-ai-commands-action-function-action-services-bot-roaminggoal-src-mq3-game-bot-ai-commands-ml-1603528263"></a>
### action

```ml
function action(services, bot, roamingGoal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `roamingGoal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L106)

<a id="function-function-mq3-game-bot-ai-commands-battlenodestep-function-battlenodestep-services-bot-src-mq3-game-bot-ai-commands-ml-1392481627"></a>
### battleNodeStep

```ml
function battleNodeStep(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L59)

<a id="function-function-mq3-game-bot-ai-commands-botai-function-botai-services-client-thinktime-src-mq3-game-bot-ai-commands-ml-255990130"></a>
### botAI

```ml
function botAI(services, client, thinktime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `thinktime` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L88)

<a id="function-function-mq3-game-bot-ai-commands-carrying-function-carrying-services-bot-colored-src-mq3-game-bot-ai-commands-ml-1094026821"></a>
### carrying

```ml
function carrying(services, bot, colored)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `colored` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L122)

<a id="constant-constant-mq3-game-bot-ai-commands-cms-chat-const-cms-chat-1-src-mq3-game-bot-ai-commands-ml-77279942"></a>
### CMS_CHAT

```ml
const CMS_CHAT = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L12)

<a id="constant-constant-mq3-game-bot-ai-commands-cms-normal-const-cms-normal-0-src-mq3-game-bot-ai-commands-ml-1913329699"></a>
### CMS_NORMAL

```ml
const CMS_NORMAL = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L11)

<a id="function-function-mq3-game-bot-ai-commands-create-function-create-state-src-mq3-game-bot-ai-commands-ml-196680575"></a>
### create

```ml
function create(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L56)

<a id="constant-constant-mq3-game-bot-ai-commands-gt-ctf-const-gt-ctf-4-src-mq3-game-bot-ai-commands-ml-1918484531"></a>
### GT_CTF

```ml
const GT_CTF = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L13)

<a id="function-function-mq3-game-bot-ai-commands-leader-function-leader-services-bot-src-mq3-game-bot-ai-commands-ml-1099290119"></a>
### leader

```ml
function leader(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L121)

<a id="constant-constant-mq3-game-bot-ai-commands-ltg-attackenemybase-const-ltg-attackenemybase-13-src-mq3-game-bot-ai-commands-ml-376750753"></a>
### LTG_ATTACKENEMYBASE

```ml
const LTG_ATTACKENEMYBASE = 13
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L28)

<a id="constant-constant-mq3-game-bot-ai-commands-ltg-camp-const-ltg-camp-7-src-mq3-game-bot-ai-commands-ml-22424466"></a>
### LTG_CAMP

```ml
const LTG_CAMP = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L22)

<a id="constant-constant-mq3-game-bot-ai-commands-ltg-camporder-const-ltg-camporder-8-src-mq3-game-bot-ai-commands-ml-425679975"></a>
### LTG_CAMPORDER

```ml
const LTG_CAMPORDER = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L23)

<a id="constant-constant-mq3-game-bot-ai-commands-ltg-defendkeyarea-const-ltg-defendkeyarea-3-src-mq3-game-bot-ai-commands-ml-717919854"></a>
### LTG_DEFENDKEYAREA

```ml
const LTG_DEFENDKEYAREA = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L18)

<a id="constant-constant-mq3-game-bot-ai-commands-ltg-getflag-const-ltg-getflag-4-src-mq3-game-bot-ai-commands-ml-1832819575"></a>
### LTG_GETFLAG

```ml
const LTG_GETFLAG = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L19)

<a id="constant-constant-mq3-game-bot-ai-commands-ltg-getitem-const-ltg-getitem-10-src-mq3-game-bot-ai-commands-ml-2085690696"></a>
### LTG_GETITEM

```ml
const LTG_GETITEM = 10
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L25)

<a id="constant-constant-mq3-game-bot-ai-commands-ltg-harvest-const-ltg-harvest-12-src-mq3-game-bot-ai-commands-ml-1207527230"></a>
### LTG_HARVEST

```ml
const LTG_HARVEST = 12
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L27)

<a id="constant-constant-mq3-game-bot-ai-commands-ltg-kill-const-ltg-kill-11-src-mq3-game-bot-ai-commands-ml-703633249"></a>
### LTG_KILL

```ml
const LTG_KILL = 11
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L26)

<a id="constant-constant-mq3-game-bot-ai-commands-ltg-patrol-const-ltg-patrol-9-src-mq3-game-bot-ai-commands-ml-1947511522"></a>
### LTG_PATROL

```ml
const LTG_PATROL = 9
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L24)

<a id="constant-constant-mq3-game-bot-ai-commands-ltg-returnflag-const-ltg-returnflag-6-src-mq3-game-bot-ai-commands-ml-881217371"></a>
### LTG_RETURNFLAG

```ml
const LTG_RETURNFLAG = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L21)

<a id="constant-constant-mq3-game-bot-ai-commands-ltg-rushbase-const-ltg-rushbase-5-src-mq3-game-bot-ai-commands-ml-1069658844"></a>
### LTG_RUSHBASE

```ml
const LTG_RUSHBASE = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L20)

<a id="constant-constant-mq3-game-bot-ai-commands-ltg-teamaccompany-const-ltg-teamaccompany-2-src-mq3-game-bot-ai-commands-ml-818405921"></a>
### LTG_TEAMACCOMPANY

```ml
const LTG_TEAMACCOMPANY = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L17)

<a id="constant-constant-mq3-game-bot-ai-commands-ltg-teamhelp-const-ltg-teamhelp-1-src-mq3-game-bot-ai-commands-ml-1126274310"></a>
### LTG_TEAMHELP

```ml
const LTG_TEAMHELP = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L16)

<a id="constant-constant-mq3-game-bot-ai-commands-max-nodeswitches-const-max-nodeswitches-50-src-mq3-game-bot-ai-commands-ml-1170401812"></a>
### MAX_NODESWITCHES

```ml
const MAX_NODESWITCHES = 50
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L29)

<a id="function-function-mq3-game-bot-ai-commands-pad20-function-pad20-text-src-mq3-game-bot-ai-commands-ml-1093148673"></a>
### pad20

```ml
function pad20(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L105)

<a id="function-function-mq3-game-bot-ai-commands-removecolorescapesequences-function-removecolorescapesequences-text-src-mq3-game-bot-ai-commands-ml-1569283579"></a>
### removeColorEscapeSequences

```ml
function removeColorEscapeSequences(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L64)

<a id="function-function-mq3-game-bot-ai-commands-reportstatus-function-reportstatus-services-bot-src-mq3-game-bot-ai-commands-ml-1361026407"></a>
### reportStatus

```ml
function reportStatus(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L140)

<a id="function-function-mq3-game-bot-ai-commands-runnodes-function-runnodes-services-bot-src-mq3-game-bot-ai-commands-ml-75442031"></a>
### runNodes

```ml
function runNodes(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L79)

- [mq3.game.bot_ai_commands.Services](Type-mq3-game-bot-ai-commands-services-1434487593.md) — struct
<a id="function-function-mq3-game-bot-ai-commands-setinfoconfigstring-function-setinfoconfigstring-services-bot-src-mq3-game-bot-ai-commands-ml-1535198393"></a>
### setInfoConfigString

```ml
function setInfoConfigString(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L127)

<a id="constant-constant-mq3-game-bot-ai-commands-team-blue-const-team-blue-2-src-mq3-game-bot-ai-commands-ml-1847458141"></a>
### TEAM_BLUE

```ml
const TEAM_BLUE = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L15)

<a id="constant-constant-mq3-game-bot-ai-commands-team-red-const-team-red-1-src-mq3-game-bot-ai-commands-ml-1594935096"></a>
### TEAM_RED

```ml
const TEAM_RED = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L14)

<a id="function-function-mq3-game-bot-ai-commands-teamplayreport-function-teamplayreport-services-src-mq3-game-bot-ai-commands-ml-1567749994"></a>
### teamplayReport

```ml
function teamplayReport(services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L145)

<a id="function-function-mq3-game-bot-ai-commands-unquote-function-unquote-text-src-mq3-game-bot-ai-commands-ml-1488665709"></a>
### unquote

```ml
function unquote(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L75)

<a id="function-function-mq3-game-bot-ai-commands-updateinfoconfigstrings-function-updateinfoconfigstrings-services-src-mq3-game-bot-ai-commands-ml-759349800"></a>
### updateInfoConfigStrings

```ml
function updateInfoConfigStrings(services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_ai_commands.ml#L131)
