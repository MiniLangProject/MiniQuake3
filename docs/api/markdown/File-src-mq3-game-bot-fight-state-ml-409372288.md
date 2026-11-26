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

Bot-state flag marking fightsuicidal.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L30)

<a id="constant-constant-mq3-game-bot-fight-state-bfl-idealviewset-const-bfl-idealviewset-32-src-mq3-game-bot-fight-state-ml-1840801888"></a>
### BFL_IDEALVIEWSET

```ml
const BFL_IDEALVIEWSET = 32
```

Bot-state flag marking idealviewset.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L32)

<a id="function-function-mq3-game-bot-fight-state-chasenode-function-chasenode-services-bot-src-mq3-game-bot-fight-state-ml-82874141"></a>
### chaseNode

```ml
function chaseNode(services, bot)
```

Update `bot.tfl`, `bot.chaseTime`, `bot.checkTime` and `bot.nbgTime` and related state during `chaseNode`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `combatServices`, `observerFn`, `grapple`, `mapScriptsFn` and `touchingGoalFn` and related fields. |
| `bot` | `dynamic` | — | Bot AI state; accesses `enemy`, `entitynum`, `eye`, `viewangles` and `lastEnemyAreaNum` and related fields. May update `bot.tfl`, `bot.chaseTime` and `bot.checkTime` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L234)

<a id="function-function-mq3-game-bot-fight-state-create-function-create-combatservices-src-mq3-game-bot-fight-state-ml-1870303502"></a>
### create

```ml
function create(combatServices)
```

Create a `mq3.game.bot_fight_state.Services` record, initializing `combatServices` from `combatServices`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `combatServices` | `dynamic` | — | Initial value stored in `mq3.game.bot_fight_state.Services.combatServices`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L124)

<a id="function-function-mq3-game-bot-fight-state-enterchase-function-enterchase-services-bot-reason-src-mq3-game-bot-fight-state-ml-1818300369"></a>
### enterChase

```ml
function enterChase(services, bot, reason)
```

Set `bot.chaseTime` to `fightCombat.now(services.combatServices)` and `bot.aiNode` to `NODE_CHASE` in `mq3.game.bot_fight_state.enterChase`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `recordNodeFn` and `combatServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `chaseTime` and `aiNode`. May update `bot.chaseTime` and `bot.aiNode` in place. |
| `reason` | `dynamic` | — | Reason text recorded with the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L153)

<a id="function-function-mq3-game-bot-fight-state-enterfight-function-enterfight-services-bot-reason-src-mq3-game-bot-fight-state-ml-2102420633"></a>
### enterFight

```ml
function enterFight(services, bot, reason)
```

Set `bot.aiNode` to `NODE_FIGHT` in `mq3.game.bot_fight_state.enterFight`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `recordNodeFn` and `resetLastAvoidFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ms` and `aiNode`. May update `bot.aiNode` in place. |
| `reason` | `dynamic` | — | Reason text recorded with the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L139)

<a id="function-function-mq3-game-bot-fight-state-enternbg-function-enternbg-services-bot-reason-src-mq3-game-bot-fight-state-ml-107429025"></a>
### enterNbg

```ml
function enterNbg(services, bot, reason)
```

Set `bot.aiNode` to `NODE_NBG` in `mq3.game.bot_fight_state.enterNbg`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `recordNodeFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `aiNode`. May update `bot.aiNode` in place. |
| `reason` | `dynamic` | — | Reason text recorded with the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L167)

<a id="function-function-mq3-game-bot-fight-state-enterretreat-function-enterretreat-services-bot-reason-src-mq3-game-bot-fight-state-ml-100480993"></a>
### enterRetreat

```ml
function enterRetreat(services, bot, reason)
```

Set `bot.aiNode` to `NODE_RETREAT` in `mq3.game.bot_fight_state.enterRetreat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `recordNodeFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `aiNode`. May update `bot.aiNode` in place. |
| `reason` | `dynamic` | — | Reason text recorded with the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L160)

<a id="function-function-mq3-game-bot-fight-state-entersuicidalfight-function-entersuicidalfight-services-bot-reason-src-mq3-game-bot-fight-state-ml-1678200785"></a>
### enterSuicidalFight

```ml
function enterSuicidalFight(services, bot, reason)
```

Set `bot.combatFlags` to `bot.combatFlags|BFL_FIGHTSUICIDAL` in `mq3.game.bot_fight_state.enterSuicidalFight`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `recordNodeFn` and `resetLastAvoidFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `combatFlags`. May update `bot.combatFlags` in place. |
| `reason` | `dynamic` | — | Reason text recorded with the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L146)

<a id="function-function-mq3-game-bot-fight-state-fightnode-function-fightnode-services-bot-src-mq3-game-bot-fight-state-ml-873797165"></a>
### fightNode

```ml
function fightNode(services, bot)
```

Update `bot.enemyDeathTime`, `bot.standTime`, `bot.ltgTime` and `bot.lastEnemyOrigin` and related state during `fightNode`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `combatServices`, `observerFn`, `chatEnemySuicideFn`, `chatKillFn` and `chatTimeFn` and related fields. |
| `bot` | `dynamic` | — | Bot AI state; accesses `enemy`, `enemyDeathTime`, `enemySuicide`, `lastKilledPlayer` and `standTime` and related fields. May update `bot.enemyDeathTime`, `bot.standTime` and `bot.ltgTime` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L195)

<a id="constant-constant-mq3-game-bot-fight-state-moveresult-movementview-const-moveresult-movementview-1-src-mq3-game-bot-fight-state-ml-125712126"></a>
### MOVERESULT_MOVEMENTVIEW

```ml
const MOVERESULT_MOVEMENTVIEW = 1
```

Bot movement-result flag reporting movementview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L34)

<a id="constant-constant-mq3-game-bot-fight-state-moveresult-movementviewset-const-moveresult-movementviewset-8-src-mq3-game-bot-fight-state-ml-1354463609"></a>
### MOVERESULT_MOVEMENTVIEWSET

```ml
const MOVERESULT_MOVEMENTVIEWSET = 8
```

Bot movement-result flag reporting movementviewset.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L38)

<a id="constant-constant-mq3-game-bot-fight-state-moveresult-movementweapon-const-moveresult-movementweapon-16-src-mq3-game-bot-fight-state-ml-1929440314"></a>
### MOVERESULT_MOVEMENTWEAPON

```ml
const MOVERESULT_MOVEMENTWEAPON = 16
```

Bot movement-result flag reporting movementweapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L40)

<a id="constant-constant-mq3-game-bot-fight-state-moveresult-swimview-const-moveresult-swimview-2-src-mq3-game-bot-fight-state-ml-801628163"></a>
### MOVERESULT_SWIMVIEW

```ml
const MOVERESULT_SWIMVIEW = 2
```

Bot movement-result flag reporting swimview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L36)

<a id="function-function-mq3-game-bot-fight-state-nbgnode-function-nbgnode-services-bot-src-mq3-game-bot-fight-state-ml-1412065051"></a>
### nbgNode

```ml
function nbgNode(services, bot)
```

Update `bot.tfl`, `bot.enemyVisibleTime`, `bot.lastEnemyOrigin` and `bot.lastEnemyAreaNum` and related state during `nbgNode`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `combatServices`, `observerFn`, `grapple`, `mapScriptsFn` and `missionEnemyTargetFn` and related fields. |
| `bot` | `dynamic` | — | Bot AI state; accesses `enemy`, `tfl`, `entitynum`, `eye` and `viewangles` and related fields. May update `bot.tfl`, `bot.enemyVisibleTime` and `bot.lastEnemyOrigin` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L288)

<a id="constant-constant-mq3-game-bot-fight-state-node-chase-const-node-chase-2-src-mq3-game-bot-fight-state-ml-1733232747"></a>
### NODE_CHASE

```ml
const NODE_CHASE = 2
```

Bot decision-state identifier for the chase node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L12)

<a id="constant-constant-mq3-game-bot-fight-state-node-fight-const-node-fight-1-src-mq3-game-bot-fight-state-ml-1802288078"></a>
### NODE_FIGHT

```ml
const NODE_FIGHT = 1
```

Bot decision-state identifier for the fight node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L10)

<a id="constant-constant-mq3-game-bot-fight-state-node-intermission-const-node-intermission-6-src-mq3-game-bot-fight-state-ml-436398263"></a>
### NODE_INTERMISSION

```ml
const NODE_INTERMISSION = 6
```

Bot decision-state identifier for the intermission node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L20)

<a id="constant-constant-mq3-game-bot-fight-state-node-nbg-const-node-nbg-9-src-mq3-game-bot-fight-state-ml-1563047484"></a>
### NODE_NBG

```ml
const NODE_NBG = 9
```

Bot decision-state identifier for the nbg node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L26)

<a id="constant-constant-mq3-game-bot-fight-state-node-observer-const-node-observer-5-src-mq3-game-bot-fight-state-ml-1219803358"></a>
### NODE_OBSERVER

```ml
const NODE_OBSERVER = 5
```

Bot decision-state identifier for the observer node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L18)

<a id="constant-constant-mq3-game-bot-fight-state-node-respawn-const-node-respawn-7-src-mq3-game-bot-fight-state-ml-1321023676"></a>
### NODE_RESPAWN

```ml
const NODE_RESPAWN = 7
```

Bot decision-state identifier for the respawn node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L22)

<a id="constant-constant-mq3-game-bot-fight-state-node-retreat-const-node-retreat-8-src-mq3-game-bot-fight-state-ml-1120240459"></a>
### NODE_RETREAT

```ml
const NODE_RETREAT = 8
```

Bot decision-state identifier for the retreat node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L24)

<a id="constant-constant-mq3-game-bot-fight-state-node-seek-const-node-seek-3-src-mq3-game-bot-fight-state-ml-1732842264"></a>
### NODE_SEEK

```ml
const NODE_SEEK = 3
```

Bot decision-state identifier for the seek node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L14)

<a id="constant-constant-mq3-game-bot-fight-state-node-seek-nbg-const-node-seek-nbg-10-src-mq3-game-bot-fight-state-ml-824743100"></a>
### NODE_SEEK_NBG

```ml
const NODE_SEEK_NBG = 10
```

Bot decision-state identifier for the seek nbg node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L28)

<a id="constant-constant-mq3-game-bot-fight-state-node-stand-const-node-stand-4-src-mq3-game-bot-fight-state-ml-1329056621"></a>
### NODE_STAND

```ml
const NODE_STAND = 4
```

Bot decision-state identifier for the stand node.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L16)

<a id="constant-constant-mq3-game-bot-fight-state-pers-hits-const-pers-hits-1-src-mq3-game-bot-fight-state-ml-454502046"></a>
### PERS_HITS

```ml
const PERS_HITS = 1
```

Persistent player-state statistics index storing hits.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L52)

<a id="function-function-mq3-game-bot-fight-state-retreatnode-function-retreatnode-services-bot-src-mq3-game-bot-fight-state-ml-491049815"></a>
### retreatNode

```ml
function retreatNode(services, bot)
```

Update `bot.tfl`, `bot.enemyVisibleTime`, `bot.lastEnemyOrigin` and `bot.lastEnemyAreaNum` and related state during `retreatNode`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `combatServices`, `observerFn`, `grapple`, `mapScriptsFn` and `updateBattleFn` and related fields. |
| `bot` | `dynamic` | — | Bot AI state; accesses `enemy`, `tfl`, `gs`, `entitynum` and `eye` and related fields. May update `bot.tfl`, `bot.enemyVisibleTime` and `bot.lastEnemyOrigin` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L263)

<a id="function-function-mq3-game-bot-fight-state-runnode-function-runnode-services-bot-src-mq3-game-bot-fight-state-ml-77315663"></a>
### runNode

```ml
function runNode(services, bot)
```

Apply `mq3.game.bot_fight_state.fightNode`, `mq3.game.bot_fight_state.chaseNode` and `mq3.game.bot_fight_state.retreatNode` while evaluating `runNode`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `combatServices`, `observerFn`, `chatEnemySuicideFn`, `chatKillFn` and `chatTimeFn` and related fields. |
| `bot` | `dynamic` | — | Bot AI state; accesses `aiNode`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L307)

- [mq3.game.bot_fight_state.Services](Type-mq3-game-bot-fight-state-services-2017905966.md) — struct
<a id="function-function-mq3-game-bot-fight-state-setmovementview-function-setmovementview-services-bot-movement-goal-allowaim-copyviewset-halveroll-src-mq3-game-bot-fight-state-ml-433827964"></a>
### setMovementView

```ml
function setMovementView(services, bot, movement, goal, allowAim, copyViewSet, halveRoll)
```

Update `bot.idealViewangles`, `bot.idealViewangles[2]` and `bot.weaponnum` during `setMovementView`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `combatServices` and `movementViewTargetFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `idealViewangles`, `combatFlags`, `ms`, `tfl` and `origin` and related fields. May update `bot.idealViewangles`, `bot.idealViewangles[2]` and `bot.weaponnum` in place. |
| `movement` | `dynamic` | — | Movement record; accesses `flags`, `idealViewangles`, `movedir` and `weapon`. |
| `goal` | `dynamic` | — | Value passed as argument 3 to `services.movementViewTargetFn`. |
| `allowAim` | `dynamic` | — | Value used by `setMovementView` in `if allowAim then fightCombat.aimAtEnemy(services.combatServices,bot)`. |
| `copyViewSet` | `dynamic` | — | Value used by `setMovementView` in `fixed=(movement.flags&(MOVERESULT_MOVEMENTVIEW\|MOVERESULT_SWIMVIEW))!=0 or (copyViewSet and (movement.flags&MOVE...`. |
| `halveRoll` | `dynamic` | — | Value used by `setMovementView` in `if halveRoll then bot.idealViewangles[2]=n.fmul(bot.idealViewangles[2],0.5) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L178)

<a id="constant-constant-mq3-game-bot-fight-state-tfl-default-const-tfl-default-18616254-src-mq3-game-bot-fight-state-ml-230567952"></a>
### TFL_DEFAULT

```ml
const TFL_DEFAULT = 18616254
```

Default combination of permitted AAS travel types used by bot movement queries.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L42)

<a id="constant-constant-mq3-game-bot-fight-state-tfl-grapplehook-const-tfl-grapplehook-16384-src-mq3-game-bot-fight-state-ml-436019705"></a>
### TFL_GRAPPLEHOOK

```ml
const TFL_GRAPPLEHOOK = 16384
```

AAS travel-mask bit allowing the grapplehook travel category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L46)

<a id="constant-constant-mq3-game-bot-fight-state-tfl-lava-const-tfl-lava-4194304-src-mq3-game-bot-fight-state-ml-1736915490"></a>
### TFL_LAVA

```ml
const TFL_LAVA = 4194304
```

AAS travel-mask bit allowing the lava travel category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L50)

<a id="constant-constant-mq3-game-bot-fight-state-tfl-rocketjump-const-tfl-rocketjump-4096-src-mq3-game-bot-fight-state-ml-1212488990"></a>
### TFL_ROCKETJUMP

```ml
const TFL_ROCKETJUMP = 4096
```

AAS travel-mask bit allowing the rocketjump travel category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L44)

<a id="constant-constant-mq3-game-bot-fight-state-tfl-slime-const-tfl-slime-2097152-src-mq3-game-bot-fight-state-ml-108320079"></a>
### TFL_SLIME

```ml
const TFL_SLIME = 2097152
```

AAS travel-mask bit allowing the slime travel category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L48)

<a id="function-function-mq3-game-bot-fight-state-transition-function-transition-services-bot-node-reason-src-mq3-game-bot-fight-state-ml-1611023637"></a>
### transition

```ml
function transition(services, bot, node, reason)
```

Set `bot.aiNode` to `node` in `mq3.game.bot_fight_state.transition`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `enterNodeFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `aiNode`. May update `bot.aiNode` in place. |
| `node` | `dynamic` | — | Value passed as argument 3 to `services.enterNodeFn`. |
| `reason` | `dynamic` | — | Reason text recorded with the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_fight_state.ml#L132)
