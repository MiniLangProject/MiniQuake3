# `mq3.game.bot_command_matches.HostAction`

[Home](README.md) · [Source file](File-src-mq3-game-bot-command-matches-ml-960564493.md)

<a id="struct-struct-mq3-game-bot-command-matches-hostaction-struct-hostaction-src-mq3-game-bot-command-matches-ml-279182667"></a>
## HostAction

```ml
struct HostAction
```

`HostAction` record for bot command matches, containing `kind`, `client`, `channel`, `text` and `arg` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L262)

## Members

<a id="field-field-mq3-game-bot-command-matches-hostaction-arg-arg-src-mq3-game-bot-command-matches-ml-1798280429"></a>
### arg

```ml
arg
```

Additional argument attached to a host action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L272)

<a id="field-field-mq3-game-bot-command-matches-hostaction-channel-channel-src-mq3-game-bot-command-matches-ml-1711996597"></a>
### channel

```ml
channel
```

Delivery channel selected for the host chat/message action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L268)

<a id="field-field-mq3-game-bot-command-matches-hostaction-client-client-src-mq3-game-bot-command-matches-ml-1007991007"></a>
### client

```ml
client
```

Client slot associated with the host action produced by a matched text order.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L266)

<a id="field-field-mq3-game-bot-command-matches-hostaction-kind-kind-src-mq3-game-bot-command-matches-ml-275177801"></a>
### kind

```ml
kind
```

Discriminator selecting the recorded bot action or decision event.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L264)

<a id="field-field-mq3-game-bot-command-matches-hostaction-suppressed-suppressed-src-mq3-game-bot-command-matches-ml-2118159753"></a>
### suppressed

```ml
suppressed
```

Nonzero when an action was deliberately withheld from dispatch.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L276)

<a id="field-field-mq3-game-bot-command-matches-hostaction-text-text-src-mq3-game-bot-command-matches-ml-2045329375"></a>
### text

```ml
text
```

Text payload supplied to the recorded command, chat, or host action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L270)

<a id="field-field-mq3-game-bot-command-matches-hostaction-value-value-src-mq3-game-bot-command-matches-ml-1760176345"></a>
### value

```ml
value
```

Numeric/result payload supplied to the recorded host action.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/game/bot_command_matches.ml#L274)
