# `mq3.game.bot_voice_commands.HostAction`

[Home](README.md) · [Source file](File-src-mq3-game-bot-voice-commands-ml-1061280133.md)

<a id="struct-struct-mq3-game-bot-voice-commands-hostaction-struct-hostaction-src-mq3-game-bot-voice-commands-ml-2008312827"></a>
## HostAction

```ml
struct HostAction
```

`HostAction` record for bot voice commands, containing `kind`, `client`, `channel`, `text` and `value` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L89)

## Members

<a id="field-field-mq3-game-bot-voice-commands-hostaction-channel-channel-src-mq3-game-bot-voice-commands-ml-1086126975"></a>
### channel

```ml
channel
```

Delivery channel selected for the host chat/message action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L95)

<a id="field-field-mq3-game-bot-voice-commands-hostaction-client-client-src-mq3-game-bot-voice-commands-ml-1671246037"></a>
### client

```ml
client
```

Client slot associated with the host action produced by a voice command.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L93)

<a id="field-field-mq3-game-bot-voice-commands-hostaction-dispatched-dispatched-src-mq3-game-bot-voice-commands-ml-717581669"></a>
### dispatched

```ml
dispatched
```

Nonzero after the action has been delivered to its host callback.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L101)

<a id="field-field-mq3-game-bot-voice-commands-hostaction-kind-kind-src-mq3-game-bot-voice-commands-ml-1760399363"></a>
### kind

```ml
kind
```

Discriminator selecting the recorded bot action or decision event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L91)

<a id="field-field-mq3-game-bot-voice-commands-hostaction-text-text-src-mq3-game-bot-voice-commands-ml-292875661"></a>
### text

```ml
text
```

Text payload supplied to the recorded command, chat, or host action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L97)

<a id="field-field-mq3-game-bot-voice-commands-hostaction-value-value-src-mq3-game-bot-voice-commands-ml-1086820347"></a>
### value

```ml
value
```

Numeric/result payload supplied to the recorded host action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_voice_commands.ml#L99)
