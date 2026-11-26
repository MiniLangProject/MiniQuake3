# `src/mq3/game/bot_deathmatch.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.bot_deathmatch`](Package-mq3-game-bot-deathmatch-651192623.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/transcendental.ml` as `trig` → [src/mq3/compat/transcendental.ml](File-src-mq3-compat-transcendental-ml-1855454184.md)
- `mq3/game/bot_ai_commands.ml` as `commands` → [src/mq3/game/bot_ai_commands.ml](File-src-mq3-game-bot-ai-commands-ml-200092467.md)
- `mq3/game/bot_combat_ai.ml` as `combat` → [src/mq3/game/bot_combat_ai.ml](File-src-mq3-game-bot-combat-ai-ml-1348181617.md)
- `mq3/game/bot_inventory_ai.ml` as `inventory` → [src/mq3/game/bot_inventory_ai.ml](File-src-mq3-game-bot-inventory-ai-ml-518509243.md)
- `mq3/game/bot_lifecycle.ml` as `lifecycle` → [src/mq3/game/bot_lifecycle.ml](File-src-mq3-game-bot-lifecycle-ml-1736646636.md)
- `mq3/game/bot_navigation.ml` as `navigation` → [src/mq3/game/bot_navigation.ml](File-src-mq3-game-bot-navigation-ml-746290412.md)
- `mq3/game/bot_team_helpers.ml` as `teams` → [src/mq3/game/bot_team_helpers.ml](File-src-mq3-game-bot-team-helpers-ml-2010714111.md)
- `mq3/game/constants.ml` as `c` → [src/mq3/game/constants.ml](File-src-mq3-game-constants-ml-318947761.md)
- `mq3/game/game_headers.ml` as `headers` → [src/mq3/game/game_headers.ml](File-src-mq3-game-game-headers-ml-1243119809.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

- [mq3.game.bot_deathmatch.Action](Type-mq3-game-bot-deathmatch-action-952575553.md) — struct
<a id="function-function-mq3-game-bot-deathmatch-bot1fctfcarryingflag-function-bot1fctfcarryingflag-state-bot-src-mq3-game-bot-deathmatch-ml-869515864"></a>
### bot1FCTFCarryingFlag

```ml
function bot1FCTFCarryingFlag(state, bot)
```

Bot1FCTFCarryingFlag

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L81)

<a id="function-function-mq3-game-bot-deathmatch-bot1fctfretreatgoals-function-bot1fctfretreatgoals-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-1944254869"></a>
### bot1FCTFRetreatGoals

```ml
function bot1FCTFRetreatGoals(state, bot, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L132)

<a id="function-function-mq3-game-bot-deathmatch-bot1fctfseekgoals-function-bot1fctfseekgoals-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-185102035"></a>
### bot1FCTFSeekGoals

```ml
function bot1FCTFSeekGoals(state, bot, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L131)

<a id="function-function-mq3-game-bot-deathmatch-botaggression-function-botaggression-state-bot-src-mq3-game-bot-deathmatch-ml-240340650"></a>
### botAggression

```ml
function botAggression(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L186)

<a id="function-function-mq3-game-bot-deathmatch-botaiblocked-function-botaiblocked-state-bot-moveresult-activate-retailactive-src-mq3-game-bot-deathmatch-ml-1978529396"></a>
### botAIBlocked

```ml
function botAIBlocked(state, bot, moveresult, activate, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `moveresult` | `dynamic` | — |  |
| `activate` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L239)

<a id="function-function-mq3-game-bot-deathmatch-botaimatenemy-function-botaimatenemy-state-bot-src-mq3-game-bot-deathmatch-ml-1969641930"></a>
### botAimAtEnemy

```ml
function botAimAtEnemy(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L218)

<a id="function-function-mq3-game-bot-deathmatch-botaipredictobstacles-function-botaipredictobstacles-state-bot-value-src-mq3-game-bot-deathmatch-ml-448560291"></a>
### botAIPredictObstacles

```ml
function botAIPredictObstacles(state, bot, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L240)

<a id="function-function-mq3-game-bot-deathmatch-botalternateroute-function-botalternateroute-state-bot-value-src-mq3-game-bot-deathmatch-ml-1765522703"></a>
### botAlternateRoute

```ml
function botAlternateRoute(state, bot, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L262)

<a id="function-function-mq3-game-bot-deathmatch-botattackmove-function-botattackmove-state-bot-tfl-src-mq3-game-bot-deathmatch-ml-1175284880"></a>
### botAttackMove

```ml
function botAttackMove(state, bot, tfl)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `tfl` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L204)

<a id="function-function-mq3-game-bot-deathmatch-botbattleuseitems-function-botbattleuseitems-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-808326125"></a>
### botBattleUseItems

```ml
function botBattleUseItems(state, bot, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L167)

<a id="function-function-mq3-game-bot-deathmatch-botcanandwantstorocketjump-function-botcanandwantstorocketjump-state-bot-src-mq3-game-bot-deathmatch-ml-1698342004"></a>
### botCanAndWantsToRocketJump

```ml
function botCanAndWantsToRocketJump(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L191)

<a id="function-function-mq3-game-bot-deathmatch-botcheckair-function-botcheckair-state-bot-src-mq3-game-bot-deathmatch-ml-904599490"></a>
### botCheckAir

```ml
function botCheckAir(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L261)

<a id="function-function-mq3-game-bot-deathmatch-botcheckattack-function-botcheckattack-state-bot-src-mq3-game-bot-deathmatch-ml-70231672"></a>
### botCheckAttack

```ml
function botCheckAttack(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L219)

<a id="function-function-mq3-game-bot-deathmatch-botcheckconsolemessages-function-botcheckconsolemessages-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-1083829489"></a>
### botCheckConsoleMessages

```ml
function botCheckConsoleMessages(state, bot, retailActive)
```

Console/snapshot event layer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L243)

<a id="function-function-mq3-game-bot-deathmatch-botcheckevents-function-botcheckevents-state-bot-value-retailactive-src-mq3-game-bot-deathmatch-ml-442325290"></a>
### botCheckEvents

```ml
function botCheckEvents(state, bot, value, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L251)

<a id="function-function-mq3-game-bot-deathmatch-botcheckforgrenades-function-botcheckforgrenades-state-bot-value-retailactive-src-mq3-game-bot-deathmatch-ml-1818137784"></a>
### botCheckForGrenades

```ml
function botCheckForGrenades(state, bot, value, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L244)

<a id="function-function-mq3-game-bot-deathmatch-botcheckforkamikazebody-function-botcheckforkamikazebody-state-bot-value-src-mq3-game-bot-deathmatch-ml-431481745"></a>
### botCheckForKamikazeBody

```ml
function botCheckForKamikazeBody(state, bot, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L250)

<a id="function-function-mq3-game-bot-deathmatch-botcheckforproxmines-function-botcheckforproxmines-state-bot-value-retailactive-src-mq3-game-bot-deathmatch-ml-690709970"></a>
### botCheckForProxMines

```ml
function botCheckForProxMines(state, bot, value, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L245)

<a id="function-function-mq3-game-bot-deathmatch-botcheckitempickup-function-botcheckitempickup-state-bot-oldinventory-retailactive-src-mq3-game-bot-deathmatch-ml-1002456626"></a>
### botCheckItemPickup

```ml
function botCheckItemPickup(state, bot, oldInventory, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `oldInventory` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L166)

<a id="function-function-mq3-game-bot-deathmatch-botchecksnapshot-function-botchecksnapshot-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-1865030049"></a>
### botCheckSnapshot

```ml
function botCheckSnapshot(state, bot, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L257)

<a id="function-function-mq3-game-bot-deathmatch-botchooseweapon-function-botchooseweapon-state-bot-src-mq3-game-bot-deathmatch-ml-979478320"></a>
### botChooseWeapon

```ml
function botChooseWeapon(state, bot)
```

Existing native inventory/combat/navigation implementations.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L162)

<a id="function-function-mq3-game-bot-deathmatch-botclearactivategoalstack-function-botclearactivategoalstack-state-bot-src-mq3-game-bot-deathmatch-ml-1136574640"></a>
### botClearActivateGoalStack

```ml
function botClearActivateGoalStack(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L233)

<a id="function-function-mq3-game-bot-deathmatch-botcreatewaypoint-function-botcreatewaypoint-state-name-origin-areanum-src-mq3-game-bot-deathmatch-ml-305032633"></a>
### botCreateWayPoint

```ml
function botCreateWayPoint(state, name, origin, areanum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `areanum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L182)

<a id="function-function-mq3-game-bot-deathmatch-botctfcarryingflag-function-botctfcarryingflag-state-bot-src-mq3-game-bot-deathmatch-ml-1618124368"></a>
### botCTFCarryingFlag

```ml
function botCTFCarryingFlag(state, bot)
```

BotCTFCarryingFlag

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L83)

<a id="function-function-mq3-game-bot-deathmatch-botctfretreatgoals-function-botctfretreatgoals-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-920941517"></a>
### botCTFRetreatGoals

```ml
function botCTFRetreatGoals(state, bot, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L130)

<a id="function-function-mq3-game-bot-deathmatch-botctfseekgoals-function-botctfseekgoals-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-266761961"></a>
### botCTFSeekGoals

```ml
function botCTFSeekGoals(state, bot, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L129)

<a id="function-function-mq3-game-bot-deathmatch-botdeathmatchai-function-botdeathmatchai-state-bot-thinktime-src-mq3-game-bot-deathmatch-ml-820211143"></a>
### botDeathmatchAI

```ml
function botDeathmatchAI(state, bot, thinktime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `thinktime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L265)

<a id="function-function-mq3-game-bot-deathmatch-botdontavoid-function-botdontavoid-state-bot-name-src-mq3-game-bot-deathmatch-ml-1383976739"></a>
### botDontAvoid

```ml
function botDontAvoid(state, bot, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L201)

<a id="function-function-mq3-game-bot-deathmatch-botenableactivategoalareas-function-botenableactivategoalareas-state-activategoal-enable-src-mq3-game-bot-deathmatch-ml-25390424"></a>
### botEnableActivateGoalAreas

```ml
function botEnableActivateGoalAreas(state, activategoal, enable)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `activategoal` | `dynamic` | — |  |
| `enable` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L234)

<a id="function-function-mq3-game-bot-deathmatch-botenemycubecarriervisible-function-botenemycubecarriervisible-state-bot-src-mq3-game-bot-deathmatch-ml-1303348388"></a>
### botEnemyCubeCarrierVisible

```ml
function botEnemyCubeCarrierVisible(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L217)

<a id="function-function-mq3-game-bot-deathmatch-botenemyflag-function-botenemyflag-state-bot-src-mq3-game-bot-deathmatch-ml-1346338988"></a>
### botEnemyFlag

```ml
function botEnemyFlag(state, bot)
```

BotEnemyFlag and BotTeamFlag

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L91)

<a id="function-function-mq3-game-bot-deathmatch-botenemyflagcarriervisible-function-botenemyflagcarriervisible-state-bot-src-mq3-game-bot-deathmatch-ml-342264084"></a>
### botEnemyFlagCarrierVisible

```ml
function botEnemyFlagCarrierVisible(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L212)

<a id="function-function-mq3-game-bot-deathmatch-botentityvisible-function-botentityvisible-state-viewer-eye-viewangles-fov-ent-src-mq3-game-bot-deathmatch-ml-307646783"></a>
### botEntityVisible

```ml
function botEntityVisible(state, viewer, eye, viewangles, fov, ent)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `viewer` | `dynamic` | — |  |
| `eye` | `dynamic` | — |  |
| `viewangles` | `dynamic` | — |  |
| `fov` | `dynamic` | — |  |
| `ent` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L205)

<a id="function-function-mq3-game-bot-deathmatch-botfeelingbad-function-botfeelingbad-state-bot-src-mq3-game-bot-deathmatch-ml-1544753888"></a>
### botFeelingBad

```ml
function botFeelingBad(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L187)

<a id="function-function-mq3-game-bot-deathmatch-botfindenemy-function-botfindenemy-state-bot-curenemy-src-mq3-game-bot-deathmatch-ml-1586427570"></a>
### botFindEnemy

```ml
function botFindEnemy(state, bot, curenemy)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `curenemy` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L206)

<a id="function-function-mq3-game-bot-deathmatch-botfindwaypoint-function-botfindwaypoint-state-waypoints-name-src-mq3-game-bot-deathmatch-ml-1175043908"></a>
### botFindWayPoint

```ml
function botFindWayPoint(state, waypoints, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `waypoints` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L183)

<a id="function-function-mq3-game-bot-deathmatch-botfreewaypoints-function-botfreewaypoints-state-waypoints-src-mq3-game-bot-deathmatch-ml-1485442065"></a>
### botFreeWaypoints

```ml
function botFreeWaypoints(state, waypoints)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `waypoints` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L184)

<a id="function-function-mq3-game-bot-deathmatch-botfuncbuttonactivategoal-function-botfuncbuttonactivategoal-state-bot-bspent-activategoal-src-mq3-game-bot-deathmatch-ml-648216642"></a>
### botFuncButtonActivateGoal

```ml
function botFuncButtonActivateGoal(state, bot, bspent, activategoal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `bspent` | `dynamic` | — |  |
| `activategoal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L227)

<a id="function-function-mq3-game-bot-deathmatch-botfuncdooractivategoal-function-botfuncdooractivategoal-state-bot-bspent-activategoal-src-mq3-game-bot-deathmatch-ml-1291690462"></a>
### botFuncDoorActivateGoal

```ml
function botFuncDoorActivateGoal(state, bot, bspent, activategoal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `bspent` | `dynamic` | — |  |
| `activategoal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L228)

<a id="function-function-mq3-game-bot-deathmatch-botgetactivategoal-function-botgetactivategoal-state-bot-entitynum-activategoal-src-mq3-game-bot-deathmatch-ml-479939289"></a>
### botGetActivateGoal

```ml
function botGetActivateGoal(state, bot, entitynum, activategoal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `entitynum` | `dynamic` | — |  |
| `activategoal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L230)

<a id="function-function-mq3-game-bot-deathmatch-botgetalternateroutegoal-function-botgetalternateroutegoal-state-bot-base-src-mq3-game-bot-deathmatch-ml-666852481"></a>
### botGetAlternateRouteGoal

```ml
function botGetAlternateRouteGoal(state, bot, base)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `base` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L263)

<a id="function-function-mq3-game-bot-deathmatch-botgoalforbspentity-function-botgoalforbspentity-state-classname-value-src-mq3-game-bot-deathmatch-ml-136843383"></a>
### botGoalForBSPEntity

```ml
function botGoalForBSPEntity(state, classname, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `classname` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L275)

<a id="function-function-mq3-game-bot-deathmatch-botgocamp-function-botgocamp-state-bot-value-src-mq3-game-bot-deathmatch-ml-1376524619"></a>
### botGoCamp

```ml
function botGoCamp(state, bot, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L199)

<a id="function-function-mq3-game-bot-deathmatch-botgoforactivategoal-function-botgoforactivategoal-state-bot-activategoal-src-mq3-game-bot-deathmatch-ml-637898538"></a>
### botGoForActivateGoal

```ml
function botGoForActivateGoal(state, bot, activategoal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `activategoal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L236)

<a id="function-function-mq3-game-bot-deathmatch-botgoforpowerups-function-botgoforpowerups-state-bot-src-mq3-game-bot-deathmatch-ml-736653480"></a>
### botGoForPowerups

```ml
function botGoForPowerups(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L202)

<a id="function-function-mq3-game-bot-deathmatch-botgoharvest-function-botgoharvest-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-790118585"></a>
### botGoHarvest

```ml
function botGoHarvest(state, bot, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L135)

<a id="function-function-mq3-game-bot-deathmatch-botharvestercarryingcubes-function-botharvestercarryingcubes-state-bot-src-mq3-game-bot-deathmatch-ml-2110732752"></a>
### botHarvesterCarryingCubes

```ml
function botHarvesterCarryingCubes(state, bot)
```

BotHarvesterCarryingCubes

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L85)

<a id="function-function-mq3-game-bot-deathmatch-botharvesterretreatgoals-function-botharvesterretreatgoals-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-941188889"></a>
### botHarvesterRetreatGoals

```ml
function botHarvesterRetreatGoals(state, bot, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L137)

<a id="function-function-mq3-game-bot-deathmatch-botharvesterseekgoals-function-botharvesterseekgoals-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-427194531"></a>
### botHarvesterSeekGoals

```ml
function botHarvesterSeekGoals(state, bot, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L136)

<a id="function-function-mq3-game-bot-deathmatch-bothaspersistantpowerupandweapon-function-bothaspersistantpowerupandweapon-state-bot-src-mq3-game-bot-deathmatch-ml-811946204"></a>
### botHasPersistantPowerupAndWeapon

```ml
function botHasPersistantPowerupAndWeapon(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L192)

<a id="function-function-mq3-game-bot-deathmatch-botinitwaypoints-function-botinitwaypoints-state-src-mq3-game-bot-deathmatch-ml-683233717"></a>
### botInitWaypoints

```ml
function botInitWaypoints(state)
```

Waypoint pool/lifecycle.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L181)

<a id="function-function-mq3-game-bot-deathmatch-botinlavaorslime-function-botinlavaorslime-state-bot-src-mq3-game-bot-deathmatch-ml-1512419696"></a>
### botInLavaOrSlime

```ml
function botInLavaOrSlime(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L178)

<a id="function-function-mq3-game-bot-deathmatch-botintermission-function-botintermission-state-bot-src-mq3-game-bot-deathmatch-ml-1705939934"></a>
### botIntermission

```ml
function botIntermission(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L177)

<a id="function-function-mq3-game-bot-deathmatch-botisdead-function-botisdead-state-bot-src-mq3-game-bot-deathmatch-ml-1146076366"></a>
### botIsDead

```ml
function botIsDead(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L175)

<a id="function-function-mq3-game-bot-deathmatch-botisgoingtoactivateentity-function-botisgoingtoactivateentity-state-bot-entitynum-src-mq3-game-bot-deathmatch-ml-2133325695"></a>
### botIsGoingToActivateEntity

```ml
function botIsGoingToActivateEntity(state, bot, entitynum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `entitynum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L235)

<a id="function-function-mq3-game-bot-deathmatch-botisobserver-function-botisobserver-state-bot-src-mq3-game-bot-deathmatch-ml-1443998658"></a>
### botIsObserver

```ml
function botIsObserver(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L176)

<a id="function-function-mq3-game-bot-deathmatch-botmapscripts-function-botmapscripts-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-986668055"></a>
### botMapScripts

```ml
function botMapScripts(state, bot, retailActive)
```

Map, movers and activation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L222)

<a id="function-function-mq3-game-bot-deathmatch-botmodelminsmaxs-function-botmodelminsmaxs-state-modelindex-etype-contents-src-mq3-game-bot-deathmatch-ml-700149437"></a>
### botModelMinsMaxs

```ml
function botModelMinsMaxs(state, modelindex, eType, contents)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `modelindex` | `dynamic` | — |  |
| `eType` | `dynamic` | — |  |
| `contents` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L224)

<a id="function-function-mq3-game-bot-deathmatch-botobeliskretreatgoals-function-botobeliskretreatgoals-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-1089601625"></a>
### botObeliskRetreatGoals

```ml
function botObeliskRetreatGoals(state, bot, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L134)

<a id="function-function-mq3-game-bot-deathmatch-botobeliskseekgoals-function-botobeliskseekgoals-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-1399869941"></a>
### botObeliskSeekGoals

```ml
function botObeliskSeekGoals(state, bot, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L133)

<a id="function-function-mq3-game-bot-deathmatch-botoppositeteam-function-botoppositeteam-state-bot-src-mq3-game-bot-deathmatch-ml-135182662"></a>
### botOppositeTeam

```ml
function botOppositeTeam(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L88)

<a id="function-function-mq3-game-bot-deathmatch-botpointareanum-function-botpointareanum-state-origin-src-mq3-game-bot-deathmatch-ml-1013396011"></a>
### botPointAreaNum

```ml
function botPointAreaNum(state, origin)
```

Client and string helpers.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L147)

<a id="function-function-mq3-game-bot-deathmatch-botpopfromactivategoalstack-function-botpopfromactivategoalstack-state-bot-src-mq3-game-bot-deathmatch-ml-338195668"></a>
### botPopFromActivateGoalStack

```ml
function botPopFromActivateGoalStack(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L231)

<a id="function-function-mq3-game-bot-deathmatch-botprintactivategoalinfo-function-botprintactivategoalinfo-state-bot-activategoal-bspent-retailactive-src-mq3-game-bot-deathmatch-ml-292208673"></a>
### botPrintActivateGoalInfo

```ml
function botPrintActivateGoalInfo(state, bot, activategoal, bspent, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `activategoal` | `dynamic` | — |  |
| `bspent` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L237)

<a id="function-function-mq3-game-bot-deathmatch-botpushontoactivategoalstack-function-botpushontoactivategoalstack-state-bot-activategoal-src-mq3-game-bot-deathmatch-ml-428704202"></a>
### botPushOntoActivateGoalStack

```ml
function botPushOntoActivateGoalStack(state, bot, activategoal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `activategoal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L232)

<a id="function-function-mq3-game-bot-deathmatch-botrandommove-function-botrandommove-state-bot-moveresult-src-mq3-game-bot-deathmatch-ml-1682619946"></a>
### botRandomMove

```ml
function botRandomMove(state, bot, moveresult)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `moveresult` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L238)

<a id="function-function-mq3-game-bot-deathmatch-botrefuseorder-function-botrefuseorder-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-1458534181"></a>
### botRefuseOrder

```ml
function botRefuseOrder(state, bot, retailActive)
```

BotRefuseOrder

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L123)

<a id="function-function-mq3-game-bot-deathmatch-botrememberlastorderedtask-function-botrememberlastorderedtask-state-bot-src-mq3-game-bot-deathmatch-ml-213209232"></a>
### botRememberLastOrderedTask

```ml
function botRememberLastOrderedTask(state, bot)
```

BotRememberLastOrderedTask

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L108)

<a id="function-function-mq3-game-bot-deathmatch-botroamgoal-function-botroamgoal-state-bot-src-mq3-game-bot-deathmatch-ml-482082278"></a>
### botRoamGoal

```ml
function botRoamGoal(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L203)

<a id="function-function-mq3-game-bot-deathmatch-botsameteam-function-botsameteam-state-bot-entitynumber-src-mq3-game-bot-deathmatch-ml-367844770"></a>
### botSameTeam

```ml
function botSameTeam(state, bot, entityNumber)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `entityNumber` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L89)

<a id="function-function-mq3-game-bot-deathmatch-botsetentitynumforgoal-function-botsetentitynumforgoal-state-value-classname-src-mq3-game-bot-deathmatch-ml-1833605121"></a>
### botSetEntityNumForGoal

```ml
function botSetEntityNumForGoal(state, value, classname)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `classname` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L271)

<a id="function-function-mq3-game-bot-deathmatch-botsetentitynumforgoalwithmodel-function-botsetentitynumforgoalwithmodel-state-value-etype-modelname-src-mq3-game-bot-deathmatch-ml-262189745"></a>
### botSetEntityNumForGoalWithModel

```ml
function botSetEntityNumForGoalWithModel(state, value, eType, modelname)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `eType` | `dynamic` | — |  |
| `modelname` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L267)

<a id="function-function-mq3-game-bot-deathmatch-botsetlastorderedtask-function-botsetlastorderedtask-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-256025375"></a>
### botSetLastOrderedTask

```ml
function botSetLastOrderedTask(state, bot, retailActive)
```

BotSetLastOrderedTask

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L117)

<a id="function-function-mq3-game-bot-deathmatch-botsetmovedir-function-botsetmovedir-angles-src-mq3-game-bot-deathmatch-ml-357204744"></a>
### botSetMovedir

```ml
function botSetMovedir(angles)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L223)

<a id="function-function-mq3-game-bot-deathmatch-botsetteamstatus-function-botsetteamstatus-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-642751113"></a>
### botSetTeamStatus

```ml
function botSetTeamStatus(state, bot, retailActive)
```

BotSetTeamStatus

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L112)

<a id="function-function-mq3-game-bot-deathmatch-botsetteleporttime-function-botsetteleporttime-state-bot-src-mq3-game-bot-deathmatch-ml-1788206848"></a>
### botSetTeleportTime

```ml
function botSetTeleportTime(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L173)

<a id="function-function-mq3-game-bot-deathmatch-botsetupalternativeroutegoals-function-botsetupalternativeroutegoals-state-src-mq3-game-bot-deathmatch-ml-615240513"></a>
### botSetupAlternativeRouteGoals

```ml
function botSetupAlternativeRouteGoals(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L264)

<a id="function-function-mq3-game-bot-deathmatch-botsetupdeathmatchai-function-botsetupdeathmatchai-state-retailactive-src-mq3-game-bot-deathmatch-ml-896670240"></a>
### botSetupDeathmatchAI

```ml
function botSetupDeathmatchAI(state, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L278)

<a id="function-function-mq3-game-bot-deathmatch-botsetupformovement-function-botsetupformovement-state-bot-src-mq3-game-bot-deathmatch-ml-633219648"></a>
### botSetupForMovement

```ml
function botSetupForMovement(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L163)

<a id="function-function-mq3-game-bot-deathmatch-botsetuserinfo-function-botsetuserinfo-state-bot-key-value-retailactive-src-mq3-game-bot-deathmatch-ml-589310157"></a>
### botSetUserInfo

```ml
function botSetUserInfo(state, bot, key, value, retailActive)
```

BotSetUserInfo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `key` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L106)

<a id="function-function-mq3-game-bot-deathmatch-botshutdowndeathmatchai-function-botshutdowndeathmatchai-state-src-mq3-game-bot-deathmatch-ml-1003289329"></a>
### botShutdownDeathmatchAI

```ml
function botShutdownDeathmatchAI(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L279)

<a id="function-function-mq3-game-bot-deathmatch-botsynonymcontext-function-botsynonymcontext-state-bot-src-mq3-game-bot-deathmatch-ml-1177983046"></a>
### botSynonymContext

```ml
function botSynonymContext(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L159)

<a id="function-function-mq3-game-bot-deathmatch-botteam-function-botteam-state-bot-src-mq3-game-bot-deathmatch-ml-109247032"></a>
### botTeam

```ml
function botTeam(state, bot)
```

BotTeam, BotOppositeTeam and BotSameTeam

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L87)

<a id="function-function-mq3-game-bot-deathmatch-botteamcubecarriervisible-function-botteamcubecarriervisible-state-bot-src-mq3-game-bot-deathmatch-ml-1914956834"></a>
### botTeamCubeCarrierVisible

```ml
function botTeamCubeCarrierVisible(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L216)

<a id="function-function-mq3-game-bot-deathmatch-botteamflag-function-botteamflag-state-bot-src-mq3-game-bot-deathmatch-ml-359605496"></a>
### botTeamFlag

```ml
function botTeamFlag(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L92)

<a id="function-function-mq3-game-bot-deathmatch-botteamflagcarrier-function-botteamflagcarrier-state-bot-src-mq3-game-bot-deathmatch-ml-471852400"></a>
### botTeamFlagCarrier

```ml
function botTeamFlagCarrier(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L211)

<a id="function-function-mq3-game-bot-deathmatch-botteamflagcarriervisible-function-botteamflagcarriervisible-state-bot-src-mq3-game-bot-deathmatch-ml-343464464"></a>
### botTeamFlagCarrierVisible

```ml
function botTeamFlagCarrierVisible(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L210)

<a id="function-function-mq3-game-bot-deathmatch-botteamgoals-function-botteamgoals-state-bot-retreat-retailactive-src-mq3-game-bot-deathmatch-ml-553265732"></a>
### botTeamGoals

```ml
function botTeamGoals(state, bot, retreat, retailActive)
```

BotTeamGoals

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `retreat` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L139)

<a id="function-function-mq3-game-bot-deathmatch-bottriggermultipleactivategoal-function-bottriggermultipleactivategoal-state-bot-bspent-activategoal-src-mq3-game-bot-deathmatch-ml-1020619020"></a>
### botTriggerMultipleActivateGoal

```ml
function botTriggerMultipleActivateGoal(state, bot, bspent, activategoal)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `bspent` | `dynamic` | — |  |
| `activategoal` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L229)

<a id="function-function-mq3-game-bot-deathmatch-botupdatebattleinventory-function-botupdatebattleinventory-state-bot-enemy-src-mq3-game-bot-deathmatch-ml-479106914"></a>
### botUpdateBattleInventory

```ml
function botUpdateBattleInventory(state, bot, enemy)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `enemy` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L164)

<a id="function-function-mq3-game-bot-deathmatch-botupdateinventory-function-botupdateinventory-state-bot-src-mq3-game-bot-deathmatch-ml-677360192"></a>
### botUpdateInventory

```ml
function botUpdateInventory(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L165)

<a id="function-function-mq3-game-bot-deathmatch-botuseinvulnerability-function-botuseinvulnerability-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-2129144507"></a>
### botUseInvulnerability

```ml
function botUseInvulnerability(state, bot, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L172)

<a id="function-function-mq3-game-bot-deathmatch-botusekamikaze-function-botusekamikaze-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-1999922809"></a>
### botUseKamikaze

```ml
function botUseKamikaze(state, bot, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L171)

<a id="function-function-mq3-game-bot-deathmatch-botvisibleteammatesandenemies-function-botvisibleteammatesandenemies-state-bot-range-src-mq3-game-bot-deathmatch-ml-44090261"></a>
### botVisibleTeamMatesAndEnemies

```ml
function botVisibleTeamMatesAndEnemies(state, bot, range)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `range` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L213)

<a id="function-function-mq3-game-bot-deathmatch-botwantstocamp-function-botwantstocamp-state-bot-src-mq3-game-bot-deathmatch-ml-1662188480"></a>
### botWantsToCamp

```ml
function botWantsToCamp(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L200)

<a id="function-function-mq3-game-bot-deathmatch-botwantstochase-function-botwantstochase-state-bot-src-mq3-game-bot-deathmatch-ml-50765606"></a>
### botWantsToChase

```ml
function botWantsToChase(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L189)

<a id="function-function-mq3-game-bot-deathmatch-botwantstohelp-function-botwantstohelp-state-bot-src-mq3-game-bot-deathmatch-ml-150397552"></a>
### botWantsToHelp

```ml
function botWantsToHelp(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L190)

<a id="function-function-mq3-game-bot-deathmatch-botwantstoretreat-function-botwantstoretreat-state-bot-src-mq3-game-bot-deathmatch-ml-560850472"></a>
### botWantsToRetreat

```ml
function botWantsToRetreat(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L188)

<a id="function-function-mq3-game-bot-deathmatch-carriervisible-function-carriervisible-state-bot-teamcarrier-cubes-src-mq3-game-bot-deathmatch-ml-2069912235"></a>
### carrierVisible

```ml
function carrierVisible(state, bot, teamCarrier, cubes)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `teamCarrier` | `dynamic` | — |  |
| `cubes` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L207)

<a id="function-function-mq3-game-bot-deathmatch-clientfromname-function-clientfromname-state-name-src-mq3-game-bot-deathmatch-ml-390755490"></a>
### clientFromName

```ml
function clientFromName(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L150)

<a id="function-function-mq3-game-bot-deathmatch-clientname-function-clientname-state-client-src-mq3-game-bot-deathmatch-ml-2015196010"></a>
### clientName

```ml
function clientName(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L148)

<a id="function-function-mq3-game-bot-deathmatch-clientonsameteamfromname-function-clientonsameteamfromname-state-bot-name-src-mq3-game-bot-deathmatch-ml-1562423779"></a>
### clientOnSameTeamFromName

```ml
function clientOnSameTeamFromName(state, bot, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L151)

<a id="function-function-mq3-game-bot-deathmatch-clientskin-function-clientskin-state-client-src-mq3-game-bot-deathmatch-ml-905105514"></a>
### clientSkin

```ml
function clientSkin(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L149)

<a id="constant-constant-mq3-game-bot-deathmatch-contents-lava-const-contents-lava-headers-contents-lava-src-mq3-game-bot-deathmatch-ml-1781051302"></a>
### CONTENTS_LAVA

```ml
const CONTENTS_LAVA = headers.CONTENTS_LAVA
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L48)

<a id="constant-constant-mq3-game-bot-deathmatch-contents-slime-const-contents-slime-headers-contents-slime-src-mq3-game-bot-deathmatch-ml-2023096164"></a>
### CONTENTS_SLIME

```ml
const CONTENTS_SLIME = headers.CONTENTS_SLIME
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L47)

<a id="constant-constant-mq3-game-bot-deathmatch-contents-water-const-contents-water-headers-contents-water-src-mq3-game-bot-deathmatch-ml-1702742467"></a>
### CONTENTS_WATER

```ml
const CONTENTS_WATER = headers.CONTENTS_WATER
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L46)

<a id="function-function-mq3-game-bot-deathmatch-copygoal-function-copygoal-value-src-mq3-game-bot-deathmatch-ml-311180753"></a>
### copyGoal

```ml
function copyGoal(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L66)

<a id="function-function-mq3-game-bot-deathmatch-create-function-create-src-mq3-game-bot-deathmatch-ml-652219274"></a>
### create

```ml
function create()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L67)

<a id="function-function-mq3-game-bot-deathmatch-distancesquared-function-distancesquared-a-b-src-mq3-game-bot-deathmatch-ml-1920583433"></a>
### distanceSquared

```ml
function distanceSquared(a, b)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — |  |
| `b` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L78)

<a id="function-function-mq3-game-bot-deathmatch-easyclientname-function-easyclientname-state-client-src-mq3-game-bot-deathmatch-ml-1065682858"></a>
### easyClientName

```ml
function easyClientName(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L153)

<a id="constant-constant-mq3-game-bot-deathmatch-ef-dead-const-ef-dead-1-src-mq3-game-bot-deathmatch-ml-1359753776"></a>
### EF_DEAD

```ml
const EF_DEAD = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L44)

<a id="constant-constant-mq3-game-bot-deathmatch-ef-kamikaze-const-ef-kamikaze-1048576-src-mq3-game-bot-deathmatch-ml-2127703394"></a>
### EF_KAMIKAZE

```ml
const EF_KAMIKAZE = 1048576
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L45)

<a id="function-function-mq3-game-bot-deathmatch-emit-function-emit-state-kind-bot-text-value-point-retailactive-src-mq3-game-bot-deathmatch-ml-389674577"></a>
### emit

```ml
function emit(state, kind, bot, text, value, point, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `point` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L72)

<a id="function-function-mq3-game-bot-deathmatch-entity-function-entity-number-src-mq3-game-bot-deathmatch-ml-1849062607"></a>
### entity

```ml
function entity(number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L65)

- [mq3.game.bot_deathmatch.Entity](Type-mq3-game-bot-deathmatch-entity-401888652.md) — struct
<a id="function-function-mq3-game-bot-deathmatch-entitycarriescubes-function-entitycarriescubes-state-value-src-mq3-game-bot-deathmatch-ml-2123979656"></a>
### entityCarriesCubes

```ml
function entityCarriesCubes(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L102)

<a id="function-function-mq3-game-bot-deathmatch-entitycarriesflag-function-entitycarriesflag-value-src-mq3-game-bot-deathmatch-ml-1115623089"></a>
### entityCarriesFlag

```ml
function entityCarriesFlag(value)
```

Entity predicates.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L95)

<a id="function-function-mq3-game-bot-deathmatch-entitycarriesflagmode-function-entitycarriesflagmode-value-missionpack-src-mq3-game-bot-deathmatch-ml-1142380844"></a>
### entityCarriesFlagMode

```ml
function entityCarriesFlagMode(value, missionpack)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |
| `missionpack` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L96)

<a id="function-function-mq3-game-bot-deathmatch-entityhaskamikaze-function-entityhaskamikaze-value-src-mq3-game-bot-deathmatch-ml-236540293"></a>
### entityHasKamikaze

```ml
function entityHasKamikaze(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L101)

<a id="function-function-mq3-game-bot-deathmatch-entityhasquad-function-entityhasquad-value-src-mq3-game-bot-deathmatch-ml-827507665"></a>
### entityHasQuad

```ml
function entityHasQuad(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L100)

<a id="function-function-mq3-game-bot-deathmatch-entityischatting-function-entityischatting-value-src-mq3-game-bot-deathmatch-ml-656772689"></a>
### entityIsChatting

```ml
function entityIsChatting(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L99)

<a id="function-function-mq3-game-bot-deathmatch-entityisdead-function-entityisdead-state-value-src-mq3-game-bot-deathmatch-ml-88371160"></a>
### entityIsDead

```ml
function entityIsDead(state, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L103)

<a id="function-function-mq3-game-bot-deathmatch-entityisinvisible-function-entityisinvisible-value-src-mq3-game-bot-deathmatch-ml-536754145"></a>
### entityIsInvisible

```ml
function entityIsInvisible(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L97)

<a id="function-function-mq3-game-bot-deathmatch-entityisshooting-function-entityisshooting-value-src-mq3-game-bot-deathmatch-ml-2092573409"></a>
### entityIsShooting

```ml
function entityIsShooting(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L98)

<a id="constant-constant-mq3-game-bot-deathmatch-et-missile-const-et-missile-3-src-mq3-game-bot-deathmatch-ml-1981654112"></a>
### ET_MISSILE

```ml
const ET_MISSILE = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L41)

<a id="function-function-mq3-game-bot-deathmatch-goal-function-goal-src-mq3-game-bot-deathmatch-ml-1288445710"></a>
### goal

```ml
function goal()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L64)

- [mq3.game.bot_deathmatch.Goal](Type-mq3-game-bot-deathmatch-goal-466156508.md) — struct
<a id="constant-constant-mq3-game-bot-deathmatch-gt-1fctf-const-gt-1fctf-5-src-mq3-game-bot-deathmatch-ml-1621703218"></a>
### GT_1FCTF

```ml
const GT_1FCTF = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L23)

<a id="constant-constant-mq3-game-bot-deathmatch-gt-ctf-const-gt-ctf-4-src-mq3-game-bot-deathmatch-ml-685972341"></a>
### GT_CTF

```ml
const GT_CTF = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L22)

<a id="constant-constant-mq3-game-bot-deathmatch-gt-harvester-const-gt-harvester-7-src-mq3-game-bot-deathmatch-ml-1875304792"></a>
### GT_HARVESTER

```ml
const GT_HARVESTER = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L25)

<a id="constant-constant-mq3-game-bot-deathmatch-gt-obelisk-const-gt-obelisk-6-src-mq3-game-bot-deathmatch-ml-376019187"></a>
### GT_OBELISK

```ml
const GT_OBELISK = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L24)

<a id="constant-constant-mq3-game-bot-deathmatch-gt-team-const-gt-team-3-src-mq3-game-bot-deathmatch-ml-1317523446"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L21)

<a id="function-function-mq3-game-bot-deathmatch-infieldofvision-function-infieldofvision-viewangles-fov-angles-src-mq3-game-bot-deathmatch-ml-1460599452"></a>
### inFieldOfVision

```ml
function inFieldOfVision(viewangles, fov, angles)
```

Exact aliases for the remaining existing native implementations.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `viewangles` | `dynamic` | — |  |
| `fov` | `dynamic` | — |  |
| `angles` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L282)

<a id="function-function-mq3-game-bot-deathmatch-intvalue-function-intvalue-value-src-mq3-game-bot-deathmatch-ml-918538705"></a>
### intValue

```ml
function intValue(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L128)

<a id="constant-constant-mq3-game-bot-deathmatch-inventory-ammoregen-const-inventory-ammoregen-headers-inventory-ammoregen-src-mq3-game-bot-deathmatch-ml-2146090389"></a>
### INVENTORY_AMMOREGEN

```ml
const INVENTORY_AMMOREGEN = headers.INVENTORY_AMMOREGEN
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L40)

<a id="constant-constant-mq3-game-bot-deathmatch-inventory-bluecube-const-inventory-bluecube-headers-inventory-bluecube-src-mq3-game-bot-deathmatch-ml-2074726373"></a>
### INVENTORY_BLUECUBE

```ml
const INVENTORY_BLUECUBE = headers.INVENTORY_BLUECUBE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L36)

<a id="constant-constant-mq3-game-bot-deathmatch-inventory-doubler-const-inventory-doubler-headers-inventory-doubler-src-mq3-game-bot-deathmatch-ml-449580483"></a>
### INVENTORY_DOUBLER

```ml
const INVENTORY_DOUBLER = headers.INVENTORY_DOUBLER
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L39)

<a id="constant-constant-mq3-game-bot-deathmatch-inventory-environmentsuit-const-inventory-environmentsuit-headers-inventory-environmentsuit-src-mq3-game-bot-deathmatch-ml-1721868552"></a>
### INVENTORY_ENVIRONMENTSUIT

```ml
const INVENTORY_ENVIRONMENTSUIT = headers.INVENTORY_ENVIRONMENTSUIT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L33)

<a id="constant-constant-mq3-game-bot-deathmatch-inventory-guard-const-inventory-guard-headers-inventory-guard-src-mq3-game-bot-deathmatch-ml-526676739"></a>
### INVENTORY_GUARD

```ml
const INVENTORY_GUARD = headers.INVENTORY_GUARD
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L38)

<a id="constant-constant-mq3-game-bot-deathmatch-inventory-health-const-inventory-health-headers-inventory-health-src-mq3-game-bot-deathmatch-ml-2131194970"></a>
### INVENTORY_HEALTH

```ml
const INVENTORY_HEALTH = headers.INVENTORY_HEALTH
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L28)

<a id="constant-constant-mq3-game-bot-deathmatch-inventory-invulnerability-const-inventory-invulnerability-headers-inventory-invulnerability-src-mq3-game-bot-deathmatch-ml-442202185"></a>
### INVENTORY_INVULNERABILITY

```ml
const INVENTORY_INVULNERABILITY = headers.INVENTORY_INVULNERABILITY
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L32)

<a id="constant-constant-mq3-game-bot-deathmatch-inventory-kamikaze-const-inventory-kamikaze-headers-inventory-kamikaze-src-mq3-game-bot-deathmatch-ml-2047813519"></a>
### INVENTORY_KAMIKAZE

```ml
const INVENTORY_KAMIKAZE = headers.INVENTORY_KAMIKAZE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L31)

<a id="constant-constant-mq3-game-bot-deathmatch-inventory-medkit-const-inventory-medkit-headers-inventory-medkit-src-mq3-game-bot-deathmatch-ml-1419937774"></a>
### INVENTORY_MEDKIT

```ml
const INVENTORY_MEDKIT = headers.INVENTORY_MEDKIT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L30)

<a id="constant-constant-mq3-game-bot-deathmatch-inventory-neutralflag-const-inventory-neutralflag-headers-inventory-neutralflag-src-mq3-game-bot-deathmatch-ml-1336090719"></a>
### INVENTORY_NEUTRALFLAG

```ml
const INVENTORY_NEUTRALFLAG = headers.INVENTORY_NEUTRALFLAG
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L34)

<a id="constant-constant-mq3-game-bot-deathmatch-inventory-redcube-const-inventory-redcube-headers-inventory-redcube-src-mq3-game-bot-deathmatch-ml-1086205982"></a>
### INVENTORY_REDCUBE

```ml
const INVENTORY_REDCUBE = headers.INVENTORY_REDCUBE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L35)

<a id="constant-constant-mq3-game-bot-deathmatch-inventory-scout-const-inventory-scout-headers-inventory-scout-src-mq3-game-bot-deathmatch-ml-1509927462"></a>
### INVENTORY_SCOUT

```ml
const INVENTORY_SCOUT = headers.INVENTORY_SCOUT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L37)

<a id="constant-constant-mq3-game-bot-deathmatch-inventory-teleporter-const-inventory-teleporter-headers-inventory-teleporter-src-mq3-game-bot-deathmatch-ml-306984904"></a>
### INVENTORY_TELEPORTER

```ml
const INVENTORY_TELEPORTER = headers.INVENTORY_TELEPORTER
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L29)

- [mq3.game.bot_deathmatch.LastTask](Type-mq3-game-bot-deathmatch-lasttask-2104050610.md) — struct
<a id="constant-constant-mq3-game-bot-deathmatch-max-clients-const-max-clients-64-src-mq3-game-bot-deathmatch-ml-1125504737"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L20)

<a id="function-function-mq3-game-bot-deathmatch-nowfn-function-nowfn-services-src-mq3-game-bot-deathmatch-ml-1672263250"></a>
### nowFn

```ml
function nowFn(services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L174)

- [mq3.game.bot_deathmatch.State](Type-mq3-game-bot-deathmatch-state-650922884.md) — struct
<a id="function-function-mq3-game-bot-deathmatch-strategicgoal-function-strategicgoal-state-bot-name-retreat-retailactive-src-mq3-game-bot-deathmatch-ml-1908235351"></a>
### strategicGoal

```ml
function strategicGoal(state, bot, name, retreat, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `retreat` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L125)

<a id="function-function-mq3-game-bot-deathmatch-stristr-function-stristr-text-needle-src-mq3-game-bot-deathmatch-ml-1822027560"></a>
### stristr

```ml
function stristr(text, needle)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |
| `needle` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L152)

<a id="function-function-mq3-game-bot-deathmatch-sync-function-sync-state-src-mq3-game-bot-deathmatch-ml-1487792009"></a>
### sync

```ml
function sync(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L76)

<a id="constant-constant-mq3-game-bot-deathmatch-team-blue-const-team-blue-2-src-mq3-game-bot-deathmatch-ml-1411769383"></a>
### TEAM_BLUE

```ml
const TEAM_BLUE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L27)

<a id="constant-constant-mq3-game-bot-deathmatch-team-red-const-team-red-1-src-mq3-game-bot-deathmatch-ml-918175840"></a>
### TEAM_RED

```ml
const TEAM_RED = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L26)

<a id="function-function-mq3-game-bot-deathmatch-teamplayison-function-teamplayison-state-src-mq3-game-bot-deathmatch-ml-1724070597"></a>
### teamPlayIsOn

```ml
function teamPlayIsOn(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L185)

<a id="function-function-mq3-game-bot-deathmatch-teamvalue-function-teamvalue-state-bot-src-mq3-game-bot-deathmatch-ml-325888020"></a>
### teamValue

```ml
function teamValue(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L77)

- [mq3.game.bot_deathmatch.Waypoint](Type-mq3-game-bot-deathmatch-waypoint-851135484.md) — struct
<a id="constant-constant-mq3-game-bot-deathmatch-wp-grenade-launcher-const-wp-grenade-launcher-4-src-mq3-game-bot-deathmatch-ml-1045347729"></a>
### WP_GRENADE_LAUNCHER

```ml
const WP_GRENADE_LAUNCHER = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L42)

<a id="constant-constant-mq3-game-bot-deathmatch-wp-prox-launcher-const-wp-prox-launcher-11-src-mq3-game-bot-deathmatch-ml-251090599"></a>
### WP_PROX_LAUNCHER

```ml
const WP_PROX_LAUNCHER = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L43)
