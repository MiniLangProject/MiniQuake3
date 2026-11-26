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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `ang1` | `dynamic` | — |  |
| `ang2` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L125)

- [mq3.game.ai_main.AreaInfo](Type-mq3-game-ai-main-areainfo-1884411907.md) — struct
<a id="function-function-mq3-game-ai-main-botai-function-botai-services-client-thinktime-src-mq3-game-ai-main-ml-527853988"></a>
### BotAI

```ml
function BotAI(services, client, thinktime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `thinktime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L124)

<a id="function-function-mq3-game-ai-main-botai-botinitialchat-function-botai-botinitialchat-services-bot-type-variables-src-mq3-game-ai-main-ml-959737884"></a>
### BotAI_BotInitialChat

```ml
function BotAI_BotInitialChat(services, bot, type, variables)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |
| `variables` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L95)

<a id="function-function-mq3-game-ai-main-botai-getclientstate-function-botai-getclientstate-services-clientnum-src-mq3-game-ai-main-ml-699008065"></a>
### BotAI_GetClientState

```ml
function BotAI_GetClientState(services, clientNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L92)

<a id="function-function-mq3-game-ai-main-botai-getentitystate-function-botai-getentitystate-services-entitynum-src-mq3-game-ai-main-ml-1615327505"></a>
### BotAI_GetEntityState

```ml
function BotAI_GetEntityState(services, entityNum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `entityNum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L93)

<a id="function-function-mq3-game-ai-main-botai-getsnapshotentity-function-botai-getsnapshotentity-services-clientnum-sequence-src-mq3-game-ai-main-ml-1031611912"></a>
### BotAI_GetSnapshotEntity

```ml
function BotAI_GetSnapshotEntity(services, clientNum, sequence)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `clientNum` | `dynamic` | — |  |
| `sequence` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L94)

<a id="function-function-mq3-game-ai-main-botai-print-function-botai-print-services-type-message-src-mq3-game-ai-main-ml-590258897"></a>
### BotAI_Print

```ml
function BotAI_Print(services, type, message)
```

Botlib import boundaries from the first section of ai_main.c.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `type` | `dynamic` | — |  |
| `message` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L81)

<a id="function-function-mq3-game-ai-main-botai-trace-function-botai-trace-services-start-mins-maxs-traceend-passent-contentmask-src-mq3-game-ai-main-ml-2040512769"></a>
### BotAI_Trace

```ml
function BotAI_Trace(services, start, mins, maxs, traceEnd, passent, contentmask)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `start` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `traceEnd` | `dynamic` | — |  |
| `passent` | `dynamic` | — |  |
| `contentmask` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L87)

<a id="function-function-mq3-game-ai-main-botailoadmap-function-botailoadmap-services-restart-src-mq3-game-ai-main-ml-1396857543"></a>
### BotAILoadMap

```ml
function BotAILoadMap(services, restart)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `restart` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L135)

<a id="function-function-mq3-game-ai-main-botairegularupdate-function-botairegularupdate-services-src-mq3-game-ai-main-ml-381298474"></a>
### BotAIRegularUpdate

```ml
function BotAIRegularUpdate(services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L130)

<a id="function-function-mq3-game-ai-main-botaisetup-function-botaisetup-services-restart-src-mq3-game-ai-main-ml-1478174923"></a>
### BotAISetup

```ml
function BotAISetup(services, restart)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `restart` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L133)

<a id="function-function-mq3-game-ai-main-botaisetupclient-function-botaisetupclient-services-client-settings-restart-src-mq3-game-ai-main-ml-1704612377"></a>
### BotAISetupClient

```ml
function BotAISetupClient(services, client, settings, restart)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `settings` | `dynamic` | — |  |
| `restart` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L137)

<a id="function-function-mq3-game-ai-main-botaishutdown-function-botaishutdown-services-restart-src-mq3-game-ai-main-ml-2062204781"></a>
### BotAIShutdown

```ml
function BotAIShutdown(services, restart)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `restart` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L136)

<a id="function-function-mq3-game-ai-main-botaishutdownclient-function-botaishutdownclient-services-client-restart-src-mq3-game-ai-main-ml-953518476"></a>
### BotAIShutdownClient

```ml
function BotAIShutdownClient(services, client, restart)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `restart` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L138)

<a id="function-function-mq3-game-ai-main-botaistartframe-function-botaistartframe-services-level-time-src-mq3-game-ai-main-ml-2028619667"></a>
### BotAIStartFrame

```ml
function BotAIStartFrame(services, level, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `level` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L131)

<a id="function-function-mq3-game-ai-main-botchangeviewangle-function-botchangeviewangle-angle-ideal-speed-src-mq3-game-ai-main-ml-1410348535"></a>
### BotChangeViewAngle

```ml
function BotChangeViewAngle(angle, ideal, speed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `angle` | `dynamic` | — |  |
| `ideal` | `dynamic` | — |  |
| `speed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L126)

<a id="function-function-mq3-game-ai-main-botchangeviewangles-function-botchangeviewangles-services-bot-thinktime-src-mq3-game-ai-main-ml-1309017736"></a>
### BotChangeViewAngles

```ml
function BotChangeViewAngles(services, bot, thinktime)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `thinktime` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L127)

<a id="function-function-mq3-game-ai-main-botentityinfo-function-botentityinfo-services-entnum-src-mq3-game-ai-main-ml-1954135459"></a>
### BotEntityInfo

```ml
function BotEntityInfo(services, entnum)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `entnum` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L159)

<a id="function-function-mq3-game-ai-main-botinitlibrary-function-botinitlibrary-services-src-mq3-game-ai-main-ml-238076514"></a>
### BotInitLibrary

```ml
function BotInitLibrary(services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L132)

<a id="function-function-mq3-game-ai-main-botinputtousercommand-function-botinputtousercommand-botinput-command-deltaangles-time-src-mq3-game-ai-main-ml-1714495859"></a>
### BotInputToUserCommand

```ml
function BotInputToUserCommand(botInput, command, deltaAngles, time)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `botInput` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |
| `deltaAngles` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L128)

<a id="function-function-mq3-game-ai-main-botinterbreedbots-function-botinterbreedbots-services-src-mq3-game-ai-main-ml-1542150176"></a>
### BotInterbreedBots

```ml
function BotInterbreedBots(services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L139)

<a id="function-function-mq3-game-ai-main-botinterbreedendmatch-function-botinterbreedendmatch-services-src-mq3-game-ai-main-ml-1484010156"></a>
### BotInterbreedEndMatch

```ml
function BotInterbreedEndMatch(services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L141)

<a id="function-function-mq3-game-ai-main-botinterbreeding-function-botinterbreeding-services-src-mq3-game-ai-main-ml-1720303926"></a>
### BotInterbreeding

```ml
function BotInterbreeding(services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L143)

<a id="function-function-mq3-game-ai-main-botreadsessiondata-function-botreadsessiondata-services-bot-src-mq3-game-ai-main-ml-1913668769"></a>
### BotReadSessionData

```ml
function BotReadSessionData(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L191)

<a id="function-function-mq3-game-ai-main-botreportstatus-function-botreportstatus-services-bot-src-mq3-game-ai-main-ml-1538987827"></a>
### BotReportStatus

```ml
function BotReportStatus(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L120)

<a id="function-function-mq3-game-ai-main-botresetstate-function-botresetstate-services-bot-src-mq3-game-ai-main-ml-1457707039"></a>
### BotResetState

```ml
function BotResetState(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L134)

<a id="function-function-mq3-game-ai-main-botschedulebotthink-function-botschedulebotthink-services-src-mq3-game-ai-main-ml-1226473316"></a>
### BotScheduleBotThink

```ml
function BotScheduleBotThink(services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L169)

<a id="function-function-mq3-game-ai-main-botsetinfoconfigstring-function-botsetinfoconfigstring-services-bot-src-mq3-game-ai-main-ml-950538673"></a>
### BotSetInfoConfigString

```ml
function BotSetInfoConfigString(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L121)

<a id="function-function-mq3-game-ai-main-botteamleader-function-botteamleader-services-bot-src-mq3-game-ai-main-ml-1896558375"></a>
### BotTeamLeader

```ml
function BotTeamLeader(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L164)

<a id="function-function-mq3-game-ai-main-botteamplayreport-function-botteamplayreport-services-src-mq3-game-ai-main-ml-1342412478"></a>
### BotTeamplayReport

```ml
function BotTeamplayReport(services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L123)

<a id="function-function-mq3-game-ai-main-bottestaas-function-bottestaas-services-origin-src-mq3-game-ai-main-ml-1959558512"></a>
### BotTestAAS

```ml
function BotTestAAS(services, origin)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L102)

<a id="function-function-mq3-game-ai-main-botupdateinfoconfigstrings-function-botupdateinfoconfigstrings-services-src-mq3-game-ai-main-ml-1156270866"></a>
### BotUpdateInfoConfigStrings

```ml
function BotUpdateInfoConfigStrings(services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L122)

<a id="function-function-mq3-game-ai-main-botupdateinput-function-botupdateinput-services-bot-command-time-elapsed-src-mq3-game-ai-main-ml-307541313"></a>
### BotUpdateInput

```ml
function BotUpdateInput(services, bot, command, time, elapsed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `command` | `dynamic` | — |  |
| `time` | `dynamic` | — |  |
| `elapsed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L129)

<a id="function-function-mq3-game-ai-main-botwriteinterbreeded-function-botwriteinterbreeded-services-filename-src-mq3-game-ai-main-ml-1469777757"></a>
### BotWriteInterbreeded

```ml
function BotWriteInterbreeded(services, filename)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `filename` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L140)

<a id="function-function-mq3-game-ai-main-botwritesessiondata-function-botwritesessiondata-services-bot-src-mq3-game-ai-main-ml-1370959397"></a>
### BotWriteSessionData

```ml
function BotWriteSessionData(services, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L188)

<a id="function-function-mq3-game-ai-main-bridgebotlibvar-function-bridgebotlibvar-clientservices-name-value-src-mq3-game-ai-main-ml-1305280593"></a>
### bridgeBotLibVar

```ml
function bridgeBotLibVar(clientServices, name, value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientServices` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L59)

<a id="function-function-mq3-game-ai-main-bridgeinterbreeding-function-bridgeinterbreeding-frameservices-src-mq3-game-ai-main-ml-494468247"></a>
### bridgeInterbreeding

```ml
function bridgeInterbreeding(frameServices)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `frameServices` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L55)

<a id="function-function-mq3-game-ai-main-bridgereadsession-function-bridgereadsession-clientservices-bot-src-mq3-game-ai-main-ml-353735140"></a>
### bridgeReadSession

```ml
function bridgeReadSession(clientServices, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientServices` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L57)

<a id="function-function-mq3-game-ai-main-bridgeschedulefromclient-function-bridgeschedulefromclient-clientservices-src-mq3-game-ai-main-ml-1023998207"></a>
### bridgeScheduleFromClient

```ml
function bridgeScheduleFromClient(clientServices)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientServices` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L56)

<a id="function-function-mq3-game-ai-main-bridgeschedulefromframe-function-bridgeschedulefromframe-frameservices-src-mq3-game-ai-main-ml-1563276015"></a>
### bridgeScheduleFromFrame

```ml
function bridgeScheduleFromFrame(frameServices)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `frameServices` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L54)

<a id="function-function-mq3-game-ai-main-bridgeshutdownclient-function-bridgeshutdownclient-state-client-restart-src-mq3-game-ai-main-ml-536097169"></a>
### bridgeShutdownClient

```ml
function bridgeShutdownClient(state, client, restart)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `restart` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L53)

<a id="function-function-mq3-game-ai-main-bridgewritesession-function-bridgewritesession-clientservices-bot-src-mq3-game-ai-main-ml-602323970"></a>
### bridgeWriteSession

```ml
function bridgeWriteSession(clientServices, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `clientServices` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L58)

<a id="function-function-mq3-game-ai-main-create-function-create-state-src-mq3-game-ai-main-ml-696305625"></a>
### create

```ml
function create(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L60)

<a id="function-function-mq3-game-ai-main-emit-function-emit-services-boundary-kind-subject-detail-number-src-mq3-game-ai-main-ml-1682409038"></a>
### emit

```ml
function emit(services, boundary, kind, subject, detail, number)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `boundary` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `subject` | `dynamic` | — |  |
| `detail` | `dynamic` | — |  |
| `number` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L71)

<a id="function-function-mq3-game-ai-main-emptygoal-function-emptygoal-src-mq3-game-ai-main-ml-1760544178"></a>
### emptyGoal

```ml
function emptyGoal()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L51)

<a id="function-function-mq3-game-ai-main-emptysession-function-emptysession-src-mq3-game-ai-main-ml-1111248182"></a>
### emptySession

```ml
function emptySession()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L52)

<a id="constant-constant-mq3-game-ai-main-gt-tournament-const-gt-tournament-1-src-mq3-game-ai-main-ml-1247335022"></a>
### GT_TOURNAMENT

```ml
const GT_TOURNAMENT = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L19)

<a id="constant-constant-mq3-game-ai-main-max-matchvariables-const-max-matchvariables-8-src-mq3-game-ai-main-ml-1407797493"></a>
### MAX_MATCHVARIABLES

```ml
const MAX_MATCHVARIABLES = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L20)

<a id="function-function-mq3-game-ai-main-need-function-need-callback-label-src-mq3-game-ai-main-ml-1895061179"></a>
### need

```ml
function need(callback, label)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `callback` | `dynamic` | — |  |
| `label` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L74)

<a id="function-function-mq3-game-ai-main-numbots-function-numbots-services-src-mq3-game-ai-main-ml-1320024698"></a>
### NumBots

```ml
function NumBots(services)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L163)

<a id="function-function-mq3-game-ai-main-parsesession-function-parsesession-text-src-mq3-game-ai-main-ml-1082290591"></a>
### parseSession

```ml
function parseSession(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L182)

<a id="constant-constant-mq3-game-ai-main-prt-error-const-prt-error-3-src-mq3-game-ai-main-ml-106342300"></a>
### PRT_ERROR

```ml
const PRT_ERROR = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L16)

<a id="constant-constant-mq3-game-ai-main-prt-exit-const-prt-exit-5-src-mq3-game-ai-main-ml-815796502"></a>
### PRT_EXIT

```ml
const PRT_EXIT = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L18)

<a id="constant-constant-mq3-game-ai-main-prt-fatal-const-prt-fatal-4-src-mq3-game-ai-main-ml-904340421"></a>
### PRT_FATAL

```ml
const PRT_FATAL = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L17)

<a id="constant-constant-mq3-game-ai-main-prt-message-const-prt-message-1-src-mq3-game-ai-main-ml-512457578"></a>
### PRT_MESSAGE

```ml
const PRT_MESSAGE = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L14)

<a id="constant-constant-mq3-game-ai-main-prt-warning-const-prt-warning-2-src-mq3-game-ai-main-ml-750203571"></a>
### PRT_WARNING

```ml
const PRT_WARNING = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L15)

<a id="function-function-mq3-game-ai-main-removecolorescapesequences-function-removecolorescapesequences-text-src-mq3-game-ai-main-ml-2104052531"></a>
### RemoveColorEscapeSequences

```ml
function RemoveColorEscapeSequences(text)
```

Direct native ownership delegates to the already isolated ai_main sections.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L119)

- [mq3.game.ai_main.Services](Type-mq3-game-ai-main-services-1097772398.md) — struct
- [mq3.game.ai_main.SessionData](Type-mq3-game-ai-main-sessiondata-1269821510.md) — struct
- [mq3.game.ai_main.SessionGoal](Type-mq3-game-ai-main-sessiongoal-1496691961.md) — struct
<a id="function-function-mq3-game-ai-main-sessiontext-function-sessiontext-data-src-mq3-game-ai-main-ml-1643702340"></a>
### sessionText

```ml
function sessionText(data)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L178)

<a id="function-function-mq3-game-ai-main-validbot-function-validbot-services-client-src-mq3-game-ai-main-ml-1800200291"></a>
### validBot

```ml
function validBot(services, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `services` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_main.ml#L75)
