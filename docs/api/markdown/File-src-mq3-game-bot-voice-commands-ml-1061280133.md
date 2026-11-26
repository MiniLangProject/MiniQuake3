# `src/mq3/game/bot_voice_commands.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.bot_voice_commands`](Package-mq3-game-bot-voice-commands-761635497.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/textnumbers.ml` as `textnum` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../../a7594a0c0299/MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="constant-constant-mq3-game-bot-voice-commands-action-affirmative-const-action-affirmative-1048576-src-mq3-game-bot-voice-commands-ml-1772098158"></a>
### ACTION_AFFIRMATIVE

```ml
const ACTION_AFFIRMATIVE = 1048576
```

Bot input-action bit requesting affirmative.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L50)

- [mq3.game.bot_voice_commands.Bot](Type-mq3-game-bot-voice-commands-bot-657116126.md) — struct
<a id="function-function-mq3-game-bot-voice-commands-camp-function-camp-state-bot-client-mode-retailactive-src-mq3-game-bot-voice-commands-ml-424160925"></a>
### camp

```ml
function camp(state, bot, client, mode, retailActive)
```

BotVoiceChat_Camp

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot voice commands state; accesses `entityInfos` and `pointAreas`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `teammate` and `arriveTime`. May update `bot.teammate` and `bot.arriveTime` in place. |
| `client` | `dynamic` | — | Initial value stored in `mq3.game.bot_voice_commands.Goal.entitynum`. |
| `mode` | `dynamic` | — | Not read by this implementation; retained in the `camp` signature. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L370)

<a id="constant-constant-mq3-game-bot-voice-commands-chat-team-const-chat-team-1-src-mq3-game-bot-voice-commands-ml-1144863748"></a>
### CHAT_TEAM

```ml
const CHAT_TEAM = 1
```

Chat-state value or flag selecting team.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L16)

<a id="constant-constant-mq3-game-bot-voice-commands-chat-tell-const-chat-tell-2-src-mq3-game-bot-voice-commands-ml-762584163"></a>
### CHAT_TELL

```ml
const CHAT_TELL = 2
```

Chat-state value or flag selecting tell.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L18)

<a id="function-function-mq3-game-bot-voice-commands-copygoal-function-copygoal-value-src-mq3-game-bot-voice-commands-ml-692633997"></a>
### copyGoal

```ml
function copyGoal(value)
```

Forward `copyGoal` to `mq3.game.bot_voice_commands.goal` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — | Value record; accesses `entitynum`, `areanum`, `origin`, `mins` and `maxs` and related fields. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L208)

<a id="function-function-mq3-game-bot-voice-commands-create-function-create-src-mq3-game-bot-voice-commands-ml-235640278"></a>
### create

```ml
function create()
```

Build the `mq3.game.bot_voice_commands.State` result for `create`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L215)

<a id="function-function-mq3-game-bot-voice-commands-createbot-function-createbot-client-src-mq3-game-bot-voice-commands-ml-248001159"></a>
### createBot

```ml
function createBot(client)
```

Create a `mq3.game.bot_voice_commands.Bot` record, initializing `client` from `client`, `cs` from `client` and `team` as `TEAM_RED`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — | Initial value stored in `mq3.game.bot_voice_commands.Bot.client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L211)

<a id="constant-constant-mq3-game-bot-voice-commands-ctf-getflag-time-const-ctf-getflag-time-600-src-mq3-game-bot-voice-commands-ml-1960201233"></a>
### CTF_GETFLAG_TIME

```ml
const CTF_GETFLAG_TIME = 600
```

Capture-the-flag scoring or timing parameter for capture the flag time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L62)

<a id="constant-constant-mq3-game-bot-voice-commands-ctf-returnflag-time-const-ctf-returnflag-time-180-src-mq3-game-bot-voice-commands-ml-189433364"></a>
### CTF_RETURNFLAG_TIME

```ml
const CTF_RETURNFLAG_TIME = 180
```

Capture-the-flag scoring or timing parameter for return the flag time.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L64)

<a id="function-function-mq3-game-bot-voice-commands-defend-function-defend-state-bot-client-mode-retailactive-src-mq3-game-bot-voice-commands-ml-106234109"></a>
### defend

```ml
function defend(state, bot, client, mode, retailActive)
```

BotVoiceChat_Defend and BotVoiceChat_DefendFlag

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot voice commands state; accesses `missionpack`, `gametype`, `redObelisk`, `blueObelisk` and `redFlag` and related fields. |
| `bot` | `dynamic` | — | Bot AI state; accesses `team`, `teamgoal` and `defendawayTime`. May update `bot.teamgoal` and `bot.defendawayTime` in place. |
| `client` | `dynamic` | — | Value used by `orderedTiming` in `bot.decisionmaker=client`. |
| `mode` | `dynamic` | — | Not read by this implementation; retained in the `defend` signature. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L319)

<a id="function-function-mq3-game-bot-voice-commands-defendflag-function-defendflag-state-bot-client-mode-retailactive-src-mq3-game-bot-voice-commands-ml-815274073"></a>
### defendFlag

```ml
function defendFlag(state, bot, client, mode, retailActive)
```

Forward `defendFlag` to `mq3.game.bot_voice_commands.defend` and return the delegated result.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot voice commands state; accesses `missionpack`, `gametype`, `redObelisk`, `blueObelisk` and `redFlag` and related fields. |
| `bot` | `dynamic` | — | Bot AI state; accesses `team`, `teamgoal` and `defendawayTime`. May update `bot.teamgoal` and `bot.defendawayTime` in place. |
| `client` | `dynamic` | — | Value used by `orderedTiming` in `bot.decisionmaker=client`. |
| `mode` | `dynamic` | — | Value passed as argument 4 to `mq3.game.bot_voice_commands.defend`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L335)

<a id="function-function-mq3-game-bot-voice-commands-dummy-function-dummy-state-bot-client-mode-retailactive-src-mq3-game-bot-voice-commands-ml-1268479689"></a>
### dummy

```ml
function dummy(state, bot, client, mode, retailActive)
```

BotVoiceChat_Dummy

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Not read by this implementation; retained in the `dummy` signature. |
| `bot` | `dynamic` | — | Not read by this implementation; retained in the `dummy` signature. |
| `client` | `dynamic` | — | Not read by this implementation; retained in the `dummy` signature. |
| `mode` | `dynamic` | — | Not read by this implementation; retained in the `dummy` signature. |
| `retailActive` | `dynamic` | — | Not read by this implementation; retained in the `dummy` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L461)

<a id="function-function-mq3-game-bot-voice-commands-easyname-function-easyname-state-client-src-mq3-game-bot-voice-commands-ml-952925050"></a>
### easyName

```ml
function easyName(state, client)
```

Prefer the simplified voice-command player name and fall back to the normal name for the client slot.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot voice commands state; accesses `easyNames` and `names`. |
| `client` | `dynamic` | — | Operand used to evaluate the returned expression `state.easyNames[client]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L362)

<a id="function-function-mq3-game-bot-voice-commands-emit-function-emit-state-kind-client-channel-text-value-retailactive-src-mq3-game-bot-voice-commands-ml-1405194812"></a>
### emit

```ml
function emit(state, kind, client, channel, text, value, retailActive)
```

Set `state.actions` to `state.actions+[action]` in `mq3.game.bot_voice_commands.emit`. Return paths include `action`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot voice commands state; accesses `actions` and `hostActionFn`. May update `state.actions` in place. |
| `kind` | `dynamic` | — | Initial value stored in `mq3.game.bot_voice_commands.HostAction.kind`. |
| `client` | `dynamic` | — | Initial value stored in `mq3.game.bot_voice_commands.HostAction.client`. |
| `channel` | `dynamic` | — | Channel identifier for the requested action. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |
| `value` | `dynamic` | — | Initial value stored in `mq3.game.bot_voice_commands.HostAction.value`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L235)

<a id="function-function-mq3-game-bot-voice-commands-emptygoal-function-emptygoal-src-mq3-game-bot-voice-commands-ml-22570122"></a>
### emptyGoal

```ml
function emptyGoal()
```

Forward `emptyGoal` to `mq3.game.bot_voice_commands.goal` and return the delegated result.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L205)

<a id="function-function-mq3-game-bot-voice-commands-enterchat-function-enterchat-state-bot-client-channel-retailactive-src-mq3-game-bot-voice-commands-ml-1626851497"></a>
### enterChat

```ml
function enterChat(state, bot, client, channel, retailActive)
```

Record or dispatch `"enter-chat"` actions in `enterChat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot voice commands state; accesses `actions` and `hostActionFn`. May update `state.actions` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `cs`. |
| `client` | `dynamic` | — | Initial value stored in `mq3.game.bot_voice_commands.HostAction.client`. |
| `channel` | `dynamic` | — | Channel identifier for the requested action. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L263)

- [mq3.game.bot_voice_commands.EntityInfo](Type-mq3-game-bot-voice-commands-entityinfo-451566370.md) — struct
<a id="function-function-mq3-game-bot-voice-commands-floattime-function-floattime-state-src-mq3-game-bot-voice-commands-ml-563159315"></a>
### floatTime

```ml
function floatTime(state)
```

Set `state.timeIndex` to `state.timeIndex+1` in `mq3.game.bot_voice_commands.floatTime`. Return paths include `state.now`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot voice commands state; accesses `timeIndex`, `timeValues` and `now`. May update `state.timeIndex` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L223)

<a id="function-function-mq3-game-bot-voice-commands-followflagcarrier-function-followflagcarrier-state-bot-client-mode-retailactive-src-mq3-game-bot-voice-commands-ml-1271151539"></a>
### followFlagCarrier

```ml
function followFlagCarrier(state, bot, client, mode, retailActive)
```

Apply `mq3.game.bot_voice_commands.followMe` while evaluating `followFlagCarrier`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot voice commands state; accesses `flagCarrier`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `decisionmaker`, `ordered`, `orderTime`, `teammate` and `teammatevisibleTime` and related fields. May update `bot.decisionmaker`, `bot.ordered` and `bot.orderTime` and additional fields in place. |
| `client` | `dynamic` | — | Not read by this implementation; retained in the `followFlagCarrier` signature. |
| `mode` | `dynamic` | — | Value passed as argument 4 to `mq3.game.bot_voice_commands.followMe`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L394)

<a id="function-function-mq3-game-bot-voice-commands-followme-function-followme-state-bot-client-mode-retailactive-src-mq3-game-bot-voice-commands-ml-759568293"></a>
### followMe

```ml
function followMe(state, bot, client, mode, retailActive)
```

BotVoiceChat_FollowMe and BotVoiceChat_FollowFlagCarrier

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot voice commands state; accesses `randomValue`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `decisionmaker`, `ordered`, `orderTime`, `teammate` and `teammatevisibleTime` and related fields. May update `bot.decisionmaker`, `bot.ordered` and `bot.orderTime` and additional fields in place. |
| `client` | `dynamic` | — | Initial value stored in `mq3.game.bot_voice_commands.Goal.entitynum`. |
| `mode` | `dynamic` | — | Not read by this implementation; retained in the `followMe` signature. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L382)

<a id="function-function-mq3-game-bot-voice-commands-getflag-function-getflag-state-bot-client-mode-retailactive-src-mq3-game-bot-voice-commands-ml-543732957"></a>
### getFlag

```ml
function getFlag(state, bot, client, mode, retailActive)
```

BotVoiceChat_GetFlag

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot voice commands state; accesses `gametype`, `redFlag`, `blueFlag`, `missionpack` and `neutralFlag`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `team` and `client`. |
| `client` | `dynamic` | — | Value used by `orderedTiming` in `bot.decisionmaker=client`. |
| `mode` | `dynamic` | — | Not read by this implementation; retained in the `getFlag` signature. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L289)

<a id="function-function-mq3-game-bot-voice-commands-goal-function-goal-entitynum-areanum-origin-mins-maxs-tag-src-mq3-game-bot-voice-commands-ml-1245002892"></a>
### goal

```ml
function goal(entitynum, areanum, origin, mins, maxs, tag)
```

Create a `mq3.game.bot_voice_commands.Goal` record, initializing `entitynum` from `entitynum`, `areanum` from `areanum` and `origin` from `origin`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entitynum` | `dynamic` | — | Initial value stored in `mq3.game.bot_voice_commands.Goal.entitynum`. |
| `areanum` | `dynamic` | — | AAS area number; zero denotes no area. |
| `origin` | `dynamic` | — | World-space position as three coordinates. |
| `mins` | `dynamic` | — | Minimum coordinates of the axis-aligned bounds. |
| `maxs` | `dynamic` | — | Maximum coordinates of the axis-aligned bounds. |
| `tag` | `dynamic` | — | Initial value stored in `mq3.game.bot_voice_commands.Goal.tag`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L203)

- [mq3.game.bot_voice_commands.Goal](Type-mq3-game-bot-voice-commands-goal-597117782.md) — struct
<a id="constant-constant-mq3-game-bot-voice-commands-gt-1fctf-const-gt-1fctf-5-src-mq3-game-bot-voice-commands-ml-2069129334"></a>
### GT_1FCTF

```ml
const GT_1FCTF = 5
```

Game-mode identifier selecting 1 fctf rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L26)

<a id="constant-constant-mq3-game-bot-voice-commands-gt-ctf-const-gt-ctf-4-src-mq3-game-bot-voice-commands-ml-1880627505"></a>
### GT_CTF

```ml
const GT_CTF = 4
```

Game-mode identifier selecting capture the flag rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L24)

<a id="constant-constant-mq3-game-bot-voice-commands-gt-harvester-const-gt-harvester-7-src-mq3-game-bot-voice-commands-ml-386545428"></a>
### GT_HARVESTER

```ml
const GT_HARVESTER = 7
```

Game-mode identifier selecting harvester rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L30)

<a id="constant-constant-mq3-game-bot-voice-commands-gt-obelisk-const-gt-obelisk-6-src-mq3-game-bot-voice-commands-ml-1629625991"></a>
### GT_OBELISK

```ml
const GT_OBELISK = 6
```

Game-mode identifier selecting obelisk rules.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L28)

- [mq3.game.bot_voice_commands.HostAction](Type-mq3-game-bot-voice-commands-hostaction-538309141.md) — struct
<a id="function-function-mq3-game-bot-voice-commands-initialchat-function-initialchat-state-bot-chat-arg-retailactive-src-mq3-game-bot-voice-commands-ml-934170665"></a>
### initialChat

```ml
function initialChat(state, bot, chat, arg, retailActive)
```

Record or dispatch `"initial-chat"` actions in `initialChat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot voice commands state; accesses `actions` and `hostActionFn`. May update `state.actions` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `chat` | `dynamic` | — | Text to parse, format or deliver. |
| `arg` | `dynamic` | — | Initial value stored in `mq3.game.bot_voice_commands.HostAction.value`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L256)

<a id="constant-constant-mq3-game-bot-voice-commands-ltg-attackenemybase-const-ltg-attackenemybase-13-src-mq3-game-bot-voice-commands-ml-1359679239"></a>
### LTG_ATTACKENEMYBASE

```ml
const LTG_ATTACKENEMYBASE = 13
```

Long-term bot goal identifier selecting attackenemybase behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L44)

<a id="constant-constant-mq3-game-bot-voice-commands-ltg-camporder-const-ltg-camporder-8-src-mq3-game-bot-voice-commands-ml-1264563405"></a>
### LTG_CAMPORDER

```ml
const LTG_CAMPORDER = 8
```

Long-term bot goal identifier selecting follow a camp order behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L40)

<a id="constant-constant-mq3-game-bot-voice-commands-ltg-defendkeyarea-const-ltg-defendkeyarea-3-src-mq3-game-bot-voice-commands-ml-361841134"></a>
### LTG_DEFENDKEYAREA

```ml
const LTG_DEFENDKEYAREA = 3
```

Long-term bot goal identifier selecting defend a key area behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L34)

<a id="constant-constant-mq3-game-bot-voice-commands-ltg-getflag-const-ltg-getflag-4-src-mq3-game-bot-voice-commands-ml-1192454053"></a>
### LTG_GETFLAG

```ml
const LTG_GETFLAG = 4
```

Long-term bot goal identifier selecting capture the flag behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L36)

<a id="constant-constant-mq3-game-bot-voice-commands-ltg-harvest-const-ltg-harvest-12-src-mq3-game-bot-voice-commands-ml-541014806"></a>
### LTG_HARVEST

```ml
const LTG_HARVEST = 12
```

Long-term bot goal identifier selecting harvest behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L42)

<a id="constant-constant-mq3-game-bot-voice-commands-ltg-returnflag-const-ltg-returnflag-6-src-mq3-game-bot-voice-commands-ml-829316073"></a>
### LTG_RETURNFLAG

```ml
const LTG_RETURNFLAG = 6
```

Long-term bot goal identifier selecting return the flag behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L38)

<a id="constant-constant-mq3-game-bot-voice-commands-ltg-teamaccompany-const-ltg-teamaccompany-2-src-mq3-game-bot-voice-commands-ml-831484095"></a>
### LTG_TEAMACCOMPANY

```ml
const LTG_TEAMACCOMPANY = 2
```

Long-term bot goal identifier selecting teamaccompany behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L32)

<a id="constant-constant-mq3-game-bot-voice-commands-max-clients-const-max-clients-64-src-mq3-game-bot-voice-commands-ml-283780325"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```

Maximum number of client slots represented by the original game protocol.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L10)

<a id="constant-constant-mq3-game-bot-voice-commands-max-message-size-const-max-message-size-256-src-mq3-game-bot-voice-commands-ml-1576521648"></a>
### MAX_MESSAGE_SIZE

```ml
const MAX_MESSAGE_SIZE = 256
```

Upper bound on message size represented by mq3.game.bot_voice_commands.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L12)

<a id="function-function-mq3-game-bot-voice-commands-offense-function-offense-state-bot-client-mode-retailactive-src-mq3-game-bot-voice-commands-ml-86890053"></a>
### offense

```ml
function offense(state, bot, client, mode, retailActive)
```

BotVoiceChat_Offense

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot voice commands state; accesses `gametype` and `missionpack`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `harvestawayTime` and `attackawayTime`. May update `bot.harvestawayTime` and `bot.attackawayTime` in place. |
| `client` | `dynamic` | — | Value used by `orderedTiming` in `bot.decisionmaker=client`. |
| `mode` | `dynamic` | — | Value passed as argument 4 to `mq3.game.bot_voice_commands.getFlag`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L306)

<a id="function-function-mq3-game-bot-voice-commands-orderedtiming-function-orderedtiming-state-bot-client-ltg-duration-src-mq3-game-bot-voice-commands-ml-1892417132"></a>
### orderedTiming

```ml
function orderedTiming(state, bot, client, ltg, duration)
```

Update `bot.decisionmaker`, `bot.ordered`, `bot.orderTime` and `bot.teammessageTime` and related state during `orderedTiming`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot voice commands state; accesses `randomValue`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `decisionmaker`, `ordered`, `orderTime`, `teammessageTime` and `ltgtype` and related fields. May update `bot.decisionmaker`, `bot.ordered` and `bot.orderTime` and additional fields in place. |
| `client` | `dynamic` | — | Value used by `orderedTiming` in `bot.decisionmaker=client`. |
| `ltg` | `dynamic` | — | Value used by `orderedTiming` in `bot.ltgtype=ltg`. |
| `duration` | `dynamic` | — | Value used by `orderedTiming` in `bot.teamgoalTime=floatTime(state)+duration`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L277)

<a id="function-function-mq3-game-bot-voice-commands-patrol-function-patrol-state-bot-client-mode-retailactive-src-mq3-game-bot-voice-commands-ml-660792649"></a>
### patrol

```ml
function patrol(state, bot, client, mode, retailActive)
```

BotVoiceChat_Patrol

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot voice commands state; accesses `actions` and `hostActionFn`. May update `state.actions` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `decisionmaker`, `ltgtype`, `leadTime` and `lastgoalLtgtype`. May update `bot.decisionmaker`, `bot.ltgtype` and `bot.leadTime` and additional fields in place. |
| `client` | `dynamic` | — | Initial value stored in `mq3.game.bot_voice_commands.HostAction.client`. |
| `mode` | `dynamic` | — | Not read by this implementation; retained in the `patrol` signature. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L343)

<a id="function-function-mq3-game-bot-voice-commands-remember-function-remember-state-bot-retailactive-src-mq3-game-bot-voice-commands-ml-161386941"></a>
### remember

```ml
function remember(state, bot, retailActive)
```

Record or dispatch `"remember-task"` actions in `remember`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot voice commands state; accesses `actions` and `hostActionFn`. May update `state.actions` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client` and `ltgtype`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L249)

<a id="function-function-mq3-game-bot-voice-commands-resolveclientgoal-function-resolveclientgoal-state-bot-client-src-mq3-game-bot-voice-commands-ml-1736754479"></a>
### resolveClientGoal

```ml
function resolveClientGoal(state, bot, client)
```

Update `bot.teamgoal.entitynum` and `bot.teamgoal` during `resolveClientGoal`. Return paths include `bot.teamgoal.entitynum>=0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot voice commands state; accesses `entityInfos` and `pointAreas`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `teamgoal`. May update `bot.teamgoal.entitynum` and `bot.teamgoal` in place. |
| `client` | `dynamic` | — | Initial value stored in `mq3.game.bot_voice_commands.Goal.entitynum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L352)

<a id="function-function-mq3-game-bot-voice-commands-returnflag-function-returnflag-state-bot-client-mode-retailactive-src-mq3-game-bot-voice-commands-ml-1085962273"></a>
### returnFlag

```ml
function returnFlag(state, bot, client, mode, retailActive)
```

BotVoiceChat_ReturnFlag

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot voice commands state; accesses `gametype` and `missionpack`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `rushbaseawayTime`. May update `bot.rushbaseawayTime` in place. |
| `client` | `dynamic` | — | Value used by `orderedTiming` in `bot.decisionmaker=client`. |
| `mode` | `dynamic` | — | Not read by this implementation; retained in the `returnFlag` signature. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L402)

<a id="function-function-mq3-game-bot-voice-commands-sameteam-function-sameteam-bot-client-state-src-mq3-game-bot-voice-commands-ml-682462697"></a>
### sameTeam

```ml
function sameTeam(bot, client, state)
```

Test `client>=0 and client<MAX_CLIENTS and bot.team==state.clientTeams[client]` as the condition for `sameTeam`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bot` | `dynamic` | — | Bot AI state; accesses `team`. |
| `client` | `dynamic` | — | Operand used to evaluate the returned expression `client>=0 and client<MAX_CLIENTS and bot.team==state.clientTeams[client]`. |
| `state` | `dynamic` | — | Bot voice commands state; accesses `clientTeams`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L477)

<a id="constant-constant-mq3-game-bot-voice-commands-say-all-const-say-all-0-src-mq3-game-bot-voice-commands-ml-1627244525"></a>
### SAY_ALL

```ml
const SAY_ALL = 0
```

Chat delivery mode selecting all recipients.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L14)

<a id="function-function-mq3-game-bot-voice-commands-setclientteam-function-setclientteam-state-client-team-src-mq3-game-bot-voice-commands-ml-890937023"></a>
### setClientTeam

```ml
function setClientTeam(state, client, team)
```

Set `state.clientTeams[client]` to `team` in `mq3.game.bot_voice_commands.setClientTeam`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot voice commands state; accesses `clientTeams`. May update `state.clientTeams[client]` in place. |
| `client` | `dynamic` | — | Value used by `setClientTeam` in `state.clientTeams[client]=team`. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L514)

<a id="function-function-mq3-game-bot-voice-commands-setstatus-function-setstatus-state-bot-retailactive-src-mq3-game-bot-voice-commands-ml-2124679641"></a>
### setStatus

```ml
function setStatus(state, bot, retailActive)
```

Record or dispatch `"team-status"` actions in `setStatus`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot voice commands state; accesses `actions` and `hostActionFn`. May update `state.actions` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client` and `ltgtype`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L244)

<a id="function-function-mq3-game-bot-voice-commands-startleader-function-startleader-state-bot-client-mode-retailactive-src-mq3-game-bot-voice-commands-ml-144006931"></a>
### startLeader

```ml
function startLeader(state, bot, client, mode, retailActive)
```

BotVoiceChat_StartLeader, BotVoiceChat_StopLeader, BotVoiceChat_WhoIsLeader

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot voice commands state; accesses `names`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `teamleader`. May update `bot.teamleader` in place. |
| `client` | `dynamic` | — | Value used by `startLeader` in `if client>=0 and client<len(state.names) then bot.teamleader=info.copy(state.names[client],36) end if`. |
| `mode` | `dynamic` | — | Not read by this implementation; retained in the `startLeader` signature. |
| `retailActive` | `dynamic` | — | Not read by this implementation; retained in the `startLeader` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L413)

- [mq3.game.bot_voice_commands.State](Type-mq3-game-bot-voice-commands-state-1308240726.md) — struct
<a id="function-function-mq3-game-bot-voice-commands-stopleader-function-stopleader-state-bot-client-mode-retailactive-src-mq3-game-bot-voice-commands-ml-1570621033"></a>
### stopLeader

```ml
function stopLeader(state, bot, client, mode, retailActive)
```

Set `bot.teamleader` to `""` and `state.notLeader[client]` to `true` in `mq3.game.bot_voice_commands.stopLeader`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot voice commands state; accesses `names` and `notLeader`. May update `state.notLeader[client]` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `teamleader`. May update `bot.teamleader` in place. |
| `client` | `dynamic` | — | Value used by `stopLeader` in `if client>=0 and client<len(state.names) and strings.toLowerAscii(bot.teamleader)==strings.toLowerAscii(state.na...`. |
| `mode` | `dynamic` | — | Not read by this implementation; retained in the `stopLeader` signature. |
| `retailActive` | `dynamic` | — | Not read by this implementation; retained in the `stopLeader` signature. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L420)

<a id="constant-constant-mq3-game-bot-voice-commands-team-accompany-time-const-team-accompany-time-600-src-mq3-game-bot-voice-commands-ml-1509042859"></a>
### TEAM_ACCOMPANY_TIME

```ml
const TEAM_ACCOMPANY_TIME = 600
```

Duration in seconds allowed for the bot team task to accompany.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L52)

<a id="constant-constant-mq3-game-bot-voice-commands-team-attackenemybase-time-const-team-attackenemybase-time-600-src-mq3-game-bot-voice-commands-ml-1049397259"></a>
### TEAM_ATTACKENEMYBASE_TIME

```ml
const TEAM_ATTACKENEMYBASE_TIME = 600
```

Duration in seconds allowed for the bot team task to attackenemybase.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L58)

<a id="constant-constant-mq3-game-bot-voice-commands-team-blue-const-team-blue-2-src-mq3-game-bot-voice-commands-ml-326626635"></a>
### TEAM_BLUE

```ml
const TEAM_BLUE = 2
```

Team identifier selecting the blue team/category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L22)

<a id="constant-constant-mq3-game-bot-voice-commands-team-camp-time-const-team-camp-time-600-src-mq3-game-bot-voice-commands-ml-936463939"></a>
### TEAM_CAMP_TIME

```ml
const TEAM_CAMP_TIME = 600
```

Duration in seconds allowed for the bot team task to camp.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L56)

<a id="constant-constant-mq3-game-bot-voice-commands-team-defendkeyarea-time-const-team-defendkeyarea-time-600-src-mq3-game-bot-voice-commands-ml-2084698431"></a>
### TEAM_DEFENDKEYAREA_TIME

```ml
const TEAM_DEFENDKEYAREA_TIME = 600
```

Duration in seconds allowed for the bot team task to defend a key area.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L54)

<a id="constant-constant-mq3-game-bot-voice-commands-team-harvest-time-const-team-harvest-time-120-src-mq3-game-bot-voice-commands-ml-1904681106"></a>
### TEAM_HARVEST_TIME

```ml
const TEAM_HARVEST_TIME = 120
```

Duration in seconds allowed for the bot team task to harvest.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L60)

<a id="constant-constant-mq3-game-bot-voice-commands-team-red-const-team-red-1-src-mq3-game-bot-voice-commands-ml-844243808"></a>
### TEAM_RED

```ml
const TEAM_RED = 1
```

Team identifier selecting the red team/category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L20)

<a id="constant-constant-mq3-game-bot-voice-commands-teamtp-attacker-const-teamtp-attacker-2-src-mq3-game-bot-voice-commands-ml-856112871"></a>
### TEAMTP_ATTACKER

```ml
const TEAMTP_ATTACKER = 2
```

Bot team-task preference bit indicating a preference for attacker.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L48)

<a id="constant-constant-mq3-game-bot-voice-commands-teamtp-defender-const-teamtp-defender-1-src-mq3-game-bot-voice-commands-ml-1591358444"></a>
### TEAMTP_DEFENDER

```ml
const TEAMTP_DEFENDER = 1
```

Bot team-task preference bit indicating a preference for defender.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L46)

<a id="function-function-mq3-game-bot-voice-commands-tokenslikeoriginal-function-tokenslikeoriginal-text-src-mq3-game-bot-voice-commands-ml-2104170929"></a>
### tokensLikeOriginal

```ml
function tokensLikeOriginal(text)
```

Apply `mq3.shared.info.copy` while evaluating `tokensLikeOriginal`. Return paths include `parts`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — | Text to parse, format or deliver. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L465)

<a id="function-function-mq3-game-bot-voice-commands-voicechatcommand-function-voicechatcommand-state-bot-mode-voicechat-retailactive-src-mq3-game-bot-voice-commands-ml-1926281982"></a>
### voiceChatCommand

```ml
function voiceChatCommand(state, bot, mode, voiceChat, retailActive)
```

BotVoiceChatCommand.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot voice commands state; accesses `teamplay`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `team`. |
| `mode` | `dynamic` | — | Value passed as argument 4 to `mq3.game.bot_voice_commands.getFlag`. |
| `voiceChat` | `dynamic` | — | Text to parse, format or deliver. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L485)

<a id="function-function-mq3-game-bot-voice-commands-voiceonly-function-voiceonly-state-bot-client-text-retailactive-src-mq3-game-bot-voice-commands-ml-768487605"></a>
### voiceOnly

```ml
function voiceOnly(state, bot, client, text, retailActive)
```

Record or dispatch `"voice-only"` actions in `voiceOnly`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot voice commands state; accesses `actions` and `hostActionFn`. May update `state.actions` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `client` | `dynamic` | — | Initial value stored in `mq3.game.bot_voice_commands.HostAction.client`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L270)

<a id="function-function-mq3-game-bot-voice-commands-wantondefense-function-wantondefense-state-bot-client-mode-retailactive-src-mq3-game-bot-voice-commands-ml-1921237175"></a>
### wantOnDefense

```ml
function wantOnDefense(state, bot, client, mode, retailActive)
```

BotVoiceChat_WantOnDefense and BotVoiceChat_WantOnOffense

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot voice commands state; accesses `taskPreferences`. May update `state.taskPreferences[client]` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `client` | `dynamic` | — | Operand used to evaluate the returned expression `state.easyNames[client]`. |
| `mode` | `dynamic` | — | Not read by this implementation; retained in the `wantOnDefense` signature. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L441)

<a id="function-function-mq3-game-bot-voice-commands-wantonoffense-function-wantonoffense-state-bot-client-mode-retailactive-src-mq3-game-bot-voice-commands-ml-1409855987"></a>
### wantOnOffense

```ml
function wantOnOffense(state, bot, client, mode, retailActive)
```

Record or dispatch `"ea-action"` actions in `wantOnOffense`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot voice commands state; accesses `taskPreferences`. May update `state.taskPreferences[client]` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `client` | `dynamic` | — | Operand used to evaluate the returned expression `state.easyNames[client]`. |
| `mode` | `dynamic` | — | Not read by this implementation; retained in the `wantOnOffense` signature. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L451)

<a id="function-function-mq3-game-bot-voice-commands-whoisleader-function-whoisleader-state-bot-client-mode-retailactive-src-mq3-game-bot-voice-commands-ml-616591811"></a>
### whoIsLeader

```ml
function whoIsLeader(state, bot, client, mode, retailActive)
```

Apply `mq3.game.bot_voice_commands.initialChat`, `mq3.game.bot_voice_commands.enterChat` and `mq3.game.bot_voice_commands.voiceOnly` while evaluating `whoIsLeader`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot voice commands state; accesses `teamplay` and `names`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client` and `teamleader`. |
| `client` | `dynamic` | — | Value used by `whoIsLeader` in `if bot.client>=0 and bot.client<len(state.names) and strings.toLowerAscii(state.names[bot.client])==strings.toLo...`. |
| `mode` | `dynamic` | — | Not read by this implementation; retained in the `whoIsLeader` signature. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L429)
