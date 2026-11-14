# `src/mq3/game/bot_seek_state.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.bot_seek_state`](Package-mq3-game-bot-seek-state-276406378.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/bot_combat_ai.ml` as `seekCombat` → [src/mq3/game/bot_combat_ai.ml](File-src-mq3-game-bot-combat-ai-ml-1348181617.md)
- `mq3/game/bot_fight_state.ml` as `fight` → [src/mq3/game/bot_fight_state.ml](File-src-mq3-game-bot-fight-state-ml-409372288.md)
- `mq3/game/bot_navigation.ml` as `navigation` → [src/mq3/game/bot_navigation.ml](File-src-mq3-game-bot-navigation-ml-746290412.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

<a id="function-function-mq3-game-bot-seek-state-activatenode-function-activatenode-services-bot-src-mq3-game-bot-seek-state-ml-874691609"></a>
### activateNode

```ml
function activateNode(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L170)

<a id="constant-constant-mq3-game-bot-seek-state-bfl-idealviewset-const-bfl-idealviewset-32-src-mq3-game-bot-seek-state-ml-1426956866"></a>
### BFL_IDEALVIEWSET

```ml
const BFL_IDEALVIEWSET = 32
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L18)

<a id="function-function-mq3-game-bot-seek-state-clearactivation-function-clearactivation-services-bot-src-mq3-game-bot-seek-state-ml-1447576575"></a>
### clearActivation

```ml
function clearActivation(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L124)

<a id="function-function-mq3-game-bot-seek-state-create-function-create-fightservices-navigationservices-src-mq3-game-bot-seek-state-ml-1894012860"></a>
### create

```ml
function create(fightServices, navigationServices)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fightServices` | `dynamic` | — |  |
| `navigationServices` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L86)

<a id="function-function-mq3-game-bot-seek-state-enteractivate-function-enteractivate-services-bot-reason-src-mq3-game-bot-seek-state-ml-434431075"></a>
### enterActivate

```ml
function enterActivate(services, bot, reason)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L127)

<a id="function-function-mq3-game-bot-seek-state-enterintermission-function-enterintermission-services-bot-reason-src-mq3-game-bot-seek-state-ml-1166557973"></a>
### enterIntermission

```ml
function enterIntermission(services, bot, reason)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L108)

<a id="function-function-mq3-game-bot-seek-state-enterobserver-function-enterobserver-services-bot-reason-src-mq3-game-bot-seek-state-ml-633724421"></a>
### enterObserver

```ml
function enterObserver(services, bot, reason)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L105)

<a id="function-function-mq3-game-bot-seek-state-enterrespawn-function-enterrespawn-services-bot-reason-src-mq3-game-bot-seek-state-ml-765175861"></a>
### enterRespawn

```ml
function enterRespawn(services, bot, reason)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L116)

<a id="function-function-mq3-game-bot-seek-state-enterseek-function-enterseek-services-bot-reason-src-mq3-game-bot-seek-state-ml-736531669"></a>
### enterSeek

```ml
function enterSeek(services, bot, reason)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L92)

<a id="function-function-mq3-game-bot-seek-state-enterseeknbg-function-enterseeknbg-services-bot-reason-src-mq3-game-bot-seek-state-ml-485444437"></a>
### enterSeekNbg

```ml
function enterSeekNbg(services, bot, reason)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L101)

<a id="function-function-mq3-game-bot-seek-state-enterstand-function-enterstand-services-bot-reason-src-mq3-game-bot-seek-state-ml-1837161445"></a>
### enterStand

```ml
function enterStand(services, bot, reason)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L113)

<a id="function-function-mq3-game-bot-seek-state-intermissionnode-function-intermissionnode-services-bot-src-mq3-game-bot-seek-state-ml-1025197913"></a>
### intermissionNode

```ml
function intermissionNode(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L131)

<a id="function-function-mq3-game-bot-seek-state-longtermgoal-function-longtermgoal-services-bot-goal-src-mq3-game-bot-seek-state-ml-532117710"></a>
### longTermGoal

```ml
function longTermGoal(services, bot, goal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L223)

<a id="constant-constant-mq3-game-bot-seek-state-ltg-defendkeyarea-const-ltg-defendkeyarea-3-src-mq3-game-bot-seek-state-ml-259386258"></a>
### LTG_DEFENDKEYAREA

```ml
const LTG_DEFENDKEYAREA = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L24)

<a id="constant-constant-mq3-game-bot-seek-state-moveresult-movementview-const-moveresult-movementview-1-src-mq3-game-bot-seek-state-ml-678340776"></a>
### MOVERESULT_MOVEMENTVIEW

```ml
const MOVERESULT_MOVEMENTVIEW = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L19)

<a id="constant-constant-mq3-game-bot-seek-state-moveresult-movementviewset-const-moveresult-movementviewset-8-src-mq3-game-bot-seek-state-ml-503289241"></a>
### MOVERESULT_MOVEMENTVIEWSET

```ml
const MOVERESULT_MOVEMENTVIEWSET = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L22)

<a id="constant-constant-mq3-game-bot-seek-state-moveresult-movementweapon-const-moveresult-movementweapon-16-src-mq3-game-bot-seek-state-ml-172333340"></a>
### MOVERESULT_MOVEMENTWEAPON

```ml
const MOVERESULT_MOVEMENTWEAPON = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L23)

<a id="constant-constant-mq3-game-bot-seek-state-moveresult-swimview-const-moveresult-swimview-2-src-mq3-game-bot-seek-state-ml-616704283"></a>
### MOVERESULT_SWIMVIEW

```ml
const MOVERESULT_SWIMVIEW = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L20)

<a id="constant-constant-mq3-game-bot-seek-state-moveresult-waiting-const-moveresult-waiting-4-src-mq3-game-bot-seek-state-ml-1475995647"></a>
### MOVERESULT_WAITING

```ml
const MOVERESULT_WAITING = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L21)

<a id="constant-constant-mq3-game-bot-seek-state-node-activate-const-node-activate-11-src-mq3-game-bot-seek-state-ml-1998809055"></a>
### NODE_ACTIVATE

```ml
const NODE_ACTIVATE = 11
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L17)

<a id="constant-constant-mq3-game-bot-seek-state-node-intermission-const-node-intermission-6-src-mq3-game-bot-seek-state-ml-123757391"></a>
### NODE_INTERMISSION

```ml
const NODE_INTERMISSION = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L14)

<a id="constant-constant-mq3-game-bot-seek-state-node-observer-const-node-observer-5-src-mq3-game-bot-seek-state-ml-222029872"></a>
### NODE_OBSERVER

```ml
const NODE_OBSERVER = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L13)

<a id="constant-constant-mq3-game-bot-seek-state-node-respawn-const-node-respawn-7-src-mq3-game-bot-seek-state-ml-2076700790"></a>
### NODE_RESPAWN

```ml
const NODE_RESPAWN = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L15)

<a id="constant-constant-mq3-game-bot-seek-state-node-seek-const-node-seek-3-src-mq3-game-bot-seek-state-ml-1081815802"></a>
### NODE_SEEK

```ml
const NODE_SEEK = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L11)

<a id="constant-constant-mq3-game-bot-seek-state-node-seek-nbg-const-node-seek-nbg-10-src-mq3-game-bot-seek-state-ml-1323777622"></a>
### NODE_SEEK_NBG

```ml
const NODE_SEEK_NBG = 10
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L16)

<a id="constant-constant-mq3-game-bot-seek-state-node-stand-const-node-stand-4-src-mq3-game-bot-seek-state-ml-1590425781"></a>
### NODE_STAND

```ml
const NODE_STAND = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L12)

<a id="function-function-mq3-game-bot-seek-state-observernode-function-observernode-services-bot-src-mq3-game-bot-seek-state-ml-446282205"></a>
### observerNode

```ml
function observerNode(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L139)

<a id="function-function-mq3-game-bot-seek-state-predictobstacles-function-predictobstacles-services-bot-goal-src-mq3-game-bot-seek-state-ml-1600610694"></a>
### predictObstacles

```ml
function predictObstacles(services, bot, goal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L227)

<a id="function-function-mq3-game-bot-seek-state-recordentry-function-recordentry-services-bot-name-goal-reason-src-mq3-game-bot-seek-state-ml-1849041507"></a>
### recordEntry

```ml
function recordEntry(services, bot, name, goal, reason)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L98)

<a id="function-function-mq3-game-bot-seek-state-respawnnode-function-respawnnode-services-bot-src-mq3-game-bot-seek-state-ml-504642349"></a>
### respawnNode

```ml
function respawnNode(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L155)

<a id="function-function-mq3-game-bot-seek-state-runnode-function-runnode-services-bot-src-mq3-game-bot-seek-state-ml-512322811"></a>
### runNode

```ml
function runNode(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L315)

<a id="function-function-mq3-game-bot-seek-state-seeknbgnode-function-seeknbgnode-services-bot-src-mq3-game-bot-seek-state-ml-1849108947"></a>
### seekNbgNode

```ml
function seekNbgNode(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L280)

<a id="function-function-mq3-game-bot-seek-state-seeknode-function-seeknode-services-bot-src-mq3-game-bot-seek-state-ml-1936074009"></a>
### seekNode

```ml
function seekNode(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L235)

- [mq3.game.bot_seek_state.Services](Type-mq3-game-bot-seek-state-services-1489276516.md) — struct
<a id="function-function-mq3-game-bot-seek-state-setupmovement-function-setupmovement-services-bot-src-mq3-game-bot-seek-state-ml-1751242557"></a>
### setupMovement

```ml
function setupMovement(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L231)

<a id="function-function-mq3-game-bot-seek-state-standnode-function-standnode-services-bot-src-mq3-game-bot-seek-state-ml-570144725"></a>
### standNode

```ml
function standNode(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L142)

<a id="constant-constant-mq3-game-bot-seek-state-tfl-default-const-tfl-default-18616254-src-mq3-game-bot-seek-state-ml-24148902"></a>
### TFL_DEFAULT

```ml
const TFL_DEFAULT = 18616254
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L25)

<a id="constant-constant-mq3-game-bot-seek-state-tfl-grapplehook-const-tfl-grapplehook-16384-src-mq3-game-bot-seek-state-ml-509402601"></a>
### TFL_GRAPPLEHOOK

```ml
const TFL_GRAPPLEHOOK = 16384
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L27)

<a id="constant-constant-mq3-game-bot-seek-state-tfl-lava-const-tfl-lava-4194304-src-mq3-game-bot-seek-state-ml-1309007632"></a>
### TFL_LAVA

```ml
const TFL_LAVA = 4194304
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L29)

<a id="constant-constant-mq3-game-bot-seek-state-tfl-rocketjump-const-tfl-rocketjump-4096-src-mq3-game-bot-seek-state-ml-530482152"></a>
### TFL_ROCKETJUMP

```ml
const TFL_ROCKETJUMP = 4096
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L26)

<a id="constant-constant-mq3-game-bot-seek-state-tfl-slime-const-tfl-slime-2097152-src-mq3-game-bot-seek-state-ml-1281841815"></a>
### TFL_SLIME

```ml
const TFL_SLIME = 2097152
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L28)

<a id="function-function-mq3-game-bot-seek-state-transition-function-transition-services-bot-node-reason-src-mq3-game-bot-seek-state-ml-1898709981"></a>
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


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L89)
