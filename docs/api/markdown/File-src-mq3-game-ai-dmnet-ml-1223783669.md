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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L186)

<a id="function-function-mq3-game-ai-dmnet-aienter-battle-fight-function-aienter-battle-fight-services-bot-reason-src-mq3-game-ai-dmnet-ml-102341825"></a>
### AIEnter_Battle_Fight

```ml
function AIEnter_Battle_Fight(services, bot, reason)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L183)

<a id="function-function-mq3-game-ai-dmnet-aienter-battle-nbg-function-aienter-battle-nbg-services-bot-reason-src-mq3-game-ai-dmnet-ml-1358199085"></a>
### AIEnter_Battle_NBG

```ml
function AIEnter_Battle_NBG(services, bot, reason)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L190)

<a id="function-function-mq3-game-ai-dmnet-aienter-battle-retreat-function-aienter-battle-retreat-services-bot-reason-src-mq3-game-ai-dmnet-ml-1931621837"></a>
### AIEnter_Battle_Retreat

```ml
function AIEnter_Battle_Retreat(services, bot, reason)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L188)

<a id="function-function-mq3-game-ai-dmnet-aienter-battle-suicidalfight-function-aienter-battle-suicidalfight-services-bot-reason-src-mq3-game-ai-dmnet-ml-2113386617"></a>
### AIEnter_Battle_SuicidalFight

```ml
function AIEnter_Battle_SuicidalFight(services, bot, reason)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L184)

<a id="function-function-mq3-game-ai-dmnet-aienter-intermission-function-aienter-intermission-services-bot-reason-src-mq3-game-ai-dmnet-ml-163975121"></a>
### AIEnter_Intermission

```ml
function AIEnter_Intermission(services, bot, reason)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L148)

<a id="function-function-mq3-game-ai-dmnet-aienter-observer-function-aienter-observer-services-bot-reason-src-mq3-game-ai-dmnet-ml-1215355437"></a>
### AIEnter_Observer

```ml
function AIEnter_Observer(services, bot, reason)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L150)

<a id="function-function-mq3-game-ai-dmnet-aienter-respawn-function-aienter-respawn-services-bot-reason-src-mq3-game-ai-dmnet-ml-482959979"></a>
### AIEnter_Respawn

```ml
function AIEnter_Respawn(services, bot, reason)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L154)

<a id="function-function-mq3-game-ai-dmnet-aienter-seek-activateentity-function-aienter-seek-activateentity-services-bot-reason-src-mq3-game-ai-dmnet-ml-1769813025"></a>
### AIEnter_Seek_ActivateEntity

```ml
function AIEnter_Seek_ActivateEntity(services, bot, reason)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L177)

<a id="function-function-mq3-game-ai-dmnet-aienter-seek-ltg-function-aienter-seek-ltg-services-bot-reason-src-mq3-game-ai-dmnet-ml-206226385"></a>
### AIEnter_Seek_LTG

```ml
function AIEnter_Seek_LTG(services, bot, reason)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L181)

<a id="function-function-mq3-game-ai-dmnet-aienter-seek-nbg-function-aienter-seek-nbg-services-bot-reason-src-mq3-game-ai-dmnet-ml-1346534237"></a>
### AIEnter_Seek_NBG

```ml
function AIEnter_Seek_NBG(services, bot, reason)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L179)

<a id="function-function-mq3-game-ai-dmnet-aienter-stand-function-aienter-stand-services-bot-reason-src-mq3-game-ai-dmnet-ml-1218143891"></a>
### AIEnter_Stand

```ml
function AIEnter_Stand(services, bot, reason)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `reason` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L152)

<a id="function-function-mq3-game-ai-dmnet-ainode-battle-chase-function-ainode-battle-chase-services-bot-src-mq3-game-ai-dmnet-ml-130864561"></a>
### AINode_Battle_Chase

```ml
function AINode_Battle_Chase(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L187)

<a id="function-function-mq3-game-ai-dmnet-ainode-battle-fight-function-ainode-battle-fight-services-bot-src-mq3-game-ai-dmnet-ml-127466025"></a>
### AINode_Battle_Fight

```ml
function AINode_Battle_Fight(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L185)

<a id="function-function-mq3-game-ai-dmnet-ainode-battle-nbg-function-ainode-battle-nbg-services-bot-src-mq3-game-ai-dmnet-ml-1430825679"></a>
### AINode_Battle_NBG

```ml
function AINode_Battle_NBG(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L191)

<a id="function-function-mq3-game-ai-dmnet-ainode-battle-retreat-function-ainode-battle-retreat-services-bot-src-mq3-game-ai-dmnet-ml-532863807"></a>
### AINode_Battle_Retreat

```ml
function AINode_Battle_Retreat(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L189)

<a id="function-function-mq3-game-ai-dmnet-ainode-intermission-function-ainode-intermission-services-bot-src-mq3-game-ai-dmnet-ml-1709756127"></a>
### AINode_Intermission

```ml
function AINode_Intermission(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L149)

<a id="function-function-mq3-game-ai-dmnet-ainode-observer-function-ainode-observer-services-bot-src-mq3-game-ai-dmnet-ml-944643287"></a>
### AINode_Observer

```ml
function AINode_Observer(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L151)

<a id="function-function-mq3-game-ai-dmnet-ainode-respawn-function-ainode-respawn-services-bot-src-mq3-game-ai-dmnet-ml-1170937405"></a>
### AINode_Respawn

```ml
function AINode_Respawn(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L155)

<a id="function-function-mq3-game-ai-dmnet-ainode-seek-activateentity-function-ainode-seek-activateentity-services-bot-src-mq3-game-ai-dmnet-ml-405566145"></a>
### AINode_Seek_ActivateEntity

```ml
function AINode_Seek_ActivateEntity(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L178)

<a id="function-function-mq3-game-ai-dmnet-ainode-seek-ltg-function-ainode-seek-ltg-services-bot-src-mq3-game-ai-dmnet-ml-1974373579"></a>
### AINode_Seek_LTG

```ml
function AINode_Seek_LTG(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L182)

<a id="function-function-mq3-game-ai-dmnet-ainode-seek-nbg-function-ainode-seek-nbg-services-bot-src-mq3-game-ai-dmnet-ml-1994967975"></a>
### AINode_Seek_NBG

```ml
function AINode_Seek_NBG(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L180)

<a id="function-function-mq3-game-ai-dmnet-ainode-stand-function-ainode-stand-services-bot-src-mq3-game-ai-dmnet-ml-999361517"></a>
### AINode_Stand

```ml
function AINode_Stand(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L153)

<a id="function-function-mq3-game-ai-dmnet-botclearpath-function-botclearpath-services-bot-movement-src-mq3-game-ai-dmnet-ml-874994080"></a>
### BotClearPath

```ml
function BotClearPath(services, bot, movement)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `movement` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L166)

<a id="function-function-mq3-game-ai-dmnet-botdumpnodeswitches-function-botdumpnodeswitches-services-bot-src-mq3-game-ai-dmnet-ml-2095747351"></a>
### BotDumpNodeSwitches

```ml
function BotDumpNodeSwitches(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L79)

<a id="function-function-mq3-game-ai-dmnet-botgetairgoal-function-botgetairgoal-services-bot-goal-src-mq3-game-ai-dmnet-ml-1278149994"></a>
### BotGetAirGoal

```ml
function BotGetAirGoal(services, bot, goal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L85)

<a id="function-function-mq3-game-ai-dmnet-botgetitemlongtermgoal-function-botgetitemlongtermgoal-services-bot-tfl-goal-src-mq3-game-ai-dmnet-ml-2007641768"></a>
### BotGetItemLongTermGoal

```ml
function BotGetItemLongTermGoal(services, bot, tfl, goal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `tfl` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L89)

<a id="function-function-mq3-game-ai-dmnet-botgetlongtermgoal-function-botgetlongtermgoal-services-bot-tfl-retreat-goal-src-mq3-game-ai-dmnet-ml-133524055"></a>
### BotGetLongTermGoal

```ml
function BotGetLongTermGoal(services, bot, tfl, retreat, goal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `tfl` | `dynamic` | — |  |
| `retreat` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L133)

<a id="function-function-mq3-game-ai-dmnet-botgoforair-function-botgoforair-services-bot-tfl-ltg-range-src-mq3-game-ai-dmnet-ml-1553559741"></a>
### BotGoForAir

```ml
function BotGoForAir(services, bot, tfl, ltg, range)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `tfl` | `dynamic` | — |  |
| `ltg` | `dynamic` | — |  |
| `range` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L86)

<a id="function-function-mq3-game-ai-dmnet-botlongtermgoal-function-botlongtermgoal-services-bot-tfl-retreat-goal-src-mq3-game-ai-dmnet-ml-1049836759"></a>
### BotLongTermGoal

```ml
function BotLongTermGoal(services, bot, tfl, retreat, goal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `tfl` | `dynamic` | — |  |
| `retreat` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L137)

<a id="function-function-mq3-game-ai-dmnet-botname-function-botname-services-bot-src-mq3-game-ai-dmnet-ml-1679809821"></a>
### botName

```ml
function botName(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L71)

<a id="function-function-mq3-game-ai-dmnet-botnearbygoal-function-botnearbygoal-services-bot-tfl-ltg-range-src-mq3-game-ai-dmnet-ml-1841825803"></a>
### BotNearbyGoal

```ml
function BotNearbyGoal(services, bot, tfl, ltg, range)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `tfl` | `dynamic` | — |  |
| `ltg` | `dynamic` | — |  |
| `range` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L87)

<a id="function-function-mq3-game-ai-dmnet-botreachedgoal-function-botreachedgoal-services-bot-goal-src-mq3-game-ai-dmnet-ml-1187692674"></a>
### BotReachedGoal

```ml
function BotReachedGoal(services, bot, goal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L88)

<a id="function-function-mq3-game-ai-dmnet-botrecordnodeswitch-function-botrecordnodeswitch-services-bot-node-detail-source-src-mq3-game-ai-dmnet-ml-174021941"></a>
### BotRecordNodeSwitch

```ml
function BotRecordNodeSwitch(services, bot, node, detail, source)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `node` | `dynamic` | — |  |
| `detail` | `dynamic` | — |  |
| `source` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L74)

<a id="function-function-mq3-game-ai-dmnet-botresetnodeswitches-function-botresetnodeswitches-services-src-mq3-game-ai-dmnet-ml-669119802"></a>
### BotResetNodeSwitches

```ml
function BotResetNodeSwitches(services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L73)

<a id="function-function-mq3-game-ai-dmnet-botselectactivateweapon-function-botselectactivateweapon-services-bot-src-mq3-game-ai-dmnet-ml-136660761"></a>
### BotSelectActivateWeapon

```ml
function BotSelectActivateWeapon(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L157)

<a id="function-function-mq3-game-ai-dmnet-copymissiongoal-function-copymissiongoal-goal-value-src-mq3-game-ai-dmnet-ml-1464504796"></a>
### copyMissionGoal

```ml
function copyMissionGoal(goal, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `goal` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L111)

<a id="function-function-mq3-game-ai-dmnet-create-function-create-fightservices-seekservices-navigationservices-src-mq3-game-ai-dmnet-ml-702546316"></a>
### create

```ml
function create(fightServices, seekServices, navigationServices)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fightServices` | `dynamic` | — |  |
| `seekServices` | `dynamic` | — |  |
| `navigationServices` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L59)

<a id="function-function-mq3-game-ai-dmnet-emit-function-emit-services-kind-subject-detail-src-mq3-game-ai-dmnet-ml-1959875783"></a>
### emit

```ml
function emit(services, kind, subject, detail)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `subject` | `dynamic` | — |  |
| `detail` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L66)

<a id="function-function-mq3-game-ai-dmnet-goharvest-function-goharvest-services-bot-src-mq3-game-ai-dmnet-ml-1347761851"></a>
### goHarvest

```ml
function goHarvest(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L114)

<a id="constant-constant-mq3-game-ai-dmnet-gt-1fctf-const-gt-1fctf-5-src-mq3-game-ai-dmnet-ml-290202594"></a>
### GT_1FCTF

```ml
const GT_1FCTF = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L13)

<a id="constant-constant-mq3-game-ai-dmnet-gt-harvester-const-gt-harvester-7-src-mq3-game-ai-dmnet-ml-789358548"></a>
### GT_HARVESTER

```ml
const GT_HARVESTER = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L15)

<a id="constant-constant-mq3-game-ai-dmnet-gt-obelisk-const-gt-obelisk-6-src-mq3-game-ai-dmnet-ml-1720688719"></a>
### GT_OBELISK

```ml
const GT_OBELISK = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L14)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-belt-const-inventory-belt-headers-inventory-belt-src-mq3-game-ai-dmnet-ml-2016357681"></a>
### INVENTORY_BELT

```ml
const INVENTORY_BELT = headers.INVENTORY_BELT
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L43)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-bfg10k-const-inventory-bfg10k-headers-inventory-bfg10k-src-mq3-game-ai-dmnet-ml-761944489"></a>
### INVENTORY_BFG10K

```ml
const INVENTORY_BFG10K = headers.INVENTORY_BFG10K
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L32)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-bfgammo-const-inventory-bfgammo-headers-inventory-bfgammo-src-mq3-game-ai-dmnet-ml-2027361801"></a>
### INVENTORY_BFGAMMO

```ml
const INVENTORY_BFGAMMO = headers.INVENTORY_BFGAMMO
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L41)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-bullets-const-inventory-bullets-headers-inventory-bullets-src-mq3-game-ai-dmnet-ml-144566703"></a>
### INVENTORY_BULLETS

```ml
const INVENTORY_BULLETS = headers.INVENTORY_BULLETS
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L36)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-cells-const-inventory-cells-headers-inventory-cells-src-mq3-game-ai-dmnet-ml-152683283"></a>
### INVENTORY_CELLS

```ml
const INVENTORY_CELLS = headers.INVENTORY_CELLS
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L37)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-chaingun-const-inventory-chaingun-headers-inventory-chaingun-src-mq3-game-ai-dmnet-ml-1201796333"></a>
### INVENTORY_CHAINGUN

```ml
const INVENTORY_CHAINGUN = headers.INVENTORY_CHAINGUN
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L34)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-lightning-const-inventory-lightning-headers-inventory-lightning-src-mq3-game-ai-dmnet-ml-1825306298"></a>
### INVENTORY_LIGHTNING

```ml
const INVENTORY_LIGHTNING = headers.INVENTORY_LIGHTNING
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L29)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-lightningammo-const-inventory-lightningammo-headers-inventory-lightningammo-src-mq3-game-ai-dmnet-ml-481450168"></a>
### INVENTORY_LIGHTNINGAMMO

```ml
const INVENTORY_LIGHTNINGAMMO = headers.INVENTORY_LIGHTNINGAMMO
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L38)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-machinegun-const-inventory-machinegun-headers-inventory-machinegun-src-mq3-game-ai-dmnet-ml-2086882573"></a>
### INVENTORY_MACHINEGUN

```ml
const INVENTORY_MACHINEGUN = headers.INVENTORY_MACHINEGUN
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L27)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-nailgun-const-inventory-nailgun-headers-inventory-nailgun-src-mq3-game-ai-dmnet-ml-607896026"></a>
### INVENTORY_NAILGUN

```ml
const INVENTORY_NAILGUN = headers.INVENTORY_NAILGUN
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L33)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-nails-const-inventory-nails-headers-inventory-nails-src-mq3-game-ai-dmnet-ml-425895235"></a>
### INVENTORY_NAILS

```ml
const INVENTORY_NAILS = headers.INVENTORY_NAILS
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L42)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-plasmagun-const-inventory-plasmagun-headers-inventory-plasmagun-src-mq3-game-ai-dmnet-ml-1588183152"></a>
### INVENTORY_PLASMAGUN

```ml
const INVENTORY_PLASMAGUN = headers.INVENTORY_PLASMAGUN
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L31)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-railgun-const-inventory-railgun-headers-inventory-railgun-src-mq3-game-ai-dmnet-ml-1469754102"></a>
### INVENTORY_RAILGUN

```ml
const INVENTORY_RAILGUN = headers.INVENTORY_RAILGUN
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L30)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-rocketlauncher-const-inventory-rocketlauncher-headers-inventory-rocketlauncher-src-mq3-game-ai-dmnet-ml-1856093852"></a>
### INVENTORY_ROCKETLAUNCHER

```ml
const INVENTORY_ROCKETLAUNCHER = headers.INVENTORY_ROCKETLAUNCHER
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L28)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-rockets-const-inventory-rockets-headers-inventory-rockets-src-mq3-game-ai-dmnet-ml-390724679"></a>
### INVENTORY_ROCKETS

```ml
const INVENTORY_ROCKETS = headers.INVENTORY_ROCKETS
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L39)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-shells-const-inventory-shells-headers-inventory-shells-src-mq3-game-ai-dmnet-ml-660174935"></a>
### INVENTORY_SHELLS

```ml
const INVENTORY_SHELLS = headers.INVENTORY_SHELLS
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L35)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-shotgun-const-inventory-shotgun-headers-inventory-shotgun-src-mq3-game-ai-dmnet-ml-1586735466"></a>
### INVENTORY_SHOTGUN

```ml
const INVENTORY_SHOTGUN = headers.INVENTORY_SHOTGUN
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L26)

<a id="constant-constant-mq3-game-ai-dmnet-inventory-slugs-const-inventory-slugs-headers-inventory-slugs-src-mq3-game-ai-dmnet-ml-677953604"></a>
### INVENTORY_SLUGS

```ml
const INVENTORY_SLUGS = headers.INVENTORY_SLUGS
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L40)

<a id="constant-constant-mq3-game-ai-dmnet-ltg-attackenemybase-const-ltg-attackenemybase-13-src-mq3-game-ai-dmnet-ml-1533209327"></a>
### LTG_ATTACKENEMYBASE

```ml
const LTG_ATTACKENEMYBASE = 13
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L22)

<a id="constant-constant-mq3-game-ai-dmnet-ltg-getflag-const-ltg-getflag-4-src-mq3-game-ai-dmnet-ml-1883625153"></a>
### LTG_GETFLAG

```ml
const LTG_GETFLAG = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L18)

<a id="constant-constant-mq3-game-ai-dmnet-ltg-harvest-const-ltg-harvest-12-src-mq3-game-ai-dmnet-ml-208732194"></a>
### LTG_HARVEST

```ml
const LTG_HARVEST = 12
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L21)

<a id="constant-constant-mq3-game-ai-dmnet-ltg-returnflag-const-ltg-returnflag-6-src-mq3-game-ai-dmnet-ml-636223957"></a>
### LTG_RETURNFLAG

```ml
const LTG_RETURNFLAG = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L20)

<a id="constant-constant-mq3-game-ai-dmnet-ltg-rushbase-const-ltg-rushbase-5-src-mq3-game-ai-dmnet-ml-976120716"></a>
### LTG_RUSHBASE

```ml
const LTG_RUSHBASE = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L19)

<a id="constant-constant-mq3-game-ai-dmnet-max-nodeswitches-const-max-nodeswitches-50-src-mq3-game-ai-dmnet-ml-1575729604"></a>
### MAX_NODESWITCHES

```ml
const MAX_NODESWITCHES = 50
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L12)

<a id="function-function-mq3-game-ai-dmnet-missionalternate-function-missionalternate-services-bot-goal-src-mq3-game-ai-dmnet-ml-570359630"></a>
### missionAlternate

```ml
function missionAlternate(services, bot, goal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L112)

<a id="function-function-mq3-game-ai-dmnet-missionenemytarget-function-missionenemytarget-fightservices-bot-target-src-mq3-game-ai-dmnet-ml-529770896"></a>
### missionEnemyTarget

```ml
function missionEnemyTarget(fightServices, bot, target)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `fightServices` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L99)

<a id="function-function-mq3-game-ai-dmnet-missiongoal-function-missiongoal-services-bot-kind-src-mq3-game-ai-dmnet-ml-248675997"></a>
### missionGoal

```ml
function missionGoal(services, bot, kind)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L91)

<a id="function-function-mq3-game-ai-dmnet-missionlongtermgoal-function-missionlongtermgoal-services-bot-tfl-goal-src-mq3-game-ai-dmnet-ml-965022698"></a>
### missionLongTermGoal

```ml
function missionLongTermGoal(services, bot, tfl, goal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `tfl` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L116)

<a id="function-function-mq3-game-ai-dmnet-missionnearbyrange-function-missionnearbyrange-nodeservices-bot-range-src-mq3-game-ai-dmnet-ml-1918681900"></a>
### missionNearbyRange

```ml
function missionNearbyRange(nodeServices, bot, range)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `nodeServices` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `range` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L104)

<a id="function-function-mq3-game-ai-dmnet-missionnotify-function-missionnotify-services-bot-event-src-mq3-game-ai-dmnet-ml-919533043"></a>
### missionNotify

```ml
function missionNotify(services, bot, event)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L109)

- [mq3.game.ai_dmnet.MissionServices](Type-mq3-game-ai-dmnet-missionservices-554096973.md) — struct
<a id="function-function-mq3-game-ai-dmnet-missiontimedmessage-function-missiontimedmessage-services-bot-event-src-mq3-game-ai-dmnet-ml-325377625"></a>
### missionTimedMessage

```ml
function missionTimedMessage(services, bot, event)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `event` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L110)

<a id="function-function-mq3-game-ai-dmnet-missiontouch-function-missiontouch-services-bot-goal-src-mq3-game-ai-dmnet-ml-832614838"></a>
### missionTouch

```ml
function missionTouch(services, bot, goal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `goal` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L113)

<a id="constant-constant-mq3-game-ai-dmnet-moveresult-blockedbyavoidspot-const-moveresult-blockedbyavoidspot-256-src-mq3-game-ai-dmnet-ml-1085235910"></a>
### MOVERESULT_BLOCKEDBYAVOIDSPOT

```ml
const MOVERESULT_BLOCKEDBYAVOIDSPOT = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L25)

<a id="constant-constant-mq3-game-ai-dmnet-moveresult-movementview-const-moveresult-movementview-1-src-mq3-game-ai-dmnet-ml-1568639684"></a>
### MOVERESULT_MOVEMENTVIEW

```ml
const MOVERESULT_MOVEMENTVIEW = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L23)

<a id="constant-constant-mq3-game-ai-dmnet-moveresult-movementweapon-const-moveresult-movementweapon-16-src-mq3-game-ai-dmnet-ml-465371714"></a>
### MOVERESULT_MOVEMENTWEAPON

```ml
const MOVERESULT_MOVEMENTWEAPON = 16
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L24)

- [mq3.game.ai_dmnet.NodeSwitch](Type-mq3-game-ai-dmnet-nodeswitch-1304619533.md) — struct
<a id="function-function-mq3-game-ai-dmnet-now-function-now-services-src-mq3-game-ai-dmnet-ml-1143024566"></a>
### now

```ml
function now(services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L70)

- [mq3.game.ai_dmnet.Services](Type-mq3-game-ai-dmnet-services-1039703329.md) — struct
<a id="function-function-mq3-game-ai-dmnet-shootobstacle-function-shootobstacle-services-bot-movement-entity-zoffset-weapon-src-mq3-game-ai-dmnet-ml-1172882454"></a>
### shootObstacle

```ml
function shootObstacle(services, bot, movement, entity, zoffset, weapon)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `movement` | `dynamic` | — |  |
| `entity` | `dynamic` | — |  |
| `zoffset` | `dynamic` | — |  |
| `weapon` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L162)

<a id="constant-constant-mq3-game-ai-dmnet-team-blue-const-team-blue-2-src-mq3-game-ai-dmnet-ml-25910891"></a>
### TEAM_BLUE

```ml
const TEAM_BLUE = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L17)

<a id="constant-constant-mq3-game-ai-dmnet-team-red-const-team-red-1-src-mq3-game-ai-dmnet-ml-956831144"></a>
### TEAM_RED

```ml
const TEAM_RED = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L16)

<a id="constant-constant-mq3-game-ai-dmnet-weaponindex-bfg-const-weaponindex-bfg-headers-weaponindex-bfg-src-mq3-game-ai-dmnet-ml-775162767"></a>
### WEAPONINDEX_BFG

```ml
const WEAPONINDEX_BFG = headers.WEAPONINDEX_BFG
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L50)

<a id="constant-constant-mq3-game-ai-dmnet-weaponindex-chaingun-const-weaponindex-chaingun-headers-weaponindex-chaingun-src-mq3-game-ai-dmnet-ml-1095274793"></a>
### WEAPONINDEX_CHAINGUN

```ml
const WEAPONINDEX_CHAINGUN = headers.WEAPONINDEX_CHAINGUN
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L52)

<a id="constant-constant-mq3-game-ai-dmnet-weaponindex-lightning-const-weaponindex-lightning-headers-weaponindex-lightning-src-mq3-game-ai-dmnet-ml-24024998"></a>
### WEAPONINDEX_LIGHTNING

```ml
const WEAPONINDEX_LIGHTNING = headers.WEAPONINDEX_LIGHTNING
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L47)

<a id="constant-constant-mq3-game-ai-dmnet-weaponindex-machinegun-const-weaponindex-machinegun-headers-weaponindex-machinegun-src-mq3-game-ai-dmnet-ml-603039433"></a>
### WEAPONINDEX_MACHINEGUN

```ml
const WEAPONINDEX_MACHINEGUN = headers.WEAPONINDEX_MACHINEGUN
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L44)

<a id="constant-constant-mq3-game-ai-dmnet-weaponindex-nailgun-const-weaponindex-nailgun-headers-weaponindex-nailgun-src-mq3-game-ai-dmnet-ml-1118076534"></a>
### WEAPONINDEX_NAILGUN

```ml
const WEAPONINDEX_NAILGUN = headers.WEAPONINDEX_NAILGUN
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L51)

<a id="constant-constant-mq3-game-ai-dmnet-weaponindex-plasmagun-const-weaponindex-plasmagun-headers-weaponindex-plasmagun-src-mq3-game-ai-dmnet-ml-150236832"></a>
### WEAPONINDEX_PLASMAGUN

```ml
const WEAPONINDEX_PLASMAGUN = headers.WEAPONINDEX_PLASMAGUN
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L49)

<a id="constant-constant-mq3-game-ai-dmnet-weaponindex-railgun-const-weaponindex-railgun-headers-weaponindex-railgun-src-mq3-game-ai-dmnet-ml-920330386"></a>
### WEAPONINDEX_RAILGUN

```ml
const WEAPONINDEX_RAILGUN = headers.WEAPONINDEX_RAILGUN
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L48)

<a id="constant-constant-mq3-game-ai-dmnet-weaponindex-rocket-launcher-const-weaponindex-rocket-launcher-headers-weaponindex-rocket-launcher-src-mq3-game-ai-dmnet-ml-1328480947"></a>
### WEAPONINDEX_ROCKET_LAUNCHER

```ml
const WEAPONINDEX_ROCKET_LAUNCHER = headers.WEAPONINDEX_ROCKET_LAUNCHER
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L46)

<a id="constant-constant-mq3-game-ai-dmnet-weaponindex-shotgun-const-weaponindex-shotgun-headers-weaponindex-shotgun-src-mq3-game-ai-dmnet-ml-211974606"></a>
### WEAPONINDEX_SHOTGUN

```ml
const WEAPONINDEX_SHOTGUN = headers.WEAPONINDEX_SHOTGUN
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/ai_dmnet.ml#L45)
