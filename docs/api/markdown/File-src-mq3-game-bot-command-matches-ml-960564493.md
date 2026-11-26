# `src/mq3/game/bot_command_matches.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.bot_command_matches`](Package-mq3-game-bot-command-matches-321863815.md)

Reachable from entry: **no**

## Imports

- `mq3/botlib/ai_chat_matches.ml` as `chat` → [src/mq3/botlib/ai_chat_matches.ml](File-src-mq3-botlib-ai-chat-matches-ml-369456329.md)
- `mq3/compat/numeric.ml` as `n` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/game_headers.ml` as `headers` → [src/mq3/game/game_headers.ml](File-src-mq3-game-game-headers-ml-1243119809.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="constant-constant-mq3-game-bot-command-matches-addressee-const-addressee-headers-addressee-src-mq3-game-bot-command-matches-ml-820417285"></a>
### ADDRESSEE

```ml
const ADDRESSEE = headers.ADDRESSEE
```

Chat-match variable slot containing the intended recipient.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L172)

- [mq3.game.bot_command_matches.Bot](Type-mq3-game-bot-command-matches-bot-821620392.md) — struct
<a id="function-function-mq3-game-bot-command-matches-botaddressedtobot-function-botaddressedtobot-state-bot-match-src-mq3-game-bot-command-matches-ml-407484497"></a>
### BotAddressedToBot

```ml
function BotAddressedToBot(state, bot, match)
```

BotAddressedToBot

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `randomValue`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client` and `subteam`. |
| `match` | `dynamic` | — | Parsed match record; accesses `subtype` and `string`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L581)

<a id="function-function-mq3-game-bot-command-matches-botgetitemteamgoal-function-botgetitemteamgoal-state-goalname-src-mq3-game-bot-command-matches-ml-597494799"></a>
### BotGetItemTeamGoal

```ml
function BotGetItemTeamGoal(state, goalname)
```

BotGetItemTeamGoal

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `itemGoals`. |
| `goalname` | `dynamic` | — | Value passed as argument 1 to `std.string.toLowerAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L492)

<a id="function-function-mq3-game-bot-command-matches-botgetmessageteamgoal-function-botgetmessageteamgoal-state-bot-goalname-src-mq3-game-bot-command-matches-ml-1410356012"></a>
### BotGetMessageTeamGoal

```ml
function BotGetMessageTeamGoal(state, bot, goalname)
```

BotGetMessageTeamGoal

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `itemGoals`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `checkpoints`. |
| `goalname` | `dynamic` | — | Value passed as argument 1 to `std.string.toLowerAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L499)

<a id="function-function-mq3-game-bot-command-matches-botgetpatrolwaypoints-function-botgetpatrolwaypoints-state-bot-match-suppressed-src-mq3-game-bot-command-matches-ml-318766853"></a>
### BotGetPatrolWaypoints

```ml
function BotGetPatrolWaypoints(state, bot, match, suppressed)
```

BotGetPatrolWaypoints

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `matchState`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`, `patrolpoints`, `curpatrolpoint` and `patrolflags`. May update `bot.patrolpoints`, `bot.curpatrolpoint` and `bot.patrolflags` in place. |
| `match` | `dynamic` | — | Parsed match record; accesses `offsets`, `lengths` and `string`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L568)

<a id="function-function-mq3-game-bot-command-matches-botgettime-function-botgettime-state-match-src-mq3-game-bot-command-matches-ml-1168403572"></a>
### BotGetTime

```ml
function BotGetTime(state, match)
```

BotGetTime

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `now`. |
| `match` | `dynamic` | — | Parsed match record; accesses `subtype`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L505)

<a id="function-function-mq3-game-bot-command-matches-botgpstoposition-function-botgpstoposition-value-src-mq3-game-bot-command-matches-ml-1435933843"></a>
### BotGPSToPosition

```ml
function BotGPSToPosition(value)
```

BotGPSToPosition

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L590)

<a id="function-function-mq3-game-bot-command-matches-botmatch-attackenemybase-function-botmatch-attackenemybase-state-bot-match-suppressed-src-mq3-game-bot-command-matches-ml-2008296343"></a>
### BotMatch_AttackEnemyBase

```ml
function BotMatch_AttackEnemyBase(state, bot, match, suppressed)
```

BotMatch_AttackEnemyBase

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `gametype`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `attackawayTime`. May update `bot.attackawayTime` in place. |
| `match` | `dynamic` | — | Parsed match record; accesses `subtype` and `string`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L657)

<a id="function-function-mq3-game-bot-command-matches-botmatch-camp-function-botmatch-camp-state-bot-match-suppressed-src-mq3-game-bot-command-matches-ml-1705816995"></a>
### BotMatch_Camp

```ml
function BotMatch_Camp(state, bot, match, suppressed)
```

BotMatch_Camp

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `teamplay`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`, `entitynum`, `areanum`, `origin` and `teamgoal` and related fields. May update `bot.teamgoal`, `bot.teamgoalTime` and `bot.arriveTime` in place. |
| `match` | `dynamic` | — | Parsed match record; accesses `subtype`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L632)

<a id="function-function-mq3-game-bot-command-matches-botmatch-checkpoint-function-botmatch-checkpoint-state-bot-match-suppressed-src-mq3-game-bot-command-matches-ml-913283765"></a>
### BotMatch_CheckPoint

```ml
function BotMatch_CheckPoint(state, bot, match, suppressed)
```

BotMatch_CheckPoint

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `teamplay` and `pointAreas`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `areanum`, `client` and `checkpoints`. May update `bot.checkpoints` in place. |
| `match` | `dynamic` | — | Parsed match record; accesses `offsets`, `lengths` and `string`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L705)

<a id="function-function-mq3-game-bot-command-matches-botmatch-ctf-function-botmatch-ctf-state-bot-match-suppressed-src-mq3-game-bot-command-matches-ml-895044815"></a>
### BotMatch_CTF

```ml
function BotMatch_CTF(state, bot, match, suppressed)
```

BotMatch_CTF

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `gametype` and `now`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `redflagstatus`, `team`, `flagcarrier`, `blueflagstatus` and `flagstatuschanged` and related fields. May update `bot.redflagstatus`, `bot.flagcarrier` and `bot.blueflagstatus` and additional fields in place. |
| `match` | `dynamic` | — | Parsed match record; accesses `subtype`. |
| `suppressed` | `dynamic` | — | Not read by this implementation; retained in the `BotMatch_CTF` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L786)

<a id="function-function-mq3-game-bot-command-matches-botmatch-defendkeyarea-function-botmatch-defendkeyarea-state-bot-match-suppressed-src-mq3-game-bot-command-matches-ml-2146898615"></a>
### BotMatch_DefendKeyArea

```ml
function BotMatch_DefendKeyArea(state, bot, match, suppressed)
```

BotMatch_DefendKeyArea

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `teamplay`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `teamgoalTime` and `defendawayTime`. May update `bot.teamgoalTime` and `bot.defendawayTime` in place. |
| `match` | `dynamic` | — | Parsed match record; accesses `subtype` and `string`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L620)

<a id="function-function-mq3-game-bot-command-matches-botmatch-dismiss-function-botmatch-dismiss-state-bot-match-suppressed-src-mq3-game-bot-command-matches-ml-2104390103"></a>
### BotMatch_Dismiss

```ml
function BotMatch_Dismiss(state, bot, match, suppressed)
```

BotMatch_Dismiss

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `teamplay`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `decisionmaker`, `ltgtype`, `leadTime` and `lastgoalLtgtype`. May update `bot.decisionmaker`, `bot.ltgtype` and `bot.leadTime` and additional fields in place. |
| `match` | `dynamic` | — | Parsed match record; accesses `subtype` and `string`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L717)

<a id="function-function-mq3-game-bot-command-matches-botmatch-entergame-function-botmatch-entergame-state-bot-match-suppressed-src-mq3-game-bot-command-matches-ml-1081478771"></a>
### BotMatch_EnterGame

```ml
function BotMatch_EnterGame(state, bot, match, suppressed)
```

BotMatch_EnterGame

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `notleader`. May update `state.notleader[client]` in place. |
| `bot` | `dynamic` | — | Not read by this implementation; retained in the `BotMatch_EnterGame` signature. |
| `match` | `dynamic` | — | Parsed match record; accesses `offsets`, `lengths` and `string`. |
| `suppressed` | `dynamic` | — | Not read by this implementation; retained in the `BotMatch_EnterGame` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L792)

<a id="function-function-mq3-game-bot-command-matches-botmatch-formationspace-function-botmatch-formationspace-state-bot-match-suppressed-src-mq3-game-bot-command-matches-ml-152908095"></a>
### BotMatch_FormationSpace

```ml
function BotMatch_FormationSpace(state, bot, match, suppressed)
```

BotMatch_FormationSpace

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `teamplay`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `formationDist`. May update `bot.formationDist` in place. |
| `match` | `dynamic` | — | Parsed match record; accesses `subtype`. |
| `suppressed` | `dynamic` | — | Not read by this implementation; retained in the `BotMatch_FormationSpace` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L711)

<a id="function-function-mq3-game-bot-command-matches-botmatch-getflag-function-botmatch-getflag-state-bot-match-suppressed-src-mq3-game-bot-command-matches-ml-1241206715"></a>
### BotMatch_GetFlag

```ml
function BotMatch_GetFlag(state, bot, match, suppressed)
```

BotMatch_GetFlag

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `gametype`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client` and `team`. |
| `match` | `dynamic` | — | Parsed match record; accesses `subtype` and `string`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L651)

<a id="function-function-mq3-game-bot-command-matches-botmatch-getitem-function-botmatch-getitem-state-bot-match-suppressed-src-mq3-game-bot-command-matches-ml-269690655"></a>
### BotMatch_GetItem

```ml
function BotMatch_GetItem(state, bot, match, suppressed)
```

BotMatch_GetItem

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `teamplay`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `teamgoal`. May update `bot.teamgoal` in place. |
| `match` | `dynamic` | — | Parsed match record; accesses `subtype` and `string`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L626)

<a id="function-function-mq3-game-bot-command-matches-botmatch-harvest-function-botmatch-harvest-state-bot-match-suppressed-src-mq3-game-bot-command-matches-ml-1197580511"></a>
### BotMatch_Harvest

```ml
function BotMatch_Harvest(state, bot, match, suppressed)
```

BotMatch_Harvest

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `gametype`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `harvestawayTime`. May update `bot.harvestawayTime` in place. |
| `match` | `dynamic` | — | Parsed match record; accesses `subtype` and `string`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L663)

<a id="function-function-mq3-game-bot-command-matches-botmatch-helpaccompany-function-botmatch-helpaccompany-state-bot-match-suppressed-src-mq3-game-bot-command-matches-ml-1402892451"></a>
### BotMatch_HelpAccompany

```ml
function BotMatch_HelpAccompany(state, bot, match, suppressed)
```

BotMatch_HelpAccompany

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `teamplay` and `now`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`, `teamgoal`, `teammate`, `teammatevisibleTime` and `ltgtype` and related fields. May update `bot.teamgoal`, `bot.teammate` and `bot.teammatevisibleTime` and additional fields in place. |
| `match` | `dynamic` | — | Parsed match record; accesses `subtype` and `type`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L599)

<a id="function-function-mq3-game-bot-command-matches-botmatch-joinsubteam-function-botmatch-joinsubteam-state-bot-match-suppressed-src-mq3-game-bot-command-matches-ml-284253615"></a>
### BotMatch_JoinSubteam

```ml
function BotMatch_JoinSubteam(state, bot, match, suppressed)
```

BotMatch_JoinSubteam

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `teamplay`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `subteam`. May update `bot.subteam` in place. |
| `match` | `dynamic` | — | Parsed match record; accesses `subtype` and `string`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L687)

<a id="function-function-mq3-game-bot-command-matches-botmatch-kill-function-botmatch-kill-state-bot-match-suppressed-src-mq3-game-bot-command-matches-ml-1736228233"></a>
### BotMatch_Kill

```ml
function BotMatch_Kill(state, bot, match, suppressed)
```

BotMatch_Kill

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `teamplay`, `now` and `randomValue`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `teamgoal`, `teammessageTime`, `ltgtype`, `teamgoalTime` and `client`. May update `bot.teamgoal.entitynum`, `bot.teammessageTime` and `bot.ltgtype` and additional fields in place. |
| `match` | `dynamic` | — | Parsed match record; accesses `subtype` and `string`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L780)

<a id="function-function-mq3-game-bot-command-matches-botmatch-leadtheway-function-botmatch-leadtheway-state-bot-match-suppressed-src-mq3-game-bot-command-matches-ml-2046824237"></a>
### BotMatch_LeadTheWay

```ml
function BotMatch_LeadTheWay(state, bot, match, suppressed)
```

BotMatch_LeadTheWay

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `teamplay`, `now` and `randomValue`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`, `leadTeamgoal`, `leadTeammate`, `leadTime` and `leadvisibleTime` and related fields. May update `bot.leadTeamgoal`, `bot.leadTeammate` and `bot.leadTime` and additional fields in place. |
| `match` | `dynamic` | — | Parsed match record; accesses `subtype`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L774)

<a id="function-function-mq3-game-bot-command-matches-botmatch-leavesubteam-function-botmatch-leavesubteam-state-bot-match-suppressed-src-mq3-game-bot-command-matches-ml-357809165"></a>
### BotMatch_LeaveSubteam

```ml
function BotMatch_LeaveSubteam(state, bot, match, suppressed)
```

BotMatch_LeaveSubteam

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `teamplay`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `subteam`. May update `bot.subteam` in place. |
| `match` | `dynamic` | — | Parsed match record; accesses `subtype` and `string`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L693)

<a id="function-function-mq3-game-bot-command-matches-botmatch-newleader-function-botmatch-newleader-state-bot-match-suppressed-src-mq3-game-bot-command-matches-ml-1994993855"></a>
### BotMatch_NewLeader

```ml
function BotMatch_NewLeader(state, bot, match, suppressed)
```

BotMatch_NewLeader

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `maxclients` and `names`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `teamleader`. May update `bot.teamleader` in place. |
| `match` | `dynamic` | — | Parsed match record; accesses `offsets`, `lengths` and `string`. |
| `suppressed` | `dynamic` | — | Not read by this implementation; retained in the `BotMatch_NewLeader` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L798)

<a id="function-function-mq3-game-bot-command-matches-botmatch-patrol-function-botmatch-patrol-state-bot-match-suppressed-src-mq3-game-bot-command-matches-ml-220409381"></a>
### BotMatch_Patrol

```ml
function BotMatch_Patrol(state, bot, match, suppressed)
```

BotMatch_Patrol

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `teamplay`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `teamgoalTime`. May update `bot.teamgoalTime` in place. |
| `match` | `dynamic` | — | Parsed match record; accesses `subtype` and `string`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L641)

<a id="function-function-mq3-game-bot-command-matches-botmatch-returnflag-function-botmatch-returnflag-state-bot-match-suppressed-src-mq3-game-bot-command-matches-ml-188873593"></a>
### BotMatch_ReturnFlag

```ml
function BotMatch_ReturnFlag(state, bot, match, suppressed)
```

BotMatch_ReturnFlag

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `gametype`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `rushbaseawayTime`. May update `bot.rushbaseawayTime` in place. |
| `match` | `dynamic` | — | Parsed match record; accesses `subtype` and `string`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L681)

<a id="function-function-mq3-game-bot-command-matches-botmatch-rushbase-function-botmatch-rushbase-state-bot-match-suppressed-src-mq3-game-bot-command-matches-ml-1331110695"></a>
### BotMatch_RushBase

```ml
function BotMatch_RushBase(state, bot, match, suppressed)
```

BotMatch_RushBase

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `gametype`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `rushbaseawayTime`. May update `bot.rushbaseawayTime` in place. |
| `match` | `dynamic` | — | Parsed match record; accesses `subtype` and `string`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L669)

<a id="function-function-mq3-game-bot-command-matches-botmatch-startteamleadership-function-botmatch-startteamleadership-state-bot-match-suppressed-src-mq3-game-bot-command-matches-ml-1275007151"></a>
### BotMatch_StartTeamLeaderShip

```ml
function BotMatch_StartTeamLeaderShip(state, bot, match, suppressed)
```

BotMatch_StartTeamLeaderShip

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `teamplay` and `names`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `teamleader`. May update `bot.teamleader` in place. |
| `match` | `dynamic` | — | Parsed match record; accesses `subtype`. |
| `suppressed` | `dynamic` | — | Not read by this implementation; retained in the `BotMatch_StartTeamLeaderShip` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L729)

<a id="function-function-mq3-game-bot-command-matches-botmatch-stopteamleadership-function-botmatch-stopteamleadership-state-bot-match-suppressed-src-mq3-game-bot-command-matches-ml-508473677"></a>
### BotMatch_StopTeamLeaderShip

```ml
function BotMatch_StopTeamLeaderShip(state, bot, match, suppressed)
```

BotMatch_StopTeamLeaderShip

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `teamplay`, `names` and `notleader`. May update `state.notleader[client]` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `teamleader`. May update `bot.teamleader` in place. |
| `match` | `dynamic` | — | Parsed match record; accesses `subtype`. |
| `suppressed` | `dynamic` | — | Not read by this implementation; retained in the `BotMatch_StopTeamLeaderShip` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L735)

<a id="function-function-mq3-game-bot-command-matches-botmatch-suicide-function-botmatch-suicide-state-bot-match-suppressed-src-mq3-game-bot-command-matches-ml-1991758403"></a>
### BotMatch_Suicide

```ml
function BotMatch_Suicide(state, bot, match, suppressed)
```

BotMatch_Suicide

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `teamplay`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `match` | `dynamic` | — | Parsed match record; accesses `subtype` and `string`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L723)

<a id="function-function-mq3-game-bot-command-matches-botmatch-taskpreference-function-botmatch-taskpreference-state-bot-match-suppressed-src-mq3-game-bot-command-matches-ml-495187693"></a>
### BotMatch_TaskPreference

```ml
function BotMatch_TaskPreference(state, bot, match, suppressed)
```

BotMatch_TaskPreference

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `taskPreferences`, `preferenceNames` and `names`. May update `state.taskPreferences[client]` and `state.preferenceNames[client]` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client` and `teamleader`. |
| `match` | `dynamic` | — | Parsed match record; accesses `subtype`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L675)

<a id="function-function-mq3-game-bot-command-matches-botmatch-whatareyoudoing-function-botmatch-whatareyoudoing-state-bot-match-suppressed-src-mq3-game-bot-command-matches-ml-1173788347"></a>
### BotMatch_WhatAreYouDoing

```ml
function BotMatch_WhatAreYouDoing(state, bot, match, suppressed)
```

BotMatch_WhatAreYouDoing

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `randomValue`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ltgtype`. |
| `match` | `dynamic` | — | Parsed match record; accesses `subtype` and `string`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L747)

<a id="function-function-mq3-game-bot-command-matches-botmatch-whatismycommand-function-botmatch-whatismycommand-state-bot-match-suppressed-src-mq3-game-bot-command-matches-ml-683363495"></a>
### BotMatch_WhatIsMyCommand

```ml
function BotMatch_WhatIsMyCommand(state, bot, match, suppressed)
```

BotMatch_WhatIsMyCommand

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `names`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`, `teamleader` and `forceorders`. May update `bot.forceorders` in place. |
| `match` | `dynamic` | — | Not read by this implementation; retained in the `BotMatch_WhatIsMyCommand` signature. |
| `suppressed` | `dynamic` | — | Not read by this implementation; retained in the `BotMatch_WhatIsMyCommand` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L753)

<a id="function-function-mq3-game-bot-command-matches-botmatch-whereareyou-function-botmatch-whereareyou-state-bot-match-suppressed-src-mq3-game-bot-command-matches-ml-1941821759"></a>
### BotMatch_WhereAreYou

```ml
function BotMatch_WhereAreYou(state, bot, match, suppressed)
```

BotMatch_WhereAreYou

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `teamplay`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client` and `subteam`. |
| `match` | `dynamic` | — | Parsed match record; accesses `subtype` and `string`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L766)

<a id="function-function-mq3-game-bot-command-matches-botmatch-whichteam-function-botmatch-whichteam-state-bot-match-suppressed-src-mq3-game-bot-command-matches-ml-1507381867"></a>
### BotMatch_WhichTeam

```ml
function BotMatch_WhichTeam(state, bot, match, suppressed)
```

BotMatch_WhichTeam

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `teamplay`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `subteam` and `client`. |
| `match` | `dynamic` | — | Parsed match record; accesses `subtype` and `string`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L699)

<a id="function-function-mq3-game-bot-command-matches-botmatch-whoisteamleader-function-botmatch-whoisteamleader-state-bot-match-suppressed-src-mq3-game-bot-command-matches-ml-1393400823"></a>
### BotMatch_WhoIsTeamLeader

```ml
function BotMatch_WhoIsTeamLeader(state, bot, match, suppressed)
```

BotMatch_WhoIsTeamLeader

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `teamplay`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client` and `teamleader`. |
| `match` | `dynamic` | — | Not read by this implementation; retained in the `BotMatch_WhoIsTeamLeader` signature. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L741)

<a id="function-function-mq3-game-bot-command-matches-botmatchmessage-function-botmatchmessage-state-bot-message-suppressed-src-mq3-game-bot-command-matches-ml-1633925671"></a>
### BotMatchMessage

```ml
function BotMatchMessage(state, bot, message, suppressed)
```

BotMatchMessage

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `matchState`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `message` | `dynamic` | — | Message text supplied to the diagnostic or chat operation. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L805)

<a id="function-function-mq3-game-bot-command-matches-botnearestvisibleitem-function-botnearestvisibleitem-state-bot-itemname-src-mq3-game-bot-command-matches-ml-1172907796"></a>
### BotNearestVisibleItem

```ml
function BotNearestVisibleItem(state, bot, itemname)
```

BotNearestVisibleItem

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `itemGoals` and `traceVisibleFn`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `origin`. |
| `itemname` | `dynamic` | — | Value passed as argument 1 to `std.string.toLowerAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L758)

<a id="function-function-mq3-game-bot-command-matches-botprintteamgoal-function-botprintteamgoal-state-bot-suppressed-src-mq3-game-bot-command-matches-ml-532081758"></a>
### BotPrintTeamGoal

```ml
function BotPrintTeamGoal(state, bot, suppressed)
```

BotPrintTeamGoal

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `now`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `ltgtype`, `client` and `teamgoalTime`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L485)

<a id="constant-constant-mq3-game-bot-command-matches-chat-team-const-chat-team-1-src-mq3-game-bot-command-matches-ml-1075490004"></a>
### CHAT_TEAM

```ml
const CHAT_TEAM = 1
```

Chat-state value or flag selecting team.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L26)

<a id="constant-constant-mq3-game-bot-command-matches-chat-tell-const-chat-tell-2-src-mq3-game-bot-command-matches-ml-881551885"></a>
### CHAT_TELL

```ml
const CHAT_TELL = 2
```

Chat-state value or flag selecting tell.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L28)

<a id="function-function-mq3-game-bot-command-matches-clientname-function-clientname-state-client-src-mq3-game-bot-command-matches-ml-1656616562"></a>
### clientName

```ml
function clientName(state, client)
```

Read the command-matching player-name table, using an empty string for an invalid client slot.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `names`. |
| `client` | `dynamic` | — | Operand used to evaluate the returned expression `state.names[client]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L474)

<a id="function-function-mq3-game-bot-command-matches-containsfold-function-containsfold-value-needle-src-mq3-game-bot-command-matches-ml-542512318"></a>
### containsFold

```ml
function containsFold(value, needle)
```

Test `chat.stringContains(value,needle,false)>=0` as the condition for `containsFold`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |
| `needle` | `dynamic` | — | Text or value to search for. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L470)

<a id="function-function-mq3-game-bot-command-matches-copygoal-function-copygoal-value-src-mq3-game-bot-command-matches-ml-1575036287"></a>
### copyGoal

```ml
function copyGoal(value)
```

Forward `copyGoal` to `mq3.game.bot_command_matches.goal` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `number`, `entitynum`, `areanum`, `origin` and `mins` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L431)

<a id="function-function-mq3-game-bot-command-matches-create-function-create-matchstate-src-mq3-game-bot-command-matches-ml-1196293400"></a>
### create

```ml
function create(matchState)
```

Build the `mq3.game.bot_command_matches.State` result for `create`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `matchState` | `dynamic` | — | Initial value stored in `mq3.game.bot_command_matches.State.matchState`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L439)

<a id="function-function-mq3-game-bot-command-matches-createbot-function-createbot-client-src-mq3-game-bot-command-matches-ml-764644349"></a>
### createBot

```ml
function createBot(client)
```

Build the `mq3.game.bot_command_matches.Bot` result for `createBot`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — | Initial value stored in `mq3.game.bot_command_matches.Bot.client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L434)

<a id="function-function-mq3-game-bot-command-matches-emit-function-emit-state-kind-client-channel-text-arg-value-suppressed-src-mq3-game-bot-command-matches-ml-1125660503"></a>
### emit

```ml
function emit(state, kind, client, channel, text, arg, value, suppressed)
```

Set `state.actions` to `state.actions+[action]` in `mq3.game.bot_command_matches.emit`. Return paths include `action`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `actions` and `hostActionFn`. May update `state.actions` in place. |
| `kind` | `dynamic` | — | Initial value stored in `mq3.game.bot_command_matches.HostAction.kind`. |
| `client` | `dynamic` | — | Initial value stored in `mq3.game.bot_command_matches.HostAction.client`. |
| `channel` | `dynamic` | — | Channel identifier for the requested action. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |
| `arg` | `dynamic` | — | Initial value stored in `mq3.game.bot_command_matches.HostAction.arg`. |
| `value` | `dynamic` | — | Initial value stored in `mq3.game.bot_command_matches.HostAction.value`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L452)

<a id="function-function-mq3-game-bot-command-matches-emptygoal-function-emptygoal-src-mq3-game-bot-command-matches-ml-1549671286"></a>
### emptyGoal

```ml
function emptyGoal()
```

Forward `emptyGoal` to `mq3.game.bot_command_matches.goal` and return the delegated result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L428)

<a id="constant-constant-mq3-game-bot-command-matches-enemy-const-enemy-headers-enemy-src-mq3-game-bot-command-matches-ml-208577843"></a>
### ENEMY

```ml
const ENEMY = headers.ENEMY
```

Chat-match variable slot containing the selected enemy.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L180)

<a id="function-function-mq3-game-bot-command-matches-enter-function-enter-state-bot-client-channel-suppressed-src-mq3-game-bot-command-matches-ml-1158031050"></a>
### enter

```ml
function enter(state, bot, client, channel, suppressed)
```

Record or dispatch `"enter-chat"` actions in `enter`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `actions` and `hostActionFn`. May update `state.actions` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `cs`. |
| `client` | `dynamic` | — | Initial value stored in `mq3.game.bot_command_matches.HostAction.client`. |
| `channel` | `dynamic` | — | Channel identifier for the requested action. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L561)

- [mq3.game.bot_command_matches.EntityInfo](Type-mq3-game-bot-command-matches-entityinfo-303929128.md) — struct
<a id="function-function-mq3-game-bot-command-matches-find-function-find-state-value-context-src-mq3-game-bot-command-matches-ml-315314655"></a>
### find

```ml
function find(state, value, context)
```

Forward `find` to `mq3.botlib.ai_chat_matches.findMatch` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `matchState`. |
| `value` | `dynamic` | — | Value passed as argument 1 to `bytes`. |
| `context` | `dynamic` | — | Bit mask selecting the bot-chat contexts accepted by this operation. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L463)

<a id="function-function-mq3-game-bot-command-matches-findclientbyname-function-findclientbyname-state-name-src-mq3-game-bot-command-matches-ml-1407429270"></a>
### FindClientByName

```ml
function FindClientByName(state, name)
```

FindClientByName

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `maxclients` and `names`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L513)

<a id="function-function-mq3-game-bot-command-matches-findenemybyname-function-findenemybyname-state-bot-name-src-mq3-game-bot-command-matches-ml-1967660595"></a>
### FindEnemyByName

```ml
function FindEnemyByName(state, bot, name)
```

FindEnemyByName

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `maxclients` and `names`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `team`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L520)

<a id="constant-constant-mq3-game-bot-command-matches-flag-const-flag-headers-flag-src-mq3-game-bot-command-matches-ml-1641343653"></a>
### FLAG

```ml
const FLAG = headers.FLAG
```

Chat-match variable slot containing a flag reference.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L170)

<a id="function-function-mq3-game-bot-command-matches-goal-function-goal-number-entitynum-areanum-origin-mins-maxs-flags-name-src-mq3-game-bot-command-matches-ml-1290772281"></a>
### goal

```ml
function goal(number, entitynum, areanum, origin, mins, maxs, flags, name)
```

Create a `mq3.game.bot_command_matches.Goal` record, initializing `number` from `number`, `entitynum` from `entitynum` and `areanum` from `areanum`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — | Initial value stored in `mq3.game.bot_command_matches.Goal.number`. |
| `entitynum` | `dynamic` | — | Initial value stored in `mq3.game.bot_command_matches.Goal.entitynum`. |
| `areanum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `mins` | `dynamic` | — | Minimum coordinates of the axis-aligned bounds. |
| `maxs` | `dynamic` | — | Maximum coordinates of the axis-aligned bounds. |
| `flags` | `dynamic` | — | Initial value stored in `mq3.game.bot_command_matches.Goal.flags`. |
| `name` | `dynamic` | — | Name used to identify the requested entry. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L426)

- [mq3.game.bot_command_matches.Goal](Type-mq3-game-bot-command-matches-goal-326680820.md) — struct
<a id="function-function-mq3-game-bot-command-matches-goalorder-function-goalorder-state-bot-match-varindex-ltg-duration-suppressed-src-mq3-game-bot-command-matches-ml-1335223437"></a>
### goalOrder

```ml
function goalOrder(state, bot, match, varIndex, ltg, duration, suppressed)
```

Set `bot.teamgoal` to `g` in `mq3.game.bot_command_matches.goalOrder`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `teamplay`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `teamgoal`. May update `bot.teamgoal` in place. |
| `match` | `dynamic` | — | Parsed match record; accesses `subtype` and `string`. |
| `varIndex` | `dynamic` | — | Index of the entry to access. |
| `ltg` | `dynamic` | — | Initial value stored in `mq3.game.bot_command_matches.HostAction.value`. |
| `duration` | `dynamic` | — | Value used by `order` in `bot.teamgoalTime=state.now+duration`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L612)

<a id="constant-constant-mq3-game-bot-command-matches-gt-1fctf-const-gt-1fctf-5-src-mq3-game-bot-command-matches-ml-540294082"></a>
### GT_1FCTF

```ml
const GT_1FCTF = 5
```

Game-mode identifier selecting 1 fctf rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L20)

<a id="constant-constant-mq3-game-bot-command-matches-gt-ctf-const-gt-ctf-4-src-mq3-game-bot-command-matches-ml-1822805315"></a>
### GT_CTF

```ml
const GT_CTF = 4
```

Game-mode identifier selecting capture the flag rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L18)

<a id="constant-constant-mq3-game-bot-command-matches-gt-harvester-const-gt-harvester-7-src-mq3-game-bot-command-matches-ml-1218291832"></a>
### GT_HARVESTER

```ml
const GT_HARVESTER = 7
```

Game-mode identifier selecting harvester rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L24)

<a id="constant-constant-mq3-game-bot-command-matches-gt-obelisk-const-gt-obelisk-6-src-mq3-game-bot-command-matches-ml-1409387689"></a>
### GT_OBELISK

```ml
const GT_OBELISK = 6
```

Game-mode identifier selecting obelisk rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L22)

- [mq3.game.bot_command_matches.HostAction](Type-mq3-game-bot-command-matches-hostaction-1683869455.md) — struct
<a id="function-function-mq3-game-bot-command-matches-initial-function-initial-state-bot-key-arg-suppressed-src-mq3-game-bot-command-matches-ml-2140004261"></a>
### initial

```ml
function initial(state, bot, key, arg, suppressed)
```

Record or dispatch `"initial-chat"` actions in `initial`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `actions` and `hostActionFn`. May update `state.actions` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `key` | `dynamic` | — | Lookup key or field name used by the operation. |
| `arg` | `dynamic` | — | Initial value stored in `mq3.game.bot_command_matches.HostAction.arg`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L554)

<a id="constant-constant-mq3-game-bot-command-matches-item-const-item-headers-item-src-mq3-game-bot-command-matches-ml-1616537826"></a>
### ITEM

```ml
const ITEM = headers.ITEM
```

Chat-match variable slot containing an item reference.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L174)

<a id="constant-constant-mq3-game-bot-command-matches-keyarea-const-keyarea-headers-keyarea-src-mq3-game-bot-command-matches-ml-653378457"></a>
### KEYAREA

```ml
const KEYAREA = headers.KEYAREA
```

Chat-match variable slot containing an area to defend or visit.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L182)

<a id="function-function-mq3-game-bot-command-matches-lower-function-lower-value-src-mq3-game-bot-command-matches-ml-1833627281"></a>
### lower

```ml
function lower(value)
```

Return the result of `strings.toLowerAscii(value)` for `lower`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value passed as argument 1 to `std.string.toLowerAscii`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L466)

<a id="constant-constant-mq3-game-bot-command-matches-ltg-attackenemybase-const-ltg-attackenemybase-13-src-mq3-game-bot-command-matches-ml-2056806701"></a>
### LTG_ATTACKENEMYBASE

```ml
const LTG_ATTACKENEMYBASE = 13
```

Long-term bot goal identifier selecting attackenemybase behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L218)

<a id="constant-constant-mq3-game-bot-command-matches-ltg-camp-const-ltg-camp-7-src-mq3-game-bot-command-matches-ml-1068619018"></a>
### LTG_CAMP

```ml
const LTG_CAMP = 7
```

Long-term bot goal identifier selecting camp behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L206)

<a id="constant-constant-mq3-game-bot-command-matches-ltg-camporder-const-ltg-camporder-8-src-mq3-game-bot-command-matches-ml-849053791"></a>
### LTG_CAMPORDER

```ml
const LTG_CAMPORDER = 8
```

Long-term bot goal identifier selecting follow a camp order behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L208)

<a id="constant-constant-mq3-game-bot-command-matches-ltg-defendkeyarea-const-ltg-defendkeyarea-3-src-mq3-game-bot-command-matches-ml-1586499422"></a>
### LTG_DEFENDKEYAREA

```ml
const LTG_DEFENDKEYAREA = 3
```

Long-term bot goal identifier selecting defend a key area behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L198)

<a id="constant-constant-mq3-game-bot-command-matches-ltg-getflag-const-ltg-getflag-4-src-mq3-game-bot-command-matches-ml-307599831"></a>
### LTG_GETFLAG

```ml
const LTG_GETFLAG = 4
```

Long-term bot goal identifier selecting capture the flag behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L200)

<a id="constant-constant-mq3-game-bot-command-matches-ltg-getitem-const-ltg-getitem-10-src-mq3-game-bot-command-matches-ml-1190734068"></a>
### LTG_GETITEM

```ml
const LTG_GETITEM = 10
```

Long-term bot goal identifier selecting getitem behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L212)

<a id="constant-constant-mq3-game-bot-command-matches-ltg-harvest-const-ltg-harvest-12-src-mq3-game-bot-command-matches-ml-1467483442"></a>
### LTG_HARVEST

```ml
const LTG_HARVEST = 12
```

Long-term bot goal identifier selecting harvest behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L216)

<a id="constant-constant-mq3-game-bot-command-matches-ltg-kill-const-ltg-kill-11-src-mq3-game-bot-command-matches-ml-1388242105"></a>
### LTG_KILL

```ml
const LTG_KILL = 11
```

Long-term bot goal identifier selecting kill behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L214)

<a id="constant-constant-mq3-game-bot-command-matches-ltg-patrol-const-ltg-patrol-9-src-mq3-game-bot-command-matches-ml-662604302"></a>
### LTG_PATROL

```ml
const LTG_PATROL = 9
```

Long-term bot goal identifier selecting patrol behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L210)

<a id="constant-constant-mq3-game-bot-command-matches-ltg-returnflag-const-ltg-returnflag-6-src-mq3-game-bot-command-matches-ml-1823654223"></a>
### LTG_RETURNFLAG

```ml
const LTG_RETURNFLAG = 6
```

Long-term bot goal identifier selecting return the flag behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L204)

<a id="constant-constant-mq3-game-bot-command-matches-ltg-rushbase-const-ltg-rushbase-5-src-mq3-game-bot-command-matches-ml-1852133628"></a>
### LTG_RUSHBASE

```ml
const LTG_RUSHBASE = 5
```

Long-term bot goal identifier selecting rush the base behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L202)

<a id="constant-constant-mq3-game-bot-command-matches-ltg-teamaccompany-const-ltg-teamaccompany-2-src-mq3-game-bot-command-matches-ml-191253961"></a>
### LTG_TEAMACCOMPANY

```ml
const LTG_TEAMACCOMPANY = 2
```

Long-term bot goal identifier selecting teamaccompany behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L196)

<a id="constant-constant-mq3-game-bot-command-matches-ltg-teamhelp-const-ltg-teamhelp-1-src-mq3-game-bot-command-matches-ml-2057090834"></a>
### LTG_TEAMHELP

```ml
const LTG_TEAMHELP = 1
```

Long-term bot goal identifier selecting teamhelp behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L194)

<a id="constant-constant-mq3-game-bot-command-matches-max-clients-const-max-clients-64-src-mq3-game-bot-command-matches-ml-949606231"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```

Maximum number of client slots represented by the original game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L12)

<a id="constant-constant-mq3-game-bot-command-matches-more-const-more-headers-more-src-mq3-game-bot-command-matches-ml-502580844"></a>
### MORE

```ml
const MORE = headers.MORE
```

Chat-match variable slot retaining the remaining argument text.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L192)

<a id="constant-constant-mq3-game-bot-command-matches-msg-accompany-const-msg-accompany-headers-msg-accompany-src-mq3-game-bot-command-matches-ml-1880060854"></a>
### MSG_ACCOMPANY

```ml
const MSG_ACCOMPANY = headers.MSG_ACCOMPANY
```

Bot chat-message type used to recognize or dispatch accompany messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L52)

<a id="constant-constant-mq3-game-bot-command-matches-msg-attackenemybase-const-msg-attackenemybase-headers-msg-attackenemybase-src-mq3-game-bot-command-matches-ml-1661591248"></a>
### MSG_ATTACKENEMYBASE

```ml
const MSG_ATTACKENEMYBASE = headers.MSG_ATTACKENEMYBASE
```

Bot chat-message type used to recognize or dispatch attackenemybase messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L106)

<a id="constant-constant-mq3-game-bot-command-matches-msg-camp-const-msg-camp-headers-msg-camp-src-mq3-game-bot-command-matches-ml-410888486"></a>
### MSG_CAMP

```ml
const MSG_CAMP = headers.MSG_CAMP
```

Bot chat-message type used to recognize or dispatch camp messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L84)

<a id="constant-constant-mq3-game-bot-command-matches-msg-chattell-const-msg-chattell-headers-msg-chattell-src-mq3-game-bot-command-matches-ml-1386135882"></a>
### MSG_CHATTELL

```ml
const MSG_CHATTELL = headers.MSG_CHATTELL
```

Bot chat-message type used to recognize or dispatch chattell messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L128)

<a id="constant-constant-mq3-game-bot-command-matches-msg-checkpoint-const-msg-checkpoint-headers-msg-checkpoint-src-mq3-game-bot-command-matches-ml-1471063319"></a>
### MSG_CHECKPOINT

```ml
const MSG_CHECKPOINT = headers.MSG_CHECKPOINT
```

Bot chat-message type used to recognize or dispatch checkpoint messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L86)

<a id="constant-constant-mq3-game-bot-command-matches-msg-createnewformation-const-msg-createnewformation-headers-msg-createnewformation-src-mq3-game-bot-command-matches-ml-284596490"></a>
### MSG_CREATENEWFORMATION

```ml
const MSG_CREATENEWFORMATION = headers.MSG_CREATENEWFORMATION
```

Bot chat-message type used to recognize or dispatch createnewformation messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L74)

<a id="constant-constant-mq3-game-bot-command-matches-msg-ctf-const-msg-ctf-headers-msg-ctf-src-mq3-game-bot-command-matches-ml-2024960294"></a>
### MSG_CTF

```ml
const MSG_CTF = headers.MSG_CTF
```

Bot chat-message type used to recognize or dispatch capture the flag messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L130)

<a id="constant-constant-mq3-game-bot-command-matches-msg-defendkeyarea-const-msg-defendkeyarea-headers-msg-defendkeyarea-src-mq3-game-bot-command-matches-ml-2088712411"></a>
### MSG_DEFENDKEYAREA

```ml
const MSG_DEFENDKEYAREA = headers.MSG_DEFENDKEYAREA
```

Bot chat-message type used to recognize or dispatch defend a key area messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L54)

<a id="constant-constant-mq3-game-bot-command-matches-msg-dismiss-const-msg-dismiss-headers-msg-dismiss-src-mq3-game-bot-command-matches-ml-1359180085"></a>
### MSG_DISMISS

```ml
const MSG_DISMISS = headers.MSG_DISMISS
```

Bot chat-message type used to recognize or dispatch dismiss messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L82)

<a id="constant-constant-mq3-game-bot-command-matches-msg-doformation-const-msg-doformation-headers-msg-doformation-src-mq3-game-bot-command-matches-ml-563231429"></a>
### MSG_DOFORMATION

```ml
const MSG_DOFORMATION = headers.MSG_DOFORMATION
```

Bot chat-message type used to recognize or dispatch doformation messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L80)

<a id="constant-constant-mq3-game-bot-command-matches-msg-entergame-const-msg-entergame-headers-msg-entergame-src-mq3-game-bot-command-matches-ml-2034606293"></a>
### MSG_ENTERGAME

```ml
const MSG_ENTERGAME = headers.MSG_ENTERGAME
```

Bot chat-message type used to recognize or dispatch entergame messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L48)

<a id="constant-constant-mq3-game-bot-command-matches-msg-everyone-const-msg-everyone-headers-msg-everyone-src-mq3-game-bot-command-matches-ml-599659502"></a>
### MSG_EVERYONE

```ml
const MSG_EVERYONE = headers.MSG_EVERYONE
```

Bot chat-message type used to recognize or dispatch everyone messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L114)

<a id="constant-constant-mq3-game-bot-command-matches-msg-foralongtime-const-msg-foralongtime-headers-msg-foralongtime-src-mq3-game-bot-command-matches-ml-1923233810"></a>
### MSG_FORALONGTIME

```ml
const MSG_FORALONGTIME = headers.MSG_FORALONGTIME
```

Bot chat-message type used to recognize or dispatch foralongtime messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L124)

<a id="constant-constant-mq3-game-bot-command-matches-msg-forawhile-const-msg-forawhile-headers-msg-forawhile-src-mq3-game-bot-command-matches-ml-1418215054"></a>
### MSG_FORAWHILE

```ml
const MSG_FORAWHILE = headers.MSG_FORAWHILE
```

Bot chat-message type used to recognize or dispatch forawhile messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L126)

<a id="constant-constant-mq3-game-bot-command-matches-msg-forever-const-msg-forever-headers-msg-forever-src-mq3-game-bot-command-matches-ml-478207950"></a>
### MSG_FOREVER

```ml
const MSG_FOREVER = headers.MSG_FOREVER
```

Bot chat-message type used to recognize or dispatch forever messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L122)

<a id="constant-constant-mq3-game-bot-command-matches-msg-formationposition-const-msg-formationposition-headers-msg-formationposition-src-mq3-game-bot-command-matches-ml-658431869"></a>
### MSG_FORMATIONPOSITION

```ml
const MSG_FORMATIONPOSITION = headers.MSG_FORMATIONPOSITION
```

Bot chat-message type used to recognize or dispatch formationposition messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L76)

<a id="constant-constant-mq3-game-bot-command-matches-msg-formationspace-const-msg-formationspace-headers-msg-formationspace-src-mq3-game-bot-command-matches-ml-969560700"></a>
### MSG_FORMATIONSPACE

```ml
const MSG_FORMATIONSPACE = headers.MSG_FORMATIONSPACE
```

Bot chat-message type used to recognize or dispatch formationspace messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L78)

<a id="constant-constant-mq3-game-bot-command-matches-msg-getflag-const-msg-getflag-headers-msg-getflag-src-mq3-game-bot-command-matches-ml-692195451"></a>
### MSG_GETFLAG

```ml
const MSG_GETFLAG = headers.MSG_GETFLAG
```

Bot chat-message type used to recognize or dispatch capture the flag messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L58)

<a id="constant-constant-mq3-game-bot-command-matches-msg-getitem-const-msg-getitem-headers-msg-getitem-src-mq3-game-bot-command-matches-ml-1939754350"></a>
### MSG_GETITEM

```ml
const MSG_GETITEM = headers.MSG_GETITEM
```

Bot chat-message type used to recognize or dispatch getitem messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L92)

<a id="constant-constant-mq3-game-bot-command-matches-msg-harvest-const-msg-harvest-headers-msg-harvest-src-mq3-game-bot-command-matches-ml-1759552964"></a>
### MSG_HARVEST

```ml
const MSG_HARVEST = headers.MSG_HARVEST
```

Bot chat-message type used to recognize or dispatch harvest messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L108)

<a id="constant-constant-mq3-game-bot-command-matches-msg-help-const-msg-help-headers-msg-help-src-mq3-game-bot-command-matches-ml-250956220"></a>
### MSG_HELP

```ml
const MSG_HELP = headers.MSG_HELP
```

Bot chat-message type used to recognize or dispatch help messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L50)

<a id="constant-constant-mq3-game-bot-command-matches-msg-joinsubteam-const-msg-joinsubteam-headers-msg-joinsubteam-src-mq3-game-bot-command-matches-ml-791135654"></a>
### MSG_JOINSUBTEAM

```ml
const MSG_JOINSUBTEAM = headers.MSG_JOINSUBTEAM
```

Bot chat-message type used to recognize or dispatch joinsubteam messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L70)

<a id="constant-constant-mq3-game-bot-command-matches-msg-kill-const-msg-kill-headers-msg-kill-src-mq3-game-bot-command-matches-ml-879989449"></a>
### MSG_KILL

```ml
const MSG_KILL = headers.MSG_KILL
```

Bot chat-message type used to recognize or dispatch kill messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L94)

<a id="constant-constant-mq3-game-bot-command-matches-msg-leadtheway-const-msg-leadtheway-headers-msg-leadtheway-src-mq3-game-bot-command-matches-ml-736662973"></a>
### MSG_LEADTHEWAY

```ml
const MSG_LEADTHEWAY = headers.MSG_LEADTHEWAY
```

Bot chat-message type used to recognize or dispatch leadtheway messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L90)

<a id="constant-constant-mq3-game-bot-command-matches-msg-leavesubteam-const-msg-leavesubteam-headers-msg-leavesubteam-src-mq3-game-bot-command-matches-ml-287331891"></a>
### MSG_LEAVESUBTEAM

```ml
const MSG_LEAVESUBTEAM = headers.MSG_LEAVESUBTEAM
```

Bot chat-message type used to recognize or dispatch leavesubteam messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L72)

<a id="constant-constant-mq3-game-bot-command-matches-msg-me-const-msg-me-headers-msg-me-src-mq3-game-bot-command-matches-ml-1500074399"></a>
### MSG_ME

```ml
const MSG_ME = headers.MSG_ME
```

Bot chat-message type used to recognize or dispatch me messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L112)

<a id="constant-constant-mq3-game-bot-command-matches-msg-minutes-const-msg-minutes-headers-msg-minutes-src-mq3-game-bot-command-matches-ml-1779014400"></a>
### MSG_MINUTES

```ml
const MSG_MINUTES = headers.MSG_MINUTES
```

Bot chat-message type used to recognize or dispatch minutes messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L118)

<a id="constant-constant-mq3-game-bot-command-matches-msg-multiplenames-const-msg-multiplenames-headers-msg-multiplenames-src-mq3-game-bot-command-matches-ml-856772889"></a>
### MSG_MULTIPLENAMES

```ml
const MSG_MULTIPLENAMES = headers.MSG_MULTIPLENAMES
```

Bot chat-message type used to recognize or dispatch multiplenames messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L116)

<a id="constant-constant-mq3-game-bot-command-matches-msg-newleader-const-msg-newleader-headers-msg-newleader-src-mq3-game-bot-command-matches-ml-917632350"></a>
### MSG_NEWLEADER

```ml
const MSG_NEWLEADER = headers.MSG_NEWLEADER
```

Bot chat-message type used to recognize or dispatch newleader messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L46)

<a id="constant-constant-mq3-game-bot-command-matches-msg-patrol-const-msg-patrol-headers-msg-patrol-src-mq3-game-bot-command-matches-ml-1420408983"></a>
### MSG_PATROL

```ml
const MSG_PATROL = headers.MSG_PATROL
```

Bot chat-message type used to recognize or dispatch patrol messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L88)

<a id="constant-constant-mq3-game-bot-command-matches-msg-returnflag-const-msg-returnflag-headers-msg-returnflag-src-mq3-game-bot-command-matches-ml-1815062377"></a>
### MSG_RETURNFLAG

```ml
const MSG_RETURNFLAG = headers.MSG_RETURNFLAG
```

Bot chat-message type used to recognize or dispatch return the flag messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L98)

<a id="constant-constant-mq3-game-bot-command-matches-msg-rushbase-const-msg-rushbase-headers-msg-rushbase-src-mq3-game-bot-command-matches-ml-206262480"></a>
### MSG_RUSHBASE

```ml
const MSG_RUSHBASE = headers.MSG_RUSHBASE
```

Bot chat-message type used to recognize or dispatch rush the base messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L56)

<a id="constant-constant-mq3-game-bot-command-matches-msg-seconds-const-msg-seconds-headers-msg-seconds-src-mq3-game-bot-command-matches-ml-1449711916"></a>
### MSG_SECONDS

```ml
const MSG_SECONDS = headers.MSG_SECONDS
```

Bot chat-message type used to recognize or dispatch seconds messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L120)

<a id="constant-constant-mq3-game-bot-command-matches-msg-startteamleadership-const-msg-startteamleadership-headers-msg-startteamleadership-src-mq3-game-bot-command-matches-ml-2010575115"></a>
### MSG_STARTTEAMLEADERSHIP

```ml
const MSG_STARTTEAMLEADERSHIP = headers.MSG_STARTTEAMLEADERSHIP
```

Bot chat-message type used to recognize or dispatch startteamleadership messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L60)

<a id="constant-constant-mq3-game-bot-command-matches-msg-stopteamleadership-const-msg-stopteamleadership-headers-msg-stopteamleadership-src-mq3-game-bot-command-matches-ml-5389747"></a>
### MSG_STOPTEAMLEADERSHIP

```ml
const MSG_STOPTEAMLEADERSHIP = headers.MSG_STOPTEAMLEADERSHIP
```

Bot chat-message type used to recognize or dispatch stopteamleadership messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L62)

<a id="constant-constant-mq3-game-bot-command-matches-msg-suicide-const-msg-suicide-headers-msg-suicide-src-mq3-game-bot-command-matches-ml-1653908105"></a>
### MSG_SUICIDE

```ml
const MSG_SUICIDE = headers.MSG_SUICIDE
```

Bot chat-message type used to recognize or dispatch suicide messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L110)

<a id="constant-constant-mq3-game-bot-command-matches-msg-taskpreference-const-msg-taskpreference-headers-msg-taskpreference-src-mq3-game-bot-command-matches-ml-1311842389"></a>
### MSG_TASKPREFERENCE

```ml
const MSG_TASKPREFERENCE = headers.MSG_TASKPREFERENCE
```

Bot chat-message type used to recognize or dispatch taskpreference messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L104)

<a id="constant-constant-mq3-game-bot-command-matches-msg-wait-const-msg-wait-headers-msg-wait-src-mq3-game-bot-command-matches-ml-1952996682"></a>
### MSG_WAIT

```ml
const MSG_WAIT = headers.MSG_WAIT
```

Bot chat-message type used to recognize or dispatch wait messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L66)

<a id="constant-constant-mq3-game-bot-command-matches-msg-whatareyoudoing-const-msg-whatareyoudoing-headers-msg-whatareyoudoing-src-mq3-game-bot-command-matches-ml-2101239419"></a>
### MSG_WHATAREYOUDOING

```ml
const MSG_WHATAREYOUDOING = headers.MSG_WHATAREYOUDOING
```

Bot chat-message type used to recognize or dispatch whatareyoudoing messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L68)

<a id="constant-constant-mq3-game-bot-command-matches-msg-whatismycommand-const-msg-whatismycommand-headers-msg-whatismycommand-src-mq3-game-bot-command-matches-ml-720135792"></a>
### MSG_WHATISMYCOMMAND

```ml
const MSG_WHATISMYCOMMAND = headers.MSG_WHATISMYCOMMAND
```

Bot chat-message type used to recognize or dispatch whatismycommand messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L100)

<a id="constant-constant-mq3-game-bot-command-matches-msg-whereareyou-const-msg-whereareyou-headers-msg-whereareyou-src-mq3-game-bot-command-matches-ml-715561039"></a>
### MSG_WHEREAREYOU

```ml
const MSG_WHEREAREYOU = headers.MSG_WHEREAREYOU
```

Bot chat-message type used to recognize or dispatch whereareyou messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L96)

<a id="constant-constant-mq3-game-bot-command-matches-msg-whichteam-const-msg-whichteam-headers-msg-whichteam-src-mq3-game-bot-command-matches-ml-600696517"></a>
### MSG_WHICHTEAM

```ml
const MSG_WHICHTEAM = headers.MSG_WHICHTEAM
```

Bot chat-message type used to recognize or dispatch whichteam messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L102)

<a id="constant-constant-mq3-game-bot-command-matches-msg-whoisteamlaeder-const-msg-whoisteamlaeder-headers-msg-whoisteamlaeder-src-mq3-game-bot-command-matches-ml-492342965"></a>
### MSG_WHOISTEAMLAEDER

```ml
const MSG_WHOISTEAMLAEDER = headers.MSG_WHOISTEAMLAEDER
```

Bot chat-message type used to recognize or dispatch whoisteamlaeder messages.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L64)

<a id="constant-constant-mq3-game-bot-command-matches-mtcontext-addressee-const-mtcontext-addressee-headers-mtcontext-addressee-src-mq3-game-bot-command-matches-ml-1270564890"></a>
### MTCONTEXT_ADDRESSEE

```ml
const MTCONTEXT_ADDRESSEE = headers.MTCONTEXT_ADDRESSEE
```

Bot message-matching context bit enabling addressee patterns.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L38)

<a id="constant-constant-mq3-game-bot-command-matches-mtcontext-ctf-const-mtcontext-ctf-headers-mtcontext-ctf-src-mq3-game-bot-command-matches-ml-180526671"></a>
### MTCONTEXT_CTF

```ml
const MTCONTEXT_CTF = headers.MTCONTEXT_CTF
```

Bot message-matching context bit enabling capture the flag patterns.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L44)

<a id="constant-constant-mq3-game-bot-command-matches-mtcontext-initialteamchat-const-mtcontext-initialteamchat-headers-mtcontext-initialteamchat-src-mq3-game-bot-command-matches-ml-1683951919"></a>
### MTCONTEXT_INITIALTEAMCHAT

```ml
const MTCONTEXT_INITIALTEAMCHAT = headers.MTCONTEXT_INITIALTEAMCHAT
```

Bot message-matching context bit enabling initialteamchat patterns.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L32)

<a id="constant-constant-mq3-game-bot-command-matches-mtcontext-misc-const-mtcontext-misc-headers-mtcontext-misc-src-mq3-game-bot-command-matches-ml-736111172"></a>
### MTCONTEXT_MISC

```ml
const MTCONTEXT_MISC = headers.MTCONTEXT_MISC
```

Bot message-matching context bit enabling misc patterns.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L30)

<a id="constant-constant-mq3-game-bot-command-matches-mtcontext-patrolkeyarea-const-mtcontext-patrolkeyarea-headers-mtcontext-patrolkeyarea-src-mq3-game-bot-command-matches-ml-1214773572"></a>
### MTCONTEXT_PATROLKEYAREA

```ml
const MTCONTEXT_PATROLKEYAREA = headers.MTCONTEXT_PATROLKEYAREA
```

Bot message-matching context bit enabling patrolkeyarea patterns.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L40)

<a id="constant-constant-mq3-game-bot-command-matches-mtcontext-replychat-const-mtcontext-replychat-headers-mtcontext-replychat-src-mq3-game-bot-command-matches-ml-1986708654"></a>
### MTCONTEXT_REPLYCHAT

```ml
const MTCONTEXT_REPLYCHAT = headers.MTCONTEXT_REPLYCHAT
```

Bot message-matching context bit enabling replychat patterns.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L42)

<a id="constant-constant-mq3-game-bot-command-matches-mtcontext-teammate-const-mtcontext-teammate-headers-mtcontext-teammate-src-mq3-game-bot-command-matches-ml-1965270920"></a>
### MTCONTEXT_TEAMMATE

```ml
const MTCONTEXT_TEAMMATE = headers.MTCONTEXT_TEAMMATE
```

Bot message-matching context bit enabling teammate patterns.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L36)

<a id="constant-constant-mq3-game-bot-command-matches-mtcontext-time-const-mtcontext-time-headers-mtcontext-time-src-mq3-game-bot-command-matches-ml-2130894543"></a>
### MTCONTEXT_TIME

```ml
const MTCONTEXT_TIME = headers.MTCONTEXT_TIME
```

Bot message-matching context bit enabling time patterns.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L34)

<a id="constant-constant-mq3-game-bot-command-matches-name-const-name-headers-name-src-mq3-game-bot-command-matches-ml-268278786"></a>
### NAME

```ml
const NAME = headers.NAME
```

Chat-match variable slot containing a named subject.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L190)

<a id="constant-constant-mq3-game-bot-command-matches-netname-const-netname-headers-netname-src-mq3-game-bot-command-matches-ml-1663858939"></a>
### NETNAME

```ml
const NETNAME = headers.NETNAME
```

Chat-match variable slot containing a player network name.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L168)

<a id="constant-constant-mq3-game-bot-command-matches-number-const-number-headers-number-src-mq3-game-bot-command-matches-ml-552991784"></a>
### NUMBER

```ml
const NUMBER = headers.NUMBER
```

Chat-match variable slot containing a numeric argument.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L186)

<a id="function-function-mq3-game-bot-command-matches-numplayersonsameteam-function-numplayersonsameteam-state-bot-src-mq3-game-bot-command-matches-ml-34214092"></a>
### NumPlayersOnSameTeam

```ml
function NumPlayersOnSameTeam(state, bot)
```

NumPlayersOnSameTeam (the i+1 test preserves the original game's indexing behavior).

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `maxclients` and `configs`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `team`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L526)

<a id="function-function-mq3-game-bot-command-matches-objectiveready-function-objectiveready-state-kind-src-mq3-game-bot-command-matches-ml-267551265"></a>
### objectiveReady

```ml
function objectiveReady(state, kind)
```

Require valid AAS areas for the flag or obelisk objectives used by the requested team task.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `redFlag`, `blueFlag`, `neutralObelisk`, `redObelisk` and `blueObelisk`. |
| `kind` | `dynamic` | — | Value used by `objectiveReady` in `if kind==LTG_GETFLAG then return state.redFlag.areanum!=0 and state.blueFlag.areanum!=0 end if`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L645)

<a id="function-function-mq3-game-bot-command-matches-order-function-order-state-bot-client-ltg-duration-suppressed-src-mq3-game-bot-command-matches-ml-204838244"></a>
### order

```ml
function order(state, bot, client, ltg, duration, suppressed)
```

Record or dispatch `"team-status"` actions in `order`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `now` and `randomValue`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `decisionmaker`, `ordered`, `orderTime`, `teammessageTime` and `ltgtype` and related fields. May update `bot.decisionmaker`, `bot.ordered` and `bot.orderTime` and additional fields in place. |
| `client` | `dynamic` | — | Value used by `order` in `bot.decisionmaker=client`. |
| `ltg` | `dynamic` | — | Initial value stored in `mq3.game.bot_command_matches.HostAction.value`. |
| `duration` | `dynamic` | — | Value used by `order` in `bot.teamgoalTime=state.now+duration`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L540)

<a id="constant-constant-mq3-game-bot-command-matches-patrol-loop-const-patrol-loop-1-src-mq3-game-bot-command-matches-ml-1333247356"></a>
### PATROL_LOOP

```ml
const PATROL_LOOP = 1
```

Patrol behavior flag enabling loop.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L224)

<a id="constant-constant-mq3-game-bot-command-matches-patrol-reverse-const-patrol-reverse-2-src-mq3-game-bot-command-matches-ml-1842711153"></a>
### PATROL_REVERSE

```ml
const PATROL_REVERSE = 2
```

Patrol behavior flag enabling reverse.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L226)

<a id="function-function-mq3-game-bot-command-matches-pointgoal-function-pointgoal-state-client-src-mq3-game-bot-command-matches-ml-1099353608"></a>
### pointGoal

```ml
function pointGoal(state, client)
```

Apply `mq3.game.bot_command_matches.goal` and `mq3.game.bot_command_matches.clientName` while evaluating `pointGoal`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `entityInfos` and `pointAreas`. |
| `client` | `dynamic` | — | Initial value stored in `mq3.game.bot_command_matches.Goal.entitynum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L532)

<a id="constant-constant-mq3-game-bot-command-matches-position-const-position-headers-position-src-mq3-game-bot-command-matches-ml-725688134"></a>
### POSITION

```ml
const POSITION = headers.POSITION
```

Chat-match variable slot containing a position reference.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L184)

<a id="function-function-mq3-game-bot-command-matches-remember-function-remember-state-bot-suppressed-src-mq3-game-bot-command-matches-ml-1528779294"></a>
### remember

```ml
function remember(state, bot, suppressed)
```

Record or dispatch `"remember-task"` actions in `remember`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `actions` and `hostActionFn`. May update `state.actions` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client` and `ltgtype`. |
| `suppressed` | `dynamic` | — | Whether host delivery of the recorded action is suppressed. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L547)

<a id="function-function-mq3-game-bot-command-matches-sameteam-function-sameteam-state-bot-client-src-mq3-game-bot-command-matches-ml-1053165281"></a>
### sameTeam

```ml
function sameTeam(state, bot, client)
```

Test `client>=0 and client<len(state.teams) and state.teams[client]==bot.team` as the condition for `sameTeam`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot command matches state; accesses `teams`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `team`. |
| `client` | `dynamic` | — | Operand used to evaluate the returned expression `client>=0 and client<len(state.teams) and state.teams[client]==bot.team`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L479)

<a id="constant-constant-mq3-game-bot-command-matches-st-1fctfgotflag-const-st-1fctfgotflag-headers-st-1fctfgotflag-src-mq3-game-bot-command-matches-ml-2062289989"></a>
### ST_1FCTFGOTFLAG

```ml
const ST_1FCTFGOTFLAG = headers.ST_1FCTFGOTFLAG
```

Bot chat-match subtype flag used to refine 1 fctfgotflag instructions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L160)

<a id="constant-constant-mq3-game-bot-command-matches-st-addressed-const-st-addressed-headers-st-addressed-src-mq3-game-bot-command-matches-ml-37758316"></a>
### ST_ADDRESSED

```ml
const ST_ADDRESSED = headers.ST_ADDRESSED
```

Bot chat-match subtype flag used to refine addressed instructions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L134)

<a id="constant-constant-mq3-game-bot-command-matches-st-attacker-const-st-attacker-headers-st-attacker-src-mq3-game-bot-command-matches-ml-1711497160"></a>
### ST_ATTACKER

```ml
const ST_ATTACKER = headers.ST_ATTACKER
```

Bot chat-match subtype flag used to refine attacker instructions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L164)

<a id="constant-constant-mq3-game-bot-command-matches-st-back-const-st-back-headers-st-back-src-mq3-game-bot-command-matches-ml-796599804"></a>
### ST_BACK

```ml
const ST_BACK = headers.ST_BACK
```

Bot chat-match subtype flag used to refine back instructions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L148)

<a id="constant-constant-mq3-game-bot-command-matches-st-capturedflag-const-st-capturedflag-headers-st-capturedflag-src-mq3-game-bot-command-matches-ml-89712487"></a>
### ST_CAPTUREDFLAG

```ml
const ST_CAPTUREDFLAG = headers.ST_CAPTUREDFLAG
```

Bot chat-match subtype flag used to refine capturedflag instructions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L156)

<a id="constant-constant-mq3-game-bot-command-matches-st-defender-const-st-defender-headers-st-defender-src-mq3-game-bot-command-matches-ml-1428363356"></a>
### ST_DEFENDER

```ml
const ST_DEFENDER = headers.ST_DEFENDER
```

Bot chat-match subtype flag used to refine defender instructions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L162)

<a id="constant-constant-mq3-game-bot-command-matches-st-feet-const-st-feet-headers-st-feet-src-mq3-game-bot-command-matches-ml-1275815347"></a>
### ST_FEET

```ml
const ST_FEET = headers.ST_FEET
```

Bot chat-match subtype flag used to refine feet instructions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L136)

<a id="constant-constant-mq3-game-bot-command-matches-st-gotflag-const-st-gotflag-headers-st-gotflag-src-mq3-game-bot-command-matches-ml-1234170203"></a>
### ST_GOTFLAG

```ml
const ST_GOTFLAG = headers.ST_GOTFLAG
```

Bot chat-match subtype flag used to refine gotflag instructions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L154)

<a id="constant-constant-mq3-game-bot-command-matches-st-here-const-st-here-headers-st-here-src-mq3-game-bot-command-matches-ml-2000189837"></a>
### ST_HERE

```ml
const ST_HERE = headers.ST_HERE
```

Bot chat-match subtype flag used to refine here instructions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L140)

<a id="constant-constant-mq3-game-bot-command-matches-st-i-const-st-i-headers-st-i-src-mq3-game-bot-command-matches-ml-1013444614"></a>
### ST_I

```ml
const ST_I = headers.ST_I
```

Bot chat-match subtype flag used to refine i instructions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L144)

<a id="constant-constant-mq3-game-bot-command-matches-st-more-const-st-more-headers-st-more-src-mq3-game-bot-command-matches-ml-133816374"></a>
### ST_MORE

```ml
const ST_MORE = headers.ST_MORE
```

Bot chat-match subtype flag used to refine more instructions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L146)

<a id="constant-constant-mq3-game-bot-command-matches-st-nearitem-const-st-nearitem-headers-st-nearitem-src-mq3-game-bot-command-matches-ml-83666742"></a>
### ST_NEARITEM

```ml
const ST_NEARITEM = headers.ST_NEARITEM
```

Bot chat-match subtype flag used to refine nearitem instructions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L132)

<a id="constant-constant-mq3-game-bot-command-matches-st-returnedflag-const-st-returnedflag-headers-st-returnedflag-src-mq3-game-bot-command-matches-ml-1624524586"></a>
### ST_RETURNEDFLAG

```ml
const ST_RETURNEDFLAG = headers.ST_RETURNEDFLAG
```

Bot chat-match subtype flag used to refine returnedflag instructions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L158)

<a id="constant-constant-mq3-game-bot-command-matches-st-reverse-const-st-reverse-headers-st-reverse-src-mq3-game-bot-command-matches-ml-359249537"></a>
### ST_REVERSE

```ml
const ST_REVERSE = headers.ST_REVERSE
```

Bot chat-match subtype flag used to refine reverse instructions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L150)

<a id="constant-constant-mq3-game-bot-command-matches-st-roamer-const-st-roamer-headers-st-roamer-src-mq3-game-bot-command-matches-ml-1409002537"></a>
### ST_ROAMER

```ml
const ST_ROAMER = headers.ST_ROAMER
```

Bot chat-match subtype flag used to refine roamer instructions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L166)

<a id="constant-constant-mq3-game-bot-command-matches-st-someone-const-st-someone-headers-st-someone-src-mq3-game-bot-command-matches-ml-1537929823"></a>
### ST_SOMEONE

```ml
const ST_SOMEONE = headers.ST_SOMEONE
```

Bot chat-match subtype flag used to refine someone instructions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L152)

<a id="constant-constant-mq3-game-bot-command-matches-st-there-const-st-there-headers-st-there-src-mq3-game-bot-command-matches-ml-1829954413"></a>
### ST_THERE

```ml
const ST_THERE = headers.ST_THERE
```

Bot chat-match subtype flag used to refine there instructions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L142)

<a id="constant-constant-mq3-game-bot-command-matches-st-time-const-st-time-headers-st-time-src-mq3-game-bot-command-matches-ml-1168177842"></a>
### ST_TIME

```ml
const ST_TIME = headers.ST_TIME
```

Bot chat-match subtype flag used to refine time instructions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L138)

- [mq3.game.bot_command_matches.State](Type-mq3-game-bot-command-matches-state-1868437196.md) — struct
<a id="constant-constant-mq3-game-bot-command-matches-team-blue-const-team-blue-2-src-mq3-game-bot-command-matches-ml-1820795269"></a>
### TEAM_BLUE

```ml
const TEAM_BLUE = 2
```

Team identifier selecting the blue team/category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L16)

<a id="constant-constant-mq3-game-bot-command-matches-team-red-const-team-red-1-src-mq3-game-bot-command-matches-ml-998958896"></a>
### TEAM_RED

```ml
const TEAM_RED = 1
```

Team identifier selecting the red team/category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L14)

<a id="constant-constant-mq3-game-bot-command-matches-teammate-const-teammate-headers-teammate-src-mq3-game-bot-command-matches-ml-1815357911"></a>
### TEAMMATE

```ml
const TEAMMATE = headers.TEAMMATE
```

Chat-match variable slot containing the selected teammate.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L176)

<a id="constant-constant-mq3-game-bot-command-matches-teamname-const-teamname-headers-teamname-src-mq3-game-bot-command-matches-ml-1215864037"></a>
### TEAMNAME

```ml
const TEAMNAME = headers.TEAMNAME
```

Chat-match variable slot containing a team name.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L178)

<a id="constant-constant-mq3-game-bot-command-matches-teamtp-attacker-const-teamtp-attacker-2-src-mq3-game-bot-command-matches-ml-173520145"></a>
### TEAMTP_ATTACKER

```ml
const TEAMTP_ATTACKER = 2
```

Bot team-task preference bit indicating a preference for attacker.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L222)

<a id="constant-constant-mq3-game-bot-command-matches-teamtp-defender-const-teamtp-defender-1-src-mq3-game-bot-command-matches-ml-29534612"></a>
### TEAMTP_DEFENDER

```ml
const TEAMTP_DEFENDER = 1
```

Bot team-task preference bit indicating a preference for defender.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L220)

<a id="constant-constant-mq3-game-bot-command-matches-time-const-time-headers-time-src-mq3-game-bot-command-matches-ml-739754288"></a>
### TIME

```ml
const TIME = headers.TIME
```

Chat-match variable slot containing a duration or time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L188)

<a id="function-function-mq3-game-bot-command-matches-variable-function-variable-match-index-src-mq3-game-bot-command-matches-ml-1275892323"></a>
### variable

```ml
function variable(match, index)
```

Forward `variable` to `mq3.botlib.ai_chat_matches.matchVariable` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `match` | `dynamic` | — | Parsed match record; accesses `offsets`, `lengths` and `string`. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_command_matches.ml#L458)

- [mq3.game.bot_command_matches.Waypoint](Type-mq3-game-bot-command-matches-waypoint-1309084116.md) — struct
