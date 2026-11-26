# `src/mq3/game/ai_dmnet.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.ai_dmnet`](Package-mq3-game-ai-dmnet-1415007693.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/bot_fight_state.ml` as `fight` → [src/mq3/game/bot_fight_state.ml](File-src-mq3-game-bot-fight-state-ml-409372288.md)
- `mq3/game/bot_navigation.ml` as `navigation` → [src/mq3/game/bot_navigation.ml](File-src-mq3-game-bot-navigation-ml-746290412.md)
- `mq3/game/bot_seek_state.ml` as `seek` → [src/mq3/game/bot_seek_state.ml](File-src-mq3-game-bot-seek-state-ml-2095182684.md)
- `mq3/game/game_headers.ml` as `headers` → [src/mq3/game/game_headers.ml](File-src-mq3-game-game-headers-ml-1243119809.md)
- `mq3/shared/math.ml` as `q` → [src/mq3/shared/math.ml](File-src-mq3-shared-math-ml-294597397.md)

## Declarations

- [mq3.game.ai_dmnet.Action](Type-mq3-game-ai-dmnet-action-1591114811.md) — struct
<a id="function-function-mq3-game-ai-dmnet-aienter-battle-chase-function-aienter-battle-chase-services-bot-reason-src-mq3-game-ai-dmnet-ml-12440577"></a>
### AIEnter_Battle_Chase

```ml
function AIEnter_Battle_Chase(services, bot, reason)
```

Forward `AIEnter_Battle_Chase` to `mq3.game.bot_fight_state.enterChase` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `fightServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `chaseTime` and `aiNode`. May update `bot.chaseTime` and `bot.aiNode` in place. |
| `reason` | `dynamic` | — | Reason text recorded with the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L497)

<a id="function-function-mq3-game-ai-dmnet-aienter-battle-fight-function-aienter-battle-fight-services-bot-reason-src-mq3-game-ai-dmnet-ml-102341825"></a>
### AIEnter_Battle_Fight

```ml
function AIEnter_Battle_Fight(services, bot, reason)
```

Forward `AIEnter_Battle_Fight` to `mq3.game.bot_fight_state.enterFight` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `fightServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ms` and `aiNode`. May update `bot.aiNode` in place. |
| `reason` | `dynamic` | — | Reason text recorded with the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L483)

<a id="function-function-mq3-game-ai-dmnet-aienter-battle-nbg-function-aienter-battle-nbg-services-bot-reason-src-mq3-game-ai-dmnet-ml-1358199085"></a>
### AIEnter_Battle_NBG

```ml
function AIEnter_Battle_NBG(services, bot, reason)
```

Forward `AIEnter_Battle_NBG` to `mq3.game.bot_fight_state.enterNbg` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `fightServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `aiNode`. May update `bot.aiNode` in place. |
| `reason` | `dynamic` | — | Reason text recorded with the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L515)

<a id="function-function-mq3-game-ai-dmnet-aienter-battle-retreat-function-aienter-battle-retreat-services-bot-reason-src-mq3-game-ai-dmnet-ml-1931621837"></a>
### AIEnter_Battle_Retreat

```ml
function AIEnter_Battle_Retreat(services, bot, reason)
```

Forward `AIEnter_Battle_Retreat` to `mq3.game.bot_fight_state.enterRetreat` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `fightServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `aiNode`. May update `bot.aiNode` in place. |
| `reason` | `dynamic` | — | Reason text recorded with the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L506)

<a id="function-function-mq3-game-ai-dmnet-aienter-battle-suicidalfight-function-aienter-battle-suicidalfight-services-bot-reason-src-mq3-game-ai-dmnet-ml-2113386617"></a>
### AIEnter_Battle_SuicidalFight

```ml
function AIEnter_Battle_SuicidalFight(services, bot, reason)
```

Forward `AIEnter_Battle_SuicidalFight` to `mq3.game.bot_fight_state.enterSuicidalFight` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `fightServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `combatFlags`. May update `bot.combatFlags` in place. |
| `reason` | `dynamic` | — | Reason text recorded with the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L488)

<a id="function-function-mq3-game-ai-dmnet-aienter-intermission-function-aienter-intermission-services-bot-reason-src-mq3-game-ai-dmnet-ml-163975121"></a>
### AIEnter_Intermission

```ml
function AIEnter_Intermission(services, bot, reason)
```

Forward `AIEnter_Intermission` to `mq3.game.bot_seek_state.enterIntermission` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `seekServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `chatto` and `aiNode`. May update `bot.aiNode` in place. |
| `reason` | `dynamic` | — | Reason text recorded with the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L385)

<a id="function-function-mq3-game-ai-dmnet-aienter-observer-function-aienter-observer-services-bot-reason-src-mq3-game-ai-dmnet-ml-1215355437"></a>
### AIEnter_Observer

```ml
function AIEnter_Observer(services, bot, reason)
```

Forward `AIEnter_Observer` to `mq3.game.bot_seek_state.enterObserver` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `seekServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `aiNode`. May update `bot.aiNode` in place. |
| `reason` | `dynamic` | — | Reason text recorded with the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L394)

<a id="function-function-mq3-game-ai-dmnet-aienter-respawn-function-aienter-respawn-services-bot-reason-src-mq3-game-ai-dmnet-ml-482959979"></a>
### AIEnter_Respawn

```ml
function AIEnter_Respawn(services, bot, reason)
```

Forward `AIEnter_Respawn` to `mq3.game.bot_seek_state.enterRespawn` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `seekServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ms`, `gs`, `respawnTime`, `respawnChatTime` and `respawnWait` and related fields. May update `bot.respawnTime`, `bot.respawnChatTime` and `bot.respawnWait` and additional fields in place. |
| `reason` | `dynamic` | — | Reason text recorded with the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L412)

<a id="function-function-mq3-game-ai-dmnet-aienter-seek-activateentity-function-aienter-seek-activateentity-services-bot-reason-src-mq3-game-ai-dmnet-ml-1769813025"></a>
### AIEnter_Seek_ActivateEntity

```ml
function AIEnter_Seek_ActivateEntity(services, bot, reason)
```

Forward `AIEnter_Seek_ActivateEntity` to `mq3.game.bot_seek_state.enterActivate` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `seekServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `aiNode`. May update `bot.aiNode` in place. |
| `reason` | `dynamic` | — | Reason text recorded with the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L456)

<a id="function-function-mq3-game-ai-dmnet-aienter-seek-ltg-function-aienter-seek-ltg-services-bot-reason-src-mq3-game-ai-dmnet-ml-206226385"></a>
### AIEnter_Seek_LTG

```ml
function AIEnter_Seek_LTG(services, bot, reason)
```

Forward `AIEnter_Seek_LTG` to `mq3.game.bot_seek_state.enterSeek` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `seekServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `gs` and `aiNode`. May update `bot.aiNode` in place. |
| `reason` | `dynamic` | — | Reason text recorded with the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L474)

<a id="function-function-mq3-game-ai-dmnet-aienter-seek-nbg-function-aienter-seek-nbg-services-bot-reason-src-mq3-game-ai-dmnet-ml-1346534237"></a>
### AIEnter_Seek_NBG

```ml
function AIEnter_Seek_NBG(services, bot, reason)
```

Forward `AIEnter_Seek_NBG` to `mq3.game.bot_seek_state.enterSeekNbg` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `seekServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `gs` and `aiNode`. May update `bot.aiNode` in place. |
| `reason` | `dynamic` | — | Reason text recorded with the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L465)

<a id="function-function-mq3-game-ai-dmnet-aienter-stand-function-aienter-stand-services-bot-reason-src-mq3-game-ai-dmnet-ml-1218143891"></a>
### AIEnter_Stand

```ml
function AIEnter_Stand(services, bot, reason)
```

Forward `AIEnter_Stand` to `mq3.game.bot_seek_state.enterStand` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `seekServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `standFindEnemyTime` and `aiNode`. May update `bot.standFindEnemyTime` and `bot.aiNode` in place. |
| `reason` | `dynamic` | — | Reason text recorded with the operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L403)

<a id="function-function-mq3-game-ai-dmnet-ainode-battle-chase-function-ainode-battle-chase-services-bot-src-mq3-game-ai-dmnet-ml-130864561"></a>
### AINode_Battle_Chase

```ml
function AINode_Battle_Chase(services, bot)
```

Forward `AINode_Battle_Chase` to `mq3.game.bot_fight_state.chaseNode` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `fightServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `enemy`, `entitynum`, `eye`, `viewangles` and `lastEnemyAreaNum` and related fields. May update `bot.tfl`, `bot.chaseTime` and `bot.checkTime` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L501)

<a id="function-function-mq3-game-ai-dmnet-ainode-battle-fight-function-ainode-battle-fight-services-bot-src-mq3-game-ai-dmnet-ml-127466025"></a>
### AINode_Battle_Fight

```ml
function AINode_Battle_Fight(services, bot)
```

Forward `AINode_Battle_Fight` to `mq3.game.bot_fight_state.fightNode` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `fightServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `enemy`, `enemyDeathTime`, `enemySuicide`, `lastKilledPlayer` and `standTime` and related fields. May update `bot.enemyDeathTime`, `bot.standTime` and `bot.ltgTime` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L492)

<a id="function-function-mq3-game-ai-dmnet-ainode-battle-nbg-function-ainode-battle-nbg-services-bot-src-mq3-game-ai-dmnet-ml-1430825679"></a>
### AINode_Battle_NBG

```ml
function AINode_Battle_NBG(services, bot)
```

Forward `AINode_Battle_NBG` to `mq3.game.bot_fight_state.nbgNode` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `fightServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `enemy`, `tfl`, `entitynum`, `eye` and `viewangles` and related fields. May update `bot.tfl`, `bot.enemyVisibleTime` and `bot.lastEnemyOrigin` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L519)

<a id="function-function-mq3-game-ai-dmnet-ainode-battle-retreat-function-ainode-battle-retreat-services-bot-src-mq3-game-ai-dmnet-ml-532863807"></a>
### AINode_Battle_Retreat

```ml
function AINode_Battle_Retreat(services, bot)
```

Forward `AINode_Battle_Retreat` to `mq3.game.bot_fight_state.retreatNode` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `fightServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `enemy`, `tfl`, `gs`, `entitynum` and `eye` and related fields. May update `bot.tfl`, `bot.enemyVisibleTime` and `bot.lastEnemyOrigin` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L510)

<a id="function-function-mq3-game-ai-dmnet-ainode-intermission-function-ainode-intermission-services-bot-src-mq3-game-ai-dmnet-ml-1709756127"></a>
### AINode_Intermission

```ml
function AINode_Intermission(services, bot)
```

Forward `AINode_Intermission` to `mq3.game.bot_seek_state.intermissionNode` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `seekServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `standTime`. May update `bot.standTime` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L389)

<a id="function-function-mq3-game-ai-dmnet-ainode-observer-function-ainode-observer-services-bot-src-mq3-game-ai-dmnet-ml-944643287"></a>
### AINode_Observer

```ml
function AINode_Observer(services, bot)
```

Forward `AINode_Observer` to `mq3.game.bot_seek_state.observerNode` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `seekServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `standFindEnemyTime` and `aiNode`. May update `bot.standFindEnemyTime` and `bot.aiNode` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L398)

<a id="function-function-mq3-game-ai-dmnet-ainode-respawn-function-ainode-respawn-services-bot-src-mq3-game-ai-dmnet-ml-1170937405"></a>
### AINode_Respawn

```ml
function AINode_Respawn(services, bot)
```

Forward `AINode_Respawn` to `mq3.game.bot_seek_state.respawnNode` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `seekServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `respawnWait`, `client`, `respawnTime`, `respawnChatTime` and `chatto` and related fields. May update `bot.respawnWait` and `bot.enemy` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L416)

<a id="function-function-mq3-game-ai-dmnet-ainode-seek-activateentity-function-ainode-seek-activateentity-services-bot-src-mq3-game-ai-dmnet-ml-405566145"></a>
### AINode_Seek_ActivateEntity

```ml
function AINode_Seek_ActivateEntity(services, bot)
```

Forward `AINode_Seek_ActivateEntity` to `mq3.game.bot_seek_state.activateNode` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `seekServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `tfl`, `enemy`, `activateStackIndex`, `activateGoalHeap` and `curPs` and related fields. May update `bot.tfl`, `bot.enemy` and `bot.activateGoalHeap[bot.activateStackIndex].time` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L460)

<a id="function-function-mq3-game-ai-dmnet-ainode-seek-ltg-function-ainode-seek-ltg-services-bot-src-mq3-game-ai-dmnet-ml-1974373579"></a>
### AINode_Seek_LTG

```ml
function AINode_Seek_LTG(services, bot)
```

Forward `AINode_Seek_LTG` to `mq3.game.bot_seek_state.seekNode` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `seekServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `standTime`, `tfl`, `enemy`, `killedEnemyTime` and `thinktime` and related fields. May update `bot.standTime`, `bot.tfl` and `bot.enemy` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L478)

<a id="function-function-mq3-game-ai-dmnet-ainode-seek-nbg-function-ainode-seek-nbg-services-bot-src-mq3-game-ai-dmnet-ml-1994967975"></a>
### AINode_Seek_NBG

```ml
function AINode_Seek_NBG(services, bot)
```

Forward `AINode_Seek_NBG` to `mq3.game.bot_seek_state.seekNbgNode` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `seekServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `tfl`, `enemy`, `gs`, `nbgTime` and `checkTime` and related fields. May update `bot.tfl`, `bot.enemy` and `bot.nbgTime` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L469)

<a id="function-function-mq3-game-ai-dmnet-ainode-stand-function-ainode-stand-services-bot-src-mq3-game-ai-dmnet-ml-999361517"></a>
### AINode_Stand

```ml
function AINode_Stand(services, bot)
```

Forward `AINode_Stand` to `mq3.game.bot_seek_state.standNode` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `seekServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `lastframeHealth`, `inventory`, `standFindEnemyTime`, `standTime` and `client` and related fields. May update `bot.standFindEnemyTime` and `bot.standTime` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L407)

<a id="function-function-mq3-game-ai-dmnet-botclearpath-function-botclearpath-services-bot-movement-src-mq3-game-ai-dmnet-ml-874994080"></a>
### BotClearPath

```ml
function BotClearPath(services, bot, movement)
```

Set `bot.blockedByAvoidSpotTime` to `n.fadd(now(services),5.0)` in `mq3.game.ai_dmnet.BotClearPath`. Return paths include `movement`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `entityStateFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `kamikazeBody`, `blockedByAvoidSpotTime`, `proxMines`, `origin` and `inventory`. May update `bot.blockedByAvoidSpotTime` in place. |
| `movement` | `dynamic` | — | Movement record; accesses `flags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L441)

<a id="function-function-mq3-game-ai-dmnet-botdumpnodeswitches-function-botdumpnodeswitches-services-bot-src-mq3-game-ai-dmnet-ml-2095747351"></a>
### BotDumpNodeSwitches

```ml
function BotDumpNodeSwitches(services, bot)
```

Record or dispatch `"node-overflow"` and `"node-history"` actions in `BotDumpNodeSwitches`. Return paths include `len(services.nodeSwitches)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `nodeSwitches`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L236)

<a id="function-function-mq3-game-ai-dmnet-botgetairgoal-function-botgetairgoal-services-bot-goal-src-mq3-game-ai-dmnet-ml-1278149994"></a>
### BotGetAirGoal

```ml
function BotGetAirGoal(services, bot, goal)
```

Forward `BotGetAirGoal` to `mq3.game.bot_navigation.getAirGoal` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `origin` and `entitynum`. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `origin`, `areanum`, `mins`, `maxs` and `flags` and related fields. May update `goal.origin`, `goal.areanum` and `goal.mins` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L246)

<a id="function-function-mq3-game-ai-dmnet-botgetitemlongtermgoal-function-botgetitemlongtermgoal-services-bot-tfl-goal-src-mq3-game-ai-dmnet-ml-2007641768"></a>
### BotGetItemLongTermGoal

```ml
function BotGetItemLongTermGoal(services, bot, tfl, goal)
```

Forward `BotGetItemLongTermGoal` to `mq3.game.bot_navigation.getItemLongTermGoal` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `gs`, `ltgTime`, `origin`, `inventory` and `ms`. May update `bot.ltgTime` in place. |
| `tfl` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |
| `goal` | `dynamic` | — | Target record; accesses `areanum`, `entitynum`, `origin`, `mins` and `maxs` and related fields. May update `goal.areanum`, `goal.entitynum` and `goal.origin` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L271)

<a id="function-function-mq3-game-ai-dmnet-botgetlongtermgoal-function-botgetlongtermgoal-services-bot-tfl-retreat-goal-src-mq3-game-ai-dmnet-ml-133524055"></a>
### BotGetLongTermGoal

```ml
function BotGetLongTermGoal(services, bot, tfl, retreat, goal)
```

Apply `mq3.game.ai_dmnet.missionLongTermGoal` and `mq3.game.bot_navigation.getLongTermGoal` while evaluating `BotGetLongTermGoal`. Return paths include `navigation.getLongTermGoal(services.navigationServices,bot,tfl,retreat,goal)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ltgtype`, `teamgoalTime`, `attackawayTime`, `origin` and `harvestawayTime`. May update `bot.ltgtype`, `bot.attackawayTime` and `bot.harvestawayTime` in place. |
| `tfl` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |
| `retreat` | `dynamic` | — | Value used by `getLongTermGoal` in `if bot.ltgtype==LTG_TEAMHELP and not retreat then`. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `origin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L360)

<a id="function-function-mq3-game-ai-dmnet-botgoforair-function-botgoforair-services-bot-tfl-ltg-range-src-mq3-game-ai-dmnet-ml-1553559741"></a>
### BotGoForAir

```ml
function BotGoForAir(services, bot, tfl, ltg, range)
```

Forward `BotGoForAir` to `mq3.game.bot_navigation.goForAir` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `lastairTime`, `gs`, `origin` and `inventory`. |
| `tfl` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |
| `ltg` | `dynamic` | — | Value passed as argument 6 to `services.chooseNbgFn`. |
| `range` | `dynamic` | — | Value passed as argument 7 to `services.chooseNbgFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L253)

<a id="function-function-mq3-game-ai-dmnet-botlongtermgoal-function-botlongtermgoal-services-bot-tfl-retreat-goal-src-mq3-game-ai-dmnet-ml-1049836759"></a>
### BotLongTermGoal

```ml
function BotLongTermGoal(services, bot, tfl, retreat, goal)
```

Update `bot.leadTime`, `bot.leadmessageTime`, `bot.leadvisibleTime` and `bot.leadbackupTime` and related state during `BotLongTermGoal`. Return paths include `BotGetLongTermGoal(services,bot,tfl,retreat,goal)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `leadTime`, `leadTeammate`, `leadmessageTime`, `leadTeamGoal` and `entitynum` and related fields. May update `bot.leadTime`, `bot.leadmessageTime` and `bot.leadvisibleTime` and additional fields in place. |
| `tfl` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |
| `retreat` | `dynamic` | — | Value used by `getLongTermGoal` in `if bot.ltgtype==LTG_TEAMHELP and not retreat then`. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `origin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L370)

<a id="function-function-mq3-game-ai-dmnet-botname-function-botname-services-bot-src-mq3-game-ai-dmnet-ml-1679809821"></a>
### botName

```ml
function botName(services, bot)
```

Use `services.nameFn` to perform `botName`. Return paths include `+str(bot.client)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `nameFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L217)

<a id="function-function-mq3-game-ai-dmnet-botnearbygoal-function-botnearbygoal-services-bot-tfl-ltg-range-src-mq3-game-ai-dmnet-ml-1841825803"></a>
### BotNearbyGoal

```ml
function BotNearbyGoal(services, bot, tfl, ltg, range)
```

Forward `BotNearbyGoal` to `mq3.game.bot_navigation.nearbyGoal` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `areanum`, `origin`, `teamGoal`, `gs` and `inventory`. |
| `tfl` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |
| `ltg` | `dynamic` | — | Value passed as argument 6 to `services.chooseNbgFn`. |
| `range` | `dynamic` | — | Value passed as argument 7 to `services.chooseNbgFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L260)

<a id="function-function-mq3-game-ai-dmnet-botreachedgoal-function-botreachedgoal-services-bot-goal-src-mq3-game-ai-dmnet-ml-1187692674"></a>
### BotReachedGoal

```ml
function BotReachedGoal(services, bot, goal)
```

Forward `BotReachedGoal` to `mq3.game.bot_navigation.reachedGoal` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `origin`, `gs`, `entitynum`, `eye` and `viewangles` and related fields. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `flags`, `number`, `areanum`, `origin` and `mins` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L265)

<a id="function-function-mq3-game-ai-dmnet-botrecordnodeswitch-function-botrecordnodeswitch-services-bot-node-detail-source-src-mq3-game-ai-dmnet-ml-174021941"></a>
### BotRecordNodeSwitch

```ml
function BotRecordNodeSwitch(services, bot, node, detail, source)
```

Record or dispatch `"node-switch"` actions in `BotRecordNodeSwitch`. Return paths include `record`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `nodeSwitches`. May update `services.nodeSwitches` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `node` | `dynamic` | — | Initial value stored in `mq3.game.ai_dmnet.NodeSwitch.node`. |
| `detail` | `dynamic` | — | Initial value stored in `mq3.game.ai_dmnet.NodeSwitch.detail`. |
| `source` | `dynamic` | — | Initial value stored in `mq3.game.ai_dmnet.NodeSwitch.source`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L228)

<a id="function-function-mq3-game-ai-dmnet-botresetnodeswitches-function-botresetnodeswitches-services-src-mq3-game-ai-dmnet-ml-669119802"></a>
### BotResetNodeSwitches

```ml
function BotResetNodeSwitches(services)
```

Set `services.nodeSwitches` to `[]` in `mq3.game.ai_dmnet.BotResetNodeSwitches`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `nodeSwitches`. May update `services.nodeSwitches` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L221)

<a id="function-function-mq3-game-ai-dmnet-botselectactivateweapon-function-botselectactivateweapon-services-bot-src-mq3-game-ai-dmnet-ml-136660761"></a>
### BotSelectActivateWeapon

```ml
function BotSelectActivateWeapon(services, bot)
```

Choose the first available weapon with ammunition from the activation-weapon priority order.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `mission`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `inventory`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L421)

<a id="function-function-mq3-game-ai-dmnet-copymissiongoal-function-copymissiongoal-goal-value-src-mq3-game-ai-dmnet-ml-1464504796"></a>
### copyMissionGoal

```ml
function copyMissionGoal(goal, value)
```

Apply `mq3.game.bot_navigation.copyGoalInto` while evaluating `copyMissionGoal`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `goal` | `dynamic` | — | Target record; accesses `areanum`, `entitynum`, `origin`, `mins` and `maxs` and related fields. May update `goal.areanum`, `goal.entitynum` and `goal.origin` and additional fields in place. |
| `value` | `dynamic` | — | Parser source state; accesses `areanum`, `entitynum`, `origin`, `mins` and `maxs` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L316)

<a id="function-function-mq3-game-ai-dmnet-create-function-create-fightservices-seekservices-navigationservices-src-mq3-game-ai-dmnet-ml-702546316"></a>
### create

```ml
function create(fightServices, seekServices, navigationServices)
```

Update `fightServices.missionEnemyTargetFn`, `fightServices.missionNearbyRangeFn`, `fightServices.dmnetServices` and `seekServices.missionNearbyRangeFn` and related state during `create`. Return paths include `services`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fightServices` | `dynamic` | — | Fight services record; accesses `missionEnemyTargetFn`, `missionNearbyRangeFn` and `dmnetServices`. May update `fightServices.missionEnemyTargetFn`, `fightServices.missionNearbyRangeFn` and `fightServices.dmnetServices` in place. |
| `seekServices` | `dynamic` | — | Seek services record; accesses `missionNearbyRangeFn` and `dmnetServices`. May update `seekServices.missionNearbyRangeFn` and `seekServices.dmnetServices` in place. |
| `navigationServices` | `dynamic` | — | Initial value stored in `mq3.game.ai_dmnet.Services.navigationServices`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L195)

<a id="function-function-mq3-game-ai-dmnet-emit-function-emit-services-kind-subject-detail-src-mq3-game-ai-dmnet-ml-1959875783"></a>
### emit

```ml
function emit(services, kind, subject, detail)
```

Set `services.actions` to `services.actions+[event]` in `mq3.game.ai_dmnet.emit`. Return paths include `event`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `retailActive`, `actions` and `printFn`. May update `services.actions` in place. |
| `kind` | `dynamic` | — | Initial value stored in `mq3.game.ai_dmnet.Action.kind`. |
| `subject` | `dynamic` | — | Initial value stored in `mq3.game.ai_dmnet.Action.subject`. |
| `detail` | `dynamic` | — | Initial value stored in `mq3.game.ai_dmnet.Action.detail`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L207)

<a id="function-function-mq3-game-ai-dmnet-goharvest-function-goharvest-services-bot-src-mq3-game-ai-dmnet-ml-1347761851"></a>
### goHarvest

```ml
function goHarvest(services, bot)
```

Set `bot.ltgtype` to `LTG_HARVEST` and `bot.teamgoalTime` to `n.fadd(now(services),120.0)` in `mq3.game.ai_dmnet.goHarvest`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `mission`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ltgtype` and `teamgoalTime`. May update `bot.ltgtype` and `bot.teamgoalTime` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L330)

<a id="constant-constant-mq3-game-ai-dmnet-gt-1fctf-const-gt-1fctf-5-src-mq3-game-ai-dmnet-ml-290202594"></a>
### GT_1FCTF

```ml
const GT_1FCTF = 5
```

Game-mode identifier selecting 1 fctf rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L15)

<a id="constant-constant-mq3-game-ai-dmnet-gt-harvester-const-gt-harvester-7-src-mq3-game-ai-dmnet-ml-789358548"></a>
### GT_HARVESTER

```ml
const GT_HARVESTER = 7
```

Game-mode identifier selecting harvester rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L19)

<a id="constant-constant-mq3-game-ai-dmnet-gt-obelisk-const-gt-obelisk-6-src-mq3-game-ai-dmnet-ml-1720688719"></a>
### GT_OBELISK

```ml
const GT_OBELISK = 6
```

Game-mode identifier selecting obelisk rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L17)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-belt-const-inventory-belt-headers-inventory-belt-src-mq3-game-ai-dmnet-ml-2016357681"></a>
### INVENTORY_BELT

```ml
const INVENTORY_BELT = headers.INVENTORY_BELT
```

Bot inventory slot used to read or update belt.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L75)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-bfg10k-const-inventory-bfg10k-headers-inventory-bfg10k-src-mq3-game-ai-dmnet-ml-761944489"></a>
### INVENTORY_BFG10K

```ml
const INVENTORY_BFG10K = headers.INVENTORY_BFG10K
```

Bot inventory slot used to read or update bfg10 k.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L53)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-bfgammo-const-inventory-bfgammo-headers-inventory-bfgammo-src-mq3-game-ai-dmnet-ml-2027361801"></a>
### INVENTORY_BFGAMMO

```ml
const INVENTORY_BFGAMMO = headers.INVENTORY_BFGAMMO
```

Bot inventory slot used to read or update bfgammo.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L71)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-bullets-const-inventory-bullets-headers-inventory-bullets-src-mq3-game-ai-dmnet-ml-144566703"></a>
### INVENTORY_BULLETS

```ml
const INVENTORY_BULLETS = headers.INVENTORY_BULLETS
```

Bot inventory slot used to read or update bullets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L61)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-cells-const-inventory-cells-headers-inventory-cells-src-mq3-game-ai-dmnet-ml-152683283"></a>
### INVENTORY_CELLS

```ml
const INVENTORY_CELLS = headers.INVENTORY_CELLS
```

Bot inventory slot used to read or update cells.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L63)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-chaingun-const-inventory-chaingun-headers-inventory-chaingun-src-mq3-game-ai-dmnet-ml-1201796333"></a>
### INVENTORY_CHAINGUN

```ml
const INVENTORY_CHAINGUN = headers.INVENTORY_CHAINGUN
```

Bot inventory slot used to read or update chaingun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L57)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-lightning-const-inventory-lightning-headers-inventory-lightning-src-mq3-game-ai-dmnet-ml-1825306298"></a>
### INVENTORY_LIGHTNING

```ml
const INVENTORY_LIGHTNING = headers.INVENTORY_LIGHTNING
```

Bot inventory slot used to read or update lightning gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L47)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-lightningammo-const-inventory-lightningammo-headers-inventory-lightningammo-src-mq3-game-ai-dmnet-ml-481450168"></a>
### INVENTORY_LIGHTNINGAMMO

```ml
const INVENTORY_LIGHTNINGAMMO = headers.INVENTORY_LIGHTNINGAMMO
```

Bot inventory slot used to read or update lightningammo.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L65)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-machinegun-const-inventory-machinegun-headers-inventory-machinegun-src-mq3-game-ai-dmnet-ml-2086882573"></a>
### INVENTORY_MACHINEGUN

```ml
const INVENTORY_MACHINEGUN = headers.INVENTORY_MACHINEGUN
```

Bot inventory slot used to read or update machine gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L43)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-nailgun-const-inventory-nailgun-headers-inventory-nailgun-src-mq3-game-ai-dmnet-ml-607896026"></a>
### INVENTORY_NAILGUN

```ml
const INVENTORY_NAILGUN = headers.INVENTORY_NAILGUN
```

Bot inventory slot used to read or update nailgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L55)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-nails-const-inventory-nails-headers-inventory-nails-src-mq3-game-ai-dmnet-ml-425895235"></a>
### INVENTORY_NAILS

```ml
const INVENTORY_NAILS = headers.INVENTORY_NAILS
```

Bot inventory slot used to read or update nails.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L73)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-plasmagun-const-inventory-plasmagun-headers-inventory-plasmagun-src-mq3-game-ai-dmnet-ml-1588183152"></a>
### INVENTORY_PLASMAGUN

```ml
const INVENTORY_PLASMAGUN = headers.INVENTORY_PLASMAGUN
```

Bot inventory slot used to read or update plasma gun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L51)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-railgun-const-inventory-railgun-headers-inventory-railgun-src-mq3-game-ai-dmnet-ml-1469754102"></a>
### INVENTORY_RAILGUN

```ml
const INVENTORY_RAILGUN = headers.INVENTORY_RAILGUN
```

Bot inventory slot used to read or update railgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L49)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-rocketlauncher-const-inventory-rocketlauncher-headers-inventory-rocketlauncher-src-mq3-game-ai-dmnet-ml-1856093852"></a>
### INVENTORY_ROCKETLAUNCHER

```ml
const INVENTORY_ROCKETLAUNCHER = headers.INVENTORY_ROCKETLAUNCHER
```

Bot inventory slot used to read or update rocket launcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L45)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-rockets-const-inventory-rockets-headers-inventory-rockets-src-mq3-game-ai-dmnet-ml-390724679"></a>
### INVENTORY_ROCKETS

```ml
const INVENTORY_ROCKETS = headers.INVENTORY_ROCKETS
```

Bot inventory slot used to read or update rockets.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L67)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-shells-const-inventory-shells-headers-inventory-shells-src-mq3-game-ai-dmnet-ml-660174935"></a>
### INVENTORY_SHELLS

```ml
const INVENTORY_SHELLS = headers.INVENTORY_SHELLS
```

Bot inventory slot used to read or update shells.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L59)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-shotgun-const-inventory-shotgun-headers-inventory-shotgun-src-mq3-game-ai-dmnet-ml-1586735466"></a>
### INVENTORY_SHOTGUN

```ml
const INVENTORY_SHOTGUN = headers.INVENTORY_SHOTGUN
```

Bot inventory slot used to read or update shotgun.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L41)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-slugs-const-inventory-slugs-headers-inventory-slugs-src-mq3-game-ai-dmnet-ml-677953604"></a>
### INVENTORY_SLUGS

```ml
const INVENTORY_SLUGS = headers.INVENTORY_SLUGS
```

Bot inventory slot used to read or update slugs.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L69)

<a id="constant-constant-mq3-game-ai-dmnet-ltg-attackenemybase-const-ltg-attackenemybase-13-src-mq3-game-ai-dmnet-ml-1533209327"></a>
### LTG_ATTACKENEMYBASE

```ml
const LTG_ATTACKENEMYBASE = 13
```

Long-term bot goal identifier selecting attackenemybase behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L33)

<a id="constant-constant-mq3-game-ai-dmnet-ltg-getflag-const-ltg-getflag-4-src-mq3-game-ai-dmnet-ml-1883625153"></a>
### LTG_GETFLAG

```ml
const LTG_GETFLAG = 4
```

Long-term bot goal identifier selecting capture the flag behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L25)

<a id="constant-constant-mq3-game-ai-dmnet-ltg-harvest-const-ltg-harvest-12-src-mq3-game-ai-dmnet-ml-208732194"></a>
### LTG_HARVEST

```ml
const LTG_HARVEST = 12
```

Long-term bot goal identifier selecting harvest behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L31)

<a id="constant-constant-mq3-game-ai-dmnet-ltg-returnflag-const-ltg-returnflag-6-src-mq3-game-ai-dmnet-ml-636223957"></a>
### LTG_RETURNFLAG

```ml
const LTG_RETURNFLAG = 6
```

Long-term bot goal identifier selecting return the flag behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L29)

<a id="constant-constant-mq3-game-ai-dmnet-ltg-rushbase-const-ltg-rushbase-5-src-mq3-game-ai-dmnet-ml-976120716"></a>
### LTG_RUSHBASE

```ml
const LTG_RUSHBASE = 5
```

Long-term bot goal identifier selecting rush the base behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L27)

<a id="constant-constant-mq3-game-ai-dmnet-max-nodeswitches-const-max-nodeswitches-50-src-mq3-game-ai-dmnet-ml-1575729604"></a>
### MAX_NODESWITCHES

```ml
const MAX_NODESWITCHES = 50
```

Upper bound on nodeswitches represented by mq3.game.ai_dmnet.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L13)

<a id="function-function-mq3-game-ai-dmnet-missionalternate-function-missionalternate-services-bot-goal-src-mq3-game-ai-dmnet-ml-570359630"></a>
### missionAlternate

```ml
function missionAlternate(services, bot, goal)
```

Use `services.mission.alternateRouteFn` to perform `missionAlternate`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `mission` and `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `altRouteGoal`, `reachedAltRouteGoalTime`, `areanum`, `origin` and `tfl`. May update `bot.reachedAltRouteGoalTime` in place. |
| `goal` | `dynamic` | — | Target record; accesses `areanum`, `entitynum`, `origin`, `mins` and `maxs` and related fields. May update `goal.areanum`, `goal.entitynum` and `goal.origin` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L321)

<a id="function-function-mq3-game-ai-dmnet-missionenemytarget-function-missionenemytarget-fightservices-bot-target-src-mq3-game-ai-dmnet-ml-529770896"></a>
### missionEnemyTarget

```ml
function missionEnemyTarget(fightServices, bot, target)
```

Raise the aim point for Team Arena obelisk targets by sixteen units and preserve other targets.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fightServices` | `dynamic` | — | Fight services record; accesses `dmnetServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `enemy`. |
| `target` | `dynamic` | — | Three-component array; components 0, 1 and 2 are used in their stored order. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L289)

<a id="function-function-mq3-game-ai-dmnet-missiongoal-function-missiongoal-services-bot-kind-src-mq3-game-ai-dmnet-ml-248675997"></a>
### missionGoal

```ml
function missionGoal(services, bot, kind)
```

Select a neutral or enemy objective through Team Arena callbacks according to the bot team.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `mission`. |
| `bot` | `dynamic` | — | Value passed as argument 2 to `ms.teamFn`. |
| `kind` | `dynamic` | — | Value used by `missionGoal` in `if kind=="neutral-flag" then return ms.neutralFlagGoalFn(ms,bot) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L277)

<a id="function-function-mq3-game-ai-dmnet-missionlongtermgoal-function-missionlongtermgoal-services-bot-tfl-goal-src-mq3-game-ai-dmnet-ml-965022698"></a>
### missionLongTermGoal

```ml
function missionLongTermGoal(services, bot, tfl, goal)
```

Update `bot.ltgtype`, `bot.attackawayTime` and `bot.harvestawayTime` during `missionLongTermGoal`. Return paths include `[false,false]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `mission` and `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ltgtype`, `teamgoalTime`, `attackawayTime`, `origin` and `harvestawayTime`. May update `bot.ltgtype`, `bot.attackawayTime` and `bot.harvestawayTime` in place. |
| `tfl` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |
| `goal` | `dynamic` | — | Bot navigation goal; accesses `origin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L337)

<a id="function-function-mq3-game-ai-dmnet-missionnearbyrange-function-missionnearbyrange-nodeservices-bot-range-src-mq3-game-ai-dmnet-ml-1918681900"></a>
### missionNearbyRange

```ml
function missionNearbyRange(nodeServices, bot, range)
```

Reduce nearby-goal search distance while carrying a neutral flag or Harvester cubes.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `nodeServices` | `dynamic` | — | Node services record; accesses `dmnetServices`. |
| `bot` | `dynamic` | — | Value passed as argument 2 to `services.mission.carryingNeutralFn`. |
| `range` | `dynamic` | — | Operand used to evaluate the returned expression `range`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L298)

<a id="function-function-mq3-game-ai-dmnet-missionnotify-function-missionnotify-services-bot-event-src-mq3-game-ai-dmnet-ml-919533043"></a>
### missionNotify

```ml
function missionNotify(services, bot, event)
```

Set `bot.teammessageTime` to `0.0` in `mq3.game.ai_dmnet.missionNotify`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `teammessageTime`. May update `bot.teammessageTime` in place. |
| `event` | `dynamic` | — | Player or entity event identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L307)

- [mq3.game.ai_dmnet.MissionServices](Type-mq3-game-ai-dmnet-missionservices-554096973.md) — struct
<a id="function-function-mq3-game-ai-dmnet-missiontimedmessage-function-missiontimedmessage-services-bot-event-src-mq3-game-ai-dmnet-ml-325377625"></a>
### missionTimedMessage

```ml
function missionTimedMessage(services, bot, event)
```

Apply `mq3.game.ai_dmnet.now` and `mq3.game.ai_dmnet.missionNotify` while evaluating `missionTimedMessage`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `timeFn` and `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `teammessageTime`. |
| `event` | `dynamic` | — | Player or entity event identifier. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L312)

<a id="function-function-mq3-game-ai-dmnet-missiontouch-function-missiontouch-services-bot-goal-src-mq3-game-ai-dmnet-ml-832614838"></a>
### missionTouch

```ml
function missionTouch(services, bot, goal)
```

Return the result of `services.navigationServices.touchingGoalFn(services.navigationServices,bot.origin,goal)` for `missionTouch`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `origin`. |
| `goal` | `dynamic` | — | Value passed as argument 3 to `services.navigationServices.touchingGoalFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L326)

<a id="constant-constant-mq3-game-ai-dmnet-moveresult-blockedbyavoidspot-const-moveresult-blockedbyavoidspot-256-src-mq3-game-ai-dmnet-ml-1085235910"></a>
### MOVERESULT_BLOCKEDBYAVOIDSPOT

```ml
const MOVERESULT_BLOCKEDBYAVOIDSPOT = 256
```

Bot movement-result flag reporting blockedbyavoidspot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L39)

<a id="constant-constant-mq3-game-ai-dmnet-moveresult-movementview-const-moveresult-movementview-1-src-mq3-game-ai-dmnet-ml-1568639684"></a>
### MOVERESULT_MOVEMENTVIEW

```ml
const MOVERESULT_MOVEMENTVIEW = 1
```

Bot movement-result flag reporting movementview.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L35)

<a id="constant-constant-mq3-game-ai-dmnet-moveresult-movementweapon-const-moveresult-movementweapon-16-src-mq3-game-ai-dmnet-ml-465371714"></a>
### MOVERESULT_MOVEMENTWEAPON

```ml
const MOVERESULT_MOVEMENTWEAPON = 16
```

Bot movement-result flag reporting movementweapon.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L37)

- [mq3.game.ai_dmnet.NodeSwitch](Type-mq3-game-ai-dmnet-nodeswitch-1304619533.md) — struct
<a id="function-function-mq3-game-ai-dmnet-now-function-now-services-src-mq3-game-ai-dmnet-ml-1143024566"></a>
### now

```ml
function now(services)
```

Use `services.timeFn` and `services.navigationServices.floatTimeFn` to perform `now`. Return paths include `services.navigationServices.floatTimeFn(services.navigationServices)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `timeFn` and `navigationServices`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L213)

- [mq3.game.ai_dmnet.Services](Type-mq3-game-ai-dmnet-services-1039703329.md) — struct
<a id="function-function-mq3-game-ai-dmnet-shootobstacle-function-shootobstacle-services-bot-movement-entity-zoffset-weapon-src-mq3-game-ai-dmnet-ml-1172882454"></a>
### shootObstacle

```ml
function shootObstacle(services, bot, movement, entity, zoffset, weapon)
```

Update `movement.idealViewangles`, `movement.weapon` and `movement.flags` during `shootObstacle`. Return paths include `movement`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `entityStateFn`, `inFovFn`, `traceFn` and `attackFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `eye`, `curPs`, `viewangles`, `entitynum` and `client`. |
| `movement` | `dynamic` | — | Movement record; accesses `idealViewangles`, `weapon` and `flags`. May update `movement.idealViewangles`, `movement.weapon` and `movement.flags` in place. |
| `entity` | `dynamic` | — | Value passed as argument 2 to `services.entityStateFn`. |
| `zoffset` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.fadd`. |
| `weapon` | `dynamic` | — | Weapon identifier used by the action or inventory lookup. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L433)

<a id="constant-constant-mq3-game-ai-dmnet-team-blue-const-team-blue-2-src-mq3-game-ai-dmnet-ml-25910891"></a>
### TEAM_BLUE

```ml
const TEAM_BLUE = 2
```

Team identifier selecting the blue team/category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L23)

<a id="constant-constant-mq3-game-ai-dmnet-team-red-const-team-red-1-src-mq3-game-ai-dmnet-ml-956831144"></a>
### TEAM_RED

```ml
const TEAM_RED = 1
```

Team identifier selecting the red team/category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L21)

<a id="constant-constant-mq3-game-ai-dmnet-weaponindex-bfg-const-weaponindex-bfg-headers-weaponindex-bfg-src-mq3-game-ai-dmnet-ml-775162767"></a>
### WEAPONINDEX_BFG

```ml
const WEAPONINDEX_BFG = headers.WEAPONINDEX_BFG
```

Weapon-definition index identifying BFG in bot weapon tables.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L89)

<a id="constant-constant-mq3-game-ai-dmnet-weaponindex-chaingun-const-weaponindex-chaingun-headers-weaponindex-chaingun-src-mq3-game-ai-dmnet-ml-1095274793"></a>
### WEAPONINDEX_CHAINGUN

```ml
const WEAPONINDEX_CHAINGUN = headers.WEAPONINDEX_CHAINGUN
```

Weapon-definition index identifying chaingun in bot weapon tables.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L93)

<a id="constant-constant-mq3-game-ai-dmnet-weaponindex-lightning-const-weaponindex-lightning-headers-weaponindex-lightning-src-mq3-game-ai-dmnet-ml-24024998"></a>
### WEAPONINDEX_LIGHTNING

```ml
const WEAPONINDEX_LIGHTNING = headers.WEAPONINDEX_LIGHTNING
```

Weapon-definition index identifying lightning gun in bot weapon tables.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L83)

<a id="constant-constant-mq3-game-ai-dmnet-weaponindex-machinegun-const-weaponindex-machinegun-headers-weaponindex-machinegun-src-mq3-game-ai-dmnet-ml-603039433"></a>
### WEAPONINDEX_MACHINEGUN

```ml
const WEAPONINDEX_MACHINEGUN = headers.WEAPONINDEX_MACHINEGUN
```

Weapon-definition index identifying machine gun in bot weapon tables.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L77)

<a id="constant-constant-mq3-game-ai-dmnet-weaponindex-nailgun-const-weaponindex-nailgun-headers-weaponindex-nailgun-src-mq3-game-ai-dmnet-ml-1118076534"></a>
### WEAPONINDEX_NAILGUN

```ml
const WEAPONINDEX_NAILGUN = headers.WEAPONINDEX_NAILGUN
```

Weapon-definition index identifying nailgun in bot weapon tables.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L91)

<a id="constant-constant-mq3-game-ai-dmnet-weaponindex-plasmagun-const-weaponindex-plasmagun-headers-weaponindex-plasmagun-src-mq3-game-ai-dmnet-ml-150236832"></a>
### WEAPONINDEX_PLASMAGUN

```ml
const WEAPONINDEX_PLASMAGUN = headers.WEAPONINDEX_PLASMAGUN
```

Weapon-definition index identifying plasma gun in bot weapon tables.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L87)

<a id="constant-constant-mq3-game-ai-dmnet-weaponindex-railgun-const-weaponindex-railgun-headers-weaponindex-railgun-src-mq3-game-ai-dmnet-ml-920330386"></a>
### WEAPONINDEX_RAILGUN

```ml
const WEAPONINDEX_RAILGUN = headers.WEAPONINDEX_RAILGUN
```

Weapon-definition index identifying railgun in bot weapon tables.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L85)

<a id="constant-constant-mq3-game-ai-dmnet-weaponindex-rocket-launcher-const-weaponindex-rocket-launcher-headers-weaponindex-rocket-launcher-src-mq3-game-ai-dmnet-ml-1328480947"></a>
### WEAPONINDEX_ROCKET_LAUNCHER

```ml
const WEAPONINDEX_ROCKET_LAUNCHER = headers.WEAPONINDEX_ROCKET_LAUNCHER
```

Weapon-definition index identifying rocket launcher in bot weapon tables.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L81)

<a id="constant-constant-mq3-game-ai-dmnet-weaponindex-shotgun-const-weaponindex-shotgun-headers-weaponindex-shotgun-src-mq3-game-ai-dmnet-ml-211974606"></a>
### WEAPONINDEX_SHOTGUN

```ml
const WEAPONINDEX_SHOTGUN = headers.WEAPONINDEX_SHOTGUN
```

Weapon-definition index identifying shotgun in bot weapon tables.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L79)
