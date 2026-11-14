# `src/mq3/game/bot_voice_commands.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.bot_voice_commands`](Package-mq3-game-bot-voice-commands-761635497.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/textnumbers.ml` as `textnum` → [src/mq3/compat/textnumbers.ml](File-src-mq3-compat-textnumbers-ml-766983963.md)
- `mq3/shared/info.ml` as `info` → [src/mq3/shared/info.ml](File-src-mq3-shared-info-ml-1735567187.md)
- `std/string.ml` as `strings` → `../MiniLangCompilerML/std/string.ml` — external dependency

## Declarations

<a id="constant-constant-mq3-game-bot-voice-commands-action-affirmative-const-action-affirmative-1048576-src-mq3-game-bot-voice-commands-ml-1772098158"></a>
### ACTION_AFFIRMATIVE

```ml
const ACTION_AFFIRMATIVE = 1048576
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L29)

- [mq3.game.bot_voice_commands.Bot](Type-mq3-game-bot-voice-commands-bot-657116126.md) — struct
<a id="function-function-mq3-game-bot-voice-commands-camp-function-camp-state-bot-client-mode-retailactive-src-mq3-game-bot-voice-commands-ml-424160925"></a>
### camp

```ml
function camp(state, bot, client, mode, retailActive)
```

BotVoiceChat_Camp

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L170)

<a id="constant-constant-mq3-game-bot-voice-commands-chat-team-const-chat-team-1-src-mq3-game-bot-voice-commands-ml-1144863748"></a>
### CHAT_TEAM

```ml
const CHAT_TEAM = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L12)

<a id="constant-constant-mq3-game-bot-voice-commands-chat-tell-const-chat-tell-2-src-mq3-game-bot-voice-commands-ml-762584163"></a>
### CHAT_TELL

```ml
const CHAT_TELL = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L13)

<a id="function-function-mq3-game-bot-voice-commands-copygoal-function-copygoal-value-src-mq3-game-bot-voice-commands-ml-692633997"></a>
### copyGoal

```ml
function copyGoal(value)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L91)

<a id="function-function-mq3-game-bot-voice-commands-create-function-create-src-mq3-game-bot-voice-commands-ml-235640278"></a>
### create

```ml
function create()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L95)

<a id="function-function-mq3-game-bot-voice-commands-createbot-function-createbot-client-src-mq3-game-bot-voice-commands-ml-248001159"></a>
### createBot

```ml
function createBot(client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L92)

<a id="constant-constant-mq3-game-bot-voice-commands-ctf-getflag-time-const-ctf-getflag-time-600-src-mq3-game-bot-voice-commands-ml-1178032709"></a>
### CTF_GETFLAG_TIME

```ml
const CTF_GETFLAG_TIME = 600.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L35)

<a id="constant-constant-mq3-game-bot-voice-commands-ctf-returnflag-time-const-ctf-returnflag-time-180-src-mq3-game-bot-voice-commands-ml-330497038"></a>
### CTF_RETURNFLAG_TIME

```ml
const CTF_RETURNFLAG_TIME = 180.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L36)

<a id="function-function-mq3-game-bot-voice-commands-defend-function-defend-state-bot-client-mode-retailactive-src-mq3-game-bot-voice-commands-ml-106234109"></a>
### defend

```ml
function defend(state, bot, client, mode, retailActive)
```

BotVoiceChat_Defend and BotVoiceChat_DefendFlag

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L142)

<a id="function-function-mq3-game-bot-voice-commands-defendflag-function-defendflag-state-bot-client-mode-retailactive-src-mq3-game-bot-voice-commands-ml-815274073"></a>
### defendFlag

```ml
function defendFlag(state, bot, client, mode, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L152)

<a id="function-function-mq3-game-bot-voice-commands-dummy-function-dummy-state-bot-client-mode-retailactive-src-mq3-game-bot-voice-commands-ml-1268479689"></a>
### dummy

```ml
function dummy(state, bot, client, mode, retailActive)
```

BotVoiceChat_Dummy

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L212)

<a id="function-function-mq3-game-bot-voice-commands-easyname-function-easyname-state-client-src-mq3-game-bot-voice-commands-ml-952925050"></a>
### easyName

```ml
function easyName(state, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L167)

<a id="function-function-mq3-game-bot-voice-commands-emit-function-emit-state-kind-client-channel-text-value-retailactive-src-mq3-game-bot-voice-commands-ml-1405194812"></a>
### emit

```ml
function emit(state, kind, client, channel, text, value, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `kind` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `channel` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `value` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L105)

<a id="function-function-mq3-game-bot-voice-commands-emptygoal-function-emptygoal-src-mq3-game-bot-voice-commands-ml-22570122"></a>
### emptyGoal

```ml
function emptyGoal()
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L90)

<a id="function-function-mq3-game-bot-voice-commands-enterchat-function-enterchat-state-bot-client-channel-retailactive-src-mq3-game-bot-voice-commands-ml-1626851497"></a>
### enterChat

```ml
function enterChat(state, bot, client, channel, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `channel` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L113)

- [mq3.game.bot_voice_commands.EntityInfo](Type-mq3-game-bot-voice-commands-entityinfo-451566370.md) — struct
<a id="function-function-mq3-game-bot-voice-commands-floattime-function-floattime-state-src-mq3-game-bot-voice-commands-ml-563159315"></a>
### floatTime

```ml
function floatTime(state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L101)

<a id="function-function-mq3-game-bot-voice-commands-followflagcarrier-function-followflagcarrier-state-bot-client-mode-retailactive-src-mq3-game-bot-voice-commands-ml-1271151539"></a>
### followFlagCarrier

```ml
function followFlagCarrier(state, bot, client, mode, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L183)

<a id="function-function-mq3-game-bot-voice-commands-followme-function-followme-state-bot-client-mode-retailactive-src-mq3-game-bot-voice-commands-ml-759568293"></a>
### followMe

```ml
function followMe(state, bot, client, mode, retailActive)
```

BotVoiceChat_FollowMe and BotVoiceChat_FollowFlagCarrier

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L177)

<a id="function-function-mq3-game-bot-voice-commands-getflag-function-getflag-state-bot-client-mode-retailactive-src-mq3-game-bot-voice-commands-ml-543732957"></a>
### getFlag

```ml
function getFlag(state, bot, client, mode, retailActive)
```

BotVoiceChat_GetFlag

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L122)

<a id="function-function-mq3-game-bot-voice-commands-goal-function-goal-entitynum-areanum-origin-mins-maxs-tag-src-mq3-game-bot-voice-commands-ml-1245002892"></a>
### goal

```ml
function goal(entitynum, areanum, origin, mins, maxs, tag)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `entitynum` | `dynamic` | — |  |
| `areanum` | `dynamic` | — |  |
| `origin` | `dynamic` | — |  |
| `mins` | `dynamic` | — |  |
| `maxs` | `dynamic` | — |  |
| `tag` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L89)

- [mq3.game.bot_voice_commands.Goal](Type-mq3-game-bot-voice-commands-goal-597117782.md) — struct
<a id="constant-constant-mq3-game-bot-voice-commands-gt-1fctf-const-gt-1fctf-5-src-mq3-game-bot-voice-commands-ml-2069129334"></a>
### GT_1FCTF

```ml
const GT_1FCTF = 5
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L17)

<a id="constant-constant-mq3-game-bot-voice-commands-gt-ctf-const-gt-ctf-4-src-mq3-game-bot-voice-commands-ml-1880627505"></a>
### GT_CTF

```ml
const GT_CTF = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L16)

<a id="constant-constant-mq3-game-bot-voice-commands-gt-harvester-const-gt-harvester-7-src-mq3-game-bot-voice-commands-ml-386545428"></a>
### GT_HARVESTER

```ml
const GT_HARVESTER = 7
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L19)

<a id="constant-constant-mq3-game-bot-voice-commands-gt-obelisk-const-gt-obelisk-6-src-mq3-game-bot-voice-commands-ml-1629625991"></a>
### GT_OBELISK

```ml
const GT_OBELISK = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L18)

- [mq3.game.bot_voice_commands.HostAction](Type-mq3-game-bot-voice-commands-hostaction-538309141.md) — struct
<a id="function-function-mq3-game-bot-voice-commands-initialchat-function-initialchat-state-bot-chat-arg-retailactive-src-mq3-game-bot-voice-commands-ml-934170665"></a>
### initialChat

```ml
function initialChat(state, bot, chat, arg, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `chat` | `dynamic` | — |  |
| `arg` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L112)

<a id="constant-constant-mq3-game-bot-voice-commands-ltg-attackenemybase-const-ltg-attackenemybase-13-src-mq3-game-bot-voice-commands-ml-1359679239"></a>
### LTG_ATTACKENEMYBASE

```ml
const LTG_ATTACKENEMYBASE = 13
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L26)

<a id="constant-constant-mq3-game-bot-voice-commands-ltg-camporder-const-ltg-camporder-8-src-mq3-game-bot-voice-commands-ml-1264563405"></a>
### LTG_CAMPORDER

```ml
const LTG_CAMPORDER = 8
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L24)

<a id="constant-constant-mq3-game-bot-voice-commands-ltg-defendkeyarea-const-ltg-defendkeyarea-3-src-mq3-game-bot-voice-commands-ml-361841134"></a>
### LTG_DEFENDKEYAREA

```ml
const LTG_DEFENDKEYAREA = 3
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L21)

<a id="constant-constant-mq3-game-bot-voice-commands-ltg-getflag-const-ltg-getflag-4-src-mq3-game-bot-voice-commands-ml-1192454053"></a>
### LTG_GETFLAG

```ml
const LTG_GETFLAG = 4
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L22)

<a id="constant-constant-mq3-game-bot-voice-commands-ltg-harvest-const-ltg-harvest-12-src-mq3-game-bot-voice-commands-ml-541014806"></a>
### LTG_HARVEST

```ml
const LTG_HARVEST = 12
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L25)

<a id="constant-constant-mq3-game-bot-voice-commands-ltg-returnflag-const-ltg-returnflag-6-src-mq3-game-bot-voice-commands-ml-829316073"></a>
### LTG_RETURNFLAG

```ml
const LTG_RETURNFLAG = 6
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L23)

<a id="constant-constant-mq3-game-bot-voice-commands-ltg-teamaccompany-const-ltg-teamaccompany-2-src-mq3-game-bot-voice-commands-ml-831484095"></a>
### LTG_TEAMACCOMPANY

```ml
const LTG_TEAMACCOMPANY = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L20)

<a id="constant-constant-mq3-game-bot-voice-commands-max-clients-const-max-clients-64-src-mq3-game-bot-voice-commands-ml-283780325"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L9)

<a id="constant-constant-mq3-game-bot-voice-commands-max-message-size-const-max-message-size-256-src-mq3-game-bot-voice-commands-ml-1576521648"></a>
### MAX_MESSAGE_SIZE

```ml
const MAX_MESSAGE_SIZE = 256
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L10)

<a id="function-function-mq3-game-bot-voice-commands-offense-function-offense-state-bot-client-mode-retailactive-src-mq3-game-bot-voice-commands-ml-86890053"></a>
### offense

```ml
function offense(state, bot, client, mode, retailActive)
```

BotVoiceChat_Offense

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L134)

<a id="function-function-mq3-game-bot-voice-commands-orderedtiming-function-orderedtiming-state-bot-client-ltg-duration-src-mq3-game-bot-voice-commands-ml-1892417132"></a>
### orderedTiming

```ml
function orderedTiming(state, bot, client, ltg, duration)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `ltg` | `dynamic` | — |  |
| `duration` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L115)

<a id="function-function-mq3-game-bot-voice-commands-patrol-function-patrol-state-bot-client-mode-retailactive-src-mq3-game-bot-voice-commands-ml-660792649"></a>
### patrol

```ml
function patrol(state, bot, client, mode, retailActive)
```

BotVoiceChat_Patrol

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L155)

<a id="function-function-mq3-game-bot-voice-commands-remember-function-remember-state-bot-retailactive-src-mq3-game-bot-voice-commands-ml-161386941"></a>
### remember

```ml
function remember(state, bot, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L111)

<a id="function-function-mq3-game-bot-voice-commands-resolveclientgoal-function-resolveclientgoal-state-bot-client-src-mq3-game-bot-voice-commands-ml-1736754479"></a>
### resolveClientGoal

```ml
function resolveClientGoal(state, bot, client)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L160)

<a id="function-function-mq3-game-bot-voice-commands-returnflag-function-returnflag-state-bot-client-mode-retailactive-src-mq3-game-bot-voice-commands-ml-1085962273"></a>
### returnFlag

```ml
function returnFlag(state, bot, client, mode, retailActive)
```

BotVoiceChat_ReturnFlag

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L186)

<a id="function-function-mq3-game-bot-voice-commands-sameteam-function-sameteam-bot-client-state-src-mq3-game-bot-voice-commands-ml-682462697"></a>
### sameTeam

```ml
function sameTeam(bot, client, state)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `bot` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `state` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L222)

<a id="constant-constant-mq3-game-bot-voice-commands-say-all-const-say-all-0-src-mq3-game-bot-voice-commands-ml-1627244525"></a>
### SAY_ALL

```ml
const SAY_ALL = 0
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L11)

<a id="function-function-mq3-game-bot-voice-commands-setclientteam-function-setclientteam-state-client-team-src-mq3-game-bot-voice-commands-ml-890937023"></a>
### setClientTeam

```ml
function setClientTeam(state, client, team)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `team` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L250)

<a id="function-function-mq3-game-bot-voice-commands-setstatus-function-setstatus-state-bot-retailactive-src-mq3-game-bot-voice-commands-ml-2124679641"></a>
### setStatus

```ml
function setStatus(state, bot, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L110)

<a id="function-function-mq3-game-bot-voice-commands-startleader-function-startleader-state-bot-client-mode-retailactive-src-mq3-game-bot-voice-commands-ml-144006931"></a>
### startLeader

```ml
function startLeader(state, bot, client, mode, retailActive)
```

BotVoiceChat_StartLeader, BotVoiceChat_StopLeader, BotVoiceChat_WhoIsLeader

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L192)

- [mq3.game.bot_voice_commands.State](Type-mq3-game-bot-voice-commands-state-1308240726.md) — struct
<a id="function-function-mq3-game-bot-voice-commands-stopleader-function-stopleader-state-bot-client-mode-retailactive-src-mq3-game-bot-voice-commands-ml-1570621033"></a>
### stopLeader

```ml
function stopLeader(state, bot, client, mode, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L193)

<a id="constant-constant-mq3-game-bot-voice-commands-team-accompany-time-const-team-accompany-time-600-src-mq3-game-bot-voice-commands-ml-1608482743"></a>
### TEAM_ACCOMPANY_TIME

```ml
const TEAM_ACCOMPANY_TIME = 600.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L30)

<a id="constant-constant-mq3-game-bot-voice-commands-team-attackenemybase-time-const-team-attackenemybase-time-600-src-mq3-game-bot-voice-commands-ml-1089382807"></a>
### TEAM_ATTACKENEMYBASE_TIME

```ml
const TEAM_ATTACKENEMYBASE_TIME = 600.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L33)

<a id="constant-constant-mq3-game-bot-voice-commands-team-blue-const-team-blue-2-src-mq3-game-bot-voice-commands-ml-326626635"></a>
### TEAM_BLUE

```ml
const TEAM_BLUE = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L15)

<a id="constant-constant-mq3-game-bot-voice-commands-team-camp-time-const-team-camp-time-600-src-mq3-game-bot-voice-commands-ml-1146349327"></a>
### TEAM_CAMP_TIME

```ml
const TEAM_CAMP_TIME = 600.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L32)

<a id="constant-constant-mq3-game-bot-voice-commands-team-defendkeyarea-time-const-team-defendkeyarea-time-600-src-mq3-game-bot-voice-commands-ml-227014907"></a>
### TEAM_DEFENDKEYAREA_TIME

```ml
const TEAM_DEFENDKEYAREA_TIME = 600.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L31)

<a id="constant-constant-mq3-game-bot-voice-commands-team-harvest-time-const-team-harvest-time-120-src-mq3-game-bot-voice-commands-ml-1665379100"></a>
### TEAM_HARVEST_TIME

```ml
const TEAM_HARVEST_TIME = 120.
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L34)

<a id="constant-constant-mq3-game-bot-voice-commands-team-red-const-team-red-1-src-mq3-game-bot-voice-commands-ml-844243808"></a>
### TEAM_RED

```ml
const TEAM_RED = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L14)

<a id="constant-constant-mq3-game-bot-voice-commands-teamtp-attacker-const-teamtp-attacker-2-src-mq3-game-bot-voice-commands-ml-856112871"></a>
### TEAMTP_ATTACKER

```ml
const TEAMTP_ATTACKER = 2
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L28)

<a id="constant-constant-mq3-game-bot-voice-commands-teamtp-defender-const-teamtp-defender-1-src-mq3-game-bot-voice-commands-ml-1591358444"></a>
### TEAMTP_DEFENDER

```ml
const TEAMTP_DEFENDER = 1
```


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L27)

<a id="function-function-mq3-game-bot-voice-commands-tokenslikeoriginal-function-tokenslikeoriginal-text-src-mq3-game-bot-voice-commands-ml-2104170929"></a>
### tokensLikeOriginal

```ml
function tokensLikeOriginal(text)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `text` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L214)

<a id="function-function-mq3-game-bot-voice-commands-voicechatcommand-function-voicechatcommand-state-bot-mode-voicechat-retailactive-src-mq3-game-bot-voice-commands-ml-1926281982"></a>
### voiceChatCommand

```ml
function voiceChatCommand(state, bot, mode, voiceChat, retailActive)
```

BotVoiceChatCommand.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `voiceChat` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L225)

<a id="function-function-mq3-game-bot-voice-commands-voiceonly-function-voiceonly-state-bot-client-text-retailactive-src-mq3-game-bot-voice-commands-ml-768487605"></a>
### voiceOnly

```ml
function voiceOnly(state, bot, client, text, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `text` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L114)

<a id="function-function-mq3-game-bot-voice-commands-wantondefense-function-wantondefense-state-bot-client-mode-retailactive-src-mq3-game-bot-voice-commands-ml-1921237175"></a>
### wantOnDefense

```ml
function wantOnDefense(state, bot, client, mode, retailActive)
```

BotVoiceChat_WantOnDefense and BotVoiceChat_WantOnOffense

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L203)

<a id="function-function-mq3-game-bot-voice-commands-wantonoffense-function-wantonoffense-state-bot-client-mode-retailactive-src-mq3-game-bot-voice-commands-ml-1409855987"></a>
### wantOnOffense

```ml
function wantOnOffense(state, bot, client, mode, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L207)

<a id="function-function-mq3-game-bot-voice-commands-whoisleader-function-whoisleader-state-bot-client-mode-retailactive-src-mq3-game-bot-voice-commands-ml-616591811"></a>
### whoIsLeader

```ml
function whoIsLeader(state, bot, client, mode, retailActive)
```

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — |  |
| `bot` | `dynamic` | — |  |
| `client` | `dynamic` | — |  |
| `mode` | `dynamic` | — |  |
| `retailActive` | `dynamic` | — |  |


[View source](https://github.com/n1k0m0/MiniQuake3/blob/main/src/mq3/game/bot_voice_commands.ml#L196)
