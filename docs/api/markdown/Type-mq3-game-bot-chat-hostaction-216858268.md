# `mq3.game.bot_chat.HostAction`

[Home](README.md) · [Source file](File-src-mq3-game-bot-chat-ml-1879844588.md)

<a id="struct-struct-mq3-game-bot-chat-hostaction-struct-hostaction-src-mq3-game-bot-chat-ml-408131669"></a>
## HostAction

```ml
struct HostAction
```

`HostAction` record for bot chat, containing `kind`, `client`, `channel`, `chat` and `variables` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L135)

## Members

<a id="field-field-mq3-game-bot-chat-hostaction-channel-channel-src-mq3-game-bot-chat-ml-947951117"></a>
### channel

```ml
channel
```

Delivery channel selected for the host chat/message action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L141)

<a id="field-field-mq3-game-bot-chat-hostaction-chat-chat-src-mq3-game-bot-chat-ml-1786183349"></a>
### chat

```ml
chat
```

Chat type or prepared chat entry selected for dispatch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L143)

<a id="field-field-mq3-game-bot-chat-hostaction-client-client-src-mq3-game-bot-chat-ml-816248807"></a>
### client

```ml
client
```

Client slot associated with the recorded bot chat operation.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L139)

<a id="field-field-mq3-game-bot-chat-hostaction-dispatched-dispatched-src-mq3-game-bot-chat-ml-911767375"></a>
### dispatched

```ml
dispatched
```

Nonzero after the action has been delivered to its host callback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L149)

<a id="field-field-mq3-game-bot-chat-hostaction-kind-kind-src-mq3-game-bot-chat-ml-69884125"></a>
### kind

```ml
kind
```

Discriminator selecting the recorded bot action or decision event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L137)

<a id="field-field-mq3-game-bot-chat-hostaction-value-value-src-mq3-game-bot-chat-ml-1521375529"></a>
### value

```ml
value
```

Numeric/result payload supplied to the recorded host action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L147)

<a id="field-field-mq3-game-bot-chat-hostaction-variables-variables-src-mq3-game-bot-chat-ml-240138689"></a>
### variables

```ml
variables
```

Substitution values supplied when composing a bot chat message.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/game/bot_chat.ml#L145)
