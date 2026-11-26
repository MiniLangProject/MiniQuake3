# `src/mq3/game/bot_team_helpers.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.bot_team_helpers`](Package-mq3-game-bot-team-helpers-1768328539.md)

Reachable from entry: **yes**

## Imports

- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/bot_ai_headers.ml` as `aiheaders` → [src/mq3/game/bot_ai_headers.ml](File-src-mq3-game-bot-ai-headers-ml-1280419323.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="function-function-mq3-game-bot-team-helpers-cleanclienttext-function-cleanclienttext-text-src-mq3-game-bot-team-helpers-ml-1641362355"></a>
### cleanClientText

```ml
function cleanClientText(text)
```

Remove Quake color codes and nonprintable bytes from a client name used in team commands.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L402)

<a id="function-function-mq3-game-bot-team-helpers-clientfromname-function-clientfromname-state-name-src-mq3-game-bot-team-helpers-ml-319073762"></a>
### clientFromName

```ml
function clientFromName(state, name)
```

Apply `mq3.shared.info.value` and `mq3.game.bot_team_helpers.cleanClientText` while evaluating `clientFromName`. Return paths include `-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot team helpers state; accesses `maxclients` and `configs`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L415)

<a id="function-function-mq3-game-bot-team-helpers-clientonsameteamfromname-function-clientonsameteamfromname-state-bot-name-src-mq3-game-bot-team-helpers-ml-289864607"></a>
### clientOnSameTeamFromName

```ml
function clientOnSameTeamFromName(state, bot, name)
```

Apply `mq3.game.bot_team_helpers.sameTeam`, `mq3.shared.info.value` and `mq3.game.bot_team_helpers.cleanClientText` while evaluating `clientOnSameTeamFromName`. Return paths include `-1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot team helpers state; accesses `maxclients` and `configs`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L427)

<a id="function-function-mq3-game-bot-team-helpers-create-function-create-src-mq3-game-bot-team-helpers-ml-1494667706"></a>
### create

```ml
function create()
```

Initialize team preferences and client tables and install the four CTF flag-state order callbacks.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L82)

<a id="function-function-mq3-game-bot-team-helpers-creategroup-function-creategroup-state-bot-teammates-groupsize-src-mq3-game-bot-team-helpers-ml-1004574639"></a>
### createGroup

```ml
function createGroup(state, bot, teammates, groupSize)
```

Use `state.initialChatFn` and `state.orderAlwaysFn` to perform `createGroup`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot team helpers state; accesses `names`, `initialChatFn` and `orderAlwaysFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `teammates` | `dynamic` | — | Array or byte sequence accessed at `0` and `index`. |
| `groupSize` | `dynamic` | — | Value used by `createGroup` in `if groupSize<=1 then return void end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L209)

<a id="function-function-mq3-game-bot-team-helpers-ctforders-function-ctforders-state-bot-redflagstatus-blueflagstatus-src-mq3-game-bot-team-helpers-ml-713252501"></a>
### ctfOrders

```ml
function ctfOrders(state, bot, redFlagStatus, blueFlagStatus)
```

Use `state.teamFn`, `state.ctfBothAtBaseFn` and `state.ctfEnemyNotAtBaseFn` to perform `ctfOrders`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot team helpers state; accesses `teamFn`, `ctfBothAtBaseFn`, `ctfEnemyNotAtBaseFn`, `ctfOwnNotAtBaseFn` and `ctfBothNotAtBaseFn`. |
| `bot` | `dynamic` | — | Value passed as argument 2 to `state.teamFn`. |
| `redFlagStatus` | `dynamic` | — | Value used by `ctfOrders` in `if state.teamFn(state,bot)==1 then flagStatus=redFlagStatus*2+blueFlagStatus else flagStatus=blueFlagStatus*2+re...`. |
| `blueFlagStatus` | `dynamic` | — | Value used by `ctfOrders` in `if state.teamFn(state,bot)==1 then flagStatus=redFlagStatus*2+blueFlagStatus else flagStatus=blueFlagStatus*2+re...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L194)

<a id="function-function-mq3-game-bot-team-helpers-ctfordersbothflagsatbase-function-ctfordersbothflagsatbase-state-bot-src-mq3-game-bot-team-helpers-ml-802520488"></a>
### ctfOrdersBothFlagsAtBase

```ml
function ctfOrdersBothFlagsAtBase(state, bot)
```

Use `state.sortBaseFn` to perform `ctfOrdersBothFlagsAtBase`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot team helpers state; accesses `sortBaseFn` and `names`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ctfstrategy`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L252)

<a id="function-function-mq3-game-bot-team-helpers-ctfordersbothflagsnotatbase-function-ctfordersbothflagsnotatbase-state-bot-src-mq3-game-bot-team-helpers-ml-876664506"></a>
### ctfOrdersBothFlagsNotAtBase

```ml
function ctfOrdersBothFlagsNotAtBase(state, bot)
```

Use `state.sortBaseFn`, `state.initialChatFn` and `state.orderAlwaysFn` to perform `ctfOrdersBothFlagsNotAtBase`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot team helpers state; accesses `sortBaseFn`, `names`, `initialChatFn` and `orderAlwaysFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `numteammates`, `flagcarrier` and `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L283)

<a id="function-function-mq3-game-bot-team-helpers-ctfordersenemyflagnotatbase-function-ctfordersenemyflagnotatbase-state-bot-src-mq3-game-bot-team-helpers-ml-167055842"></a>
### ctfOrdersEnemyFlagNotAtBase

```ml
function ctfOrdersEnemyFlagNotAtBase(state, bot)
```

Use `state.sortBaseFn` to perform `ctfOrdersEnemyFlagNotAtBase`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot team helpers state; accesses `sortBaseFn` and `names`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `flagcarrier` and `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L349)

<a id="function-function-mq3-game-bot-team-helpers-ctfordersflagnotatbase-function-ctfordersflagnotatbase-state-bot-src-mq3-game-bot-team-helpers-ml-850046076"></a>
### ctfOrdersFlagNotAtBase

```ml
function ctfOrdersFlagNotAtBase(state, bot)
```

Use `state.sortBaseFn` to perform `ctfOrdersFlagNotAtBase`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot team helpers state; accesses `sortBaseFn` and `names`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ctfstrategy` and `numteammates`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L321)

<a id="constant-constant-mq3-game-bot-team-helpers-ctfs-agressive-const-ctfs-agressive-aiheaders-ctfs-agressive-src-mq3-game-bot-team-helpers-ml-1634674379"></a>
### CTFS_AGRESSIVE

```ml
const CTFS_AGRESSIVE = aiheaders.CTFS_AGRESSIVE
```

Capture-the-flag strategy identifier selecting agressive.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L19)

<a id="function-function-mq3-game-bot-team-helpers-deliverorder-function-deliverorder-state-bot-kind-args-toclient-src-mq3-game-bot-team-helpers-ml-1906892221"></a>
### deliverOrder

```ml
function deliverOrder(state, bot, kind, args, toClient)
```

Use `state.initialChatFn` and `state.orderAlwaysFn` to perform `deliverOrder`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot team helpers state; accesses `initialChatFn` and `orderAlwaysFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client` and `cs`. |
| `kind` | `dynamic` | — | Value passed as argument 3 to `state.initialChatFn`. |
| `args` | `dynamic` | — | Value passed as argument 4 to `state.initialChatFn`. |
| `toClient` | `dynamic` | — | Value passed as argument 3 to `state.enterChatFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L243)

<a id="function-function-mq3-game-bot-team-helpers-entityisdead-function-entityisdead-state-entitynumber-src-mq3-game-bot-team-helpers-ml-460699035"></a>
### entityIsDead

```ml
function entityIsDead(state, entityNumber)
```

Use `state.getClientPmTypeFn` to perform `entityIsDead`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot team helpers state; accesses `getClientPmTypeFn`. |
| `entityNumber` | `dynamic` | — | Entity number in the game entity table. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L439)

<a id="function-function-mq3-game-bot-team-helpers-findhumanteamleader-function-findhumanteamleader-state-bot-src-mq3-game-bot-team-helpers-ml-1972469656"></a>
### findHumanTeamLeader

```ml
function findHumanTeamLeader(state, bot)
```

Set `bot.teamleader` to `state.names[index]` in `mq3.game.bot_team_helpers.findHumanTeamLeader`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot team helpers state; accesses `entityInUse`, `entitySvFlags`, `notLeader`, `sameTeamFn` and `names` and related fields. |
| `bot` | `dynamic` | — | Bot AI state; accesses `teamleader`. May update `bot.teamleader` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L224)

<a id="function-function-mq3-game-bot-team-helpers-getteammatetaskpreference-function-getteammatetaskpreference-state-bot-teammate-currentname-src-mq3-game-bot-team-helpers-ml-985030952"></a>
### getTeamMateTaskPreference

```ml
function getTeamMateTaskPreference(state, bot, teammate, currentName)
```

Read a teammate's saved task preference only when the current player name still matches its owner.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot team helpers state; accesses `preferences` and `preferenceNames`. |
| `bot` | `dynamic` | — | Not read by this implementation; retained in the `getTeamMateTaskPreference` signature. |
| `teammate` | `dynamic` | — | Operand used to evaluate the returned expression `state.preferences[teammate]`. |
| `currentName` | `dynamic` | — | Value passed as argument 1 to `std.string.toLowerAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L130)

<a id="constant-constant-mq3-game-bot-team-helpers-max-clients-const-max-clients-64-src-mq3-game-bot-team-helpers-ml-1931447045"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```

Maximum number of client slots represented by the original game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L11)

<a id="function-function-mq3-game-bot-team-helpers-numteammates-function-numteammates-state-bot-src-mq3-game-bot-team-helpers-ml-1925305600"></a>
### numTeamMates

```ml
function numTeamMates(state, bot)
```

Use `state.sameTeamFn` to perform `numTeamMates`. Return paths include `count`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot team helpers state; accesses `maxclients`, `configs` and `sameTeamFn`. |
| `bot` | `dynamic` | — | Value passed as argument 2 to `state.sameTeamFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L102)

<a id="function-function-mq3-game-bot-team-helpers-oppositeteam-function-oppositeteam-state-bot-src-mq3-game-bot-team-helpers-ml-1058698984"></a>
### oppositeTeam

```ml
function oppositeTeam(state, bot)
```

Apply `mq3.game.bot_team_helpers.team` while evaluating `oppositeTeam`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot team helpers state; accesses `configs`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L390)

<a id="function-function-mq3-game-bot-team-helpers-sameteam-function-sameteam-state-bot-entitynumber-src-mq3-game-bot-team-helpers-ml-1189746062"></a>
### sameTeam

```ml
function sameTeam(state, bot, entityNumber)
```

Apply `mq3.shared.info.value` while evaluating `sameTeam`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot team helpers state; accesses `gametype` and `configs`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `entityNumber` | `dynamic` | — | Entity number in the game entity table. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L395)

<a id="function-function-mq3-game-bot-team-helpers-sayteamorder-function-sayteamorder-state-bot-toclient-src-mq3-game-bot-team-helpers-ml-1510499058"></a>
### sayTeamOrder

```ml
function sayTeamOrder(state, bot, toClient)
```

Forward `sayTeamOrder` to `mq3.game.bot_team_helpers.sayTeamOrderAlways` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot team helpers state; accesses `getChatMessageFn`, `names`, `queueConsoleMessageFn` and `enterChatFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client` and `cs`. |
| `toClient` | `dynamic` | — | Value passed as argument 3 to `state.enterChatFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L168)

<a id="function-function-mq3-game-bot-team-helpers-sayteamorderalways-function-sayteamorderalways-state-bot-toclient-src-mq3-game-bot-team-helpers-ml-54100570"></a>
### sayTeamOrderAlways

```ml
function sayTeamOrderAlways(state, bot, toClient)
```

Use `state.getChatMessageFn`, `state.queueConsoleMessageFn` and `state.enterChatFn` to perform `sayTeamOrderAlways`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot team helpers state; accesses `getChatMessageFn`, `names`, `queueConsoleMessageFn` and `enterChatFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client` and `cs`. |
| `toClient` | `dynamic` | — | Value passed as argument 3 to `state.enterChatFn`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L155)

<a id="function-function-mq3-game-bot-team-helpers-sayvoiceteamorder-function-sayvoiceteamorder-state-bot-toclient-voicechat-src-mq3-game-bot-team-helpers-ml-1062082752"></a>
### sayVoiceTeamOrder

```ml
function sayVoiceTeamOrder(state, bot, toClient, voicechat)
```

Return `void` for `sayVoiceTeamOrder`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Not read by this implementation; retained in the `sayVoiceTeamOrder` signature. |
| `bot` | `dynamic` | — | Not read by this implementation; retained in the `sayVoiceTeamOrder` signature. |
| `toClient` | `dynamic` | — | Not read by this implementation; retained in the `sayVoiceTeamOrder` signature. |
| `voicechat` | `dynamic` | — | Not read by this implementation; retained in the `sayVoiceTeamOrder` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L187)

<a id="function-function-mq3-game-bot-team-helpers-setteammatetaskpreference-function-setteammatetaskpreference-state-bot-teammate-preference-src-mq3-game-bot-team-helpers-ml-2076476181"></a>
### setTeamMateTaskPreference

```ml
function setTeamMateTaskPreference(state, bot, teammate, preference)
```

Set `state.preferences[teammate]` to `preference` and `state.preferenceNames[teammate]` to `state.names[teammate]` in `mq3.game.bot_team_helpers.setTeamMateTaskPreference`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot team helpers state; accesses `preferences`, `preferenceNames` and `names`. May update `state.preferences[teammate]` and `state.preferenceNames[teammate]` in place. |
| `bot` | `dynamic` | — | Not read by this implementation; retained in the `setTeamMateTaskPreference` signature. |
| `teammate` | `dynamic` | — | Value used by `setTeamMateTaskPreference` in `state.preferences[teammate]=preference`. |
| `preference` | `dynamic` | — | Value used by `setTeamMateTaskPreference` in `state.preferences[teammate]=preference`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L119)

<a id="function-function-mq3-game-bot-team-helpers-sortteammatesbytaskpreference-function-sortteammatesbytaskpreference-state-bot-teammates-src-mq3-game-bot-team-helpers-ml-1672642199"></a>
### sortTeamMatesByTaskPreference

```ml
function sortTeamMatesByTaskPreference(state, bot, teammates)
```

Apply `mq3.game.bot_team_helpers.getTeamMateTaskPreference` while evaluating `sortTeamMatesByTaskPreference`. Return paths include `defenders+roamers+attackers`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot team helpers state; accesses `names`. |
| `bot` | `dynamic` | — | Value passed as argument 2 to `mq3.game.bot_team_helpers.getTeamMateTaskPreference`. |
| `teammates` | `dynamic` | — | Value used by `sortTeamMatesByTaskPreference` in `for each teammate in teammates`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L140)

- [mq3.game.bot_team_helpers.State](Type-mq3-game-bot-team-helpers-state-1367161120.md) — struct
<a id="function-function-mq3-game-bot-team-helpers-team-function-team-state-bot-src-mq3-game-bot-team-helpers-ml-2065319044"></a>
### team

```ml
function team(state, bot)
```

Apply `mq3.shared.info.value` while evaluating `team`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot team helpers state; accesses `configs`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L381)

<a id="constant-constant-mq3-game-bot-team-helpers-team-spectator-const-team-spectator-3-src-mq3-game-bot-team-helpers-ml-677109062"></a>
### TEAM_SPECTATOR

```ml
const TEAM_SPECTATOR = 3
```

Team identifier selecting the spectator team/category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L13)

<a id="constant-constant-mq3-game-bot-team-helpers-teamtp-attacker-const-teamtp-attacker-aiheaders-teamtp-attacker-src-mq3-game-bot-team-helpers-ml-1352634264"></a>
### TEAMTP_ATTACKER

```ml
const TEAMTP_ATTACKER = aiheaders.TEAMTP_ATTACKER
```

Bot team-task preference bit indicating a preference for attacker.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L15)

<a id="constant-constant-mq3-game-bot-team-helpers-teamtp-defender-const-teamtp-defender-aiheaders-teamtp-defender-src-mq3-game-bot-team-helpers-ml-720124300"></a>
### TEAMTP_DEFENDER

```ml
const TEAMTP_DEFENDER = aiheaders.TEAMTP_DEFENDER
```

Bot team-task preference bit indicating a preference for defender.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L17)

<a id="function-function-mq3-game-bot-team-helpers-validteamleader-function-validteamleader-state-bot-src-mq3-game-bot-team-helpers-ml-1826777152"></a>
### validTeamLeader

```ml
function validTeamLeader(state, bot)
```

Use `state.clientFromNameFn` to perform `validTeamLeader`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot team helpers state; accesses `clientFromNameFn` and `names`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `teamleader`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L91)

<a id="function-function-mq3-game-bot-team-helpers-voicechat-function-voicechat-state-bot-toclient-voicechat-src-mq3-game-bot-team-helpers-ml-1844613924"></a>
### voiceChat

```ml
function voiceChat(state, bot, toClient, voicechat)
```

These are intentional no-ops in the original baseq3 build; their bodies only contain missionpack commands when MISSIONPACK is defined.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Not read by this implementation; retained in the `voiceChat` signature. |
| `bot` | `dynamic` | — | Not read by this implementation; retained in the `voiceChat` signature. |
| `toClient` | `dynamic` | — | Not read by this implementation; retained in the `voiceChat` signature. |
| `voicechat` | `dynamic` | — | Not read by this implementation; retained in the `voiceChat` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L175)

<a id="function-function-mq3-game-bot-team-helpers-voicechatonly-function-voicechatonly-state-bot-toclient-voicechat-src-mq3-game-bot-team-helpers-ml-1992932868"></a>
### voiceChatOnly

```ml
function voiceChatOnly(state, bot, toClient, voicechat)
```

Return `void` for `voiceChatOnly`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Not read by this implementation; retained in the `voiceChatOnly` signature. |
| `bot` | `dynamic` | — | Not read by this implementation; retained in the `voiceChatOnly` signature. |
| `toClient` | `dynamic` | — | Not read by this implementation; retained in the `voiceChatOnly` signature. |
| `voicechat` | `dynamic` | — | Not read by this implementation; retained in the `voiceChatOnly` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L181)
