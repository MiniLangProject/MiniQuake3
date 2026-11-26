# `src/mq3/game/ai_team.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.ai_team`](Package-mq3-game-ai-team-919504124.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/bot_ai_headers.ml` as `aiheaders` → [src/mq3/game/bot_ai_headers.ml](File-src-mq3-game-bot-ai-headers-ml-1280419323.md)
- `mq3/game/bot_team_helpers.ml` as `base` → [src/mq3/game/bot_team_helpers.ml](File-src-mq3-game-bot-team-helpers-ml-2010714111.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-ai-team-accompany-function-accompany-state-bot-client-suppressed-src-mq3-game-ai-team-ml-540785793"></a>
### accompany

```ml
function accompany(state, bot, client, suppressed)
```

Apply `mq3.game.ai_team.order` and `mq3.game.ai_team.nameOf` while evaluating `accompany`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `actions`. May update `state.actions` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `flagcarrier` and `client`. |
| `client` | `dynamic` | — | Initial value stored in `mq3.game.ai_team.Action.target`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L355)

- [mq3.game.ai_team.Action](Type-mq3-game-ai-team-action-1662876.md) — struct
- [mq3.game.ai_team.Bot](Type-mq3-game-ai-team-bot-1150762343.md) — struct
<a id="function-function-mq3-game-ai-team-bot1fctforders-function-bot1fctforders-state-bot-suppressed-src-mq3-game-ai-team-ml-1779250774"></a>
### Bot1FCTFOrders

```ml
function Bot1FCTFOrders(state, bot, suppressed)
```

Forward `Bot1FCTFOrders` to `mq3.game.ai_team.oneFlagOrders` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `helper`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `neutralflagstatus`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L642)

<a id="function-function-mq3-game-ai-team-bot1fctforders-enemydroppedflag-function-bot1fctforders-enemydroppedflag-state-bot-suppressed-src-mq3-game-ai-team-ml-673464300"></a>
### Bot1FCTFOrders_EnemyDroppedFlag

```ml
function Bot1FCTFOrders_EnemyDroppedFlag(state, bot, suppressed)
```

Forward `Bot1FCTFOrders_EnemyDroppedFlag` to `mq3.game.ai_team.oneFlagEnemyDropped` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `helper`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ctfstrategy`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L637)

<a id="function-function-mq3-game-ai-team-bot1fctforders-enemyhasflag-function-bot1fctforders-enemyhasflag-state-bot-suppressed-src-mq3-game-ai-team-ml-462561540"></a>
### Bot1FCTFOrders_EnemyHasFlag

```ml
function Bot1FCTFOrders_EnemyHasFlag(state, bot, suppressed)
```

Forward `Bot1FCTFOrders_EnemyHasFlag` to `mq3.game.ai_team.oneFlagEnemyHasFlag` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `helper`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ctfstrategy`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L632)

<a id="function-function-mq3-game-ai-team-bot1fctforders-flagatcenter-function-bot1fctforders-flagatcenter-state-bot-suppressed-src-mq3-game-ai-team-ml-1755404488"></a>
### Bot1FCTFOrders_FlagAtCenter

```ml
function Bot1FCTFOrders_FlagAtCenter(state, bot, suppressed)
```

Forward `Bot1FCTFOrders_FlagAtCenter` to `mq3.game.ai_team.oneFlagAtCenter` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `helper`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ctfstrategy`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L622)

<a id="function-function-mq3-game-ai-team-bot1fctforders-teamhasflag-function-bot1fctforders-teamhasflag-state-bot-suppressed-src-mq3-game-ai-team-ml-195825214"></a>
### Bot1FCTFOrders_TeamHasFlag

```ml
function Bot1FCTFOrders_TeamHasFlag(state, bot, suppressed)
```

Forward `Bot1FCTFOrders_TeamHasFlag` to `mq3.game.ai_team.oneFlagTeamHasFlag` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `helper`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ctfstrategy` and `flagcarrier`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L627)

<a id="function-function-mq3-game-ai-team-botclienttraveltimetogoal-function-botclienttraveltimetogoal-state-client-goalarea-src-mq3-game-ai-team-ml-2138608992"></a>
### BotClientTravelTimeToGoal

```ml
function BotClientTravelTimeToGoal(state, client, goalArea)
```

Forward `BotClientTravelTimeToGoal` to `mq3.game.ai_team.clientTravelTimeToGoal` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `clientStateFn`, `pointAreaFn`, `travelTimeFn` and `travelTimes`. |
| `client` | `dynamic` | — | Value passed as argument 2 to `state.clientStateFn`. |
| `goalArea` | `dynamic` | — | Destination AAS area number. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L530)

<a id="function-function-mq3-game-ai-team-botcreategroup-function-botcreategroup-state-bot-mates-size-suppressed-src-mq3-game-ai-team-ml-13793911"></a>
### BotCreateGroup

```ml
function BotCreateGroup(state, bot, mates, size, suppressed)
```

Forward `BotCreateGroup` to `mq3.game.ai_team.createGroup` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `names` and `configs`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `mates` | `dynamic` | — | Array or byte sequence accessed at `0` and `index`. |
| `size` | `dynamic` | — | Size or capacity supplied to the buffer operation. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L612)

<a id="function-function-mq3-game-ai-team-botctforders-function-botctforders-state-bot-suppressed-src-mq3-game-ai-team-ml-1288319958"></a>
### BotCTFOrders

```ml
function BotCTFOrders(state, bot, suppressed)
```

Forward `BotCTFOrders` to `mq3.game.ai_team.ctfOrders` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `suppressed` and `helper`. May update `state.suppressed`, `state.helper.teamFn` and `state.helper.sortBaseFn` and additional fields in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `redflagstatus` and `blueflagstatus`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L605)

<a id="function-function-mq3-game-ai-team-botctforders-bothflagsatbase-function-botctforders-bothflagsatbase-state-bot-src-mq3-game-ai-team-ml-576382188"></a>
### BotCTFOrders_BothFlagsAtBase

```ml
function BotCTFOrders_BothFlagsAtBase(state, bot)
```

Update `state.suppressed`, `state.helper.sortBaseFn`, `state.helper.initialChatFn` and `state.helper.orderAlwaysFn` during `BotCTFOrders_BothFlagsAtBase`. Return paths include `base.ctfOrdersBothFlagsAtBase(state.helper,bot)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `suppressed` and `helper`. May update `state.suppressed`, `state.helper.sortBaseFn` and `state.helper.initialChatFn` and additional fields in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ctfstrategy`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L600)

<a id="function-function-mq3-game-ai-team-botctforders-bothflagsnotatbase-function-botctforders-bothflagsnotatbase-state-bot-src-mq3-game-ai-team-ml-288134854"></a>
### BotCTFOrders_BothFlagsNotAtBase

```ml
function BotCTFOrders_BothFlagsNotAtBase(state, bot)
```

Update `state.suppressed`, `state.helper.sortBaseFn`, `state.helper.initialChatFn` and `state.helper.orderAlwaysFn` during `BotCTFOrders_BothFlagsNotAtBase`. Return paths include `base.ctfOrdersBothFlagsNotAtBase(state.helper,bot)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `suppressed` and `helper`. May update `state.suppressed`, `state.helper.sortBaseFn` and `state.helper.initialChatFn` and additional fields in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `numteammates`, `flagcarrier` and `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L588)

<a id="function-function-mq3-game-ai-team-botctforders-enemyflagnotatbase-function-botctforders-enemyflagnotatbase-state-bot-src-mq3-game-ai-team-ml-1381459326"></a>
### BotCTFOrders_EnemyFlagNotAtBase

```ml
function BotCTFOrders_EnemyFlagNotAtBase(state, bot)
```

Update `state.suppressed`, `state.helper.sortBaseFn`, `state.helper.initialChatFn` and `state.helper.orderAlwaysFn` during `BotCTFOrders_EnemyFlagNotAtBase`. Return paths include `base.ctfOrdersEnemyFlagNotAtBase(state.helper,bot)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `suppressed` and `helper`. May update `state.suppressed`, `state.helper.sortBaseFn` and `state.helper.initialChatFn` and additional fields in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `flagcarrier` and `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L596)

<a id="function-function-mq3-game-ai-team-botctforders-flagnotatbase-function-botctforders-flagnotatbase-state-bot-src-mq3-game-ai-team-ml-525196800"></a>
### BotCTFOrders_FlagNotAtBase

```ml
function BotCTFOrders_FlagNotAtBase(state, bot)
```

Update `state.suppressed`, `state.helper.sortBaseFn`, `state.helper.initialChatFn` and `state.helper.orderAlwaysFn` during `BotCTFOrders_FlagNotAtBase`. Return paths include `base.ctfOrdersFlagNotAtBase(state.helper,bot)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `suppressed` and `helper`. May update `state.suppressed`, `state.helper.sortBaseFn` and `state.helper.initialChatFn` and additional fields in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ctfstrategy` and `numteammates`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L592)

<a id="function-function-mq3-game-ai-team-botgetteammatetaskpreference-function-botgetteammatetaskpreference-state-bot-client-src-mq3-game-ai-team-ml-441555329"></a>
### BotGetTeamMateTaskPreference

```ml
function BotGetTeamMateTaskPreference(state, bot, client)
```

Forward `BotGetTeamMateTaskPreference` to `mq3.game.ai_team.getTeamMateTaskPreference` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `helper`. |
| `bot` | `dynamic` | — | Value passed as argument 2 to `mq3.game.bot_team_helpers.getTeamMateTaskPreference`. |
| `client` | `dynamic` | — | Operand used to evaluate the returned expression `state.preferences[teammate]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L546)

<a id="function-function-mq3-game-ai-team-botharvesterorders-function-botharvesterorders-state-bot-suppressed-src-mq3-game-ai-team-ml-61637210"></a>
### BotHarvesterOrders

```ml
function BotHarvesterOrders(state, bot, suppressed)
```

Forward `BotHarvesterOrders` to `mq3.game.ai_team.harvesterOrders` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `helper`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ctfstrategy`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L652)

<a id="function-function-mq3-game-ai-team-botnumteammates-function-botnumteammates-state-bot-src-mq3-game-ai-team-ml-2116812704"></a>
### BotNumTeamMates

```ml
function BotNumTeamMates(state, bot)
```

Forward `BotNumTeamMates` to `mq3.game.ai_team.numTeamMates` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `maxclients` and `configs`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L525)

<a id="function-function-mq3-game-ai-team-botobeliskorders-function-botobeliskorders-state-bot-suppressed-src-mq3-game-ai-team-ml-65757566"></a>
### BotObeliskOrders

```ml
function BotObeliskOrders(state, bot, suppressed)
```

Forward `BotObeliskOrders` to `mq3.game.ai_team.obeliskOrders` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `helper`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ctfstrategy`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L647)

<a id="function-function-mq3-game-ai-team-botsayteamorder-function-botsayteamorder-state-bot-client-suppressed-src-mq3-game-ai-team-ml-1108574497"></a>
### BotSayTeamOrder

```ml
function BotSayTeamOrder(state, bot, client, suppressed)
```

Forward `BotSayTeamOrder` to `mq3.game.ai_team.sayTeamOrder` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `missionpack`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `client` | `dynamic` | — | Initial value stored in `mq3.game.ai_team.Action.target`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L563)

<a id="function-function-mq3-game-ai-team-botsayteamorderalways-function-botsayteamorderalways-state-bot-client-suppressed-src-mq3-game-ai-team-ml-298751759"></a>
### BotSayTeamOrderAlways

```ml
function BotSayTeamOrderAlways(state, bot, client, suppressed)
```

Forward `BotSayTeamOrderAlways` to `mq3.game.ai_team.sayTeamOrderAlways` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `actions`. May update `state.actions` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `client` | `dynamic` | — | Initial value stored in `mq3.game.ai_team.Action.target`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L557)

<a id="function-function-mq3-game-ai-team-botsayvoiceteamorder-function-botsayvoiceteamorder-state-bot-client-voice-suppressed-src-mq3-game-ai-team-ml-774784123"></a>
### BotSayVoiceTeamOrder

```ml
function BotSayVoiceTeamOrder(state, bot, client, voice, suppressed)
```

Forward `BotSayVoiceTeamOrder` to `mq3.game.ai_team.sayVoiceTeamOrder` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `missionpack`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `client` | `dynamic` | — | Initial value stored in `mq3.game.ai_team.Action.target`. |
| `voice` | `dynamic` | — | Value used by `voiceChat` in `command="vsay_team "+voice`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L584)

<a id="function-function-mq3-game-ai-team-botsetteammatetaskpreference-function-botsetteammatetaskpreference-state-bot-client-preference-src-mq3-game-ai-team-ml-306338990"></a>
### BotSetTeamMateTaskPreference

```ml
function BotSetTeamMateTaskPreference(state, bot, client, preference)
```

Forward `BotSetTeamMateTaskPreference` to `mq3.game.ai_team.setTeamMateTaskPreference` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `helper`. |
| `bot` | `dynamic` | — | Value passed as argument 2 to `mq3.game.bot_team_helpers.setTeamMateTaskPreference`. |
| `client` | `dynamic` | — | Value used by `setTeamMateTaskPreference` in `state.preferences[teammate]=preference`. |
| `preference` | `dynamic` | — | Value used by `setTeamMateTaskPreference` in `state.preferences[teammate]=preference`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L541)

<a id="function-function-mq3-game-ai-team-botsortteammatesbybasetraveltime-function-botsortteammatesbybasetraveltime-state-bot-maxteammates-src-mq3-game-ai-team-ml-203134745"></a>
### BotSortTeamMatesByBaseTravelTime

```ml
function BotSortTeamMatesByBaseTravelTime(state, bot, maxTeamMates)
```

Forward `BotSortTeamMatesByBaseTravelTime` to `mq3.game.ai_team.sortTeamMatesByBaseTravelTime` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `maxclients` and `configs`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `maxTeamMates` | `dynamic` | — | Value used by `sortTeamMatesByBaseTravelTime` in `if limit<=0 or maxTeamMates<=0 then return result end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L535)

<a id="function-function-mq3-game-ai-team-botsortteammatesbytaskpreference-function-botsortteammatesbytaskpreference-state-bot-mates-src-mq3-game-ai-team-ml-1338918030"></a>
### BotSortTeamMatesByTaskPreference

```ml
function BotSortTeamMatesByTaskPreference(state, bot, mates)
```

Forward `BotSortTeamMatesByTaskPreference` to `mq3.game.ai_team.sortTeamMatesByTaskPreference` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `helper`. |
| `bot` | `dynamic` | — | Value passed as argument 2 to `mq3.game.bot_team_helpers.getTeamMateTaskPreference`. |
| `mates` | `dynamic` | — | Value used by `sortTeamMatesByTaskPreference` in `for each teammate in teammates`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L551)

<a id="function-function-mq3-game-ai-team-botteamai-function-botteamai-state-bot-suppressed-src-mq3-game-ai-team-ml-188374118"></a>
### BotTeamAI

```ml
function BotTeamAI(state, bot, suppressed)
```

Forward `BotTeamAI` to `mq3.game.ai_team.teamAI` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `gametype`, `now` and `randomValue`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `askteamleaderTime`, `becometeamleaderTime`, `entergameTime`, `client` and `teamleader` and related fields. May update `bot.askteamleaderTime`, `bot.becometeamleaderTime` and `bot.teamleader` and additional fields in place. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L662)

<a id="function-function-mq3-game-ai-team-botteamorders-function-botteamorders-state-bot-suppressed-src-mq3-game-ai-team-ml-1907869636"></a>
### BotTeamOrders

```ml
function BotTeamOrders(state, bot, suppressed)
```

Forward `BotTeamOrders` to `mq3.game.ai_team.teamOrders` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `maxclients` and `configs`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L617)

<a id="function-function-mq3-game-ai-team-botvalidteamleader-function-botvalidteamleader-state-bot-src-mq3-game-ai-team-ml-986929376"></a>
### BotValidTeamLeader

```ml
function BotValidTeamLeader(state, bot)
```

Original exported spellings retained for symbol-level port auditing.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `maxclients`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `teamleader`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L521)

<a id="function-function-mq3-game-ai-team-botvoicechat-function-botvoicechat-state-bot-client-voice-suppressed-src-mq3-game-ai-team-ml-682669779"></a>
### BotVoiceChat

```ml
function BotVoiceChat(state, bot, client, voice, suppressed)
```

Forward `BotVoiceChat` to `mq3.game.ai_team.voiceChat` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `actions`. May update `state.actions` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `client` | `dynamic` | — | Initial value stored in `mq3.game.ai_team.Action.target`. |
| `voice` | `dynamic` | — | Value used by `voiceChat` in `command="vsay_team "+voice`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L570)

<a id="function-function-mq3-game-ai-team-botvoicechatonly-function-botvoicechatonly-state-bot-client-voice-suppressed-src-mq3-game-ai-team-ml-1489456775"></a>
### BotVoiceChatOnly

```ml
function BotVoiceChatOnly(state, bot, client, voice, suppressed)
```

Forward `BotVoiceChatOnly` to `mq3.game.ai_team.voiceChatOnly` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `actions`. May update `state.actions` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `client` | `dynamic` | — | Initial value stored in `mq3.game.ai_team.Action.target`. |
| `voice` | `dynamic` | — | Value used by `voiceChatOnly` in `command="vosay_team "+voice`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L577)

<a id="function-function-mq3-game-ai-team-chatcallback-function-chatcallback-helper-bot-kind-args-src-mq3-game-ai-team-ml-1046650696"></a>
### chatCallback

```ml
function chatCallback(helper, bot, kind, args)
```

Record or dispatch `"initial-chat"` actions in `chatCallback`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `helper` | `dynamic` | — | Helper record; accesses `context`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `kind` | `dynamic` | — | Text to parse, format or deliver. |
| `args` | `dynamic` | — | Initial value stored in `mq3.game.ai_team.Action.args`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L476)

<a id="function-function-mq3-game-ai-team-clienttraveltimetogoal-function-clienttraveltimetogoal-state-client-goalarea-src-mq3-game-ai-team-ml-1394181902"></a>
### clientTravelTimeToGoal

```ml
function clientTravelTimeToGoal(state, client, goalArea)
```

Use `state.clientStateFn`, `state.pointAreaFn` and `state.travelTimeFn` to perform `clientTravelTimeToGoal`. Return paths include `state.travelTimes[client]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `clientStateFn`, `pointAreaFn`, `travelTimeFn` and `travelTimes`. |
| `client` | `dynamic` | — | Value passed as argument 2 to `state.clientStateFn`. |
| `goalArea` | `dynamic` | — | Destination AAS area number. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L198)

<a id="function-function-mq3-game-ai-team-create-function-create-src-mq3-game-ai-team-ml-62702850"></a>
### create

```ml
function create()
```

Apply `mq3.game.bot_team_helpers.create` while evaluating `create`. Return paths include `state`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L121)

<a id="function-function-mq3-game-ai-team-createbot-function-createbot-client-src-mq3-game-ai-team-ml-13413833"></a>
### createBot

```ml
function createBot(client)
```

Create a `mq3.game.ai_team.Bot` record, initializing `client` from `client` and `flagcarrier` as `-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — | Initial value stored in `mq3.game.ai_team.Bot.client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L130)

<a id="function-function-mq3-game-ai-team-creategroup-function-creategroup-state-bot-mates-groupsize-suppressed-src-mq3-game-ai-team-ml-1154936196"></a>
### createGroup

```ml
function createGroup(state, bot, mates, groupSize, suppressed)
```

Apply `mq3.game.ai_team.nameOf` and `mq3.game.ai_team.order` while evaluating `createGroup`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `names` and `configs`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `mates` | `dynamic` | — | Array or byte sequence accessed at `0` and `index`. |
| `groupSize` | `dynamic` | — | Value used by `createGroup` in `if groupSize<=1 then return void end if`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L430)

<a id="function-function-mq3-game-ai-team-ctforders-function-ctforders-state-bot-suppressed-src-mq3-game-ai-team-ml-671675270"></a>
### ctfOrders

```ml
function ctfOrders(state, bot, suppressed)
```

Update `state.suppressed`, `state.helper.teamFn`, `state.helper.sortBaseFn` and `state.helper.initialChatFn` and related state during `ctfOrders`. Return paths include `base.ctfOrders(state.helper,bot,bot.redflagstatus,bot.blueflagstatus)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `suppressed` and `helper`. May update `state.suppressed`, `state.helper.teamFn` and `state.helper.sortBaseFn` and additional fields in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `redflagstatus` and `blueflagstatus`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L462)

<a id="constant-constant-mq3-game-ai-team-ctfs-agressive-const-ctfs-agressive-aiheaders-ctfs-agressive-src-mq3-game-ai-team-ml-571909889"></a>
### CTFS_AGRESSIVE

```ml
const CTFS_AGRESSIVE = aiheaders.CTFS_AGRESSIVE
```

Capture-the-flag strategy identifier selecting agressive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L31)

<a id="function-function-mq3-game-ai-team-distribute-function-distribute-state-bot-defendtenths-attacktenths-defendcap-attackcap-attackchat-attackvoice-suppressed-src-mq3-game-ai-team-ml-1162628946"></a>
### distribute

```ml
function distribute(state, bot, defendTenths, attackTenths, defendCap, attackCap, attackChat, attackVoice, suppressed)
```

Apply `mq3.game.ai_team.sorted`, `mq3.game.ai_team.order` and `mq3.game.ai_team.nameOf` while evaluating `distribute`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `helper`. |
| `bot` | `dynamic` | — | Value passed as argument 2 to `mq3.game.bot_team_helpers.getTeamMateTaskPreference`. |
| `defendTenths` | `dynamic` | — | Operand used to evaluate the returned expression `n.quotient(count*tenths+5,10)`. |
| `attackTenths` | `dynamic` | — | Operand used to evaluate the returned expression `n.quotient(count*tenths+5,10)`. |
| `defendCap` | `dynamic` | — | Value used by `distribute` in `if defenders>defendCap then defenders=defendCap end if`. |
| `attackCap` | `dynamic` | — | Value used by `distribute` in `if attackers>attackCap then attackers=attackCap end if`. |
| `attackChat` | `dynamic` | — | Text to parse, format or deliver. |
| `attackVoice` | `dynamic` | — | Value used by `voiceChat` in `command="vsay_team "+voice`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L312)

<a id="function-function-mq3-game-ai-team-emit-function-emit-state-kind-client-target-text-args-suppressed-src-mq3-game-ai-team-ml-1275752297"></a>
### emit

```ml
function emit(state, kind, client, target, text, args, suppressed)
```

Set `state.actions` to `state.actions+[Action(kind,client,target,text,args,suppressed)]` in `mq3.game.ai_team.emit`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `actions`. May update `state.actions` in place. |
| `kind` | `dynamic` | — | Initial value stored in `mq3.game.ai_team.Action.kind`. |
| `client` | `dynamic` | — | Initial value stored in `mq3.game.ai_team.Action.client`. |
| `target` | `dynamic` | — | Initial value stored in `mq3.game.ai_team.Action.target`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |
| `args` | `dynamic` | — | Initial value stored in `mq3.game.ai_team.Action.args`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L142)

<a id="function-function-mq3-game-ai-team-findhumanteamleader-function-findhumanteamleader-state-bot-suppressed-src-mq3-game-ai-team-ml-1724670142"></a>
### FindHumanTeamLeader

```ml
function FindHumanTeamLeader(state, bot, suppressed)
```

Forward `FindHumanTeamLeader` to `mq3.game.ai_team.findHumanTeamLeader` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `helper`. May update `state.helper.sameTeamFn` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `teamleader` and `client`. May update `bot.teamleader` in place. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L657)

<a id="function-function-mq3-game-ai-team-findhumanteamleader-function-findhumanteamleader-state-bot-suppressed-src-mq3-game-ai-team-ml-994701438"></a>
### findHumanTeamLeader

```ml
function findHumanTeamLeader(state, bot, suppressed)
```

Record or dispatch `"default-defend"` actions in `findHumanTeamLeader`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `helper`. May update `state.helper.sameTeamFn` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `teamleader` and `client`. May update `bot.teamleader` in place. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L449)

<a id="function-function-mq3-game-ai-team-getteammatetaskpreference-function-getteammatetaskpreference-state-bot-teammate-src-mq3-game-ai-team-ml-1582623832"></a>
### getTeamMateTaskPreference

```ml
function getTeamMateTaskPreference(state, bot, teammate)
```

Apply `mq3.game.ai_team.sync`, `mq3.game.bot_team_helpers.getTeamMateTaskPreference` and `mq3.game.ai_team.nameOf` while evaluating `getTeamMateTaskPreference`. Return paths include `base.getTeamMateTaskPreference(state.helper,bot,teammate,nameOf(state,teammate))`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `helper`. |
| `bot` | `dynamic` | — | Value passed as argument 2 to `mq3.game.bot_team_helpers.getTeamMateTaskPreference`. |
| `teammate` | `dynamic` | — | Operand used to evaluate the returned expression `state.preferences[teammate]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L238)

<a id="constant-constant-mq3-game-ai-team-gt-1fctf-const-gt-1fctf-5-src-mq3-game-ai-team-ml-311265716"></a>
### GT_1FCTF

```ml
const GT_1FCTF = 5
```

Game-mode identifier selecting 1 fctf rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L25)

<a id="constant-constant-mq3-game-ai-team-gt-ctf-const-gt-ctf-4-src-mq3-game-ai-team-ml-2119169225"></a>
### GT_CTF

```ml
const GT_CTF = 4
```

Game-mode identifier selecting capture the flag rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L23)

<a id="constant-constant-mq3-game-ai-team-gt-harvester-const-gt-harvester-7-src-mq3-game-ai-team-ml-773746342"></a>
### GT_HARVESTER

```ml
const GT_HARVESTER = 7
```

Game-mode identifier selecting harvester rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L29)

<a id="constant-constant-mq3-game-ai-team-gt-obelisk-const-gt-obelisk-6-src-mq3-game-ai-team-ml-1985518399"></a>
### GT_OBELISK

```ml
const GT_OBELISK = 6
```

Game-mode identifier selecting obelisk rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L27)

<a id="constant-constant-mq3-game-ai-team-gt-team-const-gt-team-3-src-mq3-game-ai-team-ml-1050245100"></a>
### GT_TEAM

```ml
const GT_TEAM = 3
```

Game-mode identifier selecting team rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L21)

<a id="function-function-mq3-game-ai-team-harvesterorders-function-harvesterorders-state-bot-suppressed-src-mq3-game-ai-team-ml-1198378508"></a>
### harvesterOrders

```ml
function harvesterOrders(state, bot, suppressed)
```

Apply `mq3.game.ai_team.distribute` while evaluating `harvesterOrders`. Return paths include `distribute(state,bot,5,4,5,4,"cmd_harvest","offense",suppressed)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `helper`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ctfstrategy`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L419)

<a id="constant-constant-mq3-game-ai-team-max-clients-const-max-clients-64-src-mq3-game-ai-team-ml-1417102719"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```

Maximum number of client slots represented by the original game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L13)

<a id="function-function-mq3-game-ai-team-nameof-function-nameof-state-client-src-mq3-game-ai-team-ml-958635744"></a>
### nameOf

```ml
function nameOf(state, client)
```

Apply `mq3.shared.info.value` while evaluating `nameOf`. Return paths include `info.value(state.configs[client],"n")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `names` and `configs`. |
| `client` | `dynamic` | — | Operand used to evaluate the returned expression `state.names[client]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L158)

<a id="function-function-mq3-game-ai-team-numteammates-function-numteammates-state-bot-src-mq3-game-ai-team-ml-958268696"></a>
### numTeamMates

```ml
function numTeamMates(state, bot)
```

Apply `mq3.game.ai_team.nameOf`, `mq3.shared.info.value` and `mq3.game.ai_team.sameTeam` while evaluating `numTeamMates`. Return paths include `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `maxclients` and `configs`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L183)

<a id="function-function-mq3-game-ai-team-obeliskorders-function-obeliskorders-state-bot-suppressed-src-mq3-game-ai-team-ml-238533318"></a>
### obeliskOrders

```ml
function obeliskOrders(state, bot, suppressed)
```

Apply `mq3.game.ai_team.distribute` while evaluating `obeliskOrders`. Return paths include `distribute(state,bot,5,4,5,4,"cmd_attackenemybase","offense",suppressed)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `helper`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ctfstrategy`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L411)

<a id="function-function-mq3-game-ai-team-oneflagatcenter-function-oneflagatcenter-state-bot-suppressed-src-mq3-game-ai-team-ml-1484593750"></a>
### oneFlagAtCenter

```ml
function oneFlagAtCenter(state, bot, suppressed)
```

Apply `mq3.game.ai_team.sorted`, `mq3.game.ai_team.order` and `mq3.game.ai_team.nameOf` while evaluating `oneFlagAtCenter`. Return paths include `distribute(state,bot,5,4,5,4,"cmd_getflag","getflag",suppressed)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `helper`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ctfstrategy`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L331)

<a id="function-function-mq3-game-ai-team-oneflagenemydropped-function-oneflagenemydropped-state-bot-suppressed-src-mq3-game-ai-team-ml-1627958570"></a>
### oneFlagEnemyDropped

```ml
function oneFlagEnemyDropped(state, bot, suppressed)
```

Forward `oneFlagEnemyDropped` to `mq3.game.ai_team.oneFlagAtCenter` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `helper`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ctfstrategy`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L348)

<a id="function-function-mq3-game-ai-team-oneflagenemyhasflag-function-oneflagenemyhasflag-state-bot-suppressed-src-mq3-game-ai-team-ml-1330454486"></a>
### oneFlagEnemyHasFlag

```ml
function oneFlagEnemyHasFlag(state, bot, suppressed)
```

Apply `mq3.game.ai_team.sorted`, `mq3.game.ai_team.order` and `mq3.game.ai_team.nameOf` while evaluating `oneFlagEnemyHasFlag`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `helper`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ctfstrategy`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L384)

<a id="function-function-mq3-game-ai-team-oneflagorders-function-oneflagorders-state-bot-suppressed-src-mq3-game-ai-team-ml-413906764"></a>
### oneFlagOrders

```ml
function oneFlagOrders(state, bot, suppressed)
```

Apply `mq3.game.ai_team.oneFlagAtCenter`, `mq3.game.ai_team.oneFlagTeamHasFlag` and `mq3.game.ai_team.oneFlagEnemyHasFlag` while evaluating `oneFlagOrders`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `helper`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `neutralflagstatus`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L399)

<a id="function-function-mq3-game-ai-team-oneflagteamhasflag-function-oneflagteamhasflag-state-bot-suppressed-src-mq3-game-ai-team-ml-1592100046"></a>
### oneFlagTeamHasFlag

```ml
function oneFlagTeamHasFlag(state, bot, suppressed)
```

Apply `mq3.game.ai_team.sorted`, `mq3.game.ai_team.order` and `mq3.game.ai_team.nameOf` while evaluating `oneFlagTeamHasFlag`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `helper`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ctfstrategy` and `flagcarrier`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L365)

<a id="function-function-mq3-game-ai-team-order-function-order-state-bot-kind-toclient-args-voice-suppressed-src-mq3-game-ai-team-ml-1733070945"></a>
### order

```ml
function order(state, bot, kind, toClient, args, voice, suppressed)
```

Record or dispatch `"initial-chat"` actions in `order`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `actions`. May update `state.actions` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `kind` | `dynamic` | — | Text to parse, format or deliver. |
| `toClient` | `dynamic` | — | Initial value stored in `mq3.game.ai_team.Action.target`. |
| `args` | `dynamic` | — | Initial value stored in `mq3.game.ai_team.Action.args`. |
| `voice` | `dynamic` | — | Value used by `voiceChat` in `command="vsay_team "+voice`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L287)

<a id="function-function-mq3-game-ai-team-ordercallback-function-ordercallback-helper-bot-target-src-mq3-game-ai-team-ml-998178596"></a>
### orderCallback

```ml
function orderCallback(helper, bot, target)
```

Record or dispatch `"consume-chat"` and `"chat"` actions in `orderCallback`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `helper` | `dynamic` | — | Helper record; accesses `context`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `target` | `dynamic` | — | Initial value stored in `mq3.game.ai_team.Action.target`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L481)

<a id="function-function-mq3-game-ai-team-rounded-function-rounded-count-tenths-src-mq3-game-ai-team-ml-416032057"></a>
### rounded

```ml
function rounded(count, tenths)
```

Forward `rounded` to `mq3.compat.numeric.quotient` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `count` | `dynamic` | — | Number of entries or bytes processed by this call. |
| `tenths` | `dynamic` | — | Operand used to evaluate the returned expression `n.quotient(count*tenths+5,10)`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L300)

<a id="function-function-mq3-game-ai-team-sameteam-function-sameteam-state-bot-client-src-mq3-game-ai-team-ml-461871281"></a>
### sameTeam

```ml
function sameTeam(state, bot, client)
```

Apply `mq3.shared.info.value` while evaluating `sameTeam`. Return paths include `info.value(state.configs[bot.client],"t")==info.value(state.configs[client],"t")`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `configs`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `client` | `dynamic` | — | Operand used to evaluate the returned expression `info.value(state.configs[bot.client],"t")==info.value(state.configs[client],"t")`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L163)

<a id="function-function-mq3-game-ai-team-sayteamorder-function-sayteamorder-state-bot-toclient-suppressed-src-mq3-game-ai-team-ml-506214728"></a>
### sayTeamOrder

```ml
function sayTeamOrder(state, bot, toClient, suppressed)
```

Record or dispatch `"consume-chat"` actions in `sayTeamOrder`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `missionpack`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `toClient` | `dynamic` | — | Initial value stored in `mq3.game.ai_team.Action.target`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L256)

<a id="function-function-mq3-game-ai-team-sayteamorderalways-function-sayteamorderalways-state-bot-toclient-suppressed-src-mq3-game-ai-team-ml-1302051576"></a>
### sayTeamOrderAlways

```ml
function sayTeamOrderAlways(state, bot, toClient, suppressed)
```

Record or dispatch `"chat"` actions in `sayTeamOrderAlways`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `actions`. May update `state.actions` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `toClient` | `dynamic` | — | Initial value stored in `mq3.game.ai_team.Action.target`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L250)

<a id="function-function-mq3-game-ai-team-sayvoiceteamorder-function-sayvoiceteamorder-state-bot-toclient-voice-suppressed-src-mq3-game-ai-team-ml-1253028278"></a>
### sayVoiceTeamOrder

```ml
function sayVoiceTeamOrder(state, bot, toClient, voice, suppressed)
```

Apply `mq3.game.ai_team.voiceChat` while evaluating `sayVoiceTeamOrder`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `missionpack`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `toClient` | `dynamic` | — | Initial value stored in `mq3.game.ai_team.Action.target`. |
| `voice` | `dynamic` | — | Value used by `voiceChat` in `command="vsay_team "+voice`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L277)

<a id="function-function-mq3-game-ai-team-setteammatetaskpreference-function-setteammatetaskpreference-state-bot-teammate-preference-src-mq3-game-ai-team-ml-977982435"></a>
### setTeamMateTaskPreference

```ml
function setTeamMateTaskPreference(state, bot, teammate, preference)
```

Apply `mq3.game.ai_team.sync` and `mq3.game.bot_team_helpers.setTeamMateTaskPreference` while evaluating `setTeamMateTaskPreference`. Return paths include `base.setTeamMateTaskPreference(state.helper,bot,teammate,preference)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `helper`. |
| `bot` | `dynamic` | — | Value passed as argument 2 to `mq3.game.bot_team_helpers.setTeamMateTaskPreference`. |
| `teammate` | `dynamic` | — | Value used by `setTeamMateTaskPreference` in `state.preferences[teammate]=preference`. |
| `preference` | `dynamic` | — | Value used by `setTeamMateTaskPreference` in `state.preferences[teammate]=preference`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L233)

<a id="function-function-mq3-game-ai-team-sortcallback-function-sortcallback-helper-bot-src-mq3-game-ai-team-ml-1709896869"></a>
### sortCallback

```ml
function sortCallback(helper, bot)
```

Forward `sortCallback` to `mq3.game.ai_team.sorted` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `helper` | `dynamic` | — | Helper record; accesses `context`. |
| `bot` | `dynamic` | — | Value passed as argument 2 to `mq3.game.bot_team_helpers.getTeamMateTaskPreference`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L470)

<a id="function-function-mq3-game-ai-team-sorted-function-sorted-state-bot-src-mq3-game-ai-team-ml-1480426344"></a>
### sorted

```ml
function sorted(state, bot)
```

Forward `sorted` to `mq3.game.ai_team.sortTeamMatesByTaskPreference` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `helper`. |
| `bot` | `dynamic` | — | Value passed as argument 2 to `mq3.game.bot_team_helpers.getTeamMateTaskPreference`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L296)

<a id="function-function-mq3-game-ai-team-sortteammatesbybasetraveltime-function-sortteammatesbybasetraveltime-state-bot-maxteammates-src-mq3-game-ai-team-ml-1795977205"></a>
### sortTeamMatesByBaseTravelTime

```ml
function sortTeamMatesByBaseTravelTime(state, bot, maxTeamMates)
```

Apply `mq3.game.ai_team.nameOf`, `mq3.shared.info.value` and `mq3.game.ai_team.sameTeam` while evaluating `sortTeamMatesByBaseTravelTime`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `maxclients` and `configs`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `maxTeamMates` | `dynamic` | — | Value used by `sortTeamMatesByBaseTravelTime` in `if limit<=0 or maxTeamMates<=0 then return result end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L212)

<a id="function-function-mq3-game-ai-team-sortteammatesbytaskpreference-function-sortteammatesbytaskpreference-state-bot-teammates-src-mq3-game-ai-team-ml-773321815"></a>
### sortTeamMatesByTaskPreference

```ml
function sortTeamMatesByTaskPreference(state, bot, teammates)
```

Apply `mq3.game.ai_team.sync` and `mq3.game.bot_team_helpers.sortTeamMatesByTaskPreference` while evaluating `sortTeamMatesByTaskPreference`. Return paths include `base.sortTeamMatesByTaskPreference(state.helper,bot,teammates)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `helper`. |
| `bot` | `dynamic` | — | Value passed as argument 2 to `mq3.game.bot_team_helpers.getTeamMateTaskPreference`. |
| `teammates` | `dynamic` | — | Value used by `sortTeamMatesByTaskPreference` in `for each teammate in teammates`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L243)

- [mq3.game.ai_team.State](Type-mq3-game-ai-team-state-677439307.md) — struct
<a id="function-function-mq3-game-ai-team-sync-function-sync-state-src-mq3-game-ai-team-ml-284683317"></a>
### sync

```ml
function sync(state)
```

Update `state.helper.names`, `state.helper.configs`, `state.helper.maxclients` and `state.helper.gametype` and related state during `sync`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `helper`, `names`, `configs`, `maxclients` and `gametype`. May update `state.helper.names`, `state.helper.configs` and `state.helper.maxclients` and additional fields in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L149)

<a id="function-function-mq3-game-ai-team-team-function-team-state-bot-src-mq3-game-ai-team-ml-317102196"></a>
### team

```ml
function team(state, bot)
```

Apply `mq3.shared.info.value` while evaluating `team`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `configs`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L167)

<a id="constant-constant-mq3-game-ai-team-team-blue-const-team-blue-2-src-mq3-game-ai-team-ml-773055175"></a>
### TEAM_BLUE

```ml
const TEAM_BLUE = 2
```

Team identifier selecting the blue team/category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L17)

<a id="constant-constant-mq3-game-ai-team-team-red-const-team-red-1-src-mq3-game-ai-team-ml-1130845786"></a>
### TEAM_RED

```ml
const TEAM_RED = 1
```

Team identifier selecting the red team/category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L15)

<a id="constant-constant-mq3-game-ai-team-team-spectator-const-team-spectator-3-src-mq3-game-ai-team-ml-1216517788"></a>
### TEAM_SPECTATOR

```ml
const TEAM_SPECTATOR = 3
```

Team identifier selecting the spectator team/category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L19)

<a id="function-function-mq3-game-ai-team-teamai-function-teamai-state-bot-suppressed-src-mq3-game-ai-team-ml-1386424202"></a>
### teamAI

```ml
function teamAI(state, bot, suppressed)
```

Record or dispatch `"initial-chat"` and `"enter-chat"` actions in `teamAI`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `gametype`, `now` and `randomValue`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `askteamleaderTime`, `becometeamleaderTime`, `entergameTime`, `client` and `teamleader` and related fields. May update `bot.askteamleaderTime`, `bot.becometeamleaderTime` and `bot.teamleader` and additional fields in place. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L496)

<a id="function-function-mq3-game-ai-team-teamorders-function-teamorders-state-bot-suppressed-src-mq3-game-ai-team-ml-1681795970"></a>
### teamOrders

```ml
function teamOrders(state, bot, suppressed)
```

Apply `mq3.game.ai_team.nameOf`, `mq3.shared.info.value` and `mq3.game.ai_team.sameTeam` while evaluating `teamOrders`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `maxclients` and `configs`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L439)

<a id="constant-constant-mq3-game-ai-team-teamtp-attacker-const-teamtp-attacker-aiheaders-teamtp-attacker-src-mq3-game-ai-team-ml-1198667270"></a>
### TEAMTP_ATTACKER

```ml
const TEAMTP_ATTACKER = aiheaders.TEAMTP_ATTACKER
```

Bot team-task preference bit indicating a preference for attacker.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L33)

<a id="constant-constant-mq3-game-ai-team-teamtp-defender-const-teamtp-defender-aiheaders-teamtp-defender-src-mq3-game-ai-team-ml-680446510"></a>
### TEAMTP_DEFENDER

```ml
const TEAMTP_DEFENDER = aiheaders.TEAMTP_DEFENDER
```

Bot team-task preference bit indicating a preference for defender.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L35)

<a id="function-function-mq3-game-ai-team-validteamleader-function-validteamleader-state-bot-src-mq3-game-ai-team-ml-2120133184"></a>
### validTeamLeader

```ml
function validTeamLeader(state, bot)
```

Apply `mq3.game.ai_team.nameOf` while evaluating `validTeamLeader`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `maxclients`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `teamleader`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L172)

<a id="function-function-mq3-game-ai-team-voicechat-function-voicechat-state-bot-toclient-voice-suppressed-src-mq3-game-ai-team-ml-1123937062"></a>
### voiceChat

```ml
function voiceChat(state, bot, toClient, voice, suppressed)
```

Record or dispatch `"command"` actions in `voiceChat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `actions`. May update `state.actions` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `toClient` | `dynamic` | — | Initial value stored in `mq3.game.ai_team.Action.target`. |
| `voice` | `dynamic` | — | Value used by `voiceChat` in `command="vsay_team "+voice`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L263)

<a id="function-function-mq3-game-ai-team-voicechatonly-function-voicechatonly-state-bot-toclient-voice-suppressed-src-mq3-game-ai-team-ml-131990126"></a>
### voiceChatOnly

```ml
function voiceChatOnly(state, bot, toClient, voice, suppressed)
```

Record or dispatch `"command"` actions in `voiceChatOnly`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | AI team state; accesses `actions`. May update `state.actions` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `toClient` | `dynamic` | — | Initial value stored in `mq3.game.ai_team.Action.target`. |
| `voice` | `dynamic` | — | Value used by `voiceChatOnly` in `command="vosay_team "+voice`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/ai_team.ml#L270)
