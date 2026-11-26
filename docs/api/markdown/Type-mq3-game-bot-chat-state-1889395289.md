# `mq3.game.bot_chat.State`

[Home](README.md) · [Source file](File-src-mq3-game-bot-chat-ml-1879844588.md)

<a id="struct-struct-mq3-game-bot-chat-state-struct-state-src-mq3-game-bot-chat-ml-171070181"></a>
## State

```ml
struct State
```

`State` record for bot chat, containing `players`, `entities`, `maxclients`, `mapTitle` and `teamplay` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L201)

## Members

<a id="field-field-mq3-game-bot-chat-state-actions-actions-src-mq3-game-bot-chat-ml-1516498962"></a>
### actions

```ml
actions
```

Recorded host actions emitted by bot decision logic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L239)

<a id="field-field-mq3-game-bot-chat-state-botnochat-botnochat-src-mq3-game-bot-chat-ml-940701922"></a>
### botNoChat

```ml
botNoChat
```

Nonzero when automatic bot chat is disabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L215)

<a id="field-field-mq3-game-bot-chat-state-characteristics-characteristics-src-mq3-game-bot-chat-ml-1436441702"></a>
### characteristics

```ml
characteristics
```

Bot-character values controlling personality and decision behavior.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L225)

<a id="field-field-mq3-game-bot-chat-state-entities-entities-src-mq3-game-bot-chat-ml-2083754752"></a>
### entities

```ml
entities
```

Game entity records indexed by entity number.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L205)

<a id="field-field-mq3-game-bot-chat-state-fastchat-fastchat-src-mq3-game-bot-chat-ml-936850022"></a>
### fastChat

```ml
fastChat
```

Nonzero when bot chat delays are reduced for immediate output.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L217)

<a id="field-field-mq3-game-bot-chat-state-gametype-gametype-src-mq3-game-bot-chat-ml-426908486"></a>
### gametype

```ml
gametype
```

GT_* game-mode identifier used for mode-appropriate bot chat and team-message decisions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L213)

<a id="field-field-mq3-game-bot-chat-state-groundentity-groundentity-src-mq3-game-bot-chat-ml-821033374"></a>
### groundEntity

```ml
groundEntity
```

Entity currently supporting the tracked movement state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L231)

<a id="field-field-mq3-game-bot-chat-state-hostactionfn-hostactionfn-src-mq3-game-bot-chat-ml-99230526"></a>
### hostActionFn

```ml
hostActionFn
```

Injected callback for host action; invoked through the State service/state record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L241)

<a id="field-field-mq3-game-bot-chat-state-hurtmods-hurtmods-src-mq3-game-bot-chat-ml-1157072046"></a>
### hurtMods

```ml
hurtMods
```

Damage-cause values retained for bot damage/chat decisions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L233)

<a id="field-field-mq3-game-bot-chat-state-initialchatcounts-initialchatcounts-src-mq3-game-bot-chat-ml-848669374"></a>
### initialChatCounts

```ml
initialChatCounts
```

Available initial-chat counts indexed by chat category.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L237)

<a id="field-field-mq3-game-bot-chat-state-maptitle-maptitle-src-mq3-game-bot-chat-ml-381924646"></a>
### mapTitle

```ml
mapTitle
```

Human-readable title of the active map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L209)

<a id="field-field-mq3-game-bot-chat-state-maxclients-maxclients-src-mq3-game-bot-chat-ml-1537004590"></a>
### maxclients

```ml
maxclients
```

Configured number of client slots active in this game state.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L207)

<a id="field-field-mq3-game-bot-chat-state-missionpack-missionpack-src-mq3-game-bot-chat-ml-1588189854"></a>
### missionpack

```ml
missionpack
```

Nonzero when mission-pack rules and content are enabled.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L235)

<a id="field-field-mq3-game-bot-chat-state-now-now-src-mq3-game-bot-chat-ml-295588266"></a>
### now

```ml
now
```

Current clock value supplied to the bot decision step.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L219)

<a id="field-field-mq3-game-bot-chat-state-players-players-src-mq3-game-bot-chat-ml-842939846"></a>
### players

```ml
players
```

Player records indexed by client slot.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L203)

<a id="field-field-mq3-game-bot-chat-state-pointabove-pointabove-src-mq3-game-bot-chat-ml-725198176"></a>
### pointAbove

```ml
pointAbove
```

World point sampled above the bot when checking movement or visibility.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L229)

<a id="field-field-mq3-game-bot-chat-state-pointbelow-pointbelow-src-mq3-game-bot-chat-ml-1099519700"></a>
### pointBelow

```ml
pointBelow
```

World point sampled below the bot when checking hazards and ground.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L227)

<a id="field-field-mq3-game-bot-chat-state-randomindex-randomindex-src-mq3-game-bot-chat-ml-1387021954"></a>
### randomIndex

```ml
randomIndex
```

Next position to consume in the supplied random-value sequence.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L223)

<a id="field-field-mq3-game-bot-chat-state-randomvalues-randomvalues-src-mq3-game-bot-chat-ml-1813573068"></a>
### randomValues

```ml
randomValues
```

Deterministic random-value sequence supplied to bot decisions.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L221)

<a id="field-field-mq3-game-bot-chat-state-teamplay-teamplay-src-mq3-game-bot-chat-ml-2119500376"></a>
### teamplay

```ml
teamplay
```

Nonzero when the active game mode uses teams.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L211)
