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

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L280)

<a id="function-function-mq3-game-bot-team-helpers-clientfromname-function-clientfromname-state-name-src-mq3-game-bot-team-helpers-ml-319073762"></a>
### clientFromName

```ml
function clientFromName(state, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L290)

<a id="function-function-mq3-game-bot-team-helpers-clientonsameteamfromname-function-clientonsameteamfromname-state-bot-name-src-mq3-game-bot-team-helpers-ml-289864607"></a>
### clientOnSameTeamFromName

```ml
function clientOnSameTeamFromName(state, bot, name)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `name` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L298)

<a id="function-function-mq3-game-bot-team-helpers-create-function-create-src-mq3-game-bot-team-helpers-ml-1494667706"></a>
### create

```ml
function create()
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L45)

<a id="function-function-mq3-game-bot-team-helpers-creategroup-function-creategroup-state-bot-teammates-groupsize-src-mq3-game-bot-team-helpers-ml-1004574639"></a>
### createGroup

```ml
function createGroup(state, bot, teammates, groupSize)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `teammates` | `dynamic` | — |  |
| `groupSize` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L120)

<a id="function-function-mq3-game-bot-team-helpers-ctforders-function-ctforders-state-bot-redflagstatus-blueflagstatus-src-mq3-game-bot-team-helpers-ml-713252501"></a>
### ctfOrders

```ml
function ctfOrders(state, bot, redFlagStatus, blueFlagStatus)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `redFlagStatus` | `dynamic` | — |  |
| `blueFlagStatus` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L110)

<a id="function-function-mq3-game-bot-team-helpers-ctfordersbothflagsatbase-function-ctfordersbothflagsatbase-state-bot-src-mq3-game-bot-team-helpers-ml-802520488"></a>
### ctfOrdersBothFlagsAtBase

```ml
function ctfOrdersBothFlagsAtBase(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L151)

<a id="function-function-mq3-game-bot-team-helpers-ctfordersbothflagsnotatbase-function-ctfordersbothflagsnotatbase-state-bot-src-mq3-game-bot-team-helpers-ml-876664506"></a>
### ctfOrdersBothFlagsNotAtBase

```ml
function ctfOrdersBothFlagsNotAtBase(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L179)

<a id="function-function-mq3-game-bot-team-helpers-ctfordersenemyflagnotatbase-function-ctfordersenemyflagnotatbase-state-bot-src-mq3-game-bot-team-helpers-ml-167055842"></a>
### ctfOrdersEnemyFlagNotAtBase

```ml
function ctfOrdersEnemyFlagNotAtBase(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L239)

<a id="function-function-mq3-game-bot-team-helpers-ctfordersflagnotatbase-function-ctfordersflagnotatbase-state-bot-src-mq3-game-bot-team-helpers-ml-850046076"></a>
### ctfOrdersFlagNotAtBase

```ml
function ctfOrdersFlagNotAtBase(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L214)

<a id="constant-constant-mq3-game-bot-team-helpers-ctfs-agressive-const-ctfs-agressive-aiheaders-ctfs-agressive-src-mq3-game-bot-team-helpers-ml-1634674379"></a>
### CTFS_AGRESSIVE

```ml
const CTFS_AGRESSIVE = aiheaders.CTFS_AGRESSIVE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L14)

<a id="function-function-mq3-game-bot-team-helpers-deliverorder-function-deliverorder-state-bot-kind-args-toclient-src-mq3-game-bot-team-helpers-ml-1906892221"></a>
### deliverOrder

```ml
function deliverOrder(state, bot, kind, args, toClient)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `args` | `dynamic` | — |  |
| `toClient` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L145)

<a id="function-function-mq3-game-bot-team-helpers-entityisdead-function-entityisdead-state-entitynumber-src-mq3-game-bot-team-helpers-ml-460699035"></a>
### entityIsDead

```ml
function entityIsDead(state, entityNumber)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `entityNumber` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L307)

<a id="function-function-mq3-game-bot-team-helpers-findhumanteamleader-function-findhumanteamleader-state-bot-src-mq3-game-bot-team-helpers-ml-1972469656"></a>
### findHumanTeamLeader

```ml
function findHumanTeamLeader(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L132)

<a id="function-function-mq3-game-bot-team-helpers-getteammatetaskpreference-function-getteammatetaskpreference-state-bot-teammate-currentname-src-mq3-game-bot-team-helpers-ml-985030952"></a>
### getTeamMateTaskPreference

```ml
function getTeamMateTaskPreference(state, bot, teammate, currentName)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `teammate` | `dynamic` | — |  |
| `currentName` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L77)

<a id="constant-constant-mq3-game-bot-team-helpers-max-clients-const-max-clients-64-src-mq3-game-bot-team-helpers-ml-1931447045"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L10)

<a id="function-function-mq3-game-bot-team-helpers-numteammates-function-numteammates-state-bot-src-mq3-game-bot-team-helpers-ml-1925305600"></a>
### numTeamMates

```ml
function numTeamMates(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L59)

<a id="function-function-mq3-game-bot-team-helpers-oppositeteam-function-oppositeteam-state-bot-src-mq3-game-bot-team-helpers-ml-1058698984"></a>
### oppositeTeam

```ml
function oppositeTeam(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L274)

<a id="function-function-mq3-game-bot-team-helpers-sameteam-function-sameteam-state-bot-entitynumber-src-mq3-game-bot-team-helpers-ml-1189746062"></a>
### sameTeam

```ml
function sameTeam(state, bot, entityNumber)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `entityNumber` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L275)

<a id="function-function-mq3-game-bot-team-helpers-sayteamorder-function-sayteamorder-state-bot-toclient-src-mq3-game-bot-team-helpers-ml-1510499058"></a>
### sayTeamOrder

```ml
function sayTeamOrder(state, bot, toClient)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `toClient` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L103)

<a id="function-function-mq3-game-bot-team-helpers-sayteamorderalways-function-sayteamorderalways-state-bot-toclient-src-mq3-game-bot-team-helpers-ml-54100570"></a>
### sayTeamOrderAlways

```ml
function sayTeamOrderAlways(state, bot, toClient)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `toClient` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L94)

<a id="function-function-mq3-game-bot-team-helpers-sayvoiceteamorder-function-sayvoiceteamorder-state-bot-toclient-voicechat-src-mq3-game-bot-team-helpers-ml-1062082752"></a>
### sayVoiceTeamOrder

```ml
function sayVoiceTeamOrder(state, bot, toClient, voicechat)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `toClient` | `dynamic` | — |  |
| `voicechat` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L108)

<a id="function-function-mq3-game-bot-team-helpers-setteammatetaskpreference-function-setteammatetaskpreference-state-bot-teammate-preference-src-mq3-game-bot-team-helpers-ml-2076476181"></a>
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


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L71)

<a id="function-function-mq3-game-bot-team-helpers-sortteammatesbytaskpreference-function-sortteammatesbytaskpreference-state-bot-teammates-src-mq3-game-bot-team-helpers-ml-1672642199"></a>
### sortTeamMatesByTaskPreference

```ml
function sortTeamMatesByTaskPreference(state, bot, teammates)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `teammates` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L83)

- [mq3.game.bot_team_helpers.State](Type-mq3-game-bot-team-helpers-state-1367161120.md) — struct
<a id="function-function-mq3-game-bot-team-helpers-team-function-team-state-bot-src-mq3-game-bot-team-helpers-ml-2065319044"></a>
### team

```ml
function team(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L268)

<a id="constant-constant-mq3-game-bot-team-helpers-team-spectator-const-team-spectator-3-src-mq3-game-bot-team-helpers-ml-677109062"></a>
### TEAM_SPECTATOR

```ml
const TEAM_SPECTATOR = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L11)

<a id="constant-constant-mq3-game-bot-team-helpers-teamtp-attacker-const-teamtp-attacker-aiheaders-teamtp-attacker-src-mq3-game-bot-team-helpers-ml-1352634264"></a>
### TEAMTP_ATTACKER

```ml
const TEAMTP_ATTACKER = aiheaders.TEAMTP_ATTACKER
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L12)

<a id="constant-constant-mq3-game-bot-team-helpers-teamtp-defender-const-teamtp-defender-aiheaders-teamtp-defender-src-mq3-game-bot-team-helpers-ml-720124300"></a>
### TEAMTP_DEFENDER

```ml
const TEAMTP_DEFENDER = aiheaders.TEAMTP_DEFENDER
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L13)

<a id="function-function-mq3-game-bot-team-helpers-validteamleader-function-validteamleader-state-bot-src-mq3-game-bot-team-helpers-ml-1826777152"></a>
### validTeamLeader

```ml
function validTeamLeader(state, bot)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L51)

<a id="function-function-mq3-game-bot-team-helpers-voicechat-function-voicechat-state-bot-toclient-voicechat-src-mq3-game-bot-team-helpers-ml-1844613924"></a>
### voiceChat

```ml
function voiceChat(state, bot, toClient, voicechat)
```

These are intentional no-ops in the original baseq3 build; their bodies only contain missionpack commands when MISSIONPACK is defined.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `toClient` | `dynamic` | — |  |
| `voicechat` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L106)

<a id="function-function-mq3-game-bot-team-helpers-voicechatonly-function-voicechatonly-state-bot-toclient-voicechat-src-mq3-game-bot-team-helpers-ml-1992932868"></a>
### voiceChatOnly

```ml
function voiceChatOnly(state, bot, toClient, voicechat)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `toClient` | `dynamic` | — |  |
| `voicechat` | `dynamic` | — |  |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_team_helpers.ml#L107)
