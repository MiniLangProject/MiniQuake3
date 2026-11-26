# `src/mq3/game/bot_fight_state.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.bot_fight_state`](Package-mq3-game-bot-fight-state-1379353496.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/bot_combat_ai.ml` as `fightCombat` → [src/mq3/game/bot_combat_ai.ml](File-src-mq3-game-bot-combat-ai-ml-1348181617.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="constant-constant-mq3-game-bot-fight-state-bfl-fightsuicidal-const-bfl-fightsuicidal-64-src-mq3-game-bot-fight-state-ml-1195809071"></a>
### BFL_FIGHTSUICIDAL

```ml
const BFL_FIGHTSUICIDAL = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L19)

<a id="constant-constant-mq3-game-bot-fight-state-bfl-idealviewset-const-bfl-idealviewset-32-src-mq3-game-bot-fight-state-ml-1840801888"></a>
### BFL_IDEALVIEWSET

```ml
const BFL_IDEALVIEWSET = 32
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L20)

<a id="function-function-mq3-game-bot-fight-state-chasenode-function-chasenode-services-bot-src-mq3-game-bot-fight-state-ml-82874141"></a>
### chaseNode

```ml
function chaseNode(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L137)

<a id="function-function-mq3-game-bot-fight-state-create-function-create-combatservices-src-mq3-game-bot-fight-state-ml-1870303502"></a>
### create

```ml
function create(combatServices)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `combatServices` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L66)

<a id="function-function-mq3-game-bot-fight-state-enterchase-function-enterchase-services-bot-reason-src-mq3-game-bot-fight-state-ml-1818300369"></a>
### enterChase

```ml
function enterChase(services, bot, reason)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L78)

<a id="function-function-mq3-game-bot-fight-state-enterfight-function-enterfight-services-bot-reason-src-mq3-game-bot-fight-state-ml-2102420633"></a>
### enterFight

```ml
function enterFight(services, bot, reason)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L72)

<a id="function-function-mq3-game-bot-fight-state-enternbg-function-enternbg-services-bot-reason-src-mq3-game-bot-fight-state-ml-107429025"></a>
### enterNbg

```ml
function enterNbg(services, bot, reason)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L84)

<a id="function-function-mq3-game-bot-fight-state-enterretreat-function-enterretreat-services-bot-reason-src-mq3-game-bot-fight-state-ml-100480993"></a>
### enterRetreat

```ml
function enterRetreat(services, bot, reason)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L81)

<a id="function-function-mq3-game-bot-fight-state-entersuicidalfight-function-entersuicidalfight-services-bot-reason-src-mq3-game-bot-fight-state-ml-1678200785"></a>
### enterSuicidalFight

```ml
function enterSuicidalFight(services, bot, reason)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L75)

<a id="function-function-mq3-game-bot-fight-state-fightnode-function-fightnode-services-bot-src-mq3-game-bot-fight-state-ml-873797165"></a>
### fightNode

```ml
function fightNode(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L101)

<a id="constant-constant-mq3-game-bot-fight-state-moveresult-movementview-const-moveresult-movementview-1-src-mq3-game-bot-fight-state-ml-125712126"></a>
### MOVERESULT_MOVEMENTVIEW

```ml
const MOVERESULT_MOVEMENTVIEW = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L21)

<a id="constant-constant-mq3-game-bot-fight-state-moveresult-movementviewset-const-moveresult-movementviewset-8-src-mq3-game-bot-fight-state-ml-1354463609"></a>
### MOVERESULT_MOVEMENTVIEWSET

```ml
const MOVERESULT_MOVEMENTVIEWSET = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L23)

<a id="constant-constant-mq3-game-bot-fight-state-moveresult-movementweapon-const-moveresult-movementweapon-16-src-mq3-game-bot-fight-state-ml-1929440314"></a>
### MOVERESULT_MOVEMENTWEAPON

```ml
const MOVERESULT_MOVEMENTWEAPON = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L24)

<a id="constant-constant-mq3-game-bot-fight-state-moveresult-swimview-const-moveresult-swimview-2-src-mq3-game-bot-fight-state-ml-801628163"></a>
### MOVERESULT_SWIMVIEW

```ml
const MOVERESULT_SWIMVIEW = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L22)

<a id="function-function-mq3-game-bot-fight-state-nbgnode-function-nbgnode-services-bot-src-mq3-game-bot-fight-state-ml-1412065051"></a>
### nbgNode

```ml
function nbgNode(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L185)

<a id="constant-constant-mq3-game-bot-fight-state-node-chase-const-node-chase-2-src-mq3-game-bot-fight-state-ml-1733232747"></a>
### NODE_CHASE

```ml
const NODE_CHASE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L10)

<a id="constant-constant-mq3-game-bot-fight-state-node-fight-const-node-fight-1-src-mq3-game-bot-fight-state-ml-1802288078"></a>
### NODE_FIGHT

```ml
const NODE_FIGHT = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L9)

<a id="constant-constant-mq3-game-bot-fight-state-node-intermission-const-node-intermission-6-src-mq3-game-bot-fight-state-ml-436398263"></a>
### NODE_INTERMISSION

```ml
const NODE_INTERMISSION = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L14)

<a id="constant-constant-mq3-game-bot-fight-state-node-nbg-const-node-nbg-9-src-mq3-game-bot-fight-state-ml-1563047484"></a>
### NODE_NBG

```ml
const NODE_NBG = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L17)

<a id="constant-constant-mq3-game-bot-fight-state-node-observer-const-node-observer-5-src-mq3-game-bot-fight-state-ml-1219803358"></a>
### NODE_OBSERVER

```ml
const NODE_OBSERVER = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L13)

<a id="constant-constant-mq3-game-bot-fight-state-node-respawn-const-node-respawn-7-src-mq3-game-bot-fight-state-ml-1321023676"></a>
### NODE_RESPAWN

```ml
const NODE_RESPAWN = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L15)

<a id="constant-constant-mq3-game-bot-fight-state-node-retreat-const-node-retreat-8-src-mq3-game-bot-fight-state-ml-1120240459"></a>
### NODE_RETREAT

```ml
const NODE_RETREAT = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L16)

<a id="constant-constant-mq3-game-bot-fight-state-node-seek-const-node-seek-3-src-mq3-game-bot-fight-state-ml-1732842264"></a>
### NODE_SEEK

```ml
const NODE_SEEK = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L11)

<a id="constant-constant-mq3-game-bot-fight-state-node-seek-nbg-const-node-seek-nbg-10-src-mq3-game-bot-fight-state-ml-824743100"></a>
### NODE_SEEK_NBG

```ml
const NODE_SEEK_NBG = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L18)

<a id="constant-constant-mq3-game-bot-fight-state-node-stand-const-node-stand-4-src-mq3-game-bot-fight-state-ml-1329056621"></a>
### NODE_STAND

```ml
const NODE_STAND = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L12)

<a id="constant-constant-mq3-game-bot-fight-state-pers-hits-const-pers-hits-1-src-mq3-game-bot-fight-state-ml-454502046"></a>
### PERS_HITS

```ml
const PERS_HITS = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L30)

<a id="function-function-mq3-game-bot-fight-state-retreatnode-function-retreatnode-services-bot-src-mq3-game-bot-fight-state-ml-491049815"></a>
### retreatNode

```ml
function retreatNode(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L163)

<a id="function-function-mq3-game-bot-fight-state-runnode-function-runnode-services-bot-src-mq3-game-bot-fight-state-ml-77315663"></a>
### runNode

```ml
function runNode(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L201)

- [mq3.game.bot_fight_state.Services](Type-mq3-game-bot-fight-state-services-2017905966.md) — struct
<a id="function-function-mq3-game-bot-fight-state-setmovementview-function-setmovementview-services-bot-movement-goal-allowaim-copyviewset-halveroll-src-mq3-game-bot-fight-state-ml-433827964"></a>
### setMovementView

```ml
function setMovementView(services, bot, movement, goal, allowAim, copyViewSet, halveRoll)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `movement` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |
| `allowAim` | `dynamic` | — |  |
| `copyViewSet` | `dynamic` | — |  |
| `halveRoll` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L87)

<a id="constant-constant-mq3-game-bot-fight-state-tfl-default-const-tfl-default-18616254-src-mq3-game-bot-fight-state-ml-230567952"></a>
### TFL_DEFAULT

```ml
const TFL_DEFAULT = 18616254
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L25)

<a id="constant-constant-mq3-game-bot-fight-state-tfl-grapplehook-const-tfl-grapplehook-16384-src-mq3-game-bot-fight-state-ml-436019705"></a>
### TFL_GRAPPLEHOOK

```ml
const TFL_GRAPPLEHOOK = 16384
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L27)

<a id="constant-constant-mq3-game-bot-fight-state-tfl-lava-const-tfl-lava-4194304-src-mq3-game-bot-fight-state-ml-1736915490"></a>
### TFL_LAVA

```ml
const TFL_LAVA = 4194304
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L29)

<a id="constant-constant-mq3-game-bot-fight-state-tfl-rocketjump-const-tfl-rocketjump-4096-src-mq3-game-bot-fight-state-ml-1212488990"></a>
### TFL_ROCKETJUMP

```ml
const TFL_ROCKETJUMP = 4096
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L26)

<a id="constant-constant-mq3-game-bot-fight-state-tfl-slime-const-tfl-slime-2097152-src-mq3-game-bot-fight-state-ml-108320079"></a>
### TFL_SLIME

```ml
const TFL_SLIME = 2097152
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L28)

<a id="function-function-mq3-game-bot-fight-state-transition-function-transition-services-bot-node-reason-src-mq3-game-bot-fight-state-ml-1611023637"></a>
### transition

```ml
function transition(services, bot, node, reason)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `node` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_fight_state.ml#L69)
