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

Update `bot.tfl`, `bot.enemy`, `bot.activateGoalHeap[bot.activateStackIndex].time` and `bot.idealViewangles` and related state during `activateNode`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `fightServices`, `observerFn`, `grapple`, `mapScriptsFn` and `activateTraceFn` and related fields. |
| `bot` | `dynamic` | — | Bot AI state; accesses `tfl`, `enemy`, `activateStackIndex`, `activateGoalHeap` and `curPs` and related fields. May update `bot.tfl`, `bot.enemy` and `bot.activateGoalHeap[bot.activateStackIndex].time` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L303)

<a id="constant-constant-mq3-game-bot-seek-state-bfl-idealviewset-const-bfl-idealviewset-32-src-mq3-game-bot-seek-state-ml-1426956866"></a>
### BFL_IDEALVIEWSET

```ml
const BFL_IDEALVIEWSET = 32
```

Bot-state flag marking idealviewset.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L26)

<a id="function-function-mq3-game-bot-seek-state-clearactivation-function-clearactivation-services-bot-src-mq3-game-bot-seek-state-ml-1447576575"></a>
### clearActivation

```ml
function clearActivation(services, bot)
```

Use `services.clearActivateFn` to perform `clearActivation`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `clearActivateFn` and `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `activateStackIndex`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L238)

<a id="function-function-mq3-game-bot-seek-state-create-function-create-fightservices-navigationservices-src-mq3-game-bot-seek-state-ml-1894012860"></a>
### create

```ml
function create(fightServices, navigationServices)
```

Create a `mq3.game.bot_seek_state.Services` record, initializing `fightServices` from `fightServices` and `navigationServices` from `navigationServices`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fightServices` | `dynamic` | — | Initial value stored in `mq3.game.bot_seek_state.Services.fightServices`. |
| `navigationServices` | `dynamic` | — | Initial value stored in `mq3.game.bot_seek_state.Services.navigationServices`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L162)

<a id="function-function-mq3-game-bot-seek-state-enteractivate-function-enteractivate-services-bot-reason-src-mq3-game-bot-seek-state-ml-434431075"></a>
### enterActivate

```ml
function enterActivate(services, bot, reason)
```

Set `bot.aiNode` to `NODE_ACTIVATE` in `mq3.game.bot_seek_state.enterActivate`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `recordNodeFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `aiNode`. May update `bot.aiNode` in place. |
| `reason` | `dynamic` | — | Reason text recorded with the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L245)

<a id="function-function-mq3-game-bot-seek-state-enterintermission-function-enterintermission-services-bot-reason-src-mq3-game-bot-seek-state-ml-1166557973"></a>
### enterIntermission

```ml
function enterIntermission(services, bot, reason)
```

Set `bot.aiNode` to `NODE_INTERMISSION` in `mq3.game.bot_seek_state.enterIntermission`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `resetStateFn`, `endLevelChatFn` and `enterChatFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `chatto` and `aiNode`. May update `bot.aiNode` in place. |
| `reason` | `dynamic` | — | Reason text recorded with the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L211)

<a id="function-function-mq3-game-bot-seek-state-enterobserver-function-enterobserver-services-bot-reason-src-mq3-game-bot-seek-state-ml-633724421"></a>
### enterObserver

```ml
function enterObserver(services, bot, reason)
```

Set `bot.aiNode` to `NODE_OBSERVER` in `mq3.game.bot_seek_state.enterObserver`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `resetStateFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `aiNode`. May update `bot.aiNode` in place. |
| `reason` | `dynamic` | — | Reason text recorded with the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L204)

<a id="function-function-mq3-game-bot-seek-state-enterrespawn-function-enterrespawn-services-bot-reason-src-mq3-game-bot-seek-state-ml-765175861"></a>
### enterRespawn

```ml
function enterRespawn(services, bot, reason)
```

Update `bot.respawnTime`, `bot.respawnChatTime`, `bot.respawnWait` and `bot.aiNode` during `enterRespawn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `fightServices`, `resetMoveStateFn`, `resetGoalStateFn`, `resetAvoidGoalsFn` and `resetAvoidFn` and related fields. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ms`, `gs`, `respawnTime`, `respawnChatTime` and `respawnWait` and related fields. May update `bot.respawnTime`, `bot.respawnChatTime` and `bot.respawnWait` and additional fields in place. |
| `reason` | `dynamic` | — | Reason text recorded with the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L227)

<a id="function-function-mq3-game-bot-seek-state-enterseek-function-enterseek-services-bot-reason-src-mq3-game-bot-seek-state-ml-736531669"></a>
### enterSeek

```ml
function enterSeek(services, bot, reason)
```

Set `bot.aiNode` to `NODE_SEEK` in `mq3.game.bot_seek_state.enterSeek`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `topGoalFn`, `recordNodeFn` and `goalNameFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `gs` and `aiNode`. May update `bot.aiNode` in place. |
| `reason` | `dynamic` | — | Reason text recorded with the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L177)

<a id="function-function-mq3-game-bot-seek-state-enterseeknbg-function-enterseeknbg-services-bot-reason-src-mq3-game-bot-seek-state-ml-485444437"></a>
### enterSeekNbg

```ml
function enterSeekNbg(services, bot, reason)
```

Set `bot.aiNode` to `NODE_SEEK_NBG` in `mq3.game.bot_seek_state.enterSeekNbg`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `topGoalFn` and `goalNameFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `gs` and `aiNode`. May update `bot.aiNode` in place. |
| `reason` | `dynamic` | — | Reason text recorded with the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L196)

<a id="function-function-mq3-game-bot-seek-state-enterstand-function-enterstand-services-bot-reason-src-mq3-game-bot-seek-state-ml-1837161445"></a>
### enterStand

```ml
function enterStand(services, bot, reason)
```

Update `bot.standFindEnemyTime` and `bot.aiNode` during `enterStand`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `fightServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `standFindEnemyTime` and `aiNode`. May update `bot.standFindEnemyTime` and `bot.aiNode` in place. |
| `reason` | `dynamic` | — | Reason text recorded with the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L220)

<a id="function-function-mq3-game-bot-seek-state-intermissionnode-function-intermissionnode-services-bot-src-mq3-game-bot-seek-state-ml-1025197913"></a>
### intermissionNode

```ml
function intermissionNode(services, bot)
```

Set `bot.standTime` to `n.fadd(time,services.chatTimeFn(services,bot))` and `bot.standTime` to `n.fadd(time,2.0)` in `mq3.game.bot_seek_state.intermissionNode`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `fightServices`, `startLevelChatFn` and `chatTimeFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `standTime`. May update `bot.standTime` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L252)

<a id="function-function-mq3-game-bot-seek-state-longtermgoal-function-longtermgoal-services-bot-goal-src-mq3-game-bot-seek-state-ml-532117710"></a>
### longTermGoal

```ml
function longTermGoal(services, bot, goal)
```

Use `services.longTermGoalFn` to perform `longTermGoal`. Return paths include `navigation.longTermGoal(services.navigationServices,bot,bot.tfl,false,goal)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `longTermGoalFn` and `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `tfl`. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `origin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L360)

<a id="constant-constant-mq3-game-bot-seek-state-ltg-defendkeyarea-const-ltg-defendkeyarea-3-src-mq3-game-bot-seek-state-ml-259386258"></a>
### LTG_DEFENDKEYAREA

```ml
const LTG_DEFENDKEYAREA = 3
```

Long-term bot goal identifier selecting defend a key area behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L38)

<a id="constant-constant-mq3-game-bot-seek-state-moveresult-movementview-const-moveresult-movementview-1-src-mq3-game-bot-seek-state-ml-678340776"></a>
### MOVERESULT_MOVEMENTVIEW

```ml
const MOVERESULT_MOVEMENTVIEW = 1
```

Bot movement-result flag reporting movementview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L28)

<a id="constant-constant-mq3-game-bot-seek-state-moveresult-movementviewset-const-moveresult-movementviewset-8-src-mq3-game-bot-seek-state-ml-503289241"></a>
### MOVERESULT_MOVEMENTVIEWSET

```ml
const MOVERESULT_MOVEMENTVIEWSET = 8
```

Bot movement-result flag reporting movementviewset.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L34)

<a id="constant-constant-mq3-game-bot-seek-state-moveresult-movementweapon-const-moveresult-movementweapon-16-src-mq3-game-bot-seek-state-ml-172333340"></a>
### MOVERESULT_MOVEMENTWEAPON

```ml
const MOVERESULT_MOVEMENTWEAPON = 16
```

Bot movement-result flag reporting movementweapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L36)

<a id="constant-constant-mq3-game-bot-seek-state-moveresult-swimview-const-moveresult-swimview-2-src-mq3-game-bot-seek-state-ml-616704283"></a>
### MOVERESULT_SWIMVIEW

```ml
const MOVERESULT_SWIMVIEW = 2
```

Bot movement-result flag reporting swimview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L30)

<a id="constant-constant-mq3-game-bot-seek-state-moveresult-waiting-const-moveresult-waiting-4-src-mq3-game-bot-seek-state-ml-1475995647"></a>
### MOVERESULT_WAITING

```ml
const MOVERESULT_WAITING = 4
```

Bot movement-result flag reporting waiting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L32)

<a id="constant-constant-mq3-game-bot-seek-state-node-activate-const-node-activate-11-src-mq3-game-bot-seek-state-ml-1998809055"></a>
### NODE_ACTIVATE

```ml
const NODE_ACTIVATE = 11
```

Bot decision-state identifier for the activate node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L24)

<a id="constant-constant-mq3-game-bot-seek-state-node-intermission-const-node-intermission-6-src-mq3-game-bot-seek-state-ml-123757391"></a>
### NODE_INTERMISSION

```ml
const NODE_INTERMISSION = 6
```

Bot decision-state identifier for the intermission node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L18)

<a id="constant-constant-mq3-game-bot-seek-state-node-observer-const-node-observer-5-src-mq3-game-bot-seek-state-ml-222029872"></a>
### NODE_OBSERVER

```ml
const NODE_OBSERVER = 5
```

Bot decision-state identifier for the observer node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L16)

<a id="constant-constant-mq3-game-bot-seek-state-node-respawn-const-node-respawn-7-src-mq3-game-bot-seek-state-ml-2076700790"></a>
### NODE_RESPAWN

```ml
const NODE_RESPAWN = 7
```

Bot decision-state identifier for the respawn node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L20)

<a id="constant-constant-mq3-game-bot-seek-state-node-seek-const-node-seek-3-src-mq3-game-bot-seek-state-ml-1081815802"></a>
### NODE_SEEK

```ml
const NODE_SEEK = 3
```

Bot decision-state identifier for the seek node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L12)

<a id="constant-constant-mq3-game-bot-seek-state-node-seek-nbg-const-node-seek-nbg-10-src-mq3-game-bot-seek-state-ml-1323777622"></a>
### NODE_SEEK_NBG

```ml
const NODE_SEEK_NBG = 10
```

Bot decision-state identifier for the seek nbg node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L22)

<a id="constant-constant-mq3-game-bot-seek-state-node-stand-const-node-stand-4-src-mq3-game-bot-seek-state-ml-1590425781"></a>
### NODE_STAND

```ml
const NODE_STAND = 4
```

Bot decision-state identifier for the stand node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L14)

<a id="function-function-mq3-game-bot-seek-state-observernode-function-observernode-services-bot-src-mq3-game-bot-seek-state-ml-446282205"></a>
### observerNode

```ml
function observerNode(services, bot)
```

Use `services.observerFn` to perform `observerNode`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `observerFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `standFindEnemyTime` and `aiNode`. May update `bot.standFindEnemyTime` and `bot.aiNode` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L263)

<a id="function-function-mq3-game-bot-seek-state-predictobstacles-function-predictobstacles-services-bot-goal-src-mq3-game-bot-seek-state-ml-1600610694"></a>
### predictObstacles

```ml
function predictObstacles(services, bot, goal)
```

Use `services.predictObstaclesFn` to perform `predictObstacles`. Return paths include `navigation.predictObstacles(services.navigationServices,bot,goal,true)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `predictObstaclesFn` and `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `predictobstaclesGoalareanum`, `predictobstaclesTime`, `areanum`, `origin` and `tfl`. May update `bot.predictobstaclesGoalareanum` and `bot.predictobstaclesTime` in place. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `areanum` and `entitynum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L368)

<a id="function-function-mq3-game-bot-seek-state-recordentry-function-recordentry-services-bot-name-goal-reason-src-mq3-game-bot-seek-state-ml-1849041507"></a>
### recordEntry

```ml
function recordEntry(services, bot, name, goal, reason)
```

Use `services.recordNodeFn` to perform `recordEntry`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `recordNodeFn`. |
| `bot` | `dynamic` | — | Value passed as argument 2 to `services.recordNodeFn`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `goal` | `dynamic` | — | Value passed as argument 4 to `services.recordNodeFn`. |
| `reason` | `dynamic` | — | Reason text recorded with the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L189)

<a id="function-function-mq3-game-bot-seek-state-respawnnode-function-respawnnode-services-bot-src-mq3-game-bot-seek-state-ml-504642349"></a>
### respawnNode

```ml
function respawnNode(services, bot)
```

Set `bot.respawnWait` to `true` and `bot.enemy` to `-1` in `mq3.game.bot_seek_state.respawnNode`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `fightServices`, `respawnFn`, `enterChatFn` and `talkFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `respawnWait`, `client`, `respawnTime`, `respawnChatTime` and `chatto` and related fields. May update `bot.respawnWait` and `bot.enemy` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L285)

<a id="function-function-mq3-game-bot-seek-state-runnode-function-runnode-services-bot-src-mq3-game-bot-seek-state-ml-512322811"></a>
### runNode

```ml
function runNode(services, bot)
```

Use `services.activationNodeFn` to perform `runNode`. Return paths include `fight.runNode(services.fightServices,bot)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `activationNodeFn` and `fightServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `aiNode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L468)

<a id="function-function-mq3-game-bot-seek-state-seeknbgnode-function-seeknbgnode-services-bot-src-mq3-game-bot-seek-state-ml-1849108947"></a>
### seekNbgNode

```ml
function seekNbgNode(services, bot)
```

Update `bot.tfl`, `bot.enemy`, `bot.nbgTime` and `bot.checkTime` and related state during `seekNbgNode`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `fightServices`, `observerFn`, `grapple`, `mapScriptsFn` and `topGoalFn` and related fields. |
| `bot` | `dynamic` | — | Bot AI state; accesses `tfl`, `enemy`, `gs`, `nbgTime` and `checkTime` and related fields. May update `bot.tfl`, `bot.enemy` and `bot.nbgTime` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L430)

<a id="function-function-mq3-game-bot-seek-state-seeknode-function-seeknode-services-bot-src-mq3-game-bot-seek-state-ml-1936074009"></a>
### seekNode

```ml
function seekNode(services, bot)
```

Update `bot.standTime`, `bot.tfl`, `bot.enemy` and `bot.checkTime` and related state during `seekNode`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `fightServices`, `observerFn`, `randomChatFn`, `chatTimeFn` and `grapple` and related fields. |
| `bot` | `dynamic` | — | Bot AI state; accesses `standTime`, `tfl`, `enemy`, `killedEnemyTime` and `thinktime` and related fields. May update `bot.standTime`, `bot.tfl` and `bot.enemy` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L382)

- [mq3.game.bot_seek_state.Services](Type-mq3-game-bot-seek-state-services-1489276516.md) — struct
<a id="function-function-mq3-game-bot-seek-state-setupmovement-function-setupmovement-services-bot-src-mq3-game-bot-seek-state-ml-1751242557"></a>
### setupMovement

```ml
function setupMovement(services, bot)
```

Use `services.setupMovementFn` to perform `setupMovement`. Return paths include `navigation.setupForMovement(services.navigationServices,bot)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `setupMovementFn` and `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `curPs`, `entitynum`, `client`, `thinktime` and `viewangles` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L375)

<a id="function-function-mq3-game-bot-seek-state-standnode-function-standnode-services-bot-src-mq3-game-bot-seek-state-ml-570144725"></a>
### standNode

```ml
function standNode(services, bot)
```

Update `bot.standFindEnemyTime` and `bot.standTime` during `standNode`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `fightServices`, `hitTalkingChatFn`, `chatTimeFn`, `talkFn` and `enterChatFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `lastframeHealth`, `inventory`, `standFindEnemyTime`, `standTime` and `client` and related fields. May update `bot.standFindEnemyTime` and `bot.standTime` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L269)

<a id="constant-constant-mq3-game-bot-seek-state-tfl-default-const-tfl-default-18616254-src-mq3-game-bot-seek-state-ml-24148902"></a>
### TFL_DEFAULT

```ml
const TFL_DEFAULT = 18616254
```

Default combination of permitted AAS travel types used by bot movement queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L40)

<a id="constant-constant-mq3-game-bot-seek-state-tfl-grapplehook-const-tfl-grapplehook-16384-src-mq3-game-bot-seek-state-ml-509402601"></a>
### TFL_GRAPPLEHOOK

```ml
const TFL_GRAPPLEHOOK = 16384
```

AAS travel-mask bit allowing the grapplehook travel category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L44)

<a id="constant-constant-mq3-game-bot-seek-state-tfl-lava-const-tfl-lava-4194304-src-mq3-game-bot-seek-state-ml-1309007632"></a>
### TFL_LAVA

```ml
const TFL_LAVA = 4194304
```

AAS travel-mask bit allowing the lava travel category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L48)

<a id="constant-constant-mq3-game-bot-seek-state-tfl-rocketjump-const-tfl-rocketjump-4096-src-mq3-game-bot-seek-state-ml-530482152"></a>
### TFL_ROCKETJUMP

```ml
const TFL_ROCKETJUMP = 4096
```

AAS travel-mask bit allowing the rocketjump travel category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L42)

<a id="constant-constant-mq3-game-bot-seek-state-tfl-slime-const-tfl-slime-2097152-src-mq3-game-bot-seek-state-ml-1281841815"></a>
### TFL_SLIME

```ml
const TFL_SLIME = 2097152
```

AAS travel-mask bit allowing the slime travel category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L46)

<a id="function-function-mq3-game-bot-seek-state-transition-function-transition-services-bot-node-reason-src-mq3-game-bot-seek-state-ml-1898709981"></a>
### transition

```ml
function transition(services, bot, node, reason)
```

Set `bot.aiNode` to `node` in `mq3.game.bot_seek_state.transition`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `enterNodeFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `aiNode`. May update `bot.aiNode` in place. |
| `node` | `dynamic` | — | Value passed as argument 3 to `services.enterNodeFn`. |
| `reason` | `dynamic` | — | Reason text recorded with the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_seek_state.ml#L170)
