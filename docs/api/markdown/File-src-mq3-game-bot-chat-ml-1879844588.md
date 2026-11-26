# `src/mq3/game/bot_chat.ml`

[Home](README.md) · [Files](Files.md)

Package: [`mq3.game.bot_chat`](Package-mq3-game-bot-chat-1889655394.md)

Reachable from entry: **no**

## Imports

- `mq3/compat/numeric.ml` as `numeric` → [src/mq3/compat/numeric.ml](File-src-mq3-compat-numeric-ml-1285218747.md)
- `mq3/game/game_headers.ml` as `headers` → [src/mq3/game/game_headers.ml](File-src-mq3-game-game-headers-ml-1243119809.md)

## Declarations

- [mq3.game.bot_chat.Bot](Type-mq3-game-bot-chat-bot-453736137.md) — struct
<a id="function-function-mq3-game-bot-chat-characteristic-function-characteristic-state-index-src-mq3-game-bot-chat-ml-700053243"></a>
### characteristic

```ml
function characteristic(state, index)
```

Read a bot chat characteristic by index, returning zero when it is outside the table.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `characteristics`. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L110)

<a id="constant-constant-mq3-game-bot-chat-chat-all-const-chat-all-0-src-mq3-game-bot-chat-ml-723632907"></a>
### CHAT_ALL

```ml
const CHAT_ALL = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L11)

<a id="constant-constant-mq3-game-bot-chat-chat-team-const-chat-team-1-src-mq3-game-bot-chat-ml-623932784"></a>
### CHAT_TEAM

```ml
const CHAT_TEAM = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L12)

<a id="function-function-mq3-game-bot-chat-chatdeath-function-chatdeath-state-bot-retailactive-src-mq3-game-bot-chat-ml-1025230339"></a>
### chatDeath

```ml
function chatDeath(state, bot, retailActive)
```

BotChat_Death

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `teamplay` and `missionpack`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `lastkilledby`, `client`, `botdeathtype` and `botsuicide`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L293)

<a id="function-function-mq3-game-bot-chat-chatendlevel-function-chatendlevel-state-bot-retailactive-src-mq3-game-bot-chat-ml-1791010863"></a>
### chatEndLevel

```ml
function chatEndLevel(state, bot, retailActive)
```

BotChat_EndLevel

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `botNoChat`, `now`, `teamplay`, `gametype` and `fastChat`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `observer`, `lastchatTime` and `client`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L281)

<a id="function-function-mq3-game-bot-chat-chatenemysuicide-function-chatenemysuicide-state-bot-retailactive-src-mq3-game-bot-chat-ml-14474415"></a>
### chatEnemySuicide

```ml
function chatEnemySuicide(state, bot, retailActive)
```

BotChat_EnemySuicide

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `teamplay`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `enemy`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L327)

<a id="function-function-mq3-game-bot-chat-chatentergame-function-chatentergame-state-bot-retailactive-src-mq3-game-bot-chat-ml-948756463"></a>
### chatEnterGame

```ml
function chatEnterGame(state, bot, retailActive)
```

BotChat_EnterGame

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `teamplay`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L255)

<a id="function-function-mq3-game-bot-chat-chatexitgame-function-chatexitgame-state-bot-retailactive-src-mq3-game-bot-chat-ml-953148859"></a>
### chatExitGame

```ml
function chatExitGame(state, bot, retailActive)
```

BotChat_ExitGame

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `teamplay`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L263)

<a id="function-function-mq3-game-bot-chat-chathitnodeath-function-chathitnodeath-state-bot-retailactive-src-mq3-game-bot-chat-ml-1340214175"></a>
### chatHitNoDeath

```ml
function chatHitNoDeath(state, bot, retailActive)
```

BotChat_HitNoDeath

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `teamplay` and `missionpack`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `lasthurtClient`, `client`, `enemy` and `lasthurtMod`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L348)

<a id="function-function-mq3-game-bot-chat-chathitnokill-function-chathitnokill-state-bot-retailactive-src-mq3-game-bot-chat-ml-240038135"></a>
### chatHitNoKill

```ml
function chatHitNoKill(state, bot, retailActive)
```

BotChat_HitNoKill

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `teamplay`, `hurtMods` and `missionpack`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `enemy`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L356)

<a id="function-function-mq3-game-bot-chat-chathittalking-function-chathittalking-state-bot-retailactive-src-mq3-game-bot-chat-ml-1980182359"></a>
### chatHitTalking

```ml
function chatHitTalking(state, bot, retailActive)
```

BotChat_HitTalking

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `teamplay` and `missionpack`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `lasthurtClient` and `client`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L339)

<a id="function-function-mq3-game-bot-chat-chatkill-function-chatkill-state-bot-retailactive-src-mq3-game-bot-chat-ml-1728252959"></a>
### chatKill

```ml
function chatKill(state, bot, retailActive)
```

BotChat_Kill

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `teamplay` and `missionpack`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `lastkilledplayer`, `client`, `enemydeathtype` and `botdeathtype`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L315)

<a id="function-function-mq3-game-bot-chat-chatrandom-function-chatrandom-state-bot-retailactive-src-mq3-game-bot-chat-ml-1645415243"></a>
### chatRandom

```ml
function chatRandom(state, bot, retailActive)
```

BotChat_Random

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `botNoChat`, `now`, `gametype`, `fastChat` and `teamplay`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `observer`, `lastchatTime`, `ltgtype`, `thinktime` and `lastkilledplayer` and related fields. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L365)

<a id="function-function-mq3-game-bot-chat-chatstartlevel-function-chatstartlevel-state-bot-retailactive-src-mq3-game-bot-chat-ml-476200107"></a>
### chatStartLevel

```ml
function chatStartLevel(state, bot, retailActive)
```

BotChat_StartLevel

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `botNoChat`, `now`, `teamplay`, `gametype` and `fastChat`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `observer`, `lastchatTime` and `client`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L271)

<a id="function-function-mq3-game-bot-chat-chattest-function-chattest-state-bot-retailactive-src-mq3-game-bot-chat-ml-1232663063"></a>
### chatTest

```ml
function chatTest(state, bot, retailActive)
```

BotChatTest

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `initialChatCounts`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `chatto`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L403)

<a id="function-function-mq3-game-bot-chat-chattime-function-chattime-state-bot-src-mq3-game-bot-chat-ml-106968058"></a>
### chatTime

```ml
function chatTime(state, bot)
```

BotChatTime

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `characteristics`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `character`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L378)

<a id="function-function-mq3-game-bot-chat-command-function-command-state-bot-text-retailactive-src-mq3-game-bot-chat-ml-317696538"></a>
### command

```ml
function command(state, bot, text, retailActive)
```

Record or dispatch `"ea-command"` actions in `command`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `actions` and `hostActionFn`. May update `state.actions` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `text` | `dynamic` | — | Text to parse, format or deliver. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L137)

<a id="function-function-mq3-game-bot-chat-commongate-function-commongate-state-bot-characteristicindex-scale-src-mq3-game-bot-chat-ml-1543814149"></a>
### commonGate

```ml
function commonGate(state, bot, characteristicIndex, scale)
```

Apply `mq3.game.bot_chat.randomValue`, `mq3.game.bot_chat.characteristic` and `mq3.game.bot_chat.numActivePlayers` while evaluating `commonGate`. Return paths include `numActivePlayers(state)>1`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `botNoChat`, `now`, `gametype` and `fastChat`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `lastchatTime`. |
| `characteristicIndex` | `dynamic` | — | Index of the entry to access. |
| `scale` | `dynamic` | — | Scale factor applied to the computed value. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L237)

<a id="constant-constant-mq3-game-bot-chat-contents-lava-const-contents-lava-headers-contents-lava-src-mq3-game-bot-chat-ml-355271198"></a>
### CONTENTS_LAVA

```ml
const CONTENTS_LAVA = headers.CONTENTS_LAVA
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L19)

<a id="constant-constant-mq3-game-bot-chat-contents-slime-const-contents-slime-headers-contents-slime-src-mq3-game-bot-chat-ml-316116886"></a>
### CONTENTS_SLIME

```ml
const CONTENTS_SLIME = headers.CONTENTS_SLIME
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L20)

<a id="function-function-mq3-game-bot-chat-countfor-function-countfor-state-name-src-mq3-game-bot-chat-ml-10171466"></a>
### countFor

```ml
function countFor(state, name)
```

Find the configured initial-chat message count for a named chat type.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `initialChatCounts`. |
| `name` | `dynamic` | — | Lookup text matched against `item[0]`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L382)

<a id="function-function-mq3-game-bot-chat-create-function-create-src-mq3-game-bot-chat-ml-151652952"></a>
### create

```ml
function create()
```

Build the `mq3.game.bot_chat.State` result for `create`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L94)

<a id="function-function-mq3-game-bot-chat-createbot-function-createbot-client-src-mq3-game-bot-chat-ml-600407889"></a>
### createBot

```ml
function createBot(client)
```

Create a `mq3.game.bot_chat.Bot` record, initializing `client` from `client`, `entitynum` from `client` and `character` from `client`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `client` | `dynamic` | — | Initial value stored in `mq3.game.bot_chat.Bot.client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L90)

<a id="function-function-mq3-game-bot-chat-createentity-function-createentity-number-src-mq3-game-bot-chat-ml-1309947521"></a>
### createEntity

```ml
function createEntity(number)
```

Create a `mq3.game.bot_chat.Entity` record, initializing `number` from `number`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `number` | `dynamic` | — | Initial value stored in `mq3.game.bot_chat.Entity.number`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L87)

<a id="function-function-mq3-game-bot-chat-createplayer-function-createplayer-name-team-score-src-mq3-game-bot-chat-ml-1380748112"></a>
### createPlayer

```ml
function createPlayer(name, team, score)
```

Create a `mq3.game.bot_chat.Player` record, initializing `active` as `name!=""`, `name` from `name` and `team` from `team`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | `dynamic` | — | Name used to identify the requested entry. |
| `team` | `dynamic` | — | Team identifier used by the game rules. |
| `score` | `dynamic` | — | Initial value stored in `mq3.game.bot_chat.Player.score`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L84)

<a id="function-function-mq3-game-bot-chat-emit-function-emit-state-kind-bot-channel-chat-variables-value-retailactive-src-mq3-game-bot-chat-ml-483722522"></a>
### emit

```ml
function emit(state, kind, bot, channel, chat, variables, value, retailActive)
```

Set `state.actions` to `state.actions+[action]` in `mq3.game.bot_chat.emit`. Return paths include `action`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `actions` and `hostActionFn`. May update `state.actions` in place. |
| `kind` | `dynamic` | — | Initial value stored in `mq3.game.bot_chat.HostAction.kind`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `channel` | `dynamic` | — | Channel identifier for the requested action. |
| `chat` | `dynamic` | — | Initial value stored in `mq3.game.bot_chat.HostAction.chat`. |
| `variables` | `dynamic` | — | Chat substitution values in their numbered slots. |
| `value` | `dynamic` | — | Initial value stored in `mq3.game.bot_chat.HostAction.value`. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L120)

<a id="function-function-mq3-game-bot-chat-enterchat-function-enterchat-state-bot-channel-retailactive-src-mq3-game-bot-chat-ml-1824639684"></a>
### enterChat

```ml
function enterChat(state, bot, channel, retailActive)
```

Record or dispatch `"enter-chat"` actions in `enterChat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `actions` and `hostActionFn`. May update `state.actions` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `cs`. |
| `channel` | `dynamic` | — | Channel identifier for the requested action. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L143)

- [mq3.game.bot_chat.Entity](Type-mq3-game-bot-chat-entity-592045055.md) — struct
<a id="constant-constant-mq3-game-bot-chat-entitynum-world-const-entitynum-world-1022-src-mq3-game-bot-chat-ml-120943666"></a>
### ENTITYNUM_WORLD

```ml
const ENTITYNUM_WORLD = 1022
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L15)

<a id="function-function-mq3-game-bot-chat-entityshooting-function-entityshooting-state-index-src-mq3-game-bot-chat-ml-2086387459"></a>
### entityShooting

```ml
function entityShooting(state, index)
```

Test `index>=0 and index<len(state.entities) and state.entities[index].shooting` as the condition for `entityShooting`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `entities`. |
| `index` | `dynamic` | — | Index of the entry to access. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L334)

<a id="function-function-mq3-game-bot-chat-finish-function-finish-state-bot-chat-variables-channel-retailactive-src-mq3-game-bot-chat-ml-1546053449"></a>
### finish

```ml
function finish(state, bot, chat, variables, channel, retailActive)
```

Set `bot.chatto` to `channel` and `bot.lastchatTime` to `state.now` in `mq3.game.bot_chat.finish`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `now`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `chatto` and `lastchatTime`. May update `bot.chatto` and `bot.lastchatTime` in place. |
| `chat` | `dynamic` | — | Initial value stored in `mq3.game.bot_chat.HostAction.chat`. |
| `variables` | `dynamic` | — | Chat substitution values in their numbered slots. |
| `channel` | `dynamic` | — | Channel identifier for the requested action. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L249)

<a id="function-function-mq3-game-bot-chat-firstclientinrankings-function-firstclientinrankings-state-src-mq3-game-bot-chat-ml-403185767"></a>
### firstClientInRankings

```ml
function firstClientInRankings(state)
```

BotFirstClientInRankings

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `players`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L176)

<a id="constant-constant-mq3-game-bot-chat-gt-tournament-const-gt-tournament-1-src-mq3-game-bot-chat-ml-890273856"></a>
### GT_TOURNAMENT

```ml
const GT_TOURNAMENT = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L13)

- [mq3.game.bot_chat.HostAction](Type-mq3-game-bot-chat-hostaction-216858268.md) — struct
<a id="function-function-mq3-game-bot-chat-initialchat-function-initialchat-state-bot-chat-variables-retailactive-src-mq3-game-bot-chat-ml-563530876"></a>
### initialChat

```ml
function initialChat(state, bot, chat, variables, retailActive)
```

Record or dispatch `"initial-chat"` actions in `initialChat`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `actions` and `hostActionFn`. May update `state.actions` in place. |
| `bot` | `dynamic` | — | Bot AI state; accesses `chatto`. |
| `chat` | `dynamic` | — | Initial value stored in `mq3.game.bot_chat.HostAction.chat`. |
| `variables` | `dynamic` | — | Chat substitution values in their numbered slots. |
| `retailActive` | `dynamic` | — | Whether the retail integration owns side-effect delivery. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L131)

<a id="constant-constant-mq3-game-bot-chat-inventory-flight-const-inventory-flight-headers-inventory-flight-src-mq3-game-bot-chat-ml-1244836596"></a>
### INVENTORY_FLIGHT

```ml
const INVENTORY_FLIGHT = headers.INVENTORY_FLIGHT
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L59)

<a id="constant-constant-mq3-game-bot-chat-inventory-haste-const-inventory-haste-headers-inventory-haste-src-mq3-game-bot-chat-ml-30053009"></a>
### INVENTORY_HASTE

```ml
const INVENTORY_HASTE = headers.INVENTORY_HASTE
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L56)

<a id="constant-constant-mq3-game-bot-chat-inventory-invisibility-const-inventory-invisibility-headers-inventory-invisibility-src-mq3-game-bot-chat-ml-1916539485"></a>
### INVENTORY_INVISIBILITY

```ml
const INVENTORY_INVISIBILITY = headers.INVENTORY_INVISIBILITY
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L57)

<a id="constant-constant-mq3-game-bot-chat-inventory-quad-const-inventory-quad-headers-inventory-quad-src-mq3-game-bot-chat-ml-1274341865"></a>
### INVENTORY_QUAD

```ml
const INVENTORY_QUAD = headers.INVENTORY_QUAD
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L55)

<a id="constant-constant-mq3-game-bot-chat-inventory-regen-const-inventory-regen-headers-inventory-regen-src-mq3-game-bot-chat-ml-1555740431"></a>
### INVENTORY_REGEN

```ml
const INVENTORY_REGEN = headers.INVENTORY_REGEN
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L58)

<a id="function-function-mq3-game-bot-chat-isfirstinrankings-function-isfirstinrankings-state-bot-src-mq3-game-bot-chat-ml-1596530098"></a>
### isFirstInRankings

```ml
function isFirstInRankings(state, bot)
```

BotIsFirstInRankings

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `players`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `score`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L169)

<a id="function-function-mq3-game-bot-chat-islastinrankings-function-islastinrankings-state-bot-src-mq3-game-bot-chat-ml-284711890"></a>
### isLastInRankings

```ml
function isLastInRankings(state, bot)
```

BotIsLastInRankings

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `players`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `score`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L173)

<a id="function-function-mq3-game-bot-chat-lastclientinrankings-function-lastclientinrankings-state-src-mq3-game-bot-chat-ml-392119805"></a>
### lastClientInRankings

```ml
function lastClientInRankings(state)
```

BotLastClientInRankings

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `players`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L179)

<a id="constant-constant-mq3-game-bot-chat-ltg-rushbase-const-ltg-rushbase-5-src-mq3-game-bot-chat-ml-1073854436"></a>
### LTG_RUSHBASE

```ml
const LTG_RUSHBASE = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L18)

<a id="constant-constant-mq3-game-bot-chat-ltg-teamaccompany-const-ltg-teamaccompany-2-src-mq3-game-bot-chat-ml-319157359"></a>
### LTG_TEAMACCOMPANY

```ml
const LTG_TEAMACCOMPANY = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L17)

<a id="constant-constant-mq3-game-bot-chat-ltg-teamhelp-const-ltg-teamhelp-1-src-mq3-game-bot-chat-ml-653400798"></a>
### LTG_TEAMHELP

```ml
const LTG_TEAMHELP = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L16)

<a id="function-function-mq3-game-bot-chat-maptitle-function-maptitle-state-src-mq3-game-bot-chat-ml-103518653"></a>
### mapTitle

```ml
function mapTitle(state)
```

BotMapTitle

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `mapTitle`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L191)

<a id="constant-constant-mq3-game-bot-chat-mask-water-const-mask-water-56-src-mq3-game-bot-chat-ml-2135182286"></a>
### MASK_WATER

```ml
const MASK_WATER = 56
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L21)

<a id="constant-constant-mq3-game-bot-chat-max-clients-const-max-clients-64-src-mq3-game-bot-chat-ml-66122063"></a>
### MAX_CLIENTS

```ml
const MAX_CLIENTS = 64
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L9)

<a id="constant-constant-mq3-game-bot-chat-mod-bfg-const-mod-bfg-12-src-mq3-game-bot-chat-ml-583144600"></a>
### MOD_BFG

```ml
const MOD_BFG = 12
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L35)

<a id="constant-constant-mq3-game-bot-chat-mod-bfg-splash-const-mod-bfg-splash-13-src-mq3-game-bot-chat-ml-1947860811"></a>
### MOD_BFG_SPLASH

```ml
const MOD_BFG_SPLASH = 13
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L36)

<a id="constant-constant-mq3-game-bot-chat-mod-chaingun-const-mod-chaingun-24-src-mq3-game-bot-chat-ml-2014302949"></a>
### MOD_CHAINGUN

```ml
const MOD_CHAINGUN = 24
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L49)

<a id="constant-constant-mq3-game-bot-chat-mod-crush-const-mod-crush-17-src-mq3-game-bot-chat-ml-106263249"></a>
### MOD_CRUSH

```ml
const MOD_CRUSH = 17
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L40)

<a id="constant-constant-mq3-game-bot-chat-mod-falling-const-mod-falling-19-src-mq3-game-bot-chat-ml-443864479"></a>
### MOD_FALLING

```ml
const MOD_FALLING = 19
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L42)

<a id="constant-constant-mq3-game-bot-chat-mod-gauntlet-const-mod-gauntlet-2-src-mq3-game-bot-chat-ml-1758247235"></a>
### MOD_GAUNTLET

```ml
const MOD_GAUNTLET = 2
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L25)

<a id="constant-constant-mq3-game-bot-chat-mod-grapple-const-mod-grapple-23-src-mq3-game-bot-chat-ml-1047945016"></a>
### MOD_GRAPPLE

```ml
const MOD_GRAPPLE = 23
```

Baseq3 ends at 23. Missionpack inserts five values before its grapple (28).


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L47)

<a id="constant-constant-mq3-game-bot-chat-mod-grenade-const-mod-grenade-4-src-mq3-game-bot-chat-ml-1690230885"></a>
### MOD_GRENADE

```ml
const MOD_GRENADE = 4
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L27)

<a id="constant-constant-mq3-game-bot-chat-mod-grenade-splash-const-mod-grenade-splash-5-src-mq3-game-bot-chat-ml-511310636"></a>
### MOD_GRENADE_SPLASH

```ml
const MOD_GRENADE_SPLASH = 5
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L28)

<a id="constant-constant-mq3-game-bot-chat-mod-juiced-const-mod-juiced-27-src-mq3-game-bot-chat-ml-620362844"></a>
### MOD_JUICED

```ml
const MOD_JUICED = 27
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L52)

<a id="constant-constant-mq3-game-bot-chat-mod-kamikaze-const-mod-kamikaze-26-src-mq3-game-bot-chat-ml-543850791"></a>
### MOD_KAMIKAZE

```ml
const MOD_KAMIKAZE = 26
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L51)

<a id="constant-constant-mq3-game-bot-chat-mod-lava-const-mod-lava-16-src-mq3-game-bot-chat-ml-1919979124"></a>
### MOD_LAVA

```ml
const MOD_LAVA = 16
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L39)

<a id="constant-constant-mq3-game-bot-chat-mod-lightning-const-mod-lightning-11-src-mq3-game-bot-chat-ml-2131480159"></a>
### MOD_LIGHTNING

```ml
const MOD_LIGHTNING = 11
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L34)

<a id="constant-constant-mq3-game-bot-chat-mod-machinegun-const-mod-machinegun-3-src-mq3-game-bot-chat-ml-1524777392"></a>
### MOD_MACHINEGUN

```ml
const MOD_MACHINEGUN = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L26)

<a id="constant-constant-mq3-game-bot-chat-mod-missionpack-grapple-const-mod-missionpack-grapple-28-src-mq3-game-bot-chat-ml-400080487"></a>
### MOD_MISSIONPACK_GRAPPLE

```ml
const MOD_MISSIONPACK_GRAPPLE = 28
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L53)

<a id="constant-constant-mq3-game-bot-chat-mod-nail-const-mod-nail-23-src-mq3-game-bot-chat-ml-1824380568"></a>
### MOD_NAIL

```ml
const MOD_NAIL = 23
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L48)

<a id="constant-constant-mq3-game-bot-chat-mod-plasma-const-mod-plasma-8-src-mq3-game-bot-chat-ml-794210177"></a>
### MOD_PLASMA

```ml
const MOD_PLASMA = 8
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L31)

<a id="constant-constant-mq3-game-bot-chat-mod-plasma-splash-const-mod-plasma-splash-9-src-mq3-game-bot-chat-ml-630225488"></a>
### MOD_PLASMA_SPLASH

```ml
const MOD_PLASMA_SPLASH = 9
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L32)

<a id="constant-constant-mq3-game-bot-chat-mod-proximity-mine-const-mod-proximity-mine-25-src-mq3-game-bot-chat-ml-1791854164"></a>
### MOD_PROXIMITY_MINE

```ml
const MOD_PROXIMITY_MINE = 25
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L50)

<a id="constant-constant-mq3-game-bot-chat-mod-railgun-const-mod-railgun-10-src-mq3-game-bot-chat-ml-448250830"></a>
### MOD_RAILGUN

```ml
const MOD_RAILGUN = 10
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L33)

<a id="constant-constant-mq3-game-bot-chat-mod-rocket-const-mod-rocket-6-src-mq3-game-bot-chat-ml-1810353051"></a>
### MOD_ROCKET

```ml
const MOD_ROCKET = 6
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L29)

<a id="constant-constant-mq3-game-bot-chat-mod-rocket-splash-const-mod-rocket-splash-7-src-mq3-game-bot-chat-ml-1943766666"></a>
### MOD_ROCKET_SPLASH

```ml
const MOD_ROCKET_SPLASH = 7
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L30)

<a id="constant-constant-mq3-game-bot-chat-mod-shotgun-const-mod-shotgun-1-src-mq3-game-bot-chat-ml-406848632"></a>
### MOD_SHOTGUN

```ml
const MOD_SHOTGUN = 1
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L24)

<a id="constant-constant-mq3-game-bot-chat-mod-slime-const-mod-slime-15-src-mq3-game-bot-chat-ml-53263983"></a>
### MOD_SLIME

```ml
const MOD_SLIME = 15
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L38)

<a id="constant-constant-mq3-game-bot-chat-mod-suicide-const-mod-suicide-20-src-mq3-game-bot-chat-ml-458377559"></a>
### MOD_SUICIDE

```ml
const MOD_SUICIDE = 20
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L43)

<a id="constant-constant-mq3-game-bot-chat-mod-target-laser-const-mod-target-laser-21-src-mq3-game-bot-chat-ml-1961387980"></a>
### MOD_TARGET_LASER

```ml
const MOD_TARGET_LASER = 21
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L44)

<a id="constant-constant-mq3-game-bot-chat-mod-telefrag-const-mod-telefrag-18-src-mq3-game-bot-chat-ml-986077638"></a>
### MOD_TELEFRAG

```ml
const MOD_TELEFRAG = 18
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L41)

<a id="constant-constant-mq3-game-bot-chat-mod-trigger-hurt-const-mod-trigger-hurt-22-src-mq3-game-bot-chat-ml-871411777"></a>
### MOD_TRIGGER_HURT

```ml
const MOD_TRIGGER_HURT = 22
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L45)

<a id="constant-constant-mq3-game-bot-chat-mod-unknown-const-mod-unknown-0-src-mq3-game-bot-chat-ml-1578569777"></a>
### MOD_UNKNOWN

```ml
const MOD_UNKNOWN = 0
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L23)

<a id="constant-constant-mq3-game-bot-chat-mod-water-const-mod-water-14-src-mq3-game-bot-chat-ml-1477167694"></a>
### MOD_WATER

```ml
const MOD_WATER = 14
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L37)

<a id="function-function-mq3-game-bot-chat-numactiveplayers-function-numactiveplayers-state-src-mq3-game-bot-chat-ml-1789954393"></a>
### numActivePlayers

```ml
function numActivePlayers(state)
```

BotNumActivePlayers

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `maxclients` and `players`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L165)

- [mq3.game.bot_chat.Player](Type-mq3-game-bot-chat-player-2090771289.md) — struct
<a id="function-function-mq3-game-bot-chat-playeractive-function-playeractive-player-src-mq3-game-bot-chat-ml-917064645"></a>
### playerActive

```ml
function playerActive(player)
```

Test `player.active and player.name!="" and player.team!=TEAM_SPECTATOR` as the condition for `playerActive`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | `dynamic` | — | Player entity; accesses `active`, `name` and `team`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L146)

<a id="function-function-mq3-game-bot-chat-playername-function-playername-state-client-src-mq3-game-bot-chat-ml-859231998"></a>
### playerName

```ml
function playerName(state, client)
```

Read a nonempty player name for a valid slot, returning an empty string otherwise.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `players`. |
| `client` | `dynamic` | — | Operand used to evaluate the returned expression `state.players[client].name`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L150)

<a id="function-function-mq3-game-bot-chat-randomopponentname-function-randomopponentname-state-bot-src-mq3-game-bot-chat-ml-1057790386"></a>
### randomOpponentName

```ml
function randomOpponentName(state, bot)
```

BotRandomOpponentName

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `players`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L183)

<a id="function-function-mq3-game-bot-chat-randomvalue-function-randomvalue-state-src-mq3-game-bot-chat-ml-511571617"></a>
### randomValue

```ml
function randomValue(state)
```

Set `state.randomIndex` to `state.randomIndex+1` in `mq3.game.bot_chat.randomValue`. Return paths include `0.0`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `randomIndex` and `randomValues`. May update `state.randomIndex` in place. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L103)

<a id="function-function-mq3-game-bot-chat-randomweaponname-function-randomweaponname-state-src-mq3-game-bot-chat-ml-2105648473"></a>
### randomWeaponName

```ml
function randomWeaponName(state)
```

BotRandomWeaponName

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `missionpack`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L212)

<a id="function-function-mq3-game-bot-chat-sameteam-function-sameteam-state-bot-client-src-mq3-game-bot-chat-ml-240823773"></a>
### sameTeam

```ml
function sameTeam(state, bot, client)
```

Compare bot and player teams only when teamplay and both player slots are valid.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `teamplay` and `players`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`. |
| `client` | `dynamic` | — | Operand used to evaluate the returned expression `state.players[client].team==state.players[bot.client].team`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L158)

- [mq3.game.bot_chat.State](Type-mq3-game-bot-chat-state-1889395289.md) — struct
<a id="constant-constant-mq3-game-bot-chat-team-spectator-const-team-spectator-3-src-mq3-game-bot-chat-ml-1488783814"></a>
### TEAM_SPECTATOR

```ml
const TEAM_SPECTATOR = 3
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L10)

<a id="function-function-mq3-game-bot-chat-testvariables-function-testvariables-state-bot-chat-src-mq3-game-bot-chat-ml-2051077470"></a>
### testVariables

```ml
function testVariables(state, bot, chat)
```

Apply `mq3.game.bot_chat.playerName`, `mq3.game.bot_chat.randomOpponentName` and `mq3.game.bot_chat.mapTitle` while evaluating `testVariables`. Return paths include `[]`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `missionpack`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client`, `lastkilledby`, `lastkilledplayer`, `lasthurtClient` and `botdeathtype`. |
| `chat` | `dynamic` | — | Value used by `testVariables` in `if chat=="game_enter" or chat=="game_exit" then return [self,opponent,"[invalid var]","[invalid var]",mapname] e...`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L387)

<a id="constant-constant-mq3-game-bot-chat-time-betweenchatting-const-time-betweenchatting-25-src-mq3-game-bot-chat-ml-1254637648"></a>
### TIME_BETWEENCHATTING

```ml
const TIME_BETWEENCHATTING = 25
```


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L14)

<a id="function-function-mq3-game-bot-chat-validchatposition-function-validchatposition-state-bot-src-mq3-game-bot-chat-ml-880705916"></a>
### validChatPosition

```ml
function validChatPosition(state, bot)
```

BotValidChatPosition

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `pointBelow`, `pointAbove` and `groundEntity`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `dead` and `inventory`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L226)

<a id="function-function-mq3-game-bot-chat-visibleenemies-function-visibleenemies-state-bot-src-mq3-game-bot-chat-ml-1739864314"></a>
### visibleEnemies

```ml
function visibleEnemies(state, bot)
```

BotVisibleEnemies

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | `dynamic` | — | Bot chat state; accesses `entities`. |
| `bot` | `dynamic` | — | Bot AI state; accesses `client` and `entitynum`. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L220)

<a id="function-function-mq3-game-bot-chat-weaponnameformeansofdeath-function-weaponnameformeansofdeath-mod-src-mq3-game-bot-chat-ml-1924744326"></a>
### weaponNameForMeansOfDeath

```ml
function weaponNameForMeansOfDeath(mod)
```

BotWeaponNameForMeansOfDeath

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mod` | `dynamic` | — | Means-of-death code used for damage attribution. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L194)

<a id="function-function-mq3-game-bot-chat-weaponnameformeansofdeathmode-function-weaponnameformeansofdeathmode-mod-missionpack-src-mq3-game-bot-chat-ml-1187974679"></a>
### weaponNameForMeansOfDeathMode

```ml
function weaponNameForMeansOfDeathMode(mod, missionpack)
```

Apply `mq3.game.bot_chat.weaponNameForMeansOfDeath` while evaluating `weaponNameForMeansOfDeathMode`. Return paths include `weaponNameForMeansOfDeath(mod)`.

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `mod` | `dynamic` | — | Means-of-death code used for damage attribution. |
| `missionpack` | `dynamic` | — | Whether Team Arena rules and definitions are active. |


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_chat.ml#L204)
