# `src/mq3/game/ai_team.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.ai_team`](Package-mq3-game-ai-team-919504124.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/bot_ai_headers.ml` as `aiheaders` → [src/mq3/game/bot_ai_headers.ml](File-src-mq3-game-bot-ai-headers-ml-1280419323.md)
- `mq3/game/bot_team_helpers.ml` as `base` → [src/mq3/game/bot_team_helpers.ml](File-src-mq3-game-bot-team-helpers-ml-2010714111.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-ai-team-accompany-function-accompany-state-bot-client-suppressed-src-mq3-game-ai-team-ml-540785793"></a>
### accompany

```ml
function accompany(state, bot, client, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L182)

- [mq3.game.ai_team.Action](Type-mq3-game-ai-team-action-1662876.md) — struct
- [mq3.game.ai_team.Bot](Type-mq3-game-ai-team-bot-1150762343.md) — struct
<a id="function-function-mq3-game-ai-team-bot1fctforders-function-bot1fctforders-state-bot-suppressed-src-mq3-game-ai-team-ml-1779250774"></a>
### Bot1FCTFOrders

```ml
function Bot1FCTFOrders(state, bot, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L315)

<a id="function-function-mq3-game-ai-team-bot1fctforders-enemydroppedflag-function-bot1fctforders-enemydroppedflag-state-bot-suppressed-src-mq3-game-ai-team-ml-673464300"></a>
### Bot1FCTFOrders_EnemyDroppedFlag

```ml
function Bot1FCTFOrders_EnemyDroppedFlag(state, bot, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L314)

<a id="function-function-mq3-game-ai-team-bot1fctforders-enemyhasflag-function-bot1fctforders-enemyhasflag-state-bot-suppressed-src-mq3-game-ai-team-ml-462561540"></a>
### Bot1FCTFOrders_EnemyHasFlag

```ml
function Bot1FCTFOrders_EnemyHasFlag(state, bot, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L313)

<a id="function-function-mq3-game-ai-team-bot1fctforders-flagatcenter-function-bot1fctforders-flagatcenter-state-bot-suppressed-src-mq3-game-ai-team-ml-1755404488"></a>
### Bot1FCTFOrders_FlagAtCenter

```ml
function Bot1FCTFOrders_FlagAtCenter(state, bot, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L311)

<a id="function-function-mq3-game-ai-team-bot1fctforders-teamhasflag-function-bot1fctforders-teamhasflag-state-bot-suppressed-src-mq3-game-ai-team-ml-195825214"></a>
### Bot1FCTFOrders_TeamHasFlag

```ml
function Bot1FCTFOrders_TeamHasFlag(state, bot, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L312)

<a id="function-function-mq3-game-ai-team-botclienttraveltimetogoal-function-botclienttraveltimetogoal-state-client-goalarea-src-mq3-game-ai-team-ml-2138608992"></a>
### BotClientTravelTimeToGoal

```ml
function BotClientTravelTimeToGoal(state, client, goalArea)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `goalArea` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L294)

<a id="function-function-mq3-game-ai-team-botcreategroup-function-botcreategroup-state-bot-mates-size-suppressed-src-mq3-game-ai-team-ml-13793911"></a>
### BotCreateGroup

```ml
function BotCreateGroup(state, bot, mates, size, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `mates` | `dynamic` | — |  |
| `size` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L309)

<a id="function-function-mq3-game-ai-team-botctforders-function-botctforders-state-bot-suppressed-src-mq3-game-ai-team-ml-1288319958"></a>
### BotCTFOrders

```ml
function BotCTFOrders(state, bot, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L308)

<a id="function-function-mq3-game-ai-team-botctforders-bothflagsatbase-function-botctforders-bothflagsatbase-state-bot-src-mq3-game-ai-team-ml-576382188"></a>
### BotCTFOrders_BothFlagsAtBase

```ml
function BotCTFOrders_BothFlagsAtBase(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L307)

<a id="function-function-mq3-game-ai-team-botctforders-bothflagsnotatbase-function-botctforders-bothflagsnotatbase-state-bot-src-mq3-game-ai-team-ml-288134854"></a>
### BotCTFOrders_BothFlagsNotAtBase

```ml
function BotCTFOrders_BothFlagsNotAtBase(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L304)

<a id="function-function-mq3-game-ai-team-botctforders-enemyflagnotatbase-function-botctforders-enemyflagnotatbase-state-bot-src-mq3-game-ai-team-ml-1381459326"></a>
### BotCTFOrders_EnemyFlagNotAtBase

```ml
function BotCTFOrders_EnemyFlagNotAtBase(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L306)

<a id="function-function-mq3-game-ai-team-botctforders-flagnotatbase-function-botctforders-flagnotatbase-state-bot-src-mq3-game-ai-team-ml-525196800"></a>
### BotCTFOrders_FlagNotAtBase

```ml
function BotCTFOrders_FlagNotAtBase(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L305)

<a id="function-function-mq3-game-ai-team-botgetteammatetaskpreference-function-botgetteammatetaskpreference-state-bot-client-src-mq3-game-ai-team-ml-441555329"></a>
### BotGetTeamMateTaskPreference

```ml
function BotGetTeamMateTaskPreference(state, bot, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L297)

<a id="function-function-mq3-game-ai-team-botharvesterorders-function-botharvesterorders-state-bot-suppressed-src-mq3-game-ai-team-ml-61637210"></a>
### BotHarvesterOrders

```ml
function BotHarvesterOrders(state, bot, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L317)

<a id="function-function-mq3-game-ai-team-botnumteammates-function-botnumteammates-state-bot-src-mq3-game-ai-team-ml-2116812704"></a>
### BotNumTeamMates

```ml
function BotNumTeamMates(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L293)

<a id="function-function-mq3-game-ai-team-botobeliskorders-function-botobeliskorders-state-bot-suppressed-src-mq3-game-ai-team-ml-65757566"></a>
### BotObeliskOrders

```ml
function BotObeliskOrders(state, bot, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L316)

<a id="function-function-mq3-game-ai-team-botsayteamorder-function-botsayteamorder-state-bot-client-suppressed-src-mq3-game-ai-team-ml-1108574497"></a>
### BotSayTeamOrder

```ml
function BotSayTeamOrder(state, bot, client, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L300)

<a id="function-function-mq3-game-ai-team-botsayteamorderalways-function-botsayteamorderalways-state-bot-client-suppressed-src-mq3-game-ai-team-ml-298751759"></a>
### BotSayTeamOrderAlways

```ml
function BotSayTeamOrderAlways(state, bot, client, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L299)

<a id="function-function-mq3-game-ai-team-botsayvoiceteamorder-function-botsayvoiceteamorder-state-bot-client-voice-suppressed-src-mq3-game-ai-team-ml-774784123"></a>
### BotSayVoiceTeamOrder

```ml
function BotSayVoiceTeamOrder(state, bot, client, voice, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `voice` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L303)

<a id="function-function-mq3-game-ai-team-botsetteammatetaskpreference-function-botsetteammatetaskpreference-state-bot-client-preference-src-mq3-game-ai-team-ml-306338990"></a>
### BotSetTeamMateTaskPreference

```ml
function BotSetTeamMateTaskPreference(state, bot, client, preference)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `preference` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L296)

<a id="function-function-mq3-game-ai-team-botsortteammatesbybasetraveltime-function-botsortteammatesbybasetraveltime-state-bot-maxteammates-src-mq3-game-ai-team-ml-203134745"></a>
### BotSortTeamMatesByBaseTravelTime

```ml
function BotSortTeamMatesByBaseTravelTime(state, bot, maxTeamMates)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `maxTeamMates` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L295)

<a id="function-function-mq3-game-ai-team-botsortteammatesbytaskpreference-function-botsortteammatesbytaskpreference-state-bot-mates-src-mq3-game-ai-team-ml-1338918030"></a>
### BotSortTeamMatesByTaskPreference

```ml
function BotSortTeamMatesByTaskPreference(state, bot, mates)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `mates` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L298)

<a id="function-function-mq3-game-ai-team-botteamai-function-botteamai-state-bot-suppressed-src-mq3-game-ai-team-ml-188374118"></a>
### BotTeamAI

```ml
function BotTeamAI(state, bot, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L319)

<a id="function-function-mq3-game-ai-team-botteamorders-function-botteamorders-state-bot-suppressed-src-mq3-game-ai-team-ml-1907869636"></a>
### BotTeamOrders

```ml
function BotTeamOrders(state, bot, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L310)

<a id="function-function-mq3-game-ai-team-botvalidteamleader-function-botvalidteamleader-state-bot-src-mq3-game-ai-team-ml-986929376"></a>
### BotValidTeamLeader

```ml
function BotValidTeamLeader(state, bot)
```

Original exported spellings retained for symbol-level port auditing.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L292)

<a id="function-function-mq3-game-ai-team-botvoicechat-function-botvoicechat-state-bot-client-voice-suppressed-src-mq3-game-ai-team-ml-682669779"></a>
### BotVoiceChat

```ml
function BotVoiceChat(state, bot, client, voice, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `voice` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L301)

<a id="function-function-mq3-game-ai-team-botvoicechatonly-function-botvoicechatonly-state-bot-client-voice-suppressed-src-mq3-game-ai-team-ml-1489456775"></a>
### BotVoiceChatOnly

```ml
function BotVoiceChatOnly(state, bot, client, voice, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `voice` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L302)

<a id="function-function-mq3-game-ai-team-chatcallback-function-chatcallback-helper-bot-kind-args-src-mq3-game-ai-team-ml-1046650696"></a>
### chatCallback

```ml
function chatCallback(helper, bot, kind, args)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `helper` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L257)

<a id="function-function-mq3-game-ai-team-clienttraveltimetogoal-function-clienttraveltimetogoal-state-client-goalarea-src-mq3-game-ai-team-ml-1394181902"></a>
### clientTravelTimeToGoal

```ml
function clientTravelTimeToGoal(state, client, goalArea)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `goalArea` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L107)

<a id="function-function-mq3-game-ai-team-create-function-create-src-mq3-game-ai-team-ml-62702850"></a>
### create

```ml
function create()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L62)

<a id="function-function-mq3-game-ai-team-createbot-function-createbot-client-src-mq3-game-ai-team-ml-13413833"></a>
### createBot

```ml
function createBot(client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L69)

<a id="function-function-mq3-game-ai-team-creategroup-function-creategroup-state-bot-mates-groupsize-suppressed-src-mq3-game-ai-team-ml-1154936196"></a>
### createGroup

```ml
function createGroup(state, bot, mates, groupSize, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `mates` | `dynamic` | — |  |
| `groupSize` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L231)

<a id="function-function-mq3-game-ai-team-ctforders-function-ctforders-state-bot-suppressed-src-mq3-game-ai-team-ml-671675270"></a>
### ctfOrders

```ml
function ctfOrders(state, bot, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L251)

<a id="constant-constant-mq3-game-ai-team-ctfs-agressive-const-ctfs-agressive-aiheaders-ctfs-agressive-src-mq3-game-ai-team-ml-571909889"></a>
### CTFS_AGRESSIVE

```ml
const CTFS_AGRESSIVE = aiheaders.CTFS_AGRESSIVE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L21)

<a id="function-function-mq3-game-ai-team-distribute-function-distribute-state-bot-defendtenths-attacktenths-defendcap-attackcap-attackchat-attackvoice-suppressed-src-mq3-game-ai-team-ml-1162628946"></a>
### distribute

```ml
function distribute(state, bot, defendTenths, attackTenths, defendCap, attackCap, attackChat, attackVoice, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `defendTenths` | `dynamic` | — |  |
| `attackTenths` | `dynamic` | — |  |
| `defendCap` | `dynamic` | — |  |
| `attackCap` | `dynamic` | — |  |
| `attackChat` | `dynamic` | — |  |
| `attackVoice` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L152)

<a id="function-function-mq3-game-ai-team-emit-function-emit-state-kind-client-target-text-args-suppressed-src-mq3-game-ai-team-ml-1275752297"></a>
### emit

```ml
function emit(state, kind, client, target, text, args, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L73)

<a id="function-function-mq3-game-ai-team-findhumanteamleader-function-findhumanteamleader-state-bot-suppressed-src-mq3-game-ai-team-ml-1724670142"></a>
### FindHumanTeamLeader

```ml
function FindHumanTeamLeader(state, bot, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L318)

<a id="function-function-mq3-game-ai-team-findhumanteamleader-function-findhumanteamleader-state-bot-suppressed-src-mq3-game-ai-team-ml-994701438"></a>
### findHumanTeamLeader

```ml
function findHumanTeamLeader(state, bot, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L242)

<a id="function-function-mq3-game-ai-team-getteammatetaskpreference-function-getteammatetaskpreference-state-bot-teammate-src-mq3-game-ai-team-ml-1582623832"></a>
### getTeamMateTaskPreference

```ml
function getTeamMateTaskPreference(state, bot, teammate)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `teammate` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L134)

<a id="constant-constant-mq3-game-ai-team-gt-1fctf-const-gt-1fctf-5-src-mq3-game-ai-team-ml-311265716"></a>
### GT_1FCTF

```ml
const GT_1FCTF = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L18)

<a id="constant-constant-mq3-game-ai-team-gt-ctf-const-gt-ctf-4-src-mq3-game-ai-team-ml-2119169225"></a>
### GT_CTF

```ml
const GT_CTF = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L17)

<a id="constant-constant-mq3-game-ai-team-gt-harvester-const-gt-harvester-7-src-mq3-game-ai-team-ml-773746342"></a>
### GT_HARVESTER

```ml
const GT_HARVESTER = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L20)

<a id="constant-constant-mq3-game-ai-team-gt-obelisk-const-gt-obelisk-6-src-mq3-game-ai-team-ml-1985518399"></a>
### GT_OBELISK

```ml
const GT_OBELISK = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L19)

<a id="constant-constant-mq3-game-ai-team-gt-team-const-gt-team-3-src-mq3-game-ai-team-ml-1050245100"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L16)

<a id="function-function-mq3-game-ai-team-harvesterorders-function-harvesterorders-state-bot-suppressed-src-mq3-game-ai-team-ml-1198378508"></a>
### harvesterOrders

```ml
function harvesterOrders(state, bot, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L226)

<a id="constant-constant-mq3-game-ai-team-max-clients-const-max-clients-64-src-mq3-game-ai-team-ml-1417102719"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L12)

<a id="function-function-mq3-game-ai-team-nameof-function-nameof-state-client-src-mq3-game-ai-team-ml-958635744"></a>
### nameOf

```ml
function nameOf(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L84)

<a id="function-function-mq3-game-ai-team-numteammates-function-numteammates-state-bot-src-mq3-game-ai-team-ml-958268696"></a>
### numTeamMates

```ml
function numTeamMates(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L96)

<a id="function-function-mq3-game-ai-team-obeliskorders-function-obeliskorders-state-bot-suppressed-src-mq3-game-ai-team-ml-238533318"></a>
### obeliskOrders

```ml
function obeliskOrders(state, bot, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L222)

<a id="function-function-mq3-game-ai-team-oneflagatcenter-function-oneflagatcenter-state-bot-suppressed-src-mq3-game-ai-team-ml-1484593750"></a>
### oneFlagAtCenter

```ml
function oneFlagAtCenter(state, bot, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L167)

<a id="function-function-mq3-game-ai-team-oneflagenemydropped-function-oneflagenemydropped-state-bot-suppressed-src-mq3-game-ai-team-ml-1627958570"></a>
### oneFlagEnemyDropped

```ml
function oneFlagEnemyDropped(state, bot, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L180)

<a id="function-function-mq3-game-ai-team-oneflagenemyhasflag-function-oneflagenemyhasflag-state-bot-suppressed-src-mq3-game-ai-team-ml-1330454486"></a>
### oneFlagEnemyHasFlag

```ml
function oneFlagEnemyHasFlag(state, bot, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L203)

<a id="function-function-mq3-game-ai-team-oneflagorders-function-oneflagorders-state-bot-suppressed-src-mq3-game-ai-team-ml-413906764"></a>
### oneFlagOrders

```ml
function oneFlagOrders(state, bot, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L214)

<a id="function-function-mq3-game-ai-team-oneflagteamhasflag-function-oneflagteamhasflag-state-bot-suppressed-src-mq3-game-ai-team-ml-1592100046"></a>
### oneFlagTeamHasFlag

```ml
function oneFlagTeamHasFlag(state, bot, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L188)

<a id="function-function-mq3-game-ai-team-order-function-order-state-bot-kind-toclient-args-voice-suppressed-src-mq3-game-ai-team-ml-1733070945"></a>
### order

```ml
function order(state, bot, kind, toClient, args, voice, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `toClient` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |
| `voice` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L143)

<a id="function-function-mq3-game-ai-team-ordercallback-function-ordercallback-helper-bot-target-src-mq3-game-ai-team-ml-998178596"></a>
### orderCallback

```ml
function orderCallback(helper, bot, target)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `helper` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `target` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L258)

<a id="function-function-mq3-game-ai-team-rounded-function-rounded-count-tenths-src-mq3-game-ai-team-ml-416032057"></a>
### rounded

```ml
function rounded(count, tenths)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `count` | `dynamic` | — |  |
| `tenths` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L150)

<a id="function-function-mq3-game-ai-team-sameteam-function-sameteam-state-bot-client-src-mq3-game-ai-team-ml-461871281"></a>
### sameTeam

```ml
function sameTeam(state, bot, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L85)

<a id="function-function-mq3-game-ai-team-sayteamorder-function-sayteamorder-state-bot-toclient-suppressed-src-mq3-game-ai-team-ml-506214728"></a>
### sayTeamOrder

```ml
function sayTeamOrder(state, bot, toClient, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `toClient` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L138)

<a id="function-function-mq3-game-ai-team-sayteamorderalways-function-sayteamorderalways-state-bot-toclient-suppressed-src-mq3-game-ai-team-ml-1302051576"></a>
### sayTeamOrderAlways

```ml
function sayTeamOrderAlways(state, bot, toClient, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `toClient` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L137)

<a id="function-function-mq3-game-ai-team-sayvoiceteamorder-function-sayvoiceteamorder-state-bot-toclient-voice-suppressed-src-mq3-game-ai-team-ml-1253028278"></a>
### sayVoiceTeamOrder

```ml
function sayVoiceTeamOrder(state, bot, toClient, voice, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `toClient` | `dynamic` | — |  |
| `voice` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L141)

<a id="function-function-mq3-game-ai-team-setteammatetaskpreference-function-setteammatetaskpreference-state-bot-teammate-preference-src-mq3-game-ai-team-ml-977982435"></a>
### setTeamMateTaskPreference

```ml
function setTeamMateTaskPreference(state, bot, teammate, preference)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `teammate` | `dynamic` | — |  |
| `preference` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L133)

<a id="function-function-mq3-game-ai-team-sortcallback-function-sortcallback-helper-bot-src-mq3-game-ai-team-ml-1709896869"></a>
### sortCallback

```ml
function sortCallback(helper, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `helper` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L256)

<a id="function-function-mq3-game-ai-team-sorted-function-sorted-state-bot-src-mq3-game-ai-team-ml-1480426344"></a>
### sorted

```ml
function sorted(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L149)

<a id="function-function-mq3-game-ai-team-sortteammatesbybasetraveltime-function-sortteammatesbybasetraveltime-state-bot-maxteammates-src-mq3-game-ai-team-ml-1795977205"></a>
### sortTeamMatesByBaseTravelTime

```ml
function sortTeamMatesByBaseTravelTime(state, bot, maxTeamMates)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `maxTeamMates` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L117)

<a id="function-function-mq3-game-ai-team-sortteammatesbytaskpreference-function-sortteammatesbytaskpreference-state-bot-teammates-src-mq3-game-ai-team-ml-773321815"></a>
### sortTeamMatesByTaskPreference

```ml
function sortTeamMatesByTaskPreference(state, bot, teammates)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `teammates` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L135)

- [mq3.game.ai_team.State](Type-mq3-game-ai-team-state-677439307.md) — struct
<a id="function-function-mq3-game-ai-team-sync-function-sync-state-src-mq3-game-ai-team-ml-284683317"></a>
### sync

```ml
function sync(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L78)

<a id="function-function-mq3-game-ai-team-team-function-team-state-bot-src-mq3-game-ai-team-ml-317102196"></a>
### team

```ml
function team(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L86)

<a id="constant-constant-mq3-game-ai-team-team-blue-const-team-blue-2-src-mq3-game-ai-team-ml-773055175"></a>
### TEAM_BLUE

```ml
const TEAM_BLUE = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L14)

<a id="constant-constant-mq3-game-ai-team-team-red-const-team-red-1-src-mq3-game-ai-team-ml-1130845786"></a>
### TEAM_RED

```ml
const TEAM_RED = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L13)

<a id="constant-constant-mq3-game-ai-team-team-spectator-const-team-spectator-3-src-mq3-game-ai-team-ml-1216517788"></a>
### TEAM_SPECTATOR

```ml
const TEAM_SPECTATOR = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L15)

<a id="function-function-mq3-game-ai-team-teamai-function-teamai-state-bot-suppressed-src-mq3-game-ai-team-ml-1386424202"></a>
### teamAI

```ml
function teamAI(state, bot, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L269)

<a id="function-function-mq3-game-ai-team-teamorders-function-teamorders-state-bot-suppressed-src-mq3-game-ai-team-ml-1681795970"></a>
### teamOrders

```ml
function teamOrders(state, bot, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L236)

<a id="constant-constant-mq3-game-ai-team-teamtp-attacker-const-teamtp-attacker-aiheaders-teamtp-attacker-src-mq3-game-ai-team-ml-1198667270"></a>
### TEAMTP_ATTACKER

```ml
const TEAMTP_ATTACKER = aiheaders.TEAMTP_ATTACKER
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L22)

<a id="constant-constant-mq3-game-ai-team-teamtp-defender-const-teamtp-defender-aiheaders-teamtp-defender-src-mq3-game-ai-team-ml-680446510"></a>
### TEAMTP_DEFENDER

```ml
const TEAMTP_DEFENDER = aiheaders.TEAMTP_DEFENDER
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L23)

<a id="function-function-mq3-game-ai-team-validteamleader-function-validteamleader-state-bot-src-mq3-game-ai-team-ml-2120133184"></a>
### validTeamLeader

```ml
function validTeamLeader(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L88)

<a id="function-function-mq3-game-ai-team-voicechat-function-voicechat-state-bot-toclient-voice-suppressed-src-mq3-game-ai-team-ml-1123937062"></a>
### voiceChat

```ml
function voiceChat(state, bot, toClient, voice, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `toClient` | `dynamic` | — |  |
| `voice` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L139)

<a id="function-function-mq3-game-ai-team-voicechatonly-function-voicechatonly-state-bot-toclient-voice-suppressed-src-mq3-game-ai-team-ml-131990126"></a>
### voiceChatOnly

```ml
function voiceChatOnly(state, bot, toClient, voice, suppressed)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `toClient` | `dynamic` | — |  |
| `voice` | `dynamic` | — |  |
| `suppressed` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/ai_team.ml#L140)
