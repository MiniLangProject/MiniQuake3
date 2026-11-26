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
| `state` | `dynamic` | — | Bot deathmatch state; accesses `gametype`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `inventory`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L300)

<a id="function-function-mq3-game-bot-deathmatch-bot1fctfretreatgoals-function-bot1fctfretreatgoals-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-1944254869"></a>
### bot1FCTFRetreatGoals

```ml
function bot1FCTFRetreatGoals(state, bot, retailActive)
```

Forward `bot1FCTFRetreatGoals` to `mq3.game.bot_deathmatch.strategicGoal` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `strategyFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L429)

<a id="function-function-mq3-game-bot-deathmatch-bot1fctfseekgoals-function-bot1fctfseekgoals-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-185102035"></a>
### bot1FCTFSeekGoals

```ml
function bot1FCTFSeekGoals(state, bot, retailActive)
```

Forward `bot1FCTFSeekGoals` to `mq3.game.bot_deathmatch.strategicGoal` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `strategyFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L424)

<a id="function-function-mq3-game-bot-deathmatch-botaggression-function-botaggression-state-bot-src-mq3-game-bot-deathmatch-ml-240340650"></a>
### botAggression

```ml
function botAggression(state, bot)
```

Forward `botAggression` to `mq3.game.bot_combat_ai.aggression` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Not read by this implementation; retained in the `botAggression` signature. |
| `bot` | `dynamic` | — | Bot AI state; accesses `inventory` and `weaponnum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L595)

<a id="function-function-mq3-game-bot-deathmatch-botaiblocked-function-botaiblocked-state-bot-moveresult-activate-retailactive-src-mq3-game-bot-deathmatch-ml-1978529396"></a>
### botAIBlocked

```ml
function botAIBlocked(state, bot, moveresult, activate, retailActive)
```

Record or dispatch `"blocked"` actions in `botAIBlocked`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `actions` and `hostActionFn`. May update `state.actions` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `moveresult` | `dynamic` | — | Moveresult record; accesses `failure` and `movedir`. |
| `activate` | `dynamic` | — | Initial value stored in `mq3.game.bot_deathmatch.Action.value`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L796)

<a id="function-function-mq3-game-bot-deathmatch-botaimatenemy-function-botaimatenemy-state-bot-src-mq3-game-bot-deathmatch-ml-1969641930"></a>
### botAimAtEnemy

```ml
function botAimAtEnemy(state, bot)
```

Forward `botAimAtEnemy` to `mq3.game.bot_combat_ai.aimAtEnemy` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `combatServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `enemy`, `aimTarget`, `idealViewangles`, `eye` and `character` and related fields. May update `bot.aimTarget` and `bot.idealViewangles` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L704)

<a id="function-function-mq3-game-bot-deathmatch-botaipredictobstacles-function-botaipredictobstacles-state-bot-value-src-mq3-game-bot-deathmatch-ml-448560291"></a>
### botAIPredictObstacles

```ml
function botAIPredictObstacles(state, bot, value)
```

Forward `botAIPredictObstacles` to `mq3.game.bot_navigation.predictObstacles` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `predictobstaclesGoalareanum`, `predictobstaclesTime`, `areanum`, `origin` and `tfl`. May update `bot.predictobstaclesGoalareanum` and `bot.predictobstaclesTime` in place. |
| `value` | `dynamic` | — | Bot navigation goal; accesses `areanum` and `entitynum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L801)

<a id="function-function-mq3-game-bot-deathmatch-botalternateroute-function-botalternateroute-state-bot-value-src-mq3-game-bot-deathmatch-ml-1765522703"></a>
### botAlternateRoute

```ml
function botAlternateRoute(state, bot, value)
```

Forward `botAlternateRoute` to `mq3.game.bot_navigation.alternateRoute` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `altRouteGoal`, `reachedAltRouteGoalTime`, `areanum`, `origin` and `tfl`. May update `bot.reachedAltRouteGoalTime` in place. |
| `value` | `dynamic` | — | Target record; accesses `areanum`, `entitynum`, `origin`, `mins` and `maxs` and related fields. May update `value.areanum`, `value.entitynum` and `value.origin` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L856)

<a id="function-function-mq3-game-bot-deathmatch-botattackmove-function-botattackmove-state-bot-tfl-src-mq3-game-bot-deathmatch-ml-1175284880"></a>
### botAttackMove

```ml
function botAttackMove(state, bot, tfl)
```

Forward `botAttackMove` to `mq3.game.bot_combat_ai.attackMove` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `combatServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `enemy`, `attackchaseTime`, `lastEnemyAreaNum`, `lastEnemyOrigin` and `ms` and related fields. May update `bot.attackcrouchTime`, `bot.attackjumpTime` and `bot.attackstrafeTime` and additional fields in place. |
| `tfl` | `dynamic` | — | Bit mask of permitted AAS travel modes and area restrictions. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L652)

<a id="function-function-mq3-game-bot-deathmatch-botbattleuseitems-function-botbattleuseitems-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-808326125"></a>
### botBattleUseItems

```ml
function botBattleUseItems(state, bot, retailActive)
```

Record or dispatch `"use-item"` actions in `botBattleUseItems`. Return paths include `used`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `combatServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `inventory`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L533)

<a id="function-function-mq3-game-bot-deathmatch-botcanandwantstorocketjump-function-botcanandwantstorocketjump-state-bot-src-mq3-game-bot-deathmatch-ml-1698342004"></a>
### botCanAndWantsToRocketJump

```ml
function botCanAndWantsToRocketJump(state, bot)
```

Forward `botCanAndWantsToRocketJump` to `mq3.game.bot_combat_ai.canAndWantsToRocketJump` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `combatServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `inventory` and `character`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L615)

<a id="function-function-mq3-game-bot-deathmatch-botcheckair-function-botcheckair-state-bot-src-mq3-game-bot-deathmatch-ml-904599490"></a>
### botCheckAir

```ml
function botCheckAir(state, bot)
```

Set `bot.lastairTime` to `state.now` in `mq3.game.bot_deathmatch.botCheckAir`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `combatServices` and `now`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `inventory`, `eye` and `lastairTime`. May update `bot.lastairTime` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L851)

<a id="function-function-mq3-game-bot-deathmatch-botcheckattack-function-botcheckattack-state-bot-src-mq3-game-bot-deathmatch-ml-70231672"></a>
### botCheckAttack

```ml
function botCheckAttack(state, bot)
```

Forward `botCheckAttack` to `mq3.game.bot_combat_ai.checkAttack` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `combatServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `enemy`, `character`, `enemySightTime`, `teleportTime` and `weaponchangeTime` and related fields. May update `bot.firethrottlewaitTime`, `bot.firethrottleshootTime` and `bot.combatFlags` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L708)

<a id="function-function-mq3-game-bot-deathmatch-botcheckconsolemessages-function-botcheckconsolemessages-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-1083829489"></a>
### botCheckConsoleMessages

```ml
function botCheckConsoleMessages(state, bot, retailActive)
```

Console/snapshot event layer.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `actions` and `hostActionFn`. May update `state.actions` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L807)

<a id="function-function-mq3-game-bot-deathmatch-botcheckevents-function-botcheckevents-state-bot-value-retailactive-src-mq3-game-bot-deathmatch-ml-442325290"></a>
### botCheckEvents

```ml
function botCheckEvents(state, bot, value, retailActive)
```

Record or dispatch `"obituary-death"`, `"obituary-kill"` and `"event"` actions in `botCheckEvents`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `entityEventTimes`, `now`, `lastTeleportOrigin` and `lastTeleportTime`. May update `state.entityEventTimes[value.number]`, `state.lastTeleportOrigin` and `state.lastTeleportTime` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`, `numDeaths`, `lastKilledPlayer`, `killedEnemyTime` and `numKills` and related fields. May update `bot.numDeaths`, `bot.lastKilledPlayer` and `bot.killedEnemyTime` and additional fields in place. |
| `value` | `dynamic` | — | Value record; accesses `number`, `eventTime`, `event`, `otherEntityNum` and `otherEntityNum2` and related fields. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L834)

<a id="function-function-mq3-game-bot-deathmatch-botcheckforgrenades-function-botcheckforgrenades-state-bot-value-retailactive-src-mq3-game-bot-deathmatch-ml-1818137784"></a>
### botCheckForGrenades

```ml
function botCheckForGrenades(state, bot, value, retailActive)
```

Record or dispatch `"avoid-spot"` actions in `botCheckForGrenades`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `actions` and `hostActionFn`. May update `state.actions` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `value` | `dynamic` | — | Value record; accesses `eType`, `weapon` and `origin`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L813)

<a id="function-function-mq3-game-bot-deathmatch-botcheckforkamikazebody-function-botcheckforkamikazebody-state-bot-value-src-mq3-game-bot-deathmatch-ml-431481745"></a>
### botCheckForKamikazeBody

```ml
function botCheckForKamikazeBody(state, bot, value)
```

Set `state.kamikazeBodies[bot.client]` to `value.number` in `mq3.game.bot_deathmatch.botCheckForKamikazeBody`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `kamikazeBodies`. May update `state.kamikazeBodies[bot.client]` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `value` | `dynamic` | — | Value record; accesses `flags` and `number`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L828)

<a id="function-function-mq3-game-bot-deathmatch-botcheckforproxmines-function-botcheckforproxmines-state-bot-value-retailactive-src-mq3-game-bot-deathmatch-ml-690709970"></a>
### botCheckForProxMines

```ml
function botCheckForProxMines(state, bot, value, retailActive)
```

Record or dispatch `"avoid-spot"` actions in `botCheckForProxMines`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `teamState`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `inventory`. |
| `value` | `dynamic` | — | Value record; accesses `eType`, `weapon`, `generic1` and `origin`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L819)

<a id="function-function-mq3-game-bot-deathmatch-botcheckitempickup-function-botcheckitempickup-state-bot-oldinventory-retailactive-src-mq3-game-bot-deathmatch-ml-1002456626"></a>
### botCheckItemPickup

```ml
function botCheckItemPickup(state, bot, oldInventory, retailActive)
```

Record or dispatch `"item-pickup-check"` actions in `botCheckItemPickup`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `actions` and `hostActionFn`. May update `state.actions` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `oldInventory` | `dynamic` | — | Sequence whose length bounds the iteration or lookup in `botCheckItemPickup`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L528)

<a id="function-function-mq3-game-bot-deathmatch-botchecksnapshot-function-botchecksnapshot-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-1865030049"></a>
### botCheckSnapshot

```ml
function botCheckSnapshot(state, bot, retailActive)
```

Record or dispatch `"avoid-clear"` actions in `botCheckSnapshot`. Return paths include `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `kamikazeBodies` and `snapshotEntities`. May update `state.kamikazeBodies[bot.client]` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L844)

<a id="function-function-mq3-game-bot-deathmatch-botchooseweapon-function-botchooseweapon-state-bot-src-mq3-game-bot-deathmatch-ml-979478320"></a>
### botChooseWeapon

```ml
function botChooseWeapon(state, bot)
```

Existing native inventory/combat/navigation implementations.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `inventoryServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `curPs`, `client`, `weaponnum`, `ws` and `inventory` and related fields. May update `bot.weaponchangeTime` and `bot.weaponnum` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L509)

<a id="function-function-mq3-game-bot-deathmatch-botclearactivategoalstack-function-botclearactivategoalstack-state-bot-src-mq3-game-bot-deathmatch-ml-1136574640"></a>
### botClearActivateGoalStack

```ml
function botClearActivateGoalStack(state, bot)
```

Forward `botClearActivateGoalStack` to `mq3.game.bot_navigation.clearActivateGoalStack` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `activateStackIndex`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L762)

<a id="function-function-mq3-game-bot-deathmatch-botcreatewaypoint-function-botcreatewaypoint-state-name-origin-areanum-src-mq3-game-bot-deathmatch-ml-305032633"></a>
### botCreateWayPoint

```ml
function botCreateWayPoint(state, name, origin, areanum)
```

Set `state.waypoints` to `[value]+state.waypoints` in `mq3.game.bot_deathmatch.botCreateWayPoint`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `waypoints`. May update `state.waypoints` in place. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `areanum` | `dynamic` | — | AAS area number; zero denotes no area. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L579)

<a id="function-function-mq3-game-bot-deathmatch-botctfcarryingflag-function-botctfcarryingflag-state-bot-src-mq3-game-bot-deathmatch-ml-1618124368"></a>
### botCTFCarryingFlag

```ml
function botCTFCarryingFlag(state, bot)
```

BotCTFCarryingFlag

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `combatServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `inventory`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L304)

<a id="function-function-mq3-game-bot-deathmatch-botctfretreatgoals-function-botctfretreatgoals-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-920941517"></a>
### botCTFRetreatGoals

```ml
function botCTFRetreatGoals(state, bot, retailActive)
```

Forward `botCTFRetreatGoals` to `mq3.game.bot_deathmatch.strategicGoal` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `strategyFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L419)

<a id="function-function-mq3-game-bot-deathmatch-botctfseekgoals-function-botctfseekgoals-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-266761961"></a>
### botCTFSeekGoals

```ml
function botCTFSeekGoals(state, bot, retailActive)
```

Forward `botCTFSeekGoals` to `mq3.game.bot_deathmatch.strategicGoal` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `strategyFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L414)

<a id="function-function-mq3-game-bot-deathmatch-botdeathmatchai-function-botdeathmatchai-state-bot-thinktime-src-mq3-game-bot-deathmatch-ml-820211143"></a>
### botDeathmatchAI

```ml
function botDeathmatchAI(state, bot, thinktime)
```

Set `bot.thinktime` to `thinktime` in `mq3.game.bot_deathmatch.botDeathmatchAI`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `deathmatchFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `thinktime`. May update `bot.thinktime` in place. |
| `thinktime` | `dynamic` | — | Bot thinking interval in seconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L869)

<a id="function-function-mq3-game-bot-deathmatch-botdontavoid-function-botdontavoid-state-bot-name-src-mq3-game-bot-deathmatch-ml-1383976739"></a>
### botDontAvoid

```ml
function botDontAvoid(state, bot, name)
```

Forward `botDontAvoid` to `mq3.game.bot_navigation.dontAvoid` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `gs`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L639)

<a id="function-function-mq3-game-bot-deathmatch-botenableactivategoalareas-function-botenableactivategoalareas-state-activategoal-enable-src-mq3-game-bot-deathmatch-ml-25390424"></a>
### botEnableActivateGoalAreas

```ml
function botEnableActivateGoalAreas(state, activategoal, enable)
```

Forward `botEnableActivateGoalAreas` to `mq3.game.bot_navigation.enableActivateGoalAreas` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `navigationServices`. |
| `activategoal` | `dynamic` | — | Activategoal record; accesses `areasdisabled`, `numareas` and `areas`. May update `activategoal.areasdisabled` in place. |
| `enable` | `dynamic` | — | Value used by `enableActivateGoalAreas` in `disabled=not enable`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L767)

<a id="function-function-mq3-game-bot-deathmatch-botenemycubecarriervisible-function-botenemycubecarriervisible-state-bot-src-mq3-game-bot-deathmatch-ml-1303348388"></a>
### botEnemyCubeCarrierVisible

```ml
function botEnemyCubeCarrierVisible(state, bot)
```

Forward `botEnemyCubeCarrierVisible` to `mq3.game.bot_deathmatch.carrierVisible` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `maxclients`, `entities` and `missionpack`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`, `entitynum`, `eye` and `viewangles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L700)

<a id="function-function-mq3-game-bot-deathmatch-botenemyflag-function-botenemyflag-state-bot-src-mq3-game-bot-deathmatch-ml-1346338988"></a>
### botEnemyFlag

```ml
function botEnemyFlag(state, bot)
```

BotEnemyFlag and BotTeamFlag

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `blueFlag` and `redFlag`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L325)

<a id="function-function-mq3-game-bot-deathmatch-botenemyflagcarriervisible-function-botenemyflagcarriervisible-state-bot-src-mq3-game-bot-deathmatch-ml-342264084"></a>
### botEnemyFlagCarrierVisible

```ml
function botEnemyFlagCarrierVisible(state, bot)
```

Forward `botEnemyFlagCarrierVisible` to `mq3.game.bot_deathmatch.carrierVisible` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `maxclients`, `entities` and `missionpack`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`, `entitynum`, `eye` and `viewangles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L685)

<a id="function-function-mq3-game-bot-deathmatch-botentityvisible-function-botentityvisible-state-viewer-eye-viewangles-fov-ent-src-mq3-game-bot-deathmatch-ml-307646783"></a>
### botEntityVisible

```ml
function botEntityVisible(state, viewer, eye, viewangles, fov, ent)
```

Use `state.visibleFn` to perform `botEntityVisible`. Return paths include `0.0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `visibleFn` and `entities`. |
| `viewer` | `dynamic` | — | Entity number ignored by the visibility trace. |
| `eye` | `dynamic` | — | Value passed as argument 3 to `state.visibleFn`. |
| `viewangles` | `dynamic` | — | Value passed as argument 4 to `state.visibleFn`. |
| `fov` | `dynamic` | — | Value passed as argument 5 to `state.visibleFn`. |
| `ent` | `dynamic` | — | Value passed as argument 6 to `state.visibleFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L660)

<a id="function-function-mq3-game-bot-deathmatch-botfeelingbad-function-botfeelingbad-state-bot-src-mq3-game-bot-deathmatch-ml-1544753888"></a>
### botFeelingBad

```ml
function botFeelingBad(state, bot)
```

Forward `botFeelingBad` to `mq3.game.bot_combat_ai.feelingBad` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Not read by this implementation; retained in the `botFeelingBad` signature. |
| `bot` | `dynamic` | — | Bot AI state; accesses `weaponnum` and `inventory`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L599)

<a id="function-function-mq3-game-bot-deathmatch-botfindenemy-function-botfindenemy-state-bot-curenemy-src-mq3-game-bot-deathmatch-ml-1586427570"></a>
### botFindEnemy

```ml
function botFindEnemy(state, bot, curenemy)
```

Forward `botFindEnemy` to `mq3.game.bot_combat_ai.findEnemy` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `combatServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `character`, `lastHealth`, `inventory`, `origin` and `client` and related fields. May update `bot.lastHealth`, `bot.enemy` and `bot.enemySightTime` and additional fields in place. |
| `curenemy` | `dynamic` | — | Value passed as argument 2 to `services.entityInfoFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L665)

<a id="function-function-mq3-game-bot-deathmatch-botfindwaypoint-function-botfindwaypoint-state-waypoints-name-src-mq3-game-bot-deathmatch-ml-1175043908"></a>
### botFindWayPoint

```ml
function botFindWayPoint(state, waypoints, name)
```

Find a waypoint by ASCII case-insensitive name and return void when absent.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Not read by this implementation; retained in the `botFindWayPoint` signature. |
| `waypoints` | `dynamic` | — | Value used by `botFindWayPoint` in `for each item in waypoints if strings.toLowerAscii(item.name)==wanted then return item end if end for`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L584)

<a id="function-function-mq3-game-bot-deathmatch-botfreewaypoints-function-botfreewaypoints-state-waypoints-src-mq3-game-bot-deathmatch-ml-1485442065"></a>
### botFreeWaypoints

```ml
function botFreeWaypoints(state, waypoints)
```

Set `state.waypoints` to `[]` in `mq3.game.bot_deathmatch.botFreeWaypoints`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `waypoints`. May update `state.waypoints` in place. |
| `waypoints` | `dynamic` | — | Value used by `botFreeWaypoints` in `state.waypoints=[]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L588)

<a id="function-function-mq3-game-bot-deathmatch-botfuncbuttonactivategoal-function-botfuncbuttonactivategoal-state-bot-bspent-activategoal-src-mq3-game-bot-deathmatch-ml-648216642"></a>
### botFuncButtonActivateGoal

```ml
function botFuncButtonActivateGoal(state, bot, bspent, activategoal)
```

Forward `botFuncButtonActivateGoal` to `mq3.game.bot_navigation.getActivateGoal` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `areanum`, `origin` and `tfl`. |
| `bspent` | `dynamic` | — | Value used by `getActivateGoal` in `info=need(services.entityInfoFn,"BotEntityInfo")(services,entitynum)`. |
| `activategoal` | `dynamic` | — | Activategoal record; accesses `numareas` and `areas`. May update `activategoal.areas` and `activategoal.numareas` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L731)

<a id="function-function-mq3-game-bot-deathmatch-botfuncdooractivategoal-function-botfuncdooractivategoal-state-bot-bspent-activategoal-src-mq3-game-bot-deathmatch-ml-1291690462"></a>
### botFuncDoorActivateGoal

```ml
function botFuncDoorActivateGoal(state, bot, bspent, activategoal)
```

Forward `botFuncDoorActivateGoal` to `mq3.game.bot_navigation.getActivateGoal` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `areanum`, `origin` and `tfl`. |
| `bspent` | `dynamic` | — | Value used by `getActivateGoal` in `info=need(services.entityInfoFn,"BotEntityInfo")(services,entitynum)`. |
| `activategoal` | `dynamic` | — | Activategoal record; accesses `numareas` and `areas`. May update `activategoal.areas` and `activategoal.numareas` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L737)

<a id="function-function-mq3-game-bot-deathmatch-botgetactivategoal-function-botgetactivategoal-state-bot-entitynum-activategoal-src-mq3-game-bot-deathmatch-ml-479939289"></a>
### botGetActivateGoal

```ml
function botGetActivateGoal(state, bot, entitynum, activategoal)
```

Forward `botGetActivateGoal` to `mq3.game.bot_navigation.getActivateGoal` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `areanum`, `origin` and `tfl`. |
| `entitynum` | `dynamic` | — | Value used by `getActivateGoal` in `info=need(services.entityInfoFn,"BotEntityInfo")(services,entitynum)`. |
| `activategoal` | `dynamic` | — | Activategoal record; accesses `numareas` and `areas`. May update `activategoal.areas` and `activategoal.numareas` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L749)

<a id="function-function-mq3-game-bot-deathmatch-botgetalternateroutegoal-function-botgetalternateroutegoal-state-bot-base-src-mq3-game-bot-deathmatch-ml-666852481"></a>
### botGetAlternateRouteGoal

```ml
function botGetAlternateRouteGoal(state, bot, base)
```

Forward `botGetAlternateRouteGoal` to `mq3.game.bot_navigation.getAlternateRouteGoal` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `navigationServices`, `redAltGoals` and `blueAltGoals`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `altRouteGoal` and `reachedAltRouteGoalTime`. May update `bot.altRouteGoal` and `bot.reachedAltRouteGoalTime` in place. |
| `base` | `dynamic` | — | Value used by `getAlternateRouteGoal` in `if base==TEAM_RED then goals=redGoals end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L861)

<a id="function-function-mq3-game-bot-deathmatch-botgoalforbspentity-function-botgoalforbspentity-state-classname-value-src-mq3-game-bot-deathmatch-ml-136843383"></a>
### botGoalForBSPEntity

```ml
function botGoalForBSPEntity(state, classname, value)
```

Set `value.origin` to `ent.origin+[ ]` and `value.areanum` to `botPointAreaNum(state,ent.origin)` in `mq3.game.bot_deathmatch.botGoalForBSPEntity`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `bspEntities`. |
| `classname` | `dynamic` | — | Value passed as argument 1 to `std.string.toLowerAscii`. |
| `value` | `dynamic` | — | Value record; accesses `origin` and `areanum`. May update `value.origin` and `value.areanum` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L892)

<a id="function-function-mq3-game-bot-deathmatch-botgocamp-function-botgocamp-state-bot-value-src-mq3-game-bot-deathmatch-ml-1376524619"></a>
### botGoCamp

```ml
function botGoCamp(state, bot, value)
```

Forward `botGoCamp` to `mq3.game.bot_navigation.goCamp` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `decisionmaker`, `client`, `teammessageTime`, `ltgtype` and `teamGoal` and related fields. May update `bot.decisionmaker`, `bot.teammessageTime` and `bot.ltgtype` and additional fields in place. |
| `value` | `dynamic` | — | Bot navigation goal; accesses `areanum`, `entitynum`, `origin`, `mins` and `maxs` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L630)

<a id="function-function-mq3-game-bot-deathmatch-botgoforactivategoal-function-botgoforactivategoal-state-bot-activategoal-src-mq3-game-bot-deathmatch-ml-637898538"></a>
### botGoForActivateGoal

```ml
function botGoForActivateGoal(state, bot, activategoal)
```

Forward `botGoForActivateGoal` to `mq3.game.bot_navigation.goForActivateGoal` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `activateGoalHeap` and `activateStackIndex`. May update `bot.activateGoalHeap[best]` and `bot.activateStackIndex` in place. |
| `activategoal` | `dynamic` | — | Activategoal record; accesses `inuse`, `time`, `startTime`, `goal` and `origin`. May update `activategoal.inuse`, `activategoal.time` and `activategoal.startTime` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L777)

<a id="function-function-mq3-game-bot-deathmatch-botgoforpowerups-function-botgoforpowerups-state-bot-src-mq3-game-bot-deathmatch-ml-736653480"></a>
### botGoForPowerups

```ml
function botGoForPowerups(state, bot)
```

Forward `botGoForPowerups` to `mq3.game.bot_navigation.goForPowerups` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ltgTime`. May update `bot.ltgTime` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L643)

<a id="function-function-mq3-game-bot-deathmatch-botgoharvest-function-botgoharvest-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-790118585"></a>
### botGoHarvest

```ml
function botGoHarvest(state, bot, retailActive)
```

Set `bot.ltgtype` to `12` and `bot.teamgoalTime` to `state.now+120.0` in `mq3.game.bot_deathmatch.botGoHarvest`. Return paths include `strategicGoal(state,bot,"harvest",false,retailActive)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `now`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ltgtype` and `teamgoalTime`. May update `bot.ltgtype` and `bot.teamgoalTime` in place. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L444)

<a id="function-function-mq3-game-bot-deathmatch-botharvestercarryingcubes-function-botharvestercarryingcubes-state-bot-src-mq3-game-bot-deathmatch-ml-2110732752"></a>
### botHarvesterCarryingCubes

```ml
function botHarvesterCarryingCubes(state, bot)
```

BotHarvesterCarryingCubes

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `gametype`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `inventory`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L308)

<a id="function-function-mq3-game-bot-deathmatch-botharvesterretreatgoals-function-botharvesterretreatgoals-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-941188889"></a>
### botHarvesterRetreatGoals

```ml
function botHarvesterRetreatGoals(state, bot, retailActive)
```

Forward `botHarvesterRetreatGoals` to `mq3.game.bot_deathmatch.strategicGoal` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `strategyFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L454)

<a id="function-function-mq3-game-bot-deathmatch-botharvesterseekgoals-function-botharvesterseekgoals-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-427194531"></a>
### botHarvesterSeekGoals

```ml
function botHarvesterSeekGoals(state, bot, retailActive)
```

Forward `botHarvesterSeekGoals` to `mq3.game.bot_deathmatch.strategicGoal` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `strategyFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L449)

<a id="function-function-mq3-game-bot-deathmatch-bothaspersistantpowerupandweapon-function-bothaspersistantpowerupandweapon-state-bot-src-mq3-game-bot-deathmatch-ml-811946204"></a>
### botHasPersistantPowerupAndWeapon

```ml
function botHasPersistantPowerupAndWeapon(state, bot)
```

Check whether health, armor, powerup and ammunition reserves support an aggressive bot task.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `missionpack`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `inventory`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L619)

<a id="function-function-mq3-game-bot-deathmatch-botinitwaypoints-function-botinitwaypoints-state-src-mq3-game-bot-deathmatch-ml-683233717"></a>
### botInitWaypoints

```ml
function botInitWaypoints(state)
```

Waypoint pool/lifecycle.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `waypoints`. May update `state.waypoints` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L573)

<a id="function-function-mq3-game-bot-deathmatch-botinlavaorslime-function-botinlavaorslime-state-bot-src-mq3-game-bot-deathmatch-ml-1512419696"></a>
### botInLavaOrSlime

```ml
function botInLavaOrSlime(state, bot)
```

Forward `botInLavaOrSlime` to `mq3.game.bot_combat_ai.inLavaOrSlime` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `combatServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `origin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L569)

<a id="function-function-mq3-game-bot-deathmatch-botintermission-function-botintermission-state-bot-src-mq3-game-bot-deathmatch-ml-1705939934"></a>
### botIntermission

```ml
function botIntermission(state, bot)
```

Apply `mq3.game.bot_deathmatch.sync` and `mq3.game.bot_combat_ai.intermission` while evaluating `botIntermission`. Return paths include `combat.intermission(state.combatServices,bot)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `combatServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `curPs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L565)

<a id="function-function-mq3-game-bot-deathmatch-botisdead-function-botisdead-state-bot-src-mq3-game-bot-deathmatch-ml-1146076366"></a>
### botIsDead

```ml
function botIsDead(state, bot)
```

Forward `botIsDead` to `mq3.game.bot_combat_ai.isDead` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Not read by this implementation; retained in the `botIsDead` signature. |
| `bot` | `dynamic` | — | Bot AI state; accesses `curPs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L557)

<a id="function-function-mq3-game-bot-deathmatch-botisgoingtoactivateentity-function-botisgoingtoactivateentity-state-bot-entitynum-src-mq3-game-bot-deathmatch-ml-2133325695"></a>
### botIsGoingToActivateEntity

```ml
function botIsGoingToActivateEntity(state, bot, entitynum)
```

Forward `botIsGoingToActivateEntity` to `mq3.game.bot_navigation.isGoingToActivateEntity` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `activateStackIndex` and `activateGoalHeap`. |
| `entitynum` | `dynamic` | — | Value used by `isGoingToActivateEntity` in `if goal.time>=need(services.floatTimeFn,"FloatTime")(services) and goal.goal.entitynum==entitynum then return tr...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L772)

<a id="function-function-mq3-game-bot-deathmatch-botisobserver-function-botisobserver-state-bot-src-mq3-game-bot-deathmatch-ml-1443998658"></a>
### botIsObserver

```ml
function botIsObserver(state, bot)
```

Test `bot.curPs.pm_type==c.PM_SPECTATOR` as the condition for `botIsObserver`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Not read by this implementation; retained in the `botIsObserver` signature. |
| `bot` | `dynamic` | — | Bot AI state; accesses `curPs`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L561)

<a id="function-function-mq3-game-bot-deathmatch-botmapscripts-function-botmapscripts-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-986668055"></a>
### botMapScripts

```ml
function botMapScripts(state, bot, retailActive)
```

Map, movers and activation.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `mapname`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `tfl`. May update `bot.tfl` in place. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L714)

<a id="function-function-mq3-game-bot-deathmatch-botmodelminsmaxs-function-botmodelminsmaxs-state-modelindex-etype-contents-src-mq3-game-bot-deathmatch-ml-700149437"></a>
### botModelMinsMaxs

```ml
function botModelMinsMaxs(state, modelindex, eType, contents)
```

Find a matching model entity and return its number and world-space bounding box, or an empty result when absent.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `entities`. |
| `modelindex` | `dynamic` | — | Value used by `botModelMinsMaxs` in `for each value in state.entities if value.valid and value.modelindex==modelindex and (eType==0 or value.eType==e...`. |
| `eType` | `dynamic` | — | Value used by `botModelMinsMaxs` in `for each value in state.entities if value.valid and value.modelindex==modelindex and (eType==0 or value.eType==e...`. |
| `contents` | `dynamic` | — | Value used by `botModelMinsMaxs` in `for each value in state.entities if value.valid and value.modelindex==modelindex and (eType==0 or value.eType==e...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L723)

<a id="function-function-mq3-game-bot-deathmatch-botobeliskretreatgoals-function-botobeliskretreatgoals-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-1089601625"></a>
### botObeliskRetreatGoals

```ml
function botObeliskRetreatGoals(state, bot, retailActive)
```

Forward `botObeliskRetreatGoals` to `mq3.game.bot_deathmatch.strategicGoal` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `strategyFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L439)

<a id="function-function-mq3-game-bot-deathmatch-botobeliskseekgoals-function-botobeliskseekgoals-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-1399869941"></a>
### botObeliskSeekGoals

```ml
function botObeliskSeekGoals(state, bot, retailActive)
```

Forward `botObeliskSeekGoals` to `mq3.game.bot_deathmatch.strategicGoal` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `strategyFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L434)

<a id="function-function-mq3-game-bot-deathmatch-botoppositeteam-function-botoppositeteam-state-bot-src-mq3-game-bot-deathmatch-ml-135182662"></a>
### botOppositeTeam

```ml
function botOppositeTeam(state, bot)
```

Apply `mq3.game.bot_deathmatch.sync` and `mq3.game.bot_team_helpers.oppositeTeam` while evaluating `botOppositeTeam`. Return paths include `teams.oppositeTeam(state.teamState,bot)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `teamState`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L316)

<a id="function-function-mq3-game-bot-deathmatch-botpointareanum-function-botpointareanum-state-origin-src-mq3-game-bot-deathmatch-ml-1013396011"></a>
### botPointAreaNum

```ml
function botPointAreaNum(state, origin)
```

Client and string helpers.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `pointAreaFn` and `traceAreasFn`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L470)

<a id="function-function-mq3-game-bot-deathmatch-botpopfromactivategoalstack-function-botpopfromactivategoalstack-state-bot-src-mq3-game-bot-deathmatch-ml-338195668"></a>
### botPopFromActivateGoalStack

```ml
function botPopFromActivateGoalStack(state, bot)
```

Forward `botPopFromActivateGoalStack` to `mq3.game.bot_navigation.popActivateGoal` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `activateStackIndex` and `activateGoalHeap`. May update `bot.activateStackIndex` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L753)

<a id="function-function-mq3-game-bot-deathmatch-botprintactivategoalinfo-function-botprintactivategoalinfo-state-bot-activategoal-bspent-retailactive-src-mq3-game-bot-deathmatch-ml-292208673"></a>
### botPrintActivateGoalInfo

```ml
function botPrintActivateGoalInfo(state, bot, activategoal, bspent, retailActive)
```

Record or dispatch `"activate-info"` actions in `botPrintActivateGoalInfo`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `actions` and `hostActionFn`. May update `state.actions` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `activategoal` | `dynamic` | — | Activategoal record; accesses `goal`. |
| `bspent` | `dynamic` | — | Value passed as argument 1 to `str`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L784)

<a id="function-function-mq3-game-bot-deathmatch-botpushontoactivategoalstack-function-botpushontoactivategoalstack-state-bot-activategoal-src-mq3-game-bot-deathmatch-ml-428704202"></a>
### botPushOntoActivateGoalStack

```ml
function botPushOntoActivateGoalStack(state, bot, activategoal)
```

Forward `botPushOntoActivateGoalStack` to `mq3.game.bot_navigation.pushActivateGoal` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `activateGoalHeap` and `activateStackIndex`. May update `bot.activateGoalHeap[best]` and `bot.activateStackIndex` in place. |
| `activategoal` | `dynamic` | — | Parser source state; accesses `goal`, `areas`, `inuse`, `time` and `startTime` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L758)

<a id="function-function-mq3-game-bot-deathmatch-botrandommove-function-botrandommove-state-bot-moveresult-src-mq3-game-bot-deathmatch-ml-1682619946"></a>
### botRandomMove

```ml
function botRandomMove(state, bot, moveresult)
```

Forward `botRandomMove` to `mq3.game.bot_navigation.randomMove` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ms`. |
| `moveresult` | `dynamic` | — | Moveresult record; accesses `failure` and `movedir`. May update `moveresult.failure` and `moveresult.movedir` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L789)

<a id="function-function-mq3-game-bot-deathmatch-botrefuseorder-function-botrefuseorder-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-1458534181"></a>
### botRefuseOrder

```ml
function botRefuseOrder(state, bot, retailActive)
```

BotRefuseOrder

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `orderTimes` and `now`. May update `state.orderTimes[bot.client]` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client` and `ordered`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L396)

<a id="function-function-mq3-game-bot-deathmatch-botrememberlastorderedtask-function-botrememberlastorderedtask-state-bot-src-mq3-game-bot-deathmatch-ml-213209232"></a>
### botRememberLastOrderedTask

```ml
function botRememberLastOrderedTask(state, bot)
```

BotRememberLastOrderedTask

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `lastTasks`. May update `state.lastTasks[bot.client]` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ordered`, `client`, `decisionmaker`, `ltgtype` and `teamGoal` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L372)

<a id="function-function-mq3-game-bot-deathmatch-botroamgoal-function-botroamgoal-state-bot-src-mq3-game-bot-deathmatch-ml-482082278"></a>
### botRoamGoal

```ml
function botRoamGoal(state, bot)
```

Choose a point one hundred units around the bot using the supplied random angle while preserving its height.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `randomValue`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `origin`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L647)

<a id="function-function-mq3-game-bot-deathmatch-botsameteam-function-botsameteam-state-bot-entitynumber-src-mq3-game-bot-deathmatch-ml-367844770"></a>
### botSameTeam

```ml
function botSameTeam(state, bot, entityNumber)
```

Apply `mq3.game.bot_deathmatch.sync` and `mq3.game.bot_team_helpers.sameTeam` while evaluating `botSameTeam`. Return paths include `teams.sameTeam(state.teamState,bot,entityNumber)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `teamState`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `entityNumber` | `dynamic` | — | Entity number in the game entity table. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L321)

<a id="function-function-mq3-game-bot-deathmatch-botsetentitynumforgoal-function-botsetentitynumforgoal-state-value-classname-src-mq3-game-bot-deathmatch-ml-1833605121"></a>
### botSetEntityNumForGoal

```ml
function botSetEntityNumForGoal(state, value, classname)
```

Set `value.entitynum` to `ent.number` in `mq3.game.bot_deathmatch.botSetEntityNumForGoal`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `entities`. |
| `value` | `dynamic` | — | Value record; accesses `origin` and `entitynum`. May update `value.entitynum` in place. |
| `classname` | `dynamic` | — | Value passed as argument 1 to `std.string.toLowerAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L884)

<a id="function-function-mq3-game-bot-deathmatch-botsetentitynumforgoalwithmodel-function-botsetentitynumforgoalwithmodel-state-value-etype-modelname-src-mq3-game-bot-deathmatch-ml-262189745"></a>
### botSetEntityNumForGoalWithModel

```ml
function botSetEntityNumForGoalWithModel(state, value, eType, modelname)
```

Set `value.entitynum` to `ent.number` in `mq3.game.bot_deathmatch.botSetEntityNumForGoalWithModel`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `entities`. |
| `value` | `dynamic` | — | Value record; accesses `origin` and `entitynum`. May update `value.entitynum` in place. |
| `eType` | `dynamic` | — | Value used by `botSetEntityNumForGoalWithModel` in `for each ent in state.entities if ent.valid and (eType==0 or ent.eType==eType) and ent.modelindex==wanted and di...`. |
| `modelname` | `dynamic` | — | Sequence whose length bounds the iteration or lookup in `botSetEntityNumForGoalWithModel`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L876)

<a id="function-function-mq3-game-bot-deathmatch-botsetlastorderedtask-function-botsetlastorderedtask-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-256025375"></a>
### botSetLastOrderedTask

```ml
function botSetLastOrderedTask(state, bot, retailActive)
```

BotSetLastOrderedTask

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `lastTasks`, `gametype` and `now`. May update `state.lastTasks[bot.client]` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`, `redflagstatus`, `blueflagstatus`, `decisionmaker` and `ordered` and related fields. May update `bot.decisionmaker`, `bot.ordered` and `bot.ltgtype` and additional fields in place. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L387)

<a id="function-function-mq3-game-bot-deathmatch-botsetmovedir-function-botsetmovedir-angles-src-mq3-game-bot-deathmatch-ml-357204744"></a>
### botSetMovedir

```ml
function botSetMovedir(angles)
```

Forward `botSetMovedir` to `mq3.game.bot_navigation.setMovedir` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angles` | `dynamic` | — | Pitch, yaw and roll angles in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L717)

<a id="function-function-mq3-game-bot-deathmatch-botsetteamstatus-function-botsetteamstatus-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-642751113"></a>
### botSetTeamStatus

```ml
function botSetTeamStatus(state, bot, retailActive)
```

BotSetTeamStatus

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `actions` and `hostActionFn`. May update `state.actions` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ltgtype`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L379)

<a id="function-function-mq3-game-bot-deathmatch-botsetteleporttime-function-botsetteleporttime-state-bot-src-mq3-game-bot-deathmatch-ml-1788206848"></a>
### botSetTeleportTime

```ml
function botSetTeleportTime(state, bot)
```

Set `state.combatServices.floatTimeFn` to `nowFn` and `state.combatServices.context` to `state` in `mq3.game.bot_deathmatch.botSetTeleportTime`. Return paths include `combat.setTeleportTime(state.combatServices,bot)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `combatServices`. May update `state.combatServices.floatTimeFn` and `state.combatServices.context` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `curPs`, `lastEFlags` and `teleportTime`. May update `bot.teleportTime` and `bot.lastEFlags` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L550)

<a id="function-function-mq3-game-bot-deathmatch-botsetupalternativeroutegoals-function-botsetupalternativeroutegoals-state-src-mq3-game-bot-deathmatch-ml-615240513"></a>
### botSetupAlternativeRouteGoals

```ml
function botSetupAlternativeRouteGoals(state)
```

Record or dispatch `"alternate-route-setup"` actions in `botSetupAlternativeRouteGoals`. Return paths include `len(state.redAltGoals)+len(state.blueAltGoals)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `setup`, `redAltGoals` and `blueAltGoals`. May update `state.setup` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L864)

<a id="function-function-mq3-game-bot-deathmatch-botsetupdeathmatchai-function-botsetupdeathmatchai-state-retailactive-src-mq3-game-bot-deathmatch-ml-896670240"></a>
### botSetupDeathmatchAI

```ml
function botSetupDeathmatchAI(state, retailActive)
```

Record or dispatch `"deathmatch-setup"` actions in `botSetupDeathmatchAI`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `setup`, `maxBspModelIndex`, `bspEntities`, `mapname` and `gametype`. May update `state.setup` and `state.maxBspModelIndex` in place. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L898)

<a id="function-function-mq3-game-bot-deathmatch-botsetupformovement-function-botsetupformovement-state-bot-src-mq3-game-bot-deathmatch-ml-633219648"></a>
### botSetupForMovement

```ml
function botSetupForMovement(state, bot)
```

Forward `botSetupForMovement` to `mq3.game.bot_navigation.setupForMovement` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `curPs`, `entitynum`, `client`, `thinktime` and `viewangles` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L513)

<a id="function-function-mq3-game-bot-deathmatch-botsetuserinfo-function-botsetuserinfo-state-bot-key-value-retailactive-src-mq3-game-bot-deathmatch-ml-589310157"></a>
### botSetUserInfo

```ml
function botSetUserInfo(state, bot, key, value, retailActive)
```

BotSetUserInfo

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `actions` and `hostActionFn`. May update `state.actions` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |
| `value` | `dynamic` | — | Value used by `botSetUserInfo` in `emit(state,"userinfo",bot,key+"="+value,0,[],retailActive)`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L368)

<a id="function-function-mq3-game-bot-deathmatch-botshutdowndeathmatchai-function-botshutdowndeathmatchai-state-src-mq3-game-bot-deathmatch-ml-1003289329"></a>
### botShutdownDeathmatchAI

```ml
function botShutdownDeathmatchAI(state)
```

Update `state.setup`, `state.redAltGoals` and `state.blueAltGoals` during `botShutdownDeathmatchAI`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `setup`, `redAltGoals` and `blueAltGoals`. May update `state.setup`, `state.redAltGoals` and `state.blueAltGoals` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L901)

<a id="function-function-mq3-game-bot-deathmatch-botsynonymcontext-function-botsynonymcontext-state-bot-src-mq3-game-bot-deathmatch-ml-1177983046"></a>
### botSynonymContext

```ml
function botSynonymContext(state, bot)
```

Apply `mq3.game.bot_deathmatch.teamValue` while evaluating `botSynonymContext`. Return paths include `context`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `gametype`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L504)

<a id="function-function-mq3-game-bot-deathmatch-botteam-function-botteam-state-bot-src-mq3-game-bot-deathmatch-ml-109247032"></a>
### botTeam

```ml
function botTeam(state, bot)
```

BotTeam, BotOppositeTeam and BotSameTeam

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `teamState`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L312)

<a id="function-function-mq3-game-bot-deathmatch-botteamcubecarriervisible-function-botteamcubecarriervisible-state-bot-src-mq3-game-bot-deathmatch-ml-1914956834"></a>
### botTeamCubeCarrierVisible

```ml
function botTeamCubeCarrierVisible(state, bot)
```

Forward `botTeamCubeCarrierVisible` to `mq3.game.bot_deathmatch.carrierVisible` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `maxclients`, `entities` and `missionpack`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`, `entitynum`, `eye` and `viewangles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L696)

<a id="function-function-mq3-game-bot-deathmatch-botteamflag-function-botteamflag-state-bot-src-mq3-game-bot-deathmatch-ml-359605496"></a>
### botTeamFlag

```ml
function botTeamFlag(state, bot)
```

Apply `mq3.game.bot_deathmatch.teamValue` while evaluating `botTeamFlag`. Return paths include `state.blueFlag`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `redFlag` and `blueFlag`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L329)

<a id="function-function-mq3-game-bot-deathmatch-botteamflagcarrier-function-botteamflagcarrier-state-bot-src-mq3-game-bot-deathmatch-ml-471852400"></a>
### botTeamFlagCarrier

```ml
function botTeamFlagCarrier(state, bot)
```

Apply `mq3.game.bot_deathmatch.botSameTeam` and `mq3.game.bot_deathmatch.entityCarriesFlagMode` while evaluating `botTeamFlagCarrier`. Return paths include `-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `maxclients`, `entities` and `missionpack`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L681)

<a id="function-function-mq3-game-bot-deathmatch-botteamflagcarriervisible-function-botteamflagcarriervisible-state-bot-src-mq3-game-bot-deathmatch-ml-343464464"></a>
### botTeamFlagCarrierVisible

```ml
function botTeamFlagCarrierVisible(state, bot)
```

Forward `botTeamFlagCarrierVisible` to `mq3.game.bot_deathmatch.carrierVisible` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `maxclients`, `entities` and `missionpack`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`, `entitynum`, `eye` and `viewangles`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L677)

<a id="function-function-mq3-game-bot-deathmatch-botteamgoals-function-botteamgoals-state-bot-retreat-retailactive-src-mq3-game-bot-deathmatch-ml-553265732"></a>
### botTeamGoals

```ml
function botTeamGoals(state, bot, retreat, retailActive)
```

BotTeamGoals

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `gametype`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `retreat` | `dynamic` | — | Value used by `botTeamGoals` in `if state.gametype==GT_CTF then if retreat then return botCTFRetreatGoals(state,bot,retailActive) end if`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L460)

<a id="function-function-mq3-game-bot-deathmatch-bottriggermultipleactivategoal-function-bottriggermultipleactivategoal-state-bot-bspent-activategoal-src-mq3-game-bot-deathmatch-ml-1020619020"></a>
### botTriggerMultipleActivateGoal

```ml
function botTriggerMultipleActivateGoal(state, bot, bspent, activategoal)
```

Forward `botTriggerMultipleActivateGoal` to `mq3.game.bot_navigation.getActivateGoal` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `areanum`, `origin` and `tfl`. |
| `bspent` | `dynamic` | — | Value used by `getActivateGoal` in `info=need(services.entityInfoFn,"BotEntityInfo")(services,entitynum)`. |
| `activategoal` | `dynamic` | — | Activategoal record; accesses `numareas` and `areas`. May update `activategoal.areas` and `activategoal.numareas` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L743)

<a id="function-function-mq3-game-bot-deathmatch-botupdatebattleinventory-function-botupdatebattleinventory-state-bot-enemy-src-mq3-game-bot-deathmatch-ml-479106914"></a>
### botUpdateBattleInventory

```ml
function botUpdateBattleInventory(state, bot, enemy)
```

Forward `botUpdateBattleInventory` to `mq3.game.bot_inventory_ai.updateBattleInventory` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `inventoryServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `origin` and `inventory`. May update `bot.inventory[ENEMY_HEIGHT]` and `bot.inventory[ENEMY_HORIZONTAL_DIST]` in place. |
| `enemy` | `dynamic` | — | Value passed as argument 2 to `services.entityInfoFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L518)

<a id="function-function-mq3-game-bot-deathmatch-botupdateinventory-function-botupdateinventory-state-bot-src-mq3-game-bot-deathmatch-ml-677360192"></a>
### botUpdateInventory

```ml
function botUpdateInventory(state, bot)
```

Forward `botUpdateInventory` to `mq3.game.bot_inventory_ai.updateInventory` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `inventoryServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `inventory` and `curPs`. May update `bot.inventory[INVENTORY_ARMOR]`, `bot.inventory[INVENTORY_GAUNTLET]` and `bot.inventory[INVENTORY_SHOTGUN]` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L522)

<a id="function-function-mq3-game-bot-deathmatch-botuseinvulnerability-function-botuseinvulnerability-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-2129144507"></a>
### botUseInvulnerability

```ml
function botUseInvulnerability(state, bot, retailActive)
```

Record or dispatch `"use-item"` actions in `botUseInvulnerability`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `actions` and `hostActionFn`. May update `state.actions` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `inventory`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L546)

<a id="function-function-mq3-game-bot-deathmatch-botusekamikaze-function-botusekamikaze-state-bot-retailactive-src-mq3-game-bot-deathmatch-ml-1999922809"></a>
### botUseKamikaze

```ml
function botUseKamikaze(state, bot, retailActive)
```

Record or dispatch `"use-item"` actions in `botUseKamikaze`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `combatServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `inventory`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L541)

<a id="function-function-mq3-game-bot-deathmatch-botvisibleteammatesandenemies-function-botvisibleteammatesandenemies-state-bot-range-src-mq3-game-bot-deathmatch-ml-44090261"></a>
### botVisibleTeamMatesAndEnemies

```ml
function botVisibleTeamMatesAndEnemies(state, bot, range)
```

Apply `mq3.game.bot_deathmatch.distanceSquared`, `mq3.game.bot_deathmatch.botEntityVisible` and `mq3.game.bot_deathmatch.botSameTeam` while evaluating `botVisibleTeamMatesAndEnemies`. Return paths include `[teammates,enemies]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `maxclients` and `entities`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`, `origin`, `entitynum`, `eye` and `viewangles`. |
| `range` | `dynamic` | — | Value used by `botVisibleTeamMatesAndEnemies` in `for i=0 to state.maxclients-1 if i!=bot.client and state.entities[i].valid and distanceSquared(bot.origin,state....`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L690)

<a id="function-function-mq3-game-bot-deathmatch-botwantstocamp-function-botwantstocamp-state-bot-src-mq3-game-bot-deathmatch-ml-1662188480"></a>
### botWantsToCamp

```ml
function botWantsToCamp(state, bot)
```

Forward `botWantsToCamp` to `mq3.game.bot_navigation.wantsToCamp` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `navigationServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `character`, `ltgtype`, `campTime`, `inventory` and `areanum` and related fields. May update `bot.campTime` and `bot.ordered` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L634)

<a id="function-function-mq3-game-bot-deathmatch-botwantstochase-function-botwantstochase-state-bot-src-mq3-game-bot-deathmatch-ml-50765606"></a>
### botWantsToChase

```ml
function botWantsToChase(state, bot)
```

Apply `mq3.game.bot_deathmatch.sync` and `mq3.game.bot_combat_ai.wantsToChase` while evaluating `botWantsToChase`. Return paths include `combat.wantsToChase(state.combatServices,bot)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `combatServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `enemy` and `ltgtype`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L607)

<a id="function-function-mq3-game-bot-deathmatch-botwantstohelp-function-botwantstohelp-state-bot-src-mq3-game-bot-deathmatch-ml-150397552"></a>
### botWantsToHelp

```ml
function botWantsToHelp(state, bot)
```

Return `true` for `botWantsToHelp`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Not read by this implementation; retained in the `botWantsToHelp` signature. |
| `bot` | `dynamic` | — | Not read by this implementation; retained in the `botWantsToHelp` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L611)

<a id="function-function-mq3-game-bot-deathmatch-botwantstoretreat-function-botwantstoretreat-state-bot-src-mq3-game-bot-deathmatch-ml-560850472"></a>
### botWantsToRetreat

```ml
function botWantsToRetreat(state, bot)
```

Apply `mq3.game.bot_deathmatch.sync` and `mq3.game.bot_combat_ai.wantsToRetreat` while evaluating `botWantsToRetreat`. Return paths include `combat.wantsToRetreat(state.combatServices,bot)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `combatServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `enemy` and `ltgtype`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L603)

<a id="function-function-mq3-game-bot-deathmatch-carriervisible-function-carriervisible-state-bot-teamcarrier-cubes-src-mq3-game-bot-deathmatch-ml-2069912235"></a>
### carrierVisible

```ml
function carrierVisible(state, bot, teamCarrier, cubes)
```

Apply `mq3.game.bot_deathmatch.botEntityVisible`, `mq3.game.bot_deathmatch.botSameTeam` and `mq3.game.bot_deathmatch.entityCarriesFlagMode` while evaluating `carrierVisible`. Return paths include `-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `maxclients`, `entities` and `missionpack`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`, `entitynum`, `eye` and `viewangles`. |
| `teamCarrier` | `dynamic` | — | Value used by `carrierVisible` in `if carrying and same==teamCarrier then return i end if end if end for`. |
| `cubes` | `dynamic` | — | Value used by `carrierVisible` in `if cubes then carrying=entityCarriesCubes(state,state.entities[i]) end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L671)

<a id="function-function-mq3-game-bot-deathmatch-clientfromname-function-clientfromname-state-name-src-mq3-game-bot-deathmatch-ml-390755490"></a>
### clientFromName

```ml
function clientFromName(state, name)
```

Apply `mq3.game.bot_deathmatch.sync` and `mq3.game.bot_team_helpers.clientFromName` while evaluating `clientFromName`. Return paths include `teams.clientFromName(state.teamState,name)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `teamState`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L482)

<a id="function-function-mq3-game-bot-deathmatch-clientname-function-clientname-state-client-src-mq3-game-bot-deathmatch-ml-2015196010"></a>
### clientName

```ml
function clientName(state, client)
```

Apply `mq3.game.bot_team_helpers.cleanClientText` and `mq3.shared.info.value` while evaluating `clientName`. Return paths include `teams.cleanClientText(info.value(state.configs[client],"n"))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `configs`. |
| `client` | `dynamic` | — | Operand used to evaluate the returned expression `teams.cleanClientText(info.value(state.configs[client],"n"))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L474)

<a id="function-function-mq3-game-bot-deathmatch-clientonsameteamfromname-function-clientonsameteamfromname-state-bot-name-src-mq3-game-bot-deathmatch-ml-1562423779"></a>
### clientOnSameTeamFromName

```ml
function clientOnSameTeamFromName(state, bot, name)
```

Apply `mq3.game.bot_deathmatch.sync` and `mq3.game.bot_team_helpers.clientOnSameTeamFromName` while evaluating `clientOnSameTeamFromName`. Return paths include `teams.clientOnSameTeamFromName(state.teamState,bot,name)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `teamState`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L487)

<a id="function-function-mq3-game-bot-deathmatch-clientskin-function-clientskin-state-client-src-mq3-game-bot-deathmatch-ml-905105514"></a>
### clientSkin

```ml
function clientSkin(state, client)
```

Apply `mq3.shared.info.value` while evaluating `clientSkin`. Return paths include `info.value(state.configs[client],"model")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `configs`. |
| `client` | `dynamic` | — | Operand used to evaluate the returned expression `info.value(state.configs[client],"model")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L478)

<a id="constant-constant-mq3-game-bot-deathmatch-contents-lava-const-contents-lava-headers-contents-lava-src-mq3-game-bot-deathmatch-ml-1781051302"></a>
### CONTENTS_LAVA

```ml
const CONTENTS_LAVA = headers.CONTENTS_LAVA
```

Collision-contents bit identifying lava space or objects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L77)

<a id="constant-constant-mq3-game-bot-deathmatch-contents-slime-const-contents-slime-headers-contents-slime-src-mq3-game-bot-deathmatch-ml-2023096164"></a>
### CONTENTS_SLIME

```ml
const CONTENTS_SLIME = headers.CONTENTS_SLIME
```

Collision-contents bit identifying slime space or objects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L75)

<a id="constant-constant-mq3-game-bot-deathmatch-contents-water-const-contents-water-headers-contents-water-src-mq3-game-bot-deathmatch-ml-1702742467"></a>
### CONTENTS_WATER

```ml
const CONTENTS_WATER = headers.CONTENTS_WATER
```

Collision-contents bit identifying water space or objects.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L73)

<a id="function-function-mq3-game-bot-deathmatch-copygoal-function-copygoal-value-src-mq3-game-bot-deathmatch-ml-311180753"></a>
### copyGoal

```ml
function copyGoal(value)
```

Create a `mq3.game.bot_deathmatch.Goal` record, initializing `number` as `value.number`, `entitynum` as `value.entitynum` and `areanum` as `value.areanum`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `number`, `entitynum`, `areanum`, `origin` and `mins` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L266)

<a id="function-function-mq3-game-bot-deathmatch-create-function-create-src-mq3-game-bot-deathmatch-ml-652219274"></a>
### create

```ml
function create()
```

Build the `mq3.game.bot_deathmatch.State` result for `create`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L268)

<a id="function-function-mq3-game-bot-deathmatch-distancesquared-function-distancesquared-a-b-src-mq3-game-bot-deathmatch-ml-1920583433"></a>
### distanceSquared

```ml
function distanceSquared(a, b)
```

Calculate squared Euclidean distance between two three-component points without taking a square root.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `a` | `dynamic` | — | First three-component point. |
| `b` | `dynamic` | — | Second three-component point. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L295)

<a id="function-function-mq3-game-bot-deathmatch-easyclientname-function-easyclientname-state-client-src-mq3-game-bot-deathmatch-ml-1065682858"></a>
### easyClientName

```ml
function easyClientName(state, client)
```

Apply `mq3.game.bot_deathmatch.clientName` while evaluating `easyClientName`. Return paths include `decode(bytes(kept))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `configs`. |
| `client` | `dynamic` | — | Operand used to evaluate the returned expression `teams.cleanClientText(info.value(state.configs[client],"n"))`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L495)

<a id="constant-constant-mq3-game-bot-deathmatch-ef-dead-const-ef-dead-1-src-mq3-game-bot-deathmatch-ml-1359753776"></a>
### EF_DEAD

```ml
const EF_DEAD = 1
```

Network entity-flag bit indicating dead.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L69)

<a id="constant-constant-mq3-game-bot-deathmatch-ef-kamikaze-const-ef-kamikaze-1048576-src-mq3-game-bot-deathmatch-ml-2127703394"></a>
### EF_KAMIKAZE

```ml
const EF_KAMIKAZE = 1048576
```

Network entity-flag bit indicating kamikaze.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L71)

<a id="function-function-mq3-game-bot-deathmatch-emit-function-emit-state-kind-bot-text-value-point-retailactive-src-mq3-game-bot-deathmatch-ml-389674577"></a>
### emit

```ml
function emit(state, kind, bot, text, value, point, retailActive)
```

Set `state.actions` to `state.actions+[action]` in `mq3.game.bot_deathmatch.emit`. Return paths include `action`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `actions` and `hostActionFn`. May update `state.actions` in place. |
| `kind` | `dynamic` | — | Initial value stored in `mq3.game.bot_deathmatch.Action.kind`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |
| `value` | `dynamic` | — | Initial value stored in `mq3.game.bot_deathmatch.Action.value`. |
| `point` | `dynamic` | — | Three-component point used by the geometric query. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L281)

<a id="function-function-mq3-game-bot-deathmatch-entity-function-entity-number-src-mq3-game-bot-deathmatch-ml-1849062607"></a>
### entity

```ml
function entity(number)
```

Create a `mq3.game.bot_deathmatch.Entity` record, initializing `number` from `number`, `origin` as `[0.0,0.0,0.0]` and `mins` as `[0.0,0.0,0.0]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — | Initial value stored in `mq3.game.bot_deathmatch.Entity.number`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L263)

- [mq3.game.bot_deathmatch.Entity](Type-mq3-game-bot-deathmatch-entity-401888652.md) — struct
<a id="function-function-mq3-game-bot-deathmatch-entitycarriescubes-function-entitycarriescubes-state-value-src-mq3-game-bot-deathmatch-ml-2123979656"></a>
### entityCarriesCubes

```ml
function entityCarriesCubes(state, value)
```

Test `state.gametype==GT_HARVESTER and value.generic1>0` as the condition for `entityCarriesCubes`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `gametype`. |
| `value` | `dynamic` | — | Value record; accesses `generic1`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L356)

<a id="function-function-mq3-game-bot-deathmatch-entitycarriesflag-function-entitycarriesflag-value-src-mq3-game-bot-deathmatch-ml-1115623089"></a>
### entityCarriesFlag

```ml
function entityCarriesFlag(value)
```

Entity predicates.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Entinfo record; accesses `powerups`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L333)

<a id="function-function-mq3-game-bot-deathmatch-entitycarriesflagmode-function-entitycarriesflagmode-value-missionpack-src-mq3-game-bot-deathmatch-ml-1142380844"></a>
### entityCarriesFlagMode

```ml
function entityCarriesFlagMode(value, missionpack)
```

Test `entityCarriesFlag(value) or (missionpack and (value.powerups&(1<<c.PW_NEUTRALFLAG))!=0)` as the condition for `entityCarriesFlagMode`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `powerups`. |
| `missionpack` | `dynamic` | — | Whether Team Arena rules and definitions are active. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L337)

<a id="function-function-mq3-game-bot-deathmatch-entityhaskamikaze-function-entityhaskamikaze-value-src-mq3-game-bot-deathmatch-ml-236540293"></a>
### entityHasKamikaze

```ml
function entityHasKamikaze(value)
```

Test `(value.flags&EF_KAMIKAZE)!=0` as the condition for `entityHasKamikaze`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `flags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L352)

<a id="function-function-mq3-game-bot-deathmatch-entityhasquad-function-entityhasquad-value-src-mq3-game-bot-deathmatch-ml-827507665"></a>
### entityHasQuad

```ml
function entityHasQuad(value)
```

Forward `entityHasQuad` to `mq3.game.bot_combat_ai.entityHasQuad` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Entinfo record; accesses `powerups`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L349)

<a id="function-function-mq3-game-bot-deathmatch-entityischatting-function-entityischatting-value-src-mq3-game-bot-deathmatch-ml-656772689"></a>
### entityIsChatting

```ml
function entityIsChatting(value)
```

Forward `entityIsChatting` to `mq3.game.bot_combat_ai.entityIsChatting` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Entinfo record; accesses `flags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L346)

<a id="function-function-mq3-game-bot-deathmatch-entityisdead-function-entityisdead-state-value-src-mq3-game-bot-deathmatch-ml-88371160"></a>
### entityIsDead

```ml
function entityIsDead(state, value)
```

Apply `mq3.game.bot_deathmatch.sync` and `mq3.game.bot_team_helpers.entityIsDead` while evaluating `entityIsDead`. Return paths include `teams.entityIsDead(state.teamState,value.number)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `teamState`. |
| `value` | `dynamic` | — | Value record; accesses `number`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L360)

<a id="function-function-mq3-game-bot-deathmatch-entityisinvisible-function-entityisinvisible-value-src-mq3-game-bot-deathmatch-ml-536754145"></a>
### entityIsInvisible

```ml
function entityIsInvisible(value)
```

Forward `entityIsInvisible` to `mq3.game.bot_combat_ai.entityIsInvisible` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Entinfo record; accesses `powerups`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L340)

<a id="function-function-mq3-game-bot-deathmatch-entityisshooting-function-entityisshooting-value-src-mq3-game-bot-deathmatch-ml-2092573409"></a>
### entityIsShooting

```ml
function entityIsShooting(value)
```

Forward `entityIsShooting` to `mq3.game.bot_combat_ai.entityIsShooting` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Entinfo record; accesses `flags`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L343)

<a id="constant-constant-mq3-game-bot-deathmatch-et-missile-const-et-missile-3-src-mq3-game-bot-deathmatch-ml-1981654112"></a>
### ET_MISSILE

```ml
const ET_MISSILE = 3
```

Network entity-type identifier representing missile.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L63)

<a id="function-function-mq3-game-bot-deathmatch-goal-function-goal-src-mq3-game-bot-deathmatch-ml-1288445710"></a>
### goal

```ml
function goal()
```

Create a `mq3.game.bot_deathmatch.Goal` record, initializing `origin` as `[0.0,0.0,0.0]`, `mins` as `[0.0,0.0,0.0]` and `maxs` as `[0.0,0.0,0.0]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L260)

- [mq3.game.bot_deathmatch.Goal](Type-mq3-game-bot-deathmatch-goal-466156508.md) — struct
<a id="constant-constant-mq3-game-bot-deathmatch-gt-1fctf-const-gt-1fctf-5-src-mq3-game-bot-deathmatch-ml-1621703218"></a>
### GT_1FCTF

```ml
const GT_1FCTF = 5
```

Game-mode identifier selecting 1 fctf rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L27)

<a id="constant-constant-mq3-game-bot-deathmatch-gt-ctf-const-gt-ctf-4-src-mq3-game-bot-deathmatch-ml-685972341"></a>
### GT_CTF

```ml
const GT_CTF = 4
```

Game-mode identifier selecting capture the flag rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L25)

<a id="constant-constant-mq3-game-bot-deathmatch-gt-harvester-const-gt-harvester-7-src-mq3-game-bot-deathmatch-ml-1875304792"></a>
### GT_HARVESTER

```ml
const GT_HARVESTER = 7
```

Game-mode identifier selecting harvester rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L31)

<a id="constant-constant-mq3-game-bot-deathmatch-gt-obelisk-const-gt-obelisk-6-src-mq3-game-bot-deathmatch-ml-376019187"></a>
### GT_OBELISK

```ml
const GT_OBELISK = 6
```

Game-mode identifier selecting obelisk rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L29)

<a id="constant-constant-mq3-game-bot-deathmatch-gt-team-const-gt-team-3-src-mq3-game-bot-deathmatch-ml-1317523446"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```

Game-mode identifier selecting team rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L23)

<a id="function-function-mq3-game-bot-deathmatch-infieldofvision-function-infieldofvision-viewangles-fov-angles-src-mq3-game-bot-deathmatch-ml-1460599452"></a>
### inFieldOfVision

```ml
function inFieldOfVision(viewangles, fov, angles)
```

Exact aliases for the remaining existing native implementations.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `viewangles` | `dynamic` | — | Array or byte sequence accessed at `axis`. |
| `fov` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.fmul`. |
| `angles` | `dynamic` | — | Pitch, yaw and roll angles in degrees. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L907)

<a id="function-function-mq3-game-bot-deathmatch-intvalue-function-intvalue-value-src-mq3-game-bot-deathmatch-ml-918538705"></a>
### intValue

```ml
function intValue(value)
```

Convert a truth value to the integer one or zero for game-policy arithmetic.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value used by `intValue` in `if value then return 1 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L409)

<a id="constant-constant-mq3-game-bot-deathmatch-inventory-ammoregen-const-inventory-ammoregen-headers-inventory-ammoregen-src-mq3-game-bot-deathmatch-ml-2146090389"></a>
### INVENTORY_AMMOREGEN

```ml
const INVENTORY_AMMOREGEN = headers.INVENTORY_AMMOREGEN
```

Bot inventory slot used to read or update ammoregen.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L61)

<a id="constant-constant-mq3-game-bot-deathmatch-inventory-bluecube-const-inventory-bluecube-headers-inventory-bluecube-src-mq3-game-bot-deathmatch-ml-2074726373"></a>
### INVENTORY_BLUECUBE

```ml
const INVENTORY_BLUECUBE = headers.INVENTORY_BLUECUBE
```

Bot inventory slot used to read or update bluecube.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L53)

<a id="constant-constant-mq3-game-bot-deathmatch-inventory-doubler-const-inventory-doubler-headers-inventory-doubler-src-mq3-game-bot-deathmatch-ml-449580483"></a>
### INVENTORY_DOUBLER

```ml
const INVENTORY_DOUBLER = headers.INVENTORY_DOUBLER
```

Bot inventory slot used to read or update doubler.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L59)

<a id="constant-constant-mq3-game-bot-deathmatch-inventory-environmentsuit-const-inventory-environmentsuit-headers-inventory-environmentsuit-src-mq3-game-bot-deathmatch-ml-1721868552"></a>
### INVENTORY_ENVIRONMENTSUIT

```ml
const INVENTORY_ENVIRONMENTSUIT = headers.INVENTORY_ENVIRONMENTSUIT
```

Bot inventory slot used to read or update environmentsuit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L47)

<a id="constant-constant-mq3-game-bot-deathmatch-inventory-guard-const-inventory-guard-headers-inventory-guard-src-mq3-game-bot-deathmatch-ml-526676739"></a>
### INVENTORY_GUARD

```ml
const INVENTORY_GUARD = headers.INVENTORY_GUARD
```

Bot inventory slot used to read or update guard.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L57)

<a id="constant-constant-mq3-game-bot-deathmatch-inventory-health-const-inventory-health-headers-inventory-health-src-mq3-game-bot-deathmatch-ml-2131194970"></a>
### INVENTORY_HEALTH

```ml
const INVENTORY_HEALTH = headers.INVENTORY_HEALTH
```

Bot inventory slot used to read or update health.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L37)

<a id="constant-constant-mq3-game-bot-deathmatch-inventory-invulnerability-const-inventory-invulnerability-headers-inventory-invulnerability-src-mq3-game-bot-deathmatch-ml-442202185"></a>
### INVENTORY_INVULNERABILITY

```ml
const INVENTORY_INVULNERABILITY = headers.INVENTORY_INVULNERABILITY
```

Bot inventory slot used to read or update invulnerability.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L45)

<a id="constant-constant-mq3-game-bot-deathmatch-inventory-kamikaze-const-inventory-kamikaze-headers-inventory-kamikaze-src-mq3-game-bot-deathmatch-ml-2047813519"></a>
### INVENTORY_KAMIKAZE

```ml
const INVENTORY_KAMIKAZE = headers.INVENTORY_KAMIKAZE
```

Bot inventory slot used to read or update kamikaze.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L43)

<a id="constant-constant-mq3-game-bot-deathmatch-inventory-medkit-const-inventory-medkit-headers-inventory-medkit-src-mq3-game-bot-deathmatch-ml-1419937774"></a>
### INVENTORY_MEDKIT

```ml
const INVENTORY_MEDKIT = headers.INVENTORY_MEDKIT
```

Bot inventory slot used to read or update medkit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L41)

<a id="constant-constant-mq3-game-bot-deathmatch-inventory-neutralflag-const-inventory-neutralflag-headers-inventory-neutralflag-src-mq3-game-bot-deathmatch-ml-1336090719"></a>
### INVENTORY_NEUTRALFLAG

```ml
const INVENTORY_NEUTRALFLAG = headers.INVENTORY_NEUTRALFLAG
```

Bot inventory slot used to read or update neutralflag.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L49)

<a id="constant-constant-mq3-game-bot-deathmatch-inventory-redcube-const-inventory-redcube-headers-inventory-redcube-src-mq3-game-bot-deathmatch-ml-1086205982"></a>
### INVENTORY_REDCUBE

```ml
const INVENTORY_REDCUBE = headers.INVENTORY_REDCUBE
```

Bot inventory slot used to read or update redcube.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L51)

<a id="constant-constant-mq3-game-bot-deathmatch-inventory-scout-const-inventory-scout-headers-inventory-scout-src-mq3-game-bot-deathmatch-ml-1509927462"></a>
### INVENTORY_SCOUT

```ml
const INVENTORY_SCOUT = headers.INVENTORY_SCOUT
```

Bot inventory slot used to read or update scout.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L55)

<a id="constant-constant-mq3-game-bot-deathmatch-inventory-teleporter-const-inventory-teleporter-headers-inventory-teleporter-src-mq3-game-bot-deathmatch-ml-306984904"></a>
### INVENTORY_TELEPORTER

```ml
const INVENTORY_TELEPORTER = headers.INVENTORY_TELEPORTER
```

Bot inventory slot used to read or update teleporter.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L39)

- [mq3.game.bot_deathmatch.LastTask](Type-mq3-game-bot-deathmatch-lasttask-2104050610.md) — struct
<a id="constant-constant-mq3-game-bot-deathmatch-max-clients-const-max-clients-64-src-mq3-game-bot-deathmatch-ml-1125504737"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```

Maximum number of client slots represented by the original game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L21)

<a id="function-function-mq3-game-bot-deathmatch-nowfn-function-nowfn-services-src-mq3-game-bot-deathmatch-ml-1672263250"></a>
### nowFn

```ml
function nowFn(services)
```

Return `services.context.now` for `nowFn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `context`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L553)

- [mq3.game.bot_deathmatch.State](Type-mq3-game-bot-deathmatch-state-650922884.md) — struct
<a id="function-function-mq3-game-bot-deathmatch-strategicgoal-function-strategicgoal-state-bot-name-retreat-retailactive-src-mq3-game-bot-deathmatch-ml-1908235351"></a>
### strategicGoal

```ml
function strategicGoal(state, bot, name, retreat, retailActive)
```

Record or dispatch `"strategy"` actions in `strategicGoal`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `strategyFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `retreat` | `dynamic` | — | Value used by `intValue` in `if value then return 1 end if`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L404)

<a id="function-function-mq3-game-bot-deathmatch-stristr-function-stristr-text-needle-src-mq3-game-bot-deathmatch-ml-1822027560"></a>
### stristr

```ml
function stristr(text, needle)
```

Return the result of `strings.indexOf(strings.toLowerAscii(text),strings.toLowerAscii(needle),0)` for `stristr`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text to parse, format or deliver. |
| `needle` | `dynamic` | — | Text or value to search for. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L491)

<a id="function-function-mq3-game-bot-deathmatch-sync-function-sync-state-src-mq3-game-bot-deathmatch-ml-1487792009"></a>
### sync

```ml
function sync(state)
```

Synchronize combat and team services with the deathmatch game type, client limit and configuration strings.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `combatServices`, `gametype`, `teamState`, `maxclients` and `configs`. May update `state.combatServices.gametype`, `state.teamState.gametype` and `state.teamState.maxclients` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L287)

<a id="constant-constant-mq3-game-bot-deathmatch-team-blue-const-team-blue-2-src-mq3-game-bot-deathmatch-ml-1411769383"></a>
### TEAM_BLUE

```ml
const TEAM_BLUE = 2
```

Team identifier selecting the blue team/category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L35)

<a id="constant-constant-mq3-game-bot-deathmatch-team-red-const-team-red-1-src-mq3-game-bot-deathmatch-ml-918175840"></a>
### TEAM_RED

```ml
const TEAM_RED = 1
```

Team identifier selecting the red team/category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L33)

<a id="function-function-mq3-game-bot-deathmatch-teamplayison-function-teamplayison-state-src-mq3-game-bot-deathmatch-ml-1724070597"></a>
### teamPlayIsOn

```ml
function teamPlayIsOn(state)
```

Test `state.gametype>=GT_TEAM` as the condition for `teamPlayIsOn`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `gametype`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L591)

<a id="function-function-mq3-game-bot-deathmatch-teamvalue-function-teamvalue-state-bot-src-mq3-game-bot-deathmatch-ml-325888020"></a>
### teamValue

```ml
function teamValue(state, bot)
```

Apply `mq3.game.bot_deathmatch.sync` and `mq3.game.bot_team_helpers.team` while evaluating `teamValue`. Return paths include `teams.team(state.teamState,bot)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot deathmatch state; accesses `teamState`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L291)

- [mq3.game.bot_deathmatch.Waypoint](Type-mq3-game-bot-deathmatch-waypoint-851135484.md) — struct
<a id="constant-constant-mq3-game-bot-deathmatch-wp-grenade-launcher-const-wp-grenade-launcher-4-src-mq3-game-bot-deathmatch-ml-1045347729"></a>
### WP_GRENADE_LAUNCHER

```ml
const WP_GRENADE_LAUNCHER = 4
```

Weapon identifier selecting grenade launcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L65)

<a id="constant-constant-mq3-game-bot-deathmatch-wp-prox-launcher-const-wp-prox-launcher-11-src-mq3-game-bot-deathmatch-ml-251090599"></a>
### WP_PROX_LAUNCHER

```ml
const WP_PROX_LAUNCHER = 11
```

Weapon identifier selecting prox launcher.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_deathmatch.ml#L67)
