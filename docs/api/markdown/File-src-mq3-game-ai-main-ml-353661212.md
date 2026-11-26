# `src/mq3/game/ai_main.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.ai_main`](Package-mq3-game-ai-main-1778337368.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/compat/textnumbers.ml` as `textnumbers` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/game/bot_ai_commands.ml` as `commands` → [src/mq3/game/bot_ai_commands.ml](File-src-mq3-game-bot-ai-commands-ml-200092467.md)
- `mq3/game/bot_ai_frame.ml` as `frames` → [src/mq3/game/bot_ai_frame.ml](File-src-mq3-game-bot-ai-frame-ml-144686062.md)
- `mq3/game/bot_client_resources.ml` as `clients` → [src/mq3/game/bot_client_resources.ml](File-src-mq3-game-bot-client-resources-ml-1593961093.md)
- `mq3/game/bot_input.ml` as `input` → [src/mq3/game/bot_input.ml](File-src-mq3-game-bot-input-ml-1155152552.md)
- `mq3/game/bot_lifecycle.ml` as `lifecycle` → [src/mq3/game/bot_lifecycle.ml](File-src-mq3-game-bot-lifecycle-ml-1736646636.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

- [mq3.game.ai_main.Action](Type-mq3-game-ai-main-action-1175627984.md) — struct
<a id="function-function-mq3-game-ai-main-angledifference-function-angledifference-ang1-ang2-src-mq3-game-ai-main-ml-165425517"></a>
### AngleDifference

```ml
function AngleDifference(ang1, ang2)
```

Forward `AngleDifference` to `mq3.game.bot_input.angleDifference` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ang1` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.fsub`. |
| `ang2` | `dynamic` | — | Value passed as argument 2 to `mq3.compat.numeric.fsub`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L285)

- [mq3.game.ai_main.AreaInfo](Type-mq3-game-ai-main-areainfo-1884411907.md) — struct
<a id="function-function-mq3-game-ai-main-botai-function-botai-services-client-thinktime-src-mq3-game-ai-main-ml-527853988"></a>
### BotAI

```ml
function BotAI(services, client, thinktime)
```

Forward `BotAI` to `mq3.game.bot_ai_commands.botAI` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `commandServices`. |
| `client` | `dynamic` | — | Value passed as argument 2 to `services.resetInputFn`. |
| `thinktime` | `dynamic` | — | Bot thinking interval in seconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L281)

<a id="function-function-mq3-game-ai-main-botai-botinitialchat-function-botai-botinitialchat-services-bot-type-variables-src-mq3-game-ai-main-ml-959737884"></a>
### BotAI_BotInitialChat

```ml
function BotAI_BotInitialChat(services, bot, type, variables)
```

Record or dispatch `"chat"` actions in `BotAI_BotInitialChat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `synonymContextFn` and `initialChatFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client` and `cs`. |
| `type` | `dynamic` | — | Initial value stored in `mq3.game.ai_main.Action.detail`. |
| `variables` | `dynamic` | — | Chat substitution values in their numbered slots. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L234)

<a id="function-function-mq3-game-ai-main-botai-getclientstate-function-botai-getclientstate-services-clientnum-src-mq3-game-ai-main-ml-699008065"></a>
### BotAI_GetClientState

```ml
function BotAI_GetClientState(services, clientNum)
```

Forward `BotAI_GetClientState` to `mq3.game.bot_ai_frame.getClientState` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `frameServices`. |
| `clientNum` | `dynamic` | — | Client slot number. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L219)

<a id="function-function-mq3-game-ai-main-botai-getentitystate-function-botai-getentitystate-services-entitynum-src-mq3-game-ai-main-ml-1615327505"></a>
### BotAI_GetEntityState

```ml
function BotAI_GetEntityState(services, entityNum)
```

Forward `BotAI_GetEntityState` to `mq3.game.bot_ai_frame.getEntityState` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `frameServices`. |
| `entityNum` | `dynamic` | — | Entity number in the game or AAS entity table. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L223)

<a id="function-function-mq3-game-ai-main-botai-getsnapshotentity-function-botai-getsnapshotentity-services-clientnum-sequence-src-mq3-game-ai-main-ml-1031611912"></a>
### BotAI_GetSnapshotEntity

```ml
function BotAI_GetSnapshotEntity(services, clientNum, sequence)
```

Forward `BotAI_GetSnapshotEntity` to `mq3.game.bot_ai_frame.getSnapshotEntity` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `frameServices`. |
| `clientNum` | `dynamic` | — | Client slot number. |
| `sequence` | `dynamic` | — | Value passed as argument 3 to `services.snapshotEntityFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L228)

<a id="function-function-mq3-game-ai-main-botai-print-function-botai-print-services-type-message-src-mq3-game-ai-main-ml-590258897"></a>
### BotAI_Print

```ml
function BotAI_Print(services, type, message)
```

Botlib import boundaries from the first section of ai_main.c.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `printFn`. |
| `type` | `dynamic` | — | Initial value stored in `mq3.game.ai_main.Action.number`. |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L197)

<a id="function-function-mq3-game-ai-main-botai-trace-function-botai-trace-services-start-mins-maxs-traceend-passent-contentmask-src-mq3-game-ai-main-ml-2040512769"></a>
### BotAI_Trace

```ml
function BotAI_Trace(services, start, mins, maxs, traceEnd, passent, contentmask)
```

Record or dispatch `"trace"` actions in `BotAI_Trace`. Return paths include `need(services.traceFn,"trace host")(services,start,mins,maxs,traceEnd,passent,contentmask)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `traceFn`. |
| `start` | `dynamic` | — | Operand used to evaluate the returned expression `need(services.traceFn,"trace host")(services,start,mins,maxs,traceEnd,passent,contentmask)`. |
| `mins` | `dynamic` | — | Minimum coordinates of the axis-aligned bounds. |
| `maxs` | `dynamic` | — | Maximum coordinates of the axis-aligned bounds. |
| `traceEnd` | `dynamic` | — | Operand used to evaluate the returned expression `need(services.traceFn,"trace host")(services,start,mins,maxs,traceEnd,passent,contentmask)`. |
| `passent` | `dynamic` | — | Initial value stored in `mq3.game.ai_main.Action.subject`. |
| `contentmask` | `dynamic` | — | Initial value stored in `mq3.game.ai_main.Action.number`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L211)

<a id="function-function-mq3-game-ai-main-botailoadmap-function-botailoadmap-services-restart-src-mq3-game-ai-main-ml-1396857543"></a>
### BotAILoadMap

```ml
function BotAILoadMap(services, restart)
```

Forward `BotAILoadMap` to `mq3.game.bot_lifecycle.loadMap` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `lifecycleState`. |
| `restart` | `dynamic` | — | Whether initialization or shutdown belongs to a map restart. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L331)

<a id="function-function-mq3-game-ai-main-botairegularupdate-function-botairegularupdate-services-src-mq3-game-ai-main-ml-381298474"></a>
### BotAIRegularUpdate

```ml
function BotAIRegularUpdate(services)
```

Forward `BotAIRegularUpdate` to `mq3.game.bot_ai_frame.regularUpdate` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `frameServices`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L311)

<a id="function-function-mq3-game-ai-main-botaisetup-function-botaisetup-services-restart-src-mq3-game-ai-main-ml-1478174923"></a>
### BotAISetup

```ml
function BotAISetup(services, restart)
```

Forward `BotAISetup` to `mq3.game.bot_lifecycle.setup` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `lifecycleState`. |
| `restart` | `dynamic` | — | Whether initialization or shutdown belongs to a map restart. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L323)

<a id="function-function-mq3-game-ai-main-botaisetupclient-function-botaisetupclient-services-client-settings-restart-src-mq3-game-ai-main-ml-1704612377"></a>
### BotAISetupClient

```ml
function BotAISetupClient(services, client, settings, restart)
```

Forward `BotAISetupClient` to `mq3.game.bot_client_resources.setupClient` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `clientServices`. |
| `client` | `dynamic` | — | Value passed as argument 1 to `typeof`. |
| `settings` | `dynamic` | — | Settings record; accesses `characterfile`, `skill` and `team`. |
| `restart` | `dynamic` | — | Whether initialization or shutdown belongs to a map restart. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L341)

<a id="function-function-mq3-game-ai-main-botaishutdown-function-botaishutdown-services-restart-src-mq3-game-ai-main-ml-2062204781"></a>
### BotAIShutdown

```ml
function BotAIShutdown(services, restart)
```

Forward `BotAIShutdown` to `mq3.game.bot_lifecycle.shutdown` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `lifecycleState`. |
| `restart` | `dynamic` | — | Whether initialization or shutdown belongs to a map restart. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L335)

<a id="function-function-mq3-game-ai-main-botaishutdownclient-function-botaishutdownclient-services-client-restart-src-mq3-game-ai-main-ml-953518476"></a>
### BotAIShutdownClient

```ml
function BotAIShutdownClient(services, client, restart)
```

Forward `BotAIShutdownClient` to `mq3.game.bot_client_resources.shutdownClient` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `clientServices`. |
| `client` | `dynamic` | — | Value passed as argument 1 to `typeof`. |
| `restart` | `dynamic` | — | Whether initialization or shutdown belongs to a map restart. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L346)

<a id="function-function-mq3-game-ai-main-botaistartframe-function-botaistartframe-services-level-time-src-mq3-game-ai-main-ml-2028619667"></a>
### BotAIStartFrame

```ml
function BotAIStartFrame(services, level, time)
```

Set `services.frameServices.frameLevel` to `level` in `mq3.game.ai_main.BotAIStartFrame`. Return paths include `frames.startFrame(level,services.frameServices,time)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `frameServices`. May update `services.frameServices.frameLevel` in place. |
| `level` | `dynamic` | — | Game-level state; accesses `entities`. |
| `time` | `dynamic` | — | Time value in the units expected by this module. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L316)

<a id="function-function-mq3-game-ai-main-botchangeviewangle-function-botchangeviewangle-angle-ideal-speed-src-mq3-game-ai-main-ml-1410348535"></a>
### BotChangeViewAngle

```ml
function BotChangeViewAngle(angle, ideal, speed)
```

Forward `BotChangeViewAngle` to `mq3.game.bot_input.changeViewAngle` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angle` | `dynamic` | — | Value passed as argument 1 to `mq3.shared.math.AngleNormalize360`. |
| `ideal` | `dynamic` | — | Value passed as argument 1 to `mq3.shared.math.AngleNormalize360`. |
| `speed` | `dynamic` | — | Requested movement speed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L290)

<a id="function-function-mq3-game-ai-main-botchangeviewangles-function-botchangeviewangles-services-bot-thinktime-src-mq3-game-ai-main-ml-1309017736"></a>
### BotChangeViewAngles

```ml
function BotChangeViewAngles(services, bot, thinktime)
```

Forward `BotChangeViewAngles` to `mq3.game.bot_input.changeViewAngles` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `inputServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `idealViewangles`, `enemy`, `character`, `viewangles` and `viewanglespeed` and related fields. May update `bot.idealViewangles[0]`, `bot.viewangles[axis]` and `bot.idealViewangles[axis]` and additional fields in place. |
| `thinktime` | `dynamic` | — | Bot thinking interval in seconds. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L295)

<a id="function-function-mq3-game-ai-main-botentityinfo-function-botentityinfo-services-entnum-src-mq3-game-ai-main-ml-1954135459"></a>
### BotEntityInfo

```ml
function BotEntityInfo(services, entnum)
```

Record or dispatch `"aas"` actions in `BotEntityInfo`. Return paths include `need(services.entityInfoFn,"AAS_EntityInfo")(services,entnum)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `entityInfoFn`. |
| `entnum` | `dynamic` | — | Entity number in the game or AAS entity table. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L379)

<a id="function-function-mq3-game-ai-main-botinitlibrary-function-botinitlibrary-services-src-mq3-game-ai-main-ml-238076514"></a>
### BotInitLibrary

```ml
function BotInitLibrary(services)
```

Forward `BotInitLibrary` to `mq3.game.bot_lifecycle.initLibrary` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `lifecycleState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L319)

<a id="function-function-mq3-game-ai-main-botinputtousercommand-function-botinputtousercommand-botinput-command-deltaangles-time-src-mq3-game-ai-main-ml-1714495859"></a>
### BotInputToUserCommand

```ml
function BotInputToUserCommand(botInput, command, deltaAngles, time)
```

Forward `BotInputToUserCommand` to `mq3.game.bot_input.inputToUserCommand` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `botInput` | `dynamic` | — | Input record; accesses `actionflags`, `weapon`, `viewangles`, `dir` and `speed`. May update `botInput.actionflags` and `botInput.speed` in place. |
| `command` | `dynamic` | — | Command record; accesses `serverTime`, `buttons`, `angles`, `weapon` and `forwardmove` and related fields. May update `command.serverTime`, `command.buttons` and `command.angles` and additional fields in place. |
| `deltaAngles` | `dynamic` | — | Array or byte sequence accessed at `axis`. |
| `time` | `dynamic` | — | Time value in the units expected by this module. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L301)

<a id="function-function-mq3-game-ai-main-botinterbreedbots-function-botinterbreedbots-services-src-mq3-game-ai-main-ml-1542150176"></a>
### BotInterbreedBots

```ml
function BotInterbreedBots(services)
```

Forward `BotInterbreedBots` to `mq3.game.bot_lifecycle.interbreedBots` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `lifecycleState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L349)

<a id="function-function-mq3-game-ai-main-botinterbreedendmatch-function-botinterbreedendmatch-services-src-mq3-game-ai-main-ml-1484010156"></a>
### BotInterbreedEndMatch

```ml
function BotInterbreedEndMatch(services)
```

Forward `BotInterbreedEndMatch` to `mq3.game.bot_lifecycle.endMatch` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `lifecycleState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L356)

<a id="function-function-mq3-game-ai-main-botinterbreeding-function-botinterbreeding-services-src-mq3-game-ai-main-ml-1720303926"></a>
### BotInterbreeding

```ml
function BotInterbreeding(services)
```

Record or dispatch `"game"` and `"console"` actions in `BotInterbreeding`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `lifecycleState`, `commandServices`, `exitLevelFn` and `sendConsoleCommandFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L360)

<a id="function-function-mq3-game-ai-main-botreadsessiondata-function-botreadsessiondata-services-bot-src-mq3-game-ai-main-ml-1913668769"></a>
### BotReadSessionData

```ml
function BotReadSessionData(services, bot)
```

Set `services.sessions[bot.client]` to `data` in `mq3.game.ai_main.BotReadSessionData`. Return paths include `data`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `cvarStringFn`, `lifecycleState` and `sessions`. May update `services.sessions[bot.client]` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L428)

<a id="function-function-mq3-game-ai-main-botreportstatus-function-botreportstatus-services-bot-src-mq3-game-ai-main-ml-1538987827"></a>
### BotReportStatus

```ml
function BotReportStatus(services, bot)
```

Forward `BotReportStatus` to `mq3.game.bot_ai_commands.reportStatus` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `commandServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `gs` and `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L266)

<a id="function-function-mq3-game-ai-main-botresetstate-function-botresetstate-services-bot-src-mq3-game-ai-main-ml-1457707039"></a>
### BotResetState

```ml
function BotResetState(services, bot)
```

Forward `BotResetState` to `mq3.game.bot_lifecycle.resetState` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `lifecycleState`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `checkpoints`, `patrolpoints`, `setupcount`, `walker` and `numKills` and related fields. May update `bot.setupcount`, `bot.checkpoints` and `bot.patrolpoints` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L327)

<a id="function-function-mq3-game-ai-main-botschedulebotthink-function-botschedulebotthink-services-src-mq3-game-ai-main-ml-1226473316"></a>
### BotScheduleBotThink

```ml
function BotScheduleBotThink(services)
```

Set `services.frameServices.runtimes[index].botthinkResidual` to `numeric.trunc32(state.thinktime.integer*botnum/state.numbots)` in `mq3.game.ai_main.BotScheduleBotThink`. Return paths include `botnum`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `lifecycleState` and `frameServices`. May update `services.frameServices.runtimes[index].botthinkResidual` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L396)

<a id="function-function-mq3-game-ai-main-botsetinfoconfigstring-function-botsetinfoconfigstring-services-bot-src-mq3-game-ai-main-ml-950538673"></a>
### BotSetInfoConfigString

```ml
function BotSetInfoConfigString(services, bot)
```

Forward `BotSetInfoConfigString` to `mq3.game.bot_ai_commands.setInfoConfigString` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `commandServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `gs` and `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L270)

<a id="function-function-mq3-game-ai-main-botteamleader-function-botteamleader-services-bot-src-mq3-game-ai-main-ml-1896558375"></a>
### BotTeamLeader

```ml
function BotTeamLeader(services, bot)
```

Apply `mq3.game.ai_main.need` while evaluating `BotTeamLeader`. Return paths include `other!=void and other.inuse`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `clientFromNameFn` and `lifecycleState`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `teamleader`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L389)

<a id="function-function-mq3-game-ai-main-botteamplayreport-function-botteamplayreport-services-src-mq3-game-ai-main-ml-1342412478"></a>
### BotTeamplayReport

```ml
function BotTeamplayReport(services)
```

Forward `BotTeamplayReport` to `mq3.game.bot_ai_commands.teamplayReport` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `commandServices`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L276)

<a id="function-function-mq3-game-ai-main-bottestaas-function-bottestaas-services-origin-src-mq3-game-ai-main-ml-1959558512"></a>
### BotTestAAS

```ml
function BotTestAAS(services, origin)
```

Apply `mq3.game.bot_lifecycle.updateCvar`, `mq3.game.ai_main.need` and `mq3.game.ai_main.BotAI_Print` while evaluating `BotTestAAS`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `lifecycleState`, `aasInitializedFn`, `pointAreaFn` and `areaInfoFn`. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L244)

<a id="function-function-mq3-game-ai-main-botupdateinfoconfigstrings-function-botupdateinfoconfigstrings-services-src-mq3-game-ai-main-ml-1156270866"></a>
### BotUpdateInfoConfigStrings

```ml
function BotUpdateInfoConfigStrings(services)
```

Forward `BotUpdateInfoConfigStrings` to `mq3.game.bot_ai_commands.updateInfoConfigStrings` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `commandServices`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L273)

<a id="function-function-mq3-game-ai-main-botupdateinput-function-botupdateinput-services-bot-command-time-elapsed-src-mq3-game-ai-main-ml-307541313"></a>
### BotUpdateInput

```ml
function BotUpdateInput(services, bot, command, time, elapsed)
```

Forward `BotUpdateInput` to `mq3.game.bot_input.updateInput` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `inputServices`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `viewangles`, `curPs` and `client`. May update `bot.viewangles[axis]` in place. |
| `command` | `dynamic` | — | Command record; accesses `buttons`. |
| `time` | `dynamic` | — | Time value in the units expected by this module. |
| `elapsed` | `dynamic` | — | Value passed as argument 1 to `mq3.compat.numeric.fdiv`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L308)

<a id="function-function-mq3-game-ai-main-botwriteinterbreeded-function-botwriteinterbreeded-services-filename-src-mq3-game-ai-main-ml-1469777757"></a>
### BotWriteInterbreeded

```ml
function BotWriteInterbreeded(services, filename)
```

Forward `BotWriteInterbreeded` to `mq3.game.bot_lifecycle.writeInterbreeded` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `lifecycleState`. |
| `filename` | `dynamic` | — | Filename supplied to the configured loader or file service. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L353)

<a id="function-function-mq3-game-ai-main-botwritesessiondata-function-botwritesessiondata-services-bot-src-mq3-game-ai-main-ml-1370959397"></a>
### BotWriteSessionData

```ml
function BotWriteSessionData(services, bot)
```

Apply `mq3.game.ai_main.sessionText` and `mq3.game.bot_lifecycle.setCvar` while evaluating `BotWriteSessionData`. Return paths include `text`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `sessions` and `lifecycleState`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L422)

<a id="function-function-mq3-game-ai-main-bridgebotlibvar-function-bridgebotlibvar-clientservices-name-value-src-mq3-game-ai-main-ml-1305280593"></a>
### bridgeBotLibVar

```ml
function bridgeBotLibVar(clientServices, name, value)
```

Forward `bridgeBotLibVar` to `mq3.game.bot_lifecycle.botLibVar` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientServices` | `dynamic` | — | Client services record; accesses `lifecycleState`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `value` | `dynamic` | — | Value passed as argument 3 to `state.botLibVarSetFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L157)

<a id="function-function-mq3-game-ai-main-bridgeinterbreeding-function-bridgeinterbreeding-frameservices-src-mq3-game-ai-main-ml-494468247"></a>
### bridgeInterbreeding

```ml
function bridgeInterbreeding(frameServices)
```

Forward `bridgeInterbreeding` to `mq3.game.ai_main.BotInterbreeding` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `frameServices` | `dynamic` | — | Frame services record; accesses `lifecycleState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L141)

<a id="function-function-mq3-game-ai-main-bridgereadsession-function-bridgereadsession-clientservices-bot-src-mq3-game-ai-main-ml-353735140"></a>
### bridgeReadSession

```ml
function bridgeReadSession(clientServices, bot)
```

Forward `bridgeReadSession` to `mq3.game.ai_main.BotReadSessionData` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientServices` | `dynamic` | — | Client services record; accesses `lifecycleState`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L148)

<a id="function-function-mq3-game-ai-main-bridgeschedulefromclient-function-bridgeschedulefromclient-clientservices-src-mq3-game-ai-main-ml-1023998207"></a>
### bridgeScheduleFromClient

```ml
function bridgeScheduleFromClient(clientServices)
```

Forward `bridgeScheduleFromClient` to `mq3.game.ai_main.BotScheduleBotThink` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientServices` | `dynamic` | — | Client services record; accesses `lifecycleState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L144)

<a id="function-function-mq3-game-ai-main-bridgeschedulefromframe-function-bridgeschedulefromframe-frameservices-src-mq3-game-ai-main-ml-1563276015"></a>
### bridgeScheduleFromFrame

```ml
function bridgeScheduleFromFrame(frameServices)
```

Forward `bridgeScheduleFromFrame` to `mq3.game.ai_main.BotScheduleBotThink` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `frameServices` | `dynamic` | — | Frame services record; accesses `lifecycleState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L138)

<a id="function-function-mq3-game-ai-main-bridgeshutdownclient-function-bridgeshutdownclient-state-client-restart-src-mq3-game-ai-main-ml-536097169"></a>
### bridgeShutdownClient

```ml
function bridgeShutdownClient(state, client, restart)
```

Forward `bridgeShutdownClient` to `mq3.game.ai_main.BotAIShutdownClient` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI main state; accesses `aiMainServices`. |
| `client` | `dynamic` | — | Value passed as argument 1 to `typeof`. |
| `restart` | `dynamic` | — | Whether initialization or shutdown belongs to a map restart. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L135)

<a id="function-function-mq3-game-ai-main-bridgewritesession-function-bridgewritesession-clientservices-bot-src-mq3-game-ai-main-ml-602323970"></a>
### bridgeWriteSession

```ml
function bridgeWriteSession(clientServices, bot)
```

Forward `bridgeWriteSession` to `mq3.game.ai_main.BotWriteSessionData` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientServices` | `dynamic` | — | Client services record; accesses `lifecycleState`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L152)

<a id="function-function-mq3-game-ai-main-create-function-create-state-src-mq3-game-ai-main-ml-696305625"></a>
### create

```ml
function create(state)
```

Update `state.clientResources`, `state.aiMainServices` and `state.shutdownClientFn` during `create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI main state; accesses `clientResources`, `aiMainServices` and `shutdownClientFn`. May update `state.clientResources`, `state.aiMainServices` and `state.shutdownClientFn` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L160)

<a id="function-function-mq3-game-ai-main-emit-function-emit-services-boundary-kind-subject-detail-number-src-mq3-game-ai-main-ml-1682409038"></a>
### emit

```ml
function emit(services, boundary, kind, subject, detail, number)
```

Set `services.actions` to `services.actions+[event]` in `mq3.game.ai_main.emit`. Return paths include `event`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `retailActive` and `actions`. May update `services.actions` in place. |
| `boundary` | `dynamic` | — | Initial value stored in `mq3.game.ai_main.Action.boundary`. |
| `kind` | `dynamic` | — | Initial value stored in `mq3.game.ai_main.Action.kind`. |
| `subject` | `dynamic` | — | Initial value stored in `mq3.game.ai_main.Action.subject`. |
| `detail` | `dynamic` | — | Initial value stored in `mq3.game.ai_main.Action.detail`. |
| `number` | `dynamic` | — | Initial value stored in `mq3.game.ai_main.Action.number`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L178)

<a id="function-function-mq3-game-ai-main-emptygoal-function-emptygoal-src-mq3-game-ai-main-ml-1760544178"></a>
### emptyGoal

```ml
function emptyGoal()
```

Create a `mq3.game.ai_main.SessionGoal` record, initializing `origin` as `[0.0,0.0,0.0]`, `mins` as `[0.0,0.0,0.0]` and `maxs` as `[0.0,0.0,0.0]`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L128)

<a id="function-function-mq3-game-ai-main-emptysession-function-emptysession-src-mq3-game-ai-main-ml-1111248182"></a>
### emptySession

```ml
function emptySession()
```

Create a `mq3.game.ai_main.SessionData` record, initializing `goal` as `emptyGoal()`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L130)

<a id="constant-constant-mq3-game-ai-main-gt-tournament-const-gt-tournament-1-src-mq3-game-ai-main-ml-1247335022"></a>
### GT_TOURNAMENT

```ml
const GT_TOURNAMENT = 1
```

Game-mode identifier selecting tournament rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L25)

<a id="constant-constant-mq3-game-ai-main-max-matchvariables-const-max-matchvariables-8-src-mq3-game-ai-main-ml-1407797493"></a>
### MAX_MATCHVARIABLES

```ml
const MAX_MATCHVARIABLES = 8
```

Upper bound on matchvariables represented by mq3.game.ai_main.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L27)

<a id="function-function-mq3-game-ai-main-need-function-need-callback-label-src-mq3-game-ai-main-ml-1895061179"></a>
### need

```ml
function need(callback, label)
```

Require a bot AI callback and report the missing service name when absent.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `callback` | `dynamic` | — | Callback invoked by this operation. |
| `label` | `dynamic` | — | Label retained with the diagnostic or action record. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L184)

<a id="function-function-mq3-game-ai-main-numbots-function-numbots-services-src-mq3-game-ai-main-ml-1320024698"></a>
### NumBots

```ml
function NumBots(services)
```

Return `services.lifecycleState.numbots` for `NumBots`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `lifecycleState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L385)

<a id="function-function-mq3-game-ai-main-parsesession-function-parsesession-text-src-mq3-game-ai-main-ml-1082290591"></a>
### parseSession

```ml
function parseSession(text)
```

Build the `mq3.game.ai_main.SessionData` result for `parseSession`. Return paths include `SessionData(toNumber(parts[0]),toNumber(parts[1]),toNumber(parts[2]),goal)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L413)

<a id="constant-constant-mq3-game-ai-main-prt-error-const-prt-error-3-src-mq3-game-ai-main-ml-106342300"></a>
### PRT_ERROR

```ml
const PRT_ERROR = 3
```

Bot print-message category selecting error severity or formatting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L19)

<a id="constant-constant-mq3-game-ai-main-prt-exit-const-prt-exit-5-src-mq3-game-ai-main-ml-815796502"></a>
### PRT_EXIT

```ml
const PRT_EXIT = 5
```

Bot print-message category selecting exit severity or formatting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L23)

<a id="constant-constant-mq3-game-ai-main-prt-fatal-const-prt-fatal-4-src-mq3-game-ai-main-ml-904340421"></a>
### PRT_FATAL

```ml
const PRT_FATAL = 4
```

Bot print-message category selecting fatal severity or formatting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L21)

<a id="constant-constant-mq3-game-ai-main-prt-message-const-prt-message-1-src-mq3-game-ai-main-ml-512457578"></a>
### PRT_MESSAGE

```ml
const PRT_MESSAGE = 1
```

Bot print-message category selecting message severity or formatting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L15)

<a id="constant-constant-mq3-game-ai-main-prt-warning-const-prt-warning-2-src-mq3-game-ai-main-ml-750203571"></a>
### PRT_WARNING

```ml
const PRT_WARNING = 2
```

Bot print-message category selecting warning severity or formatting.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L17)

<a id="function-function-mq3-game-ai-main-removecolorescapesequences-function-removecolorescapesequences-text-src-mq3-game-ai-main-ml-2104052531"></a>
### RemoveColorEscapeSequences

```ml
function RemoveColorEscapeSequences(text)
```

Direct native ownership delegates to the already isolated ai_main sections.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L262)

- [mq3.game.ai_main.Services](Type-mq3-game-ai-main-services-1097772398.md) — struct
- [mq3.game.ai_main.SessionData](Type-mq3-game-ai-main-sessiondata-1269821510.md) — struct
- [mq3.game.ai_main.SessionGoal](Type-mq3-game-ai-main-sessiongoal-1496691961.md) — struct
<a id="function-function-mq3-game-ai-main-sessiontext-function-sessiontext-data-src-mq3-game-ai-main-ml-1643702340"></a>
### sessionText

```ml
function sessionText(data)
```

Serialize persistent bot task and goal state as the ordered space-separated session fields.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — | Data record; accesses `goal`, `decisionmaker`, `ltgtype` and `teammate`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L407)

<a id="function-function-mq3-game-ai-main-validbot-function-validbot-services-client-src-mq3-game-ai-main-ml-1800200291"></a>
### validBot

```ml
function validBot(services, client)
```

Validate the client slot and return an active bot state, or void when the slot has no active bot.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — | Host service callbacks; accesses `lifecycleState`. |
| `client` | `dynamic` | — | Value passed as argument 1 to `typeof`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L188)
